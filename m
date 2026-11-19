Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795086981;
	b=QRBG1bjMRtmVhIJC8mEdLovwk51TaVyvSKiMnR3KDvp54kf1FdzkwadGiZzxhtiU1O90
	 YDxFscCreVWdAJBIChet0dxkapU9P7/kh1yMeSUk8RqGTUewvO3TyPTMrNBGQwiLwpm/H
	 WyOQ/lwVCm5XbanapqRWuKZNrtxyohR8CcItVyXen0MNXKyxOdFMgzhefOt24Mlr2p5So
	 SjE4Rwwtzbd2YFozOy+Wb8A3SFRotpjKmLzI5D8jVGdV5o8VqimXM/UUUPEauKeYPkkk0
	 RWn9hTK8/KWVqXKWPj11QqdwMI9WHSFnllwv61wZJhH+GSyR0DaCEN2Gb/eUiJDGUMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795086981;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VJyLh7+KAZQJEYKgtBeByY5mEAx5pFVZykglcm9ig9I=;
	b=E4nCV5IEJPwJyZNoAIUUOa4+KvzSJoUBB344HmpZLSXKi4fzRvrzNoZVfJ/VTkP5yJ3o
	 vubWcs6RdIdQYx5Xq0nn6llgFxUqrs5yV57uSewkwCuiNgoL8libIanpdh8nWtTKIDOQ3
	 kuH5I5EFckGqUF1Auc+TCi7Y4AKqDlL1nIiKyzoyuow5BC87ONYzWOEZrOv8efScNnnit
	 IUglOtHKBkYSz4F9loU6NBnYJE3fG/Cf5/z6bC6PNCkaOaFUplgEKsD6WSQLGBt8iakce
	 +6S2F8tMjhctITi0fI8R+4ubx42d4Z31N73qn2se6PwUIW67VAweyCO9pY/oGuC9qvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eBv7WQw3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A04606A320
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 11:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eBv7WQw3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36DEB1F000C6;
	Thu, 19 Nov 2026 11:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795086981;
	bh=VJyLh7+KAZQJEYKgtBeByY5mEAx5pFVZykglcm9ig9I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eBv7WQw3JzdSbok2TVWLYhGI+LiRV3ek6QbZv/w0sAN4mXK3m9YG3GQzrsWCk1Anf
	 Px5n7F4OoaeLCzHWZy0lKwjnllZtOXI85fDV2Co4V9NwbxBnLzNj0KcNR2iZfIxETe
	 IXOHnfccUnzTsuiFlxAI7FEZ9ylNxxpRL3rpDwseXuadlnLotI6i2TYQpmsxM3CmUU
	 twVUpYBdRABbRyIs/h8OlrtJnYVi98lvfIVbb8OHHlndB+UzLL9Bkw2xnrZdM9O86j
	 B2LlGQ0danilhPsg1Rzq8KTbvopm6bc1pRhlrlA/MWY20dE7vKrJeJAR8EeI8hmMAf
	 7wnQ9l7UGqiFw==
Message-ID: <sashiko-outbox-223016@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 5/5] bus: simple-pm-bus: Populate child nodes at
 probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herve Codina" <herve.codina@bootlin.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119110014.582363-6-herve.codina@bootlin.com>
References: <20261119110014.582363-1-herve.codina@bootlin.com>
 <20261119110014.582363-6-herve.codina@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 11:16:20 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] bus: simple-pm-bus: invalid Fixes trailer SHA 628b8ca3e915
--

commit e4f7a29754a7ea513e3c43d4f852eb4379192762
Author: Herve Codina <herve.codina@bootlin.com>

bus: simple-pm-bus: Populate child nodes at probe

This commit updates simple_pm_bus_probe() in drivers/bus/simple-pm-bus.c
to populate child devices during probe for transparent bus matches via
of_platform_default_populate(), and updates simple_pm_bus_depopulate() to
depopulate directly when runtime PM is not enabled.

[Severity: Low]
In the commit message, the Fixes: trailer references commit 628b8ca3e915
("bus: simple-pm-bus: Remove child devices when the bus is unbound"),
which cannot be resolved in the repository and points to an unmerged
patch from earlier in the same series rather than a stable upstream
commit. Probing transparent bus-only devices in simple_pm_bus_probe() and
returning early without populating their child nodes during probe was
originally introduced in commit 98e96cf80045 ("drivers: bus:
simple-pm-bus: Add support for probing simple bus only devices").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119110014.5823=
63-1-herve.codina@bootlin.com?part=3D5
