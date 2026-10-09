Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312F542AFBB
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 13:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791552068; cv=none; b=QdQN5nHUEVUxXix5AOJdascVQogq+LN+dVm5j4HtbOEdL4Obfah4kr6x1oIqlB49b/L/8af1HGDV1Q71TMzH1NoODRYDleosfny/3omfiBourtGm5D7aRj8VraIzDLxl/etfk/x+GL5vfJ3OYdgZ0L7RVcjhR0UDgwzVqyhoL7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791552068; c=relaxed/simple;
	bh=Hz5lusVEiSU3gO0qlxnmmzMI65u7epGDmjl53cPh/qI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=hbbfYtUUt+Qg+yh5atgGu3UCTW+G8OllSx2Jn+Jq6VnzT8W+d/36+2xA0b3zhOSUdSLG91dYPTLDLhYsLvBsXVvmtZrn/TupeolGu5QUy4/qd5IK9BxD/smIr8apQdwDKCDqFoRAi38ifnX3Cs0VKlW92aczAVQ3s8pX7uOzGfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W72HdHKH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W72HdHKH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 743E41F000FF;
	Fri,  9 Oct 2026 13:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791552066;
	bh=PuW1SV+eLpd9A5PT9qXprvd+J6Zf0daWXXX3wuBDEu4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W72HdHKHg3uXlD1DJXWGpZS247xGm21jbkNaU0mRtZYtWeY/ObNWdQX877oUuNOPK
	 Mxmj4ezIhr9ykiFBofdUSM+Tz2JkoUpDzWZZrYg/bXa6b4rBE9sHySxt9nL+FK601u
	 Ao38qbFVf3tW5ve6M2KHjJ8TBg1Rl6yEQxRfDzu9Q3eQlFRRxfzmnCisw5rBePyGKT
	 aPy5pquxL8AuycVAEqwcUDs9wf2xPA4ByDvDFCFfNDUTXRsfHApGHGZDxuzktY7F21
	 +K8Vqim1hag3f0GnSZI9w9DafOKETaQ1bMXt42FzUwDZaVnMyIoOJlD6WTHRHaUwOS
	 T5YQBOaT4AquQ==
Message-ID: <sashiko-outbox-165623@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/7] ASoC: codec: pcm1681: Enable the PCM1681
 supplies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20261009-nord-asoc-driver-support-v3-v3-5-0c1897f21ccf@oss.qualcomm.com>
References: <20261009-nord-asoc-driver-support-v3-v3-0-0c1897f21ccf@oss.qualcomm.com>
 <20261009-nord-asoc-driver-support-v3-v3-5-0c1897f21ccf@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 13:21:06 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] asoc: devres ordering bug leaves component active after remove dis=
ables clocks
--

commit 7a5eea3c05ab4c0d2ec17ff354d7cd0e31ecd47b
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: ASoC: codec: pcm1681: Enable the PCM1681 supplies

This commit adds regulator support for the PCM1681 DAC's analog and digital
supplies. It uses devm_regulator_bulk_get_enable() during probe to ensure
power is enabled before touching clocks or regmap.

> diff --git a/sound/soc/codecs/pcm1681.c b/sound/soc/codecs/pcm1681.c
> index 3675b2236d663..6002da3a56669 100644
> --- a/sound/soc/codecs/pcm1681.c
> +++ b/sound/soc/codecs/pcm1681.c
[ ... ]
> @@ -347,6 +352,13 @@ static int pcm1681_i2c_probe(struct i2c_client *clie=
nt)
>  	if (!priv)
>  		return -ENOMEM;
> =20
> +	ret =3D devm_regulator_bulk_get_enable(dev,
> +					     ARRAY_SIZE(pcm1681_supply_names),
> +					     pcm1681_supply_names);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to enable supplies\n");
> +

[Severity: High]
Does adding this regulator to the devres stack interact poorly with the dev=
ice
teardown sequence?

The probe function registers the component using
devm_snd_soc_register_component(), meaning it will be unregistered
automatically by devres after the driver's remove() callback completes.

However, in pcm1681_i2c_remove(), the driver explicitly tears down runtime
PM and forcefully disables the hardware clock before devres gets a chance
to unregister the component:

sound/soc/codecs/pcm1681.c:pcm1681_i2c_remove() {
	...
	pm_runtime_disable(dev);
	/* Runtime PM may already have gated the clock */
	if (!pm_runtime_status_suspended(dev))
		clk_disable_unprepare(priv->sck);
	...
}

This creates a window where the ASoC component is still fully registered and
active in ALSA, but its hardware clock is disabled and runtime PM is
permanently deactivated.

If ALSA or userspace accesses the component (e.g., reading or writing mixer
controls like pcm1681_put_deemph) during this window, the component will
attempt I2C register accesses without the required system clock or runtime =
PM
support. This can lead to kernel crashes, I2C bus hangs, or silent register
corruption.

While the current patch adds a devm_regulator action to the devres stack,
modifying the overall teardown sequence, this ordering window leaves the
component vulnerable during remove. Should the driver avoid devres for
component registration or reorder the manual cleanup to prevent this?

>  	priv->sck =3D devm_clk_get_optional(dev, "sck");
>  	if (IS_ERR(priv->sck))
>  		return dev_err_probe(dev, PTR_ERR(priv->sck),

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-nord-asoc-=
driver-support-v3-v3-0-0c1897f21ccf@oss.qualcomm.com?part=3D5
