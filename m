Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F853E1696
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 06:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790232333; cv=none; b=qk96yYtDJbiCIfnYsZ8x5XpS7P6WZo64eqRwbubr3HbdFVCoHDlzl2400Wx8E8q9+7p9kS57PZJMHrNq0CyPPk0THjm7JPAi9N4Do98M3qn0LVV4GKVzCT9CebBuiGZG4MJBjmgZ47pYVN2AEtlx9T5CgwSwg3aDhvWoAlwu1tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790232333; c=relaxed/simple;
	bh=FdfaAL0trSoU1tq71ePewjKCGhNumJNlW4lMnJDUJrg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dFmBXphhGDkJazVZPNPF8YvGZ2Uv1BlEDcAnun4wS5HacvCifRESXjW7afjH8J1aBOSlcK07CAQreZqfYj1mcDmUgIa3HKXVBAWmF7YYv+rLXYoaUF6O1DXbrnk9KJKwvaPGRGlpKwtSv/rjpRmt6U+BPpVMCyThXsvHmLDMJ1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-980b6159d30so482998241.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 23:45:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790232330; x=1790837130;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WYSLaHavJ4PglZOT+cFIpQNUnogOMDphRk0Ds36kk5w=;
        b=2twq2mgNARPbbhvZkFlHNMBJe5XRJdUiwhLEDOT2W7KZgBPYRliiyHyYkalpUBLDDd
         eXlXeiNTTyVCBTavTyfanmGGfToh5hEgTmJqK2Tnmx4GzSo/Z7rBXaSI8u7IL9QYjX5V
         39mGQ9UHrAArVWzSJKaOovttuMFS8WNhO0pSuips81Vh7nmr8n3Rg6qILmSbEPhIxz/s
         uo704PV+Io+OW7GD5CONdP4fGsWnb3Li0IyNkdY7cuRA1YEL6jQpoQS2HWMaVY9hggFq
         ZKCgNkk6sq0s92D12Um6BL+k44u2fxFBKO8VynwgH0CowsamypzRVq9PqFfGUUyH0oNX
         91kg==
X-Forwarded-Encrypted: i=1; AKwUvBxfqSrxnLdbdH8LtFIt8hI67kM4Bth+SuRgJlGvZvr4RZfSTn37qVeCKa+f7z1cSxCzj8oYVCwciZiz@vger.kernel.org
X-Gm-Message-State: AFuF++lJc0VzmgDRTSZgU5MbC/wysyP0wFOT08aihymCXhlXtQ0NImSI
	Rn1t9WKFxk2oOjGvLkSDY0zGNbA53FUr0V663wk1DhzQApbG4hIHv+amhGnfcumeFoc=
X-Gm-Gg: AYBFou0blQtuUHpAfTEH5/mdhcxZXo1+afBiflg4EoMhsqz/1AeJbJpZhl3flU2cMrU
	LR0k517QhUM4UZq2IySiOUce948lEaMa8f4kQOgj4C07a7ShU+wrzthBKOUwGLpxu4P2ym5I8sp
	jcFceVykfeIpZrgGmc3EIbnKwjrtiPGyAanYBmBjdVueK5L9bBm/VMOFsaSW52p852n2Y/uICqB
	Nu9TdgkYBT5FEswNunBsLPJ9BqpfzQkX94MGuAT2WYYqW9Uee76nbZ1+wqxw13iVw4Cr4o+EvS8
	nPon6nmF74j3B9iSJFdWFmbSBRBta8LuJl21AcYD0IJRHa1+AkfVT1DbGQTIVvLFLz1OK2OvrZS
	3LDdwfapeEzxsSn6C4hA54TjqVh1ApchJAnWwNcGdzJh4ZXG7SJ20nIVl02ZyGrI+Z5VPGgBPdG
	52r46LPoT8mccvfQ/yiBOiMNetQzSLZOn0hOrX0hx/dzoRZNct1x+SxPC5tLCCgAgr5yhzpVZkR
	cZABvjOKI4TnwYwiTrUIKWHRLRtrnpjJtr6hzuc2+ao8dM=
X-Received: by 2002:a05:6102:3954:b0:7af:7d6c:495b with SMTP id ada2fe7eead31-7af7d6c4e35mr156414137.1.1790232330081;
        Wed, 23 Sep 2026 23:45:30 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf6087f6dsm7234635137.9.2026.09.23.23.45.28
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 23:45:29 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-78a4c5c582eso662306137.3
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 23:45:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy5gvMXhdTY8N57EUZdrrDqQ70cLLnFfCumsf1pYAGGyXi0FWzgilFbNCEddX9lT5nHlKSWgk2ACChZ@vger.kernel.org
X-Received: by 2002:a05:6102:e0c:b0:7a7:a382:6bd7 with SMTP id
 ada2fe7eead31-7af1dadc05bmr812949137.27.1790232328063; Wed, 23 Sep 2026
 23:45:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-0-c1b9e5f10cd6@pardini.net>
 <CAMuHMdXMjxgj+pT5A=jd_A5BVQctHXJqeiU4EhPA_ZSANZAAmQ@mail.gmail.com> <e166f6e2-05b3-4f36-a1c3-b75861618c75@pardini.net>
In-Reply-To: <e166f6e2-05b3-4f36-a1c3-b75861618c75@pardini.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Sep 2026 08:45:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU+Dum1VaMOQx9aS_hBn1Bmq_mZ1qaH-WegK7Q=pEdmTA@mail.gmail.com>
X-Gm-Features: AclHuK8sCbd_Nwk8hcPDRDy2MSUfMylLVdDaP4Bmdtue73-db_SXAulz9teSuSc
Message-ID: <CAMuHMdU+Dum1VaMOQx9aS_hBn1Bmq_mZ1qaH-WegK7Q=pEdmTA@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] describe RTL8125 PCIe NICs on Rockchip boards (and
 add DT binding)
To: Ricardo Pardini <ricardo@pardini.net>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, nic_swsd@realtek.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ricardo,

On Wed, 23 Sept 2026 at 20:49, Ricardo Pardini <ricardo@pardini.net> wrote:
> On 22/09/2026 11:17, Geert Uytterhoeven wrote:
> > On Thu, 10 Sept 2026 at 22:08, Ricardo Pardini via B4 Relay
> > <devnull+ricardo.pardini.net@kernel.org> wrote:
> >> Several Rockchip rk35xx boards carry on-board Realtek RTL8125 2.5GbE
> >> NICs whose PCI function nodes are not described in the DT. Describing
> >> them allows for stable ethernetN aliases (matching the GMAC alias
> >> convention on these boards) and lets U-Boot's fdt_fixup_ethernet()
> >> inject mac-address properties from its ethaddr/ethNaddr env, so MACs
> >> stay stable across boots and U-Boot and kernel MAC match.
> >>
> >> Tested on a NanoPC-T6: /sys/bus/pci/devices/0004:41:00.0/of_node ->
> >> /sys/firmware/devicetree/base/pcie@fe190000/pcie@0,0/ethernet@0,0 and
> >> u-boot correctly adds local-mac-address property there which is
> >> correctly picked up kernel-side:
> >
> > Have you tested this at 2.5Gbps? With which firmware?
> > I am asking because I have problems at 2.5Gbps using the firmware from
> > linux-firmware (on a different platform, though)
> > https://lore.kernel.org/CAMuHMdXPAeHoeaQbM9rXbXukoMbFV+0k28n6sRMw8XF872=
0WUA@mail.gmail.com
>
> Hi Geert, yes, the RTL8125's on those boards work at 2.5gbps just fine
> (both with and without the fixed-function nodes in this series). They do
> get quite warm at 2.5gbps. I'm using one of those el-cheapo 8-port
> 2.5gbps switches.
>
> Currently:
>
> [    3.254450] r8169 0002:21:00.0 eth0: RTL8125B, 8e:b4:90:97:32:30, XID
> 641, IRQ 124
> ...
> [   10.480872] r8169 0002:21:00.0 end0: Link is Up - 2.5Gbps/Full - flow
> control rx/tx
>
> # sensors r8169_2_2100:00-mdio-0
> r8169_2_2100:00-mdio-0
> Adapter: MDIO adapter
> temp1:        +52.0=C2=B0C  (high =3D +120.0=C2=B0C)
>
> I'm using whatever is in Armbian's armbian-firmware package:
>
> # ethtool -i end0 | grep -i firmware
> firmware-version: rtl8125b-2_0.0.2 07/13/20

Thanks for checking!

Mine is RTL8125D XID 688, i.e. a different variant.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
