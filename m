Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9394E3537E5
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 03:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785470233; cv=none; b=u/ZbOV9ucr7mG3Rw6JCeLkvPPJU/3+dAVBi7iGAsBps7VE+VUqWJ9n1o3q7cz+W7jYEcRCq5hNOOwgMMtOlN1Ubc3ECCaGkxNfz9KoSPsLWa2JabzhCU7mkVJfDVoEmHAlI5KB9GnHZFONZ/D/zXGq45o5RAqbVOis7A/Qsvvwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785470233; c=relaxed/simple;
	bh=SUtlpipHLXN3sYr5zq1o0yAvcL5JXECSRmI11zfCAok=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gU/N1rqXhdDxyU5OKZ6UyDh1Jkty2p1Jz+LS44i3bIM8HxUNRoHmdI/b2nsQ6EBGva9Iw9Y4+VApCdhw+VFAU9M96B1PvUaJhtm6y78/FaoubqC1k16xCWjTlUq3E80IOG4ZW3FTjaBo/NyO0vbQVswulR1P73Acz/579+iME4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WGg6Erda; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WGg6Erda"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84874b52eabso845946b3a.0
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 20:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785470231; x=1786075031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hLwxV928xnrn2EJ+kjCQzh7nVri0c8G6v2ZbqHPnHhs=;
        b=WGg6ErdaMFpP6rCtiFsgnrFYcTzRsZS+IEd/NSqbIBymgb4UJ5WwXqxe6ocOipHEgI
         4KtcoKHzE/38AlAlZT2gxyAxxkcwLy7/hzBodb5h34VGcvlKz69is/EuW33dtYO1wbfn
         yfwqCKBrHT+TpOZIkpWk2PBgVMubvavB31sKFA+OJVoyIke9Lkrs9Gkw+5E+VLwdJh3p
         F56CI6Y/ZukHVJQw2h2jCQu5ThVF2orc6eYz+q4Y+kK1brfkXMDaP4MUc/gQRt0z4gkm
         TbKNn0U/exwCIY4YCZDfK9KjoH61UmDJK4E43T2OZZYYt9wqAdz1bnlfoQJiVezlVGDJ
         xIqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785470231; x=1786075031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hLwxV928xnrn2EJ+kjCQzh7nVri0c8G6v2ZbqHPnHhs=;
        b=lELuu1QHXX9zJrnYHqcwng4JuR5cEmjgiuPOpw8FuJpJujYd2p7adrm05n2+bAbZnq
         xI9G9hGOpkDsjYE4yRozB4BxyTxpMxvVPEiW9nArXDKCg9AIc4Cb6mP0BdIR6u8XQS/p
         U6qD+IzLlkCKsWBTHMQ9hSvxofFA4zxHaZYOgC+H+nvI1xu0B5/9BoWzKIRhF5tBs+JV
         r7PtiVNSbxW4MRfFqCgWvmgR4lhaKWDMEAiQlrCeHqO/XYzxkNRrzm9Qgo8SUNcMawT2
         LUyeBpOm98Z3dDOX+XcrRglC4n6u9ij6ZxXRDpwiQReekoVN0pdr4xN5o5HprL+lbZtC
         lbbA==
X-Forwarded-Encrypted: i=1; AHgh+RpANqhrf27jDtVtfyXekEDMx/Tdqj37IxOot4xwbAEkjQ5Z7O2lb+MNhjg9lPGFcsPB343VsxatN40r@vger.kernel.org
X-Gm-Message-State: AOJu0YwwcfNGco8soB4i5HkFCtbObRuR6KTbNuOsHay+EuXy5S/ZPonE
	Z97kOe5wvoImAjfq9Q5kWSJ93Q+WYlDrVdhOQPHSi9W/4ll6hBedVIMTj4QLcPjN
X-Gm-Gg: AR+sD13nnCHXGIa3EzMHa7rN0RHz7Dq4+KG8WU5aheLD+ok+HMJtH/PYFkGpBWdr/Qy
	8ilkFLu/nKrqHaQxfiwsV9mpS0i+DwCiZIu98vyWmWLNCZeH0pv/U3/qRDZj9ejB4YGwz2toibJ
	bUhRGWOyzuVz81s01nu37rBZccdvbDJZKN3sIYAeWytjowp5QHkReXywVyJ4ZQo6fS8TY2K9Ffl
	ysO2jtHGJfQlN90qKNVMD/YOelnzhzrH9DYVeGpu7hxiSosejxzFx7t22/sEJS0BjffNEoNH4xF
	JE/EaiuAxE+vcuK6kkAga1vHc0d4XOykfjdNvC/bPqJRw0xYQDhquj/9pzGA58VfiJh/pCYwoU4
	xfktQ708XyrHlOK6CcSHrNp9+WM4jLIHdCund7OZb+23OcFfCCIg18K0xg6334honBuMhc7RJnB
	mBLIlR/NW+lD5L99ekrnoiog1oMOI6rm+RI40niO7OEC8pXHIKVELfivClkUIsu/4nLFoJIU27h
	cGfG28wNEcdO1r6LqhhqtzmVSZrAizOF7AfLarEFZYJi6AOa6iTeJtt2Hox3pvSNr+4xiUt
X-Received: by 2002:a05:6a00:189a:b0:845:3914:f039 with SMTP id d2e1a72fcca58-84ed6bf73cbmr357974b3a.26.1785470230690;
        Thu, 30 Jul 2026 20:57:10 -0700 (PDT)
Received: from lcwang-Precision-3630-Tower.. (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ed5dac09fsm162978b3a.28.2026.07.30.20.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 20:57:09 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
To: Devarsh Thakkar <devarsht@ti.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wig Cheng <onlywig@gmail.com>
Cc: LiangCheng Wang <zaq14760@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v3 2/2] drm/tiny: add support for PIXPAPER 4.26 monochrome e-ink panel
Date: Fri, 31 Jul 2026 11:57:04 +0800
Message-Id: <20260731035705.3198816-1-zaq14760@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <8fcfab0f-6b98-478b-be4a-c5b810fb3524@ti.com>
References: <20260529-bar-v3-0-5c2ac1c751ee@gmail.com> <20260529-bar-v3-2-5c2ac1c751ee@gmail.com> <2bfb73e6-dca3-4d93-af04-3c644929dd19@ti.com> <20260616083921.4066690-1-zaq14760@gmail.com> <423c3dca-9589-488d-8462-c3d51f05ee4a@ti.com> <20260617020926.114947-1-zaq14760@gmail.com> <8fcfab0f-6b98-478b-be4a-c5b810fb3524@ti.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Devarsh,

Thanks for the SSD1677 work, and for adding the panel entry on top - that
was a convenient starting point. I have tested it on the PIXPAPER 4.26m.

Setup: Raspberry Pi 5, rpi-7.2.y with your 14 patches cherry-picked (clean
apply), SPI0 at 20 MHz, DC/RST/BUSY on GPIO26/5/6, CONFIG_DRM_SSD16XX=y,
drm.debug=0x02, no compositor.

Bring-up is fine: it probes, the connector comes up at 800x480, and
reset/BUSY and runtime PM all work. Three functional issues below - one of
them currently blocks the panel, and none produce any error or warning from
the driver.


1) Image is horizontally mirrored
---------------------------------

At rotation 0, content written to the framebuffer's top-left appears at the
panel's top-right and text reads as in a mirror. A pattern with four
differently sized corner blocks confirms it is a plain horizontal mirror,
not a flip or a transpose.

RAM X ascending appears to map right-to-left on this module, and I could
not find a source-direction control on SSD1677 to compensate with -
command 0x01 only affects the gate side. My out-of-tree 4.26m driver
worked around it with `src_x = width - 1 - x`; I think that just got lost
in the port, since it only shows up with asymmetric content.

There is a patch for this in the series linked below. I kept the flag
per-panel since I only have this one panel type; happy to move it into the
SSD1677 config if it turns out to be controller-wide.


2) Rotation
-----------

Setting rotation through the connector property at runtime:

  0     mirrored, as in 1) above
  90    garbage
  180   nothing drawn, the panel keeps its previous content
  270   garbage

fb_dirty(), display_update() and the BUSY wait all report success in every
case.

180 comes down to skip_data_entry_mode: the reversed RAM window fb_dirty()
programs for 90/180 has no matching decrement mode while 0x11 is never
sent. Dropping the flag fixes it; there is a patch for that too.

90 and 270 still fail at runtime with that fix, but rotation = <90> in DT
works - fb0 and the connector come up as 480x800 and the image is a clean
clockwise portrait, matching "90 (portrait CW)" in your commit message. So
the portrait packing looks sound, at least at 90; what seems to be missing
at runtime is the mode swap probe() does for portrait orientations.
Without it the framebuffer stays 800x480 while the driver switches to
column-major packing - fb_dirty logs "fb=800x480, orientation=90" - and
data_size is 48000 either way, so no size check catches it.

Since DT rotation works, one option is to refuse the runtime change rather
than let it corrupt the display; there is a patch for that as well.


3) refresh_mode does not take effect
------------------------------------

The property value reads back changed but the driver keeps the old one.
Reproduced with modetest -w and with modetest -a: refresh_mode reads 0
while fb_dirty logs refresh_mode=1 and display_update sends 0xf4.

As far as I can tell it is only latched in ssd16xx_plane_atomic_update(),
and only when the old and new connector states differ. I have not worked
out which commit ends up carrying what, so I cannot say exactly where it
gets lost, but the new value never reaches device->refresh_mode. rotation
is presumably unaffected because device->orientation is assigned
unconditionally in ssd16xx_crtc_atomic_enable(). color_mode and the
clear_on_* properties are latched in the same block so I would expect the
same, but I only measured refresh_mode.

This one is in your connector-state design so I have not patched it, but I
am happy to test a fix. For the measurements below I changed the relevant
defaults in the driver and rebuilt instead.


4) The 0xF7/0xFF question
-------------------------

All three work on this panel. 0xF4 is what the driver uses today; 0xFF
gives a correct partial refresh with slight ghosting, which should cover
the "pending hardware verification" note in the SSD1677 comment; and 0xF7
also renders correctly, taking 3888 ms against 3664 ms for 0xF4 - the extra
time presumably being the analog and clock shutdown it adds. So 0xF4 is not
strictly required here, and the choice between it and 0xF7 looks like a
power-versus-latency one.

Fast (0xC7) is consistently a little slower than full, not faster. Within
one boot - the first frame after init runs full, the rest fast - I measure
3664 ms for full and 3800-3804 ms after it, with an indistinguishable
image. FAST does still reuse SSD1683_CTRL2_FAST_REFRESH while PARTIAL and
FULL got SSD1677-specific values, which may or may not be related. Not a
blocker.


5) Smaller points
-----------------

A few places where the commit messages and comments do not match the code:
the panel is 800x480 not 960x680, the booster soft-start is described as
four bytes where the code sends five, the active area is given as
91.8 x 65.0 mm where the mode has 93 x 56, and nine pixel formats are
listed where ssd16xx_formats[] has only XRGB8888 and R1. The SM comment
also reads inverted to me against the datasheet, though the value itself
works. Happy to spell any of these out.

Not covered: the DRM_FORMAT_R1 input path, 3-wire SPI, and system suspend
(/sys/power/state is empty on the Pi 5).


Patches
-------

I have posted the three patches as a separate series, so they do not get
buried in this thread and can be picked up on their own:

  https://lore.kernel.org/all/20260731-ssd16xx-pixpaper-rpi5-v1-0-18ffc0dbf59a@gmail.com/

  drm/tiny: ssd16xx: send data entry mode on SSD1677
  drm/tiny: ssd16xx: support panels whose RAM X order is reversed
  drm/tiny: ssd16xx: reject rotation changes without a matching mode

The first and third touch code inside your series, so they cannot stand
alone before it lands. Please keep them as separate commits if you can -
git am preserves authorship; if you fold the first one in, a
Co-developed-by with my Signed-off-by would be appreciated. The third is
only a stopgap, so if you would rather fix the runtime path properly,
please do and I will drop it.

The panel support follows separately once your work is in drm-misc-next, so
that it carries no dependency:

  dt-bindings: display: solomon,ssd16xx: add Mayqueen PIXPAPER 4.26m panel
  drm/tiny: ssd16xx: add Mayqueen PIXPAPER 4.26m panel

with Suggested-by/Co-developed-by for you, as discussed.

The property issue in 3) and the commit message wording are left with you.

I maintain the existing PIXPAPER MAINTAINERS entry - would you mind adding
me as R: on the SSD16xx one, so I stay on CC and can retest?

Once the mirroring and rotation issues are sorted I will be glad to give
the SSD1677 patch a Tested-by. Thanks again for accommodating the panel
entry.

Regards,
LiangCheng
