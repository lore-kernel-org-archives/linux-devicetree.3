Received: from luna.linkmauve.fr (82-65-109-163.subs.proxad.net [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE90365A14;
	Sun, 26 Jul 2026 18:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785089976; cv=none; b=i1KF7QPlJRtyvgfSs7aCQEdrzRvX5gEuRRi7Phoc8dw80CI2/thc64neB3jCB4j9VtrjDR9kKEmjV38HlKkoGmyPN7tpLgW7QGCbjTsRS/SEt/PmUnge0pxt1G9d+ulQ1UlJ1S+x6qpyUG2f6kBoVDZ7WHaM5YA65QbhUumI22o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785089976; c=relaxed/simple;
	bh=W5otQXuAh9rz2B3HK8j66vI6oNfqTgJadBJaIABoF/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CvgNJX0JxD1KkcnyL9VP+loslYu8IPAc2y/1/n+1AG5jAO22d7uucp5LATTmEu05rvM4WgEYWfbMxvlZbEOGO03VbNjG51FGCEwoug4BxzZs7A80O9xVFvtoidJ5z7n85RkiGGlGKZv7N4tIH3j2Lggo/EYxbo5pPyRm/LKlGcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 0B081F40DE2; Sun, 26 Jul 2026 20:19:27 +0200 (CEST)
From: Link Mauve <linkmauve@linkmauve.fr>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	=?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	techflashYT <officialTechflashYT@gmail.com>,
	Ash Logan <ash@heyquark.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc: wii: Add the fixed OTP layout
Date: Sun, 26 Jul 2026 20:19:19 +0200
Message-ID: <20260726181921.16269-1-linkmauve@linkmauve.fr>
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
 arch/powerpc/boot/dts/wii.dts | 38 +++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/powerpc/boot/dts/wii.dts b/arch/powerpc/boot/dts/wii.dts
index 473d9feb9cdb..0d1806273d43 100644
--- a/arch/powerpc/boot/dts/wii.dts
+++ b/arch/powerpc/boot/dts/wii.dts
@@ -233,6 +233,44 @@ control@d800100 {
 		otp@d8001ec {
 			compatible = "nintendo,hollywood-otp";
 			reg = <0x0d8001ec 0x8>;
+
+			nvmem-layout {
+				compatible = "fixed-layout";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				boot1_sha1@0 {
+					reg = <0x00 0x14>;
+				};
+
+				common_key@14 {
+					reg = <0x14 0x10>;
+				};
+
+				device_id@24 {
+					reg = <0x24 0x4>;
+				};
+
+				device_private_key@28 {
+					reg = <0x28 0x1c>;
+				};
+
+				nand_hmac_key@44 {
+					reg = <0x44 0x14>;
+				};
+
+				nand_key@58 {
+					reg = <0x58 0x10>;
+				};
+
+				backup_key@68 {
+					reg = <0x68 0x10>;
+				};
+
+				unknown@78 {
+					reg = <0x78 0x8>;
+				};
+			};
 		};
 
 		disk@d806000 {

base-commit: 9eebf259d5352b87080d67758f483583d9e763d7
-- 
2.55.0

