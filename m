Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5FA568FB9
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 14:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965708; cv=none; b=UX3UlF/n3zzKsh53BB424hLvGOe11StK5ptdvnpIOJtt4npovSVizA7ELnYqAPnm2w1zT3B/LZvGrp3kHCNEdlNzcQR47FEKo1lVllGyq7wvcxRy8PpuJvd9+rA+vZVtcs04KjYMBxQwvnLIRgqsmUYwKKTl0QIikM0FcPOwHbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965708; c=relaxed/simple;
	bh=BTc0Cp8Dso1c7YlVq7HUrCHive/vuDQehrCWv7Nl9JI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qLXbkRaS9iIygCvp+YdfSiuyILZj3LodDzMCLu6mqc5EyLkY6kwZHfSCSnZXbn7+NVp/5YWAod/1Ad3gJFVv6z0ur3Cnf0tDmuCGAwlpaynbIkjopwF7uZJtsHyaSJAYpTDPztzg70e2q60kTJV8iJzbdQurTsJ4iUIUX7BXSfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i8YAQBn9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j+yUy+w6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i8YAQBn9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j+yUy+w6"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BomYR2698832
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 14:55:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=asWMQq8NhdYswK4MkiaQeCqT
	pdZ0Hx/tpKkyEs/A5J4=; b=i8YAQBn9BKsroQ5k6a3O08jmYpR7a3+yMiaByjf3
	YD4EdWjbv1iFVTXYm4u/fU10kSUbb47CzZJRUn3qzpwW8Mo8AyntOxZw70moZNtP
	6A8ANYZtrpxojW6XfwOVDn3VGW5yLcuo6Vn05QwROBdmOex/qh/OaC9/ePh9p7ut
	9rRWj5AUna21160jWbg8ug9iosDTeXk4YDr/GgLbTlWnuB5vRczQByTuIn87rhQ8
	2/m2PTHmObEy/JNQdOFVEMqTKszy7lZt6SjYExJfDI/8caXYd9BlPsz/aitIJw2Q
	glvpdFeFdJUwo9jwn/ALLbRfK8jg8/GLDEO7UJzGbvXI5g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk6xh0tat-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 14:55:06 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8535db07af9so1721982b3a.2
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 07:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965705; x=1789570505; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=asWMQq8NhdYswK4MkiaQeCqTpdZ0Hx/tpKkyEs/A5J4=;
        b=j+yUy+w6domeHaIV/0iPLCwJq25iuNxBt8nHoYOl9JuyaJTAPDG5b5mi+gC13BRMI0
         jRgu4RvVmaUcQuBtXrpCLtR+lluViJqIa0ZSgT2r9V4ojCdNwiQ/7yQQn3CCWaCp/ag4
         8IR18AT8coNkfP1jRO7D8y8+Gp1dk1JZqvo/7EXFS0PFwD/Yctwi+8dZ1tkARDZpvGye
         krDJQkZxGndaKyatnoqKjUHp4vnd7r1pHNuya2T2oJba+l96Y/3/Rjoqk4rfatcsmmLs
         XiHp+FmdzCJCZ89V9lZqxK41bDhQAhbf50QM/Ug/njSYKBQ3AadGjCZC6tqrQhc9xYJZ
         m36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965705; x=1789570505;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=asWMQq8NhdYswK4MkiaQeCqTpdZ0Hx/tpKkyEs/A5J4=;
        b=GOISucDR+0tgzmmyhdjE7qJonysCYhRWrrukY0Q9CmB/GIJTNdQ2A5QNXgH/4336Ng
         tsygkEEZlrxdDxs+iUISakow8G1BUeiTchKja7T0qK0HM1hk8pAfbDsZke02Nfs1etmL
         7HO/wJSQC9JfeEEAxhJ1CtA0D6mo9j5KpSfnfzbfLtNxi1M6ZVD6lh6OyumXlgE5P8Mc
         EqFYgIFdvySKbTCQ/saP6zq54uZp13xVRYprki4peESmybcyOH9O3EfJGEtPjCw47AVo
         CZbIzx8sScYRSoZmIyUM1zkAKfN0BFt2x8TNyIAKJThdzMXzzop/zvQX+gZ1wRLL+/Bj
         mkYg==
X-Forwarded-Encrypted: i=1; AKwUvBydonUXHQRsbA1xchPj47mgF04CS5rygdpFx54vWSO0OqjvMhhomJfeG3GHQdh0zX41Zb/e67RkxeUY@vger.kernel.org
X-Gm-Message-State: AFuF++mJBUEcpkbQVg8UM3LgePqKJV8YWu3B7vluHZsbvPW/9tBg1+Se
	aMVdDTpizPZ6fB0s6gf4ZqwJBK2US/CObHr0BTxQn7tDLFxH+D2exKkEZ8Rhhsg01ZgH3Au07VF
	IlSBgueC4PpmQMhaNSzVAOJjTudsmBryHkFtdVZDZGrefQ7ZGcAEejLI7q5Q/gfnL
X-Gm-Gg: AYBFou39tHplMH3WnmQp32FTIaV/KEp6BXIxsVgveCmU8mBxkChN2zvld4p+pjV62zp
	Ns0TEnd+g8lkX4/yM9wIq2+Wa94Pbfrop3Zs4K64maz43f9d9sr9bl+kBd4Htln11/o1wJbbrNt
	ryU8aNxPexCiiTMra0FfehF3NYTvCVfr62DOEUqbmbc7ene3GnxOi5SiuRlpR82Usampz9CFBXD
	DcNVF04u8OYlRQzhU1UCR+q0fbPKx0MaXr+FPCltAwlCESHnZaDCZu/aHRb0AQWKqZT3VA7rw0E
	b2v4cRQeVKD499/qU5fZbGVptCbNzq11ieO5wOdMyV/WqVeGYg7GJB4ASg7cS7djQO6hbhQJj39
	TERZo3C3fqOalac1QorguBBD7zqabQBD1QbvTOU/SB2s=
X-Received: by 2002:a05:6a00:3391:b0:852:355b:2430 with SMTP id d2e1a72fcca58-86946542bcdmr2560661b3a.10.1788965705531;
        Wed, 09 Sep 2026 07:55:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:3391:b0:852:355b:2430 with SMTP id d2e1a72fcca58-86946542bcdmr2560577b3a.10.1788965704982;
        Wed, 09 Sep 2026 07:55:04 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152045f74sm7195955b3a.10.2026.09.09.07.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:55:04 -0700 (PDT)
Date: Wed, 9 Sep 2026 22:54:55 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v1 4/5] ASoC: dt-bindings: qcom,sm8250: Add Nord Ride
 sound card
Message-ID: <aqFzPyDT_va9VP-i@QCOM-aGQu4IUr3Y>
References: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
 <20260907-nord-asoc-driver-support-v1-4-997d3b20cf43@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-nord-asoc-driver-support-v1-4-997d3b20cf43@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NiBTYWx0ZWRfX68MJmq5+B3ZU
 QGZzWzQq9OELXu0IgMB1504cwBTVBkrK0ZL2Mmr56vGZaYu9nIm2dmFq/hSIQpVAbWTW79D0DNn
 ZvHvguaTRMQhEgvxQE+oJsAfooWKzK1y9b9oRyPj6At0Ysi0mLD0BhwwuZa/C1uZ9QEinPTsSBM
 ElhrICNjnPHiS0a/gvj1gxmbf6zO3oSHx9MxDBAhvfLxy0F6ItwVz+xGaiYlSP4++lmFNoDRfFD
 WUzq4NS6rMj8faph7Q1ZsNV3VwJtkD1/DA3KJ9gNc/j6Hxb0GWJbP6enoXlULMAAOgaEOAVQqdr
 RvK+qQ4spAHX7oQ5vffbKYNVuvO5cN+Jm0QeCuvrN1Vk8d4u301WIPaVL7Wt3y9LrVKkrAOAif0
 UXOfVt6L/hCBkQ5cy0nfyfdJ9tmsHPXGWI4+pl3p9YDOQoHy+M4TI4miFqriFO9/aO4jZDlIKs3
 xZOt03CUQ2XdklZdRbA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NiBTYWx0ZWRfXzB9GXzs7LAdP
 LOXmsxFaQ+WteIbdYmnBjzjx+NfZHsMrYY3AduE3UExh2l3Q22mcBmW/Ge5xMobpwfw9l0xdXtU
 gpWICzNq06cC5yLHxMjd6aNg0W4Gy0Q=
X-Proofpoint-GUID: wHznvVmqTPZPIqRu-vVHwz_oaQvfS1x8
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6aa1734a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Wwyz3RtZpYwf1FArlg8A:9 a=CjuIK1q_8ugA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: wHznvVmqTPZPIqRu-vVHwz_oaQvfS1x8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090166

On Mon, Sep 07, 2026 at 11:39:45PM +0530, Mohammad Rafi Shaik wrote:
> Document the bindings for the Qualcomm Nord Ride board
> specific sound card.
> 
> The bindings are the same as for other newer Qualcomm ADSP
> sound cards, thus keep them in existing qcom,sm8250.yaml file.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> index 1536fcd96d68..bdbaa8c822fc 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> @@ -38,6 +38,7 @@ properties:
>            - fairphone,fp5-sndcard
>            - qcom,apq8096-sndcard
>            - qcom,glymur-sndcard
> +          - qcom,nord-ride-sndcard

I wonder whether we can make it SoC specific like qcom,nord-sndcard,
so that it servers both Ride and RRD reference boards.

Shawn

>            - qcom,qcm6490-idp-sndcard
>            - qcom,qcs615-sndcard
>            - qcom,qcs6490-rb3gen2-sndcard
> 
> -- 
> 2.34.1
> 
> 
