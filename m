Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795629716;
	b=gW1LapXHUxPCfg+3f2X+IOtYYTRTuNttDXjF4jQaCmLHzBriHy/3unKBcttVneWM4haa
	 nfjSmJRltmrs+1V+08lcV9/djlq4+rzQsMbPaCX0awRRvJL4vEnq2mml8UH+QCR/VMzc/
	 P+8T+b+NlUDmzvlF6bYyzuT4lgiq20t7UdGZSBv4xEH3E6XVpozIg1odfX4dOoo9xy5ru
	 TapVEETQ7OBij888QFcP8u6c6p9Pvdp7j1zjdWVZAVbNIUW9/GWYAE5cRqJRtRxZ1Jmjt
	 G+AfOV+9jnziZVHmDDx4knXl1vWLdwYMD7e810QxqHPyZ14xaIaQBLbp7kvuefptAYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PpDc8pLBtpg0emxjGkZmwsobsd8c7YGJx/bCDbNiMik=;
	b=NfeNWsH/sJl5fHGAjJjudg8VbESDpi06iGm/C2r9Mfxmnz6/lMTb3wFcrfG64EfHyu9Q
	 H41ipAThTH69pN3pYtU1KWtEwK5EA7B8sn/pagYUtr0BXRDs/iNAotJBiHihBx8VQEM7u
	 L2886hyw6bTPf04Xbwz2PGm/yLvTbRwP9Ydj76ph+mK54Wd2tAI6d5SLiWR1pFB+zRn7/
	 Q/7M2e8DLeG5BHTOXUBeCyReAqkfovvMITBml4MBZd7fFnghcvQTKXo9LQXEGUJwD7nFX
	 yLONBXqFa0zjdRJG9TS93ie27MkiCAG9ir75DSvG2CnxmNR+3x5+ZWl9uNlEKBGXa5A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=1AqyQGAv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA87606A32C
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 18:01:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DA87606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=1AqyQGAv
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso907126466b.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:01:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795629715; cv=none;
        d=google.com; s=arc-20260327;
        b=cHLZ2W5qUVlC594b2TVaE54fDxUyo7MxyMOryXr5a6RWQXPch6Gj94L1KHJrj+RqEr
         n7kq/5NoGQ+wBGr8rBWlotiDi6RdGXFH3NoHgIvu/rYXRQOe0/siaGaVZyiwPVuYGneY
         fSl/jhhqp1J3MUuk70hFaI3PbBDnBouG4J2o/y32bLY+WsuDVSJZygxUdYfk3WbFWM2i
         crKw8JVCftej+1GagU8wAsDiGzK6McHVVwc2e1C4/9SOsuARRundNQwZLdmrf1vOe0ws
         wd+N3ypiwALjF1kRMorqM6btr6g7XIIBNWYxNjjD9HUsEelnjUM1xYjYOdAOjXG7xcAC
         sDJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PpDc8pLBtpg0emxjGkZmwsobsd8c7YGJx/bCDbNiMik=;
        fh=G8LOi4zKUqxdOZE4LRsNHy8V2e1HAnbjY9y9cm5ZBgk=;
        b=rQui28FwPcq0It1huJ8id3CU/2Oh33h5jedDuOOoL0bQaDoSXuZyD4RfQOWdGJ8b8f
         uuCOXyK3NtdKgvP8uJUfWuINMlkghaQgsiV2JpajOa7FZPylrM3DQNTWv/Di8r1V1/bm
         uvW0kNENjsX2NRzycU/Hs0jxgjFMktORJxidtnE+YNjR/OfbJ25ay1p1BUVWhb6fqBel
         DuVaaLiYrSxemAIVnBA6dHRW6h6PQcYVS12xsoRHdmcJJ18UScuDkxc+KOOKhkAgxVkb
         jpOAteZ1zz2glib3lypRfbPMZkYA5qZ2q5qzt0o7pKkx0tCSOZCJCmP/jpMhTv4lLCcp
         Aj7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795629715; x=1796234515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PpDc8pLBtpg0emxjGkZmwsobsd8c7YGJx/bCDbNiMik=;
        b=1AqyQGAv6vzNOGgyTFy57snW4o9MHPbh6PVD20GCOIDqqla4H5Xj8jdM6bYO1leusE
         2mp+XMhR/FKdsAuBX0p/3OHWwu7RNsfkfIzdMpFiDHK595hc//oXEYUIrpvvqL5WpUVO
         jAyhWBT8DyonHOSVtxH/BlFAXUHwx5/D639tu7i9xAMGKzj2w43x9OEJLSxenJTlRUKn
         MUr/6UR5LpXcQ6gLYSbTiEtXiu/ubRrYEmAKVXs4URYv7JkSehXOuC8/L+pEqAxzzkaV
         W/I+oX9Ww2JLF8g9gJOmscxkLb3ckyB6CdR09xndpPt3j/vbKQwpJ58eQYfmBMB+LVB9
         ARwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629715; x=1796234515;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PpDc8pLBtpg0emxjGkZmwsobsd8c7YGJx/bCDbNiMik=;
        b=UokqGVW7TrXVHqiiqCaz9c9TAYHNnm4rp88WIh6SoSSR0vRfzWMuJ1sV1VNeAWLZDU
         0L9DJx0UoP6J5U0w220ZkjfGcgFy9DkbpgFxaUgotq+YN+/oQplsq4emN+n8meZyU0+e
         6c3Zb3ZywxHl8vmQTJP/zLg23vkEYlf4TCYlzIPF/FxQhgDQ7cOme6gCOTmLTYa91eu5
         28FSLt6q46+warXxajoRzKS6VnRZEHtHTmIcfmb4TwjjT/YBW5LxCPJPDfomKCgDUMD0
         ucRvs8/8ct5SfgRlU36SrOI5F0aLgmmghiHHXlF6Hsn2vdPKmLRfyStvxhDmohzesl0i
         RkLg==
X-Forwarded-Encrypted: i=1; AL+hErGqG3D47uoNKo60RDDBv7dFNkUirAcbhvmCApktXowPxMG3baHg8J8JBcj6AFiXX2/PuVOYC7lzh5Kn@vger.kernel.org
X-Gm-Message-State: APuU4Z8JCJ/YRlpaz2QJmnuzYTuHYcj73Kx068PLh6OIYW3zIC8gozYU
	JYKCU56qXUw6h6zjaSR3VoV1aL3aSAj+HV9xvytE3Oop8eiS1CajWWhGR4pAjI7gX0EDYLD3E9p
	SGSiRRFOgxh/Y9bvXUhu3DgtLZn3gymNDFzPKQ32EMA==
X-Gm-Gg: AZFdTZfeT7Sz7zuh4/oELy8KhvmHgcTuWFDvPzPTl1S2Uzw3xV8+vaXhM91Y10X+xPY
	LcUrlSZXUX6rwmU5EPhTxRQ1YjwweoWZKEhxrMCDPq6JwRUFAJ8waOCk+LQjA1hjuJN2rOmE/gC
	sln6eXPmAEsDfCUpdjhchVCgbvLGqLxaCgMleXZq0SFpUPjgCf9UjqpyK0BIpi9yjbiEwwdU84Q
	RSFOc7fdFVmjBCcLMbVQmPVJhBpVGZvGI1/hOChzHz8APvRc0FGgxbR4i9aS6MxDt9bazZHT6ha
	OdwrAV4tA5hv+inBiTmISsfkkn+lHHXb9g+NpM/DwxU9o8Hz/N8R2X6r+PjqPBqtILLUF+/HrKm
	y/EvHZ1MADrDv/0IdF2CfMhwUVj1aQtGrN9im+h1Xn6xH1Eird5dKOFgtAKrHFVZBfU0k
X-Received: by 2002:a17:906:af85:b0:c3f:dce3:20c5 with SMTP id
 a640c23a62f3a-c513ac496d8mr1123543566b.44.1795629714600; Wed, 25 Nov 2026
 10:01:54 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
 <20261124-rk3576-otp-cpuid-mac-v4-3-d403b8a25113@flipper.net>
 <0aH4P5VH9HNiTXpCUTaTlvGaoUDQBnvv-0cSXtipSDkLOGjzGy96jDqsVtU0DJTWrocgoMcGFEgd0JUlF5mljVvCzGKVz4yUgDQ0s6HaDLg=@protonmail.com>
 <2f8da604-36af-4944-8168-02b046e97699@lunn.ch> <CAKTNdwG1sSBVKcKpHBj24nFCdc6WVKabV5=K4sJFucWpTLqRQQ@mail.gmail.com>
 <1defc5c8-ba61-40d2-99f3-6654f1743af1@lunn.ch> <CAKTNdwFktkMtdLW2GzqzLH+LO4kF0uY0jWpnvO5vbWmd-e4iWw@mail.gmail.com>
 <789d3358-81cf-4276-9f8e-4787df120059@lunn.ch>
In-Reply-To: <789d3358-81cf-4276-9f8e-4787df120059@lunn.ch>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 25 Nov 2026 22:01:39 +0400
X-Gm-Features: Aa3M54rXKAuPqQg_Ygp0o8wODv5WUBqheLR9BXAdmhPLGte_-jSen4aa0CPalg8
Message-ID: <CAKTNdwHugVHb7hBzKHdorrCNmBanZ+k21GdMJieD7=_Z7446bg@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] nvmem: rockchip-otp: Derive MAC addresses from the
 CPU ID
To: Andrew Lunn <andrew@lunn.ch>
Cc: Ryan Leung <untilscour@protonmail.com>, Srinivas Kandagatla <srini@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, 
	Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 8:41=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > That way of_get_mac_address_nvmem() just works, so the MAC driver jus=
t
> > > needs to call of_get_mac_address() or of_get_ethdev_address().
> >
> > They still need to relax the size check as done by patch 2/5 in this
> > series, because the CPUID cell is 16 bytes long. Srinivas rejected a
> > prior version of this series that attempted to return cell contents of
> > different sizes depending on the use case. Currently any cell size !=3D
> > ETH_ALEN gets rejected by the net core, not just < ETH_ALEN.
>
> Ah! I had not looked at the whole series.
>
> Having to change the core like this is an argument for doing it in the
> MAC driver. It asked for a MAC address. What it got back is not a MAC
> address if it does not have 6 octets.
>
> Please throw this all away and do it in the MAC driver. If there are
> multiple RealTek MAC drivers involved, you can put it into a little
> library and share it across the drivers.
>
> It is actually an interesting idea. Maybe it should be placed in
> of_net.c, so other drivers can use it. How generic is it having a CPU
> ID in the OTP? Are there other vendors doing it?

From a quick overview, Allwinner does a similar thing [1] by reading a
"SID" from its eFuses, and Amlogic [2] by reading its secure-monitor
serial number - so it's a reasonably common pattern. Everyone uses
their own derivation functions though.

I think I could try and add another branch in of_net.c to parse an
NVMEM cell called e.g. "unique-id" with platform-specified derivation
functions selected by the cell's compatible string. Then derive the
MAC index from the OF alias, so that the phandle argument can go away,
and the numbering cannot drift apart. Will send a v5 with that
approach if it works out.

[1] https://elixir.bootlin.com/u-boot/v2027.01-rc2/source/board/sunxi/board=
.c#L783-L828
[2] https://elixir.bootlin.com/u-boot/v2027.01-rc2/source/arch/arm/mach-mes=
on/board-common.c#L79-L107

Best regards,
Alexey
