Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270B9273D9F
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 05:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780810985; cv=none; b=HOpW3Hhxbh05endEueAFy8s56Uzpz+l9lcyIcueqGixmHKTO8OMV0+oGjA1hBhB0Zchs8x0js8HjkNtml3jQEp+yB8Fbrg5Z9bm+RsCVRIDC1fhTRM+KxvD2/+aor6Wgmm3qfxINr1dY9Vj05wEiGH4Y6wGzXsvLfcBBEYr+b0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780810985; c=relaxed/simple;
	bh=UJGBaVzc9B7BEexe6oga8CqEkD0bpJx2fuSlFbMIEyI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sfU8uL7O0PTWRoI9JmIpVo+Dko9Pjuew940AJ1MQlGnNSKt5f5vT0MwxqSpo4fcSiBJfAZjv5lGD/QPfnW7SGPk5WqCquMXnC3BXixbl8cvJQ8uoMMAqi7OAWE9Y4dgvCPXgKaJIo18MzOqQaRDm5OklfaDLqqnZpfsn0wksXto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fGoSzgBb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fGoSzgBb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF1E71F00898;
	Sun,  7 Jun 2026 05:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780810984;
	bh=KygGeQKMq1uKxIXL7puHDiBqd89iPrxNxPK5zcG0TZ0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fGoSzgBbiUZdm58V7nFvb0ta3LN+SUZCtVFJVrJzINzemeLKXDv2+lY6ii5U/anr3
	 435WG6rZhb78XvjI3AtQcL0I5kpDUm9sItVIWZ0zoGQy6lSky4t9N5sGljYrGcFV35
	 8Z0rWYyzRoO2opRpVVpuTXzk6O1FG5EJriFLHes9l0+HsWvIgTRBtR/7piHywGKwmZ
	 QwVy8GempLFXqKzKMDNDdb+Bpt2gEGrFnC21GR1nxEcSCVNbto8zqlywnAEKMRzn/Y
	 Xfzo+l+EwO+tl0osH/pa0L17R6heXcp8J0pehIxAX2RD7C9PvNhNq+B8PCeqzobE0h
	 /reHBuMQ+q/Vg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 14/16] onsemi: s2500: Added selftest support
 to onsemi's S2500 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal via B4 Relay" <devnull+Selvamani.Rajagopal.onsemi.com@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260605-s2500-mac-phy-support-v4-14-de0fbc13c6d8@onsemi.com>
References: <20260605-s2500-mac-phy-support-v4-14-de0fbc13c6d8@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 07 Jun 2026 05:43:03 +0000
Message-Id: <20260607054303.BF1E71F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Returning 0 for ETH_SS_TEST string count when CONFIG_NET_SELFTES=
TS is disabled causes a kernel warning in ethtool core.
--

commit 5ea6a572f13e01c7caded35e30044420828ea41e
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

onsemi: s2500: Added selftest support to onsemi's S2500 driver

This commit splits the selftest support into a separate patch for the ease
of review.

> diff --git a/drivers/net/ethernet/onsemi/s2500/s2500_ethtool.c b/drivers/=
net/ethernet/onsemi/s2500/s2500_ethtool.c
> index 85bd8ea50dd8c..334fac71ddea2 100644
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

[Severity: Medium]
Will this cause a warning in the ethtool core if CONFIG_NET_SELFTESTS is
disabled?

When CONFIG_NET_SELFTESTS is disabled, net_selftest_get_count() returns 0.
If s2500_get_sset_count() returns 0 for ETH_SS_TEST, userspace requests
like ETHTOOL_TEST will pass a test length of 0 to the ethtool core.

The ethtool core function ethtool_self_test() expects a positive count and
triggers a warning (WARN_ON(test_len =3D=3D 0)), which can crash systems wi=
th
panic_on_warn enabled.

Should this fall back to returning -EOPNOTSUPP when the test count is 0?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605-s2500-mac-=
phy-support-v4-0-de0fbc13c6d8@onsemi.com?part=3D14
