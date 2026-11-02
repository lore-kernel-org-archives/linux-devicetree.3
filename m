Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612336;
	b=IqG/9QYh2Ief5wzij/kXfybqFgt77LY5M1OXtiTWPBob2d/9Fj0L7sFt6L7GyJpfjNMf
	 0rAlOrb2DYAl6Dfc2Xl79l5wOT9FF+XIMaCruFWj5RejUcQEWvEfBSNPM4Uwcetf7kulX
	 FBc7FAnlG11lGTAgqGIUE7Yf54laB4af26e87sANTsly/YijJythHSw6zRa/J2opHTjvd
	 zPacuJMGOREwNSmcvyvxIvrZi+0LluDcPWdJKCA3PuX8hoqTI/gDE9XdAXdYzM02JLFnr
	 +O7ROseNuJdJYMPy5V4MM+VC6fBAdx9ROA0yeRKb8vr7P3eD0pMKn7n69bSunvsHphQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612336;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=X4ogHtFf4iUvwtQDYJ4IGS2A1m6nhCpeGhIG2dUNjk8=;
	b=tCtrTvfVxkSWA3oluSDspO3KZcby9YIEgOBSoIy20xIQfSwtDljeubcMuMKhyAo6/7kH
	 9nhP8o3C9VC5OzLiBcSNayqe+/4TqJ6qfYdWSByjDHNfYb6Oj1m/beL7qokLglIb48Uw+
	 z7q5ex734IS/9IIhSkXok3ChQGiZSg4ma1V+hSmATce7siZwvn2Nllr08vzTN92om+rta
	 0q/RDHQhfmkBrbKCOKkOftwj+RZDAnnUyAY9gbn/yNNpRbGCpO4PeGSU697fyP7Dq7FME
	 mth3cSSMatOU1ZoWGER/lrnbNLp7DxfomQdY9yqUQb1m705sP05aPcRoHCXPVpUMU7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fucHZp+c;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D55606A329
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 09:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fucHZp+c
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F04271F000C1;
	Mon,  2 Nov 2026 09:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793612336;
	bh=X4ogHtFf4iUvwtQDYJ4IGS2A1m6nhCpeGhIG2dUNjk8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fucHZp+cjdo51KBtr00p3ZeJvRShK5uxaCbFX5MKAs1QuE1Vq7n8J9uXFDjkIsQ+A
	 WI5C/+UO45TPstDLU9NX+uLCUPmK7tDOZlNoHBYk+6tGhMKaibu1t3zGsifkR+si/K
	 BQA6IlLDLeM40Jg0dO3eezXwxNd6yqJa0c1BZcFuW9PPZ+Xi7k8zssm5DELYxplU70
	 Uv3fVPjgQhTmrLDCSz5kfancCeNJ4zs6UBO9xQni0yN9qzxUNtbOZIYvHfuJuxDM4A
	 M9l75lyVDXa2VvmYn9ZPNIIw84zBZt1bCe2AeXcKhqLw36XsITKmOj/v0MREIsZCEd
	 nvCnk+1OD5o+Q==
Message-ID: <sashiko-outbox-193189@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/8] iio: imu: adis: Fix custom reset dispatch in
 adislib
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radu Sabau" <radu.sabau@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261102-adis16607-v5-1-4f98b0d271ac@analog.com>
References: <20261102-adis16607-v5-0-4f98b0d271ac@analog.com>
 <20261102-adis16607-v5-1-4f98b0d271ac@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 09:38:55 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] iio: imu: adis: incorrect Fixes tag and stale changelog in reset di=
spatch fix
--

commit 5c3f86b0c40a0ca82129c2f9586aae278b0f7d2a
Author: Radu Sabau <radu.sabau@analog.com>

iio: imu: adis: Fix custom reset dispatch in adislib

This commit updates __adis_initial_startup() and adis_reset() to dispatch
software resets through adis->ops->reset() rather than calling
__adis_reset() directly, and moves the sw_reset_ms settle delay out of
__adis_reset() into both callers.

>     iio: imu: adis: Fix custom reset dispatch in adislib
>    =20
>     __adis_initial_startup()'s no-reset-gpio path called __adis_reset()
>     directly instead of adis->ops->reset(), silently ignoring any driver's
>     custom reset implementation. Invisible until now since
>     adis_default_ops.reset is __adis_reset() itself. Dispatch through
>     adis->ops->reset() instead - the same bug existed in the public
>     adis_reset() wrapper, fixed here too.
>    =20
>     Move the settle-time sleep out of __adis_reset() and into both call
>     sites instead, so every reset op (default or custom) is treated
>     uniformly: adis->ops->reset() is expected to just do the write, and
>     the library always sleeps the settle time afterwards. This removes
>     the previous asymmetric "sleep here only for custom ops" special
>     case entirely.
>    =20
>     Fixes: ecb010d44108 ("iio: imu: adis: Refactor adis_initial_startup")
>     Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>
>     Signed-off-by: Radu Sabau <radu.sabau@analog.com>

[Severity: Low]
Should the Fixes tag reference the commit that introduced the custom reset
callback instead?

Commit ecb010d44108 ("iio: imu: adis: Refactor adis_initial_startup")
predates struct adis_ops (added in commit 3b29bcee8f6f ("iio: imu: adis:
Add custom ops struct")). The custom reset callback adis->ops->reset was
introduced in commit 7f15d7a7d12d ("iio: imu: adis: Add reset to custom
ops"), which added reset to struct adis_ops without updating
__adis_initial_startup() or adis_reset() to call adis->ops->reset(). Should
this use:

  Fixes: 7f15d7a7d12d ("iio: imu: adis: Add reset to custom ops")

Also, is the commit message description accurate for the current baseline
tree?

The first paragraph mentions that the issue was invisible until now, but
drivers/iio/imu/adis16550.c already defines a custom reset callback in
adis16550_ops:

static const struct adis_ops adis16550_ops =3D {
	.write =3D adis16550_spi_write,
	.read =3D adis16550_spi_read,
	.reset =3D adis16550_reset,
};

In addition, the second paragraph states that this change removes a
previous asymmetric "sleep here only for custom ops" special case, which
does not exist in the baseline code prior to this patch. Could the commit
message be updated to reflect the current tree state?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-adis16607-=
v5-0-4f98b0d271ac@analog.com?part=3D1
