Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBC825B0A4
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 03:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787283295; cv=pass; b=six+dzeqlsVasTHG+bg479l65dDradtifeXKWKrQtUr1cflumSX/QyHX7h0FTtECiosUUP9LtmJGKIUmecH1ZgsMthTvUQbYUj3Z+0thIqqXo33i/M1v5bODlr7bV0P9PuHjsX//uMVjFoHG3dMLvrb0oCbMR5kvpGeTUSvcsms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787283295; c=relaxed/simple;
	bh=R6zTZuf9kfoU7qSR3weAndpd4l5VqXSimXgA67uEyLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qjqgF1OvgwzIfeuwCar+NV3qxPhgk3+Az/9bBbt6fPHcuhqR/W7JuC5HG3CISDaiTh28MQhMMBGtyan99TZYRlFYhxNALjOmwKId0yNXXSa2tIcu82k8DK6yVcWh37kNZROZLsfsTUq9h6z+AE2N5Szj4oD6Zq6/YYJDJNWqUQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AA+wdo1Y; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AA+wdo1Y"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39c953950dfso5999501fa.1
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 20:34:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787283292; cv=none;
        d=google.com; s=arc-20260327;
        b=IhOWGBpRjx5MkylUq8gFYXnu4SPVOvE8c0kqNq05SnwSJvfFDexXvK7/Z4E7lFDyq7
         fmZMnpwJPQDSWVItFjkiz8zHzj+VDgCpUlGjkZQVPtXHD9cCmTBWwXYwwHhUNrcG9JNB
         R9RW6QU4rcJc+ow9RNSpwSRuXNkLbtTMeqhOSCiXHehrRjMpkgJhHWDsAPApCp+A9p39
         PUX8D9/yXrA1KgSvGqKsy2URbA9NemEuQIucp3hOdo5B7gpdKW8W5w/W7Ll6SYdYfRV5
         dbMIfD8b5JdwNnAknjzuk/wgSJBlEfomhb50aTKcmuqDX8zMkjhkeDSgAeB0dvvrLJqn
         uVWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R6zTZuf9kfoU7qSR3weAndpd4l5VqXSimXgA67uEyLc=;
        fh=dx/fERJPuBorTbQ1IqeuysC1Tnk9EgdThi7Uw3ByoxQ=;
        b=GkZhjmO9nwjKXeqUQoNB0B9aCeX9D6fVj5l19bDXKbyaAjJac1pb7cy7BqlEIuycYF
         oYT1vuXX/0uGzN13oIl+M+Flx63QYyg9y5gPAOFb5UdT/FB/X8mkYj+TBOzi4PJE5o5j
         puLZECs8BZI3EqqKHhF859FHsImSXlrCodxYrZL5GAYp1TgpIRE5V2nv2w1CcKbHWP+Z
         d2eyPylmSxIop5kx9iDA21djWgdokIndwnwxZ0s1qmPdcnYy9RdXjzFMdQtky4Y9VphT
         MvQL7YDfFsyEiTE83lGDXYwCYTJQpCOW4VZZ3w8Zcqnimupd9So5ywM4Nh2j9XtavuWT
         QHTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787283292; x=1787888092; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R6zTZuf9kfoU7qSR3weAndpd4l5VqXSimXgA67uEyLc=;
        b=AA+wdo1YJo+ySQ7xUcBNyBe67CFI+PJherWEH/dkCBREh17063qCIi6uTOMycn9hTs
         KURNsj6/gCU5633qBW6g8cXLFJAGJqTFTWPBBxa89wdiUT77PgykCCJoBIiiB0zrAKCq
         qjcNzfMNXk9HrwUlVSES6LKGrMUOGvvJFtsJybFHw41d1t8QhRCLOFaQFv69LeeGu1Qc
         AUD9Kyy5yAiwU8faVPTTkLA+87RAEt0I2hN8dq9XAlHXNU8N9JzCUpmT+rYTbMZ+8cf9
         4st54hKpEjfCMQvwYpCl2RB/NekGIYxod0DgCgwkMB+H/AZgGAgPccVV7fsLnTMN+dWG
         PyrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787283292; x=1787888092;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R6zTZuf9kfoU7qSR3weAndpd4l5VqXSimXgA67uEyLc=;
        b=Dm1cFDoo0CQhqXIT9666q0TSakEfDnBBoLZms7LhwCXSADx+HyQDYQXv1ztelQ5DHT
         mgFYFzClgW0zHFEub7VsIv43P35WjTiffBtgei7jlaMysiOiIH9Ne/RUMV+NqJEHLcfY
         x9H3wZ7LlvamJUyEk8cBTMxYO4B1S2oLrwYtFebIMylbW+cjYT8jf+CYvXVlZHU4AklQ
         sqIim3Fcw1kFOPIdQxaacicWBIZj9ifMqlDItBdM/xzz95K9WAfM+yPeES4CxMJJBq1D
         HjZylRd2VAoAAVfAVUaVZiBnHJ+s2HYRkVimLp2oH+9L/9gCuuW0PrtPkgW33DGAYOkP
         Zebg==
X-Forwarded-Encrypted: i=1; AHgh+RoSz8Rd7BNepMtGp8Sm48RNLVlyjBamFEJB/y8365HwagYGs87agIZ5FKRbseoVcT/l8vh/1+9XWaKR@vger.kernel.org
X-Gm-Message-State: AFuF++kk3XX+iE0VHgy6cWYOi6O080ma79asMKlefeWBOXPQ8xkZBSoc
	b6tva/+Rr+5QO5Zo4lNZss+ehTF9Fc65uy5XgfFfIWmr/AZrXbyXWKG2B3cff1YdLKv4+Frev2d
	AAlehrE9iponCn1tV+YgP40cBKyc27WM=
X-Gm-Gg: AR+sD10HI5g1hdWAaHHNCoB7oEccSee4CBIIIf7n1TUa3E9SlD7NFwYadYKYW0SoLBU
	dIqUJdZgTZ48wJMW2aVoGlPi38WExQiGMJf2BIrpYSbjDdn/fADJa1RDmpOAv0ZLM7QqZsvckth
	ZFKCJ+2084Z3gEyw5IcQC7+G8sFQzJ6VooW0yTyByoh4FdfelL5ehnFuIjPxFyKUn2pPwz/be2i
	ECPOAPr2l2hMYh7932lQrDBa9NUBRNuuoCmgGDUagPcoWyPjJ+hsG3g4tFQrysquxYyAYzM4+Js
	srkY5jYx9EC90EVi6UCDOQ9xFk3XBStespsxW3mdSOxTvg==
X-Received: by 2002:a05:651c:b29:b0:39b:2757:c1d3 with SMTP id
 38308e7fff4ca-3a1aec08881mr7351981fa.9.1787283291995; Thu, 20 Aug 2026
 20:34:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820-ti-ads112c04-driver-v6-0-0e8f0aacce9b@gmail.com> <20260821022554.5382aa7b@jic23-huawei>
In-Reply-To: <20260821022554.5382aa7b@jic23-huawei>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Fri, 21 Aug 2026 11:37:57 +0800
X-Gm-Features: AcwNN1UVNIit8ce4OqAMK9uy7buk3YHHYSF3ZQJ_6XiKomuXk4JwNTyOvMAkDPw
Message-ID: <CAF7HswO-K3-g9ki366BTEY1pkf-Vvb4ohQCEM7oS3XhWXG00aw@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] iio: adc: Add support for Texas Instruments ADS112C04
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 9:25=E2=80=AFAM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Thu, 20 Aug 2026 15:51:50 +0800
> Kyle Hsieh <kylehsieh1995@gmail.com> wrote:
>
> > This patch series introduces support for the Texas Instruments ADS112C0=
4
> > Analog-to-Digital Converters.
> >
> > The ADS112C04 (16-bit) is precision, low-power, delta-sigma ADCs with
> > an I2C interface. They feature a flexible input multiplexer supporting
> > single-ended and differential measurements, a programmable gain amplifi=
er,
> > and an internal voltage reference.
> >
> > Note: While this chip shares similarities with the ADS112C14 (currently
> > being upstreamed by David Lechner), the register maps and feature sets
> > are sufficiently different to warrant a separate driver. However, the
> > DT bindings and channel parsing logic have been aligned with the
> > ADS112C14 conventions.
> >
> > This initial submission provides a minimal feature set (single-shot
> > conversions and basic DRDY interrupt) covering current use cases.
> >
> > Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
>
> Sashiko had some feedback on the interrupt - if you are respinning for
> other reasons it might be good to add a comment in the dt-binding about
> it being an edge interrupt. From a quick look at the datasheet a level
> interrupt would not make much sense.
>
Makes sense. Since DRDY is a pulse, an edge trigger is indeed the right
choice. I'll add the note to the binding if I respin, or send it as a
follow-up patch.

Thanks for the review.

Kyle Hsieh
