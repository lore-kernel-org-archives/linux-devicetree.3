Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3FE274B58
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 21:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777066531; cv=none; b=UScnfB+3q2aFujq0x+8yc8OyVvxyKYYnMyr9lnaWzeVjYNQomKYM93tG+dmnyoQninUnF7MhPHw5awu06g0k/cPdsE1DtTOdI/Gb2hxiih+kucAfFI6YzdrIrN1OiUiWkOVqxAOiiKCPUex+5WSJLZoBKX24aut0d4jdlsMovds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777066531; c=relaxed/simple;
	bh=V/g5417/lu7Rq9Wc+VHeVNBsxjaU+u4FIfHUcgI8RBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WemvVUSnmcLHoqAe989hvGsQk2qwm7cmSY4VnIVXdZJjCvDA/6v9k6HSrquM2Q53BIFFhoXusjZHmN0O6iIWlTJv25a7ZoMWzTbFcgSx94gvMbr2H0Vm7/64NyGvJx5A4Bx6maWvZ2TScHrJLk8s0KJtn0wYdH2MKiQc4bwWIrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TzSrA83h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TzSrA83h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB4C7C2BCB4
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 21:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777066531;
	bh=V/g5417/lu7Rq9Wc+VHeVNBsxjaU+u4FIfHUcgI8RBA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TzSrA83h3MF29WGElQvFWQ5jKHyEJlRhWdtIJjpO4xcVRbM/po+lDeAxLa/JBomDK
	 uh6wtq/VEjqMJxCJZOtItouPuZdLYh/0K1ESZwMkKekkwajXTLCh5uVPkRAGQw2ex2
	 z6HerXXTiRtWoEON36F59AhbxYvNLf48NirNBrQ/5WGPKpR/C+PJFigx4/xW8RMq5j
	 jg1XBWHt7viGZ8Rwn/TJYA0uqaNse0FsL1PxNhIG2Tlmc+tYIUoJP2Gwi4DR+HOM74
	 /Gybl/hwIIJTu7nYxN32939Xr7ypeUUNQvwFONtCG8LGIQvBhNFlyxrVc3C63ww0kM
	 U7FVAFBpb9XiA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59e5aa4ca41so8141349e87.2
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 14:35:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+N9CAptSet0jLvXigpKeDR138Gxi9LgApH+/OTISojF4+srbrJPiOEzOY+FMLTChg9BedTwWNmCDah@vger.kernel.org
X-Gm-Message-State: AOJu0YzgQ3Cw+2o9rVEPLQ6ymYRhsoRYyr6LoidvnkjAwFpx01ivLvmd
	B4U48JRZJcvvGDrklKz0axdw3nb4B7VZQo9emS+GQpQoghGojbVcP1BjxBPorDZPG3Myqhi9EqD
	K4UnlSiPElSP0NKanNYNG2In2paPEg7A=
X-Received: by 2002:a05:6512:3d27:b0:5a2:b3dd:7a74 with SMTP id
 2adb3069b0e04-5a4172e7af6mr12181069e87.33.1777066529695; Fri, 24 Apr 2026
 14:35:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
 <20260411-waveshare-dsi-touch-v2-21-75cdbeac5156@oss.qualcomm.com>
 <CAD++jL=zmd8yto9HuyjC8cmBj1oMgOa7C899yo_toP9Q+QJcDw@mail.gmail.com> <dovqowg4a3aet2f4gwd5lufh6xqopeq5slgyix2bqbf3v7z4fk@b6pwiyn6ppov>
In-Reply-To: <dovqowg4a3aet2f4gwd5lufh6xqopeq5slgyix2bqbf3v7z4fk@b6pwiyn6ppov>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Apr 2026 23:35:17 +0200
X-Gmail-Original-Message-ID: <CAD++jLnSeT2obJrvw3Z7G5WMeEqaPueWAKhjS7BO-HY6RsR+2A@mail.gmail.com>
X-Gm-Features: AQROBzDBWqqVUjdalSSficemzrrdbGhMWHS70jsRIKyadsmlsfGsHqdU45XnDFM
Message-ID: <CAD++jLnSeT2obJrvw3Z7G5WMeEqaPueWAKhjS7BO-HY6RsR+2A@mail.gmail.com>
Subject: Re: [PATCH v2 21/21] gpio: add GPIO controller found on Waveshare DSI
 TOUCH panels
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Cong Yang <yangcong5@huaqin.corp-partner.google.com>, Ondrej Jirman <megi@xff.cz>, 
	Javier Martinez Canillas <javierm@redhat.com>, Jagan Teki <jagan@edgeble.ai>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Riccardo Mereu <r.mereu@arduino.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 8:39=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
> On Wed, Apr 22, 2026 at 03:20:26PM +0200, Linus Walleij wrote:

> > This looks like it can be replaced with a few lines of
> > select GPIO_REGMAP
> > #include <linux/gpio/regmap.h>
> > helpers.
> >
> > Has this not been discussed earlier?
>
> Yes, it was. Using gpio-regmap would complicate BL code since it
> wouldn't be easy to directly toggle the BL GPIO.

OK I buy that.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
