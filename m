Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794353056;
	b=CbVoIHDS4Zis/J//13N6Inx9+0dN63H9fJ9oBuPLCKQh7v4g10PAKDs4gQKGD1bCCfJA
	 ZyxGJ/WXxulud7jWlc9fwRiZomArQf8A+cSVAGQO2fk2EQt/sM4xWGFE13KdS0BAR5Agn
	 pouUfSXfBbMYghkwVvEm3N0NhCyLsGzn/E+bzlHlP+R+MNFPZ+Rw81aEQZMET7QXKfSVO
	 nn/OS36acHCUpq6vahofuHYBlEQTdaNGwotiUf+7S21IyWE+lW0fJuKtgWFjR1lgLivcv
	 ankNmUUwtcuNaIkXfKOEapsxuyCkoiaQ8FjMNlXYeo+sWgzRe+TE3A/BKL8sMMAEksQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794353056;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oBdSHQJupvZ8LPJt+TyfOUM8vW0yJLnqhiA1y51JB4s=;
	b=Ib5xP26ix1hG8cF+9xLRQP3HgoA9vHN2NUv7JGmCCFr2AiwqY6vAgYHKyO7yyjz42jpM
	 R/OpQYpkEt7dZArncv11fiCdrmoOx4lBfMftp/2MSp2ELgKr6ODDi6wPBhKERyF0wP309
	 CTQ7Iw6p1+bDJpxoySh+sWHrS07EqqMQe6bNB5T89clipXvhDfeRGvK6kMPjMADssvBNz
	 WaTK3h6dBgO7C/yxEPwEqYDeGLb2rsDv1Q5Gs8eX380oDkhlxnzySsD3gkekzMRp/jAZO
	 TTscQYej5VRkY3J+PQpjxJrW0A5eMLF3zP8P789OZ5R1utNokACYyMlqMVpDPzJxBqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dOODjP2U;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C42D606A320
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 23:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dOODjP2U
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC7851F0093C;
	Tue, 10 Nov 2026 23:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794353056;
	bh=oBdSHQJupvZ8LPJt+TyfOUM8vW0yJLnqhiA1y51JB4s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dOODjP2UvvwHyJM7oMSYMUwpvJAGRo91w1wnoanKUX3WzN2WhJEs/muODCe4Q9C9z
	 i98BpP97PkerSlwU2c0PHHhykb9d2in+gCNORzqXBE6FAJEUceqFLd9G6bsQxhbRie
	 T1jNUHmZuReZyASPTgtGUEUdL7rEidY0adsJQYBB+SIbzpRkAHv6zFCITYa35HcH8w
	 rWYSasUFDqOg8rEl2Fm0cpr45shp/h5HZnLAL7Ka43QTkXIOwwW22RYx3jBMCAL0Hk
	 he563XvtR0+pFhTb1yEZNeO20DE+oAv8Eh8M2GtPlc82zLcbo3OszPgjkUYADZH5U2
	 6N698xf1DCxnw==
Message-ID: <sashiko-outbox-207895@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] power: supply: core: Read the charging temperature
 range and alert settings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261109-battery-charge-temp-range-v1-2-a967abd8b80c@flipper.net>
References: <20261109-battery-charge-temp-range-v1-0-a967abd8b80c@flipper.net>
 <20261109-battery-charge-temp-range-v1-2-a967abd8b80c@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 23:24:15 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [High] power: supply: core: out-of-bounds read in
  power_supply_ocv2cap_simple() [1]
--

commit adb164988f0d04b6bb830ddbcbc6a92311698583
Author: Alexey Charkov <alchark@flipper.net>

power: supply: core: Read the charging temperature range and alert settings

This commit reads the charge-temp-range-celsius and alert-*-temp-charge-*
firmware properties into struct power_supply_battery_info, falling back to
the operating temperature range when charge-temp-range-celsius is absent.

> diff --git a/drivers/power/supply/power_supply_core.c b/drivers/power/sup=
ply/power_supply_core.c
> index de15314ef9549..3bfc4fb8687ef 100644
> --- a/drivers/power/supply/power_supply_core.c
> +++ b/drivers/power/supply/power_supply_core.c
> @@ -855,6 +855,14 @@ int power_supply_get_battery_info(struct power_suppl=
y *psy,
>  			     &info->constant_charge_voltage_max_uv);
>  	fwnode_property_read_u32(fwnode, "factory-internal-resistance-micro-ohm=
s",
>  			     &info->factory_internal_resistance_uohm);
> +	fwnode_property_read_u32(fwnode, "alert-low-temp-charge-current-microam=
p",
> +			     &info->alert_low_temp_charge_current_ua);
> +	fwnode_property_read_u32(fwnode, "alert-low-temp-charge-voltage-microvo=
lt",
> +			     &info->alert_low_temp_charge_voltage_uv);
> +	fwnode_property_read_u32(fwnode, "alert-high-temp-charge-current-microa=
mp",
> +			     &info->alert_high_temp_charge_current_ua);
> +	fwnode_property_read_u32(fwnode, "alert-high-temp-charge-voltage-microv=
olt",
> +			     &info->alert_high_temp_charge_voltage_uv);
> =20
>  	if (!fwnode_property_read_u32_array(fwnode, "ambient-celsius",
>  					    min_max, ARRAY_SIZE(min_max))) {
> @@ -871,6 +879,14 @@ int power_supply_get_battery_info(struct power_suppl=
y *psy,
>  		info->temp_min =3D min_max[0];
>  		info->temp_max =3D min_max[1];
>  	}
> +	if (!fwnode_property_read_u32_array(fwnode, "charge-temp-range-celsius",
> +					    min_max, ARRAY_SIZE(min_max))) {
> +		info->temp_charge_min =3D min_max[0];
> +		info->temp_charge_max =3D min_max[1];
> +	} else {
> +		info->temp_charge_min =3D info->temp_min;
> +		info->temp_charge_max =3D info->temp_max;
> +	}
> =20
>  	len =3D fwnode_property_count_u32(fwnode, "ocv-capacity-celsius");
>  	if (len < 0 && len !=3D -EINVAL) {

[Severity: High]
This problem wasn't introduced by this patch, but can an empty
ocv-capacity-table-N property in power_supply_get_battery_info() [1]
cause an out-of-bounds read in power_supply_ocv2cap_simple()?

drivers/power/supply/power_supply_core.c:power_supply_get_battery_info() {
    ...
		proplen =3D fwnode_property_count_u32(fwnode, propname);
		if (proplen < 0 || proplen % 2 !=3D 0) {
			dev_err(&psy->dev, "failed to get %s\n", propname);
			power_supply_put_battery_info(psy, info);
			err =3D -EINVAL;
			goto out_put_node;
		}
    ...
		tab_len =3D proplen / 2;
		info->ocv_table_size[index] =3D tab_len;

		info->ocv_table[index] =3D table =3D
			devm_kcalloc(&psy->dev, tab_len, sizeof(*table), GFP_KERNEL);
    ...
}

When ocv-capacity-table-N is present but empty,
fwnode_property_count_u32() returns 0, which passes the proplen < 0 ||
proplen % 2 !=3D 0 check.  devm_kcalloc() then returns ZERO_SIZE_PTR with
ocv_table_size[index] set to 0, and power_supply_ocv2cap_simple() later
dereferences table[0], crashing the kernel.  Rejecting proplen <=3D 0 (simi=
lar
to resistance-temp-table below) would avoid this.

[1] https://sashiko.dev/#/bug/linux-4a0a5d5f-629d-4b0d-b4be-07415bcb018e

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-battery-ch=
arge-temp-range-v1-0-a967abd8b80c@flipper.net?part=3D2
