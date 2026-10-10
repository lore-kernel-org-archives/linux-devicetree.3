Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192353B5301
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 17:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791652354; cv=none; b=aKYASX1x1IzGBzvQdQxi+OQrGsB9cOjwPT6rirHCwDU9XTNcV9j6+Mk3Cg2eZldvFplfGacg58QKhroJSJ3XVTalt1B5/OuJuNQmD7ToYyk52Hdu6UTRHQ6zoJSTF91oc8KzA2SZy4b1v4AfzwtrhRHhj6AZm4txLxNOJxe+KU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791652354; c=relaxed/simple;
	bh=JrOKYS2NUzO60brZuDd1/71X4DlkTEl1D8G6vqDX8l0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=LcjWwygGfyvtF9O3qjQHFqELVvopFoTaVod/T4gaRFrVFeSlHoNMcI7qlxlc4CfKFHTNVMKnZcBAoPRpD0cSC+r4iWnfpDao+Kz+ovzpqyYdHPwTAbr1zgGQmwHln2j+1oJvwITUCDuoV2rLBk9vF3EE3mhiZgGaNq9fdn6c+Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Re9RxJDw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Re9RxJDw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 635561F00893;
	Sat, 10 Oct 2026 17:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791652352;
	bh=/upRx3nMm0V4wPSxOdoN2gvmbzriISiamC8vCl9mDcc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Re9RxJDwX+RR+/+0cnsw7wwjyMa911caOXPJf7J/BLTocIqZBM1sXthZ3Ka7VNG/E
	 t2HHdmqqHbJCMBewBdkiaFzSFbyZVskM2vNP+n7riBHtk+dCmBkvRue7JF7jt3EhNH
	 xSI1rf1tAHbZESF8WdlaUPZ5qzDcRQZgOQDhXg7/Oetxx9hIu12wzBrYTfjhxmJH50
	 EABSvPRQpLSMLRIoq48GNy0z27BRpjBzQj706BMsTGB8iF3kfUERWW7kmu0AkaVHnz
	 vzCsSbc1D5Gf4NEylROaeO5SJlbkiz/Suv9rauC28viCGF3r21byXGzrRGHxusUJya
	 f7Bv6GhqvDnqw==
Message-ID: <sashiko-outbox-166768@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v9 09/11] onsemi: s2500: Added selftest support
 to onsemi's S2500 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal" <Selvamani.Rajagopal@onsemi.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261009-s2500-mac-phy-support-v9-9-dcefe1d0bf0d@onsemi.com>
References: <20261009-s2500-mac-phy-support-v9-0-dcefe1d0bf0d@onsemi.com>
 <20261009-s2500-mac-phy-support-v9-9-dcefe1d0bf0d@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 17:12:31 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] ethtool: user-triggerable WARN_ON panic via ethtool_self_test() =
when selftests disabled
--

commit 78898d3de4f452382c12b216accf732a736db328
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

onsemi: s2500: Added selftest support to onsemi's S2500 driver
   =20
Adds selftest support for onsemi S2500 MAC-PHY. Added as a separate
patch for the ease of review.

> diff --git a/drivers/net/ethernet/onsemi/s2500/s2500_ethtool.c b/drivers/=
net/ethernet/onsemi/s2500/s2500_ethtool.c
> index 062cab9460dcf..12e59e8d44a62 100644
> --- a/drivers/net/ethernet/onsemi/s2500/s2500_ethtool.c
> +++ b/drivers/net/ethernet/onsemi/s2500/s2500_ethtool.c
[ ... ]
> @@ -201,6 +202,8 @@ static int s2500_get_sset_count(struct net_device *nd=
ev, int sset)
>  	switch (sset) {
>  	case ETH_SS_STATS:
>  		return S2500_MAC_STATS_LEN;
> +	case ETH_SS_TEST:
> +		return net_selftest_get_count();

[Severity: Medium]
Will this return 0 when the selftests configuration is disabled?

When selftests are disabled, net_selftest_get_count() returns 0. However,
the ops->self_test pointer remains non-NULL because net_selftest is
instantiated as an empty static inline function.

When an administrator issues ethtool -t to trigger self-tests,
ethtool_self_test() notices ops->self_test is non-NULL. It queries
ops->get_sset_count(), receives a length of exactly 0, and proceeds to hit a
WARN_ON:

net/ethtool/ioctl.c:ethtool_self_test() {
    ...
	test_len =3D ops->get_sset_count(dev, ETH_SS_TEST);
	if (test_len < 0)
		return test_len;
	WARN_ON(test_len =3D=3D 0);
    ...
}

If the system is booted with panic_on_warn, this could allow a local user
with net admin capability to intentionally crash the kernel.

Should the driver check the return value of net_selftest_get_count() and
explicitly return -EOPNOTSUPP if it evaluates to 0?

>  	default:
>  		return -EOPNOTSUPP;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-s2500-mac-=
phy-support-v9-0-dcefe1d0bf0d@onsemi.com?part=3D9
