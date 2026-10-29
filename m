Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283528;
	b=TL7n5wCPVRAMVg+dN8zazW8cmJnV15IEglnfcHyfxGEZafe/yZE2JntaCxjqSz0LlVrB
	 8vzURR3ckOoSCgPKqZXWgV1eVBnuQE2ZwycmlwMtOSEhpVskuCPr6rBokTRUYxbtK1HfY
	 ZjggjV4e1Hy+L4JWP4Aym9GB9stpztymCuoFvPiaQj/6VWTTv548lYatUFsZusJ/vuLGp
	 PqvX6ovGUTLqiiZq9x0AyszvPg17u3rjZKZA+PtlFMirf9mny29e7r20tZZBVTNnuj0ZU
	 D9BmnL4UJihJnu6VTPqNfdBuYTqX8m82Cttja5hhWoPC9uaVD5W3+bYwnol9yv1AW/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283528;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Xb+XvScDr9AscU0Znas45piDt4bGCXtorlYsn/ftPow=;
	b=cMHaH5wdUbIA+vU564NM5+KmBxCCKmzGf5S7f0MumIUHLLdc+2y0pxSRjcU70t+Cfz9o
	 xwMDT6xp17RUJWoNvUwDIfqA23/Gz49A2xSlGvF5MM/3uzhoTkkh6KwgmIbhyQrfjlSv7
	 GhaXIarTu2DR9NWqUnKczACXYynLv9wZl/k3gRsgtQs2yR2MF5jE7P0o77mAYRF1qS8pJ
	 iO9zD0DiQqs1Wb73mDUwcO8NcGzegRB2tcV5rc+4ip7zevT1ftZCmdLCSZqrCXYbr2nRr
	 k5B1krT6x0y6nsIJKRIAMmH2foOx941I/iODr04zImlaWjic78Xn+et64/+7uDb78mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XjZGNaa1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6246360A382E
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 14:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XjZGNaa1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB2251F012ED;
	Thu, 29 Oct 2026 14:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793283528;
	bh=Xb+XvScDr9AscU0Znas45piDt4bGCXtorlYsn/ftPow=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XjZGNaa1UNmNeGRnedyAIcxhnJNwKduk0GK5AoRYmQW3xQt1UPf/GTV/akNCz3pQh
	 xoyTijdhqxGkLBXgrACwAyh7P4nkJcM0CyQykb9XMjmRJ7aQJASbZWnln2b4G1YlYl
	 jqjC3UaMdbjPgGH4LoUvmvt5BDfuetGd333HUO1e++Dnf2MVlTCIY/j5HUaBLP9kIV
	 eQjdWrTxGOqyJqGHBBrgxt6el0CLdS7cgFSJbghfBvsY6gf6vUBRzoFck/Kc1023L6
	 u1pbXvlFzkVTSlKfX0QfRPQkQdUR1/uNk4SRrRg36WM8xCcF4L1qBQBkVsM8SAh/oF
	 gUXx2GC3oM+3Q==
Message-ID: <sashiko-outbox-189496@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 13/16] ARM: dts: aspeed: anacapa: Remove LTC4287
 power monitors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Colin Huang" <u8813345@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261029-anacapa-devlop-phase-devicetree-v10-13-26ee3cf9d9d0@gmail.com>
References: <20261029-anacapa-devlop-phase-devicetree-v10-0-26ee3cf9d9d0@gmail.com>
 <20261029-anacapa-devlop-phase-devicetree-v10-13-26ee3cf9d9d0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 14:18:47 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] ARM: dts: aspeed: anacapa: patch reverts nodes added earlier in sam=
e series
--

commit 03870aab7cb0f129ffba68f6d70cf51a5d0e4fd0
Author: Carl Lee <carl.lee@amd.com>

ARM: dts: aspeed: anacapa: Remove LTC4287 power monitors

This patch removes seven lltc,ltc4287 power-monitor nodes from the i2c@0 and
i2c@1 mux channels in aspeed-bmc-facebook-anacapa-evt2.dtsi to avoid I2C
address conflicts.

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dt=
si b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
> index f546a7b5786a1..5c0d874fa24af 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
> @@ -83,30 +83,6 @@ gpio@24 {
>  					"RPDB_FAN7_PRSNT_N_R", "RPDB_FAN8_PRSNT_N_R",
>  					"", "";
>  			};
> -
> -			power-monitor@42 {
> -				compatible =3D "lltc,ltc4287";
> -				reg =3D <0x42>;
> -				shunt-resistor-micro-ohms =3D <150>;
> -			};
> -
> -			power-monitor@43 {
> -				compatible =3D "lltc,ltc4287";
> -				reg =3D <0x43>;
> -				shunt-resistor-micro-ohms =3D <150>;
> -			};
> -
> -			power-monitor@44 {
> -				compatible =3D "lltc,ltc4287";
> -				reg =3D <0x44>;
> -				shunt-resistor-micro-ohms =3D <250>;
> -			};
> -
> -			power-monitor@45 {
> -				compatible =3D "lltc,ltc4287";
> -				reg =3D <0x45>;
> -				shunt-resistor-micro-ohms =3D <250>;
> -			};
>  		};
> =20
>  		i2c@1 {
> @@ -177,24 +153,6 @@ gpio@24 {
>  					"","",
>  					"","";
>  			};
> -
> -			power-monitor@40 {
> -				compatible =3D "lltc,ltc4287";
> -				reg =3D <0x40>;
> -				shunt-resistor-micro-ohms =3D <150>;
> -			};
> -
> -			power-monitor@41 {
> -				compatible =3D "lltc,ltc4287";
> -				reg =3D <0x41>;
> -				shunt-resistor-micro-ohms =3D <150>;
> -			};
> -
> -			power-monitor@45 {
> -				compatible =3D "lltc,ltc4287";
> -				reg =3D <0x45>;
> -				shunt-resistor-micro-ohms =3D <250>;
> -			};
>  		};
>  	};
>  };

[Severity: Low]
Earlier in this same patch series, commit 366f7e6a0a5d ("ARM: dts: aspeed:
anacapa: evt2: Add shunt resistor values for HSC monitors") added these exa=
ct
power-monitor@42, power-monitor@43, power-monitor@44, and power-monitor@45
nodes under i2c@0, and power-monitor@40, power-monitor@41, and
power-monitor@45 under i2c@1 in
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi.

This patch then deletes those same 42 lines because the nodes conflict with
other I2C addresses on those buses, leaving intermediate commits in the ser=
ies
with known I2C address conflicts during bisection.

Could both patches be dropped from the series, or squashed together, rather
than adding broken nodes in one patch and reverting them five patches later?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029-anacapa-de=
vlop-phase-devicetree-v10-0-26ee3cf9d9d0@gmail.com?part=3D13
