Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13924F30E7
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 10:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861914; cv=none; b=UllJwCNdVnvpHaa9LytEeJnc64pU98Kjk8Ldi15KXeceWiTXxsF0fC2ShMSfheU2K+edV4e0spSux7ynL84zEZaPgfp6kUBUAATyxJejuG3zBTqWoP348w7SEWUo+cvV4bI+8gVE8r7AfMTv9lzSuOMO9GR8WFlNpyUQIDYj/j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861914; c=relaxed/simple;
	bh=M/rcMXLiJzhgYINx1yrCAd8yfWAt7KfR82u5/Pl5UZE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R8+j96gy8m3jF/aRleXU7iYlGjA1ul9OxdO5Nu7Ztq8svNiUOOw/7SRNmHa+9Dcm4YHhyt34CiEMHJ6Z7qwO70lzbfkmXNAOdKzrjAZnWmOdImQuHVC3kj+F+IYJ1h/jbnNrmOXTQkYIvDznC2t/A7QCiIR21a2j4bBEuj+ugmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SbD5Tl3e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SbD5Tl3e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38FE81F00A3A;
	Tue,  8 Sep 2026 10:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788861912;
	bh=dFC4sGYCBQ/hvi2SOCJ1HAdYNK0ldT1ZYBlrU54XG90=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SbD5Tl3eBfQto3J9ZgnKLVQTEatC+91EFM99p7m1f4iLj3d3hdYZjK2sWFP2hepVx
	 iRIuFlUH9ZwenwhZIlPbzgnkfL+1rTD8xnCZz3SH2oRaOjsq/K3cb8ve0+nCXTM2hh
	 oH7FHA65V9hLz6O/gPZp+10zpvX0xBnrmDk/fYvC9lTuIYzuwCdL+vIEYMMGaWpMme
	 UrRzOP9WNud3KlrRx8k9UkJVs8s41Y6VKu4eVa4jrMNvVmBCARMf8bACCNmb/DQjhD
	 zpJsXiCoBc+iqnDRtGU68CWxZw10uNnsijOYysLHyidKtidk/myuejI5axXzei7j82
	 Wqa101UpJduvg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/9] usb: chipidea: usb2: add SpacemiT K1 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junzhong Pan" <panjunzhong@linux.spacemit.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260908-b4-spacemit-k1-usb2-v2-5-f07342ffa051@linux.spacemit.com>
References: <20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com>
 <20260908-b4-spacemit-k1-usb2-v2-5-f07342ffa051@linux.spacemit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 10:05:11 +0000
Message-Id: <20260908100512.38FE81F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Dynamic dual-role switching via `usb-role-switch` or `extcon` is c=
ompletely broken when `CI_HDRC_DUAL_ROLE_NOT_OTG` is used.
- [Medium] Unsafe unconditional accesses to the OTGSC register on platforms=
 without OTG registers.
--

commit 8804983329a666f72771103794460f9ba731c4b4
Author: Junzhong Pan <panjunzhong@linux.spacemit.com>

usb: chipidea: usb2: add SpacemiT K1 support

This commit adds a compatible string and platform data for the SpacemiT K1
USB2 controller. It configures the hardware with specific flags to account
for the lack of internal OTG register support.

> diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/c=
i_hdrc_usb2.c
> index f81673edca3c1..606ca367343f3 100644
> --- a/drivers/usb/chipidea/ci_hdrc_usb2.c
> +++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
> @@ -40,10 +40,18 @@ static const struct ci_hdrc_platform_data ci_zevio_pd=
ata =3D {
>  	.flags		=3D CI_HDRC_REGS_SHARED | CI_HDRC_FORCE_FULLSPEED,
>  };
> =20
> +static const struct ci_hdrc_platform_data ci_k1_pdata =3D {
> +	.capoffset	=3D DEF_CAPOFFSET,
> +	.flags		=3D CI_HDRC_DISABLE_STREAMING |
> +			  CI_HDRC_FORCE_VBUS_ACTIVE_ALWAYS |
> +			  CI_HDRC_DUAL_ROLE_NOT_OTG,

[Severity: Medium]
This isn't a bug introduced by this patch, but this flag configuration
exposes a pre-existing flaw in the core driver. Can the K1 SoC bus fabric
generate a slave error for accesses to unimplemented registers within the
USB IP?

During a USB resume following a wakeup event, ci_controller_resume()
unconditionally calls ci_extcon_wakeup_int(), which does a blind read to the
unsupported OTGSC register:

drivers/usb/chipidea/core.c:ci_extcon_wakeup_int() {
        ...
        u32 otgsc =3D hw_read_otgsc(ci, ~0);
        ...
}

Similarly, if power is lost during suspend while in host mode,
ci_power_lost_work() calls ci_handle_id_switch(), which unconditionally
calls ci_otg_role(), resulting in another read of OTGSC.

If the K1 hardware generates an access fault instead of returning 0 for
unimplemented register reads, could this cause a synchronous load access
fault on resume or wakeup?

[Severity: High]
This is a pre-existing issue, but does dynamic dual-role switching work on
this hardware when using this flag?

The CI_HDRC_DUAL_ROLE_NOT_OTG flag forces ci->is_otg to be false. However,
the role switch framework relies on ci_irq() to process changes. Looking at
ci_irq_handler(), the entire extcon and OTG event processing block is gated
by a check for ci->is_otg:

drivers/usb/chipidea/core.c:ci_irq_handler() {
        ...
        if (ci->is_otg) {
                otgsc =3D hw_read_otgsc(ci, ~0);
        ...
}

If a Type-C controller or extcon driver invokes usb_role_switch_set() or
ci_cable_notifier(), both call ci_irq(). Since ci->is_otg is false, will
these events be silently ignored by the handler, leaving the port stuck in
its default role despite the standard kernel APIs being registered?

> +};
> +
>  static const struct of_device_id ci_hdrc_usb2_of_match[] =3D {
>  	{ .compatible =3D "chipidea,usb2" },
>  	{ .compatible =3D "xlnx,zynq-usb-2.20a", .data =3D &ci_zynq_pdata },
>  	{ .compatible =3D "lsi,zevio-usb", .data =3D &ci_zevio_pdata },
> +	{ .compatible =3D "spacemit,k1-usb2", .data =3D &ci_k1_pdata },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, ci_hdrc_usb2_of_match);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908-b4-spacemi=
t-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com?part=3D5
