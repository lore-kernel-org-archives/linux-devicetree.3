Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B381A483837
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410998; cv=none; b=cylCPbCZqUW+DjJW5lqRZHkjjFFAdEMvsT8umX1hM87utqFzOYIBX+ObGjbXoV8RAJwrkOPhZpp0udC+g8onnwEqDKR+/lG9BZw8UOyvrnZStdqzwYEJioS5Za/IfA9pdHthVp/at/J1/WhBZ3k9dOxOZ5jzo446EkKeWXtFIKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410998; c=relaxed/simple;
	bh=HLjsyxiyP0RrLsmru8bFLMsnV9JU+jXFj64vDL8QUno=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I4d8F0srh4e7b0epHYQN+jHhYWKfk0FbUuZjmhrbWz7wJIEhzQFj941Lhnrjsw25giYKiCEbPrE2PLML/H8MePaXlO2L5s/ZVO2myI0sut1OC6AGmTGFYoJbJHDz0auYBuPT4l+UXVdi/jROFFGe0HtLCQT5ebKvIYcgEEUgLRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I64/bdIT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IAeOJG9Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I64/bdIT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IAeOJG9Z"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P3XC2042431
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:56:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gHWSTOXAK11dHbhFaZJD674H5cswRRHK4YqORV+tgJk=; b=I64/bdITvizEuBN7
	CN6iaKcaYuqx6Oc1kMybp5O8icKXh1vS84CEeRJb5p9lmR0WkKNDxPbhepyYdyR8
	BKsakfc0d0HawUpzZ7SaxejVnakOxBVMLKfD73oW0Yb+j17ITn7pMDXiKL+MB0EN
	osmkEbgC9lsuHyt/LCZrGfewtsSbh1wIbgvKOW8XvlePaGJEtRsOuIme52By48Sf
	4yTcaS3TBUy5Tpz1PXKeKZVHTLtHfU3XHPvN4lKiqphniohqJ0ZxTvplDl1Z6qJp
	qhs4Sbg9FK6Y3h3PfIAPmIxn/n+nwVFzVC3Pj+ly+HxvAAdEFbBvTDgI2debwBAr
	NmeUqw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5ur2jmf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:56:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-533758f24f4so3561261cf.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 04:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792410995; x=1793015795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gHWSTOXAK11dHbhFaZJD674H5cswRRHK4YqORV+tgJk=;
        b=IAeOJG9Z/68kHpYUlGD3z/+9FRBRmnJF4x5FGdNMUFPzOiyImb3L+yoBow+vdX2srw
         83nUTixf/gIsxgOyy9/ee9gy0jj1lLB7knVKsmG2y/xEOGQOise8lYoU7U0KnZl+jJau
         FkmmiRaOX6Ab3goodJlbDHQf+poLX7iu9w5VC71OuXHDD7JYiJ60pygAVcz/kMLVC/Kp
         NUJyMfdTXWu+vjxih0Y/aT8DaFsN2otp7sxG+rl37+wD04DSRkYRBPU889bDxjFtaeil
         1rIFEZaKkxKUVIgsmrjfy7fz/YLv76ETyfFWoiRq+K8ijUe2tQC9HbB6bdsRwN+cW3oZ
         9BHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792410995; x=1793015795;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gHWSTOXAK11dHbhFaZJD674H5cswRRHK4YqORV+tgJk=;
        b=Ol0sjr7esJovZYtCchQh6gQtjMbFAdKzW3CdiFPioZBiR0GbHgSNVkr+9lZv+PkWTO
         8LXKoA0hk3P0zuma2lJBui4yZS8IOJKa2p0yyEotiVnGMp5DwyNENKjif26bw6d89COI
         jkvHBuMEVrDTlqxmsfNp1HEurGNAy7hE8fFAYDuGBqQRGwlv4OklHNEfttFWX+G7b/n9
         HTTuN1dYV1L3V0Qe+Lv+gsLI/Lz7MjQls+YgevgaEFRLSDIT5svG+gW6p6dH87QD4XRG
         38jTWcnV+ArhQIZE2rxq/QJIiLG9hn1gsnpuKRb/MqCwxMi7R56NKMcWXT8UyEy0PHp4
         MNEw==
X-Forwarded-Encrypted: i=1; AKwUvBxl0Lnb/GeU1hJYtwogv6Itmb7yABLpZNXXTE67QJkIIQ9uWre8sEE8AfgjGinrQR4O3lmcVGTrIv0E@vger.kernel.org
X-Gm-Message-State: AFq9FYLD5Og7n8PkiIKQYJerVVjR8J14TIy2Q8QRwNlPStz5ICNGJ7mS
	jx3fcnfXY1OhbTNwPqg5ymQ/nZ7R/X9iv7+Qv7o+/7ppf1vC/WBqby2xtcpr8WKml4HgwmdQ26x
	pzRGZp94CefKcfvjLICyZoS3D27zkur5SovghGTHvsW/VgOr3aiV9vyv0NH04NZbI
X-Gm-Gg: AYBFou2H4HQ8VYe//GlLY68FIHHwI6Cw8DrGgpxpJA+xY/miEiCdgxyFJvWmtASRjTv
	+BVAecfD+KSe/VY0iXYGg3t34XG+0iiyhMNVODK8vvAvKzL5NMD2sEiu/tVBgxO6qPhk9zipbSI
	rIbokY7OJlL4UMFmIDIVbTXrNibElvczXp2OwCIph/mVY8aCZ8ZP8vnjmy1QNLUxL19x2XnqL0y
	5rNdVjsE0TvAs3TKtoHN3ukqQlTzI5ywRXmLyUOb0VHbZvQ+5bvPMQ+paA4f4vJO/D6gsCknrmN
	TbPdlfliWdMeoB2V9iK/BNyaaKzrNUHSeDWO3OO66xIZ5SmI3bpIziSAeo6Di4JKmygUug3ERA5
	ytb0MYZBV+LM07MCRkooFhQ==
X-Received: by 2002:ac8:5a8b:0:b0:536:61d4:cc80 with SMTP id d75a77b69052e-53661d51a96mr77425601cf.5.1792410994831;
        Mon, 19 Oct 2026 04:56:34 -0700 (PDT)
X-Received: by 2002:ac8:5a8b:0:b0:536:61d4:cc80 with SMTP id d75a77b69052e-53661d51a96mr77425281cf.5.1792410994368;
        Mon, 19 Oct 2026 04:56:34 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ca52esm366595366b.38.2026.10.19.04.56.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 04:56:33 -0700 (PDT)
Message-ID: <b833f6f9-5729-4936-8c5b-cd42d32c5198@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 13:56:30 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] irqchip/irq-qcom-mpm: Program wakeup timer when
 CPU cluster goes to LPM
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-5-ac7f1a0d5638@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-5-ac7f1a0d5638@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NyBTYWx0ZWRfX50NdpXTQC7nY
 80XQUdmAUe3Y5/9o3C7bOVLAAdP5d0uYmz3XAeiM0y4VXdaLJSXjyiU5jR3IKzAX0tE3cBxlwsp
 Um4xsP0Ey2SEno+3B6cpgkOjxD7+j7o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NyBTYWx0ZWRfXxkjxkUz6h85G
 w9BUVNvzMkM+NzIsR3izS+FVsEoheB8PqLTb+yIWaGtKCurSSuJEDD1jm/cE45SVh3dtf6OOVoZ
 NxZzBhKaLw9X0fHCWLc5mxxLH88RnMwkSLtHdb5zWl0eCglICLvSW7GE4CC/IlUBYNS8x4U9Gx9
 MsyhJj3k8LtpLsQ3KUz+b6WF6Ion7xNOHp63SC1U0MaotxRNDqWkTULuxlRLDnH02oehdHvMWSi
 wVTGIG+lxWRMvPfymc1RCntPy4ZveudRDbpH5C2SKciS2mFqZOpWMgv21Qt4FjFC+N5xqt472Pr
 kjTw8K9gkrs8MxuYUTboAVbOMi5IBfvc4lUyJz7U76hO+UmldCqYYiluwM3TexggotBoCxgK4IL
 CpzehrxlcuM9vJcjUJA4MizihAqzRXuE/SsL5MR1wEjOnEv4p2702uFrNl3OScGNG3yxuWojV7v
 r2exJWvid7SwyRQZmPg==
X-Proofpoint-ORIG-GUID: MPB84_T_Y7u3MeA5AxwBCNnKqxydsyA8
X-Proofpoint-GUID: MPB84_T_Y7u3MeA5AxwBCNnKqxydsyA8
X-Authority-Analysis: v=2.4 cv=CP6/zhrD c=1 sm=1 tr=0 ts=6ad60573 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=rqCDwAl6iYQHjBXnP38A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190047

On 10/15/26 11:55 AM, Sneh Mankad wrote:
> The next wakeup timer value needs to be set in MPM timer as the arch timer
> interrupt can not wakeup the SoC if after the deepest CPUidle states the
> SoC also enters deepest low power state.
> 
> To wakeup the SoC in such scenarios the earliest wakeup time is set in MPM
> timer and the Resource Power Manager (RPM processor) takes care of setting
> the timer in HW.
> 
> Add MPM timer programming when CPU cluster enters power collapse.
> 
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---

[...]

> +static void mpm_write_next_wakeup(struct qcom_mpm_priv *priv)
> +{
> +	ktime_t now, wakeup = KTIME_MAX;
> +	u64 wakeup_us, wakeup_cycles = ~0;
> +	u32 lo, hi;
> +
> +	/* Set highest time when system (timekeeping) is suspended */
> +	if (system_state == SYSTEM_SUSPEND)
> +		goto exit;
> +
> +	/* Find the relative wakeup in kernel time scale */
> +	wakeup = dev_pm_genpd_get_next_hrtimer(priv->dev);

This returns KTIME_MAX after the DT patches in this series are merged
(because there's no power_domain that the MPM hangs off of anymore)

Konrad
