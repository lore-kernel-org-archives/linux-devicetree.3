Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DB41A3172
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 02:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775009880; cv=none; b=fMRcJVZ3R/5u6AAzohj7RQNy8VEUXmpWYhx7mtqX3uI1OGqvuVzCm2BCgLzbh2TcXO4U8dIdrLowOODiP4bDBVB3CVWI963MV/X9pdDRTCn1ESzTnmeCLuRt8TGWH98OPi7mWTxv6nJ/Z5XPDuUl4c1d9KzO3doPbUEA8ZCWYQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775009880; c=relaxed/simple;
	bh=L3dc57H4TAicXfxuqWi2M0NNIpGkH4gK5LNrkD5tqig=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sE98ahIYoKfZ9/6kOuu+Gnm8bscyrC/MFvbFT2ahXveWMQej8CePicWwnnYIvjbzM0QXInNnaXYKgh1akMPro/LgwrybJkxxyirhNP59I4b1+sn6sxaftOpy2gsReouDvgXoRR2j9kv2we1Kxu7buXpZSiAXLhcDgJ1WN03vOMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=KRG3jemk; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="KRG3jemk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775009871; x=1775269071;
	bh=zy8587+oFNVsqxwUuWfVfQ5DN4CfY+6dqyufp9WdTwk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=KRG3jemkGXXGqSwXVOHdT+nosBtTB5WkA6LGtLMe8iM//j+ee/5yN/voVOHLFA7y2
	 0B1cM8zYg4R/fY0kd67XJE8IIAtjigCQjzLJbum9eFw9omMUYcdPhPByKbFO4TVKmk
	 HPeTKXSZjkyWjqIuXPn5A51LXeWnLkFKjZuFsAiR3vMPQU7PEs43kXboIhhcyRw4VJ
	 pK4V20njICJU+OZvz2j4BjrHlAP9GjXvRD5gR68oK9t+Lr2ZX2mu6Q0ymh+ZtokxsJ
	 Wn6ia1EdZi0juV2Pbd1XiQ8C6RqmYmtrqYdpuurL++HYlEcY3FwrOyT0zBgvls3gbQ
	 j8vUuEk0TSPOQ==
Date: Wed, 01 Apr 2026 02:17:44 +0000
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 6/6] arm64: dts: qcom: milos: Add Adreno 810 GPU and GMU nodes
Message-ID: <20260331-adreno-810-v1-6-725801dbb12b@pm.me>
In-Reply-To: <20260331-adreno-810-v1-0-725801dbb12b@pm.me>
References: <20260331-adreno-810-v1-0-725801dbb12b@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: f8721f5a201037d2b10c26d63dc15ceca7ba8756
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add GPU and GMU devicetree nodes for the Adreno 810 GPU found on
Qualcomm SM7635 (Milos) based devices.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 148 ++++++++++++++++++++++++++++++++=
++++
 1 file changed, 148 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom=
/milos.dtsi
index 621f05820826..a8feb0339804 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/clock/qcom,milos-dispcc.h>
 #include <dt-bindings/clock/qcom,milos-gcc.h>
 #include <dt-bindings/clock/qcom,milos-gpucc.h>
+#include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sm8650-tcsr.h>
 #include <dt-bindings/dma/qcom-gpi.h>
@@ -1224,6 +1225,153 @@ lpass_ag_noc: interconnect@3c40000 {
 =09=09=09qcom,bcm-voters =3D <&apps_bcm_voter>;
 =09=09};
=20
+=09=09gpu: gpu@3d00000 {
+=09=09=09compatible =3D "qcom,adreno-44010000", "qcom,adreno";
+=09=09=09reg =3D <0x0 0x03d00000 0x0 0x40000>,
+=09=09=09      <0x0 0x03d9e000 0x0 0x2000>,
+=09=09=09      <0x0 0x03d61000 0x0 0x800>;
+=09=09=09reg-names =3D "kgsl_3d0_reg_memory",
+=09=09=09=09    "cx_mem",
+=09=09=09=09    "cx_dbgc";
+
+=09=09=09interrupts =3D <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH 0>;
+
+=09=09=09iommus =3D <&adreno_smmu 0 0x0>;
+
+=09=09=09operating-points-v2 =3D <&gpu_opp_table>;
+
+=09=09=09qcom,gmu =3D <&gmu>;
+=09=09=09#cooling-cells =3D <2>;
+
+=09=09=09interconnects =3D <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
+=09=09=09=09=09 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+=09=09=09interconnect-names =3D "gfx-mem";
+
+=09=09=09status =3D "disabled";
+
+=09=09=09gpu_zap_shader: zap-shader {
+=09=09=09=09memory-region =3D <&gpu_microcode_mem>;
+=09=09=09};
+
+=09=09=09gpu_opp_table: opp-table {
+=09=09=09=09compatible =3D "operating-points-v2-adreno",
+=09=09=09=09=09     "operating-points-v2";
+
+=09=09=09=09opp-264000000 {
+=09=09=09=09=09opp-hz =3D /bits/ 64 <264000000>;
+=09=09=09=09=09opp-level =3D <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+=09=09=09=09=09opp-peak-kBps =3D <2136718>;
+=09=09=09=09=09qcom,opp-acd-level =3D <0xc8295ffd>;
+=09=09=09=09};
+
+=09=09=09=09opp-362000000 {
+=09=09=09=09=09opp-hz =3D /bits/ 64 <362000000>;
+=09=09=09=09=09opp-level =3D <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+=09=09=09=09=09opp-peak-kBps =3D <2136718>;
+=09=09=09=09=09qcom,opp-acd-level =3D <0xc02c5ffd>;
+=09=09=09=09};
+
+=09=09=09=09opp-510000000 {
+=09=09=09=09=09opp-hz =3D /bits/ 64 <510000000>;
+=09=09=09=09=09opp-level =3D <RPMH_REGULATOR_LEVEL_SVS>;
+=09=09=09=09=09opp-peak-kBps =3D <3972656>;
+=09=09=09=09=09qcom,opp-acd-level =3D <0x882b5ffd>;
+=09=09=09=09};
+
+=09=09=09=09opp-644000000 {
+=09=09=09=09=09opp-hz =3D /bits/ 64 <644000000>;
+=09=09=09=09=09opp-level =3D <RPMH_REGULATOR_LEVEL_SVS_L1>;
+=09=09=09=09=09opp-peak-kBps =3D <5285156>;
+=09=09=09=09=09qcom,opp-acd-level =3D <0x882a5ffd>;
+=09=09=09=09};
+
+=09=09=09=09opp-688000000 {
+=09=09=09=09=09opp-hz =3D /bits/ 64 <688000000>;
+=09=09=09=09=09opp-level =3D <RPMH_REGULATOR_LEVEL_SVS_L2>;
+=09=09=09=09=09opp-peak-kBps =3D <6074218>;
+=09=09=09=09=09qcom,opp-acd-level =3D <0x882a5ffd>;
+=09=09=09=09};
+
+=09=09=09=09opp-763000000 {
+=09=09=09=09=09opp-hz =3D /bits/ 64 <763000000>;
+=09=09=09=09=09opp-level =3D <RPMH_REGULATOR_LEVEL_NOM>;
+=09=09=09=09=09opp-peak-kBps =3D <6671875>;
+=09=09=09=09=09qcom,opp-acd-level =3D <0xa8295ffd>;
+=09=09=09=09};
+
+=09=09=09=09opp-895000000 {
+=09=09=09=09=09opp-hz =3D /bits/ 64 <895000000>;
+=09=09=09=09=09opp-level =3D <RPMH_REGULATOR_LEVEL_NOM_L1>;
+=09=09=09=09=09opp-peak-kBps =3D <8171875>;
+=09=09=09=09=09qcom,opp-acd-level =3D <0x88295ffd>;
+=09=09=09=09};
+
+=09=09=09=09opp-960000000 {
+=09=09=09=09=09opp-hz =3D /bits/ 64 <960000000>;
+=09=09=09=09=09opp-level =3D <RPMH_REGULATOR_LEVEL_TURBO>;
+=09=09=09=09=09opp-peak-kBps =3D <8171875>;
+=09=09=09=09=09qcom,opp-acd-level =3D <0xa8285ffd>;
+=09=09=09=09};
+
+=09=09=09=09opp-1050000000 {
+=09=09=09=09=09opp-hz =3D /bits/ 64 <1050000000>;
+=09=09=09=09=09opp-level =3D <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+=09=09=09=09=09opp-peak-kBps =3D <18597656>;
+=09=09=09=09=09qcom,opp-acd-level =3D <0x88285ffd>;
+=09=09=09=09};
+=09=09=09};
+=09=09};
+
+=09=09gmu: gmu@3d37000 {
+=09=09=09compatible =3D "qcom,adreno-gmu-810.0", "qcom,adreno-gmu";
+=09=09=09reg =3D <0x0 0x03d37000 0x0 0x68000>;
+=09=09=09reg-names =3D "gmu";
+
+=09=09=09interrupts =3D <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH 0>,
+=09=09=09=09     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH 0>;
+=09=09=09interrupt-names =3D "hfi", "gmu";
+
+=09=09=09clocks =3D <&gpucc GPU_CC_AHB_CLK>,
+=09=09=09=09 <&gpucc GPU_CC_CX_GMU_CLK>,
+=09=09=09=09 <&gpucc GPU_CC_CXO_CLK>,
+=09=09=09=09 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
+=09=09=09=09 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+=09=09=09=09 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
+=09=09=09=09 <&gpucc GPU_CC_DEMET_CLK>;
+=09=09=09clock-names =3D "ahb",
+=09=09=09=09      "gmu",
+=09=09=09=09      "cxo",
+=09=09=09=09      "axi",
+=09=09=09=09      "memnoc",
+=09=09=09=09      "hub",
+=09=09=09=09      "demet";
+
+=09=09=09power-domains =3D <&gpucc GPU_CC_CX_GDSC>,
+=09=09=09=09=09<&gxclkctl GX_CLKCTL_GX_GDSC>;
+=09=09=09power-domain-names =3D "cx",
+=09=09=09=09=09     "gx";
+
+=09=09=09iommus =3D <&adreno_smmu 5 0x0>;
+
+=09=09=09qcom,qmp =3D <&aoss_qmp>;
+
+=09=09=09operating-points-v2 =3D <&gmu_opp_table>;
+
+=09=09=09gmu_opp_table: opp-table {
+=09=09=09=09compatible =3D "operating-points-v2";
+
+=09=09=09=09opp-350000000 {
+=09=09=09=09=09opp-hz =3D /bits/ 64 <350000000>;
+=09=09=09=09=09opp-level =3D <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+=09=09=09=09};
+
+=09=09=09=09opp-650000000 {
+=09=09=09=09=09opp-hz =3D /bits/ 64 <650000000>;
+=09=09=09=09=09opp-level =3D <RPMH_REGULATOR_LEVEL_SVS>;
+=09=09=09=09};
+=09=09=09};
+=09=09};
+
 =09=09gxclkctl: clock-controller@3d64000 {
 =09=09=09compatible =3D "qcom,milos-gxclkctl";
 =09=09=09reg =3D <0x0 0x03d64000 0x0 0x6000>;

--=20
2.53.0


