Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8A54DA9A6
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790071764; cv=none; b=PnOoRWvhYxvU5CmDhqNm/P/5sklBeOo8SWbV2tE3W+5j3cqJGuwXG4xvOstOhPCeJNOWBb8f9ceHe0kjK3RB98+qU+o8lGUi79sO/ee3DOGStzUEqxkp9XvMGfwhGQo/plcjxL7nzbLTOCJX1DIcOtFaFh0uq3hh5co87xcV7UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790071764; c=relaxed/simple;
	bh=0No+ZacBX4HIzIYIMRa6vAD2lIVsiJ4dmaOWJP4PKjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hdI5o2GurxIM4xBfKF0e3DjUxN7kxENCj80tx1G5AmuyG2wQc/fB5I50p/hwFiwcLiCZfTjpymJ3eWkvsQuOMGnzh2iQwt3bp/ItOMieoIzQVn1BRLc9Qky2uUsMSaxbe1x+eyjZztr4gVa+QkRgNE+XQOakrMkSchL3f05x3w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RUgaFVLN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d+05KahS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RUgaFVLN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d+05KahS"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M9dJqN3382630
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:09:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4LRK8MN1wRj
	sdtZjvI5LO7JovexxcJJzxK4hpdSkz4U=; b=RUgaFVLNG3w5RImqA1Y2NqDh8OC
	XYM7kGWaGDodxbAqqzvtNHnF3pLIbE5qp+9pnRgVjLbeOlnmeKbAYzYDNKa1gw/L
	mOd/Ih8dEkk/c6X0k1CPumPPSYpUKgIOxE/Jdz4N0kERZfOfOWUp5MV21eRAWZq/
	wr/WoNU1DX7JiXyuLyjfoFFiG1/jfTM0gbdPq27L1d1e7UKuAzczkoABlHQrO+zi
	+C6rV898OQi5r+gMBlr8ZrNSSNhpFzLgI5m0EBUuwaSoQ/oQfyZCBPa5o/NBSgN4
	3y0JqZ3lOAKoh4RZ2Zr6+UxGSiM6oXy6+smflhGHhgBICMowh3YHTa8ObGA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gujkj9b0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:09:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso4627839a91.3
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 03:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790071754; x=1790676554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4LRK8MN1wRjsdtZjvI5LO7JovexxcJJzxK4hpdSkz4U=;
        b=d+05KahSr5PGcjFK8WjsYR1sGlU5WzdmY8JTc9Ubgs00lGMVYG1hpakBbf3zmAo5aB
         UvbOAfhi/4iytqwOiO1kN007xKxvYMskjA6yEqF6Aoav0cqJLrW8odcWbXmD5X9mHadE
         FAxPGYv/NKbngH8EawpLQbixt54qqOjweGcGn44p/S8wYk+FFt2A8JvDug77lTSbnAPu
         DzmcCgL+doT7cJDwbhN2PR6eqLKjk3KuQ+b3cSjdwbgEeDmq5spO/y5s10aA1qnG5riO
         1eg7aLxh+VPvugbYx+dFlus7sOJWJVGq2tuPS6alIaQh9Ji33AhcOGCsl8xqy5qGv73A
         RDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790071754; x=1790676554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4LRK8MN1wRjsdtZjvI5LO7JovexxcJJzxK4hpdSkz4U=;
        b=14YT/RIr+QuuKzLvEiubCAVpKJDdnr+Ue/AWk8CCTQDBGuOh9u2oDR8PBRtmQ/YcWR
         PQSEYaqb90suVO7IctaEmd19qnn6FLql1PjDmFoz+SCYX5b97Eyg3uGRvG7BehTtbdip
         e3YYtoz2LKOn/UCiG19pYV3pGU6sPx96IwttgeE6kuOLLRh37lto4SbyX4xClXW8lWnD
         t0I8fXpKwkHedO6ZXkezXVbxT7oQc/xTcUPzEDOdTUTEO+hP1sgPU1HyVEsoWlN5xRrY
         0Nbm/waL/Ok5Nj01ceikd1601kB7gunO0RXUjgY6M1RAHpdLqWVsnqwMeGK1pJnaBSKq
         XGlw==
X-Forwarded-Encrypted: i=1; AKwUvBzoUE4Wf0g1Yys51DTciF3g+iku+03WpBNx6cLSL5V60n8Wz/xBRRnvFT15UNR2woVh2LIJNfpZiJjo@vger.kernel.org
X-Gm-Message-State: AFuF++lIrzYrmUnrIEecyGibkdaYM+2FOfdXsXESYBwiivg0PSC2Gp5g
	m+eaXS/lPfP+DVULkQRcvIURUl9SxpaObwlMDLT42sJoWvnZ4VsuwlpJlX4o1hhecqLj2mxtOPg
	rskwIQGskvXjdpSTCWThoVYwMwKJXXHHcJMGbnEqyLh9DUm0Bcuy13dGsosWPaDPA
X-Gm-Gg: AYBFou19qTuxR6smlJD20+uXxAydwA4WzXqq1BGcCwYFiMVAsb7/ReE/ISmsO1HZutg
	qoskg75b4qodT/JgNeP/otXT1GppO/gSZyRmeZeJexp+0JjqS8oETrG1ols4I/HXg7afJtTALnP
	5JXEkyDuXaD+FqGxiz9K9P3N/OvX5Z4jmgrnyybsWSh6O1cqGhn5+QaiZqEUyg8v5z7kDA4Y5+J
	ms7WrcLY4J3tkLbEy41HqZRhCRFzb/mmgg5kuQIJG0LVPKzxQIZXrG8hoIZVG78zBbcIEIMoxei
	1VK/oClf4jEr0zI4Lbz42WeO0GgmkqMaMnIJOaHHYdJc5MbSvDGRWfbWpxgZpXWxkTNkGnEbbBE
	NjNMvugfnL4DHDQxDX/zsWu8ggOPIvzB4kw6iwTmRMlUtybz4i2Ca4fAhOoQ=
X-Received: by 2002:a17:90b:1c08:b0:39e:6a80:dda0 with SMTP id 98e67ed59e1d1-3a0731f957dmr624684a91.39.1790071754494;
        Tue, 22 Sep 2026 03:09:14 -0700 (PDT)
X-Received: by 2002:a17:90b:1c08:b0:39e:6a80:dda0 with SMTP id 98e67ed59e1d1-3a0731f957dmr624649a91.39.1790071753974;
        Tue, 22 Sep 2026 03:09:13 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e612c9ca7sm5121502eec.17.2026.09.22.03.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 03:09:13 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Jie Gan <jie.gan@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: arm: qcom,coresight-ctcu: add Nord
Date: Tue, 22 Sep 2026 18:08:49 +0800
Message-ID: <20260922100850.527109-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922100850.527109-1-shengchao.guo@oss.qualcomm.com>
References: <20260922100850.527109-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ttgKNPrRZap-WiVM9yIhh5wwoGNlT17p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE0NiBTYWx0ZWRfXwDP4FMgX+8Gt
 7jTBKFjRCFjjxHdgsmOFb2JANS0xOeTPGrq1T2H+2d3fAhEKa04b7lftSI8lgD7ZuWGnbTIABCq
 /UTn3TmLQnsee+OB7knRIwxDmdLUW4/hI407/z18VIV0pMxxMgt+xl8Q9m31OUegI9qzNrxYDaO
 iLLqFouIXIhr13A2Xq74E1Cyz8yRmkapg/UEa7IvSCDXcXJBBHG/Jxo6qCy4i5nRH+RlYiAtI7J
 PoWleQEWh5ouQ3+TW7Eug0GQQrfZ8w80KkK3mWmi7Y9t1ozcxY0Em6ZseO2HmrUCI9NehrSKFTC
 3zktrRFgqepN4cZ3pU9U0NCauhdlFcVgG5S8zP1tuLEaccQt9KowJKReCfahhDD+l8UGR2uqzjy
 6PqFQQpSQS84+GdWNoCwlR3HuD4a+pHTOAHOYss9skF2DXuYhXhaxfrxzTlJJzJClbBEoMIvWYT
 hNCs5Y54bmERReO/Ivw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE0NiBTYWx0ZWRfX0v3Bas4UcCGx
 z8bTxKoZ9Rt7ZiNnu0eDsUXa44JxA28bhJLrANew4OhPbu5bXzoQ2HCzmbNgkDPOQQc6ilPNEDq
 cBFbQu7akn3iMBlyInurexRtOXepYC4=
X-Authority-Analysis: v=2.4 cv=SuAFe/O0 c=1 sm=1 tr=0 ts=6ab253cb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=co3ps9B5goeKVN-PGfEA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: ttgKNPrRZap-WiVM9yIhh5wwoGNlT17p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220146

From: Jie Gan <jie.gan@oss.qualcomm.com>

The CTCU device for nord shares the same configurations as SA8775p. Add
a fallback to enable the CTCU for nord to utilize the compatible of the
SA8775p.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 335a8e1a5a9e..1d5bf79f4984 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -31,6 +31,7 @@ properties:
           - enum:
               - qcom,glymur-ctcu
               - qcom,kaanapali-ctcu
+              - qcom,nord-ctcu
               - qcom,qcs8300-ctcu
               - qcom,shikra-ctcu
               - qcom,sm8750-ctcu
-- 
2.43.0

