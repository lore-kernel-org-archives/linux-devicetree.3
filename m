Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD24448FF8C
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726114; cv=none; b=QcGJ9Y+9Nk8WSwjvtvflVQAQYc4QRTXoPvwcCdcMNxyZTeBQxe1YuSyANZXxL+BOh+2e94TV73D06mVHTPS+W30iaWeLOdUggJZp6s8A/QoEguDHp3xR5Va6ZR51r4GyKvSJ/PW+CSbJdCp+tQKz0F7nUjyhTrI0pmXcMlGMw4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726114; c=relaxed/simple;
	bh=L0Il5RfHXcKKYEYpe8pCMFnRHiehJl/zL9YLykoOkp8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uT6yXKZGSBhh04svpOjXvRsSWl+hZJGa02WXJoqZUL2Rgm3/BI+WSSrPukNn25SShcbnF4oUnQuXlCHtDZLE7N2wLWR8+Yek5ikt9pDcyBJqwINWb4hNiLWGf2v/fOoY772PwZHJGJYDaYz6dUAYIXm2Jipigvwa/0HT2BQZd/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UiiEKpFb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UiiEKpFb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A3B31F000FF;
	Fri, 18 Sep 2026 10:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789726112;
	bh=JqrfH+cVuCgEoUYMXZvVT2uR4qDnORThXxtheMA1JTI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UiiEKpFb+m6qb6pS7M4O4l+pa24sO2BpP966r1J7kIrjwQHC5vbNzxM79+Ss1nkKv
	 HVOjApDiZiS046D/J2gVr/trfxCQKwxw3JKPmm93N8xPzZUby7PqzD78xetYYW7XJi
	 Q3nvK9A1/ySqbhRkZYcgI6HE2tfskEXT1pHnMD/Ev48Cf1J2pc1Tat3xSkcWRKjqc4
	 3kHABb+uuh0mTqSHh3CPfbDfUdsmYGfqVD6J95byv5LoeKn3ye8EkEyhp2cUatB9sk
	 glgO89y9irIM2BuD3uxCDjXr4MFDcOwc+1g8NDufHmGK8HDj6lEa9Nsuast10LwGiS
	 +yeAcUeqe6jew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/3] pwm: rp1: Add RP1 PWM controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrea della Porta" <andrea.porta@suse.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <22f454003902173a7230d0aee5fbd7261fcc163e.1789724999.git.andrea.porta@suse.com>
References: <cover.1789724999.git.andrea.porta@suse.com>
 <22f454003902173a7230d0aee5fbd7261fcc163e.1789724999.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 10:08:31 +0000
Message-Id: <20260918100832.0A3B31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] lockdep: recursive locking splat in rp1_pwm_read_tachometer
--

commit 2891771f3f49717037220ec4f19e7c24529f99b5
Author: Naushir Patuck <naush@raspberrypi.com>

pwm: rp1: Add RP1 PWM controller driver

The Raspberry Pi RP1 southbridge features an embedded PWM controller with 4
output channels, alongside an RPM interface to read the fan speed on the
Raspberry Pi 5. This commit adds the supporting driver.

> diff --git a/drivers/pwm/pwm-rp1.c b/drivers/pwm/pwm-rp1.c
> new file mode 100644
> index 0000000000000..cfd38e46cc589
> --- /dev/null
> +++ b/drivers/pwm/pwm-rp1.c

[ ... ]

> +int rp1_pwm_read_tachometer(struct device *dev)
> +{
> +	struct pwm_chip *chip;
> +	struct rp1_pwm *rp1;
> +	u32 tach_val;
> +	int ret;
> +
> +	if (!dev)
> +		return -EINVAL;
> +
> +	device_lock(dev);
> +
> +	chip =3D dev_get_drvdata(dev);

[Severity: Medium]
Is it safe to call device_lock() inside this exported API?

When an external consumer (like a fan driver) calls this during its probe
or remove callbacks, the driver core already holds the consumer device's
lock. When this function then calls device_lock(), it acquires the PWM
device's lock.=20

Because both locks belong to the exact same default device lock class, this
sequence triggers a lockdep recursive locking splat.

Could this access be protected using the driver's own internal
synchronization (such as rp1->lock) instead of relying on the driver core's
device_lock()?

> +	if (!chip) {
> +		ret =3D -ENODEV;
> +		goto err_dev_unlock;
> +	}
> +

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1789724999.gi=
t.andrea.porta@suse.com?part=3D2
