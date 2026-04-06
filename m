Received: from mail-244121.protonmail.ch (mail-244121.protonmail.ch [109.224.244.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B13132AAA3
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 10:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775470804; cv=none; b=Pec7F9OtFfs100DleC3TST4qsbO4juz215IMcSu6vkYiJesZRuagD8tz/M+X2tjGLO3Uw5irljlj+fGckZhRCALqU7g4Pi5rtEKh8lBd6THExgCGtd8gjILVdIXBESJh8KzLv/1xA5vBB1SLshK1LnCh78rUvWevYQC5yqXvJpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775470804; c=relaxed/simple;
	bh=EAOndGzg5SeHnZrOPq2utAwld0EaSk59a8CbrPbEzLk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jD+rc2qDjG0WHGqvb5whd3qfWQB5EqBiu2YxDdI1PGIjKHw0KKBKD10Kxy0Xctde+A+neukwcCQtjnN+bb6LzDnA4sSVu/lom7Pc+6Iznp07iZMR1xUqXopS47tb/ZrXfLvwXzS+YaKtIByAlz64qMrSl5qZWL3ZBtZMZH9A8RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=dsRm4+XZ; arc=none smtp.client-ip=109.224.244.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="dsRm4+XZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775470795; x=1775729995;
	bh=2FDa4FbKQRT0D69gXEO+/YnhJ9jnvzn9vQZ7iyZ7f+I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=dsRm4+XZwDA67L6jfP3v9+XO2W6Vzhfuccrck/elicBjA9gWneMqA7py6tnkqqX4e
	 Zr0ekKrrAxgTOlNB50r7gfvfDQfi4kuQJ28QECJRgbdha/oup3yeMtr8rQGM5Ul7Sd
	 p5Z9/YnA4t4qLQi7h8FKz0PTGngkKBA8Z5b+I/L4LR9F3zpHD4Dq7c158x68vddBoi
	 y/9UAidhM2JbQBhSjhDfXvRxsVugaLjVLkk7ip0t0udJE8LPz5PjG6PD9UI7wyoK4o
	 3ZrEirdzIIam42z7h1zERPe3dZzA1gB7aXJUpslgi67vL3b/xovJz7kohrb45Y5DnY
	 i4sqRTbP2EDFA==
Date: Mon, 06 Apr 2026 10:19:50 +0000
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 3/3] arm64: dts: qcom: milos: Add Iris VPU v2.0
Message-ID: <20260406-milos-iris-v1-3-17ed0167ba6f@pm.me>
In-Reply-To: <20260406-milos-iris-v1-0-17ed0167ba6f@pm.me>
References: <20260406-milos-iris-v1-0-17ed0167ba6f@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 166f561c1a48f6cef99ff39d402798d53e5c3291
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add devicetree nodes for the Iris codec (VPU 2.0) found on the Milos
platform.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 85 +++++++++++++++++++++++++++++++++=
++++
 1 file changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom=
/milos.dtsi
index e1a51d43943f..07aa398c9695 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/clock/qcom,milos-dispcc.h>
 #include <dt-bindings/clock/qcom,milos-gcc.h>
 #include <dt-bindings/clock/qcom,milos-gpucc.h>
+#include <dt-bindings/clock/qcom,milos-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sm8650-tcsr.h>
 #include <dt-bindings/dma/qcom-gpi.h>
@@ -1517,6 +1518,90 @@ usb_1_dwc3_hs: endpoint {
 =09=09=09};
 =09=09};
=20
+=09=09iris: video-codec@aa00000 {
+=09=09=09compatible =3D "qcom,milos-iris";
+=09=09=09reg =3D <0 0x0aa00000 0 0xf0000>;
+
+=09=09=09interrupts =3D <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH 0>;
+
+=09=09=09power-domains =3D <&videocc VIDEO_CC_MVS0C_GDSC>,
+=09=09=09=09=09<&videocc VIDEO_CC_MVS0_GDSC>,
+=09=09=09=09=09<&rpmhpd RPMHPD_CX>,
+=09=09=09=09=09<&rpmhpd RPMHPD_MX>;
+=09=09=09power-domain-names =3D "venus",
+=09=09=09=09=09     "vcodec0",
+=09=09=09=09=09     "cx",
+=09=09=09=09=09     "mx";
+
+=09=09=09operating-points-v2 =3D <&iris_opp_table>;
+
+=09=09=09clocks =3D <&gcc GCC_VIDEO_AXI0_CLK>,
+=09=09=09=09 <&videocc VIDEO_CC_MVS0C_CLK>,
+=09=09=09=09 <&videocc VIDEO_CC_MVS0_CLK>;
+=09=09=09clock-names =3D "iface",
+=09=09=09=09      "core",
+=09=09=09=09      "vcodec0_core";
+
+=09=09=09interconnects =3D <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE=
_ONLY
+=09=09=09=09=09 &cnoc_cfg SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+=09=09=09=09=09<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
+=09=09=09=09=09 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+=09=09=09interconnect-names =3D "cpu-cfg",
+=09=09=09=09=09     "video-mem";
+
+=09=09=09memory-region =3D <&video_mem>;
+
+=09=09=09resets =3D <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+=09=09=09=09 <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
+=09=09=09reset-names =3D "bus",
+=09=09=09=09      "core";
+
+=09=09=09iommus =3D <&apps_smmu 0x1960 0>,
+=09=09=09=09 <&apps_smmu 0x1967 0>;
+
+=09=09=09dma-coherent;
+
+=09=09=09/*
+=09=09=09 * IRIS firmware is signed by vendors, only enable on
+=09=09=09 * boards where the proper signed firmware is available.
+=09=09=09 */
+=09=09=09status =3D "disabled";
+
+=09=09=09iris_opp_table: opp-table {
+=09=09=09=09compatible =3D "operating-points-v2";
+
+=09=09=09=09opp-240000000 {
+=09=09=09=09=09opp-hz =3D /bits/ 64 <240000000>;
+=09=09=09=09=09required-opps =3D <&rpmhpd_opp_low_svs>,
+=09=09=09=09=09=09=09<&rpmhpd_opp_low_svs>;
+=09=09=09=09};
+
+=09=09=09=09opp-338000000 {
+=09=09=09=09=09opp-hz =3D /bits/ 64 <338000000>;
+=09=09=09=09=09required-opps =3D <&rpmhpd_opp_svs>,
+=09=09=09=09=09=09=09<&rpmhpd_opp_svs>;
+=09=09=09=09};
+
+=09=09=09=09opp-366000000 {
+=09=09=09=09=09opp-hz =3D /bits/ 64 <366000000>;
+=09=09=09=09=09required-opps =3D <&rpmhpd_opp_svs_l1>,
+=09=09=09=09=09=09=09<&rpmhpd_opp_svs_l1>;
+=09=09=09=09};
+
+=09=09=09=09opp-444000000 {
+=09=09=09=09=09opp-hz =3D /bits/ 64 <444000000>;
+=09=09=09=09=09required-opps =3D <&rpmhpd_opp_nom>,
+=09=09=09=09=09=09=09<&rpmhpd_opp_nom>;
+=09=09=09=09};
+
+=09=09=09=09opp-552000000 {
+=09=09=09=09=09opp-hz =3D /bits/ 64 <552000000>;
+=09=09=09=09=09required-opps =3D <&rpmhpd_opp_turbo>,
+=09=09=09=09=09=09=09<&rpmhpd_opp_turbo>;
+=09=09=09=09};
+=09=09=09};
+=09=09};
+
 =09=09videocc: clock-controller@aaf0000 {
 =09=09=09compatible =3D "qcom,milos-videocc";
 =09=09=09reg =3D <0x0 0x0aaf0000 0x0 0x10000>;

--=20
2.53.0


