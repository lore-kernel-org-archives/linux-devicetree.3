Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE0146F489
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 22:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790720740; cv=none; b=ttTr6HX6wBnG8v6HtP2EjK2eFrpZBY+tZPoj3nGh5QGvTO5nHuFvhL2Fdcz724ZST2ltGea3bPBMZjGgkzNGV/OcoPSbEtOSnW/FnNKIyqVSwODIpE8kZZC7CRzQtUq4mOeky03hVM2Ir9+1AKbJa+oSGR+MvxJEXXUJOLcC9BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790720740; c=relaxed/simple;
	bh=ZNvXlzv5DuVNo9doRRoki6uUjwWP58spH79ow76lroU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AtSpNbsloheaxnAeNaTa7ybzO/0ktbQfbAqwq5JHbZFkHGq4TyyP1pgysg5t+5N4IfIzM6VwTMPmGJnlpX1ZLCOws06JoeR/KSD+1QnJjW3GhPRFlx3EeAgnuocSxFW3+UEsUZdmqrK58fnsqj+UPIv1sba5LyP0Qnivoqu2Lw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A1cth4jZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A1cth4jZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB0BC1F00899;
	Tue, 29 Sep 2026 22:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790720739;
	bh=N7TG1G3bcQchoR/d2zNz14LIHswPKIeQn+E8UGqGyuY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A1cth4jZn283zmYC58ZIRyKH/Yzk3HOX6k8CRYjTqTHFHImOeDtfxHdOmcJYsnjJZ
	 djoQFB2cVTy3bq7t+GdCzXit4Ks3+uiZaA7MfQu9myqbOzAekTy7SfaTztkg02qsvN
	 LOcVckS9vFYUyjns/phEJ6hOYJGPbr77iAuK5acF2RvQMvJ06i9NkS8Im8FbMBZyKw
	 P+X2O/eaS2igN7/Gl7OIisBbfdgQ5xnYkP87JiuDZwKq109coDhqR7F1dDfUPaB/sX
	 kL4CNX/P5XDqYN/sGJB7bBZ1iLiBndS6Al+IuqsEYIWdim7lSWhHATCAIlP2LcimAU
	 ZruGc91dGpOjA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 11/11] onsemi: s2500: Added selftest support
 to onsemi's S2500 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal" <Selvamani.Rajagopal@onsemi.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260928-s2500-mac-phy-support-v8-11-7e011aacc309@onsemi.com>
References: <20260928-s2500-mac-phy-support-v8-0-7e011aacc309@onsemi.com>
 <20260928-s2500-mac-phy-support-v8-11-7e011aacc309@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 22:25:38 +0000
Message-Id: <20260929222538.CB0BC1F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] net: s2500: returning 0 for ETH_SS_TEST triggers kernel WARN_ON
--

commit 7e6f8dc25f867f635c1cf55921f54019505bb547
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

onsemi: s2500: Added selftest support to onsemi's S2500 driver

This commit adds selftest support for the onsemi S2500 MAC-PHY.

> diff --git a/drivers/net/ethernet/onsemi/s2500/s2500_ethtool.c b/drivers/=
net/ethernet/onsemi/s2500/s2500_ethtool.c
> index 65bbcc1c7dc8f..08e748d4b10cc 100644
> --- a/drivers/net/ethernet/onsemi/s2500/s2500_ethtool.c
> +++ b/drivers/net/ethernet/onsemi/s2500/s2500_ethtool.c
[ ... ]
> @@ -193,6 +194,8 @@ static int s2500_get_sset_count(struct net_device *nd=
ev, int sset)
>  	switch (sset) {
>  	case ETH_SS_STATS:
>  		return S2500_MAC_STATS_LEN;
> +	case ETH_SS_TEST:
> +		return net_selftest_get_count();

[Severity: Medium]
Could this trigger a kernel warning in the ethtool core when
CONFIG_NET_SELFTESTS is disabled?

When CONFIG_NET_SELFTESTS is disabled, net_selftest_get_count() statically
returns 0. The core ethtool logic in ethtool_self_test() expects a non-zero
test count and triggers a warning if it is 0:

net/ethtool/ioctl.c:ethtool_self_test() {
    ...
    WARN_ON(test_len =3D=3D 0);
    ...
}

A user with CAP_NET_ADMIN executing an ethtool test or querying ETH_SS_TEST
strings could trigger this warning, polluting the kernel log and causing a
panic if panic_on_warn is enabled.

Should this explicitly return -EOPNOTSUPP if net_selftest_get_count()
evaluates to 0?

>  	default:
>  		return -EOPNOTSUPP;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-s2500-mac-=
phy-support-v8-0-7e011aacc309@onsemi.com?part=3D11
