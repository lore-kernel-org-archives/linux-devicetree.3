Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED2E37F8C3
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 09:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775035965; cv=none; b=SXOubT646BMocHaX6Dyl1tlF2gi8ojsLWqPVT/3D4iewAEbyJotli3VgMNoNnB7ZHkw2rpFgNZPWnyKAHZCF+8HcoyylLYfUvPJvwVI41Mw41o/16kzSNwsFKQXbg1QuFhI2yh8SxMmbMLGQK+SWaJfTmK3JXcGR9+1SyRWP14E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775035965; c=relaxed/simple;
	bh=z+EDexiLErPSTkuOyOJaYzNKm8uMdyFNbjxzeJ/ozbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LlolYb2hX0343ZzA9GDKQ2/dUyIgGWNtAFBVjUMKP6LamSc/7G1161yVJjTIk0PJnp27Q3GPu9HxoV+/acRklIVIIB1rzKZj8OvEksctWVc7fr9n2JV+dZB0rFdFNkg2Qc5z6nVIEKlOIV7X8AK9EbE9XRjVVtL8lr4kQZ/i7LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mktgjZKc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hSOi10az; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mktgjZKc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hSOi10az"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317El3m4106686
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 09:32:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8DZG0eROtWmud3ZdD4EmRKx3UCJmwtzdRxZUWrs7KTg=; b=mktgjZKc5bsnghQB
	ydBx3gbKjuZl2Vc6GW1EQtrSd7z2FBd5HsZucM+iz8rkJeKapfrvbD1JoCRvwBcQ
	A1OatOYwGhrHve47u8wfK0oywq0GbN40neBP5MZII6Tlqdiyq5CrAYSQPUml0hPh
	HKe8HKggE775HlyGcrhvI8tkJj0KvL3RnmVw9cZ22Ry6gxEbfEZBVnsoWJR2oMya
	xKd9aYzS9op0Q91wVMov8v+WJkIQh0Ag2AhZR5Dqs/vupg1t4QiHHLFE6ICSHEu4
	rvaTC2rKwOx4vWVxdYZw3JDDatLCWAMiJQ1a7Py8XpFIgzOFpZGZPify0HB02+ub
	/lBB6Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8xt90ktd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 09:32:42 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89e9d327913so18821856d6.1
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 02:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775035962; x=1775640762; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8DZG0eROtWmud3ZdD4EmRKx3UCJmwtzdRxZUWrs7KTg=;
        b=hSOi10azBvej0dS69srM7y4sx90FOe77VdygDcl4MB+7NFrHl2PztABorOvDctXswL
         M2XEHqfwtPcRagLKtgVVlQDQPG+uYJi5G5a67JsXYhrpU+kQYfjsf+aBXrvfcBs7re1H
         Pd56iqLb7JUw8e61I454GEbEJSIcgDg0yAPptoQwQ7OgkcTmS5fwcYD698xPMnVY4Jy3
         pB039A9afmLq8GT4HdNMgJvDwHeLpFEpvxWo9fm5QnGnYPqm3Pug0IEdQhLpfFrEQ/wI
         ht3NXGqNusRvGbtpOHJQqjz0tpW+nCXbk5UPDe6VFyJzMmiB+asIcTHjhmwzSA9QFr5L
         crmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775035962; x=1775640762;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8DZG0eROtWmud3ZdD4EmRKx3UCJmwtzdRxZUWrs7KTg=;
        b=pWPZuMK+ObxMmUI8IkTwxyRK1d559/nfaMzwxHdtshB+lXoi1laYlE+vbfoedosS2j
         M/Ds4wVp+lw7nBPj7cGRkY+kyxlvZMPG/gtaPqScNUkb5/8VBGlwpiVpfzKxhPKEHAKH
         OC8yaRC7bTEmc1h+3DVRstV6KNFpz0OIWyvH13Z9ovfXnBEzjv/tozYtupu9coXHiF1l
         yxoPY7lnGkJURsMwKt/LogW8GtZlVDezSYIY4h5P/MZzkgHIK39Kmx7fC6elqff+AOcC
         pNEYi0vH0hE8Q5SbEbLENDDNO1C30c7ee6KrZEjL3ldh7KbCeqQAryZDcPhX5CinkNEH
         ZmHw==
X-Forwarded-Encrypted: i=1; AJvYcCUaVCqMF6DsNEwrOe8KovkGYYvZLP92zVP3fhTHS7GVGcSC06JjHFLUPntJBwwVR3L+5JzK55HwUofH@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5gb85YdPBA0isxIyZn0Fh4GgPctrvij+VNdlsTHyIWUdegQe3
	D85c2uzqEtsluwMvQdsKjbr5Ayl0UFMYWzETd4BaREiwmGt06g/YQOu515rAwXm0pYhHnhBiVT5
	0P/NUz2WsbRUezT78g7ERaINe6PirbdP74GdNAAtouTtJC2aLsO9Swkg2FqQgzxy+
X-Gm-Gg: ATEYQzw2NA3jise6tLWoYWhJdWvCio715HX4U0Rg3urE0BBFncG/PyTgSbMqsi3ufwK
	aUyBvmsvAJrCX3soFqvJtsh72D8rv0cGJrtbWWmaCDQTQ5DfPr4nvIW9tbzNeP1LwxiERhXMp3V
	Kh81QnTCGTL8DxOEB+TU0MAYxKsy0t4pP3q8PvqugcL1dpafWTtLydbKf5BIYCXzEW2Fs7Rq8XQ
	D2B1MOYtbOhGsVU+Ke+RfapFpHH2suJSgMUCl+Z1VTlZqtOjs95Kvyo3Ab251UR/lP6LPgbSW71
	DUZi2qSmbV8NzNRRZMYu1cpOnQOdi7FfQpatM/f9EkMiB9MVuK8z9IHe0UlodXJyLt0nDnnJ9us
	b2vqpmS9GLbNC2zdpHNljCqTpEsEi5dXdPOCdkOilbGzWjQpwS5+0YU43vMslgYOqr/7+N1ux84
	VnwSo=
X-Received: by 2002:a05:6214:627:b0:89a:5129:510f with SMTP id 6a1803df08f44-8a433f48ddcmr31691386d6.0.1775035961953;
        Wed, 01 Apr 2026 02:32:41 -0700 (PDT)
X-Received: by 2002:a05:6214:627:b0:89a:5129:510f with SMTP id 6a1803df08f44-8a433f48ddcmr31691156d6.0.1775035961433;
        Wed, 01 Apr 2026 02:32:41 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c0cce9b2esm115233666b.26.2026.04.01.02.32.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 02:32:39 -0700 (PDT)
Message-ID: <387635e8-d49e-4e08-bd26-e76838bb27d5@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 11:32:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] drm/msm/a8xx: use pipe protect slot 15 for
 last-span-unbound feature
To: Alexander Koskovich <akoskovich@pm.me>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260331-adreno-810-v1-0-725801dbb12b@pm.me>
 <20260331-adreno-810-v1-4-725801dbb12b@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331-adreno-810-v1-4-725801dbb12b@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Cri6k0i6VWfMAHkSARltaKbFfwz6s6WL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA4NiBTYWx0ZWRfX23AbYXSQR3Bb
 7X/Cz8Bqd/1FXR5Exg0Ezzh8gd4SthwRFx4FDFzZdmeL6tKO5CdanyWLmEwKJrvRvoBDmqkKyel
 mS6u/ZzU/SmrsXeZMkgkrGLifm8wjYrr4KRh2JfxrHf63Ud1thRRCk1kFGydX1jpIWyz5TGzZf/
 gjIF+vj/UaRuH19TlF6PZGZU/A3FMrL3IlBsoSPBkNUJvKvxQ+Zmhtduptg17WpRZdGuL2v4axc
 vMOrJcT1Z+FQIGwSRr1CZqehHubQxSQKhwTDbxOgiC476UQTrWhdo7TJiWjZYLjq7HiDSt9B+1f
 vAY7VE9iqc67dxpKZStmTIRoRyk6fpRDgIkfMWG0BdWbQ0T7J82YqUrCLJfoi80izQKDMQV6DsX
 mBeTn1Ks6bVXpjh0cW0aWVpwgozZQDtFFA+5pq8YuVbz9M4nDe29+9DUD4ReSrNDVfEsg8xBzGP
 3+kPd5H/zQDQkc2R7Gg==
X-Proofpoint-ORIG-GUID: Cri6k0i6VWfMAHkSARltaKbFfwz6s6WL
X-Authority-Analysis: v=2.4 cv=PoGergM3 c=1 sm=1 tr=0 ts=69cce63a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qGQNF-HaROJYSwuyTOwA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010086

On 4/1/26 4:17 AM, Alexander Koskovich wrote:
> A8XX GPUs have two sets of protect registers: 64 global slots and 16
> pipe specific slots. The last-span-unbound feature is only available
> on pipe protect registers, and should always target pipe slot 15.
> 
> This matches the downstream driver which hardcodes pipe slot 15 for
> all A8XX GPUs (GRAPHICS.LA.15.0.r1) and resolves protect errors on
> A810.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> index 5af82d43f1e4..63387ee9b04a 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -252,11 +252,12 @@ static void a8xx_set_cp_protect(struct msm_gpu *gpu)
>  	}
>  
>  	/*
> -	 * Last span feature is only supported on PIPE specific register.
> -	 * So update those here
> +	 * Last span setting is only being applied to the last pipe specific
> +	 * register. Hence duplicate the last span from protect reg into the
> +	 * BR and BV protect reg pipe 15.
>  	 */
> -	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_CP_PROTECT_PIPE(protect->count_max), final_cfg);
> -	a8xx_write_pipe(gpu, PIPE_BV, REG_A8XX_CP_PROTECT_PIPE(protect->count_max), final_cfg);
> +	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_CP_PROTECT_PIPE(15), final_cfg);
> +	a8xx_write_pipe(gpu, PIPE_BV, REG_A8XX_CP_PROTECT_PIPE(15), final_cfg);

I think this is a better fix than:

https://lore.kernel.org/linux-arm-msm/20260225-glymur-protect-fix-v1-1-0deddedf9277@oss.qualcomm.com/

which will let us bring back the BUILD_BUG_ON.. WDYT Akhil?

FWIW KGSL just hardcodes the number 15 here as well.. may make it
configurable if that ever changes

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
