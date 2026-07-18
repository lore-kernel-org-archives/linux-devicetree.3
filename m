Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB5D43F097
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 01:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784336534; cv=none; b=bQZJkv+RFeiGmhCEqo0kw0aMOxlem1cvcb8F+dnZ3pys7SCI3Gr4B/X+xwyAYpAzH/4BbAt53ia0ilmXgNTwr6Py5oijj66EDg17BpROQbx/BqtA4vBVCaM0Zn+Y9l9vWGFIWhLhAKZI+4vidEzk7SdfiLdqoAIycr8X3D4usWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784336534; c=relaxed/simple;
	bh=LB8WmO6Xt/8YrB/XsflzPn3mb+khWBvgDJxKZshSPec=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aUbtHhANY3sBbS7cSv0VMLI/2bpGuk5dsjmzE12Y2MXbwimFgiocgLYwv0pkuxCvCjYZZ12UOoEhse9ylUtfEf7nLsGHDiy7rDnFTaTcP0abinq0o39O/w4VAu6PCBAo0Dj95Q4McHoJhKVsP7akwsRe9aw2tzcRb+qxv64Y6o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KvQCMRDN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KQEZ3tFG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KvQCMRDN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KQEZ3tFG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HNEUEg3252763
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 01:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ndVLBGOaRkTIeL6UHZEk0Jhyj0fG2C+GgrAhet6ouvA=; b=KvQCMRDNFCLHIu5Y
	BAVpFBuw1FXrhE7ZwgIXY6AG+O5LEgEozjBHrLTeubn9+H8E3MlVmR72i4oI8+4U
	VSrQsbMqMI9b696vWMgHCMhHp8R/mV3NWDxR5Hz2e/UGekK3nr5k1uDSulfh9oMi
	8BrIzm3vjpygWjFMGPeVysUCi9ijcJd8I3x+f/uyJ9N4/gjFgS/bSsLxOrgUMzIC
	n023cDu53Srm5jIOTP1nuVTHXU+mGxhqCpf/kJ/yW7aZu1N/54DghWdu8q2nkE9x
	r5bcCGI8b3ZN0fng4vq6be9mImQN5+Ds2L43eYQC0/3+Ydn+DU3r2m9N0zzabwHn
	TCh9ew==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff813vve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 01:02:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb687f82eso122370915ad.3
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 18:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784336531; x=1784941331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ndVLBGOaRkTIeL6UHZEk0Jhyj0fG2C+GgrAhet6ouvA=;
        b=KQEZ3tFGQAOssuW40hgFXLHfyq7sikjpUdPD4nsocBe6XvKvkmp6FaYAu2zSKiLE7q
         nFJVImxPv8bOqzDJSuP0HU/p1AK40pkYEwgE+y48/Skc/RYd6pXhlRp3ffbZnOXRL0Uk
         UQ6zoumRmNjkadN5rblAHu8h+3babDgj1dHYHgxAGKE58yanjx4k+Hexol6QYpVUkExD
         LKl1BHCKv2uB3+IOU3zM8gDCIpAuwTfgsXUGsmYepBcLWoHMKlNZ87mFYqnnoRTn6rOU
         7NTpR1i3GPJ3DQ8miMu/xs5bNOtVK8VtrEzOAT6eFCUx/DT2RjGm9AKgHJ8G3BTr0M4O
         PyVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784336531; x=1784941331;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ndVLBGOaRkTIeL6UHZEk0Jhyj0fG2C+GgrAhet6ouvA=;
        b=T0PHWlgXOY/MfRWtTFsTvkBla7cu3eykYMojiFL2Z9j5eVz9dnrbjd8VAD8Qq7TtJ8
         /XRRMq8sUXhKY26gJ/y1CtUCmwzSCek10kXzeXSvRxrIvmAfJerItQVYiIJAO0/gcWoh
         Nrc+MEC4SKPS2Xyqen4gjR8E408O4Utgc63mML8b8oloJs0F3pttNrdx+XthpLMXJDIV
         in5jPykKHg7qizltnnx8HXlMuTgtcM5pcZ1IQSYaeeZcdqTwRzpT5hViD9cDwzG8gMoO
         rol/FRakxcfdpeScIL5ekPwzeF6UdCPx2O4ksFsecNewqyRSjdhvUxBqZkny8ZCjQ1VO
         tM7A==
X-Forwarded-Encrypted: i=1; AHgh+RqZ/xG+oQcsdG6S3bQJffzkRqXG1N9Zj3Vxw+IujRwLhAsFRQpr6i78UH/eEuWT8aCwJN83RPFlrfra@vger.kernel.org
X-Gm-Message-State: AOJu0YxJZYInkjjzJusjabGR075o2bnH8Bhk5hLr51yuNEz9KKGLFsbE
	Z0T1iw4sNvWMeWPJLQguL8rIxDqW0izfi1ZgPcjriFWlx7ybJEGbhphhp0v1jx2GNvdX5bc5dmM
	KH5CG9Q0dALO2+VS9ch323+4VRHV2HmRH2Qk8kBwHYt3vVE3qDApmlpvWoabYI6Rt
X-Gm-Gg: AfdE7ck+j8udUvaTuJ9iqZmkcoi+hOV3rWQQbQjStKOXtAknKytLYIWUU+u3RH1x0WN
	nyV6uSmoJ44R3XLP2apro8aUzsQzR7JvLF77v4GrLgeU+aajAWAIrAlVk1DTz65Rf1Ox9iwZ5Wf
	386fpJQKdZ/nM4NcdPKbFZvJ/J1DMh8CJqKxoh9xUxZ63uoq4VMPx7vu/Mxv6F1T4+oEnnBtiKI
	vcYztctdtB0Dpk7Np+klcYkMPBaoZC4Natz3YcVoAVy+G1B7qmukkekxs/EQXUJX6a6olWwDXAh
	/rl8xGfqxxw1N0t2t2cp/j8iTtdtJ13cJ5+9p2vxH8vFH76UC5IUueIAAHdqmBFfelWRZSjNgUf
	uPg3Ovi72xcwwxyuG
X-Received: by 2002:a17:903:458d:b0:2ca:17e2:2acc with SMTP id d9443c01a7336-2cf348bbeeamr53782675ad.21.1784336531037;
        Fri, 17 Jul 2026 18:02:11 -0700 (PDT)
X-Received: by 2002:a17:903:458d:b0:2ca:17e2:2acc with SMTP id d9443c01a7336-2cf348bbeeamr53782445ad.21.1784336530589;
        Fri, 17 Jul 2026 18:02:10 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf342e3a8esm19632685ad.0.2026.07.17.18.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 18:02:09 -0700 (PDT)
Date: Sat, 18 Jul 2026 02:02:03 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Jakub Szczudlo <jakubszczudlo40@gmail.com>
Cc: linux-iio@vger.kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
        andy@kernel.org, marcelo.schmitt@analog.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mike.looijmans@topic.nl,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jorge.marques@analog.com, antoniu.miclaus@analog.com,
        mazziesaccount@gmail.com, jishnu.prakash@oss.qualcomm.com,
        duje@dujemihanovic.xyz, wens@kernel.org, sakari.ailus@linux.intel.com,
        linusw@kernel.org
Subject: Re: [PATCH v8 3/3] iio: adc: ti-ads1100: Add ti-ads1110 support to
  ti-ads1100 driver
Message-ID: <20260718020145.72762d9d@jic23-huawei>
In-Reply-To: <20260717185033.246580-4-jakubszczudlo40@gmail.com>
References: <20260717185033.246580-1-jakubszczudlo40@gmail.com>
	<20260717185033.246580-4-jakubszczudlo40@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RbqgzVtv c=1 sm=1 tr=0 ts=6a5ad094 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=mcsFP2XhKlOFKfFfNWQA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: dTmX1XgD244nz8bZ7RsCLvqf9B5CPWs0
X-Proofpoint-ORIG-GUID: dTmX1XgD244nz8bZ7RsCLvqf9B5CPWs0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDAwNiBTYWx0ZWRfX+7gaLyrIZ89Y
 OC083VoN+o42w+Y6M0MiPNBZNg7LDCnR9wPj7o/HB9lBWmje9fupXCf+2v6DfNY+g6nuvlTvl+8
 oqyXJu44jaEvm1bWz3f5ZoCN8PRuRNbh9P297HyojKIR3vlZ9/PI3Na3Ajd18epaPPMSEP4ad8x
 +5Io1P3ObwPqY9bBZcBnQxg3PIiDfexa3P5i5moDKGqBA9gZFeUv/fysv3E3nOqRow1xiwI5iwR
 4cUAbMFTz5TFF16ppsC+9WZMf7VtFo2hKAVfIjHsLgKpPGs6grfIcBQDhCDLZavy9XaNvmgCfVX
 b+5CYtBYdsQWR3jYZwD6yAnxv8CqfCM251RjeTofsk0+K1mH6D/0cBzeI6chktd41OR4JVb/Z27
 Nb18pqsQBlRZEkLC051d8yG0sp5XNvw0CRmb7zUlMtOJrn32GUhEETrZQbAsUECPvQ+ncUTyCD4
 fXTKhExgiMR87nzlYwA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDAwNiBTYWx0ZWRfX668KDaGMnLW2
 MgDL5/gK5lCLUKIozkREGCa3ibPtanUPb31Bp2fGGTdPc+KsOEvs1nF29YZefCvw1nbyjC0SClx
 9rK8QX1HF2jZYhFGS2Y5vh9JTp+0HIg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_07,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607180006

On Fri, 17 Jul 2026 20:50:33 +0200
Jakub Szczudlo <jakubszczudlo40@gmail.com> wrote:

> Add ADS1110 support that have faster datarate than ADS1100, it also uses
> internal voltage reference of 2.048V for measurement.
> 
> Signed-off-by: Jakub Szczudlo <jakubszczudlo40@gmail.com>
Hi Jakub,

Seems some stuff in here should be in patch 1.

Thanks

Jonathan


> diff --git a/drivers/iio/adc/ti-ads1100.c b/drivers/iio/adc/ti-ads1100.c
> index 363f790ca5d5..19533667e6cd 100644
> --- a/drivers/iio/adc/ti-ads1100.c
> +++ b/drivers/iio/adc/ti-ads1100.c

...


> @@ -139,14 +177,16 @@ static int ads1100_new_data_is_ready(struct ads1100_data *data)
>  		return ret;
>  	}
>  
> -	return FIELD_GET(ADS1100_CFG_ST_BSY, buffer[2]) ? 0 : 1;
> +	return FIELD_GET(ADS1100_CFG_ST_BSY, buffer[2]);

This change and the use below seem odd to be in this patch. I guess
they should be back in patch 1.

>  }
>  
>  static int ads1100_poll_data_ready(struct ads1100_data *data)
>  {
> -	int data_rate_Hz = ads1100_data_rate[FIELD_GET(ADS1100_DR_MASK, data->config)];
> +	int data_rate_index = FIELD_GET(ADS1100_DR_MASK, data->config);
> +	int data_rate_Hz = data->chip_info->available_data_rate_hz[data_rate_index];
>  	/* To be sure we wait 5 times more than data rate */
> -	unsigned long wait_time_us = DIV_ROUND_CLOSEST(USEC_PER_SEC, 2 * data_rate_Hz);
> +	unsigned long period_us = DIV_ROUND_CLOSEST(USEC_PER_SEC, data_rate_Hz);
> +	unsigned long wait_time_us = 5UL * period_us;
>  	int data_ready;
>  	u8 buffer[3];
>  	int ret;
> @@ -159,7 +199,7 @@ static int ads1100_poll_data_ready(struct ads1100_data *data)
>  	}
>  
>  	ret = readx_poll_timeout(ads1100_new_data_is_ready, data,
> -				 data_ready, data_ready != 0,
> +				 data_ready, data_ready == 0,
see above. Seems to be in wrong patch.
>  				 wait_time_us, ADS1100_MAX_DRDY_TIMEOUT_US);

Sashiko points out that the polling period is very long.  Was this meant to be period_us?

>  	if (data_ready < 0)
>  		return data_ready;

