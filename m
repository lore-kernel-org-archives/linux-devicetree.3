Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA902248BE
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 08:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790324621; cv=none; b=Nrw9Wt0OolIjms7L2gm0oz2W47D+oCBrgFjJmRHYitYMsET+/Ad7MiUCsUeoQquK8GoQmry7eHYoGb27tkRbtKum8oUwK0acCVQIKlAPoqT4A6gVlf0FwF+sp+uOxffI6KT7nEtWudAhcMAOTjb/Cq8w66mIx8tr2GD7o4ezmzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790324621; c=relaxed/simple;
	bh=PvHYSJt7cETPVzZoFjPPJ4GjtobWK7P5ajK4Vcj9hoU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BdHO2niycNXg9X79wBDUvIKQhtZiXWL6ga6RQt9ZBemN4XlrK9TvEXi65f5t+748O8USnjCWerg/mJbxBQLyqC2bDKWxwISfKohkIj15PZ/xFmSMLlFKN1CJFVmr9h9JTJYSJCJOhIzTpBnZkLmPnqaIMWVjZlaB+3C4qGGxVI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NFeuBWZH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RnnQxnaV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NFeuBWZH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RnnQxnaV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5JExG3627541
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 08:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zaghAwdXkR/OP/QyyLrcBbjswistzlSbacu32tHxPLk=; b=NFeuBWZHhED9Wue/
	Mh8WAV8yWiw3PVYHTNtIERJ2wd8Lowr4NfheTMuN6S/OAY2+ZAynrg27A1sCLbyd
	0whfifYnkzSUYyAQCClqcP3E3y9mTSs2azauxQTxU0Li0jnMZRcnBZGvG7CnvKzM
	NBIClM9Dgfpm695EyRj+LoyV0ffIucj7TkCFqjSBRClF7MCRP1tmv+NWv29vLPsq
	jjAGdyyjfRgiUGAUag7FbZGa9WU67Hdlkns6WTKQpMaLn1N4qjEO8DGqqM3rkCYT
	FyeyjXY58q0MpQlWjaZtxfPEETh9sOLLT9uQQjaijrIW9VNdo+4RfFDX4lME+4oD
	Qp0kCQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq38h9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 08:23:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93918756165so132163785a.0
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 01:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790324614; x=1790929414; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zaghAwdXkR/OP/QyyLrcBbjswistzlSbacu32tHxPLk=;
        b=RnnQxnaVZqQVKO8/iMiDkPoowGNOr43Q27OslRNTFq9x1B19jJxr3Rqq9/SCib3JS9
         jJIAaUuGpDq6PbOJVn87tSR2c4Emf0q1xC5skxE/AxhX6BaLv1J20vU7PQxO+cxJIDbM
         hQx1u1qoFsiIMMmW26zTLUJeaV2TwbJi7p4bfBrtv45wg9gvazbSzJy1xFGM2j5ZniAf
         DBAfmTRGsW66XsIDC5nd8vzoqIeepg+MR+IZOHrl1nXUDLWk/8y1RLajzL686/0AVq47
         p/NnJMGJHngM+ZVR0nz0qdWVqGdwhyyBzDMBbuN6Q/puOSeU7d56s3+FoEdLyMmEb/8W
         8EMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790324614; x=1790929414;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zaghAwdXkR/OP/QyyLrcBbjswistzlSbacu32tHxPLk=;
        b=mDfG4HBQw2op5MJrxjUYv7XmHSoemvVCwO/EFBqWERoX0SMLXPTnPoiVs5kBxMhQWz
         7PibB+NsSKew3LDOp0hFKrwpLX17ycg05YSFViEsEyDwi7MyZxBkZYqbj1Pun6UddWLZ
         jZxafBcwthNS9SAXwRjkrviKSCjqh1yLiVkzY5gulnofIVMSN5Eh/YlPVQb5W1fWEF6O
         VwyBFS2tHMkAQ3bazis6p2Rv2IQjG1+WdM6JiYMCn3r3tqfF+4eTAx8R40HFSok+IvhG
         uK0ykHCe/kOs7r45gerZ+tPNryaarCU3xBPw/4PgOdaha/wIDbZWBQAEkl8nWUjEFRox
         wgPw==
X-Forwarded-Encrypted: i=1; AKwUvBxQW5aXlCK/1xzxAuHgStamt4XhgzbyO74SOueELH74TwBJvK/GINMZjdg8bU3VCFHGq+oxqRWVOJDK@vger.kernel.org
X-Gm-Message-State: AFuF++kwLjdjeX4/VTyCuXDm8vddu3BeedtyzagNFNmTn/w4+wTu6L/G
	awQ4IoHGtgwXqKIVHdp/nMVzAjrJlEXUk7CTduLE7Cup+JVn282xAsdZwDh9CWJglIIWLbph3LI
	da0EwF2T2bYbiJ17ngby9BNV4vTpTNjRpM45/g0lMPflSpsvsv2rfLnixmDebZILx
X-Gm-Gg: AYBFou0CsJkT4LYrVQJHaH9AH5FL/lStNkZd1u9PL8WStFDr3xvraMYKaJXFIfueIRR
	+8ud8Sr7iITswh60FPKwB/l3yFw84uZmmS+xpvOf70fK8bQlsRm6dzQAeKwp4VP6XHmM0y3CS37
	DP9cE35K8w1DM5H5WAgVmjQFkeqiBnhnJ9es6+Ribva3pOCBMUXe87eMkHAzwzCWbMltJhJngx8
	oNjOA+NiFBQUe9X/uS2AfKsfi5mZoQtAomRDIFEQgKtA2tQ2tCKjSYzs9buLHBplbTO3OSsC/Dc
	FWNKLs1g4haDow6rQIlxCrsBjJaEQFtiskBDURQj28B45hKdNy6bEoIUsl2guiCxsmixmXTKEaQ
	kshdrUz2WsPuxeOckJoS12b70Gg==
X-Received: by 2002:a05:620a:2849:b0:93a:251c:5337 with SMTP id af79cd13be357-93c43b61aedmr295575985a.4.1790324614572;
        Fri, 25 Sep 2026 01:23:34 -0700 (PDT)
X-Received: by 2002:a05:620a:2849:b0:93a:251c:5337 with SMTP id af79cd13be357-93c43b61aedmr295571185a.4.1790324613997;
        Fri, 25 Sep 2026 01:23:33 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5dc1034sm735531a12.15.2026.09.25.01.23.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 01:23:33 -0700 (PDT)
Message-ID: <39dc6ed0-d0af-4332-bd5f-498831a49511@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 09:23:32 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] ASoC: qcom: sdm845: Use per-speaker RX masks for
 TDM slot assignment
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
 <20260924-pixel3-audio-v4-3-85b5d133aa5e@ixit.cz>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260924-pixel3-audio-v4-3-85b5d133aa5e@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzMyBTYWx0ZWRfXx2tLzcx+zyOl
 mYeDxNN/1bWYnZRqWXkucn4W0dW3u3qWawUQ2xi+Nu1UpenwvV5rCwFzIemvJqW7PiJEzqIeJDD
 YWD8IL+XDyicHXi9r9jzq54Qgr7ns5A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzMyBTYWx0ZWRfXwAaqHilhoCxL
 sDXlBqsrh5ZORffkewExc/bYSQ17bZhDJlwMDSOQpmPWkcdEY1dsaaM7in3qpMcxi62n9wGigMm
 BuVyoRpLVdCPpNJNx9prXk8SRC7ZNv2LDuswkdQdePzXhcRlQJtGz36+KvPu7AhHYE26OcU9OyX
 g8ql+IeYLV4AEISsseVZ3VwFgCjS8BBw3giQze/1+FbBS+18rBEkCoUQRvS2EEBAYhxgRwgKBDc
 vlyrBdNIM1NxNmWzH3Lgs9vHkVrWVunCwzJcqpJSTw48rM4Ci2qtiBspyn5NU6Y4kP/SyphvwE6
 UcJtgT9XUOkyz7iUgDcQxqnl4h6gpg8VjkrVXDTgu6xh/gsWeScsWgcfTCgfa+Xa5vDp/DNxghx
 HYDhuRODlVfHn6vkrm5OkHaW/K01UMNBMtUkaVmd6NyVFXy+DBRgrPr/5grZI07nM49/CHg2Niv
 wbh9Nm70wT93BFFvwdQ==
X-Authority-Analysis: v=2.4 cv=VuO2kO2n c=1 sm=1 tr=0 ts=6ab62f87 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ffX9cber_TX9B_cfV64A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Jwahxhw4iPninIvkzhdm1bf4W-2s4zgz
X-Proofpoint-ORIG-GUID: Jwahxhw4iPninIvkzhdm1bf4W-2s4zgz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250033

On 9/24/26 2:24 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Both Left and Right codec DAIs were passing the same SPK_TDM_RX_MASK,
> both speakers ended up on slot 0, breaking the one speaker in
> configuration such as on Pixel 3.
> 
> Split SPK_TDM_RX_MASK into per-speaker masks so that the Left codec
> gets slot 0 (rx_mask=0x01) and the Right codec gets slot 1
> (rx_mask=0x02).
> 
> This commit is here, so later CS35L36 receives correct slot for right
> and left speakers.
> 
> Assisted-by: Claude:claude-4.6-opus
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

>  sound/soc/qcom/sdm845.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
> index d1cc825fc5cdc..59cfa3b26cd4d 100644
> --- a/sound/soc/qcom/sdm845.c
> +++ b/sound/soc/qcom/sdm845.c
> @@ -152,29 +152,29 @@ static int sdm845_tdm_snd_hw_params(struct snd_pcm_substream *substream,
>  		}
>  	}
>  
>  	for_each_rtd_codec_dais(rtd, j, codec_dai) {
>  
>  		if (!strcmp(codec_dai->component->name_prefix, "Left")) {
>  			ret = snd_soc_dai_set_tdm_slot(
>  					codec_dai, LEFT_SPK_TDM_TX_MASK,
> -					SPK_TDM_RX_MASK, NUM_TDM_SLOTS,
> +					LEFT_SPK_TDM_RX_MASK, NUM_TDM_SLOTS,
>  					slot_width);
>  			if (ret < 0) {
>  				dev_err(rtd->dev,
>  					"DEV0 TDM slot err:%d\n", ret);
>  				return ret;
>  			}
>  		}
>  
>  		if (!strcmp(codec_dai->component->name_prefix, "Right")) {
>  			ret = snd_soc_dai_set_tdm_slot(
>  					codec_dai, RIGHT_SPK_TDM_TX_MASK,
> -					SPK_TDM_RX_MASK, NUM_TDM_SLOTS,
> +					RIGHT_SPK_TDM_RX_MASK, NUM_TDM_SLOTS,
>  					slot_width);
>  			if (ret < 0) {
>  				dev_err(rtd->dev,
>  					"DEV1 TDM slot err:%d\n", ret);
>  				return ret;
>  			}
>  		}
>  	}
> 

