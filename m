Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794428817;
	b=eKzsTMbXMO90HNRN/kDBtrFVm1bmOy/L1z7QoCf6hP9vbI5YMfWDWuIbqNDdyjyBR5sw
	 ppWIvVgpr4s4dUMJkSxIQLR6Byfcu3U9AQJIExMDt5T8H+Vx+0y33SxZGJd/iqXLqHvFf
	 Guwmhjc86fJqKZFcqAmEvMTaODyiOE+n0WAIDRysRvv2g7e2bDiYrXzNVG0k2eLhzHtjk
	 nWb0r5SHADPH5OKSOchP/C1sDNqYgyIUmBWM0DuCFz8GpHotBfXf0IGcdaFKlB7B3O3Ql
	 2Zlw1aTgaDFd49kMsWCuJwkDWnfskRN1a1kXdsBRzSA8yZRZRCRmjwep7OemMOfAcCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794428817;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7R1hjcc3oVmaqbRsITiAXCqK9yCp7NhxN3JO1uUyq70=;
	b=30PbF7fGKBXFKHMjdAz5JYE6C16gLcBN/qdIN7WJ9t3zwYPdHHMkZK8DOxXCLl3Qz68u
	 uEFNldXa6UaDz4VmphzmUPdmgFG1JJL9jAhR/H8eZ6qQPaXDpOuC5JEvMctcqleKohpWJ
	 giSbT6+GjSd24WiDxZwEWHFv4hUM5YGnwLOQOLQNATgVfNOPEcf1oESSJla6nVjHUAcjf
	 jDS4ki7dQ9ARSQ8aVG7RPmw+C7cLOk7SXCTA8lrTxhB9jolzqdCslMP6wiEa4vllLNNqH
	 yc9W/h++3gvtt+grCIkSa8QSHseKe78JWbZc1etcGZhFr0SVGsv681Hv/Kij4Mbvg3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kLvy7Gc0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE65606A321
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 20:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kLvy7Gc0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA75C1F00A05;
	Wed, 11 Nov 2026 20:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794428817;
	bh=7R1hjcc3oVmaqbRsITiAXCqK9yCp7NhxN3JO1uUyq70=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kLvy7Gc0VkSGKze2Jg0XoiO94jGy8x2zenJvCX7vfIP2V58LYHE8ip1WljjGLEUdp
	 zOaccCgvtYBxNdI2SwZ+P9hyMA/PXK4Ep5+fny2xs9UaqjNJ52Y/gfgdLWG+4ltPdQ
	 Bud1A9mnX6usrW4IIYSK0WPD/oUdFxfcndnZcQDLC5VNT5gUwdSJ4Mqw0bsxz2rYDI
	 YkWr6Zl6krl+qmc88ixUSsAVT8sP3SKHr+Yl76qybry1yWI/0AW+q4AZRkJP3igDrO
	 GM8Of6G0AN5e165XaMaI3/uB6MU930LSf1mnvwpzLCMm8qz+IVVIOekjWAzGEDSuL6
	 XpnhmCOCPfFfA==
Message-ID: <sashiko-outbox-209664@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v15 13/13] dpll: sit9531x: model the inter-PLL
 sync line as a pair of pins
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: =?utf-8?b?ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc=?= <devicetree@vger.kernel.org>, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110202607.55744-14-arouhi@sitime.com>
References: <20261110202607.55744-1-arouhi@sitime.com>
 <20261110202607.55744-14-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 20:26:56 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential
issues to consider:
- [Medium] dpll: sit9531x: broken rollback in
  __sit9531x_intsync_disable() on write error
- [Medium] dpll: sit9531x: sticky intsync_partial in
  sit9531x_intsync_readback()
- [Medium] dpll: sit9531x: wrong INTSYNC reference check and state on
  manual/partial PLLs
- [Medium] dpll: sit9531x: sit9531x_resume() treats -ENODATA phase read
  as error
- [Medium] dpll: sit9531x: sit9531x_intsync_src_detect() clobbers
  partial state on disconnect failure
- [Low] dpll: sit9531x: lost pin notification when post-disconnect
  detect fails under conflict
--

commit dee9e16728fe17201c2262f079ff7610b8f1bd64
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>

dpll: sit9531x: model the inter-PLL sync line as a pair of pins

This commit models the internal inter-PLL sync line (INTSYNC) as an output
source pin and an input destination pin on each DPLL, adding EXT-page
source detection, enable/disable sequences, and resume state readback.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> index 8f305cc27737e..e3ce7b6cad6b9 100644
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c

[ ... ]

> @@ -2585,6 +2604,556 @@ static int sit9531x_clear_notifications(struct si=
t9531x_dev *sitdev)

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
> +	if (partial && (sitdev->intsync_src < 0 ||
> +			(sitdev->intsync_src =3D=3D src &&
> +			 !sitdev->intsync_partial))) {
> +		sitdev->intsync_src =3D src;
> +		sitdev->intsync_partial =3D true;
> +		sitdev->intsync_foreign =3D false;
> +	}
> +
> +	return 0;
> +}

[Severity: Medium]
Does sit9531x_intsync_readback() overwrite the freshly detected hardware
state whenever sitdev->intsync_partial was set before the scan?

When sit9531x_resume() calls sit9531x_intsync_readback() after power loss
and a profile reload, a pre-suspend partial state forces intsync_partial
back to true even if the reloaded profile cleanly enabled that PLL (causing
SYNCOUT to be reported as DISCONNECTED and INTSYNC destination pins as
NO_SIGNAL) or cleared all PLLs to the disable pattern (leaving intsync_src
set and blocking other PLLs from enabling SYNCOUT with -EBUSY).

In addition, in sit9531x_dpll_intsync_src_state_on_dpll_set(), when
connecting SYNCOUT fails with detect_rc !=3D 0 or owner_kept set, the error
path sets intsync_src =3D sitdpll->id and intsync_partial =3D true without
setting intsync_stale =3D true, which permanently wedges intsync_src on that
PLL.

[ ... ]

> +static int __sit9531x_intsync_disable(struct sit9531x_dev *sitdev,
> +				      u8 src_pll_idx, bool restore,
> +				      bool *owner_kept, bool *touched)
> +{
> +	bool in_window =3D false, was_enabled;
> +	u8 ext_page, val;
> +	int rc, lock_rc;
> +	unsigned int i;
> +
> +	lockdep_assert_held(&sitdev->multiop_lock);
> +
> +	if (owner_kept)
> +		*owner_kept =3D false;
> +	if (touched)
> +		*touched =3D false;
> +	if (src_pll_idx >=3D SIT9531X_NUM_PLLS)
> +		return -EINVAL;
> +
> +	ext_page =3D SIT9531X_PLL_EXT_PAGE(src_pll_idx);
> +
> +	rc =3D sit9531x_read_u8(sitdev, SIT9531X_REG_INTSYNC_GLOBAL, &val);
> +	if (rc)
> +		return rc;
> +	was_enabled =3D val & BIT(SIT9531X_INTSYNC_EN_BIT);
> +	if (touched)
> +		*touched =3D true;
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
> +
> +	rc =3D sit9531x_write_u8(sitdev,
> +			       SIT9531X_REG(ext_page,
> +					    SIT9531X_PLL_REG_DEBUG),
> +			       SIT9531X_PLL_DEBUG_UNLOCK);
> +	if (rc)
> +		goto restore_global;
> +	in_window =3D true;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(intsync_config); i++) {
> +		rc =3D sit9531x_write_u8(sitdev,
> +				       SIT9531X_REG(ext_page,
> +						    intsync_config[i].offset),
> +				       intsync_config[i].dis_val);
> +		if (rc)
> +			goto restore_global;
> +	}
> +
> +	rc =3D sit9531x_pll_small_update(sitdev, src_pll_idx);
> +	if (rc && owner_kept)
> +		*owner_kept =3D true;
> +
> +	goto relock;
> +
> +restore_global:
> +	/*
> +	 * Restore the global enable, or finish the disable if the page holds
> +	 * the disable pattern.
> +	 */
> +	if (restore && in_window) {
> +		bool off;
> +
> +		if (sit9531x_intsync_page_off(sitdev, ext_page, &off)) {
> +			if (owner_kept)
> +				*owner_kept =3D true;
> +		} else if (off) {
> +			rc =3D sit9531x_pll_small_update(sitdev, src_pll_idx);
> +			if (rc && owner_kept)
> +				*owner_kept =3D true;
> +			goto relock;
> +		}
> +	}
> +
> +	if (restore && was_enabled) {
> +		int ret;
> +
> +		ret =3D sit9531x_read_u8(sitdev, SIT9531X_REG_INTSYNC_GLOBAL,
> +				       &val);
> +		if (!ret)
> +			ret =3D sit9531x_write_u8(sitdev,
> +						SIT9531X_REG_INTSYNC_GLOBAL,
> +						val |
> +						BIT(SIT9531X_INTSYNC_EN_BIT));
> +		if (!ret) {
> +			/* The page-0 small update applies the global enable */
> +			ret =3D sit9531x_write_close(sitdev,
> +						   SIT9531X_REG_GLOBAL_UPDATE,
> +						   SIT9531X_SMALL_UPDATE_CMD);
> +			usleep_range(1000, 2000);
> +		}
> +		if (ret) {
> +			dev_warn(sitdev->dev,
> +				 "PLL%c: INTSYNC enable not put back after a failed disable: %d\n",
> +				 'A' + src_pll_idx, ret);
> +			if (owner_kept)
> +				*owner_kept =3D true;
> +		}
> +	}

[Severity: Medium]
If an I2C write fails partway through the intsync_config[] loop, does
restore_global re-enable SIT9531X_REG_INTSYNC_GLOBAL while leaving the
partially written dis_val entries in the EXT page and chan->intsync_dropped
set?

Because sit9531x_pll_small_update() was not reached, the hardware still
drives the line with the previously latched enable pattern (until a later
PLL small update latches the half-disabled registers under an active global
enable), but sit9531x_intsync_src_detect() sees a mix of en_val and dis_val
in the unlatched EXT page and sets sitdev->intsync_partial =3D true, report=
ing
SYNCOUT as DISCONNECTED and INTSYNC destination pins as NO_SIGNAL.

Conversely, when was_enabled is false (such as when disconnecting a partial
source whose EXT page already holds unlatched dis_val entries) and a write
fails before in_window is set, *owner_kept remains false and
sit9531x_intsync_src_detect() clears sitdev->intsync_src to -1 even though
the disable pattern was never latched.

[ ... ]

> @@ -4420,12 +5000,128 @@ static int sit9531x_suspend(struct device *dev)
>  static int sit9531x_resume(struct device *dev)
>  {

[ ... ]

> +	for (i =3D 0; i < sitdev->info->num_outputs; i++) {
> +		struct sit9531x_out *out =3D &sitdev->out[i];
> +		bool beyond;
> +		s64 phase_ps;
> +
> +		if (!out->routed)
> +			continue;
> +		rc =3D sit9531x_output_phase_read(sitdev, i, &phase_ps,
> +						&beyond);
> +		if (rc) {
> +			dev_warn(sitdev->dev,
> +				 "Output %u delay not read on resume: %d\n",
> +				 i, rc);
> +			out->phase_stale =3D true;
> +			outs_unread |=3D BIT(i);
> +			continue;
> +		}

[Severity: Medium]
Should sit9531x_resume() ignore -ENODATA from sit9531x_output_phase_read()
the way sit9531x_dev_state_fetch() does at probe?

When an output's PLL has an unprogrammed divider or out-of-range VCO,
sit9531x_output_phase_read() returns -ENODATA.  Setting out->phase_stale =3D
true on -ENODATA causes sit9531x_dpll_output_pin_phase_adjust_get() to fail
with -ENODATA and sit9531x_dpll_output_ntf_pending() to return false on
every poll tick, permanently blocking change notifications for that output
pin.

> diff --git a/drivers/dpll/sit9531x/dpll.c b/drivers/dpll/sit9531x/dpll.c
> index ba4ac5e7d365d..1bd2b962cdabe 100644
> --- a/drivers/dpll/sit9531x/dpll.c
> +++ b/drivers/dpll/sit9531x/dpll.c

[ ... ]

> @@ -662,6 +689,325 @@ sit9531x_dpll_output_pin_direction_get(const struct=
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

> +		hw_src =3D sit9531x_input_hw_src(SIT9531X_INTSYNC_PIN_ID);
> +		if (sit9531x_input_prio_present(sitdev, sitdpll->id, hw_src)) {
> +			NL_SET_ERR_MSG(extack,
> +				       "PLL selects INTSYNC as a reference; it cannot drive it");
> +			rc =3D -EBUSY;
> +			break;
> +		}
> +		rc =3D sit9531x_intsync_enable(sitdev, sitdpll->id, &owner_kept,
> +					     &changed);
> +		break;
> +	case DPLL_PIN_STATE_DISCONNECTED:
> +		if (sitdev->intsync_src !=3D sitdpll->id)
> +			break;
> +		rc =3D sit9531x_intsync_disable(sitdev, sitdpll->id,
> +					      &owner_kept, &changed);
> +		break;
> +	default:
> +		rc =3D -EINVAL;
> +		break;
> +	}
> +
> +	if (changed && !rc) {
> +		sitdev->intsync_src =3D state =3D=3D DPLL_PIN_STATE_CONNECTED ?
> +				      sitdpll->id : -1;
> +		sitdev->intsync_partial =3D false;
> +	}
> +
> +	if (changed)
> +		detect_rc =3D sit9531x_intsync_src_detect(sitdev);
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
> +	}

[Severity: Medium]
Does calling sit9531x_intsync_src_detect() instead of
sit9531x_intsync_readback() here lose the recorded intsync_partial state
when a disconnect fails before modifying the EXT page?

If a PLL has sitdev->intsync_partial =3D=3D true because an earlier enable =
left
en_val in the EXT page (with the global enable set) without latching via
sit9531x_pll_small_update(), and a subsequent DPLL_PIN_STATE_DISCONNECTED
request fails before unlocking the EXT page while restore_global restores
SIT9531X_REG_INTSYNC_GLOBAL (so owner_kept is false),
sit9531x_intsync_src_detect() sees all en_val with global enable set and
clears sitdev->intsync_partial to false.  The failed disconnect then flips
the pin state from DISCONNECTED to CONNECTED and sends a change
notification.

[Severity: Low]
When disconnecting a PLL under sitdev->intsync_conflict succeeds (changed &&
!rc) but the post-write sit9531x_intsync_src_detect() fails, can the pin
change notification be lost?

The changed && !rc block clears sitdev->intsync_src to -1 before
sitdev->intsync_stale =3D true is set.  If the immediate getter refresh ins=
ide
__dpll_pin_change_ntf() also fails, the later periodic retry in
sit9531x_intsync_refresh() sees sit9531x_intsync_owner() =3D=3D -1 both bef=
ore
and after sit9531x_intsync_readback() and never sets
sitdev->intsync_ntf_pending.

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
Does checking sit9531x_input_prio_present() in
sit9531x_dpll_intsync_src_state_on_dpll_set() work when the PLL uses manual
input selection, or when sitdev->intsync_partial is set?

On a manual-input PLL (chan->manual_input), reference selection uses
chan->manual_ref / chan->routed_ref rather than chan->prio_mask, and
sit9531x_dpll_intsync_dst_pin_manual_ops has no .state_on_dpll_set callback.
Checking only chan->prio_mask allows a manual PLL routing INTSYNC to drive
the line it locks to, while permanently blocking a manual PLL routing
another input if its unused priority table happens to list
SIT9531X_PRIO_SRC_INTSYNC.

Also, sit9531x_dpll_intsync_dst_state_on_dpll_get() and
sit9531x_dpll_pin_snapshot() report the INTSYNC input pin as DISCONNECTED
whenever sitdev->intsync_src =3D=3D sitdpll->id, even when
sitdev->intsync_partial is true (so SYNCOUT is also DISCONNECTED).  If the
priority table still contains INTSYNC, enabling SYNCOUT fails with -EBUSY
("PLL selects INTSYNC as a reference; it cannot drive it") while the INTSYNC
input pin is reported as DISCONNECTED.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110202607.5574=
4-1-arouhi@sitime.com?part=3D13
