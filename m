Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BF9400DE4
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368884; cv=none; b=SCq7CnRIHDvjVT2g4exxg3MWGcEDLzfCv66LlzHoz4z7wwavnqPLnBLDfsKJZfXIRWV3kcCLqZRYKArZsEQTJnTMSqZfIZMU/qXW4X9wxOHS1AEQPwp9x2fHDj9te1lJnujVIDKRk4D1s/j+qD6+qlFTe8PM5/BaOAljXL2MnFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368884; c=relaxed/simple;
	bh=K2PktD81GLchwBUK+zykynZPifY53YubUDY8lpH3JZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W94qw/rCLIaF4HIunyaURa6EmjucR1tVxdVkP6kbeIVcDMKOv4Oc3bxaFM549D5BixKlBByIKivin/Mw7VMAFF3srmFN3CYejWVgL4bm7UKzYy3ZCHL+tkZAwH8/B2/bc+78XHYG/TiI8cPxiyKOMLbRxp//FPnyy8nphvAR3j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lFkCkZbN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PfrrCijq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lFkCkZbN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PfrrCijq"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64LAXv1i818881
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:08:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FKFWeqSVdABp3bZUWRkG8UEu9s72wVyfZKzIZbZCsxE=; b=lFkCkZbN1ufRJedm
	4QOsBV9dxOHg7OhCMUNNcugn9Q4HDsMAjNkl6NOMEq+BJJhCjhyZsycnAOb8TwOd
	RMwAWTgbl3Ooz0k+YPPEiuXjlexByDBs7AeMw9iwH1DVbqXlJ9+10FQW+MUFgNkS
	DaW2PFXPmhk1XhegYftn2+BQ4w12Cb6DXzzS8/0e+ov6DeXDNa2FvFY576vOix7j
	CBRFUy/PN50ImKKNepAjyOWz9DFS7AwnYKvBw1bnBoMQlLWmtaXTJvj4mkF0a+uP
	y1WgA+o4HAajtkyJs4E1WNZaercbhk6TKYZyAA8TWMbV8EV5IfKytte66lJ4FVMm
	i7KtzA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea0dkghfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:08:01 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c81086bf930so4401015a12.1
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 06:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368881; x=1779973681; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FKFWeqSVdABp3bZUWRkG8UEu9s72wVyfZKzIZbZCsxE=;
        b=PfrrCijqe4jnjUU3NBlfBXR13hD6p4pdzOR8DHZ8IGK5z81N4+k9wwHeWHSzG/vBrI
         0/EKw7n3Qv4ofGAFWDP2CNWsNqnuEKbL0/JRfSSkAbkOlsQkwllJRIFs9kCMg4V1OTrO
         kBO+tA9q4GEzCA0ScvO1AXbAgI6VFlt40ipFJihQIhWobqkmnTq/GOUZVDl1iQ/8wHaX
         mPeLpGw3y+iGzTTk04tAMayYH7C+HbIsoH4VD4Y/ClCm6GCRlnKdt2Y0DE32n25UdnvG
         SMTLLBzhwPpgCMAy9YkuphIPVUVF6y1PAx0RdJcO/AUBTPUMUGun42AgwDmkTawP6gPd
         v7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368881; x=1779973681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FKFWeqSVdABp3bZUWRkG8UEu9s72wVyfZKzIZbZCsxE=;
        b=oW3RAhxe6b/p0sGEiAA6JmLB913muLMOYUzP51fQaR0YJmYqZl2290o3tmH9tw4I4e
         Ag+iMANZvjzqbN+fs42qAi5zDqb9vcTFi1iDfKjYHBQyiBHFCqb26w7xeQeSpztPvcgq
         pv3pbW900AFGXQWr7Bya610kUIlIIkjJM5TnJgzzBeAbVrgWZCGpDE08+das3JzYEfMo
         OQhACUWA5eOXQ4JChBP3iI8j9zR54KIQLsWCVXSK8MqP4AXGb/vPGgi/+fcdQIGLDad6
         2E64HqaFqbRGZhEZEH0uOXLj8l90SkNl9M4tEHfw4HbcudCUoA2/03Mgywqtwh5r9sMs
         GMEQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Yf4yK0dXMGkXr9dUUONdDzDSMgqhviOpLs7M/IHul006iQsDQ46+u6h6aM4qTvSXbt2W2tCaaLG0O@vger.kernel.org
X-Gm-Message-State: AOJu0YxmqyyW52drnYQODAbIlzwSKokhEuUwriAFTcro2bWb4+PN4yvk
	Dk+rQyOMP4rGU+MUFkUaJHgnixenyJR4DK2EdPlyjV89M1JrpZzG0ChQ410GXa50sidsgYKoXgh
	F8QD3n5AvYZWvQOSjQIOGhs0DltiSC+U2jsGuDP3YMhpl626iXUE/sBBw+UJRNgoi
X-Gm-Gg: Acq92OEr1XmRWDcDPV50DJh2rvXZiwYG1t0i3HLrS+QJ9AB470XM466fYeNetdJVq1w
	qwQP9t8Lj4yWVQr4brAYWE+0uDtXPqfTzCaMVUNMFjqoCXI9KIObBmyL6jRf6qcRQGYsmyEUV2y
	StcJVQ8nwID64OVPSczqxdBE5J4fvDdmwuVLZJ6krikjT6tSWDps6EaAZhnha/NxghZf3nGgZaD
	qgGG/oBSPXTEKpbONLlrDtSA0Bx4Xr3kqPcj3HetLzXZO9Ctzdo4F9KK3z+r5xbt3uer9/aYDcA
	ICNHk7a4DuQxEuP3xJCINQxovr3dFuvZ2cpf+LnR7xCERHKr7safgoH7G7dilMctG+wtea++78O
	WojCLnvIAOLsLOKEAeE7VxGinNs9TGUrCx0GGKLztKL4kew90RgL4p1EW
X-Received: by 2002:a05:6a21:ec06:10b0:3a2:c7e1:ff93 with SMTP id adf61e73a8af0-3b3082ac358mr1871153637.8.1779368880950;
        Thu, 21 May 2026 06:08:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:ec06:10b0:3a2:c7e1:ff93 with SMTP id adf61e73a8af0-3b3082ac358mr1871135637.8.1779368880520;
        Thu, 21 May 2026 06:08:00 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c851991ab10sm294602a12.22.2026.05.21.06.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:08:00 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:36:49 +0530
Subject: [PATCH 16/18] arm64: dts: qcom: sa8540p-ride: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-wake-v1-16-d822567be258@oss.qualcomm.com>
References: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
In-Reply-To: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779368813; l=1324;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=K2PktD81GLchwBUK+zykynZPifY53YubUDY8lpH3JZg=;
 b=6z400tfdCbltvSD6mGAEzUkJX9xdC48omIB/LVe2vGJx9iVfjex2JKmwBBHATv6+LT54qF8/K
 AwboWlsYBgoB3CtvnY8hv0A00kwa5/Z0yO4eG7ToFRysmVx1NyRo1EM
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMSBTYWx0ZWRfX9E+NOTJ84cxp
 U1RnyjoglrlN3bm4OFWlVkVgISn7Xi/WMv7E4//Zj5FbN7jt+ODk3a0HTrp1RgSe7Y+tuUOZVeH
 scxmYtqhsXlwPpCn9NqaST5T7UVLzCrsuck5fSB0AEvebD8csluIQyrZ/0U4tEHF0waU9oxl/BA
 nzWFE3kUqRrRbRwTHDoCI9kO61elkdjDrr5feUL7HCZ8DJaoxbn4J/3Dr8XWRQz+LogeG7ZUPiK
 2Vv+HBFo/ktFmSnff4Ov4lgbYVr18ZR5pQErEXRNv55Ek5XsIQq9Z21+G70CrWbee0r1NJY2rda
 KMlPMAWAFD/egnb06+w8qi2lF3ZYl02K99/2QNIP7E7496uOlc4nnJ6G+yrKrgal1Ge1vrSmpaC
 wKY0TUAtcBtmCRdbINJHnOxdnLMSYpmziuyiscYBLkRUmv/9pfr581oYojtOUG1Is1gCEW1T5CK
 9+08gl2RGaIsd8EjD8Q==
X-Authority-Analysis: v=2.4 cv=aueCzyZV c=1 sm=1 tr=0 ts=6a0f03b1 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TRJGHeO7bdl8qYu8Ap8A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: QrzqlqkODO4cxJ5Q15jh6Yjstm5IEnhb
X-Proofpoint-ORIG-GUID: QrzqlqkODO4cxJ5Q15jh6Yjstm5IEnhb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210131

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
index 44177e9b64b5..702ae4cd3d0c 100644
--- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
@@ -367,7 +367,7 @@ &pcie2a {
 		 <0x03000000 0x5 0x00000000 0x5 0x00000000 0x1 0x00000000>;
 
 	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 145 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie2a_default>;
@@ -388,7 +388,7 @@ &pcie3a {
 		 <0x03000000 0x6 0x00000000 0x6 0x00000000 0x2 0x00000000>;
 
 	perst-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 56 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 56 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie3a_default>;

-- 
2.34.1

