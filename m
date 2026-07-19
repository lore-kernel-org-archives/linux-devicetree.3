Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BAF27E1C5
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 02:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784427602; cv=none; b=rn/SnvxBBxi0IPQc/V38JjbTDlwVWJ/qCx2h2XUv+Wc1Y3iedzgL31p/rloYCDClknzV3JhNNPlVKPlwAyaKT5C6YS8YXC/f9IjD6Imy9HCyxR9pQDZGV9GOvOqH9Fi8ArGelZJjqhpKUblazrh1EXPGwlYgEPvvVStvcDWMDoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784427602; c=relaxed/simple;
	bh=YuQoysW1azYmuf6rDpcHaXat5Wr4R5U7hE1Fn78iZ4E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oCv6GgRTBPNcERcheAaI2xp4M+Pw51BK7a3OaAUOz2n8VZOjw9sN77TUuaqLwxWv5VO8+QXoE8ol9tzDwfP335LMvqt2nnS+ABlfkD0oYRfkGhn/HcL4dYKPocFaOcYHt87IDeu2BFSGbFT6/nq2y37OhQbdrCCvZZp5QkmuEgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FaeywPmW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JwjSD0R4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FaeywPmW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JwjSD0R4"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66J21xKm2176718
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 02:19:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OC7Lt1admKMC5oZ9cYYZw24Clyu0obewa2E3eEMrFpY=; b=FaeywPmW4pRwHMNU
	s5PKbAuKrb7q0CE1x/O/wMzweRloDyuuDi3iXieckIjOo3c1KzmjWus80zZK+9w0
	HLo0eZ/2F3HXYEDpkGIci4LJSsNrGIWRhzRzAVDOA9D7JDqxfDhIuPMEQzxVew+Z
	k4mF/nsRoHSv4+yOn8HhPGUf8xplXRSpiXa17FAaBMw5/x8LcQob7ap98kLAnrtX
	adWu/GklN2RRtDtfUZ3mtvMQx+yznjM3Woikwf4s78Sot/S0o+l3DmfT/ROtMQJJ
	KIVwug1+1hEDrP0QX6D2wRLEpJXa5FSEiwt1aTKaJZx6XlCgXY1tFlygYrVIlnFw
	HOnuVQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2chhxys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 02:19:59 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8486c3411c8so12378335b3a.2
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 19:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784427598; x=1785032398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OC7Lt1admKMC5oZ9cYYZw24Clyu0obewa2E3eEMrFpY=;
        b=JwjSD0R45euXQc3heLpJAax2zwDUFqKHsi+VivaiF3JJmnnAPIzKYpHGfrFUHotyN4
         o+tbQKwHxblVzq/rrNhuF+dfQx+eEUlIu7bRO87KBESCdxa75UdOJ5z3QaNgAmxicQd/
         +VJMoiHto4inDhukDPhRNXAgpo/UZUlcO9OST8nOcrJKfyC06jTJuKc82lne0YDKqVTG
         yqFLLfBRtad36w64APIschOAOD7mvQ46WyarrmTPv6+9S6Kp7ZqE8NNY2zhbK3xi2b7T
         CbXWIJwdpnDSgRv0hzc8n1xlz7IxXIJmSaGmHgBh/C40vzuUVfXXTgVIrU+sO4S7d1AH
         zAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784427598; x=1785032398;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OC7Lt1admKMC5oZ9cYYZw24Clyu0obewa2E3eEMrFpY=;
        b=d7+TzntFxbjC2k/meL6nH1TnH6i3EK3pfFTYncQvoqQRYV91gkBJBCbp2i4sePJdGI
         he7s53R1pUdByH7L49dzc25qzJTJN5npCDCxkpXLJp2Zu6fEzK3VZxU+XWXO8eKD6Gld
         OOYQfttJRJTjphW7lUjb4QmtpHFD1ItaIyLc9w8WqxkYArOaC2sJ7/5EQ+ebtHpZ9lyK
         el6mC7D1+a/re3L/HGhPnOOJgpFrBx5Vz2vmgfiud+kZPMRhc0gZ/IKPL5RUwH0H3Gnb
         NiArlvskHuFb/c726Wh44EGHCXAOvCSuqkY76IzGPILeU0uY9DQiz5X3CUrag925jckJ
         onzw==
X-Forwarded-Encrypted: i=1; AHgh+Roj5jmW+DJnyYpl5xe3yT4zdEp4S883FCALgOf/EN/RQJahchOqStstNM3CW9MXyKcS7CU3NFaTruxd@vger.kernel.org
X-Gm-Message-State: AOJu0YzH1yl0lT7Sq1t2Z7DYoW+2DmyhKFaoTqQjtFZcEqqiD/bIHOCG
	I6ZV+AjYLH3if7JeM8zOyfvtOzzyEh+4r4dyr47wX88+nzmfMY16vdpRHyoS+G9aGunme8IrZle
	VPv9zqB4Rp1Lqvs+5rcS5lZK9QO6Nm7D0DeJCZe80bhTEOJ4UTk6eqgonlU1x9gEj
X-Gm-Gg: AfdE7cnbr6MgPUJwwbXXixKcmecVolBJJCeOkO+X/RkBYMQeQf7XK/n+Dt23NF4ooVh
	jEDlcYRX51mD6uyVEkj9Hy6QtJejiD8/rnAAcetxYEmZgRyp1Mjz69Arexecwkk5K5wDCx2Chmy
	nfaQ+gX3Vn5SJ4vPqR1Cg+IeOxbfd8eoX4hx9Kib4dNzovhFjWn+94Bp0sCP6D0hEjQh+ZXSaG5
	T2faeLusiELOe2TDUGHAjlQq4bAPXpyHKwKEuCZkgythbn0qJW47kIhhSxmvAcDmt5qRzA82tV1
	Ho/ppceC5mi1IR8GStUXxG8cgJMeZIhpjBZk7q6jRNIBcG2JtMbAyI42iOxc6cjFT2BvG7Ovt8Q
	l97VqjgXsaoxRUpgA
X-Received: by 2002:a05:6a00:4f82:b0:847:759e:f617 with SMTP id d2e1a72fcca58-84c2948b110mr8797004b3a.44.1784427598403;
        Sat, 18 Jul 2026 19:19:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:4f82:b0:847:759e:f617 with SMTP id d2e1a72fcca58-84c2948b110mr8796978b3a.44.1784427597959;
        Sat, 18 Jul 2026 19:19:57 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af6d519sm3352091b3a.40.2026.07.18.19.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 19:19:57 -0700 (PDT)
Date: Sun, 19 Jul 2026 03:19:52 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Janani Sunil <janani.sunil@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
        Michael Hennerich
 <Michael.Hennerich@analog.com>,
        "David Lechner" <dlechner@baylibre.com>,
        Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
        Andy Shevchenko
 <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel
 <p.zabel@pengutronix.de>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Shuah Khan
 <skhan@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Marius
 Cristea <marius.cristea@microchip.com>,
        "Marcus Folkesson"
 <marcus.folkesson@gmail.com>,
        Kent Gustavsson <kent@minoris.se>, <linux-iio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, Janani Sunil
 <jan.sun97@gmail.com>,
        <linux-spi@vger.kernel.org>, Kent Gustavsson
 <nedo80@gmail.com>
Subject: Re: [PATCH v6 5/5] iio: dac: Add AD5529R DAC driver support
Message-ID: <20260719031952.732e193d@jic23-huawei>
In-Reply-To: <20260715-ad5529r-driver-v6-5-cfdf8b9f5ee3@analog.com>
References: <20260715-ad5529r-driver-v6-0-cfdf8b9f5ee3@analog.com>
	<20260715-ad5529r-driver-v6-5-cfdf8b9f5ee3@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE5MDAyMCBTYWx0ZWRfX5ggKI2dT6Sh9
 z4KAwYMTjY3BlqCifnISrptKuSNqV6lxcYSF7TJ30/6644NPcaOj8gQCPl72qDb+xFSO5b4ufq6
 k9HC1KcP68fQvblObfQb4BaE4tsZ4Os=
X-Proofpoint-GUID: OezS0U4GNwk8-O0XVFL4cR1KmGX6Q3W2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE5MDAyMCBTYWx0ZWRfX7tELpFft9656
 LZNcmgJSLQeo9uCZMAen6MeKh+VYi6Qc0c2ylMewWYlYP9bLYzKZvjs6uo3nC/R07QC+C4FPAT1
 8Tjzx80TXGzjb+wtf5GioNw3rpWM6dCMLJjYcWLweVqrWeCHLK6QrSO2lFWB+F2Tk4AF4QLXJOg
 OR5gAKfa9gsNxjWss2trVSQCaPyuTGg0ei3ccEDZz4Bopr00Tw1xHBm0S8xbLdbaItzsC4okTc4
 DMgkD91dLZKiHyIhi9uoiMFm3iALwJKkgw1BPh85Qv0oN6nsKRzgrREbpMP44k5x12/4ubiBtug
 LwzYxLySb4QF0wEzUl/Yrfajs7fqivy1fTYxxzilqvPu+LkA0SPbn/VGeNhNIQ/qaqr0o7p4l+W
 quVtUs+qQcil5Mu7Q050EEriMkX6RDDTL7BQrL8AJKlQQt7LRPKalutKXKQ9KyUD9dWGolZ+9Xe
 iebmqfh1L6Eiodq7yJg==
X-Authority-Analysis: v=2.4 cv=T5K8ifKQ c=1 sm=1 tr=0 ts=6a5c344f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gAnH3GRIAAAA:8 a=qHo4TYnVUpYQsGEgifAA:9 a=CjuIK1q_8ugA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: OezS0U4GNwk8-O0XVFL4cR1KmGX6Q3W2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607190020

On Wed, 15 Jul 2026 13:41:08 +0200
Janani Sunil <janani.sunil@analog.com> wrote:

> Add support for AD5529R 16-channel, 12/16 bit Digital to Analog Converter
> from Analog Devices.
> 
> The device communicates over SPI and supports per-channel output range
> configuration. An optional external 4.096V reference can be used in
> place of the internal reference.
> 
> Signed-off-by: Janani Sunil <janani.sunil@analog.com>
Hi Janini

Fairly quick review as it is end of day here now.
A few things inline.

Thanks,

Jonathan


> diff --git a/drivers/iio/dac/ad5529r.c b/drivers/iio/dac/ad5529r.c
> new file mode 100644
> index 000000000000..c279dc530d68
> --- /dev/null
> +++ b/drivers/iio/dac/ad5529r.c

> +static int ad5529r_reset(struct ad5529r_state *st)
> +{
> +	struct reset_control *rst;
> +	int ret;
> +
> +	rst = devm_reset_control_get_optional_exclusive(&st->spi->dev, NULL);
> +	if (IS_ERR(rst))
> +		return PTR_ERR(rst);
> +
> +	if (rst) {
> +		ret = reset_control_assert(rst);
> +		if (ret)
> +			return ret;
> +
Nothing on the datasheet to say how long it needs to be asserted?

If it is very small maybe add a comment to say that here.
> +		ret = reset_control_deassert(rst);
> +		if (ret)
> +			return ret;

> +
> +static int ad5529r_probe(struct spi_device *spi)
> +{
> +	struct device *dev = &spi->dev;
> +	struct iio_dev *indio_dev;
> +	struct ad5529r_state *st;
> +	struct regmap_config regmap_8bit_cfg = ad5529r_regmap_8bit_config;
> +	struct regmap_config regmap_16bit_cfg = ad5529r_regmap_16bit_config;

I would fill both of these in using a designated initializer and do
it once we know the remaining fields.


	regmap_8bit_cfg = (struct regmap_config) {
		.name = "ad5529r-8bit",
		.reg_bits = 16,
		.val_bits = 8,
		.max_register = AD5529R_8BIT_REG_MAX,
		.read_flag_mask = AD5529R_SPI_READ_FLAG,
		.rd_table = &ad5529r_8bit_readable_table,
		.wr_table = &ad5529r_8bit_writeable_table,
		.reg_base = ...	
	};

That keeps everything in once place and removes the indirection of a template
that we then override parts of.


> +	bool external_vref;
> +	u32 dev_addr = 0;
> +	int ret;
> +
> +	indio_dev = devm_iio_device_alloc(dev, sizeof(*st));
> +	if (!indio_dev)
> +		return -ENOMEM;
> +
> +	st = iio_priv(indio_dev);
> +
> +	st->spi = spi;
> +
> +	st->model_data = spi_get_device_match_data(spi);
> +	if (!st->model_data)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Failed to identify device variant\n");
> +
> +	device_property_read_u32(dev, "spi-device-addr", &dev_addr);
> +	if (dev_addr > 3)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "spi-device-addr %u out of range [0, 3]\n",
> +				     dev_addr);
> +	regmap_8bit_cfg.reg_base = dev_addr << AD5529R_ADDR_SHIFT;
> +	regmap_16bit_cfg.reg_base = dev_addr << AD5529R_ADDR_SHIFT;
> +
> +	ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(ad5529r_supply_names),
> +					     ad5529r_supply_names);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to get and enable regulators\n");
> +
> +	ret = devm_regulator_get_enable_optional(dev, "hvss");
> +	if (ret && ret != -ENODEV)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to get and enable hvss regulator\n");
> +
> +	ret = devm_regulator_get_enable_optional(dev, "vref");
> +	if (ret == -ENODEV)
> +		external_vref = false;
> +	else if (!ret)
> +		external_vref = true;
> +	else
> +		return dev_err_probe(dev, ret,
> +				     "Failed to get and enable vref regulator\n");

Slightly prefer these last two flipped so get the error of the way
a bit earlier.

> +

