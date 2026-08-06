Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5607848C3FF
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 18:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786040697; cv=none; b=LC4Ro5u+DVqKQeK7ULKaj3CcKX75E9rVTJGEItj9JwaTsk53AS8/L8ns9CC8y94unz/fJMl32HTzhZrx6DNlGgzc2rlLLqEMz90xWBlYWP+uDSwbw4v2df19DQjGBoWDX84G+naxdCaCQH2EruzJg7P/sGz+CAXVOnAEIxZAGGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786040697; c=relaxed/simple;
	bh=y0dQYGiQOYwW/eAOTG5GOZGj8VDF399Xgl/hPfbAQZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MsJDsK8sOjTsQQs2lsZRcJFvnMrMlWDfCR/r0NkOg2a77HZsWCrFWJsMNAqNrBy8KRDIL4zdaJXLoFI2KCZ8l4N5F7UEkXJPNEGhIpPZR408023Cn4ps4ow6/CvzmcVAASy2WAdHnkBnzD2OAWpIdwHvABf38pRGUfbhZu7iQ5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TnvEHapi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wt4WDaFj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TnvEHapi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wt4WDaFj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676IHdTx2791568
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 18:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bGV75NTkpHIAnldHndd4H4dBMpSpkx9GuGpjcJKUYaI=; b=TnvEHapiinUk1mxR
	Yrs/ponipl7UEDeDg3cY7/nW/4GHECGEorOuVuxUGR1msGUbCaMiK+LkYv0pAuWv
	OE2QLovdGFYHc/BBb8cm+1KXbVcKmwAf+BS4i28/Hir5RS8JpX48LnJhlqx7TJ/u
	lDxbGJR7GMeQRl3orpHvE3lxbeWXqr+rkzWSA+mkUng95Kuxxs6cEMk1tmNpWP4B
	9x7a1DZBqfK+0Qhw2Ey6TISRZoxld81Zg0sBRVoJyZf4Qq+CiIsRmy64MSx5avx7
	sAECZsLcOpesWXDdcXEQEa4GBgDEZDWqWo645MEc6Qbz4AJsmdPbus7FadZYkc88
	rWJ+zQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6jr3cb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 18:24:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so2943645a91.3
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 11:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786040695; x=1786645495; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bGV75NTkpHIAnldHndd4H4dBMpSpkx9GuGpjcJKUYaI=;
        b=Wt4WDaFj4kMVm7f+idIBOADfVj/ecf4Cgr5ArEKMYKZi3CQVc50OlDhTlguMhntc6B
         Wieemdbf9XlG+3e8pEBgSO6Wb4sQCf/NQ++oQOKnen65prLt0GeJk/u7gb+JePo3zwSq
         HBd9kCSZgnwS71vkcfuJHsWxZYeBl/QxsXMjVcQmG6U4eIWbwMHEFrhOWhWHBX5dFl8u
         WF+loPkCGSRMWxy3MFbDLFpXDQDXN/iu2zN+7cFU5AnBrwUmdxgzEtRmOca/I6i3y7g7
         4Q1hGckm0OE2WZlfzraOpnekSrzWZiEODkB8o4L/cdXIkPEj8EApCFRPq+qwEPMOkF67
         huNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786040695; x=1786645495;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bGV75NTkpHIAnldHndd4H4dBMpSpkx9GuGpjcJKUYaI=;
        b=p9tOoxEsVM8umfGXt/6uxbba22lXXWSNtkjt/Kt7RGGuGiZAocIIsjeqRdi8SVcE9z
         eg3SiAEfuaXp6jNuFtSMVeTu20IwB5mqOJa8zCPxXPSnPOomodIs7GjFnPNpZnPGA/Ct
         5Q8LqHPiUxmOt5SnI1/0B40Y5myHqnQMIdvBLlKyFsStIXe9Y1KLAfCNnqWLCf4Lg4lU
         AQFltwVYgMh8C/pAFX0JTGzs6oKKZv5P94tIkQJPVpp3t36aLAsJ6IvvbjY6W/zSDjO5
         sMlUrxhCd4I8liQ3E2d544eoJXDaD10O+/HxHMmbicfX6J+ZqQMJYcyBVVZBE+0ml80x
         O7Mg==
X-Forwarded-Encrypted: i=1; AHgh+RplcFI5GsW9u01rjPMkPgtM3HZzTOoQF4X46YcgwNqDauUp8U+niR95IBP1HdmHMRyNQCJjxuaDtQ14@vger.kernel.org
X-Gm-Message-State: AOJu0Yy06jLd60cwLByzfmNgD+LMI+WBh9HZibfAibPaGNjevXNxoblg
	LsCuALq9kmyjfrfPl0h5p1i0szS2sY4M5iBZ6VTZJ+IN8M3cYLFri03VWLMPxUMlynQKeSDUY3k
	+ECRpe6y/PqXjmh2DdHGsfAuHE2hWsGEFIQethTbEaDccw7rqeofgB3gvJxfE5+eE
X-Gm-Gg: AR+sD13yCjuXbdXGzet6HQvhcmNT2Fto1mI25cmVCay5f5HAG7KXWHHcKfZePixCOg2
	TqGJbxhFcG1Tm11ymT3dKdU3lIdpTT8ZlJAtOQ/SjMv9V3jzF9RLGZ+QJVVWPGAOwthJeNILsNC
	QiDVfdjn0KcXvcsyfhIY2YLJa/Bxx2ER0XTKhr8i/61hrPwfVrJ/zuSeXQPzmuXo0c7thztJvpq
	iuecYJ9oURx6vfKntEgq4/QremdGVPr9erj81xrjP//f1Di3XUe1nSqxSUp1DJYAT3SiKcuaRMV
	u8ngYPFhGCnvF2mo/cebAmppOnJCxfgQDejgIr/MMqaeVlN93eGBgCos+uRyT/BZo1uwl3JVRWe
	xi08sG1xD9/7PPHO2my/NYU3I+HyUNDeOrw==
X-Received: by 2002:a17:90b:2245:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-3903c5a6abbmr12183108a91.10.1786040694750;
        Thu, 06 Aug 2026 11:24:54 -0700 (PDT)
X-Received: by 2002:a17:90b:2245:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-3903c5a6abbmr12183053a91.10.1786040694175;
        Thu, 06 Aug 2026 11:24:54 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.231.86])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141009923a5sm460846c88.4.2026.08.06.11.24.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 11:24:53 -0700 (PDT)
Message-ID: <3c39da7f-ef15-4219-8126-dc5255c10318@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 23:54:47 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] spi: qcom-geni: Use GPIO to notify master of SPI
 target activity
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com,
        Krzysztof Kozlowski
 <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260806-use_gpio_to_notify_master_of_spi_target_activity-v1-0-c363a9b5df69@oss.qualcomm.com>
 <20260806-use_gpio_to_notify_master_of_spi_target_activity-v1-2-c363a9b5df69@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260806-use_gpio_to_notify_master_of_spi_target_activity-v1-2-c363a9b5df69@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Rt/16imK c=1 sm=1 tr=0 ts=6a74d177 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=uB10XSru4U0CyR2DWkO06w==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=qmjqkF4nJp0v-fA0mrIA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDE0NCBTYWx0ZWRfXxQEQUdaQyjRe
 UNzHW2mOMrBa8yZ0jCJGskxTo2p8x05hvVkRFLmlokcYqR0Gz36yWyPC9eW9o+13/AV/jNw2VGI
 ghnqowkShhloOUiu0E3nxlzstjUj+aiVPbZUYbV0kArAute5Tv48blD5snpmzCeUVUf3S0jraHT
 uOV+IzXuvMyoDf1E61pr+Dol+gDHvyEy5TdupcrpeP5KP0js3GB2G49K0MbheA1JaJJrmgytfd3
 lhwltuRDVm8l+y/wH9c4BLOEbej+HZayX0aObQOThKDgqyZAZ/KvossFOAaXhokdum83iCMRVbe
 Y6dmyAwp+YsUZOJJbq9yflb1JYW6hceFXeBruU9J8YhojfcULqkpzida6Hquvh/1MVjaLDFbTRw
 M4b9E5q0BNHcbdv/lp52bdjHGLsRKbx+BPv1TGYR1R8k6kIFjPe83zprl+T8ltEA+ySYVmFzcv3
 +gIt9y0zujTEhtEk+WQ==
X-Proofpoint-GUID: 9e1tfDRtqAeRCzug5Dw35fMJhfzHpfC6
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDE0NCBTYWx0ZWRfXxZaUSzvepdwJ
 lMCSsCdeBph5C5Xk617p4ViqtwoWQH9xeOmrz9EeZkKfX8xwpv7lw19BZMDidILUO5Lnt33D0xw
 bE1zlpDb3a0gvvIcWSnzL855yX+YtZk=
X-Proofpoint-ORIG-GUID: 9e1tfDRtqAeRCzug5Dw35fMJhfzHpfC6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_02,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060144



On 8/6/2026 3:43 PM, Praveen Talari wrote:
> When operating in SPI target mode, the GENI controller relies on an
> external GPIO to notify the SPI master about the target's active state.
> 
> Add support for an optional device GPIO that is asserted when a target
> transfer begins and deasserted when the transfer completes, is aborted,
> or hits a timeout. This allows the target to explicitly signal its
> availability to the master and ensures the GPIO is released in all error
> and completion paths, preventing the master from observing a stale or
> incorrect target-ready indication.
> 
> The GPIO is optional and requested only when target mode is enabled,
> using devm_gpiod_get_index_optional() so targets without this signal
> continue to work unchanged.

if this is an optional for something like showing target readiness,
why it's required ? if not defined, what mechanism makes it work properly ?

Like does it depend on any timing or sync mechanism if not the GPIO way?

> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
>   drivers/spi/spi-geni-qcom.c | 25 +++++++++++++++++++++++--
>   1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c

[...]

> @@ -1116,8 +1129,16 @@ static int spi_geni_probe(struct platform_device *pdev)
>   	init_completion(&mas->rx_reset_done);
>   	spin_lock_init(&mas->lock);
>   
> -	if (spi->target)
> +	if (spi->target) {
>   		spi->target_abort = spi_geni_target_abort;
> +		mas->target_gpio = devm_gpiod_get_index_optional(dev, "device", 0,
> +								 GPIOD_OUT_LOW);
> +		if (IS_ERR(mas->target_gpio)) {
> +			dev_err(dev, "Failed to request GPIO: %ld\n",
> +				PTR_ERR(mas->target_gpio));
> +			mas->target_gpio = NULL;
IIUC, this GPIO is an optional one. if so, please add a comment to let 
go ahead with an error.

Else need to return an error.
> +		}
> +	}
>   
>   	pm_runtime_use_autosuspend(&pdev->dev);
>   	pm_runtime_set_autosuspend_delay(&pdev->dev, 250);
> 

