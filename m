Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792760628;
	b=I3N9mLp2pvlfZn1okUc6xXRvDokoYO7bCD9pPiUh1N7HQHO8nAajHHo2szCZ8QPdwVOa
	 dSCR1zyifY4VEInBjZZQa+pIwdEZXAVu72A4ZUONfvDqELK0ANUmHzE0dZI055uNkyIvE
	 2W/iVblzfPsjr/btRFRKdW4M7WobC/LXuYnVaPtsPJeVFPs3dEzJfwtDk5AOuwgr0ELsR
	 jUL5KDnkvvbXP1lyZ3Yj72HP+L8sSm2iGyZChdq7bgqMBAtzJq9hPH/klNrubmbL0gaPV
	 5yIcqrpXTeN4qEbRiINvaGhisyTxmBW4fUvfG7tFqDdQaeF+NE6kGJhSzZG1Reaqcmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792760628;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1Qd8+/zcaU6lUIWBoHhrtf6NHTiDvscHf2rquHPumkQ=;
	b=PUGmtk6RDYJbFXIR+VjIEGdggbNv5yLGhwjrNv8KBGh4008QTzvPjnB8AuR+tpXp0t2S
	 +VwnfBvJwgyRLFwI3yRuiXilv5NsDJgQ4fxAgajkYbeUR/aWdkeJ0YR82++atc62Pd+WF
	 CModKix2FAggr9uXBjIpGDvc7BffAA1nSOaoXEVHM+sIIs2dvbMyE14lqxx1/Igp3vX1c
	 oGt5aqyPtZ1Pz+inNMRLlBnssCcjZ0ErnHMtdv3++3e3nhOvD5FyxUdgHXlHVVehqHhT0
	 fOzBfMUcTFC14hMMPKufPrgdpd8H1npNNORaL7CH2NRD3yE1Mw+w6z7NVcMq0JsYqTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92BF606A31F
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 13:03:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75F101F031E1
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 13:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792760622;
	bh=1Qd8+/zcaU6lUIWBoHhrtf6NHTiDvscHf2rquHPumkQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JSZkJ2uzIuTfEaBGTLvPIL/dl1pbZDbWZAezlVdRtlZY2vKnlxtf0ZejrbBO+2jyu
	 c2R+nfzfUf3E5MWKxHV2JhD4Zs9/KepBo58GPoB6K9cLpynB5YLu2qKzxHJKmP9w9t
	 c5PJa1ptlZ3GiEYhQ54EZU/0zIs9msBP/bD96QjPequ6ZNdF6sw79Mu/PJ7IP+zas/
	 MmvcApFa9LDhANT8A8yOV6VNrRC5VP1fF2G0rXDIGUhVGtUz1A1C2EYw4bJHqEnA1b
	 IscvcWfUwzNNlOFtdHTMfpJdr9Wvkr1E2748lT5p20xqp29wtCBAYe95mM7ubENtsI
	 uRulAKwh7xibw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be53e5fce1so707147e87.1
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 06:03:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBynbJWd8TxSaL5oGdzCUOjAa4wQo/0ptDVVhopBHll5F5ufrO9DpuOuDe1KkmA8Vd0YO2/9vJyxehVb@vger.kernel.org
X-Gm-Message-State: AFq9FYLzGEQLEwh0veXh4pKr4AM4CQAtNZ9UZ1gVWpUJVXRL3vyYF8uG
	LMujn5k5z7199yqncMQxApf5He3M7utBhUMSbrWSeETfxFNq9gPnCIWr2JdWYY1445T4DhgJBEC
	OknkDEM+KvV6WJHMuTddjcMsUb4Gi03U=
X-Received: by 2002:a05:6512:3da4:b0:5bf:b5cf:6729 with SMTP id
 2adb3069b0e04-5bfb5cf6cffmr41829e87.0.1792760621193; Fri, 23 Oct 2026
 06:03:41 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017052534.115203-1-changhuang.liang@starfivetech.com> <20261017052534.115203-6-changhuang.liang@starfivetech.com>
In-Reply-To: <20261017052534.115203-6-changhuang.liang@starfivetech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 23 Oct 2026 15:03:29 +0200
X-Gmail-Original-Message-ID: <CAD++jLny5p_UNj0BYPy-tU8aPrS2MvpaxS04jKyPH=fWtO+okA@mail.gmail.com>
X-Gm-Features: AclHuK8P-whVEy-AVwIMg7ybsCadTVl7aUKiOhmVqu3jLuo_uv6iO1uHmuCl03c
Message-ID: <CAD++jLny5p_UNj0BYPy-tU8aPrS2MvpaxS04jKyPH=fWtO+okA@mail.gmail.com>
Subject: Re: [PATCH v1 5/8] dt-bindings: pinctrl: Add starfive,jhb100-emmc-pinctrl
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 17, 2026 at 7:26=E2=80=AFAM Changhuang Liang
<changhuang.liang@starfivetech.com> wrote:

> +  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
> +
> +  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0,=
 per1,
> +  per2, per2pok, per3, adc0, adc1, emmc, and vga.
> +  This document provides an overview of the "emmc" pinctrl domain.

I noticed in the pull request to Torvalds that this is a first, usually
the SoCs have one pin controller, or two (like Qualcomms TLMM
and LPASS).

But this one has 13...

Your silicon people are obviously thinking differently from everyone
else with this distributed pin controller model. If you know something
about the thinking going on here I'd be curious.

Yours,
Linus Walleij
