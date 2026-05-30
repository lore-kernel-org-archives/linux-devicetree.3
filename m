Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B7C3C1F;
	Sat, 30 May 2026 10:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780136704; cv=none; b=TzdnjTuQW3XinkCEV2nMdYYrzgT8Stt36tD57HY7IfBr9dhhDbcH7vncxzQhNmyj4w8Kdqqzhye7KCmfhmgWvLVDiMo286a8ocp2qWPL0OIKfBLnVMl/ZzLAyEVg/1ixiAakrDO+PTxC7/+h5F3/gKNB88YVMUpiR0srB7sexE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780136704; c=relaxed/simple;
	bh=7DclqNSWpjRXXBRFWrNUXdTeUwXd2xsqw56KwwCn1mQ=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=MZbIg/SG49G4z87VpfyMcqx7n7TNflbP85KRr7ZlnGXc8dDgsqmNP1WFhQqms25xSprNLs8xb6i3TAud0MRvB+ooM88pCoGYTfmWzfVqH016GhIBSaXHVVJ8TLb9eTb3prVkS/EI97omL40ZaZ0x0UWzQkQeUjK/OqnH/X3tZyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=srFsXAr0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="srFsXAr0"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:382:6f:8c15:9eec:bfe9])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 517277CA;
	Sat, 30 May 2026 12:24:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780136679;
	bh=7DclqNSWpjRXXBRFWrNUXdTeUwXd2xsqw56KwwCn1mQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=srFsXAr0aGam8biawfn9fF17wEv2Y4RFd4XGkHIuo07DywhfuLMYY1MlDH+iHORoa
	 VHvqYgoLtLWqpr6Sh+ICtCE0juXNCyU7z/IsLgvZLrDnG20NxLFbGha8n/G9UbvhHn
	 L9a3FM/Wqg+NoLQbgPZoetReNlaQh4tfaEN1+EVw=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260529150119.dqzzruc7xqliftwp@bullhorn>
References: <20260515-beagley-cameras-v2-0-f6acb66c9995@ideasonboard.com> <20260515-beagley-cameras-v2-3-f6acb66c9995@ideasonboard.com> <20260529150119.dqzzruc7xqliftwp@bullhorn>
Subject: Re: [PATCH v2 3/4] arm64: dts: ti: k3-am67a-beagley-ai: Add overlay for IMX219 on CSI0
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Robert Nelson <robertcnelson@gmail.com>, Andrew Davis <afd@ti.com>, Devarsh Thakkar <devarsht@ti.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Nishanth Menon <nm@ti.com>
Date: Sat, 30 May 2026 15:54:55 +0530
Message-ID: <178013669509.933414.8765119606360834035@freya>
User-Agent: alot/0.13.dev20+g31692a239

Quoting Nishanth Menon (2026-05-29 20:31:19)
> On 06:46-20260515, Jai Luthra wrote:
> > RPi v2 Camera (IMX219) is an 8MP camera that can be used with BeagleY AI
> > through the 22-pin CSI-RX connectors. Add a DT overlay to enable use of
> > this camera sensor through the CSI0 connector.
> >=20
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > ---
> >  arch/arm64/boot/dts/ti/Makefile                    |   4 +
> >  .../dts/ti/k3-am67a-beagley-ai-csi0-imx219.dtso    | 121 +++++++++++++=
++++++++
>=20
> Oh man..
> https://lore.kernel.org/linux-arm-kernel/20240702164403.29067-1-afd@ti.co=
m/
> comes to memory.. Afd - what ever happened to that?
>=20
> other than the dsi mux, painful to see so much duplication..
>=20

I recently came across the new DTS Addon proposal:
https://lore.kernel.org/devicetree-compiler/20260112142009.1006236-1-herve.=
codina@bootlin.com/
https://lore.kernel.org/devicetree-compiler/20260409115426.352214-1-herve.c=
odina@bootlin.com/

which might be handy to unify overlays for all 15 and 22-pin Pi-style FFC
connectors, which I guess are now quite popular across different vendor
boards.

> Other than that, there is the previous comment (ordering etc, repeated
> here). I also suggest people put the url of the board/part that the
> overlay is supposed to refer to when creating overlays.. at least, some
> sort of canonical link so folks are'nt confused in a future date.

Ack. I'll add https://docs.beagle.cc/boards/beagley/ai/03-design.html#csi
in v2 unless there's a better link I can use (?)

Thanks,
    Jai

>=20
>=20
> --=20
> Regards,
> Nishanth Menon
> Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DD=
B5 849D 1736 249D
> https://ti.com/opensource
