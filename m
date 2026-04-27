Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B7C3AC0C4
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 21:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777326166; cv=none; b=NSWLpCAyuv8RxOGUqMFuUB+EnuWC8d1Xxv8ggdF8cITmQa/jLq8GHrf4PaRuckp6gPd12z9hBePpSG8L9UyngAtLM+VUVE0uP0vS2emagHq3C0IaP/u6YoO524Vtyszr6x8zglRsHRCqdgxQXUQjMjMgcxhDJuRCC9UEfNBsSfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777326166; c=relaxed/simple;
	bh=Xi8+8vBpk72pueSbcHCY6ojLbswdddkKT2eKqWSkDDQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qsW8O+H+6L4hnFembrfHXy7WljjVlOCN6iGytqEIRwKi3A3b7Nza2Jpw1lGm9rud3IfEVhvxRt6Kgrkl6PrgfPerl7GRAHjVTC+ONv0N2L84Yu+dXp2kuOxIyM2OcM2zxXGSkvDSfXIvl+TB1g1Ann5DA+NGST45y95CviIRQ2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DvfSHd73; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fRaKDDQI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DvfSHd73";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fRaKDDQI"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RHO59j663416
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 21:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EkH62hBfkTl
	pUoyRaZs3w4Fu8ixJncnkuN92AWiCoMo=; b=DvfSHd73+kAJ0ftwmb6AtqLiKZl
	/OZsa6Zcf8dspJzo8pFLJ0U5Hfm06LdhFRbks506p9SOAP5GTmjuRq2ipIwaw8b8
	1X/nt1tUNsgtjLUQzbhFR8dDiBZtAdY/BNji647aFuis6PdLwxKQwWzTt+1L+Y8C
	9JMfdn10as15aPT41HY+AfLBYv+u7g/pFz25r+W8HmdSf1mI2hwA+Q+xyt39FUpJ
	4fTSknMLwz9/LIm6YLcLViHiKV2o/kpAq565evuI4s9oi8XB0QvudS3XYnnx+CU9
	nzJtVZOMOHEkY/gs/jwrAhpKtvQiUnY4WC+80ST07/LoajcmTmvktJuDczw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtc5n0w92-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 21:42:43 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ba9a744f7dso13896212eec.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 14:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777326162; x=1777930962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EkH62hBfkTlpUoyRaZs3w4Fu8ixJncnkuN92AWiCoMo=;
        b=fRaKDDQIsw+T1S83ftK40D3VULCXzWkcKaZ/yMnkNUnIga1F0dvDBrWa2BRu/rYP41
         D4fqXWhZ6HCOn4ZlL33y1jGVIyNsrh4zac8jV8y1tFGXKLdLXruaCOqGTC4AZoqYwWGV
         cn7brPOEGKZQOz2ziaBAZkqWZGCGsGsHY+oxVId2Kd/915rsvd3457nLGZ2if4trWJaS
         +BynrJcBK2noZRbv8qNVi4b21aKR4P2rISXMEL0Ts4yFnrDhvDZSyQZhvUp+VWMHkGXP
         dssqmycaMtSgwOg0lG1tNuQjQ3Vfxae2wf+d496bCJBCywavviaaSHiCT3S9NBWWwUxP
         sDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777326162; x=1777930962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EkH62hBfkTlpUoyRaZs3w4Fu8ixJncnkuN92AWiCoMo=;
        b=Oz7YyEVL8GQoti+N3kyBAkSkzwoEDfBLxXD3EyHx/O19bQ8cQJaB1SnAv7Z5OmT9NL
         RfUJBQsnRZYVj1bZnRq5wSwXWPXjn5kx3q3IwN992FSRRmd0QXPvDtcpHvZLKTsMGXSX
         74SIOi81vRaW4EogxUYic2n9bNlU/ZJ3SAUBz/cDMXrUfm2Lqp+1cMBvLObYc0Nu/wRy
         v7EDjg6mUNMXYNlT2+1HW1pPHOKY8X0YAO/TGUWbzx3sSO94/DrvWz/FSJqHKd2PHup0
         uG51HHcnxWgtNaD7hbwu8sPb0soZAfjjSbKxmVQ/QN+qFFFlWmZ21QuEToKH+afRjS9B
         VoDw==
X-Forwarded-Encrypted: i=1; AFNElJ8a3GQ3t2J8PS+J9u83nKw98GewPfyAtdZlYhfUuZ0y0hip+tiTthP6jAXdbrCtOfXaMTCGsG8cGJ3b@vger.kernel.org
X-Gm-Message-State: AOJu0YzPvgKZZEK11PIgXYvS65a9kXfjxwMCgeGsWFDe3Wvt/WiCb+CC
	b3loNlORqHv7fwC7BFKYMceBb7ZGvoODgFUWNn8KrUuLLvxfzmNV27+TJJYAkvsPjGBiexTJ8q4
	prgw6uSUxGJ9irJ3Kwqthh7ctwkUC/80Nkkey9bXwcFqzED8vfSatSpK8PqfLHxP/
X-Gm-Gg: AeBDietw/P/QXUEJn5MBnOVHRthCtxSQxYUyu5oto3k2U3L+BwgkIQHB4zjtb/gZ3HM
	wID92s9tHf3+Dl7i0RkT+GRADqKcFmkxV3pOB9zRbYHal3R8nILH5qjD1gDRosOF82Pt0/R2mFL
	g3udK1BtQLYxhnslgFR/yx6lLAidDrRRkXWapF47nD3CruytOB9zDL2wOm8L9oc2Ipw+pNep8od
	8JHq0G5yKvyfWDRHNyGQRxh59XJLqX0GWPdqWRukoZ5YGb2vPESC/e74YMrzZ2b5enj9iQDPCE2
	M0jrMobKr/4hAF5ZUp+aDpqD7sDnDAlW+e92DLj0hfnUP826M4Clrglz5clnC4wJoyJtV/Ljm59
	CzdnZ3kbmrdOfbU9LQ8w2q7GEsh1zAUrAo0r+1DR19cXnt57mcQ9OCbcq5RnthEjbfDqube41qz
	AJv9tqcH1cpQ==
X-Received: by 2002:a05:7022:4188:b0:12d:b2ca:a9ef with SMTP id a92af1059eb24-12ddd987d35mr379660c88.17.1777326162253;
        Mon, 27 Apr 2026 14:42:42 -0700 (PDT)
X-Received: by 2002:a05:7022:4188:b0:12d:b2ca:a9ef with SMTP id a92af1059eb24-12ddd987d35mr379630c88.17.1777326161730;
        Mon, 27 Apr 2026 14:42:41 -0700 (PDT)
Received: from hu-rraheja-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ddd927bbbsm653119c88.2.2026.04.27.14.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 14:42:40 -0700 (PDT)
From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
To: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        neil.armstrong@linaro.org, gregkh@linuxfoundation.org
Cc: dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        abel.vesa@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com, ronak.raheja@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] dt-bindings: usb: qcom,snps-dwc3: Add Hawi compatible
Date: Mon, 27 Apr 2026 14:42:16 -0700
Message-Id: <20260427214217.2735240-4-ronak.raheja@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260427214217.2735240-1-ronak.raheja@oss.qualcomm.com>
References: <20260427214217.2735240-1-ronak.raheja@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDIzMCBTYWx0ZWRfX7dE6rmKBkcf7
 Vh+rFEysg9ZO1nKkJ4atTCADYzeiXKOCII+zCSnuFPIFrEVYVNNv3ie+Hjxs+ZHs7bMNbwpLaki
 4teeWuZj8Yj6lB6HhAmAjQyChVvC97ZzH93pbZLp2hQp39XQaNdKuTqVQkaubQk3d6mSrQQjDRy
 dsrSl/Mqh2XLPCRijJWxenSKEypn5YqdjetdyomwAVYJXHcu6YA8UMRqr8elmgFHi35PlYrL0et
 HrCjIostr4ji+siCm3R3dT90OfgSEiRKg/JRY1li4tIYlNdDmhD2EO66VaNQB85TgLZjkYnenS9
 9e3GnUuLOdpTtqWmGCIRHMUVh0W1uuKYrO+WHzze6fbBRl6geeCieUH8I3GH6OMNmzrAotCOJfT
 RoDhDmoU541plcgpslu7VPUwY6+CanfnT6nP/idc3F5iBnsdDH6KNvVSxGT6pPVnRkWeepzHz5G
 lwo1IjtKhPJspbE508w==
X-Proofpoint-GUID: N5MEYaz8FFe8yEEqtGS7Gxywtz-S_jf7
X-Proofpoint-ORIG-GUID: N5MEYaz8FFe8yEEqtGS7Gxywtz-S_jf7
X-Authority-Analysis: v=2.4 cv=ZMfnX37b c=1 sm=1 tr=0 ts=69efd853 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=6lSwUGAo5LeF7p0M46YA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270230

Document the Synopsys DWC3 USB controller found on the Hawi platform.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 8201656b41ed..2d10994f7b44 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,eliza-dwc3
           - qcom,glymur-dwc3
           - qcom,glymur-dwc3-mp
+          - qcom,hawi-dwc3
           - qcom,ipq4019-dwc3
           - qcom,ipq5018-dwc3
           - qcom,ipq5332-dwc3
@@ -203,6 +204,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,hawi-dwc3
               - qcom,ipq5424-dwc3
               - qcom,ipq9574-dwc3
               - qcom,kaanapali-dwc3
@@ -540,6 +542,7 @@ allOf:
           contains:
             enum:
               - qcom,eliza-dwc3
+              - qcom,hawi-dwc3
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3
               - qcom,kaanapali-dwc3
-- 
2.34.1

