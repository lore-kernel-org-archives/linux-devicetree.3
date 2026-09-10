Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A7C493D2B
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047028; cv=none; b=RDjPTyJxzLpBU4EBT4/JJq5mrYTWK+3AB31efaX4BRUL7/80hc90L3JodyCnRqXXzW29fyBejRP7I3zeUsCdJiZagJZA2+Wml00XU6OXCGLql7+8D8vSGorjPeksA3NbcB36Z9OS0/pAwFcwYtX/vJFas7S+IYC0an2TcYvvN5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047028; c=relaxed/simple;
	bh=CXfwjCEmlTi2gFNzojVj9OvmB0X6o16y8nsd8vTgXLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QPzaGKugna1Ob0qg7ci6zAHaddJi7U3UyhrvVZ8HtXeEGFBcmnHDK5Jg2SlKuFTHSiMz/nIk1nHbI4SVTnoM05oGItLopISh2d7D9expWl+dWaMSD0hk4Xazarc2nHZinnAwAPud5/V1lm9P+b+uQTL5HCebh44F4PGawmWHbck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dzKyyJ/w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BkLhGCIH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dzKyyJ/w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BkLhGCIH"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7k6w918775
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MzbjLgLOtqrKkzbwT3kWbG2jnIc6kGhA4/pYWT1q6fY=; b=dzKyyJ/wtb+kIgW1
	qJf9g5pSgkAug2gCJdVOEbJiqCQ3odLzYH8XeLqNv9wZ16I9kDnxXTUAcSIlsMs4
	SPdti4IrI91MU5tc21KGwWG8INUZL5A4W0WwH6CCFV4Ktkgs+QcOLPwfhjxF/C2d
	/ZnwLdu+GV7EjpFWwuuvuXLA0hcgw1U443liAnurCsQff1/JK5PB+y0SgsjYQFN6
	I/zThTyUrocZ4Zi0SvuALnQjMHiFggcCdkQshpKIIc6A/XVzhU8ftPrANiz6QwGU
	Ht1yLxNV0V5i+iQzUE8we6K02r4n6HSTvyZ/5/z64CAeFEVjWNVm+tbdh7i1y/rT
	7TG8tQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcygv1ph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:30:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-395543dc382so3469217a91.0
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047026; x=1789651826; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MzbjLgLOtqrKkzbwT3kWbG2jnIc6kGhA4/pYWT1q6fY=;
        b=BkLhGCIHm0WV0XYkDMxDNhMHOPyC1iIVnKOuLOmSGJIx3hU59To6/bNDalKPes6Yly
         7njiQLoHsT9Xe7GZt0uXvbsknucIHVja2r5AsmWWV/mh8VfGZpSJT/Y0pXAxQ+JfvneO
         S4juT/wzQ3qHwOvmEZKqzy50otTZkdQlY3i0iOS+fUMfq5MIKXBXIlhOQLbPB5pIgF8Y
         w9637AdUfUa1DgpW8DvnjIy6uXJG7cu0A6cQjDWlmh2PCeXM1uJdFMndo7+vvU0NHTZB
         qmF/2mattPE94ncQu/Y95jOlWs9uUMrko/MXE2csRWADH5B/bMSTfSHCW8TEGlzNfJrG
         FQtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047026; x=1789651826;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MzbjLgLOtqrKkzbwT3kWbG2jnIc6kGhA4/pYWT1q6fY=;
        b=IAjqaKe2FeG4L2eGtgxdUeHX+k1O62VSp0gar2Jq5R+ZjDxb9w4GbVGO1H3kxTdQe7
         5ypkVcRIzUjLWPNdoWxOm4Q48ShZnT+1TYFqP0j6pOsPNpYOBz9deLTJk3f8FnWc9/9s
         6y6tD1WZ6LRVrrJaTz0Z+N9wKzamHYdISjPq+PPYYJFj2fNeVENpLXh2pCHo5AwbCIpi
         4AIlgAkIF8XzmHf12EPeKoToRHDnBUEg8VcXmEiXkSECls0CsWDF/csLZ6/du5yYtWs3
         +s/GBtKfvaxRjl2tRcD8UFvmb0/Gk6oxaXUJBkfuA9/OeE8d9poh00ceO14jkui1VLZY
         vk4w==
X-Forwarded-Encrypted: i=1; AKwUvBy7feJdNezJ3DxlGSvq2KluHlTxPX2w7qRlFyjdeVOm5ZZdMwptojpL+/4uOnZvn++Y5HXgEo1ss14+@vger.kernel.org
X-Gm-Message-State: AFuF++n5f6LLZvi1AlVAtFIa24oJRcYIkZahUVhPQde5VV3OfpBaKomV
	dOkOvwyCKVnQ4mBX4VQvTxRHs09cJ87uFjc3g3oXcmBzff8GXvTyETrdS8WH3Y4Pt+5FbfH3Nqe
	MiUuo+F8kZEGPfEASz8xiGTMhJGVoeWTHKk9GP/4iSJQHXR9htwJShoRTNvYmrKiM
X-Gm-Gg: AYBFou0Lz7tzHF1Ai6bQ80QKHsVi/C7lXZ1rVnxOpWMjzvz/xFx6jLZ7ZivB7bs2/7f
	y7qOXUkmGrmVbyERyO43NIE4MhGZoqdeLOvr/9Ler1nueIHjCaZNVeLx0f6+OmUyhmnCST3rMM7
	67DTtviYE8kncP8+jehCpBAKqoBxxeUQIRDX2QraDfc47B/IzqAj8Pn3B3Y3orw4o0XXlu6pcvW
	/e53s2wVOUjVSUDlJJuONY/hI3nMK1U/YILKG/4KvcN/TzFQrndognW55rQLeHWFCgqWvZlD6hE
	CyDBCBv+UB8DZesEIbZ8x4n3oqt20hhIks+Pt/cyZ29w3I4Sn18nXPBmDChvAmlZH/akSlccONv
	5AtIXiPWp9S95Rf/cKBV5LjL6TBWxde0WMmM=
X-Received: by 2002:a17:90b:380a:b0:39b:2b10:d05c with SMTP id 98e67ed59e1d1-39d709e73a6mr10263181a91.5.1789047025994;
        Thu, 10 Sep 2026 06:30:25 -0700 (PDT)
X-Received: by 2002:a17:90b:380a:b0:39b:2b10:d05c with SMTP id 98e67ed59e1d1-39d709e73a6mr10263086a91.5.1789047025472;
        Thu, 10 Sep 2026 06:30:25 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:30:25 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:07 +0530
Subject: [PATCH 18/34] arm64: dts: qcom: sa8540p-ride: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-18-90a252ddbbfa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=1146;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=CXfwjCEmlTi2gFNzojVj9OvmB0X6o16y8nsd8vTgXLA=;
 b=AWbH2geqVWHeiHrDvQWT133KWTzDZwoIXWeF3Vp+xCdeKXhE4ahjNbn8oOmeTrpBNpTf57pL0
 x9JlmzaDR2AAlzGHbKuVMR5f9tr2WTSXAQWEwDzRAeOrlRgjhsnr8IN
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX/+fUpDvNw8JE
 xEe4vDXhZ/7n1ENbA4bVD5J0CY/Ue+46/x6VFO7XYobwcCVIcnBipc+pFGFWQaqSnm+ex2D9YPh
 vU7geW3Qp53t6M/diQPX3vaC53zbTtCpsFEqa8aJ0IMRM3dim/Gafg6blr7+5LJx2QWqZdWDg9R
 fo9oSdbuKm7I7Usp13T4Zo+ZYjn8hDZ9veRF4f3FLp433r8acz7Rn9Q7Z8lpfEfnvipebQGjMkI
 ynmcadDgoZkhRxS2G3HUGSTw+VjRnQVq+BA4BgkXBRoATOEtW3k6D053GN6CBglXaTtAtwGvhz0
 IW/4fEznMb97NRlBVblcUWROd+KGXzE7RdJ5RNCc4bVvG/U17szNE7Sm3Y4g8DJ/aUdMvSuZo3+
 WWo0vj80l3tBNxZITTgwJPxCZP+gEX/emhH+55NszFq6ubbJmcLvAQ5VGp7KGWbm5rgVrni79Nq
 oUiCbs8AQiXUdYS9KLQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX14vRujCnMR/A
 3jMcGneaOTmfBCPe714RSpYS4gNzPbhrEfbXOXYfdrtqLl30na7iGjqluJrH0tEZMUUAmvPDtpa
 Q6m61xtEc14zvdPl9MciBMFe47jafp0=
X-Proofpoint-ORIG-GUID: W_1T-I7_k6vl2erfCEsbcjaFJm9Q85Dt
X-Authority-Analysis: v=2.4 cv=VONIDNPX c=1 sm=1 tr=0 ts=6aa2b0f2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: W_1T-I7_k6vl2erfCEsbcjaFJm9Q85Dt
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
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
index c72faaa0ae7a..e85d78ecac2e 100644
--- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
@@ -374,7 +374,7 @@ &pcie2a {
 
 &pcie2a_port0 {
 	reset-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 145 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
 };
 
 &pcie2a_phy {
@@ -397,7 +397,7 @@ &pcie3a {
 
 &pcie3a_port0 {
 	reset-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 56 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 56 GPIO_ACTIVE_LOW>;
 };
 
 &pcie3a_phy {

-- 
2.34.1

