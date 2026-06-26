Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986F13EBF0F
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 10:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782468877; cv=none; b=fSYqlzNtLNlDyzOx4EXUgaUNG6Li8IsEZ1+9J2oZ8Y+4n2326qLFvLWYETP9af+5MX4lnPUncvBKjsGVuXMT+lvYZv7ea1X6zR9HvzPmHtVdlEIRPGgiPtAQW6w8673kOEL2GgT5LJAWeitZh1Buit4hmMh2NhgnlhUfc1jh004=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782468877; c=relaxed/simple;
	bh=15MhJT2ZxMq+sELeMqg9HN0mIhDXO9p29+KabYBMU+c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=YhyYgWfGJEihFoJCE9ppGCT1svwBfvs1CgIUh+sIuF4Mlea3V+jF6g/qzyxILCYCd0/xgktHTZVeqZpVPVl1WGu/Sp/hctfA7tY40tq4SCarT+KQ/GpURfVWi0KapQr2IaBJfsXrqrru2mikxEr3RTP9Pz5HmuQHl9tlC4Tpu1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y0ANr9p4; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y0ANr9p4"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so5475695e9.0
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 03:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782468874; x=1783073674; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lztea3ZOC89L7vdZqjzvztkeXoF5fpEssy4S7I/g16o=;
        b=Y0ANr9p4awWbxBvAvUbW4rxlXo49D1FW9440z5bR832e4hP3Sj4WIv5YBS7O16nDtN
         kqy2R+dq3aMEULAxYYIgCDem7PltOFbewJODuN4s9H9VAlhhDI6rOaFXUjn4RcAwI8eg
         x5+PlL7RLgwzOMOTnM/t8I9gAUNpDZvM1T+iEkpTkcGIVJBbUqFGV+3qgazz4D/FJJgz
         x4pYD0NPn4yTE/3sOUs5QoTMYTOBYX5PmlITpcASdinNlWcEUtA8og0TxOkB4Q8yGgwq
         HDZmpvpw0qYVu+e9/otjsGvfSZYfHiJtISRUgXwlkonCyh/WmLFv++W5V1YxxB+BUpT4
         AEbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782468874; x=1783073674;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lztea3ZOC89L7vdZqjzvztkeXoF5fpEssy4S7I/g16o=;
        b=C04obag6wn1iLVeMvshJMNGzPpXIWZiQNBKjzYKpM5UwxJTP2znz3TPuQrOH8UzWad
         haqkkBDDwUB6aHUMCn+z5VMUlM5sfsmEDekO1FiQMeBPQfCP63f3/HsXgp63dMMb3puM
         A6id4yv2Nov+92JtHFYvutCBI/X4cBKMCkJAhMAreloJaMZ4W9LkTkC7PymzcCVEYLO2
         fXvhdib/mr9aFV674HqRWkhCbQKY63x41ZQiD5DPOOGAsknPJuYq6WUsppREoInWHnc0
         MS/HJuJA5nFgK+qgepFlvls5tTlLb9Xeia5hdfeKv53T8O28EKSxnzxrZwjgF7yIuK/I
         GDsw==
X-Forwarded-Encrypted: i=1; AFNElJ+cGHRqHBFB6huDcc68wjMHuurtcmYW2tVHMvG/e1A0UUl7mLox1KlIkP6xH0AqjBXTALAfBSTLGEUm@vger.kernel.org
X-Gm-Message-State: AOJu0YzaxDeg31hY3DrnZQYyjqeA9EGnimPSEYVYa11iOVIMEPwsNOvJ
	G8qV2qSj33f7Pp3g88NwzXMaRu+xhIr0uezaSeLykYa9uGv14jXK3W0d
X-Gm-Gg: AfdE7cno4gqDM8xJUaUm2t5Gk7xIxDv2xElVv4eGWUnMI+jDZt80DS6MJTNl0msqq2w
	alb84Xv4a9XThTrh5L/gn3pgUWmN4UflcWcsa2BEzNSSECadSisEW5AnhvmWQA1XbfySYx2p19h
	LsGxX/aafoEO39JjR6Vw1Kbhs9qG1/2Y15W5Xr8yOUdAXzAsPayvziG+GCZ3DZDkxrL5gD7DLS+
	g3Iatq3kN2X6x2C+vK+rSLyRrNO5SCN9QSCjwk5vRc+DOrw+Efy7T0NV5ertRezTBUQSESNYfXq
	GCqLqCTbUQD3nmtRwF2pL7DlyQWF/+XKSE1keEWIlMFK1NH6itDT4jd9w2Vm+szfCZGFWfuS3pm
	ospAVqZGkJYsO295xnmXul4rnk+QC3/Au6K8u91NsU7XaweKq9rQHanF+eayqUytqj4E06kE9T9
	NZSIfQu2HJmjptzqEKgCAJex4=
X-Received: by 2002:a05:600c:c1d7:10b0:492:4667:8c40 with SMTP id 5b1f17b1804b1-492668638c1mr71583225e9.8.1782468873799;
        Fri, 26 Jun 2026 03:14:33 -0700 (PDT)
Received: from localhost ([2001:4bb8:16f:1117:388:ce2:35e4:fb50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926c28c51asm25077485e9.2.2026.06.26.03.14.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 03:14:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Jun 2026 12:14:30 +0200
Message-Id: <DJIWHAMMOGVW.1MNPC9SYMSXX7@gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon: (chipcap2) Add support for label
Cc: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>
To: "Flaviu Nistor" <flaviu.nistor@gmail.com>, "Guenter Roeck"
 <linux@roeck-us.net>, "Javier Carrasco" <javier.carrasco.cruz@gmail.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Jonathan
 Corbet" <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260625160423.17882-1-flaviu.nistor@gmail.com>
 <20260625160423.17882-2-flaviu.nistor@gmail.com>
In-Reply-To: <20260625160423.17882-2-flaviu.nistor@gmail.com>

On Thu Jun 25, 2026 at 6:04 PM CEST, Flaviu Nistor wrote:
> Add support for label sysfs attribute similar to other hwmon devices.
> This is particularly useful for systems with multiple sensors on the
> same board, where identifying individual sensors is much easier since
> labels can be defined via device tree.
>
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
> ---
> Changes in v2:
> - No change for this patch in the patch series.
> - Link to v1: https://lore.kernel.org/all/20260622122200.14245-1-flaviu.n=
istor@gmail.com/
>
>  Documentation/hwmon/chipcap2.rst |  2 ++
>  drivers/hwmon/chipcap2.c         | 25 +++++++++++++++++++++++--
>  2 files changed, 25 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/hwmon/chipcap2.rst b/Documentation/hwmon/chipc=
ap2.rst
> index dc165becc64c..c38d87b91b69 100644
> --- a/Documentation/hwmon/chipcap2.rst
> +++ b/Documentation/hwmon/chipcap2.rst
> @@ -70,4 +70,6 @@ humidity1_min_hyst:             RW      humidity low hy=
stersis
>  humidity1_max_hyst:             RW      humidity high hystersis
>  humidity1_min_alarm:            RO      humidity low alarm indicator
>  humidity1_max_alarm:            RO      humidity high alarm indicator
> +humidity1_label:                RO      descriptive name for the sensor
> +temp1_label:                    RO      descriptive name for the sensor
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> diff --git a/drivers/hwmon/chipcap2.c b/drivers/hwmon/chipcap2.c
> index 4aecf463180f..086571d556b7 100644
> --- a/drivers/hwmon/chipcap2.c
> +++ b/drivers/hwmon/chipcap2.c
> @@ -22,6 +22,8 @@
>  #include <linux/irq.h>
>  #include <linux/module.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/property.h>
>
>  #define CC2_START_CM			0xA0
>  #define CC2_START_NOM			0x80
> @@ -83,6 +85,7 @@ struct cc2_data {
>  	struct i2c_client *client;
>  	struct regulator *regulator;
>  	const char *name;
> +	const char *label;
>  	int irq_ready;
>  	int irq_low;
>  	int irq_high;
> @@ -449,6 +452,8 @@ static umode_t cc2_is_visible(const void *data, enum =
hwmon_sensor_types type,
>  		switch (attr) {
>  		case hwmon_humidity_input:
>  			return 0444;
> +		case hwmon_humidity_label:
> +			return cc2->label ? 0444 : 0;
>  		case hwmon_humidity_min_alarm:
>  			return cc2->rh_alarm.low_alarm_visible ? 0444 : 0;
>  		case hwmon_humidity_max_alarm:
> @@ -466,6 +471,8 @@ static umode_t cc2_is_visible(const void *data, enum =
hwmon_sensor_types type,
>  		switch (attr) {
>  		case hwmon_temp_input:
>  			return 0444;
> +		case hwmon_temp_label:
> +			return cc2->label ? 0444 : 0;
>  		default:
>  			return 0;
>  		}
> @@ -552,6 +559,16 @@ static int cc2_humidity_max_alarm_status(struct cc2_=
data *data, long *val)
>  	return 0;
>  }
>
> +static int cc2_read_string(struct device *dev, enum hwmon_sensor_types t=
ype,
> +			   u32 attr, int channel, const char **str)
> +{
> +	struct cc2_data *data =3D dev_get_drvdata(dev);
> +
> +	*str =3D data->label;
> +
> +	return 0;
> +}
> +
>  static int cc2_read(struct device *dev, enum hwmon_sensor_types type, u3=
2 attr,
>  		    int channel, long *val)
>  {
> @@ -670,8 +687,9 @@ static int cc2_request_alarm_irqs(struct cc2_data *da=
ta, struct device *dev)
>  }
>
>  static const struct hwmon_channel_info *cc2_info[] =3D {
> -	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
> -	HWMON_CHANNEL_INFO(humidity, HWMON_H_INPUT | HWMON_H_MIN | HWMON_H_MAX =
|
> +	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_LABEL),
> +	HWMON_CHANNEL_INFO(humidity, HWMON_H_INPUT | HWMON_H_LABEL |
> +			   HWMON_H_MIN | HWMON_H_MAX |
>  			   HWMON_H_MIN_HYST | HWMON_H_MAX_HYST |
>  			   HWMON_H_MIN_ALARM | HWMON_H_MAX_ALARM),
>  	NULL
> @@ -680,6 +698,7 @@ static const struct hwmon_channel_info *cc2_info[] =
=3D {
>  static const struct hwmon_ops cc2_hwmon_ops =3D {
>  	.is_visible =3D cc2_is_visible,
>  	.read =3D cc2_read,
> +	.read_string =3D cc2_read_string,
>  	.write =3D cc2_write,
>  };
>
> @@ -710,6 +729,8 @@ static int cc2_probe(struct i2c_client *client)
>  		return dev_err_probe(dev, PTR_ERR(data->regulator),
>  				     "Failed to get regulator\n");
>
> +	device_property_read_string(dev, "label", &data->label);
> +
>  	ret =3D cc2_request_ready_irq(data, dev);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "Failed to request ready irq\n");

Reviewed-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
