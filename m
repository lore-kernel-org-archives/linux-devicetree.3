Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4E5426D36
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 13:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775050064; cv=pass; b=U85z5sFiCeNcoswAt64JbkKaC+6XyrIkcccjHZ2P9e0eV8ykYPapbO/fJi61A9PziQb/cSTk9QLGUjJcewvpQHYnAYStMc30q7oH3dnwOGfUQKpEGfDfbCwe9KI+C4JAeIiZyZBFUmfeUsRsoLGitGed0ikn+iuU35taAbHAgZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775050064; c=relaxed/simple;
	bh=isSb/mS3MIvcz8OzHn81VNnCHePs45Imq+LyfSuUlWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HkZKL2r7kso/y6qYaoBorY2kbd56iVCVDSI0/KQh8R2ATaBcKGVPNznP7CnlKzHAGyjnUc+VCTXOkZG4zlNOkqwcMd9iGeWobIdPQz2KsScdcti6M/eKLBG0uJfurfG4V4W4gR127I6P/jM2ngweV28qeHsSF6dU/ZrY+VCq+Tg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ausil.us; spf=pass smtp.mailfrom=gilmore.net.au; dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b=b6SJAzCI; arc=pass smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ausil.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gilmore.net.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b="b6SJAzCI"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8a4b8c3a30bso6626926d6.3
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 06:27:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775050062; cv=none;
        d=google.com; s=arc-20240605;
        b=KsyexF0zcoQPNHpR2cGB30iTaX79MbNQxBQl0hCdY2sXq1SXf5cNk0mlc5pcPrefRd
         4S5gshf64p0FtIZg5UIwhtt6/+vv7/fYGxsXDzf5LamAXQ0dG2Q5d5VrJBFy9eBn5/C2
         db+aOZUpk+aijwS9rjoh1Nc1WBm9CiaX5E+T4y8PiD1TcQkBy/sNOEwI7vobys9+ANR/
         KryDQVwN9p/KDp0QVU+wwCrQ1CsVemCZmxaPVXPgyl1ul+/m1v4fJZxMsx+vhCKsJrnW
         +sJqHOQNYTOJDDPHr/444NW12ErT7ZMLjuRoYvGi5mo1ABi5zl47ecAIPxCDS6kzNLn6
         G8qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WcIm7yXA7KDT7CpVTwgIEnk1FCyvBlEw6vFDxeCbDSc=;
        fh=e4k68TRwVEQHtOV6d31qhqVCAPvMeWkrVxUq4eAnFhk=;
        b=jKXzaHiqt/ot4LOxLG149F547FsakkVYeQBXlHmbPLzf8Sj0wDYUyEfom5ac9nlver
         OXS5nH3YGacj1w8wEkEzJz2yWTrYf1SjFcT2qudAA1GMTyVybytQEGk9nowMcVm3tIVB
         sp/aV/kHwfOYuJMQcs6lN2XVfAMONzFxr5CTXoQv0rnQ7w2MkwV3qQCh/p1ryL3M48N2
         jfvs7QUafxr3ADW2bOijmQTfO0pORYKRQo2S1J7UAZDLvg6ImGr+3cfAt6WN2XCW1dDw
         OHp1OEvDMRM3d9obT1l3xorZKC/LxyzexDr3kBQXIfc2qrnnn9kzJsKbMFpYG6nmamQ6
         Fyhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1775050062; x=1775654862; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WcIm7yXA7KDT7CpVTwgIEnk1FCyvBlEw6vFDxeCbDSc=;
        b=b6SJAzCIrH3cPBIElw1L2FzsT+swzjI7DKt+XMimskXuJDbNxX/CW76Pj1ocnp4gTr
         UJ711cLAE0Zs14iAzfHeVdFwCMFRkifluIuu+usFm19RUYfOIYPebQ6o7uyhV66VD5qg
         3ih8YtpjaNsUULYTwmEq0l0dp64RfW8QO92txW5nhQ2TmiZmDaRtEYOsEr1GQvzaN04L
         2z67MGgOttogIC2ewhksxYCjomGcox0jQ7CjBoNopy2fkI8OKB6cLxs/ksxqgJvymMb7
         xEasKTut1RyNhSEn0WNSkdss7v6MLJ6xjnlgdvaKPRJDiLdgimMo3jjlLu2fmyYPHIFg
         JBoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775050062; x=1775654862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WcIm7yXA7KDT7CpVTwgIEnk1FCyvBlEw6vFDxeCbDSc=;
        b=ENE3VhneqmE95RdYPIx0q+IM5o4+nGaW7xCTvgm9IZn/FEXd+xOb7nS/il/OL1tjwo
         Qb0iPIsAS4MjYkWRuj6JYjTpdj5V0a+pcwyNCR5OfWew+/UoK+9T1m3dMql6VuR7o6kf
         fw1Ez/SIW5lulL4/T63PB8GlORy2CCWUaNClQF0MziHPk8EWNWni9aoUYM/Vo2GrJu58
         OaJ5SA+bAwTkMjN4mCplFwsfVeMvuZOf/T0E+V4v+qtkOwa4BYP26ttazx8+/lFQtb4u
         MYLav6I2cM904qcB/rWdVcIcZvf9xk9zKVXfVqBvFXMFE96WcJy3KHGlV/1h1zEDOoeI
         ao7A==
X-Forwarded-Encrypted: i=1; AJvYcCUL1lHaX+09csHW+uQKoFKqbQBg4Zv0K/g3KqHHhbtsiFcl3bjzHD3WTZnOmHSNNW3oBgjipyt4P6XC@vger.kernel.org
X-Gm-Message-State: AOJu0YznWwfMhupS5f32/giNdDvaa6maOMduuYOaGSUAp5LkyvIMzSvq
	WQFCBrLmyqvDNElvV8xgyprg5oLw+cpEDyA1of9b4nYJ/EL04JssJpucwz+zO4IY1pdirSAz7iZ
	8MP+lDL89vXQnngeks3C6AK0tV1P1it8dOfQXt1U4bg==
X-Gm-Gg: ATEYQzw1yoIGHfTbDF9gq0Nm/IZkFlRniRf91APEBjL4sh8lN/hNGlpmGE1xENXckEf
	fus1LexIvshDSp/DuEW1bl7fTlOsgXicJSZgJIzwvxKYDR1QOp+GLFui2cJ+3fz3Nw+BhvkUVWD
	srWm+/yuTP7QtHAtVT23WEJ7KnaNTBwa87o49c83V2fWHP/mHoEod/I0eKYtdjcLJqk5LY5qhdt
	xl98xvkYw7BcWAMkCo8bNLZd7pwg5hbgS+CbiwSKCL9V3HNKN3lhsLSyHNl675g0N0kXIE4zrhm
	FM6FEke4OLuTGh9eeOMagV6gWiitucSbk9yt/jkaAQ+MYXBiySzW2IUZrhVwWqXjqHsTIoc=
X-Received: by 2002:a05:6214:2dc7:b0:89c:505e:a96d with SMTP id
 6a1803df08f44-8a436c12006mr53463596d6.3.1775050061865; Wed, 01 Apr 2026
 06:27:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401010707.2584962-1-dennis@ausil.us> <20260401010707.2584962-3-dennis@ausil.us>
 <b733883d-e515-4946-a81f-d1a595985e01@lunn.ch>
In-Reply-To: <b733883d-e515-4946-a81f-d1a595985e01@lunn.ch>
From: Dennis Gilmore <dennis@ausil.us>
Date: Wed, 1 Apr 2026 08:27:30 -0500
X-Gm-Features: AQROBzCAzbfR_j_LOy-RUvYwgZyU2IUXkEObV_iLNc2MeYTFQXYM4pLFScKB5fA
Message-ID: <CAABkxwvnv7i=xg53qu4JDapBs6ATaMGh9iXZfi+od=CCxRxQUA@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] arm64: dts: rockchip: refactor items from Orange
 Pi 5/b to prep for Pro
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki <naoki@radxa.com>, 
	Hsun Lai <i@chainsx.cn>, Jonas Karlman <jonas@kwiboo.se>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	John Clark <inindev@gmail.com>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Chukun Pan <amadeus@jmu.edu.cn>, 
	Alexey Charkov <alchark@gmail.com>, Peter Robinson <pbrobinson@gmail.com>, 
	Michael Riesch <michael.riesch@collabora.com>, Mykola Kvach <xakep.amatop@gmail.com>, 
	Jimmy Hon <honyuenkwun@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Wed, Apr 1, 2026 at 6:52=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +&gmac1 {
> > +     clock_in_out =3D "output";
> > +     phy-handle =3D <&rgmii_phy1>;
> > +     phy-mode =3D "rgmii-rxid";
> > +     pinctrl-0 =3D <&gmac1_miim
> > +                  &gmac1_tx_bus2
> > +                  &gmac1_rx_bus2
> > +                  &gmac1_rgmii_clk
> > +                  &gmac1_rgmii_bus>;
> > +     pinctrl-names =3D "default";
> > +     tx_delay =3D <0x42>;
>
> phy-mode =3D "rgmii-rxid" means the PCB provides the 2ns delay for
> TX. This is unlikely to be correct. Please try "rgmii-id" and delete
> the tx_delay.

As I mentioned to you in v2 I do not have the affected hardware to
test any changes. This patch is just moving the existing definition
from the common dtsi to the two devices that  have gmac1 wired up. I
am not comfortable making changes here that I can not verify if they
work or not.

Dennis

> https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bi=
ndings/net/ethernet-controller.yaml#L287
>
>     Andrew
>
> ---
> pw-bot: cr
