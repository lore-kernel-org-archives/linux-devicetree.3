Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EA225A645
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789346729; cv=none; b=HzggfDHZGfpb9e3yu1NeRVI2V5hx488m0OOI3WEpWtJ2BcgBeP7Ot6KC+7sYkNN6puqoFBi469+ltoEAVWMUOSm9RcbxJ/lK7FkyQjtsT1AfgpgoTWE4sgfV2vd2LS2KyENyptyZtb4h0fLzh8jPG8eyF6J2MdOEeM/9KASwI1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789346729; c=relaxed/simple;
	bh=XzMeoPZutr59xPBNvG3H53GR1/lgdd7UgAsCi8EaT4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TRyx9M5IR4Pm/fgAf3/ZHd3dY8ZUJnFEHCOvj8K28Mh+I5YC482QkWZ8eDeAAvZZlGQtR6PC/JjfeyZPheFSAfdpg6qav+w/dkpxXnX77iqETjaW7haxMfPMgE+STG1Ffx3oo0MYm4BnVem8YJRPeEsAWfgpm5CtEmP0Sz2G59M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pV4RbnyS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TCNVqMQU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pV4RbnyS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TCNVqMQU"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E063ZH3187181
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:45:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=m6cyjb8rvJgjpNHcKIGuyrR4
	K/63avLkOqM4IYNdfLc=; b=pV4RbnyS+ZKMb067rnZasHmxkw5OKRNsqUexRM0r
	gLmXg/DXevHf8mGodUB8QyzZnDZAl02+F11Egy56d6rdUCAAa9uUjkPH+V5cnMMD
	LpzwTrQPNMqLPQYuh3X/II0l1XNsoqDcONm/QPB5tnJcfUMSBD9zNkOFlMMXTJkw
	23U2BvVhNUfIWJNjRTDirs8izA22ZC8pLKGW9Jnc4evYRParlF1JMO6GOm50qzgk
	2pYq5r28xIWBLmOoKtkCVf8jnP2DS4IGYlYeUVfxcAgZYquIG9DtPRje95zrslnW
	ZXwtac6UuS5talmniY68gJZTDeGKbxay3bZDh8DMd9lR6w==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d4es2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:45:26 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-792f917d31aso2316985137.3
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 17:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789346726; x=1789951526; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m6cyjb8rvJgjpNHcKIGuyrR4K/63avLkOqM4IYNdfLc=;
        b=TCNVqMQUKZoyYuzKEzScBitp45NAjnY1aesVrVabg/Zd984XiPz+yBtqap/0z8Qngt
         VHmS0QWX6cRh4jG/lVcDu0RNe63Z5shvVwiePmDVUmwku4Zm0XPnMJcU9d7haQS6Jl8L
         tn1NNd8Y2ItXltqtJ9GGQTVVvfQuYpK9YzxzixLBP9Hoip6MCTJY4d7IESCIc2gIAs/K
         sBSJCA9ZNbi/7Gfb2PsXu/RBuRfYtBXlkTo3gmEHx3Jm5GY6IbpuyYdg29SeLfIWVpIU
         iHltM/0KMiBGnehgtSc6SjEFVllf+UxVM/wzz9UmBZyUWskgvtXjxFLagIlumRmUd4AA
         dE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789346726; x=1789951526;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m6cyjb8rvJgjpNHcKIGuyrR4K/63avLkOqM4IYNdfLc=;
        b=U9RZQqd2E/938V5V5hhsS7feQG9xetYSYzOw/ENDgkme5qEKI87XZgZDvPs+YIAsjV
         yABUrus8lfUlYyjYixdiyGPOqsVNyJ0jcwVXQIHRFgkK6giLPXDq7W2HKmlBV7sXJnpt
         4IaRLrRjL/bHe81seS0uTuF7DXdqNwNS4OB0P12nhzZtjh5CHrf5XkVlwP/jdBEHN9zR
         N0VWCGJBWUOfYOSYrXhC3+YCd9rd4vvhGcPHO8Yk55VeCGUNDo3046exL+qOMZLiamYl
         gAf7Evx9oF6VsJiPjfr/b+HnKMcYl173Hn7EPhQTaAZPjL/AKm87lccTb7UmXIz0VsIW
         e2Gg==
X-Forwarded-Encrypted: i=1; AKwUvBwWcNHf3GfwyEabYxprRQXRMyWi+ALwAtpZgGsQscPHXvKaRTPUaCSDxy9GWBvBh+zqFyW8HIhQCC5O@vger.kernel.org
X-Gm-Message-State: AFuF++k/e+81U/L5WA3JmQTAIGx+iMGZ2Cq79HYiJElAl78k0sCNIDbz
	5JIEcWd0ZESEICfDdkfouvXvIMDEmyB8IulMNXIkYCbU3kMmVB/r5ZCyP39E3ddr2t713mgiN9T
	p7iqwzl/+XuEdl9f0Shx9LtBfCSE9zDwABQuhUbfBv4chIOrwyuaKXByQRjFnHuim
X-Gm-Gg: AYBFou3v77Fo5dS0f+Yw/6k2yAQOUw87LWQYHzN+Qu9jn61hWooc1fWseylMjGCM9Aq
	jjs+MobetPsSQkDIqeObsKiZiRtVKMUuNP2rgv+W41h3JkbYesY1U19BG+djQOFV2lcHWDrZeNa
	InBuBBEsk+LwJglM+8KrpZ80Dar2K0pbDO0UkGrKdJNk3bIIFqP4/hGRKiQ9MjQfBYyI+k9p9tj
	hiKov8Y68PiMv7DMouRhf2ndRNbiFbGhNUOpXS0QLmAxV8GefZzBLEb5NqD3pSxXD4zJ0O98TeO
	Qyv0YC6ZJB2ng7gyXc6kq/5weBWxK4Bt3/VUKHTscGkSjmqKC688LG/IPjH6ggCUTszhaWsYRbI
	nqsZmZplOEexqyPDtAXmOxZCU+DdaxqRG/QJcU+LQdjSfa4f0Soxw8koxJ0IDrmlo9ORRuZLaWu
	Du5Ea15z/RE2bz
X-Received: by 2002:a05:6102:f09:b0:784:b882:9567 with SMTP id ada2fe7eead31-79b5838eb62mr114023137.6.1789346725990;
        Sun, 13 Sep 2026 17:45:25 -0700 (PDT)
X-Received: by 2002:a05:6102:f09:b0:784:b882:9567 with SMTP id ada2fe7eead31-79b5838eb62mr114008137.6.1789346725637;
        Sun, 13 Sep 2026 17:45:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a04795d2sm2093901e87.68.2026.09.13.17.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 17:45:23 -0700 (PDT)
Date: Mon, 14 Sep 2026 03:45:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        stable@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/7] drm/msm/hdmi_bridge: Correct poweroff/audio
 cleanup order in post_disable
Message-ID: <uw3yo7jli2pv7byofdezzhklr62fegzsxdb4l6umq26nt72r6a@5cetzwxi7cvn>
References: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
 <20260911-drm-msm-hdmi-fixes-before-eliza-v4-3-87bdb9f1987f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-3-87bdb9f1987f@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDAwNyBTYWx0ZWRfXxU1L6L+T6kdD
 fgtLimdjUTIrP2Pt6axVsjJGncTxA7Qs+Y79bMLSJsJIoN8Jd7CeZg2IGImny+oonGiBc1+fjJK
 0/GHGz28xBkWi3EvsXOy/pDipjetdks=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDAwNyBTYWx0ZWRfX0rPiqyZeO9WU
 URFTWleSe9WnbvzrkxiQCIoAUKYD2Orbo6CFwNqu1UzOnRUqelUK5gasq5qY78mRYV3qVrmMdGP
 TSt2m0CSiYpuQRmroL9l6k9eHbD39B+0OkWxOFVpdFIgRbjTXWiJ/NX7MuqZdaLxVumYesrP7IE
 nBH34qL6jsu7SEHv5w7i+w+gu6oKosw8dA07wYHD0x32JVjx1rjSzlUIeexiS+WdiibobpmFhD5
 3c74XL7rOwcm1/GD/k6K/ZXtseu4uga4Ar/4by3pa5ZnZlhX4/xyh6VCh3POOEOR0TDXIjsz0m2
 6jlKVMwdV8ug7u6UNnaPRUeFnPoztdn01V7lJujver4UpfWZ+y6HMCJ1y0M3ufXkboF2KJA4DPJ
 nJmyIwZc1X6by0TpHdUZbQWQqvnc9HSBWEEeGrbsz70y7h5cAH1cDlZpyhhkK45qLldn5O7fiTx
 X4+vMiUtPGj92DhEWrA==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa743a6 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=1VKk1TRdkn99K7eK9r0A:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: U42uwt7u71Sc_FkpBnF1B8k679GZbQQw
X-Proofpoint-GUID: U42uwt7u71Sc_FkpBnF1B8k679GZbQQw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_08,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140007

On Fri, Sep 11, 2026 at 12:29:36PM +0200, Krzysztof Kozlowski wrote:
> Turning off the power in msm_hdmi_bridge_atomic_post_disable() should
> follow reverse order of powering up, not only because it is logical, but
> also because msm_hdmi_audio_update() accesses registers thus block
> should still be powered on.
> 
> Depending on specific timing, existing code could have accesses to MMIO
> of powered off block.
> 
> Cc: stable@vger.kernel.org
> Fixes: c0c0d9eeeb8d ("drm/msm: hdmi audio support")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
