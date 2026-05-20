Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7270D331A48
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 15:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779291911; cv=none; b=pffutcniCm9BbIiV+UUfKEis978yowVeb2W2XV2i/mdRYMtfe2gjWsySAoV/Z9IxAwC3pLj4YoHbHmo04nSy4iAmbQR67mo7M54JPBxxsqWSQdHKp3Lwf1AO//dtreMbdUwc0TSf1dReH+wdEJzZ0pVJu7iO3XccEeagj0i//KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779291911; c=relaxed/simple;
	bh=X7ECn+13uBeXcKPa7aZkBT+zLh6/qLvwSQKO/his5lI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G1c7tvATy5A1E3F+AoRB5c7IDMf/gxUBcYqJz3JFeKWhZ/Zkt9g/raiPwCLf9GAKu4e7Wnq5cpv2ifKlVhjxQ9Djpz1a+k88l634hf9CxOWFtJoYUN/bBmMudPadUywhrwR2ybx5nBooBncCv8Ba/XkogpvbpTQQZnWIk7tRcCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mMAVKbke; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mMAVKbke"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5B881F000E9;
	Wed, 20 May 2026 15:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779291910;
	bh=iK7vnNg4VTs0dWIaiYf6cwgrPTCmXCwrmQi2dpKPGac=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mMAVKbkedGBxubrE4quCWJVPzNAH/9SprQIv56MDT+ebj2OzPxiqIKJvjCYAy7+8s
	 1VpwhHAutCBYFuaxWEoF9jr9abj8L3NVvxgikiwU9cE5ZsN2ZiFvpjeoCoTXb+VjBX
	 MihdvrgiXXgBJW1dZhld/AZqMP6LHm1aaR9evYHttlOCK0keD1gMgxB9HP3F+3DblK
	 pEK5yhAetWn2RWtxjruGaT47lBftKpPYDA+RkLnFL1kjslCKv+Y7Od79lr8cf2OoS3
	 Q5nim/6tFmrKy/8aXuENd4TosfOfcZPe/sQRjWlgDzsngCqf0RJ02qHnodMgpoSTM/
	 P51U1q3YdVG9w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] rtc: ds1307: Fix off-by-one issue with wday for
 rx8130
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fredrik M Olsson" <fredrik.m.olsson@axis.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260520-ds1307-rx8901-add-v2-2-e069ea32e1db@axis.com>
References: <20260520-ds1307-rx8901-add-v2-2-e069ea32e1db@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 15:45:09 +0000
Message-Id: <20260520154509.D5B881F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Undefined Behavior via out-of-bounds shift in ds1307_set_time()
- [High] Hardware configuration corruption in rx8130_set_alarm()
--

commit 3f83bdbd74c118b742ad3d44c6daf3ae8e8ffcbe
Author: Fredrik M Olsson <fredrik.m.olsson@axis.com>

rtc: ds1307: Fix off-by-one issue with wday for rx8130

The RTC represent each weekday with a individual bit set in the WDAY
register, where the 0th bit represent the first day of the week and the
6th bit represents the last day of the week.

> diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
> index 7205c59ff7294..bf42c250ea7d1 100644
> --- a/drivers/rtc/rtc-ds1307.c
> +++ b/drivers/rtc/rtc-ds1307.c
> @@ -308,7 +308,7 @@ static int ds1307_get_time(struct device *dev, struct=
 rtc_time *t)
>  	t->tm_hour =3D bcd2bin(tmp);
>  	/* rx8130 is bit position, not BCD */
>  	if (ds1307->type =3D=3D rx_8130)
> -		t->tm_wday =3D fls(regs[DS1307_REG_WDAY] & 0x7f);
> +		t->tm_wday =3D fls(regs[DS1307_REG_WDAY] & 0x7f) - 1;

[Severity: High]
This isn't a bug introduced by this patch, but does this introduce a new
non-malicious trigger for a pre-existing undefined behavior?

The kernel's rtc_valid_tm() omits validation of tm_wday. A malicious usersp=
ace
program with CAP_SYS_TIME could already pass a negative value to RTC_SET_TI=
ME,
triggering an out-of-bounds shift in ds1307_set_time():

drivers/rtc/rtc-ds1307.c:ds1307_set_time() {
    ...
	if (ds1307->type =3D=3D rx_8130)
		regs[DS1307_REG_WDAY] =3D 1 << t->tm_wday;
    ...
}

With this patch, if the hardware WDAY register is zeroed, fls(0) returns 0,
making t->tm_wday equal to -1. A benign read-modify-write cycle by standard
tools (like hwclock) will now naturally trigger the undefined behavior.

>  	else
>  		t->tm_wday =3D bcd2bin(regs[DS1307_REG_WDAY] & 0x07) - 1;
>  	t->tm_mday =3D bcd2bin(regs[DS1307_REG_MDAY] & 0x3f);

[Severity: High]
This is a pre-existing issue, but does rx8130_set_alarm() corrupt the RTC's
hardware configuration?

drivers/rtc/rtc-ds1307.c:rx8130_set_alarm() {
    ...
	/* Read control registers. */
	ret =3D regmap_bulk_read(ds1307->regmap, RX8130_REG_EXTENSION, ctl,
			       sizeof(ctl));
	if (ret < 0)
		return ret;

	ctl[0] &=3D RX8130_REG_EXTENSION_WADA;
	ctl[1] &=3D ~RX8130_REG_FLAG_AF;
	ctl[2] &=3D ~RX8130_REG_CONTROL0_AIE;
    ...
}

Because RX8130_REG_EXTENSION_WADA is defined as BIT(3), this operation masks
out and clears all other configuration bits in the register (such as timer
enables and frequency selection), while preserving the WADA bit if it was s=
et
instead of clearing it.

Does this break other features every time an alarm is set?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520-ds1307-rx8=
901-add-v2-0-e069ea32e1db@axis.com?part=3D2
