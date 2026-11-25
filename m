Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795614918;
	b=YjgdWSb+NKO/9QhfXoYpXnfHEW41IEfdkIoBXi6aNclDQAyaEN2BHKtnpRWo9W+h4nrC
	 AvAGbLp14Ls1RjFdnbq+EGTManHl76duyqHYf75MPtbcKVPK1+AQ3luM4mggsSlxam/zN
	 ibEUf6+ssB0iKl9zRzeamlE7HjzE/7vQ5qKFArOSemNqe5xmlp2++VxJizf3l1lEerntB
	 wJwHy5C0dUY/aXRv9UiA7O25KbF/2HlCIyGs1bDXvFoIC4Xm3VULQ4jtYmbKXXtXr44jW
	 29efGKMUdyG4nlxPcqBpKg7d0UbIE8zPqyOA/83F4OQxNBiU106guhUho90pan7wnuw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614918;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FCuANSuXIYamXWDtNf7w7lG6eHXyutyXEO9DVfxIUGI=;
	b=YIFmGs0dNij7saMc8tvw1IpHcxBFichzqcv7nsWsSU0nD0iClIyXhqXu0XzhOD5lb0OS
	 D2eGK1Ehk7PtEACDfY9mVqpOct5jul7Zkeh/9s9OFvRCprh4TFaIYdduKABfG6Of3Ad2N
	 +GztyrGT5QnzNdqYP6fqMuv6X0Yzlno0swHt7IfywsSn6eqsJQlCo/lM0ntMucISeYzTk
	 s5LxuYFnvsLQBNxQL7DvHZ4RFe/edRZoWM+lGFNXjuiYTMp6qXS6VUJKoeB/5Y+3C+ypC
	 fCzkf5Th+XYm8WanVpqrE3i4dChlYZ8w+zm3zEyu4M8y08HgsQcVF4XOJpDceQ1mIoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b="s6M/SDal";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72F0606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 13:55:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D72F0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=s6M/SDal
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso1110302366b.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 05:55:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795614916; cv=none;
        d=google.com; s=arc-20260327;
        b=W2X8z2DO/ImMs4n0+e1fhaNIR1hqyJmwWtWEMilSqL2tj31p3kVjWcxfJ0wlChBgly
         sqgEmaBqal6V9ZBNLWtyY83PD8R0aIyMeY2BxtlbVTyJKT6QXPf+r1QkMSnOTIFa8/pA
         v+HhlgpCAUQxbr4rSUgUTB62/iSkLsx8LvxMIr1Xqxgw3mbZ5UL6B1X0myFQ1iiypEGN
         bOyls/GxMklc1MWhHLl2Sr+e2591t/EnHIBosbmsHk9OwCC4if8Ib5pmS2BDc3xM8hk+
         jQhSonZGf0Ws5cUNj/eObyDHCB79ntP2MoevIY3Av2GNaS7qLaDjKz1SQGDB7ECGnB0g
         tFIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FCuANSuXIYamXWDtNf7w7lG6eHXyutyXEO9DVfxIUGI=;
        fh=3hXagfkh6eT3x3RWQBgtbVzeba2VRwJcHHlYs7zk/tA=;
        b=oseSBESP3+17ysQP3yFEFkHafa4ovICaApaYuhqbOXMBMlk5clzVilo9GWXUEjTXcc
         nskTcDMgkrHVDK7jvFk6EeHBn/F5ZYrQJPurzcCjrhIKy9x0j0oXFfwGUwx/KutPgSIh
         Ra5VLHa3fMyHa/WNS4Lgq2QLIeWbylugzrqI8YroWGCejiX6GLjrODohAk/1/XX9X+bo
         9jT0M6nOjQI1EDPG7vzNQqZwOV8nZoicFrzJlHP8VX8OIkf1vH2IFR7ejpfed9IcgWlD
         OcRb9Uytx3GBQYEDoyJ4dwFeqU0aZBWTrwpyt0fT8WSA0J7dL0hQSMct/Lz9VLborvTR
         fg3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795614916; x=1796219716; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FCuANSuXIYamXWDtNf7w7lG6eHXyutyXEO9DVfxIUGI=;
        b=s6M/SDalISUI+jHyF1ygvsSJMXSzjcqCmvFuiNVEBqojZZqJk0awSxIA+xKTcFGZAg
         5PuEJlfkmW1iIPTOzc8HZx5zIx/PbL4NiHhDaxPQgE02vkGvH9r/JpOB7eMQDd8xb+Yy
         jKfzzwex9hReuI3uPx7ExJ7Akd3T9UGzK2V6LwBQwvQaC7Ybz8HjdVvTojvo096o5x6u
         I9kLHc8YxNpkEIXaNvShw7u90i/sMbVsdkfOXOeF3HfUe8Gp4ZcCJCmmzGvtqunMqrQs
         AWomcXaWWanscLtu8670AAkTPyfDJXcTOmKPn8shjYR28fEG29qlUU22w4QDNcHb3vRc
         Ddgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795614916; x=1796219716;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FCuANSuXIYamXWDtNf7w7lG6eHXyutyXEO9DVfxIUGI=;
        b=1pLjfxrTljODmY5NLUpHRnyx7loqEiDHUydmeRVby2cQGabxk+3D0A2YO+LzB574nP
         YIQD28cvPah/ls29RoWuL82q0ztKnmIt8Hg+E0mv7TGwu3uMwjdM/a5AjgdB7IOlq8Dh
         9rwfgonTr+lZKTxdMiJVm4ho6QGN602Ebca/sbAaZQMzgrsxHcWzUqjXnFTtVl5r7YUO
         g7XI7LbKKMT8SKJDbJWHo3YoInQnSZMEq3kGfidnl5/NOfLwtA1Wrv8zCdNFehQ5ueRm
         MZd0f8BaCHEB0unonR9kcNArEDlbRRooDxhsmz8XnEuiv2bm+mSQ1CmeGS0kX2dJCyxi
         5pNA==
X-Forwarded-Encrypted: i=1; AL+hErHTvBOh9xlYrbrRBTJdMNY471a/EtO9YZ8dbkSdb6eTLDvOZvmo0fvNRR+UJXQiV4F0Boey4WwhascJ@vger.kernel.org
X-Gm-Message-State: APuU4Z/1ipxEUOL/2pg1hlXW0w+oMybfqEtKm/Brydi2hZH4IuSeLUJ1
	FSDxYQaNkS/+62n2BYmCA9lZndQW7xrhLsQqDx8yuQ9UqThieN+Q4EnarQTy/iJGkhxUhrnpxCE
	v+XoLi9ue1R4bznR9kqjpYjaI+tIQT3EsI1OEDnp4tQ==
X-Gm-Gg: AZFdTZdRT4tmWQhZz0XDsgkbQQS0chGFWzZg0A+NCUwkmKRDwdEBC8Mmr5eaK74Yhvu
	F5Pl3bAevel+2hI+ZrQu7Mzxlor0i3oSsuMs22khhqe844TDSPyMOiWzUWA8mTXGxv6WgwA2R1c
	aPiMc1rcwIprXkPKPHB6FDrH0iFuHb1sOPd88K5rx2+U4hgiXJv4oTBGQuq19mwQ4ZNSNHO2xuo
	Z2j0O1UIROvZhMA15UA/kyK9IdzBCPRc/aCK9P6TWHpWXJG/xmrHNyw6MrYAG9f9dkJWSIAmjKr
	Abb0sk18vXwHPI4WLM6guoCI4gd17pt/dZWz/ujaEAqMtNkntHH5GZKu+lBfAK3B2S/rLoJcovr
	LOavTgQ/qmZxlaVhOVkpaUXRb8Xmt/i2WGmXlB8S9WrjPSQqtAn/mnA==
X-Received: by 2002:a17:907:6d26:b0:c51:50c9:741c with SMTP id
 a640c23a62f3a-c5150c98208mr1275142566b.10.1795614916108; Wed, 25 Nov 2026
 05:55:16 -0800 (PST)
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
 <20261124-rk3576-otp-cpuid-mac-v4-3-d403b8a25113@flipper.net> <0aH4P5VH9HNiTXpCUTaTlvGaoUDQBnvv-0cSXtipSDkLOGjzGy96jDqsVtU0DJTWrocgoMcGFEgd0JUlF5mljVvCzGKVz4yUgDQ0s6HaDLg=@protonmail.com>
In-Reply-To: <0aH4P5VH9HNiTXpCUTaTlvGaoUDQBnvv-0cSXtipSDkLOGjzGy96jDqsVtU0DJTWrocgoMcGFEgd0JUlF5mljVvCzGKVz4yUgDQ0s6HaDLg=@protonmail.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 25 Nov 2026 17:55:04 +0400
X-Gm-Features: Aa3M54pv9ze0w4z1urAY277TKJgQi-9HwT3ngn04WBh3FoiAC5gcBe50J9g0GsQ
Message-ID: <CAKTNdwFwuG9bWStnuttiXY0o_iqMX3Eu_0DhFtxXt09Bp3Dz4A@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] nvmem: rockchip-otp: Derive MAC addresses from the
 CPU ID
To: Ryan Leung <untilscour@protonmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, 
	Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ryan,

On Wed, Nov 25, 2026 at 5:49=E2=80=AFPM Ryan Leung <untilscour@protonmail.c=
om> wrote:
>
> Hi Alexey,
>
> On Tuesday, November 24th, 2026 at 8:04 PM, Alexey Charkov <alchark@flipp=
er.net> wrote:
>
> > Rockchip bootloaders derive stable Ethernet MAC addresses from the CPU
> > ID in the OTP memory and patch them into the device tree they pass on.
> > Kernels started any other way, e.g. straight from the SPL in Falcon
> > mode, end up with random addresses which change on every boot, even
> > though the CPU ID is just as readable from Linux.
> >
> > Implement the derivation for cells marked as "rockchip,cpuid", handing
> > the result to consumers which ask for the cell as "mac-address", such a=
s
> > of_get_mac_address(). Leave the CPU ID unchanged for any other reader,
> > so that the same cell keeps serving the ID itself.
[...]
>
> Perhaps "rockchip,cpuid" could include a mention of "mac" somewhere?

I deliberately avoided that because, at the hardware level, the OTP
cell contains a CPUID, not an address. The special treatment applies
only when the CPUID is used for MAC address derivation - which IMO is
better captured in the binding description. Let's see what the
maintainers have to say though.

> Tested-by: Ryan Leung <untilscour@protonmail.com> # RK3528 NanoPi R28S
>
> I tested on FriendlyELEC NanoPi R28S (RK3528) with index of 100 and the M=
AC address was exactly as expected.

Thanks a lot for testing!

Best regards,
Alexey
