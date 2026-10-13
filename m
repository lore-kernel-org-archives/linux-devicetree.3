Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F2947C0EA
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 18:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791917660; cv=none; b=PhUn3dBlYBF0ivOcoBvKp7oepZ4mDJzCx6DmTbQlCyQDTnO3VVxtxKlmJbzP9PHlU+XnSE+1LEL87yGBUR7j/dIcoIE/z95gNbKrK+4IIpEaCrFw8AC+RIdk+CkL8fP7QBt2CVzjqyv11+e7V1hMh1UX0iA6wyroR3sonnt06JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791917660; c=relaxed/simple;
	bh=wCFFqrGhKCbGnO0d0YGItHrv7Dm5NtuNR5L21cxozrw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=lTByJ8C29u1HxIEzf1MroIwgu2cG3ukl032VHTsxEonImwUdR29uU02XA7xTONosSCEAMuhnTBjRYsK+PI7pIWd+dsLqbwzNJ3yutBUIchz4uYm/ygRGgy5u+7wICbLPDL0gCpvki4tK0rmuOWDLc75oOXW6EGCXlek3k0gD7WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WuB9ER8m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WuB9ER8m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BECFD1F000FF;
	Tue, 13 Oct 2026 18:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791917659;
	bh=fw3bTfe+9N4ipa3UZAgz3kMw9sD4Xg80KctYRoKG/DM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WuB9ER8m9PD5JZgGmJ3g/JC9qRz3EgTvKZ3ZGNU7lMGM3YHvH3QHadaPfSdHsoDyI
	 kvO9c+VF9duB5kqCtDqxgxh2Xxj/WKhZ02aiWWSLTC/S1GZtOZ9mXZlznukCJB8M3V
	 bI20JTiAfQ+e6dl2YuGHafciGTbNq4W+y9+jEK/tDJ84E9Mgjrk335BfTUgiReokui
	 P4qNk8QRPUygnTwJ7hczat9diqO4aitFIv3P6+ndEinx8d5pXGo8hTc/pKgEXs/q5A
	 pkdrYhWpn0jSx7LCyux9mY2kuWMQkv/O+/RlVa5cihfzXCpQLR0zGrj3WNE7lyYTig
	 7d4XdEWJjJEOw==
Message-ID: <sashiko-outbox-170356@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/2 RESEND] ASoC: codecs: Add support for Fortemedia
 FM34NE DSP
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261013184755.530392-3-clamor95@gmail.com>
References: <20261013184755.530392-1-clamor95@gmail.com>
 <20261013184755.530392-3-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 18:54:18 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] asoc: fm34ne-dsp: I2C transfer errors are silently masked by unc=
onditional return 0
- [Low] asoc: fm34ne-dsp: mixing goto-based cleanup with guard() scope-base=
d locking
--

commit c702ef2250bbc5a4eaf5b40b9bb43fc3e069825a
Author: Svyatoslav Ryhel <clamor95@gmail.com>

ASoC: codecs: Add support for Fortemedia FM34NE DSP

This commit introduces a new I2C-based ALSA SoC codec driver for the
Fortemedia FM34NE DSP. This chip is primarily used for active noise
suppression on devices like the ASUS Transformers.

> diff --git a/sound/soc/codecs/fm34ne-dsp.c b/sound/soc/codecs/fm34ne-dsp.c
> new file mode 100644
> index 0000000000000..74520e37c1d1a
> --- /dev/null
> +++ b/sound/soc/codecs/fm34ne-dsp.c
> @@ -0,0 +1,388 @@
[ ... ]
> +static int fm34ne_dsp_set_config(struct fm34ne_dsp *dsp, enum dsp_state =
state)
> +{
> +	struct device *dev =3D &dsp->client->dev;
> +	int ret;
> +
> +	guard(mutex)(&dsp->lock);
> +
> +	gpiod_set_value_cansleep(dsp->bypass_gpio, 1);
> +	msleep(20);
> +
> +	switch (state) {
> +	case FM34NE_NS_ENABLE:
> +		ret =3D i2c_master_send(dsp->client, dsp->info->enable_parameter,
> +				      dsp->info->enable_parameter_length);
> +		if (ret < 0) {
> +			dev_err(dev, "Failed to set DSP enable %d\n", ret);
> +			goto exit;

[Severity: Low]
Does this mix goto-based error cleanup with scope-based locking?

According to the kernel's cleanup helpers documentation, the expectation
is that the usage of goto labels and scope-based cleanup helpers (like
guard) should not be mixed in the same function. This is to avoid confusing
ownership and lock release semantics. Could this be converted entirely to
scope-based cleanup, or stick to traditional locking?

> +		}
> +
> +		ret =3D i2c_master_send(dsp->client, dsp->info->enable_noise_suppressi=
on,
> +				      dsp->info->enable_ns_length);
> +		if (ret < 0) {
> +			dev_err(dev, "Failed to enable DSP noise suppression %d\n", ret);
> +			goto exit;
> +		}
> +
> +		break;
[ ... ]
> +exit:
> +	gpiod_set_value_cansleep(dsp->bypass_gpio, 0);
> +
> +	return 0;

[Severity: Medium]
Does this unconditionally discard the error code returned by
i2c_master_send on the failure paths?

By returning 0 here after jumping to the exit label, callers like
fm34ne_dsp_probe will assume the hardware was successfully configured
even if the underlying I2C transfer failed. Should this propagate the
negative error code stored in ret instead?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013184755.5303=
92-1-clamor95@gmail.com?part=3D2
