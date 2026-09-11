Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F72368D7E
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789140101; cv=pass; b=oVNGAp3Hh44kfEURHHOSbhKkQPZwMF9YIrAA5VUf8wudKUV71gIrM2Jh0nbdmyOs9Fjf8O/Cn5CyTGJbC30r3iizozKkQObh9vFcbJJpaOiLpyADWwx7jcjt2MKJlwafqsyido+g1tDZLKxLjuX0dEHus23ZU+/07V0cE52D0kQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789140101; c=relaxed/simple;
	bh=X73qWbgasVwFRCsdt41DwsiJOL71A/gEluZDRHMXGw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e3fTWIVKVomcCyVR7eGvus6+9+4g2lSZZvidO5AIMZS2FjVLC1M/VEXNupuwaxIphXcNf1pPjK9o3iILl6RNBs9jRe8IaP3o1zSjZnzHdFrhMTjfV/PLy5yt6lrdnzr6aevtIuFmIZeFa2TyECjGz8jZtcZBbUML16H2xYpr3Xo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=CoBm5puH; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="CoBm5puH"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e56a1b327so869398d50.0
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 08:21:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789140099; cv=none;
        d=google.com; s=arc-20260327;
        b=TkvoNSp5fBCYvQs+te8YbxymbLyjvOAR3HfgF29zir4sW9x8ZRvMSsb92yutpV9Zy6
         LY10GwbK6/nwSqpk3ATy3daoNNWMh/RN9ou7a4MCjJg3r4ORwyh5D1raci6XTGp5MMTB
         yeJZxmuXHKmVCJllwTMrjUvZ2afM1pZsLU6tDQ9L2VQPVTUnZQ+Cr9FvoNU6eipNSPm9
         +6wxuZ5qdRi4Malu46FqZy7s90efx1KYm4kI/OaYjJTKkjRs+8O8B+nxd910RWlNEtHo
         71xOUg/DeKRGO0LA3HlDOtwP8lBUQVKVtpo6DnyDIpOsY+Jmyzr9/fhLa4jqEbhOOfCd
         U//w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FkkSMxc0+XLFGXfcobgYJWMCi6rudZ0wwsjRC0+wmrk=;
        fh=3wCK6EXIvU7pU71vG/fYyHbemGBOHmF/3SxLB3GZFIg=;
        b=PaJriaYJnJKIGNMYKGggXELBLZB6xHhF1fVhf+z999UbJ7ZFUztfflw2WfoOorVEgl
         iOKs1iXRYj4Ci89KCMdIbiNchCNNTwfx0kqlbPodkn1NuhP7KQ15KtR4H8wW+9We9Exz
         kdlCI+vUcE/42n1qYAZJDc1azzTqbfcOuncMduPM+a9SAmGLm4cjDb/UWc7pMzhH+qD7
         QaX42bFvGYpWxxiJxkY/MLlE+D1NJY02twjHCtZ68EJPFqZR9BonZwpbh0016YbtL78D
         dwa4QP0KQ9z2qc83xFl1T0HBi6LlSkjr+QySYGXd+XQX4wNWNXTYbQffjFbGo8SoTuU1
         K+uQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1789140099; x=1789744899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FkkSMxc0+XLFGXfcobgYJWMCi6rudZ0wwsjRC0+wmrk=;
        b=CoBm5puHJ6qxzoETT8/f+7HxgqqC9zi1VI7IyPTQ5Z2iiWlVhWl8311sVr2qckRCDB
         2BvWKTu11gNOMRVm6kNgcX6kDnGMtz19MR6Yr1K7LXQMuws7TBZxpoHC9Pi3SKMFM+at
         oV5Ny5R/wi42XLoh7Wk+OTbAiUHV5dK17f0yY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789140099; x=1789744899;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FkkSMxc0+XLFGXfcobgYJWMCi6rudZ0wwsjRC0+wmrk=;
        b=qb8wqxoU031m0Y5NwMy8nuHQKnTf4V17KXb7EJjdEWG27hslwB1zLYQswL3j0TdO+y
         67prVuE/9YHB9LOrGRU/wKUl9Oqipu3lRliqegJ7lGS9QplV50YQzz0uyKZUgwz1vlMP
         f7u7cy/bFcRA5XSZCGs/ZUfvROaX40cdqQjLxLqR78hB8PTPMcEm+DmwGhMBUIK6X+44
         Qu0Rj7iu+EA+Cdu8UefHM/lkSg1QJHaIO2e/aNvyDbcN75ZFJLCkSEgOUUetwSzmMek6
         T6dGseipQwcpxOJS6XvdLe/w9llOJ6nfC2n1dIP09W9TjGk8x8MhryQ6xgsjOJmi+0ds
         Bp0A==
X-Forwarded-Encrypted: i=1; AKwUvBxVKfhSK1qw4u1bv4PmPmYhTTYOAd9otDBCzFi0tV8YolhaSf2OFoiGlIUjLGLSMdCukNZyIlO187sf@vger.kernel.org
X-Gm-Message-State: AFuF++m8Evb2SKE+1oHIWrDyZGy0GklZCkxfurxT5lz1ZjhuDSG361Ox
	M0enAvK7kKJ+8Fm92c9JzSEVXI9paqI/wvcxUj6Yq2UtRxTF8xKtYblq/RAe475sDCkms9iZajH
	oRnaqzT88s9JeVoofGOsmGBrn3yVhTD6P0o0AhV7eDA==
X-Gm-Gg: AYBFou07QnO2wkonWHc8lkwRY0hOLsAY2OJ2aUujW3mSMqJSMkoNxfEiyRAdsB0LGm5
	db82dGXd/adG7ld2vUWMHG0eXVTPJqG3d/e4v1EtW9dLG7MLQC9d5BxIAf2rjPmCNgf/X97EA7T
	P6QvBmcYsVGxvIE36HJiamnhnDPeNpfUYiDcUdmVimhgQAsOJifvRNBupfBmZ1xfbD6HZdTYTxo
	QZ5l3BlxxsWa3KqLXOr7nMR3CdhKu70Cc5Ez//IuEMynFsXa/ie3jYURAQapselNzcbRVfczkxP
	b3w+ZqOOjloDOqgPlhe3gUhKgjGfxecMLpruXAdepvPTab1R2S0SEbZJNkbpc6Sg6N2wAiuOcB2
	/7vIBrgONkQ==
X-Received: by 2002:a05:690e:4549:20b0:66c:ba49:1316 with SMTP id
 956f58d0204a3-671245483c7mr1612948d50.10.1789140098875; Fri, 11 Sep 2026
 08:21:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820092143.44829-1-dario.binacchi@amarulasolutions.com> <adc7f285-6269-487e-bbcf-d157da49f379@foss.st.com>
In-Reply-To: <adc7f285-6269-487e-bbcf-d157da49f379@foss.st.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 11 Sep 2026 17:21:27 +0200
X-Gm-Features: AcwNN1Ulqxcrv_HW3Dh6aPwZRfGOKMd7-GxKs7PSgQjZfT6GRUC-E4KDQ90Z2_Q
Message-ID: <CABGWkvpBT5xg3BKXAn01rxcpc8E4r238JQxx0YsYOG7Xvg5_LA@mail.gmail.com>
Subject: Re: [RESEND PATCH 1/3] ARM: dts: stm32: add missed
 arm,num-irq-priority-bits for stm32f429
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

On Fri, Sep 11, 2026 at 4:32=E2=80=AFPM Alexandre TORGUE
<alexandre.torgue@foss.st.com> wrote:
>
> Hi Dario,
>
> On 8/20/26 11:21, Dario Binacchi wrote:
> > Add missed arm,num-irq-priority-bits to fix below CHECK_DTBS warning:
> >
> > arch/arm/boot/dts/st/stm32f429-disco.dtb: interrupt-controller@e000e100=
 (arm,armv7m-nvic): 'arm,num-irq-priority-bits' is a required property
> >       from schema $id: http://devicetree.org/schemas/interrupt-controll=
er/arm,nvic.yaml
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > ---
> >
> >   arch/arm/boot/dts/st/stm32f429.dtsi | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/st/stm32f429.dtsi b/arch/arm/boot/dts/st=
/stm32f429.dtsi
> > index ad91b74ddd0d..f94500cd90cc 100644
> > --- a/arch/arm/boot/dts/st/stm32f429.dtsi
> > +++ b/arch/arm/boot/dts/st/stm32f429.dtsi
> > @@ -794,6 +794,10 @@ rng: rng@50060800 {
> >       };
> >   };
> >
> > +&nvic {
> > +     arm,num-irq-priority-bits =3D <4>;
> > +};
> > +
> >   &systick {
> >       clocks =3D <&rcc 1 SYSTICK>;
> >       status =3D "okay";
> > ---
> > base-commit: a4ff2be345d0abc943da8dd8da98151843b750dc
> > branch: stm32-nvic-irq-priority-bits
> >
>
> Do you really want this patch ? MCU boards are deprecated.

You are right. I agree that this series is no longer needed.

I wasn't aware that the STM32 MCU boards were deprecated.
I noticed Arnd Bergmann's series, "[PATCH 10/13] ARM: stm32: remove
stm32f4/f7/h7 MCU support", after sending the patch.

Sorry for the noise.

Thanks and regards,
Dario

>
> Regards
> Alex



--=20
Dario Binacchi
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com
