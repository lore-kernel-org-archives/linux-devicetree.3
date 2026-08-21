Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A7C38E8A3
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 07:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787298652; cv=pass; b=bIKMPW/WS0ZrAzShctYEKvKve9SQU4jJ6wYOJxM6rdd7HyOH33xcF0Ljf2vbTurjeeBJ9R5EZJtmuDiYsvFBuTPd+eowjF2W9++cszXX5htaCrpcKc7qHRiDJKU4KasKMLFxF72a91eePT0YHaRkbIsemuQPummMOC1xTW4OCrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787298652; c=relaxed/simple;
	bh=Ar7dl1WOm0eueofGyFFcOraww8SO8wyju6lWFB7ENAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gYa7NY1cx0o6PfzAQjsoD2hQdodQv1NL3wbn9+iOhMi/Hv5XwXeZVGSvgt2TbrnNysNxCHEwHVqLcTH0yRwHz01qfUSCVOYX4g4vnIyUydZZx5xUMlrCrtn6B3rOKdgAk6fhQYg1I3e7pztKt8JQGr2EcmZ8/7GwHXl6XVaQnTE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tf2VjWPC; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tf2VjWPC"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47fde295992so495071f8f.0
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 00:50:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787298649; cv=none;
        d=google.com; s=arc-20260327;
        b=SPEvO13MQ8zAau2OyummJMrMtaYSZaAOp2oNORt0ndQweA6M+npNIz34/BjkrlGDcT
         aWFknJ0OaFvIv/7CIw9JesIHbFlhjKYOO6ZX9G2xfKN9hhcSufY5lAlI0dAystqEmW1h
         Afh5H31Z3NUTTsnR65rfwR+/SbyNP/K3+kjDcrWUOZumRUrVz36L6T6oE9jljM7Nim6f
         eFSEfQwcreO72dnoXZAE25JZIuQgLR1dUg9L6wY+S9f0KJxPf8uLD5nFlDRJysJazhNL
         V1rthAcuIaGqxqpHQJotEEYE+5sKaVvot4KZ0eai1uLXxvNsPCG7wDAWxSzA83g0zXHo
         T6Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pq8cs14CPosYQ8esPWunZ9jxmDxJEbeMDQbryhvhdwk=;
        fh=wx3wvJaGqac+D4jgx/H3XLQb4t3uIcaTYbzReOsyWPA=;
        b=CuR+b7zF9DZ0m424bSGymh44Rn4838tZy1Zo2lpG30Ux2N1JdFIZylUWwMmlFD1Bwt
         fVx5rBSskcwkk2Mjo+HprQU2PTqB65O4xgmOFwIF8gjaiwZkF+9zzi2EcbklKKP9RXJi
         iLpRZ7Rqja/T2inVRzdnvu8BTxQlP+M3pIGObCQG3vBcIyvPXjrQkmgBVcPWny/iG1Qn
         BAW9qshIQQsOeZK86JLsfkjRmjsxYqAktOeL053WK0uGcUNsvtV5YrBydEZxXdDHcI2r
         WC2p5v7hJ83DJ/vK3d8yvYvXLykZ4QvGI9mRRHaOl0f2r1/jEnRumeljp3sROQDFSOjO
         PSTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787298649; x=1787903449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pq8cs14CPosYQ8esPWunZ9jxmDxJEbeMDQbryhvhdwk=;
        b=Tf2VjWPC1g3e+ax6WJguxRrDugAWU8CKvJInvdeUBxnFnA2wWsPl5Udgk82RvAZCo6
         dyHpFY3DnKxuBRmY3iAc3jXmaGGKZXVq7kzyF5/AvFceuYeWALuD4vNIARuiCVVADSXe
         8uZMRYNU5Ll5OQ5Eeba01okdkAjMyqhhevQBAP2NJg/98FQd4fGPRVa58MiPHrLTG+em
         y4NBrYZ9YIzmD8Ee6sYZAqwJmV51annif3djiL8HdI/menmc+f9jCHmvHurk84aNUa9t
         Z+ERU1salpIaVwR47esX1bFxEfwdB7yUKcNewXhWGa6sMgGNgV5XXhESJXg+IlvJ4q8L
         DROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787298649; x=1787903449;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pq8cs14CPosYQ8esPWunZ9jxmDxJEbeMDQbryhvhdwk=;
        b=aJXTFxRgbLFUOlrKgmai6imXekM+/GXXrzcfcrng7AKLdqpd/QGz+nj0UMSIo9/dXp
         iiocyhkM+kg0WAS4EWjKNqnMW0KLIikOgU+WmIh6HY/EWGNFuHHAXlTfyoTzf89/r69X
         nnPeGZtFjWg7AabcQKSfX/Ho6cxmZd6Oix+yQ0ho4XsKGyN5zCtBvZ5MHIocFYUdPVBt
         lQdTw7ETLL0kjNLlFZOfrj0R8vYQINdvelkNPeI9LiD4jFvq9iOPutEYPrNZskEJkKQF
         3iGxiEfTxLwxid6GtrlLO8fzj8RVGy7jOvLc2WrEv/lYyJ6RneqFJUtYROXxu3HMZc4X
         bDQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq77XXhrcMqX/qrWUqnDo8aI/47pDDleNa8apayiuPBMXGazPt+szxBhzvgnYMQKhcGT7yb9KLWJcqs@vger.kernel.org
X-Gm-Message-State: AFuF++nLTzgTwfQmEwGWHRrJ2jr1WhpY6hMF1HR9RnrACF5w3K3hYlP/
	fJdUkWy8VIvdb1lfxMZB2D4tYHBi47B+vb27MX+VeiU8LojCAXb5z4qCgkorKAEolfGV2S8jhIQ
	EAMnBz534WWaAAXFqtgKMv6sCPLvYXec=
X-Gm-Gg: AR+sD11vpdOYe7VAg6//ZkWjWdmevim2yajhtwg/O4f1U6FmdjTMEhyVgOu9gcUw0m4
	kwJBF53tgLzy2Wq5UOkZBetx3TeRSg0G4VVXBVwT9ePTAECp2EcbklkBHRHFH5w3nbmXNBn674f
	yRWL2szk32z09cWq2Vso6Ih1IMI+vA82xRzE/Yl++iY2ITiS9oBHrjeR7N3+wP6m/C+0T0t92Nt
	7en6KaH6QaoA8eoYDYr16K9L9MhDQ4hP8GDlMRZmT1BxyZvUepnHySBqsMSEpulZ+Tc2E4Tx4Cd
	BznH6DEaIQouKGxkZgI4oyqa4XF0hGOo6z65Em5ATxOaDLoxCz0sdQvduAxgiMa2Aa1K+TpFUiV
	fBwifAmNtZPNPEy02bZUOBzYGPRIRkg==
X-Received: by 2002:a05:6000:643:b0:47f:ec53:1d2d with SMTP id
 ffacd0b85a97d-482b781c048mr16263716f8f.7.1787298649421; Fri, 21 Aug 2026
 00:50:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819103926.2136712-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260819103926.2136712-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260819103926.2136712-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 21 Aug 2026 08:50:22 +0100
X-Gm-Features: AcwNN1WOW3ki891qZSZZpzaaCiMqhO323D4bsoSUMUR3ubUggwI4WxPSkV9zeXc
Message-ID: <CA+V-a8s9s-SZskiamnw3jH8OWE1DgT4Y56V4n9rgyeuB7=4afg@mail.gmail.com>
Subject: Re: [PATCH v4 15/15] rtc: rzn1: Add support for Renesas RZ/T2H and
 RZ/N2H SoCs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-rtc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Wed, Aug 19, 2026 at 11:41=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add support for the RTC block found on the Renesas RZ/T2H (R9A09G077)
> and RZ/N2H (R9A09G087) SoCs.
>
> These SoCs integrate a closely related variant of the RZ/N1 RTC IP, but
> do not implement the RTCA0SUBU register. Use variant-specific match data
> to disable SUBU support for these SoCs.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3->v4:
> - Dropped RB tag from Wolfram.
> - Added OF rzt2h_data
> - Updated commit message.
>
> v2->v3:
> - No changes.
>
> v1->v2:
> - Updated commit message to drop reference about RTCA0TCR register.
> - Added Reviewed-by tag.
> ---
>  drivers/rtc/rtc-rzn1.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
> index 6097563c5f13..32f6464fe7d2 100644
> --- a/drivers/rtc/rtc-rzn1.c
> +++ b/drivers/rtc/rtc-rzn1.c
> @@ -508,11 +508,16 @@ static int rzn1_rtc_probe(struct platform_device *p=
dev)
>         return devm_rtc_register_device(rtc->rtcdev);
>  }
>
> +static const struct rzn1_rtc_data rzt2h_data =3D {
For consistency I'll rename this to rzn1_rtc_rzt2h_data to align with
rzn1_rtc_rzn1_data.

Cheers,
Prabhakar

> +       .has_subu =3D false,
> +};
> +
>  static const struct rzn1_rtc_data rzn1_data =3D {
>         .has_subu =3D true,
>  };
>
>  static const struct of_device_id rzn1_rtc_of_match[] =3D {
> +       { .compatible   =3D "renesas,r9a09g077-rtc", .data =3D &rzt2h_dat=
a },
>         { .compatible   =3D "renesas,rzn1-rtc", .data =3D &rzn1_data },
>         { /* sentinel */ }
>  };
> --
> 2.43.0
>
