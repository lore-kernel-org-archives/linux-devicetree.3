Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794484644;
	b=aR+geiTUs6XO6+XHXjiLyJIrbrFpAqzT+qk7bkue+ePpq40Oqc6BKRpkJJpKQyfFqE3C
	 EdOThHS0jcu25IXIv94qcb+WvwkSAe82gae8FHoXkVSS8ZrhnlhXeXux9cbyb2uFjZGiu
	 O+L9JFG/m9J2XHPYdBdM8hk+AAClr8NzHsI7wnEPnMLmqsVQxDTPgfo/WoKwJhVLz0TJK
	 TmwdR7TPsSbqOywLzr0NVMPno6k8/d4OxJ/kA7FGNgdwctygE5p0U07s+9ssa0r9YRK+p
	 LaTTnucb4I7j/fXZOEJMxSCDbr175ZyYmpIpq0svhKZWvcFKha5XG38PGeyuX1E4fMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484644;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bp/lLZL1SBFmFEQkQH5gmAHuHmDO473OO1jYcQt5nwo=;
	b=bGb3PAqPAoCPLUpjK9S47k82Wa4gT468DjZrh+V5naW+84cUjtpOkqXd6GQ1CebFsV/M
	 m6EqLCFXIvZHUNxAO4g4Hevoy/1AjVu/MGd4tG4OxHFd/ISKrPf9hzwND0+KbzUMSA+Bw
	 2vl1nb45HrpbJDiqkqUNgzGh5OLNYpe51eIm42RtOzjwNcyj7WN9mDzJ1bANPmPfM9xuX
	 3aF1V01omIiRpDk8tlLeywxlYZRM481TeIL5RalV+So+ySwo2WqqGc7NAos2e4uECwqoc
	 gGYGGc0+PDa7/gpqQfm+JJ3+Uuc71m/ywG/6XLmBf6TzEEEY2KxQED+TaydpxuOFLbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DrdTW7Rb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BC0606A31C
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 11:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DrdTW7Rb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2B871F00A05;
	Thu, 12 Nov 2026 11:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794484643;
	bh=bp/lLZL1SBFmFEQkQH5gmAHuHmDO473OO1jYcQt5nwo=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=DrdTW7RbwQixGyITa2oRKKftxgf8uk5C5Q4gQPa4V7h4+B/Il0SqVgubFA1AEZGW3
	 hPtb8WMpSAhCt2HkYkHhmj3QOF+gMa3MNHtq9YJtvRjM5eGn/oeUkNHcJEghCkNRm8
	 2A6HUzabaOgnOtqc7hPUB3Ojr6mhXa+dwNl8vpGd4ZmnvXkszOi5b0qU0T9Fo/2gQF
	 evYImBInlYGw3DbqEhlSd2hVUy1sEwRrVxhJFCnxLQmMwG37M3Gg019cFCZUfPRC0p
	 2k37qnz4fgvIgEcOcFqBJipDX9j8gQ4CyFmpA6pLsVnQL2J+Gjak5Pv8cxJZ+UiCvf
	 e2BzuZkSE/rKw==
Message-ID: <sashiko-outbox-211056@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 3/8] nvmem: core: take a reference on dev.of_node in
 nvmem_register()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manikandan Muralidharan" <manikandan.m@microchip.com>, pratyush@kernel.org, mwalle@kernel.org, takahiro.kuwano@infineon.com, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, linux@armlinux.org.uk, richardcochran@gmail.com, arnd@arndb.de, linusw@kernel.org, enelsonmoore@gmail.com, aaro.koskinen@iki.fi, pengpeng@iscas.ac.cn, mathieu.dubois-briand@bootlin.com, gregkh@linuxfoundation.org, michael@walle.cc, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <2bc9cde2ff5bfa2bc55bf12407bfc08f6a467bb6.1794391660.git.manikandan.m@microchip.com>
References: <cover.1794391660.git.manikandan.m@microchip.com>
 <2bc9cde2ff5bfa2bc55bf12407bfc08f6a467bb6.1794391660.git.manikandan.m@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 11:57:22 +0000
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
- [Low] nvmem: core: missing Fixes trailer for nvmem_register() of_node
  reference fix
--

commit 34145a3067cdfbb6bf1220c524a41a448d6b7c85
Author: Manikandan Muralidharan <manikandan.m@microchip.com>

> nvmem: core: take a reference on dev.of_node in nvmem_register()
>
> nvmem_register() stores config->of_node (or config->dev->of_node)
> into nvmem->dev.of_node without taking its own reference. Callers
> that get the node via of_get_compatible_child() etc. and drop their
> reference right after registering leave nvmem->dev.of_node backed by
> no reference at all.
>
> Take an of_node_get() when assigning nvmem->dev.of_node and release
> it in nvmem_release(). Existing callers that hold their own get/put
> pair around the registration call need no changes, since get/put on
> a device_node is per-holder and independent of core now also holding
> one.
>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Michael Walle <mwalle@kernel.org>
> Suggested-by: Michael Walle <mwalle@kernel.org>
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>

[Severity: Low]
This fixes a missing device_node reference in nvmem_register().  Should
the commit message include a Fixes tag for the commit that introduced
config->of_node handling:

  Fixes: 1333a6779501 ("nvmem: core: allow specifying of_node")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794391660.gi=
t.manikandan.m@microchip.com?part=3D3
