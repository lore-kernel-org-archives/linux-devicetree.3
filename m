Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABC1372EC1
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 17:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788370806; cv=none; b=fvuhaJwIiRTVLZ7Mab12OR7xsZujaw+JmROApYGoq6TiI+SVTiSo4Wsair4q63DHLfDUuW56gCt2KegLgEpDT58viIohIIzge7L7zHf4ijWuUwqs5dpO+kZ1HPGYhWeo24QZEw0iJqQUbS2cxvoZ2ZSIswZiyfM5xkI239usknc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788370806; c=relaxed/simple;
	bh=S2XRtwHu3lg8wLuQ5WIuahYjxQa06+1gHUuBflt9Y8Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WAdxHNCj18iQX9wGq6JjzsDcPl5vmK9xrBNXyKyd6AxtvaO4klgFGMF7FViyTLN4mwMYH47jEibHr4HRyo2/YqrV9JWgoCa0P7prNj0K0TO7mA+HKbReaxLzDAKuNY43NfJnEk1ir+zvPj8amjx+pAh/bdSeMB4lBEBCF1FYFz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iBLfqdOn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iBLfqdOn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A5E91F000E9;
	Wed,  2 Sep 2026 17:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788370804;
	bh=9/ATSZDgCu06U25cpgL2raSHETEsrEEGjQSymc4gAWI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iBLfqdOnnnxQxRfadXGEiRLaptc1vq0R7kHXbfC94RTjBCd5Ni/Xjcgt6o3zFT7wA
	 EUlIG/B1jlstVvEG5QcuwOVnIEqWRvX011rDwehm0L2sq7+9dEbK1F07FIqzwTMGf1
	 uA3j3S/MV3No6+YoBLHlSNEkyKwC+Y9/JA0rj6TeyElr7g2NwkgYthsJ362UiF09Mr
	 V1wINBYqSukugJveiuXJNeS4YdrHWTKV1Y1LJWXhMDONpjzWD2r5LCxGXlpMhRLfvk
	 wF6FOEKGHl6J6YB7wiTa+MuMxlWb3dqQmEAgMIbuBiYFlxDukoDNBF6VshnOaOtfL8
	 qfDdsLUFSczhw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] iio: adc: ti-ads1015: Add support for label
Reply-To: sashiko-reviews@lists.linux.dev
To: "Flaviu Nistor" <flaviu.nistor@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260902172230.5234-2-flaviu.nistor@gmail.com>
References: <20260902172230.5234-1-flaviu.nistor@gmail.com>
 <20260902172230.5234-2-flaviu.nistor@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 17:40:03 +0000
Message-Id: <20260902174004.1A5E91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `ads1015_read_label()` function passes a potentially NULL po=
inter to `sysfs_emit()`, causing userspace to read `"(null)\n"` for unconfi=
gured channels.
--

commit 9084b6f4b1c391e596d3456f4a84598bb430a6e6
Author: Flaviu Nistor <flaviu.nistor@gmail.com>
Subject: iio: adc: ti-ads1015: Add support for label

Add support for label sysfs attribute similar to other adc devices. This is
particularly useful because the label can match the schematic signal name,
identifying channel voltages easier if label is defined via device tree.

Link: https://lore.kernel.org/all/20260901184302.8127-2-flaviu.nistor@gmail=
.com/

> diff --git a/drivers/iio/adc/ti-ads1015.c b/drivers/iio/adc/ti-ads1015.c
> index 0fbfa4e499aa8..8be1f0c32ca9d 100644
> --- a/drivers/iio/adc/ti-ads1015.c
> +++ b/drivers/iio/adc/ti-ads1015.c
[ ... ]
> @@ -586,6 +587,15 @@ static int ads1015_read_raw(struct iio_dev *indio_de=
v,
>  	}
>  }
> =20
> +static int ads1015_read_label(struct iio_dev *indio_dev,
> +			      struct iio_chan_spec const *chan, char *label)
> +{
> +	struct ads1015_data *data =3D iio_priv(indio_dev);
> +	const char *name =3D data->channel_data[chan->address].label;
> +
> +	return sysfs_emit(label, "%s\n", name);

[Severity: Medium]
Will this return "(null)\n" to userspace for channels without a configured
label?

If a channel is not explicitly defined in the firmware nodes, or if the dri=
ver
falls back to the default configuration via ads1015_get_channels_config(),
the label field will remain NULL. Passing a NULL pointer to sysfs_emit()
results in an incorrect literal "(null)\n" output at the UAPI boundary.

> +}
> +
>  static int ads1015_write_raw(struct iio_dev *indio_dev,
>  			     struct iio_chan_spec const *chan, int val,
>  			     int val2, long mask)
[ ... ]
> @@ -897,6 +911,17 @@ static int ads1015_client_get_channels_config(struct=
 i2c_client *client)
>  			}
>  		}
> =20
> +		if (fwnode_property_present(node, "label")) {
> +			ret =3D fwnode_property_read_string(node, "label", &label);
> +			if (ret) {
> +				dev_err(dev, "invalid label on %pfw\n", node);
> +				return ret;
> +			}
> +			data->channel_data[channel].label =3D label;
> +		} else {
> +			data->channel_data[channel].label =3D "";
> +		}
> +

[Severity: Medium]
Are there cases where some channels might be skipped in this loop?

Since this initialization is contained within the child node iteration loop,
it only covers channels that are explicitly defined in the firmware nodes.
Channels omitted from the device tree will remain zero-initialized, leaving
their label field as NULL.

>  		data->channel_data[channel].pga =3D pga;
>  		data->channel_data[channel].data_rate =3D data_rate;
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902172230.5234=
-1-flaviu.nistor@gmail.com?part=3D2
