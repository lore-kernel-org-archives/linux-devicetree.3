Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FFF5908C2
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 14:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788964861; cv=none; b=QNFunvv+kCArRwxZAXObjKNKs2UxE/m/TtzcpA2rmVvMuOp7i53+YaOGDnT5PDnIqv78HksXyJubujMWJMX9FTXAcn5Jo/6IB//KxcaOQfpQmp28m4NFyKzKUIv/rH53kr/pM1s1Nv1hwisxeTkHyoZ0blcqh7ypmWY26IBLVdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788964861; c=relaxed/simple;
	bh=JcC4hgzbuE+PqPexpL98nmKgLg96LT95UCwlQS7tZas=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nEH6RI59WgiycJ9K8Jcc4FSu6scY2z0oWnaOyBujOBW7xnXmlcc6RwdliiVd116Vg2evQW8mySAhb2128A2sa5resnK8HQBp03aecQpS6w+rdujY/JaAjzoIRFky3kCX9qzo11f1+2+iV4M++WuQ5IM5c/lPf5PjR7VB5HTLpbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j2hBDoQM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j2hBDoQM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BE111F00A3D;
	Wed,  9 Sep 2026 14:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788964859;
	bh=VH0qaIM0Gc16gnVBaMxLWvXtUD7PgpeizWvv1lmT5+I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j2hBDoQMy2nsaYJPAePQgGiRgtID8h8Ut4hVoSoRReVCjOIgf6SQpAWE/cSijMUVi
	 kApwXkQNkUCbp1TccK9UMzI8QT380DAMmvSGsv+UuEkwXy+Rxx4fgX7BHqfxpIBfvx
	 SDv2R9Ox2Mt+PTL5ziZU8NqoTS1jBNPqzSOq2/HCeSmmIUiYoXxke0I83kfEykwLcV
	 rKTaLGh7HR2Mz/hdw6MSnCru2vopNIqfEJmGwE9tFlLu5LtGwjCyOXp2EQI0S0kS2u
	 eH+VDZ5lBU0UCD0642MFiqeDQHPbfyRPOzHIUy1UI9BgRZZdFUINNRorThBNkP99Lh
	 lWv5MwXGS6HiQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 05/10] iio: dac: mcp47feb02: Avoid unjustified probe
 failure on missing label
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ariana Lazar" <ariana.lazar@microchip.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260909-mcp47feb02_refactor-v5-5-8b67bcab93d1@microchip.com>
References: <20260909-mcp47feb02_refactor-v5-0-8b67bcab93d1@microchip.com>
 <20260909-mcp47feb02_refactor-v5-5-8b67bcab93d1@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 14:40:58 +0000
Message-Id: <20260909144059.5BE111F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Unconditional error logging when an optional 'label' property is=
 missing.
- [Medium] Reading the channel label via sysfs will return the literal stri=
ng `"(null)"` if the optional label is missing.
--

commit 804d4067a2450b6f94e3efd86db0f3e15dc14145
Author: Ariana Lazar <ariana.lazar@microchip.com>

iio: dac: mcp47feb02: Avoid unjustified probe failure on missing label

This commit modifies the driver to no longer fail the probe when an
optional 'label' property is missing, but instead logs an error and
allows the probe to continue.

> diff --git a/drivers/iio/dac/mcp47feb02.c b/drivers/iio/dac/mcp47feb02.c
> index 53a7bf4e71c46..6353aabfe252e 100644
> --- a/drivers/iio/dac/mcp47feb02.c
> +++ b/drivers/iio/dac/mcp47feb02.c
> @@ -978,8 +978,7 @@ static int mcp47feb02_parse_fw(struct iio_dev *indio_=
dev,
> =20
>  		ret =3D fwnode_property_read_string(child, "label", &data->labels[reg]=
);
>  		if (ret)
> -			return dev_err_probe(dev, ret, "%pfw: invalid label\n",
> -					     fwnode_get_name(child));
> +			dev_err(dev, "%pfw: invalid label\n", child);

[Severity: Medium]
Will this unconditionally log an error when the optional label property
is missing?

When the optional property is correctly omitted in the device tree,
fwnode_property_read_string() returns -EINVAL. This triggers the if (ret)
condition and pollutes dmesg with false positive error logs.

[Severity: Medium]
If the label is omitted and probe continues, data->labels[reg] remains NULL.
If a userspace application reads the label sysfs attribute, does this cause
sysfs_emit() to output the literal string "(null)\n"?

drivers/iio/dac/mcp47feb02.c:mcp47feb02_read_label() {
	...
	return sysfs_emit(label, "%s\n", data->labels[ch->address]);
}

This exposes kernel-internal formatting details and violates API
expectations for the sysfs interface.

>  		chanspec.address =3D reg;
>  		chanspec.channel =3D reg;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-mcp47feb02=
_refactor-v5-0-8b67bcab93d1@microchip.com?part=3D5
