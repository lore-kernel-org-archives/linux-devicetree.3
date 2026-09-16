Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422224503EA
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 07:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789544216; cv=pass; b=hMHFklsJ88S1fIHuxaZzwNJs1DHFSxzneewHutym/BCMbTyTK0q4rr7kkePaM6teNd/g8LXnPuOQFfiZSgu5L3YS2t0I4GCSQI8hRrTaHW4efkbcko22xWRQXe+N7O+BdHt1oMBEwLfOCGlxfRG/m4bb8ZVvOcNMxznIbz8a1vQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789544216; c=relaxed/simple;
	bh=cJJs34fb2h99W/KbF5DWHeZGBBI0ty2ys0AP2AMX3NA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bDCdvvGs5jBVy1O2t47/VxPcgktm7ncBDF4+pcc8J85xBhGCfqF+39dVb8Ux6LoOWlnsiywYBu8qqX/ZsQEnUQyNOAm5ZxZC+gUebnQag1odOl1yu29O+VCdX2p6f2q7j8RBnwwkPKNyef/CKa9TE7odNrPqUA6A0T2nrz2mKZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sa4wcHW8; arc=pass smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sa4wcHW8"
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-78a4c5c582eso183605137.3
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 00:36:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789544205; cv=none;
        d=google.com; s=arc-20260327;
        b=rj4xopvKNwJPVsVybt3jRG/iv7AIdTTNvdjUVFSTKWfpCypiuwXALZZTolbo9+V9Xr
         7HYmYvd+FjwXFp/2nAee6KoUoA1UMKGa0iKzb0xjyNXVWbrBlUdvqtG7Dc47nFOu0JBe
         AhhyvmYav9Qj/pc1faFZ+AQegN0GQ/R4yW6f0lX1Hdg3n9GDzmwzw+2sSXVke7FHOA8n
         HdFkvNsysa/9juSRvFIgHH+TwzuJDO6TDtcHPF64p5wBopfw16QXTlFCkGV0LJqBdxgk
         GUlfd/AArTdOozhOWYxgTvY1eQDs6MzcI+A+uc3irPXa+yqSKCuJnDV961XCdyMvPa7M
         sAwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dFdl8Va7Swxkjw5uQRSJKt+eRYekF3RPnToHL1YscsE=;
        fh=m4yqDS3jcDAQfYvA/E6a2v/MdVegK1nR3flfrZRBqSA=;
        b=sqpRWU5brlF7nH7eVuEPLnLnat00+38el0cp0qho8msckJXFLPzxpU8I96PIzOZNpJ
         UPOLJQ/oNI/s7AQXfRN8emwcW+kRo+UxN62jueveNQgo97ytiX8/z2vZRP/oeIeLYeOc
         YbkJPhA5yYKmdoSrjcTbOrT+mB7HrLMYYIJ105gPptYlms7P8R7uNNoKevHHsL1Vw1tw
         XQKzDzwVWrqfwYSQZzLF7tjlzwMzHAZZm2/X5jeZ7vnQcXTxugeSMgQ4/Cc3IfQpGiGE
         zH9sk5QLMf4e65eh0W+k3NGxP68z5GfY9f9gWoFNkDBH/a6BWeAQOuPRiQ9J8RJBneGx
         81CQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789544205; x=1790149005; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dFdl8Va7Swxkjw5uQRSJKt+eRYekF3RPnToHL1YscsE=;
        b=Sa4wcHW8Ujg/+h7/w82w3fECg5FqooFAgohduku4IsAGiXjmM8365hyh0E0X9e986u
         cu9h49eFoKjB7jTcls3mqrXanekPLEi1miKYfbqiQZKKWDF/PaB9WtSpbBQDXTDvK/2Y
         HQ4K3ebtXEs40F6Z5a26MvqqIPuCM+9HsY3Aq4xmQrtSJpoZUwrzE+dcg4alotEd7fkv
         88DYGFqXIwZn+BKmaLmy81jAqOsKLRuOmk2sK4GysH6Lth75hJL6v1xZ8qsR3ghAFSCk
         qqrAcVJbF81jNnLY9qJSv4iGVZnpbgZWmHW918nB5tYHiQNkSd+4K+1HurNqi0IHoBzV
         i7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789544205; x=1790149005;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dFdl8Va7Swxkjw5uQRSJKt+eRYekF3RPnToHL1YscsE=;
        b=n5Azv/EHzqbjgC3o2KjUub9q+T+7UYATbh7QUDCdUogiycaSb9LjmaSqDaDS8LngXy
         z4GbmSlwvKtNTLrWFZlbw3I9VhacXlNsits3MFXTKFIKDznLTXtClgh6538Pa2/+9OcM
         6O7kYzyW/s3VC0LKaUqynx6iiXIF0omM+M+urTQVm4ZfqMWDZxU4Y6cn5IO419ZTrK4W
         opgfybBcqCJqAwKyq3T/7ynfq91aLtsSYfilY+wUbwCtx2T4nUtX8Cd2NzJRUAICeZTI
         EhqtKdB4MhPHgefjr6mBGVeTO5CmlBxpf2sLuUog5+y35/mI8MF4f5Bu+tr8KwGXxk7v
         2rDg==
X-Forwarded-Encrypted: i=1; AKwUvBwIxm7lslgU1FSVAcQ2y6mlxEGNS/PKQ4mQlEM26mhKgZcnQuzFXqQSUuyZEuPcpxSPDf/rChPJngWT@vger.kernel.org
X-Gm-Message-State: AFuF++lJ7SWSJXp7RZlYijLj376T1ZJu807jZwfBj5vUGkNpCKD+L73T
	XEF52DtTgSbpY3HWyb0ZpZ442Kp3ZbsXzcGkwTkFfHjVvTyEYdMgS0MePrn4huaqFnLDgGhAkZB
	oupc9reeZ2/W259a1ygeEaRoa3C2hlMg=
X-Gm-Gg: AYBFou1oRP1FEQRwq9qQ8BPPXyN/kNuovWr0XLT7GdCfGEm5CPNddscQNjiDQcssmBq
	4IWSxEunVV916wIC/FxQ8EewuDKI6Naj/huQXHTWlvIo3xy29K7acl2aFUeOIyv0Ab9pk0GdJlB
	QLkPNXVA7PL8b7BszsrpJtCF20ELm98H5PYSgg0GUxDpNeqlxKhynrKJDdYClNFFFVGbfmfUIen
	xqP/5phkOlhN7AY1xZlcoN64YFEx0HyYYAytP9ZKJ2s5brSbQIs232a/gNU+OHWj1BNJRT1WPNd
	UP/aN5exsOW9GiWtMSry33KhBSR1SJ+/el0VzEwTxnPUAV0J4X3SYVR0j9njxMccrYNt4Cpx+kj
	LsuKFnoGUFjyx/lTuP8Bpbg7Q1tskP2mZZBffcnJe4Vtk9F3+YDdwa4WQQN3PJ8QT2QBaO1T9bg
	mxNl8EEJrcKrwZ0rzY9qyvfm22G6QqW5ocODYF+ylhr9DL5BhgCduvUGqq
X-Received: by 2002:a05:6102:4bc2:b0:79d:c493:f1d3 with SMTP id
 ada2fe7eead31-7a026c4142dmr757332137.7.1789544205003; Wed, 16 Sep 2026
 00:36:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-submit-h616-emac1-v1-v2-0-322b32e40eb9@gmail.com>
 <20260915-submit-h616-emac1-v1-v2-1-322b32e40eb9@gmail.com> <14e61e7a-29ad-4cc6-8993-dea7a8d7c846@arm.com>
In-Reply-To: <14e61e7a-29ad-4cc6-8993-dea7a8d7c846@arm.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 16 Sep 2026 01:36:34 -0600
X-Gm-Features: AcwNN1WscQQGHuBz-gQadqFD8U_llvHSSS-ajPx5e079eC1kBH6r8x1MbCO5ieo
Message-ID: <CADvTj4qtuV_JEW5Byix86eQZJBsc_dmPR75ypVWn4xjem9rpAw@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: allwinner: add H616 EMAC1
To: Andre Przywara <andre.przywara@arm.com>
Cc: Richard Genoud <richard.genoud@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Maxime Ripard <mripard@kernel.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 1:26=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> Hi,
>
> On 9/16/26 05:07, James Hilliard wrote:
> > The H616 secondary EMAC uses a separate system-control clock register
> > and supports only RMII at 10/100 Mbps. Add its distinct compatible
> > without an older fallback, since using the primary EMAC clock register
> > would not work.
> >
> > Constrain the PHY interface mode to RMII, matching the hardware.
> >
> > Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
>
> Where does this come from? If Richard is the author, then please reflect
> this in the patch (git commit --amend --author ...), so a From: line
> appears in the body of the email.
> If not, it's unclear why this line is here.

This was loosely based off of a patch he wrote I guess, although it has
diverged a good bit so maybe should just drop it, idk.

>
> The actual patch looks good to me:
>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
>
> Cheers,
> Andre
>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >   .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml  | 13 ++++=
+++++++++
> >   Documentation/devicetree/bindings/net/snps,dwmac.yaml       |  2 ++
> >   2 files changed, 15 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t=
-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-ema=
c.yaml
> > index 323a669fa982..2cae0133b3cd 100644
> > --- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.y=
aml
> > +++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.y=
aml
> > @@ -21,6 +21,7 @@ select:
> >             - allwinner,sun8i-r40-gmac
> >             - allwinner,sun8i-v3s-emac
> >             - allwinner,sun50i-a64-emac
> > +          - allwinner,sun50i-h616-emac1
> >             - allwinner,sun55i-a523-gmac200
> >     required:
> >       - compatible
> > @@ -33,6 +34,7 @@ properties:
> >         - const: allwinner,sun8i-r40-gmac
> >         - const: allwinner,sun8i-v3s-emac
> >         - const: allwinner,sun50i-a64-emac
> > +      - const: allwinner,sun50i-h616-emac1
> >         - items:
> >             - enum:
> >                 - allwinner,sun20i-d1-emac
> > @@ -91,6 +93,17 @@ required:
> >
> >   allOf:
> >     - $ref: snps,dwmac.yaml#
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: allwinner,sun50i-h616-emac1
> > +
> > +    then:
> > +      properties:
> > +        phy-mode:
> > +          const: rmii
> > +
> >     - if:
> >         properties:
> >           compatible:
> > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Do=
cumentation/devicetree/bindings/net/snps,dwmac.yaml
> > index 2ed4564ae99d..b20149c3e850 100644
> > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > @@ -57,6 +57,7 @@ properties:
> >           - allwinner,sun8i-r40-gmac
> >           - allwinner,sun8i-v3s-emac
> >           - allwinner,sun50i-a64-emac
> > +        - allwinner,sun50i-h616-emac1
> >           - amlogic,meson6-dwmac
> >           - amlogic,meson8b-dwmac
> >           - amlogic,meson8m2-dwmac
> > @@ -623,6 +624,7 @@ allOf:
> >                   - allwinner,sun8i-r40-gmac
> >                   - allwinner,sun8i-v3s-emac
> >                   - allwinner,sun50i-a64-emac
> > +                - allwinner,sun50i-h616-emac1
> >                   - loongson,ls2k-dwmac
> >                   - loongson,ls7a-dwmac
> >                   - ingenic,jz4775-mac
> >
>
