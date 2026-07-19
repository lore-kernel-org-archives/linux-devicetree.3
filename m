Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC42A2DECCB
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 23:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784502495; cv=none; b=uMeW7AQdFG18CE3bZvQ1NNNWAuGbnSE9fj6IwBDWfgbZEH/9Wzknt3wMNlAykJ8eFG0W6Rv6/CY9711bMAAhgQmFD0ORJHKBt5ZzC6VQ4LxzA5ZrfXl5KpzdpOJTy2VK1cAyXYpFCMXAOBw1nDgZ2ru6+vKRUUdA12ViXwV2swo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784502495; c=relaxed/simple;
	bh=TBzIujEI5cVMShYnP0cIJc6bOwUwC0Ol7KBsn9W1f24=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K/qdwoZLQSzJDdwe0Tvlr0HR6OqKJfA8+xeG/PgKVa/a/QPrTy6MZgLD/Vt/AHd0NNH65TPm5Pv/v7v0uOw0t7ihpC2qPcgdvT4EtXeexvAmYET/8QPA8cyhGlBDf8gVepmR10K71GSBFcGNaTtY+YTv2r4jMWmWgAvrFvxSzO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=peIEerk4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AJkY0tXF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="peIEerk4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AJkY0tXF"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JKQnsc379307
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 23:08:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7lEhViJTqWmDXZiB6V/knCwrtAyVIbdBJvhBeySb/5g=; b=peIEerk4WEn8qK3F
	XBqoZdd1yBOPB8SvJGhZ5P7ktzpkXO0WAPkxg07SVi6aOIQW1w9Ek/w7cIvUtSvZ
	s73BdK2LMVgAm8hcodE82mrDGLnxhyAX46BX097dizwQ9Gfk1rJwlT+BGNmp1jNE
	j6SRNk1wtGO7ozM/qF/J+6y2FhRFEPI8J6rCrK2V0fY/WAa/Cjk+XhfOm9VwZn1r
	ntlPaHGd+ARl22vu1ds9JCEUX6Ud4vJytJ0DWBTDO7cSJesB+zGaWwzFjfcdyIS8
	WYBQR+9jnwCLS5MKz9yRjNWKy24cBI/T3LswT4Hg7VKoJQolCGw/QQHiVnIMTqoq
	aXKVXw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fgd04tm2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 23:08:12 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8487ed7f7beso6325100b3a.0
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 16:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784502491; x=1785107291; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7lEhViJTqWmDXZiB6V/knCwrtAyVIbdBJvhBeySb/5g=;
        b=AJkY0tXF1faZCmBgf511Sp//rN+XlAyNbw+elIukOl/EqxWRBYFWT94ZSx9D/LJzDe
         0keugqVIWDhpX3JUbQjtmHfPANTUycgFmRISAeGVRb3nen4ZM3IIE1xmO16bFIPA3eWy
         m//iZip45oSueAuJshwRAEPtUOq+YIH+1BJG1WCtEGJJbqL7Qc0bxFeZh2y1EGEBSZWj
         q9ZuzRmjZglkuKKnFA/IolkqYJjIn4L9gOU/str9ddLNW1f0QdrZIjDvB4diAhCS3+hj
         660AlmPQD0jlIs+7hESl6Cowe+GM4ECi58nD7aQxvEp7nUlXwCBU0ttd4xMChZ0wGSr7
         CMsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784502491; x=1785107291;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7lEhViJTqWmDXZiB6V/knCwrtAyVIbdBJvhBeySb/5g=;
        b=fZ9SIty7tM3CX70xTSdadxzTxmDn6YEnhPzT5VdCXvjkQdSeEx4fSMbdkcPYzvCmdC
         6NNgxcnviYRlQLVRrRJjXhEjIfmqvcS9+eSt8SpX2dG0GyhWeLqrWqWr7Jv6vZvgSd10
         Gkz68lSrzqR5DPB5nYD3AD0tOtGmRAPcdp9PAKFs/4fzH27wetTEfhSiSdF1dg6LA5U7
         uX/AshnFim+cfsIqvrk6zODpVv+vFEed0JkPD3j6NovJRU/FgncKywjudYahHYkqjOXo
         hQY6M5JjmmKhwh7ItKmQAcBL/L9Rb+SG82/rqf0AKgMbSl7jwyNFUOoWvOWZ1WWG+07g
         H4Dg==
X-Forwarded-Encrypted: i=1; AHgh+RqPCjqA2/tTHYB6qa3O8EFMHjM8LOJZGU4ldDlfqVPskes0Fm5+t2XkcM2B0w7OZ1Y66XxJun3IwePu@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4E5MlccMOJAfuYx8sdr2HlrfpsewkiubwTvWmKvuNSENNxMGh
	swy9tWUpZ6OdFmCia/KtlbeiBjZOZaCc6m98EuZEo8K5qMER+QdjCs40IKqvJ1D6qlx9WY0Wdqx
	dK+SPyMszFpB+56y63lvTHXoL/NyM6A0rzmzoZpf6Ci3WmrhdF7q9/Y7xP2oW4fxft4GECXlc
X-Gm-Gg: AfdE7cn+Seyvm2hisO0RftXoH+BtxHHJKIZybnPS4joeLIOD1zyQhj5MqaYW57niq+5
	9ORcrO0BH72zsk3rfJtnTAKD6dUfcyws1INBbCyx7SUMBphUfNnGCDZlSpWjz0kfHn/BchgxUPT
	AhsuKBWoInNFRUENikutFAiOaU/h9hiDq3fXsKCCoUvSQ/siusmagbEWDySbarbcdPJ8tF38zzf
	QJkBoZrX22RUjjPCYUkWK8+s9vHxusns48nPdASKF/wIQF0tVnEb1MzTKTGZAPvSgxv4V3U3ucl
	8u8fIDQSD2rHu+N+LuejQ26ed/8Tx6G0kNu/+BfBu6MLwQZKrdY492cdobZmT0JtnX8cvsleDXx
	cbeyQJTNlJsAZTBZK
X-Received: by 2002:a05:6a00:1826:b0:848:7997:cb23 with SMTP id d2e1a72fcca58-84c2945cda5mr11120750b3a.43.1784502491391;
        Sun, 19 Jul 2026 16:08:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:1826:b0:848:7997:cb23 with SMTP id d2e1a72fcca58-84c2945cda5mr11120723b3a.43.1784502490890;
        Sun, 19 Jul 2026 16:08:10 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb519aeb6c2sm3616207a12.21.2026.07.19.16.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 16:08:10 -0700 (PDT)
Date: Mon, 20 Jul 2026 00:08:05 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: "David Lechner (TI)" <dlechner@baylibre.com>
Cc: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
        Andy Shevchenko
 <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Chris Hall
 <c-hall@ti.com>,
        Patrick Edwards <pedwards@ti.com>, Kurt Borja
 <kuurtb@gmail.com>,
        Nguyen Minh Tien <zizuzacker@gmail.com>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 6/8] iio: adc: add ti-ads112c14 driver
Message-ID: <20260720000805.41022604@jic23-huawei>
In-Reply-To: <20260714-iio-adc-ti-ads122c14-v4-6-25f8e3084485@baylibre.com>
References: <20260714-iio-adc-ti-ads122c14-v4-0-25f8e3084485@baylibre.com>
	<20260714-iio-adc-ti-ads122c14-v4-6-25f8e3084485@baylibre.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=POs/P/qC c=1 sm=1 tr=0 ts=6a5d58dc cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=IpJZQVW2AAAA:8 a=FPNj1WgbcA2tj7y3evEA:9 a=CjuIK1q_8ugA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE5MDI1OSBTYWx0ZWRfX/FcLbofsVUrx
 y88ZgI4A3inqVK6RF9xpQJk1SglA+atqknFj3cJ8/3JtVt5I9CT0ZDrL1FAWYRQKQ63orVoh5CU
 CnyfWkSuCydWDkfSxWL+4lkq1/9n4/sKB1Aj8gxC5C8VXAWOo7djmCcxdt6kZwlXC3adXUL1olj
 H8KYIHaRjRSZKPtExCOqKMpz4U6R5TkuaGoCx1pa+Q/Ey64uMMSx5MrdtK3Qas/55hhidjJqNGY
 RQETef4Iiqi3Gj48bfUy1cWP2G6uwwu3TqS5uUVQnny1sIN5p54H2JOx7H0TF6LG6fRHNvUjYvV
 /KHXKbVUcT6UhIOW9hhgAZ11Upe+OgJweuRYi1NS4hqr7tNDOt/uSH6QGiDHS2sSQJAVKDlbPGv
 emkFKtZ+5pEbwyCRmIrlnTE77mM5+WXT1Ch3BoRGve9mvclXMrAQ5EjXex5ub5OHcaZvEsbf3qW
 ExTnj461pwpg/2Vnmiw==
X-Proofpoint-ORIG-GUID: h-DtFufgNKr0qwBIesN9-BiX5wEmZLuO
X-Proofpoint-GUID: h-DtFufgNKr0qwBIesN9-BiX5wEmZLuO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE5MDI1OSBTYWx0ZWRfXwJI6kpm4R36p
 p79ctmV3r3jRISQUKjVtDAwTX5ufEOOvmqeoZtlhAGhJ6V8lTJcFrych/rFlQQlJwK2IQRaSY2I
 24cT2m50kPNNIBjZGzay44vxZHy6GOA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_07,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607190259

On Tue, 14 Jul 2026 18:21:28 -0500
"David Lechner (TI)" <dlechner@baylibre.com> wrote:

> Add a new driver for the TI ADS112C14/ADS122C14 ADC chips.
> 
> This first step is adding a very basic driver that only supports power
> on/reset and reading the system monitor channels.
> 
> ADS112C14_SYS_MON_CHANNEL_SHORT is the last channel rather than being in
> logical order by address to keep the voltage channels together and in
> case we find we need to add variants of this channel with different
> voltage reference later.
> 
> Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
I think sashiko is sending us on a wild goose chase on this one.

"When ads112c14_single_conversion() calls i2c_smbus_read_i2c_block_data(), it
returns the number of bytes read upon success. A short read (e.g. 1 or 2 bytes)
would return a positive value, bypassing the (ret < 0) error check in
ads112c14_read_raw()."

An i2c_smbus_read_i2c_block_data() response doesn't contain a length
unlike i2c_smbus_read_block_data() which does. 

Maybe there is a controller driver out there that messes with block[0]
rather than returning an error on failure to do the read part of
the sequence. I checked a few and didn't find one.

It might make sense to make it clear this doesn't happen by
adding checks in the i2c core.  One to consider after the other
ones on my list!

However, one small related comment inline about keeping postive
return values meaning success as local as possible in the code!

Jonathan




> diff --git a/drivers/iio/adc/ti-ads112c14.c b/drivers/iio/adc/ti-ads112c14.c
> new file mode 100644
> index 000000000000..a69c595ab518
> --- /dev/null
> +++ b/drivers/iio/adc/ti-ads112c14.c

...

> +
> +static int ads112c14_single_conversion(struct ads112c14_data *data,
> +				       const struct iio_chan_spec *chan,
> +				       u8 *buf)
> +{
> +	struct i2c_client *client = to_i2c_client(regmap_get_device(data->regmap));
> +	u32 reg_val;
> +	int ret;
> +
> +	if (chan->channel < ADS112C14_SYS_MON_CHANNEL_BASE) {
> +		/* Not implemented yet. */
> +		return -EINVAL;
> +	} else {
> +		ret = ads112c14_prepare_sys_mon_channel(data, chan);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = regmap_write(data->regmap, ADS112C14_REG_CONVERSION_CTRL,
> +			   ADS112C14_CONVERSION_CTRL_START);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_read_poll_timeout(data->regmap,
> +				       ADS112C14_REG_STATUS_MSB, reg_val,
> +				       FIELD_GET(ADS112C14_STATUS_MSB_DRDY, reg_val),
> +				       1 * USEC_PER_MSEC, 100 * USEC_PER_MSEC);
> +	if (ret)
> +		return ret;
> +
> +	return i2c_smbus_read_i2c_block_data(client, ADS112C14_CMD_RDATA,
> +					     BITS_TO_BYTES(data->chip_info->resolution_bits),
> +					     buf);
With all that stuff above about this not returning short, I'd still be tempted to do
an if (ret < 0) return ret; return 0; sequence in here so we don't propogate
confusing positive returns beyond where we can see their source.

Having done that make the outer check if (ret) 


> +}
