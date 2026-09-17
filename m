Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B31A4F30D4
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646202; cv=none; b=JWrf42tIq2rIUvMsjjD7P78rxXLIW9UMucfa4mTQd2CbNA/tmXYQndAGilolDl3CS0fdkygid/P/OuqdGhDKZ3WJUEKc6mp1vxqz3EW3tCbq9/eqGVEs3lb/aWZLMI/ijXpEgqPq9jPl6IZMkL0mnQTLykg2ejBHKqJxrUzAUUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646202; c=relaxed/simple;
	bh=CXfwjCEmlTi2gFNzojVj9OvmB0X6o16y8nsd8vTgXLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FNTV2gEYMeR6mS55uceAOym0kx4LFk7VEOHO71n1kTuVLFSmLpHUZBL3aql9v1ZKZnBRZGwuYhh81F2RCl4O4CXTXuCvscKSrRlJd6nVM8ScUHZgBNtPZnlcvlf2EmNP/678NO4dPYRlDFSSrJSRaLbFGBVS+GLA2OX/3XMFfFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iYHV+jMh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HuOjxD2b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iYHV+jMh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HuOjxD2b"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zc7u2410467
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:55:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MzbjLgLOtqrKkzbwT3kWbG2jnIc6kGhA4/pYWT1q6fY=; b=iYHV+jMhm6hDksG/
	BzlsKGE4GOIiCfXvdbYSh4svYvQ5LV1nCRZPwdZ2G+tIwQu+IykwxCw9kB7xTfnz
	bfKuyPqIdTXphINydGn7nQWAoowWuA3nl8BZCiHa5C1pkEvFu/05L4hm6EEW4RCI
	O48su0JQY0MyvjQjszymj4eEQgQHLUopLb1RP0BtJpg8bv/j3uI99LqiDtSThh0S
	dN/cjY+QVNPkaIV9swStK8uB6HKz1W9Kxkt+9QzQX0xwDeuiJzcHBM777IuCBisR
	dI7eU8npMPTslI4GbzgsSroLGpI1tolQ50xvMoxnSOGpByHQYIVGXdBtDmiYTqQe
	tZgwpA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdd6gmh0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:55:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc51591102fso1074315a12.1
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 04:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646153; x=1790250953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MzbjLgLOtqrKkzbwT3kWbG2jnIc6kGhA4/pYWT1q6fY=;
        b=HuOjxD2bFgoW9uny+Frt1I0fg+CH3uujB3cLO1QTVsJQ9LRXEayt0zKxg5LV+AXF8i
         0SV2sNWFD8W8iHkYJaQ7QXsF83dZ8OWh87U+Hy1jruS7Ju78OSQm9ZS7/0ZrCezEQm59
         baVKJv8SzQJnL+ozuixSVO6z4DJZjfok6gPk/oYu33jeaOFimOYrHJ41rne26NeoAG0F
         M9yxcWjvy6R1XyZoplhdUWYee75XPoieKTGHMfGAbWmNwh2tf9qjQjBJsjjuAqXZpG/k
         ZzGHxDMLLsvrAPINhx4nawZpCwItsFmbxyZZyfinv8wMmlUAWWaUC4s2xMWQ5Hy1RAZs
         NS/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646153; x=1790250953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MzbjLgLOtqrKkzbwT3kWbG2jnIc6kGhA4/pYWT1q6fY=;
        b=suC2Q45NmJK+qoZpz3xtlIufF8P+1n/Twe3qiu1X5URtBwMNUBefXJgDkoiCimtIw7
         7iRCxda77idfaeAOr2/rtR6v5xQlM3uIaGyrEcuR+Vj5u8C39tsBtPidf8EK1j9HbmH7
         8ZiTszX8FhgBQ4YIChm5cjdV/clQvjMNXRfePNB5qff+wfaUr/2mYyyeWPBTvhLGH+Sx
         dL7adIVrDz+Gbm7E2pLh+u+eOosclSyTcxNJhjgV8r9I0inAe7cOn/cpAay+FwuZMhI1
         S0Rew0aNNkZ0CYEfnujlMxev7q8Gn5jZ3YDz0gBQdJkmHcca+3Wq+6phjpR0t+jtyOPv
         ysSA==
X-Forwarded-Encrypted: i=1; AKwUvByLtO9qGu/hVntUXYMySQOJHOpZxFurrPwyMQVwiFRIXHipuB8mAOmvK2ZH4Inxte+Qdi+Qf9Xsejxf@vger.kernel.org
X-Gm-Message-State: AFuF++mO6aNsprMEoV9OMSNevA//eGFmVXN6n0XcVjSe3IlyMdfPBVDl
	FcWmXbPCDuAe10ouqIPVxJAwe3vQCvUdv9ayAZSi95vS8LcHwjuS8Dwmvqi9yEi/7fxRkpBOV0f
	7gNtCU4JPetEKfgJrL0xNWQNdvPkTnxg4Vwez5OkrJg6ZzwoTY5/XYZPOqtvc4Bv5
X-Gm-Gg: AYBFou3gg4uW7WK/e3i+06ZTO9K6ewEGDnhisyCj/dsROMD905Gv4KZOcPIWVNIIoJQ
	NlyxSOsiCWhbDkXH4jNOoGLqpFHoQpiSyXQ0G+LWSEK10snuvg8X6YQNd0UPXhQMV5h3Ra3sxDc
	l3y0CNHQJQNnmX+w4Qd3je6sG6IeRpy9pWqpaxUM62eXVZMTKiVKX8DjvVyE58uZTZqII+0kZ7A
	wRtdiIgOgsEw2mN7rDdqj3M2+0zdY3nzC2sV4Eq85m9mzRN6Y7f54yGaPn/0Gae1KcA7a4kANMj
	whGM9p9NVlXR/Y/zCdbO6/unwMEqBUU6yQIP0ZzVBuoUxSy6tZHbj4qcPJhgHnkpacIaNkzgXdb
	+DRhBjMjgsMd98WJpmfVA4woPEtxoNzv2LQ==
X-Received: by 2002:a05:6a20:9150:b0:3cd:9bb1:c6f5 with SMTP id adf61e73a8af0-3dd5f451226mr15909464637.10.1789646147482;
        Thu, 17 Sep 2026 04:55:47 -0700 (PDT)
X-Received: by 2002:a05:6a20:9150:b0:3cd:9bb1:c6f5 with SMTP id adf61e73a8af0-3dd5f451226mr15908982637.10.1789646143537;
        Thu, 17 Sep 2026 04:55:43 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf596e1f6sm18249500eec.1.2026.09.17.04.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:55:43 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:24:25 +0530
Subject: [PATCH v2 17/18] arm64: dts: qcom: sa8540p-ride: Fix PCIe WAKE#
 GPIO polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port-v2-17-0d627d0856d5@oss.qualcomm.com>
References: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
In-Reply-To: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646072; l=1146;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=CXfwjCEmlTi2gFNzojVj9OvmB0X6o16y8nsd8vTgXLA=;
 b=000j0/D/aobzbABW/wojU5I6SxrjFzYAG43EeIJIZzoE9B58BrpmSN4gognf0nvqn+NreYSLg
 2ssbeNsLhjDCykymm4hKgwKBHXLG+NP0VBfUAClQvES/U7SaFR3lUtA
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: sSb5sxKVwiKUBMaNJ7b9VmMwEG_5qMtN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX/bWhA3bvkQey
 z1ylDhrUuCIrydq/RKLNlr6kRkc6630Vnafa3dIPITA2oqTlcU2DQp8dRrobVvff8uQFb89v4SC
 UX4xIsPCW0OOPfs82vsWtDh9evxusccvSn0L8GVf2jbRPq5jb9DJo4O4HWDXHbwlUpTW5+Q3+/U
 7w2NwApkWRAMMBECaruFnB3QXc+yGmRnOKEpqh6X0zqeW1PXlgRrHGnb6M7znalc5FISSdIkf9B
 T6tCdsm048UHX3WOtrt9YIftyc1ad0LiXs/x/G2AADNnREzSIDB6Q70mOvbXwyvuBh9wLqfpIfd
 ICEhv9Q9eH4FL5ECfJLRLdGAXDudM6yv2wzJq2YJ/IBJhVSxOXonTQ5es8b5mAdLLPrnceZUTcF
 iXAzBPzm6H0uMPoD7R3yY1PnEDnwNfjQv3D2AxueY8+QEgVCwJ8YIGLsZduTWP3pZU6t0f1ZpoA
 /GJlQdW0LmB7QrR5+Wg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX2TGy4Qh6qDmC
 e37UzYdUlJ03Upd8AoAgKYBJfNwoNoS1h9HtnlM8/LaBY29WvVo4jR3tNGhmwPCx22UPEdRHwu/
 w1tlCAgpyPXnF028oSe6HpOLU4UrlVc=
X-Authority-Analysis: v=2.4 cv=GeOCDgXL c=1 sm=1 tr=0 ts=6aabd549 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: sSb5sxKVwiKUBMaNJ7b9VmMwEG_5qMtN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170166

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

