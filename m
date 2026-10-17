Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A2D3C0A14
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 20:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792269604; cv=none; b=oIGtHzdvMIfmdaWz2BRT4ek80oxiLrgYBWlw/ozEP4JtapqtGfcGLP+dAWFgPbEu6Q9btmWQvKqmfyKzfI+JU86Feq47QC0qgoYI/mztnoLjKy66RAi5MYxJ0RdjPID9Uv83KAq8Sy6qpS9FMGms9lzX4wpsg5b06b+dMWNR4GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792269604; c=relaxed/simple;
	bh=q7CwHGyeeVgqKz8YQAKoM8SMMJHmzZPnQKS04vZWW5w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TdNPOByabsBJS6z3gC8Chohs523Xf21zlh7bPqRo7X1OOqPD343g3wpquf/qA+9oWrHm9dZ3de0zMK3AotCb4xIvUWKjHPK+xo0yfyGmaV8AFChotSe/9Xqlp4QS03aBd2hTjgID0PmOcaKkehjpaP8DV388zxMDETQ3Cmn/4BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ApWI0Koj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sbl/eQpd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ApWI0Koj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sbl/eQpd"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HJ1Eff1527305
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 20:40:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zr2FtfRs6QhbM03KAXMoqNBJH4R4akb06Udb+D1B0Dc=; b=ApWI0KojAvUBiQ11
	83UigDg+OfMWg1EymhELEx/O7puwtlrbsOdnQ+BP7TGzDbjeFV0/Ph/AQv57zxEo
	X8vpk8+5f9z833O9O9iHFnT91WJOoikgtIDcbSkqlS+T20Ui5LWtniv5r6u0vFVc
	9TA9hv7Z2VawH6BrDJMQii9xvp+GNc513CdvxXu/sX+uYuidQXZJs8mxG8dH4gQr
	FnkGCFN+Cft2IN0ogPqszHshz6HqQq+eWYKHK+CIBNrm+8qbnYoaO8k/024cCXKD
	sF0AY8FZP0oKulIyk9Sp3ZppE7lcLcbLhTLi2dkYKgwhw1CGeVaR1eEVhFltmYNQ
	et4KbQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc0bghu6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 20:40:02 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso1033510a12.1
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 13:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792269601; x=1792874401; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zr2FtfRs6QhbM03KAXMoqNBJH4R4akb06Udb+D1B0Dc=;
        b=Sbl/eQpddy2NfLJ7vwbLtrj5e+emYk/AMhK9XOcQxXBZVHClEUoE3amq8+GtIaVk7Y
         btTTi0Nd368MqLrjr+XZuxIRNDp54MVwdKyHJUTx6yDbZNT7cuHsT0PxQzWjzvqDn8TB
         PnsZyvwzB8tl5BiqFuUFdjQRoyacWrd37XGgnHlFMlAI9oUBHK6gYyDGA6rwl2E1dPWu
         B+XT/CxMk+OvCO6VhxA9wkOdDtcmzXMSIqhyQt6zGuXupvuXbWhmgdS9wOm7J3/BV9FM
         zSMVn0r/g3jc2WT/CYpF/aGYHN+OWU0eutadEQjNroy1E2yDmo2+P/9pugvzY5UNc1Jc
         2qmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792269601; x=1792874401;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zr2FtfRs6QhbM03KAXMoqNBJH4R4akb06Udb+D1B0Dc=;
        b=f67UE/i6NPmR2iN4woq44ewTdcvEBMqnoIM0WGHtetI/DxIlyXlSNZ12Qa6yB8cfIw
         fE4MczypInt2HIy1xKqhnGJxBkeknbYWUfMsXYwSHsn9O2o5ZI+oIsh8Ka+Rj1H8e773
         VAi/3UWdTAzQUiOWBqhz3EguXiZa/oBXEy3ftrS6zVpWu4K7j2HX9yrgJZAF5EKEyl6l
         if3FrkMTVDHTF2VhRiiVsLFZz6YIlbej+oPLtpixyvCQuD5mONXBVLLAzmATSTtAvPQM
         OjHHw+jsjxkasbpJNNTb0ep+xa5B/ZH6xdtWeV7vsFxNdUkqMyhHirtdxVnRAvj12NB8
         oJEg==
X-Forwarded-Encrypted: i=1; AKwUvByS4QE4MG2cB+cFYmroae9MyCbPWVvcvW/NxMFOR6OXQ41dW6zegkJlujp+t/ADswjd3pOf1Vt+H5GK@vger.kernel.org
X-Gm-Message-State: AFq9FYJxEJjLcu3YN1vcHGy1yodU2KL2+SqRAAjA/F517p8pB8WyDXoi
	xAUGS8CEuD0B2tjWrT/ia7hlh2H/tVFsaPue3dZYUHQqN92ldhQYGUYJ8uOieldtKIIxbH7j3xH
	/gA7ptIWlxpTyHkSK3e4DON1KCT5gvA8/5ggQUEdkjiQADlfjUSdLD3G2CIP8VwOH
X-Gm-Gg: AYBFou1au/Kqdk8jprBJPMovVdoHovXClSPwiHxK+qz9NElzjJasIFhXhUfEKENPTpP
	xw+RP0BU/fkVpv6b5mJmebbGYkEpj7gcCHrukIY/5J2YcwoVj4uVfBwC+WDsiTwdLcGkQE+JSXj
	K8/r73tzmosMPiKu2sVjnnG/oFweBI358OKpyDDd6Rd/MinT/r8XVG+/J5DzEyDKV8Gd/a7S0OG
	qs91ZNVl9uh+ivx2N/b2y4FUgy39rCaNkiekJ65HYtpepHhZYPGeBadXWzKDBupNDR3FK5/a7g5
	kdrf1n8V5aaPekx6AN5pUvUQPoPFjwt0dgH2n+kQYzTCRC38c6n7ItpKK8Zm69VoZ2d+hvzIem5
	d8AvaUPjHWfRneGuJqA==
X-Received: by 2002:a05:6a21:4903:b0:3e2:d8f:600f with SMTP id adf61e73a8af0-3e22613d7e1mr2777472637.72.1792269601026;
        Sat, 17 Oct 2026 13:40:01 -0700 (PDT)
X-Received: by 2002:a05:6a21:4903:b0:3e2:d8f:600f with SMTP id adf61e73a8af0-3e22613d7e1mr2777448637.72.1792269600528;
        Sat, 17 Oct 2026 13:40:00 -0700 (PDT)
Received: from jic23-hlaptop ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a05e2e9c4dsm250356b3a.19.2026.10.17.13.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 13:39:58 -0700 (PDT)
Date: Sat, 17 Oct 2026 21:39:51 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Rodrigo Alencar via B4 Relay
 <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: rodrigo.alencar@analog.com, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux@analog.com,
        devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Olivier Moysan
 <olivier.moysan@foss.st.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David
 Lechner <dlechner@baylibre.com>,
        Andy Shevchenko <andy@kernel.org>,
        Michael
 Hennerich <Michael.Hennerich@analog.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <ukleinek@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan
 <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 08/10] iio: frequency: ad9910: support iio backend
Message-ID: <20261017213951.2e62db95@jic23-hlaptop>
In-Reply-To: <20261015-ad9910-backend-support-v1-8-3c21648c8e26@analog.com>
References: <20261015-ad9910-backend-support-v1-0-3c21648c8e26@analog.com>
	<20261015-ad9910-backend-support-v1-8-3c21648c8e26@analog.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA4MiBTYWx0ZWRfXy3v3Tm5Z5LAR
 y0tfMRuEJup1LRiI4A0TIF4m7CbB1oZybeLKp0Kh6WICJiBLBjY8pDjiUFp6peCayoetLI4ZkTC
 MB6hghWHagO2IuOTiRhU3pbTQesF4EM=
X-Authority-Analysis: v=2.4 cv=FayiV5+6 c=1 sm=1 tr=0 ts=6ad3dd22 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8 a=bvUjbommzZRmoEgeiV8A:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA4MiBTYWx0ZWRfX/hdlvPZTWdM3
 MH8ugQpnZZ/JPCLv5R+AyF9s3m0PyFNcfJIIgqLxZjDPalltrk6koNCQxkDoDrO7hOWxdIYIdTN
 5XggUXkEH9nFYnMFpwhndWTJv8ZKb/hWeMOG4xd3Xt2+EyB6Sls7wOaYErwWNmKpHY4pKBmHeSu
 +I6WYUaZnKs1z+pP+OPXLoZVaTvvyW0VJJNJXCW0FOue/9dPAXfuG+Nls7oFAHCbG1RI7QmoWCG
 gZqAUuumXEkOL34Onr0Hd9cMExFBKyZDFKukDo1SHJnIsDoQNW6a37MEeXVnvoYkgV9rLajsfqZ
 9D0AhzN2D93z/N8gXMz4dqrO6ajyEW0I5o1zBf0wa74gHHBRZNxZX8oGsn8PA9A1Ge6wTPvwDTJ
 hddLikQOfKdNpCq1J5+46Pf/cbnGaKBXMyZFZ7Rj6GwpDnR/b2Ef4j6XDKT5LxAn6ER+ojtj/V/
 g6MRrPcUV31AC++6tIg==
X-Proofpoint-ORIG-GUID: S4u01pPzOFRCs-zIr2quZfWEEoXiaLEF
X-Proofpoint-GUID: S4u01pPzOFRCs-zIr2quZfWEEoXiaLEF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_06,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170082

On Thu, 15 Oct 2026 13:49:48 -0300
Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:

> From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> The AD9910 parallel data port allows modulation of the DDS core parameters
> at up to the PDCLK rate, which requires a high-speed data source. Add
> support for an optional IIO backend that provides such interface, with
> data streamed into the device through an output buffer.
> 
> The parallel port channels get scan indexes and scan types according to
> the data destination: 14-bit amplitude, 16-bit phase, 16-bit frequency,
> or the 8-bit amplitude and phase pair for polar modulation. As only one
> destination can be active at a time, this is enforced by the available
> scan masks. On buffer enable, the destination is configured in the
> backend and the parallel data port is enabled. The sampling_frequency
> attribute of the parallel port channels controls the backend data rate.
> 
> The backend is also notified about profile changes, as it may drive the
> PROFILE[2:0] pins, and the debugfs source attributes now consider the
> parallel data port when reporting which channel controls each DDS core
> parameter.
> 
> Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>


> diff --git a/drivers/iio/frequency/ad9910.c b/drivers/iio/frequency/ad9910.c
> index 3d517879dee3..39d65dafd5a1 100644
> --- a/drivers/iio/frequency/ad9910.c
> +++ b/drivers/iio/frequency/ad9910.c



> @@ -1075,7 +1122,15 @@ static const struct iio_chan_spec ad9910_channels[] = {
>  		.output = 1,
>  		.channel = AD9910_CHANNEL_PARALLEL_POLAR,
>  		.address = AD9910_CHAN_IDX_PARALLEL_POLAR_AMP,
> -		.info_mask_separate = BIT(IIO_CHAN_INFO_OFFSET) |
> +		.scan_index = AD9910_SCAN_IDX_POLAR_AMP,
> +		.scan_type = {
> +			.sign = 'u',
> +			.realbits = 8,
> +			.storagebits = 8,
> +			.shift = 0,

Really small thing but we tend to drop setting shift when it takes
the default of 0.  Particularly makes sense here given no room to
shift with 8 bits in 8 bits.

> +		},
> +		.info_mask_separate = BIT(IIO_CHAN_INFO_SAMP_FREQ) |
> +				      BIT(IIO_CHAN_INFO_OFFSET) |
>  				      BIT(IIO_CHAN_INFO_SCALE),
>  		.parent = &ad9910_channels[AD9910_CHAN_IDX_PHY],
>  	},
> @@ -1085,7 +1140,15 @@ static const struct iio_chan_spec ad9910_channels[] = {
>  		.output = 1,
>  		.channel = AD9910_CHANNEL_PARALLEL_POLAR,
>  		.address = AD9910_CHAN_IDX_PARALLEL_POLAR_PHASE,
> -		.info_mask_separate = BIT(IIO_CHAN_INFO_OFFSET) |
> +		.scan_index = AD9910_SCAN_IDX_POLAR_PHASE,
> +		.scan_type = {
> +			.sign = 'u',
> +			.realbits = 8,
> +			.storagebits = 8,
> +			.shift = 0,
> +		},
> +		.info_mask_separate = BIT(IIO_CHAN_INFO_SAMP_FREQ) |
> +				      BIT(IIO_CHAN_INFO_OFFSET) |
>  				      BIT(IIO_CHAN_INFO_SCALE),
>  		.parent = &ad9910_channels[AD9910_CHAN_IDX_PHY],
>  	},


