Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782354BD342
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646798; cv=none; b=Kw8G6QianOOi2kgQDxuFlHBo51C1NF64yLl1DKMIuDc4fAb8uZAbrbzNN8AVTmWqfrOEat4uKHGiGJUun9/3zoetqFIQpN/ITeNwIa064uLZwM6wb6/ql30w5f8NGQ9gHG/XMNZfDT+yEdhSx2bax/OQ2MKJdC9HOVhhlEbAmQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646798; c=relaxed/simple;
	bh=dRIORkLtErUy8tQv0r5xQE2yHwcn16W9lhrS1ITHzeE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AOLpvs1JAiToZKJ75rA1svvRVPXxERTEyL1zFeSKaAkbiB89dyuml/O1rnaFab/mqqk817+JH+GOC0aqt7lherEtyTElR455wa8+s9rLdGDNJ9h3B/+oTvVjo8lHM6BO6vbQukXvj4SCyE2plRfxLwJ8ZoHWz+jk57hcopcF12I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U7Uwg5eF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FzKI5Em3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U7Uwg5eF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FzKI5Em3"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZbsY612951
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:06:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nP3wcx2p80nx+Tohacyx3IYJwpEKwRThxmKFCg9vGIo=; b=U7Uwg5eFG/pmFsnM
	xjn7dPDCxwjwcnMVZJ9pEha6boZUgOzeEhD0h0Jw+xbO+nHih2NI6K+0bwLOoREq
	AoIzbhQHSD+uRSNkJga4b3wv71i5fHxey2c2sr1/nF4Wh0KSFK1omFIkTI3FurZn
	oUsA2iw08xh80L1FV8YVvQ2azYF88oexBO6K9l/yZjBb90O0+7uLGGm5PJlswt5C
	LXxD5ghUGbpYy7NvyK5KAXltBWQVND9V7GdPiWfH6O/aohR69wQKIjkXsYLtMcYq
	iBkUKHrH5QXfU9M2+29tgnp2r5mAQsaVkAy+ozJr8NOxqI3sWsI72Vle4eTrOl6l
	iqCjdg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grca0ryxe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:06:16 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso1450613a91.2
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 05:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646775; x=1790251575; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nP3wcx2p80nx+Tohacyx3IYJwpEKwRThxmKFCg9vGIo=;
        b=FzKI5Em3ACbwlrSdfVBaBTqlCqdkwiOMpUVgiB45BUavS6wq1BaO8+jLg3tUsP7XjR
         Kxy3htgA8A7jGXsoYO8hl3+SkaKbLUC3Ok/no0JeyklQB6fCH3Too2zbx40Kudb+9F7P
         IzE1ZUQwpBvw7c4ER6+/RkoGSCMjM4MCwU93Kyw7vVk0SsqaWrJdOoaxXvbzsDBLE9C0
         Bj43miPut5uu51hbGofNg95102P68ItoOTw+l/6sgejYwaxN+7NWzlwo6X7E8OsLVgQ4
         H4WUqn2VgUmN8X3D6QyWXNaNc8Ye+0TMOD3CNQgbTG7+HgRxvKSz22bjTYHPMLIyQUEc
         NM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646775; x=1790251575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nP3wcx2p80nx+Tohacyx3IYJwpEKwRThxmKFCg9vGIo=;
        b=CEoJoQ72VSRORsoXJEC6CmIEuQhe91KUHHd7M1LyJWB9+728JFvUuiDr/TWWXWZ8Sp
         12+Nikv4tuvqO987WU4x98tzaSqUvNgT0suF06ubWJZLKxcnXkcKru688hIK1T60tib+
         G9Q1r0Jvifa01GGxdkbD8epa243dZzD0BuI5QG+FqhBgAUwS88HlB21X/opWHWkT6yen
         dmG+BzAkkd5oIXwCUW+LckUP0RXPjFQZTGqWQJk4bZHow30IikYgjnUjcowNkTl5SQ6n
         xXBrX/6Q+hUbLcXUdUSs7tr/DSQpugnqfAhstdRlwPzolufMW+WGDO5u1fmv6gg8oOUX
         4gRw==
X-Forwarded-Encrypted: i=1; AKwUvBwSyMy5Sf9yGdFQGXERJ3fm74d48yFaREmSCOqwo0ZahhGcZVKdoPkXG81NOI6QG/Y+xlicl92EF6P0@vger.kernel.org
X-Gm-Message-State: AFuF++lbknTMQ4iINE8vno64A6nmlDB44+P0sLZHZ1XJoLORZEbYF2MF
	bq4hYu8/w77GGUuMQlEpYR5ccLmscM53931FKXB2CAFl2VZJYee1Y4gNJP4L5eP2NbMqwA/z7Uz
	tRinwkl2zpD3AfHP741lIK6kzIFU77Hk7j51ZyI/LkJNZKq2T7KYVprPv/cEsrRKK
X-Gm-Gg: AYBFou35vvOlRxJTbRjTxJboE4iZgvm5NC4D4jG3/5YqgdD05sEYWz13bkoWy/jfCkD
	4XVcwqri+ycBxAtQmZRHTG5onnMYpp+FwyTqrVhVOu1KKAiFV5K3S4LLPjPQwZwus1xzmlp4KPG
	+/TKgJltXiku2WcH1jsWKUCIbh9N9agG59kOrutzofEq+xPaE1pijdaODG49VomZ1L6bJX/2ra3
	i8u+FGxfZFX7zAnPUEQ2Ce8GL84w+hY1p/R7lXXzSaJbTdBQoyXOci7RPJwt7SqNUXno/TSlLv0
	vnLIzgGpXchB5Kj7WRyxVmic/nPEP8aDSeOIar/281ceVIvz3y04Z+tJT3b36K9wLgVehg7p/QD
	DFO/+5IXAyJZAVlRNRtDC5OYK8te84w==
X-Received: by 2002:a17:90b:4e88:b0:398:cb56:e92 with SMTP id 98e67ed59e1d1-39e1e30ba45mr15795543a91.11.1789646774966;
        Thu, 17 Sep 2026 05:06:14 -0700 (PDT)
X-Received: by 2002:a17:90b:4e88:b0:398:cb56:e92 with SMTP id 98e67ed59e1d1-39e1e30ba45mr15795404a91.11.1789646774273;
        Thu, 17 Sep 2026 05:06:14 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35d9869csm5007612a91.4.2026.09.17.05.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:06:13 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:35:43 +0530
Subject: [PATCH v3 3/3] media: qcom: camss: Add Glymur compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-glymur_camss-v3-3-1d0e2d47ad2e@oss.qualcomm.com>
References: <20260917-glymur_camss-v3-0-1d0e2d47ad2e@oss.qualcomm.com>
In-Reply-To: <20260917-glymur_camss-v3-0-1d0e2d47ad2e@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646750; l=1214;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=dRIORkLtErUy8tQv0r5xQE2yHwcn16W9lhrS1ITHzeE=;
 b=nxyrFl9h4+kkxs5v1Hz/1ajWuTIr1Gc8gWV7jz5BGt7loaxka1cQ5RhKwkSGqRpfQ/S++FVgB
 BxTRaBQ3SFkAdZaZdLczev5MWeJ67nyhFZkOh7hCbvax5qVUeDTvpig
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: _DbB7f3QmyHlbTM3X4hKaFMClzKatgG5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2OSBTYWx0ZWRfX4i+avFHNkj3h
 lKZRmeowEI+6PhIG+vpNV0tNs6SY3WbkNkAGovM8F+vTp2kO3pwbMiEateoHwFI4wlFB10KjRz4
 GLWNqfzwuvRQLC7AnsejwLguoRRpq8U=
X-Proofpoint-GUID: _DbB7f3QmyHlbTM3X4hKaFMClzKatgG5
X-Authority-Analysis: v=2.4 cv=dOQzC+Zb c=1 sm=1 tr=0 ts=6aabd7b8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=xYyVevvQUQiUFKtwU9sA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2OSBTYWx0ZWRfX4iJQrERRU1RU
 2bzBH+wHoeNxJCVqWxRAUoYR8c1nogfaum9pDehSC6JhJHkuYwOc7Pft3Wz3dpaMRSnLvhd4Dsz
 m/62ZZY40H3RljDJ9aPvvjNcoyIShWsF8XqsskKMD+D4AjvFbgn8U7rRXmaaoN52F8O8SMtEVuR
 n+UJgywHB47+bGOCwj7sKWQN7qGnoBxjqjkOucq6aG4qPS+eHdmR38+Oe/TgW0Q9nGKI8j6cGxz
 Bvf1fsSzw9Mh9pfmG4o0T3q4e5zlnZ+LW1/zVXbUG3W0mpAIQR0CrFkdEYCUBBpQ2WT11UP7gbo
 LOh59/RsqIY8cxDtNNpWqep+jyUETLhZsUPWk9ndPKTCd+zmRD+x234OWQRcMVQ/f7kjGK095Lc
 3BK5vRKFj4wyWBfE9t06x9UdFVk0DPesy5aW8yoowGugN560kQ9BG5+BYcWEShhEvYUh41fiGQU
 5DvKPun8JLQQZBti1+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170169

Glymur's camera subsystem hardware is a functional subset of X1E80100.
TPG, CSID, VFE, CSID wrapper and ICC resources are shared; Glymur has
three CSIPHY instances versus X1E80100's four.

qcom,x1e80100-camss is not used as a fallback compatible since it is
already claimed by its own binding schema, causing a duplicate
compatible warning in the DT schema checker.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2123f6388e3d7eafe669efd6b033e22d8eb5cf79..3585c63c45848793696fbdc3004ddc867a5f115c 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5758,6 +5758,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
+	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
 	{ }
 };
 

-- 
2.34.1

