Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF7A1ABED9
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 09:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780047046; cv=none; b=ddWvn1/sEHnaZSuVs0RAubvqOrDLYVuRTU/qhD1Jz6/moi46WIK/L5D8ZmN27vpLdoBcGed9BKL5Klr1aA+TmGVSNgnxdUaDzPJnCdHmDw5XAL5lxtTcdn9jTRkVj4nqehAbZglgT0CHFLrPosapiQSxrio/h2XkI3ywDjpiRvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780047046; c=relaxed/simple;
	bh=ElRI4n8aLcmNEXHtK8hkpxBbmKCeNh/qtKL9tf4sz2c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WsnHnKh/YEgjOyE4PAQRtrdhezDVNaQSr21/zcZFL6SiQHykWo9TO4E5ivY7n2ORB8LPRWeTDlz5L+N4A4cxqD4q+TIK7/NACub6xK6NCefg4dE+E7AdzPVbZJnYvKTz/ywPegG0n1K3vNuy2SdPTTwMbdOaCNHI/VUbF2tewEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BuaX59IY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BuaX59IY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7CC11F00893;
	Fri, 29 May 2026 09:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780047045;
	bh=d5MAZtVTisSGFGAD5CxHncH6lbC9FtlQynGJsg36V54=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BuaX59IYIk0rqSULkpdj1h3S0NMY7awpWocHy87OpfisEw+tnE8YBuG/RiYBrCxbi
	 DtZl9RLqfFLCUGbiCEMOwM1pzK/Jk/u7Hh6MmFFo09r3fmWINREQdhHspo2A+NnpDO
	 1vhDLNZIoP1aBKog+vlHLA/MyBQYPlPTc7nfP0nS1Tq6oA6930BNiivl807/MiYagZ
	 Vvug20PuwXp2rnn8HhP7vypt3exnVTsdy0h0uUapAFiu3NmZYr00ZEy7aztyZULRhL
	 JI48TkAtlfUTFMX4uflTsLkm61pCRMHY66CO6UTFSJRIUzFeoy/LyYscTBs4ooET6J
	 lv6Q+jwgAoDEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 10/15] drm/tidss: Add support for DPIENABLE bit
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260529-beagley-ai-display-v3-10-7fefdc5d1adf@ideasonboard.com>
References: <20260529-beagley-ai-display-v3-10-7fefdc5d1adf@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 09:30:44 +0000
Message-Id: <20260529093044.C7CC11F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message claims to modify the DPIENABLE bit in `dispc_=
vp_enable()` and `dispc_vp_disable()`, but the code actually implements thi=
s in `dispc_vp_prepare()` and `dispc_vp_unprepare()`.
--

commit 5f892829b86a9d1dabfa16f8442393394955354e
Author: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

drm/tidss: Add support for DPIENABLE bit

This commit adds support for the DPIENABLE bit in the VP_CONTROL register,
which provides power savings on the AM62L SoC when disabled. It introduces a
new feature flag to track this capability and updates the initialization
paths to disable it by default. The driver then turns the bit on and off
when DPI output is active.

> Let's add a new feature flag for this, 'has_vp_control_dpienable', and
> implement the support.  Disable DPIENABLE for all videoports at resume
> time, so that it is 0 by default. Specifically enable and disable it in
> dispc_vp_enable() and dispc_vp_disable() for DPI output.

[Severity: Medium]
Is the commit message accurate about where the bit is enabled and disabled?

The commit message states that the DPIENABLE bit is managed in
dispc_vp_enable() and dispc_vp_disable().

However, the patch actually applies these register modifications in
dispc_vp_prepare() and dispc_vp_unprepare().

Could the commit message be updated to correctly reflect the functions
modified in the implementation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-beagley-ai=
-display-v3-0-7fefdc5d1adf@ideasonboard.com?part=3D10
