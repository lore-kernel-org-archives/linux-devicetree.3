Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE18A47DF8A
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 09:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985278; cv=none; b=gitr3CJ2iOkbjVjrWM13nkHj6Nh/Mhrbf6I0HmfTfrtMxTJc9uj6mcL6/rBe9yC9kstCA+nMBRE2c81dyepk/eWOoMyjz1BkGNMdrsMtfGGNacY79I8iBBhBwlbdsQBWoBuz0xIk9LaqpmVgS0Hl1mgau14OP7b91iyhYgeGwL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985278; c=relaxed/simple;
	bh=Uqluud263E5brCcr2XHFpOjXh+t6eAS3H76ENv887cg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rlMVy/kP4KgazvVz4vNCGoLUHznynPBfQMByh81PA6o1Zg7/W8P2DqWRcnebPN5qeq1oBgEc29iHtxLldxRfA5PSs1NrSyaWPLmjWuAGnHfWcBXTj+DHFKROeiMPcpg6LG+D7EFq9GnO7r3zSmbX5tbqHPgjIWQW0v3X/eKNU4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X3qTiyPO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gI10Yj/3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X3qTiyPO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gI10Yj/3"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629KtN24117250
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 09:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aZA4ZrQW69o
	qC6+CpeaGYgpvQV9ESaL7nyZ87hOcFP8=; b=X3qTiyPOdNFs/MH5Ar9/gXnW6BT
	1dsLlCnhr+rotXBVt6EBzvTRSlA+tVQaevQfD1Z2Jbp4G+D3EyNn5yY68n9pjIRI
	6OBKXk3iYtdmVpfGMGMQ/DKWt/zir/01UAO+zDb8WOE2qZAx4wPcdF2P/YfWyqrK
	RZOWiaJaNjOyAeTTqw1o8sazHgQS3Y/KOkKsZ/9RfHwYIvaBwPywteiFq3knBblX
	AAZNoWje57F0cuAHtnEXNIN8EuYIM5huaKcvJtimyEO1BwCB7zPJNJsJ7qU+R6v5
	ilQIjY++XwvxCBxkX5n1suV7+IfwSMxcgDQLFxvSyGTs4ZYoL/2FHqKBCfg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n9bg2tq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 09:41:16 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-845e3ede1f9so1912302b3a.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 02:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782985276; x=1783590076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aZA4ZrQW69oqC6+CpeaGYgpvQV9ESaL7nyZ87hOcFP8=;
        b=gI10Yj/37C7CXtcawYVaWERi9mS26UssasnIII1a/4ETP6Nzfp4liraAZpXFRiUXZA
         /gG6sawfRA9Ak6m1cVf96cuV5ke8ALLc3UgfHKUvoEqKWtT9QD/7tCS1+UdmUYAAx+Jx
         oPssKaw+x8tb3KpgOeG62jlkTSkSEX+U0bfU7ycvA8ca7P5bDvYvxJS53rkyu05VMR2K
         ltTkdos3pjKAowm7bUy7D0xjcqHKfzUQ3W8utIehvGuXurQiDD1S+AUGpHPN7OP5ku8i
         ZkFcDjkzEQxfVs85ipu1Mh2hi7FldDjvBKFD+lDgeyfD3SMbux2JqYNgYLpXFKtKq1SX
         kwmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985276; x=1783590076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aZA4ZrQW69oqC6+CpeaGYgpvQV9ESaL7nyZ87hOcFP8=;
        b=IZuNgQ1t29f0SReTfb0VSQBiUr7tLXVqctJRQdl8oWw2EY0meC81R7cG3sM3ygATrr
         8Z13xJXzbt68eEI12LkjFuRyNddcYhvFK0xFWVV2gkYXjxbwjWfasfKLOCWhy/JB/AeC
         TL8XMsybStbI2s5Md5iS9GNT4b7A20hVMKWxy3I9R4JJ+CLYKfN9mDXEiX2KRlkKgEs9
         m9TGYDahp8deP+1at1mXL5nyQ4H7HdxGQAdSePQ0sH9xqBPwA/bo0phHjuc24WOrZ0Hb
         F758HZJ/Fh+k7sdIounjnHf3cL2XSYSI1/0/n7n+QBqBuMhaP1H3fB+SKgYR9OYORRKs
         J4UQ==
X-Forwarded-Encrypted: i=1; AFNElJ8eyx6en8HaHV45X3A5u5C3y+Hr3/LAsgdo3/24DcjsWwQNEIHxmN9+gdvrpi5XLhhRBSMl3p3zGZZj@vger.kernel.org
X-Gm-Message-State: AOJu0YyaIzCV4VKhFyqfl1Rdf2qf+/JLGBy8GgCr3qRWyD1dGeVueg7U
	KYiavDCa1COnU4V/UIf7HQTGZLNUOEEEBrAtFM6x7AwPIn8tsjC4x/AcmYxxOitWCivKrcsCmJy
	4wAZPmgqg1tNFrbYeL6l4/tVpV3nl82XyFDyT2zznfIQPVywbg8HeV9o5kReLJf7X
X-Gm-Gg: AfdE7cnxl8Pb0l7NlUi1opK1jQCwq8iTPIAW/Cj4NBIDHryZdCfdoFzdpsToEIFGc0V
	TFTVI52J6kwMqaItUJA/1UcPpcXzsXv0PIuHwTapeHlsvoABHcEBNv8HpEq3DaaUIzVTZdt4sco
	QZ/9AmWBG0hBUj7mH4fYl3k18nEFXNWg3yfQav+S7/5RXbkeK7wWodt96/5D/lWBPG/IaSiZiUo
	OpIqek6r35f0fOTAAWfQHuE/oFB0O/S4RIAgKCaehjkU7MN6ePHgNuUcRVXcXrf4FzENYmSQk2Y
	iUd1Wd4S/o2cEiHb2XPkh/FeYcQs/QqOqi7VY1RSvCuDu3HBmjJph5nzVPSge+aoNoB6e8S5PbA
	BDAKbZQ6BpHyEyKNalxKqw0f/c2KEEED2HkkaKg==
X-Received: by 2002:a05:6a00:806:b0:846:f517:ba5a with SMTP id d2e1a72fcca58-847c5141135mr4342783b3a.28.1782985275732;
        Thu, 02 Jul 2026 02:41:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:806:b0:846:f517:ba5a with SMTP id d2e1a72fcca58-847c5141135mr4342742b3a.28.1782985275185;
        Thu, 02 Jul 2026 02:41:15 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb75d850sm1141595b3a.19.2026.07.02.02.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:41:14 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
X-Google-Original-From: Monish Chunara <mchunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V2 2/4] dt-bindings: mmc: sdhci-msm: Document the Glymur compatible
Date: Thu,  2 Jul 2026 15:10:54 +0530
Message-Id: <20260702094056.3755467-3-mchunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260702094056.3755467-1-mchunara@oss.qualcomm.com>
References: <20260702094056.3755467-1-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Rq2FBbiM0Hg-3ovvtVqu6KGV0DyUCdLA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5OSBTYWx0ZWRfX1sUtgM+tov5n
 ZWLcyW1Hbgdd64frRE1gscxvkB2VVsXlnT08oLfc8AdLan/HMzbJ2DoZ2gJrJN7MrbJlqBk1NQg
 WB611ryckNZJU+vcUrQceudKZ2zerFU=
X-Proofpoint-GUID: Rq2FBbiM0Hg-3ovvtVqu6KGV0DyUCdLA
X-Authority-Analysis: v=2.4 cv=bOom5v+Z c=1 sm=1 tr=0 ts=6a46323c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=6d2A0baYHafENtA5ngIA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5OSBTYWx0ZWRfX4ifdnW+e3vZr
 a0A/4bAUBJ9sUB6cBBiiHCzccw3JAsvauBNkfI1i2MuaySnRDbdoskZRiA+apaXzpvebD9HSFyZ
 jRDI6NnBV+OLMVxD7e0f1+wtLbovMGbw9UCPKvgxO67HaQx6mBV0qTeMma69vQ+vuA0pK/KiRn8
 e57epvZer8grHWANZH3ISfPmfWe2jLY3zkVa9G1AmvQwdHxXPXtfMFzyrzq9pgJen5B/Lc2UYgw
 9MkpyLpROqOnm3rc+DgQ77t9mytWsS1T/ve/Y9MSjvSglB8FhYfVwR7BYROog9HAdIk7dI6+7L7
 n0dZ3saYjgCjEMeXxqgN3tpTH4CZdmidnLUqGKZabkvqvL/eG1vE6Vmsv3tfmB316V207YsdUiK
 i2areDLSKurg2zhUDriE+B4+TmmPypjBqypGDxN1qUR9OZVZ30/8Mg2Lhzr7hYmWTppinAxI0k1
 5ZX/IMCtPpBrcKO9SAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020099

From: Monish Chunara <monish.chunara@oss.qualcomm.com>

Document the Glymur-specific SDHCI compatible in the sdhci-msm binding.
Use "qcom,sdhci-msm-v5" as the fallback compatible for the MSM SDHCI v5
controller used on Glymur.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
index bd558a11b792..6a8ef84617a9 100644
--- a/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
@@ -38,6 +38,7 @@ properties:
       - items:
           - enum:
               - qcom,eliza-sdhci
+              - qcom,glymur-sdhci
               - qcom,hawi-sdhci
               - qcom,ipq5018-sdhci
               - qcom,ipq5210-sdhci
-- 
2.34.1

