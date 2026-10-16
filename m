Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B0F44BC92
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140835; cv=none; b=uqP0+DuDUBW00mNnJ+1ok/tGnHkL+RLqRApqLg5Krvn9tsx+EAVX2dLtk1nTEKhi/EmHAtaGHumIA48gm65N4PX4+V6LFe4mpi/ud4QvwQPNFTTAHqgA+7id9e53Gwx4NpcaBorJqEMRgdpx9Ew1FnXaHFB6OXy6mLQsf4hRIZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140835; c=relaxed/simple;
	bh=puwzqlb8XSUh1RPgd8HEwfS5QcUnz4musm6Bbo/cdhY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P4byCMch2DVjFf52PtS6Jmfip/uid41p64WRV7rqUJD68yusp3pLVhrMn6J7RP8x6a3OyLAXp2BqQ4NcCmH2kCPMfZy9MXzie5US82O2/GbuESRm03mv76njxTzsh75bGNwmyW2ONZD5JJTJIRDau2cw4Iu4LIp5hY62FLBXWls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CBLyguma; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=INtn81F+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CBLyguma";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="INtn81F+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8leDJ1218634
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pkBaoAyAk6VOagpI3vxj7Dav0JCGHN9t4FtCKhfX2oo=; b=CBLygumaTboWfpqK
	gi75LdWvPi9jZFJIPy/2p9Kl8Z+4o5yB99e0ZiRIbJtgWFooRgY0zEb35yZmMgcu
	ATFuuFOMJuz/jGxJzF4O4n82BbYfMUHazGhG1TVBwa/NNFqVbFAf4kwXCKw/7f8B
	UJfGcEcuP7bxyqKpfHdwS3VV7pdMA792WFsMkzYd7JP7Sxpd8/hQb//ldYTxdLti
	scmTT1f6OeydJ4MEUjEEgGtSvRoe7/mJ18fSfpImzIpnzeXvKuz0qk3gM8dKfbox
	boxlxKUCzY/94CDhrdbQRO9I7tEnNMNx7xyB5Pau1IGtwr6SrMiUQmWNlC2Xtrb3
	0YtqJA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb5seae15-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:53:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53389750985so13001611cf.3
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 01:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792140831; x=1792745631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pkBaoAyAk6VOagpI3vxj7Dav0JCGHN9t4FtCKhfX2oo=;
        b=INtn81F+EpFm24M1TrPklIL/IJU2p8jbKasi8+gvxGtvkoXe5U+dXE06vQoQDs9zT6
         7sP8XzS2EopJVHzW03mQWo1tQARysKKcPNCq02Vkd53wdX6RkI2I7UwzIGbgu9IqVLq8
         kiv82wjZFtGVHTLU52GZGY+Idot367YKNDzcTdAPndrdDSzWMzfme/3eYTaw1786Lyv1
         dxY0c/xEcmpyxgsfs1xtEBXIADGbN5BdioB65WMWN7qLM5W1X/1ItvROXIXkJ2x12yNh
         qI0dYW3xzz5n8OcAOeCVfs/l9cgDRqS0eO4BG4KdXXpZCaCJsgF+y0ESMvI7Xb0iSvFd
         TqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140831; x=1792745631;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pkBaoAyAk6VOagpI3vxj7Dav0JCGHN9t4FtCKhfX2oo=;
        b=LoLgO+tsrErLiDDHSyy/thwRQcfnosHqcKLvodBCM6Rbix49XQ1URBbE5D7KCj69OP
         QZYsSQq8YVY4T0tDhaF4L9HAKa7FnpUUPoMRdBQhtQwPhYBdq7SEfSyrHp4Ovqa9Ggb5
         ZUv1J5cG7yXC6Oo9+teL/vUhcNGx8ssf0K7YeMRw5vBN96RSx8kU0Hh7mqUBxvStembJ
         hDM/EiDnUFoCqwXZvMNWUXa1HkJn77ZAUu+wmdw7ziD/S7kQUvEAu9kWXjXhP673yRNf
         /hIBGVQOZ5bgHbCNTRmj8LqsWmT7ZjtsWjZuoP4+9bU6li91khfbfwtTTvj3isWDtwG1
         i3qA==
X-Forwarded-Encrypted: i=1; AKwUvByLNFJ/pYeRIq7t+8wJFR51JhQPf7gbh+CxOZ27q6zbM6k+WqXHva8b5X0vuer0MJiMWl4qjB/Jwv+w@vger.kernel.org
X-Gm-Message-State: AFq9FYLMbOIBEJ/+lr9whVmsk64cAqlS3NKOlN/ZdHbKFCpepP/tquBG
	cNh3YPIx2K+ZCu+jcOacoEh8bNtWwvm81EJ3yAea956Rja0QS/JF2JGtfLa88sPufM9lk3Ocb1M
	AXaV0NU3i3dT9EryR6b7LKD1r2tqyvro5Io9Xi2Q6WTGS26pAFV+7C4EqkodOmD73plgVcjHp
X-Gm-Gg: AYBFou0RGWMMfcGbS+jrXUNW+vQEg7SP+WJcFa4XiHE7aJD85CC/7s4MNnH4sgTlaVT
	Z2YMz/EaOEbmSUkFGJCgp6mXO9sC7qKjEe++KBqiQJ6rT5EfvwTG6O5twEvFQlOGWNP1gDfJcbA
	qW/vFs3973NnrmNK6pHsupSlSOix9Nh27nycv3RlF4r0RNvPIjm1e3MXuKfqy+HeJ438q3p1/VU
	Sv/lz9D2GyEvWTNqnmKQA2CAtm60GC+WG0nF7IGgnY7segsM8u+4kktBd3cFRHtI8ZlUMu9XZAj
	1iJKSaAKwqaNph+76vz/0mF1wo5xX017ouFjne7rpcjzuzncvkX/YYuZvmwwtbO0Ff7hsr75ZYR
	724mrKhrhXkLq88vl04dmEg==
X-Received: by 2002:a05:620a:4449:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ebd27cc8fmr4019877585a.6.1792140830648;
        Fri, 16 Oct 2026 01:53:50 -0700 (PDT)
X-Received: by 2002:a05:620a:4449:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ebd27cc8fmr4019873685a.6.1792140830092;
        Fri, 16 Oct 2026 01:53:50 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1ea92asm648663a12.36.2026.10.16.01.53.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 01:53:49 -0700 (PDT)
Message-ID: <855a4603-f9ec-4887-89e5-c92a943212bc@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:53:46 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: pmk8850: add PWM node
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261015194732.64428-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261015194732.64428-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015194732.64428-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfX03Ir9lNhZJ6J
 XXEoX/23zDmk2NOjQPyekTY3A42uxF3lFqE8dx+z7yyvWhJOqRbUuXUfafJqZKc9Y6xePMwk6Vy
 IN+8W7MGssSIX9yfebLQIMi/S9NRTp0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfXwvEHjpSFGFWf
 Z5J0F1e47SsApgvZeKOPCWbaHmiJOgMQP0uUwXqIKqXxukc24d/G2U+W8XAtHyECyEakuK5Vtmt
 fylM+PEPfLJlpPc5ZJM9ItZBcQy8G24dT7iErlkB189aX7+jaiBGEDuU10v3hXNmfklC7mW06Vs
 VDmLTGSg5efwej0tcQrX9QNG2os9OabVkHi/L9rxeUjiQqN6nlmoBFtopmBEAIOZ9MJiTHrp+bh
 VrwZSE6qxhp/BNZkdgzTeDbE5SvyJaNw7Fa6JZPTxHgUzPiI3CZXYveIJruN5sC0hHM5y4GlCys
 dsZl/WpBT6Bxgdct9T8svtJ1l7hwvGrGDxCLiJZ3oO4d1uJ6Zy2LcKvySLHoaUK8kl8qsPr5zah
 mSuuoNqJ+8Leuun/GaewE/1rAR3cwHubZmT1e7LfYta2LQhTLTkcJfnlJOfDtGSK/jxzdsy9ovH
 hs7D27EjiuRBs3XU9lQ==
X-Authority-Analysis: v=2.4 cv=P4yvFSAu c=1 sm=1 tr=0 ts=6ad1e61f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=3cXBS7fYHA2BcZxrE1QA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: kOsU2x9mWOKIL_D0nH_9Nul7GRw_E_oL
X-Proofpoint-GUID: kOsU2x9mWOKIL_D0nH_9Nul7GRw_E_oL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160035

On 10/15/26 9:47 PM, Srinivas Kandagatla wrote:
> Describe the LPG/PWM block on the PMK8850 sleep-clock PMIC. Left
> disabled at the SoC level; boards enable it and reference the channel
> that drives their backlight or LED.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
