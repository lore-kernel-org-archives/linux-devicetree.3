Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B6D3AA51F
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774606127; cv=none; b=cJNge6es/bnJi/5zpLZeH50W2DM9/07nYkCRrFwwJ6LE9gKYUdL1xKjU0qRXLhSgjz+kt+BWy2/JtRK/nB2ckJK/msDOkxXIPfeqLlJxH3ceUki0FEGgUcJJgFusZb6YHVlYFksUv+6gjoy/dpbiFJm89SSrRqou47NaR7Zo2Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774606127; c=relaxed/simple;
	bh=CNOKzvn5kD0XReRJC8TJ6vbCACz1YNhnjP6JoO3Pr4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bPIZPH6OfwXDdfZLjwTsqqZwkLb931Z79SzYBTeUmhRzmIMYaRm/cmCI2UBpVtwVDJNUigIyZtJEpkVjkH6lgxwALZ92x3WX9FrKkzXT857d0rp41Gkc3OIJf0iT1r5HU7/yJh/1tAQtyobjMA8aS6Gb89aLPwv4ODjLhTRsGy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZLN0aVu5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CKLN3CXJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZLN0aVu5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CKLN3CXJ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6w3R31860213
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:08:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7P6zhpcLFC6aPfvZXVad/0Nrsu/6r+qZ2S++aXiCT/I=; b=ZLN0aVu5bbmI4/nb
	I8J509pHJtfZgwIMCOkHBBIsc4K6HW3KdOek1M/M0eCCIDfGiVmNYMBDxXxzqEOI
	6uxPS4pbqVWmqFxjSeugz5l8R0RLiXUAGT2fj2zUunoS4h2yU+KH+WVM6BFLcNj2
	KfVrCyqyewuJ9kozFvKHLPEq1G5X1WsC9gsbePs1DyUCd6cUdhMAT2TSqZ9WvIMd
	CqQRz4AdmTDyuifcRGFl0k1yxXbZGn2Io/dz/fa/ttsW4K8NK9dd84U4OXLQ+LV3
	VFmSQ0kR/epfWJXvsS+fHjAAhP9TjxYG2YJnHxUeC/TtEQLck9Eptyq9bocWrkoi
	39ZhBg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bxv2ht6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:08:46 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b0f4e632caso5438835ad.3
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 03:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774606125; x=1775210925; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7P6zhpcLFC6aPfvZXVad/0Nrsu/6r+qZ2S++aXiCT/I=;
        b=CKLN3CXJJFGmiF0hjYN+8doknGFRmnNZXCySqdZkvjP7GqU5grOJTMcvTUN4UBQOPu
         XdqBb/mbM77RZ66FPewJqrNWv4khQbkbNw6dDa7B23HWW67l4Yk9kd5rCfavK/V9tWan
         Bu8kL6PdWUxhkcllBxDu77vSg+ZYq03a+FnIZgQVueg45oCqFnz0/gEAoIJDjYj6WM2E
         XZz0ZJufFWJ5xK0x8NY64OFl5TSbVsa1IvADoTopgo8PWolz6mv18Nom68Sr1gXMf5lP
         vovJ1j2qxL+Dlm1sgZQOzbI6yhxDjmZRoapA+rWOfJb/IpMC3ggY2cizUYJUNSwhr7th
         D4CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774606125; x=1775210925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7P6zhpcLFC6aPfvZXVad/0Nrsu/6r+qZ2S++aXiCT/I=;
        b=Fy2tmxb9Fgjt8vwPz40HwuUgBRgJS7ZuJrEGyLQGCzu6u3jYQglaArp9H8ENXR8e9m
         MIkObvNeuCSMXPPxRMGpUBVa+ZuQODIouvIB9JkYK3X4nCDtpfx6/92UGWq/GQK+JRCC
         waEA+3DqMILigkcRqQdFca3Y0fD85hf7M7mcnDDw5wo5vWg7cUOXb43gRcjPFPz6jjMt
         A5wR1NCqJ58rzyxs5K1y7cNNQzvVdxlA4htvVXNPhY/QjdsAoEWpicWJDXtRKzjmnnVH
         fgc28N4hl6tnhRPvwVjDkMCa4JWWkZmTS9vNY+8I4g7SXhyTHqHIYI+IgXvfEAQE2mRp
         SRUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkDAnIOP1nYAjSR4UJRbXYRVOZC6MtdGHNivSjGoX5D87xuTntbe4IDdyL+unFx/NNyplynaerO8jn@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8x4goO65ZQGJVrnknRr/lRwDdKse0tzRSOzyOzxu7YegEkWqI
	r47Iw191U3r1Ay4CXppPSGMRpukU6yBEV8gQoiBRHj/JpuFwMfxaF/cEZPAPYwzXbQwHlk/cgwE
	75p0xTTmCjez//rcjdHTRTQx079tWlaMEQiYZ/Q3l3/7O+LDztbcVnOBBbAPI+Yu1
X-Gm-Gg: ATEYQzyxIHJ0NhzCqB211wBbys/EAETLjXS9ei+LF5cA1U+BXsHu7mzqr/VVbYhhQWi
	mxqU897AqULb8/PLnlGYYNiBpvJerTayAb6+xvPIbJPcWJ2cEV4EJrFJpnpcZv2kfSfEKsrfpKq
	4GZji7YTPz2ZlCZMuKB3DL72QX5bm5iILVfXoUEGU+Epd3w9ULiuKMREQZV2adig3qxQNTxD49d
	7HojMWASqibP1HHkwaMGiNV6Xvvpb68ZWl9450CqLC91bvELEAvQCLpvwgGw7ogyAVocnBnGxvF
	RAIJiJrH3M1DORhG8eaoUssLgy3KA9Ho9EXwyfBK8szipBR38K4u7Uynu920ll93dq7WatvZPaL
	rs291s0+GJWywZbmaX/ZgvgLrUYwvuMR+V7h/jUGz0e2hWInu2iEWi9pAk2qzfj723KddhicCyj
	s4qjcP+WvmYYKzDyL0ZsL3q3zRwTlrujFdmA==
X-Received: by 2002:a17:902:f650:b0:2b0:65e8:4041 with SMTP id d9443c01a7336-2b0cdcb73e2mr21795855ad.36.1774606125281;
        Fri, 27 Mar 2026 03:08:45 -0700 (PDT)
X-Received: by 2002:a17:902:f650:b0:2b0:65e8:4041 with SMTP id d9443c01a7336-2b0cdcb73e2mr21794805ad.36.1774606124738;
        Fri, 27 Mar 2026 03:08:44 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc786b7fsm74465675ad.20.2026.03.27.03.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 03:08:44 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 15:38:17 +0530
Subject: [PATCH v7 4/5] arm64: dts: qcom: x1-crd: Add Embedded controller
 node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-add-driver-for-ec-v7-4-7684c915e42c@oss.qualcomm.com>
References: <20260327-add-driver-for-ec-v7-0-7684c915e42c@oss.qualcomm.com>
In-Reply-To: <20260327-add-driver-for-ec-v7-0-7684c915e42c@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774606096; l=1504;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=pXx3AWCW1rDtKny9OmTAQa5CSZy7BRS7KSH0ZkBzrwE=;
 b=Fgof54/yHZmx9D9yhtZ8gNlARnkAkDOMYZ0K7Xn9LVlywkbmqZO2RpZIW2JpXwz6ZZT8Fcdnu
 5B1ogQt6MyEA2N9bMsC3KbiGn9ZRUUZyO0ohwVfNav07fssLsFav5ul
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Authority-Analysis: v=2.4 cv=A99h/qWG c=1 sm=1 tr=0 ts=69c6572e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=gaXMZf0GDK_To7W6ZIUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 0LIHJtrTiAMwGcUiRI2pvoiL9r6VEI5O
X-Proofpoint-GUID: 0LIHJtrTiAMwGcUiRI2pvoiL9r6VEI5O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NCBTYWx0ZWRfX930cr2gCCknj
 bW82yjtac9CWVrrUxy90zUxcJKH7d/sx/3vl7R9AZfO65G6LfPql/XonWc7c+b4XVbIpRweOzFB
 g3aspLNsamQT0t6YFXEUDoy3LFYcEcszqNiEb+oyw3lA01/F6VVUijDX70sbRpZT/5QBPUPzOC1
 hIgYPOVkkhXPGF6burBJWKOdBDQCiYWHNupjdEvxTwwdHun9kT/rFJl/5clmrCHjMG9N+bRaCYn
 1mTYy3kQ53bvDvt4BLRdxJOtcCf4K5RbAbqMLmcxiBJFeerZiVUbjYE5qQwt/asgFUcz4ywbgiK
 YfNsb998YFH9zIyDRVpB+OdADssq6VootXbjV+89f03/fNUILGSa6ZhMDw9bRrxCZN/B+S4h5pn
 OE+zG1DLC200Uq50ZugK/P5kXf0ZmmdFtETxBYGxWeSa+p9QStuiPJLSetjZil4KAha6xAd5vGh
 8JvPw3enUYH6LRwqb4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270074

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Add embedded controller node for Hamoa/Purwa CRDs which adds fan control,
temperature sensors, access to EC internal state changes and suspend
entry/exit notifications to the EC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index 485dcd946757..1184169f49cc 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -1074,6 +1074,16 @@ eusb6_repeater: redriver@4f {
 
 		#phy-cells = <0>;
 	};
+
+	embedded-controller@76 {
+		compatible = "qcom,hamoa-crd-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &i2c7 {
@@ -1517,6 +1527,12 @@ &tlmm {
 			       <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
 
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

-- 
2.34.1

