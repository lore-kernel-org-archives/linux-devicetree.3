Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4770A2F8BEE
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 15:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955063; cv=pass; b=HDEg8GGvwpjcMcSz8dB+Sbjg6axeStpTlgmOn82cD1XJWvBIz84I2OLZHnN+vqWLvGKFcQ7JYUSpbbnmE6nJMvcEyvh1KsIruUREStmlluISAXoCKSsHONrsT2OjAk0EDz8wPQoBp1knMtZyzCsFxxzB1AtwfSmh79vrHfw3XpA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955063; c=relaxed/simple;
	bh=DdmiiPv2CWV6FGKdSRK7QlPHxig2ZU+jUpooF0D21NA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tZkjsrHxGJS2+277S5Ivw2ln6eiqtthMGKCsCRNbAlNQJ3msbAMHvJ/qx0FKZTW1sGnyzhQ64Do04O6tsyjHC2H68MPWiQmD2e3QLWpcyijStvxpcj4kiPDXaxklMcLBJm7mqWUyLn8F2NmCxQ1X43hjxdtzQSpVEoFAAJYKW0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=JySVNX+H; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="JySVNX+H"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-81eb41c1f1aso6008867b3.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:04:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783955060; cv=none;
        d=google.com; s=arc-20260327;
        b=ijTRjtALcUrdckhcAPtOo7XeyQy8Mj4EmrXSf5vNK9Aoc0DAaJb4KruDOsPGKsIBtj
         xbLFFSxh8LDagXbQiaAADtEgTPPeLCpiGF5tBy0jnAZGgJfswic3Bxd7x/V1CfHmApdc
         V4mua3hmLxZSE20FGBXV3N4oC+nlVK4cgOw4vT3Kph39xS1OnXIwWa53x0E6afzvziek
         suNuN4we2oGQWF5HqglC9kXpot9Wf0s/EcSLyaGWI1i5bUCU7XpBtxivX3/zYszT1pJ4
         ZJ2BGhJ4zKFSmiBCD/lmx4P1hMR3vTKykKfBXjSRUiy3aJ0Yy5CkBBpKpMrWoxTMXuU/
         EWMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q8n+QaMEuJqrqloV8S/HPmVYYpG0MPjKiFB8NNDgUFc=;
        fh=uUGsyz9hhmfFwrCebcvdomvEiAKeI/D/vQ98M4AJurc=;
        b=bLn9XH7/SnddHPOh+EA+c7EbPvCMwsx88T7Wddf394qBcKY/900RgkQiVzYjxdxrbo
         dpRqFJ8NN9RDAbaPKxb8BIqedjdJ3xL22i6KeYvokCaUlGE3h0FvlK6vPjeFZKyC1sGj
         0I4aX8JU9Y0sGu/+mp5E0K3Ue3hVms7u3LcOl2D47tEnkazMVQlhI/sZeppeMLB7dABD
         47RfL0PNqyjCep/2uMgHS1nZD5aWDfungEP3MTobQfTm+rQP8HVv0UjTRdBVzQJ+F5qY
         PD+bW3hz3rSOdqE6hu0s/VIBeIQHJaxivbQlX9OuzSw80F+MuZcgxdsTmGvbANf9KXNg
         SsQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1783955060; x=1784559860; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q8n+QaMEuJqrqloV8S/HPmVYYpG0MPjKiFB8NNDgUFc=;
        b=JySVNX+HVP5qdHkjjZilbsxLbD1nWNbtWbCx5J59MG0GKSx6XpGQsPYRcYX5uvF98Q
         D4J3yPHlw+6Gw4cf+tuQsYiQB54RllTepJahwmxXOocLDw7PTyeI07tUQyRwDaUnU1//
         EO8fUkpbK8fzCw5vILLzr74BoyP4cTkgCUnR6aSJ4N133VZxpMu6Ncn2Yj7NPO++NbuU
         tZvr1Ij/QUkGPYMqtbcaFoQzPxg+a7a091Y1ju4rT6YMn9cqyzySwTwnApIuWE1IWAGY
         egD/V0sbdL4yVAddHNchB1KLcQt6RDRfzYVhXcJFvMGxReptkisPIMie0uWSa38UMbAI
         Nweg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783955060; x=1784559860;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q8n+QaMEuJqrqloV8S/HPmVYYpG0MPjKiFB8NNDgUFc=;
        b=s/UXO32PWbAVAh1yc/B5uP2bJoVmyaSMloaFdCYgIcM7M5abG0tMmgf4TUF8Ff0gLG
         Po65AqddTBr7sRbm5o1IeJRqFwn98wpeltzkGZ83Q6Q4+xGYFjqlBHbFfWzUAFDF50t3
         ESYoqgq0+qYo+VNZlRXM0uhhSqI4u8xkhEVF97j7pIm95KLzpMBTx1rx/X/3hgsQn88z
         QaWH7OzKw/bFsILXc972Q6LDtEW7cP4ZBBDrW5yEKjRP8yiX7sA2HMRVfCS6Y5F4DBbJ
         v/icgpfs+vqKToU/ZyMiWJGW1+VnKhyOIfDsHaDC4pGzoicqKRgzczN/2HzhrP476cCN
         S98A==
X-Forwarded-Encrypted: i=1; AHgh+Roqspf0OjbKd0wJB2FXmC4Az1y6pGthgQQWoQLauFfLSW7VSIWH10NrEd33W9mkRZbrWkSaMP9ej4+L@vger.kernel.org
X-Gm-Message-State: AOJu0YwBX7cKOB/VjFKA6C+B26eixOcfd0EGcz0C82qeHDuB79SPViEG
	Ym01R8is3aX8hU0HVm6VzirasGE1JYThkVRmdrLLt0hKuOwWs6abFbnCn3IY2r8xBgki2AOmWJl
	4ShhpwgzQsEmC9MFfwmNQ2NN/durkMf9yG37jBu+G/g==
X-Gm-Gg: AfdE7ck8/VfFIHg018vYPZggcHmaUyldyqZ7rOrgSTF/sPAtQ3lacHerZ/CSTMCJc8D
	x7jAmF4SeBJUWUEn9G42U/bOjDl86RQhZ83eIh0VQC3+GbrTO/3dF88ig6ZU6QIzLrrOtLSKiGp
	xgTJ/YSM50W+o0Gg3/OW48ln4C9YGJXoGwCDoNzaCy9q1BZ5auSKkjG9SunEz48xy4kjVemjba1
	PiGD9XNBgple5CaDgWvj8yHYUqQ+KEn8z8hTlZYZY07G/iL8WCxVnX0ndOnY1Kd996CRDjfxZvb
	fuUP0C5r+xpPsGug1Mr2ieDlU8A=
X-Received: by 2002:a05:690c:6c90:b0:80c:85b6:75ba with SMTP id
 00721157ae682-81e902d8144mr73453177b3.67.1783955060060; Mon, 13 Jul 2026
 08:04:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709040415.977784-1-inochiama@gmail.com> <20260709040415.977784-3-inochiama@gmail.com>
 <2ml6mcgwkf4eidwjetmd75henrkig4zzugzfww7buirucddho7@qrs4gasurnv3> <alRmA-X4xbQ9zPFn@inochi.infowork>
In-Reply-To: <alRmA-X4xbQ9zPFn@inochi.infowork>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Mon, 13 Jul 2026 10:04:09 -0500
X-Gm-Features: AUfX_mygn974aliQ_zk7qpCoilxAZo7T3vjRorPpP-S-Z4fzXu4A4fxxFoW4GGA
Message-ID: <CAEev2e8ZyM+b9qLxS6NZjkBZy5GFz37vjgtEfH0ax24nfPozow@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: k3: Add PCIe device node
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Inochi,

On Sun, Jul 12, 2026 at 11:19=E2=80=AFPM Inochi Amaoto <inochiama@gmail.com=
> wrote:
>
> On Sun, Jul 12, 2026 at 11:13:07PM -0500, Anirudh Srinivasan wrote:
> > Hi Inochi,
> >
> > On Thu, Jul 09, 2026 at 12:04:14PM +0800, Inochi Amaoto wrote:
> > > Add all PCIe device node for Spacemit K3.
> > >
> > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > ---
> > >  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |  38 ++++
> > >  arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi |  33 ++++
> > >  arch/riscv/boot/dts/spacemit/k3.dtsi         | 195 +++++++++++++++++=
++
> > >  3 files changed, 266 insertions(+)
> > >
> >
> > I see some warnings printed during probe
> >
> > [   10.842955] r8169 0002:01:00.0: of_irq_parse_pci: failed with rc=3D-=
22
> >
> > [   10.937754] rtw89_8852be 0004:01:00.0: of_irq_parse_pci: failed with=
 rc=3D-22
> >
>
> This is an expected error because the driver does not support INTx
> but the hardware claims it supports. Since the vendor does not want
> to support it, so there is no way for the upstreamer to add this.

Are you saying that the hardware advertises support for INTx, but
spacemit hasn't provided a driver that uses it?

Is there a way to let the driver know to not try setting up legacy
interrupts then? It seems like it's trying to do that now, and failing
to find interrupts node in the DT.

>
> > I see that all the 3 rc nodes are missing an interrupts node and an
> > interrupt parent (saplic). The vendor DT seems to have this. Not sure i=
f
> > this is related.
> >
> > The 10G ethernet probes fine, but the wifi card fails to probe. Seems
> > like the card is trying to request 32 bit DMA addresses and we're
> > failing cause we have 64 bit memory only.
> > The vendor kernel seems to have a patch to enable 36 bit DMA in
> > the rtw89 driver. That'll probably fix this.
> >
>
> This warning is also found on my test, it is not related to
> the PCIe driver, but a lack of the RTL phy driver. :(
>
> You may also noticed a bad performance on this 10G ethernet,
> it is caused by the single queue used by the RTL driver.
> IIRC, even 9800 X3D can not achieve the max speed.

I don't have the ability to test the 10G NIC unfortunately :(

Regards
Anirudh Srinivasan

>
> Regards,
> Inochi
>
