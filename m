Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794930893;
	b=NlVTecC0XJoQwQGyA+Kh1YRBFLFjwCtQK6ol4UCSCKm1knI9v4hFkE4Lf8apEM90k0MF
	 GjncZ7UMmJAPZOYAaIMNV/LsSYpcv+BK7Wko2qzvDTTgVgw85otlvPIxqb8SALeUtNqGw
	 KKDMM0n/PLeA2t1Ap2rIFCgvaRts/7D0wXi290nuioliVQb0Dv4R1NNEpck39Tj5jp7c4
	 ZEzC2GO+BDSTQ78iYjWjRSp4r2IvWR3Eg9zcHDKX+qCN4EUS4DXFshNi7PuZc8D5cdfJ7
	 34zmz69HHh8sxiOSXymMrWNL+aqMQRPwUyk7YrOnfHJoHUKZHBUR2+EO6iIkRLvvW3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930893;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=TVXPXkJCON8zy29kOvsXs38GOfclV38T7lZCl46efYs=;
	b=cXjGQGGkyB8bRFyJI4z1uNrYfssjp2187eCSDT8oLQ/ksnBjTvByZFub0/iOmTNWc86D
	 7A47zNa/eV21odR7d+4o7TYorOef+b2lveos9YP0xk6rczO6OL7YmLFfK61WV4oaCAmUN
	 dP4KnDdv0fO6atPst2LkyC8fjjC6ppz0WKvfwanIoLf/MSh54Ygv+SHptJLFnoQgs6w0k
	 vueBIopO52tY79s2nI74f0z0ghBygJlG9botet/CWhQb4eeO5doPiwSh+wQELFzHxFMxA
	 5oDdBCQxVPWSc8A5LGkN4HWaQyiO3eFzgcrXEH1IQhRqoI7qc75X/oEzMqL55uYaqcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KuXXi56L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77174606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 15:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KuXXi56L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16C9A1F000C4;
	Tue, 17 Nov 2026 15:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794930893;
	bh=TVXPXkJCON8zy29kOvsXs38GOfclV38T7lZCl46efYs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KuXXi56Lq75cp/O15e4VRmaRvRv6q0b6XvwatzYbOD0YRSEaspTanL+n2IpDJqn8n
	 mtyjdumLp118s7iTRYZii7JtURDF4LVWe6cE2WoNf/bqVjzDsMZQz80+HrVVHok/60
	 ZX7yIaAkDED43tjqEgyh06qPMrx/t6Wkjzoj8lU7txNr3KYmQcugRIG/KtYlvS58ay
	 msPurex1BCcVBzqbm1TJqXTUNFIor04S4joHkHMtNJGCjF7/z+6veI9FSGwg53Z7vh
	 Nzg78qY/Lfyu18+ILZcnKSahWfoA0svFgUT8toGf7ExdK55Tss89e3rTUbMTqUavtN
	 +e4GEP1li5zQw==
Message-ID: <sashiko-outbox-219117@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 9/9] PM / devfreq: rockchip-dfi: add RK3576 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v3-9-32ff1546b0e4@collabora.com>
References: <20261117-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v3-0-32ff1546b0e4@collabora.com>
 <20261117-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v3-9-32ff1546b0e4@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 15:54:52 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] PM / devfreq: rockchip-dfi: broken LPDDR5 bank mode in
  rk3588_dfi_init()
- [Medium] devfreq: rockchip-dfi: uninitialized dmc_count read for
  RK3576 in perf events
- [Low] PM / devfreq: rockchip-dfi: fix num_clks kernel-doc in
  rockchip_dfi_variant
--

commit e9116d479abafdafaf4829a0c8f1e9fcb3fce374
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

PM / devfreq: rockchip-dfi: add RK3576 support

This commit adds RK3576 support to the Rockchip DFI driver by defining its
clock names, variant configuration, and device tree match entry.

> diff --git a/drivers/devfreq/event/rockchip-dfi.c b/drivers/devfreq/event=
/rockchip-dfi.c
> index ed28dc6446f10..91b6dd01b453c 100644
> --- a/drivers/devfreq/event/rockchip-dfi.c
> +++ b/drivers/devfreq/event/rockchip-dfi.c
[ ... ]
> @@ -888,6 +892,18 @@ static const struct rockchip_dfi_variant rk3568_vari=
ant =3D {
>  	.reg_access =3D 0x2c,
>  };
> =20
> +static const struct rockchip_dfi_variant rk3576_variant =3D {
> +	.init =3D rk3588_dfi_init,

[Severity: Medium]
Does wiring RK3576 (DDRMON v4) to rk3588_dfi_init() and
rockchip_dfi_v4_ddrtype_to_ctrl() corrupt the LPDDR5 bank mode written to
DDRMON_CTRL1?

rk3588_dfi_init() pre-shifts dfi->lp5_bank_mode by 7 bits, and
rockchip_dfi_v4_ddrtype_to_ctrl() then passes DDRMON_CTRL_LP5_BANK_MODE_MASK
(GENMASK(8, 7)) instead of DDRMON_CTRL1_LP5_BANK_MODE_MASK (GENMASK(2, 1))
to FIELD_PREP_WM16():

drivers/devfreq/event/rockchip-dfi.c:rk3588_dfi_init() {
    ...
	if (dfi->ddr_type =3D=3D ROCKCHIP_DDRTYPE_LPDDR5) {
		regmap_read(regmap_pmu, RK3588_PMUGRF_OS_REG6, &reg6);
		dfi->lp5_bank_mode =3D FIELD_GET(RK3588_PMUGRF_OS_REG6_LP5_BANK_MODE, reg=
6) << 7;
    ...
}

drivers/devfreq/event/rockchip-dfi.c:rockchip_dfi_v4_ddrtype_to_ctrl() {
    ...
	case ROCKCHIP_DDRTYPE_LPDDR5:
		*ctrl0 =3D FIELD_PREP_WM16(DDRMON_CTRL0_LPDDR23, 0) |
			 FIELD_PREP_WM16(DDRMON_CTRL0_LPDDR4, 0);
		*ctrl1 =3D FIELD_PREP_WM16(DDRMON_CTRL1_LPDDR5, 1) |
			 FIELD_PREP_WM16(DDRMON_CTRL_LP5_BANK_MODE_MASK,
					dfi->lp5_bank_mode);
		break;
    ...
}

Because FIELD_PREP_WM16() shifts its value by the mask shift and masks it,
the pre-shifted dfi->lp5_bank_mode is shifted out of the field (in
rockchip_dfi_ddrtype_to_ctrl() as well), always programming 0 for the bank
mode while setting the wrong write-enable bits in DDRMON_CTRL1 on RK3576,
which causes inaccurate DDRMON counter readings on LPDDR5 boards.

> +	.stride =3D 0x10000,
> +	.max_channels =3D 2,

[Severity: Medium]
Can pairing max_channels =3D 2 with rk3588_dfi_init() cause
rockchip_ddr_perf_event_get_count() to read uninitialized stack memory when
PERF_EVENT_READ_BYTES2, PERF_EVENT_WRITE_BYTES2, PERF_EVENT_READ_BYTES3 or
PERF_EVENT_WRITE_BYTES3 are sampled on RK3576?

In rockchip_ddr_perf_event_get_count(), total and now are declared on the
stack without zero-initialization, and rockchip_ddr_perf_counters_add()
only populates total.c[0..max_channels - 1].  Unlike rk3399_dfi_init() and
rk3568_dfi_init(), rk3588_dfi_init() unconditionally sets non-zero
dfi->buswidth[2] and dfi->buswidth[3], so reading the channel 2 or 3 byte
perf events multiplies uninitialized total.c[2..3] stack values by
blen * dfi->buswidth[2..3] and returns garbage counts.  In addition,
rockchip_ddr_perf_counters_add() reads now->c[i] without checking
dfi->channel_mask even though rockchip_dfi_read_counters() skips disabled
channels.

> +	.clk_names =3D rk3576_clk_names,
> +	.num_clks =3D ARRAY_SIZE(rk3576_clk_names),

[Severity: Low]
The kernel-doc comment for struct rockchip_dfi_variant documents @num_clk
instead of @num_clks, which triggers a scripts/kernel-doc warning under W=
=3D1
builds.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-rockchip-d=
fi-rk3588-cleanups-and-rk3576-support-v3-0-32ff1546b0e4@collabora.com?part=
=3D9
