Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100665;
	b=joeaApIZtLhGqoXBk7Oulb4BGJXM98UPi2wcPnnRFK9YJbz6Z1FQRUavgCtmRLdUae6m
	 S9hHlf8HqIu/0zI2qQhqv3AFMAggQYsJnvJEH325l7N7mX+fi0BnT0WZDTGIqtmxNE5Bt
	 YlKNRnN/q2LeHzR371CZR4PVH0T7eojRfg8KqGwOrEMBJ5Hd3bsNi7nQGXX/Zo+iKT2OO
	 mUqO5X/xGQ3Re22laWR9SN2nXY+in/XUYjveC2SzG3SXtD3ALXJCRNdPFZFT6umgaznmy
	 vvEYt4Vn/bCsw4o8ZbUwhcU72G6+9jGN7UbCF2Mnl2k6hy2zPeTsnlVy7stt0qA73uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100665;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EZV999AdlRRtqkxVlOTuk2BEEI+idcTU+X5XEmWLzBM=;
	b=oT6d2EnRlKKvnGcz3qUI5Rp7tHLL/wYCIU/dYrrw6aCybRtc8PcKtuWfV8YmuLTLwMgo
	 wJa9aDS75Pptwfa7ShnkgUGHqc8YjIKq7CP7/hem3KQZuj6fnuAj5dCKNK1l2zzmWsQ43
	 cachTOxNu5onYaqcJhW8zPy91d0bS7eGFgPxeCaaJT8XcuPryoHf+wH0yZpyJsieYshz8
	 MEM7x/uOKJpdZdaY6NBcnn+3oPIH+sqlsjQqSApRCUKhNFSihJ7TVnIYPNge9U2OgHpra
	 kLfXKiyeEk1ZXHEqi9cQ4x+CjMf+v+Kby95CQObYrP97QNBjoc446Ij13mIanwXntMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CxhXrxeR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T78TujVY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CA7606A31A
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:31:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26CA7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CxhXrxeR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T78TujVY
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdwxH1614517
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:31:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EZV999AdlRRtqkxVlOTuk2BEEI+idcTU+X5XEmWLzBM=; b=CxhXrxeRo0uHosVs
	d+YypxksBHMEuil3Lvq31ZAu7lZ5zUP/I0rhgeninKTHNegcPkDehC1Z7x/MhcqX
	57rao/AG897OTeTj/a9DdWqqBSTHHw91oaItygxwnh09mzR4dcnYfEusq7oakmi4
	FWOfMn7mEva1j6baGb424lXhwteRHSJKCoBsVedhOpCK/lmJ2MBEffZybvel80zJ
	bH6cvvvrVab2E+l9IiJCtjN2ijbQFSiSRSa663uHNgj1u4zlfyVdrv+zl4oLu9xJ
	zO0kxS0pnLRkwyxXHI9oS8iOJn0V7FDavUjXJfXEmAzVV3xC0fqx8YdITd1Zb7G9
	NRZCyg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqf5rxj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:31:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ea8a9cfe6so109450185a.2
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100663; x=1793705463; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EZV999AdlRRtqkxVlOTuk2BEEI+idcTU+X5XEmWLzBM=;
        b=T78TujVYKOU7ROi9xdJtpzVjavN1aqSV9ppzKfY3E3UOeETrQG2Ua+OS66dDr3RHid
         YHf/XBr+bc0JkcCcrc5s/P0X9vZV2MrHjT2NkxYzi4VPf6r5zv3cIlgP04jfIB4GyZPA
         2hnXw+a+buIBjuef1BAgvkZIzrvujyfzK2i1Lll1S3nS/iufux5YNke07eRvKH5n8cuJ
         RO4ehLLzkV6Tbv2t8BUAYIwWb0TLAOkwa2c/tOifngyZOGnFgs3TxgRTg7lEbrnw0I1h
         JX8nBnWgJRSl/q7rWUBr2G/c57KbK69HWFf7Ei5thRqBjEMSK45cx1v8XKsRmqzF3b8D
         rzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100663; x=1793705463;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EZV999AdlRRtqkxVlOTuk2BEEI+idcTU+X5XEmWLzBM=;
        b=Q9y9G3IV11FYPlnKDv+qjwdNpCEUsTp72GqD8okpN6ltoUG10KNqfTxY4kiX1dy7uW
         aoiilS0q9IX3JPTf5wG9Wupo4RIc8pKoGRQrM5epgCX9LIE8o3AC+RcHrSALTZ3qlVoN
         icC25v4aJzS4pthVJMxkTk0221RgnfBajWIAaeJ6x5VNNOygRLoWQJo23nhlMyT6Fa8I
         rd0BB4QJExTeJ6eyXrmShZSYw5dcd5X3TIB8VMDAdUMdhU38A3gNUbJHGtGQJQxbhigj
         IYqWdtO1ZZBqyffJCQFDz5oQGaUrmZc5KvG6/iOh3ORyHVGScJ/OexvhJ8Dy4bmB6GXM
         hY5A==
X-Forwarded-Encrypted: i=1; AKwUvByhMBQSuGXtO4ixW18MySjlil5z/I83pkcsSM9cdmd3xRHK1hrUTz34UdYErQv/2nyXHE6b95Et05tk@vger.kernel.org
X-Gm-Message-State: AFq9FYIDvL4M17VVRicLJFCf4DCMKoizUXbRVvZY9roAW7CQaZSC4ViJ
	uwpwKwMaf6ZYMTE0D/ScnCktixIiiOKxkgkHGH0SOmmcTJCPwxiLYNZr/GHEz6XNFrIl/7mRv3C
	vkKamNPPmFdRqwXoromq0NIyO95ku1Zg+skXou7fZU8Vgrl9r0GuvRPGyIlGhy065
X-Gm-Gg: AYBFou1D7oMx9uw+rZ0yScEtI3dxkRnRuqF88sj4ylFiW7Hs8720uoiP03LX4OCewAY
	2NdmcDgdKGrgLxFEgZxZrNOXD78UuAKlIc3lNpjMibd7iKuxSSABM6nVyz/iA7/fjvAr3n/kf7Y
	sylk6Zs4mW3Vii0LWPH49M/thhxktqFmUOM3C3DeOCgw6Vg912bf9Gap3DJPzdpHx8ZVG38jLcR
	/0B6gLussbxiAu6P4uE3Zn5gLmAaKQ5Mj8fk6POV2NjDJhnCX/Pkp9jMzJ3Jio7qx5kSRRvgBgY
	t4Ya1IHR2BEXyArvK9NJWVFylsOw77BFYnBCi4w5OKpV5FLk/UdXUMfcy9G5vT/FAsFW3kEaVnB
	OmaF87kvurBiYQpf2uava+mFFrz25/lCUlX7pr9Aif5VOlaCeQTZgO77NEF2/F58Bvod6078=
X-Received: by 2002:a05:620a:57d1:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-940ef915dc2mr1745445985a.4.1793100662986;
        Tue, 27 Oct 2026 04:31:02 -0700 (PDT)
X-Received: by 2002:a05:620a:57d1:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-940ef915dc2mr1745439485a.4.1793100662389;
        Tue, 27 Oct 2026 04:31:02 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd0f6f1asm441101766b.0.2026.10.27.04.30.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 04:31:00 -0700 (PDT)
Message-ID: <a3096f94-ae83-42f8-a9ab-19b185eb9531@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:30:57 +0100
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
Subject: Re: [PATCH v4 2/5] drm/msm/a6xx: Program the PDC sequencer on Adreno
 620
To: patches@brar.si, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
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
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261027-adreno-a620-v4-0-b0095e028c76@brar.si>
 <20261027-adreno-a620-v4-2-b0095e028c76@brar.si>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027-adreno-a620-v4-2-b0095e028c76@brar.si>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX03R2BKbYaRyS
 tFsJqM18bvEH4TmAFyF7fTUA+m9qK5ZENXenvqFKfBjIial5pZY83uzwPFyhpuXEVjwqEvb/hby
 nWdCNgFUxgH1wX7okUmfVajUZ7dTm+w=
X-Proofpoint-ORIG-GUID: ewlb0Foxy6DI_88ECgqN8Vv1fAtBUZ7s
X-Proofpoint-GUID: ewlb0Foxy6DI_88ECgqN8Vv1fAtBUZ7s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfXx9mM/gk7LtyL
 4cgPPmtULSK6C1ExU51sqWTfbnMVXYQzx9XiaL4++Ewf53irFSf4wPq+DdBOu2tiUpgeynYXHss
 sQ/4oMZ1aVB2xc/xJ5CjTQCNQyr5Z27CeeuH7sTmthJhyTYPsgeqsn9f3EkWRtsBes2wgLIsZQZ
 3GeW4A+pVVN6draiFC02rHQVlyWrNrVuXVISzlAJ/AkDn0+SwiKhJU7iy8uZuSUHjNVC6FCN53t
 KGAQwYtYBBvGNy4akmQJpe+4phGDhEsiH28TmZ3eCx4iczhGgAh5nUqGdAwR8q0Xpfuwg9FnOxs
 teGPPL1JEfEI67JCCBLtlkfVuVQ4IjFbgqrZ51M2YT6uvMsJYUe2Hx9H85Hb7+FCc8khWrL4ENB
 8EF/oUORt5yAAWFRs9oRQSFplo23msWv0HQD5GyXeAP3GNukd9EqE+S01lBIbzeJUeqanzayOas
 xhMWJFJufT1ac2Rmk/g==
X-Authority-Analysis: v=2.4 cv=UOFIjyfy c=1 sm=1 tr=0 ts=6ae08b77 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=27YcngequVK7hVtoIPYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270045

On 10/27/26 8:14 AM, Ishu Brar via B4 Relay wrote:
> From: Ishu Brar <patches@brar.si>
> 
> Unlike the rest of the A650 family, the A620 does not get its PDC set up
> by AOP (the downstream devicetree has no pdc_in_aop for it). Without the
> sequence, the RSC never acks the second power-up ("Unable to power on
> the GPU RSC") and the device hangs.
> 
> Program the sequence from the driver, taking the xo, mx and cx resource
> addresses from cmd-db instead of the hardcoded ones. Like the downstream
> driver, also program the VRM command when cmd-db has a vrm.soc resource.
> Add adreno_is_a620() for the selection.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c   | 35 +++++++++++++++++++++++++++------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  5 +++++
>  2 files changed, 34 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 662f09bec9d5..8d426f1f127e 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -686,6 +686,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>  	u32 seqmem0_drv0_reg = REG_A6XX_RSCC_SEQ_MEM_0_DRV0;
>  	void __iomem *seqptr = NULL;
>  	uint32_t pdc_address_offset;
> +	u32 mx_addr = 0x30010, cx_addr = 0x30000, vrm_addr = 0;

We should grab these form cmd_db unconditionally, so:

u32 cx_addr = cmd_db..
u32 mx_addr = cmd_db..

etc.

>  	void __iomem *pdcptr;
>  	bool pdc_in_aop = false;
>  
> @@ -697,8 +698,18 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>  	if (IS_ERR(pdcptr))
>  		return;
>  
> -	if (adreno_is_a650_family(adreno_gpu) ||
> -	    adreno_is_a7xx(adreno_gpu))
> +	/* Unlike the rest of the A650 family, A620 has no PDC setup from AOP */
> +	if (adreno_is_a620(adreno_gpu)) {
> +		pdc_address_offset = cmd_db_read_addr("xo.lvl");
> +		mx_addr = cmd_db_read_addr("mx.lvl");
> +		cx_addr = cmd_db_read_addr("cx.lvl");
> +		vrm_addr = cmd_db_read_addr("vrm.soc");

but keep assigning vrm.addr here, as kgsl only ever writes there
on A620, but the cmd_db lookup will succeed on other SoCs too

Konrad
