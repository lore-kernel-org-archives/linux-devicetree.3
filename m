Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0773C10A4
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 06:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783491115; cv=none; b=L6DhDnbQ6MDotErwvWzzk9CgRzF5i4WNfYMwCw3xHx2vwtwNNITKwMwHheBntZvlMFVmqm2/EnP1ff7cm4wOSX89FMKcUJXkd/tpKnNQG7mU7Tw1uB+tkavYwMKb093EAFxET1zuKkGw2NR8z+zN+eQE2qyT3MtkKSKcYc85JYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783491115; c=relaxed/simple;
	bh=FsHukMIHzY0r07EgEbsJqxFtuDQHYMeW+AhiTLdTYzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dobkvLw6HOlBC7fyS9pgJjWaHfZ8wNm8dfp9r4W+SM1khXvvIuSTTKNOJYhAK55EeCHFDIFigDq6L+Hhoe2ZGWhgTctIPvgueQWcmOWaO3wDgoJ8o96rUm+Ivuf7+dNKBL3i7piwX+4isaStOvicYeqQm1dMY6ihYPIOhc4BO9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y2yj37QQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fSv7Q1Kk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y2yj37QQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fSv7Q1Kk"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842hJW1625060
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 06:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YbwKyhVXL6M2THrTeKIDkFqZ
	YrCtq+4cO/T9fIPwkoo=; b=Y2yj37QQkjM55p4WSB24ihPMkax0LB9KjpY7oQNY
	6LTxCyIp7iiSe4VO2z9XjzVpLKSxUWHUrpRPlqu3dfJoNzZiHrLiq1+Im0e6reci
	a+HkJaFAfwDlHLiP8BJciUDfkdbPvcmjxcAU2lrkm/Is87xmmZJkV1W7Hp7/K3XW
	yfCiTy0M1TarxkxBFKzxZLExDYeRYlRNhNnao5FtAsQ5MH5PHXQwz0RURPDFth6+
	DLob+KIaldeJIAaA6bCZLZj0WXNXSh58ai3jWGitcKFnwZiTXfTbVNIHArDf2U6/
	dgG6CUO8How1qnvHaq/0A2eAmsiRp64L8aHGPfsW4NxQlw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95fd2y1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 06:11:52 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-737f1f1e0e5so86235137.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 23:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783491112; x=1784095912; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YbwKyhVXL6M2THrTeKIDkFqZYrCtq+4cO/T9fIPwkoo=;
        b=fSv7Q1KkiW6KNm00jO97ucKq4+ZygqwkWZ+bhiAJFDSHxtONdJMJSg06/oC5l2IiTo
         o4hB7IovBa+3rl/rCpKSpcsan4UmvL2BklvzFNW6NRg/RARO1mwSGw+NqKZalHSng3P0
         YpR7D3anmK6BqNMFS3bQ72wROX+9lVxlPPR6IgTVEIuPSg+X41gQsb5NSsrnHXNKy7WR
         6L14k2pVr4JfpyWdtYTd2sQmWjPBu3K53Z3slvfDvgWpr6wavsLg+xA1HAKpY28Puxsi
         sYIhz7lcsYH4nJ9/tKrTPcRevPrPM12LYCPqHo2JeKToUmNcA2h4Pb5h2j6lUw0zGcrk
         6TBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783491112; x=1784095912;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YbwKyhVXL6M2THrTeKIDkFqZYrCtq+4cO/T9fIPwkoo=;
        b=cy6X9OFaxTO7gr8vOLedsekboi03AHNW058j7khZ8JXc+1wEbctKNhblcQ1mvddXvq
         tprYMv4x2UJngNmUQA73IbRt8skFmy6vauAk0yYpdqNraOgPz9D012MNp4RnjHcZrLZB
         7Jk3DqxsXA4HyIyDzpNKdKhWdJLBrZuHlW00ms3AHEfOCknYYbtJ5BXeyJOjdLxzKV0s
         rWXRBHRJNBJ0xMqcDIPNjBaAZ6AKDcXiQ2Th+yRgre30t+iA6qcsB78TbkFqW2hJ0EAg
         jxQ6L9wCVUuQGTCFP/yhow+H5+ZUuJlZxqJmLmneiJK8xk1f9X8KAlAwtqGJ+jujGX3C
         +lXg==
X-Forwarded-Encrypted: i=1; AHgh+RpvG6MSAnaTmkympAsADNiBLBKnEoXppxnmBiHU45DfdC//Mb3G+Ehzq5z5RLHX5NzJjKTS+iiBng3N@vger.kernel.org
X-Gm-Message-State: AOJu0YxHK6CNUmQKEi7yy1JI+OxD0xE5QoHuy75D9Xf9wZN5w3nYl7ue
	tdxgxdIjbAIdFGa2U4Z5cq0qciBWatGVoYYCQ06fVmmrF/hJD9VmnIZwcJIyCJFuBtxzvWJwvqb
	xP/Ip5peZlGTC1Oivl4lPjqk1QHxxTdiM5LhNd0w92GarykXuIeJLACmkgURjpYnF
X-Gm-Gg: AfdE7clQh1lrf8dzQPmDemjgCT3akHI13cVEdFeRXOMDfbATos8y07FVX7UyrhSKx3+
	AK52TeU8Ms1ddb6FIlIOLqOoskf+fZYOMh7MZUGbJiNeSYVlCcbJd8FKHecoAIA315DUnzUeXV+
	SQ7+D4C7mHRBRMnHQm3BUIaHQHC7ksUTBSVTyd33PgbJsulPY51DE7d+b4rpcRYE98VKAWQcm8C
	JSjxNI8MfKDMkE4F/NNqfoUvn4qM7Ae6B20qnJ3JkLSX+8XMSvJ6DjONQJgqI9zThXeSHfhOXs9
	tiSUJ32qmK+danpTNYdti3lYJVjE3pCskCHL05NngUqzA1X3J8SGfSlcbRW+Ha1KYfny38NfDVP
	lrYOUHkNaa/xvP+XWAPSjGmlRmMFfoGjgjWfcCXaHEwBLJ68AFnaKZ5VwylTn+B1v3+TN9AjuIJ
	d7ko0wztmW1PEger+PshvMzqpF
X-Received: by 2002:a05:6102:5e96:b0:6ef:db57:ed3f with SMTP id ada2fe7eead31-744e0311b62mr418957137.29.1783491111919;
        Tue, 07 Jul 2026 23:11:51 -0700 (PDT)
X-Received: by 2002:a05:6102:5e96:b0:6ef:db57:ed3f with SMTP id ada2fe7eead31-744e0311b62mr418945137.29.1783491111461;
        Tue, 07 Jul 2026 23:11:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c0117sm4285796e87.62.2026.07.07.23.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 23:11:50 -0700 (PDT)
Date: Wed, 8 Jul 2026 09:11:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] misc: fastrpc: create duplicate sessions after
 all CB probing
Message-ID: <rj6a3dko5h3p66yxn22g4wymfkqqpdrs5leuxyeihehdzxzsga@rpc7n6tjhklq>
References: <20260708-dup-sessions-v2-0-da40f9c98a2b@oss.qualcomm.com>
 <20260708-dup-sessions-v2-2-da40f9c98a2b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-dup-sessions-v2-2-da40f9c98a2b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1NiBTYWx0ZWRfX5zXYBV3yURNK
 5i7tUPruoV1Xzie93BW2MZol9b37r0KI8ha1HftsprCv1zT9ZkvAspgQD9pPFIVO+HzW91Kw7Sb
 KUDnIV9d8sbssxKax6tQRmJ2INVXZp4KXsH/qq2lZUA2tYFVcXVTsq+GQuvyNjTP81FldFKprKu
 7L0ySzmytrdDwgIxjaXYgBYugA1lXfX399RHYPUiBa7q5v+tPDYnROMKqS7u8VhE4lVKK1fQ9yZ
 R87sotL2pzJapqezk9qn9N/f+sUBPRp39X2y8sJpNJL/B+oYBaD8kTFsNjIXXQ434mRs97X1LeT
 w2rYdFcClyP4VO8WAM9N8bw12DguQOQAU4lxfBvWncFahyNl/AbeHllGxZjlGYQArA54rNcbjVh
 WI6WgqkIeTKfLu7AFrvkSui0Q44L/TOF1yry4i7bzxtKzLASw/OOYr1/vVyDtMdvbClOB8nFn/m
 MFsnqrLaZgUyEcFe6eg==
X-Authority-Analysis: v=2.4 cv=VZLH+lp9 c=1 sm=1 tr=0 ts=6a4dea28 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=zWMBRB9ZqIQM0yNuxxsA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: E21xUvsjtOe04VuB3jRtDSIofVD-eg71
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1NiBTYWx0ZWRfX7rFp/rk529qp
 diSrpv2+hwEOfUdLMaxYfcgCgMJ6tewfzbmKivL9NFyE7Ool70jabqefZdBpz/4U2KAaI+Jbh4T
 BsW3/9OvfEhczStWaacFjPrzOottm6Y=
X-Proofpoint-GUID: E21xUvsjtOe04VuB3jRtDSIofVD-eg71
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080056

On Wed, Jul 08, 2026 at 09:28:33AM +0530, Vinayak Katoch wrote:
> For ADSP, only a limited number of FastRPC context banks (CBs) are
> available. Each CB supports a single session, which means only a few
> processes can run on ADSP simultaneously. If all sessions are consumed
> by fastrpc daemons, no session remains available when a user application
> starts, causing the application to fail.
> 
> To address this limitation, a Device Tree change was used till now:
>   qcom,nsessions = <5>;
> 
> However, feedback from the upstream community indicated that this change
> should not be made in the Device Tree. Instead, it was recommended to
> handle this as a driver-level change.
> 
> Instead of duplicating sessions inline during fastrpc_cb_probe() using
> the qcom,nsessions DT property, defer duplication until after
> of_platform_populate() returns in fastrpc_rpmsg_probe(), at which point
> all compute-CB child nodes have been probed and the session array is
> fully populated.
> 
> For the ADSP domain, append FASTRPC_DUP_SESSIONS (4) copies of the
> last probed session once of_platform_populate() succeeds. This keeps
> the per-CB probe path simple and ensures duplicates are always derived
> from a stable, fully-initialised session state.
> 
> The qcom,nsessions DT property is no longer consumed by the driver; the
> binding and DT sources are left unchanged.
> 
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 30 +++++++++++++++++-------------
>  1 file changed, 17 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 1080f9acf70a..8a3944f6c036 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -30,6 +30,7 @@
>  #define CDSP_DOMAIN_ID (3)
>  #define GDSP_DOMAIN_ID (4)
>  #define FASTRPC_MAX_SESSIONS	14
> +#define FASTRPC_DUP_SESSIONS	4
>  #define FASTRPC_MAX_VMIDS	16
>  #define FASTRPC_ALIGN		128
>  #define FASTRPC_MAX_FDLIST	16
> @@ -2195,7 +2196,6 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>  	struct fastrpc_channel_ctx *cctx;
>  	struct fastrpc_session_ctx *sess;
>  	struct device *dev = &pdev->dev;
> -	int i, sessions = 0;
>  	unsigned long flags;
>  	int rc;
>  	u32 dma_bits;
> @@ -2204,8 +2204,6 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>  	if (!cctx)
>  		return -EINVAL;
>  
> -	of_property_read_u32(dev->of_node, "qcom,nsessions", &sessions);
> -
>  	spin_lock_irqsave(&cctx->lock, flags);
>  	if (cctx->sesscount >= FASTRPC_MAX_SESSIONS) {
>  		dev_err(&pdev->dev, "too many sessions\n");
> @@ -2225,16 +2223,6 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>  	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
>  		dev_info(dev, "FastRPC Session ID not specified in DT\n");
>  
> -	if (sessions > 0) {
> -		struct fastrpc_session_ctx *dup_sess;
> -
> -		for (i = 1; i < sessions; i++) {
> -			if (cctx->sesscount >= FASTRPC_MAX_SESSIONS)
> -				break;
> -			dup_sess = &cctx->session[cctx->sesscount++];
> -			memcpy(dup_sess, sess, sizeof(*dup_sess));
> -		}
> -	}
>  	spin_unlock_irqrestore(&cctx->lock, flags);
>  	rc = dma_set_mask(dev, DMA_BIT_MASK(dma_bits));
>  	if (rc) {
> @@ -2445,6 +2433,22 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	if (err)
>  		goto err_deregister_fdev;
>  
> +	if (data->domain_id == ADSP_DOMAIN_ID && data->sesscount > 0) {

There is no guarantee that child probes have finished at this point. If
you want to make it work this way, you need to replace
of_platform_populate() with the manual iteration over the child nodes,
creating CB device for each node (also getting rid of
fastrpc_cb_driver).

> +		struct fastrpc_session_ctx *last_sess;
> +		struct fastrpc_session_ctx *dup_sess;
> +		unsigned long flags;
> +
> +		spin_lock_irqsave(&data->lock, flags);
> +		last_sess = &data->session[data->sesscount - 1];
> +		for (i = 0; i < FASTRPC_DUP_SESSIONS; i++) {
> +			if (data->sesscount >= FASTRPC_MAX_SESSIONS)
> +				break;
> +			dup_sess = &data->session[data->sesscount++];
> +			memcpy(dup_sess, last_sess, sizeof(*dup_sess));
> +		}
> +		spin_unlock_irqrestore(&data->lock, flags);
> +	}
> +
>  	return 0;
>  
>  err_deregister_fdev:
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
