Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78913126BF7
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 01:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784511499; cv=none; b=VEVjDZycd4CgIuXwkSyHWIdDCoo51Gv/YRBA1ri0pItuaUZKLOtYKLgJ8bBwvIhb1A7rYg6n9x7iLU5t1+ZvQpcVoZTbkPLZm05g9tVdkQqBHcOHkTS/l2lobDBg+StfeqI+XNAFfCqkIc0WzNrn9tArGaAMq3f6GXPYFNt7cHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784511499; c=relaxed/simple;
	bh=f8pkuRdBPEbhQYET7455SSZgWDzYxUPLo4Z0X1985X0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dg+x0hGqoEDV658EgjW+MQ1LP+cfecflvPgANBi+xRLDGmuoXf8cF2DjoQPCbqunK+QEBeX7NDFKN2Wd3uRMvZO667Upjw0vM9HbichL7UZwG/DZv+vG/Zr82QAmvUimpbj3y471d7xN18AKo7n9/mbMMNS42mpvU0+plCydul8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O5dRJ7nZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E5eP244e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O5dRJ7nZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E5eP244e"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNvY4r414081
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 01:38:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6zwcLWitFcM7eTedEs2XGg0+vd4LGsIcns34L+sCzH0=; b=O5dRJ7nZqPUWzUCJ
	Jh/pRZVpsswK7qz01kdsiL3O6maynFfYHEdXGOqVNWfl/XR7TU2we6GSoUAdBEBY
	n44XMxZZdRr1r5f/u0qS5t0lGkTrviU7brOaAouJ8OW02EvcsZMhSyEHUkepbJpi
	JSQK3GpYzpAAjAjmknFzGTfzj+escLXAp5rZsPVf88YBkQTqqAHD979EPV0064cv
	Z55jsKzUZIBAaD2rtrFe6hn/Y0YzT4B7IEJBx5PIox4ppL4YFjI3IrTIJNn82RPK
	wlVF9yJ8Dv85Y55ls0C7yTjiSW88IW9XllwKpAt+rqySveHUGIarRPeU4d7lYBf9
	CnyYhg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2nhkvd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 01:38:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cf6acd760cso5705175ad.3
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 18:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784511496; x=1785116296; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6zwcLWitFcM7eTedEs2XGg0+vd4LGsIcns34L+sCzH0=;
        b=E5eP244et2o0ALBtnNPTjAc+dIgldlcOg416D4VGu7XvI1VOV/Im5T6DXywGePX5B1
         pPzeUKL+dQtGo5MOZhzWR2DOsco/4U4xM65iSzKUxhlcGnZiFwjj1kVKRiCBcgE3sT06
         XfDWibspuDHauja/KePzkqojwo/htohDJNEKef1azNTQiMnkiH2LM/TtKz2KFqPhD9K5
         AmYElfiXgUfBYzL/fOykAXSMQoZiQ9/12itQOeFtJ8+40rB51wEa+PCrieeXaTxtETi4
         FQIH+DTOaNtYdDXN9XkKqYSsWG8n2aTsCEdpv2lNym8WWeQ1o247oXQhfeJ/fScEayiD
         PacA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784511496; x=1785116296;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6zwcLWitFcM7eTedEs2XGg0+vd4LGsIcns34L+sCzH0=;
        b=oFUYLzP283xNPWWGdH5hZOhCDmdNMR/0Xxj2dC+9X3fEDRUFGej4+S4EwuG9RA2gBw
         nBvKNunGXaEmnNQUoMsyr20jY4H6nkn4kKOxQyFX584opo/a4zDLy1kF9Q/bS5dbv0fJ
         L85TcDxnUbjSFFBYPVBs/AIfNzRhcQ2sm9UO4FzrmE6ivmhGQWQd2+VmRwe3ZzrX9Coe
         BKTjT9In9sB/3gXgnuea/raCcnFtZVix95rL8Pf6A1bziTr//LSqXMUp/fxP63GYGbD3
         wLx3fozfx4TEwCHlgL36S7qH1QLsds9H5JMyaizWxTahuPHz6zPC4ZKjB0oL1H5P6Koy
         Vm4w==
X-Forwarded-Encrypted: i=1; AHgh+RpAkJpHMQAH9tvQYhOl6uMCoMEYS5Bj0zGQeFJgNgplJYcm/zDbkjWSMWiVvMltoNW/kQCf9KX2ZHHV@vger.kernel.org
X-Gm-Message-State: AOJu0YwIns5xLAY5VbxGLDGwxpkqU3kv/LICH4qqmAFOu/GDT/pRnRMI
	kZKpjzp2vnjJb+WPOPja9yPYnWC3jQX28gPfJsebeXXO+lHFAl21vO5c8hwX98prdx1kXkX21ja
	VLVxpvD65z5EjcIzGibbrOYWmU+azneqEFjjowvMAgAYCpR+ghU9qVN1QHXWwXEH/
X-Gm-Gg: AfdE7clgrOs5bnrzUwJYFXwMYRfc/SzoJL2Y+EpG9cv3S2jx++VZ+6mmImC0d3eykBQ
	thiPTFqnf+4rGfVvZQVwJZDhEnINXiVLkA4+VeGeyqQdOkr2g6mAJ7mDnkmsqBdgL/b9gGswEFx
	q0rImO5m7QW6ADi1nSJd53HoezVn9IcU9zAhs2erUo2CxkUvOEwuzbqVJbwY2DzhNIEV0imriMj
	FguYyUkOUO7uV40hkhkhka599sluM0FYlu9N45D3rkLG0eZvDgpXIRfadInRNei4hLEvf53imw2
	20I16E9jlBXkgphaxnp/FwS49cLZJ5A65NfFK+lv/0p+r7wvxHfAQUlrQFtGzxXKXfb0apr4MtB
	rz7aESSk4rKYuRStg
X-Received: by 2002:a17:902:e548:b0:2c9:a5e9:c26e with SMTP id d9443c01a7336-2cf348546c2mr134300025ad.13.1784511495728;
        Sun, 19 Jul 2026 18:38:15 -0700 (PDT)
X-Received: by 2002:a17:902:e548:b0:2c9:a5e9:c26e with SMTP id d9443c01a7336-2cf348546c2mr134299635ad.13.1784511495154;
        Sun, 19 Jul 2026 18:38:15 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf346db113sm46824655ad.39.2026.07.19.18.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 18:38:14 -0700 (PDT)
Date: Mon, 20 Jul 2026 02:38:11 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
Cc: David Lechner <dlechner@baylibre.com>,
        Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Siratul Islam <siratul.islam@linux.dev>,
        Luca Weiss
 <luca.weiss@fairphone.com>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] iio: magnetometer: add support for QST QMC6308
Message-ID: <20260720023811.09741911@jic23-huawei>
In-Reply-To: <20260714202842.340293-3-jorijnvdgraaf@catcrafts.net>
References: <20260714202842.340293-1-jorijnvdgraaf@catcrafts.net>
	<20260714202842.340293-3-jorijnvdgraaf@catcrafts.net>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Le0MLDfi c=1 sm=1 tr=0 ts=6a5d7c08 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=c92rfblmAAAA:8 a=GYSh3LzNAAAA:8 a=g-q4vcgDu0r2VoyuJZgA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=GvGzcOZaWPEFPQC_NcjD:22 a=lWcdFasyL5yHfcDTNXXo:22
X-Proofpoint-GUID: pu8_C8s4jwKJhRaKvbvhjLKkQlq-LoXk
X-Proofpoint-ORIG-GUID: pu8_C8s4jwKJhRaKvbvhjLKkQlq-LoXk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDAxNCBTYWx0ZWRfX0sw/ZsW4Uc6s
 ls/DDs/mpQ5RBC8reKEB4VcmuznkDpZdAzz7oKepoYBr3nBZnkV6iRNSWKsLLIU4NlL3q33L5TH
 1w9UOaMDNuBAAVLTZOiDGS1MWTDAhDV2U43Xg07qjBcXbPJEd2H141mSrrugvnnJ5nneheN8JoP
 Wl3XGHLTd6NyheqSSx9O3xpMhVzG4AyaHNbap0m1IsNe04CPLQ18MVKn/Mjm9ZeB6ObDNT3Nb9f
 gTg8VRyMn/xpoGXxMp/Ob+LClk3ZZW0hZS5nE8FEVVkFHHpwxGuWd4hjADHPYnooG/XPY2HLj81
 IOXbYegPCNVZnWJGQGHW+nIaD5L0dQs32bDiVD1fyPxJq1l/tBOe55ZLUt5/SwPlWdvDKFQ2Cuw
 KhP60GCw3YW7jCcmTZbwrJpTqQciINKvxZJZwr1L8Kjx2+9NeB+n/tjqNJF6exT69C6mYCiN3lB
 uoH7PRTYjOsw/6O3Dzw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDAxNCBTYWx0ZWRfXxVFGSWKXK37c
 //JjnnKx0JD1cUc3nt/LBatJUvW549K2AzMj8iyKAHjy/7HtyQxM8y6CRiJI2ne9amgpiwFoBJP
 So6z1LJel7PWWD/n+/5xtCDcnhPlmVM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200014

On Tue, 14 Jul 2026 22:28:42 +0200
Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net> wrote:

> The QST QMC6308 is a 3-axis AMR magnetometer on I2C, a single-supply
> 4-pin WLCSP part with no interrupt/DRDY pin, found e.g. in the
> Fairphone 6. Its register map differs from the QMC5883L (chip ID at
> 0x00 instead of 0x0D, data at 0x01..0x06, and the range field living
> in control register 2), so add a separate driver rather than extending
> the QMC5883L driver.

Trim this description down for brevity. Drop the package, and I don't
think we need to mention anything it doesn't have.

> 
> Support raw X/Y/Z reads, output data rates 10/50/100/200 Hz, field
> ranges +-30/12/8/2 Gauss, filter oversampling ratios (OSR1) 8/4/2/1,
> the mount matrix, and runtime PM. The second-stage decimation filter
> (OSR2) is left at its power-on default. The package has no DRDY pin,
> so there is no trigger support.

As above I'd not mention what we aren't doing. Also not sure there
is particular value in listing the values each parameter can take.

> 
> Run measurements in the chip's periodic "normal" mode paced by the
> DRDY flag rather than in its one-shot "single" mode: the datasheet
> specifies no conversion time that could bound a one-shot wait, while
> normal mode is paced by the specified output data rates, which also
> keeps the sampling_frequency ABI meaningful.

This is a little unusual.  Unless single mode is really bad we'd
normally just use that for sysfs reads.  Still I don't really mind if
continuous makes more sense here.


> 
> Runtime PM puts the chip into its suspend mode after 500 ms without a
> reading, dropping supply current from tens-to-hundreds of microamps to
> 2-3 uA (datasheet Table 2). The suspended chip retains its registers
> and keeps responding on I2C, so resuming only rewrites the mode field
> and discards one stale sample, and configuration changes can be
> applied even while suspended. VDD is left enabled across runtime
> suspend: the on-chip suspend draw is already negligible, and register
> retention is what keeps the resume path trivial.

This is a bit verbose but I suppose some useful info for reviewers in
there.  Maybe take another look at cutting it down.

I'm going to assume fable was busy here. Try asking it to be brief
in the patch intro, or just edit it after!

> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
https://sashiko.dev/#/patchset/20260714202842.340293-1-jorijnvdgraaf%40catcrafts.net

Has a few comments. I may or may not remember to call them out in
this review as well!

Nice driver in general

Just a few minor things from me.

Jonathan

> diff --git a/drivers/iio/magnetometer/qmc6308.c b/drivers/iio/magnetometer/qmc6308.c
> new file mode 100644
> index 000000000000..ceb4b98402bb
> --- /dev/null
> +++ b/drivers/iio/magnetometer/qmc6308.c

> +static int qmc6308_take_measurement(struct iio_dev *indio_dev, int index,
> +				    int *val)
> +{
> +	struct qmc6308_data *data = iio_priv(indio_dev);
> +	struct regmap *map = data->regmap;
> +	struct device *dev = regmap_get_device(map);
> +	unsigned int status;
> +	__le16 buf[3];
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret) {
> +		/* EACCES means a read raced runtime PM disable on suspend */
> +		if (ret != -EACCES)
> +			dev_err(dev, "Failed to power on (%d)\n", ret);

Whilst not a permanent issue, why do we care about hiding the error message? I'd
just print it whatever.

> +		return ret;
> +	}
> +
> +	scoped_guard(mutex, &data->mutex) {
> +		/* 50ms headroom over the slowest ODR (10Hz) */
> +		ret = regmap_read_poll_timeout(map, QMC6308_REG_STATUS,
> +					       status,
> +					       (status & QMC6308_STATUS_DRDY),
> +					       2 * USEC_PER_MSEC,
> +					       150 * USEC_PER_MSEC);
> +		if (ret)
> +			goto out_rpm_put;
whilst this is technically not a bug, cleanup.h has some guidance that
was written with maintainability in mind (and a few pointed comments from
Linus Torvalds - no one likes making him grumpy ;)

Upshot (and sashiko has this right) is don't mix goto and anything from
that header. 

Here, take a look at:
pm_runtime.h and in particular
PM_RUNTIME_ACQUIRE_AUTOSUSPEND()
Don't worry about keeping it powered up for a tiny bit long than strictly
necessary.

Added bonus is that then you can use guard() rather than scoped guard
for the mutex and return directly on errors.

> +
> +		ret = regmap_bulk_read(map, QMC6308_REG_X_LSB, buf,
> +				       sizeof(buf));
> +		if (ret)
> +			goto out_rpm_put;
> +
> +		if (status & QMC6308_STATUS_OVFL)
> +			ret = -ERANGE;
> +	}
> +
> +out_rpm_put:
> +	pm_runtime_put_autosuspend(dev);
> +	if (ret)
> +		return ret;
> +
> +	*val = (s16)le16_to_cpu(buf[index]);
> +
> +	return 0;
> +}


> +
> +static int qmc6308_init(struct qmc6308_data *data)
> +{
> +	struct regmap *map = data->regmap;
> +	unsigned int reg;
> +	int ret;
> +
> +	ret = regmap_read(map, QMC6308_REG_ID, &reg);
> +	if (ret)
> +		return ret;
> +
> +	/* Allow unknown IDs so that fallback compatibles work */
> +	if (reg != QMC6308_CHIP_ID)
> +		dev_warn(regmap_get_device(map),
> +			 "Unknown chip id: 0x%02x, continuing\n", reg);
> +
> +	/* The SOFT_RST bit is not auto-cleared and must be written back 0 */
> +	ret = regmap_write(map, QMC6308_REG_CTRL2, QMC6308_SOFT_RST);
> +	if (ret)
> +		return ret;
> +
> +	fsleep(QMC6308_POR_US);
> +
> +	data->range = QMC6308_RNG_30G;
> +
> +	ret = regmap_write(map, QMC6308_REG_CTRL2,
> +			   FIELD_PREP(QMC6308_SET_RESET_MASK,
> +				      QMC6308_SET_RESET_ON) |
> +			   FIELD_PREP(QMC6308_RNG_MASK, data->range));
> +	if (ret)
> +		return ret;
> +
> +	data->odr = QMC6308_ODR_50HZ;
> +	data->osr = QMC6308_OSR1_8;
> +
> +	return regmap_write(map, QMC6308_REG_CTRL1,
> +			    FIELD_PREP(QMC6308_MODE_MASK,
> +				       QMC6308_MODE_NORMAL) |
> +			    FIELD_PREP(QMC6308_ODR_MASK, data->odr) |
> +			    FIELD_PREP(QMC6308_OSR1_MASK, data->osr));

I think you mentioned in your discussion with Siratul that you'll explicitly
set all the fields.  Sashiko noted that you say you are leaving OSR2 alone
(in the patch description) but then set it to 0.

> +}



> +static int qmc6308_probe(struct i2c_client *client)
> +{

...

> +	ret = qmc6308_init(data);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "qmc6308 init failed\n");
> +
> +	pm_runtime_set_active(dev);
> +
> +	ret = devm_add_action_or_reset(dev, qmc6308_power_down_action, data);
> +	if (ret)
> +		return ret;
> +
> +	pm_runtime_get_noresume(dev);

We've had a few cases of this recently and there are plenty in tree.
However, it's unnecessary - follow through what happens in dd.c
after probe() is called.  Ultimately it checks the counter and if 0
I believe it will power it down without needing this increment / decrement.

Dropping this tends to get sashiko confused, but will resolve the compaint
it has right now about raised reference count on exit.

> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_set_autosuspend_delay(dev, QMC6308_AUTOSUSPEND_DELAY_MS);
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return ret;
> +
> +	pm_runtime_put_autosuspend(dev);

As above, this should be unnecessary.

> +
> +	return devm_iio_device_register(dev, indio_dev);
> +}
> +
> +static int qmc6308_runtime_suspend(struct device *dev)
> +{
> +	struct iio_dev *indio_dev = dev_get_drvdata(dev);
> +	struct qmc6308_data *data = iio_priv(indio_dev);
> +
> +	return qmc6308_set_mode(data, QMC6308_MODE_SUSPEND);
> +}
> +
> +static int qmc6308_runtime_resume(struct device *dev)
> +{
> +	struct iio_dev *indio_dev = dev_get_drvdata(dev);
> +	struct qmc6308_data *data = iio_priv(indio_dev);
> +	unsigned int status;
> +	int ret;
> +
> +	ret = qmc6308_set_mode(data, QMC6308_MODE_NORMAL);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * DRDY may still be set for a sample converted before the last
> +	 * suspend; clear it so the next read waits for fresh data.
> +	 */
> +	return regmap_read(data->regmap, QMC6308_REG_STATUS, &status);

This feels like a solution in the wrong place.  Why not move it
to the read_raw() path after the runtime resume call?
Sure it will add a delay on repeated reads, but they are coming from
sysfs so we don't care that much.

It is fine to do it here because nothing else resumes but none
the less it does feel rather unintuitive.  If you really want it
here maybe add a note in the read_raw() code path that says it will
have been cleared if resume occurred.

Also if this fails, you should put device back into suspend mode
so as to end up in a consistent state.

> +}



> +static struct i2c_driver qmc6308_driver = {
> +	.driver = {
> +		.name = "qmc6308",
> +		.of_match_table = qmc6308_match,
> +		.pm = pm_ptr(&qmc6308_pm_ops),
> +	},
> +	.id_table = qmc6308_id,
> +	.probe = qmc6308_probe,
> +};
> +module_i2c_driver(qmc6308_driver);
> +
> +MODULE_DESCRIPTION("QST QMC6308 3-Axis Magnetic Sensor driver");
> +MODULE_AUTHOR("Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>");
> +MODULE_LICENSE("Dual BSD/GPL");

Why BSD?  Coming from somewhere else or you have particular reason to
prefer that.  It is relatively unusual for kernel drivers.

Jonathan
