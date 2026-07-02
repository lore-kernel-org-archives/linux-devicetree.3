Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B908481648
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 09:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985917; cv=none; b=CXOF9+/DWcscGYQqzwtHfQHp5xQ9tLJ0SfcY1o5+xgnx8xLLH3dU453hC+KU1oSzNNHhGJUXJoCn9x4GOVBOOtw6x95m2ai4kVwnXlUkhJXDo/nonlaM7Kf0AjVzIllnv60gsgwYTvJqW1Q7w70s7hM6tCuLcOtJgtxKrPXcyhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985917; c=relaxed/simple;
	bh=zrxJFa4VPwsYcw8XwQGDYVBpixFGlco1FfRkuJ8EAgA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EsEveJB12aGJhtiBmokxGiU1rKpcQ7DlWoxOEvDYf7ruLC7wwguYcTOVu9OmLGX0M7e5ktgcK8osd04IhaEX3YLEeBbS+ARbedfJrnd7bP9FQAx+up6KIlYg8KaUDq1tlNoAZbNe1xG/RtY+g94CS/3w3ciN48rwhO/0Gklog3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jpRsmq4t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fFuZDmzZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jpRsmq4t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fFuZDmzZ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629Knp24116732
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 09:51:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	755Kmru2NNLSqWs38B8De3HgJThqhmh0GCRqXzxW0lM=; b=jpRsmq4t/cp/kxQK
	HLI/vN1cBYfP5j7CzPNM4KXL5hC7zTh4lIKd+OSTRA8WxYrnLcsGCTG/BiUdyhG8
	Fhgyb43+jZn7VggmFRfBZbsbE4yrW74emmSa0Y/uh9Tpi3Leg9/+m2LJsx6wiQag
	ycynclZHqPY3U7qzJBOVmFUuewvHGeOlh86UgbQ1RF4oDQ+zAbu1EsUeVJfwHQHz
	fNRTP2F+GVliIZxw+CLGAuLK9zcehya5UuDrZT7RvAgR1SyFI2+jBueuKt5PMc5g
	8QgWqIakNWbgr+DgNgsCvYG2rOEyY+pYK1dZfWP5Ks4ELUyYiO5/xSBnQZIkkDuE
	lvejkg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n9bg459-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 09:51:55 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84777e9b51bso3171222b3a.2
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 02:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782985915; x=1783590715; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=755Kmru2NNLSqWs38B8De3HgJThqhmh0GCRqXzxW0lM=;
        b=fFuZDmzZtjiLjab4X5om41m6olxx+q3owYCd3eY2jN6lJcNTWCpdQCQBG/iYrgPcF4
         5BX+sjUVe6mQxwtysKnGRO71x8YewrkTLQ093+KVVDjGBuSzvxRMg0YKVdjAgDm5wVqZ
         ICyDHgO5L8b9tJRU21rRXnfWW7wp/r4R2HZinq2J6IYpqfEV/f0JsLxcG/EIHAwhexJb
         jtKc4ZcgRTLcs2XCW83EhnxHT4ZXvCfGfDg/SkX5V0ApJNuupwEqKsdUns1IHwXnXlgb
         YjU9jiydSSPq9NhilhF3N3UfizqAxLNMp16+qh2hJZ+eWZzC50jLzNLrc5vLKJmoiOUY
         lEjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985915; x=1783590715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=755Kmru2NNLSqWs38B8De3HgJThqhmh0GCRqXzxW0lM=;
        b=fvS0d+ZKXgKTvmtZAqJqvnxOZOmYUpwvEWf1738jOcdZ08L+qNN8EetrYHW33FXfL8
         FKG4kFWNy30+fSy0xqCwXG4s+mbl6E/4vDGd4VCJan9VWVBLuWpyDap3bxSVYciUwQd1
         F36cfpOtlx9vX2G/GKAS3XZb7W/v3DLXMr/oBOHpCgOCsFJdzU43/hQ0qqHABpFsxr8t
         jIDY4Avrk1h56hiqICezfBiQL95SwmOQhMN2N1M37q9m/+NDaZCJXArl743w41+TLsaC
         GtawQD5XyVoY7wklzDBN31Akb4lS2fiYI20u8/hgs0BZmNlmTjI3iWAi2RtcJGunGv0g
         NpnQ==
X-Forwarded-Encrypted: i=1; AFNElJ/6JnZFxSMxnklpp540kn1lMFFn+qZlyBIwqXjsdWpTzA1mu5zBbZeHW8StLtKRN+dGdf4HLX8j29kH@vger.kernel.org
X-Gm-Message-State: AOJu0YyBt3I1b8xIUQXNo6ESJGF+WCtslaxsrVSwbftVOGuespsy9zeP
	li3oXB3svrv/wrSP7z1s71JsRC8nfxM3zWe6m0cJdOdjlMvqzF5tZVCYHDtr0xYq33zuNe3iSfn
	b10GW77bZ5BsIN9TDrgPMNnMJHIqbQs2GIwXZ0M4JYz3o7yE/N1r46rA0ys+pnkM3
X-Gm-Gg: AfdE7cnuOc/zlZuXWRRtCOsK5BoY+f17+YebT/y+++44i5jQKRhpht6xwO3n8vTVsG/
	uJjAUDqypo8liT1TNZF2n9OB7t0rIsrh6JEUeGyEZwT0mQ0y76u+VkAHht8fVBqPjf7Vy4br/0Z
	yfd+2rA3QXLvKdSVDW1dAp2hBt95oPbEPDcyKxbA8GWD06GqkJohLkUgvTzhjWJYD47n5hx2Qfo
	03JjPWNCvjSHHDOAuGa8lPzNa4rOO+rFcVqa7+yKBY6ACmtQGDNPfWHR2MF4SxFWsRh2Bn/8M+Y
	tghCMZpjHyuQ5hIxftBkB1h6+s280Ryjtrya7Y691PFJ269xwjQGA5yi9LndJ9ertWsKfMqKSoL
	YDq36Aci4CiBDePHKG+VchT/MAA==
X-Received: by 2002:a05:6a00:908c:b0:847:752e:3631 with SMTP id d2e1a72fcca58-847c5168793mr4391062b3a.46.1782985914511;
        Thu, 02 Jul 2026 02:51:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:908c:b0:847:752e:3631 with SMTP id d2e1a72fcca58-847c5168793mr4391012b3a.46.1782985913936;
        Thu, 02 Jul 2026 02:51:53 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb78ee2esm1110051b3a.24.2026.07.02.02.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:51:53 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 15:20:53 +0530
Subject: [PATCH v5 11/11] arm64: dts: qcom: shikra: Add
 gpio-reserved-ranges to tlmm
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-shikra-dt-m1-v5-11-f911ac92720c@oss.qualcomm.com>
References: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
In-Reply-To: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Anurag Pateriya <apateriy@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782985846; l=1832;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=zrxJFa4VPwsYcw8XwQGDYVBpixFGlco1FfRkuJ8EAgA=;
 b=I5ZZiEPU5ocYeFh6TIaMz/FgAsPVoIRMynonz30ynq7Dr+IIy9F9bKY74X0pIfNiKV7EWueOq
 aJGqc0zwFjNATrCR14kATNFy8eVmtsN+hrbza266iZXRgLbeHHwdbQc
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: tP6aWaaq0dbbztsjkoVfIv0qTlgF2LZU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEwMSBTYWx0ZWRfX39FIZMWifezk
 qb9fKHi6vAp+zV06k1ZSJ6bl8Bp64Hv27YvEkukbehEFJ4PTvrPMbZmKflNwq5L5u+JHu1bp94F
 IUsCrDnDqFcvUYK+62umzw9ZOP9OaKA=
X-Proofpoint-GUID: tP6aWaaq0dbbztsjkoVfIv0qTlgF2LZU
X-Authority-Analysis: v=2.4 cv=bOom5v+Z c=1 sm=1 tr=0 ts=6a4634bb cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=wm8cDCIBuLkz8hnEg_gA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEwMSBTYWx0ZWRfX6pb1bxOdi8k7
 7rt2KercnPta5IvsJfcCzkWNIeQfbrqXpIjpFib9LYBJdskv7jlYG9OTnjuA+HMFYfHAm8YGkPU
 10+p3ORfcwMXPz8AbvBU/y9WKn9h2x+ovUzI4L9HF4+/3GwL6A9U4Q8FH054eum00L/pEPHna0K
 1WmB6zSpajS3f6My/dqsWdgFqqdSCapamjdrCtajPm9nF/cp6k7rdz2AMwyRTQbiCnjE8H6Xxz0
 9cMfwb4+qcl1zPMXCnX1a+EE3+PgqW3FGYrdX6KQLq8wj1ugrM11ZYY3C+5Lk57eA8oUOydtevX
 Anwm56vsC4HgzVREOoXTO0z5/lD+YmE3TkCdiJSh95hZB3XjA0DxDElGAguDFZD/srS/9j3wj+l
 AzxFWLCBh2FLE9euVSxCShzyMhMCqYzr2VBEj4U+Hd5S8W/jPhF5wG9GLjK3D04nsH9JUjzVReI
 NhwertFrO6qCcgbmq/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020101

Add gpio-reserved-ranges property to the tlmm node for all three
Shikra EVK variants (CQM, CQS, IQS) to mark GPIOs used by the
SoC internally and not available for general use.

Signed-off-by: Anurag Pateriya <apateriy@qti.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 4 ++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 4 ++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index c9409ab0a3f1..269e11bd44f6 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -66,6 +66,10 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&tlmm {
+	gpio-reserved-ranges = <6 4>, <14 4>, <30 2>, <115 2>, <138 1>, <155 11>;
+};
+
 &uart8 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index 58fed6cc5925..ccf8f856e994 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -66,6 +66,10 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&tlmm {
+	gpio-reserved-ranges = <6 4>, <14 4>, <30 2>, <115 2>, <138 1>, <155 11>;
+};
+
 &uart8 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 864c0d2636e6..743979b5ed5e 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -74,6 +74,10 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&tlmm {
+	gpio-reserved-ranges = <6 4>, <14 4>, <30 2>, <115 2>, <138 1>, <155 11>;
+};
+
 &uart8 {
 	status = "okay";
 };

-- 
2.34.1

