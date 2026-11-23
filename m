Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795416166;
	b=jd6jH1DEplh7kFeJZe2CdgG8XVtUST2RSKFyQvuLd1dOzf9RqMuCmUka+z7c5jsJdrt/
	 wg7YkfU4wwshNqIPoWS34T+Xaq3W0qPTteVKQ6NPbHJ/Pki16Xjj5L+n5v1+A71UkySkw
	 pAcMqGNo8jgQxHf6WN3+6wHBsL4R6kpFp3bW4pIQw0npCKewFAT3vqGj4snGTylUjTTTx
	 M/MP9ox8MdlM0f8GSkdgLTKc9CXQOaoxEu/PQfeZm4DXURCxPOeZ+uaingkmZf3+gUrOE
	 6pBFGXtghRXzKuf7bX6CqPUL8z3ew+PA771Sm/WbhWBlZQbGDzCWeWWLij3zVFefQ4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795416166;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=naTtgcRj/MertQfpVKpr5lkSMEaf2WtEA0kcdQKCaus=;
	b=qW1n50WNYT03Sf25142lVRrGQQ9oxFE961JE5CdITIQqoT+8sqNrdyhrk+XebRr19Eh6
	 rH7zqUAHLM/ipMs43YSpIy3fQby0BjbOxIJreyBYYY7x0f7225T0PnN+mjDYmRPJVp+1P
	 u177iYEShBsRt9+aOmtKznKepYyAWTwhD6xAMd6k/49in8EGyGSWGp/1/C1IRrHaQ+Pco
	 CdkHdCTmKLanjOZGLjGt/hq/1bz85yzMrSWdICGl0c0oKdevGgN6H4fWX/gfySE5d6oUO
	 cE+NOXwjJX2ABy50Cm3Z8XUFHc0wi+iZl3XmSKU9Z5BhFNSnT5RhFNlL37Pyclq8q2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ScVPpVXT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026AA606A327
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:42:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 026AA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ScVPpVXT
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b0d126f631so22831157b3.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 22:42:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795416164; cv=none;
        d=google.com; s=arc-20260327;
        b=SJWTqSzQGOIH1i5qAgL+7TDBdzFUf7nhRP7z62zOoHcY52LvyFvoQWBke2OSm5u5pX
         PLu7wUsTcaPzLSDYZRw9du6fAcn6knAbMZeqkkHnnUu5OnN6rba2QtfGBu3iPxT//yZa
         K5ahOVGYjBXdQ4SHSq0wF1EonSJrEl/kIiQfZpxkvOWU/vycfabKTlZbRUWsi9sgsCfS
         pYiIABRvxXeJJqztjdCtmmYfTmaWLqRDPK7ohB7oUkQof2ZxGbt15jwyaKzsxRt95GxF
         W0AjSJbtFNFKPNYTz7PTc5PGkylG4CAlxOp+B6u3ayiT0TBBLMaX8RbsvoFcmcAN4yMH
         V7Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=naTtgcRj/MertQfpVKpr5lkSMEaf2WtEA0kcdQKCaus=;
        fh=MkhXuAFdnnyywNN6WA5ZY+g2Fnx0wwc7WJY4hPYLcNo=;
        b=odUlQLbcy7QtPdMa9DebdMNtL7ZS1aEzf/GoTIeTP65AG/jPASa1ier/yVq91RLz3+
         ZihYeHf0Re/hB2FN5paMqYDytdCwjJ24549bNaIcflg10E7JXwwSUqkAaPVqruqRG/KY
         SNYnsz0Jh132aEI8AZw4aD3mtdheYffgVH2NmNevzBbcD8l7Riamjsu6enLHVvP5iACB
         EfwchMzXX1cr3ioU/wjwh9vev8V2lLuOdtzosIfcP6GbvQ/47Khx/rNDKXd5t4cZ5r38
         jKjk9UDaBgI18PBrxIxEIGDFVip2yHm+W951bRvQwWVl/Y/ZI1R7CV6Fy7wp0c5s9RPZ
         UTQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795416164; x=1796020964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=naTtgcRj/MertQfpVKpr5lkSMEaf2WtEA0kcdQKCaus=;
        b=ScVPpVXTZPlEkXMOVmOrpFrbcx18M4yy08hKdSrknGePgEsA0KYlK1JTjkk8liiJLi
         en8EFA/UOSUydUn7tdFUr0OTU53c8TrzHtfc7GJjHfLX4Ohd6yADP8zoasW3nR5u+PZq
         yi2p9rTbYLEFcbTnKsp7Phu5W6LA/kca/ozPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795416164; x=1796020964;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=naTtgcRj/MertQfpVKpr5lkSMEaf2WtEA0kcdQKCaus=;
        b=MNH9BANQ3LnbNj+GEC1judjim+akNCVrUKnk3iqBxDf2WX84TGrGCG/l1Ro9OPL+3f
         23YT7sRGcDCxxhdGo+W5LUlcpmYt8Ti/c176pzuCTJ90YbOcD0QIee7dH9nzSE62QT83
         WOC25cD6spejoWWKiR5icazrQ6pbvZoNj9IEVs5WK60xD4CIl4RnP7IZPRoC7Yqllhfa
         gO/itcf5ansj62Mn2HlQsCW8rEp+Dkr6K7r3O8Z/dsNmsqaUggxgaNJNxsbMbnUqcDUs
         WEtRQP6e+iGXQplMUeruNY9ExGwFQLybLoM/HO87t9vMjY88DHqAkzGE/x1hhAQM6ipy
         rkMg==
X-Forwarded-Encrypted: i=1; AL+hErEaTliHXGzGUSYkTszULLKRtbMxWIIGkiT34DAj277pvrs09aTVf+ZmBfgAzNHpKOJzlJ1+lAuujJhV@vger.kernel.org
X-Gm-Message-State: APuU4Z8AAvtcHgpftqVOyu9llgCTOyPpZsMu+p8NCIiXm8OXaHYOVuEb
	Al1bkleqWykS5tMbQ+rTUKQar0mJvSG0s4rxFBOlHmWrgco+vB8RLpm216xLgjhoOyAYlf89fpr
	zyq6W1fDH2yWLGV+dtAWb+5YAle+ZslrExAyG6GHf
X-Gm-Gg: AZFdTZdrY+3ugOlSfBMqascX5zylfMwZ6AnyPh6/aWsQSuAqzNuuu7SVnjwbaNc8Wnr
	9f86nOO7BL+TiyvQOv9uCoWEXzjlGmw8CuOfg8NFIXTYmD7I+0+nmOjCm8IqPWi/4WjBABfxnwg
	/gie9LFpTIEiwrVM4fuu8MnqW1TRmJyWpMUhHGEHXRwLCLY+WGlXgm+AweYSsysV/VDj7xxR+Lt
	XOXCKE/OPIl4j1xIRWqq/2MdFZ1FB/AX+iMOT+MYmFvEQILN498pufzOvZzm3ZWdVU/7rSyFM1C
	GFr0d0ATqmyajCI6wav69tQH0x1BFkiPp69GRDveuxWMbZ/EzKlea3jY5KAmePdGxgYpKQhkPC8
	b7IxhCaSIPca6Xon+RXLnz155PE1a8sG4qSeUkkeKzD8W9pIIWl7I1m2YcOyi4TbxQbo=
X-Received: by 2002:a05:690c:9c02:b0:8b2:bb94:8cb2 with SMTP id
 00721157ae682-8b5204ac257mr41593057b3.35.1795416164019; Sun, 22 Nov 2026
 22:42:44 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103043734.2179858-1-wenst@chromium.org> <20261103043734.2179858-5-wenst@chromium.org>
 <avLw2AiqcnO9Blun@shikoro>
In-Reply-To: <avLw2AiqcnO9Blun@shikoro>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 23 Nov 2026 14:42:31 +0800
X-Gm-Features: Aa3M54qFQQaP0XRNtPCyFnaJIa2pdaKUHFg7uIqYmbd3iYo_i21tDqRJOm5IHRA
Message-ID: <CAGXv+5F5hf_8U6j6tJ1WcS6gUCiA82ny+6DXPv12g=vUjwYUhw@mail.gmail.com>
Subject: Re: [PATCH v7 4/8] i2c: of-prober: skip post-power-on delay if
 powered on sufficiently long
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-input@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andi,

On Tue, Nov 10, 2026 at 6:24=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Tue, Nov 03, 2026 at 12:37:28PM +0800, Chen-Yu Tsai wrote:
> > On some devices the I2C component is powered from an always-on power
> > rail, or the power rail has been left on by either POR defaults or
> > the bootloader. By the time the prober probes the device, the device
> > most certainly has finished initializing and can respond. There is no
> > need for the delay.
> >
> > In such designs, the system integrators tend to work around the delay
> > to avoid the boot time penalty by simply omitting it from the device
> > tree and the component prober. This is undesired, as the device tree
> > is not fully describing the hardware.
> >
> > Switch to the new regulator_enable_and_wait() function that makes sure
> > a certain amount of time has passed since the regulator supply was
> > actually enabled.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> @Andi: Chen-Yu is the maintainer of the of-prober, so I suggest these
> changes just go in together with this series.

For this series, you'll need to first merge in a tag from Mark's tree:

https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git
    tags/regulator-enable-wait

This tag provides the new regulator_enable_and_wait() function this patch
depends on.


Thanks
ChenYu
