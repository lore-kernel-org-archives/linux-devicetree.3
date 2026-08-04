Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B261546AA99
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 15:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785857210; cv=pass; b=WZ04zA+Sy2vnXwnuOMjJh66GGYcYrIbXuFM9mMYIQLc676rEXZeBGKEtMQr95E/LRlFLAqkoz/t1AFqU1Or7Tk6bDcxFs77QtVnKBb969nVVh71HnIved9MZRhznQLzONbAZyMtOAOkFKzK9a9cSTU0aeaUKxmDBoqaHrqYqNz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785857210; c=relaxed/simple;
	bh=XUmOi/B6laQ6eMCxOrhzePhtH6HxroybD30jr5qhuKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hrnpRG14pQ+8Q8QhoGzWroz2ayZU1KobItp/pLNCzN2lgAgzrw+ANJFmjpqs/jRi4Jk9U9oZvqy1WyZk9sfo5+Uz9JG0QBLc6KVKNBRKpsnuaiGMBOEhzRSn7Z9U7r7Qm+7gKgzM33slJfEuOAnNueMTfp81AhyrOhXfp1YdGq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kZFOvsbb; arc=pass smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZFOvsbb"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-97727c2064fso3112051241.0
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 08:26:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785857207; cv=none;
        d=google.com; s=arc-20260327;
        b=GipsLJZv6TTwKQaxnbQJwabrkKIm//ubCigzDt8A5zfzBJx3uzlYpVcRg2+oSLZ06n
         qdVucg2S+Tp+OF0GM4XWcpLClSsr1OULabtelpkdZGhbtppei15lTzkgnmeuLzJDEbaN
         h10ugWrqHEscnIzGI3PYs2sWPajCDKk2t533V7/WDwKHDi2qBtCDL5tMkCKhlsWu1BRj
         JP2FNmJVHHpd5C01OmeI6mPXXjaUNZkP1epkp4yYiBGONVk2KsIJU36PsKNyW5HHFxPA
         DXS+debH0DGGfX9Vt0T6d7DP04xizRA/ok4eH2Ssj5TKbn9sd1HWMnDgv0Jun+FsWRRQ
         baVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DIzf+HYojrQvIG1FuzM4Jdr3lr/d2D1NXMxs/JfDycE=;
        fh=m5VJiG8gifcLMOUo6iWvsB616iOFMKlaCbyjaETaw4Y=;
        b=oSc5BWZ4yUg6Y/o+5VwrlAhPuSWBFTONwC/Yeqg65H3HxYl3lAM1Zi4iuRrHtpIWST
         HMQSDUJRmJu6xZVMLupI6NQDVCYiJtrQDifhC4f/M1tmOmk3al+nO52nRD/iwS+aqfwb
         ovOueIXcGW/BGC+V4R9vksRuFJGXxedxoPe4rhQGi8MTsFQjrWyGweeNJ6iu6QTagV5J
         mWPKl3Jf4bnvznOkYKmS0rpujR+iA+4WeqxoZV4cO/LbUFI5kqSl4RZLqPFZ3mpNgzhw
         twTRhTqizJ/JVNJR9CtN+C8zAAslPWivvt1jdxoPvWNMJlK8nMl2yy/7OcHj1H/9SKo+
         Ycvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785857207; x=1786462007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DIzf+HYojrQvIG1FuzM4Jdr3lr/d2D1NXMxs/JfDycE=;
        b=kZFOvsbbm0JHFd/9XJGRnuUrvMfAh4TpKYi56w5dQWmSWE0KVaii9T+vo7U52I/ryE
         x3m292Z1MP9KCMWHjVHWxpqSnzOYCgeEHw0zYqcKUYWGqLjKMjgFvtK9gitR7gu4q4lt
         gs/XK+lLB7dA07fq36vAP6RK8PvbnzqPZd/oex2A8IGw4zNap3Utnf1wQp1hVroSRWCj
         WLsZ8b8bMBIHKsa4RDIqcdFyXB0ypkemA8OKlBGZW4Q8nSGvxwdtOu4WNYbGKvxAxLhf
         vJhAhCCaVGLX3wBIh0aZuhM4JKdq0iOmMYDQT9S95rqFzUtzUbwRddTg11tLgvsla2Ln
         Wcfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785857207; x=1786462007;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DIzf+HYojrQvIG1FuzM4Jdr3lr/d2D1NXMxs/JfDycE=;
        b=oOSUIOs8xbmmZI0OoDgV5GLnA+YDTPF7MmpumMDkS9tzwQcpXLRRon7jo7lBiXVsCq
         ppYSP09LJFlYCw0wiUtSHBHCbfLppW8Qzc3Oggeu29FiWOtTh6Z7KGKPdK8BMGozpN9T
         1LX6qGT7yhr6H0EPt0g+SNtQqNeKBrCyrUo9Xn4kzngoQpUQU/GL2Ja65AJF9BTi9R8U
         0eLtEADn1/4Lw/uEChJEi4VsQ8a3WxBk/rbkHtAW8/AnZbM8CKxJ5CPRzbeb0v8nBERa
         mFYBGF6S9++4bV4W4+tsAJMAA5IOoVvkrhxo3mlNMeTCqSKj/+O/6jCgp1FA/M4PJzOn
         UslQ==
X-Forwarded-Encrypted: i=1; AHgh+RrIX5Q/+noaOZhdxbB0JfyWGcqPkirgAXIomlEvDysp4OrSataCv9yhpc9MabodyzXeMRLbhjCXCZ2F@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6G8xdKzLLmtTxnYGTuUwGJd/NzJaikilCcKBY4T9VAWqqztrL
	I0KaUdem57qqh63zwvXnyIXhh2s83N9E9NDLdw1IJ/aO/7I1lJTyYKSQdLYxvgG2TpO/dNpWntN
	BC96paUYvbUavwFKLnkOE5p0QjSVh+7s=
X-Gm-Gg: AR+sD124bvUqH3XqyOSqLu4dKbZRfryrObiSusZX4vy5Eus/ybfoJpEEScWppoWVBPc
	/YM42iMQEz6jrfZgD2E+fP05Jdk3gDcQKtiXwXc/rqPN0yHsuP8ZiRmfjqWT/EBL8o7q4AkTgUe
	50ZksGIG9XQXVdT2arkpEuy3gOU3R0z17bkEzYvKeDTku98iq6QnkuzALgdAgQMT2wbcM2OYXuy
	Y/oeewOBVHNffwIzXRiGWUtLFYjd+eO+EUOgBndHZ2eZbj58ySDww+FZc418lC0RrkE9E6BNYzQ
	VILa9goz3M6KVkS8Z2URzrlDsOM8OZ6AFXGYZympId3kAIaqpG1yigC0Ur9IxX2S0DWer8rtvW1
	NQkGg4GKso+ZlIuCoCwpL9yR7TaKIIYyx7coLZjrBEf3UOMMBftHBSrGYpkdaeYjApbpkHEhjMd
	sY+/RJ7iUYVmGRRUm76ejEdTU5LK4PQPlirkZ0
X-Received: by 2002:a05:6102:5093:b0:740:2717:a1b2 with SMTP id
 ada2fe7eead31-75b21a600f9mr11149553137.1.1785857207439; Tue, 04 Aug 2026
 08:26:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-10-0a53cd9e21cc@gmail.com>
 <05b1e6a2-725e-4b8e-8629-249637bbcb81@lunn.ch> <CADvTj4o0JdjoO+FC4pO=qnjEQ8MRyzQdKp2Hxy9NsPU-gym5OQ@mail.gmail.com>
 <9b8be475-1fde-409c-a82e-be4b2e402650@lunn.ch> <CADvTj4pBovti19MXgQjFpxm=7aRm0sYQz9jxfo8bu3txH94THQ@mail.gmail.com>
 <a9ce53dd-0873-41c0-ad6a-fb42e6cc7aaa@lunn.ch> <CADvTj4qpHU3F0DrEmc0vFi+JiwTNERniiMHKo1LmBd8sg58wJA@mail.gmail.com>
 <205e9051-8e43-44bb-a4b5-4ec69a192fa3@lunn.ch>
In-Reply-To: <205e9051-8e43-44bb-a4b5-4ec69a192fa3@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 4 Aug 2026 09:26:35 -0600
X-Gm-Features: AUfX_mxUgphmHVN2nVqeDHtOoQ4DhYlfN2EUsZlGA6OuEq-kXlUnQLFlQtbWoRc
Message-ID: <CADvTj4qmXWbDsc-vigcSrF1N=zpxmZWGp3YaZ9PFcWK551h3mg@mail.gmail.com>
Subject: Re: [PATCH 10/21] net: phy: add X-Powers AC200 EPHY control driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, 
	Richard Genoud <richard.genoud@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	mfd@lists.linux.dev, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 8:54=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > I agree that the link PHY cannot be identified by reading its
> > registers before the package control sequence has run. I do not agree
> > that this means an arbitrary ID should be placed in DT, though.
>
> The ability to put the ID in DT is there for two reasons:
>
> 1) You cannot enumerate the PHY because of missing clocks etc.
> 2) The vendor messed up, and did not put a valid ID in registers 2 and 3.
>
> 2 does not happen very often, but this is one example. They are
> different PHYs, they need different driver code, when you consider the
> PHY as a whole.
>
> I also wound not put in an arbitrary ID, pick an unused ID in the
> vendors range.

The value currently used in DT is not arbitrary: 0x00441400 is exactly
what both link-side Clause 22 endpoints report from registers 2 and 3
after the corresponding package control sequence has run. This is case
(1), rather than case (2): the ID cannot initially be read because the
EPHY has not yet been clocked, configured and released from reset.

The reported ID does not distinguish the two packages, but replacing it
with a synthetic unused ID would make an ethernet-phy-idAAAA.BBBB
compatible disagree with the value actually reported by registers 2 and
3. If separate AC200 and AC300 PHY driver entries are needed to identify
the complete package variants, they can use package-specific match data
while sharing the common link-PHY implementation.

>
> > Both AC200 and AC300 expose the same link-side PHY ID and register
> > layout.
>
> No they don't. There are extra registers in different address domains.

The block diagrams make the distinction clearer. Both diagrams depict
an EPHY block with the same internal organization: MII/RMII, auto
negotiation, auto-MDIX, 10/100 TX and RX PCS/PMA blocks, LED logic,
clock/reset, PLL and EPHY AFE.

What differs is the surrounding top-level control path. In AC200,
E_MDC/E_MDIO connect directly to the EPHY, while the package control
logic and registers are reached separately through RSB/TWI. In AC300,
the external MDC/MDIO pins first enter a top-level MDIO slave and
register block, which then provides internal MDC/MDIO connections to
the EPHY. That top-level block also contains the AC300-specific reset,
clock, I/O and eFuse controls.

Therefore, I agree that saying the complete register layouts are the
same was too broad. The packages have different top-level control
registers in different address domains, but the diagrams indicate that
they contain the same link-facing EPHY implementation. That maps
naturally to shared link-PHY code with separate AC200 and AC300 control
backends, rather than two copies of the common EPHY implementation.

>
>         Andrew
