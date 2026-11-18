Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027355;
	b=ziKAW/4emEnx5r/ewthdvKl05/om6ZZ7K6YDDh7BuTaDbnsLp8gy6LsZQkH5B1n7biJi
	 S7Ztdsfoy1mbbVQjcHNVgyPEGk3URp6ULN355xXRiZqePGLcnS2xii0jYpY+dFla2Q0kc
	 78kq56fBGtNwP4Yzs5mhwIhDGthN0sbX4OXGuJwP3Z22xqXhdAupk+Peee4MzyKY0Tyan
	 ytf7jGd2m1X9YZZeETUF+tD83rJdeAwFRkaWLyixKj4MHtXhLaCkpMrKS6yw5Kos9qBZR
	 /Nm0Ws+LCm/mXJIYJBv1uXZNx7uGgGNsGrFOREjPxkCIKgoLzDSI8b9B5voVLk+7chA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027355;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=supjWQ/8tiiTSWvb0f0hWdaRNkjBdKu9iua1cYtSbOQ=;
	b=p0x3DC6HA9f1LJ44qQ7otcWmfFnvvvld/LfjmyV4nild+sHfjSwiUSgNJpfSfq6NbvLb
	 Z6YKBnTJx/noWiplZ1Eirm7GSH6QtGyB1w7OnH2AebAG5DvXW8goz9yuZVxE4zvbcRzKY
	 HsPCFT8onrw/tlu3WJeMeQCDNaTIXby8y+ewPdkDKURr/I4FOP7MoTJ6hwoz3cTc5hfuM
	 TwN/bBi79x5fYHxg0npuGfjkOmRJWbiNdRhmtvnB83s2meM5e2Jg6l7vV6n4aBgc/kLgh
	 B0Fhpe3VT1rEEkbktgljIwOMw1pwx0mXHBubKcf/4OoD0/ygv5NrwvBGNJbQeYxyYTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PF2vfpno;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Js+2KPre;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B393F60A2619
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 18:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B393F60A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PF2vfpno;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Js+2KPre
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIHHN2l895327
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 18:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	supjWQ/8tiiTSWvb0f0hWdaRNkjBdKu9iua1cYtSbOQ=; b=PF2vfpno+jJczsL7
	gwxDfvPL6Vg5B+YBB+0F8c2Bzhw5hn2MV/goPaWvnBvL/EO20ThimukhQa8uD0B8
	WbSpY+rS8p1w90k8IZ1ChKYCMBe2kFk3cq/w0KRS2KxF85S3IU+7yzIC7bWy40PN
	VbcokZlfhyCcJloc/q5Z1QOdrYufuCIw5l/wHZwRaqon1y+LbO2kw3a2ZIuO4o7v
	xxT/20q3ma+12yYBTIfra6byFhzv8qeMv4dzBu0p7+P2aBvDEH7jlsY8uy9hpOjG
	B95Af4lBLF9opvLnE4r3CteQAwrA9gaajG2rjWQGN4ArzN71y6csCD8dl9T2B48p
	q9EYwA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g9p0cvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 18:42:31 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9986f6528fdso99011241.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 10:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795027351; x=1795632151; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=supjWQ/8tiiTSWvb0f0hWdaRNkjBdKu9iua1cYtSbOQ=;
        b=Js+2KPrehhz0cJUNHtKg1I0ioTZhBt8tCtSEsq53IpeZxafQM52UvrW7yU9tQKcGcH
         QbZAvcUgheHM5XqbRSCLR6/qnFFQ9H/1aDGYrN+iqWjc7Nkc803FxhY5ybIazqmQzyGb
         J3SORHQ0fghBaJrg83FDjjLNwApAKZWKXVDFxfk+wk+3IWTPsNl+mU3Z/fo4sTbw/7fn
         nyg2/4x6LNnhSvA3TKPQPmoHLx7/sNQWeogdc7RCbvsWsQmt0VJsAD0oOGb0/Bip8Ftk
         N1OhApzpIaOjnlxF+tbezanUFyDRSLCdnCAK3Oeh0XQNVkLiY7YaSMruN+Y95gjpIfto
         MG/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795027351; x=1795632151;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=supjWQ/8tiiTSWvb0f0hWdaRNkjBdKu9iua1cYtSbOQ=;
        b=n6c7G7AhruPGI67YlipK2EPjnpu+8mL+Ol5o42wwppMf8ckg5VUE/YtMV3nwTIxR3l
         4NT8x0Fzziw2yXqZpqbm6BbIW7h7WN4rYabDmNx6VC/zCKZQSWEqxTvzcAnXeGcd2fLv
         eKOH3s9I13punlYygnU0DzI+ykUUcgqMZoZ1UpEMV4IPFXv1CJUzBBKglhi0fjxH10gD
         d30s8K71FrCms4kNDkzAFZ7+Y3dsYjt1/b1ndxPV0DIfrjE9O5xcNPlRVJxLWjCIYep+
         gveKQ+0aCqbKWdJi3zISTrK2N7mAh4ANr1f95+2LQIWasjGVYqw1b7pkBxz3mtmRmBKC
         VWIQ==
X-Forwarded-Encrypted: i=1; AL+hErHGgqvwtNE7b6vu99fjU1x+08SnxNcJTo+5COYlKMjw3cmCGuh3hKJZviOoUj1HJ2rxWzDjU1xc9woG@vger.kernel.org
X-Gm-Message-State: APuU4Z9PMhFmVPfL80HCPwF9xy9Y4VAh/nb+N24Z1LVdLdgiXFqFngA4
	bYortmU9MRzEWHlzHxCf8wPKhfKOLYQwiKbfzziceuFRxyGbHp/b98C4LOo+AoWgka7hR1i9Y1u
	BVicgXOfRtUSOMwdkZdXTEIyBcmd4uskf068k0W7+HnsTmusZqEfbAP0CIUf2DsS/
X-Gm-Gg: AYBFou0svfGql20n44sxFvwt+z26pEX6z72iWbv43Q5hGgSWONVSasZ8RYoXNU9/+G5
	1dOApamWOF8Fp3dFJcDgP4IJ7PG5IJWKEZ0Wtw7FQpXDDR2oXw0NwuvHNNCrbcGF8+p8mz3a+PJ
	mNWLxCjWKqFrF8gRP6WWHkT+CfF1chknfN0za0KyS6jewS1wz3wE45XqsmOX2mma74AYG9uZD+9
	fflPmoyjnDbIRubNG37en+eUQaHXnQ0+ynb52XkZ/4zavXVVJU5f14EgZuP56THfqmhozEjhQt+
	VRpcimZcMMUEM5F5fYwqfHxetLwKlNGCEpwneYeexh4WHALkvim3rLJ6voGsg2Lhm2cJqmeL+xf
	Xttt8Mk5lbBdjdO652UFZ8w9iYoSd1LavrJbjzgZ5vE1wONGRqOtHk8sjaIw3BduiM6bXoKlpag
	==
X-Received: by 2002:a05:6102:442a:b0:7d2:d799:d7c2 with SMTP id ada2fe7eead31-7d6cb430827mr150811137.2.1795027350870;
        Wed, 18 Nov 2026 10:42:30 -0800 (PST)
X-Received: by 2002:a05:6102:442a:b0:7d2:d799:d7c2 with SMTP id ada2fe7eead31-7d6cb430827mr150801137.2.1795027350370;
        Wed, 18 Nov 2026 10:42:30 -0800 (PST)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6b91e87f4sm2532457137.7.2026.11.18.10.42.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 10:42:29 -0800 (PST)
Message-ID: <4d16306b-31c1-4406-a1f4-858abd3f44ff@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 00:12:18 +0530
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
Subject: Re: [PATCH 1/6] firmware: qcom: scm: Add
 qcom_scm_gpu_init_regs_is_available()
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
 <20261118-adreno-scm-fallback-v1-1-e99cdbf3121d@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261118-adreno-scm-fallback-v1-1-e99cdbf3121d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sYOourtxJ8MSwBinrp82-wCGrJRY1nbH
X-Authority-Analysis: v=2.4 cv=LooHWXdc c=1 sm=1 tr=0 ts=6afdf197 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=L50M_nCPciy2geT04tYA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NCBTYWx0ZWRfX6lvgD1V8SUCZ
 /H5OTSNAut5pVW9phZkri0FCnZqYIEFNVfk41EzDejhiga+GpxAuvwtRmRwpCgVTD5E048h51wt
 9E2yBXsRj18pBX1aOnSMMAAwge3MerpfWh65YdoIed8lvBrrI5vqGS4KfAx5JSnKDoZQDfjQlkv
 1H2u+KGkiBIrMrlb+XAZlguaLWEQYIsNS2hQOhXVE50GIZMqKL9bj16rXZuEeWv+yQTljgyke8L
 vz+9SWpWFueYjzjC6O8/wOMRNbBmcP2uU+9IfDHU10rV7qp9TyzOwiY6nIWDqXSya1NUtkdH10c
 A6OqjuTos7xu4b45XvS0xLPOYjTzVObwUTaAR6EnSiZ4kZ8vN07QZRT2eQqFlVdP6//sEWqCnFD
 /v0t8t/wr/VmF2KyWHBopcMs2kHL+kVh4Rdl1+EEwccTv4ZOIS60/j86IIGZ7e/xUuo859gGWxv
 OGcf/qLormCsH1zsUCg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NCBTYWx0ZWRfX8S2dcrGpWqhk
 ysKIvhrk6qLGJamslWN0V5CdtrxcJNYSNp9psySbjbs+bXqn29ZuuTObu/Uxa492IyuLHzuQ1Fm
 E3bwbs2AF4Z2bKznpo+aoc0Zj5Qef1o=
X-Proofpoint-GUID: sYOourtxJ8MSwBinrp82-wCGrJRY1nbH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180074



On 11/18/2026 6:38 PM, Puranam V G Tejaswi wrote:
> The Adreno driver asks the secure world to initialize some GPU registers
> through qcom_scm_gpu_init_regs(), and fails to power up the GPU if this
> call fails.
> 
> Not every secure world implements this call. When it is missing, the
> call fails in the same way as a real error, so the driver cannot tell
> the two cases apart.
> 
> Add qcom_scm_gpu_init_regs_is_available(), similar to
> qcom_scm_set_gpu_smmu_aperture_is_available(), so that the driver can
> check whether the secure world supports the call before making it.
> 
> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil> ---
>  drivers/firmware/qcom/qcom_scm.c       | 7 +++++++
>  include/linux/firmware/qcom/qcom_scm.h | 1 +
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 030e4ba90812..f4f34b7dd0b2 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -1941,6 +1941,13 @@ int qcom_scm_lmh_dcvsh(u32 payload_fn, u32 payload_reg, u32 payload_val,
>  }
>  EXPORT_SYMBOL_GPL(qcom_scm_lmh_dcvsh);
>  
> +bool qcom_scm_gpu_init_regs_is_available(void)
> +{
> +	return __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_GPU,
> +					    QCOM_SCM_SVC_GPU_INIT_REGS);
> +}
> +EXPORT_SYMBOL_GPL(qcom_scm_gpu_init_regs_is_available);
> +
>  int qcom_scm_gpu_init_regs(u32 gpu_req)
>  {
>  	struct qcom_scm_desc desc = {
> diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
> index a0a6bc0229c4..c9e88b2904e3 100644
> --- a/include/linux/firmware/qcom/qcom_scm.h
> +++ b/include/linux/firmware/qcom/qcom_scm.h
> @@ -131,6 +131,7 @@ bool qcom_scm_lmh_dcvsh_available(void);
>   */
>  #define QCOM_SCM_GPU_TSENSE_EN_REQ BIT(3)
>  
> +bool qcom_scm_gpu_init_regs_is_available(void);
>  int qcom_scm_gpu_init_regs(u32 gpu_req);
>  
>  int qcom_scm_shm_bridge_create(u64 pfn_and_ns_perm_flags,
> 

