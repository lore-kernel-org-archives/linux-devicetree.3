Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F8437104D
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 18:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779216866; cv=none; b=k+MSD/phDtSC0SYXs6j0+dNdRUwXmTwUXqD72hE0VrpMCWQrxVhlAPeo1vX7oSN/j9sJ1BCP9GB6NG/GBeLbbq5+jqcbJ1ADNYYTpbsSdUQZbtANc8Ci6Iv+KQHswKAK8E1wwWyQJQsXS1Ugr2C/W+4Qr0cMFX0xW+DtQInAetI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779216866; c=relaxed/simple;
	bh=8s2zzER1R8HbQJU5D1FhKpNqHYaTrEWgCdJZS3b5JBU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Xo28pi/g6haDejKSoCQKmJ/gzPqMCgsSc8KOfe2zk7EdQ/8vIdyWblNjVKYgp4Umuvy8IEFNUE2lSr8wP2uCFMFfiv09bBlO8fEFlsJtyUJzIkuNySCIjOhi781SPgHbPTo5CLvomUeczkVHdqyUfnZ5Bk3/+yWM+w3+dB7MWaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k/asO0S0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k/asO0S0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1C121F000E9;
	Tue, 19 May 2026 18:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779216863;
	bh=NIqribavZjUnHEWsj5W4XGe1nu0IpoEAS6J1SJevW74=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k/asO0S05+4NO5gz6GvZzqM/8MpkX1a4GjFzVsKt2RZ2uKPoBSgZe5QY8JVNsfhLb
	 8N2PoTLQKz7kElfqtp9IYQvtZSZKFN2cf0GAS24ySz4UVxYaWp/zu5rJaTcsc5KVar
	 XzdolWpf4NL9bAWInca1CS6xZ2WDjyEmAw7vMYpdhONXZwrAE/zHeDro50Ynx+oOoq
	 NH7EIx0JT8Q+AgfNoHqPfkyubZ66ELR6qGxA+NjG8syYN1hOYTYg17BWs5IVuGiNZV
	 V7JF+d+Z/i3TwsovuiaEcPkJl1+CHbi623MaC4CMOBrwUQI6UHwF7XZ8fS55Es05x9
	 UoWkgEpFIFBZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] regulator: mp8899: Add MPS MP8899 PMIC regulator
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vignesh Viswanathan" <vignesh.viswanathan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260519-mp8899-regulator-driver-v1-2-30d14421b7f1@oss.qualcomm.com>
References: <20260519-mp8899-regulator-driver-v1-2-30d14421b7f1@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 18:54:15 +0000
Message-Id: <20260519185423.A1C121F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Incorrect `n_voltages` configuration prevents accessing the full v=
oltage range.
- [Medium] Missing `.active_discharge_on` initialization always disables ac=
tive discharge regardless of the requested state.
- [Medium] Time-Of-Check to Time-Of-Use (TOCTOU) race condition in custom g=
eneric debugfs register access due to shared state.
- [Medium] Lack of memory barriers between updating the voltage cache and i=
ts validity flag allows the panic handler to read uninitialized or torn dat=
a.
- [Low] The driver violates I2C subsystem guidelines by manually creating a=
 custom debugfs root directory and uses a dangerously small buffer for its =
name.
--

commit 0f71ad8288b0930fc14cef9f2d4480d94d55a12d
Author: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>

regulator: mp8899: Add MPS MP8899 PMIC regulator driver

Add a regulator driver for the MPS MP8899 PMIC, which provides four
synchronous buck converters controlled over I2C. The driver supports
programmable output voltages and registers a panic notifier to log the
last known voltage state.

> diff --git a/drivers/regulator/mp8899.c b/drivers/regulator/mp8899.c
> index 0000000000000..ebd1f75d9e2f5 100644
> --- /dev/null
> +++ b/drivers/regulator/mp8899.c
[ ... ]
> @@ -234,6 +234,31 @@ static int mp8899_set_voltage_sel(struct regulator_d=
ev *rdev, unsigned int sel)
[ ... ]
> +	/* Cache the successfully set voltage for panic handler */
> +	voltage_uv =3D regulator_list_voltage_linear_range(rdev, sel);
> +	if (voltage_uv > 0) {
> +		info->cached_voltage_uv[buck_id] =3D voltage_uv;
> +		info->voltage_cache_valid[buck_id] =3D true;

[Severity: Medium]
Could the panic handler observe voltage_cache_valid as true before the new
voltage is fully written to memory?

Since the panic handler runs asynchronously (e.g., from an NMI), would using
memory barrier primitives like smp_store_release() and smp_load_acquire()
ensure the handler doesn't log uninitialized or stale voltage data?

> +		dev_dbg(info->dev, "Buck%d: Cached voltage %duV\n", buck_id + 1, volta=
ge_uv);
> +	}
[ ... ]
> @@ -405,6 +405,37 @@ static ssize_t mp8899_debugfs_reg_addr_write(struct =
file *file,
[ ... ]
> +	/* Validate register address */
> +	if (!mp8899_is_valid_reg(reg_addr)) {
> +		dev_err(info->dev, "Invalid register address 0x%02x (valid: 0x00-0x21,=
 0x2D)\n",
> +			reg_addr);
> +		return -EINVAL;
> +	}
> +
> +	info->debug_reg_addr =3D reg_addr;

[Severity: Medium]
Is there a Time-Of-Check to Time-Of-Use (TOCTOU) race condition here if
multiple processes interact with these debugfs files concurrently?

If process A sets the target address, but process B overwrites
info->debug_reg_addr before process A can execute its read or write on
reg_value, could this cause a user to inadvertently write to an unintended
register (such as the write-only CLEAR register)?

> +	dev_dbg(info->dev, "Register address set to 0x%02x\n", reg_addr);
> +
> +	return count;
> +}
[ ... ]
> @@ -597,6 +597,29 @@ static const struct regulator_ops mp8899_buck_ops =
=3D {
[ ... ]
> +#define MP8899_BUCK_DESC(_name, _id) \
> +	[MP8899_BUCK##_id] =3D { \
> +		.id =3D MP8899_BUCK##_id, \
> +		.name =3D _name, \
> +		.of_match =3D _name, \
> +		.regulators_node =3D "regulators", \
> +		.of_parse_cb =3D mp8899_parse_cb, \
> +		.ops =3D &mp8899_buck_ops, \
> +		.type =3D REGULATOR_VOLTAGE, \
> +		.min_uV =3D MP8899_VREF_MIN_UV, \
> +		.n_voltages =3D MP8899_N_VOLTAGES, \
> +		.vsel_reg =3D MP8899_BUCK##_id##_CTL5, \
> +		.vsel_mask =3D 0xFF, \
> +		.apply_reg =3D MP8899_BUCK##_id##_CTL6, \
> +		.apply_bit =3D 7, \
> +		.enable_reg =3D MP8899_SYSTEM1, \
> +		.enable_mask =3D MP8899_EN##_id##_MASK, \
> +		.curr_table =3D mp8899_current_limits, \
> +		.n_current_limits =3D ARRAY_SIZE(mp8899_current_limits), \
> +		.csel_reg =3D MP8899_BUCK##_id##_CTL3, \
> +		.csel_mask =3D MP8899_CURRENT_LIMIT_MASK, \
> +		.active_discharge_reg =3D MP8899_BUCK##_id##_CTL1, \
> +		.active_discharge_mask =3D MP8899_VOUT_DIS_EN_MASK, \

[Severity: Medium]
Since .active_discharge_on is not explicitly initialized here, it will
default to 0.

When regulator_set_active_discharge_regmap() attempts to enable active
discharge, will it write a 0 and inadvertently clear the
MP8899_VOUT_DIS_EN_MASK bit instead of setting it?

> +		.soft_start_reg =3D MP8899_BUCK##_id##_CTL2, \
[ ... ]
> @@ -746,6 +746,26 @@ static void mp8899_debugfs_init(struct mp8899_regula=
tor_info *info,
> +				struct i2c_client *client)
> +{
> +	char name[16];
> +
> +	/* Create root debugfs directory: /sys/kernel/debug/mp8899-<bus>-<addr>=
 */
> +	snprintf(name, sizeof(name), "mp8899-%d-%04x",
> +		 client->adapter->nr, client->addr);
> +	info->debugfs_root =3D debugfs_create_dir(name, NULL);

[Severity: Low]
Should this driver use the standard client->debugfs dentry provided by the =
I2C
subsystem instead of manually creating and managing its own root directory?

Additionally, if the system dynamically assigns an I2C bus number >=3D 1000,
will this 16-byte buffer truncate the directory name?

> +	if (IS_ERR_OR_NULL(info->debugfs_root)) {
> +		dev_warn(info->dev, "Failed to create debugfs root directory\n");
[ ... ]
> @@ -851,6 +851,46 @@ static int mp8899_i2c_probe(struct i2c_client *clien=
t)
[ ... ]
> +		if (vout_select & MP8899_VOUT_SELECT_MASK) {
> +			/* 1.0mV step mode */
> +			info->rdesc[i].linear_ranges =3D mp8899_buck_ranges_1000uv;
> +			info->rdesc[i].n_linear_ranges =3D ARRAY_SIZE(mp8899_buck_ranges_1000=
uv);
> +			info->rdesc[i].n_voltages =3D MP8899_N_VOLTAGES_1MV;  /* 3201 voltage=
s */
> +			dev_dbg(dev, "Buck%d: 1.0mV step mode\n", i + 1);
> +		} else {
> +			/* 0.5mV step mode */
> +			info->rdesc[i].linear_ranges =3D mp8899_buck_ranges_500uv;
> +			info->rdesc[i].n_linear_ranges =3D ARRAY_SIZE(mp8899_buck_ranges_500u=
v);
> +			info->rdesc[i].n_voltages =3D MP8899_N_VOLTAGES;  /* 3296 voltages */

[Severity: High]
The linear range for 0.5mV mode maps voltages to hardware selectors up to 4=
095:

static const struct linear_range mp8899_buck_ranges_500uv[] =3D {
    REGULATOR_LINEAR_RANGE(400000, 800, 4095, 500),
};

Since the regulator core uses rdev->desc->n_voltages for bounds checking
(expecting it to be max_selector + 1), does setting n_voltages to 3296
silently reject valid requests in the upper ranges of the PMIC?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-mp8899-reg=
ulator-driver-v1-0-30d14421b7f1@oss.qualcomm.com?part=3D2
