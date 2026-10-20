Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481001;
	b=Cvhz+dHskku1ITBnvVAh4ZivQz3bA3CY3bfq8QVyzNGZlM05wDUnaaHv1eV5xnvAi432
	 QcVbJEd2Q5rgQV/18RxfuIHBTViUgavqwXaiEZ2hOycIyxmJqQ+7RYev2V7YNPE0vj620
	 O/0zxA1KvW1ZhHFrtzSh8+uQ3wpcpxBUIaC63E1+OcGrV/95lcNiYPTOmf/pW+ZBCBveD
	 xF6hlpJUpWfF2LQUjWJNcK4nmK1A4zHuuluwV4TXsVuaWvHMPTnN+oAKUfIBni3RZoMdY
	 c4RS13K84g9FpfuxXEc3z1mO5Ypq4cm3b32oHyWoTqBXwitkxhVVmpAh8WDj8oZelUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RHUiUEHREUeEh5je+5lV75Z/l5w+EUxJwFLE25lJoH8=;
	b=CMbSTR8btviBLL5iV10H67jqZV9nRxvgmZokcekPUIZZmjudM8c7xg4e80Yz4zvOVASh
	 mcegxeDEla4DT3XgbHPwJ7UFYNy/lF9BAIEyjY0sRFlLsaEvBUSaLd/08ous+ghO9mBZP
	 Nd2XiMNKJFCWST3a25lSeAAzv1WOnpM830aMWjIwU4ZyJi0D6ViZbSrGGQ0yWE+1EZtPr
	 B4rJNJxMN5jcQNaxi6Cz+h1YVeP3v4DQyLBZFAEfNUqizYc0+QbF9Vrg7ajcaybTWvwVL
	 x+C1aZZAx7UVVm11Dewt5Kkynrcp2wVR/uiJ9xv7ZLBr37aOo24kyWptt/tEj1YXX/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EdnIsuwq;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B090A606A31C
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:23:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B090A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EdnIsuwq
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso234732f8f.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 00:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792480999; x=1793085799; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RHUiUEHREUeEh5je+5lV75Z/l5w+EUxJwFLE25lJoH8=;
        b=EdnIsuwqI7NQKvCjzojPTT0RDLLN547WJUEvCt4bJznPoyINqzTvVLhEf3tH9Se4jt
         grslrI3wq1Wn4jN7ZZctYegJUcwgAohvax2PLd3FxS+t3ZStnnOeb9yujfGcDV/FBCI+
         mSmnM9plppXbJeZemMkLZoYraOZM3ER2+HwA1eFLU4NZvgCoZibaQlWfVilrR/AAQlo5
         T3qv7q82p5Yv7JjMQmz9tiLuAl8vrXgyjDYCsPI4XMv9aHUw5lR67wxKDteStiVTYWvd
         nztWJD2GenTB1wHYYsoSQFWmx+h8+qmz3L7gwrNAYmjDGz1ovD2BoAp1kWXMp1n69nY1
         9ThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792480999; x=1793085799;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RHUiUEHREUeEh5je+5lV75Z/l5w+EUxJwFLE25lJoH8=;
        b=hvTwKGz7SyQ5RqmyAHEwtRtQ1UEFkG+WwzTomqsUSRPZpjGlkB4DMxuuIXvvUbiZbd
         iwbPgyl+GEx2Tl09TXeshoLDBASPed4zHEhPLskMo9FyKzspMe8Zkl8zBQGYyAEAxmNK
         6Mo/lKSgUlJ0jwgqnugboCXYqKSjCi6lqAeDn2bd7eAGe4nVHTFdZUrnjPd3RwaGWf2t
         aVEtlpawYChumicTgzDdF7AF6A3XCRSQsfqTvrHfcR3AZmyOYn0F//w6742gnTj04dSa
         QS0BZv3Y2WM7L2iCVbhanRpT1dzUlXt1vQ0MLD376Bg7qoPsCb/HG1kCcFIa+Kw2FDnq
         emZw==
X-Forwarded-Encrypted: i=1; AKwUvBzDRMovF1DW1j7dEj6i9Vk8O6JAjH1ELMFoJX3LXUeTrzfOnEMTD3zdjyvNZM2+o4s+c5HuMAaM89hR@vger.kernel.org
X-Gm-Message-State: AFq9FYKrGKa9mdbmefGvHz6VVoh9bj4sWx3neheahx3rxv6DRYkYELzN
	wBDSlfbXFTtawf166um6B3JYXbLBRrjlCSZvJMLLahtDcZZZTK3UTd5O
X-Gm-Gg: AYBFou2z2pozdk4e4ZgeB0LJ5K3P5U+WQfdZadw4EBlNQp3AtG1YaciMwKZaZUhIS/8
	662RR25lieqYmv89L+87D+1401Whl4tfcNQVVjd2ioQA+MFAjexxAQ2mAqdLExGGp2flKYW7qO4
	J1ICY8mM+yDuPlxgBaDNjcHOzUqzV4WXeriKy5Q4TTSAoH5i8qm8R0HyIR0GE4pvVn1THOzTP/a
	KpTjnPzf+Y5ndImj6QwuRERTa7lamdKtEZd14nRrk0l0GPoRMaHy76FNH/eSA1oUFkEt/Gen+TW
	YXZUue1VUOSOqkrTxxdsIjoFiK4GPPdi+TkWLl1GlKACKJSOpZXQFSzmHXWHNfLknsG7qoN9bDd
	5JsBHu0iN+O3E5HarxWvznrF2lq8Zo0WWWK4/bhellqihGSAdFH8OwgKCzMXSMbX3uZcK61JBY8
	lE/M01rAmyxH1ZkM8vdbKmVZj3zse/FqfNV6IlO+j+b9X9BKLF+gO2WVp6jct9NPlCBAhMZJAfm
	u3w+Av+Zb8X0W5ucuEpn4AuJZ33uyJRKn2tjS/YFmvAFd/rOO1CHzS93wZ8pXOaVAAUUzLzLnQK
	SfcTn7UTsKAKvQI2TgNKa2USJgD/UtFXEaxzgsO7N69caSYaLlX/na5idQcLGwv5ltR3J0jhfMu
	fKl4MO0hePQuC2+OaKlqPmGnTLHcW/jXm8DZVNUlcRVhRz74GGw/8BeeqK+jogO2lb7EPSklHba
	tIJx6f
X-Received: by 2002:a05:600c:80c3:b0:49c:ff66:7d88 with SMTP id 5b1f17b1804b1-4a1f52b9d52mr17422595e9.7.1792480998747;
        Tue, 20 Oct 2026 00:23:18 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d6dc034sm3958956f8f.3.2026.10.20.00.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:23:18 -0700 (PDT)
Date: Tue, 20 Oct 2026 09:23:16 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Vidhu Sarwal via B4 Relay <devnull+vidhu.linux.gmail.com@kernel.org>
Cc: vidhu.linux@gmail.com, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, Shuah Khan
 <skhan@linuxfoundation.org>
Subject: Re: [PATCH 3/3] iio: proximity: Add Benewake TF-Luna LiDAR driver
Message-ID: <20261020092316.00003339@gmail.com>
In-Reply-To: <20261020-tf-luna-v1-3-53a88f93db24@gmail.com>
References: <20261020-tf-luna-v1-0-53a88f93db24@gmail.com>
	<20261020-tf-luna-v1-3-53a88f93db24@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 20 Oct 2026 00:03:43 +0530
Vidhu Sarwal via B4 Relay <devnull+vidhu.linux.gmail.com@kernel.org> wrote:

> From: Vidhu Sarwal <vidhu.linux@gmail.com>
> 
> Add a driver for the Benewake TF-Luna, a single-point time-of-flight
> LiDAR distance sensor with a range of 0.2 m to 8 m, connected over I2C.
> 
> The sensor is run in trigger mode. Each read starts one measurement and
> waits for the timestamp register to change before reading the result.
> In continuous mode a read can catch the sensor in the middle of updating
> its result registers unless it is synchronised to the data ready output,
> which this driver does not use yet.
> 
> When the signal strength is too low the sensor reports a dummy distance
> of 0, so such readings, as well as overexposed ones, return -ENODATA
> instead of a distance.
> 
> The datasheet is available at:
> https://en.benewake.com/uploadfiles/2025/04/20250430174501874.pdf
> 
> Signed-off-by: Vidhu Sarwal <vidhu.linux@gmail.com>
> ---

Hi Vidhu,

very good for a v1, even Sashiko reported no issues. Minor style issues from
me.

Josh

> +#include <linux/array_size.h>
> +#include <linux/bits.h>
> +#include <linux/cleanup.h>
> +#include <linux/delay.h>
> +#include <linux/dev_printk.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/iopoll.h>
> +#include <linux/mod_devicetable.h>

Remove this, this is included by i2c.h

> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/string.h>
> +#include <linux/time.h>
> +#include <linux/types.h>
> +
> +#include <asm/byteorder.h>
> +
> +#include <linux/iio/iio.h>
> +
> +#define TF_LUNA_REG_DIST		0x00
> +#define TF_LUNA_REG_TICK		0x06
> +#define TF_LUNA_REG_VERSION		0x0A
> +#define TF_LUNA_REG_MODE		0x23
> +#define TF_LUNA_REG_TRIG_ONE_SHOT	0x24
> +#define TF_LUNA_REG_SIGNATURE		0x3C
> +
> +#define TF_LUNA_MODE_TRIGGER		0x01
> +#define TF_LUNA_TRIG_ONE_SHOT		0x01
> +
> +/* Below this the sensor reports a dummy distance of 0 */
> +#define TF_LUNA_AMP_MIN			100
> +#define TF_LUNA_AMP_OVEREXPOSED		0xFFFF
> +
> +/* A measurement takes 10-20 ms in trigger mode */
> +#define TF_LUNA_POLL_US			(2 * USEC_PER_MSEC)
> +#define TF_LUNA_TIMEOUT_US		(100 * USEC_PER_MSEC)

uS is better instead of US.

> +
> +struct tf_luna_data {
> +	struct regmap *regmap;
> +	/* Serialises the trigger, poll and read of a single measurement */
> +	struct mutex lock;
> +};
> +
> +static const struct regmap_config tf_luna_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = TF_LUNA_REG_SIGNATURE + 3,
> +};
> +
> +static int tf_luna_read_tick(struct tf_luna_data *data, u16 *tick)
> +{
> +	__le16 val;
> +	int ret;
> +
> +	ret = regmap_bulk_read(data->regmap, TF_LUNA_REG_TICK, &val, sizeof(val));
> +	if (ret)
> +		return ret;
> +
> +	*tick = le16_to_cpu(val);
> +	return 0;
> +}
> +
> +static int tf_luna_measure(struct tf_luna_data *data, int *dist)
> +{
> +	__le16 buf[2];	/* distance in cm, signal strength */
> +	u16 old_tick, tick, amp;
> +	int ret, err;
> +
> +	guard(mutex)(&data->lock);
> +
> +	ret = tf_luna_read_tick(data, &old_tick);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(data->regmap, TF_LUNA_REG_TRIG_ONE_SHOT,
> +			   TF_LUNA_TRIG_ONE_SHOT);

Why not have a local variable for regmap? It would allow the previous call
to fit on one line.

...

> +static int tf_luna_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct tf_luna_data *data;
> +	struct iio_dev *indio_dev;
> +	unsigned int mode;
> +	u8 signature[4];
> +	u8 version[3];
> +	int ret;
> +
> +	indio_dev = devm_iio_device_alloc(dev, sizeof(*data));
> +	if (!indio_dev)
> +		return -ENOMEM;
> +
> +	data = iio_priv(indio_dev);
> +
> +	ret = devm_mutex_init(dev, &data->lock);
> +	if (ret)
> +		return ret;
> +
> +	data->regmap = devm_regmap_init_i2c(client, &tf_luna_regmap_config);
> +	if (IS_ERR(data->regmap))
> +		return dev_err_probe(dev, PTR_ERR(data->regmap),
> +				     "Failed to initialize regmap\n");
> +
> +	ret = devm_regulator_get_enable(dev, "vcc");
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable vcc regulator\n");
> +
> +	/* Boot time is not documented, about 350 ms was measured */
> +	fsleep(500 * USEC_PER_MSEC);

msleep() is fine here, saves you the x * USEC_PER_MSEC format.

-- 
Kind regards,
Joshua Crofts
