Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1714A2A79
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 21:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789680852; cv=none; b=Y4sVPQHRnWZueu0IXKRwUb2UN2HsKJQg1tpl4UqqAHp+2rbiIP0KcrKnEggSRXGephp56ogj6+xnZOOg0t7YejTRnNB8nj7k+OPIAT44bte/uR3EJDUlnUJTSqZULWbAdx/0KRLrFxYSKuXVbx4PoGnA0a737VaQJpTueMft4Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789680852; c=relaxed/simple;
	bh=uTjpPRgE/t0vqISrpvqq46KZfOdmr03hC3CWRykhpyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ac3RDE9eXqAktVCmdhAJ4M0KQkqPLziW62jxhsUefKEvNM+P9dSPMC2N8f+KQ0vYgbua4TLkmxg/cSJuu9O0DS0CJh89YfgbZeTBlgy1ZAzxom1A57fs7q4SMvFCAMhN+q+kP4I4orHnMd7tYCXWZxrqgL+Qza3G5tI9cfg0MO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RvfNEcrm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RvfNEcrm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9C701F008A5
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 21:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789680850;
	bh=uTjpPRgE/t0vqISrpvqq46KZfOdmr03hC3CWRykhpyY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=RvfNEcrm69JAKHFS+2sBBQ3VTkVeUAzOfEKaT/A+6D4Erw+3RuW97ZnELMOoHL3XB
	 /b/F2I7zdJQVGPSczTSs+e9RltWhEulTb/AxMrZwJKCV3lFeWX/HrrtMEvAxFui91R
	 glEBjzE8MTAFSXUm/OxfzdydLOMve6ZjqT+v717JwUvSpxNWZP0p/kqzqpc94h9rxk
	 I0DVMnkyFRbZZGscwxl5U/nYAg2MK7B6xWWMhH3yVWXT/2DgDzhRi4sc9xAzbrgvbP
	 zv2zC2idfcEPITIIJybKSHS8+VLtGh1bI6KSlA1Ffbnxnn8D2914qmnIhEi1MQXiMd
	 Wx4NCjJ32GYoA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b76694fb7aso41381e87.0
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 14:34:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzUGrlcFLUUO13nvnqTpt1u/7965MUB8e+cOyRguHW8Dz+4PVJDHRTn+PbNH82njwb2UAZdkXoDHwi4@vger.kernel.org
X-Gm-Message-State: AFuF++mu5gpLvHG92t/7p1rI++28rr0j6+nezGd9esXQiPfFJ4GGe7BY
	H/++X3sbvrtl/Sc2JLQfHBOijw/2yL341XfyHx/n/WzqsKBW1b4nM2yZxqV0xdYvEIUabaDN9yq
	8lx6LYDJPdPexUaq5g9yJaSXZCJ/w3q8=
X-Received: by 2002:a05:6512:3e20:b0:5b4:ab0c:f606 with SMTP id
 2adb3069b0e04-5b8ba5d0de2mr1500652e87.2.1789680849598; Thu, 17 Sep 2026
 14:34:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916-ks8995-to-ksz8-v15-4-8825ff5fd4be@kernel.org> <178965135045.22033.10731767071063010304@kernel.org>
In-Reply-To: <178965135045.22033.10731767071063010304@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 17 Sep 2026 23:33:57 +0200
X-Gmail-Original-Message-ID: <CAD++jL=pbZEBQFN=Ntikg4qGwPqsCRYgdm0PW1w+Uh_zyUmx4A@mail.gmail.com>
X-Gm-Features: AcwNN1VFHmvJdEDSxZZuz9LRlTXUj03zK8aeKWRj4Ps4NuMo2PvsCi6KWk81S8o
Message-ID: <CAD++jL=pbZEBQFN=Ntikg4qGwPqsCRYgdm0PW1w+Uh_zyUmx4A@mail.gmail.com>
Subject: Re: [PATCH net-next v15 4/4] net: dsa: ks8995: Delete surplus driver
To: netdev-bot+sashiko@kernel.org
Cc: woojung.huh@microchip.com, UNGLinuxDriver@microchip.com, andrew@lunn.ch, 
	olteanv@gmail.com, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	marex@denx.de, horms@kernel.org, linux@armlinux.org.uk, nb@tipi-net.de, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 3:22=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:

> [Severity: Medium]
> The commit message says the two in-tree boards "both use KS8995XA hardwar=
e
> and continue to be supported by the replacement driver without regression=
s".
> Is that description accurate with respect to tagging and port isolation?
>
> The deleted driver used no switch tag and did not program the switch at a=
ll:
(...)
> Removing that line makes the switch to the new tagging and port semantics
> unavoidable. Could the commit message describe this behaviour change rath=
er
> than stating there are no regressions, given it also notes that the MA an=
d E
> variants were never verified with the replacement driver?

I don't think the exact wording of a commit message is that important.

I think this patch is good to go, I don't mind if the committer want
to change the commit message slightly though.

Like to the oneliner "delete the old driver" which should give none
of the above complaints from Sashiko.

Yours,
Linus Walleij
