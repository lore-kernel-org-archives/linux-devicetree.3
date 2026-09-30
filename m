Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FFC4F55A4
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 13:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790773351; cv=none; b=cpPz+W2EG+ZZYGU44r2rBuapvklYeJhNpq/IKcDlzwyQ+bcfVdflZiKUMq8hAhg5QxCicCdNFF1kKpRBO21xrrIgBlnMosmbD1wTaG/0zXpshLvVPLT6Ot6G1fpYrK8h0HfXvYQgMSPiiDmfMJZ5oM16oSZ7UlAM81r92ON1tck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790773351; c=relaxed/simple;
	bh=1oLmRXw1aiff56t97MyiGav/WunYNGWzsBca3a4STBA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lKtE2LrIDSUbhYnrEF5colycbl2BZ4YP3TiTO8stpxFLQPZkqMSr+vR8lK+YhTW+JeYx4XS2G1FBYuUaZ53ZrsPgUUwzrpklxcSA0uTu0oBLCIv4REy65b0/Sck51e7GVbhtRKngrkyVDmCAql38jfGJ4vMWyCRVne4YCpyOfaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VQB/Xu+h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GMX4plLC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VQB/Xu+h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GMX4plLC"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7hPo2678407
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 13:02:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XEbaopQ6+wW59DlyxlN8ULrKUgq+VC36bqIr6pLubcc=; b=VQB/Xu+hjhRbYze1
	7uWeE8uD8dtOSe13EUfXkCY5CHOs4ywen3CQXfAxLRyBNzYW3XMfgWVUcmjBA8qJ
	mJhNM7cy0bhAaZS9e47hvVQj66DVFrZyV5i+TSrlwAhRUV/0Qk03b8gFLDWBRPUM
	L6URpiute9puGt3lWnepdYv1J5KZh5ybVRTEEx/YMVhRZRaUqrL/t/cLcgnLEIbF
	QpSCnv6ektqhKfMDZyn/O/fLuq1t+/8WYgjnQDg+M7pEzX7Ex7AjLFrEJmsXKhY+
	VNs88j0waaf7/MhrfahZHFfzjkiVPHAge50cUmrrQ/rKYQ2foEprl6ouo4e61IAm
	jDZxog==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0smjjma3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 13:02:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a4a0017549so2765762a91.3
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 06:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790773340; x=1791378140; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XEbaopQ6+wW59DlyxlN8ULrKUgq+VC36bqIr6pLubcc=;
        b=GMX4plLCTX2CApNf0PhAKpCkkqsAwpm8jycexTAw89Irv6MpvYcbhzEk0s1GQeNwXI
         Dx+/uIbj8Jz8JPKCkuIK492jr+9u8ABCJyUkPYeKFCW3XnBpEwwVN6hKnKyWXTigY6V2
         aNc0V5hztuDopip5KBgilTeZBvqWnjxxaQkUBIa1AaqRsqJO0OKkiE1KJVbmWF80lVJr
         dVzGmbecZSZGsL2rXNxpu6AAmsmkiRsh4mdjPXFwwiRFvvdW9g6cRj54jZkZD8CuS1Kk
         vbvIVjLVB95YQAQ/mD6D4mX+BYP6LUN3r4xuK6e+/Rl+J/X9gOvoECpbIjrMF5Ju3Bie
         /jvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790773340; x=1791378140;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XEbaopQ6+wW59DlyxlN8ULrKUgq+VC36bqIr6pLubcc=;
        b=YBO3dq2kpCGv+RdhaCF4TALziWxzEN0uyoyBVZtsCbdr0bfHDNRhLHAdyAzfbzlhWg
         8v7zDFVYcZu4DYkCpuUZpO82hSYnVQO8Y2qSqhJ4MRnHYJZvK3M5x9rGZlRD4rO/rchP
         m1O1FFPypxmoUKnQTUbsOFK9Ity69oLYsJa9WITyszTabtxZRI27RQxHH71qF0xg4Ael
         9RAe3IIfIZENsZxRIw8ikik7csuFpXiEn+kw4S7joCDsNqiwvahBFt9yxupRPnmgkAZK
         8+67taU6aL17xHGW4CU2C1HeIsKMZE9d5oL/Mt1+xUw9XjI4ViQjn2oERA2fcdLYqYGH
         wgrw==
X-Forwarded-Encrypted: i=1; AKwUvBzAFUOn40NmX7IP8vSZb3G1VB6dd8PiOH4I+KwmjJE/zHJJJThnSFBUuKLQarAq9+agco5PLoABpfeq@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9K0UZXcyy/QfSkTr9rEkBFNkpuSZrjytBJMBOA1iCpVFQKUA4
	1QuFZ2fP49KDG6P9892OJULCwTvqXb+t00Tq9HzE8bwzMufEBGKOeOAeq6N89ZWWuOFrrsbSFv2
	yZvZgJBxZ5uZ//GF54FwQJo7IlMSxFuWwqU4VtLECy6YoSYIULiIbqpU2oHWlBn+8
X-Gm-Gg: AYBFou1HGzYsjX6vAh/cEOqrwGLaQa063ZqoSxCantmmL3wOsMI+v5IJqjOSJTslPke
	Dqbx9cZRFBNDXwHz+Gos1d/1wwh4j18gSNBF+Dbqe4MgYRCsQGc5xpwUAsqUTou8ziQnPETAsb+
	IU6YueJFp3zymx3Cxvgxb+c2T3Hit/RtjLxCQyII+d/5CmoO4VGVDGPDwJb4uQrIWQgjYs5QqxT
	g7nFumpKhjCjBXQA2saydBRrYtCsVJpGV0MK69/TKwpMkI3a69UF8nvqvDxa1LjV/YtLoiSXodr
	bmssiEnjoQYxh8HBSVLMmGCpPC4upxLe9uD1I5FpFnHYzA4obc9s+bjZBUQNOjWKSkfFmni2Df4
	kShOe32PVW8NHIog=
X-Received: by 2002:a17:90b:5848:b0:3a0:4066:d3b0 with SMTP id 98e67ed59e1d1-3a4d1913a7amr1186259a91.59.1790773339902;
        Wed, 30 Sep 2026 06:02:19 -0700 (PDT)
X-Received: by 2002:a17:90b:5848:b0:3a0:4066:d3b0 with SMTP id 98e67ed59e1d1-3a4d1913a7amr1186211a91.59.1790773339389;
        Wed, 30 Sep 2026 06:02:19 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4cdf25c6csm3426058a91.5.2026.09.30.06.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:02:18 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 18:32:05 +0530
Subject: [PATCH v2 1/2] dt-bindings: watchdog: qcom-wdt: Document SM8750
 watchdog
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-sm8750-watchdog-v2-1-b16fcda275d2@oss.qualcomm.com>
References: <20260930-sm8750-watchdog-v2-0-b16fcda275d2@oss.qualcomm.com>
In-Reply-To: <20260930-sm8750-watchdog-v2-0-b16fcda275d2@oss.qualcomm.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790773328; l=908;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=1oLmRXw1aiff56t97MyiGav/WunYNGWzsBca3a4STBA=;
 b=qvZIWrmd6WOFbbn5yUQ7Okm7jBt5IvJQmfCDnDf77OvcRdlaFzEt+T7VxBRYDOFEt0SIwU47c
 ZBjZVyzcGW7DE7SFM8AQIxWXhz7r5v4l4J1bQGgmVoVB/n7kqROf/54
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1MSBTYWx0ZWRfX2ad0Xzj4XQ9N
 MtWMNgo1N/BCRqs6wxFs5KuvZdhMAv7FR7pxgGYSEWJg3jLvfz2jgtLwurKuHoExpiXcbA/p0OQ
 zAL6zYA/Xh9gxsVnrgDyPWoiQkaOcBg=
X-Proofpoint-GUID: V8uckjAYN56_n_StYE1L8VWeFXrEFtZD
X-Proofpoint-ORIG-GUID: V8uckjAYN56_n_StYE1L8VWeFXrEFtZD
X-Authority-Analysis: v=2.4 cv=KfxHIgYD c=1 sm=1 tr=0 ts=6abd085c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=-pL1Pet8fDdhfHljwFMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1MSBTYWx0ZWRfX0rJJevqLzhG0
 0IT5hphACDzJ9Httmaspn2nEaYNv30iOQhMWaN9EFVYdNVQgKJqjNKVTit0dM/KcEweLgyDOGJ8
 zUN5FQweTf+6CFyS847N7/eZPKqtnTPUDMaMUCXxGXJtxd+WC0FQkMqyBb/RNFvKf5tOgB8eMmY
 pgmX67B9hlObWyV91Km3SgxvcodTyhb3yKcqLpwGHkVITAqFsepwR4wGzQ+4QxHvEKpL8Nu6oQC
 FO/oCPPmxDWy0QFxkWwP8jknLP0AUxy1lSapvCZbeRnBSR6P4UULUhrY8fU/tPLvj+OlY3x8/yV
 u4PRYvt5HMlufjak2F/P4MFTtQ5emvrKffw8Xnk7rmw1+d6753ca8l9ouiHiv125G+LbmdDfI29
 4Cd0bsln91jRK6WdF7MhrLKLi3IbOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2609300051

Add the SM8750 compatible string to Qualcomm watchdog binding.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 4ff61102e407..8cd8331608ba 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -50,6 +50,7 @@ properties:
               - qcom,apss-wdt-sm6350
               - qcom,apss-wdt-sm8150
               - qcom,apss-wdt-sm8250
+              - qcom,apss-wdt-sm8750
               - qcom,apss-wdt-x1e80100
           - const: qcom,kpss-wdt
       - const: qcom,kpss-wdt

-- 
2.34.1

