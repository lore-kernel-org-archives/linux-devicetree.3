Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86ADD3F0770
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 11:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779104732; cv=none; b=FhO7mJRSOU5xSKxdWAiRcXmIWdCrgZeZTVrgpI5wcnl1swufJTaJWPKPmu1zSGEolEdtSdjDrf2RApSPbR9x6Ueg63KLtuU/scoDdKlSVcRG6I++su/k5QbwpIshINGZgvK5aU5yFGYIuXj5ZxkccB3ftyxzcRhV5ugx4ssCAuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779104732; c=relaxed/simple;
	bh=9t7iVOOI+UxQvm/pVLW0wCjraZfj91isgU9NMHTFucE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O/Xyns86DQgesC2njF8h1CYo7E0fUdEeTKFNh0uozDjxNtD/HbtQlkI4xzPVQwsuFQX9POxDjCoSnhB18jRtu3DD1M9EOfqmHvB/ywb5qSJHzC2AWN8Qiapmhq5PNhtjPlB7cLjwn2dqhwPOX05MdZL78TcppjW24ullD70DLgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O7FaMvne; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dGwJpXqE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O7FaMvne";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dGwJpXqE"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I8Fc662444106
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 11:45:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CmR7UGnplXVXf6dhWEhuPDxQ
	neGsG+WELjkD/IvH4PI=; b=O7FaMvne7gZQizSB3tPGG9dlpS7EwO3kO9DO13iG
	piEPch4CO577PgXnH0z0veO3qTibsdWc43XYZnop0J7xp0gJVAXwyNLYIcqRPJ8r
	TyP6Hyl3NYtoPheTcWkcZYct7z5tznz89HwBxw84IK+/hS5XJzo4LRjXOKQWanQD
	9D47U0YeHh7QXHO3oQfoTYUwHW2cPiwkeZGw8e5gZY7iWj23eODh1mU4hBdaCLiw
	YTo2D24OGkaYxAkX2O0BCseoIVrGUmHj8oUlGXTFZxSowzYN2B3V9F0NkWSxEUjv
	7AG5PsLrWESnCGraVodWgWJRtYJ7LQ1c4BX0P2givXO6lA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gx6x9an-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 11:45:30 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82fd55bf6cdso1402504b3a.3
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 04:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779104730; x=1779709530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CmR7UGnplXVXf6dhWEhuPDxQneGsG+WELjkD/IvH4PI=;
        b=dGwJpXqEjxQMmppCvYtQhtbm+xpeK3FRzzqsSRTdJGEX1iQc8PFrq2Ukfw4IYMjwZj
         AaG//CY4rKBTXgSk8kW+OdMeco3k3AdZuxKwt5HaXeZf3JYNAR/Z4Igx2FvSoBd+2g+d
         CU0ZvgtY/Jd355j+bGaxuOgHoAwFP8bjRmZETe1ke2AdecR6jtX6Je6fGqQ29F1KqMmH
         /9ewwgX6PEdNmyJNmg3JPdBM94Bidiaxx6Fk8YWaNEkXkWejIMJKiq8mSjbdesYyrSA7
         BQXk0GJP9pGhmCE4KA6q2MY6w3xPnZWHIsLglMJ9BBnQfOI52RMV4WYfVKEoONRgicWJ
         guJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779104730; x=1779709530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CmR7UGnplXVXf6dhWEhuPDxQneGsG+WELjkD/IvH4PI=;
        b=H+gpxa8mx6Xi8jTNNpO/C4FwG0H8KXXpGjKoWdBQ2XzfAY7mdauCsvuN3yin3/RYzd
         wzngKkVMvo9VsM6NAmBfI4v4fMmoGfzhDcgpho8iMY5JXySC5luvJM3zTQYrEbckxdEi
         YMo5yI/ucuSeH3icVtPdpQmNTe1y9WZ+SX5UxMhNdTktMvydMedAC46vVApTKjIFADpt
         DFzsqVb5YZcbRpdZ9H2NBUo9QARsxG8hFjEQHNZ/d3WkYpaHVBVBrk9vjqAMhKwkN0IC
         K5Bu3MOwB7wrml65uDsftnQKyTzhyLRjbAZCGjZmANLWX+mr5OOPwuTQAA/HzVZXE8W4
         3ahw==
X-Forwarded-Encrypted: i=1; AFNElJ8N3wVnyGECds8XmLlS3gneh6b+aM1SO63m50e1w6WOQyGJJ2hYnrgoCa3HvKg9WuzCQze5oYJq2CxQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxJZ6jhPdJL/HplrbipY6Bag1dsVd/QPZrVvLRlxapaKPvdtIX/
	zgx2Tvcewb4mqQPkDpv5Ejp1ZMMRg2EwAbbrMPEQBeMGK4lSdNYj9NSPYJsTSfUoNtusJ4jiheQ
	pimWHhUO9wos9f+ZPSIezhUzXZgxyc2LLCvGcMrzNM0jYAfZrbehdTIrG0YmF5U9z
X-Gm-Gg: Acq92OGYHCEiKTMjXn/KMPfj8a4TMh1ZBsWwoPTdR2x3rxCTHJq5fUm0jUhPzm20q53
	BV3PrJ7VOkA6KpWsdu1UhHl8o/LkraOUqXr3edc1+Fiddf14jx1fmgRjXp5MWHPrDU8LvWp+Rxc
	IGH0GO5NhrjQExagss7HIVmwEVwFShBLtgZpd1Z+NEblU6oqIHEKwdKsTTnJkFVPg3Y+u6scfRY
	szGmVqDOx/n7Fv9RKSl2W3S8EM5xzKNCDUB4gyceOwpGz+5XiWKrQtwNZOsUCJYFhXx4rpHA/Qd
	zmk61+ocUGQXG/PLdnlj8yoBY4ccW8vMAncfuxw/uGMnskKqky3+Egsm9CCbBGz0o8rWNeXfszu
	6iPyUKoOhLckanWLIH9on+EUeAqwxZSRz152svUuoYySk/4NX
X-Received: by 2002:a05:6a00:12e4:b0:835:405a:7e68 with SMTP id d2e1a72fcca58-83f33d9dd83mr15071386b3a.32.1779104729874;
        Mon, 18 May 2026 04:45:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:12e4:b0:835:405a:7e68 with SMTP id d2e1a72fcca58-83f33d9dd83mr15071363b3a.32.1779104729357;
        Mon, 18 May 2026 04:45:29 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f63bb986dsm3984653b3a.48.2026.05.18.04.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 04:45:29 -0700 (PDT)
Date: Mon, 18 May 2026 17:15:23 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mailbox: qcom,cpucp-mbox: Add Hawi
 compatible
Message-ID: <20260518114523.kll5qlwfwu4esnf5@hu-mojha-hyd.qualcomm.com>
References: <20260427182412.3666971-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427182412.3666971-1-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: w3Qw1kvW3IG8Gptr8qkrp0W-Q02Hg-jN
X-Authority-Analysis: v=2.4 cv=f614wuyM c=1 sm=1 tr=0 ts=6a0afbda cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=OZ16uQIpaqB3DC0mcKYA:9 a=CjuIK1q_8ugA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: w3Qw1kvW3IG8Gptr8qkrp0W-Q02Hg-jN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDExMyBTYWx0ZWRfXzRuHsU+kwuXP
 6BTqti09OO8D7By/xP2jp7IdcEaL1Q98Mw7sp/rY7cQmKLl//1y97o/BS6KTy8LDEvG3/yo4Wrs
 YtyFLV1ReT2jfyrPXxCWFNVtTqiRTDyiIqg4aAgRzEzZw53rD0zCp0LM1vb1fimZpg/lhn+7z1J
 CLiBLCZBzd0c5L2YsJ1RnQIoYeJjeVbJVfBcLV5Bn7/qphYP0wuArfyKtDhSUezHrIR5aCudGVz
 QqYyLg+BgrdGylDg0V2pg675o40jUvE+EvQYvaZSorlRCEihdUJPHb1S4hdkNaP0m0/Udw9xn41
 x1skGG4yym0S2qOf16N25WqxJEJ8GIMG6XPsRUnCg118oiM+5wIcCAVUBx0/G0oBLTQHdVNNUfy
 GGLO5dYfyJGTPtCl1LDt/O3sXk+4PIx1/tm/40zsETYLWNOY4uidG0tAlpt/ZLjupPn/aayp6Ur
 umYJuLxZ2SfFhPLL7ig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180113

Hi Jassi,

On Mon, Apr 27, 2026 at 11:54:12PM +0530, Mukesh Ojha wrote:
> Document CPU Control Processor (CPUCP) mailbox controller for Qualcomm
> Hawi SoCs. It is software compatible with X1E80100 CPUCP mailbox
> controller hence fallback to it.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
> index 90bfde66cc4a..167ee222a163 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
> @@ -19,6 +19,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,glymur-cpucp-mbox
> +              - qcom,hawi-cpucp-mbox
>                - qcom,kaanapali-cpucp-mbox
>                - qcom,sm8750-cpucp-mbox
>            - const: qcom,x1e80100-cpucp-mbox
> -- 
> 2.53.0
> 

I am just checking if this can be picked for upcoming merge window.

-- 
-Mukesh Ojha
