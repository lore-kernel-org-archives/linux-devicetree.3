Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795199317;
	b=P2CDeq10FFsyEDLa1kEVFmBQXv0akXrqLd6w/FODVUr9tvYUQyX+qsbEAWh+Cl/47jDV
	 ElwE+xX+tlRbKDVsftxvaEQk8BsX5UG4ZHrLQ2dxEWWnNhMZ981U/VtWQh2DxRNtedaGB
	 4umjmyWLEEG3KW18Up0LsIhvF1PmhGVWALPKC/B4GpJvhxr1QIgbwtKtaj4o1E13MUz/J
	 rLHzqyATUFgCz196snEjPrQUT0bz9UQ+mVYggnlfWcrDLiMTGhX+W1qiZXGTfJF84yfLy
	 RebpCi8U+vJrwHpx+yTK22fW+zFyel0mkb/sK53ju9shdqannO8McA1Xa/cdA8IFu2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zNDQo+a14v9s0HW9OP+czAcmraAhXwLLM732JTo+ZL8=;
	b=AzLtIdREeN48WjDwnYhwHwbYxoH4hagpvr7IR8qo5AQiEk+KS3BeTeuYQqFavT8kYlyw
	 4aMW2bR76bTN0KV58WgHF8DgtUCetdgMmPepehl3wDO70nJowAbiu2Kd8WbttF6hinYtW
	 vXox0Dcp2UIr0rFbJkEHJtagC/iVFqhubPeipXE72pvoovn7GSMy750Rby06gajgcLxbV
	 yyoLBVRW+8tghgefEhypSvPk1QfHDwsAQuzfAw7BJ77RUBquJylY7l3C30n/YPgfCMH7l
	 B60zZ14g8b528kmTfm0mNms9lPac2xn5JeuuNuEO6AezZH14G16EnwplNYlIMFsChwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SKP+VL7U;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC5B606A330
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 18:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CC5B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SKP+VL7U
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-49a92144733so654299f8f.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:28:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795199314; cv=none;
        d=google.com; s=arc-20260327;
        b=q8qv/3fZ31klhcDHFtnaFtwqlUDxR//xF80Oa9T5k1iqnnQ0H4oLJkxRN3+ApEvrom
         9qGAkgOBUNHVwAjkbIlAM7a67wDDIoOaz9N0voIq61md22OJijbNY5ftIKjTsHN/87Uw
         aguQ27akSo1C/Ug6Pf5SlVieqRZMRuhKT9SUkxJGn07DUkPyC0HQ8d2EVQbyLAkGJjQR
         aBocgQ1SOdAjIZPklANmu9b28wRtZFkrnEVupqsofQ+SNYG67VWiowJpyZkV3nVPY+Jw
         JniiTaW7QAWXXfT8bKnGTr+1ny2X9FWwxcp5JWkTS+h74nWGg9E3mhPDVMmsWO4XN2OK
         N2HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zNDQo+a14v9s0HW9OP+czAcmraAhXwLLM732JTo+ZL8=;
        fh=2LRp6uLgHxl07UaeYA0ZAGdV1RnNY0326MiCfLpzxIw=;
        b=m2/YXj6st3xdG46Q2BSHzS9Vh+i83AzemIMtYJ1gPijuIT4RoQGufwqMjWFOXxPzms
         1Vsfwv+b70XTTuxDzd3IHZBnXWKszqTffOJkgZE20Tjdg/EU1LlQtQGpIiOxHUW3mf8L
         LJxDQ/zSas6Nprvp3bchnDcJ/LS4dh2bI0J59BUzwlfVbSTVyUGEmNBNumMxUG/Y1flI
         CHM5MWevkWaMS60U0jQllHDh9jskx/3RwgxIv4d/AcJ37EU5T7lvnWKEgOYLSRusL9yS
         gnpGcFvDuTqA2KaJRjazuQQJzWIkQPY6qL7NFewdvn2bPajQNLXPLbTFepiHQnMLZ66B
         +tUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795199314; x=1795804114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zNDQo+a14v9s0HW9OP+czAcmraAhXwLLM732JTo+ZL8=;
        b=SKP+VL7USEbVWLzyNKe8vqlVzzCV9Yk8mcaoFQiMau8f8rXDzwpCak4Vsmv6BR/+pr
         RgylvG9oK1tyn9HVNxsfbZVUNKkIchTWZ9X8kJuoyh1kq64J4Ht2rzEa0T1VyHr22jgY
         8LCDGRU15JxcXqPu3SUUV5SgqRuHz+Z1iEokPyTEcAcId1PaGovoxia4Ty6h+zvaD7I3
         4y2tVCh/h1q718vD/ixJINcglatHqod8P/u+jn7b0Kg91rBesPqOPLmb7sdtO2eGD3hu
         BDKWUbOZHypesxxEv5PhgymmUWQHQko31GpAGU6sziXf/1R5N8yEfF6gUFxCmLJXMEQq
         BKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199314; x=1795804114;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zNDQo+a14v9s0HW9OP+czAcmraAhXwLLM732JTo+ZL8=;
        b=Ib8KrQjx5M1qtiVGzeJn5erjRB2nJEEf2huuvTenhrKNZ5RpLYVS6BvfCCBffHoFvQ
         EgAqSLRAlF/9Pq6CapSdsuz20P2G6ZoXwSlc1DykFXdlosb2ixEYkeb8HQr3hSki5HT6
         e5p1tyzBiRRPHeQf5qrPFfU1cgDWZZUoMSurjOW6HaXdoAejWnD6wc918jZvKtSWq30u
         CjIacZ2dm6UZWW/SqxQ72EG8sXpxxbCREwCS52zCfQFj0XfQ1TFsyi2BPpNqVbwj0nQz
         LXSsFQJ3aB33O90XZTQhIM/5zeGIzlousAnHbEfLH4assdaS8S3YJneLdHtGXJz+IQpb
         IoEg==
X-Forwarded-Encrypted: i=1; AL+hErHcg+RROgjaNr/gUHP9g5FTdRK+YkU8QKCNjswVw3lG28+GAwpXytH1aN9Dc0ARcpsMOOaSY2zfDnQb@vger.kernel.org
X-Gm-Message-State: APuU4Z95VzMu1ABLcHJqE7tp5xKNEWrKMSf9VRZtRWjW9T7mYGUYZ3MW
	qDGc2/lu6qPzhFS+Vk8kTlap8NLY/J4e97oPLsRBT+eYX7aNldiLeKmNeBGUW7ibTqcTbM1hwKK
	WqsTYjZFMIbMiwHL+P7roVII4gCMxDG0=
X-Gm-Gg: AZFdTZe4/MeNyYJfAE23jds7Rwt4/wfrBvt1HOArmNCBdS6vyJo0BPJj2VM7R+Ms3qT
	BnCwYaBf6awgktucl8fUjgiMGefqMP8aEYsu5hZTpRClEav90NaehZxz2BCbJsKQeH7sXHaP978
	5vRPIITk7xJd1etSBTZ3JrqZDNW/ykmsWhsyuDQVcu/Ih6ZMzNvesT7xcuAYyT9gHF5xyEgQltL
	awJM4WSOGVKgvnfASTIFdXk2PjpdW27KXfmfdu7uwxvmWlQ/XR935ZQ7DObcl6nPPPf2lmKBuQD
	LtSp5lv0lHtLhTfMtH4FGNKZ/GcMcEW53F2lqre+LipoQPfOizoovKFLge9mnBAzg7oLP9JJjwM
	LtA4Nq0e9hsXR08pv7uYmqO7GXRlmE1cQlQ87aLbtQbuebaS4dYZPFOzqhM9HxfnguItUCJ6btJ
	iqJh/0vBH9kNjkjEOF6Noyz1VPj5yxYAZhNQN1cdDsrbWvWeGRDFn77yT8yA==
X-Received: by 2002:a05:6000:2f81:b0:4aa:ba0f:c1a with SMTP id
 ffacd0b85a97d-4abb683bca6mr8274343f8f.40.1795199314113; Fri, 20 Nov 2026
 10:28:34 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261120002549.1908299-10-prabhakar.mahadev-lad.rj@bp.renesas.com> <d4405a68-5df9-4e76-84ff-fa034f162429@lunn.ch>
In-Reply-To: <d4405a68-5df9-4e76-84ff-fa034f162429@lunn.ch>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 20 Nov 2026 18:28:07 +0000
X-Gm-Features: Aa3M54otSF2In6FsOUyV1sYkafqWIOL4jrRT5kqPhS7eswmhjTdncZ_k_zb5leE
Message-ID: <CA+V-a8vj4nCZ+u_HnzNxKXu8xuOR115gHDF7YACFfiDpskQsjQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5 09/24] net: dsa: rzn1-a5psw: Fix
 VLANTransmitted counter offset
To: Andrew Lunn <andrew@lunn.ch>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@linux.dev>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Simon Horman <horms@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Ralph Siemsen <ralph.siemsen@linaro.org>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Thank you for the review.

On Fri, Nov 20, 2026 at 3:29=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Fri, Nov 20, 2026 at 12:25:19AM +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The RZ/N1 hardware manual places the VLANTransmittedOK counter at
> > offset 0x8f4, not 0x8ec. Correct the register offset so the driver
> > reads the counter from the right location.
> >
> > Fixes: c7243fd4a62f ("net: dsa: rzn1-a5psw: add statistics support")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> This again seems like a real fix, so should be for net.
>
Ok, I will re-submit it for net (and for all other fixes patches in the ser=
ies).

Cheers,
Prabhakar

> Submitting these to net will also help with your patch count.
>
>            Andrew
