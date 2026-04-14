Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF8127470
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 14:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776178464; cv=none; b=tWehjU59mztGw91PF3OzLSDV4jnm2oiatvIbMg4lBEJ8+huKa7My2DEsgtfHdCvbqfyW/sp0CYq10E18n7QUnrVqiFp08Xp8xo10ZbRqgdaLwxC7AS7exeEddSaABy9dnsmWl92n5MLg1l/yO6GVbZFYb9UHvbTih9MaTokAtCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776178464; c=relaxed/simple;
	bh=HrBmvLqteYg5aTGc2DzvOxm0RLWwLjd0RIAmC+CfnIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IAo9cvhbw1jz1+/2CAGzeBsZ7CO02/S/Ou5oCMaUS8qkOodamSvJHvksTLtWaD1baVxmKGjiVZ+2loU/7FFHG9uNrLjOB+9aTxV5gZAC74Bj8YWZWOYrktk/SEsuw2GKxYsvXqfkeMRyNSC+ucGVxhi4NF9fzS1kCjYq0jd9Sro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nEac/cTK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VO5QFqFB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nEac/cTK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VO5QFqFB"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EA4JtS030706
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 14:54:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bKB7cD9md6IVYbsiHkfvOWX0
	PgGW5lJEgvhZEMBVnM8=; b=nEac/cTK+eToweDulFaJbOwlltHopAnHNYGupvXv
	9GegTmxF2/uNcsYspfu8FmS8gBJRFarbfsxj+SiZAXFAkBO8icTB8NPCWuH2iXV9
	b1SWXgFgah6T1wL6FruHZCLeuV0GYWoPqilwNm14RDVoFPhng4iYDkrt8FV0LlpP
	sAfksSDSsqTl/VC0vXL0LOvmbHlRi5JqgMOf9d1uLYZz15310CxNroOeKNGfj2+U
	r/485T3OhSaTahNLyCuKS/3vRf8Ayz+a85opuTf4n4e8FNFvYnEdD1KdiM51Xfn8
	dJxsCY7lkhC7gi2bs6j7QMihDSjMYb5HEx43Qj5WKzH4XQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhkgmgytx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 14:54:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4b81c632so78546931cf.1
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 07:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776178461; x=1776783261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bKB7cD9md6IVYbsiHkfvOWX0PgGW5lJEgvhZEMBVnM8=;
        b=VO5QFqFB11luvuZxjd6psTkAitlc3fjcAQ4CIh0YbMdgG/KYh0iSV1IZP9FDZdQU02
         N3exZsaHqb/rf7Ff/zW5zh0pcu5BAXOiOdMLygWSq37TglGA2TXSoBz6TkaJEJnn8rps
         47LIc9tK0XjivqMXpucbmlteC4W6ktnlTw6SDlM98TZL8cXVHSEyUjcm1w7ZCutZb+Mj
         qArb3wGJdlU5eNSMzOcON3iKSBG4ZVHc0SezYeP1nRANThsVVwZLLocn+R6mS/2MpfQm
         H3N50Oa+bbGgHLGMg5X6wsJJ9XVAh6cx1eflTlmiaIufW2OUCu+3q/etMXIwkBlN2Y4b
         vj1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776178461; x=1776783261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bKB7cD9md6IVYbsiHkfvOWX0PgGW5lJEgvhZEMBVnM8=;
        b=mocBnyDHkSa3bOlpZ8zZOR0y/TC1JDSMpcOGr+ogePoLQ282N0OmHwcyXsSnlSLJNY
         hSj5i1GP6D4OAUN9J/l0I6dcrBNYTYutkM4hFeo5DyKA11w/+3sHzie1MkmRnaQsvPiq
         pP6qBUn6MWlhOeCV0zrLJyoucBFMVJlWkgwLmNCE3k77vgvAxxssz2TO/I2529gVQ3I4
         AsQaeZhyqf1CPCarScFxbBac9OR0Ihv1ZXF9umNilNdBkyWxml0EPgDM0p7UjSTBFAUE
         TDlg5etlUlVC4elpuG5Gw+cYhpr43qaFgHITEL94q97jKzSw8HOWvYoMPnZJTHum3nIE
         DJbQ==
X-Forwarded-Encrypted: i=1; AFNElJ+w3F2bJP2J1Cyyl/Rr8qSZhSWu6+CM0dSvJhX5WWI3yWhbEQcsZxehoKPo0ulOOQZeCCFKkIRUmy3r@vger.kernel.org
X-Gm-Message-State: AOJu0YxFY0QsmjU2n6Jh+IYGUII9F44DrTKY8ww69aa/n4XEK5NICp0K
	KavPrP+RC/Nj4EhM9vZzP0XaMlCqLvmgXrTsBIdYlEOD0dMdsMEl96cN20yAbUJOS3PE+KEafwC
	CJuoJ1riLZDYpyiun6zyeB64Kl9gCBciRdhWMjhNMzHhOZC9jUO0Lqbos8YYd8u5p
X-Gm-Gg: AeBDiesYzVnr0xeq80hulef9dcywrJOKjavS+heeoAPhhb4uztSkoIlnRlTMm1aZL+b
	DfaxK2cWUaGysW/YDw6CSHdqFgXNqN6LLrylXDlt/S2x4Wo5pV0BABKVPIi9hRRQCdKM7Fq9Dm1
	3834mq9n1C0MNKtct1+0ULLIrhVX4ayKeBxPxHdZD87h18LypRvSkd1lwuvAmFcT5SXL+8T+Fmk
	/xhrL4O2p2CMt58gYSV1HKvpi9wn/Qrqm1Ca4PBdz+Da1oaditnkWtBN8AtB7RDrProUETgLihQ
	qSkdAKkL/Mi3qz0Etcm4+kHTwrNKyKRt8brmeSK/JYWSA3wZ92rjdppiBm6/IcR8H91jVkajrqG
	FssGJT3n7OBoURtOI0pgvrpZDfNrGB3HQx5475EZIf79HCUigKSpLq+JCpiQHtj9w9m1txhxOTy
	hKkdkzyvK3ggiN/qZDbKS8Pujlzo+rKnwmLwmvdziDMg/GyQ==
X-Received: by 2002:a05:622a:7c8f:b0:509:2382:8886 with SMTP id d75a77b69052e-50dd5bab10bmr37662251cf.36.1776178461386;
        Tue, 14 Apr 2026 07:54:21 -0700 (PDT)
X-Received: by 2002:a05:622a:7c8f:b0:509:2382:8886 with SMTP id d75a77b69052e-50dd5bab10bmr37661921cf.36.1776178460876;
        Tue, 14 Apr 2026 07:54:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eeefba8fsm3359017e87.66.2026.04.14.07.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 07:54:18 -0700 (PDT)
Date: Tue, 14 Apr 2026 17:54:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kumar Anurag <kumar.singh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 0/4] Enable audio over HDMI and
Message-ID: <6mmez2xb6sngpwl6xide7uojw7lteudmqpazobcpf33l3pykx4@hg6n5rsuoici>
References: <20260413091937.134469-1-kumar.singh@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413091937.134469-1-kumar.singh@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDEzOSBTYWx0ZWRfX9oJqu1ThVtpm
 +sbRMh4E/2tebQIQXukq5/jeU2GNzRwbKobCw9+B5p8k6UoR5ec4PoSG1b7JfaGJCzX8uM8ZDis
 R1Wff9naaGqKHhDbh9JavJLsstIh1REoGI+HPQFCOZDlLVghh3okC3MTI+ndZoJ3v2li3TIvdYW
 UMgNfhJ5l/H3ygwWOLsXeNS+nf4BOiMj5uiaeMmy5MbOl+WGgxd8v0fl581wkpRFZQflcV6u47i
 gLK+p5TAK/N/HQzZ4KWQQKHCeaaN3OehC494m8INXomNDJtdlkv/1ElYX2+mAe3s62/v0GdXnyI
 kNIBzBXyvVWvVGTHtyhdMkBk/ASBr0VKR6fdamEEcxgWhpN4W3BvOzNhITgUOi87Ex4IJn8w67U
 /L2v+4g0B1k0rKqug/Gn6MLZEfXC1ttVqRYIERw6TjQhqXoKgZCr699jS18XjIyrgqzvG91Jpm4
 3Tz/okJnGGxtcqOvLPg==
X-Proofpoint-ORIG-GUID: 70mwTqLedOnvWJAMIrcvAMOA0EcT3hgV
X-Proofpoint-GUID: 70mwTqLedOnvWJAMIrcvAMOA0EcT3hgV
X-Authority-Analysis: v=2.4 cv=HJLz0Itv c=1 sm=1 tr=0 ts=69de551e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=ZbuxZ4Ij7ejS0DuN_rYA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140139

On Mon, Apr 13, 2026 at 02:19:33AM -0700, Kumar Anurag wrote:
> This series adds the dt and driver changes for enabling 
> audio over HDMI and Displayport. 

Starting from the cover letter subject. On which platform?

> 
> Kumar Anurag (4):
>   arm64: dts: qcom: Enable secondary mi2s
>   arm64: dts: qcom: qcs6490: Enable DP audio
>   ASoC: qcom: q6dsp: Update bit format support for secondary i2s
>   ASoC: qcom: sc8280xp: don't force S16_LE in hw_params fixup
> 
>  arch/arm64/boot/dts/qcom/kodiak.dtsi         |  5 ++
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 59 ++++++++++++++++++++
>  sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c     |  7 ++-
>  sound/soc/qcom/sc8280xp.c                    |  2 -
>  4 files changed, 69 insertions(+), 4 deletions(-)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
