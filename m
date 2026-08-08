Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2990E3451C1
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 09:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786182133; cv=none; b=T4Dv81ZgVsuAhKyUXizikvF27F1PwDdOJqGx6fU7uCiBYUqlD0VIveH5ubh26WVNLsvqXN9y9OXZkW6n4H6V7fN78TiLeEOSTa4hSoRCuDSkB6rooHSBb7azA2/dhFzru4D9PlpwZGXcZ5XVDLiaLpyOddjmhmg4FOZmvdQtTMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786182133; c=relaxed/simple;
	bh=5PFCNPlVprDXTRKhu9L3OrjpO7XRdwA7JsEL0w6YGJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pbiWj/g/pHUELGNkROCTBs0RObi/+i0UzPML98383x5e0mOnLVc6w4KLKYZ80NH/W3MNoY8H7+AOdJRVZgCTnAf9l7ZJ5ivHIwK1CyGfZyxYHGtEPUPV2uXfHAq8sPwXAW2/9iffQkRooC9hOJfcicJOFA/H4Qb2Kb65S9iQFwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SmR6ooPT; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SmR6ooPT"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4765eec32e1so20653f8f.1
        for <devicetree@vger.kernel.org>; Sat, 08 Aug 2026 02:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786182128; x=1786786928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LIUa/GkOS3aZrfCEcRahKBXxy/BEVRSMrpiAVM66nfw=;
        b=SmR6ooPT2eH+NYvGj9llb1unH4Rn5dhBYE12Zmr4im2Q6a3Q2sis72qhmGz6gZe91R
         Mx72HAnomXRUFjBxX1N9ty0c5jXxBIbrar6xzaCJrOi2FA2sEuHVImPxsOi/xaW3vzJS
         cgCeFVSU7qMrQOb4K0WY7IumLY17E3UsyIpqU+uW8707ao/E+cDEI57FaA2KAv3HTEpE
         aOFA67OY12DVII1mjEkviPQBNcUbvW9nw5UBqI7Iv9WH4I7aaaaZJPmk0tJCKvPvdwzG
         UinbIL9WxM2dNPF05zvjOvv1HraREZ1P1WlJChfMULo8M6Itgxt/f4u2VGG3bNUkVu99
         +sRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786182128; x=1786786928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LIUa/GkOS3aZrfCEcRahKBXxy/BEVRSMrpiAVM66nfw=;
        b=JkT4q1K8TlI3TAzFXJXNIUJ9ZVhnTP596tR8W50tRyBPSsB5BfhqM9Uro77+i1fkrl
         g8rXlaqmdG41JRSeJMa+0DcZA/j1scWlUPMUevJY9WGHfEVdXIn4MhvWk6Yb/RPMh9ML
         ruDfjJWg2KBerTghzokt+l6/Fo5XmQpL3wbvJhqrrBiDAf11Rc35T8JQ5KR2xZarzQGF
         v0xLbaiayRk88yzwZnm36Zdn4vxHDcIFuPFxNOQZtn2ifFiwhaIVSZQVLjAM9KjPyULp
         3g67KKkb0pE41uEEKX7NxYqeDggOGheboKwUrXDWdoisQEdMpSTw/WI/qBd8cLiJ8aoZ
         CuVQ==
X-Forwarded-Encrypted: i=1; AHgh+RpdA5rxf2W4E91mikbwSPn6paxliqPHzbg3KUpfXAAZeJNLIjWKlPTEwNjZe1+n0Z0DCuI6KtnVuLO+@vger.kernel.org
X-Gm-Message-State: AOJu0YzwpRE4ex13yKMJAKevpaxk/UWXSsM4yCqTZLubtOYgQCgRUWtB
	alxKKpM80mqFBlpWn8dKhkCHq7b+ffuZ0YiGcu9aSZhvxelGW+xr12A7
X-Gm-Gg: AR+sD12y+qlOQj3Rheek93gCYI5HPk88Hp9Knryd2QjtfqCvKp03MBnjcJ2/8CUC6Jn
	yhmL131Nv1gyGtI8JsIlsrXgG+pyvnhP3UcqHeguAhCx3kZQULsOBsrAsY0EZRfE84VKVXne/Vv
	QaSJRnw+NKqURoSxeHtxbpBWgBFi+kwpcD0BMNUU99JLFN1EM5Tp4UAwdXscCxDMBilbU7QpzKL
	dDG3p+8npHLo7M8+LFxIwUgd4GaGlSesEFK7PcxKKVhxlDPRM5eweRUNP8kOc+zfbjG1Tz4dSkh
	3BhhZxll1edpWkO/raXKMOmwpiyXrthsxwOrwQARxFo0DWnxdu/xykFumACV+jPTeLUocc1YKla
	Jy4reB8cWjZc07AVRE1DxcDtD3jxD24KFqd4m/aReYcw2SNi/ujuLhG6E+APjkN/oIgiMaqxkWi
	xmLuq8BCOgGN92jNle4HOyF2gImdU0SzJ65WGDnKRhvCHWkll4aV4YcaVf/WXlw+cSbm5D3/2Z0
	tZAoiZ52/vj0UyBHgjghiGaSo2ckLhOMqsgx8Vq6FozwZKMQpVlH43YasSvYxVYtrogXw==
X-Received: by 2002:a05:6000:1785:b0:47f:91f0:9ab with SMTP id ffacd0b85a97d-47fec484f36mr22974430f8f.0.1786182128200;
        Sat, 08 Aug 2026 02:42:08 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8E20009911270F4BEC2300.dsl.pool.telekom.hu. [2001:4c4e:1b8e:2000:9911:270f:4bec:2300])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021f9182sm13826171f8f.28.2026.08.08.02.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 02:42:07 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Damon Ding <damon.ding@rock-chips.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Alexey Charkov <alchark@flipper.net>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kernel@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v11 00/21] Synopsys DisplayPort Controller improvements for Rockchip platforms
Date: Sat,  8 Aug 2026 11:41:32 +0200
Message-ID: <20260808094138.7205-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sebastian,

The Tested-by tag is at the bottom.  Short version: v11 works here on
an Orange Pi 5 Plus over USB-C DP AltMode.  It needs your usbdp v13
series underneath to probe at all, and above 2560x1440@144 it needs a
VOP2 ACLK change that has nothing to do with your patches.

One caveat first, so that the next paragraph is not misread: dp0 is
disabled in the mainline RK3588 DTS, so none of this is reachable on
an untouched tree.  I enable it with a local board DT patch.

With dp0 enabled but without usbdp v13, dw-dp never finishes probing.
It stops at "failed to get follow-up bridge" (dw-dp.c), because
mainline phy-rockchip-usbdp has no drm_aux_bridge_register() at all;
that call arrives with usbdp v13 patch 16/35 ("phy: rockchip: usbdp:
Register DP aux bridge").  The component bind then never completes, so
both HDMI outputs stay dark as well - the symptom is much wider than
the cause, which cost me a boot to work out.

Hardware: Samsung Odyssey G70B behind a USB-C to HDMI 2.1 protocol
converter.  DPCD extended revision 1.4, the link trains at HBR2 x4,
VSC SDP colorimetry is supported.  The converter ships a malformed
EDID, so a boot script feeds a corrected one through the debugfs
edid_override and kicks fusb302 once; without that the 4K modes are
dropped and AUX stays dead.  Both are adapter problems, not driver
ones.

What I saw:

  - DP-1 comes up connected, the EDID reads through the converter,
    the link trains, and KWin drives the output.
  - At the stock VOP2 ACLK rate, modes up to 2560x1440@144 are clean.
    I left the machine at 2560x1440@143.99 for more than eight hours
    with no DRM or VOP2 errors.
  - 3840x2160@120 comes up, but the picture is unusable until the
    VOP2 ACLK is raised.  With it raised the picture is correct
    immediately.

That last point is a platform issue rather than a dw-dp one, so I have
sent it as its own thread to dri-devel and linux-rockchip with you on
Cc: "drm/rockchip: vop2: ACLK_VOP pinned at 500 MHz starves DP 4K120
on RK3588".

Two small things I noticed while I was in there:

Kconfig: ROCKCHIP_DW_DP selects nothing, and DRM_DW_DP does not select
DRM_BRIDGE_CONNECTOR either, while ROCKCHIP_ANALOGIX_DP,
ROCKCHIP_CDN_DP, ROCKCHIP_DW_HDMI_QP, ROCKCHIP_LVDS and ROCKCHIP_RGB
all do.  Since dw_dp-rockchip.c calls drm_bridge_connector_init(), a
configuration with only ROCKCHIP_DW_DP enabled fails to link.  This
predates your series; I am happy to send the one-liner if you agree it
is worth fixing.

sound-dai-cells: the dt-bindings patch in this series ("dt-bindings:
display: rockchip: dw-dp: Fix sound DAI cells") notes that the
mainline rk3588 DTS still sets 0 and will be fixed up separately.  Is
that DTS patch already queued somewhere?  I would rather not duplicate
it.

DP audio: it does work here, but on my rockchip-devel based daily
kernel, which carries the v9 generation of the audio patch - a
simple-audio-card with cpu &spdif_tx2 and codec <&dp0 1>, picked up by
PipeWire unaided, playing over the same cable as the video.  I have
not retested audio on the v11 tree, so the tag below covers video
only.

Tested on drm-misc-next of 2026-08-07 (dc2f9f7fed1a) with this series,
usbdp v13, two local board DT patches (enable DP AltMode on the USB-C
connector; pin DCLK_VOP2 to V0PLL), and a one-line local change to
clk.c so that I could set clock rates from debugfs.

Thanks for the series.

Tested-by: Igor Paunovic <royalnet026@gmail.com>
