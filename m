Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792999071;
	b=sUlMOOtMp1y2AgCDLADt6E/ffOBvUAyYXHwJMXYfRlrlQGUA6IYcaY7VLN/aartq9WZw
	 /NZ/LyfTLl6Wq2+yzT7g8/RJAwLx707zcDegJnKkVWFMTPs5ElYnFiOZT6+GSq6LjX7e6
	 DSc/ZnX1YZpYN5tikGhd/yruEHbm46e9aiPn5S1/Zov4Dsd5pLagJN9NX+IPw7RARVCNq
	 R012sBWRw4difAsXDedwRQO4cONRI8msfaecsjuki7Tiuyhlpx/LENr/+3AWzyD10Z2B3
	 ll9O+gMmsraXRImyKoAgAxd/5SYZ3nnAcwlhrQ9AiexzQL/K0FiEXRJ68t0jywWPbpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792999071;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=y7p5Rel+Z9hysuj7FBWWOKgvBbBd3SMlx98r17wIHnY=;
	b=F+AHljzuhOlH3mJiu0rfsWQ/YnFHA+n+d+8EJyrGZrPxz46yNfaKEqD0P27IvCIUkLcO
	 DRTvC3+xf4xDqLA2ycdwfAQlqb2gxs6vVQM6gKuUMQej/kjz+xGwoEBgKlX98pYoTIwQi
	 KemJl8XLIm5ejsmGzdhyJRJ5cOSc5M09rHFzG5TnaI1IQcdZ9knOgW115wScAmGSkQJId
	 cVRsvEKvDBVzOmWFhavHmRwJ+3i9Sz6WTBPrkRqVyqnk2biDNudoDlF5qdVedVkomZasZ
	 O6yjNwoIXJ8Y2nT8WYAWsfKlc9kBUsh5TK/A/qkgClA04LYVfaYy4gQJmqQgmhSltFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I3rtECH+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0929606A31A
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 07:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I3rtECH+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F255A1F01825;
	Mon, 26 Oct 2026 07:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792999070;
	bh=y7p5Rel+Z9hysuj7FBWWOKgvBbBd3SMlx98r17wIHnY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I3rtECH+edWh98ThEgXyVg2g4ROXMYxzuD+WhoZX2DVceVU1htBQ+Eyp0TYjX/ohe
	 P3jt5LiOLkZ+anvu+6s7U7WWAYi64spCTsKVi/DFeKkv/6lLU/BN+TL06sES7P+gir
	 L/P54mXeo0SOPlj4ZFsNXgU6873TNua1A/EDGHFOCJWFwCuN+jsZYC7dmHN1bU3Qyj
	 IxkVUa9CX1CNogZz4jHfYLyB6uK2SgDA3nY78DlzZYJDjEFKI+ev3085rQSl0+WVTu
	 o8YwOrbUZ+8ZGFLK7t/7ayxoetnnenjSTPGtu1kqKBmAN7BBtyKKI/4KWPPVrgONHN
	 b0R66l/EIUKYg==
Message-ID: <sashiko-outbox-184654@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] pmdomain: rockchip: Add RK3572 boot peripheral
 domains
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cunhao Lu" <1579567540@qq.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261026-add-board-ok3572-c-pmdomain-v3-2-70d614d3d921@qq.com>
References: <20261026-add-board-ok3572-c-pmdomain-v3-0-70d614d3d921@qq.com>
 <20261026-add-board-ok3572-c-pmdomain-v3-2-70d614d3d921@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 07:17:49 +0000
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
- [High] pmdomain: rockchip: rockchip_pd_power() resets active memory on po=
wer-off error
- [Medium] pmdomain: rockchip: domain left powered on when rockchip_pd_powe=
r_on() fails
--

commit fcbe7c2ac54282bfc8d75ca012934011c148704f
Author: Finley Xiao <finley.xiao@rock-chips.com>

pmdomain: rockchip: Add RK3572 boot peripheral domains

This commit adds support for the RK3572 NVM0, NVM1, PHP, and VOP power
domains, along with state tracking for incomplete power transitions and
memory resets across retries and power-off failures.

> diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/ro=
ckchip/pm-domains.c
> index e193f978d5f35..668d208dea55b 100644
> --- a/drivers/pmdomain/rockchip/pm-domains.c
> +++ b/drivers/pmdomain/rockchip/pm-domains.c

[ ... ]

> @@ -600,16 +621,13 @@ static int rockchip_do_pmu_set_power_domain(struct =
rockchip_pm_domain *pd,
>  	struct rockchip_pmu *pmu =3D pd->pmu;
>  	struct generic_pm_domain *genpd =3D &pd->genpd;
>  	u32 pd_pwr_offset =3D pd->info->pwr_offset;
> -	bool is_on, is_mem_on =3D false;
> +	bool is_on;
>  	struct arm_smccc_res res;
>  	int ret;
> =20
>  	if (pd->info->pwr_mask =3D=3D 0)
>  		return 0;
> =20
> -	if (on && pd->info->mem_status_mask)
> -		is_mem_on =3D rockchip_pmu_domain_is_mem_on(pd);
> -
>  	if (pd->info->pwr_w_mask)
>  		regmap_write(pmu->regmap, pmu->info->pwr_offset + pd_pwr_offset,
>  			     on ? pd->info->pwr_w_mask :
> @@ -620,13 +638,13 @@ static int rockchip_do_pmu_set_power_domain(struct =
rockchip_pm_domain *pd,
> =20
>  	wmb();
> =20
> -	if (is_mem_on) {
> +	if (on && pd->mem_reset_pending) {
>  		ret =3D rockchip_pmu_domain_mem_reset(pd);
>  		if (ret)
>  			return ret;
> +		pd->mem_reset_pending =3D false;
>  	}

[ ... ]

> @@ -662,18 +695,38 @@ static int rockchip_pd_power(struct rockchip_pm_dom=
ain *pd, bool power_on)
> =20
>  	rockchip_pmu_ungate_clk(pd, true);
> =20
> -	if (!power_on) {
> -		rockchip_pmu_save_qos(pd);
> +	if (power_on) {
> +		if (pd->power_state =3D=3D ROCKCHIP_PD_IDLE ||
> +		    pd->power_state =3D=3D ROCKCHIP_PD_OFF ||
> +		    (pd->power_state =3D=3D ROCKCHIP_PD_ON_RESTORE && !is_on)) {
> +			/* A failed reset may still be forcing memory off. */
> +			pd->mem_reset_pending |=3D pd->info->mem_status_mask &&
> +				rockchip_pmu_domain_is_mem_on(pd);
> +			pd->power_state =3D ROCKCHIP_PD_ON_HW;
> +		}

[Severity: High]
Can this power-cycle and corrupt the memory of an active domain when
recovering from a failed power-off in rockchip_pd_power_off()?

When genpd powers off a domain via
rockchip_pd_power_off() -> rockchip_pd_power(pd, false), pd->power_state is
set to ROCKCHIP_PD_OFF before calling rockchip_pmu_set_idle_request(pd, tru=
e)
and rockchip_do_pmu_set_power_domain(pd, false):

	} else {
		if (pd->power_state =3D=3D ROCKCHIP_PD_IDLE)
			rockchip_pmu_save_qos(pd);
		pd->power_state =3D ROCKCHIP_PD_OFF;

		/* if powering down, idle request to NIU first */
		ret =3D rockchip_pmu_set_idle_request(pd, true);
		if (ret < 0)
			goto out;

		/* Cancel a pending power-on even if its status is still off. */
		ret =3D rockchip_do_pmu_set_power_domain(pd, false);
		if (ret < 0)
			goto out;
	}

If rockchip_pmu_set_idle_request(pd, true) fails (for example, timing out
while waiting for NIU idle ack or idle status), rockchip_pd_power(pd, false)
jumps to out without calling rockchip_do_pmu_set_power_domain(pd, false). T=
he
domain and its memory remain powered on (is_on =3D=3D true and
rockchip_pmu_domain_is_mem_on(pd) =3D=3D true), the bus is not idle, and
pd->power_state is left at ROCKCHIP_PD_OFF. The same state occurs if
rockchip_do_pmu_set_power_domain(pd, false) times out while the domain is
still on.

rockchip_pd_power_off() then immediately calls rockchip_pd_power(pd, true) =
to
restore the domain:

	ret =3D rockchip_pd_power(pd, false);
	if (ret) {
		/* genpd still considers the domain on after a failed power-off. */
		err =3D rockchip_pd_power(pd, true);

In rockchip_pd_power(pd, true), because pd->power_state =3D=3D ROCKCHIP_PD_=
OFF is
not gated on !is_on (unlike ROCKCHIP_PD_ON_RESTORE && !is_on, or
ROCKCHIP_PD_IDLE where is_on is guaranteed false due to the early return at
the top of rockchip_pd_power()), rockchip_pmu_domain_is_mem_on(pd) evaluates
to true because the domain never powered off.

This sets pd->mem_reset_pending =3D true and transitions pd->power_state to
ROCKCHIP_PD_ON_HW, causing rockchip_do_pmu_set_power_domain(pd, true) to ca=
ll
rockchip_pmu_domain_mem_reset(pd) and forcibly power-gate off and reset the
memory via mem_pwr_offset on a live domain that was never powered down.

> +
> +		/* A status bit alone does not prove the low-level sequence finished. =
*/
> +		if (pd->power_state =3D=3D ROCKCHIP_PD_ON_HW) {
> +			ret =3D rockchip_do_pmu_set_power_domain(pd, true);
> +			if (ret < 0)
> +				goto out;
> +			pd->power_state =3D ROCKCHIP_PD_ON_RESTORE;
> +		}
> +	} else {
> +		if (pd->power_state =3D=3D ROCKCHIP_PD_IDLE)
> +			rockchip_pmu_save_qos(pd);
> +		pd->power_state =3D ROCKCHIP_PD_OFF;
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
> +		/* Cancel a pending power-on even if its status is still off. */
> +		ret =3D rockchip_do_pmu_set_power_domain(pd, false);
> +		if (ret < 0)
> +			goto out;
> +	}
> =20
>  	if (power_on) {
>  		/* if powering up, leave idle mode */
> @@ -681,8 +734,14 @@ static int rockchip_pd_power(struct rockchip_pm_doma=
in *pd, bool power_on)
>  		if (ret < 0)
>  			goto out;
> =20
> +		ret =3D rockchip_pmu_wait_firewall(pd);
> +		if (ret)
> +			goto out;
> +
>  		rockchip_pmu_restore_qos(pd);
> +		pd->mem_reset_pending =3D false;
>  	}
> +	pd->power_state =3D ROCKCHIP_PD_IDLE;

[Severity: Medium]
What happens to the hardware domain state and external supply regulator if
rockchip_pd_power(pd, true) fails in the restoration stage?

In rockchip_pd_power(pd, true), rockchip_do_pmu_set_power_domain(pd, true)
powers on the domain in the PMU, informs TF-A via ROCKCHIP_SLEEP_PD_CONFIG =
to
keep the domain on during sleep, and sets pd->power_state to
ROCKCHIP_PD_ON_RESTORE.

If rockchip_pmu_set_idle_request(pd, false) or rockchip_pmu_wait_firewall(p=
d)
subsequently fails, rockchip_pd_power(pd, true) jumps to out and returns an
error to rockchip_pd_power_on():

static int rockchip_pd_power_on(struct generic_pm_domain *domain)
{
	struct rockchip_pm_domain *pd =3D to_rockchip_pd(domain);
	int ret;

	ret =3D rockchip_pd_regulator_enable(pd);
	if (ret < 0)
		return ret;

	ret =3D rockchip_pd_power(pd, true);
	if (ret)
		rockchip_pd_regulator_disable(pd);

	return ret;
}

Because rockchip_pd_power_on() returns an error, genpd keeps the domain in
GENPD_STATE_OFF and will not call rockchip_pd_power_off() unless a consumer
later succeeds in powering the domain on. This leaves the PMU domain powered
on (and un-idled if rockchip_pmu_wait_firewall(pd) failed) while genpd
considers it off, and for domains with need_regulator set,
rockchip_pd_regulator_disable(pd) disables the external supply regulator
while the PMU power switch is still on and pd->power_state is
ROCKCHIP_PD_ON_RESTORE.

Should rockchip_pd_power_on() (or the error path of rockchip_pd_power())
power down the PMU domain before disabling the regulator and returning the
error to genpd?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026-add-board-=
ok3572-c-pmdomain-v3-0-70d614d3d921@qq.com?part=3D2
