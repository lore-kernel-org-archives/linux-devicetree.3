Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDEC339386
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 17:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791741503; cv=none; b=DIuMdoKwIuLqOdg25y2gYoyPCe16nG38ZJQI+/5ftACUXETQhWOcranNeoP33xapUwbxny4W+llbWaDsdjdXTJuJt33EIkA+6AouK4FvoVRkyMZgtZjghP+UbbDhYPReqb3bnDdRnfzJ3yPJmlyN45ksWGc+GHYtUsogRXynpl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791741503; c=relaxed/simple;
	bh=Y4N03+39ghQDp8wPQA5axTwwik4xA5pj6xvdihFKp9o=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=lJq1VMd5OUgH3T9Ewb6TJmp8GcSOGeJrndbMlPnxJMeOmr99NxIyTnX6AyaNRjzFrN9ZMpRSTCWrOGcMcI48TkGHMVPOBRaAIqFhG6yXtjqShjBGteJLegZOzx8QdOtIq6mGPKaMCLRdl5HICfAyMuqJfCyCwiWmqbGSPS4FJX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cl0yH6lL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cl0yH6lL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B64F1F0089B;
	Sun, 11 Oct 2026 17:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791741501;
	bh=ATWwO88qvZov6G7xse7auCYrkEhOTR3IKkxreNqi0P4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cl0yH6lL+QCIeNQa2wp5WiUxbswnWrk3Tl7M6xYpgvwKStdN+52hQzSqcDmocUsSC
	 6CtWIue9OfgbUExjFTVL5U3V+PJcUWk7LyoBs8CE1y1e/4u0+8e4doECzOuz7C4khC
	 VmYYlHBtXB3uvPWsTw1iLqDfzj12JDDRrg7i3kqw8nNvYLb3KyWoqE5rxthp74UrIW
	 XDujcbsIMFHwprccaj7OeaI17sHIDDcsd7+ndTkSufkWpCDGLHQyvZsV0/z8jPX30H
	 s0uQ2ROdavNr40awjYZzaiAkViRkFz3adeAiDsfMMM3gNU5MW7GvCZc4cKrJluMJV5
	 KMl7jb12TXAJA==
Message-ID: <sashiko-outbox-167364@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: x1e80100-dell-xps13-9345:
 introduce EC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aleksandrs Vinarskis" <alex@vinarskis.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261011-dell-xps-9345-ec-v6-3-2a66a364fe70@vinarskis.com>
References: <20261011-dell-xps-9345-ec-v6-0-2a66a364fe70@vinarskis.com>
 <20261011-dell-xps-9345-ec-v6-3-2a66a364fe70@vinarskis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 17:58:21 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] platform: arm64: dell-xps-ec: permanently stopped thermal pollin=
g on resume error
- [Low] i2c: dell_xps_ec_i2c_id initialized without named initializers
--

commit bd6f1bc93a902f49663602dd218ea3f2d7526203
Author: Aleksandrs Vinarskis <alex@vinarskis.com>

platform: arm64: dell-xps-ec: new driver

This commit introduces a new Embedded Controller driver for the Dell XPS
13 9345. Its primary function is to unblock thermal management by
providing the EC with temperature readings needed to control fans and
peripheral power.

> diff --git a/drivers/platform/arm64/dell-xps-ec.c b/drivers/platform/arm6=
4/dell-xps-ec.c
> new file mode 100644
> index 0000000000000..cf2dd41b1aa68
> --- /dev/null
> +++ b/drivers/platform/arm64/dell-xps-ec.c

[ ... ]

> +static int dell_xps_ec_resume(struct device *dev)
> +{
> +	struct dell_xps_ec *ec =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D dell_xps_ec_suspend_cmd(ec, false);
> +	if (ret)
> +		return ret;

[Severity: Medium]
If a transient I2C bus error occurs during resume, dell_xps_ec_resume() ret=
urns
early here without calling schedule_delayed_work().

Does this mean the background temperature polling loop (ec->temp_work) is n=
ever
restarted? If so, could this cause the Embedded Controller to stop receiving
thermal updates for the remainder of the boot, potentially leading to incor=
rect
fan curves or unexpected thermal shutdowns until the next suspend/resume cy=
cle?

> +
> +	schedule_delayed_work(&ec->temp_work, DELL_XPS_EC_TEMP_POLL_JIFFIES);
> +
> +	return 0;
> +}

[ ... ]

> +static const struct i2c_device_id dell_xps_ec_i2c_id[] =3D {
> +	{ "dell-xps-ec", (kernel_ulong_t)&dell_xps13_9345_data },

[Severity: Low]
This isn't a bug, but should the dell_xps_ec_i2c_id array use named initial=
izers
instead of positional ones? The I2C subsystem guidelines mandate that struct
i2c_device_id arrays must use named initializers.

> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, dell_xps_ec_i2c_id);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011-dell-xps-9=
345-ec-v6-0-2a66a364fe70@vinarskis.com?part=3D3
