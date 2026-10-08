Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0778F439F71
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 21:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791493653; cv=none; b=RMTzFQKJzokOgCoYDz2trHteREktFIonO6oYdJJ9TWLQTgInroo8wAg4f/w7i2jl2i6rJ+EqtzcOvBhkElw8S7h+IVT6DSQ7/MrjCz/6xFelilhV4B+Rfj4CAbdnCkfetr5dyZhCh/yu1Ef256Nbs889AmKkwLMHjddt4LZa3FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791493653; c=relaxed/simple;
	bh=zsb3qQUwNEM19a5bOdye8GG/0Trdna7eKJrDi2YrJ6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VH+y9D9FBL6oiM5DWfoq5StlBiDBmbC+VBwfCYAuEWuyVYLUICf2xFUg4kgbWTkjhihStRKIXM6uuDLyNe2bjZmrY2Pn3OuFlzLN55EUD/zgdrWiZGgrdZNlHRLU1z98Hmn1bXOSvH8/yxZ3CnV5AYQzElcsFq+BnWDWSMAHqqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WEw9wtfV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OzZ0xW8u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WEw9wtfV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OzZ0xW8u"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698Kxv6v3151668
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 21:07:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yKtOOvFc5D27LCXFHoXF9QLWg5IasKf5P3xB+DwmaeQ=; b=WEw9wtfVjtcWxcyY
	4VQo18+yoysdzuba7UA/qyi62cBJFbW4e8fSOPZEi/xpuazH6KX4iB5mtUiY5ZSi
	A/wmcBU/exDz6z1FY9ujCUD2cWXtTpfStyCZbOq3GSIx6XJ5lLVBIqsoEm6LxGdb
	tcvolzSUi5qkW+QoDyEyuRpJoJGoT+FAVehR+ffrgL4vHEDzDV4ncxW7+kJqUzs9
	zHHtlsUqRADpOPWCoVWduf1UsIyh12RZx/zq7qwm/lwehCMXU179XKSUY9Qa2xNE
	Nra4w2om78oojEJCzmb7EgUN6W82SIzp7SPH4jRTFVZulDCDikklXCaepUyKBSCX
	9dIjAA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxk0nu4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 21:07:30 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3515d2fc5ebso9122778eec.1
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 14:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791493649; x=1792098449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKtOOvFc5D27LCXFHoXF9QLWg5IasKf5P3xB+DwmaeQ=;
        b=OzZ0xW8uAr0702CIzsc9IHg6gpqM7azuep7sNsHvICMSmes7lTj2LrMbj9OleVQmj0
         F56xQ5YlDjsQ+QLUo4vOxcgQMgX/+QO5CVhSP1SvQtOFaAChkH5m4At3M4k+3Ye3vYQG
         eiooK2+ObVeIgjndws9krh8fJeMIw7CKwxr8Y8rhDVIguUAmXvZ9rHN6SevcePB7868q
         S6apzGNb44YVNq0PO3/7hbl0L4zNYhcpvzadSC9D1Zz9a3qRAqVxe5L5qKQt17yQUuAG
         rT9bW+7UQ87R3Qv7KyGDZp0XqwNyNke0Ejc1hc462S1DHJtUg94qUfUJFpWxuWcun0jt
         qAag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791493649; x=1792098449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yKtOOvFc5D27LCXFHoXF9QLWg5IasKf5P3xB+DwmaeQ=;
        b=JM2RXt49xwm3pDErb7FWxym5Gc4QqM8nNSA50TZt4NrkwyqB/VUWkMnkXwQIeAHwCB
         co6ve1R02XjPGngCtvbu7Jg6n1qd0oCrzhDkCtKYKheARqh7DvKZFTvifIvpvg5L7mIP
         GPp/Bf/GDD3KdiOK6kigTHZZ3V2czMkbRNGdFhDcwsJL/pFhb9SpC5OP71Q/0L5A/1cZ
         aBjlG1pZfkwh92yaQhm4wgjzPbpBUNvLm4UZkN5piTm7bGkxnbaspan+FId+hsp+msSO
         wMtZFXU2AU6mYA72w/39LW0w4zWsKs9RgADlbTCiHk1MLhEB3xXjUPtbHimzJJw1tkfl
         szmg==
X-Forwarded-Encrypted: i=1; AKwUvBxM22rfma4rPaProYrv4CdH2E7xTJu6hBDMun/lQdjIKbnBF277/J28mrVata5XPZ9TohCkxR0LVzCN@vger.kernel.org
X-Gm-Message-State: AFq9FYI/DTVb048bn1LoovsArmHxeRBXzGdwIsEpTIrNogKN54zSLtLR
	UEEGs7d/2rn89mSMyfNH3k9amCIqfECgEwGuhA9N+K6A/8bNJJJqfjn8Zy1iCwGbkf3TFBFoJFC
	H5y9cXn/MQutciKLsKLyY8tAhdc6/ckWyoa+7jYUM3wWpt7MZV9sTn41g/NwsHDof
X-Gm-Gg: AYBFou13CI0ShcMc7I7FHkAE2MJefXvJtq+dujS75Sc3lvYl+hlh+xXYH91dL+1+KS+
	ntYFIdAcwlV0ORkas87I7YnCJO2eYtnRkGszo+F0QiHLyeia3MqsOzwEzcSYbaskV1Ewd7G8r6h
	+EBHq7340dqp2avY9dgMZOxnqZDJnBYB7uOz5ffh6oFGkxNt73HtZFWEu3Mv/3SMdHGTgy42Nd7
	bqT8PSFSqp9uJYIZVPY67SsV8dI4yQOwrcSVV8tD9RrP8k6OHm3CUxFqj2+6JKEhx4NvQFml5Wm
	ZsNofv4Ap97IwjeyTicPhFqoC5AeUl0R0v9xY02NS2e4IG2uChumbUelc2fT37e9F6aZA0Ot3/H
	j0U7yVfEp5RDICZDVL7FKJrw=
X-Received: by 2002:a05:693c:895a:10b0:343:9eb1:9940 with SMTP id 5a478bee46e88-3537e0270fbmr104205eec.26.1791493649313;
        Thu, 08 Oct 2026 14:07:29 -0700 (PDT)
X-Received: by 2002:a05:693c:895a:10b0:343:9eb1:9940 with SMTP id 5a478bee46e88-3537e0270fbmr104146eec.26.1791493648753;
        Thu, 08 Oct 2026 14:07:28 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cab27d5sm634773eec.17.2026.10.08.14.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 14:07:28 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 02:36:37 +0530
Subject: [PATCH 3/5] arm64: dts: qcom: nord: Add Adreno 753 GPU and GMU
 nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-nord-gpu1-v1-3-a06a6c57bde7@oss.qualcomm.com>
References: <20261009-nord-gpu1-v1-0-a06a6c57bde7@oss.qualcomm.com>
In-Reply-To: <20261009-nord-gpu1-v1-0-a06a6c57bde7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Shivam Rawat <shivrawa@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791493618; l=4289;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=6h4f7qVB4BKj8LihzL9H5wv7/el2Fm3tcb/8YO2NRo0=;
 b=g6Wbz6L+lGaMZuM2qLDwfWf242JVw9KWYgrDBLIggTh+WUYgs9DycTv52UscuMiOTt2a90FYP
 4LEXEoArMpcCUOT6gk5uKG+7/ST2BxO4c0g3mq2are7+oqCK7P/a5tb
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=fKesTpae c=1 sm=1 tr=0 ts=6ac80612 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=iMbq6FfIWUb5wk3_mucA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: Lkbw68DRMLIWbehoY5HVkI1YBLW7KAJY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA4NCBTYWx0ZWRfX4cvYoDxCK2fo
 mk8HrzueUt76beoqBr6yoFajVYf1E9Thj0ogkoOFWuyU5wq5cZolu6s7YMU59YPcKG3rwRTUXkq
 COqN9kruQu6KVXmHuIY7n0Ewr3sojQ0=
X-Proofpoint-ORIG-GUID: Lkbw68DRMLIWbehoY5HVkI1YBLW7KAJY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA4NCBTYWx0ZWRfX/iZiagFepRCK
 /RB1/01J5ZX7P33ha/KE9R0zg9XhcwuOXnnEozDgyVuPnjPou0KUed1Yr1KR7vTXHrDIat71TF2
 l2b3unC1gP3VLAtITzHhUB1L0yhKvL6Q/nqvBxl/7fO5O/6rL0ndGKRJO1S6CPxSIgAynRaKy45
 TvAkGvibp3ke/D/D7usuQ0q3fb+lSPtxCvY35ACiDtBw3lq8aJqF2sjzhN0AkRfnWfRbdxaFbdW
 YiqNHK/rZy03FU+mqUYz8MOxBIcPSYJNnbQyVst4aKWDge9I6E3ckDLh05fCHXaB6UQKlGbYbl1
 P8yHcD325hAFumBwckXx2POUATmJYR661TIDIuhzgxK+Mbmg+bWk5WzY6lunP3xwoN74mhd0MyP
 N97ihnKdReueya1THExaT1lDHT/IgFciWgH/v8vIvR4zZiMl+6du3lF2NQ0DdNYiX/J0viYLXdU
 3KZJdJuz4FC40Vt5H1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_07,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080084

From: Shivam Rawat <shivrawa@qti.qualcomm.com>

Nord SoC integrates an Adreno 753 GPU as its primary GPU, belonging to
the A7xx Gen3 family, along with its Graphics Management Unit (GMU).

Add the GPU and GMU nodes together with their OPP tables. The GPU sits
behind adreno_smmu_0 and uses the gen71300 zap shader, while the GMU is
clocked and powered from GPUCC.

Unlike previous Adreno SoCs, where the GMU AXI clock comes from the
single global clock controller, Nord splits its GCC into four blocks
(GCC, SE_GCC, NE_GCC and NW_GCC). The GPU's AXI clock,
NW_GCC_HSCNOC_GPU_AXI_CLK, is provided by NW_GCC, so the GMU node
references nwgcc directly.

Signed-off-by: Shivam Rawat <shivrawa@qti.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 116 ++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 1ab7d9bc3cfe..4379092b7bf8 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -776,6 +776,122 @@ hscnoc: interconnect@2000000 {
 		qcom,bcm-voters = <&apps_bcm_voter>;
 	};
 
+	gpu_0: gpu@3d00000 {
+		compatible = "qcom,adreno-43051701", "qcom,adreno";
+		reg = <0x0 0x03d00000 0x0 0x40000>,
+		      <0x0 0x03d9e000 0x0 0x2000>,
+		      <0x0 0x03d61000 0x0 0x800>;
+		reg-names = "kgsl_3d0_reg_memory",
+			    "cx_mem",
+			    "cx_dbgc";
+
+		interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+
+		iommus = <&adreno_smmu_0 0 0x0>,
+			 <&adreno_smmu_0 1 0x0>;
+
+		operating-points-v2 = <&gpu_opp_table_0>;
+
+		qcom,gmu = <&gmu_0>;
+		#cooling-cells = <2>;
+
+		interconnects = <&hscnoc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
+				 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+		interconnect-names = "gfx-mem";
+
+		status = "disabled";
+
+		gpu_0_zap_shader: zap-shader {
+			memory-region = <&gpu_microcode_mem>;
+		};
+
+		gpu_opp_table_0: opp-table {
+			compatible = "operating-points-v2-adreno",
+				     "operating-points-v2";
+
+			opp-468000000 {
+				opp-hz = /bits/ 64 <468000000>;
+				opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+				opp-peak-kBps = <781250>;
+			};
+
+			opp-625000000 {
+				opp-hz = /bits/ 64 <625000000>;
+				opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+				opp-peak-kBps = <6075000>;
+			};
+
+			opp-735000000 {
+				opp-hz = /bits/ 64 <735000000>;
+				opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+				opp-peak-kBps = <8175000>;
+			};
+
+			opp-854000000 {
+				opp-hz = /bits/ 64 <854000000>;
+				opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+				opp-peak-kBps = <10687500>;
+			};
+
+			opp-1000000000 {
+				opp-hz = /bits/ 64 <1000000000>;
+				opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+				opp-peak-kBps = <12450000>;
+			};
+		};
+	};
+
+	gmu_0: gmu@3d6a000 {
+		compatible = "qcom,adreno-gmu-753.1", "qcom,adreno-gmu";
+		reg = <0x0 0x03d6a000 0x0 0x35000>,
+		      <0x0 0x03d50000 0x0 0x10000>,
+		      <0x0 0x0b2a0000 0x0 0x10000>;
+		reg-names = "gmu",
+			    "rscc",
+			    "gmu_pdc";
+
+		interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "hfi",
+				  "gmu";
+
+		clocks = <&gpucc GPU_CC_AHB_CLK>,
+			 <&gpucc GPU_CC_CX_GMU_CLK>,
+			 <&gpucc GPU_CC_CXO_CLK>,
+			 <&nwgcc NW_GCC_HSCNOC_GPU_AXI_CLK>,
+			 <&gpucc GPU_CC_MEMNOC_GFX_CLK>,
+			 <&gpucc GPU_CC_HUB_CX_INT_CLK>;
+		clock-names = "ahb",
+			      "gmu",
+			      "cxo",
+			      "axi",
+			      "memnoc",
+			      "hub";
+
+		power-domains = <&gpucc GPU_CC_CX_GDSC>,
+				<&gpucc GPU_CC_GX_GDSC>;
+		power-domain-names = "cx",
+				     "gx";
+
+		iommus = <&adreno_smmu_0 5 0x0>;
+
+		operating-points-v2 = <&gmu_opp_table_0>;
+
+		gmu_opp_table_0: opp-table {
+			compatible = "operating-points-v2";
+
+			opp-416666000 {
+				opp-hz = /bits/ 64 <416666000>;
+				opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+			};
+
+			opp-625000000 {
+				opp-hz = /bits/ 64 <625000000>;
+				opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+			};
+		};
+	};
+
 	gpucc: clock-controller@3d90000 {
 		compatible = "qcom,nord-gpucc";
 		reg = <0x0 0x03d90000 0x0 0x9800>;

-- 
2.55.0

