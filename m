Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C12E3A5E89
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 07:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779692740; cv=none; b=iocUDUBlqE/ZAzsxwdclgdpn9KK7VKNhAJ/cQoYBgN7qBD9Yoj8ZqGybC6rcSgmZJ4Jc+w+TGCmWHJoOLjLI5VaU8meLNen9Kf1XJ13xuq4CSEv7I6ZMb4dSTclvECWhv7lxC4ZhKw2BlkP3BDba88qhUFZOBpRpNdwkQMvmIHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779692740; c=relaxed/simple;
	bh=vQ0HG6h/IrTvpCXgtQoGw2ZSEd/GlpaYCtk5uIjOF6A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mH0yt0bHXjrlceZFJrFZujhZpgl+ttDZU7EJdua/HDjf5NK3OmeSv5gUa+WQ6n/vZn9ci9vpseVnXtKlY5rP3y+zVbFf9qpTOIgnQphhLq2TYFxVkcXvlTAHBpWAIfsxN8Pj7+2YCeTqCB0i0R0idpGlQy10W1RrEejPk69g7VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JUolPVjw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JUolPVjw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDF7A1F000E9;
	Mon, 25 May 2026 07:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779692736;
	bh=leWOtyNxqopbKyjmWyNvkGUTrXSBiZX95Te/85SrrOY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JUolPVjwc5qlrTDYtvDWauAWdGo6aFIM8uy74cD0JI86X0x/JZKJGF/LJ3t4geXhv
	 NqeUOa3pmrEAz0r81+I4X2qQ4awRKWAu8e4Sbng9F5LgsJMfI6G1Y/4xO1DRU1s9It
	 djsgnJ2G4u6iaoYGLuqlrAdozsPFKuVnCVXAiLTT8NCdBaFoVqIdUt6Wd6W1PsW9Qa
	 b6NROfHcFFN6urhpaI5SbR35sXOES/Mi4DMyaRQsYK7AdjBrKf178CTSYtnkp3myKg
	 XAlE2W8x8P9CJCW9Dkn5EIKuBXvaDQXIfrH5s0nvMaxeUN9DOff0bBFVCnfLcfkP/o
	 brIi8J7UGhCbQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 1/9] i3c: master: rename
 i3c_master_reattach_i3c_dev() to *_locked
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260525064209.2263045-2-lakshay.piplani@nxp.com>
References: <20260525064209.2263045-2-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 07:05:35 +0000
Message-Id: <20260525070535.DDF7A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The return value of `i3c_master_reattach_i3c_dev_locked()` is igno=
red in `i3c_master_add_i3c_dev_locked()`, which can lead to an I3C address =
collision and bus address slot corruption on failure.
--

commit c8a363e4e146cbd0fba01ffdf2e47defa9bd5b84
Author: Lakshay Piplani <lakshay.piplani@nxp.com>

i3c: master: rename i3c_master_reattach_i3c_dev() to *_locked

This commit renames i3c_master_reattach_i3c_dev() to *_locked() to make the
locking requirement explicit and consistent with other I3C core helpers
that require the bus lock to be held by the caller.

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 6b8df8089a357..c45b450af319d 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c

[ ... ]

> @@ -2358,7 +2358,7 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master=
_controller *master,
>  		if (!ret) {
>  			old_dyn_addr =3D newdev->info.dyn_addr;
>  			newdev->info.dyn_addr =3D expected_dyn_addr;
> -			i3c_master_reattach_i3c_dev(newdev, old_dyn_addr);
> +			i3c_master_reattach_i3c_dev_locked(newdev, old_dyn_addr);

[Severity: High]
This is a pre-existing issue, but does this code ignore the return value
of the reattach function on failure?

If i3c_master_reattach_i3c_dev_locked() fails (for example, if the
controller's reattach_i3c_dev callback returns an error), it internally
calls i3c_master_put_i3c_addrs(). This frees the dynamic and static address
slots by marking them as I3C_ADDR_SLOT_FREE in the master's bus address map.

Because i3c_master_add_i3c_dev_locked() completely ignores the return value
and proceeds to return 0 (success), the device remains attached and active
on the bus tracking the newly assigned dynamic address, while the bus state
considers the address slot empty.

Could this structural inconsistency lead to the master assigning the exact
same dynamic address to a new hot-joining device or during subsequent
dynamic address assignment, resulting in an address collision and bus
communication corruption?

>  		} else {
>  			dev_err(&master->dev,
>  				"Failed to assign reserved/old address to device %d%llx",

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525064209.2263=
045-1-lakshay.piplani@nxp.com?part=3D1
