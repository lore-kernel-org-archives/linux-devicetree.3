Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1091A6815
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 00:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784336082; cv=none; b=C44ZcWke3HDplDDv4twdDlk1crszLM7EbWHWAx1y5/W37RpVHPOrjohcQw623cPCwTtlixQcwAQ9hOXfpxGIv5vONQI58rDnRYqISYl6hsq/t3GBdyoxtmNo/HME8nhpyf3433b0kmEOjympb6L3fc8aRqGHxbyP1ATUVtf47DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784336082; c=relaxed/simple;
	bh=72dNTvKcKBlDdsBURFZelm+7CJjzkMOg+3Njmf/9a/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kVvrjheFzNKhimXw0Jqprrk9swwelHsSeyHqew6X4+Et1Qb6+2ZY4YSS1vVYcKJwObulmbt++CQnyFnjHqBj82Xyphl0pVWXTYOtWqZF3+V7PeSilFgps+R+y+qbmt+GxhVgI1lrANo5NLgD29vJz+tS4ZEc0Ia7OrNdFbHUh5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UxYS+hba; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fc1jVm4/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UxYS+hba";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fc1jVm4/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HNEKMn3308495
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 00:54:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/BgUl0H87dg+9IsRcNw4Z1DgSxOyUBbMOuKwOeyC9iM=; b=UxYS+hba4/s8TDKo
	jwnZrj4Fkfekdfoi94vGvJ9sIHBfGawk2tFIaWcir7zECrDekAS5SS4ORAHp6bEG
	9pRLMGS87McONqtGo8R9w1O9j/xYvsPesQLdg4oALBZ0ghvwrZlSU3G3/Ny6Bhoq
	XGw2Xy44KmU9s2yv0lc1jWD1ig7st/X5sG/Tvv001/83JBierEIw8hfM2E1/syrp
	EodPRMkx/zSJrxEwo/mOa0B4B/pMhcc4eULBc3G0AAiLra7HNt+sEkjfmZHysRA+
	xj4DdI5+r1F0EAtcAAX27EjcVUGfuoQfQeaXmL6lZuHhY2ENUOOar7mqsKEbohKU
	i5d8+w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffrqd9d6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 00:54:39 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca6bd8a190cso12057809a12.0
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 17:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784336079; x=1784940879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/BgUl0H87dg+9IsRcNw4Z1DgSxOyUBbMOuKwOeyC9iM=;
        b=Fc1jVm4/qB4fd/dC30Bc3Me6bKkhH3h20Vha65LlLCgEan+fIiyynxNMQJjY6aYheM
         9K2XaPi/4bJ9iosMqOECYUf6fxUtJQJZyvgPAq+KpA885/6t4qWAMh7FzEVor+PoCDm5
         iBhpYicd7toYNWaq3hSygCFwHswdzjZ4cw87DRGdnZaHGxfqmmQp4OCK7D7dbz2nyaRF
         FI7O77QgYHm0tAl4A1Kjl5rkUZPvZ8jwQq/l4pUMRhkp6/RwC83lfWA/Uz1BTTY4Th+M
         MlJI0ZH6EjCeoI1LYvd8quCCxly06QZ1oxBWJzuHJiei4KneUrisfpV4lllcpVzzVJ0n
         rZvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784336079; x=1784940879;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/BgUl0H87dg+9IsRcNw4Z1DgSxOyUBbMOuKwOeyC9iM=;
        b=SIM6toO2c8dOl4g5kcvf4Bnn1bq47ziEBvtQg6cCtLdcde2zNoV0fiDT5e5B4WO6kn
         9CX7SV4uEivovh1w9Zw1S1IToo7s0xKh1ZnqiDjzIZ0blXnUkIfGvzT2onEVycLlWO+P
         Ghh46dkVCm9n3J4+aeWhz3gAYqca2XE/Sd9POKEQa9PhO61DimavCW2GwyG8YqSDg4mH
         cJvdwW1UWW0jLNGe9vtxxPbCgZnMSrdFMKg/pHynnjXkAA93mzxQxzZ8cDks5WnEycAX
         BWVDPHX119VJg0e7bPfdBD08NqOVotuKE7nb98Dq62CU0GHXDRkHQ0VNbU8nfwD+/7TG
         Spww==
X-Forwarded-Encrypted: i=1; AHgh+RqIqx/5W9+aE6Ev7J5w9c3V4hv0ZuNVtt7VT/6XN/jvSh2cznPKuM5APu8Imryl7sBf8fVB1p8uv3vG@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3IU4m3rG1i12HPos5hfQe5I2eDJ1VdIVC0BFHzXqqJR6QJzuM
	6WCPrie5e4XNaWJaJ2ITQJCbnwP38+KOrndwMjy94t7Vg5t2HfIUrtrnPuO5g+tKa/3boNFKk65
	/wzrYPNOR2fsAsnzIyUQyhjs36It625vMCxDQgGyYPgZh7cTGcY3JFOWWH8+9hxkr
X-Gm-Gg: AfdE7cmwgm8HHlwcPDG80MOFPur1du53x5Aq9337lDH+r6PeWZNS+Kpw/GRMM2LA5dO
	haD5lgPI+6W67Z1pl5GBaVyagzwzo/fEfpr9j4twv3rgrK9FrBfwsjEhEh/pdzQ5QuUn8yNSuAD
	4Ker5HqdCrlbV1/knLYavKqBFGvgOz2Hsc3JZT4zRJRb4H55/xvaDueFxXAu5P0Vwj6ZZ3Ba0Pm
	Y4zFDX2SPNSvu8jKl3zjJEzGYoy4mK1nRRI0GufMwNi+vaBOU0LkYYsocp1GX6NidlufK6m76aT
	XDrLBRokT2INxk9d5/gsDAf41ShntB4W0xgc2/1Gkhbsf4Ocm95elS83DCpu+SfwyDLvA0+D97/
	nhCgl2ZiNFztrLG5q
X-Received: by 2002:a05:6a21:1506:b0:3c3:791e:5e0c with SMTP id adf61e73a8af0-3c3ad7d165emr5645623637.19.1784336079313;
        Fri, 17 Jul 2026 17:54:39 -0700 (PDT)
X-Received: by 2002:a05:6a21:1506:b0:3c3:791e:5e0c with SMTP id adf61e73a8af0-3c3ad7d165emr5645588637.19.1784336078795;
        Fri, 17 Jul 2026 17:54:38 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb59ad340c5sm949264a12.27.2026.07.17.17.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 17:54:38 -0700 (PDT)
Date: Sat, 18 Jul 2026 01:54:32 +0100
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
Subject: Re: [PATCH v8 1/3] iio: adc: ti-ads1100: Fix incorrect reading when
 datarate changed in single mode
Message-ID: <20260718015420.2fdf47f8@jic23-huawei>
In-Reply-To: <20260717185033.246580-2-jakubszczudlo40@gmail.com>
References: <20260717185033.246580-1-jakubszczudlo40@gmail.com>
	<20260717185033.246580-2-jakubszczudlo40@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1inF3t1MJ0CQ9YEGbzawsKvaxcFhPu1j
X-Authority-Analysis: v=2.4 cv=DbYnbPtW c=1 sm=1 tr=0 ts=6a5aced0 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=c92rfblmAAAA:8 a=pGLkceISAAAA:8 a=6hg21SRTkHdtpZ-c3aUA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: 1inF3t1MJ0CQ9YEGbzawsKvaxcFhPu1j
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDAwNiBTYWx0ZWRfX770mg9OVuhj/
 qMKN/wNVSFRNZNJbfK2igy5xNb3+QNjyD8SdbTCozeJfch2a7YDLFaNzD9gd71qgESLA6OYuHo7
 pzAw/W5u099x+VXA/E5QlO4jy6c/a3I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDAwNiBTYWx0ZWRfXxfMBPwqIEqAV
 MUsCISwg2swgd50cv4o2UbQWOWnpP6fuck8JAkqTFSo+YdVBgi3ngB1YFK1GafqeWJJEcF7hJrD
 QQdDKv1RMThDiuETTKahrHY/oiO33jg2AGfvCC456l3fbBtssgVJUnVd4gu5lo1yRPJKWx1eL1n
 uDxH9LlTWA9ED6w89GH4UDmfC05v0ZFWiLCVPJbzD/H6iiHh3utIN9462MHqUqybkM9tH9Y4Au3
 9r5Ufd8uIPVck2dhNORPxu1CenprYYYT8HXHxlBJV+1XLOud0mcyDGMzNg+mTh+5sOJcw0iAkuZ
 mZfdHEKhwWWITZUG9S4qOgS8iKJn8pOHlFjBdEKvXf8WDWO9JB1uYCUBK8eJiKHjws5z8yUpJzH
 SHIg7zcqwhgYtZDEd2kdnK8iNmk2N58A027F+3xXHUfrrFkrsJ9G5f56J0g9RzeITGFeg+S9wdO
 MTKNqmSa/VNo2UGH1VQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_07,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180006

On Fri, 17 Jul 2026 20:50:31 +0200
Jakub Szczudlo <jakubszczudlo40@gmail.com> wrote:

> When device is suspended and it is in single mode then changing
> datarate doesn't make it actually wait for new measurement, so to
> be sure that read after change is correct functions that changes

be sure that read after change is correct, functions that change

(to make it easier to read)

> datarate and gain will wait for a new data.
> 
> Fixes: 541880542f2b ("iio: adc: Add TI ADS1100 and ADS1000")
> Signed-off-by: Jakub Szczudlo <jakubszczudlo40@gmail.com>
> ---
>  drivers/iio/adc/ti-ads1100.c | 71 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 67 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iio/adc/ti-ads1100.c b/drivers/iio/adc/ti-ads1100.c
> index 9fe8d54cce83..363f790ca5d5 100644
> --- a/drivers/iio/adc/ti-ads1100.c
> +++ b/drivers/iio/adc/ti-ads1100.c
> @@ -15,10 +15,12 @@
>  #include <linux/module.h>
>  #include <linux/init.h>
>  #include <linux/i2c.h>
> +#include <linux/iopoll.h>
>  #include <linux/mutex.h>
>  #include <linux/property.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/time.h>
>  #include <linux/units.h>
>  
>  #include <linux/iio/iio.h>
> @@ -43,6 +45,9 @@
>  static const int ads1100_data_rate[] = { 128, 32, 16, 8 };
>  static const int ads1100_data_rate_bits[] = { 12, 14, 15, 16 };
>  
> +/* Timeout based on the minimum sample rate of 8 SPS (7500ms) */
> +#define ADS1100_MAX_DRDY_TIMEOUT_US	(7500 * USEC_PER_MSEC)
> +
>  struct ads1100_data {
>  	struct i2c_client *client;
>  	struct regulator *reg_vdd;
> @@ -123,10 +128,50 @@ static int ads1100_get_adc_result(struct ads1100_data *data, int chan, int *val)
>  	return 0;
>  }
>  
> +static int ads1100_new_data_is_ready(struct ads1100_data *data)
> +{
> +	u8 buffer[3];
> +	int ret;
> +
> +	ret = i2c_master_recv(data->client, (char *)&buffer, sizeof(buffer));
> +	if (ret < 0) {
> +		dev_err(&data->client->dev, "I2C read fail: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return FIELD_GET(ADS1100_CFG_ST_BSY, buffer[2]) ? 0 : 1;

There is question from sashiko on this one.  I'm kind of assuming it is wrong
but do check (link below)

> +}
> +
> +static int ads1100_poll_data_ready(struct ads1100_data *data)
> +{
> +	int data_rate_Hz = ads1100_data_rate[FIELD_GET(ADS1100_DR_MASK, data->config)];
> +	/* To be sure we wait 5 times more than data rate */
> +	unsigned long wait_time_us = DIV_ROUND_CLOSEST(USEC_PER_SEC, 2 * data_rate_Hz);
> +	int data_ready;
> +	u8 buffer[3];
> +	int ret;
> +
> +	/* To be sure that polled value will have value after config change */
> +	ret = i2c_master_recv(data->client, (char *)&buffer, sizeof(buffer));
> +	if (ret < 0) {
> +		dev_err(&data->client->dev, "I2C read fail: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = readx_poll_timeout(ads1100_new_data_is_ready, data,
> +				 data_ready, data_ready != 0,
> +				 wait_time_us, ADS1100_MAX_DRDY_TIMEOUT_US);
> +	if (data_ready < 0)
> +		return data_ready;

https://sashiko.dev/#/patchset/20260717185033.246580-1-jakubszczudlo40%40gmail.com

ret needs checking.

> +
> +	return 0;
> +}

Otherwise this looks fine to me.

Jonathan
