Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043073EA97B
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 06:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526301; cv=none; b=EH/g3p0sauHfswGw3GO31rDtdRUKEMUiLp28pB4ogkQ0UJhLkJny7BCYhL/HsVN3A8AjWUW9aJeU2BVlQn1ZkkxIGzG+FvB2MaRGDL7PPZjW4tzLHRP37P3VAm5WeCpIXRlxdMg9saPzx2xCgEkzDSzWEoabhXDtTx0NRQROWlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526301; c=relaxed/simple;
	bh=Wmkbo8HPR11OILJQCDQF6szYZaFI0eOI5BQs9yUQFP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J06D+tt93CTSZEwH/GtzqHJZhMCKAxZjCClRH4JLB4VDs/zbd4c6xqMOj+XanyuY7Tlt8AEg8zTR1mhzLzY8pLgijbYnjJaEkf2VoVwkUdbnZkPkoa9C9Ic6HOd0uyrBXB7K6UvmwKl7s2/fCu9EbMn9C6oAaHwysAz29IGLLU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O9/ET0QY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jm0p4YcR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O9/ET0QY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jm0p4YcR"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HLFW4178473
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 06:11:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3hOn6raAcGNFw6Nr4o3rlG6f+gywDsQ3FA3PX1oZuQ4=; b=O9/ET0QYXa0ojnp6
	uErL892z606ka08h489t1yy2sqohTJMXEj6zkhVtM9OU8+Ds78XV7gXZ59fZDfsS
	5PmHDU/3ugLrCbXBTncK1ZinCNqHGYLWc/GJgk1HjExatySW5UpbIxgQI0afaWNN
	/e+i+tA0d+QOsOjPIwePoGllMg9wsQlrJiD1Z3wwqtDYbatEkrazcHVOSK9wU0kq
	shhTsCeDP2Px+IF5rUvQlgvkiOfgK98JaCeJxouhZEjf6QWtq4H+JYvl9YYXdZZi
	SfSZdUO9x+ejbxkaKzG1lK7Esa7P/VVYLKalLbUxuJTwp9e7tA6c03o1o3EjLbkl
	zmqU4A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxrt76j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 06:11:39 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-88a10162189so8416896b3a.2
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 23:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791526299; x=1792131099; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3hOn6raAcGNFw6Nr4o3rlG6f+gywDsQ3FA3PX1oZuQ4=;
        b=Jm0p4YcR7awx/WGLkmGsOXE6Falh272lLivx5cFacsD+NQP4HGJM/Z4qflYkhaWiZW
         k2FO9DWh73mVxKDPOyCnrIvn1vrrKc0UnfQ+AYYjtzGVUbZwK0ZD5JJHdZiljJBw8YDs
         gR/Z3bHCGAtFZfFH6j9hr/QOMOI02x28APFyzDcHf2P0MFUTbtN+q0Fb8W7gqoKytxR+
         Lo9kQfH6z116Uvh+23KicrEJJyT8IhrgwszgrJRPIMaSREtDbbqGn8AxPgM7GSJ0f2sw
         cl0rmqlQFTNIVfYF9BcTHIIGAY305zDId0Yd61JzB3rQqd+jzhW76aTvfmE2xGmrhhL3
         otVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791526299; x=1792131099;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3hOn6raAcGNFw6Nr4o3rlG6f+gywDsQ3FA3PX1oZuQ4=;
        b=oXrnuY0QXfWnufq/5MjLdbeZx+yb6YaCMOXVW+fh2dM8DoOiaNO3+wPx3U78WLxbEE
         Ydvz7Ad9uXdeIF3T2Ii5AInDMNR71b2XKK2OdOTCiUSxcbpLgeSLcBiN+DqmcKFldOwj
         B/5GxtnGzCeEdAage2++fp5TobbNN9VW9m0fpyIAI8J//9BNNK8LTb1796TORj4v/sOo
         ivUBHVqMNRE1xme1WnWLFeRm9MV1nFnMHFfsotEYof3l0qnrfr9MzS3xc1GQJXNkKozP
         hMgeQaBEIohp1VWazBh/dXnbvSrCB+pXKb4nG8GM0OElzNt+IE3pDY59wFKnNA2miRbI
         8YNg==
X-Forwarded-Encrypted: i=1; AKwUvBxh8+NPoIJxZYqVWtUU2Lf3LSgWIvXYzg1Qhllk8mx8Mcdrkym37TOPOSdoq2AuAowVSW4EgEHmw+UO@vger.kernel.org
X-Gm-Message-State: AFuF++ljI1EQR0QfBo+57BqwVeYwZWQEFIMB+CS7+cmc2n2fNWJfudaf
	nPUkP31P7LTVgAPUmcLdpyobuHOWPNnbOI+9/lRPYTAdJUKV/UJ0U9qIskSFFXRAopemUExadAB
	GK364ZGc1USJ0/Rtp1yexYOwvsNDlWZyxxs3gLTTg87UVk7fTg1fqTLWLVrvfoRm8
X-Gm-Gg: AYBFou2ruPzEpsQAu5YNjSItKQiOnTqGefaZ5+w+9/J0IHC6ejVbqs50XeToUwfbRz9
	/QLJjqfihObImt+yM5VIGtISJtd/giPUZJohggXtzx9TSBB5+XPjJvAcaVd9ukNnAIZM0I2ZPXK
	1vwDMdFBCUk60T68LRHRYnOY3Hxr8Q1EMONRoY84Iy/ciwOXdcYBOJS9nq+D4EhtX+ZyibakpZt
	ODzERwtR1tCDfmI575fQuPa4eXC2Ej6+SnZ62q65eIkloxd66qxK8WWkT/XWp2TLyBToGmeYkal
	zhIppYQjpg3bypM8Ief6Zjk8BGdWOtkmszup5z3USJbOwOjiGNjL6Sps+EzosD6ucGDluHr4Yww
	8XPjD3AXLJEpyVtGI5CebtGiyaBPL
X-Received: by 2002:a05:6a20:748c:b0:3dd:a197:ede8 with SMTP id adf61e73a8af0-3e16bef1d07mr701375637.55.1791526298509;
        Thu, 08 Oct 2026 23:11:38 -0700 (PDT)
X-Received: by 2002:a05:6a20:748c:b0:3dd:a197:ede8 with SMTP id adf61e73a8af0-3e16bef1d07mr701360637.55.1791526298064;
        Thu, 08 Oct 2026 23:11:38 -0700 (PDT)
Received: from [10.219.57.162] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3106e07sm467718b3a.11.2026.10.08.23.11.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 23:11:37 -0700 (PDT)
Message-ID: <041b1648-1320-4394-8282-3d1cb1203d16@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 11:41:32 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] misc: fastrpc: move ADSP duplicate session
 creation to the driver
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        devicetree@vger.kernel.org
References: <20260923-dup-sessions-v5-0-e953133a1827@oss.qualcomm.com>
 <20260923-dup-sessions-v5-2-e953133a1827@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260923-dup-sessions-v5-2-e953133a1827@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E+1YNqdl c=1 sm=1 tr=0 ts=6ac8859b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=6scLBf4XpmJJRpZfmIIA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: I_ORAfHIbOon--PmxZLPjLePnR-pGARJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAyNCBTYWx0ZWRfX0IlXDOP9ROy0
 /3AceoeRoExEbOiTbKkQy7qHVXC3GV7y+Fzwj23G4fiW8tKVGBaqDN0rqmZt90K/MrKCMShjUnv
 bu+jofTp1LbVRz27U9yP0DmmIcltdvi8/agVvirt2YkQrPMGybcnVEfNFe+/1E7T9SIc4iUSGQa
 EHMXEoYVs3S+BpfHUs3SfmQ0NlxWVZNWZjsG7hGxCs7ujm2JezHauKzuFzf1/hHSao9vA61CDX4
 vLoujd3+4u36PeKqbvH5coLRxIiZdjLwZKrTu7Gv6VvmRbiMIXEgKEGRF5mrHlQjjPLZV+sLx8p
 63MXLr8IimBixKInyUdWaAb9QzorxxxpS04Nk3Po64q9Xi3z7lP3CvD5k1Ky23HtOC20Pl7dIw6
 2bq3a3RLr3+m/5OpTvwgtPHYw+Ctz++G+tfF167QhYT40b5NQcjNpwTnN0ICnJ5l8qnTJfJLuz4
 Y8cLoWD9UEcmLRjMOeQ==
X-Proofpoint-ORIG-GUID: I_ORAfHIbOon--PmxZLPjLePnR-pGARJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAyNCBTYWx0ZWRfXzjpsHqo7TUsY
 ByCMwJXoImh/m0iSwuj+ele6hdzopDl7GJMaHwabwlarZVUHbVvz0DU2qHXeOBDicScxIXQef1d
 F1hO6v1rFUpjvaVFmK7vCVjX3vitRn8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090024

On 23-09-2026 14:09, Vinayak Katoch wrote:
> For ADSP, only a limited number of FastRPC context banks (CBs) are
> available. Each CB supports a single session, which means only a few
> processes can run on ADSP simultaneously. If all sessions are consumed
> by fastrpc daemons, no session remains available when a user application
> starts, causing the application to fail.
> 
> To work around this, qcom,nsessions = <5> was set in DT to duplicate
> sessions inline during fastrpc_cb_init(). This policy does not belong
> in DT and should be handled at the driver level instead.
> 
> Remove the qcom,nsessions DT property read and the per-CB duplication
> logic from fastrpc_cb_init(). After all context banks have been
> initialised in fastrpc_rpmsg_probe(), append FASTRPC_DUP_SESSIONS (4)
> copies of the last session for the ADSP domain.
> 
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 29 +++++++++++++++++------------
>  1 file changed, 17 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index f20d3e5ecc81..b29c1fd00de2 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -34,6 +34,7 @@
>  #define CDSP_DOMAIN_ID (3)
>  #define GDSP_DOMAIN_ID (4)
>  #define FASTRPC_MAX_SESSIONS	14
> +#define FASTRPC_DUP_SESSIONS	4
add some comment here>  #define FASTRPC_MAX_VMIDS	16
>  #define FASTRPC_ALIGN		128
>  #define FASTRPC_MAX_FDLIST	16
> @@ -2338,7 +2339,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
>  	struct fastrpc_channel_ctx *cctx;
>  	struct fastrpc_session_ctx *sess;
>  	struct device *dev = &pdev->dev;
> -	int i, sessions = 0;
>  	unsigned long flags;
>  	u32 dma_bits;
>  	u32 sid = 0;
> @@ -2348,7 +2348,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
>  	if (!cctx)
>  		return -EINVAL;
>  
> -	of_property_read_u32(dev->of_node, "qcom,nsessions", &sessions);
>  	if (of_property_read_u32(dev->of_node, "reg", &sid))
>  		dev_info(dev, "FastRPC Session ID not specified in DT\n");
>  
> @@ -2369,16 +2368,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
>  	if (cctx->domain_id == CDSP_DOMAIN_ID)
>  		dma_bits = cctx->soc_data->dma_addr_bits_cdsp;
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
> @@ -2669,6 +2658,22 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	if (err)
>  		goto err_deregister_fdev;
>  
> +	if (data->domain_id == ADSP_DOMAIN_ID && data->sesscount > 0) {
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

