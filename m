Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103868;
	b=J2HdJmUhvVlKSbxRa/rpHRd6hXInS2uxwX5HUQHBDJFI4AYBRCQwzYe7eymYYRlEW/Td
	 Dlpkn+VG4Q/GIqXg7zi8qjVXzeMoqgmkQPbRth7UMJjI+SRAYUGTGGSuUZ8VQAKnRPyfj
	 mxJIClidtsmAi6TMLqGQsGGYOuAF8GD8TH5lswJnpl8mvcDt/xwM29rEnQLnZbzsC6wnf
	 Wg/VItPpkv5pN+Nmo5AzIZBjzrT6IZ/Qko4pBbkcn+JFHBz56cRmeNXedx294CeRwbD+c
	 DuKrJq1YOLLr1XpuALcrZcbAzdxltIDi1eg7gpoWmHp0TPf+JmP2vpM72//jBF/k8mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103868;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SBX0/to4wfH3fUA/kO93uKJ2afZ0LuqvANCM4txROkA=;
	b=PeH8oAX7KEmBEon/tKXFIu1usM9oiDxXBXGY4opylCEalgvsI+zczbCTCpX/j0JHElSj
	 XRCnHMi5sIyZeSeaM+OF8vjbY8vXtX9UCEYXpLDfbuU1HCzt+/dG6OaPLqef0Rsww4/p+
	 XZ6y9tdfXsuz2ezh6l7wlJGMWwmhPt/dmM0UUcKqeEDlX92SPJG040erjdZq58bN8syS9
	 5qQg+uPoc9s7z7Qj6GYGnZON24p6BF95a4nGzKHfFQC9ALbn1yi/eM+UopSMqiyqB4+hC
	 n/Gd8FqqTx2FwTy6GVUX+S8n1x/48ByXE6cl33MeA5GgJx1q7lQUT+WTbYMOzgxMbig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S+M4v1mo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bq+0XQl+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B4160A2602
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35B4160A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S+M4v1mo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bq+0XQl+
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe3Nc1935863
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:24:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SBX0/to4wfH
	3fUA/kO93uKJ2afZ0LuqvANCM4txROkA=; b=S+M4v1mo9w40RZh39oLWugextVO
	S/h0LkOQMNhtWU4GULebL14JinktsmxgGsPyNmYL5m/yOQ4dHshaODni2eWKscQZ
	3QcRfIEf7/xKez0wYsbFH4K9fsYDLT7bN4aI2wbz5RBf7WF6FfrDj+inI2ARz2Ab
	02W17lB5EtkMx/hVLPo7qJ1pzaet0TocvO6Td1uyjnur7DQJt/bDkIB9OoEImFJ7
	jDFuRhELaOf3oWhc+up8fUVsICJQafLKeHfjaERpvLMqYzvxVX6kiugau2ecQh4x
	tkmY4dMl9U16WQfBeRa1AvDfDumpMStjUlR2f9qEJUsinur2i4RoXExsQcg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjfavtsr5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:24:27 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a190c53a3so488437eec.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 05:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793103866; x=1793708666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SBX0/to4wfH3fUA/kO93uKJ2afZ0LuqvANCM4txROkA=;
        b=bq+0XQl+2jF7CYAyceKCAWFvpzkKuHBdtjT5uzzt1xG2UUhRMFFr0AGY2UJ6mEx/mh
         WQHbmzX1JOdfNiAVMUMmAFr07az2Lvnl1FO0n5ev8YgavauTCWJBhSGrTYyqOmomSW7T
         zuo94yFsfOFIFIj3SLsWuMlKHoQ7eIzO6vImdQ0IZI23ReGVTtN+aj6vFX6eyrUwMIFe
         yB0z1Z3ZD7VMBZ9XDxSx++NyAqi12ZsStVAzX2pZe/OpeTQ9QOuuxI0b4V9czsISJPGm
         GN5H/h0qVmEaRMmyj6b0CvvB+ovlNDLbfp9dXJYZHyBc14XL8x/OavzEk27PrFYd6oh6
         hMiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793103866; x=1793708666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SBX0/to4wfH3fUA/kO93uKJ2afZ0LuqvANCM4txROkA=;
        b=F8AlzX4OKJgNHIrjZyIEq4dAT3DwMsEp18nZohQAR6xVBdBhpuW63T1JcXag1r0cKM
         YxCAWhzHaAo9JP74LA7mFdkdOSY5dqABsiRiemBsj3sNzCTxK49iaxPO8tV3EjFw6Wsd
         K6VKIbO2ZGw8aEWdNiZ19v+4SotC3RwOUFIOZeJUt/T7W/ZKYDxsFVgUGDxOl4NrCYfA
         LSneNUyGIB3JAsZ+sP5thbQhz48eFMKi1jGQ4aV/pxSqKUzzoVtYfQlaf9hasft703Do
         /bg+QohLUTZjp+Uw0yCS3+mYzdU1ea5tPLBbTmj3GgEelrmmURs4YIIJ3OdA6D6ZJlX8
         hCYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAEdFXBR6eIgf0qS+ZFFaO86s6L9tCCVJVgXWLRbLmOxhi8brRmsjaoXfSpWcctygSmc/24vML/CYy@vger.kernel.org
X-Gm-Message-State: AFq9FYJjWPltvzy/FpHf2JQOGhmSASv+k9+Dd0KP9MTzpwYLs3/A4JoB
	5ALz0LEjzq7K9N6hf7WTDoW3YtwHtmjXfSgPkbXH4jLK3p6CNFeG5jktVsLndaXJaH4eTBlf0Et
	Hk9AA643nE7mmKiHxtsf0E5Mm9xwH29YsiAMqQnOw16wbwv88enB2N5OTZngla70p
X-Gm-Gg: AYBFou3NZnZ/yOX+821h7zYoFZPjJJ97ZYh6u0shOej5T7p90bvdknFhVmVl0vVzu3X
	ZpbZz3iHzy4pBS+4Y5WEUYPJXnaX+XPN83xjeyTAMxBd7u4XUypXPsZEcmj1KM4no3kX1jfnKbH
	y4nYYUTopYuRORkREWWt+xMZIbShGT7mh6H8mixIiH/UrgWx/bMsNQ2c2ssp0WaM4DMRx/skm9H
	VLwSZmYRULT1qDvzAS7WmfYwBCS6gQTBb+KHD7AxvkePB26b1Qj+JvEDV62b9eH7ZqZo1rKd10r
	efUn+mY/X6+A0wGjjvaCIPr+3i6jiAo//f41B4V0eCq+r7TEX+DJwm+ksPtsN/32k5G9032sr9X
	qQJjIUzoS63R2i+RW+odPUpB45Dosip/s39aRldP1Du+kAZ8Q
X-Received: by 2002:a05:7300:bf29:b0:369:fe82:8d3f with SMTP id 5a478bee46e88-36a0f81abc3mr3760956eec.14.1793103866163;
        Tue, 27 Oct 2026 05:24:26 -0700 (PDT)
X-Received: by 2002:a05:7300:bf29:b0:369:fe82:8d3f with SMTP id 5a478bee46e88-36a0f81abc3mr3760886eec.14.1793103864883;
        Tue, 27 Oct 2026 05:24:24 -0700 (PDT)
Received: from QCOM-IvKeorbwK5.na.qualcomm.com ([120.60.66.138])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8daf444sm32822215eec.18.2026.10.27.05.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:24:24 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, abel.vesa@oss.qualcomm.com,
        mani@kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: qcom: glymur-crd: Move the PCIe slot supplies to the Port nodes
Date: Tue, 27 Oct 2026 13:24:10 +0100
Message-ID: <20261027122410.62219-2-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027122410.62219-1-manivannan.sadhasivam@oss.qualcomm.com>
References: <20261027122410.62219-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Tn4cZqQOWZTbCpnc4wJG5q_s61o5JJOr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0OSBTYWx0ZWRfX1wZRaSQ8QhpM
 Fr0B0TgkXUZk9zcZBG0GsSDw01UTQaDuh8QlE5E9/hQfWODimmd8Wf+LntdSKQDwH45FaX1w9ui
 Q6O2xQNXTKEkRQ84EsKGOVNdGfuZE9g=
X-Authority-Analysis: v=2.4 cv=EIeTQFZC c=1 sm=1 tr=0 ts=6ae097fb cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=+eK/VBehCgFHFEY5YUZdYA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=DO3DuuW5O9QViVOw3M4A:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: Tn4cZqQOWZTbCpnc4wJG5q_s61o5JJOr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0OSBTYWx0ZWRfXw2HSIfBsrC8O
 b72AgHtvdqA0bu6C73iQPLOTMqySVWwjGMVsuEHqkkYEnpJ0Ramw88eNBCmAVxGwjCXYwn1rtpf
 m8Sz/GPQNnMZEuDfLwH1jQG5zic+aoy+jT3d9icIhdEsFym41vog1WQQdxIEeAjwQbvOFRPlc5P
 wwT+9mjGgoWRkv5FH9u0aCnvfkSnWV7ZC8Jx/TFUNJyrd34MYk+s9XmuHfjBRgRzkrud8Ys0hZy
 IpMVVuObQRQqGM1eRKn7sgUyTspkjr1Udb770+wv/Gr68LGoVOBPz+cI8VrrlmrNQmIkvkCOMN7
 mhGY3qVZp5Ln3h0bVf0ukMzK3HjSzpJybdbLNbZ8uSIPuUyDIH9HWVehNJYn4m2RvEvJmUJ5i2K
 6gr3flVfhhVh738jepTXbqH4F5xh+dfOsPq6lVibWEnmvL1aYeoyqyjPrTNnb5yB7ASnXk7Mv8g
 4wYfGOMkrFsVpjD11hQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270049

Since all controller nodes have Root Port nodes, move the slot supplies to
the port nodes where they should belong to.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index e27c697e3170..7e16add069b1 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -743,13 +743,13 @@ &mdss_dp3_phy {
 };
 
 &pcie3b {
-	vddpe-3v3-supply = <&vreg_nvmesec>;
-
 	pinctrl-0 = <&pcie3b_default>;
 	pinctrl-names = "default";
 };
 
 &pcie3b_port0 {
+	vpcie3v3-supply = <&vreg_nvmesec>;
+
 	reset-gpios = <&tlmm 155 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 157 GPIO_ACTIVE_LOW>;
 };
@@ -789,8 +789,6 @@ wifi@0 {
 };
 
 &pcie5 {
-	vddpe-3v3-supply = <&vreg_nvme>;
-
 	pinctrl-0 = <&pcie5_default>;
 	pinctrl-names = "default";
 
@@ -805,13 +803,13 @@ &pcie5_phy {
 };
 
 &pcie5_port0 {
+	vpcie3v3-supply = <&vreg_nvme>;
+
 	reset-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
 };
 
 &pcie6 {
-	vddpe-3v3-supply = <&vreg_wwan>;
-
 	pinctrl-0 = <&pcie6_default>;
 	pinctrl-names = "default";
 
@@ -826,6 +824,8 @@ &pcie6_phy {
 };
 
 &pcie6_port0 {
+	vpcie3v3-supply = <&vreg_wwan>;
+
 	reset-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
 };
-- 
2.43.0

