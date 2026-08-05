Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D532A42EED7
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 13:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785936288; cv=none; b=MqX6Cvpg3+QsoIBsf1biQot5AFjhtTDbROgeyWFSD3rnAktXIxYKN/7eSAfhr+yGGRkvcr+36GulI6d29XcGlIAfKW+DDn1B0ETwMB2frtXyqsdl74LnyWrQyLep6Yi34pbsiyqwnBg/QyuM2+pixoRFTxhoadIQQ4gBJjqwvAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785936288; c=relaxed/simple;
	bh=r7DxIYkkkcZ1cmvzUcBNtIDFXQZlcNY+/Xomdc0hJRo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RkKY8mbGjtoFgZRgf3Z0PH9b08WPchDvDDL12MDdJv6fnHBKqFKByUeueEMSw++3MPtvRLOH1jNBrvnNufRDWwQzJnZDfbC5V9TY2Cb7ZqD50h4xvMWn5RZKCH/27D/484daQfOilzjQHnd71uG6XAfoAxl3Mz5DtdMq9NmdKAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nfQZumP8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nfQZumP8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C0C21F000E9;
	Wed,  5 Aug 2026 13:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785936287;
	bh=r7DxIYkkkcZ1cmvzUcBNtIDFXQZlcNY+/Xomdc0hJRo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nfQZumP8pOnrlBESRESEKbrXGuNLDRfQEPuk17sdBgu+70OpDnUSrtznrR1NoFDtA
	 zF/G2YWvvRB08BNlQcip7KoD50I3cpLOWmGuFfVzWhfXYZjJ/vky9ur4FpawMoIWI0
	 d/0Zy4sLHgP9+XwMrg7gsfvmHOYaTTSMFxpT9b8Zrf4Y/tB8CVDKc3Y4k5xapyX6w6
	 /b/qx8e5uBZ0qA+AXolF9b+Bs/7nj+P5FVrkMDQi2HpaSVjmL0K2/RGMOghfSHab/9
	 CpzG8XYV6+y1cuJ9DJJRCiFWpkKe2+oWzKDAud6oNyHiykhYdgxPWHiD03ekncpCWr
	 cbraLBA4mpfOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 11/12] ARM: dts: aspeed: anacapa: Simplify leakage
 GPIO line names
Reply-To: sashiko-reviews@lists.linux.dev
To: "Colin Huang" <u8813345@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260805-anacapa-devlop-phase-devicetree-v4-11-5d67e0efa6c5@gmail.com>
References: <20260805-anacapa-devlop-phase-devicetree-v4-0-5d67e0efa6c5@gmail.com>
 <20260805-anacapa-devlop-phase-devicetree-v4-11-5d67e0efa6c5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 13:24:46 +0000
Message-Id: <20260805132447.3C0C21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Commit message body inaccurately limits the scope of the change to =
'leakage present' signals, whereas the patch also updates standard 'leakage=
' signals.
--

--- Patch [11]: [PATCH v4 11/12] ARM: dts: aspeed: anacapa: Simplify leakag=
e GPIO line names ---
commit e7d857ae3e79d3f73dec753a5762ce9623e510c0
Author: Rex Fu <rex.fu.amd@gmail.com>

ARM: dts: aspeed: anacapa: Simplify leakage GPIO line names

This commit simplifies GPIO line names by removing board location suffixes.
It updates names for both standard leakage and leakage present signals in t=
he
anacapa device tree.

> Remove the board location suffixes from the leakage present GPIO line
> names. The channel number is enough to identify each leakage present
> signal.

[Severity: Low]
This isn't a bug, but does the commit message body unnecessarily limit the
scope of the change?=20

The text only mentions modifying "leakage present" signals, but the patch
itself also modifies standard "leakage" signals (for example, changing
"Channel0_leakage_EAM3" to "Channel0_leakage" in sgpiom0).=20

Could the commit message be updated to clarify that both standard leakage
and leakage present signals are being renamed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-anacapa-de=
vlop-phase-devicetree-v4-0-5d67e0efa6c5@gmail.com?part=3D11
