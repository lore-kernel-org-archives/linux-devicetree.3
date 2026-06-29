Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AB23A8FF7
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782715527; cv=none; b=YdZEh8Yc09kG3TvVO0OzUjhH/Gw8Peh6+0VHnA0t+ZwcSD43nGgQXfsnRW4XwSfSDjD/n0ulYzAonKWwYpKVY2ZQiymEFy5aeBL7dPv75pPtZbVm34bfdZbJDPayBU4r05xWG2dtYYU9l7E7nc1s2B4OklLvNqdUOqiCGu8G5gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782715527; c=relaxed/simple;
	bh=ib5g92loksXZmXiRdLEH7dcCqaG6DfiNxrgUNVm///A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eu4njMuiK5yXoDa/MrH2oG8ynTaqIRkodoM1eBrxux0G5Gqc5Ct8WpiVKnrVU5k2SiNGoq61mIZxjXh94hGex5V7AmlAnr6elF9QR6KWoG3IYYfcqN4VjUYOrofwAc2QH1nHwDuMpRA5hRNp18aLyLSW4MDHO3g3O/ZH0DmqfbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OtG7Mic7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YzErfYek; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OtG7Mic7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YzErfYek"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NOQQ1745021
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:45:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2qwmS4F1HHI0MHwQbDiJ79yyIP1FA8QXvJV7bjonB8w=; b=OtG7Mic7nvxsywt2
	hNO3qiWD+4dHG/9l2Lgnu98w4P7hOLaI1HlVDL4TWQmnK/PTIhmUU2KZagpOX09M
	kX+0a8EIoSIYXdEXh5T4jetUNtKk8J7KaUJ5B+QxLhvj1Ct7D7NlRxKr3clZvVQY
	hb7aAQjsq8bnEy803Q+A1wxyyIWqi74bSr2FBsUYKYczsvyk4rp2RdslXUSh2fJN
	stUlS9PGYtjDjAkcK/Lne/MtXcAC2hprihRz5GjMQD02fh2t8h/M1TRqRpQswtu2
	JR0Ba7t9nBIR4cvbUpeEuNuaadYGdRS6TBL92nT0nmkeM7vLe+jSvIt2OF74GXle
	81q0Bg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f2734d4xw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:45:24 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30cb5001ed8so2664774eec.1
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 23:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782715523; x=1783320323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2qwmS4F1HHI0MHwQbDiJ79yyIP1FA8QXvJV7bjonB8w=;
        b=YzErfYektzAQz6ZyPXybBnh5mbA8SGGZTFmID+mWFNsHqTKZTNWIiTT7dusE7jwJtf
         3d3h5u2XY6GvtgXRykwaEe8uljMzKEX9OpnSUSVptTqiAZWpw25KWfia4ii+mUf2RwA0
         8R6WSgiBhoW/Uu3/i37GmzsSx61XwqrYuJQ2o2ByzyXMEGx7UAqCq2XLGJDou86Oi7qO
         LKZMUtKcziWDsN1Mqvrh8SEXgd8CL5FcZxOdP9p6QypweZ9a9XVJZpTgb//3WBOfV/JU
         6+eLKEamk/J0pNfiwNIBhSjs93fAiXLJ5KgU39ug6KY2sxaVvK4Vz3NaNwBocWxXvoyv
         NPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782715523; x=1783320323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2qwmS4F1HHI0MHwQbDiJ79yyIP1FA8QXvJV7bjonB8w=;
        b=YUAxOrH8GlHbgV5wvO94V9XytA1jFanCeEVMvg6X8IytBckiWYcpLnLxjJ/EMicr7K
         9bzVAT/GuchJnIHKP70+xl/2D9XU8xAJsTk9Qu47rNdWbJZSAXh814j83VOscTRTI/yA
         Vms1iShC9rRPQdrbDRR/RL2czf9cKlcMRZSEGjZ/C8lrADIy1Gr9C+llAHPg4jZRMOj1
         BP9PxqDNqDEhIfi5OHETRWK8KA1dAXwg6hiwcVacvGi0WMoEU6j/OBPMMLVvMPQDkqKS
         T57MaTvCNJI035SBjyiAs7ea5iEY2DmP9MkkuFqCj+KtlwRaJpvVvJphLAj4NY2FB1Og
         6xNg==
X-Forwarded-Encrypted: i=1; AHgh+RqBjAxVUuxNSMUOVysbciappZPnwJZu8PYDIzdnNygJXeHf3aMWPEByobxuA4t0QdkiRTm2dKvbYbsD@vger.kernel.org
X-Gm-Message-State: AOJu0YzXqwDTWN1e5mlkvSXREbfu6vTwP/N0dG++qxYAhAdcqD8rJdU9
	hzq7CA+lNWS8ILfh1XJpBTl9HnaVlni8mtx7t0ngexXedbhfSgTz6IvgaTTUefEZgquTeXACTZs
	dPWRiwtO4pawGpBqN2naL+ypQqGRE4MsMUptWIcw1HudZVvrhfsBtxf7nWkBmlHf8
X-Gm-Gg: AfdE7cmv1AicTcPWTUBZSczKwn7zvGWSD2ObU2MbGclxCl0CSWRHVNNqwpaRQVRwV8r
	bz79w4iQubfflEyBohO7lVkv5Adt03l6xxSU/33m9P8SXa97FVK3ChvIlV8twnDC/vLQN2O+1gt
	jz/OBV2SEtIFUFt+yaAPh2Y1y9QA+FLRJZ2PsAlgtae3vZaxxjdqfU7yAgTZoaJlmeQKAN9Rx6p
	P4UbN9FmP3bqvvtVp0omzKhLUfmO14HRI7tCXRZers3kOgrJPgQgr9Onk+xp9tWLGF+z9JturKC
	aRc+ThR1cXh3rLaoKNKRM5fiow8MUrMzDWYpfektTHyS94ZybciYkKZzRTxmb9lurBWm0IBdFc7
	JIUtust8rBD2Ory2IDdbeCtSMce4D4xAutcgdXyerszcuxURIri1Xt5kmxrWbnQ==
X-Received: by 2002:a05:7300:1896:b0:2c5:220c:5670 with SMTP id 5a478bee46e88-30c84b1f43cmr15065962eec.2.1782715523271;
        Sun, 28 Jun 2026 23:45:23 -0700 (PDT)
X-Received: by 2002:a05:7300:1896:b0:2c5:220c:5670 with SMTP id 5a478bee46e88-30c84b1f43cmr15065941eec.2.1782715522739;
        Sun, 28 Jun 2026 23:45:22 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52d669sm43580424eec.11.2026.06.28.23.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 23:45:22 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Sun, 28 Jun 2026 23:44:37 -0700
Subject: [PATCH v2 3/3] dt-bindings: crypto: qcom,ice: Fix missing
 power-domain and iface clk on Hawi
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-maili-crypto-v2-3-f8ce760f71d6@oss.qualcomm.com>
References: <20260628-maili-crypto-v2-0-f8ce760f71d6@oss.qualcomm.com>
In-Reply-To: <20260628-maili-crypto-v2-0-f8ce760f71d6@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782715519; l=1048;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=ib5g92loksXZmXiRdLEH7dcCqaG6DfiNxrgUNVm///A=;
 b=73ag5aveZqYbsC6rIKjJX71ZqUJrCDqTTDn7NOXTdHKaBwY26TAzskfb7JnOoatjhLvX/7yA+
 hTus3MTGC4WCM7fqqn4dZxCKrrU0AUgeFCmLPB9CKvg1gsBtrcwDxcg
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: YD2i912fm89D5FvcJqktKJnuStHIvSvt
X-Proofpoint-ORIG-GUID: YD2i912fm89D5FvcJqktKJnuStHIvSvt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA1NSBTYWx0ZWRfX4V8+BuP7ZxQj
 WtJCxd5r3EOFdk3m53jhkLqxkJXSQ7yNnhF7ud2weZ+al50SX/6DhcCbXBmgc3uXk83kwxtJIJZ
 l30dI/RlAfpmzFYOKCFbJzHYmdwwhas=
X-Authority-Analysis: v=2.4 cv=HYokiCE8 c=1 sm=1 tr=0 ts=6a421484 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=pbqL9iGvPPrSSTFfp4kA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA1NSBTYWx0ZWRfX9j2sHJwyN/6n
 cPAN84lbDA/DfY2gAWWm/fcX7M9XO5xgcO/5MqIghksU+MCDJAFlOhhkzGzQ0asl7Q5TyrVP2Nq
 s6fIdzztplRprcwad7+ZKREAMmNIezZRVAS27KQVGMtr006g+2pfuUA3ODRINsiY+bsll6tCaKA
 hoHwmmQAhfLjbrpoXM5zYCdcQvFt5plC6+gUnPOkGnb+3MiKoyWS1BXsHH/tiksFLfEbWr8jtpL
 yYKGirLclO8w6Z4yfy3N6SThyv5qQI96xQdTDnLRBtAgEkuUJuT3XWl3/vNeOSgCtYEXF/S7DZH
 ZzZHARghrAYehmcYl8bpVYtJCaebmYVrpiDRLfvARGlt7qq34/Ar0WSVsAGMBAKkwFT7OWbP/pQ
 WI0miiHqGufuqMwUfzb9Z30j986+6xXSOh1M8VYeVBB19dhrivmgStKq4zboPmblNWZIXdtEOGY
 M8d0HZgq4b93jZ/DiGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290055

Fix the DT bindings for inline-crypto engine to require the UFS_PHY_GDSC
power-domain and iface clock on Qualcomm Hawi platform.

Fixes: d273b258d8d58 ("dt-bindings: crypto: qcom,inline-crypto-engine: Document Hawi ICE")
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index d80f8445393b..a67a4eb88007 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -63,6 +63,7 @@ allOf:
           contains:
             enum:
               - qcom,eliza-inline-crypto-engine
+              - qcom,hawi-inline-crypto-engine
               - qcom,maili-inline-crypto-engine
               - qcom,milos-inline-crypto-engine
 

-- 
2.34.1

