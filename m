Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2F93FF1B8
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 14:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783347259; cv=none; b=CF/i1gbDl2DXOwmXMRb+cZJ/aIsmPnJydj/EfOZ+RpuNH0ckea6zPD73shuVQDd5bDmkHMF/+ngRVchvmiLhf8aRoWlAYC+i8CA6+8UKE3grqmQSMhFrZru1USRMlXJ6GjEMyofM8mKW8I05PBZMx3oF2NwExGflgom90CWXyng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783347259; c=relaxed/simple;
	bh=7IahpDJ1DuYoTWIZqNSkER42hbvjKl/EcCP098m+u+k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eM+pS4at7AE3VeDliKGPSXnH5sRi+d1e5BUV1TRNZoNX3drIp2iTgu1wcq6p6Yr4B8x14tHO70iJ0xNMuXX94fimM+bw121vOBJyGs3JepF+EoXitp24oVKfxj8MT/hmr0kILw7ma3kq1LoJV+EqNgp1ui0DL4/MHLD2dXfan/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f2VylNJ4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jYbSvDfm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f2VylNJ4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jYbSvDfm"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666EEHBi803566
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 14:14:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TqZ3hCm1GzE
	D6pYA/Tya53SWdZUTZ7PYmjRSA+N1iJ4=; b=f2VylNJ4PJcwfbHQet2xMKBluYf
	xpvxFCNciqNXs2ZZESftNeaQgie1n8IZuKggPw6Bzz6DoFyey3ZX71TY7/dAEI8V
	TOxWmcHd33Jys0qOT8BVTpYVFha91oRoWdOocmOABU7AAZkRTyj/BvUmqzYudfno
	XDkY9XzanfIa9cYb1n2UY5uUgXLECuoktyvS0BxYm4NjIQYk/nzfYkARiAHAb5kF
	aKugHA2rc2LEq+4DwHgzUlG4B/uSUVuxsntMeWvlw1grWKZjL06qKJiQk4HejfeY
	LbdIpGPoNJjOCyz+RTyCx9LnkIRWv/P9P8sWpGRFzjT50oStWwQ1SLH7adA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h51g6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 14:14:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3840994b0d2so3084279a91.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 07:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783347250; x=1783952050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TqZ3hCm1GzED6pYA/Tya53SWdZUTZ7PYmjRSA+N1iJ4=;
        b=jYbSvDfm6xenWe30aWn+c1/iewJlo9h2s54/ajWtC/7vzJR0uHU2ecsVS1SFXW4NCZ
         jJJj2kaPbtDuS5TpnLXaJCV/H6+FrJLEgfz8xVU/jvom5/buBXKZbDnO+su/VbJWCyQO
         eO5PN/8Qp9pQ8MKjEQSD0t7vHjem0wvzugSRX7b6A8UjAg8ti3TcfszJW1NLE73lGGaH
         Uzbbkx3/0zKzotxxFPPPa8Kt75WRNP9iI6iFgIguQYXFQk4gmMVwI1taQ0aJQS/ghEYH
         hb46JtAXOqPOEGAlU15rARVLeBkSlHAd9wUgqoDif30JRMMqgPe3UuEX5NOqRppqchB7
         ct6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783347250; x=1783952050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TqZ3hCm1GzED6pYA/Tya53SWdZUTZ7PYmjRSA+N1iJ4=;
        b=XM923i1fHhsFt5C0m9JD3YY/BfVHMUyhMUDn4n8nK8QUGSmyE2mOErP7zWdET4sRbw
         ZhbLeCDv5rxeg0e9yFquqlgFANqjKxsW3wzOz7VqIGOAJjp7B/85PuftG30QdhvJ20GD
         1mKDYy+TxGvdlYsunN3LSH/Zgyv05Bce462Kwc2K/OjC7b9Cdzhd9NhRxNwC/0J+KnMw
         rW0xkBXscmchlIMObRPvKAKmW/8juvV66Ho9llLfQnPf6zoKRll53APAlsNHVLMKgM45
         nsuihkSOfGOwLhYtzhhNnQ6zq9YUgegMMLXZs23g+CS2LF8dlh8/ZU9t1vCHkNDm5dXa
         HfXw==
X-Forwarded-Encrypted: i=1; AHgh+Ro2J+rv50sByLB0lV8ew0ddHKzbpi9qnIl4hISTYOOfYKL6JQcEfzk6ZG65Db+JV71olWjrwin5CFZe@vger.kernel.org
X-Gm-Message-State: AOJu0YykPMr3JGYymIZzmfFwpLqQ/sPIu2vfmrYIrMjwLv/phsdFLDqv
	tfOXherir6WB2mEFttncieNMoBnfAiiSJh2yGzaeEmsSEsNyGASZbEUghqXPMvYAXns0YRl/FVh
	LbycUrcQaXAAUSqmVv80ftCrc2x1mA4EiOgRHlm6vQI4xXiZN2IWKQzmWZDNLLest
X-Gm-Gg: AfdE7ckhNW871gJvqRDdb5B7B5D+B0z52y39g2xp5XaaNyM5yBEBJ3ZDKk9nO5vXXRU
	zx4QbqlrM/fJKmGh+FgW4l/dsxYMlPMRUOTzdTUe9H1JL+Ujdf8jvJ0sOTid/PNX/EwAZMU92Dc
	1jUNLnhs2dKHT64dWKv6BrLutIJOQZcw0//ecq/h8kUNk8AJajoHikGUcHDzM4e9LMJ8WDnLs7f
	hBZO+EERW8WkYd/ZzVnD7MWjL7X0AlbBTbAFNwdERtHrV1MHjXO+9dPFq77QIhpGsvkxN5Zq5nD
	sD5iv2YqsaIMSqy73kgmkLxRvSqI1XN8epJbTWsPZoyN59t44tBgM6rzSXBwkmjH9NJdM38LwSY
	DY9VyNEKOaRjp/qRHiGbkGOejKqz78qNfHFBd0g==
X-Received: by 2002:a17:90a:d003:b0:37d:a52a:ff12 with SMTP id 98e67ed59e1d1-3873dc644f8mr831040a91.10.1783347250429;
        Mon, 06 Jul 2026 07:14:10 -0700 (PDT)
X-Received: by 2002:a17:90a:d003:b0:37d:a52a:ff12 with SMTP id 98e67ed59e1d1-3873dc644f8mr830959a91.10.1783347249787;
        Mon, 06 Jul 2026 07:14:09 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38127ae5b06sm5118416a91.3.2026.07.06.07.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:14:09 -0700 (PDT)
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
Subject: [PATCH V3 2/4] dt-bindings: mmc: sdhci-msm: Document the Glymur compatible
Date: Mon,  6 Jul 2026 19:43:44 +0530
Message-Id: <20260706141346.4180348-3-mchunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260706141346.4180348-1-mchunara@oss.qualcomm.com>
References: <20260706141346.4180348-1-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Idpec8mJ2IDbS1BDqtlqWlsqNPRJQV3f
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0NSBTYWx0ZWRfX+o9+F+rxouzV
 eKhhtsDRZamxE2JcvRNJQ/EnB3CiuzF6ITcK5O21WENo+evxXaEnEJyxk7mqpvBJ/Eh7nY20shB
 6sIsOZpG74HG3xy2kR/bs5soU3Y0JMw=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4bb838 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=etWctVU5WMrq8MRftbsA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0NSBTYWx0ZWRfX8lCfGpRSjv++
 rZboHfNzSNpRK7i0HAv50FG339DkO69TmGal/FjCJIK84ZPM9twAUnAkTHa6AcT+EP+jk68L3QE
 I5D319jzLKJLW/Qv+qLpdwLQtegWcJWLWpdKmzdckBdSqP6Is1mlLRESg2sj4O+8aS1DPs73bNA
 IHwP0g0B4GhU3YCB4ovQTMuFLCmPDHmdwf+IOxsiyZvyGt1uEV4AvRbn6YmCV/Hz+e9WaaIq+D+
 NK3+JegkDkqWzqdFImmIaJ2YA4HQ8RpDbUiJgVxmlOpZlziEiVsqExhKe82H8RBWxczk1C56Tzo
 GYypu1FaHz1DvsvH/bVJn3v4XtcMKBzU9JpSG+W1oAAUftmVA6pNecVePyD7N5TsEs/mRXO+JSW
 zFVpncrBG2+ivxIbF3mw8ylWIKpmE9d+bszy80k7yCxxMWe5l7mHTkSYdqmTHsd9aEJngteDcsx
 fmiDfufQAMTJWUXKTdg==
X-Proofpoint-ORIG-GUID: Idpec8mJ2IDbS1BDqtlqWlsqNPRJQV3f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060145

From: Monish Chunara <monish.chunara@oss.qualcomm.com>

Glymur integrates the MSM SDHCI v5 controller. Document the SoC-specific
'qcom,glymur-sdhci' compatible as required by binding convention to
identify the hardware and reserve the namespace for future SoC-specific
quirks, with 'qcom,sdhci-msm-v5' as the fallback.

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

