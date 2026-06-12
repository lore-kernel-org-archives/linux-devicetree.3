Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3404C37F006
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 19:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781293469; cv=none; b=q22sSxW5X3PXkrpnl/ekINWhw3kf0wUup/mlBe84k4D5T2ILPSatVrzCI/AhoN6K6MgEB9G2gdJSdHRbiYlNiuylPWWXkbCssWVVIFuk0pNdXeyMcDV4RdLLlSqw7GCuiQ53ErqfC/wbyAYiQDdM3CmA1SBkjWbOGkygVxH3IH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781293469; c=relaxed/simple;
	bh=VOMbj2ZE6cMRmBwdvDtc8IMkWEVRVNHHLBnh+HmMZZw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lBTbuX47vSg5VXRoVH+SU7UCErSikl0das1cySNNWs13zQfYMcmcyJ93fqyrE0u3o44NtAMBhX/f8e3oum04F4w3AuaMIITJviCjngkREH5TUISgUI6Y6i9fAcG0d9WPs1iqPOLRaBdp51FxA45JISVZeJPgkxbjd8bY1XUaU4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EIOFReCy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dO6cjPwp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EIOFReCy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dO6cjPwp"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CGVIju047502
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 19:44:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UeYZzjCNeIR
	vXdsjWgi0LrAMwlAA5MEg3Qbk2m3pJt0=; b=EIOFReCyWj90CdXptjNq/7Zb8LV
	BA5d24GkO1FG1Qq31A+PFf0nSNgb+RKaXsyxZn++s/U+zGMm6I2r4DoWbfigiy+F
	LdvFy66YyJG8gZg+K45WAj+nZDbxcVfEdyNK5cX2F75gKEdZ0Lnpho6me4cIdOum
	KV+7yCn6Hx7USAyjYkH0UgsQ11EzLbxhpjihFiN9tvSbAV5e8EzNgjO91jPhu7+w
	zu4eralScTKJoXDIx8ALSHbWv2P3UaBUIrJlA9b5/QcPYZNPoVS1Iqsd/mlSU+mY
	sHG1Ol87fjunxrZCjPe/KtaVJjeHaglDnwdMRhn/JgLJrn9zAkgMchqcl1g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2u44853-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 19:44:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9157d38ab37so134289785a.1
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 12:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781293465; x=1781898265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UeYZzjCNeIRvXdsjWgi0LrAMwlAA5MEg3Qbk2m3pJt0=;
        b=dO6cjPwpzmOxEqbBvvw7IJD4xorpqukIcoXhn5+jDo+u2fOsmwNetbUug2TvBc3w37
         rovoNcXndcZK8/yo/+Y+woIhLtyhOJ3z5EXlvyJ5QfKoxRioVuf8VxnKXYDjErvjEIFV
         2JYdHOtsd/yT9422tFshJGF8pVBhw6PIJSax2C88XMj6NtlaBjqCjSNNmwdeRPoTQuV3
         NKUVeyltNMBWRftyb/3m4Tv+6/Mx3V97JqwyaiVO7m9V61mhhQtqPbmS6lqg0F8AKkzM
         QQt1x44u2C+no/0G0iD3X69/5XaEnlTgInFPaC/HJnSyC4+MnrtSJ4BA8rjy8L01/gNE
         RyJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781293465; x=1781898265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UeYZzjCNeIRvXdsjWgi0LrAMwlAA5MEg3Qbk2m3pJt0=;
        b=NoeTbkD+uYZcyU6fE3BSmCUWPxfvQBbcDUaDBfKPSF9y1qmlcfhDev1SFhmFDiuEc5
         xKkADk+cffrC4/G3Hk5wVKlmV36jqktHwQAQgPpFAMqiuHs/3cZRX19+OiOqWzEqnj44
         1xtWM1gZp9KuDUrOSSqTYGwCGncZ2VGXRYqVwxBBWLH/Q8MvaZqDopROK82uiGf+XDV8
         v4OYOli0+xnLsv2ONeF3du0FY8KZ+mT276ahfl02nQmhSI76W7vf0SRgEkzTAF6LjkUZ
         LRSwACDiVrbctASbCkbtJH8MpiQkzdspZKM5Qo9LcTwI3hny3SkBKeyXmLdvYAw5e91p
         DU8g==
X-Forwarded-Encrypted: i=1; AFNElJ8Z8kUoF6vs+ery48zhMxN6gzbS6NrqxxW/WzEKb0RuVS6/8eHnzf7Cvr7wToQ55YoQKHPksm1ptXsh@vger.kernel.org
X-Gm-Message-State: AOJu0YxiMjvLHGHKBToc1Wupu2YCXfdWkxJo4ThSVYBbkvHEhqASnuMt
	P+9EyjIqyU/oT4osrJHYN2NZEg7BBPUkjufPCkCSJqE8snmlVC0mb/JJZb7I8nCzUGJXB1lhP6b
	R1xcBfqPpwss9RquwDSl7WYOCxkZiwFciI0GDbUse/FRHAvZrPQn7nfjhcQrSN5iI
X-Gm-Gg: Acq92OEKRV2fKxSa9MQP3vQ40R1RS+L/mhsaVyWL8zWH7bEUjkQU1tvMgXpnYfYQfXf
	lehD48Na6chszNYSuUDCjIAjb2SKI3DuidJJo5VlbPfe3o3i1cbbEdoZiAMXv/nmSuTndk3kSYk
	g8BgeBTgIIHPrmkSjGUt9GN0m4tP5xaXQ9LUxu0ND4lqC8CulZWA6o5gbGhAse7BVXKO2VHMArw
	vgQTBtM+xdbUxKw878NhtPVwpIkXS7jf4Y9JTmjNzJWMQSIsmSmzyW+MWexUPi5QBpcgn8iFx+b
	p0H2hc9U/lIedO/twCsQa/zwqd+2tvZGTwHwErdbpzaogk6nUyNBaR1tsjyAJ2zwElhxNVlRCb2
	kIfXklYRjN3VSFizWUK256n+sOTg+cGUGtv5VG23MPguH/g==
X-Received: by 2002:a05:620a:2848:b0:8f0:7516:daa4 with SMTP id af79cd13be357-9161bd65c64mr634195485a.41.1781293464691;
        Fri, 12 Jun 2026 12:44:24 -0700 (PDT)
X-Received: by 2002:a05:620a:2848:b0:8f0:7516:daa4 with SMTP id af79cd13be357-9161bd65c64mr634190985a.41.1781293464289;
        Fri, 12 Jun 2026 12:44:24 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4420570sm138396466b.11.2026.06.12.12.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 12:44:22 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org, bod@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, atanas.filipov@oss.qualcomm.com
Subject: [PATCH v1 2/4] arm64: dts: qcom: sm8550: Add JPEG encoder node
Date: Fri, 12 Jun 2026 22:44:15 +0300
Message-Id: <20260612194417.1737009-3-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
References: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: H_-svoITFgq3r1kL1utG1lQeQjxE2wJM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE4NiBTYWx0ZWRfXzBlU8OyN/M9g
 EeTk8f2LLVVT/T8cSfIFKi0bpfc4UOfftxx5HOR3zky2lTrdWTguTcKq/J3dZ+GZyZ/ZTaGOqh7
 qd8fdOiJsq1dQ5IJg0sIaciRtIkPm+Y=
X-Proofpoint-ORIG-GUID: H_-svoITFgq3r1kL1utG1lQeQjxE2wJM
X-Authority-Analysis: v=2.4 cv=N94Z0W9B c=1 sm=1 tr=0 ts=6a2c6199 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=-MlWyOcUqUnKHFJa12MA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE4NiBTYWx0ZWRfX4aHeUyHM1CvF
 8gRStj1KDZ2pjFF6XgegwATH/2Smre9o/XF/beydGmz5BASvZoyj4/2kPIqG0pq8ocoURZI1+6l
 +CqJa7cCJ9ZrlCgJlXb3XA00Di1oB88MTT4P/+lAEyF8cnlzm637L+BlzlazL/vhH6CCgFx2HPP
 tc2HGivaAa92Id0vhfE9IRx1tUk7FvQaL9p0V9WL+nGyOL7bEkvKlIXLEEmgE1UjiV50sfqQneS
 8mJsHKWnW9reiwTKSUgqM09zElYMiRSGlEVhJ7UeKj3+LfviW+oStnNeCtneHuT3GkO3kUGop1q
 QHLaBEeCO2pXBiN1/p1iBTlCVZcMf8C3S8CZXzLZ+T5LPgXkS20H3upEnwHFN+ZPxyKMa+4PJCE
 7/OYmUDxXLZyGPDyNFth5mtzfTM7H/r//+FEuMtW3fb+rfJXjw8/oClPHavz9PDE089+Oq2j/4M
 DdhR+t1BpxvZozi+A0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120186

Add the missing JPEG encoder hardware node in SM8550 DTS so the
new qcom-jpeg V4L2 encoder driver can bind and operate on this
platform.

The node wires the resources expected by the binding and driver,
including clocks, power domain, IOMMUs and interconnect paths.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 42 ++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 912525e9bca6..8090b8b1d7bd 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3677,6 +3677,48 @@ port@7 {
 			};
 		};
 
+		qcom_jpeg_enc: jpeg-encoder@ac4e000 {
+			cell-index = <0>;
+			compatible = "qcom,sm8550-jenc";
+
+			reg = <0 0xac4e000 0 0x4000>;
+			reg-names = "jpeg";
+
+			interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING 0>;
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_JPEG_CLK>;
+
+			clock-names = "gcc_hf_axi",
+				      "gcc_sf_axi",
+				      "core_ahb",
+				      "cpas_ahb",
+				      "camnoc_axi",
+				      "jpeg";
+
+			iommus = <&apps_smmu 0x20C0 0x20>,
+				 <&apps_smmu 0x20E0 0x20>;
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC 0
+					 &config_noc SLAVE_CAMERA_CFG 0>,
+					<&mmss_noc MASTER_CAMNOC_HF 0
+					 &mc_virt SLAVE_EBI1 0>,
+					<&mmss_noc MASTER_CAMNOC_SF 0
+					 &mc_virt SLAVE_EBI1 0>,
+					<&mmss_noc MASTER_CAMNOC_ICP 0
+					 &mc_virt SLAVE_EBI1 0>;
+
+			interconnect-names = "cam_ahb",
+					     "cam_hf_0_mnoc",
+					     "cam_sf_0_mnoc",
+					     "cam_sf_icp_mnoc";
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,sm8550-camcc";
 			reg = <0 0x0ade0000 0 0x20000>;
-- 
2.34.1

