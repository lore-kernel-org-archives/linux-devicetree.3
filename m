Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3119D456E10
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 10:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787050251; cv=none; b=msZUWqUvwjA3Bz9NojgAS3ikDQSACBzJ+Miv0RtAJZKg8iA7M2zhuavXisDdPyp+OqCK98fz8FP4igBbQ7HvPv5ClyPdHSZW4IlIVZi5a3dUMTDelvm4uEJQJajZOw/8vBGz3mGg0lbLCV2aziKMwpwUpexxITYiZpppZI1twHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787050251; c=relaxed/simple;
	bh=1y79ymj5dd2m8Bm3DANiV+fpQlH4mdx3t+K93XNVtrQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ON452PKkLiWuh8BYCH3JlHLg+b1rMKMsqA19m4aRcwHkrIT9Ijnz2Lsy/bin7VN5ftXg24oklhCgZzO1lTcTPO4XsTVJxjmq9tsCqmXU9FSJ22wCHdI2jFMlyNhW9t6vtq1xkt9i94xmyjqX0Ggeh47ml3upkekGIApER1gXTbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OP8p+9C3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Utdlsrzg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OP8p+9C3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Utdlsrzg"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABlWg068846
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 10:50:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2jF0ZOeN1fb5iTAN1T02dkgvczfududo32WGzeSbJ1I=; b=OP8p+9C3f5JMLys9
	Q05SxH46tWGqiNTa3wFJqy/gWSdqaCynz99m3OaerMqn0fRbIMYwVzVpX5S+L+k8
	MV3QpSp0vMmE7jyAoxxhlC9NOZXga8ub+nJUiddMlg48AVBM8xYTQ8xWNMBm6orY
	nyWCS1SqrkfH7maw9gxIq0nmLsiSzSUfOzeG9pdNsSVc2Gnhsvg2FkR1Uhm93SvK
	P7cDapEqICt8dcqAnEdMASWeSSADYFukYQdRAXm0B7y+rECDMr0bAISmp/boGEp2
	y6FGi0w3xZT3JK1JHdpOWPWWmgQdlDhAo1d8ynvl5h5KAKP7scYlpTK0BW4aorDE
	iqU6FQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4f5pssrq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 10:50:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930bd2bfc45so123313585a.1
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 03:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787050248; x=1787655048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2jF0ZOeN1fb5iTAN1T02dkgvczfududo32WGzeSbJ1I=;
        b=Utdlsrzgg7KD9U5zLphSI70YZA5xsw3OUMgA7GCHtZUs1mB9tOCeaPmWoZDQKidcP0
         /rSP/b6yutQDT6sOPQPoAAEDUH9Pw1T9BlvO+lWiWsMUua1HeWPHzplfyFkmD4wVYNsg
         dKU6lgfycBF0FuDI17jSs1bOf0y6XjXJ3IFbJoHK6HmkPfLyLWbBdkWa+klajghWGHNb
         1mNevP/7oTcPuLtCp/JYacLY4pGiNOMw6auVT20P/p1I5r80t27G6jckjzuFEFOaAPQF
         hN2/oIISQzsmo8A4rrD3njZ5rRSvM7zQgjAApMVwavqr+HVr1emRZq6n/jaZAEpFpjsp
         kd2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787050248; x=1787655048;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2jF0ZOeN1fb5iTAN1T02dkgvczfududo32WGzeSbJ1I=;
        b=FSaqe2cIuWPFxkDd22gXqqN8t01yIJsOIkNleWgbVshIm2OzBXAOk4c2DA9FeCzwQq
         kmSr+UsNwdZwrvUC8uKXigF6IjrNaacPO3cc8xWoNZvHQ4xIew/Uj8ZIho8vrN1X8Pno
         oWmqTHA76zkM4oddmGax1R1MzS2myPOBBwIIJjM1U/Y+YohsHyu+RjMpBfx1WhWa0a/G
         gtGacL9VX7MD4CBJeXZTvk8dJSIMQ6IcffeApWtpmivsDTmiXzD+0NGW2mnCFU4+BrYs
         kYuo4EE5y/EJZ1JePpbq1SJb2G9zOHGnAUGrROj4pYwca8RScoyTsAVWnr/lCoqEnU1U
         QHVw==
X-Forwarded-Encrypted: i=1; AHgh+RoA5QMoV9sFzfJyF8dVvpTV2ISzwLPmqvNjOqL+7yUbhOKT1C56m4lbK8RGafiwHEclBCi6qJLiKAZf@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3sGYjKDXk/FaHKlWputFojZwlCwwb6/9wCTF/Lj4cOAMdpprG
	X+/10u47g3ilLDzoH8saJpnDP04k8e24uWH5aAHlRWuVXdyrEMCkWnylIX5dgTPFAJzX7RMpgGh
	elwljcBij4ogKmtIswx1T6dug1fbz3QA1tSVN5J5z/BUQRoWTBTUUdQEdp6quTqlX
X-Gm-Gg: AR+sD11qOE9CEGmaPw5Ep8W+rxyN/TVz9PIPP9Y+guzOisv0UMXIkaWeDhtyxu1fKSp
	+MVuZ3UtbCCwsPIYFwKwLTvIuD47SqsbLF1HpqMuiNQC8BRY364TAWj0X59/9lzWpql5kbSPYT6
	NxE1jaDYqdherRGTnhUOhAziHUBZeaOZRrbUdb1jeu6lMh/wgLx6w3/5jo/75iJoV/qHt9r2AF+
	tcsCmEde8L5fikS5jqsuN3Ufa4xw1tiV68eVTErf3aMGYXHM9BLQ2L0GHZJitKTm1NW21RhR4ns
	4/kAQX7wXG+WBzXYp9RypjAk0IDZHcKDSFWaa13QhY0sVbWoFN+RX/lZ4rshaDAKeKVufBsZ5Qp
	mFm+BNs4CeiXOtzLrWtJGI1FN
X-Received: by 2002:a05:620a:6846:b0:92e:5272:4e3e with SMTP id af79cd13be357-936d1f0a69cmr2268342985a.0.1787050248441;
        Tue, 18 Aug 2026 03:50:48 -0700 (PDT)
X-Received: by 2002:a05:620a:6846:b0:92e:5272:4e3e with SMTP id af79cd13be357-936d1f0a69cmr2268340285a.0.1787050248073;
        Tue, 18 Aug 2026 03:50:48 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fe7bf4fsm166717066b.5.2026.08.18.03.50.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 03:50:47 -0700 (PDT)
Message-ID: <cf3935fb-2aaa-4944-b879-9d7ef4927bf0@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 12:50:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/3] arm64: dts: qcom: sdm845-oneplus-fajita: Enable
 speaker codec
To: david@ixit.cz, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260802-tfa98xx-upstream-v1-0-4dd55cdd658a@ixit.cz>
 <20260802-tfa98xx-upstream-v1-3-4dd55cdd658a@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260802-tfa98xx-upstream-v1-3-4dd55cdd658a@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S+/pBosP c=1 sm=1 tr=0 ts=6a843909 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=xXM3z9AiURNY_ivmdoUA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Vq-qCpabMNlXdhlY18x5ED2luhv_zw3s
X-Proofpoint-ORIG-GUID: Vq-qCpabMNlXdhlY18x5ED2luhv_zw3s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA3OSBTYWx0ZWRfX6ySx/UHPzs5T
 4FUdC1BPSrwslUQAXVb5DtcWjXtm8m3179bcT/xcJfF1lNEbf+NsjaN7/RGLWANqmFcbXIl7mEb
 v/9Uf1Oul8p0W8gMcdG/0q+fd6nqTc8D3jhbjibL1XkiZIhHUkS7O6jPiZMPx6vtyZSlQ9iXgQx
 hKzXuF4XRTN/hKJWb3jI0qEzSWsXjXam+ZafTSt+xFvfjkNRxqNbjkDB7bfCrrIIBeu5T5FOheW
 7D+znYJtq8VKioWskkIh2lpYDfIhe3vD69uZgpAnc6503BMVjrEUOnQPYqSNFPX3Cl1EGgIlK4B
 rE5q/HrWmrM9jPh6vZqp9BtM1t0CMF/ZOQNMVPsqOxJPx+GeezyrXAYfglRqNKqFM+vjw0bK4WW
 BoAlSfoIueqepuc5znRceogcXiKMLKGmBYfwmmVaTW+ZVIzoHrLd3Q16/wBRYmPFAWOo1Q6uim7
 LbRrNpLMNkhzodw4gTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA3OSBTYWx0ZWRfXxzy3G6V6JQ/e
 E1U/LKKMGq9ZRDLjOaVR5SiThYUWFzg/Io1e8N3yoEDWndlUggh0C4Lf6wN2dVYrcLkRHdQcjXy
 wFFmtBVmM/3ce2zdhjkONHuzpNY7/n0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180079

On 8/2/26 2:42 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> OnePlus 6 uses NXP TFA9894 audio codec. Enable it.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

[...]

> -/*
> - * The TFA9894 codec is currently unsupported.
> - * We need to delete the node to allow the soundcard
> - * to probe for headphones/earpiece.
> - */
> -/delete-node/ &speaker_playback_dai;
> +&speaker_playback_dai {
> +	codec {

I'd rather you take a direct label to speaker_playback_dai_codec here

Konrad
