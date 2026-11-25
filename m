Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618373;
	b=MiMy16RyRCZnQneuNnCqWd3+I/xLC1RcE9gDhY+w9HFcQrE3fOzNqZrQ1SC6147VKNBa
	 ycHpbvbXvs2Vh7V6KkKqppNnxEgz0KCuhN4sXoKLIEwIfi+TyRJ3x+jXSr/INSyVeVnrJ
	 NMCn9PXMd4bMZAh+N4APdUthbpcP/1IkpT5TJgZ4WpJ0UH5F4e8C5XE2vBsyst+tn+S3U
	 Ra13hbgHazta9P0ZFVjQtMamZ9b3mnWtcWOquDapwE29lVuRDG6TC3g+fkPAckzVB75Lr
	 Tdv/DUKaBU7cnWg0Az/wb3uVD5ET6/INQSidtzOVSNaErflyawZwnU8Lf2xN8MMocTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618373;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hlkk4xXsXyEvb1D9H1K80LoXoGwa5zP1sGDEDxlcUog=;
	b=q4o+W/ZQeAz8rCJB6MZa0dejbVV0cVmhBmKIIJE7m7npkYQ5EmF7mRRfFPJM6G1660ZZ
	 jquXBbBqcI+9uDEczVL7r1ZFKvqw8lKe6UpK3JD8eZQ5Lc4VZwedOtchx+lUg+b3bnlHr
	 yeZ28OMUMPA09V7Lu2bX1BbZAxNJ4W2xUZRt8bqKce+3TesB5ioY11mTgZixAjnNTPXR5
	 ADP5G7+S88BJUP2slG7+Mb3Umkd46UKp0xQxrCRaoxQUg8rUoJC5H88Zss18HzOQYPjoM
	 1dTN1k9thnq+Zl6HWr/8SH1zrh8hz7jV0f99eJH/95hJnrxuHG3DfWJLQmSNcP1m4ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3515D606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 14:52:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3515D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b0dba37a7fso47407657b3.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 06:52:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618372; x=1796223172;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hlkk4xXsXyEvb1D9H1K80LoXoGwa5zP1sGDEDxlcUog=;
        b=uqwdHcVeuxFOzQDkde3yF1xzN5hv5yMvXt5cwRi2F3eHYFiK+zL1UY0KXFZoJaUhGE
         oPym4mYNzHzMwYucqXBuZrpSlbx0Dr09Xc6u9CilhUDU8T1XZ3CRG0QXck2W7hgSZKm/
         it9t4lGvu4xeFjihF6u3mwX5dkTBacOiYOmcJfSNtth607oegQfaNbfhNG/QJRrWcfI7
         g1FM+bOb8IxW+rI//1hJh10vYCShwaX+1jE4UE0mrtak97SCZnCyOBu/bviPVLBNvM94
         SaE5kuXD+eWT72zYCGl3XmslEz4ZddFG3+nT54j/wyynOMCwZiRsitBemnulqPB4tcTt
         tEbQ==
X-Forwarded-Encrypted: i=1; AL+hErFbccWXes0TetcLCU1Q87ZoWeHeepwRToy3X+AuDgm+1/X+lJgLFCHumU4qxi6LlyS8Ab1iogOkg3be@vger.kernel.org
X-Gm-Message-State: APuU4Z8QwBKjs711+DKQOL4q387+e39HUzDXATTLifpbXJ9/DYeEoe1P
	UStrvr2Wopo0BQrp0iGWBlSjTxSu2nlivH/Uf6D07l1jjzX8YCLyZ1QltwgVqWOX
X-Gm-Gg: AZFdTZfgH4MX8PyZ9ZYnBFEKpHrP44WwFBPfG9dzfMjj1HyR5+eJtfLLIhB6C5ruGMl
	UWkjaJw+Xzac5JzoeEZCRexz0PPjsEsY1j6KRu8eRtY5+RU8M+YUCYP8j9A0htIiORoNkBq9qpK
	W8Q8E4MbeKX0yA0Q/tEQw7VEBsXArVLlJ0VK8CqqO4hPvHqpWu0SZHHMRTFXFC8AFskzyr4AnI0
	OfiFpwR36+bqhxbRXblHMoJOagPpy8c6e3Jr/w7giWHknaeZjccDMEDflqvINst1kuQwGKK6+tC
	mCgaQcNwN0gmPgu6rNb8UkHyFyk5ENfnOTIrP8rIUOiGpSYdNr1SgyczUWWfy6I7dhV39gP39e0
	VNEjXofZbb5PRZhL1XGfJoKMCwGXrGtWXFFFyPubffg3DKCPuGqu3c548KmAwXJkeYXJd3Y9te6
	kCFNAK1/NkHh4Rvseu/MiC9yUDgmuvNNfociNgwcekU2Lb7BJ13N8wkXMT+nJbapuMfQBbHY0rU
	bRyN68OBEix6q4moR+p7Sk/V8XfMyPZVUaH4l+YVAvC7LSLxJd/8fZM//0PzheqFTbi7Z3Jwy/r
	DOEBAi3FZuJqmMRVBwztccNbwNnVON3cpoG7OGOpYeE5590AH0affHw7Y+eiP1+V8eATD2Y=
X-Received: by 2002:a05:690c:e258:20b0:8b5:6379:ea88 with SMTP id 00721157ae682-8b56379ecd8mr11884087b3.41.1795618372076;
        Wed, 25 Nov 2026 06:52:52 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52030ff10sm71191147b3.33.2026.11.25.06.52.51
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 06:52:52 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5ee1e4e3abcso2171483e0c.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 06:52:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGc5lijcjUcGubG5Jm4aO0DnwiMDBoDHMdasX5zzMpJut9xyaBu9XQfg4sxHLG2HFaSxAnThNQu2gmg@vger.kernel.org
X-Received: by 2002:a05:6122:1784:b0:5dc:d0cb:7d74 with SMTP id
 71dfb90a1353d-5ee8adf3de4mr9944668e0c.2.1795618371669; Wed, 25 Nov 2026
 06:52:51 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795029012.git.geert+renesas@glider.be> <1e9c5ac3-d82b-4af9-9946-0302cadf7404@baylibre.com>
 <20261119234759.GB2324725@killaraus.ideasonboard.com> <19c3745a-6308-46ff-bb37-3acc88fe22e2@baylibre.com>
 <awAqqg6F2Z1t55x2@ninjato> <d94ad9ca-afdd-4301-a69c-0bbad5b334fa@baylibre.com>
In-Reply-To: <d94ad9ca-afdd-4301-a69c-0bbad5b334fa@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Nov 2026 15:52:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX71k95powpC9qNiKdN=wRCYyYbvOT=EYmExE_2W8u3GQ@mail.gmail.com>
X-Gm-Features: Aa3M54re5ZNPOW-XITDy6yDteWVZ0ZL2EVGMi9yHMlXJRb9PY-Nvu_jZHjCd6J4
Message-ID: <CAMuHMdX71k95powpC9qNiKdN=wRCYyYbvOT=EYmExE_2W8u3GQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] R-Car X5H Ironhide CPG/MDLC SCMI remapping support
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Paul Elder <paul.elder+renesas@ideasonboard.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cl=C3=A9ment,

On Fri, 20 Nov 2026 at 15:33, Cl=C3=A9ment Le Goffic <clegoffic@baylibre.co=
m> wrote:
> On 11/20/26 12:10 PM, Wolfram Sang wrote:
> > Yes, this means the driver is then tied to a specific firmware version
> > because it only has this mapping. Not nice for a user. But we didn't se=
e
> > another way moving things forward for now.
>
> I think the DT is that other way.
> With the SCMI ids in DT, only the DT is tied to a firmware version, not t=
he drivers.

This only focuses on the IDs, not on different abstractions offered by
SCMI.

The latter leads to the need for changes in (many) DT bindings and
drivers, to support the same hardware blocks that are already supported
without SCMI in the same and/or older SoCs.  How many different DT
binding variants, with corresponding more complex handling in drivers,
are you willing to support for the same hardware block?
The remapping driver takes care of this in a single place, avoiding DT
binding and driver changes all over the tree.

> If a release that changes ids is already out, it needs a new DT, or a qui=
rk for that one release when the DT cannot be updated.
>
> The hardware stays described

SCMI IDs are not hardware description.

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
