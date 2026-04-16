Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AE2382F2C;
	Thu, 16 Apr 2026 09:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776332423; cv=none; b=kJhIk3o0N56TY6eHSRHVTjByc3AzvPkoyfiwUX5LOBeQ18Rksaz5tklBANI7vyMleZ1GcUHa/TNTQFS8+Do1mYASoAmR5kvi4Erg2/bmu31IDrEmlXvVNHVKwfV2T89kQDL4o3NOO6u+1MEkW//v9UtWdkuDToUlW9iWEgTNlhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776332423; c=relaxed/simple;
	bh=+uw/4df8IGIbUeJ5LIVTDk4Ouq+4CGn/mp0UzTFlTcw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IzAk0MuLFixT6OlCizo3v6lOoubKjIHg+ALKGk7qvzgg86HL0ZQ3jPwhAMG2hCJPWKvSezIJQxzV/1PCsKcvoMOUsBRHHtUlqRB9JFs3y/m+6U01LYJj45Xn16AvjeCF3a5boqXe0h9e/g2BEOhEmwZ3w3kYa+9nPqS1v5P62pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=psZbbgMy; arc=none smtp.client-ip=185.70.43.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="psZbbgMy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776332414; x=1776591614;
	bh=+uw/4df8IGIbUeJ5LIVTDk4Ouq+4CGn/mp0UzTFlTcw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=psZbbgMyZ0pmgMBSrTlKxTJUEDAcgz8bROLizB0JDKmZVmBnXCbLCNLpw7sRyxIwK
	 yRIvTJR6b77QP9H013P7OCMDmOZGQTfbh7egAooAdmcNBtBCOvB2khY6a2Qr3RzcB6
	 O6/oNJXLxHbttV0hE8kfp3e4CyJNq/JPr585KoqGLXvP1Bh+r6XDHxl0A4/apa3lNM
	 zaGA7Q+ioCYUlBYrAR9ERDf5s7rdLzkoe8pHMhv2wd1GnXK0lq1XleFN4SbPp5qO7J
	 jQ51pAP2LXnvGIxhn+/qNZEqvgYT8O0G9AZDR+llkFk+nv+QWP6HD87/98K/1kFX9Z
	 edWbVRfZhwJVQ==
Date: Thu, 16 Apr 2026 09:40:09 +0000
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH v2 3/3] arm64: dts: qcom: eliza: Add IMEM node
Message-ID: <20260416-eliza-imem-v2-3-fb7a71123451@pm.me>
In-Reply-To: <20260416-eliza-imem-v2-0-fb7a71123451@pm.me>
References: <20260416-eliza-imem-v2-0-fb7a71123451@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 0bf1b25ffbe7d7f5422890073c3e85f8084e49ec
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add a node for the IMEM found on Eliza, which contains pil-reloc-info
and the modem tables for IPA, among others.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom=
/eliza.dtsi
index 6fa5679c1a62..551df07e44c6 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -1029,6 +1029,26 @@ qup_uart14_default: qup-uart14-default-state {
 =09=09=09};
 =09=09};
=20
+=09=09sram@14680000 {
+=09=09=09compatible =3D "qcom,eliza-imem", "mmio-sram";
+=09=09=09reg =3D <0x0 0x14680000 0x0 0x2c000>;
+=09=09=09ranges =3D <0x0 0x0 0x14680000 0x2c000>;
+
+=09=09=09no-memory-wc;
+
+=09=09=09#address-cells =3D <1>;
+=09=09=09#size-cells =3D <1>;
+
+=09=09=09pilreloc-sram@94c {
+=09=09=09=09compatible =3D "qcom,pil-reloc-info";
+=09=09=09=09reg =3D <0x94c 0xc8>;
+=09=09=09};
+
+=09=09=09ipa_modem_tables: modem-tables-sram@3000 {
+=09=09=09=09reg =3D <0x3000 0x2000>;
+=09=09=09};
+=09=09};
+
 =09=09apps_smmu: iommu@15000000 {
 =09=09=09compatible =3D "qcom,eliza-smmu-500", "qcom,smmu-500", "arm,mmu-5=
00";
 =09=09=09reg =3D <0x0 0x15000000 0x0 0x100000>;

--=20
2.53.0


