Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0909233BBC0
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784905241; cv=none; b=Qfp7OfWLUIuOqvB3buKkMZYmG/MrU+8+bdk08pa+n5pp9LrHfkqwMjRt60j82meQ0Z5jGTvh1ItUck2loo4dU1cFp+cfWsKj5ULzYtMpztakriso5SxYHkHs6QJr42qSPcPG0ZxRpBOU70mAByhr4bAoTQ/vknd9Uhu3epAnUKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784905241; c=relaxed/simple;
	bh=KJR+wN2GxxX47mMq0L5v9qiUYbR7CJ2cgzDyV7M/EXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WQhiD2PdDnxfTgGeufUBb3Z0m88ldMvyvDlBYHBVwsTCnBMIzR/6NQ3IOhT+Y3uErGSVusWY9WtSo6Nnp9GE+bRSCULNST4K4mbHPlJMCJlLjJM2foOaiwldz5WpLXDUSA5XfwpglCXlv2QTsHInvxazZdNhvHzCo5hGwmkgPHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hApBTm6N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ev7JhizW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hApBTm6N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ev7JhizW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbNEv3071688
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:00:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tSLKcsIekv64LYnxmYxCKFM0mL6dqYQx2lNZ4wZsNLQ=; b=hApBTm6NRVZ5bonL
	t0SelTEWld3+JBuSN7edbMk4LzTdiIKKP9gEAdAE3zJWBDHLpqNVaWIz9Mcec9Hf
	OUSEYb7PIN0cWGPymrM4E5WQsYo+necrHAEJ6btHwAMgR7W6nUv2X6y+RZQUSL6t
	+eKaDw4M5MNwap5fBvX1tPqe5ZtnP6/aTsOArNNNTm4E7EZSokeNyRVUtv/lFX4C
	dPFyJV9+Qqp3g7i+mXESUxfun/awAac5d3t8d4sPi639P0leVRxkqmmsOGVGLPRD
	LzpsABYmDdxs/ahRfKhibYnIif5+BgCrM4G2iQj2Eg8DaLStqJ7HFZh6H1S9Hzzq
	jYHqtQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0pwaagp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:00:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cf1c86963bso16660445ad.0
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905236; x=1785510036; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tSLKcsIekv64LYnxmYxCKFM0mL6dqYQx2lNZ4wZsNLQ=;
        b=ev7JhizWa6j5hVNMDxp9JpCPoRXDE7mPk+JFr3sEhzVzY8SLO8zhOvssYIdt+aMIwC
         yxXq8OdGaForbvJmFH4VLWxwYiLhLfvdu2E98oXQEOK1EvdfGLiiXQboIdAujl5Ci7CR
         qaJOVFQzAYRpE0hHNiWkelgNYAiLur4q5JyQdAj9zdcfE98WTC753AJhekjuV1JWlJgx
         GMBAVhRGUFX5Qktc7N7U0JbpQB7Lnxu86e1zz9yOI1xTGTeQwUF9+NcfpoV4MGH3pblc
         PQnI3y5DOlHGHOvPMJkZ9V8sSsVxr6dd4dWVnz8L2RYrb3h/b3A6HgI+t/RCyi19zB1e
         7k6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905236; x=1785510036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tSLKcsIekv64LYnxmYxCKFM0mL6dqYQx2lNZ4wZsNLQ=;
        b=dx8AOvqqe4TTzzFtAa79k4hU7B58pAja+SvlQ2STEoHlcvGncFu45JUuyKgStbyg1j
         FPInar2lYTWm2QkYoc63LdwIUoOlsXqrPQdjo8tBQ2TaueH1jL/WmeYDk0Vq/3ngBxSu
         cIMRaCr9Q+Nz7Kxi9ad3p6bl36+BPFvUa39jUC0cETtLRRGailjVEgXB2W/U+j4IVan8
         z+cHHstUU+pR/BLJrXz/Rb9NmlNR5SGV/vQ+9QN46oWloy2RwsRR0TeO3tUqbcjedxXp
         FptGbwjjJO5wBSy8EMxsUEIO0picfF1zgsm8vOnAf13unzPrP2B4UJrtcHbIAz4hCjq7
         h2VA==
X-Forwarded-Encrypted: i=1; AHgh+Rp7EiX7Lf/bkOd8E8WYKdA5xZZ9PxtAdCfxHj/odbJHXqicjITbvE+VZOnQUARnRPYnW/fUoH7RKV3n@vger.kernel.org
X-Gm-Message-State: AOJu0YyehRuTYYjkJi07NhKbcJZIb+7QGdx7XhQpK36eEfhKy99K4wFU
	rAMepCyF7d2R/JIiAA62OJPaDo+qSLSj0Dqg6vogaAMyBSyE8B+ZTN2hrADLGB6o2ZtLZ6Z0+Ys
	a/MRpeiiggPM/ShhbixEDq+nUr/YnJ0ULqySsDPPbavAaKVdHWI3o/WdGXKonI/3g1iW7L2RtAj
	QAOQ==
X-Gm-Gg: AR+sD101BVU4hLFCW6LKwiAvmJF3xMMI7IlG56ux3hSJMKBmxDz9F/0eg6a5mD4gAIl
	202DzaBmMPXku+iqIH94oGYkedqVJnXs76SRCxDqUdCD1OZJ8Co6tcDZ6l7o8P5wcJalKAjg8Nx
	kgwXFNyFqOhuex8zdLzCkmuEeeyAEjrgOqGZoS/CzhzA0dWnpDjPVclkmNwr2P3uiXV1vNN9HmE
	CALEEARNxJsFaoM9Of+XJ7s4erG/yBMwB1zJdkTFfNQLuXCMKBvbEUOiY/wzuqi2AhEVaw1Afek
	/bkiA7PEPsL5aCpInXo6TEsQiFYpQtlzOv7/sLTXfIIoyoWSRZy1V/7OS2l+c9gYy9tsTcY1KSa
	KjdgeOH9hCHxKBsID30IQw6DDivuv7qZ4z6ZGQgdjFP4=
X-Received: by 2002:a17:902:e884:b0:2ca:d034:ee7d with SMTP id d9443c01a7336-2cfd70c0993mr8093285ad.4.1784905235316;
        Fri, 24 Jul 2026 08:00:35 -0700 (PDT)
X-Received: by 2002:a17:902:e884:b0:2ca:d034:ee7d with SMTP id d9443c01a7336-2cfd70c0993mr8091595ad.4.1784905233416;
        Fri, 24 Jul 2026 08:00:33 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc593b57sm621809eec.25.2026.07.24.08.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:00:32 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 08:00:30 -0700
Subject: [PATCH 08/12] clk: composite: Export
 devm_clk_hw_register_composite_pdata
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-qcom_ipq5210_cmnpll-v1-8-a8b8679d215f@oss.qualcomm.com>
References: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
In-Reply-To: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com,
        Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784905224; l=749;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=KJR+wN2GxxX47mMq0L5v9qiUYbR7CJ2cgzDyV7M/EXA=;
 b=DRoCiALCPxHYfgApbZY8XM2JEu7UnvsJshHqGT5Wzcb0/ZfKVMybazdkOpoktKJK3sfTwIBlt
 mczsdlNRSK5AAwf6i0VJOS+7oLLv7ES55kGeFe8h4FmX0gyrKoKu10u
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX5tosYtda3MYX
 jDVuubumfGBbGt/SYtGUYxQYbhr2KBv5UUfZddAXCw7n6XJlS+LUXGSx0xN5hY8C5FqRNR9VyZ3
 HkBzMleAg4hBb1L7pdwdhuMbDywrslW7luqngt1YQwRkb2YuYRoE7afiZfqn5cEcXk0aCfAa/eC
 oMk3EyE+TEqfF3J6eoss+3DjWWDHj1I+kRF4mTKjlWuPDWrAKW86B+yMNhnFm5wLpiMM55sknmJ
 o/3QhNEF6AFPwnpRXctBAbGwWnPcR4mC+F2jnPZKi5ghyPOPVcNup4Si4sbQb/WrqQYDd1d79M0
 cKKlFN/LH03lQdNuKOYHSQDdD2M4fdzkyBe45LK/DTGZbS83qVrDL80zGXYB2VUUg3Y2597dZaH
 HBz6ncSKO4bShE9VC2pnSPfD6nxyAKkqHNh75oVhM4orTwRQnv7GKAFhQMwhwPda0/iF8PwlwwT
 JwE1YI2VCvNkJWCjO6Q==
X-Authority-Analysis: v=2.4 cv=RJeD2Yi+ c=1 sm=1 tr=0 ts=6a637e14 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Lly5wiSg1jk5MYLGpuEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: H2jQuRomEXQd5vjfssF2bKa4JeZbp61p
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX7/gDg+yilKEM
 wgPIfh3JkXmfx8UljdjprvYapd/VLkX2fgyQc+DTjvrtxRSIewuBWLjCCyE78hpvUnrwS2Au6hE
 7lW7biYJKrBzGVIOF8pBRuHzBH5WskI=
X-Proofpoint-GUID: H2jQuRomEXQd5vjfssF2bKa4JeZbp61p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240135

devm_clk_hw_register_composite_pdata() is defined but not exported,
preventing its use from loadable modules. Add EXPORT_SYMBOL_GPL() so
that out-of-tree and built-as-module clock drivers can call it.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/clk-composite.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
index 835b1e4e5869..11842bce5918 100644
--- a/drivers/clk/clk-composite.c
+++ b/drivers/clk/clk-composite.c
@@ -462,3 +462,4 @@ struct clk_hw *devm_clk_hw_register_composite_pdata(struct device *dev,
 						rate_hw, rate_ops, gate_hw,
 						gate_ops, flags);
 }
+EXPORT_SYMBOL_GPL(devm_clk_hw_register_composite_pdata);

-- 
2.43.0

