Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795215515;
	b=UONmBSpwf1tk5UONk4jJ1iLxkxMWHkZHVRGrZplrGGimo+360AogXG6YhLPunVtBI7kU
	 ZwwmIj2aLJLueND2rU2k4sJeZgGfD3zF9KMFaHXfnF2gx/rI2pSUFSWHMzfsYAjlLzonD
	 qfjIORqH8F7br4afKfNPfF8iOOR1/acESKecFT3VoA9835CoOLKD/GxEGkLOOugEAMWB1
	 jkQHsEoyPM1ztIKDx4kmzSi8huAPljlJ+n1tExsfQZ9JXDGaaMU7hRDZ9oUXld0QTcP59
	 +T++fnOVZ6idraK0OHSObpj/iepMISiNB/WjOlQhWWmY8vsdOYdg+yZfuk9XXsxGk7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795215515;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=v1AmHF/PkA8DGobhxYuQNd3gd9+MvZDm9wc6SHKRrG8=;
	b=hWhoxRmhqTOeJJWAVg+HqAPWoiMYFemdwMqzauACnlovuKhLEcrxqyWCZA60UNYAdu1A
	 ADIpSnMIlUdP6zVcq+qYoYnPZ+kO37olH86kXjUpieCHApICG9QTZlnfXBRaZh//zvmMt
	 o/P9NdHe49TzrOzh99hqIV/bwcptAWtwT4jY4GGXTVPfBbphpFHwguKHc9Ri76K2GCFRc
	 /Jb63+2yfY+11YfwUTOfsBZAAgIOtExDHYGcxKiVr/uCgDEwx+EVVy0JiNB3M+IzH9C62
	 W4CiPxs5/mdrwuNU5PyXtMLPCHjB6IhC99kOHX//2RgVx89MOLikUdZAvn8y42+zARw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="MVajO/gF";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92552606A691
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 22:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MVajO/gF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E241F000E6;
	Fri, 20 Nov 2026 22:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795215515;
	bh=v1AmHF/PkA8DGobhxYuQNd3gd9+MvZDm9wc6SHKRrG8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MVajO/gFre8wsCJHgei5pBxsXOkPArOY0p9nLtw0YcxnuyZNB/fXOCdKMiDE/yJJE
	 VazfsKJBebN/AOdfL1PHPtSp/+fFopgPNENZO40zIRoJJSVQi38ZPf1BwSMnUxUy9l
	 z562RVTa8LAPkVnYsaQ1HTbdOIZjtjDZoRRLNulmMEEEX8W2HSGIynDgaJf1GiBOJR
	 ookB/UWeerxAXQyohmoSUxQqxp57cRIgb4T4cSmo8WauwyNNTtv1YeoQUs6dmkQE+K
	 Zkol7W4Imbm4zMmVqc6i/e8N2dvMQex9vbFYcLSFtQotnPo/z7kKWtfBuPRksDI9e7
	 y28OBOAfkSiLQ==
Message-ID: <sashiko-outbox-226329@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v16 13/13] dpll: sit9531x: model the inter-PLL
 sync line as a pair of pins
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: =?utf-8?b?ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc=?= <devicetree@vger.kernel.org>, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119225752.41846-14-arouhi@sitime.com>
References: <20261119225752.41846-1-arouhi@sitime.com>
 <20261119225752.41846-14-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 22:58:34 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [Medium] dpll: sit9531x: lost global disable error in
  __sit9531x_intsync_disable()
- [Medium] dpll: sit9531x: sticky intsync_partial in
  sit9531x_intsync_readback()
- [Medium] dpll: sit9531x: stale partial state on INTSYNC source set
  failure
- [Medium] dpll: sit9531x: hidden INTSYNC selection in
  sit9531x_dpll_pin_snapshot()
--

commit cfe63c19d5fe92b45accc9dad92f48789a062ff1
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>

dpll: sit9531x: model the inter-PLL sync line as a pair of pins

This commit models the internal inter-PLL sync line (INTSYNC) as a source
pin and a destination input pin on each DPLL, adding hardware detection,
enable/disable sequences, and resume state recovery.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> index 5ec9d2a48fcbf..ca42940796d3d 100644
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c
[ ... ]
> @@ -2620,6 +2639,574 @@ static int sit9531x_clear_notifications(struct si=
t9531x_dev *sitdev)
>  	return 0;
>  }
> =20
[ ... ]
> +int sit9531x_intsync_readback(struct sit9531x_dev *sitdev)
> +{
> +	bool partial =3D sitdev->intsync_partial;
> +	s8 src =3D sitdev->intsync_src;
> +	int rc;
> +
> +	rc =3D sit9531x_intsync_src_detect(sitdev);
> +	if (rc)
> +		return rc;
> +
> +	if (partial && !sitdev->intsync_foreign &&
> +	    (sitdev->intsync_src < 0 ||
> +	     (sitdev->intsync_src =3D=3D src && !sitdev->intsync_partial))) {
> +		sitdev->intsync_src =3D src;
> +		sitdev->intsync_partial =3D true;
> +		sitdev->intsync_foreign =3D false;
> +	}
> +
> +	return 0;
> +}

[Severity: Medium]
As reported by Jakub Kicinski on v15 [1], does sit9531x_intsync_readback()
clobber the freshly scanned hardware profile on resume whenever
sitdev->intsync_partial was set before suspend?

sit9531x_resume() calls sit9531x_intsync_readback() without clearing
sitdev->intsync_partial first.  If the reloaded hardware profile has no
INTSYNC source, sit9531x_intsync_readback() restores the stale pre-suspend
partial record, blocking other PLLs from connecting INTSYNC (-EBUSY).  If
the reloaded profile has the same PLL actively driving INTSYNC, it forces
sitdev->intsync_partial back to true, causing sit9531x_intsync_owner() to
return -1 and the source pin to report DPLL_PIN_STATE_DISCONNECTED.

Also, if INTSYNC was driven before suspend with a destination PLL locked to
it and the reloaded profile disables INTSYNC, sit9531x_resume() does not set
chan->intsync_dropped, so sit9531x_intsync_driven() continues returning true
from the pre-suspend sample until the periodic poll runs.

[ ... ]
> +static int __sit9531x_intsync_disable(struct sit9531x_dev *sitdev,
> +				      u8 src_pll_idx, bool restore,
> +				      bool *owner_kept, bool *touched)
> +{
[ ... ]
> +	rc =3D sit9531x_write_u8(sitdev, SIT9531X_REG_INTSYNC_GLOBAL,
> +			       val & ~BIT(SIT9531X_INTSYNC_EN_BIT));
> +	if (rc)
> +		goto restore_global;
> +	/* A sample taken before this write can still show a lock. */
> +	for (i =3D 0; i < SIT9531X_NUM_PLLS; i++)
> +		if (sitdev->chan[i].routed_ref =3D=3D SIT9531X_INTSYNC_PIN_ID)
> +			sitdev->chan[i].intsync_dropped =3D true;
> +
> +	rc =3D sit9531x_write_u8(sitdev, SIT9531X_REG_GLOBAL_UPDATE,
> +			       SIT9531X_SMALL_UPDATE_CMD);
> +	usleep_range(1000, 2000);
> +	if (rc)
> +		goto restore_global;
[ ... ]
> +restore_global:
> +	/*
> +	 * Finish the disable if the page holds the disable pattern; restore
> +	 * the global enable only if it still holds the enable pattern. Set
> +	 * over part of the pattern, the enable may drive the line, so it stays
> +	 * clear.
> +	 */
> +	if (restore) {
> +		bool off, on;
> +
> +		if (!in_window &&
> +		    sit9531x_write_u8(sitdev,
> +				      SIT9531X_REG(ext_page,
> +						   SIT9531X_PLL_REG_DEBUG),
> +				      SIT9531X_PLL_DEBUG_UNLOCK)) {
> +			if (owner_kept)
> +				*owner_kept =3D true;
> +			goto relock;
> +		}
> +		if (sit9531x_intsync_page_state(sitdev, ext_page, &off, &on) ||
> +		    (!off && !on)) {
> +			if (owner_kept)
> +				*owner_kept =3D true;
> +			goto relock;
> +		}
> +		if (off) {
> +			rc =3D sit9531x_pll_small_update(sitdev, src_pll_idx);
> +			if (rc && owner_kept)
> +				*owner_kept =3D true;
> +			goto relock;
> +		}
> +	}

[Severity: Medium]
If clearing SIT9531X_REG_INTSYNC_GLOBAL or latching
SIT9531X_REG_GLOBAL_UPDATE fails when the EXT page already holds the disable
pattern (off =3D=3D true, for example after an earlier partial disable or f=
ailed
enable rollback), does the "if (off)" branch overwrite rc with 0 when
sit9531x_pll_small_update() succeeds?

__sit9531x_intsync_disable() then returns 0 even though the global enable b=
it
was never cleared or latched.  In
sit9531x_dpll_intsync_src_state_on_dpll_set(), rc =3D=3D 0 clears
sitdev->intsync_partial before calling sit9531x_intsync_readback(); with the
global enable bit still set and no EXT page holding the enable pattern,
sit9531x_intsync_src_detect() sets sitdev->intsync_foreign =3D true and loc=
ks
out all future INTSYNC connects.

> diff --git a/drivers/dpll/sit9531x/dpll.c b/drivers/dpll/sit9531x/dpll.c
> index 0f2b3d446cb5f..d831bafacf107 100644
> --- a/drivers/dpll/sit9531x/dpll.c
> +++ b/drivers/dpll/sit9531x/dpll.c
[ ... ]
> @@ -652,6 +679,355 @@ sit9531x_dpll_output_pin_direction_get(const struct=
 dpll_pin *pin,
[ ... ]
> +static int
> +sit9531x_dpll_intsync_src_state_on_dpll_set(const struct dpll_pin *pin,
> +					    void *pin_priv,
> +					    const struct dpll_device *dpll,
> +					    void *dpll_priv,
> +					    enum dpll_pin_state state,
> +					    struct netlink_ext_ack *extack)
> +{
[ ... ]
> +	/* A disconnect reads back through the partial record */
> +	if (changed)
> +		detect_rc =3D state =3D=3D DPLL_PIN_STATE_DISCONNECTED ?
> +			    sit9531x_intsync_readback(sitdev) :
> +			    sit9531x_intsync_src_detect(sitdev);
> +	if (changed && rc) {
> +		if (owner_kept ||
> +		    (state =3D=3D DPLL_PIN_STATE_CONNECTED &&
> +		     (detect_rc || sitdev->intsync_src =3D=3D sitdpll->id))) {
> +			sitdev->intsync_src =3D sitdpll->id;
> +			sitdev->intsync_partial =3D true;
> +			sitdev->intsync_foreign =3D false;
> +		} else if (detect_rc) {
> +			sitdev->intsync_stale =3D true;
> +		}
> +	} else if (changed && detect_rc && sitdev->intsync_conflict) {
> +		sitdev->intsync_stale =3D true;
> +		sitdev->intsync_ntf_pending =3D true;
> +	}

[Severity: Medium]
When sit9531x_intsync_enable() or sit9531x_intsync_disable() fails, can this
error recovery leave a false partial record wedged or falsely report an
active source as disconnected?

Because setting sitdev->intsync_stale =3D true is in an "else if (detect_rc=
)"
branch, if sit9531x_intsync_enable() fails (even after a clean rollback) and
sit9531x_intsync_src_detect() also hits a transient bus error (detect_rc !=
=3D
0), the first branch sets sitdev->intsync_src =3D sitdpll->id and
sitdev->intsync_partial =3D true while leaving sitdev->intsync_stale false,=
 so
sit9531x_intsync_refresh() never re-reads the hardware.

Conversely, on DPLL_PIN_STATE_DISCONNECTED, if the very first write to
SIT9531X_REG_INTSYNC_GLOBAL in __sit9531x_intsync_disable() fails before any
register is changed and unlocking the debug window in restore_global also
fails, *owner_kept is set to true; even when sit9531x_intsync_readback()
then succeeds and sees that the PLL is still a complete, active source,
"if (owner_kept || ...)" forces sitdev->intsync_partial =3D true and emits a
notification reporting the source pin as disconnected while the PLL is still
driving the line.

[ ... ]
> +static int
> +sit9531x_dpll_intsync_dst_state_on_dpll_get(const struct dpll_pin *pin,
> +					    void *pin_priv,
> +					    const struct dpll_device *dpll,
> +					    void *dpll_priv,
> +					    enum dpll_pin_state *state,
> +					    struct netlink_ext_ack *extack)
> +{
> +	struct sit9531x_dpll *sitdpll =3D dpll_priv;
> +	struct sit9531x_dev *sitdev =3D sitdpll->dev;
> +	int rc;
> +
> +	mutex_lock(&sitdev->multiop_lock);
> +	rc =3D sit9531x_dpll_intsync_refresh(sitdev, extack);
> +	if (rc) {
> +		mutex_unlock(&sitdev->multiop_lock);
> +		return rc;
> +	}
> +	if (sitdev->intsync_src =3D=3D sitdpll->id)
> +		*state =3D DPLL_PIN_STATE_DISCONNECTED;
> +	else
> +		sit9531x_dpll_selection_state_get(sitdev, sitdpll,
> +						  SIT9531X_INTSYNC_PIN_ID,
> +						  state);
> +	mutex_unlock(&sitdev->multiop_lock);
> +
> +	return 0;
> +}

[Severity: Medium]
As reported by Jakub Kicinski on v15 [2], should
sit9531x_dpll_intsync_dst_state_on_dpll_get() (and
sit9531x_dpll_pin_snapshot()) force *state =3D DPLL_PIN_STATE_DISCONNECTED
when sitdev->intsync_src =3D=3D sitdpll->id?

When sitdev->intsync_partial is true on a PLL whose priority table or manual
selection also lists INTSYNC, both the source pin and the destination pin on
that PLL report DPLL_PIN_STATE_DISCONNECTED.  Connecting the source pin on
that PLL then fails in sit9531x_dpll_intsync_src_state_on_dpll_set() via
sit9531x_dpll_intsync_selected() with -EBUSY ("PLL selects INTSYNC as a
reference; it cannot drive it"), while hiding that the destination pin is
actually selectable (or connected in manual mode).

[1] https://lore.kernel.org/r/20261117021827.2220456-1-kuba@kernel.org
[2] https://lore.kernel.org/r/20261117021827.2220456-1-kuba@kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119225752.4184=
6-1-arouhi@sitime.com?part=3D13
