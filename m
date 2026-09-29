Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADAF4C224E
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 15:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697249; cv=none; b=cehBPouLuquYNAM87jtHxI3b/3lTCCnfVr9ERpCE4FvNWQDbP458tNfEVbciRAw0dPXSDiPPu4UlI/Dg37Xo8a0zGEWZ8Qk97Z/boL3m8O/PwFIpyChfnCz/gRPAUecspMrGkqJ1uAbDhSM5YZroz9YCfj9JqXR7ItYaRawkVtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697249; c=relaxed/simple;
	bh=FEmru5PIr9EHH4bmAec1XA9EIA/816JFlNZHDbavUgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DJjnSQUlYONCIdlJ0Z960Tw1MqNuqXhLZ2niBJJjrGGh/ifkrBVnISyGCBEZTAPgJ9q7cMr255e44bdEjxW7TXK68GR6w7Y6E9GoNEg9LBwIKfPMp5f1fvNjkSNIrv5YckOl5rK044RMTp9lJhirAHtJTEqydUTXyoqSUQKR6BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A27GgV6r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c4AhWbYG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A27GgV6r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c4AhWbYG"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TE5mYW128879
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 15:54:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NpekZf1ag4X
	VU0nJOyoaS3NUzdoS3+8KgBabEKwH0vY=; b=A27GgV6rZPKmmoeeSfyk83EZphs
	6ijsj9WzZi8KoCnX24MfNw/VoND52iPgzR8M2OydQXEAfoJ03cV3R57kFihY0+BR
	B3ZRTfYXR/rNd5cQXBGVVk3vxP2GWtOwAcuqu1cnf3P82wWmAvrfkwBlpR+8EYBt
	RgjM0RNzQ6k+ZOdkKhDH7LBHTT7K1LH/uNtcO//AdsVvrcEbTjrIK1Xg0cv6Fqgp
	yyF1qAPcLwSJClr/dGJHAJGgQwIqjVV+AfBKPe3RoHmlFs0ziLRkdMKiP+bVAwgA
	uuszapncdej7ggujRqPY04cL/LRLOdyiGMLEjpWeWOIWldlzIOCliJMskpA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0eswgge6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 15:54:06 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1438492fb40so1117992c88.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 08:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790697246; x=1791302046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NpekZf1ag4XVU0nJOyoaS3NUzdoS3+8KgBabEKwH0vY=;
        b=c4AhWbYG3baEeINjfi+PdZgTYIbkYYjuu2Av4e6W1nYHJZQWCZ7Zoom1AmbNnG+d4O
         pCFvXSoyHXVItoz7uB5fA9aOHXvVGpiuC4Jfos/E97UClJjsvokc0r5dWd/RngmXn+zN
         qcDtc0eaAAIJabIuIVa/+Zycku14mi5UyD8EJyqPHNpYpNVlx+JzXX+knY3j6JXMf1/9
         Xvrmuq9GAzqlkmjvkTGK75RSxOhNjD3vU4EvHndrRRJH52b+EfFbrZqdwCBg7pO04VY7
         l9EK984TyO4jwxUgYaQ+dJNJNP2QkBa/YtgYAZIxBYuDSYMti1M7x4OMj5jz+Q7dw54C
         rTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790697246; x=1791302046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NpekZf1ag4XVU0nJOyoaS3NUzdoS3+8KgBabEKwH0vY=;
        b=iSah9zxKVCZL+AvILH74zJhEOnRgbLeXHzVfqmEjZHismC7+5eQ8tZek1EndINWKW4
         SvHINn68cd8BlrNwwKBd8TNhFKUpVRwyrYf1WWQELWQ8aQTUblljfGZl6DD3PVDY/k+i
         ysyF8Bxgpah3OJHrEB4phlH37Dm6LkviAYAbLGRYdzWwvqTkjUZGheRU0Vvco6qvBSHe
         9YppJCgHOG6spTsq9w6nIf6eNIfJPuOixsOOZJajHGkSNcAOiHOoUZCzy5JMjIEaNY67
         UaxR1JjWB2Yox6cnCmCRGd2kjoTrAcPTg0RooWt61zSSIa6JAmKPuVlKaVfZ+KCLN6VN
         ssWA==
X-Forwarded-Encrypted: i=1; AKwUvByBCFfSlktFaDKgm82F0/RE8ztnA3o9LcfZ785R4LNQkY3ucssvOq0n47+4czhPvhlI/3oegmznnkGk@vger.kernel.org
X-Gm-Message-State: AFuF++m6ZrROJvNNMhY1PIrKnznPI168vcUO++KBGsT7dlkBz2rrG3vX
	6o8sCki6RqIDhMO8TB3ygG71sfePYvRTYkPR32hVaKaLLjgSmenn0ZZmEOZGRXVSHDmC8HHgXez
	lwegur2RtAETMKUHwNzKTzCSmgPAkpD8ri/ASgw/86A66EremcMI7YwpKPmfKT24V
X-Gm-Gg: AYBFou1s8NWjNJt3WYyxjb6dO1uS/w0smS/ejmaZAUsp230GjYZhcs8crPVwz0Z6Uoo
	CDtX7H6Vhfygsl96L2phn+2yhPdO+X8Di7N+YgdnG6Vy1bpW+jgDlrmUx1HNRNuasJBmLuc/d+r
	Ru3ChnBua2tNwfhy/wpx5ah6jWxObIbfABSqMk8x58KY27/H7QD5EwjmwCtgKuInrY5AABjafZe
	nUbB5465oqm2f/THtwRWaCJ5jVRdgWe/LkJWImBbRWgXz8I5P8r3K3xTbyx5oelhw9Oe0Tuu5Ha
	CPPhBD3kuqCVIwrT7UYK1wSm8nIQie4MHSzoIeJbqXlOsdzwy16ji9Y+WZdaWgubmEb0CCBIdo2
	qrytzsbm+AXy5nweKEwy9Le9tIilx/gYUaoHiuMQjDQ+UaCqqGPX8HrRaMbQ=
X-Received: by 2002:a05:701b:2618:b0:143:3617:c595 with SMTP id a92af1059eb24-146cdeb8ecfmr9841995c88.1.1790697246245;
        Tue, 29 Sep 2026 08:54:06 -0700 (PDT)
X-Received: by 2002:a05:701b:2618:b0:143:3617:c595 with SMTP id a92af1059eb24-146cdeb8ecfmr9841959c88.1.1790697245442;
        Tue, 29 Sep 2026 08:54:05 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14c64e7660asm200213c88.17.2026.09.29.08.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:54:05 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v4 6/7] dt-bindings: arm: qcom: Document Nord Ride Embedded board
Date: Tue, 29 Sep 2026 23:51:51 +0800
Message-ID: <20260929155152.1898666-7-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929155152.1898666-1-shengchao.guo@oss.qualcomm.com>
References: <20260929155152.1898666-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2MyBTYWx0ZWRfX80vCFj5x9wxG
 d3s9ymZtetDBWZiSmDUS/eXsD1jPmtCprSwYDnQp5cH6VPBKm/9hGOO3TaHYw+7MVwdxlQ2FkiP
 vv3vM+d2ggzkqle+4CDbksiyxLdH5Y5YFwkxWXCDv+mufyXHo/8syOuToHf0auFq19yQuZi6LHP
 7YIPOBtnzu/czJ4RpEzS9njatdLU7K7/BIL2AB920p2h0Dn55rW5aQnmREmqz/MulWr7OXZf/w6
 Jcmpd2iwJEFXZnGtEFY22epxGngToq5BwjyX4bHBLtDc91LS155C0MsjAxHs0M3mf3KVqFAQ/K2
 JtmcezjZucsy7cHW3dx7uK4bGB9OKZbWscT7lHfM+OnEugUCNToz6KtSvYyePiitC4pRwxRe3IW
 I1lFhtOb2sghuqAvolQ9vpj7zxEW6dNsIwi3Ibt/wwRefzpSnKS374HWQhlfuwG1l8ZhKwjMwuT
 EAg7edVO2ZpgAbLbu5w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2MyBTYWx0ZWRfX3Qg7vWBKe561
 3Opw57LrF/QTQdPjiMRQzs1EIfUdHWntcZR5t1ImjXR3MnxUvTc2RZy1uBWC29BDmDasQFaPwE+
 cpFu+f6sUH8WWa5j5s0S0XVGqhDyXrw=
X-Authority-Analysis: v=2.4 cv=LaWpeTfi c=1 sm=1 tr=0 ts=6abbdf1f cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=pW5MDpohxpv7HydHHPIA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: bJaL3-DlS_0wt4dBelNVM247LQ_NwbH5
X-Proofpoint-ORIG-GUID: bJaL3-DlS_0wt4dBelNVM247LQ_NwbH5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290063

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Document qcom,sa8797p-ride-embedded, the Embedded variant of the Nord
SA8797P Ride board.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 07ef7988b068..4dbbeaa4760d 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -427,6 +427,7 @@ properties:
           - enum:
               - qcom,iq10-rrd
               - qcom,sa8797p-ride
+              - qcom,sa8797p-ride-embedded
           - const: qcom,nord
 
       - description: Qualcomm Technologies, Inc. Robotics RB1
-- 
2.43.0

