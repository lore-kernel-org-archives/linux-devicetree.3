Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75ACC3CAE7F
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 05:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782452852; cv=none; b=DMl6EKpxvGDnofRmZYsoCFu3mZ+1rKVO8Qx+WO/BWBCNzu1E2uLETOh3DWTTerun5Kz+1MrdvLlwNpxrxxcl07vnwi24B1wujbSQl48lxMRxquK4BuyRrT2+3XQpoWCHqvKSeSP04sNwUPrg6tLHnm9cQaDb6E0U2t1GmRdJM+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782452852; c=relaxed/simple;
	bh=H8ubX5r6+fUjYFZplqHVXsIkPLsSF2uwV17yyqPeBoM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m2tOlJJDAs3pE4yQmN8mKCKZO9Pq31+Mj7fednxfESLoXYINtd9u0oxfT62XYkkhVpRnjnUZTyZn5UW9/8Atbx8lCKgkLLfCqNPUNtfj44l72MThHR7FcDaSgqI77XitVK4XZI20J2hGrPo2Hki6CRJeWkqF5W0PpmUml9OM+oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g/o5L/1D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y68mb2t1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g/o5L/1D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y68mb2t1"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q2iqoi120347
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 05:47:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U7QEh3CkVHu3vpnR7ozK3pEfgViSKW+CcrIDb8FlQEQ=; b=g/o5L/1D62Ac3knC
	a85npGhZ4D9hYu9W2i7cEgvfDjMsHxSkUVt0AgVWaaIb5UBzwYrrXf8TWLMM6dSs
	G3zD6upFVXZN/JnjAIlQwQTGTAIp0AAUw/FObQ76aQPZG4IG9nZS/WDRHuFKf5sJ
	5nV28eEUgf1bgARLS9KhOeD00dZu/gH6Papc+Jztel6YaE/6Ef6NfGS8s0qNJmcb
	L5FWPZp6GQ2H/rHqoLX5v8nm/NiIiWjGMksoSW6li1+POH1QMrC/wrO+gQH01JU5
	zYXDKbirzNgshqNP3wxXEF4mL4gOKT8J36nsq1sPLerB8CoPZQAX0IUk80eqvyW+
	ZdRx1Q==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1askt32d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 05:47:29 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-808a9e5182bso13670197b3.1
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 22:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782452849; x=1783057649; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U7QEh3CkVHu3vpnR7ozK3pEfgViSKW+CcrIDb8FlQEQ=;
        b=Y68mb2t1c2EtMfLI9CQFyGTFUUtZn3waq5vKth4VMMxv5Ii8rkhyAQHW+r02lhNHuR
         sIsh+m/c7R5rfyIqpYGyu9Qs2FbCLDc30I/vHJ0llDF8tHVQUT6aQx5ngtxmFs0/kuuL
         NYR1RO98VgHeRZemH4YUgqUUu4eZEJa/ntH4R5BztPIdOelKnZseEKyIsml9WSEYcJBH
         EYIwWlUhhRxMpk/kWki+pswKEs6p/QzkWOVf+nnqXefJFsVDp4WuWtNCFGbhtx3RGQP0
         C8y98q/GNoL9g9C9VW21euqIan+xkqH9+txkvy/cACVoupNVMQxFJv5ntSKItDptAoS6
         OlAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782452849; x=1783057649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U7QEh3CkVHu3vpnR7ozK3pEfgViSKW+CcrIDb8FlQEQ=;
        b=lV57/MRmbSZG1GEwPq2WvxRqSOrqEHUqNiNTyQnbtyTFcxv7g4s9xrdaQwidL5E6mh
         KZG9TJqjDrR/hbEqV++9+O5oBxqgy/RBdviZYvZ/K7oSBXTYy0HdtYT79KQX9hjF9RCA
         lJOZztEGXpLn8pVevCOy5uVaA5cj9S4FZuyIIWbkW+DZDJFqp5zTwogINFMn4eCg4hY+
         9uylsWdOKgAYGclH44VajMBAk5RysFdykQ+INyhzfIPWhz20aC8ipQzTLDCXvHruDdfV
         toiPFupxGa3qI0PaU/ggCG7YQr1aGxGCbcCFrMx5aVxc+a6jDG3iNSYo52sRRve9S1mF
         D7WQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq5n2sEOzA7S6t+KH75f/9src8bl+uSyyxjevmKSbHJMGhlCJiCxbnbRc5pUaD7MYKANpb5QTweUmKq@vger.kernel.org
X-Gm-Message-State: AOJu0YzJA/nRim/mIDv6kMa7t2hrAohvPNp5K3dIOL+rVTI0mLuOipB+
	LfcKW1TmA/837PRkVEE9R1ZJHplJy0hVRzK5/X2PLFT+jMp5xcdz5x1Wj/qHisbw+LMJAKsPH66
	3WxUbRDWQ5g9VgZi3kxosLOtI93G+6McZQlLJJCSqyASaQGNfFlQZkM+c/9GDF4jk
X-Gm-Gg: AfdE7ckR4+BPX0Fbz7xXq1QQ8fx7XdvKkE7ut+IYUkI2A3aQQK2kb+4jG6oGxvKm2wK
	jdi2mIETWcFylnAdnAJ2xiZOhkg+TJzTajsSam90UFSWXpBPxHR04E73o2XUmjXJ2q3LVPimNSA
	IiAql5N56CY5nUjHbPhf38On8AxpIee4VrgIO0uDdZnZzVREMLiKAwEmMLz9HtE7G5rCd4nGJiP
	WEVGTCszpNNC8mfhCV2A+3P3EUjfkg7zUE5atUGOMs4GrKmEEN4BbTSVqgHLz56SUAejUwDW8KF
	UyZw6hjX7FIfOiY9RFAIn9+R7Da+PcljNBPlCWdrs8Nf+cwMgROpDTOqJjQD9Rz0uv0bJmQslD/
	2wiQ7YaOb1z5gvwgWnr1CffzljDcg2ZJgyBwG9kz8JT1Ln3iBJSiiRH9Oafgj3z5tGkZw8Zic26
	vw2ZlXkcXG+bf0Wan6ysT9gP31YwPg7g==
X-Received: by 2002:a05:690c:34ca:b0:7ff:1e32:77ee with SMTP id 00721157ae682-80a6ae87640mr52015537b3.49.1782452849023;
        Thu, 25 Jun 2026 22:47:29 -0700 (PDT)
X-Received: by 2002:a05:690c:34ca:b0:7ff:1e32:77ee with SMTP id 00721157ae682-80a6ae87640mr52015437b3.49.1782452848653;
        Thu, 25 Jun 2026 22:47:28 -0700 (PDT)
Received: from agents-Mac-mini.local (108-89-202-162.lightspeed.sndgca.sbcglobal.net. [108.89.202.162])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-80259d20d84sm80029787b3.0.2026.06.25.22.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 22:47:25 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 22:47:20 -0700
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: Add HP EliteBook X G2q 14
 AI
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-glymur-send-v2-1-00905324ffbf@oss.qualcomm.com>
References: <20260625-glymur-send-v2-0-00905324ffbf@oss.qualcomm.com>
In-Reply-To: <20260625-glymur-send-v2-0-00905324ffbf@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Jason Pettit <jason.pettit@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA0MyBTYWx0ZWRfX0FSCNclmsKPR
 kA/gV0qSoz73Ft5U3LFO/eWuh7mhrIG76JKCSlTC1NFv5nbLHDHpsgn8t2ZDkanYkK8aY3uhH0v
 nUobIHbv1mX7jEAQJJUlUWwm6aedWM8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA0MyBTYWx0ZWRfXwaLlixCX2J/t
 oeYeVscCrY240Vgub9Tp0vtar/sk3XwSJrWmzRjVTcd0rsgSpmfVDtq8roiyd9UiV68UhvQeAsG
 JY6CpSUiXQypQP0YtVfHX6Looo2oh9mgZAZVBebT8ff1KShK1JHWruk/eAoJhY5pl+s3cq7YUEN
 Xm92mMk9aG/JsuAGXf5ujVm3XxzZy/Q6W+4cWF2WLrhPRU0z6MW3k7QFq92TMDvy1Awip6Spior
 FtrYfAE9F1JzO8q20ETRUyNYY1zrvro7sgoX/pdyWvjOEcl9mpkkiiBpqiCZDzZG/mQl6HhKVAT
 YWLiVaikUuTYPpQHkmVrFge5CQ5dtHX5iSG2fMpSpkw3FHZKrL2GLZPGNCDlFfuXRXk6f33QYhk
 mQYP4Tln/Tkrnzeo6sBTz43fzqDRqNb047c8dfgn3iXFRs7nJDO+R7EOqegseSYWlva23CcTy2m
 vITVJnKhy/rPEBvDMzw==
X-Proofpoint-GUID: i1g98MWxe8QHN7teWwx3tarUEGIIARtE
X-Proofpoint-ORIG-GUID: i1g98MWxe8QHN7teWwx3tarUEGIIARtE
X-Authority-Analysis: v=2.4 cv=AMxnnMPh c=1 sm=1 tr=0 ts=6a3e1271 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=AgdIAmbgiPN5lz+IpyuXaA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=FzA6eXefDna1RhwR9dEA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260043

The HP EliteBook X G2q 14 AI is a Snapdragon X2 Elite (Glymur) laptop.
Document its top-level "hp,elitebook-x-g2q" compatible.

Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..934f62407b86 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -68,6 +68,7 @@ properties:
 
       - items:
           - enum:
+              - hp,elitebook-x-g2q
               - qcom,glymur-crd
           - const: qcom,glymur
 

-- 
2.50.1

