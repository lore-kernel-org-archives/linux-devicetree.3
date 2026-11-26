Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795664519;
	b=2a91zAvhQrjtGqtMH9Nk4OEBw7yVRnXN6uHKpdExeQu2IB/ekXnXT00Tgv/MUNoZun6K
	 4SWznjvbdfFKDtbVmDMfbdDAi5J4Rmc3TEttCxlpEJDpRGxNcoAutySyjZs1fMP+iMfN6
	 Lwlzgk7pwlk8+MKAy141gGgkhRMR0r65wwsZJxRK7VQLVDhNsT1kviDCcbrIprgrHkLYl
	 GWJIf2KpqwywFHp4WQH72e8vcMtkGftMUEYFgqEZTZ4R+M6Ek6uiejFrmBbSQ669FZJ7h
	 mkJkVW8giIiq7oXH/Qz/kilkmPWAtihgqqcjoJI0eUI2/9I/EhD7myzbWsID/KDRsjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795664519;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xuDj1RKbZC6+WhHH3WA8MZHQCTluwl0b7PlIC/sAYs8=;
	b=kOagwRUjIEt1mfBc/g7jUAgbauohNUc6P1KADuQSm+ouqw+XcHCluXmccN5ly0R71bmb
	 rWvlBxnd4LBhSaW2XRwZp2xtPxSGoB1x73FrppZYIAjuKwxnSlta62Q8dUR5sOUc+UMt3
	 xRwT+9BZif7CS+50lAlvNkQX74Ac5l9aqWmFIJ1tKf1okKI6ksmTrBLpLTCDkJpIVa215
	 GBGjLb3UdoxYils4MUDi6lqGEEuvoENi+tt+m4W6arjQzxpcYlbF5NULrMx4mwUse3Wwj
	 63ejqEpzM4VZx5nvU8u+1lcBkffH31leTCGXekSzkYC1tUgEjpxLq0tJZ8WRkshdf1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L2ZeV6PJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1F8606A323
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 03:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L2ZeV6PJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA3CA1F000C4;
	Thu, 26 Nov 2026 03:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795664519;
	bh=xuDj1RKbZC6+WhHH3WA8MZHQCTluwl0b7PlIC/sAYs8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L2ZeV6PJPZXWG5Jecpu1xojnR8hLWvyrrYtpEx2AHogsRrRtlJJEgFBMoLcwqMQKZ
	 MudLMAbFasFvAj6ji72qJ/6KhEyNQU63aYyrTK7AmtUegxnZbGgxaAC5cEh8Za8DfX
	 ikByYcjQ6xnIOkwDPE4xgo6De9qvqrsn0cfsTovAnIzvWMOxGwU5G/v4ZqrRRCNWtJ
	 +1v0iq+ca1PQb8E0o4jiDvyQ0+/IFFEVCfLbBvKSnJOMewlgT+HFbV8RIIRhF2m1jd
	 Hoq+D4ZxuYpGJjuDpKl8+8Jq02PaSz+l8YnQX3YEcJ467mPCJvcnFk0dD7TL3WKxY4
	 tAmtESdXXBKvA==
Message-ID: <sashiko-outbox-234701@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] regulator: qcom-rpmh: Add PM6450 LDO support
Reply-To: sashiko-reviews@lists.linux.dev
To: SignKirigami <prcups@krgm.moe>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126-netrani-pm6450-v1-v2-2-2539a2422218@krgm.moe>
References: <20261126-netrani-pm6450-v1-v2-0-2539a2422218@krgm.moe>
 <20261126-netrani-pm6450-v1-v2-2-2539a2422218@krgm.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 03:41:58 +0000
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
- [High] regulator: qcom-rpmh: invalid vin supply_name on all PM6450
  LDOs
--

commit f10d34b3eaf0e0959ceb4a5be745dd75208d5999
Author: SignKirigami <prcups@krgm.moe>

regulator: qcom-rpmh: Add PM6450 LDO support

This commit adds RPMh regulator descriptions and compatible matching for
the PM6450 LDOs.

> diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/=
qcom-rpmh-regulator.c
> index da4764ffa6325..ff5022bba5fc6 100644
> --- a/drivers/regulator/qcom-rpmh-regulator.c
> +++ b/drivers/regulator/qcom-rpmh-regulator.c
> @@ -1619,6 +1619,18 @@ static const struct rpmh_vreg_init_data pm6350_vre=
g_data[] =3D {
>  	RPMH_VREG("ldo22",  LDO,  22, &pmic5_nldo,      "vdd-l15-l19-l22"),
>  };
> =20
> +static const struct rpmh_vreg_init_data pm6450_vreg_data[] =3D {
> +	RPMH_VREG("ldo5",  LDO, 5,  &pmic5_nldo,    "vin"),
> +	RPMH_VREG("ldo7",  LDO, 7,  &pmic5_nldo,    "vin"),
> +	RPMH_VREG("ldo13", LDO, 13, &pmic5_nldo,    "vin"),
> +	RPMH_VREG("ldo16", LDO, 16, &pmic5_nldo,    "vin"),
> +	RPMH_VREG("ldo19", LDO, 19, &pmic5_pldo_lv, "vin"),
> +	RPMH_VREG("ldo23", LDO, 23, &pmic5_pldo_lv, "vin"),
> +	RPMH_VREG("ldo24", LDO, 24, &pmic5_pldo,    "vin"),
> +	RPMH_VREG("ldo25", LDO, 25, &pmic5_pldo,    "vin"),
> +	{},
> +};

[Severity: High]
Should pm6450_vreg_data[] use the PMIC input supply pin names (such as
"vdd-l5") or NULL instead of "vin"?

rpmh_regulator_init_vreg() registers every LDO with reg_config.dev set to
the parent PMIC device and rdesc.supply_name set to this string.  When a
child LDO node has no vin-supply property, regulator_resolve_supply() ->
regulator_dev_lookup() -> of_get_regulator() falls back to
of_get_child_regulator(dev->of_node, "vin-supply"), which scans all child
LDO nodes under the PMIC and binds the LDO to the first sibling's
vin-supply (or falls back to regulator_lookup_by_name("vin") and binds to
any regulator named "vin" in the system).  The qcom,rpmh-regulator.yaml
binding also disallows vin-supply on both the PMIC node and child LDO
nodes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-netrani-pm=
6450-v1-v2-0-2539a2422218@krgm.moe?part=3D2
