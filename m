Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE2C3CF21A
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 12:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786363738; cv=pass; b=LSjgvEZz5PX5rgsVRnnsCEnZMwEDhX9LJOWqUvJ2lvmgs7lx1pzpkt75KqSHx8++H/XA8Xaff9UbRPInrjtnYoLz5ySzOwGUfVWaAHL+iuiDgfRWmoV5iT/T2KDrL+tgFV/i2xXv8rmM3HcyZp43OQ9CYcVreVRB+gVhI4vxi+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786363738; c=relaxed/simple;
	bh=4x7/mdtXQLT59Q70dDWfuaazR5LzKPv7RIwA1ytZYnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tk/r/WEI819QDfavwjkjP6TQT2x8us9jRPkqqBCO79beeY4GJ939LsgRWCgwJkNph6IYLw0OALh6AznJ6JU0uedBCkWZ0XmO6WREtUkZDlFProTmeEkpR1Er9QgLntUkzvM6UTkDGwPiKzUlD1CF1OjZzd3cZ8GNsy5bqcbZhtw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=WAPDdWoU; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="WAPDdWoU"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a17f91so2760635a12.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 05:08:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786363735; cv=none;
        d=google.com; s=arc-20260327;
        b=aw3MWSgPtPqU804/KqhGJz7LFr+uu7pH4XEBEK+wlPoAA13d20Kygy9QjFLi/CnPB8
         Y88AaswKYhLbYcIYxtmT0xU9Ikq5wItZq4XIARoDq0WvRTZC2ZahuVtlBdndLXvSJDM9
         t+MdurlqiLbvj41iKmLKZ6THU7rbTq4cmp5yhREqoj4NQJFaaw10eCkJvE27q90nSWeS
         WxpThxnMhI0n5O+yHo01nIaei2J78UxHkmhNMSZyO3AjL+D/Dob+JOkRXa0sqR/1SSXz
         oacUzU3K+Rt0LUnP81mSDEAdpNasMz744GkbK9GOHg7Nv6sdUsfpS7PykqEA1nsOZuHP
         yIXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qQpWbJttwi61w+33UaX9aual3LIjiZRDlQt6M32wCuQ=;
        fh=n2mTGVB3q9SfL9tsilV2uL6aerI/wuHhSqCTjAhi2Cw=;
        b=n4vnlCtfBBeLvtxipCPXHxdrFAl0wTmMMA2qFlJko/iLtC6fL3zs1RtF1QXZ02Ru3w
         77TGPVdD680R1vFiUo4Ne6dka2SKeUbsJMaKwdQsOE/+PtUxmqPLxgSRWhqYWY4kzsay
         a5X9i+2pE5S7ZYXrE9G9GJs453sSZW6fu+BtrYrrIEM8oDfsObQn8sPGUTjP6aeI/mBo
         eocZybU8SKereW0VfboyahSiYj0WSDa7GWmjCZd4PkZliIUq8mlDPEuYRQcjxHB0FFwp
         K2mb6FqbaYzHOgjAa24lhwAMJ/BFixxU7Ho4hgQz87uF16B/ejDLRAzhKbJhjO9KxbQJ
         9StQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1786363735; x=1786968535; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qQpWbJttwi61w+33UaX9aual3LIjiZRDlQt6M32wCuQ=;
        b=WAPDdWoUox/uC1Y87Pp3z4l48HUzt0ZfzQ9UnpKIa4de/DJ5pqVO7OfST4tTG0Dvca
         SdKP3z/3FdsTGQ7XD0A6jSXZEnm6O71pO0MnK2UrkJM1Atgu8+LZk0zL7oOCv8mBkvit
         DVIQQcCh0O+hw9IwJlwfI0soJ5UR1tGMSBrwzcBFIL9kZ2fAhVjGowHeZK4KPRuGMQ9Y
         1QkxPFTD26tmty1EcO7NY5SUCiqXF72xLPD8ZRhMO4NeSIbb1rv6UpvRvxRtDK9oeQCg
         u7ig7optyUT+iIRPAVrL7sj/qN6sL7a3ygmHso6QhUmDlVEWB8w6DPbFJ+hfXk7IZi+4
         jKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786363735; x=1786968535;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qQpWbJttwi61w+33UaX9aual3LIjiZRDlQt6M32wCuQ=;
        b=Xxy11SXjOxcx8BJb0eFh8sKkVP8D19JpcsgqmSbhaBh/k66Wmi8d4DV826XPl3wIwk
         3+c8e/rjAxv+aT+Q2aBWupl0c8e9tbLI05KKHYpG3DHysj7KsRrtsX8IDcxBQSvxCNw4
         eWt0jOWfE6al0tlo82GmtaDKe/XkftD3KwoDgD4yfJ84Qfi60x8f7YI7hznclkNaKgZA
         hblePAUkTchnq8ifasCcjjlOzc/PsKqTWRObt9ipqzcWhyT1yC5ztTkv5O5OdQsF8zH/
         z456jACCrOrj35foydtev9asSp7f17lFPvAPUMizI5fraFETw7zrL50QfRPN46dZf3Yg
         9xLg==
X-Forwarded-Encrypted: i=1; AHgh+RrxBKSJNyIRRk5TCRwbJAyA/xhfprtH4WGDb3oWJbwZndhlhnoW3pWUSLC5eF4g0sJ4PXayG0C7XfIQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwyuKvphwsu2KFgpGBYm1Ay0mODC0thWrpXZLpaG3JUa3nQbnuB
	k68xp2Oy1wHRdNGn+3O7s79aRfiC0IleUx8P/ml7OMysDyguq7oWxgkr2pp52WFXOwHX21zJ6T8
	LUaWbcIykynlGJEw5GWeY5pCWKzIv1F3HN4AnDVQPUg==
X-Gm-Gg: AR+sD13kHTtucZgOuELvulJHFtN/styYqieAYOajrdvtNargWXJoyGxrBFvB9I/lUuR
	maipxFdLiTK/a2PWt1ebaZP7HYvBxgXy2C+OQn/AgOmzWNTnEweXrhtksdlH4VraXkioYaIfBhG
	lCThA0esuyf2uKjt+r8tIoTQ38te/rkr+af+UKuFTBsfIPWvF6FcWISJ2dUPf+FUYe0+nempJkk
	L9wvdOgqg/fPVqqsjPrWK1tzhnss3ufplSXwTIa+QBX7JkI08VHzCsL00wWyiAAQ3z1JWZEYeMV
	apwc3fOo4xrd5x4Vjamj/UeUMnnzRuyr94ukybpE/D5HxrGGKtKYkafP2jgkOxyFGcVOvY/eIV4
	y
X-Received: by 2002:a17:907:728b:b0:c1c:4858:251a with SMTP id
 a640c23a62f3a-c20c6782f60mr50310366b.8.1786363735166; Mon, 10 Aug 2026
 05:08:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
 <20767137.geO5KgaWL5@diego>
In-Reply-To: <20767137.geO5KgaWL5@diego>
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 10 Aug 2026 16:08:36 +0400
X-Gm-Features: AUfX_mzk8t-Db9KtlR_l-8Y27DWWGagvh3frNOmzayIZmNSq8DatjvUHckrxFLI
Message-ID: <CAKTNdwFPhVrjb4iVpN19f0Nw+MA_BxXLOLs4V50fuyf+_rbEPg@mail.gmail.com>
Subject: Re: [PATCH v11 00/21] Synopsys DisplayPort Controller improvements
 for Rockchip platforms
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Damon Ding <damon.ding@rock-chips.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@collabora.com, 
	linux-arm-kernel@lists.infradead.org, Sashiko <sashiko-bot@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Heiko,

On Mon, Aug 10, 2026 at 3:49=E2=80=AFPM Heiko St=C3=BCbner <heiko@sntech.de=
> wrote:
>
> Hi Sebastian,
>
> Am Donnerstag, 6. August 2026, 19:02:06 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Sebastian Reichel:
> > This patch series updates the Synopsys Designware DisplayPort bridge
> > together with the only existing user: The Rockchip RK3576/RK3588:
> >
> >  1. Follow-up bridges (PHY, USB-C connector)
> >     This is needed to get USB-C DP AltMode working; I've followed
> >     the Qualcomm driver as reference
> >
> >  2. Runtime PM
> >     The initial driver has been upstreamed without RPM; add it to
> >     avoid wasting power when nothing is plugged
> >
> >  3. Audio
> >     The initial driver has been upstreamed without audio support;
> >     this adds all missing bits for audio with single stream transport
> >
> > To properly make use of the bridge code the following USBDP PHY series
> > is also needed:
> >
> > https://lore.kernel.org/all/20260714-rockchip-usbdp-cleanup-v13-0-6cb3e=
769d4c5@collabora.com/
>
> I've now had time to test both series (dw-dp + usbdp) :-)
>
> - On my 1080p display I get nice output
> - On my 4K display I get "some" output after increasing the ACLK_VOP to
>   750MHz - although the output itself is garbled. Before there was no
>   output at all

One more thing likely to go wrong on an otherwise unpatched kernel is
dclk. Could you please check what pixel clock your 4K display mode
wants? I bet it's not the 1188 MHz the default PLL configuration
provides.

When my colleagues and I tested a previous iteration of these on over
half a dozen Type-C monitors we could get our hands on, I had to patch
a whole bunch of PLL rates [1] into the table, and reparent the video
port clock driving the DP output to an otherwise unused system PLL
with fractional capability (VPLL in case of RK3576). I'm not yet
trying to upstream those rate changes though, because our prototype
board, which we were testing those on, had signal integrity issues on
two out of four DP pairs, so they need additional testing.

In my experience, any dclk more than 0.1% off the rate required by the
display mode is very likely to produce a blank screen on DP.

Garbled output sounds more like an artifact of an overclocked VOP2 though.

[1] https://github.com/flipperdevices/flipper-linux-kernel/commit/a4c8ce773=
b069672f0dd4ecb79711bc7d3319b38

Best regards,
Alexey
