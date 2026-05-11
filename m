Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751C828C869
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 23:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778541010; cv=none; b=WSCzzrkU9lIKjBAF88D3t+lrYpGEwbWqT+f8oaL3K+Ba3iqsMubiMZmW2vglP1GdwT1/khIBqOPvF62qPnkrKK7BAG4dOAPEKiPk/LGgMo9uh1WtAo7ai6BXhTb/fDb+FyT/XObG77s8Ddc6T2CyG4w0vvF45KTkCltCs+Ux1ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778541010; c=relaxed/simple;
	bh=zqZRFT8l8ZZ8lTHMOkurlQmWeEjBL4msIMCEGUHPL8Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fK/iPCBQo0PkWDenqkxaks8Pn1AKYXVKzqhO9WuEafuuCcG5XM+thUQcLYxGRhqTgQT4BmnjDNyBYfnPR9T4aHbTFoK3UnXXL+ju6QyUW0qPeuT1vGgZqLCw7drE/UrFSuZF2CviB5O76QF2iOe5DTdxg9ZjJqXT43QNYjACVcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJlQGqAy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BJlQGqAy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4B25C2BCB0;
	Mon, 11 May 2026 23:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778541010;
	bh=zqZRFT8l8ZZ8lTHMOkurlQmWeEjBL4msIMCEGUHPL8Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=BJlQGqAylShJ/lVdHRi88PvpBqLMIAcRbeagM4uLLHqmPlMJHL3JhErNZhGEIJxQz
	 R9SNSoJsLr8OpdG4f82ilsE6Ar8PId2uKLeEl15NHm+f/XEqtKbY7x5FiAQ1TsPkuU
	 Rj22jxG7Zsw71foJzi2Fs/y9/e+5X1ktJAppVtb5n7E3JaGqlB93bubh2vxFX7YWVu
	 5943KMIrkaSFQnsrjRKthpIpq4CLf9nhQYqSTJy7jD/JCDPGQTqEq+BU/5g1ggfarv
	 tabm/bbSY60eWeClfqtausFEs93rxFg/qit2lAcWgtqnCxps+0EkL+RxPuvDLlg50Q
	 AJ+i8uNxqds/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 10/11] iio: adc: hx711: pass iio_chan_spec to
 hx711_reset_read
Reply-To: sashiko@lists.linux.dev
To: "Piyush Patle" <piyushpatle228@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260510194947.31997-11-piyushpatle228@gmail.com>
References: <20260510194947.31997-11-piyushpatle228@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 23:10:08 +0000
Message-Id: <20260511231009.D4B25C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The triggered buffer interrupt handler (`hx711_trigger`) erroneous=
ly processes the IIO soft timestamp channel as a physical data channel, cau=
sing an out-of-bounds array write and unintended hardware state mutations.
--

commit 44e12b9836d72a45314f8d5048344b3fe6398fb7
Author: Piyush Patle <piyushpatle228@gmail.com>

iio: adc: hx711: pass iio_chan_spec to hx711_reset_read

Change hx711_reset_read() to accept the channel descriptor directly and
split out the channel-selection work into a small helper.

> diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
> index b4cdd1dc98518..a0e73aa475de0 100644
> --- a/drivers/iio/adc/hx711.c
> +++ b/drivers/iio/adc/hx711.c

[ ... ]

> @@ -390,8 +405,8 @@ static irqreturn_t hx711_trigger(int irq, void *p)
>  	memset(&hx711_data->buffer, 0, sizeof(hx711_data->buffer));
> =20
>  	iio_for_each_active_channel(indio_dev, i) {
> -		hx711_data->buffer.channel[j] =3D hx711_reset_read(hx711_data,
> -					indio_dev->channels[i].channel);
> +		hx711_data->buffer.channel[j] =3D
> +			hx711_reset_read(hx711_data, &indio_dev->channels[i]);

When the IIO soft timestamp channel is enabled, does this loop also process
it as a physical data channel?

Since iio_for_each_active_channel() iterates over all set bits in the
active_scan_mask, it includes the timestamp channel. For the timestamp
channel, the .channel value is typically -1.

Does passing the timestamp channel to hx711_reset_read() cause it to fall
back to the channel B configuration, resulting in an unintended hardware
state change and a slow physical read?

Additionally, if all physical channels and the timestamp are active, does
writing to hx711_data->buffer.channel[j] cause an out-of-bounds array write?
The buffer.channel array only has room for the physical channels:

struct {
        u32 channel[2];
        aligned_s64 timestamp;
} buffer;

While the out-of-bounds write happens to land in the adjacent timestamp
struct member, this will trigger undefined behavior and can cause kernel
panics when compiled with CONFIG_UBSAN_BOUNDS or CONFIG_FORTIFY_SOURCE.

Could this be fixed by explicitly skipping the timestamp channel in the
loop, such as checking if indio_dev->channels[i].type =3D=3D IIO_TIMESTAMP?

>  		j++;
>  	}
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510194947.3199=
7-1-piyushpatle228@gmail.com?part=3D10
