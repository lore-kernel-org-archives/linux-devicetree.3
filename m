Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB262369236
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 18:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785867546; cv=pass; b=Rs9qFFt28VDpSEmbnMlk4RzJCofa+KKKQQMKfvSblNdjbCaphznOJ+AgPavQFQj64DMI7R1QydlWLF5qtXXt4cK8kMqeMLEYaqChAoTVvphfNg+3tAWcfzbMpdQdqK91cD/Og50Vs6mOFSV0/QmTOi7k+t5sJ4lXYsYsKg6PAm8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785867546; c=relaxed/simple;
	bh=VMtqXL1u/poIsOpl4Ypuo8toy3O5Sm+q1plElgkX+5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Doh5tyEQIFOWoYABj3a8Ak7IdhvKRDr9qWKuOImRx1JOqj/rGP1Fa4Rerby5igcO6nNucD6Fn3Y4SNe7j5nIZutN/dQ0rMRnSRr1ePSeF6cUv7jCV6g1qOjD0b3zm/F55YGWJMcz93L5S9+aXJBq5xCbrjj6f3h9dV6hrHhvkI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cv89+yOT; arc=pass smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cv89+yOT"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-976ea28c65fso94250241.1
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 11:19:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785867543; cv=none;
        d=google.com; s=arc-20260327;
        b=MyhFQpUww/nAZpLWvi4YE+2eyGMq/hqF/Jeq0f0b2WKW6dG5hy6jFg30stgP9tJMHk
         Uy1WeKfZd1jP8Tbknx2sANtSkCn8IIfFQsZ7Z959NjysjickcIop+oZxBI6V9Nr89R34
         MnTWPBlA2nV7BZP4Z3Whz8zeIHmQ9yy0Dg76ajfiE54CG+ivAl00AkhxbX5C5RLXyNXS
         7LYXii+/4EPTOAs5Nw+PrX38/Op6iQ9X8hRlOqnXEUEnKnbg2/065xRnZe6CvucGYRmb
         FmsYDarDAwOPmMkT5J3EpNJuT6VMIQ5gSeXJ5tokteQYrkIEknZ4QKben+Ktca7u/puZ
         65tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VMtqXL1u/poIsOpl4Ypuo8toy3O5Sm+q1plElgkX+5M=;
        fh=e4RMfGVhTWANMgvRne+Zgdelm39u2wBSJi5KXrK9PZg=;
        b=OnEDkKQVsmSRqGXv+Gs2OajJHf/sHFP807pTY27sXcM41hweSZ/lqSdMjgIyHjVhN1
         GJL+W2gFmulF6wRGelS2zObvaUjqdbHsc85WLSOHlm4RjkmO/X14TcM59HHzUXzc+vu7
         8WXTROmfxDZ3OtjYc0N+Ye3kBGu3VKCOmWC5Nb7pUI5zV8do+rxzYyHqaQEnWKmvjvaR
         5LDGot4zJV8vHApB47QKFRl6gjL2beThjPGQ5KfmAfQvWFM8NK8UBUIz3S6qefYPODd9
         CzJC7QRjXWD44lxT3voGkPZWvWxlouIqlNmwWWpNSzQHWjkKsLTkHOZCTufY3eRlSuwA
         aj1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785867543; x=1786472343; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VMtqXL1u/poIsOpl4Ypuo8toy3O5Sm+q1plElgkX+5M=;
        b=cv89+yOTFsqGIK18VxinYYIQAftoMy+78Ze7yyGc4GcYZdcbsPU9qeAgO8u1+jctPX
         ELLmGdTeavyLs7C4dK+ch7H4WwxWyhKkJOabT8YHHNUP9W03fXJt4i6eSHP8CVTpEpF5
         HscrvVfWqsDYWPB5QsRgGmSnNKDDKB7AhrpZcqSuIE6uZVg3fdrG4OniTLWzagdoStk5
         M7/N+M4pZyiPJUIt3OOAAuufWSJjbQqkYK8wYIbb3WZP+R+kaszBlm50ToPuiJ4mY8SS
         +wFrbG3DxcgcC5rTyC0eomKimIubDDyLgx++SnvqxQaUYlSXSxT7VgZuipcuq70absUd
         UFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785867543; x=1786472343;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VMtqXL1u/poIsOpl4Ypuo8toy3O5Sm+q1plElgkX+5M=;
        b=kCCxldII9MhmzccabKcnOs2+yKjMP6UPLr3atNaLaUNo2HrNawOiA7N03yG/SVTBqg
         UxvEf0nmo0CIvPustxG1KUzJ1L7GppFwQJPEu9b2NgyU7oSy7S9BXodT+m6p0hWF21Be
         vIM0vi60OVFnrpJXMfK4fOZUcdoN1n4Fh+j31UCrLBOKS7Jg1/i88ITAQR0pZ20DZ3BT
         +t0MwWxO+kc2pwiTzB2mEcGkoB6hr3WERESHyymAQ9AdqT+RNtkaTis2s7PYSshf3RSn
         ENIT3Rkn0l9TdXTEs/+ht3TYDyaoes1Uww+lp6uIYIt3YWcsJekmC+xZKspa2XpJ7rGd
         8NAQ==
X-Forwarded-Encrypted: i=1; AHgh+Rokb/CMQaiaKZPYxhAG1wjWsNOCM6fcN09mB1hxwDh6Rsq8Lp9sg+8th2+Nw+m/8v9XB0TpOM3WTZrl@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqlx46m9y+06Ubr64Y745AHPwW9bXMni/bvP41aU+DANcWYeDe
	+FJqKXecFcaeP5u+B0/VhgMbrXHu+t26NIUL7JroDnmbp0x3DUgIcjGth7yuPELhHL1wKCR+DF8
	xL+jiD3jkKBql8LBNhyzlw8EL6AeAOH4=
X-Gm-Gg: AR+sD109TxkOl6XXprfvQCpq6WHZcUrL/XukgK7+jar464ecyx6aX5mNGl5IRFajTS8
	HjSZBhnHzhb1RlM2x4udoMnkq+4evX8sGbFjIfnJ7wo9xKS2wA6yguJDiPB9cE9/Hte6s6hRTTA
	qX2+g6FgguDRC6In9AzW85RA4sd3fnOXv7a0+5OTx8oikKpsFseMHoGJGyV34GKBmCgYy3WcDCX
	GEWWCgOTzwhNNGc1ZPAIS1TvSFaki7LXDYJJzoskS9fQCY829WYy3tsooh/ixqQT1t0bsgsDIqY
	DoiYxrPnbL9AoVcssH33sg3sn4kjCoAWs8LyRpkZr1ZESR0EKm74JK1u2ln1zYvTkxz1i2US1AM
	CXyCFMGc65EXulqsW0/3MmiWANURZmRgd5eq7L33lHSYao5CSr981JALRWIybTHfIOvDtGOWtjC
	/xT8SgcHdLg/B9ZhTPn8RKk6MumuAJuxyNOMmG
X-Received: by 2002:a05:6102:5045:b0:74d:ce64:efa9 with SMTP id
 ada2fe7eead31-760e9951613mr248343137.12.1785867542499; Tue, 04 Aug 2026
 11:19:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <aaec8809-8218-4412-a60d-931406dbf287@arm.com> <CADvTj4qCYjQHOQn1jRTHNNL=xeX6z3Dgc-PLwOBUvX34AU6cuA@mail.gmail.com>
 <AGtA6uUwR9yJMX3xYVDz6g@gmail.com> <CADvTj4qBhiPczrP9YC2uTW3xss3W7ghoBzbctM45yUROfsgPhw@mail.gmail.com>
 <9dd29610-d9e4-48f2-9638-2c92863626f8@lunn.ch>
In-Reply-To: <9dd29610-d9e4-48f2-9638-2c92863626f8@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 4 Aug 2026 12:18:50 -0600
X-Gm-Features: AUfX_mz3g4QTcPY454fO0IFbyzeMUZwp-7hNsyVehWuEMEZKpHqKrBiqjbTDjEY
Message-ID: <CADvTj4phzmD4otOSkVDaKOWH1nf1aCku37RUncqWeDBcwzjMJw@mail.gmail.com>
Subject: Re: [PATCH 00/21] net: phy: add X-Powers AC200/AC300 EPHY support
To: Andrew Lunn <andrew@lunn.ch>
Cc: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
	Andre Przywara <andre.przywara@arm.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Maxime Ripard <mripard@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	mfd@lists.linux.dev, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 11:38=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > The AC200 Datasheet V1.1 and AC300 User Manual V1.0 block diagrams show
> > effectively the same EPHY organization: MII/RMII, auto-negotiation,
> > Auto-MDIX, 10/100 transmit and receive PCS/PMA blocks, LED and
> > clock/reset logic, a PLL, and the EPHY analog front end. Both variants
> > also report PHY ID 0x00441400, and testing shows compatible link-side
> > paged registers and behavior.
> >
> > What differs is the surrounding control path.
>
> Which is still part of the PHY, needs driver code, and so should be
> part of the PHY driver.

I agree that the EPHY-specific control registers are functionally part
of the Ethernet function. I do not agree that this implies every device
containing or exposing those registers must be owned by one
struct phy_driver.

There are two orthogonal parts to this design. The control-driver split
models the actual hardware devices and is used by fixed AC200, fixed
AC300 and bootloader-selected systems. CONFIG_OF_DYNAMIC is only one
optional mechanism for resolving which provider exists on a
dual-source system. Removing that mechanism would change variant
selection, not the device boundaries or the justification for sharing
the link-PHY code.

AC200 in particular is not an Ethernet PHY. It is an MFD containing
audio, RTC, TV encoder and Ethernet functions, with a shared parent
regmap, input clock, supplies and interrupt controller. The EPHY
control registers are associated with its Ethernet function, but that
does not make the whole AC200 an MDIO PHY device or make its parent
resources belong to a struct phy_driver.

Mainline MFDs normally keep the shared device and regmap in the MFD
core and bind child drivers to the individual functions. The existing
X-Powers AC100 and AXP20x drivers follow that model. This distinction
also matters once multiple AC200 functions are active: the Ethernet
driver must not assume exclusive ownership of the parent or reset and
disable resources which may be used by the audio, RTC or TV encoder
children.

There are also Ethernet precedents for keeping such controls outside
the link-PHY driver. In
drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c, the H3/V3s EPHY
clock, reset, power sequencing, mux selection and MDIO address
programming are handled outside the PHY driver. The link endpoint is
still managed through phylib. The Rockchip stmmac glue similarly
handles integrated EPHY power-up and power-down outside its PHY
driver.

Those examples are not identical to ACx00, but they show that mainline
does not impose a rule that every register affecting a PHY must reside
in its phylib driver. The appropriate boundary depends on how the
devices are addressed and owned.

The MDIO PHY node and the AC200 control child represent devices on
different buses. The phandle between them describes that the MDIO
endpoint depends on the Ethernet function of the AC200 MFD; it does
not claim that the whole AC200 is part of the link PHY.

AC300 has a different topology, but its control interface is likewise
a separately addressed MDIO device. Folding everything into the
link-PHY driver would not eliminate either cross-device dependency. It
would make the driver reach through an MFD parent in one case and
operate a second MDIO device in the other case.

This remains true with CONFIG_OF_DYNAMIC disabled. A fixed AC200
system still consists of an AC200 MFD function and an MDIO PHY, while
a fixed AC300 system still has a control endpoint and link endpoint at
different MDIO addresses. Both then use the same link-side PHY
implementation.

> > AC200 is configured
> > through its RSB/TWI-backed MFD registers, while AC300 has a separate
> > non-PHY MDIO control endpoint.
>
> Which is an implementation detail.

It is an implementation detail of the common power and configuration
operations, but it is not an implementation detail of the Linux device
model. It determines which bus enumerates the device, which driver owns
its registers, how accesses are serialized, and how its resources,
power-management lifetime and removal are handled.

Mainline commonly separates shared functionality from
transport-specific frontends. For example, the AXP20x MFD has common
code with separate I2C and RSB frontends, and the Microchip KSZ switch
drivers share ksz_common.c while retaining separate I2C and SPI
frontends. MDIO mux drivers likewise model access-path control
separately from the PHY devices behind the mux.

The ACx00 provider operations serve the same purpose. They keep the
common link-side PHY behavior independent of whether its prerequisite
control device is an AC200 MFD child or an AC300 MDIO device, without
pretending those devices have the same bus semantics.

These bus, ownership and lifetime differences exist in a completely
static DT. They are not introduced by CONFIG_OF_DYNAMIC or by runtime
node selection.

> > I do not think the control-provider reference is artificial. It
> > describes a real functional dependency: the Clause 22 endpoint cannot
> > be accessed until the selected package-specific control block has
> > powered, calibrated and configured it.
>
> Nothing too special here. There are PHYs which do this, in the PHY
> driver.

The individual reset and calibration operations are not unusual. The
relevant difference is ordering: the real PHY ID cannot be read, and a
normal PHY driver therefore cannot be matched, until another device on
another control bus has completed the sequence.

Mainline already handles some pre-identification prerequisites outside
PHY drivers. Phylib handles generic reset and supply resources before
driver binding, MDIO mux drivers establish access paths, and the sun8i
stmmac driver powers its internal EPHY before MDIO enumeration.

Using a forced compatible can arrange for the link driver to bind
without reading the ID, but it does not make the prerequisite control
device part of the link MDIO device. In particular, AC300 still occupies
a separate MDIO address and should have normal MDIO-device ownership
rather than being accessed behind the MDIO core's back by a driver bound
to another address.

The same cross-device prerequisite exists on fixed AC200 and fixed
AC300 systems with CONFIG_OF_DYNAMIC disabled. Runtime selection only
decides which prerequisite device exists on a dual-source system; it
does not create the dependency or motivate the control-driver split.

> > I also do not think a bootloader fixup should be the only supported
> > selection mechanism. Boards using the same compatible have shipped with
> > either package, and the SID field provides an authoritative package
> > selector which Linux can read directly. Handling that selector in Linux
> > avoids making support depend on a particular bootloader implementation.
>
> There is a trade off here. If the hardware design is just ugly, badly
> thought out, poorly executed, not following the industries norms, we
> want to push back on the hardware vendor to make the next version
> better. Until that improved version comes out, either the vendor crap
> driver should be used, not Mainline, or we try to hide away the issues
> in the bootloader. A vendor which actually cares will improve, they
> know what Mainline means. And for vendors which don't care, why should
> Mainline care, especially if the issues can be pushed to the
> bootloader.

I agree that mainline should not absorb an unbounded vendor workaround.
I do not think this is such a case, however. The package choice and SID
selector are documented hardware configuration, not a heuristic for
guessing around an unknown silicon failure. Supporting second-source
components under one board identity is also not unique to this
hardware.

Mainline's drivers/i2c/i2c-core-of-prober.c exists specifically for
systems such as the Google Hana Chromebooks which were produced with
alternative components. Their candidate nodes are marked
"fail-needs-probe", and Linux determines which component exists and
enables exactly that node so the candidates do not fight over shared
resources.

That helper only covers alternatives on one I2C bus, so it cannot be
used directly for the AC200-I2C versus AC300-MDIO topology. It does,
however, establish that selecting a documented second-source component
in Linux is an accepted model and not inherently bootloader policy.

Whether a future component should be redesigned also does not resolve
how to model already shipped systems. I think the relevant mainline
questions are whether the description matches the hardware, whether
the implementation is bounded and maintainable, and whether it has
real users and testing. Here the selection is deterministic, comes
from an authoritative SID field, and has been tested on both package
variants.

A bootloader fixup can resolve the package variant, but it does not
change the driver architecture. Once the bootloader has enabled the
correct provider, Linux still has an AC200 MFD child or an AC300 MDIO
control device plus the common link PHY. The bootloader chooses which
provider is instantiated; it does not merge that device into the link
PHY.

This is another point which is independent of CONFIG_OF_DYNAMIC. Fixed
descriptions and bootloader-resolved descriptions still use the
control-provider split. Dynamic OF handling only adds Linux-side
selection when firmware leaves both candidates unresolved.

> We don't want to mess up core Linux code to handle one broken device,
> that just makes ongoing Maintenance more expensive for everybody.

I agree that core changes require separate justification. The proposed
MDIO OF reconfiguration support is generic rather than containing
ACx00-specific checks, but it should be reviewed independently on its
own API, concurrency and lifetime merits.

However, rejecting or narrowing the CONFIG_OF_DYNAMIC and MDIO-core
portion would only mean that unresolved dual-source systems require
firmware selection. It would not make a fixed AC200 cease to be an MFD,
make the AC300 control endpoint cease to be a separate MDIO device, or
justify duplicating the common link-PHY implementation.

Fixed AC200 and fixed AC300 descriptions do not require dynamic OF
handling at all. The control-provider model therefore does not impose
this core cost on systems whose package variant is already known.

> > A bootloader fixup remains compatible with this design. If firmware
> > enables only the correct provider, the fixed-description path is used
> > and Linux does not need to change the tree. Runtime selection is used
> > when firmware leaves the package variant unresolved.
>
> So i would not try to fix up the unresolved situation, just do a
> dev_error(dev, "Please upgrade your bootloader"); and return -ENODEV.

I do not think -ENODEV is appropriate when the configuration is not
actually ambiguous. Linux has the authoritative SID selector and all
the resources needed to instantiate the selected provider safely.

A bootloader fixup remains useful and takes precedence naturally: when
firmware has already enabled one provider, Linux follows that fixed
description. Runtime selection only handles the otherwise unresolved
description, just as the mainline I2C component prober handles
unresolved second-source components.

If the SID cell is absent, invalid, or selects a provider not described
by firmware, then failing with an actionable error is appropriate. When
the SID value and both candidate descriptions are valid, requiring a
bootloader upgrade would reject a configuration Linux can identify
without guessing.

This proposed error path concerns only the optional unresolved-selection
case. It is not an argument for folding the AC200 MFD function and AC300
MDIO control endpoint into the common link-PHY driver. With
CONFIG_OF_DYNAMIC disabled, fixed and bootloader-selected systems still
retain exactly the same provider and common-PHY division.
