Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF27212FAD
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 01:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784510467; cv=none; b=hcfF44fOp1NAj9DuJ2rUtNuYBis+tKiXz3ggfH+z5uhJIrXqjoVa3NmAjsYa0zUxLnsQKDDvUeedbrMSVJY6JL/IQYR0PqTVgomprMaVVV/Gc3mtlX8l8Z3MXgK7VqVkeRMC7TL5+Ju0QWUvSnPN4TYAUvfgLmEaaofnj0Qb3Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784510467; c=relaxed/simple;
	bh=eAb1AhM7lRT6UuY9IXp293lWV4swAo+uR+QCDoKN8hM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T7jtK//HfI0pgWObBrY7mUoo39/fRWTxqyBLrbIa5EstCT89yS1MW8q/v9YEc2kl5j9xF7LByv68I2OKL7hW0jENnbs4oCNkZDBdZhW4hGCgM1LL3Irls80y31WSJXuePl/MgJsvqZGO1DnRbmxlNJvAQNt9uM4z07uqWuXBYwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GZ75EEN9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GZ75EEN9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BBA21F000E9;
	Mon, 20 Jul 2026 01:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784510465;
	bh=d//qBz0+ouLJoJfd4AB2MZ115VlhR9Bbt6+wdZXbQZ0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GZ75EEN938AgOtry4347SgXlWW/Bkcf69UjWZfXVQD0LiLbDA6L+cYW1vIhPCwTRY
	 oGAcGXocHfTvV7R7jyRwDF71t5Ed62QjFRjmdqoCAzP3K7DjMANJGHBFoncPtlJg5v
	 Fig3bHj2ik2Pp//gT0NwcPXh/Bt5JjYucxjF1CdngXRtrH9I8vSHSoK30yGhpVCfy6
	 qL258yRIHJhUtW4MWSjie6IpbD/We+zbMiOfklaCctP90CaC0VVqFgLN55x1wxFSx2
	 bSmcSO60v/DyX2RrO6QXGzTYUK7pfxFxDW1Z7fIwWGYzByDLL9jvqdPkUJLC1zJLA4
	 H4scV63ypMFKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] dt-bindings: power: supply: max17042: Allow
 monitored-battery
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Cloutier" <vincent.cloutier@icloud.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260720011144.1280219-5-vincent.cloutier@icloud.com>
References: <20260720011144.1280219-1-vincent.cloutier@icloud.com>
 <20260720011144.1280219-5-vincent.cloutier@icloud.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 01:21:04 +0000
Message-Id: <20260720012105.3BBA21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Infinite retry loop in `max17042_init_worker` on permanent configu=
ration error for MAX17055 devices.
--

--- Patch [4]: [PATCH v2 4/4] dt-bindings: power: supply: max17042: Allow m=
onitored-battery ---
commit 442f6d786e796de83bd68c7855b401281db302f3
Author: Vincent Cloutier <vincent@cloutier.co>

dt-bindings: power: supply: max17042: Allow monitored-battery

The MAX17042 family binding references the generic power-supply schema,
but its additionalProperties restriction means generic properties must
also be admitted explicitly. Allow monitored-battery so these fuel gauges
can reference the physical battery whose characteristics they consume.

> diff --git a/Documentation/devicetree/bindings/power/supply/maxim,max1704=
2.yaml b/Documentation/devicetree/bindings/power/supply/maxim,max17042.yaml
> index 242b33f2bcba5..ace684159e0e2 100644
> --- a/Documentation/devicetree/bindings/power/supply/maxim,max17042.yaml
> +++ b/Documentation/devicetree/bindings/power/supply/maxim,max17042.yaml
> @@ -67,6 +67,8 @@ properties:
>        Voltage threshold to report battery as over voltage (in mV).
>        Default is not to report over-voltage events.
> =20
> +  monitored-battery: true
> +

[Severity: High]
Does allowing monitored-battery expose an infinite retry loop in the driver
for MAX17055 devices?

If a MAX17055 device is configured with a voltage-max-design-microvolt >
4.275V but lacks charge-full-design-microamp-hours (or lacks a shunt
resistor), enable_vchg_override is set but config->design_cap remains 0.

During initialization, max17055_override_battery_values() attempts to read
the uninitialized (0) DesignCap and dQAcc registers directly from the
hardware. Since they evaluate to 0, it returns a permanent -ERANGE error:

drivers/power/supply/max17042_battery.c:max17055_override_battery_values() {
...
	ret =3D regmap_read(map, MAX17042_DesignCap, &design_cap);
...
	if (!design_cap || !dqacc)
		return -ERANGE;
...
}

However, max17042_init_worker() intercepts this error and blindly requeues
the initialization work for MAX17055 devices on any failure:

drivers/power/supply/max17042_battery.c:max17042_init_worker() {
...
	if (ret) {
		if (chip->chip_type =3D=3D MAXIM_DEVICE_TYPE_MAX17055) {
			dev_warn_ratelimited(chip->dev,
				"initialization failed: %d, retrying\n", ret);
			queue_delayed_work(system_freezable_wq, &chip->work,
				msecs_to_jiffies(MAX17055_INIT_RETRY_DELAY_MS));
...
}

Because the hardware registers continually read as 0, this creates an
infinite retry loop triggered by valid, non-malicious device tree
configurations, leading to missing battery status and log spam.

>    power-supplies: true
> =20
>  required:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720011144.1280=
219-1-vincent.cloutier@icloud.com?part=3D4
