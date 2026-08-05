Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181EB46D0A5
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 13:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785936541; cv=none; b=HR6JqaBMr18vkWEeiA1vgJbvrPLfvwdoC1bBwOK234CYndy9Wz2QiyYkoobUhJd+to0873K35hV6dJ68h+gJyqhW2kB74eZWcft0F7oc8ovR2GGoupprsy5K7MmlZ/cVALXN5lec3EhgBEZnVwf40vP8c5UOf2oC47P7hPtrffk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785936541; c=relaxed/simple;
	bh=CRVl1PguVvKokne+x0U84g4et2PCr5fA1Gx7q9CtcL8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=U5xu51SJsTA1xNCAvvsDPjOS2HA+1BCTZxTYlkP8UVH/9PljHhKi1/NxOAH1GIZK6a8EnMD3csh3MlqGbIyAf0G8eJDOHcsjD3uz0gXJK0O5UC5vteKoC4QaIEWJPqavO9k7HF8UdjE3TmM1pxqHVyrW1zuURf6yrpv1Xc2hSB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ampynMfc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ampynMfc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F6DA1F000E9;
	Wed,  5 Aug 2026 13:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785936539;
	bh=pPl23Ygq5cSyyL8X48W+uRm0wILz843yPKxpk3Rywy8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ampynMfcQbwWvVuheCt/cLgdcT33U8xjzZVGdrvhJDXMJl3AuuNhLC9TeAkbTeMrM
	 6cyU0NMlGtgbSN89hTlOaFl1kQtuep8WP9U5pCBMg+zxgrts+/fCKw1YDu91WWsqW4
	 yBfVeJx4jMdqNwafuy34zgtz2YP8Ld0wvlK5V30ug0XhHWo36tz9FaxXlZpmTxe21T
	 JJOgYAM6zEEJn59pw3Oc7Gk8OSx5FSawKghaK785eF4zYZbcKFwE6ayJfDfjccDLoR
	 Pdwpd1sNCf8yjwCfC8uKUz9DZWgi+ou7BvaFwCyjQEp58DzV7L8+B1bDM8bEmA6WX1
	 GNy0iIPFtYypA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 10/12] ARM: dts: aspeed: anacapa: Add LPDB fuse
 monitor GPIO expander
Reply-To: sashiko-reviews@lists.linux.dev
To: "Colin Huang" <u8813345@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260805-anacapa-devlop-phase-devicetree-v4-10-5d67e0efa6c5@gmail.com>
References: <20260805-anacapa-devlop-phase-devicetree-v4-0-5d67e0efa6c5@gmail.com>
 <20260805-anacapa-devlop-phase-devicetree-v4-10-5d67e0efa6c5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 13:28:58 +0000
Message-Id: <20260805132859.6F6DA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Meaningful code and commit message mismatch: The patch modifies =
userspace-visible `gpio-line-names` for existing `gpio@22` and `gpio@24` ex=
panders on both LPDB and RPDB without documenting these changes.
--

--- Patch [10]: [PATCH v4 10/12] ARM: dts: aspeed: anacapa: Add LPDB fuse m=
onitor GPIO expander ---
commit dcdaa17a966db9099c36ac9d58c5a7e8e75f9c5d
Author: Rex Fu <rex.fu.amd@gmail.com>

ARM: dts: aspeed: anacapa: Add LPDB fuse monitor GPIO expander

This patch adds the PCA9554 GPIO expander for PDB fuse monitor signals on t=
he
Anacapa BMC board. It adds definitions under the i2c8 multiplexer for both
left and right PDBs.

> ARM: dts: aspeed: anacapa: Add LPDB fuse monitor GPIO expander
>   =20
> Add the PCA9554 GPIO expander for PDB fuse monitor signals.

[Severity: Medium]
This isn't a bug in the code, but does the commit message fully describe the
changes in this patch?

The commit message solely claims to "Add LPDB fuse monitor GPIO expander", =
but
this patch also adds the RPDB expander and modifies userspace-visible
gpio-line-names for existing gpio@22 and gpio@24 expanders on both LPDB and
RPDB.

For example, it renames "RPDB_I2C_TEMP75_U8_ALERT_R_N" to
"RPDB_I2C_TMP432_U8_ALERT_R_N", and adds new labels like "RPDB_SKU_ID0" and
"LPDB_VERID_A0".

Could the commit message be updated to reflect these functional hardware la=
bel
changes and the addition of the RPDB expander?

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-dvt.dts=
 b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-dvt.dts
> index 0eb547ad0ec16..f09dd1abe77d8 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-dvt.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-dvt.dts
> @@ -8,6 +8,93 @@ / {
>  	compatible =3D "facebook,anacapa-bmc-dvt", "aspeed,ast2600";
>  };
> =20
> +// MB - PDB
> +&i2c8 {
> +	i2c-mux@72 {
> +		i2c8mux0ch0: i2c@0 {
> +			gpio@22 {
> +				gpio-line-names =3D
> +					"RPDB_FAN_FULL_SPEED_R_N", "RPDB_I2C_TMP432_U8_ALERT_R_N",

[Severity: Medium]
This is where the undocumented RPDB expander definitions and gpio-line-names
modifications are introduced in i2c8mux0ch0. Should these be split into a
separate patch or documented in the commit message?

[ ... ]

> +		i2c8mux0ch1: i2c@1 {
> +			gpio@22 {
> +				gpio-line-names =3D
> +					"LPDB_FAN_FULL_SPEED_R_N", "LPDB_I2C_TEMP75_U8_ALERT_R_N",

[Severity: Medium]
Similarly here for i2c8mux0ch1 in the Left PDB, the patch introduces
undocumented label additions and modifications to the existing gpio@22 and
gpio@24 expanders. Should these changes also be mentioned in the commit
message?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-anacapa-de=
vlop-phase-devicetree-v4-0-5d67e0efa6c5@gmail.com?part=3D10
