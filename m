Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6ED9410D09
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542895; cv=none; b=Z3NNSZOGOj/OLKc21LxwvRqe6WpBI6G+zYBPUrxSGDvfeH7FnafIppxlVqgq+UfwBtF4fcznazhR2tMPUy7xHuRXNGWhA2H4pRTKWNZCsFDn7ovJ0aRTIhxafSM3ASGGwa5AWmddAvsSfRQ+VxCuQCYg1Ey132eLeIADQ7Egu08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542895; c=relaxed/simple;
	bh=dngFGyCqtcPVoBuIfF83Utc+655ML0pAMyWr+K36zIM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fvSD9n2nJtVCBPGID91DFQJu6PD3XQJNL4tdyCnqrjfh62JhbavHZ3N5O1KVFPTyuhbACJvppHnPz83bW+C3HweHPJwiDy5iW4OUxodQz5wPCE9t+PF+OF4p50umbH8VUqvVhYYCwlQIro+2EmRUBNg8IZ47T9ILkcOe1lohfv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M09rdxgW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M09rdxgW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 978981F000E9;
	Mon, 15 Jun 2026 17:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781542894;
	bh=V8f2evove69pZ/88/th0PTytX1l84cKSyD/WZuQJBvY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M09rdxgW3RDBNBEEQx+EeA6Tj8GykWTDsKDwpeTubuac7J/J9GqD87cRAkBsw08+8
	 1XwDb/g00zExRBbO28LjcL3f41Duk4X8p7uAae9RAFKSPzC6IHdG6xM6LlyuH0slHd
	 yxaUP8aEkjYmQrkuZ8yB7iMqiU5hEIQfNgxn7bMRrKOFCMNZKDg8hvr3ee+RUnbeY4
	 XwwY7sfUhHVilQrhwv7i5USdQMwJDj0UdFQg10kGrRXixilYDz6vCRwZxnJW+HyA7T
	 plBWT7PamLV7CPfuJJK23TrqZW1VFqv8sAxjCE+iF4RfbJiUHm1uH7ugEg1b6BwPxc
	 hEe15/ene3FNQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 13/15] onsemi: s2500: Added selftest support
 to onsemi's S2500 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal via B4 Relay" <devnull+Selvamani.Rajagopal.onsemi.com@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260614-s2500-mac-phy-support-v5-13-89874b72f725@onsemi.com>
References: <20260614-s2500-mac-phy-support-v5-13-89874b72f725@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 17:01:32 +0000
Message-Id: <20260615170133.978981F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Returning 0 from `get_sset_count` for `ETH_SS_TEST` triggers a `=
WARN_ON` in the ethtool core when `CONFIG_NET_SELFTESTS` is disabled.
--

commit 8adb07a1816e950bf0dedebd55b13b3a9497928e
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

onsemi: s2500: Added selftest support to onsemi's S2500 driver

This commit introduces ethtool selftest support to the onsemi S2500 MAC-PHY
driver. It exposes selftests by handling the ETH_SS_TEST stringset and
registering the self_test callback in the ethtool operations.

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
When CONFIG_NET_SELFTESTS is disabled, the dummy implementation of
net_selftest_get_count() defined in include/net/selftests.h returns 0.

Because the driver unconditionally registers the .self_test callback below
in s2500_ethtool_ops:

const struct ethtool_ops s2500_ethtool_ops =3D {
	...
	.self_test          =3D net_selftest,
};

Will returning 0 from s2500_get_sset_count() trigger a WARN_ON(test_len =3D=
=3D 0)
in the ethtool core ioctl path when a user runs "ethtool -t"?

Could this check for a 0 test count and return -EOPNOTSUPP instead to avoid
the warning?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260614-s2500-mac-=
phy-support-v5-0-89874b72f725@onsemi.com?part=3D13
