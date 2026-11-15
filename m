Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739516;
	b=v+meDL8pju2uD5+9OxPfcWmktpTEXIKe8+PwSlWmyDSiMYMT6BI9t2II0wQDosY4pstY
	 G5ohuKsr9L50XHukydwk+upgciCKSiOhdC8+osdlMfehIThU2+x7r0Ycmy8AAyny8aMiz
	 YDQvucHtdDk8PwKuXA27q+R1+lJb6IhQhnjV+s2ZqYzBCY352qesXnANIHXLYce1nLbg5
	 mNkXIL0RsC1WPRb+n+b5hP+saSbsc97DZ+SAhLSFsqtlV4dC7VmqTg9p2dMcGLn8DgJcU
	 QXYcaYzbWZdRaCnHDqPBtgkl+Rd3hHk8Q5P5oSMK+zXEMueBrEK4+oXEVfxKfo2ENWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739516;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=D19osf8aOrEL1uluqb9Ouf5DgkDghQexl55rQ26aNCU=;
	b=LbpWcpfJowslAvUM+kBSahki8LKDjPlpQ5pn6mVqPo6O6fqzj+SjJipzfJqOmlNhIB0B
	 ufaSvcWAWnGDezmKX6hRda/6URIm3RHoWsTzO5WD8IvjvjTF/EeV+lTQI1/jOSGBc15+Y
	 3Y9xYStXHLgknqLhInHCyv3VomM1NzpgKErikIFG3yXVC53NyEQzho1XPsMDzcZ3nglPQ
	 DdVCsFHAvjnyROWFQUyygOtHD3WNwDI9DqlcMWzEJwo9OHXc8ur8jSMeW8stthM+rIdUa
	 QeJfwfqvRxcnYMaxSKh87ItsdXSPZTpqlSBz9F7GF/3KlydxJ5VwsAe3zoY4RRHXizg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B706vPfY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B26606A338
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 10:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B706vPfY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E188F1F000CB;
	Sun, 15 Nov 2026 10:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739516;
	bh=D19osf8aOrEL1uluqb9Ouf5DgkDghQexl55rQ26aNCU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B706vPfY4uzFYdBulfU+EnelVu7iyyvxqciHvVFxfsrM+MBgF1u0hvvmSB+CXZLEm
	 ItrfJYXwbfQ5O/RKXSZRRYc/s0w7AHLu//JkuS1QmPLl5r7BMLwJz4mXIT6CKlvTBz
	 G6KfL3kVpVxrqzOzEZCVmlycq1842sRRtQLmghQlwY5nHddxsa5z9rqVpHQD3zl5ig
	 D0NnW4EV92f7NZMMkvm/1l5RmXh+qdHX9W3iKY8pe/wAbbrK5/fVd9fWJPZnjkC8+J
	 vkCsSSArM0pc9/ljmbh9Yl9ZGEZIP7Qxn/w4idR/uMYgxQJE9uFItO+Op2BrBRdHoj
	 7QT8s/QylXvPA==
Message-ID: <sashiko-outbox-215397@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v20 06/15] net: phylink: make phylink_validate
 state locked
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261114104426.235620-7-ansuelsmth@gmail.com>
References: <20261114104426.235620-1-ansuelsmth@gmail.com>
 <20261114104426.235620-7-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 10:45:15 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] net: phylink: lock order inversion between state_mutex and
  phy->lock in phylink_validate_mask()
--

commit 15371468f04d0bb04d8068bf4c41584df2589e40
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: make phylink_validate state locked

This commit acquires pl->state_mutex in phylink_validate() and
phylink_validate_mask(), adds unlocked __phylink_validate() and
__phylink_validate_mask() helpers, and asserts that pl->state_mutex is held
in the inner validation functions.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 8a0e87a9062f8..d1bd7109c5668 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c

[ ... ]

> @@ -667,14 +674,30 @@ static int phylink_validate_mask(struct phylink *pl=
, struct phy_device *phy,
>  	return phylink_is_empty_linkmode(supported) ? -EINVAL : 0;
>  }
> =20
> -static int phylink_validate(struct phylink *pl, unsigned long *supported,
> -			    struct phylink_link_state *state)
> +static int phylink_validate_mask(struct phylink *pl, struct phy_device *=
phy,
> +				 unsigned long *supported,
> +				 struct phylink_link_state *state,
> +				 const unsigned long *interfaces)
> +{
> +	int ret;
> +
> +	mutex_lock(&pl->state_mutex);
> +	ret =3D __phylink_validate_mask(pl, phy, supported, state, interfaces);
> +	mutex_unlock(&pl->state_mutex);
> +
> +	return ret;
> +}

[Severity: High]
Does taking pl->state_mutex in phylink_validate_mask() invert the lock order
against phy->lock?

When phylink_bringup_phy() -> phylink_validate_phy() validates a PHY with
non-empty phy->possible_interfaces, __phylink_validate_mask() ->
phylink_validate_one() calls phy_get_rate_matching() under pl->state_mutex,
which takes phy->lock if the PHY driver implements .get_rate_matching:

drivers/net/phy/phy.c:phy_get_rate_matching() {
	...
	if (phydev->drv->get_rate_matching) {
		mutex_lock(&phydev->lock);
		ret =3D phydev->drv->get_rate_matching(phydev, iface);
		mutex_unlock(&phydev->lock);
	}
	...
}

Elsewhere in phylink (including later in phylink_bringup_phy(),
phylink_resolve(), and phylink_phy_change()), phy->lock is acquired before
pl->state_mutex, creating an ABBA deadlock and lockdep splat:

CPU0                              CPU1
----                              ----
lock(&pl->state_mutex)
                                  lock(&phy->lock)
lock(&phy->lock)
                                  lock(&pl->state_mutex)

 *** DEADLOCK ***

CPU0: phylink_bringup_phy() -> phylink_validate_phy() ->
      phylink_validate_mask() -> __phylink_validate_mask() ->
      phylink_validate_one() -> phy_get_rate_matching()
CPU1: phy_state_machine() -> phylink_phy_change()

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114104426.2356=
20-1-ansuelsmth@gmail.com?part=3D6
