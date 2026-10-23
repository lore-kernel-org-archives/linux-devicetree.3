Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792766382;
	b=OjBQgd1Gnt989lNczrouPmT3YiQmV2FJDt+NY2Z3NgG5pc5cJ7QKCmKms4YIQ3V2RSG7
	 21PZ9/BbREByRlluqgT3PPcTkZwNkcsZcfo1UdqiIK9ZQeBsZX7S+si56bJ/adp7j+eng
	 PshuLDDHvGtVMik9g01OAoyLxDDZs5HGjVm2ob+U5h0IsFQoyaTZvig/fxRtDim9OYMpO
	 L6kst626wD3K3zMMbDJVMiVr0QeGO6iZ9RJSGGctaz9u+VXeDGELQumxvg6ePiFDYqwOX
	 yickn8okpYMPsNRlmvUuF4Wk3pGNlU2FgBJPH40yeGKKEPqMUxH2bU9VevMW4A7yhTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792766382;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SpcGIFTjnCDcCsVWiFHds9HiQZI7ydGk3IxBcxoF22w=;
	b=WBBH2/OjjWc5WiciBQwVID9PJUYr3t2U/PuLQ+0FSznRutwXxtY0F8/46XnNbBOJl95U
	 Ld8U9gY+Yq/fuay86iCkEcHKypivjGOr3sxBhZe95xcA14PTUoMbTyETAof4VP+RjuKYw
	 CfW9b7Rp/qHGGDUeR2yYlpvY520nq4ZrXxfOuALgqYAjtu/XUVwpBnBp3EF+Ci4xyQPGO
	 Hy36Ut2r40X4YKw0lG7fjV6CQQBmaAwTouX7XKPg8ZsOQwTiou3vSB6nOIW+J1zWyfkTb
	 0yZpPAYGdH95iEfSFEus+fpura2S9jA7U7nK9kaF4pqCNdrPqcJfJyIadzMThuQqIsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lS9BMVmI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AED606A31B
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 14:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lS9BMVmI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 043711F01825;
	Fri, 23 Oct 2026 14:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792766382;
	bh=SpcGIFTjnCDcCsVWiFHds9HiQZI7ydGk3IxBcxoF22w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lS9BMVmIqodCR8/oJHpds5jQzHY7Q7atTKiv+gdbmVjD3FHLOqYjPRcqxVOkkZYgw
	 1WjX2MsIQYnuiZ53z4jP3vkBXuEWTmSwrBHntNStWo98N19p88dIVSkxibx4/JO9sO
	 TyPPiXXOF1nV4ZUsKVoBiycuCNrQLVtCBvU1nqyV5NTFiyOeF+tYXL5D4EKQ1znUDQ
	 2fBR56xZpp95gEX/B9/wc42Umi4phXAPJL0d3h8XBtmf5QRafvjhwTZrTt5+p/GYGr
	 G5iuY/84kPX5z2sA0GOJwLUFPrZVREey6UqQnOYUeGiU3Fg7A/3plvfGg0/skUOw/I
	 7LQHgMLnLt9Fw==
Message-ID: <sashiko-outbox-182875@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] pmdomain: rockchip: Add RK3572 boot peripheral
 domains
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cunhao Lu" <1579567540@qq.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261023-add-board-ok3572-c-pmdomain-v2-2-79ddd42e92c1@qq.com>
References: <20261023-add-board-ok3572-c-pmdomain-v2-0-79ddd42e92c1@qq.com>
 <20261023-add-board-ok3572-c-pmdomain-v2-2-79ddd42e92c1@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 14:39:41 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] pmdomain: rockchip: missing state update on shutdown in rockchip_p=
d_power()
- [High] pmdomain: rockchip: broken state rollback in rockchip_pd_power()
--

commit 5eed5597863e9ca30f1c34684fba00455e4388c3
Author: Finley Xiao <finley.xiao@rock-chips.com>

pmdomain: rockchip: Add RK3572 boot peripheral domains

This commit adds support for the RK3572 NVM0, NVM1, PHP, and VOP power
domains, along with firewall status polling, inverted chain status handling,
and state tracking across power-on and shutdown retries.

> diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/ro=
ckchip/pm-domains.c
> index e193f978d5f35..00d2dcf07d58b 100644
> --- a/drivers/pmdomain/rockchip/pm-domains.c
> +++ b/drivers/pmdomain/rockchip/pm-domains.c

[ ... ]

> @@ -644,14 +661,29 @@ static int rockchip_do_pmu_set_power_domain(struct =
rockchip_pm_domain *pd,
>  	return 0;
>  }
> =20
> +static int rockchip_pmu_wait_firewall(struct rockchip_pm_domain *pd)
> +{
> +	struct rockchip_pmu *pmu =3D pd->pmu;
> +	u32 mask =3D pd->info->firewall_mask;
> +	u32 val;
> +
> +	if (!mask)
> +		return 0;
> +
> +	return regmap_read_poll_timeout(pmu->grf, pmu->info->firewall_status_of=
fset,
> +				       val, (val & mask) =3D=3D mask, 0, 10000);
> +}
> +
>  static int rockchip_pd_power(struct rockchip_pm_domain *pd, bool power_o=
n)
>  {
>  	struct rockchip_pmu *pmu =3D pd->pmu;
> +	bool is_on;
>  	int ret;
> =20
>  	guard(mutex)(&pmu->mutex);
> =20
> -	if (rockchip_pmu_domain_is_on(pd) =3D=3D power_on)
> +	is_on =3D rockchip_pmu_domain_is_on(pd);
> +	if (is_on =3D=3D power_on && pd->power_on_state =3D=3D ROCKCHIP_PD_ON_I=
DLE)
>  		return 0;
> =20
>  	ret =3D clk_bulk_enable(pd->num_clks, pd->clks);
> @@ -662,18 +694,37 @@ static int rockchip_pd_power(struct rockchip_pm_dom=
ain *pd, bool power_on)
> =20
>  	rockchip_pmu_ungate_clk(pd, true);
> =20
> -	if (!power_on) {
> -		rockchip_pmu_save_qos(pd);
> +	if (power_on) {
> +		if (pd->power_on_state =3D=3D ROCKCHIP_PD_ON_IDLE ||
> +		    (pd->power_on_state =3D=3D ROCKCHIP_PD_ON_RESTORE && !is_on)) {
> +			/* Record the reset before a failed attempt can turn memory off. */
> +			pd->mem_reset_pending =3D pd->info->mem_status_mask &&
> +				rockchip_pmu_domain_is_mem_on(pd);
> +			pd->power_on_state =3D ROCKCHIP_PD_ON_HW;
> +		}
> +
> +		/* A status bit alone does not prove the low-level sequence finished. =
*/
> +		if (pd->power_on_state =3D=3D ROCKCHIP_PD_ON_HW) {
> +			ret =3D rockchip_do_pmu_set_power_domain(pd, true);
> +			if (ret < 0)
> +				goto out;
> +			pd->power_on_state =3D ROCKCHIP_PD_ON_RESTORE;
> +		}
> +	} else {
> +		if (pd->power_on_state =3D=3D ROCKCHIP_PD_ON_IDLE)
> +			rockchip_pmu_save_qos(pd);
> =20
>  		/* if powering down, idle request to NIU first */
>  		ret =3D rockchip_pmu_set_idle_request(pd, true);
>  		if (ret < 0)
>  			goto out;
> -	}
> =20
> -	ret =3D rockchip_do_pmu_set_power_domain(pd, power_on);
> -	if (ret < 0)
> -		goto out;
> +		if (is_on) {
> +			ret =3D rockchip_do_pmu_set_power_domain(pd, false);
> +			if (ret < 0)
> +				goto out;
> +		}
> +	}

[Severity: High]
When rockchip_pd_power(pd, false) is called on an active domain with
pd->power_on_state =3D=3D ROCKCHIP_PD_ON_IDLE, it saves QoS via
rockchip_pmu_save_qos(pd), requests NIU bus idle via
rockchip_pmu_set_idle_request(pd, true), and powers down the domain via
rockchip_do_pmu_set_power_domain(pd, false).

However, the !power_on branch never transitions pd->power_on_state away from
ROCKCHIP_PD_ON_IDLE before performing these operations. If either
rockchip_pmu_set_idle_request(pd, true) or
rockchip_do_pmu_set_power_domain(pd, false) fails and jumps to out,
pd->power_on_state remains ROCKCHIP_PD_ON_IDLE.

Could this leave the domain and its saved QoS in a broken state on subseque=
nt
calls?

1. If rockchip_pd_power(pd, false) is retried while is_on is still true,
   pd->power_on_state =3D=3D ROCKCHIP_PD_ON_IDLE is still true, so
   rockchip_pmu_save_qos(pd) runs a second time while the NIU bus is already
   idled and power-down has been requested, overwriting pd->qos_save_regs.

2. If rockchip_pd_power(pd, true) is called while is_on is still true after
   rockchip_pmu_set_idle_request(pd, true) idled the NIU bus, the early exi=
t:

       if (is_on =3D=3D power_on && pd->power_on_state =3D=3D ROCKCHIP_PD_O=
N_IDLE)
           return 0;

   returns 0 immediately without calling rockchip_pmu_set_idle_request(pd,
   false) or rockchip_pmu_restore_qos(pd), leaving the NIU bus stuck in idl=
e.

3. If hardware finishes powering down (so is_on becomes false) shortly after
   rockchip_do_pmu_set_power_domain(pd, false) timed out before reaching the
   ROCKCHIP_SLEEP_PD_CONFIG SMC call, a retried rockchip_pd_power(pd, false)
   hits the same early return and skips notifying firmware.

> =20
>  	if (power_on) {
>  		/* if powering up, leave idle mode */
> @@ -681,8 +732,14 @@ static int rockchip_pd_power(struct rockchip_pm_doma=
in *pd, bool power_on)
>  		if (ret < 0)
>  			goto out;
> =20
> +		ret =3D rockchip_pmu_wait_firewall(pd);
> +		if (ret)
> +			goto out;
> +
>  		rockchip_pmu_restore_qos(pd);
>  	}
> +	pd->power_on_state =3D ROCKCHIP_PD_ON_IDLE;
> +	pd->mem_reset_pending =3D false;

[Severity: High]
What happens if rockchip_pd_power(pd, true) fails during
rockchip_do_pmu_set_power_domain(pd, true) while in ROCKCHIP_PD_ON_HW, and =
is
then followed by either a shutdown via rockchip_pd_power(pd, false) or a
retry of rockchip_pd_power(pd, true)?

In rockchip_do_pmu_set_power_domain(pd, true)->rockchip_pmu_domain_mem_rese=
t(pd):

	regmap_write(pmu->regmap, pmu->info->mem_pwr_offset + pd->info->pwr_offset,
		     (pd->info->pwr_mask | pd->info->pwr_w_mask));
	wmb();

	ret =3D readx_poll_timeout_atomic(rockchip_pmu_domain_is_mem_on, pd, is_on,
					is_on =3D=3D false, 0, 10000);
	if (ret) {
		...
		goto error;
	}

1. If rockchip_pmu_domain_mem_reset(pd) fails after writing mem_pwr_offset =
to
   gate memory off, mem_pwr_offset continues to force memory off. If
   rockchip_pd_power(pd, false) is then called, it does not clear
   mem_pwr_offset, yet unconditionally resets pd->power_on_state to
   ROCKCHIP_PD_ON_IDLE and pd->mem_reset_pending to false. On the next
   rockchip_pd_power(pd, true), rockchip_pmu_domain_is_mem_on(pd) reads fal=
se,
   so pd->mem_reset_pending is computed as false, rockchip_pmu_domain_mem_r=
eset(pd)
   is skipped, and mem_pwr_offset is never cleared, leaving the domain memo=
ry
   permanently gated off.

2. If rockchip_do_pmu_set_power_domain(pd, true) wrote pwr_offset to power =
on
   the domain and timed out while rockchip_pmu_domain_is_on(pd) was still
   false, a subsequent rockchip_pd_power(pd, false) sees is_on =3D=3D false=
 and
   skips rockchip_do_pmu_set_power_domain(pd, false), leaving the power-on
   write active in pwr_offset while resetting pd->power_on_state to
   ROCKCHIP_PD_ON_IDLE. When the hardware transition finishes and is_on
   becomes true, the next rockchip_pd_power(pd, true) returns 0 early witho=
ut
   un-idling the NIU bus, waiting for the firewall, or restoring QoS.

3. Conversely, if the domain and its memory were initially off (is_mem_on =
=3D=3D
   false) when rockchip_pd_power(pd, true) first ran, pd->mem_reset_pending=
 is
   set to false and pd->power_on_state is set to ROCKCHIP_PD_ON_HW. After
   rockchip_do_pmu_set_power_domain(pd, true) writes pwr_offset, memory pow=
ers
   on (so is_mem_on becomes true), and if polling rockchip_pmu_domain_is_on=
(pd)
   times out, a direct retry of rockchip_pd_power(pd, true) enters with
   pd->power_on_state =3D=3D ROCKCHIP_PD_ON_HW, skips re-evaluating
   rockchip_pmu_domain_is_mem_on(pd), and calls
   rockchip_do_pmu_set_power_domain(pd, true) while memory is on without
   performing the memory reset.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023-add-board-=
ok3572-c-pmdomain-v2-0-79ddd42e92c1@qq.com?part=3D2
