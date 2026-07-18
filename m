Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561183CE4B2
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 17:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784395758; cv=none; b=M9UM0ttJbcnVA41YrDXkKSk7tCXqVq+Ii0X1B0jMfFSEc24e+OcQXNbNDvCvgQq72/70FF+BNmVnd7hZiEjo/5OPYOXBrmi6hLqFGMW5/89lkd2nB4KFdGq2vQFhPICEBMQrLmhhwVRWmX8i10JTxYcoI6do7N8kIc8az7+tFKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784395758; c=relaxed/simple;
	bh=G/AwbyIc6a9ZDqWUi+Hc9xoO6ZTKrjLUo3I2r6ErsUA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LhRfaQsp6S8HApHW0oOhR9kNR2Oq8TyUhPs1E+7/PVgPBtLIMUaPt4r8mbHGqqFvIxA9ln0XWb2/nqdnlaHTxhRSx3KxltuoE6ANOfopdaajFGOvNYhsjF5XKVyO7krU7q7cy+qFpossr58LxRf935gQWZzH3MhLi4CaNco6/zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jBiTfqS9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jBiTfqS9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EF9C1F000E9;
	Sat, 18 Jul 2026 17:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784395756;
	bh=ynX/GvdSy1iqtqqop050iFhyA9caZBIcjLPFPgiE1yk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jBiTfqS9AAqWdEZvMibuRhiALcIyUUrl14YkVkBOA1FjkGzc7tTXCOr/Xr4gihAxS
	 Z6jXOZfxGuwY6d9UagXL3093+vFrPRubhuoJsQL6lb60Vx7QvBnwguegzaMPdeB3kk
	 Tc/cwhaUMD16aJW70LBCFOGfFhAMkTI3u8dk58UBTwoJJyJZk4eTK22kadp9Cl+jdh
	 5ZIFOO1yzFvE72roMnRSqT+toKAhp98TwzfqVYkbokRK/Ez19o2mzYaHgYTwor6gHS
	 +s1mqQ5Po0JTxWdoe66pPDXRfZHdznvhd+9792MOTHZRVfejY8yoxF1jDtLWZRqOwj
	 ghv36b0G/tbHg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] usb: typec: mux: ps883x: refactor DP altmode
 handling and support TYPEC_DP_STATE_F
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jens Glathe" <jens.glathe@oldschoolsolutions.biz>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260718-ps883x-disable-usb4-v1-3-cec86d0b909e@oldschoolsolutions.biz>
References: <20260718-ps883x-disable-usb4-v1-0-cec86d0b909e@oldschoolsolutions.biz>
 <20260718-ps883x-disable-usb4-v1-3-cec86d0b909e@oldschoolsolutions.biz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 17:29:16 +0000
Message-Id: <20260718172916.9EF9C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Dereferencing NULL pointer during Thunderbolt Alt Mode teardown.
- [High] Failure to tear down DisplayPort Alt Mode correctly during SAFE st=
ate transition.
--

--- Patch [3]: [PATCH 3/5] usb: typec: mux: ps883x: refactor DP altmode han=
dling and support TYPEC_DP_STATE_F ---
commit 1182bfe184aec8b5b6e514d7c1a3d153c73073da
Author: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
usb: typec: mux: ps883x: refactor DP altmode handling and support TYPEC_DP_=
STATE_F

This commit refactors DisplayPort altmode handling into a helper function.
It also adds support for the legacy TYPEC_DP_STATE_F mode to ensure DP
altmode works correctly on certain docks during Type-C fallback mode.

> diff --git a/drivers/usb/typec/mux/ps883x.c b/drivers/usb/typec/mux/ps883=
x.c
> index 3fa26ce01a9c9..3533d4f363286 100644
> --- a/drivers/usb/typec/mux/ps883x.c
> +++ b/drivers/usb/typec/mux/ps883x.c
[ ... ]
> @@ -188,6 +188,25 @@ static int ps883x_configure(struct ps883x_retimer *r=
etimer, int cfg0,
>  	return 0;
>  }
> =20
> +static void ps883x_apply_dp_altmode(int *cfg0, int *cfg1, int dp_state)
> +{
> +	*cfg1 |=3D CONN_STATUS_1_DP_CONNECTED | CONN_STATUS_1_DP_HPD_LEVEL;
> +
> +	switch (dp_state) {

[Severity: High]
This is a pre-existing issue, but does this correctly handle tearing down
the DisplayPort Alt Mode?

When the system requests TYPEC_STATE_SAFE (mode 0) to tear down the alt
mode, dp_state will be 0. It seems the CONN_STATUS_1_DP_CONNECTED and
CONN_STATUS_1_DP_HPD_LEVEL bits are unconditionally applied here, and the
switch statement hits the default empty case. Because state->alt is still
present, the retimer remains inappropriately configured for DisplayPort
instead of resetting.

> +	case TYPEC_DP_STATE_D:
> +	case TYPEC_DP_STATE_F:
> +		*cfg0 |=3D CONN_STATUS_0_USB_3_1_CONNECTED;
> +		fallthrough;
> +	case TYPEC_DP_STATE_C:
> +	case TYPEC_DP_STATE_E:
> +		*cfg1 |=3D CONN_STATUS_1_DP_SINK_REQUESTED |
> +			 CONN_STATUS_1_DP_PIN_ASSIGNMENT_C_D;
> +		break;
> +	default:
> +		break;
> +	}
> +}
> +
>  static int ps883x_set(struct ps883x_retimer *retimer, struct typec_retim=
er_state *state)
>  {
>  	struct typec_thunderbolt_data *tb_data;
[ ... ]
>  		case USB_TYPEC_TBT_SID:
>  			tb_data =3D state->data;
> -
>  			/* Unconditional */
>  			cfg2 |=3D CONN_STATUS_2_TBT_CONNECTED;
> =20

[Severity: High]
This isn't a bug introduced by this patch, but will this cause a NULL
pointer dereference when a Thunderbolt device is unplugged?

During an active Thunderbolt device unplug, the Type-C bus core calls
typec_altmode_remove() which sets the state to TYPEC_STATE_SAFE and passes
NULL for state->data. Here in ps883x_set(), tb_data is assigned to
state->data and then unconditionally dereferenced just below this block for
tb_data->cable_mode, which seems like it would cause a kernel panic during
teardown.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260718-ps883x-dis=
able-usb4-v1-0-cec86d0b909e@oldschoolsolutions.biz?part=3D3
