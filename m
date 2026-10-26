Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793012814;
	b=fmcHvdhIf3c4aCOQFXCrJ8peZL1/ZTKX3vtTbsNfRct0sXJCq++uLiXhI5dll781RmYH
	 P/IqM+o/QThpz6iOXtMudlT4Yf1b37LKg0ZQztbM+o9fOpQG2fO1A3+DvjkD8eQmgm7Oz
	 uQ22yJ/gwkyJGO1nIrEkgYUMhlHvpG9looRulhowsVfjhF4BJ7qpce2c2TpNTfRKTSLE/
	 PQmiBGlrXOnHeuZK94GZaNHl0QW/2O3pxw+j8vgTZNLOHBZ9/newD2TI5ey047utoM7Zm
	 2YYCjMhNFbkNcYzRnhWREPtGQqB62+TY3rzjeA/mEM1hS1XyEsG+9OlZPdRS1ySlvYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793012814;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7z2x+Q8UI2EsV80StMUfLN/2jNDgPp5ls+S79xTPpCw=;
	b=p39amI3TN3L+fRfXlaPKGwQUCWsCXeLW8rfDfvnkwOcfQ7Ap4INL/jBcCEecaeyXYn3W
	 8g7Nk5wGDncJuvSMOWxvbtZ22SLnEF2j2l6k4ZqQ/RHRqIZt0V9c9kOkA0+WGdSPTvcf1
	 ysF6et2DMxJiHLawmbybueLhuNUgb/M6twxxp6EFYIcMz88+70hSZga8B6aWE7BIdzOjO
	 ctajjoWMLa33XdU1uORlvXfqTyinY3dYnEIpD9RWN2xtul4q446T9vNPkZQXSBHtGiaIB
	 L1oUaHJuUUnFqBrOb5BCGmrMCDHPxfyJVyevXvfNiuE1Z77TDVHB7KFpK1U9QzDjImw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HLBDepiz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5758606A320
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HLBDepiz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 088911F01825;
	Mon, 26 Oct 2026 11:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793012813;
	bh=7z2x+Q8UI2EsV80StMUfLN/2jNDgPp5ls+S79xTPpCw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HLBDepizHkiQE4PM7nlLNcosMUXSwMv2Lr73qrtVt4FLVvu+0U/PJwgATNNO1JLxs
	 G8Y8AzZ2gsD712PfH2MZSef5v9jUXYLZv8ljvSVFvbjgqQOEI83P4GHz1j4yKKVuU3
	 zBtfaLiiyAmTrmBKKXYgw/P8QnitpufW1I4WTybLQ3YYfQ9vkDiZDh4IV/moFPEoEY
	 SyzbYc5TrAGb1Qduw9qDW4FY5UVmqPF9DNSLqIceV+0LayvZ03oTDmEUnnwkDe543q
	 hv5PHKvCru0fg1UyBSB3xcdqNW6prsBaqySOoClNf6MRlUlnXoWHVd/M6TguWDf6y/
	 +LJ8jnMZeGwtw==
Message-ID: <sashiko-outbox-185054@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/9] arm64: dts: airoha: en7581: add thermal sensor
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261026095727.31708-5-ansuelsmth@gmail.com>
References: <20261026095727.31708-1-ansuelsmth@gmail.com>
 <20261026095727.31708-5-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 11:06:52 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] arm64: dts: airoha: en7581: cpu-hot trip type prevents passive CPU=
 throttling
- [Medium] arm64: dts: airoha: en7581: thermal-sensors cell count mismatch =
in cpu-thermal
- [Medium] arm64: dts: airoha: en7581: thermal-sensor reg size smaller than=
 driver offsets
--

commit 32580fdfac9a302b9b8e002dc32934288d0d3428
Author: Christian Marangi <ansuelsmth@gmail.com>

arm64: dts: airoha: en7581: add thermal sensor nodes

This commit adds the thermal-sensor node and cpu-thermal zone to the Airoha
EN7581 device tree and links the CPUs as cooling devices.

> diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts=
/airoha/en7581.dtsi
> index fbc5ee47523ca..58bd8b318910e 100644
> --- a/arch/arm64/boot/dts/airoha/en7581.dtsi
> +++ b/arch/arm64/boot/dts/airoha/en7581.dtsi

[ ... ]

> @@ -293,6 +298,39 @@ timer {
>  			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
>  	};
> =20
> +	thermal-zones {
> +		cpu_thermal: cpu-thermal {
> +			polling-delay-passive =3D <0>;
> +			polling-delay =3D <0>;
> +
> +			thermal-sensors =3D <&thermal 0>;

[Severity: Medium]
Should thermal-sensors in cpu_thermal be <&thermal> without the trailing 0
cell?

Below, the thermal node declares #thermal-sensor-cells =3D <0>, matching
Documentation/devicetree/bindings/thermal/airoha,en7581-thermal.yaml:

  '#thermal-sensor-cells':
    const: 0

When of_thermal_zone_find() in drivers/thermal/thermal_of.c parses
thermal-sensors =3D <&thermal 0> with #thermal-sensor-cells =3D <0>,
of_count_phandle_with_args() consumes 0 argument cells for &thermal and
treats the trailing 0 as a second phandle entry, returning count =3D 2:

	count =3D of_count_phandle_with_args(child, "thermal-sensors",
					   "#thermal-sensor-cells");
	if (count <=3D 0) {
		pr_err("%pOFP: missing thermal sensor\n", child);
		return ERR_PTR(-EINVAL);
	}

	for (i =3D 0; i < count; i++) {

		int ret;

		ret =3D of_parse_phandle_with_args(child, "thermal-sensors",
						 "#thermal-sensor-cells",
						 i, &sensor_specs);

This fails dtbs_check against thermal-zones.yaml (where thermal-sensors has
maxItems: 1) as well as dtc's thermal_sensors_property check, and causes
of_parse_phandle_with_args() at index 1 to return -ENOENT if
of_thermal_zone_find() iterates past index 0.

> +
> +			trips {
> +				cpu_hot: cpu-hot {
> +					temperature =3D <95000>;
> +					hysteresis =3D <1000>;
> +					type =3D "hot";
> +				};
> +
> +				cpu-critical {
> +					temperature =3D <120000>;
> +					hysteresis =3D <1000>;
> +					type =3D "critical";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip =3D <&cpu_hot>;
> +					cooling-device =3D <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};

[Severity: High]
With cpu_hot configured as type =3D "hot" and polling-delay-passive =3D <0>=
, can
passive CPU frequency throttling ever activate at 95 C?

In drivers/thermal/thermal_core.c, thermal_trip_crossed() handles
THERMAL_TRIP_HOT via handle_critical_trips() (which only calls tz->ops.hot()
if implemented, whereas en7581_thdev_ops in drivers/thermal/airoha_thermal.c
does not define .hot) without incrementing tz->passive, and
thermal_governor_trip_crossed() returns early:

	if (trip->type =3D=3D THERMAL_TRIP_HOT || trip->type =3D=3D THERMAL_TRIP_C=
RITICAL)
		return;

All in-kernel thermal governors also skip THERMAL_TRIP_HOT trips, such as
step_wise_manage() in drivers/thermal/gov_step_wise.c:

		if (trip->temperature =3D=3D THERMAL_TEMP_INVALID ||
		    trip->type =3D=3D THERMAL_TRIP_CRITICAL ||
		    trip->type =3D=3D THERMAL_TRIP_HOT)
			continue;

As a result, the cooling devices (&cpu0 through &cpu3) mapped to &cpu_hot in
map0 are never throttled when the sensor crosses 95000 mC.

In addition, even if cpu_hot is changed to type =3D "passive", setting
polling-delay-passive =3D <0> leaves tz->passive_delay_jiffies at 0 in
monitor_thermal_zone() in drivers/thermal/thermal_core.c:

static void monitor_thermal_zone(struct thermal_zone_device *tz)
{
	if (tz->passive > 0 && tz->passive_delay_jiffies)
		thermal_zone_device_set_polling(tz, tz->passive_delay_jiffies);
	else if (tz->polling_delay_jiffies)
		thermal_zone_device_set_polling(tz, tz->polling_delay_jiffies);
}

Once the 95000 mC trip is crossed, en7581_thermal_set_trips() in
drivers/thermal/airoha_thermal.c sets the hardware interrupt thresholds to
low =3D 93999 mC and high =3D 120000 mC, so no further interrupts fire betw=
een
95 C and 120 C; without a non-zero polling-delay-passive, an incremental
governor like step_wise will only step down by a single OPP upon crossing
95 C and will not throttle further as temperature rises toward 120 C.

Should cpu_hot use type =3D "passive" along with a non-zero
polling-delay-passive?

> +		};
> +	};
> +
>  	clk20m: clock-20000000 {
>  		compatible =3D "fixed-clock";
>  		#clock-cells =3D <0>;
> @@ -319,6 +357,15 @@ gic: interrupt-controller@9000000 {
>  			interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
>  		};
> =20
> +		thermal: thermal-sensor@1efbd000 {
> +			compatible =3D "airoha,en7581-thermal";
> +			reg =3D <0x0 0x1efbd000 0x0 0xd5c>;

[Severity: Medium]
Is the reg size of 0xd5c large enough for all registers accessed by the
airoha_thermal driver?

In drivers/thermal/airoha_thermal.c, the driver defines calibration
registers up to offset 0xf28:

#define EN7581_EFUSE_TEMP_OFFSET_REG		0xf20 /* PTPSPARE0 */
#define   EN7581_EFUSE_TEMP_OFFSET		GENMASK(31, 16)
#define EN7581_PTPSPARE1			0xf24 /* PTPSPARE1 */
#define EN7581_EFUSE_TEMP_CPU_SENSOR_REG	0xf28 /* PTPSPARE2 */

During probe, en7581_thermal_probe() maps resource 0 via
devm_platform_ioremap_resource(pdev, 0) and calls
en7581_thermal_setup_adc_val(), which reads offsets 0xf20 and 0xf28 from
priv->map:

	regmap_read(priv->map, EN7581_EFUSE_TEMP_OFFSET_REG, &efuse_calib_info);
	if (efuse_calib_info) {
		priv->default_offset =3D FIELD_GET(EN7581_EFUSE_TEMP_OFFSET, efuse_calib_=
info);
		/* Different slope are applied if the sensor is used for CPU or for packa=
ge */
		regmap_read(priv->map, EN7581_EFUSE_TEMP_CPU_SENSOR_REG, &cpu_sensor);

Since 0xf28..0xf2b lies beyond the declared 0xd5c region size, should reg
have a size of at least 0xf2c (as in the binding example in
Documentation/devicetree/bindings/thermal/airoha,en7581-thermal.yaml)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026095727.3170=
8-1-ansuelsmth@gmail.com?part=3D4
