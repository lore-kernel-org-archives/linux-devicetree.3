Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027696;
	b=lJ1a+3KTdKOYhJfsLh5eo7RvTH6n3Rxfrxd2x/mFBHoqYgcKFJf0nxXQl4AgYk0aqpMm
	 7Di2VEn7RPO+fJpsIoM0gzOpl+2rq3GYMpOf7jj8X4gO4yiRsccu6M+vRHSjBgSE0vHJW
	 45QIugY2Io1GfaaJb9+2jVSxa/x4B45XHppMXpCNUxbqE+DVx5kYZqJ/JxLTCY9AiGq78
	 bH5dE+Ie//BLNi75G2cU/AMoCqaaQFcQhR0oadTjdmsJ4kXA8u4HARXv68L2I+Po5gO03
	 x5AiN7UrN6ns7qONQ4ylZZCfTQbYrA9sfpybIttLeSOZdEPLEmUsTOZ2R/oQUIvJNog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027696;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xVyCK/YjIK6m0DRrtbGLKt21hcD0fUBOxh9LryG5JHo=;
	b=3xRwEZGK4wA/2qTqILojQsL8Z0MVCxG0r4sUV2Q+ehLVz8zr4LtQ9YygdvHVL6VEN2fi
	 qyYlMOgCQSvCB/YaHknIlhQRIi2dNSBl3xN6CaJWS4bCodsGdM1oxZF37jv74QErH74be
	 eRlDqTcQzt/sr1/bjcQ2u8A3vdHBfQ+fKZBUOw+j98f3oRftTYmkCaPxiugVZ37T7lznX
	 jO4QQD6NUwz2zi57b3it3cAnbOz97d1X/uwRLi25f8gxzrgSqnT9BiMo7AKp4Dzb7/shy
	 fGHRJ8atooMESpty9bImksnLFsHBreBU91NnxG2tDIbYha9rPLd87e+QTSJ5MKqiVeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ghAf1fWq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ThftA4/I";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0F160A2602
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 18:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA0F160A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ghAf1fWq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ThftA4/I
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIHG9qN2447068
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 18:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xVyCK/YjIK6m0DRrtbGLKt21hcD0fUBOxh9LryG5JHo=; b=ghAf1fWqlrIIZ/4c
	L5MqjIIqFYxZrDjkevbUzpzc4maUhdeNgniNyDVu3bnpFnIa2f9SVeZQOs8At975
	sOFp1Hz9K5Ca6OYe0sHTJoZP/cHYYdPZLg0D73Uue07kmT/MUuz6eB+pDe0g19Wp
	5DNQf+gA7E9wgv+KlAvphWd7h9UnmF0ONWnSCy0I4+9wx+F64L1e0lCG1myFKBhr
	o/vac1R880aCtHB+tl7rlR0wzIum19/3heW/IW5I8FcIQX8HgA9iUMxDmDlzK9Im
	ZNmFq8Bqrj9amDdIC+ZF6jfDw0z9sE5moptVroQ1u6yrQ63fFI8jEfiflQT6ZZpV
	J0SnZQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g3b8fnc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 18:48:14 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1383723dfddso1554849c88.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 10:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795027693; x=1795632493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xVyCK/YjIK6m0DRrtbGLKt21hcD0fUBOxh9LryG5JHo=;
        b=ThftA4/IlUaK8oWMolCfboAen4m5Q5c2wugTaVmPGHUvz0UaG2ev06JQErLB6CfLuP
         iCtCVNgOsHCjy7pIcQun37KJOKSlGQacNx3PMAtndVQF4Rcr3egvyzPrHYZG4myfbCUi
         UdmBV5BvFZzetYTYdWXyhRrPQOTHPEsO85kyKgKFpIGhyXMIKmapixaqIcDPdc3NNk04
         HRxgBhC5ThT9Zacu+R0raMdXFpOUIE4Hue18tiFeIWs9jAx6oeHQctEFCKuCjTKbVXc4
         4AhSKBjObL42mQhcYwkE9iZYZqV919SlVWNTK67n1M8GJLkKw/u4S/vWCoeCVeC8wLu9
         fhKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795027693; x=1795632493;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xVyCK/YjIK6m0DRrtbGLKt21hcD0fUBOxh9LryG5JHo=;
        b=FUUnZisptQb2aC7Tbl3kAT6wppWSD0fbsE+hoEVxcOuhNvrx/GenQkS77vQp98XubE
         CLHF32LsC1TqFpbVnoysapURUNsytXUYX2jazsCwTs2tYNgU3nANEO2mrr8BrU5N+xhz
         gcXwZBy2KyfDOi2qUhneiyAqXj+lCiqHxY3+A8CjyhOQz+HwaXyI2DY44Uy7JDOGsmSl
         v3KeGiqzbQnQ8bAi/7tsUUITwkhyaz4NuWo8HFptihyliou83xRs7XrBAByleapu9RLu
         JwkyKX/n6/eblyTquoSs1C9unWQ7BzFrTh5S1K1H/McUS13BBFe+GucogFQHOXMdcwh1
         bRMg==
X-Forwarded-Encrypted: i=1; AL+hErEaveDIn5QS6gyY/DrJDXliOq+p1DO5bcTz6KNSjfQ1D+ZhXc97MrCrHCGwuTPvvT2A/MZ5/0hJCVMy@vger.kernel.org
X-Gm-Message-State: APuU4Z/5Buta75aJJI248zkmutt3R84h1G+FgmNPq+Mysv/Q05RhTS2X
	dDhgfc6kZ5riNTMItltmlsqXM2rmiX0lE5FZcJOT4KWv2sqPTZd6VenSAsV+Z0wxr0smG/PnraK
	F4sTkJwHambzRhnOb7Zi+uvUTjtqmpVmGl+h5L1q2Ps+qh6928PqAXGQ7VF3J4KLa
X-Gm-Gg: AYBFou1o8KNDxDI4lk7slKBFQtwtVJAvMpEw9g5lD6pxKuX9o4AZ3ZuU2uAOZT+qLt3
	MUoe1DUTY4wkF3gddm14HhzZ/nFZDOu5oDgNrSQOkXXwkjSi18dRFy4H03VhjsuqKci6WudMVBY
	Iinqx65ziKAo/Qo4tipVKNoD3YIoGxciL5mGeG7jvf7dpWMGNqPlup+h6g245kZBCwoRPP9niTN
	b2oqHUNjPjXVQczD6GE3UQHtIuxOe4dO9Ex8vhGvY3AhGPZ0M/e1484CYe5zvqcCZbzgrM0zgZ+
	GkSDedP2+wjv8fsqpsSJvGjQA8f0sFlc2OAISRrKGuQLPK95KSnIucJe8OW7f9ordwZTnJt/tqL
	+mJtQZ8x+aX7Xf/wS8NNoqmWgvfiBueslUEzvZnLe91gCwlp6BjXZQsROeprId77y1RWr+y4+3w
	==
X-Received: by 2002:a05:7022:1408:b0:1b2:366a:e7d1 with SMTP id a92af1059eb24-1b543d3cc31mr3070458c88.32.1795027692700;
        Wed, 18 Nov 2026 10:48:12 -0800 (PST)
X-Received: by 2002:a05:7022:1408:b0:1b2:366a:e7d1 with SMTP id a92af1059eb24-1b543d3cc31mr3070416c88.32.1795027692068;
        Wed, 18 Nov 2026 10:48:12 -0800 (PST)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4e19sm11777335c88.13.2026.11.18.10.48.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 10:48:11 -0800 (PST)
Message-ID: <d42b3653-e4b3-4a0c-814c-02ad511fdb85@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 00:18:03 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] drm/msm/adreno: Program the SMMU aperture when the
 secure world can't
To: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
 <20261118-adreno-scm-fallback-v1-4-e99cdbf3121d@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261118-adreno-scm-fallback-v1-4-e99cdbf3121d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Rv6h8VBOEAGt_3G2FfkidONJUdE0e0oc
X-Proofpoint-GUID: Rv6h8VBOEAGt_3G2FfkidONJUdE0e0oc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NCBTYWx0ZWRfXxV98ffKQkAKO
 3/hZDoBOb/vxuC5EoLccn5kgYyaX+h5NS4YdQ40S+5xVX4iTphBQP6HwO4iFYrHCVHBGcq162Lo
 vnPaDHtW/z0RJlrUIzSlTmk98+fuDkM=
X-Authority-Analysis: v=2.4 cv=dZQVTnXe c=1 sm=1 tr=0 ts=6afdf2ee cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=tbUVMzGWZ8bGTt1F5tgA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NCBTYWx0ZWRfXzOvFQ0eNCp/x
 11yfltD+Nog+Vo67z/Q8DmhjBta6BGcQF0uZRVdwHwudOtYmzipArR1RsJpYyU5WjOQYB6p3344
 dVkrE+jcCRC+nulJx5kUIXiAxyAeZH2qn4us1ioDWHUTA/Va9DH4XS9d6GUEybtZ3RogyzoGzcJ
 dbXpI6uznpSSOm/Xeulm98rWNTm/wnd/s+JaSNvmJXV6waI5iBQzO5jxlaG/X8mI2ULhnvj6uwa
 RLkdXg6B3kUYBqFyGkeqtscGu919a+Z/a1BMFhW8KFSs9a9VQK+d2z/G+GJIWjlD6bVME9ZLgm+
 EESlEVz+YxLQFAfS2sV7gnjNlsZWNvM1MXBla02zFFrhFaWXInudtac4S2E/QazF9KlM3Jtw3/A
 zlH7xen4x+STEh3eDVZc2+6pSoVuQH14Cjd119IOsEudkFOfm01aeZd0S94A67A7ZGiu7v921Ot
 xrBsmnWOgj7yV/xCh0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180074



On 11/18/2026 6:38 PM, Puranam V G Tejaswi wrote:
> The CP switches pagetables by writing the GPU SMMU context bank
> registers itself. It reaches them through the CX SMMU aperture, a
> register block in the GPU, which has to point at context bank 0. The
> secure world normally owns this block and programs it when
> adreno_hw_init() calls qcom_scm_set_gpu_smmu_aperture().
> 
> Some platforms have a secure world that does not implement this. Nothing
> programs the aperture on these platforms, so the CP cannot switch
> pagetables.
> 
> If the SCM call is not supported, program the aperture from
> adreno_hw_init() instead. Point the GC aperture at context bank 0 and,
> on GPUs with LPAC, the LPAC aperture at context bank 1, the same way
> the secure world does. Disable the other apertures. The SCM call is
> still used whenever it is supported.
> 
> The values depend on where context bank 0 sits in the GPU register
> space, which differs between GPUs, so they come from a register list in
> the GPU catalog. The aperture region comes from DT. If DT describes the
> region but it cannot be mapped, fail probe. Add the lists for A702,
> whose entry Shikra's GPU also uses, and for A753.
> 
> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  9 ++++++++
>  drivers/gpu/drm/msm/adreno/a7xx_catalog.c | 10 +++++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c   | 37 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 21 ++++++++++++++++++
>  4 files changed, 77 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 4ef2bd6e7ad2..fe1902b8de16 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -736,6 +736,14 @@ static const struct adreno_reglist a702_hwcg[] = {
>  	{}
>  };
>  
> +/* GPU aperture: GC to CB0, other apertures disabled */
> +static const struct adreno_reglist a702_aperture_reglist_regs[] = {
> +	{ 0x00, 0x000a8000 }, /* GC: CB0 */
> +	{ 0x08, 0x00000000 }, /* CTRL: GC only */

These offsets should be documented in the xml file instead of hardcoded values.
Otherwise LGTM.

-Akhil.
> +};
> +
> +DECLARE_ADRENO_REGPAIR_LIST(a702_aperture_reglist);
> +
>  static const struct adreno_info a6xx_gpus[] = {
>  	{
>  		.chip_ids = ADRENO_CHIP_IDS(0x06010000),
> @@ -1198,6 +1206,7 @@ static const struct adreno_info a6xx_gpus[] = {
>  		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
>  		.funcs = &a6xx_gmuwrapper_funcs,
>  		.zapfw = "a702_zap.mbn",
> +		.aperture_reglist = &a702_aperture_reglist,
>  		.a6xx = &(const struct a6xx_info) {
>  			.hwcg = a702_hwcg,
>  			.protect = &a650_protect,
> diff --git a/drivers/gpu/drm/msm/adreno/a7xx_catalog.c b/drivers/gpu/drm/msm/adreno/a7xx_catalog.c
> index 9465ffa3dd12..43d681aa3c2e 100644
> --- a/drivers/gpu/drm/msm/adreno/a7xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a7xx_catalog.c
> @@ -279,6 +279,15 @@ static const struct adreno_reglist_pipe a7xx_dyn_pwrup_reglist_regs[] = {
>  
>  DECLARE_ADRENO_REGLIST_PIPE_LIST(a7xx_dyn_pwrup_reglist);
>  
> +/* GPU aperture: GC to CB0, LPAC to CB1, other apertures disabled */
> +static const struct adreno_reglist a753_aperture_reglist_regs[] = {
> +	{ 0x00, 0x000c0000 }, /* GC: CB0 */
> +	{ 0x04, 0x000c1000 }, /* LPAC: CB1 */
> +	{ 0x08, 0x00000002 }, /* CTRL: GC and LPAC */
> +};
> +
> +DECLARE_ADRENO_REGPAIR_LIST(a753_aperture_reglist);
> +
>  static const struct adreno_info a7xx_gpus[] = {
>  	{
>  		.chip_ids = ADRENO_CHIP_IDS(0x07030001),
> @@ -465,6 +474,7 @@ static const struct adreno_info a7xx_gpus[] = {
>  			  ADRENO_QUIRK_PREEMPTION |
>  			  ADRENO_QUIRK_IFPC,
>  		.funcs = &a7xx_gpu_funcs,
> +		.aperture_reglist = &a753_aperture_reglist,
>  		.a6xx = &(const struct a6xx_info) {
>  			.protect = &a730_protect,
>  			.pwrup_reglist = &a7xx_pwrup_reglist,
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 54f337475231..c3c84629c5f4 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -675,6 +675,13 @@ int adreno_hw_init(struct msm_gpu *gpu)
>  		ret = qcom_scm_set_gpu_smmu_aperture(0);
>  		if (ret)
>  			DRM_DEV_ERROR(gpu->dev->dev, "unable to set SMMU aperture: %d\n", ret);
> +	} else if (adreno_gpu->aperture) {
> +		const struct adreno_regpair_list *list =
> +			adreno_gpu->info->aperture_reglist;
> +
> +		for (int i = 0; i < list->count; i++)
> +			writel(list->regs[i].value,
> +			       adreno_gpu->aperture + list->regs[i].offset);
>  	}
>  
>  	for (int i = 0; i < gpu->nr_rings; i++) {
> @@ -1193,6 +1200,32 @@ int adreno_read_speedbin(struct device *dev, u32 *speedbin)
>  	return nvmem_cell_read_variable_le_u32(dev, "speed_bin", speedbin);
>  }
>  
> +/*
> + * Map the GPU aperture, so that adreno_hw_init() can program it when
> + * the secure world does not.
> + */
> +static int adreno_gpu_aperture_init(struct platform_device *pdev,
> +				    struct adreno_gpu *adreno_gpu)
> +{
> +	struct resource *res;
> +	void __iomem *base;
> +
> +	if (!adreno_gpu->info->aperture_reglist)
> +		return 0;
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "aperture");
> +	if (!res)
> +		return 0;
> +
> +	base = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	adreno_gpu->aperture = base;
> +
> +	return 0;
> +}
> +
>  int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  		struct adreno_gpu *adreno_gpu,
>  		const struct adreno_gpu_funcs *funcs, int nr_rings)
> @@ -1238,6 +1271,10 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  
>  	adreno_gpu_config.ioname = "kgsl_3d0_reg_memory";
>  
> +	ret = adreno_gpu_aperture_init(pdev, adreno_gpu);
> +	if (ret)
> +		return ret;
> +
>  	adreno_gpu_config.nr_rings = nr_rings;
>  
>  	ret = adreno_get_pwrlevels(dev, gpu);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 2911d440ab17..021802c6830c 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -88,6 +88,19 @@ struct adreno_reglist {
>  	u32 value;
>  };
>  
> +struct adreno_regpair_list {
> +	/** @regs: List of register offset and value pairs **/
> +	const struct adreno_reglist *regs;
> +	/** @count: Number of registers in the list **/
> +	u32 count;
> +};
> +
> +#define DECLARE_ADRENO_REGPAIR_LIST(name)	\
> +static const struct adreno_regpair_list name = {		\
> +	.regs = name ## _regs,				\
> +	.count = ARRAY_SIZE(name ## _regs),		\
> +}
> +
>  /* Reglist with pipe information */
>  struct adreno_reglist_pipe {
>  	u32 offset;
> @@ -129,6 +142,11 @@ struct adreno_info {
>  	 */
>  	struct adreno_speedbin *speedbins;
>  	u64 preempt_record_size;
> +	/**
> +	 * @aperture_reglist: Optional GPU aperture register values. Used if
> +	 * the secure world does not program the aperture.
> +	 */
> +	const struct adreno_regpair_list *aperture_reglist;
>  };
>  
>  #define ADRENO_CHIP_IDS(tbl...) (uint32_t[]) { tbl, 0 }
> @@ -250,6 +268,9 @@ struct adreno_gpu {
>  
>  	bool has_ray_tracing;
>  
> +	/* GPU aperture, if the driver may need to program it */
> +	void __iomem *aperture;
> +
>  	u64 uche_trap_base;
>  };
>  #define to_adreno_gpu(x) container_of(x, struct adreno_gpu, base)
> 

