Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793176700;
	b=XwQB6K5TJJvTcOnmEPv414idRpU+UuZ9IS3L1IcsR4VEfTbrNvEuNzA6v1m/zcIN7kJh
	 mn6IAu2TFSJmcTbrGEp984awVPxwkKbgCnchhZBc+esqIOW0oSFzMoB0SzoDvg/hAPwZv
	 U5qNI6CT7r+eYnx5BzDDxCyCCpM4ANk8RsF9BvMyObmjYZ2TW5sXVddC2ntLtDqHq8ZeM
	 aC6BupRYsu/jEcYhBMjT8KdkEFx9okQ8RSteCT/AAYm9iCkPr5ngmBTSX6ugWTeflQx4o
	 B9rGoPN3txkpAD3dPNbulrMjfFXUOUkjog2XJYVmBoZ/uc3XknrJFNSCWiEz8pkH6/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793176700;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ds+sDQMFPbc9ApWwB1b5JKVHZBOJmFGms0FMLfxMiqU=;
	b=zFHtyMn02K11SGFXhdaDx9F+myf40KXrYCpfhASNVM5feqBs66SAEvukSdcOcutL1TmX
	 jIyPw27bgpUQ0T/iD6ZknKLG+gK4VDrGwEuJOijX3kTvNjvw4T4eVBwg/ISJVKtiMij9x
	 kDfa3UFdg+iyNeyu2jjznrfdj+01SRWvVofJTwRhfE1RffoN2toG5livAFYB5r1d+1p5N
	 csEN1yh4NnW5J1zLenpYfXTCeyPBNAhOKzqYSzKQL8OjvfZJ1WYPCE4HFX/pkqebnrueN
	 viX7X+bV4gY3rOm6GImaOVduD4x/Bt2UCjQTga+9EBYfDcwLMGsdJOOR5dfqZFFKvjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nJ+wUHpR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25B2606A31A
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 08:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nJ+wUHpR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 544171F01828
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 08:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793176700;
	bh=ds+sDQMFPbc9ApWwB1b5JKVHZBOJmFGms0FMLfxMiqU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nJ+wUHpRA6Ee42y3iixK1FzjdZKkGKKIESyVw/P6gWDeP+G8JYuhEUAYec3mE3iiz
	 6SCNV3vLTuf/1oH8aQICVLNXfsoHyxUqdsVUaHgmGUsyD1BJXq3fRc4/Wf0r6FcSA9
	 /EehI6ZXuQGbvcVXVlpKQdgp+QF792SnKTVdV48vXzhOZs8bNZhsdK5FBox78it5Pm
	 WW6da7J1iLgxY0X7PwNzPNsRcnnmm6a4SIL3m5LCNt2l5HCzj+epga4RtniD302Mbi
	 5EQ7OIh3K1iPeQ8zHK4AxCF291jwA0CQtlkMdFRh80qHBU8lYvej1mvc2I00goFzII
	 fviKaakmES56w==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5bfc2ae6e9dso570676e87.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 01:38:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzNqwtkUkFfsmYBiscCBdwJ7QWHOKq5fGU2BRS2/XGr2M1Cd7NqBwYkaHbRsQL5MR5gFxuW8TuU1H2c@vger.kernel.org
X-Gm-Message-State: AFq9FYKnFaFXhgTpynLRnB+XqZuQ+5bV/2mMZHWESWdN1o0xHlsJlUGC
	a98IA440Plw/d4Pwm9HnfstZ78aLJ7lhT/vJALRzF6mWJ6DFpzlvWiDmFCs2BJwRqW6/VQy0L32
	lDP1q1QEcGkdz2Rv7+RE+V1ZYMo0SxVI=
X-Received: by 2002:a05:6512:b91:b0:5bf:b5bf:e92f with SMTP id
 2adb3069b0e04-5bfcad7b397mr666353e87.20.1793176699104; Wed, 28 Oct 2026
 01:38:19 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012-mali-c55-renesas-dts-v4-0-c410e280bf2d@kernel.org>
 <20261012-mali-c55-renesas-dts-v4-4-c410e280bf2d@kernel.org>
 <asz8oEtow_lrUU7K@zed> <CAD++jLnnSLXeYzxonkfnZA3OxLE9Hssma9fHsL=U=NmVn7ZVOg@mail.gmail.com>
 <atXol9eFjLKxgTpg@zed> <CAD++jLm5iRKbb6=ZY0r1q_bb-zO3DAe3a7MxdDbpBT3ZU6_z_w@mail.gmail.com>
 <CAMuHMdWKH2pPR1-j-AxV2LVy5xeuoymYv4MnXw1KSvAu4F-brw@mail.gmail.com>
In-Reply-To: <CAMuHMdWKH2pPR1-j-AxV2LVy5xeuoymYv4MnXw1KSvAu4F-brw@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 28 Oct 2026 09:38:05 +0100
X-Gmail-Original-Message-ID: <CAD++jL=0ak_CzxvLf14XntE-cZGFVN6ZpGtkZfTJ8ae0G+RR1A@mail.gmail.com>
X-Gm-Features: AclHuK8tJBeR9yJrkj0y_HKO23Ga5j5ClBJ0KNeeuFyuuCRknUQ0tBWZXJ_fohw
Message-ID: <CAD++jL=0ak_CzxvLf14XntE-cZGFVN6ZpGtkZfTJ8ae0G+RR1A@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 7:39=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:

> The driver uses Runtime PM, but I see no calls to
> pm_runtime_resume_and_get()?

It gets grabbed in *params.c and *stats.c:

linux/drivers/media/platform/arm/mali-c55$ git grep pm_runtime*
mali-c55-capture.c:#include <linux/pm_runtime.h>
mali-c55-capture.c:     ret =3D pm_runtime_resume_and_get(mali_c55->dev);
mali-c55-capture.c:     pm_runtime_put_autosuspend(mali_c55->dev);
mali-c55-capture.c:     pm_runtime_put_autosuspend(mali_c55->dev);
mali-c55-core.c:#include <linux/pm_runtime.h>
mali-c55-core.c:        SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
mali-c55-core.c:                                pm_runtime_force_resume)
mali-c55-core.c:        pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
mali-c55-core.c:        pm_runtime_use_autosuspend(&pdev->dev);
mali-c55-core.c:        pm_runtime_set_active(&pdev->dev);
mali-c55-core.c:        pm_runtime_enable(&pdev->dev);
mali-c55-core.c:                goto err_pm_runtime_disable;
mali-c55-core.c:        pm_runtime_idle(&pdev->dev);
mali-c55-core.c:err_pm_runtime_disable:
mali-c55-core.c:        pm_runtime_set_suspended(&pdev->dev);
mali-c55-core.c:        pm_runtime_disable(&pdev->dev);
mali-c55-core.c:        if (!pm_runtime_suspended(&pdev->dev)) {
mali-c55-core.c:                pm_runtime_set_suspended(&pdev->dev);
mali-c55-core.c:        pm_runtime_disable(&pdev->dev);
mali-c55-params.c:#include <linux/pm_runtime.h>
mali-c55-params.c:      ret =3D pm_runtime_resume_and_get(mali_c55->dev);
mali-c55-params.c:      pm_runtime_put_autosuspend(mali_c55->dev);
mali-c55-params.c:      pm_runtime_put_autosuspend(params->mali_c55->dev);
mali-c55-stats.c:#include <linux/pm_runtime.h>
mali-c55-stats.c:       ret =3D pm_runtime_resume_and_get(mali_c55->dev);
mali-c55-stats.c:       pm_runtime_put_autosuspend(mali_c55->dev);
mali-c55-stats.c:       pm_runtime_put_autosuspend(stats->mali_c55->dev);
mali-c55-tpg.c:#include <linux/pm_runtime.h>
mali-c55-tpg.c: if (!pm_runtime_get_if_in_use(mali_c55->dev))
mali-c55-tpg.c: pm_runtime_put_autosuspend(mali_c55->dev);

So are you saying these runpaths are not necessarily getting exercised,
so the reference doesn't go up on normal use cases?

Yours,
Linus Walleij
