Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD0E3D566A
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 08:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790324582; cv=none; b=SLrFWFnNDH2zmLBQsHzMUbbBeGB6eNm0Y0M2bXqcWyVbYRyuCSNXFhFP8YLs61KLfFZ6roEKEMDEfwe5R2Bdy3LG71SAmiW1uyd6BvDk/2Ru5Wr1L2rLPgQh+fTW3+JTDuZt+yy+fvhJGiN+zFtHaauJ9v6nNTXYXPawKzASdec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790324582; c=relaxed/simple;
	bh=I/fv3RGnze7s+N5FxFvRXiB+6C/5+ZaAufwlU5W7NRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dnqUtxtRhjVBoNpvxMc9o/ZGPm57BV90R0R1ra5WRveEkwA+IsSOpetgAUAX1NoN06j5j2zR4Hxb+1rO8cX4gdcHWNr5cHqkx2Tuws77vMBb+h81Wl78SNamr3SN25b3VSFalWoAU7wx1vhPRALNGZHNhRm4E1SEp6Ntfddt0gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nRAPVPHT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ccwghOru; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nRAPVPHT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ccwghOru"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5ImN3600067
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 08:22:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J3AR7UZUtXFX7XXd5Wd1G6E2yQBULteMUT2atsZ3wtY=; b=nRAPVPHTcorj6cMq
	U2oLcplr9EuNFl8IICoQr+bhsIFWpbeG1gGLNj0KvzUOZ1M6VutX4MTp6RVEfgYY
	u/BEmpItk0yqDxab/KvpdIkSwaw7pSaWCSPXThuSGlNmuS1IHHrI1D1nlOlR8wxc
	cVwDDJeGrNG697LAxJLGvoxZkwbO2IRveT/TX0GAwN54aR5hUSXMWVmZrYJm0tY/
	P9tiYsvBo6zksLWWvNA8/VvjPtqwLSC2MAF+4gEPQL3ivDFe/sLvx6t+9SwzBfrM
	H2TyVAVdK+6dsOQFbdbQguEBhbJY8rSsn87r1XSA22JZncBCRQVFf8Fzg7W+8Vto
	jq/UVA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjpvrgx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 08:22:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a0c7126e7so118025985a.2
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 01:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790324579; x=1790929379; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J3AR7UZUtXFX7XXd5Wd1G6E2yQBULteMUT2atsZ3wtY=;
        b=ccwghOru+Hw0cVRTaezQEtDol18xheeEaNY2VJUP4P17c5tctt4C+YBJhDrdPo3eQl
         F+tcVSATUzhOK24lJQ7JviNSpZQOa0uKZ4hBdIcUOLMhRWfcXQI02E5sFC2Svi1/h5QS
         S4GkxmVD/3ioaGp3GHU+GvOifgBOMiLpBpdJaA3PBeJg014XlhG4uACGAlVPDEdw+dfC
         yyap1V18Zgnti8CoNdK9ZoEOb8rWu0xJympi/LC9nrKY8M0CEbVnqRve/qPqjTMPVpRX
         Oc5Jr1/xlMZuOkr2tw+99ORgpH6gsbcLkdGigCMs0YjdMZ7MnWS1n8rFoSnc2qdr0tya
         csoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790324579; x=1790929379;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J3AR7UZUtXFX7XXd5Wd1G6E2yQBULteMUT2atsZ3wtY=;
        b=NWxKGUqTGKLANZpI+Hmjgbe99inzOxG/XJ4zsx61cCv5or5Kj3d7YSsskvlsdRiE77
         VYfJwgHBDYbTA0yOxKOpwHGj9wMxT0NmXNyEZzO1GFy/HfahlHY0K+dbgnuY+D8i1XCu
         Z56FqNRq6rmqTCYXW3j31xfd7ikTN0ZbVMDReoiC1gBcPcQyUuomLRr+Ixuz/psnCq2l
         BXinOqIx9vesZ6NejrI8xZLMYxglcwtaHQLZNGKhaUHd69MwwA8GGZKhC8GtnkacnOhF
         wtUOlWqnD9GArpTeSPbjl90R5cjn74Q63HLVFOuZAr16Xuu2X25M7zVgud3wZ9FL49ZP
         XDXg==
X-Forwarded-Encrypted: i=1; AKwUvBx7UdsTfpTTSvArLhNc91LA8MaHyENOEAC42QTyRa2lOuLaxEkMmL6j6kKKJtfi51DEzLiZr9wuHNP1@vger.kernel.org
X-Gm-Message-State: AFuF++m2n335Ezacf8tMFtQ421myCmqCgofjsDN+QUFAJY4OSOXdg3gT
	cbpXNtqCAZrr0Bt7x94b2uzhADxrJlh+5hDWDtD8Og8yqZQ692Uhh+mcB8ozD+m+gCwA+SseynT
	5QIiAOBOExTAZTgP4tdeAmF3ISqacwblkdPDQ9ku/owM/g5ugXvWQkC39qeOa2e/t
X-Gm-Gg: AYBFou2WCZcD/F67v33522tCk/DlVTV1qmYJ6SLovidJtzkA8fhyVWJnR5/vG3nG43J
	7TuV5XKkfPWIyK1YbjK+3NXx1qDeN1yIZKawkOFTRws1st0hOdEDCxnWyrFfoFm25iYFL78/6do
	/k0jVCytY5cVyiZ3FxCJCKKfKb7uujvyUxX4bcWtmciIMYN7yZMOm+yUn0TumwxVNztJmhAdYYi
	XJ9/isBE8CYSc0LIXb5dxM1lukXkKKQ/DipqdZNGW+xfes8QS065Sjf7/180fv0M6Aj6ZSNtYi7
	NqcqsJCeGxzcB3oFpwVqlbbn4uCrw76p/j+e1r9VDgCD2n3dYYospjitrZtuTjEnWRyxtUfVHSJ
	T2AZ8UzwRfrM3dEoZF6vX1lKXMw==
X-Received: by 2002:a05:620a:2b8f:b0:914:afc1:c66d with SMTP id af79cd13be357-93c43b836dcmr301326785a.11.1790324578534;
        Fri, 25 Sep 2026 01:22:58 -0700 (PDT)
X-Received: by 2002:a05:620a:2b8f:b0:914:afc1:c66d with SMTP id af79cd13be357-93c43b836dcmr301322885a.11.1790324577924;
        Fri, 25 Sep 2026 01:22:57 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c2ae757b50fsm77289566b.32.2026.09.25.01.22.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 01:22:57 -0700 (PDT)
Message-ID: <348b88f8-4708-4d6d-ac01-3af0f40c23f3@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 09:22:56 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] ASoC: qcom: sdm845: use DSP_A format for TDM codec
 DAIs
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
References: <20260924-pixel3-audio-v4-0-85b5d133aa5e@ixit.cz>
 <20260924-pixel3-audio-v4-2-85b5d133aa5e@ixit.cz>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260924-pixel3-audio-v4-2-85b5d133aa5e@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qCht-b1g8nFoc2TuaY6l-YFM3uK6twX8
X-Proofpoint-ORIG-GUID: qCht-b1g8nFoc2TuaY6l-YFM3uK6twX8
X-Authority-Analysis: v=2.4 cv=aLBlOr9m c=1 sm=1 tr=0 ts=6ab62f63 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=sm5W5dfhhG054gMKQQIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzMyBTYWx0ZWRfX7ypRhaQ8r5zl
 Ud/tgC+783JGoJIrkpfDsTw35s+fX7eKeHdDNvWEb1mKCGNvrhi/BV+othh5Vb6b5IU8y6RwzND
 uLXefjFzXvXr2VztJ3+Jjp6dMThFbg0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzMyBTYWx0ZWRfX2CC/XkWpbpqe
 k5+Udgksi0pqwZEVYklhZEPjXu33L6h7fQ97QfyQkFf16OgMmrRXZPmKTUbrq1O7mBGEncozPZd
 jkB73nMCzynCCTVosDxEwwsio3RNUvhSUWvfnxp/PIVWJJfnjybn65DVvHR8p0M0kUYAjxSSzdL
 QZN3BNXT4/3s45NXtD/TQXecUx2lPmv3wbgb7vkDYmw+1gpfnVa1fQLPr+xWjeFuhTYsq887w6g
 7LCwWIdsKCeXpxfzuQGE6G1npbgyRD7yW+5pM6zLkx6jRyr9mFmfI1lWX7XWoETyuq8gOXXV9IK
 ZZW6ZEHQiUFceU0tB5Nl/ILExK2vzd8USw3sGqkefubkMrLof5dw7P058cHMIMiI8TdA4/rG0TS
 oyuR+GTzvtWtwJFioIEb7Z8NGxs6AJFduWV56dxzUmcS4KNpeYuh+EfAgerlRnkIlXQTSr65xGA
 KQdBteEYCF0Hb//R3ug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250033

On 9/24/26 2:24 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Before the DSP_B only worked because the only close-to-mainline consumer
> cs35l36 codec was patched to map both DSP_A and DSP_B to the same
> hardware register value (asp_fmt = 0), which is inherently DSP_A timing.
> Use the right codec (DSP_A) which works as expected.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

>  sound/soc/qcom/sdm845.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
> index 0ce8265ab1c1f..d1cc825fc5cdc 100644
> --- a/sound/soc/qcom/sdm845.c
> +++ b/sound/soc/qcom/sdm845.c
> @@ -382,17 +382,17 @@ static int sdm845_snd_startup(struct snd_pcm_substream *substream)
>  	case QUATERNARY_TDM_RX_0:
>  	case QUATERNARY_TDM_TX_0:
>  		if (++(data->quat_tdm_clk_count) == 1) {
>  			snd_soc_dai_set_sysclk(cpu_dai,
>  				Q6AFE_LPASS_CLK_ID_QUAD_TDM_IBIT,
>  				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>  		}
>  
> -		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
> +		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_A;
>  
>  		for_each_rtd_codec_dais(rtd, j, codec_dai) {
>  
>  			if (!strcmp(codec_dai->component->name_prefix,
>  				    "Left")) {
>  				ret = snd_soc_dai_set_fmt(
>  						codec_dai, codec_dai_fmt);
>  				if (ret < 0) {
> 

