Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1CB3D813D
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 11:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782386981; cv=none; b=tYUDLeBl3PWf8Wg+tCdnkyGP/j7fA1cCpO++aC/K4jzSA7rePklm9sFM9nYKgKojYpAd3Ul7RxyYAXnmeOpoFujvAaOIuN6x/QFS+L5hPz5v3l7DhD5dO2ZOvbFXH6W8IEsKcF2sSSmLsHjkClRRbUEMrj9g603dtKUvl/mMr7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782386981; c=relaxed/simple;
	bh=FeigaeCzSOK6iW/OKgSAX5GIoUm/l8/iWDJQKj0rvj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YdGAckVaV3VhF/g4p0vNyDQBHpaQsdXrme2Qac0xkaZnBfp1ZkOSMBA4XMjYmBvUB8VVHgr9ypNCval+TGPF4nR7gF6yJg1ZZAiqJLSUiUkekN4Su+Uqzrxt5o18MSptyCIhmq8+ayb0h5SuP7S2tQoZ+V9Z4Wn2QmG+CfGu6Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VnhRxF6I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UgRQHT4i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VnhRxF6I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UgRQHT4i"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9k07b2010812
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 11:29:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KAAWbB5ZoFnvyjzUub8MKnikqeHBsD0LJWooySWChIY=; b=VnhRxF6Igru8Fj5s
	4fztfEUk4pCk2tarxFFBy9tQLtUBGcaiMqP5Qs/SWkbN2Vnx0PViVQM4pS2gu7bC
	ATzRWm5Q7w2wHSmpmeekTywbQobOgVwYCqDgyBkXBHFpYWKzqaWHSHQzAVKTxTCZ
	O7rVRRu6FZrzruzjMyT6rwBNBwVbQm3aAphhcOh8NJMAGz0HBjrKyUgQ/vl7v6OR
	fFG6evMRbb2CH3bgxJvLXxbug3rkKNTwza6p467gvAYiv3w/btTPkW+vk3maCPGm
	SoZrMcZ2UhPAL5rJKI1NJdAaVKekWrvrWpa2KAdd5hIoycs0khJ61uyVeclgNJTV
	ikVPIQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uhmhxxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 11:29:38 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c8a940e76so554533eec.1
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 04:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782386977; x=1782991777; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KAAWbB5ZoFnvyjzUub8MKnikqeHBsD0LJWooySWChIY=;
        b=UgRQHT4iiNa0SuRwQj1yRrZ1TutZZLFk6pEKw+jWKqK8BElO6J48nt2o14eHLQx0Ct
         9JpYVZM544CFVcUKDYuORZO0x19conpEuZ7t1Z7olgbm6VDlgFU1jCDp/F0EBOgHPciW
         G1HoahYJ07+dU6FnTMiwnkEIg/ft6khd+yFEVWcl5w5ZB47B5vgW8e+rX0v5YWz+e+w8
         ZhVPwXYQw3qfGnbkBUI2hYQHuGp2xvPuohweuI7vKXLsrCGgjvqnzlbz1Exom54+9wAT
         uh1vdK4fkQ2TgSQaTj1PY3F+xW5Fa3GxgOn9nHmuIx93yzWHIscicsi5O7D81U6P/xkE
         4Fwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782386977; x=1782991777;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KAAWbB5ZoFnvyjzUub8MKnikqeHBsD0LJWooySWChIY=;
        b=G2hleNIEGaIbHJCmhEf2+jwk7nDco0Ixu1IHu3dNvSa6vrgXM6EFdloy2bTxyGe7RI
         uly/eh+FwuAsYlpJWGwb+DgJKoVTE5N7RunneXfcZQiiBTFPtz+toI1QB1qR8CC9Lb1b
         FAcYk9h9QrQZoo7z5LA8p9WelwoTPgBbesCKkgYArDwPP6H74T3JpS+j93gErSgeggmQ
         JW7JzspGDTp/rOHp6zt5S9aBgOGssEQ+A37EuemX62WPJCquSF2qLMIGnllzCgxTCSBj
         JDAsqWsK33NmTnx1c5QgMQLRqXgyCYJVHnKitjgh1I68X/tuv/SnyavZMo3vlQ9Y0uPM
         ifzQ==
X-Forwarded-Encrypted: i=1; AHgh+RrUJ5qMvtiBMKt3qW1eCln2N0rSLfXf0SfK8VMMcvTa0LrWIrBfkiVW6dvgbYJJfjHdX2m2VNmXWvX+@vger.kernel.org
X-Gm-Message-State: AOJu0YybcXIlggcYPb6/PuD3MHedeAmRecEWsGXGYye6/FZLHfJxtmQM
	SgNi2xTlMfgZuvv6QJMX6g3xUUu9hU37P6/tEepkcfFLIEkIuyFD39JDUPE8n6LvBdtOTsuCUYW
	nBCJBlUuCd9TAxu+IFWjnvBK6RYrwCdvBFk6cAmMomL4d0BSxs+758++wicfFQ0Zu
X-Gm-Gg: AfdE7cnPtxZiLdMFbeA83wq5qEcptaR2WcnCMCltVKhRfZg5GIbk609IyVREcyH5sh3
	NyCkho08a3mV2GFbLoKAs1yNJMDokCgkra1yvJuFIEBlzavQatpf6bTmm4fPRgjdBayOtkhfaGL
	3Y/aBDa2Ve7WRWL7yerJm8Qo6k2renupEZGTT9b9gD6tnVZ032KfHA9iJrSH+9lYu7imXbnuQ/i
	/3y1C6xU83rMYbOFKRJH04f4haVxTpq5cZrT6+b3zX1iNtRLqkIUkbFUDDifujVW/DH3VIOE6Ez
	Qo/YcUNcBb+eHZ0FBBm4FW5h00qqXntPikz8i5M8872Ntk7Mew2sLCr0LgLcP9/zaXZ0b/sfYIE
	sOhQjSQLyZ/UlXL4onIQcUOgA359henNdBxt8QA==
X-Received: by 2002:a05:7301:a88:b0:304:4f23:4466 with SMTP id 5a478bee46e88-30c84be5889mr2505592eec.15.1782386977410;
        Thu, 25 Jun 2026 04:29:37 -0700 (PDT)
X-Received: by 2002:a05:7301:a88:b0:304:4f23:4466 with SMTP id 5a478bee46e88-30c84be5889mr2505544eec.15.1782386976723;
        Thu, 25 Jun 2026 04:29:36 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4ca21fsm8467784eec.6.2026.06.25.04.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 04:29:36 -0700 (PDT)
Date: Thu, 25 Jun 2026 16:59:31 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 04/19] firmware: qcom: scm: use dev_err_probe() for
 dload address failure
Message-ID: <20260625112931.4ibhxk3zjgpclaob@hu-mojha-hyd.qualcomm.com>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
 <20260624190830.3131112-5-mukesh.ojha@oss.qualcomm.com>
 <20260624192213.C82691F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260624192213.C82691F000E9@smtp.kernel.org>
X-Authority-Analysis: v=2.4 cv=cqerVV4i c=1 sm=1 tr=0 ts=6a3d1122 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=8nJEP1OIZ-IA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=2b9AtHKk-1rM_mh8X8gA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=PxkB5W3o20Ba91AHUih5:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA5OCBTYWx0ZWRfX+Nt6Mzuw4uS0
 6TtMAljqobfWU7bfKsGB9PPro+8D1/DXioHg2Wg/DNp25n7BMsJPFVyyp2bwADHEcdL8Uz/K7xs
 z2jJkD8LdAFrnZpx1FQ5SkkO6x3GVrBPxw1RLX0WCMC8Okm16w9BQj1TKowe5rXgQcm6U4OQaZW
 Hv5BxW58N/5fycTalL5E9hz1qUQ95eYVE0S9wUCUQjNycVwpIBaINT9xJBg0Ig39xGiOz1W36CX
 vFnRn0ZLW7AFJcagHVfLiB3JiuIXxNNnaGZYaKNmCJQAz12Z0FPCAGAGipCVVTz8xx9jSWE3H+Y
 dGOc/O2WFMXNcn2KhB3hwrvhNe5/A/jXg9wCxiwj5DYiSft4CW1LjgVJIqKXEcHreEvfRWsAa1B
 6jhBH3fEmkLCvN6gJd4sZ0+t2hydjLFkUgzUraE4I7damA+Eac84Gc7LtBfFAgVVyTSRnp1seDD
 f4a3WjuMObGyq3ixEIw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA5OCBTYWx0ZWRfX46p4ZAZggIhM
 1QgAK7de6UQk7SvMM7xk0j+C6Iuyaw24CUwvM9tyDUXFYi/iGpR6Pl5vRy/VUdYB/aJCJ1GkQa0
 ljyBVJO+/lgBqKY7nXJ+D+rZSF2Y+YI=
X-Proofpoint-GUID: DlGfQeBucU9sW_dzig-PGPGO6hUGxehe
X-Proofpoint-ORIG-GUID: DlGfQeBucU9sW_dzig-PGPGO6hUGxehe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250098

On Wed, Jun 24, 2026 at 07:22:13PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] The global `qcom_tzmem_dev` pointer is set during `qcom_tzmem_enable()` but is never cleared on probe failure, causing subsequent probe retries to permanently fail with `-EBUSY`.
> - [High] The probe function calls `of_reserved_mem_device_init()` but does not call `of_reserved_mem_device_release()` on subsequent error paths, leading to permanent probe failure or resource leaks upon probe retry.
> --
> 
> commit 6dc15526252b78a9c217f06ed35ed4966a794450
> Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> firmware: qcom: scm: use dev_err_probe() for dload address failure
> 
> Replace the bare return ret after qcom_scm_find_dload_address() with
> dev_err_probe() to produce a consistent, deferred-probe-aware error
> message when the download-mode address cannot be resolved.
> 
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > index c8a84836887f0..6cd4d9468456f 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -2750,7 +2750,8 @@ static int qcom_scm_probe(struct platform_device *pdev)
> >  	scm->dev = &pdev->dev;
> >  	ret = qcom_scm_find_dload_address(&pdev->dev, &scm->dload_mode_addr);
> >  	if (ret < 0)
> > -		return ret;
> > +		return dev_err_probe(&pdev->dev, ret,
> > +				     "Failed to get download mode address\n");
> >  
> >  	mutex_init(&scm->scm_bw_lock);
> 
> [Severity: High]
> This is a pre-existing issue, but does qcom_scm_probe() properly release
> resources on later probe failures?
> 
> Later in qcom_scm_probe(), of_reserved_mem_device_init() is called to setup
> reserved memory:
> 
> drivers/firmware/qcom/qcom_scm.c:qcom_scm_probe() {
> 	...
> 	ret = of_reserved_mem_device_init(scm->dev);
> 	if (ret && ret != -ENODEV)
> 		return dev_err_probe(scm->dev, ret,
> 				     "Failed to setup the reserved memory region for TZ mem\n");
> 	...
> }
> 
> However, subsequent error paths, such as platform_get_irq_optional() returning
> -EPROBE_DEFER, exit directly without calling of_reserved_mem_device_release().
> 
> If the probe is deferred, will this cause the next probe attempt to fail with
> -EBUSY, or leak memory by duplicating the rmem_assigned_device list entry on
> every retry?
> 
> [Severity: High]
> This is a pre-existing issue, but does qcom_tzmem_enable() cause a permanent
> probe failure if qcom_scm_probe() defers later in the function?
> 
> qcom_tzmem_enable() sets a static qcom_tzmem_dev pointer in qcom_tzmem.c:
> 
> drivers/firmware/qcom/qcom_tzmem.c:qcom_tzmem_enable() {
> 	if (qcom_tzmem_dev)
> 		return -EBUSY;
> 
> 	qcom_tzmem_dev = dev;
> 
> 	return qcom_tzmem_init();
> }
> 
> Since qcom_scm_probe() does not clear this pointer if it defers after this
> call, will subsequent probe retries permanently fail with -EBUSY when
> qcom_tzmem_enable() checks the still-set pointer?
> 

Since they are existing issues, sent patches for them in the list
separately.

 -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com?part=4

-- 
-Mukesh Ojha
