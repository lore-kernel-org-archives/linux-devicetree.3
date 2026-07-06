Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A88409627
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783329090; cv=none; b=cShUrFmc06bHPBjC4v7G390EdJGjtT0FVJqa59fR0M15iiGHOdB/Dt26xS9FrFSEvDawUa+CFCbDPUwmXimiid3TpheTi8yGXbStv5nls5z8lAoj0EZoCECWC+PtI6WVZMLMK31p9Jjxg4B5JOddOdL/ryq2D4C4OWVzp/KxYRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783329090; c=relaxed/simple;
	bh=INACSRF0fMlMov5Ke5zow+WhwK613mlG+72Er7VCwbI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G3eQVmwadaib6fhOGzzp8B6yOJV9OIl0DeTWFb9qNexey0zvl2fg4bDiba6BHjDh/ww2/Mai1pTwTLG8teGEVauCjs3GbdvuoTvAGqCsUFEL7B9o8tZxPuJLQ2ehbvTd8TmrWvqPPyB01uD4KzsrRyDR3pPo+vdBm7u7gSX+tg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mJvdy0FY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ye5oM7O6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mJvdy0FY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ye5oM7O6"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66694WBD136200
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 09:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WbhTr9uhP0D20AAKNUPS7YeXV2C/L9L9t4Xe4eF6VBE=; b=mJvdy0FYGEC1xWeo
	ZMxMm5fDDkulgM6//y4jhJj3sLS/p7Yc6FqUZmpSnewA9/prOmY3SczBtkkXM5wC
	eWe8I6BmOQn9zNyHQcs1ex0s7nZOJ1SLdvJ77HgPG/retLeWj7c2VXDD6Kupawab
	A7W4vIE/W7ymcSDZuYLOuDsPA+rgp3K88WpRpa+jqxtoD82Pcegi6B9ylq0/L16Q
	GiY6ue9vG94e/WatlEgbZvB01oY60TrTMMj2MSYHFRZoqOJpo+6hJd4G0XpdIUJL
	WikppTlj7PTHh6Gq2ni3yr8HBxe+IcFSBxQI3U671/UcluNwydqQzEX/eXOtz4RN
	yv2cZQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s64nkd3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 09:11:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c15c77619so6538561cf.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783329079; x=1783933879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WbhTr9uhP0D20AAKNUPS7YeXV2C/L9L9t4Xe4eF6VBE=;
        b=Ye5oM7O6+ktjLZCD2JZ0nAuF/nVQMrxnfRAvyX+felSrjojUxSiv3cH1nhgr2xMJ7C
         WR+BduM56g9SA5RMgNl0LF9NyreNLGhgqi587SBKhpNCIePeb2svIQQg2jl8sOSwMvq7
         3BFnFSNDZDHum5wT8MQ6ZsmgAyDWYfzfhuPo1vSusaq9xv2NODVueVbIICoWjmWmsZz/
         KFNQAYU5jR0jV/NEW1yO79xU6Ns5HZqMbd0LQR/l4YKIpVrgWVf+XFlcbt5lwF0K76AN
         5WWFAhBQkOv4HGPT0eB/hBv5K6r4TXLj5T8D/gKspEQShkE5OsPNUEE0aZbFZLgs1/Or
         Od1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783329079; x=1783933879;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WbhTr9uhP0D20AAKNUPS7YeXV2C/L9L9t4Xe4eF6VBE=;
        b=iHA+VRoblqu9fuUhvoaXZNPbvu4RAEaXq1rPNRpqVBy9WFY1arsQr6oOYXVfL/sDeR
         mv310hG1sf2Ii8hxU3Dsh1e6Wml3O+hQ73Mkc8BISDBjDMA69G//hQx5G4WcLmoePB9t
         W0qOS5qutZW1abJP/Qa+fgEf4bRB+YQt/5Nqs0LKQsImNfJjqmG6A1XQ5vpwfxKz82jh
         x8webxaVvUCl6AcqTyHkhXd7C8JC0npXbRWgsFph1BjQUjH1DPqHIWx30/ATxvmPxKh1
         zjzT1TtPeBcgP/xNfmu4NW2Rp3pXRIeBVQukb5P3OCRr+IBBfkL0E/k3nr1Sm3yXYbVU
         zjzg==
X-Forwarded-Encrypted: i=1; AHgh+Rqh/D/uDKu2xgeGhkPu89Z5wqv1As5xdlnxxIGBJ7C4hpAo++2ZzwERclW8V7LYV/fEs9Bk353D5fl7@vger.kernel.org
X-Gm-Message-State: AOJu0YwQKBuGaBKBIwnjbGF9XfFq9FmXIhCIEV70t8NRjRz6DmePYiDP
	QdkzRL1RW70lMDM3n1UwNIChPeXKryUQe4krLNKosSP3FOJSzeC9yAOyaRMSPYFubIiuZJiAGmk
	d7tA5WxVy31e9i5c1JS/E2VdKaVno+v4RyJwgiq92pEKbYm0G4r5vms0Mfl0CNX8j
X-Gm-Gg: AfdE7cl4y1U2G1Sa9YT3Un/7DhhLYGTuFlsmXHjC2DLNDEk+EkUGC8HRdIq5f5KsZ9h
	RXlC7n+K5JeB5CD988QOpQm+/RT1eT+lKwXMMgHA38Baz120lbvEdE8ELJ8xJRbSTBzALHjQhjH
	zrz5j3CX5WZFwCWjrvB//fipZHhd/ZmD3FRnXov80g0dBx3bCt9NKhWWIKWnH8MG9vZ3AxzqPLC
	7AaOWP4xPbgvGRrLV1w/iS5xIaiWL5aWtQVOu83aPQ6F1iyKhQBjtsRZ76BRKmgphU6n5udB0uK
	SxDCRiigfpHNQLWG7XcghJUvMlGC5nAZR0RMxJ/tvC0g5BxPiDbXGhrMpcivQTu8PfI3RLIWoLz
	7bm4mORlLCPOl0Ms0sp8eGrK1ccIXq/1+U+A=
X-Received: by 2002:a05:622a:349:b0:51c:d16:b498 with SMTP id d75a77b69052e-51c4bf1e961mr84781271cf.10.1783329078914;
        Mon, 06 Jul 2026 02:11:18 -0700 (PDT)
X-Received: by 2002:a05:622a:349:b0:51c:d16:b498 with SMTP id d75a77b69052e-51c4bf1e961mr84780971cf.10.1783329078449;
        Mon, 06 Jul 2026 02:11:18 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b628c16fsm722188166b.37.2026.07.06.02.11.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:11:17 -0700 (PDT)
Message-ID: <a0c117c0-26c0-4aa6-a81a-aff9567e29e8@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 11:11:14 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 5/6] ASoC: cs35l36: Implement set_tdm_slot to program
 RX slot register
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260705-pixel3-audio-v1-0-3b66f33859f1@ixit.cz>
 <20260705-pixel3-audio-v1-5-3b66f33859f1@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-pixel3-audio-v1-5-3b66f33859f1@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5MiBTYWx0ZWRfXyhmAW50/2hTp
 6E8uqv3eMQhesmfPFpAOOVEX16J+T+O6UAcA8tXYpT+Qjts4qx8YQYwcvfYgRwmuNKnxF8pmbnx
 QkgFzQ+i1r52WBaZoytWesDFX/jI0UrHOc6lAklY/m6ONvH2jRTTZ63f9S9BoH5odgxGXlxIvps
 4lPfedkdZ52B4wHSgaOrdktX6FOas1uH9QByL6wQAgtH22eBD8bEqeDk65WACjbTjJUsZ/LQwqC
 89KN5SeKBOYAGp1/A7S0kx5t4UoFVR0CVxTkdV4FuC8Dr+E0cDn3KBtlFgdnta2/8X9uY9yDolN
 IVuDDnm0JXYcbDpBvTgohg3+XDyrswcWXysjq1PDkzHDx3qC7HdqKHB2m2SuGDXc0slwaaejQvR
 2mMeqQOe1RNwPUzcfEEbdsEDm1jjZhNkhqYWL+CDmVgWJLs+UvfM6CCJan61w7X+YVyT2CCJBB4
 fMxtHX1jf2IZFeNsSFQ==
X-Authority-Analysis: v=2.4 cv=VvITxe2n c=1 sm=1 tr=0 ts=6a4b7137 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=PWbkM1JAYS1s-zoVCkcA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: f8sD_jXyJi-WxV0VqoeEELNDXGqwyDq8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5MiBTYWx0ZWRfX8hA3wpUwaxY/
 K+FL+vTR0hlilT5ApMKJL1YrUTPrEnydgAc2156n+m0/dLlSzMhbi2Sgiy3KhPnK9ZSxtebFUTf
 tmgcwHa0QWsvxfsBp3NSayM/fWA9Tu8=
X-Proofpoint-GUID: f8sD_jXyJi-WxV0VqoeEELNDXGqwyDq8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060092

On 7/5/26 10:06 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Program ASP_RX1_SLOT with the first set bit of rx_mask so the
> amplifier listens on the correct TDM slot when configured by
> machine drivers.
> 
> Assisted-by: Claude:claude-4.6-opus
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  sound/soc/codecs/cs35l36.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/sound/soc/codecs/cs35l36.c b/sound/soc/codecs/cs35l36.c
> index 89645327945f1..944f4cb5763e4 100644
> --- a/sound/soc/codecs/cs35l36.c
> +++ b/sound/soc/codecs/cs35l36.c
> @@ -942,20 +942,36 @@ static const struct cs35l36_pll_config *cs35l36_get_clk_config(
>  	for (i = 0; i < ARRAY_SIZE(cs35l36_pll_sysclk); i++) {
>  		if (cs35l36_pll_sysclk[i].freq == freq)
>  			return &cs35l36_pll_sysclk[i];
>  	}
>  
>  	return NULL;
>  }
>  
> +static int cs35l36_set_tdm_slot(struct snd_soc_dai *dai,
> +				    unsigned int tx_mask, unsigned int rx_mask,
> +				    int slots, int slot_width)
> +{
> +	struct cs35l36_private *cs35l36 =
> +			snd_soc_component_get_drvdata(dai->component);
> +
> +	if (rx_mask)
> +		regmap_update_bits(cs35l36->regmap, CS35L36_ASP_RX1_SLOT,
> +				   CS35L36_ASP_RX1_SLOT_MASK,
> +				   ffs(rx_mask) - 1);

if (!rx_mask)
	return 0;

(or does the field need to be cleared?)

return regmap_update_bits

Konrad
