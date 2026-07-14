Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869FC41D64D
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 20:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784059499; cv=none; b=SWyUIVNeeAxWbJXgjP4ieezazq7XAQCTpLTM7wCOEXwEF1T65ZKbXwUF1Py6AYkGFM5v6947j6JgGaylUAkPQ60cvaANdk5HhDj0aRk0tuzCX7D4hCxyBP0P/l2QHt4gE7I3whkDAX4xAipKLfF7IzRmmcb7X5J55eH331sp1u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784059499; c=relaxed/simple;
	bh=QYWu+AjGYE8mrtyjxzDSkho03YaMQbXwzrHnepcV1Dc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pos+bN5jAKuJOds8AzLRNpU4wqFLx+YkBzk0CkUzh1hQG2oHwu0G6tg1mqzXal1dkZzB39/RMNm6PxyNy4zFZBfA9c5EF2w38Yxo3WPOGCopWVbiRNN1EDw/gaXQ4mRw8Lr4dfmksMY4oFhlIVKM3v/hVbQO4nB42qEjH1sKvKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B/qjVm7y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B/qjVm7y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 943621F000E9;
	Tue, 14 Jul 2026 20:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784059496;
	bh=uV9l72MAv7h24mqUzqYt5ngN3HtLdCyUrS/ktmyhYi4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B/qjVm7yGKzp2Q0TRCXUhUYRWtNWQ8v6vtC9MFXVnRqOCy4xtPFLjDbklqlCVkUZH
	 3QYlx/KrZUNqArjYr7w1/8ClEv7wYDl+v9sG8Lz4LDUM+7jjkzbRYaDqXbn5B65Jnx
	 eNblVJnoeygNGMCXoH4rt5Zf/lkHDbxJ8OiWAIs19aieOku0YiRfFHlbGUo8R/H8F+
	 3Ko9S+lxSqSXEG7HzPxIsjX64VPBd0pyA15MtJjEogPvZqBIr9N70geLYCqz1HQJd5
	 SvNhy/qpvlYcbps/GBzzUSYVuXh4EQoA2nZZ0cUrSrRrCtPl1WBqwmUoLCX9uwRQbK
	 7Kc15hjmEwOpg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/3] dt-bindings: iio: adc: ti,ads1100: add support
 for ADS1110
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jakub Szczudlo" <jakubszczudlo40@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260714195528.597753-3-jakubszczudlo40@gmail.com>
References: <20260714195528.597753-1-jakubszczudlo40@gmail.com>
 <20260714195528.597753-3-jakubszczudlo40@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 20:04:56 +0000
Message-Id: <20260714200456.943621F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Logic error in ads1100_poll_data_ready causes a 7.5 second hang an=
d -ETIMEDOUT on every configuration change
--

--- Patch [2]: [PATCH v7 2/3] dt-bindings: iio: adc: ti,ads1100: add suppor=
t for ADS1110 ---
commit 020c9fd2512b9b8cdb2cbcd5179eab372c1ab0a5
Author: Jakub Szczudlo <jakubszczudlo40@gmail.com>

dt-bindings: iio: adc: ti,ads1100: add support for ADS1110
   =20
Register layouts are the same as for ADS1100 but ADS1110 have different
data rates and have internal voltage reference that is always 2.048V.
Also correct order of ads so they will be sorted alphabetically.

> diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads1100.yaml b/=
Documentation/devicetree/bindings/iio/adc/ti,ads1100.yaml
> index 970ccab15e1ec..28c5e2dd0ad62 100644
> --- a/Documentation/devicetree/bindings/iio/adc/ti,ads1100.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/ti,ads1100.yaml

[ ... ]

[Severity: High]
Does this logic in ads1100_poll_data_ready() cause a timeout on every
configuration change?

In drivers/iio/adc/ti-ads1100.c:ads1100_poll_data_ready():

	ret =3D readx_poll_timeout(ads1100_new_data_is_ready, data,
				 data_ready, data_ready !=3D 0,
				 wait_time_us, ADS1100_MAX_DRDY_TIMEOUT_US);
	if (ret)
		return ret;

And in ads1100_new_data_is_ready():

	return FIELD_GET(ADS1100_CFG_ST_BSY, buffer[2]);

When the device operates in continuous conversion mode (enforced by
ads1100_runtime_resume before the polling loop), the datasheet specifies
that the ST/BSY bit is always 0.

Since data_ready is always 0, the condition data_ready !=3D 0 evaluates
to false on every iteration. Will the polling loop always block for the
maximum timeout of 7.5 seconds (ADS1100_MAX_DRDY_TIMEOUT_US) and return
-ETIMEDOUT?

This breaks sysfs writes to scale and sampling frequency, severely
impacting driver usability and causing large delays.

Furthermore, even if the device was in single-shot mode, breaking when
data_ready !=3D 0 means it would exit immediately while BUSY (1), instead
of waiting for the conversion to complete (0).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714195528.5977=
53-1-jakubszczudlo40@gmail.com?part=3D2
