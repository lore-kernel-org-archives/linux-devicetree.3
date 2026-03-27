Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1B43E6DCA;
	Fri, 27 Mar 2026 11:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774609877; cv=none; b=KLNq22rzMF75B1bg0hq2CM2KL13FX0a0+V8pn///k8VIoZ03z6Qunw7CeuMDzwRH0WQhJCeC6hkY7AHxUriNlz79t9Ysl9HYUJx53dowzHq5Xy+W0rXILGJNZ6GdSl50Yc1oGp1dWXhHF6ECgDUeJySkjVIs0BcwjLQzKBuhnAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774609877; c=relaxed/simple;
	bh=3nBtiYIBfbtR1UVhgZCCLSds16OY7svN3Ixw85XvfnY=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=RiFysnmVRxk5mIjVvYCs7QWTWC5vx+r0lAxRqjh6WjnQ8uUPZXf5K5Tsuc504ImUNq14U98tWk3zeiUBxM2io48dy4TMt6D4Gv+/DjpcWqsO5qoR3QMofG160JkOk/a1CcgAM8m42X6CwV88tnFHr40u9c2+rSKzui4WRJ7d8p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QcXKRcXh; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QcXKRcXh"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 737A51A3027;
	Fri, 27 Mar 2026 11:11:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 39D2B60268;
	Fri, 27 Mar 2026 11:11:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3595710451181;
	Fri, 27 Mar 2026 12:10:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774609857; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uaddvsqeBxfQg8ZFF+9WrVWTTN5zZO7jWmNjN5mUHYY=;
	b=QcXKRcXh/LQwEKQNq1e3900191plHXs/2AIGYTIsYCbX5NDojOzM6NymUDdF7nu2XUjgj3
	AvpfZZqeU0WTeyxwvmjFVJTXwET60EdtRu3lqOP/LoZWUl5OigUPWnhaihxXezh8AZmWjk
	JlMZtiSiaZQNsQFrCI5Slw88VgmDT7brvGXTuM+b0vSxhaKpHaabKg5tTiqsJ5Cn0itEAg
	IGwRgh1Y+0evvGd6JBXrZXOOFn8snB0+vJHAuQG9XAAbEvFlNPs1VUzPxOgzgszzGkqbiV
	pff5KR5AxDa/3LPQcrGL/Hs17T003DRrjWi/XQzfg7z7ToSEaYfzIY9DyS7bcg==
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Mar 2026 12:10:46 +0100
Message-Id: <DHDIOSVSDG9W.B7BW87297KT3@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 4/8] drm/bridge: dw-hdmi: document the output_port field
Cc: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>,
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, "Hui Pu"
 <Hui.Pu@gehealthcare.com>, "Ian Ray" <ian.ray@gehealthcare.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, "Adam Ford" <aford173@gmail.com>, "Alexander
 Stein" <alexander.stein@ew.tq-group.com>, "Anson Huang"
 <Anson.Huang@nxp.com>, "Christopher Obbard"
 <christopher.obbard@linaro.org>, "Daniel Scally"
 <dan.scally@ideasonboard.com>, "Emanuele Ghidoli"
 <emanuele.ghidoli@toradex.com>, "Fabio Estevam" <festevam@denx.de>,
 "Francesco Dolcini" <francesco.dolcini@toradex.com>, "Frieder Schrempf"
 <frieder.schrempf@kontron.de>, "Gilles Talis" <gilles.talis@gmail.com>,
 =?utf-8?q?Goran_Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>, "Heiko
 Schocher" <hs@denx.de>, "Joao Paulo Goncalves"
 <joao.goncalves@toradex.com>, "Josua Mayer" <josua@solid-run.com>, "Kieran
 Bingham" <kieran.bingham@ideasonboard.com>, "Marco Felsch"
 <m.felsch@pengutronix.de>, "Martyn Welch" <martyn.welch@collabora.com>,
 "Oleksij Rempel" <o.rempel@pengutronix.de>, "Peng Fan" <peng.fan@nxp.com>,
 "Philippe Schenker" <philippe.schenker@toradex.com>, "Richard Hu"
 <richard.hu@technexion.com>, "Shengjiu Wang" <shengjiu.wang@nxp.com>,
 "Stefan Eichenberger" <stefan.eichenberger@toradex.com>, "Vitor Soares"
 <vitor.soares@toradex.com>
To: "Damon Ding" <damon.ding@rock-chips.com>, "Liu Ying"
 <victor.liu@nxp.com>, "Marek Vasut" <marex@denx.de>, "Stefan Agner"
 <stefan@agner.ch>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Rob
 Herring" <robh@kernel.org>, "Saravana Kannan" <saravanak@kernel.org>
X-Mailer: aerc 0.20.1
References: <20260320-drm-lcdif-dbanc-v1-0-479a04133e70@bootlin.com>
 <20260320-drm-lcdif-dbanc-v1-4-479a04133e70@bootlin.com>
 <050c6532-8122-4ded-9946-3ce1a86d2be0@nxp.com>
 <ea1bf890-c4be-4d66-ad26-a6bdb58a9292@rock-chips.com>
In-Reply-To: <ea1bf890-c4be-4d66-ad26-a6bdb58a9292@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Damon,

On Thu Mar 26, 2026 at 10:15 AM CET, Damon Ding wrote:
> On 3/26/2026 3:25 PM, Liu Ying wrote:
>> Hi Luca,
>>
>> On Fri, Mar 20, 2026 at 11:46:15AM +0100, Luca Ceresoli wrote:
>>> The meaning of this flag may not be obvious at first sight.
>>>
>>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>>> ---
>>>   include/drm/bridge/dw_hdmi.h | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>
> First of all, these changes related to the DW HDMI controller work well
> when tested on RK3399 HDMI.

Great!

You'd be welcome to send your Tested-by: tag if you tested the series on
hardware, that would be useful.

However at this point I suggest to wait for v2, which I'm sending soon, and
test that. I added you in Cc for it.

>>> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.=
h
>>> index 336f062e1f9d..45f6ba1a8ee1 100644
>>> --- a/include/drm/bridge/dw_hdmi.h
>>> +++ b/include/drm/bridge/dw_hdmi.h
>>> @@ -126,6 +126,11 @@ struct dw_hdmi_phy_ops {
>>>   struct dw_hdmi_plat_data {
>>>   	struct regmap *regm;
>>>
>>> +	/*
>>> +	 * The HDMI output port number (which must be 1) if it is described
>>
>> I'd rephrase:
>> The HDMI output port number must be 1 ...
>>
>
> Yes, the output port number should be 1, but I found that the output
> port number in the Rockchip-side dw-hdmi driver remains 0.

Really? I checked all the bindings in
Documentation/devicetree/bindings/display/rockchip/*hdmi* and all mention
port@1 as the output port number. Can you point to code using port@0 as the
output port?

Should it be true, that would be unfortunate because the output_port
variable does not handle this case. It's used as a sort of bool-or-int
variable:

 * as a bool [0] to find out whether the DT is supposed to describe the
   output port
 * as an integer to tell the port number to parse in DT [1]

So saying "please parse port 0" is impossible.

[0] https://elixir.bootlin.com/linux/v7.0-rc5/source/drivers/gpu/drm/bridge=
/synopsys/dw-hdmi.c#L3310
[1] https://elixir.bootlin.com/linux/v7.0-rc5/source/drivers/gpu/drm/bridge=
/synopsys/dw-hdmi.c#L3315

> Therefore, it may be better to adapt the dw-hdmi drivers across all
> platforms to the bridge-connector architecture simultaneously.
>
> This would allow removing &dw_hdmi_plat_data.output_port and unify the
> setting of DRM_BRIDGE_ATTACH_NO_CONNECTOR during the attach stage.
> (Just as the Analogix DP driver does [0])
>
> [0]
> https://lore.kernel.org/all/20260319071452.1961274-1-damon.ding@rock-chip=
s.com/

I agree converting all users is a good goal, but I disagree it should be
done simultaneously. There are various users of dw-hdmi, and converting one
having the hardware to test it was painful enough for me. Converting all of
them without testing on hardware would be a hell.

However I might be wrong. Having a precise list of all users, which ones
need to be converted, and whether they have any special detail to be taken
care of would be good to estimate the work to convert all users. Without
that I'd rather let users convert one by one and hopefully get rid of
legacy code eventually.

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
