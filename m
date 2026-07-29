Received: from linkmauve.fr (82-65-109-163.subs.proxad.net [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA123CB562;
	Wed, 29 Jul 2026 22:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785365420; cv=none; b=YYMesMrPucHv5RouSkWl5qMySsFDpoPhgx7QIlIyIrbJCyLpbJ+lCsueZQuVy3iBE0gyPfanOnRjmdhgLTYeNHw0AOo/JYbSkfFPm9dihRQTsPCu3VI5Nka4bovHtf9zUTWnw0/kU/MHjxQ1adUeI2y1R9/srubaeAc985JKasM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785365420; c=relaxed/simple;
	bh=tzGn+cBlYoJRCBdTi0Ld+LILhINI5tBrcC943mDU+pg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZH0VM0Tns/DmoJcytEvsyfNPh5or2WKU27tatrWO9nB2n1g6Us+8qIAR9ugsGe4tR6Gpj5SoUN+NxxR5TvZmlnIdkoRtysttj1BTs2kLyDOFLiYgL1cZUNF1U72sEpmei5cQCal3Qy5lVsqiK3xHWUyl23gBM55Kh8Sg4tshZlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by linkmauve.fr (Postfix, from userid 1000)
	id 9290C7098F6D; Thu, 30 Jul 2026 00:50:16 +0200 (CEST)
From: Link Mauve <linkmauve@linkmauve.fr>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Michael Garofalo <officialTechflashYT@gmail.com>,
	Ash Logan <ash@heyquark.com>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] powerpc: wii: Add the fixed OTP layout
Date: Thu, 30 Jul 2026 00:50:08 +0200
Message-ID: <20260729225010.838760-1-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These 128 bytes have a known fixed layout, so we can expose those as
cells for either kernel or userspace consumption.

Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
---
 arch/powerpc/boot/dts/wii.dts | 42 +++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

Changes since v1:
- Link to v1:
  https://lore.kernel.org/lkml/20260726181921.16269-1-linkmauve@linkmauve.fr/T/
- Switch to using hyphens instead of underscores as it is preferred in
  device-trees.
- Extend device-private-key@28 to 0x1e bytes instead of 0x1c, which is
  its correct size.
- Document that this cell and the next one overlap for two bytes, and
  it’s expected.

diff --git a/arch/powerpc/boot/dts/wii.dts b/arch/powerpc/boot/dts/wii.dts
index 473d9feb9cdb..d3a94d94e9e1 100644
--- a/arch/powerpc/boot/dts/wii.dts
+++ b/arch/powerpc/boot/dts/wii.dts
@@ -233,6 +233,48 @@ control@d800100 {
 		otp@d8001ec {
 			compatible = "nintendo,hollywood-otp";
 			reg = <0x0d8001ec 0x8>;
+
+			nvmem-layout {
+				compatible = "fixed-layout";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				boot1-sha1@0 {
+					reg = <0x00 0x14>;
+				};
+
+				common-key@14 {
+					reg = <0x14 0x10>;
+				};
+
+				device-id@24 {
+					reg = <0x24 0x4>;
+				};
+
+				/*
+				 * device-private-key@28 and nand-hmac-key@44
+				 * overlap on two bytes, that’s expected.
+				 */
+				device-private-key@28 {
+					reg = <0x28 0x1e>;
+				};
+
+				nand-hmac-key@44 {
+					reg = <0x44 0x14>;
+				};
+
+				nand-key@58 {
+					reg = <0x58 0x10>;
+				};
+
+				backup-key@68 {
+					reg = <0x68 0x10>;
+				};
+
+				unknown@78 {
+					reg = <0x78 0x8>;
+				};
+			};
 		};
 
 		disk@d806000 {

base-commit: 78bc8af4affb9a732504eb22eeac7d1e50883853
-- 
2.55.0

