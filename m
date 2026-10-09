Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8984439CCFE
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 21:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791579621; cv=none; b=ImD26IK4nksstn4ZVcSCqHdsFkWF6ZWj6415IgH0qxDbHpdY1KVIWHDYaU9wrmP0qhEpq2gXhBFYSyDKSrvPr89rYOJLBJYnixcQnFdZpn5lXpfpOrAcJazqc6rDd1DXggudu48v4IibsGV06nCxkubVXKGk95kwoAlreNkTLG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791579621; c=relaxed/simple;
	bh=3le5P+h/KiA8eq2M8tVprosyJ+rYeh5W5GrP/Ck16/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aYaaHhb/NNn+Gz6uqL2yXanKFIPzsAzOZ/ftM2fgM6dhgJr05ioViqTGseKILuXbdhDZh+BElntj7j1v5ViZW+6HmZBPex2ItOQgPIXMo8/p92UprIJC+HUvubYgmDK6rGSeS6n760MnrZSov5oUdlDTTQB/E4gDeIMBz1tvyY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4b21f71613fso128475b6e.2
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 14:00:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791579618; x=1792184418;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CRIIxOajP0yzIY23BtbyoAhj2PBRdU9IpmRdYvRMNJ4=;
        b=lDOr1IRcYzt/5HrnlnEBs3j3d75wgmN8x9tmNbG0EDlL7LmyU4letQZRQuCAV/zDZK
         fpU3Z3mmTESgPDqJDw7PjX7tldrbjgni/rF7YdhCGjas3bch37DHTov0lpmUo9/AXccm
         G8OGUMQLljMWZitL6Hlti9uX7LXY8Xru3nAMGGkkduekWnH7audAnq01iIMPZqbDNshq
         yVwPxXq5P38loEOCn1MkFZKJ67cekZYsmsgs3Cdtz9a2TCSjUoBerKLcx/MaXqqltdcK
         JmwkhcSH89A9ei+nc0SMzhYjefD9YMUqFSPTHTZ60UPk8y3puc41Mu8SHi+KrFKLe1dx
         /K/w==
X-Forwarded-Encrypted: i=1; AKwUvBwrZ9gAo1tzs+d7cYuvl0vJg6fCJJi6fpS0ZzpGnKFHelLlMeajOXC064ZEQQVBHznmRpyMHeTlyTmB@vger.kernel.org
X-Gm-Message-State: AFuF++mfeFZzcCtvSqtaAHPeAPKlRwsJC28tyC00OKk7X/+IhofhfqRQ
	Z3x0YdSwEzeLt5v0sdeUHydyMOwEXiNYethdh3nE+k5IFVr2eoyRLc86xFsOnTwibD8=
X-Gm-Gg: AYBFou0D3sIrNutsnEe3sc91FL6oyIYX1HnIGfInF21HXLeg/jtkVSPd0kQQxEaPqOj
	MvNAWTlrVLPyNoQeWqi5EBC4C9I9V9woEmE+TuaJceHkEx9netLziLYoaM+x4FGo1uh5qtDUFFC
	tSO31ospvSuM5EEqe+/kY4ib+iaKQmP1z3ZOrwwcP6BUBpPurJBTYECMei7c3V0pKSpwwsQe0bL
	Ci4wRKNhhyx0//UDLitWT8JU2ZyFI5V7xiZI4ihmM6f3kni+jafkypK5MvAHKLvGzB2Ug7Vlu9Q
	x5Tu9r3tfVAY6I6HdpAS5q1BHV+bmAUGamumHvPepXm49NznWeV3A9jIk5wMbBHLZEgXTG7VYqe
	Tv4hyTYgVbRvJYnXdl7m1eP9zMk6yC0Fz1LWJC5pqOQgjWnyFup7vjGJxW6voCNC/2QSzBVj0j/
	hVRZs9EJ73Lck5bMZaDgs7axI/v7mNlaquG0sKFVfDVTT7gCp0fKCC1Tr1j8cH7wUcuYVCHNw3C
	iztrfRwqzBWZOqF8KxBYBi8qo4v3icMC61CnN9cbYxI83vEey3EDqR5b9hi85sGmRKipC86rlCE
	hg==
X-Received: by 2002:a05:6808:338a:b0:4f4:3790:6615 with SMTP id 5614622812f47-50c4c7a747cmr2615579b6e.11.1791579617974;
        Fri, 09 Oct 2026 14:00:17 -0700 (PDT)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com. [209.85.167.174])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-50c1815e5aasm3081432b6e.8.2026.10.09.14.00.17
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 14:00:17 -0700 (PDT)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4af81963f35so134960b6e.0
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 14:00:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByqsjAp7WtT2EJrETKO0trXUIITdjAs7hNxZeb/dbTHgnruJIQN93cBRNZqIdELnv3uiJQ4syOtv3sg@vger.kernel.org
X-Received: by 2002:a05:690e:440f:b0:677:d3d8:990 with SMTP id
 956f58d0204a3-67936768725mr589216d50.6.1791579173056; Fri, 09 Oct 2026
 13:52:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007082627.63807-1-tanure@linux.com> <d23dfdf3-5837-459f-afd6-6c198a05c13c@lunn.ch>
 <CAJX_Q+2au4x99kj=UBqn4joQCM3-D2kbaJ0zro9Y4RXka7ePvQ@mail.gmail.com> <3a037c87-e4c5-4a4e-9522-cf505e1c6399@lunn.ch>
In-Reply-To: <3a037c87-e4c5-4a4e-9522-cf505e1c6399@lunn.ch>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Fri, 9 Oct 2026 21:52:41 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+22tckoRKsEt9_oakAsN=+cwHdX+WPcaGWR9_3EMqM5ow@mail.gmail.com>
X-Gm-Features: AclHuK_m9bgs2ZxoWfD-m6qDBIuQp5RI_xHW6gmLTuflU7vtLwdOlVbkLA0qUf0
Message-ID: <CAJX_Q+22tckoRKsEt9_oakAsN=+cwHdX+WPcaGWR9_3EMqM5ow@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/7] Add ethernet support for the Amlogic T7
To: Andrew Lunn <andrew@lunn.ch>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 1:13=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Fri, Oct 09, 2026 at 06:59:49AM +0100, Lucas Tanure wrote:
> > On Wed, Oct 7, 2026 at 2:01=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wro=
te:
> > >
> > > On Wed, Oct 07, 2026 at 09:26:20AM +0100, Lucas Tanure wrote:
> > > > The T7 pairs a Synopsys gigabit MAC with the same glue registers th=
e
> > > > G12A has, but nothing described it. This adds the binding, the driv=
er
> > > > support and the device tree nodes, and enables the port on the Khad=
as
> > > > VIM4.
> > > >
> > > > Unlike the G12A, the controller reaches DRAM through a pipeline sta=
ge
> > > > with a gate of its own, sys_ampipe_eth. Nothing else claims it, so
> > > > clk_disable_unused switches it off and transfers stop.
> > > >
> > > > v2 changes the RGMII delays, after review. phy-mode describes the
> > > > board, not which chip adds the delay, so this board is rgmii-id.
> > > > dwmac-meson8b did the opposite, and ignored the *-internal-delay-ps
> > > > properties. Patch 1 fixes that. The VIM4 needs it because the RTL82=
11F
> > > > transmit delay does not work here.
> > >
> > > What is special about the RTL8211F?
> > Maybe nothing, it may be this board. I cannot tell from here.
>
> Yes, look at my other reply. The RTL8211F is very likely correct. It
> is the MAC drivers handling of delays which is broken. You get to fix
> it for this new device.
>
>    Andrew

Doing exactly that. v3 leaves the existing delay code alone and adds a
path used only by the T7 compatible, built on Maxime's
phy_fix_phy_mode_for_mac_delays(). Testing it now, then I will send
it.

Thanks,
Lucas
