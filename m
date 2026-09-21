Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C85C4A689A
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 15:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790003400; cv=pass; b=mIDKcs0FKl9+Iq2styvEiSPL8xOZdE5BEcWI7cr8wDrg7Zor0vGX0ZNY0vdkNtmNMryCPwgQUU3wLlv0MSNpRdhawcr6YSQBSjj8sjhF9WiARA+qM+lu0eiZ1PCi6Aqtz1X34WS4elW/GM3QSD/sk/rey9u1c97xjz8mFpc4Z1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790003400; c=relaxed/simple;
	bh=RRnt92cNZkan/7gjLZgpWKhsYasr+rG4EuXp94q+O0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n61EISjfNLu4F5fPg05ol6SOn1tdzqh39CGWy3yqWBVGTzJyJFrABKCY7x/pKoC9gmla2ScTjIRA86PdTb1jj0HxyH4LVzFmbb2BK/5wHXKzoe5YCcTL7E+4CCkpO6CTNwOl5QWwZDde5gz+UwFVUawzskxR71ZRe+xZ4C+Vk3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p7ejU3T9; arc=pass smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p7ejU3T9"
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-78565b4db77so1577988137.0
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 08:09:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790003397; cv=none;
        d=google.com; s=arc-20260327;
        b=nDt2WA2tilAngO/6i8qio8iVCT5VBqIfRRbLS/uAJLdRAS0FqTD9ZAOMM4s4W02FNy
         RWCbORFAsmQc+1KYlroAex+V8OLP84aSsxJV0OF7k9dLTxoUYAj+tryfGg6iArYYbgZY
         hNsxiCJGUzFWhKmS8LJyb7g24BNu8U2n8Yyk4xLRLV9fMPogVWF5P/pnmffw2HG56l4G
         xqt/zM1g5rUGDOkGks1vFf1wqTBZ1N86DPFl9AKiH853/mSP1YAmHpf+ilryupEzPv91
         QFlHSqonGGBi7401va+guswYTozNpSonuRkee4LL/FQSbFdIP3TtKbdFO9zHBgDcemjS
         k0bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g1DBiA0IyE2Ft5pvUMescJhhLqoAG9H5I9OM90H7dNs=;
        fh=Mz65uUwBkcWIguE6X3y/aCswL6uXf347EAOPR3l6oDg=;
        b=RDY6rPhgQ0uXC/+gB6lvNObgyZAt4b0i4YHEoAgKb5DJ88rixBWHExOXeYXVHNhbeX
         tuODKMYSQl4V3J2QEAqieXO5g8ZsQickP7HpTd1qzXWxHiiehr2jjeRfcyfh64vwgbLN
         etKLmHASNu7jGFzeFva8HwfgRu1VOi2OJTulvSbHfSnG/0lfZc/ISB7UG6FZpJiPCMX0
         GSBEw37WjZFhv/p3k947aQmo7NrUH0d6IRk+98eQOMMy/cnI7KtZAeBTvZj++MtCwOMn
         Kz2uel9Um52+NsQWvtxGPgrdVxfqoBciTca3HV09XOkDWQpCOglGmAGUNkNBnS22MVgE
         7c+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790003397; x=1790608197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g1DBiA0IyE2Ft5pvUMescJhhLqoAG9H5I9OM90H7dNs=;
        b=p7ejU3T9zk/yJq0i+ywQG2DcNQFEZSiDraIlntCr+rtmLcG4bf6m5qinkJMa2ZNie7
         8ai/rMVCKfMMbaxXNHryj8iHP4VCTzNNwF33qjx6yeo+sqHjl6qI8ZqatabAmc3HSUdj
         cwxQHifLkcBVB2O5kYiYJzdNEWrnWLyvipqpAnzqnneKR1ARP7l1cMGd6pKWEUy36bG3
         kI0LqdkrjKDcp6IZ3vqbWp4daSYbVODOaatr+bHivw37RHoAqGhsMZcsOR/5PCKV92l4
         bTvYyVCiLG42qRdZS7HfbzfH3qapCjqxGkC7lbEP2H0VmPWI2a5BAVDogPChvpleNviC
         RpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790003397; x=1790608197;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g1DBiA0IyE2Ft5pvUMescJhhLqoAG9H5I9OM90H7dNs=;
        b=2qWD9yttmoseQsNCaN5K57FE18bPbi0DLDoSdilL+X277eyLOij5RG5WyYXymalYVM
         M6iFnaJ9jSPKZH3V+ffMDEYCnK/glr3gcKo9NCRzilronFbvp/HjLGx4hfqZPT5sKYb/
         WivrinhiQ7jes0RTeRVdYYeVJNGxoZw5ZfsuXAMhQ3jU0UVFNNnRmENRUfyv5DNf9RGW
         dGW0WuQE6LC8eLq5TJ4Aqi0kCceECZLWJrf1hvLmv3yN1m2+4gDnB2rAQlN9ffLlKxVR
         ZjFz+IOMiLu4Qcp9VGAgeK/ESKY5GcS2sdLPtUiA/HZ3wAEtcNkMUxumRpaumQlOh7AB
         PG8A==
X-Forwarded-Encrypted: i=1; AKwUvBzes/bIAGZ9FR/In4M/Of+l23rDha5DzwEdTRO6nC6OqJ4JLBIZ4DBMLiobnTTli1fn4TQG9CLw3TZQ@vger.kernel.org
X-Gm-Message-State: AFuF++m/HOYK2tMt72st/jSBH34ByxNpYg1wzIG1nSXTxDHiMlYkQ2da
	F5nFtg4u+jF4NE2d+HdobOsJn1yeG1p++MZ+rr0Pvrx2lTCFiMrOkEiEugmGNk/fQuiX1rVOeEd
	JTy96Xg93dU+oi9pVL+TdY8KlRTIlTXQ=
X-Gm-Gg: AYBFou1EsLEn9RjFreSXaGdoRdgBqno0YrSekR0qspGbKbsRfesP1mGhuq9MRgpJfzW
	pgq2J/K0IAJNUs42S2UYJfy1eNGX6/QuxeivUCIPyKi+sE1pMX1pwIcHTpvIyIq7QyYFNEWoNbu
	34mkbQwyyWMAOJWDiiR2pPAJnxkhMvxjusUYateL8ck4Oy6HI+4VpaZX9VFqnUTUIgMQSBb2Obw
	nB4BIscTL+ss9pHhQ00+OkMnS58kMHaPT82eas6R9Pvkv6kqgwNhkqpn+sMj1Hu0XdUuNrnEYPf
	JCPgm4kEDGpmUZ2XpRKJNJRiWtX+EoMr4pNEMMrQsI48fMaID/EzgMh0sEbyMKTBXn92n5MABXZ
	j4ar6sBYfrVpO1JYEgTCm+oRTbntgBrUAjnewdVpMOP7pcZzYVHPqwJDErM341bhgZF/zN/Ub7Z
	rsOgfCNIoQgYCHsQpsSb3rCdu1B6YETacb6L8duiPkBRlwn3L/cRTSGkE=
X-Received: by 2002:a05:6102:148c:b0:7a7:198a:c2b5 with SMTP id
 ada2fe7eead31-7a7198ad369mr3357929137.29.1790003396967; Mon, 21 Sep 2026
 08:09:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920-submit-h616-emac1-v1-v4-0-8347dfe2eb7d@gmail.com> <475799c2-7eaf-45ed-a6cb-80c2c2c556e7@bootlin.com>
In-Reply-To: <475799c2-7eaf-45ed-a6cb-80c2c2c556e7@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 21 Sep 2026 09:09:45 -0600
X-Gm-Features: AcwNN1VLNx3dtquO69cswaFe7FbqPEaN3LW5P0JUb4jisnZv9ewZXpukHo1wT2U
Message-ID: <CADvTj4qdVGDXGyXHmCGpb+ztvXs2kS3_joaCZkM0dq_sYvHscw@mail.gmail.com>
Subject: Re: [PATCH net-next v4 0/6] net: stmmac: add Allwinner H616 EMAC1 support
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Richard Genoud <richard.genoud@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Christian Marangi <ansuelsmth@gmail.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, "Alastair D'Silva" <alastair@d-silva.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 5:54=E2=80=AFAM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
> Hi James,
>
> On 9/20/26 21:45, James Hilliard wrote:
> > The H616 secondary EMAC supports RMII at 10/100 Mbps and uses a separat=
e
> > system-control clock register at offset 0x34. Add its binding and a
> > sun8i stmmac variant using that register. A distinct compatible without
> > an older fallback prevents the driver from using EMAC0's clock register=
.
> >
> > EMAC1 connects internally to the co-packaged AC200 or AC300 EPHY and ha=
s
> > no external PHY pins. Leave PHY initialization to the PHY driver instea=
d
> > of using the H3 internal-PHY controls. The RMII-only variant does not
> > expose the RGMII clock-delay properties.
> >
> > First fix failed MTU-change reopening and hardware-resume cleanup in th=
e
> > stmmac core so the interface is closed without repeating NAPI shutdown
> > or resource teardown. Allow phylink to stop a suspended instance withou=
t
> > restarting its link. Then move the MAC software reset from probe to the
> > DMA reset callback, after PHY initialization. This lets the MAC and its
> > MDIO bus remain registered when the PHY driver or one of its suppliers
> > is not ready yet. Clear DMA and interrupt state even if the reset times
> > out. Keep the separate H3 MDIO-mux reset sequence unchanged.
> >
> > The AC200/AC300 EPHY driver and package bindings are already in
> > net-next. This series separates the H616 EMAC1 MAC driver and binding
> > support from the earlier combined series. PWM, MFD and device-tree
> > enablement are being handled separately.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> > Changes in v4:
> > - Add a prerequisite stmmac core fix closing the interface after a fail=
ed
> >   MTU-change reopen without repeating DMA, IRQ or NAPI teardown.
> > - Close the interface after failed hardware resume, and let phylink
> >   finish shutdown directly from its suspended state.
>
> [...]
> > ---
> > James Hilliard (6):
> >       net: phylink: allow stopping a suspended instance
> >       net: stmmac: close the interface after a failed MTU reopen
> >       net: stmmac: close the interface after failed hardware resume
>
> These new patches belong to net, don't mix the fixes and the glue code :)
>
> The glue can land without these, no ?

Should be able to.

>
> Maxime
>
