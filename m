Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B13B435EDB
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 16:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783529195; cv=pass; b=maIPPUZKggzAcPhafOoLl9Q0FO8Qzh0gffE94VaxqYcaxeROuLPovntoL3exod0z62anPkCe+NVxGgDINU7hGlPF88sqyoS07Zfs3Ys4DMV6lMA3ik/zJmarWbOInX7DUVGjVr23S055lA1bpgJGydLZa3ks0z1XhcmcdIchZjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783529195; c=relaxed/simple;
	bh=YVC7US2aV60pnlAH0IP8o4x3u6M1gcnkpWx5x8uEzuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oQzmFjKMaZW7d8xVl0QDp+4s+kpmVKRhm5033SHNqoixJYBG7iNWv+5fP3BGSsO0PIZMYxSRHiglp9Q9NmbYyK7t/xTRUJg28RU9Yiu4OOQ7qiRBrqz+PkfJ4aDlwJU7uhkIvYQsVvxWz76iIQ7xUaGfg/i4YeJV5IcUwWGMyBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VFIIdveV; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VFIIdveV"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aeb11c7347so728124e87.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 09:46:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783529191; cv=none;
        d=google.com; s=arc-20260327;
        b=kUvLgfN1ZHJ0ZRfUAX5wv8bkUrKbUCC3mNPBhzXses4qVQ01d4EY/KBMyR8JwJmMGw
         xW30BV13fBZRF6/sFC7t92JwlzGeXPoA6r677/JzZd5BlMy/fnYOBs+1qOYbeQeemULd
         AKRTxMJsMjBJ3eFQ+1+TeFAzLq8/RZ9JWqGthUU4ryk59MuXl0bzNiMMLjlqrBIKabbw
         4rxBQYZh5wmWqD4kq89+iI1UgmwsQfHlPts6uBCGxBTKDgI7dKwA695mxuJuBCozw8Wy
         PYM924fxM8i7qvtLkW6eIwzvU6SPZ56tuXkIdlLjXvi5Sm6Zrh7du/MUblV/W/TfXcNv
         xl7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q0B8IpGQETbsDt2QSoVxK+0KtGpKAy/A/fPRvO+p/8A=;
        fh=kLrtHV+1YZl5FZvyAFAKyZkRD/FygmFhjHZl53I0lX8=;
        b=V2mGg9yptAkf55qxnXHdMtTPNGTUy9ILH+4RIWBxly7DAWZl231j1hYu86Gh2PNBa/
         G6/m9HCUy8RowCdljaMvSXElTIg5gw6TcF8UaTrjN2nh0X/jMwolrpmj4WuIXpSMkd26
         UqJ9euTXl56TDq0zxaTgjwLjkiPyWQhPcCHNw6EGh/tPjIJ0bqbUUrCSU7gCJVl71GkD
         GfOUm3Jgslshdwx/ALpwL5udibC17HRCB3i1XQwwK0qXsMvvGkFsEKpE+9CynON2eEBn
         kM6uhjnYbtmaBhstHjMGT0/6pNSQCa/ZtSW4leK0ZWwB6fARyvpcRHiIWNp9TcNIuNpz
         odyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783529191; x=1784133991; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q0B8IpGQETbsDt2QSoVxK+0KtGpKAy/A/fPRvO+p/8A=;
        b=VFIIdveVJuZOw+2Rxgo2w6Jl7IwxTe0tdn3UxcpI9i/V2DNz5lbXn3IYyHmgM4OAen
         dCoT8uQgL/Q3D6Pd7othbYGYeZnvZhK09EwqZbmeOgINoPZ15vJS1rTf410nS9KfQqV/
         Haf/euYQ8qO/WeB9T6Ns5U/PVCbJQ6YAHdKVGltbyopY0eOCGRw3HtOO24OKTkXJoZ4g
         cyHy19AySDiRTlXPN3/5KJnI431RFDZnarz0kJmfUoQbKH+3tLqTnRyj8OVMlffPQf9e
         I/apprU5zHrTWXqyWZhsJt45nV6rHU0zCEnxhnu7QqXJd8/gK3NMT+DkvythO7+wrUbv
         0fSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783529191; x=1784133991;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q0B8IpGQETbsDt2QSoVxK+0KtGpKAy/A/fPRvO+p/8A=;
        b=sezziKc08RgmTm7bn6SeCkqpq7ebepDf1v4Ko7zBi6L+hkdMpkch55CvFhlmQ0apMM
         qHcsLjEG6Q91ddMKpQNlHvzfuBCIN1kTl4ApxAhrc04HfZ0KLf7jgsh9ioP3mSFE5yNo
         QucAd2hKNGX/9B5jQV0D9Ak42FVzh8T4pey1aBVFM7ItsFZkWvgC88NzwmAxJO4MQAwl
         uwQYxkN12IC3fwtrC0IG+eHq61Xp4bRCo7p+AzAe81b79NYzTGrYdddSZqwYii5GEPWx
         j7RvUfGKUMOBU/l/mA0PlyGngmysQ81g4MQR6h403lRj7oGSgEY4/FkacMvDIjtfgeKQ
         G3gw==
X-Forwarded-Encrypted: i=1; AHgh+RomSRhJecSo2Th2xmNRkW3NGYDSt/JALfQI5NF+ZMZcHfQNBG28r0LCMUdvuooTcAiFs+Z+U0tOfGXX@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq7BgeJb6lPaTphuKjU8DtrWyzEUJ1tBjNjeuPZaD7fHstPz05
	hu/nS6HDc5VugMkGbKLhLQPYPnk28z8E2lfxeEid3gookr4kspWvAYg7qmSPxZNS7JU8GteNaZ8
	0hsbGyMExNSoPuKkcRofKA6HN359dsUo=
X-Gm-Gg: AfdE7clqLPuPzxbby5yDvkzhC4QWCYAj+ymCRCK6UAC5COjfWFUsYJx3kmOtQl7yfJZ
	MEfXzFTAiTpwEJVPXRFlQncnpC6A7aX2K5cKshQ0bGeHoVAommr4sJxmUVkWA5Zd6A3to+C4BlE
	538O4nFykJonWzXBmCy91u7iK+DKj3/TpwHlXVhjzPzY6Izq6OAPBNy89WEjZMJPgXVk5RQLORz
	Onnhjzfk2dDOiunLEONtBBwGiLV5iXxcHLK/iDGjYCdPmkVUT4EOc++H1wkApSqCsPXo5TlZJwW
	0kxxCqO5H33hizOBvyX6+2gpgaz2HGaUo0iM0/JyknmrySj5A6WyOyxvexjSG4BLdnMU
X-Received: by 2002:ac2:4549:0:b0:5ae:b99e:4c39 with SMTP id
 2adb3069b0e04-5b0114790dfmr566950e87.61.1783529190753; Wed, 08 Jul 2026
 09:46:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260503-ayn-qcs8550-v8-0-d733f5e57446@gmail.com> <CALHNRZ-pTNGjm4S22VwAbwSyUw7+_LkE48QnssVDLALYi5Mx6g@mail.gmail.com>
In-Reply-To: <CALHNRZ-pTNGjm4S22VwAbwSyUw7+_LkE48QnssVDLALYi5Mx6g@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 8 Jul 2026 11:46:19 -0500
X-Gm-Features: AVVi8CeXVSsQQ4AYvmpaDNnr8CDxTLJczUfq-hCJxq5fQBESfMkATeuugJc1mhQ
Message-ID: <CALHNRZ9KT_cBhRo41NbnzPxHvRaBTdFNL2b7rcQP1brQfkbvzA@mail.gmail.com>
Subject: Re: [PATCH v8 0/6] arm64: dts: qcom: Support AYN QCS8550 Devices
To: webgeek1234@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xilin Wu <wuxilin123@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Teguh Sobirin <teguh@sobir.in>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2026 at 11:53=E2=80=AFPM Aaron Kling <webgeek1234@gmail.com>=
 wrote:
>
> On Sun, May 3, 2026 at 4:49=E2=80=AFPM Aaron Kling via B4 Relay
> <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> >
> > This specifically includes:
> > * Odin 2 Mini
> > * Odin 2 Portal
> > * Thor
> >
> > The original Odin 2 dts is not currently included as it has not yet
> > been verified.
> >
> > The initial port was done by Teguh Sobirin for ROCKNIX and was made
> > available on the AYN github [0].
> >
> > Support has been removed for things not yet supported by the upstream
> > kernel, these will be added later when the related drivers are submitte=
d
> > and picked up. Such includes:
> >
> > * All panels
> > * The Odin 2 Mini backlight and touch
> > * All rgb leds
> > * The built-in uart gamepad
> >
> > [0] https://github.com/AYNTechnologies/linux/commits/sm8550/v6.17.5/
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> > Changes in v8:
> > - Properly order and format amplifier properties
> > - Set amplifiers name prefix to Amplifier L/R
> > - Link to v7: https://lore.kernel.org/r/20260430-ayn-qcs8550-v7-0-591a9=
6735fa3@gmail.com
> >
> > Changes in v7:
> > - Add back pinmuxes dropped last revision, but without output-low
> > - Link to v6: https://lore.kernel.org/r/20260430-ayn-qcs8550-v6-0-06a7e=
7b54aaa@gmail.com
> >
> > Changes in v6:
> > - Fix comment style in patch 3
> > - Drop a pair of unnecessary pinmuxes in patch 3
> > - Lower usb sbu pins drive strength in patch 3
> > - Link to v5: https://lore.kernel.org/r/20260408-ayn-qcs8550-v5-0-c90ab=
eb7a152@gmail.com
> >
> > Changes in v5:
> > - Fix some style reviews in patch 6 which required matching labels in
> >   patch 3
> > - Drop hdmi support in patch 4, since it doesn't work
> > - Link to v4: https://lore.kernel.org/r/20260323-ayn-qcs8550-v4-0-33a8a=
c3d53fa@gmail.com
> >
> > Changes in v4:
> > - Fold vendor description patch into the series
> > - Link to v3: https://lore.kernel.org/r/20260322-ayn-qcs8550-v3-0-4afa8=
9c20888@gmail.com
> >
> > Changes in v3:
> > - Drop unused backlight regulator in patch 3
> > - Move zap shader firmware to standalone reference
> > - Move i2c controller enables from common to devices
> > - Add ABL dtbo workarounds to patch 2 as per:
> >   https://lore.kernel.org/linux-arm-msm/dczz4uvcq4hc6p3zb6xnrsgmfeomwli=
agwhf36tewdz4z6mndp@afbxzhjziiwv/
> > - Fix multiple property alphabetical order issues in patch 2
> > - Use interrupts-extended for pwm-fan in patch 2
> > - Ensure blank line before status in patches 2-5
> > - Rename spk_amp_l/r to amplifier in patch 2
> > - Remove a few properties that are already in the soc dtsi in patch 2
> > - Order tlmm nodes by pin index in patch 2
> > - Drop qcom,dll-config from sdhc node in patch 2
> > - Drop dtbo support, convert common to dtsi, and include it directly in
> >   device specific dts'
> > - Link to v2: https://lore.kernel.org/r/20260311-ayn-qcs8550-v2-0-e6698=
6e0f0cb@gmail.com
> >
> > Changes in v2:
> > - Drop awinic bindings dep as a duplicated patch already exists
> > - Change Co-authored-by tags to Co-developed-by
> > - Drop alias to currently unused uart15 in patch 2
> > - Link to v1: https://lore.kernel.org/r/20260311-ayn-qcs8550-v1-0-fe8b2=
faad1ea@gmail.com
> >
> > ---
> > Aaron Kling (1):
> >       dt-bindings: arm: qcom: Add AYN QCS8550 Devices
> >
> > Teguh Sobirin (4):
> >       arm64: dts: qcom: Add AYN QCS8550 Common
> >       arm64: dts: qcom: Add AYN Odin 2 Mini
> >       arm64: dts: qcom: Add AYN Odin 2 Portal
> >       arm64: dts: qcom: Add AYN Thor
> >
> > Xilin Wu (1):
> >       dt-bindings: vendor-prefixes: Add AYN Technologies
> >
> >  Documentation/devicetree/bindings/arm/qcom.yaml    |    9 +
> >  .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
> >  arch/arm64/boot/dts/qcom/Makefile                  |    3 +
> >  .../arm64/boot/dts/qcom/qcs8550-ayntec-common.dtsi | 1764 ++++++++++++=
++++++++
> >  .../boot/dts/qcom/qcs8550-ayntec-odin2mini.dts     |   44 +
> >  .../boot/dts/qcom/qcs8550-ayntec-odin2portal.dts   |   84 +
> >  arch/arm64/boot/dts/qcom/qcs8550-ayntec-thor.dts   |  227 +++
> >  7 files changed, 2133 insertions(+)
> > ---
> > base-commit: b9303e6bff706758c167af686b5315ad00233bf8
> > change-id: 20260217-ayn-qcs8550-16c07b63de26
> >
> > Best regards,
> > --
> > Aaron Kling <webgeek1234@gmail.com>
>
> Is there anything else I need to do for this series? Or is it just
> waiting to be picked up now?

I see other stuff getting picked up now, is there anything preventing
this series from going? The one outstanding comment is about things
that could be fixed up during apply.

Aaron
