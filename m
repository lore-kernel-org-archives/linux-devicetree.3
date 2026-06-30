Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B623DCDB8
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 17:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782840246; cv=none; b=Pu2dyB+ye39VgUzICSkchJTP39d7Qi/Rn0VKj2gwJbwzny3iGg7digVt4z6nn685nYAPZul+g9wnAnHCPg7MSrBZhOsK7ZbfDLkK3cEBbF4A4/MVfD+esSkYPesa2FkwMpug34tFBlvjTtcjERBYGPklDtyp690+w1c4/0wiPjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782840246; c=relaxed/simple;
	bh=PZvq3gQZY/rfQQzbALQcmWvi3gNz4SMCVSV7z8TSp9U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=A/GWf2R+tJyIvZO2QZEyAFylabSddST0m328hM4ZeHze63unhBMBRFL2tDeloS1Df9V6JeYFVJRDM9ybzY+q4ie3QLOhyhEFgHd3un3SdnU4SWHV6VjiB+RZfhws3b8o5zB6aGQcsW7tU3Wz+0CxV5TxqcVnX18W+W1x/V8qKVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L4MY5OZ5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L4MY5OZ5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 546781F00A3A;
	Tue, 30 Jun 2026 17:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782840245;
	bh=w1j9NDGgLXJ38DMMQDddpEQCbPajJUYHk8qkYeNvOoU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L4MY5OZ5IDP9WR3sT0QfnlJ1UbuWqp8JlQpgx9RfsmpMRdWTtB6LHvDfls/0GjaEh
	 qHEjUoDaBGJZXzB9+szBri67B9JXFYs1+kQyLpHOkwpTJgUii2RCFuK4gizb/aXm84
	 WSV4haUS/uQza+vCIEFHFp0oK3Bp6JmIXTr9F7tGt1Y3WBz03nX8DXjxPc1Pv5xYoy
	 gwtjx1dQiLCq5i7d/ue32B8diiv1UiwfRVKAzUqeu80BsCUVSwY4Wk00RNi7dfeJTQ
	 arFoXMkfAE0EIzbC1nHGx8ojJSZDLSXu+IlhH8mC3ZZzkG7U1pJRuKbURdyQcps8PU
	 FlXQjDdkpXzFw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 13/15] onsemi: s2500: Added selftest support
 to onsemi's S2500 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal via B4 Relay" <devnull+Selvamani.Rajagopal.onsemi.com@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260629-s2500-mac-phy-support-v6-13-18ce79500371@onsemi.com>
References: <20260629-s2500-mac-phy-support-v6-0-18ce79500371@onsemi.com>
 <20260629-s2500-mac-phy-support-v6-13-18ce79500371@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 17:24:04 +0000
Message-Id: <20260630172405.546781F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Triggering WARN_ON(test_len =3D=3D 0) in ethtool_self_test() whe=
n CONFIG_NET_SELFTESTS is disabled.
--

commit 5471ef8ce8772b7b0fc98bb44681a4f8a55bbb68
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

onsemi: s2500: Added selftest support to onsemi's S2500 driver

Adds selftest support for onsemi S2500 MAC-PHY.

> diff --git a/drivers/net/ethernet/onsemi/s2500/s2500_ethtool.c b/drivers/=
net/ethernet/onsemi/s2500/s2500_ethtool.c
> --- a/drivers/net/ethernet/onsemi/s2500/s2500_ethtool.c
> +++ b/drivers/net/ethernet/onsemi/s2500/s2500_ethtool.c
[ ... ]
> @@ -229,6 +230,8 @@ static int s2500_get_sset_count(struct net_device *nd=
ev, int sset)
>  	switch (sset) {
>  	case ETH_SS_STATS:
>  		return S2500_MAC_STATS_LEN;
> +	case ETH_SS_TEST:
> +		return net_selftest_get_count();
>  	default:
>  		return -EOPNOTSUPP;
>  	}

[Severity: Medium]
Since the Kconfig uses "imply NET_SELFTESTS", it's possible for this driver
to be built with CONFIG_NET_SELFTESTS disabled. In that case, the fallback
stub for net_selftest_get_count() returns 0.

When the ethtool core processes the test ioctl, it expects the test array
length to be greater than 0. If a user runs "ethtool -t", could this 0 count
trigger the WARN_ON(test_len =3D=3D 0) in ethtool_self_test()?

Should this return -EOPNOTSUPP when tests are disabled, rather than
forwarding a 0 count?

[ ... ]
> @@ -349,5 +355,6 @@ const struct ethtool_ops s2500_ethtool_ops =3D {
>  	.get_ts_info        =3D s2500_get_ts_info,
>  	.get_regs_len       =3D s2500_get_regs_len,
>  	.get_regs           =3D s2500_get_regs,
> +	.self_test          =3D net_selftest,
>  };

[Severity: Medium]
Similarly, when CONFIG_NET_SELFTESTS is disabled, the fallback for
net_selftest is still a valid function pointer stub.

Because the driver unconditionally provides this callback, the ethtool core
will bypass its (!ops->self_test) check, proceed to query the test count,
and hit the WARN_ON mentioned above.

Would it be safer to only populate this callback assignment when testing is
actually enabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-s2500-mac-=
phy-support-v6-0-18ce79500371@onsemi.com?part=3D13
