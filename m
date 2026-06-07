Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9412C15AC
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 05:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780810987; cv=none; b=juK1DTf806jOEm2uL1qE9/tM27hP1s96Ssug8WAJ35UPXgqwAf3A9r3ALtGbO2mplzYThdcJnUek8MgHT40pEO1a5+c78fse/RDszYJuPAN2xbgWaMZ4V1u+SxeEDzxI2Q95Fn9DW6qrkNbzBjUKiD6fQl4vd+1QJLeSRrQkQMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780810987; c=relaxed/simple;
	bh=DsafdBtrHojwPAuN8mX/+pQ6knQ3meZhx9edlPWSiX8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=thJvrDNzjHOnbDUvV0200vxACvhmLhkU+XHCqmk0LrupV2QQrPOcD17uyuG76dc/An7V3bseHM1yf3RsXY15zuFjwNryCV/vqIsjYogj/sSrDYf/WfQugfowiwiNN8xtUoI0sqOUsCzTKhzU26H4AdU9MwZFvLgnnehph8RF8Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V8Vj/XPs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V8Vj/XPs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E651F1F00898;
	Sun,  7 Jun 2026 05:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780810986;
	bh=7yd8psW6xCIbPX94Bf1/t+ZVaTU7Iulky9+Jaq40Zkc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V8Vj/XPsigKHSdk4nW0nFKpJQJbdBv78neyZnt7Ok0KR5QMOcsIMt/1WQ8r9lN6OX
	 KBoZg4Z2WraPsg4EmM/jC/Wuwwk0bKq4eKEhT6NbJjC7AUVWJkOIvBrrdQ/s582VDR
	 TvEFmqec8d0MaKij0iXDmz9FQQ0+/ULM6QBKnBUQdoDwIOy6PEL0O5bg+K5ik8Q40n
	 MYkqTsHHQE1MAtS7S7avA2D3TizikT9f6gQpnLOok8AeSH9WwEjNj2puSgol7plfoR
	 Wew05aR0L85WTL4ZqGGB3UMhoBbUtxQeh+6sswzyt3uvNP4u9EG8yBY75CGOo6W4Mo
	 so2HGKvWvnkqA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 16/16] Documentation: networking: Add
 timestamp related APIs to OA TC6 framework
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal via B4 Relay" <devnull+Selvamani.Rajagopal.onsemi.com@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260605-s2500-mac-phy-support-v4-16-de0fbc13c6d8@onsemi.com>
References: <20260605-s2500-mac-phy-support-v4-16-de0fbc13c6d8@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 07 Jun 2026 05:43:05 +0000
Message-Id: <20260607054305.E651F1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Grammatical error in the documentation for `oa_tc6_ptp_register`.
--

commit 8f2a062008b600191ed2cb723672d131304ece09
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

Documentation: networking: Add timestamp related APIs to OA TC6 framework
   =20
Added new APIs to support hardware timestamp feature as defined in
OPEN Alliance 10BASE-T1x MAC-PHY serial interface specification.

> diff --git a/Documentation/networking/oa-tc6-framework.rst b/Documentatio=
n/networking/oa-tc6-framework.rst
> index fe2aabde923a5..694d9485b1c5b 100644
> --- a/Documentation/networking/oa-tc6-framework.rst
> +++ b/Documentation/networking/oa-tc6-framework.rst

[ ... ]

> @@ -495,3 +499,75 @@ the MAC-PHY.
>  Zero align receive frame feature can be enabled to align all receive eth=
ernet
>  frames data to start at the beginning of any receive data chunk payload =
with a
>  start word offset (SWO) of zero.
> +
> +.. c:function:: int oa_tc6_ptp_register(struct oa_tc6 *tc6, \
> +                                        struct ptp_clock_info *info);
> +
> +Registers the PTP hardware clock related functions with the kernel.
> +This API simply registers. Initialization of the fields in the
> +ptp_clock_info structure are left to the vendor as programming hardware
> +timer is expected to be vendor dependent. The fields max_adj, owner,
> +and all the functions for the clock operations, like adjfine, gettimex64,
> +settime64, adjtime are expected to be initialized in the structure before
> +calling the registering the hardware clock.

[Severity: Low]
This isn't a bug, but there is a grammatical error here: "calling the
registering the hardware clock". Could this be rephrased to something like
"before registering the hardware clock"?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605-s2500-mac-=
phy-support-v4-0-de0fbc13c6d8@onsemi.com?part=3D16
