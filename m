Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792461931;
	b=tdHn5KVsVdWJuRNL2VkxjVf2jhAD2/2pHOricfd8py9sN41aRPUmtM9O7FR/hRvisxdd
	 YrVib5JkjyhmhgzlXOW7ngjoPkhJx6rLcfU0SoUhHVIR/QXkdDN1k4Q2qGL/jimiUqU3s
	 bTyhdXXRPrd4dNepVt0KTB2O25Ra82IGlOkDQRFzrC9KpXvNqBwVonxn7nyg4rRz24h8Y
	 GjUnAtn77tv5I5wBU9p3WpQeBVjYFfpPNp7XrrRQZOxQSFgQm3CI3AtkSTLs12SDivrgX
	 mBrXleZv3q5fplDvEGyklryKDEm1O1InWMHnnt1bbXxuga7DsVVDKOAq/7rTErWbu6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792461931;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vcglXXCdLJZcuT0AS+TO6iQYBvNu/3CXXS4wmQqIQX8=;
	b=qkZYG3bWZcjQM1zI/zaoawmaowhw2DTuwFcVpSWl2snr+qZPxiVq5ncpfzbjFKhBqmcl
	 +g2YkJ4/MPjE/OGJ7yU4HwiSILk4+e6zwEwdRU56+TwTtuzwWTYMDItiFB10e68Jhop2n
	 zj141yaZ/8awxxle2ScFce0L8QfaMJgXWhvDOt5ID/+6a9HX7SkgIby9GxHISNSURJscg
	 iWIJD80lqQkPcge0J/mkiZ/rzBI935MgJh8jW1HNN1YpcarhX4mY+7DmOUTqP1i1pzN98
	 3YmgoXFxBBSx21QwESfyzpXgHD8J1AFDKL3PiOw+dilvGxcBaIrv2hXvFGYFE2xg0OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aZq5hCtH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CVN3IcfF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA05606A31B
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 02:05:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DA05606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aZq5hCtH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CVN3IcfF
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0t6lR185928
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 02:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vcglXXCdLJZcuT0AS+TO6iQYBvNu/3CXXS4wmQqIQX8=; b=aZq5hCtHuETxGA1d
	ZgBXVhAeq9Yo6J6HkuY5wNC/RzzrWWWntLhjFbb3RvhB7BVaQOjaxailEjrVz6Jh
	j5D9TwTFCSrG50hNd/Yr1IabXFaJXsdnaBWme5gVYQZr4mXtD//Lh5YdOOe3gZtW
	OVkFusIxmL4UYUmRR6HUt7gkFRb9dzo+uyn0RyiRVHxQ4gXAdQxQTKxq49PXP+YF
	FkkEX4E6zb/2euEk8c7ABOg1nSAPB+HKexzfroUiIpQj4ptVIJNx0vK6LrVvsO+A
	vDzP45Fb3dQ3ZwjTL0UOd9n8fG/dDUSB0xpsDOhk6Mm5OHrs3pUXgxU5mk95sqUH
	4k0SLw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nrcpf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 02:05:30 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so8023074eec.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 19:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792461930; x=1793066730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vcglXXCdLJZcuT0AS+TO6iQYBvNu/3CXXS4wmQqIQX8=;
        b=CVN3IcfF6ATvR4PU+ZFbsTfG95jwDQiMsZBb9vQ4cHNkzmWdH29TVZGp7y1rRrzgpK
         PTXSakC2vfAO5ufwgrceIwgJVx2gBsJ7rfanb/EZTw4Qfv2aT2goe7H8G45MdycYqFBg
         UMCwgkU4hPSTCK0LMaMpAOf4qsYlmga7uTfG8Sna2M8F8JM1ryaf7WWqBEL04elHx0sj
         iLA0S14yTYW+RQg9T7yk1PlEnYvPZwmh3aURklViFOC3LZgPIzgstqz5DMxTkkH7LHaQ
         umTbneZSnTcl7z7OrVnMYvWauRFqthXm81AjPBWP4UGFf+Teo4BarsiDZG2tbIPrKnq6
         YL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792461930; x=1793066730;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vcglXXCdLJZcuT0AS+TO6iQYBvNu/3CXXS4wmQqIQX8=;
        b=DjdTFfR4vU6L+YNbnLrVZ9MuBel+YuGSQkGaLH6XFVwyt6epv46Qnel//7g0XO6cFZ
         r7DIhbDmNsfwkxgvdFyS/kRs9Pl2K510y4aOMTu8ZngKuoBEcUJzbMKgANbOKUiEboFR
         ahnpkgdXfcdMe+rrJKnMzU8YZ258zoJ8JlNQJpOHfhZo4kEDwIAHXSWk1o0/k2H/a5IM
         Evm7Vkq6LgHt2SrJNijWaXdBKF8E2fSeQHHjCIL4/KTIfHBlDpk7Mh2yfIzF1EqsadwC
         rd2bzsvVw89zHAxEh3IJycnJ+tz4uiiRk6gkABQa1r2hpnuMmOyG0g1sy5EpTHJaGgEI
         NrZw==
X-Forwarded-Encrypted: i=1; AKwUvBwLeRtSej6yDo9AUZvFrHph2AUHBLnl+vky1b0/Dn/bQ5wS9fENXeRiB2/+Hv+XenArFlfxIqNVFl1R@vger.kernel.org
X-Gm-Message-State: AFq9FYLnU9XTbAljTCAKcke/xlYcmtea8wlVUIZcavMVTsCZzoPfupcI
	et6FAdWpJ/Eqp1M/iKQ22ZFYeig0uGB0fwyBf5ft0SSuHiwEygmTMqAQGrwZK7DZTabLGWg0GnS
	eJv4ZLX98azZYIYqvGtIMAw1FKft9hDrNhMPdkUj8FbdbwJ3CAcEUGUqStOdh5yIV
X-Gm-Gg: AYBFou2Vs6N0Ag+IGI9lQupw7qB0p6F+F1jZjCo6T/nLgGv5ZSFy6wermTh432HT/lw
	TYENVqFt4vaekmbA6WAuekDjvS8L3HTaRCDy2ItTaz45rBa+/f3vCRfJhqL96DDG45lRNjV2FPx
	jIUQ8fSrEMEWANfY1GdCoDhD0MlT6qi5PZyWO+UyCxmj/6h9WyVa4vOzFqJBJ5FDLeG/sOwgMsQ
	ciZkVG4a7YQij1XBAanZeyUVpZMmN6WUIaffkABwNgRbICgPA4im2+V9PL1GN7l+E4oDdlh2mul
	FyRuaqdM9faPEbb7jD+KLD0/x+zHLPvxcl4B5jz1qigYLpxymmFUTpGmKQIKHCoFGc5S81Xl6Pa
	/kYsKHhMv9fMX5e9Zg/30fSCzgpqYRyAE/OA=
X-Received: by 2002:a05:701b:2918:b0:18d:5988:8d3 with SMTP id a92af1059eb24-18d59880c2cmr1634936c88.3.1792461929352;
        Mon, 19 Oct 2026 19:05:29 -0700 (PDT)
X-Received: by 2002:a05:701b:2918:b0:18d:5988:8d3 with SMTP id a92af1059eb24-18d59880c2cmr1634870c88.3.1792461928590;
        Mon, 19 Oct 2026 19:05:28 -0700 (PDT)
Received: from [192.168.1.235] ([47.231.130.140])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm36101206eec.13.2026.10.19.19.05.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 19:05:28 -0700 (PDT)
Message-ID: <81aa3d0f-cce1-4f78-9610-67815507bba4@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 19:05:25 -0700
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: configure C-PHY in the new
 csiphy_stream_on()
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, david@ixit.cz,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, bod@kernel.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        bryan.odonoghue@linaro.org, linux-media@vger.kernel.org,
        daniel@quora.org, konrad.dybcio@oss.qualcomm.com,
        christopher.obbard@linaro.org, alex.vinarskis@gmail.com
References: <20261017040529.3832120-1-anusha.nandi@oss.qualcomm.com>
 <a561ff9d-eb2d-4097-ae66-c1857f33e42f@oss.qualcomm.com>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <a561ff9d-eb2d-4097-ae66-c1857f33e42f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: XaVu48b3-P_eO6FMh4WxRL9jDV1q7kED
X-Authority-Analysis: v=2.4 cv=DZOCOftW c=1 sm=1 tr=0 ts=6ad6cc6a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=TcmD64HtHlR11PSYA/r07w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Ra3kV2IsKW0ovCRCs9YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: XaVu48b3-P_eO6FMh4WxRL9jDV1q7kED
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAwOCBTYWx0ZWRfX6ezip8rBIP0Y
 7ab8lpPL3SvTaHA+ZRLv58oyZbIl2uPIY6iqa69MnUzd1jpm3BjKwwT4/rTjF+9epcBspeim1Fm
 W5q1nNunto4YlanET2kpimS29mQDc/lCBjwvPjBwzLTkCXEeDD12I4NoCPcSFaUQFq3Cz5LHICn
 HE1pZ1UYAfPZRkFkLPCvZuar33P3GV0ieluJN6j3MnhIlbwEQGmhl4GG82eumTF/4q7tUYbOIRq
 kPh4oLyLVXytYOe+a2D0l69FuTfrBQOP9d4LksN5TkaJNaAMfNvly/m2gqvIRGRYBEx6uC22KyN
 kAUUxuk6Eh7337L1i5sdsZ+qzB4fdmI7pbY8L9oEhRhdHYBzfAZWTd7t9C751/MjTpSzYrPr6Hf
 HiIq/IXW+A7DOs8I5J/OvamUCsT/OR3o0tUPNqH3UQ38T361PNBUMKaUzebjCwM/KUeJsHTYlIo
 46MsXSazJBTS5mM9Y1g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAwOCBTYWx0ZWRfX3Jp9te74t6Sl
 6kXaoLuXocXnQ+1GugyzgIaWTzgXelIifcI3z2FZxu1Vyd8c4sdIRrOeHNPi8tZwo9tmdhnH7uE
 rkAR3Lcta8x5n83WUAENqK+FJBeNDVs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200008

Hi Krzysztof,

Thank you for the heads-up. Apologies for the noisy CC list — some
internal addresses slipped through from a prior workflow. I'll fix this
going forward.

I'll re-run scripts/get_maintainers.pl --no-git-fallback on a current
mainline tree and switch to using b4 prep --auto-to-cc to manage the CC
list properly before sending the next revision.

Thanks again for the guidance.

Best regards,
Anusha

On 10/17/2026 1:07 AM, Krzysztof Kozlowski wrote:
> On 17/10/2026 06:05, Anusha Arun Nandi wrote:
>> The new (non-legacy) csiphy_stream_on() introduced by the PHY API
>> devices support only built a MIPI D-PHY configuration and
>> unconditionally called phy_set_mode(PHY_MODE_MIPI_DPHY). For a C-PHY
>> sensor this makes phy_configure() dispatch to the C-PHY handler with a
>> D-PHY opts union, which fails validation.
>>
>> Branch on the recorded PHY type: for C-PHY build the opts via
>> phy_mipi_cphy_get_default_config_for_hsclk(), populate the per-trio
>> lane positions and polarities and select PHY_MODE_MIPI_CPHY; 
>> keep the existing D-PHY path otherwise. The shared
>> phy_configure()/phy_power_on() tail handles both.
> 
> I received multiple patchsets from you. CC list looks really random,
> half of the addresses are some internal ones?
> 
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC (and consider --no-git-fallback argument, so you will
> not CC people just because they made one commit years ago). It might
> happen, that command when run on an older kernel, gives you outdated
> entries. Therefore please be sure you base your patches on recent Linux
> kernel.
> 
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
> 
> Best regards,
> Krzysztof

