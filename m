Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40ED5346FAE
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 10:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776508798; cv=none; b=kUmm9sZ2GnspB9eaUpXZiJWAMQtPg/0mhwk/3lvn6nHOz9F5GZAJA0UPGCTjgklLGjaY+M3UwnN5OG/ZAHk65WKVaPRP2UulHA37GXfCcOQ5BW5GxghMO18XpCjP/CHhrG00uqOF3hZecaFVUSvf9qjKH+lMcCKF2TyKjeUinUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776508798; c=relaxed/simple;
	bh=M6LVUW2n5KTuOAie1xrdlH+okKBQKa157KmIR2sGIcQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EArd4BlbDqMZy7J1809rK7saob7aSK/Ep+NfTcLsuRANItmzK67cgUAVgeFRXN2Hk3/j97R7oyZy5E+r2JFem3N7m6J5Y+acrOnRbQU7lJ4H6yyKI89oBbUksu3x/bJTN7ZCTxU6QWDOZtpjVAIYwOof/sjipuJNCOCY4Jb3+vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=JqRya2Zx; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="JqRya2Zx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776508789; x=1776767989;
	bh=M6LVUW2n5KTuOAie1xrdlH+okKBQKa157KmIR2sGIcQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=JqRya2Zx/oQnSQlTcr5K310KE6zsQp4M8enlSDvKcjbqzeOc2kDEuQvPovAQ/hD2V
	 /c5mf+KYR+sBA9+prNtb/cQbCQgOMzlsC2l3NauqkRm4CkIYTG3fZny8t4caU+a9uc
	 hHi9Q1bU3qOMfa/Eruc3gyHney97IeNtfGDF4zd5mAJRVH8e7UFJA3lEqJo+rslhl2
	 s08uZ1m50pp3f9CYW2Zgwg3L4hqK//+39GvjEhlGXBU/AbhNg+5mG88Rn0n6+72jS4
	 NNwAVGNaEXRdvDBbS8Eo1oyw41339shK6epMlSsyHsvXfvv1sIXBHO2hKx8a8w7WwE
	 r93o2TUGnXPTQ==
Date: Sat, 18 Apr 2026 10:39:45 +0000
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 1/3] arm64: dts: qcom: eliza: Sort nodes by unit address
Message-ID: <20260418-eliza-imem-v3-1-bfbd499b6e77@pm.me>
In-Reply-To: <20260418-eliza-imem-v3-0-bfbd499b6e77@pm.me>
References: <20260418-eliza-imem-v3-0-bfbd499b6e77@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: e37f21b63d29cf2cb48c185dc974af6544101797
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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


