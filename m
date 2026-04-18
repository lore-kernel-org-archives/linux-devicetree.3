Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFCE34F474;
	Sat, 18 Apr 2026 10:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776508808; cv=none; b=jJiyo3iO7qJ9rusFwD0LySQta/GOAXM+eWfyupKgkZvywFSRhmc7y7aLZB1tUfd2I88VZKaAvjYOZ6fz6bjfouOWqKIp7qqT6LBolaRb5AejTH9ex46prHhcxdN3QEgcXL8udil4c6HDNZaGccpDMBsW6JK8JU6vTLu+AFAJZMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776508808; c=relaxed/simple;
	bh=3sMaiUAijEjmNT+stNlQG3MAoZh54wqnwgv9HzzEY/E=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mb8HbL6L3KFL8K1foPKLOFb0rd69H7UE+b/Fx8ObnuRxqwW9LAJ2Qo/1KkjzJHxibBYESzetz24paB1cr4U90+o0Qr2XvaLSLZCJD2yCQRjdL1npbGqluj0K+UEH7XCXEkvIpGlIBrVG1GGWRCm41cvjx/qNWS0ZA/9K01UH/UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Py/RLVFi; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Py/RLVFi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776508805; x=1776768005;
	bh=3sMaiUAijEjmNT+stNlQG3MAoZh54wqnwgv9HzzEY/E=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Py/RLVFi2Twt13FSs+JErZPuUNYtxsf3hp7Z/hlrgaU3C6aiX8rIp7RPjV+ztuc7d
	 ImM4/zirW2CPnGB9jRTdMx+dzSKLi707KzBlV4gW08mOtr7wNv+ydm5S0eTG+Qj+SN
	 w5aBr6PdvF7e5gkfEugCTnwPPCUQohaxdFXboYBey3bYu1HTNdDVAWfjoX8W8vBJP3
	 OTGbEbPEd/OQ6dVi3ml9a+9hlwxBam83WbkgBbnjyPbDiME/6I1nsiMrH2JCJOiPWg
	 XXk3qSzJCJW6vjDCFUZJTZhmz6uXDas9gkjfW/q6XG/+wD9whRV/4bRhcv7R3ctGRV
	 4VhoXfm1rTlsA==
Date: Sat, 18 Apr 2026 10:40:00 +0000
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 3/3] arm64: dts: qcom: eliza: Add IMEM node
Message-ID: <20260418-eliza-imem-v3-3-bfbd499b6e77@pm.me>
In-Reply-To: <20260418-eliza-imem-v3-0-bfbd499b6e77@pm.me>
References: <20260418-eliza-imem-v3-0-bfbd499b6e77@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 59af511583c9687579673508e637f3294cfaf65f
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

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom=
/eliza.dtsi
index 6fa5679c1a62..a63e2cbe174e 100644
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
+=09=09=09pil-reloc-sram@94c {
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


