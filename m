Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620227;
	b=kS2DuoDIU/uGe7rJFIJVyMYiq27r9MfaxHUr/i4ZJ7PlyPhzMqHirtxw09i+0euitMTX
	 qv6jWZJsZGbVEk0ZPJ0GQK1bjP6Nsplh7c5yDpB7TcwIOEe8IFltjBnIogI7/bm+siAZW
	 5q0ntk5WQSrXdF/SaHL4uJfANh/Eajmy0Urqzg7DDu1YXjQt7bKpQVqBW6bcmat0Rh3K4
	 X3HvgQaScOgVw9EUP6eQtqggqCitur0VZXtLubvK2rPf5/tsCJRhX+RlHFU0au/uG6nSp
	 fXxo07vg/5w4fhK84LqBs4/8/jqFUXPXVUQZeMlOv1ra0eBtkC8B4WFon34Oc8QsuoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620227;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=ThFdUoEJLgqCzj0vafLu3KqzUK86YitR/mdeY+BUk6Y=;
	b=O+xXcelmeOGax3pfYj5WYVB/dThP1uKrm6oS+Vt7uOJk3Xx2AE4D3hWX8biEJydfPzkL
	 o35rw7pyEYckJc9GAWFoBNoq5k4J9htn4FWRNGmLjggK8TSz1jx3+KcYggYrriRuFYtMf
	 g4aOOW/BpXIkz43jJyilqRBRUDhCeHcYbvARXn1QjnFzPRvC8Jy3duvRLKx/GmjhPsRGK
	 xBvJCU8lqT253/wrtnZqvoye5Ln0T5o6/WnQDmFwjubhVgkTyFFflfY4Fs/jBcKVPbuw6
	 qJD7kZHRFhqKE2iXiQhXOSxGwDh9v4NlCbscas6DLPQO6fxOKCE/OTfxWcIV9icj68g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b="0++rdv/U";
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F7C606A327;
	Wed, 25 Nov 2026 15:23:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3F7C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=0++rdv/U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=ThFdUoEJLgqCzj0vafLu3KqzUK86YitR/mdeY+BUk6Y=; b=0+
	+rdv/UzeXgKEWrxyUm2DWDbskcRohtC3uXGCMM+h/PlzgBWFEGRDttHI8k5wQ1oEwK8Yv08V7l7iW
	MHBm4KEPc79e9TDjqWqkv079MFfabStCjmcVEjgBeTieU45uuXG/fG9O8vFg4J55ru2pLfnj7rkT+
	bPu0p/C11Z17gtU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xWEq8-001LhM-9d; Wed, 25 Nov 2026 16:23:20 +0100
Date: Wed, 25 Nov 2026 16:23:20 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Alexey Charkov <alchark@flipper.net>
Cc: Ryan Leung <untilscour@protonmail.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/5] nvmem: rockchip-otp: Derive MAC addresses from
 the CPU ID
Message-ID: <1defc5c8-ba61-40d2-99f3-6654f1743af1@lunn.ch>
References: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
 <20261124-rk3576-otp-cpuid-mac-v4-3-d403b8a25113@flipper.net>
 <0aH4P5VH9HNiTXpCUTaTlvGaoUDQBnvv-0cSXtipSDkLOGjzGy96jDqsVtU0DJTWrocgoMcGFEgd0JUlF5mljVvCzGKVz4yUgDQ0s6HaDLg=@protonmail.com>
 <2f8da604-36af-4944-8168-02b046e97699@lunn.ch>
 <CAKTNdwG1sSBVKcKpHBj24nFCdc6WVKabV5=K4sJFucWpTLqRQQ@mail.gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKTNdwG1sSBVKcKpHBj24nFCdc6WVKabV5=K4sJFucWpTLqRQQ@mail.gmail.com>

On Wed, Nov 25, 2026 at 06:41:42PM +0400, Alexey Charkov wrote:
> On Wed, Nov 25, 2026 at 6:21 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > > > +static int rockchip_otp_cpuid_pp(void *priv, const char *id, int index,
> > > > +                            unsigned int offset, void *buf, size_t bytes)
> > > > +{
> > > > +   char cpuid[ROCKCHIP_CPUID_LEN * 2];
> > > > +   u8 digest[SHA256_DIGEST_SIZE];
> > > > +   u8 *mac = buf;
> > > > +
> > > > +   if (!id || strcmp(id, "mac-address"))
> > > > +           return 0;
> >
> > I don't know OTP drivers. But to me, a function called
> > rockchip_otp_cpuid_pp() which does not actually return the CPU ID is
> > architecturally wrong.
> 
> There is precedent for this at least in IMX [1], [2]. To me the
> interpretation is "Rockchip CPU ID used as a MAC address base with
> offset X", which is exactly what the derivation does. IMO, this is
> less clunky than the alternatives (e.g., a custom NVMEM layout which I
> used in v1-v2; a "virtual" NVMEM driver referencing the real cell and
> returning the processed one, which Ryan proposed in v2 discussion, or
> caller-side processing).
> 
> [1] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/nvmem/imx-ocotp.c#L224-L238

I would say this one is different. The cell specifically contains the
MAC address. But its endianness is wrong. Nothing about CPU ID here.

> [2] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/nvmem/imx-ocotp-ele.c#L115-L129

And this seems to be the same.

As i said, i don't like the concept that a function called
rockchip_otp_cpuid_pp() returns something which is not a CPU ID. The
two examples you give ask for a MAC address, and they get a MAC
address.

Does nvmem support aliases? Can you put two different names on the
same cell? If you access the cell via the name cpu-id, it calls a
function _cpu_id_, it gives you the CPU ID. If you access the cell via
the name mac-address, it calls a function called _mac_address_, and it
gives you a MAC address.

That way of_get_mac_address_nvmem() just works, so the MAC driver just
needs to call of_get_mac_address() or of_get_ethdev_address().

      Andrew
