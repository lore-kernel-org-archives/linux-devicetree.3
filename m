Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D2A218592
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784887310; cv=none; b=jfQ/7JSBMdZwWoHTpenM+lwDt/QXR2qYWFVew/5XIXrXARdMf3zBGQGwyhFEX18ufpRCSXMay+wuwV0fFBIKrDU7dRSHxSiY7wJJdwt/uvLwOA72hvgqw56gOWDmMVNVPrxr2GQZCb3I7xnIxnUR4BFEj2GitzccRWuCx5lTaMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784887310; c=relaxed/simple;
	bh=hNJNcXrNH9t/WVgtwP4qKBm+72KdIBYy832AI6C7B9Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gm8lhKxY5kVV/MBWWKXCML4rDQZIfYyJVDfepec/z4BIRccS/sWGDfGfbGjt27roArAhQ7GCG5ghqjeNg3jc8/CloSRRWArpMRjiuXhkdpkZz/bvtDvcqtsT0XzKrNDErWMrSQ/xp0wxD8us4IF72gLb05/+CEoDs5xx8tN8WKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lM8/GR/x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c7TB5pgx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lM8/GR/x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c7TB5pgx"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O5xRwx1892434
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1xzZ4TYv3eyDh/q626F6lbXEnoEWyDq/x87h4i2WaNM=; b=lM8/GR/xLRlV1WoJ
	F3lDG6tE7Z5cdGNVWElmBsQ7ZIOZRWilEhn3tAZpPt4/d4h5mlLsdVAIjarNUQEk
	1c4GUrZFCwisxJ48L6uHAJUxF4J6Sn2kPtmJ0o+0P0PqP3hGHLzecAjtadPQBhjH
	gBqPgqQGT2yZg5wjr4UEZuo0S2OYOactMqXXY2UQp3i9pfbMNnnbS3q54VYrrITb
	AIPgj8e8x91PxKp36BMQduYO8J2BkJ9O4zj+x2Yc0QnnF3rxrexUUuPJAp2d0X68
	IYGZ8w0AAYSdmE0x8CSAFI6xOhg6tHx1PF2+4M5HkF6MRxAB6jrSeNkNNkTGNFL2
	2LBBBA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm2cx8wcv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:01:46 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cab041eced3so413994a12.1
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 03:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784887306; x=1785492106; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1xzZ4TYv3eyDh/q626F6lbXEnoEWyDq/x87h4i2WaNM=;
        b=c7TB5pgx6sH24PWBBCmzaV0dXi54qTxALJBQkWleFW6L6pPq/pOc8xLLMUbjvpImE6
         EBEVYRDTICntVuv17uojshkmDj+XTs1AmG3+fOkROjhPONXi8wk8imLNtQ5fTJLpGPUw
         2vqT/4LN0K9taiC241J1HY9s9iZsaoer4+PPhcV2VrY6AackkkPV7Lvx43GpYUrvQfd0
         YxRHivnUiR4PqhpvwENFmdiH0s8pQFqV2SvuVic8YLWyy2uMBlKYwWtccaCabd3SUb7r
         umlPfNl5p9aEAdp9gfIB7LSsftbMr4Is2nXfrJM+T+dVIxzEdUgsCZnTYk9Qb+gZjI8v
         mL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784887306; x=1785492106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1xzZ4TYv3eyDh/q626F6lbXEnoEWyDq/x87h4i2WaNM=;
        b=N62zFAvQAF89/n64FiUPnrmIXV/Shl7Tjcg8xWAJ3ek3t44nm7+zhWGkHLgkKAtMOR
         j/GlSmLR1BeANSs1PiorE4F/ra3BTmTgHqfnoJp4ZYWLIGw2B4w5w+usQzPLubXd9x7k
         AmWPBYNYcRvx5OFS6CkF51YzYcp3UcloOKQD2W16y96bQV83F8Omp+VKxFSlpAtz0YRK
         dZFsr+AyT2ryu7RKfFjumN0YmOWJvCC3ss8pGQ7F02CvNyksPDtvDa59+qhTf1Ye4iKU
         DAVdRy8SpQN2CHUC+o0zebqjj1VngQnoiCc4o7+ySuZX7XL3GbTnAyd+pFWF0MzwSiZK
         ZTmg==
X-Forwarded-Encrypted: i=1; AHgh+RopKaVE7cMeePaYxXh1+QIVnRX8MixJEr4JIjTaWaULVhUlpMgPd7Owshgts3DRyH1T161qZB4UKYAU@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2nG+gAzyUz3SOzcAarGN4sRMrlGCNcdyJo96LvcmB1y0lSkSA
	U652lBP8MJ4vC1O4YwuV69uCAfkQTcWGbC9OGpaqPaZ3mRwVy77NX7sDICFe4pHHf80oV4W07J3
	h1smqgybkn65pe5Ycuyqab8Kzx0n31CCE7KKeFeN2lXd5w29tWYhkth4oYNTsotob
X-Gm-Gg: AR+sD13Y+fZs1tKaPxc5Q9v+KO4wSEN7Ji4q4h7opmR4PI/Sy2vWicwpGeKoO8cj6RC
	r5ADn53mQkxW/c+6iQSF0FFs65ezc82HTUZcAnQcvlLimlwJI7Zmq38atkwXX43wrSJUu50EzRv
	gpKPtQbcW9Kq8cdOJjBNYSaIDBQKM62pqv6NMheeJGFhKYDByqC6U7QUCVg1bBZ2ISiTBx4E9WD
	DWU9yp6P3dQkwsa9nGzc6uoLOGK0HOhtsjucFNzfLbhrpX+LrPrfv3mXI4YGcMosc3Gvfws0LHV
	WqcXYGXnrmtHmFh1eksD4s/3AOthEaWVKHL7hzOhi49JJ0ksHnffHazVrFU7oOf7e6G3DS2m3oj
	d5guVimmpx4EBVR8WOrheh+gqofaalSZ7abeDMOGNMEzeAOk=
X-Received: by 2002:a05:6a21:4d0c:b0:3c3:9251:fe49 with SMTP id adf61e73a8af0-3c44b1ee70dmr7362937637.50.1784887306367;
        Fri, 24 Jul 2026 03:01:46 -0700 (PDT)
X-Received: by 2002:a05:6a21:4d0c:b0:3c3:9251:fe49 with SMTP id adf61e73a8af0-3c44b1ee70dmr7362904637.50.1784887305969;
        Fri, 24 Jul 2026 03:01:45 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1c9289sm29515427eec.29.2026.07.24.03.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:01:45 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 03:01:22 -0700
Subject: [PATCH v7 4/6] arm64: dts: qcom: glymur-crd: Add PHY supplies for
 pcie3_phy
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-glymur_linkmode_0724-v7-4-65c8469c6b65@oss.qualcomm.com>
References: <20260724-glymur_linkmode_0724-v7-0-65c8469c6b65@oss.qualcomm.com>
In-Reply-To: <20260724-glymur_linkmode_0724-v7-0-65c8469c6b65@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784887301; l=909;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=hNJNcXrNH9t/WVgtwP4qKBm+72KdIBYy832AI6C7B9Y=;
 b=Vv9RQne1q6h6Y2c8HqXDglkrX0naBuTuN6Lt7DDTtPB7r0B0T409GqfC9mhVtdgG/xSRbB9XF
 qX0nGE2ivWcBoBPjb/WgmIaL76UAM2QPj0uukGBUdsp5vRC6UYCUvER
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: eEQb6WQlq2ooPKx1l0VLgpqGwpSIqRYV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MSBTYWx0ZWRfX5mToC7jSBghi
 pDWYmV/3A5hlinrNaGTHNOLpz+4XWi3JdImPoJRVx8zkGksdXgdxy6pJ4FF1olFmBCoHW4MJN7O
 yFMfXCB2u6msCXFIPQ8IMlWvWNQRRwbjz2qcQN9IuozJuvhorhyHjjGlqMhYC+qn03qv+HUKP6+
 4QYrNPKOVRxrYLDGUlo6Kgj5L4JscUqdOun+JJ7a8SkOrCokjxLsAO5wTVRCl2EdOjWnC/rmdnz
 ufgsoGQni4SFarDd6KELqL8ujW1yjafJLDv80//zFVjkzcAMIvUY5XqUlzLpNjbB+VXHenOLXCB
 ODH3pCxAvBSeKqu/vgOJSc7Mcb9NsiMVq3vlqtZIRSF0oTx9ZGci7eTwKW/6ceSFCZkJnQXuOtT
 CrYC40J19njkV7r3lixxJgU0XUMx+4iivcTYSjCxWEAoGw34sJyQpPZS7iN2jBZpZ+HtaFMsx9a
 6XtCgomx6klJIbI7eFQ==
X-Authority-Analysis: v=2.4 cv=X51i7mTe c=1 sm=1 tr=0 ts=6a63380a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=A-Hq22lvr9pePbC5bZQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: eEQb6WQlq2ooPKx1l0VLgpqGwpSIqRYV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MSBTYWx0ZWRfX+In9GO73EYNt
 QLfs6A5GXAaUacb5MBdTkuPuFW1aHKpmj0bvLQollKLNF6b7P3q0BkwSk66vyBUC6G7P+c8PYPk
 f3Pl0LHyc4II9XpT92m/eNDCSi9oBlI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240091

CRD wires the shared Gen5x8 PCIe PHY's regulator supplies through
board-specific PMIC rails. Add the vdda-phy, vdda-pll, and
vdda-refgen0p9/1p2 supplies for &pcie3_phy.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 6125617de82a..0aae613a33ad 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -28,3 +28,11 @@ &mdss_dp1 {
 &mdss_dp1_out {
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
+
+&pcie3_phy {
+	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
+	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
+
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
+};

-- 
2.34.1

