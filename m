Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5D6418341
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 21:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786482966; cv=none; b=WHtGj0H7VP4JgtT164Jy+TIoNL1ZMuwWCqLtfxR76TCcZFiK+uP/cvK9KY/R2wL4eeSqnQRy7wXjAZXQfRHk72CqG0JFK5X8Uce+leiEYS6i9RbcItwYMhnOHnwOMxi/J9rTiE5ocBhRdp7D9ljM3QB+PW/wJPtx3/npfkG+JsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786482966; c=relaxed/simple;
	bh=LBQl7UXFu5mAg0XS4lfJyTNMzwcs8EJayseYRo78aUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q9KMdDsT/8vc2OvaNyjv2v/EGxFKJ3UxEvorTI1jNLekfTOyepNtKvtT411I8awSPl4fw/amEoIdhVkK4HIFZUx0HHvTOdbQQeCy1fb+AgvUukMgng5cU39+mvzOwypN80zvSa2f2rZrKU83Pb7dUCZfyaZVL2Hk7XCW9/MbFz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Heg9i0U6; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Heg9i0U6"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-495773ee3edso290255e9.3
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 14:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786482963; x=1787087763; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6aQogsOegT+g6QZpcciAxI27XEPgO8Du/rqMWdvlx5I=;
        b=Heg9i0U6BaLhnHBw+l2WkCvQSGKi+/qts2VsF1xUj2SDsx9T0yFD8wmqDhL2XbKVi2
         e0a1tbtW4vJmURlxn15qposvWZM0cqJ0Zddykx8g+SnAS6wcsf+yR1z26MEEYfrE4BeD
         i0ElbmrSXnTYqNoDKM3gZtatk4gKao9xkGkQt+oYbOIgR0SX7dfTrBRa/lvVYlyAqluJ
         Q8cgZKuS4j6nZ9mT99hRroQCljYqubd/K1l9mFBLdTgB1/ckCD51BoS1cbKA8Ja9PoMB
         CW76llEt7IV9S7PeHYm8uTXNNDLokXWHnlBmTrO5wQpR9Fl/T5gp0V5zMkHXAgQ21+s4
         vyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786482963; x=1787087763;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6aQogsOegT+g6QZpcciAxI27XEPgO8Du/rqMWdvlx5I=;
        b=rqveLRPd6JWB4MgefoqhFKHxAbreTC4Zp/94suHONlf6J6eetp8zQq7lmZyCKNotmP
         f2afs4QPECatJyFeHzkwKLD267UVXitVderUXyL0tgjHx/1niKpXEjLffHzbADYPfqs5
         dZVv1bInEUUgoY7QSyl3G9A7ploAymLITRtfQHKVAVx3bucNZFU136jVNAfeyOm/fEEj
         VvGFW0L1QMNhMo5OBlm/qfYUDVFDqsZFkfA0nSzUxuAcpKLkWrkzWPBt5CDVugz4cZ13
         3j9XzvRDDryIhvv+MsmmJnncTqRWVMHUQk7bssqIg2cOVbnJzdZk2FdSFz50D5SYSXIh
         IRYA==
X-Forwarded-Encrypted: i=1; AHgh+Rqu2j6cg2+jWOxxCc+M3GUmyG+Mzd+B7h5EYnVqAtlV+/ialDkKcVwm+Pm/u88OXbtOjfXosHvtRdIT@vger.kernel.org
X-Gm-Message-State: AOJu0YzFlx+hP6HGMjVzr2l9FtUzsxkLJBiOJTP/oiVtGv8LeVWTZyaj
	SIuTfhIPB6KQcrPtsDnOR/uhnLZ31XN/xCYibLk1s7joKPRmaAJFbZnJ
X-Gm-Gg: AR+sD10QX4ji8hgt/953KPQHBrAatx1KZadqSssb2EUdnV0UnzGeC0ed9Nc7mgbjpc/
	6o5f9afPscB2CcTImJVwTgEspd5ehr/KWH4ICn+DRzSfO+gKp8qbLUy/gd1K2EoVFUgO6HQKQLV
	ldPfRcAZRb+nUCKdZ7QMRZz3yPPNClPEJx18Fetdp5teZxhe9ekFPlVWGuprxAVR37LBwiDA6Ru
	e3NwkyZxla3MNNoE5uPidrFBbhJuI2IvAyRKCyDC1AS6N9C6mFbrsaZ/GGjgk4f792k/m58aPSh
	da9ruOqNDAxA6XhlC//dxsm2UshbBhgMNbq2DWuZE6Ia+v4fzm+yDfu+yDuWtJczOQUCOSE5m0o
	ZTGrq8U2z3h34jWaIK9SRqgPDDOKGREkNBniokJAmQpyLv4TPeI5FyVgDRpfsNOr2YQkw/a8vVU
	dOZVhHwMVVOj+bOJTH1KM8n09cKL0GKnvKRLWMgrKKwa/g5XmalkX9+Js4004m5kfky829jsZN/
	roT4Rvv7W/Ic/dApUgc+gGV3dozV0T79gwhOAI+jAZKhh+FPrlrIWu1mR6H+CMJ3Any+g==
X-Received: by 2002:a05:600c:a48:b0:499:73ca:c419 with SMTP id 5b1f17b1804b1-4997c12c6c7mr634725e9.4.1786482962800;
        Tue, 11 Aug 2026 14:16:02 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B94ED005B06BF1B5A09FFE4.dsl.pool.telekom.hu. [2001:4c4e:1b94:ed00:5b06:bf1b:5a09:ffe4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997aa96fb5sm19488225e9.3.2026.08.11.14.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 14:16:02 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	dmitry.baryshkov@oss.qualcomm.com,
	luca.ceresoli@bootlin.com,
	p.zabel@pengutronix.de,
	sebastian.reichel@collabora.com,
	cristian.ciocaltea@collabora.com,
	damon.ding@rock-chips.com,
	lumag@kernel.org,
	alchark@flipper.net,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kernel@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski@oss.qualcomm.com
Subject: Re: [PATCH v11 00/21] Synopsys DisplayPort Controller improvements for Rockchip platforms
Date: Tue, 11 Aug 2026 23:15:29 +0200
Message-ID: <20260811211534.8618-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20767137.geO5KgaWL5@diego>
References: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com> <20767137.geO5KgaWL5@diego>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Heiko,

Two of your four points I can say something concrete about.

On the cable being plugged in at boot: I see the same thing on an Orange
Pi 5 Plus, and it is the single thing that cost me the most time on this
hardware. The USB side comes up, the Type-C partner registers - your log
[1] shows typec_displayport binding cleanly at 23.9s - and the DRM
connector is still "disconnected" fifteen seconds later. That is what
happened on 16 of the 21 boots I have logged with the adapter attached;
on the other five the connector came up on its own inside that window.
So here it is the normal case rather than every single boot.

What gets it out of that state without touching the cable is a software
replug of the Type-C port controller - unbind and rebind the fusb302
driver:

  echo 6-0022 > /sys/bus/i2c/drivers/typec_fusb302/unbind
  echo 6-0022 > /sys/bus/i2c/drivers/typec_fusb302/bind

(the i2c address is board specific). After that the connector comes up
and the mode is set normally. I run this from a boot service. It has
fired on 16 boots and has never once failed: on 15 of them the log
records DP-1 going from disconnected to connected within three seconds,
and on the sixteenth the machine was powered off before any outcome was
written. The most recent one, from a boot tonight, is representative -
kernel start at 23:00:28, EDID override at 23:00:52, connector still
disconnected with the cable in at 23:01:07, unbind and rebind, connected
at 23:01:13.

Fair warning before you try it. The kernel I logged this on is a v7.2-rc6
Collabora rockchip-devel build that predates your v11 - it was built on 6
August at 00:00 CEST, so it carries the v9 generation of dw-dp - and it
is tainted by out-of-tree modules. On it the
unbind produces a WARN:

  WARNING: drivers/base/devres.c:1184 at devm_kfree+0xb8/0xd0

  devm_kfree+0xb8/0xd0 (P)
  tcpm_port_unregister_pd+0x70/0xc8 [tcpm]
  tcpm_unregister_port+0x70/0x178 [tcpm]
  devm_tcpm_unregister_port+0x1c/0x40 [tcpm]
  devm_action_release+0x20/0x48
  release_nodes+0x6c/0xc8
  devres_release_group+0x144/0x1a8
  i2c_device_remove+0x5c/0x130

I have it on 13 boots, most recently tonight; the rebind then works
regardless. My kernel is tainted by out-of-tree modules, and I have not
checked whether this is already known or fixed in usb-next, so please
treat it as a heads-up rather than as a bug report.

One timing detail, in case it applies to you: the Type-C partner does not
always show up promptly here. On most boots it is registered within about
twenty seconds, but on a minority of boots it takes far longer - the worst
one I have logged brackets it somewhere between 73 and 88 seconds after
kernel start. Anything that samples the connector state earlier than that
concludes the port is empty when it is not. I only have one USB-C dock to
test with, so I cannot say whether that delay is the board or the dock's
PD timing.

I called this an adapter problem in my earlier reply on this thread, and
your report makes me a good deal less sure of that. My assumption was
that it was firmware specific: this board runs the edk2-rk3588 UEFI port
(my build reports v1.1-13-g824e6c12), whose own support matrix lists
USB-C DisplayPort as only partially working - "No hot-plug detect & EDID.
Only works in one orientation of the Type-C port" - and lists the FUSB302
Type-C controller as not working, with no PD or TCPM driver in that tree
at all. So my working theory was that firmware leaves the PHY in a state
the driver does not reset. If you are seeing the same symptom on a
different board with different firmware, that theory does not hold and
this is something to fix rather than work around. What are you booting?

On ACLK_VOP: thank you for confirming the starvation. That is the first
report of it on hardware other than mine, and until now I had no way to
tell whether it was my adapter.

I do not think your garbling is a milder version of the same failure,
though. Here, at 750 MHz the picture became correct the moment the write
landed and stayed correct, with no POST_BUF_EMPTY logged for the 42
seconds that phase lasted; dropping back to 500 MHz brought the
corruption straight back. That run was on drm-misc-next dc2f9f7fed1a plus
your two series, built with CLOCK_ALLOW_WRITE_DEBUGFS so I could move the
rate at runtime. So on this board 750 MHz is a clean state and not a
marginal one - which also makes me doubt Alexey's reading that the
garbling is an artifact of overclocking the VOP2. At least it is not that
here.

The rest of what Alexey says looks like the right thing to check for your
case. It is worth seeing what pixel clock your 4K mode actually asks for
and what dclk it ends up with; on my side that same comparison is what
exposed a separate bug on this board, a video port left parented to a
dead PLL. One caveat when you compare against my numbers: my 4K120 link
runs YCbCr 4:2:0, which halves dclk, so the mode asks for 1188 MHz while
dclk sits at 594 MHz. If yours is 4:4:4 the numbers will not line up. If
you post the mode and the "setting dclk to rate=... result=..." line from
your log, I am happy to compare it against what this board does.

For reference, the ACLK thread is here; Cristian and Chaoyi have both
replied to it since:

  https://lore.kernel.org/all/20260808104240.13776-1-royalnet026@gmail.com/

Igor
