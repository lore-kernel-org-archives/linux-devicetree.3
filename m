Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795185841;
	b=EFQrc0kl9OQqVdzflQvh22s+TS9mXjJL54UarzsVTm38pTpsYcwBpfH6ltkJ7RT3ytaU
	 v1ecCb78L2ulRnU5rFI7azLX2ge8K4ran9DRyeoo1a/LFyAg4L5L2LGHsIx9iL/ZJcf1b
	 /hcxL6yLnDz/Llg3YOWZnMdk6wW9y0g+2q8ic8aO8Ckz5xl3RkGuEzHbGnb6d492mjBf8
	 Kh/bPGIpjDYkE/bRHIPNtlnHf2fKaGTHFVWuFuD9X9xycf7LvPx64vXNPKP+LlZ/Cj+fx
	 2uK5L0e7IgBVxmPHPPq/J1kT6VAqVOWE6RYBAd0EjEdQkgeCfuOxA0HQIInbB5ppQwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3IX7N1kFKFZuWON6FMO3tvSVP9QWmOoz3uHAxAV0zQc=;
	b=PAjW6CtkdxmbVcb10gqaFQ8g9NyVha8px0XXykNh9aXR7xmuW45O5LM4N08uioYk+DUF
	 6AMh/oXWrUv1FRxkq0kpq6vNx3em/LXP8e7guctIxXop7T5K9P/yXRqn/jocjf68gz7sl
	 D82vbQwAaEbS72qQUl2t3aNEfZprMZyUMCOsxyyoDEFAQ/tN+LX4xiyJ3WqLfaf/oaQpK
	 kxg3L98LTdOaBu5dAqcEoKhJX27tKXNEZKrewtQ5z1F2mNegaeTkH5fj2PS1nuHTSctET
	 CqHXwb3mP/uqNTRkrtPGcVNt/MGLMLrIbiDV32qrk/HCsAxBMllgYfGkZtkynmnJ6/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QYQ5tBef;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5F3606A326
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 14:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E5F3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QYQ5tBef
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so9745045e9.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 06:44:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795185840; cv=none;
        d=google.com; s=arc-20260327;
        b=JwANgQK+10Gu714TBdNluLgazHGErsp4clGk9kU9My53gty2gd78Bh1SHFuLaHfSyG
         Mi4DjRqi5n0eIo8fz6Pvy/lXy3g2DiGQ6amsD74uJthYwtmfl7Qui8K3hdFEAkDoLIZx
         uNtorPRj0QIGf1SDmLRIBtZSHfkwd4AoCh8fZLsD6yf1GuYST2DVvh+hLO3vX/DJGeLp
         embxDl4GWOcvr+1LAU470SrqZkN1KtqAzIkKfLaS2+YASCeoNkhwyN7gX25xQb/Wxs5p
         cyE299/p/zgc0xglsNyzgIqb9e3KsthZ+dDyXrgCtms3sZ0ONN3FcBWBMOIiGVnmvRoA
         jeYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3IX7N1kFKFZuWON6FMO3tvSVP9QWmOoz3uHAxAV0zQc=;
        fh=zNicx7NlR6ky+2cZv8lZATrSkzAcruNph0TBNg38pkU=;
        b=YDyKkQMLS169AGo/u/O9GQDXnUQyh7n1zIY8jy0ieSL3S4PhvZytnHxaltvw3wYCdA
         NlqskOhb7wJTC0WKA4C4LeN2zFVBYPGyJxtGcTfaqIhPs4qZ1xOsqv4QX9R1+en2jBHK
         0C3gn5EXKZI79GZaYVjsvhxzfQFdaEZqAXbEvPrKRQZg3zvSxE5fMB0rE8iJFID1S16U
         jw9a044kv9/jTu5DfofI0D8GS9y8r9Byy+4ezOyLHkc1eFMjwb0M+1ZbxI06+KUTGelD
         4ArvjuhB1dgmXjCxxYK7B3fgF22Uo8A+SRtoNs0nr47qYrIt1+vnv5d7CtwE1nztByon
         iWeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795185840; x=1795790640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3IX7N1kFKFZuWON6FMO3tvSVP9QWmOoz3uHAxAV0zQc=;
        b=QYQ5tBefbybLAahWX1T5jVNJjZMBPRgTJcbKw9SACiCbwwSstGz9QZ6ob5fsto/bXE
         +VmKIKxLJ/kCzeAH+ZPIBRboifpiXTNqwlsZ1wHrk/YUtr8sINXI8KJ6H09oUVftbhTn
         3kCHtT+5pz1P92H0uCuSAWGowRv4dYGficTGkvLioFE7xDeWNMAL1pveel1tNwqpB3hG
         3PZ83BtYlHO4v3/+OKTiFFPAwQTZt9IqSUQ4gslXE37h2Ua9/EcuyE2thspfPFV05n4v
         CXKA37NNEfw09vb/vw8SVg3kWl1qpPvnNrZA3m183s6nJWG6iPrIwCbkHM3cH0MtpDs3
         abLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795185840; x=1795790640;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3IX7N1kFKFZuWON6FMO3tvSVP9QWmOoz3uHAxAV0zQc=;
        b=Qjg7vnkiVpOAZ1el2ZWh3muAraLlDqPXnW5ZlHhM2mkLhXaZ9SnIk0w9MY1wLYZLjn
         9xAQ4DDflYiEIMveQQSos752u6rtQuB51hD+gZz5pTboINSVyr1ktKTo5+znHH0QDvGh
         xRzvLy5kLVUb6mGWWgYDOkq5lWhqkxb6jURL/+gcLrJEi35y5fPt5xZGsEdnzW9uxI1e
         SaIyBj4r29IGsbfNO2QhAl8I/idkNKeAQC5Dvnyb/NtN+6fzVsFyQcOV44F7Axr2OJ+o
         ctmHrCXbMQfXJRW4jzt98pcnhI+s4CqqrcPR05FuWh5EXJRFBESD4vGfl85j5AcqQoao
         01Ig==
X-Forwarded-Encrypted: i=1; AL+hErHuCnM42nbhiw77V3Ck6GPGFyQxJBahnyqn0qfb05ZO0bur3H13oSQcDZ5RVn4h9Z9T2iZDZNkHHrQs@vger.kernel.org
X-Gm-Message-State: APuU4Z8KQtRUq3V+MOKbosy6vJdugeZCErv4qi/0VyV7m0huvkppGZYj
	Dpx2Aevhaq7qY7tPu+r45DqiJGLOMW5I6kEmVEDWx4MSDdATym6GqgLggjK7yD76N3JLJ/nEWnc
	0fjyNTE5oLvD5LhD5xH+kIq8NxD0l3v4=
X-Gm-Gg: AYBFou0r/5BQwU5Go8jtxW+Omqx1hcVMbjHwaJ16EfIsYbkhczCSFe3eS2tMEHKVGbP
	zNQWEjqyBjzHNJaiBPhLmcakgd/tq2bpB85rCVTWGyMNsFUzjUNRuh9I5KWztTGrk2LEIp9wuxz
	F5ribP57lI/qjlmNK0n+zxNxzERMeQKDjrvcdgV/81kDIo3M3/FUXm0j2kRWVJ5FLgoh9VVP5xx
	qSriYa+zTizH5hzb6/r62JkgAY0KrdSTAeZyw9nvvZTz3BBY1wkv8dV4y0mN/ZysikVIXbhWZlu
	kLqxzxBMj8PEUFw67osIlzr8erjKwqNrJFkhZjB+afLf8FyYUMX7YpXtsP8FLYV9Lf9Oju2PJFw
	BPugvJjKeOoyeQOOembN0xpjIM9nj39YxmwbF3/yq9sgnYiz8w5BkbnCV3H8LykIFlGCUfBzNzY
	XdvOMgCt/ivA9ja+rFBfkQZJAk0h7IApWGylRW5z2b4raNS0alEe58pRPQe2334/FGqgfQDcDDr
	MlVqSvpYUlYki6dmKNp
X-Received: by 2002:a05:600c:a088:b0:4bb:6473:cde9 with SMTP id
 5b1f17b1804b1-4bb8880f2d8mr64314205e9.6.1795185839556; Fri, 20 Nov 2026
 06:43:59 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <179513453453.3291.8493509332739817258@kernel.org>
In-Reply-To: <179513453453.3291.8493509332739817258@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 20 Nov 2026 14:43:32 +0000
X-Gm-Features: Aa3M54p4ZaVOj21rOraLFop2-l4thT3tsd33lr6hbx18b-7slzJ7KmqEF1KOtNk
Message-ID: <CA+V-a8vCCZy6TSDt8aSDA74GxbdFBP11DCmKB7+T_6+TU08mhA@mail.gmail.com>
Subject: Re: [PATCH net-next v5 00/24] Add ETHSW support for Renesas RZ/T2H
 and RZ/N2H SoCs
To: netdev-bot+sinfo@kernel.org
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@linux.dev>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Simon Horman <horms@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Ralph Siemsen <ralph.siemsen@linaro.org>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 20, 2026 at 12:28=E2=80=AFAM <netdev-bot+sinfo@kernel.org> wrot=
e:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.
>
The issues were found while manually comparing the hardware manuals
for RZ/N1 and RZ/T2H SoCs.

Cheers,
Prabhakar

> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
