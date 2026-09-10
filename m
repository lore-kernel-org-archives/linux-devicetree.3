Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9932249B20E
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047003; cv=none; b=ubCzZ+r0izsxpkfv+I2/GtUpvBV7fy4BsBpTUmSIsB91LrkcygrLEtvPr02E0VfVGbTq/R+lkybLZAIojvaCbN2PMOiQvPe3apQOlnBWdGHXrcF/JoAYC3m6N3WIKD/s+xgcOzu4ovrJJF9EcZxel9fs5yMijWsvB0IvFrscNgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047003; c=relaxed/simple;
	bh=XV9v5D1+9gPZXEtX1onl5e3mfJusxovOJOelXb/jdw4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hr3jj5GEaptBJ3hEzQQErwjpaesslm6fyjp2tNUSKyDfI9J5l+dViUFgkS3lReRKsgkrCP4W/1ojjZQ2X4AykY2FwE1G7S9RdJLXiIi2M55TQV18SlfB/Uomx4fGuSH1KSRtp9a3V93CsZlgmFu6BzO9hYnb8WNvjdHlUpjpkHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kvpjyVb+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d/KZq7/8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kvpjyVb+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d/KZq7/8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7ipp918725
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:30:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	czflz//vzxCEPoX+dRgQmIOa3mdqZAbZV0BPwSj5Qg0=; b=kvpjyVb+yqMg/jM+
	d3AhA0vPBt/ec0L4NRYMcnp32fZZD1yv9ExQzNlxdUpWX5mBq0cBr9fwIt1lhCU6
	waMif3l/oJo8fHPGTaivSbKDM10BlIAQ9YG6MajFO9XasDhBIAbES7x411qhp+WN
	4+a42f0pj75Wr5m2GEuxIuDFy1ZsgoKWKN+EE7oXQXPKJE/ElQ5a3IMg9lnigvpG
	3cuRgA1s1BDPWMkfItzhWcqseYIWxqyDD7E+33Zwkjd66/5IlEiRv18u6gUf2b5U
	3RB7hK0puWUKMGeoXflD74Pal1G6n0a0tkGvXcqxtfnTwDkyNMb1Z+DEr6Jms01y
	Yp57ng==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcygv1ms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:30:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398d292eac1so14332023a91.1
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047000; x=1789651800; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=czflz//vzxCEPoX+dRgQmIOa3mdqZAbZV0BPwSj5Qg0=;
        b=d/KZq7/8RnRxymygA+qfQyfYKc6KoiLjHioSrd9a1O1ZYgtCPlj2apj6HTkKUH4dkF
         5A+I6DanD2XLj3kNQSLgb0n5z+QLqqrd/TFlgYelkQu63J5UAvFg6LK15bC3t74jjWbT
         5Fvma2B0wwCzSqhLGM/VGm7sfLVHjIvMPAtcaKrk47dTI275mEbaemvoK8Imw2/hKivf
         mb3lkJxnCHvBY0pj7zyWlFt2iK10fOYdIuzyNjdV3ZjpJh7EpgWHdXxABRBMS7ubMnmT
         WPWh4VAG5WCsJynl2LIIBQPddoYVoseYvQa5ekpT1D0VynwXVDyPnfX4Z26mIvaYPOoM
         k8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047000; x=1789651800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=czflz//vzxCEPoX+dRgQmIOa3mdqZAbZV0BPwSj5Qg0=;
        b=Uo1R5twQxWLGMugBAIL4ND3AIURL9uHbOCQ7i6dJ4pjJFMEVEWiTG6pY4d8NttElZ4
         EeJCa/5PxQ4pte37W7sqdELdwDVgpQ0VOuhtnWiEj6x2/a91GVn/PC7/rintZsqHVCED
         PTjvrvyfwo4fdKUCFruqW778hN+yqQLLy1ULMhu+OCueQusO0bOQmr/NjbFVDUh3srbN
         ReEXsSRg7cov4f05D8MD9kdjm277Lc6CdSQhXQnPwgf0XTDyFkSv+S27KnmT7ufHs9uA
         A97teyA0Qq98mrNEIbJKP1vjVOLLc8XDlxQbh1dfwia2uRvpNQtD6mFhIf9pn3VkXiMS
         gaWA==
X-Forwarded-Encrypted: i=1; AKwUvBxm4f8Pz/QfrjMVqNHdIs4WlsUQqNx1FnD4LWQlm4MeiTGgcla5iDke/kFB4yq9kyg85zjhLx+sEfix@vger.kernel.org
X-Gm-Message-State: AFuF++mNpn8odWIaRSzMPol9RPC2TchL5wBQtBNJ5tXHSUy85pP4oGQX
	YyaSXn2ZVcayzFNkoIxRqGcI95tmFKv+SMWA/c24mPEVwnauOSdkx9yK+M+Izej1p30oz2UfsYi
	4mXgIUEd8lX0M74O9EBT2BNOP25bA6M8fDcof/iqwisjycROVmI3QHDeqW0QvQEN+
X-Gm-Gg: AYBFou3D+8y6DldX/le7NnfsLzoFcSAt+HMZwfnIMEzhbA4ZfSyOi93gaTxOJfjIBbP
	tcbcJ3snGMCfl9HyB6DKCAa8eTXWjEisZjl4iuU3Mt9LBLQJgTQ6iBEjZgD68Gml1yF9DX+/S12
	LJD0d9lsiE+wdgCR1Bm5ROcD3AN26FjORbhoa7LN5jLkXRmINLfU5jE/+qM3J0WvFMuAXiarEPn
	PT03GywT+YWUF5CLN5G3/078Z9FDL4PwFEgPTOYDIbcnuNlN+Bn/muktZ9pXghu+RJlria3jMSa
	sbs3cu3euPrCAUV1hdTcRZVB4j2aef2wObiVlzieZYDuWZj/dALlVqc+5l7BLQMzN+jbBv3qLQk
	yPxHZr0ZBXdpa1jIChBSRGARswF732VCDwIE=
X-Received: by 2002:a17:90b:3a0f:b0:398:de23:9af6 with SMTP id 98e67ed59e1d1-39bac34a3c3mr18658632a91.15.1789047000393;
        Thu, 10 Sep 2026 06:30:00 -0700 (PDT)
X-Received: by 2002:a17:90b:3a0f:b0:398:de23:9af6 with SMTP id 98e67ed59e1d1-39bac34a3c3mr18658548a91.15.1789046999851;
        Thu, 10 Sep 2026 06:29:59 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:29:59 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:01 +0530
Subject: [PATCH 12/34] arm64: dts: qcom: sm8750: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-12-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=919;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=XV9v5D1+9gPZXEtX1onl5e3mfJusxovOJOelXb/jdw4=;
 b=eXhKCedKJ3+kNvAG8XJp+DhjHFdafqrmCCxM9JHXteBu354oHjoxJ7jZyBhOQZETE11mWknUK
 ii64/qCbBwTDDH9uUUzfiPB2nvVUWL5tb+lKhNzYvFburDDM6TnRaox
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX0KzA06Q+TqeE
 4iQVYRFXdgfcoDeu+LjwrsX9LPcifgpTd3akdU+1Q58xMDIDj2W8+KCsrNhrDviu4lB4P0j0PAI
 eVbPqq62rs+6IHw/HpiLTJvc/4VCrJufW2jCERRw7mQPlK2l2YhoHOOgQ5fZX48D1vgZqByk3Hj
 wwe0tsplyw9NRKscLbT8m7Y4dFw7++gOWaXY7ra/PPa0JLcGWoQVZqwJ77c+7L1StPkEvkNaUgT
 a5PF7VJMt/mxa+hmWICdughduGsMhSWz3kEQR2LuCAolcnxsjzXHmZzvnSKlwVqeAheSOg+Kxwm
 j80FB1UWOGx6ycZ/EdTSthpvKOVM5SwqyLNG3EyOGDHifsJF+jXa4EK0YOZh4LpuFTiCBP0WiIg
 0a1YOnkxYPPS73bD99fnZXvShack5FFAfN7sKuCHRAvhX9q7CMikWl+nS/fD+NdROy36+0GBv/j
 Bhcr+Ne6tlZnFbeupBQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX25Px4nWnRfbP
 A+zF1TqRzAQNMlG/fV0i2WunArsoVwKgQeVJB8TAIdu+xDLsG4HJiyDiVuSMPzfbEFHa7ETGeNQ
 enF7NqSUG0t2SxAwrCfK+aT6e8yYDzQ=
X-Proofpoint-ORIG-GUID: 1j0YJpQMr_cnyNHidULB_93sY0WBTtaY
X-Authority-Analysis: v=2.4 cv=VONIDNPX c=1 sm=1 tr=0 ts=6aa2b0d9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=bu6UjZ7a5GH_BZZocUYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 1j0YJpQMr_cnyNHidULB_93sY0WBTtaY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100161

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 9b5fbc004df4..23476fbd993c 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -1119,7 +1119,7 @@ &pcie0_phy {
 };
 
 &pcieport0 {
-	wake-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 104 GPIO_ACTIVE_LOW>;
 	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
 
 	wifi@0 {

-- 
2.34.1

