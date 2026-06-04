Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD35137CD59
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 11:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780572520; cv=none; b=qp6EygWau7EMFKwayo/TG6BACw9EEfzgPHHCXWcTXlHlS8etlWGqKPmfOgWTCHonCBl/0vqGjlaGgVhW7ksfN6OfGyA27Ws4mI8oPlgw9KmSYtegRO7jxYhBnGqPkxW6aFHODJ6ZSJ04QM3rwyBbTqs7UcZQ6I+TySU7OFSpGuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780572520; c=relaxed/simple;
	bh=nkkX9oe4WY0attxiOIYJo90ux/4G9hIBvn9q81Unzh4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fY2KEqFdg1wVcaue5KfFWKTv5/VMxA/u0KTwp9J13UBtLJ3NkzN+wpOvT1vZOHdyhBGIVpqMzapzX5EumqprWs+mX2tpDtyuXpmXD8BGDoOFbHmcwlwfluCtvBMkuu0AF2zdeP43muaGJt9/lskMjm2oFIErYO1dzn9jNetMsZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FXbQawmN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FXbQawmN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 242251F00898;
	Thu,  4 Jun 2026 11:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780572519;
	bh=4riVDK4EXqEaHtXpS6sP8T7V6ZjGao7ewC4mh3H0woM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FXbQawmNld0WNbEj6nMuJWbWmQB6vNyoeCrHEt4yHBFRRQZWMJwwirAX+Smv7KC+Y
	 TpS6MpLYB8gOcsGgKEEYZLjKKC6kNGk5kIkM6KOA+34J+k8rwwGyQUL2+eHAanLwYJ
	 L8Q1aXSZOJsODnuIhUzp6FdEtoe7v6ZC0lH3GL4s05Q6XTq4oMZzZMuyZLjmU2Lzqh
	 mg7whMV74HfUtegnbdNf0qtpnMQegqtnwnuEvbXJyYtiEFlA+iAGMhSRHB+WEfzw7b
	 TU5DyrDryPL43miEp6iBDM0VLhRvMQ9W0r4OZsr7lTWPFw/EigK6hsmJSKh0yUv6Lt
	 VOQeCDNsB1qLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] soc: realtek: Add driver for DHC I/O level detector
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260604111821.975624-3-eleanor.lin@realtek.com>
References: <20260604111821.975624-3-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 11:28:38 +0000
Message-Id: <20260604112839.242251F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Ignored return values from regmap operations lead to uninitialized=
 stack variable usage and potential hardware misconfiguration.
- [Low] Unnecessary dynamic memory allocation for probe-only data structure.
--

commit c604ce13442f04b606b3ba51b12003236c8a3ba6
Author: Tzuyi Chang <tychang@realtek.com>

soc: realtek: Add driver for DHC I/O level detector

Add driver support for the Realtek DHC I/O level detector. The driver reads
hardware registers to determine the current I/O voltage levels (e.g., 1.8V
or 3.3V) for specific IP blocks and configures pinctrl states.

> diff --git a/drivers/soc/realtek/rtd-io-detect.c b/drivers/soc/realtek/rt=
d-io-detect.c
> new file mode 100644
> index 0000000000000..84ef8ea23cb5c
> --- /dev/null
> +++ b/drivers/soc/realtek/rtd-io-detect.c

[ ... ]

> +static void detect_io_set(struct pinctrl *pinctrl,
> +			  const struct rtd_io_detect_desc_info *desc,
> +			  struct rtd_io_detect_data *data)
> +{
> +	struct pinctrl_state *state_1v8;
> +	struct pinctrl_state *state_3v3;
> +	unsigned int val;
> +	int ret;

[ ... ]

> +	regmap_update_bits(data->base, desc->reg_offset,
> +			   BIT(desc->en_offset), BIT(desc->en_offset));
> +
> +	regmap_read(data->base, desc->reg_offset, &val);
> +
> +	ret =3D pinctrl_select_state(pinctrl,
> +				   (val & BIT(desc->status_offset)) ? state_3v3 : state_1v8);

[Severity: High]
If regmap_update_bits() or regmap_read() fail here, won't val remain
uninitialized?

Since val is used immediately after to select the voltage state, could this
cause the hardware to be misconfigured by applying 3.3V to a 1.8V pad if
it evaluates a garbage stack value?

> +	if (ret)
> +		dev_err(data->dev, "Failed to select pinctrl state\n");
> +}
> +
> +static int rtd_io_detect_probe(struct platform_device *pdev)
> +{
> +	struct rtd_io_detect_data *data;
> +	struct device *dev =3D &pdev->dev;
> +	struct device_node *pinctrl_np;
> +	struct pinctrl *pinctrl;
> +	int i;
> +
> +	data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;

[Severity: Low]
Does this structure need to be dynamically allocated and tied to the
device lifetime with devm_kzalloc()?

It looks like struct rtd_io_detect_data is only used locally within
rtd_io_detect_probe() to pass arguments into detect_io_set(). Since it is
never saved via platform_set_drvdata() or used in other callbacks, could it
just be allocated on the stack to save memory?

> +
> +	pinctrl_np =3D of_parse_phandle(dev->of_node, "realtek,iso-pinctrl", 0);
> +	if (!pinctrl_np) {
> +		dev_err(dev, "Failed to find ISO pinctrl node\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604111821.9756=
24-1-eleanor.lin@realtek.com?part=3D2
