Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93904A013F
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055527; cv=none; b=m8fCsU10DhHJe20jKqj9s0fuxbOzF/rVDc9+g00S3kjeBgfBJkE+WE84tc1Y0SYnlMNbPiCkj9Y73tZODqQEqRFN0MSpNWhuYwVgCixJUxKK0yXi/YZjFotHzjWCjo8N8MdoYZGEW5BqpC1GINhdOgsSgdk0rIHwP7vNmd3ZY9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055527; c=relaxed/simple;
	bh=14UNhDwSqIGwxH8eFCUOb/Ru8LN9tAiu4BmjCrwghaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vqrr0zk9knshqub3dgEfIDB5ZRHdUQqh8OtUl2DCufH+01dvcIbiyGK+do/kCNAmfNfUUdn02TNjokngrF173cPou5tx0ywchBPfxyFNuu0uqvtOoEcNkSBdFNGqfJVJs4mQUNwOmsDA/8aPfc8tZbELSsPG0X0IF4aJtTEL15k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aMNRiQwI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LdZJIOaw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aMNRiQwI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LdZJIOaw"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F8vug52885808
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HUBB12m89z/qSO0zlxArjpEPX2BkQ4pnL/v03QTeSF0=; b=aMNRiQwIIFWHlTal
	SIMFgwXbrdTzdpk6c7h5Fcz1W4YB/+YEt+u2yda6R1bMQEhvFAFGefcMhLVx4d6b
	cfrx+yJtHLY24a0xFmPGjI0TgUQS36D3YZFADs+ib07/NM0eNuP5HDMeuDPBF3Az
	FE0Z4+ApkZAntbkmtGmpDzjqllBIQo7FPDXkmRcQRKc1iTBOo23zjKxOiDzxLtxE
	xDEGP6YBLly6OPtftIC1XGtF7RpjLajAgWFHSsXoFHXniHNU0lpjME4SKEJ2w/rM
	bjC4ShzKR1cvtLxdqSckr/Y/1bkdqM0G8UOZUmBocuZ4WnZLj6N7+WgYxtkOgZ+m
	oXxSjQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hausm02bg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:12:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93edac5877bso50710985a.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792055524; x=1792660324; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HUBB12m89z/qSO0zlxArjpEPX2BkQ4pnL/v03QTeSF0=;
        b=LdZJIOawlbS/ar0c4iL2op4HXcHDicWfU5NnYxtsitHluYHJzrUBWSFlCdAX0DK/JR
         STR2bh4ugvTf2zjzLEkifKkXq+mqwVsG+CoHrFwxSBE+Nlg/3vA/4VTf+RIYL+HHRtP7
         NPlnOwhZMoTVcMi/lw00F60wYHMTgXsCTV70Va38Co8+y7kKfwww7pgoJrm7MljxaZxg
         WN9woDzk5TPf6Zf9XnWoK3kPndudq5GG4gnxiFnHpTZ9P/KWj+bQj237X1yhYYlP0X4+
         ZfkA29f4NxZ1ZAqb+nRk8hVlrQzQr/3A/xwV6hRSfExZUTt2P7h2R6kOEn5VKD7w1DYO
         d43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055524; x=1792660324;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HUBB12m89z/qSO0zlxArjpEPX2BkQ4pnL/v03QTeSF0=;
        b=YKFRLub3r54QYSz4ftxakGJ4oyBW85Pp14AmbIbyX7oE0lWhbrEq1m30yyuWYDXvLY
         wCFg+9ijCjcA0+sXSlx66lst5nhawCGJyhwvaZxkt3Od185G7Ayd2qC7BaRsXRE9jLnQ
         CdDjEdmNzOTudlH0bmD4Z4s0PXfaNWGTUUThb2FAhT29+FMl2a9MdHUXPX9mNgAiur0E
         ac87gPaRbZyrnrqwXmB7904O8DoQe5GpfH9BYaVMOXbiV0Doqm/+2McTE2skRxO8gPK6
         7D+YKtJligSwlVG5LeFZqlnsTPXQ/J+wAfOHf6Rn9Wm2treoeDYJwQWy0TyTY4cahKqY
         BF7Q==
X-Forwarded-Encrypted: i=1; AKwUvBwO2kIjVLqTi++TdRwTRtKKdjptJY8BxShztaDWigzPMyNneXAoeP3V6raDBzTVq6vqFLc1LsvQx2s9@vger.kernel.org
X-Gm-Message-State: AFq9FYIYyLTd0LviOBOaA7SvC+06EG8fR90RrJATNj/rZrLXvC3JkPA9
	zCuL0AEKPON/l4N222GSEhP9TlnMM0DCdDDXoauA2+W9uCtbXxx3qqclO0BotrHrqOSfHZ+BmT+
	AP8AmoeDHjnZjgmZ+xnp0hY1C5oeVNSNGYTQ4OOcTTGN9n9r6U/eLMVBVLi7EudxY
X-Gm-Gg: AYBFou39KJLb3lP6YOTPknooicDkpVRFDC9yPhj4cqJwrEZkEZygOQ7An5v9qnc9Vxs
	umvAMOkjmX6Gpl4Rrb/o3WncW6+VEY8w+Scy5MTpGZc5qXIKSaloMjCLR5psUVVhke6a+kHEDqS
	B4sla7Rh2iOgqzQX0wODZYMK8qkHrK9SB5P3elXgrI3yc9bRYzk4WxeLuWqWtBM5Wfnl7O4WNGK
	mT2shqknfMChWOBZrpgT38gS2cxlmBQSlf3Z9mdf1cKUKkTqjR9GhFjw/4TdkksiGnF2n3MbiAN
	a9MzNsAzsq+7yy+RgahQq/JnnQ7DhWOYVxe/MgTBLY+Fu5n2ZwKbPBpl1XlbdE953nWdKnsfe3c
	T4wAaYzmHEboJkdz8G5KLnQ==
X-Received: by 2002:a05:620a:2b86:b0:93d:9dbe:5bec with SMTP id af79cd13be357-93ebd10b418mr3112657485a.2.1792055524073;
        Thu, 15 Oct 2026 02:12:04 -0700 (PDT)
X-Received: by 2002:a05:620a:2b86:b0:93d:9dbe:5bec with SMTP id af79cd13be357-93ebd10b418mr3112654885a.2.1792055523631;
        Thu, 15 Oct 2026 02:12:03 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b20388c1f1sm2263767a12.26.2026.10.15.02.11.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:12:02 -0700 (PDT)
Message-ID: <eda50ac2-bd4d-4151-b041-7f9fd56d9fe3@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:11:58 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] backlight: qcom-wled: fix unbalanced OVP interrupt
 enable
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
 <20261015-sm8150-display-card-v1-1-5c14928cef29@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-sm8150-display-card-v1-1-5c14928cef29@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SCvYgt9W6tfjiOG1_5o3mjEr_OW_-kLs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfXxy5gR5IbaNcY
 kU3kuAiuhw4zE+jhhO1JIGKUchA7PsyjoogZvk+0/+Gm3hBMa9QAdclf6VtwLyXo+pxRK83nsv3
 qH55ymwCeKBSpKs752gNdd+/KxeKXGg58bDSNha/WypDKCkNaKWodr5HR8IPVE6MCdLZ+qV0zA9
 Dkbue+LMlG8k+ajjpKrovpa5lx5Lm5fzdOXvUiRA14gNH6EYp8n1sz2q8HUAM7qNxQkGSoLwz0g
 0TK6P4JWnHoSHyGlQYn7XSLCzYSHHaitvp6UzN7+RHCDnjouFUhiPWKwszjRTp0bdT+lMInRjo3
 fxeWprThGZCzIGTxWIwPXGHYyD561nj3vouoywURV4C4n/zncar/Nh3Lo+P9YRlV575HpMoxBTv
 1Svt1pgDDh0J3ckGTGz2JFtrRryDd/plItittvmsT5TKsqi0l10Uc4Z58TkBO1w9BqOKWw6jfdx
 qRy2Bh0Agu5ZRqhPV8A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX8FSu1DBwVaFf
 oMs5rtXo06QC21La3aOeliY8dTfKst40Gp0WSSYmN4qk1hOeJy2bJd2LPRNEajjxQ7/3wgj4kXC
 id/BJyvtx3OMuPpOg9QDYjwHC34n9Co=
X-Authority-Analysis: v=2.4 cv=Eb5d0/mC c=1 sm=1 tr=0 ts=6ad098e5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3BQMGBUH80HoBbyhx_0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: SCvYgt9W6tfjiOG1_5o3mjEr_OW_-kLs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150036

On 10/15/26 10:58 AM, Dmitry Baryshkov wrote:
> If the bootloader leaves the WLED module enabled, the OVP interrupt is
> left enabled at probe time. The first brightness update then schedules
> wled_ovp_work(), which enables the interrupt for a second time and
> triggers the "Unbalanced enable for IRQ" warning.
> 
> Track whether the driver has disabled the interrupt and only enable it
> back in that case.
> 
> Fixes: 8663c188beea ("backlight: qcom-wled: Add auto string detection logic")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

This was merged yesterday:

https://lore.kernel.org/lkml/20260921-qcom-wled-backlight-v4-0-bab8c7ef73cb@ixit.cz/

Konrad
