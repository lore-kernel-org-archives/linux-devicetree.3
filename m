Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DAE396567;
	Thu, 16 Apr 2026 09:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776332414; cv=none; b=M5uwR5fVnSecpiPwQQC2TXHGg83a5vFKIgv31GBq++hlqjkV69tJrXk2oNBw5nfIjUwE4FeiPIVVAmUHXaUPNzHaBhtke1QxNVWzQzGo7QhBbo/myMN1LCqg44vNb39XtOH4olsS7WT1JcjBcgp5b7cbga6qcGUbjiBu+Hf3GZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776332414; c=relaxed/simple;
	bh=vGA4D/bqH83LZB5VVvnuZbgZ2iJWI854ppPWqKNisK0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IQdbjPcm/OWmyqRGZJk4Lmg2WAIaerA3UtnAOchr6hoWycStx0mCpow4DpxKHX8wrQi2wOvZjbkSin6LVZkr4Jspi9/Z4ndjLePZYR2KDsdD5GoxB3C2coxaxPWLWLTibE46Trt7ra6vaD+0ALbfTFHJctJX1u7JuZxtyHP68Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=c8rV7Sm8; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="c8rV7Sm8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776332401; x=1776591601;
	bh=vGA4D/bqH83LZB5VVvnuZbgZ2iJWI854ppPWqKNisK0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=c8rV7Sm8Y93vdQ6Xp5je2RiNkzuICZJR2ZqCZ8WqB3stm46gFyubIPqCut2HbACtS
	 ImNs9Ftt9UBR+9c65Zl22Wl4p+j7q7nrFQIZ2GezX/XvrZFlApu4DfKUu9srrfUHUe
	 xnCFpNHJwQyBjTgCe+ojwiq9QIZZGblrKjfnNEOYQERAS7g918mYU+/POCgbCy3Q9b
	 tu4xPaiPBixX7iFltv577APVExtO/aFnEI8TbNT+jYTt/rA1dPxqpErNT8Ui+okkkl
	 0FU5ExDWEb6d+6MG39ohgpQ7auqiOu20BWSCW/1Y/lG5PLI7VxfnsWP+GiGJ3NUKFx
	 Z3qFN5uHR6Leg==
Date: Thu, 16 Apr 2026 09:39:54 +0000
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH v2 1/3] arm64: dts: qcom: eliza: Sort nodes by unit address
Message-ID: <20260416-eliza-imem-v2-1-fb7a71123451@pm.me>
In-Reply-To: <20260416-eliza-imem-v2-0-fb7a71123451@pm.me>
References: <20260416-eliza-imem-v2-0-fb7a71123451@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 40ec065afb9e25c8c3e1c50fb3a8c46a6e3ae323
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Qualcomm DTS uses sorting of MMIO nodes by the unit address, so move
few nodes in Eliza DTSI to fix that.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 74 ++++++++++++++++++---------------=
----
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom=
/eliza.dtsi
index 4a7a0ac40ce6..6fa5679c1a62 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -662,16 +662,16 @@ &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
 =09=09=09};
 =09=09};
=20
-=09=09config_noc: interconnect@1600000 {
-=09=09=09compatible =3D "qcom,eliza-cnoc-cfg";
-=09=09=09reg =3D <0x0 0x01600000 0x0 0x5200>;
+=09=09cnoc_main: interconnect@1500000 {
+=09=09=09compatible =3D "qcom,eliza-cnoc-main";
+=09=09=09reg =3D <0x0 0x01500000 0x0 0x16080>;
 =09=09=09qcom,bcm-voters =3D <&apps_bcm_voter>;
 =09=09=09#interconnect-cells =3D <2>;
 =09=09};
=20
-=09=09cnoc_main: interconnect@1500000 {
-=09=09=09compatible =3D "qcom,eliza-cnoc-main";
-=09=09=09reg =3D <0x0 0x01500000 0x0 0x16080>;
+=09=09config_noc: interconnect@1600000 {
+=09=09=09compatible =3D "qcom,eliza-cnoc-cfg";
+=09=09=09reg =3D <0x0 0x01600000 0x0 0x5200>;
 =09=09=09qcom,bcm-voters =3D <&apps_bcm_voter>;
 =09=09=09#interconnect-cells =3D <2>;
 =09=09};
@@ -862,13 +862,6 @@ tcsr: clock-controller@1fbf000 {
 =09=09=09#reset-cells =3D <1>;
 =09=09};
=20
-=09=09lpass_ag_noc: interconnect@7e40000 {
-=09=09=09compatible =3D "qcom,eliza-lpass-ag-noc";
-=09=09=09reg =3D <0x0 0x07e40000 0x0 0xe080>;
-=09=09=09qcom,bcm-voters =3D <&apps_bcm_voter>;
-=09=09=09#interconnect-cells =3D <2>;
-=09=09};
-
 =09=09lpass_lpiaon_noc: interconnect@7400000 {
 =09=09=09compatible =3D "qcom,eliza-lpass-lpiaon-noc";
 =09=09=09reg =3D <0x0 0x07400000 0x0 0x19080>;
@@ -883,6 +876,13 @@ lpass_lpicx_noc: interconnect@7420000 {
 =09=09=09#interconnect-cells =3D <2>;
 =09=09};
=20
+=09=09lpass_ag_noc: interconnect@7e40000 {
+=09=09=09compatible =3D "qcom,eliza-lpass-ag-noc";
+=09=09=09reg =3D <0x0 0x07e40000 0x0 0xe080>;
+=09=09=09qcom,bcm-voters =3D <&apps_bcm_voter>;
+=09=09=09#interconnect-cells =3D <2>;
+=09=09};
+
 =09=09pdc: interrupt-controller@b220000 {
 =09=09=09compatible =3D "qcom,eliza-pdc", "qcom,pdc";
 =09=09=09reg =3D <0x0 0x0b220000 0x0 0x40000>,
@@ -1005,6 +1005,30 @@ spmi_bus1: spmi@c432000 {
 =09=09=09};
 =09=09};
=20
+=09=09tlmm: pinctrl@f100000 {
+=09=09=09compatible =3D "qcom,eliza-tlmm";
+=09=09=09reg =3D <0x0 0x0f100000 0x0 0xf00000>;
+
+=09=09=09interrupts =3D <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+
+=09=09=09gpio-controller;
+=09=09=09#gpio-cells =3D <2>;
+
+=09=09=09interrupt-controller;
+=09=09=09#interrupt-cells =3D <2>;
+
+=09=09=09gpio-ranges =3D <&tlmm 0 0 184>;
+=09=09=09wakeup-parent =3D <&pdc>;
+
+=09=09=09qup_uart14_default: qup-uart14-default-state {
+=09=09=09=09/* TX, RX */
+=09=09=09=09pins =3D "gpio18", "gpio19";
+=09=09=09=09function =3D "qup2_se5";
+=09=09=09=09drive-strength =3D <2>;
+=09=09=09=09bias-pull-up;
+=09=09=09};
+=09=09};
+
 =09=09apps_smmu: iommu@15000000 {
 =09=09=09compatible =3D "qcom,eliza-smmu-500", "qcom,smmu-500", "arm,mmu-5=
00";
 =09=09=09reg =3D <0x0 0x15000000 0x0 0x100000>;
@@ -1319,30 +1343,6 @@ cpufreq_hw: cpufreq@17d91000 {
 =09=09=09#clock-cells =3D <1>;
 =09=09};
=20
-=09=09tlmm: pinctrl@f100000 {
-=09=09=09compatible =3D "qcom,eliza-tlmm";
-=09=09=09reg =3D <0x0 0x0f100000 0x0 0xf00000>;
-
-=09=09=09interrupts =3D <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
-
-=09=09=09gpio-controller;
-=09=09=09#gpio-cells =3D <2>;
-
-=09=09=09interrupt-controller;
-=09=09=09#interrupt-cells =3D <2>;
-
-=09=09=09gpio-ranges =3D <&tlmm 0 0 184>;
-=09=09=09wakeup-parent =3D <&pdc>;
-
-=09=09=09qup_uart14_default: qup-uart14-default-state {
-=09=09=09=09/* TX, RX */
-=09=09=09=09pins =3D "gpio18", "gpio19";
-=09=09=09=09function =3D "qup2_se5";
-=09=09=09=09drive-strength =3D <2>;
-=09=09=09=09bias-pull-up;
-=09=09=09};
-=09=09};
-
 =09=09gem_noc: interconnect@24100000 {
 =09=09=09compatible =3D "qcom,eliza-gem-noc";
 =09=09=09reg =3D <0x0 0x24100000 0x0 0x163080>;

--=20
2.53.0


