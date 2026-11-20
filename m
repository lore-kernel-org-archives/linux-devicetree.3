Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168071;
	b=jdc/ASAt/xIf5L+ABhVWNBphZqJNj8+4LmmmeOqI3JMt9lT7PXCccZfxIxvStBFosBMd
	 s7AKsbUDQ2CP54BoLl/5PsDguT5Uw9y2teV24kr13U88ux5FbyEJDQHF1KmKsvhvhdTN8
	 A6rGEeL3ZM93eOHSrmEdOBFOHJA8zKP3Vgu6UkQ5lHwU3vXCiXQo6stFXgUwTfHXmvMBd
	 ZTkGKQbyo3HYWf4ftr8WG1C3nRtePNzXA3v/oOVvqkVk4trbgxxZc+DF1ktdp3vMNPX6a
	 VddZZ1S6/N+sTaOj3lXmLIHVEjSxlqD8DWQjmyrQzv+R0Bbr5cVkjdmd+1seuSV4eEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168071;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YU5P8Wuc2M6bZTL3XK84wjuebJ0zvL/QXfNPgZyOqi0=;
	b=XzQA3Lq7C5zviUD5oLZkJCuJphLBjuMhyXLrgPg21F+ZKKPDVT5zzN8TcD/1tbLRFWNH
	 fvObOeEtPpxE/flQs2/vLtLxFROmMzTR63gSzV0gVIDSBIf43jjfxk05TcQSG3OEo1eYs
	 NbL1xgRf5cVER9QF6QGIK8+VbfOyXP5SX43XDZOvvIyI4HSE2k4MJhhBCDL8vwISjh15E
	 jvl2+S/99KdkJEM7P0F6kDHAkWR8JEvA0GO/noD5uYq/JFZlFMu/0JAs/hAEN5Ne4WCpN
	 tUeqBGffvR4gmxL7ZUzBNIAiNocVOA8yApPwo+CYFRXlvku3nL+T2AB1mGH2e+YM5Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TTQIJQdF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24EF606A32C
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TTQIJQdF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44E7B1F000F2
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795168071;
	bh=YU5P8Wuc2M6bZTL3XK84wjuebJ0zvL/QXfNPgZyOqi0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TTQIJQdFmsgcCJvZ5orSt7w0DatjFVZQwcM9IEaWaC+WjWprBbCupEHBw2ZEdEY5b
	 BIBCQ8gTLt9anGc3R+WoUEP/8X0wqmmRyUA0Is+/tDt6D0Coe+GssnIRmwyUztMzR9
	 n9c4oX6NDEhgWoC9wYM7VnNjMV3ikjcOOi9DiBzT4NUIQQANyKjVCwoQ9tX93LQ4Td
	 Wyq5vz3a4GnOFKlXnvezyfJNzLPLOgMgy6KV/q8eVLSgE7z+o4JrHPe3rMwYrkadWP
	 lboTcbWu9QSv9dLAlRzQXsDKcewPjqfaR/lq9p/AjBDOYgb+cEVXKzHr7WrFntR/Gm
	 Qp/UOxFXEysyQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ae854fd0f5so2319711fa.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 01:47:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF1S93CIPvea5QSJd+7G5jKP9YXxLDg6riBVgKpvU4yrrE4pnVPO6OTkyVNJkJnLoC3carT0vbqq3E0@vger.kernel.org
X-Gm-Message-State: APuU4Z+sKdarYNEi5FyM1wF+r5pHxyHzhDvlBpeulsjkX0gor3QFIR52
	l50DoIfP0ntLGDBg83/wgeGV87iEA9GoTeUQLZd6ypX6Gpk4ovxxC2snpFH7fTwCiQJNsjFIyZ4
	3WK6K/NiB3bKVq9x5XCOsV26Bjo7X3Ng=
X-Received: by 2002:a05:6512:6d0:b0:5c0:463:7b4d with SMTP id
 2adb3069b0e04-5c1bc85f15fmr656116e87.46.1795168069914; Fri, 20 Nov 2026
 01:47:49 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015142552.4128028-1-ryan.roberts@arm.com> <20261015142552.4128028-2-ryan.roberts@arm.com>
In-Reply-To: <20261015142552.4128028-2-ryan.roberts@arm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Nov 2026 10:47:37 +0100
X-Gmail-Original-Message-ID: <CAD++jLkrWojU3FeTPGOCFHHsbmTGYG0Tz3b2nrn7mMfsDssCQw@mail.gmail.com>
X-Gm-Features: Aa3M54rOrfZtY95RmYFxRv97HUcFxeSdg2w3O8Cm90EYC1dabPW2gsgZ-nnS-cY
Message-ID: <CAD++jLkrWojU3FeTPGOCFHHsbmTGYG0Tz3b2nrn7mMfsDssCQw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 01/15] misc/arm-cla: Add driver skeleton and documentation
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Alex Williamson <alex@shazbot.org>, Jason Gunthorpe <jgg@nvidia.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean-Philippe Brucker <jpb@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 4:26=E2=80=AFPM Ryan Roberts <ryan.roberts@arm.com>=
 wrote:

> +Inter-Accelerator Communication
> +-------------------------------
> +
> +On some platforms, multiple accelerators, each attached to a separate CL=
A within
> +a cluster, are also directly connected to each other via a shared bus to
> +accelerate cooperation between accelerators. The accelerators sharing a =
bus
> +cannot be isolated from each other. When collaborative operations are la=
unched
> +on each of the participating accelerators, they synchronize over the bus=
,
> +stalling until all are ready.

What the patch series needs to do is tell us how this topology is discovere=
d.
I.e. will it be discoverable from the hardware itself, or will this topolog=
y be
described in device tree or ACPI for example?

The kernel must certainly know this topology to be able to synchronize
work across several cores? What happens if an asynchronous acceleration
task is running on some cores and no actual CPU load is on any of them
and the kernel want to put them to idle or shut them down? Same problem
on the cluster level?

Further since this appears to be hardware topology userspace must obtain
this information from the kernel, not the other way around: we cannot
have a situation where userspace "just knows" stuff about the hardware,
keeping the kernel in the dark.

I think this is a wider question about the discovery of these CLA:s:
there must be a coherent story about how userspace finds it and maps
it topology and that information must come from the kernel, so the
kernel and userspace have the same map of the world.

Right now IIUC the driver probes from discovery in the hardware from
CPU-specific registers so does this discovery also include the topology?

Yours,
Linus Walleij
