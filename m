Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADA63CA4A3
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 08:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792224444; cv=none; b=AiWnVjSbXnQurCrI1BYWOhxXBHCjWJhD1gEXBcYO+hajNfsvTr2CO/QsmXbLDWF2cARvEnEWRnhsY/RUEt7O/mBb7lZSEUdnCEJ2Z5Rpib1AU34DIeeepYLNeZINkG/ShvcXr9qD2hDeIZ0LqAEjGJupoby0lJfWUfGKDE+hNZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792224444; c=relaxed/simple;
	bh=bY2jCeq3P1+EwwI8EHoEtrfZe2cRh12mwezenEG9yFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dz8c9h1JlTTqrg3ubTN5oduuGmQiQNnv58jpumUJ0q5zbX3Ku8CzzKJsJRezKy+1HDZDWaFSNeAXFDOTSavvHdqvCt3XLIolDbAwq/Fw/juXvh8qA/hiTU0F68fzOtCysYt3TqIuQjHT2HUVD3G49VpSf5fWiB5/XegYAPhO0rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WBzk5T7w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pur0euC2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WBzk5T7w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pur0euC2"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H6nwFN204141
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 08:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	inGKjpvl5VwXPVpSApZydZ9aNOUzG556wHdzVbdOK0Q=; b=WBzk5T7w3aje8HSD
	6XFT+IDo2+9Y7+pJWQqCdUM1FsOMbEdukJrGHh0ehRjwzvHG4gp6OvU4Vh4YXRgC
	+kKSggKsnPEB+QWHL/HqepKC6I7HwKj8yNaV1u6Tx+H/juRoq6kAyxTCpNE6xWkY
	AhvMB7GTxDjkMqGDcUMhVv9D66ULcdXG2vRCOiB9SH8Rcgq3HChB1z7ePrtuBF5r
	idvFy+5D1teoxfUybwB5tha5eCSJgX9puEXvde8XOb7QXsV+M4AfizMMpM7I0LbI
	oyyqLfG9c704tCsua3WnUrIO6SHISgNe7WV9aZQCk6vgFmoAiUU6NnzMQA7Qms3G
	VkOSkA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbxcnrsym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 08:07:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a3f673221so218534485a.0
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 01:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792224441; x=1792829241; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=inGKjpvl5VwXPVpSApZydZ9aNOUzG556wHdzVbdOK0Q=;
        b=Pur0euC2TQersrcN7jUHgfilyG1h9PmZnGsptWgOCsLfn2blwZOpjAj73Al3S6u/Gq
         q3LbxeKoGHwWj/FrsTnWHMWONXgXcXImoKrOQgrS4O8TF1rp+ki1dqA4w/A4l/cRnsdR
         jZWD3c/bXGuykJPnFb/BfqrDhff2dhop3zI4GsEU4tGIm2e7AQSFocqQK3XP+YqKM7/m
         5MS2/RC68K1j3hLQZF1IdCGa0dA81Xffb7oFqhWqi/mEcKD5vSgI5u65QIN9quVbcHbv
         HtB/tMdsXkf9Y1QTakXrku51UbOg4JgQBldRFYbvc/Xrdro9V3/F3+/NJpUxGinD/UYG
         cJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792224441; x=1792829241;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=inGKjpvl5VwXPVpSApZydZ9aNOUzG556wHdzVbdOK0Q=;
        b=iR5E2LLZ+Y3HXcPVcARuakWsJ32E3DDLja9lI2raycnS1OFU+uknlL37h2duGkzKdq
         koXuNCPz8kEfItPU+8zZhOEX8O3L0anXlXTni07liFtFTPhMlnPimkRifvT46IylIIOp
         r4vRWb7idtwCliJWhMfpXS3TAjO/DNe8h3Q4PPQy7AeIZd5hoTuvj2lxmBgIS5zIt3BZ
         eJSVeBOtIRf3DzrAWpgC53qKLVcL8Iima2qvOnS74edt9+BN+pv05pDTvg0TLJVmeeLH
         tdq0GdPsB58EZkZB8Dk3nouYO1EdS4GqvZUmTzPaTj55RB5CR6fKneeigoO+uJLO2M69
         ROHA==
X-Forwarded-Encrypted: i=1; AKwUvBxhuMSq1j7t1oAM6BB0r8kNtfBc/YPiYTJYyMQZgeHib8vCz1Lk5Ljh9Kh+qTSdn2yo1kbd/t4Gz4Sc@vger.kernel.org
X-Gm-Message-State: AFq9FYJvQ0mv+IRv9EFLTvJ02t+OKoV1n40BUWIGKGK1Ha1tQ+ROPgrj
	ETAn80LwYRK3Jc37Q2yeaNVUfWfhmE5vt/YgONn5dcP1Qcx1wiciJ2XTIrMNRzzLXh9/e1fFIVD
	K+cxZqhQn1S2moTWoQQruTL9UiGVm9E9QY+Ja28U0TgKlazyTA9EjMJanfpwOywQH
X-Gm-Gg: AYBFou3xLDfQQU5knlvdzzdLDNLcax6rYH7CbaWeb1qoeV+Jbx6bav9RcjuoVsuN+WY
	1vy5/DnMUClMJG+p0J6ALQe0x1x0KhnwE7hWXqW4cgU4G8nQmPevGmfeKzOQJB1I0XEwv/FzJM4
	kGFAeux7D6L0t+1DJkMQ8nt2XJNl7v/yi1awPWZzIF/z/JEaM2P8vMD3KJmvYgahbeoHrhyodLy
	ksZlyHCpF4LPaYr3flslk47Fv+gfLHOmIGsjCbfbTlcD1V6N8AZJvnyD7ijBgV5wwtWpVkmVqZt
	wQkA7yzOGhZUahZFaU9g3LgDZIEu4mmXVUCm9EiQtV0NaF9T1bSaGfCMqVNln69490awDhNaQnn
	JnLwIMewMvtqhVyFy7zpNjq3kX3tBhyatCBg48LEBWdKm5TrBcFGAcv2C
X-Received: by 2002:a05:620a:2609:b0:93e:7dfa:2f3f with SMTP id af79cd13be357-93f29d9614cmr366477285a.62.1792224441267;
        Sat, 17 Oct 2026 01:07:21 -0700 (PDT)
X-Received: by 2002:a05:620a:2609:b0:93e:7dfa:2f3f with SMTP id af79cd13be357-93f29d9614cmr366475185a.62.1792224440743;
        Sat, 17 Oct 2026 01:07:20 -0700 (PDT)
Received: from [192.168.1.16] (46.150.72.42.lvv.nat.volia.net. [46.150.72.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd409989sm10501005f8f.0.2026.10.17.01.07.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 01:07:19 -0700 (PDT)
Message-ID: <a561ff9d-eb2d-4097-ae66-c1857f33e42f@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 10:07:15 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: configure C-PHY in the new
 csiphy_stream_on()
To: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>, david@ixit.cz,
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261017040529.3832120-1-anusha.nandi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BNUmP1QG c=1 sm=1 tr=0 ts=6ad32cba cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=/kTH1SCY3H94FTY3n2CK6g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=eJoEciQUwBFPcfgth9AA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: uqkWalRaTaGnRxht3N_Ob7maqJb4PN7i
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAzMiBTYWx0ZWRfX3ZI8ADyQ9+5R
 QpO7iPUM0kHwYwh+xzZhPJC/Tz3GM1234VDrgDswNLhsQn8cmwTt5LZuHQe60/dGKHjmi2Rf6oX
 ZqIcLhvuXnuI/p8EbpiwHNGwXcGELe0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAzMiBTYWx0ZWRfXy2GJTeJo7X7Z
 o54t/iBBbEmUIFCA48er7XMLnWqlR5HwOAOu7RRRQQz5k4mpI2xUjmNfjRNRxlPeBN78k/OiJBP
 KZUbe3kEc6b4uAhBJ/M7qkQldZLScIHWFBbG99ws4ffArWUpefVoDONjcUyUMgGeompbJetjd5O
 +Lug6Jj4ndaXxHs5ky9ReFo2F/VQmi0It79g/Vuygg7Y8OvKPic5fgZBZXVOzmKFso6pzVT9agl
 Y2VvRrDwxp/xHGU51k/enTUuI6P8f6/7RYz/NjMGXRifvO8KhomNczR4Yux4RwwLPwTgFUqP+UC
 flM/oO+cLS4YToKi1RGs0bBAp8HERZnaiAIBOodSoHk8Q1U1i49Pcv1nvJJhJ/lvjrA2spJpeaX
 xvzi2gi7HjVmYuGwPO2tf2QxBZlE/PJWrDSjTHm9CATSMPpTCYkDDX1w1iaCdjWmIo6DSZ0bN8p
 zHl6HKgZGC5+K6oRnjQ==
X-Proofpoint-ORIG-GUID: uqkWalRaTaGnRxht3N_Ob7maqJb4PN7i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170032

On 17/10/2026 06:05, Anusha Arun Nandi wrote:
> The new (non-legacy) csiphy_stream_on() introduced by the PHY API
> devices support only built a MIPI D-PHY configuration and
> unconditionally called phy_set_mode(PHY_MODE_MIPI_DPHY). For a C-PHY
> sensor this makes phy_configure() dispatch to the C-PHY handler with a
> D-PHY opts union, which fails validation.
> 
> Branch on the recorded PHY type: for C-PHY build the opts via
> phy_mipi_cphy_get_default_config_for_hsclk(), populate the per-trio
> lane positions and polarities and select PHY_MODE_MIPI_CPHY; 
> keep the existing D-PHY path otherwise. The shared
> phy_configure()/phy_power_on() tail handles both.

I received multiple patchsets from you. CC list looks really random,
half of the addresses are some internal ones?

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC (and consider --no-git-fallback argument, so you will
not CC people just because they made one commit years ago). It might
happen, that command when run on an older kernel, gives you outdated
entries. Therefore please be sure you base your patches on recent Linux
kernel.

Tools like b4 or scripts/get_maintainer.pl provide you proper list of
people, so fix your workflow. Tools might also fail if you work on some
ancient tree (don't, instead use mainline) or work on fork of kernel
(don't, instead use mainline). Just use b4 and everything should be
fine, although remember about `b4 prep --auto-to-cc` if you added new
patches to the patchset.

Best regards,
Krzysztof
