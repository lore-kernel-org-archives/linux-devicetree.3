Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEFD23EAAA
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 12:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785502097; cv=none; b=WKSejVEe1JKHL+9JFgCoLSA5Y/lUC3CvGvcJF2net7sFdcHG/ccpa7FfLXqfeThyDHw7gswgNXsqJ+YBgnI24dAi3WI7Eemv9Ba6iFtlRLsvnhhDBLz9BbIKKyNdtL9o/L61jZM5aQ/X28jPT1+rUGS0x/PoWFJ6TUNPcuz8QMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785502097; c=relaxed/simple;
	bh=bsa0t8obpIrdC1231wh9KHSGZBQqqI1kvreoXpV5HGw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lK0Uz8nkUXEoyaoh9gCcUaiq2wwCK5/mj2jk7Ba8O+95zINQ1iYHKsxEako97AJwhFKiWfHlsHAckaA/SvVcZBUHv9CwIN8JF0lSpbYwSV6oMbEmYGm+D85mdoE049Av6Qp7JJvnacCG3A3jtmxaM+1TOAzYxzEtVxsiGLPFWdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G/1MY9rD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G/1MY9rD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97F9D1F00A3A;
	Fri, 31 Jul 2026 12:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785502095;
	bh=suhU/skwUWLRnBA5QWz03mUs+Y4vrybF/YwLUBsvZKk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G/1MY9rD+DxD63F8ICjVUpADRodHOrx48KYw7+YyD9UPI3xJXc0RY9Pg2UH+g0atW
	 LIWj4rRv3jgZZSVZAu+CfKDKdNdiQWd9Ymw7S1ov6d6sIIcxGKe1oVp2lLKtP5+Fqk
	 RJSROeeLo0qYQETHII4p4txp21pwmYckUskwwvLwuevkY1yAjzEiu8xlsqyyPuZRwL
	 2gOacB/Lw4A+Rbg3a7P24HTpLkaLewFAAPgbzc77tzmOkylIiiKtfKOzQ3+0J4tG6l
	 oYX6w5gGz42vWpJ5kGsm1toUxeCBx6cLCCFJ6c+P8pD1lfYxhvj7ag8dLmHtARSYDQ
	 KpFPbgNAU7Xbg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v10 03/11] net: phylink: add
 phylink_release_pcs() to externally release a PCS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260730102444.1967900-4-ansuelsmth@gmail.com>
References: <20260730102444.1967900-1-ansuelsmth@gmail.com>
 <20260730102444.1967900-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 12:48:15 +0000
Message-Id: <20260731124815.97F9D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] phylink_release_pcs() unconditionally calls phylink_link_down(), l=
eading to unbalanced and duplicate mac_link_down() calls if the link is alr=
eady down.
- [Medium] The polling timer `pl->link_poll` is stopped using non-synchrono=
us `timer_delete()`, allowing it to leak and endlessly poll if racing with =
the timer callback.
- [Low] Missing WRITE_ONCE() when updating pl->pcs to NULL, causing a data =
race with concurrent readers.
--

--- Patch [3]: [PATCH net-next v10 03/11] net: phylink: add phylink_release=
_pcs() to externally release a PCS ---
commit ccb6652ab082daee833a77e32118d4a3d55ac68e
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: add phylink_release_pcs() to externally release a PCS

This commit adds phylink_release_pcs() to externally release a PCS from a
phylink instance. It removes the PCS from the internal list, reparses the
supported interfaces, and triggers a phylink resolve to handle the removal.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index a5e2d342a92e1..562e09d1838b0 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
[ ... ]
> @@ -917,6 +920,63 @@ static void phylink_resolve_an_pause(struct phylink_=
link_state *state)
>  	}
>  }
> =20
> +/**
> + * phylink_release_pcs - Removes a PCS from the phylink PCS available li=
st
> + * @pcs: a pointer to the phylink_pcs struct to be released
> + *
> + * This function release a PCS from the phylink PCS available list if
> + * actually in use. It also refreshes the supported interfaces of the
> + * phylink instance by copying the supported interfaces from the phylink
> + * conf and merging the supported interfaces of the remaining available =
PCS
> + * in the list and trigger a resolve.
> + */
> +void phylink_release_pcs(struct phylink_pcs *pcs)
> +{
[ ... ]
> +	/*
> +	 * Check if we are removing the PCS currently
> +	 * in use by phylink. If this is the case, tear down
> +	 * the link, force phylink resolve to reconfigure the
> +	 * interface mode, disable the current PCS and set the
> +	 * phylink PCS to NULL.
> +	 */
> +	if (pl->pcs =3D=3D pcs) {
> +		phylink_link_down(pl);

[Severity: High]
Could this call phylink_link_down() when the link is already down?

If phylink_release_pcs() is called while the link is already administrative=
ly
or physically down, we might invoke mac_link_down() a second time. Other
phylink core functions protect against this by checking pl->old_link_state
before tearing down the link:

    if (pl->old_link_state) {
        phylink_link_down(pl);
        pl->old_link_state =3D false;
    }

Will calling mac_link_down() twice cause unbalanced reference counts or
disable clocks multiple times?

> +		pl->old_link_state =3D false;
> +		phylink_pcs_poll_stop(pl);

[Severity: Medium]
Does this leave the link_poll timer running if it races with the timer
callback?

Looking at phylink_pcs_poll_stop(), it stops the timer using a
non-synchronous timer_delete():

static void phylink_pcs_poll_stop(struct phylink *pl)
{
    if (pl->cfg_link_an_mode =3D=3D MLO_AN_INBAND)
        timer_delete(&pl->link_poll);
}

If phylink_release_pcs() runs concurrently with the timer callback on
another CPU, timer_delete() returns immediately. The timer callback
unconditionally re-arms itself with mod_timer(), which would allow the
timer to run indefinitely after the PCS is removed.

Should this use timer_delete_sync() or otherwise ensure the timer is fully
stopped?

> +		phylink_pcs_disable(pl->pcs);
> +
> +		pl->force_major_config =3D true;
> +		pl->pcs =3D NULL;

[Severity: Low]
Should this update to pl->pcs use WRITE_ONCE()?

phylink_pcs_change() reads pl->pcs locklessly from asynchronous contexts:
       =20
    if (!pl || READ_ONCE(pl->pcs) !=3D pcs)

Doing a plain store here could cause a data race with concurrent readers
and trigger KCSAN warnings.

> +	}
> +
> +	mutex_unlock(&pl->state_mutex);
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730102444.1967=
900-1-ansuelsmth@gmail.com?part=3D3
