Received: from mail-oo2-f36.google.com (mail-oo2-f36.google.com [74.125.231.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F461BD9D0
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 16:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790612478; cv=none; b=HqDSzBU7wWOjQjH6arbv23aELxflxNjRP6h2BpOdjbe9e30kBDZFP4aCM5UjBc7CBiaueqsblDVx/BBvM6DSg+GZlI2w7suwQaWLf0CNQcji/1B8X+N5xyuP5sVOM59b3Y+8ulqsMaYnMKsVIT5jD2klJyX40B84NuIbVuWFXiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790612478; c=relaxed/simple;
	bh=LmuWqcMyTwMuJpgDZBWpwTFm9kIaObVYzEuR7y9gTcE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mm8KtTml6WqC5h4StrRwqEKXhfOgVDlS+hqFBBXgwAHOvHEKUWvOfEhFPrUA00ycEZs2MH7pl9uq6z558WMFhcTKR8VIDO1hDzm3fp2CRc18DsaWzQ8rBVVSiYNGUm5X7/InjLTLoneBL/vIEJE1QeR7W/4GLlDNATNGD1gWp9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.231.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo2-f36.google.com with SMTP id 006d021491bc7-6d7530420abso1275057eaf.2
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 09:21:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790612475; x=1791217275;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kDbgXPFrnW3qUuObWck9tBFMLu1xDmnvb5Ge11TXK24=;
        b=CibgkzR4x4YLyW5ai+G8x/r/piwYMMx+aRLm60NjpRl12KpwcWsTEN1rEumH8oRmON
         uj9HoJ8FFMx2MQjvrYEb+w+E73HToIJF4VSG+nO4y6AhMbYOugGEMCu5c+MqHD4pma/x
         yFwsCEDQka+vGwzfVSJtX+1EL/u7X2ccWJuArLEpiAmIO3OLIcgZ0bD6rGSlLY110JG9
         Ee62+ZcT/Aj17MbLkjPNY1dnz3MiN4VpSMrSxG9ICe01x7IuxCp3VdDQdMWmfzO5dpI0
         IsxcdKqDRNkJTCkL9gPZ70lpnT0pEjqYycvQwIQKHS5vc4ShzmmFd4JJAJzyM69nt/gj
         SsBA==
X-Forwarded-Encrypted: i=1; AKwUvBzcSzlEtFg6yTQQIoj2XEY2l64MAufYCTwdLR2c9JkRrhQpILry2l1kCTLpiqkgb1OsfwdpDPDdkO6i@vger.kernel.org
X-Gm-Message-State: AFuF++nm7kr+PLMed+DBt9yQo+d/zHp8FvPcnlCraFJghGPJtmxdoXFw
	XhrNv0LsMlCRuBXYTWqCA+xlQTbsc+o+hd/sEuqkiVxuwxxlEPJHu2ELLJaEOaEa78A=
X-Gm-Gg: AYBFou1ss/2s1+BfNYoyYbSww7XVNUCxAAO+qCdythKtao07bGZyNm4JVcz/v/7DPqW
	HFRfxg4VSGoTI0/dkMNM2ce+yH/6spq7N05h7QkI4NzmVCF3ojHzpojy3uGvnRUmaOMqOy+IItv
	KchwsxofiVRIldRNocZVJOQxnwJp3Vfn2a8RBGHOmmdVPKSbxHAL6SDaZUhj5fUds7UJdBFRvFB
	J17foFRYEWMfW42Urrk1DVvj5mffBH/YJmE+DDj+vbeNvhv88FuaLhNc95zhPRn3boLmrpPAM3/
	LETSCoyrdWyOahWzNHuDXUJ67GUjtC3dTdaFbVoj2l8oIZJFV0i7gz10dASHIRpP2eqP4z/AlCM
	rSNqh8YNpn5mkqIjX0PQtxdqLS4lFmXUDEaL0scAJw8cOF8da5BZlFbldc15d+j9mIW03B8QdRV
	uwfYziGqhamFFp/nvfM6fMNF2AAaxSR4SxQIYdpSVL7bBjxkUowcyW+OvtE7WDyWLY4c5AimStw
	q7FXZtAEMhnyuhiv3oj7jNtr5Zyty2mRnkT
X-Received: by 2002:a05:6820:2007:b0:6bd:bf80:9796 with SMTP id 006d021491bc7-6d43ff69a13mr11417084eaf.41.1790612475519;
        Mon, 28 Sep 2026 09:21:15 -0700 (PDT)
Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com. [74.125.231.76])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49347da3079sm9589781fac.14.2026.09.28.09.21.14
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 09:21:15 -0700 (PDT)
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-483c65c2fa7so1850277fac.1
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 09:21:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxDHSpZ7V9bv/x3mhvNapZRKmRYPPv3byliZ7+DOMkhnJQMgLPrZO9GMrkc+60Mdx/1EfuCVe6HqJUd@vger.kernel.org
X-Received: by 2002:a05:6102:36d4:b0:7b1:6028:5475 with SMTP id
 ada2fe7eead31-7b1602862b3mr1908825137.12.1790612054596; Mon, 28 Sep 2026
 09:14:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-rzg2-sr-boards-v9-0-5901e0fc9e44@solid-run.com> <20260928-rzg2-sr-boards-v9-4-5901e0fc9e44@solid-run.com>
In-Reply-To: <20260928-rzg2-sr-boards-v9-4-5901e0fc9e44@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 18:14:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUC2yTTnciUg0RU7N2JCRT+fLeHf6dx0bWGfhfAytrz7w@mail.gmail.com>
X-Gm-Features: AclHuK_AjFWmrE4_ymPqY0VlrZBpkft59awZIm-1fGOKVExdklYpAhT9I-Cw7Wk
Message-ID: <CAMuHMdUC2yTTnciUg0RU7N2JCRT+fLeHf6dx0bWGfhfAytrz7w@mail.gmail.com>
Subject: Re: [PATCH v9 04/11] arm64: dts: renesas: add support for solidrun
 rzg2l som and hb-iiot evb
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Sept 2026 at 16:40, Josua Mayer <josua@solid-run.com> wrote:
> Add support for the SolidRun RZ/G2L SoM [1] on HummingBoard IIoT [2].
>
> The SoM features:
> - 2x 1Gbps Ethernet with PHY
> - eMMC
> - 1/2GB DDR
> - WiFi + Bluetooth
> - SDHI Mux switching between eMMC and Carrier Board
>
> The HummingBoard IIoT features:
> - 3x USB-2.0 Type A connector
> - 2x 1Gbps RJ45 Ethernet
> - USB Type-C Console Port
> - microSD connector
> - RTC with backup battery
> - RGB Status LED
> - 1x M.2 B-Key connector with USB-2.0 + SIM card holder
> - 1x DSI Display Connector
> - GPIO header
> - 2x RS232/RS485 ports (configurable)
> - 2x CAN
>
> Descriptions for eMMC, microSD and RS485 are provided as overlays due to
> their dependency on configurable mux states.
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
