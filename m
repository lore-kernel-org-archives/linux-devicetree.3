Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315922;
	b=Hb/6KySvvCOEZweDvOe90NRg1b/9MQOG5am7QnMs/SMnNbk+MrJ7y0DxB3u57/RksS1c
	 3pn0F7x/zBAkiuIIEgGTlBrydQJTTcZRJwGrJ2BHXMPg75N40cH3rb4GOL8sAiOaOTUft
	 Vh2n8fJzOl2fFiVW2z3MQZOf0jrYf04PAgeSQgcuYxCBkDPvMRqfNDtaxufBVRFWBqp56
	 kvA5jXcWCwpKZFDbcc+8SG0QKI3Zn+ckxsezIswanHn3GbLdzhsTnxuYPKa3fEoiFpDVG
	 CYWuus+W5ZkTYCZI6cER2S9lbkhm5BYxdJci8hTw4JwBMnhPOxHDe07/UGKC1T7ikUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=6x86s7blevtluoP9nJsSdSKJgLOgTfshLxyDXczjN8g=;
	b=BsJZthjITW+LyWOt/ndsghod+9LLfj9LBwk95lb83grFR5oTI+nmZVFswC97bzsqv1yq
	 8W+0lpPZWwbB6M+NlbtmQFbBSyD5IM/rfv7x/sviET9xAT6a6f3NQldLQGVzb0j3YkCsF
	 LRFkw05XBJePdKdTfgGASz2G8bFo3kFbMdI7lQOstPGmt5X3n0gnGdNLIKjWhZQ38qWux
	 G1LI9JNqiqCFY8uo5ihI85AvCjtajoNhoB2r68B6JxaZ5LH9aFSXMWOQCaY8Uyz6Oy0u/
	 YhmAxj7xi/cycDhDhW63bSin/XiO7N2gyBNJ93buo2wn5tGATKnQdaCSn3cFPK0/u/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZUSiEi0n;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249D5606E440
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 13:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 249D5606E440
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZUSiEi0n
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3adb9cbb0c3so187024a91.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 05:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794315921; x=1794920721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6x86s7blevtluoP9nJsSdSKJgLOgTfshLxyDXczjN8g=;
        b=ZUSiEi0niXnC8Z6Kj0bKAAMfjptJrX6cLnoTLRg5ALxXC+q5eiLIm3VbcUjG7LzP4t
         L3TplgM0EBX/KvycBV/n7JoU4M9UuIRtreqE1EQ+HwsHxapDAq2AJV3kGxQZl5d/BCip
         aCKKfQK33SriLoIDaGBN1+itX+8sgizpR6Jz739Hve7hsGRD9fO4NB4amGllQMfjLZTB
         KVmFXnuMiK1zuiY1pp7OkzcNuvNKSN3CHPUXE9gaqQi2vSnCBpVlrWVjW4J2yOMY/dv3
         XhNHBdM3idGBo5LscfWJaRg+MUTPIB/z5riKUO4bFKg8N7AadCf7jMohHeYq/LDh0yi1
         OIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794315921; x=1794920721;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6x86s7blevtluoP9nJsSdSKJgLOgTfshLxyDXczjN8g=;
        b=rrJmrsbteGKoIS4R2j86aWFn75H/CLGziTW7Qp7uHCocZYnqQPF9hLidyULnS6aqod
         bILvoadoO13rKahrTOTS7jR/oMaCBDQRx6MqJefFlPygmu7zb6fDuvjHlHMbDXul32FY
         Rn1NkcU7MZTjWhFVzXNdB4qTmzJJtNs1DrKv0Q7f8b+dN1FvO86JNMG1FGBrg0Bbsk3j
         A/P4Agdwg1ASUo0HCVLGC/uiOKDVDLU8L1Ki4QgRi3InwP6Oib4j7j773pn0q600ugdk
         exVV/gwf4/l+xxTi65twAxFb2I0LJdpTsR6q3gMfnuUYrBKd35Is1p4qk1JcAnDOSqSm
         MFNQ==
X-Forwarded-Encrypted: i=1; AL+hErGQsXDh/ixZTXJGKpmEbb4IwbSY9GRiPEcBob9+O6eiGcNz1/23nGaguhZc40UswZ5BDddo4A5J3mYP@vger.kernel.org
X-Gm-Message-State: APuU4Z+2XVIe3lE5LSaja3rDuUoU8GqBhH4Tf+BU9udQoqlCFEupEAeG
	ubPh+tIcMP+wqo2op0pjLi+atd3AzRSc8VxuCvNHXrh7Jnvkm9j3Xb0N
X-Gm-Gg: AYBFou3Jx3nEcJrX6/OHOeDCC9REw+9UVjedFzoeUkAo3V8+EevC95klnzbwH94sGdw
	oosAac8sd8xNWxhn/smWh5SrBrHRX/NFgutzfWBH1cuXzEu7b1WQsS8JQdACCjg4rZRnfUCXQHQ
	TlzFQdTyaunWkPOSCWQ9c40dMrKv6Dj98qyypAZ/XBQdpCEFwCfSXhWwJkYP04G+D0v8B0FJCXF
	T1Fm+KB3Ux6bcxIHnfed5oU33gKTn6lbpus/kYM7nYAvrPadzoytDCskCKCemKa8nzWXsgu5d1r
	n3K3krfcxoIXwsYRpWEqND6/HUBPB7+fCY2CkoNHTGnaFYLH1XkLMMLaoHNNNBIO26WjemypQ+o
	Alc8v9WqMlKgccXqSQe6QWVhkMnV67XY+hWr3ovJMk3F32pgUwxdbnCsFpd4ouXetq1FVsjRfWV
	SfKmbsYQrPs2E+f7k/LGjULEhrNUcVNquAgjeVXFdzDhTPACM2fjN8epekcboEeiWfGTLkoFnxy
	s6mw0mm4yLdtRbVbmoJ5YGcWPT/CyLw3VE+erXidIlC0ZQPN4m8vnfsdTrUip1xGn9FUTLHFyt2
	NdZvLheyX7crg1xfPBYmoGaxK0A=
X-Received: by 2002:a17:90b:53c8:b0:3ac:a7ee:6785 with SMTP id 98e67ed59e1d1-3b166ad51d9mr4660163a91.1.1794315921137;
        Tue, 10 Nov 2026 05:05:21 -0800 (PST)
Received: from marchy ([2405:3800:918:486f:ee8e:77ff:fed4:d18b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1678d1f42sm3982296a91.7.2026.11.10.05.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:05:20 -0800 (PST)
From: Adam Azuddin <azuddinadam@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de
Cc: jesszhan0024@gmail.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	andersson@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	azuddinadam@gmail.com
Subject: [PATCH v6 0/2] drm/tiny: Add RAiO RA8875 display controller driver support
Date: Tue, 10 Nov 2026 21:05:12 +0800
Message-ID: <20261110130515.45819-1-azuddinadam@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds a new drm/tiny driver and matching dt-binding for the
RAiO RA8875 SPI display controller. An fbtft driver for this chip
currently exists at drivers/staging/fbtft/fb_ra8875.c, but fbtft is a
legacy fbdev-based staging driver, and nothing in mainline DRM
currently supports this controller.

This driver does not use drm_mipi_dbi. The RA8875 SPI protocol is
structurally incompatible with both Type C options drm_mipi_dbi supports.
Type C1 encodes command/data as a 9th bit within a 9-bit SPI word. The
RA8875 uses a full prefix byte (0x80 = command write, 0x00 = data write,
0x40 = data read, 0xC0 = status read) sent as a separate 8-bit transaction.
These are not the same thing and cannot be mapped to each other.
Type C3 models two transfer types via a D/CX GPIO. The RA8875 has four
transfer cycle types and no D/CX pin.

My ER-TFTM050-3 board has RST tied NC, and VDD is a fixed supply
set via an on-board solder jumper rather than software-controllable,
so I couldn't test reset-gpios/vdd-supply myself, but added them
as optional/required properties respectively per review feedback
for boards that do need them.

Tested on a Raspberry Pi 3B connected over SPI to an East Rising
ER-TFTM050-3, a 5" 800x480 panel driven by the RA8875 in Linux 7.3.0-rc4.

Link to v1: https://lore.kernel.org/all/20260916175942.3186804-1-azuddinadam@gmail.com/
Link to v2: https://lore.kernel.org/all/20260924145400.1385815-1-azuddinadam@gmail.com/
Link to v3: https://lore.kernel.org/all/20261001144128.2336301-1-azuddinadam@gmail.com/
Link to v4: https://lore.kernel.org/all/20261012064518.3497285-1-azuddinadam@gmail.com/
Link to v5: https://lore.kernel.org/all/20261030083737.47188-1-azuddinadam@gmail.com/
---
Changes in v6:

Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml:
- Drop Assisted-by tag.
- Remove sentence referencing driver polling from interrupt description.

drivers/gpu/drm/tiny/ra8875.c:
- use drm_atomic_helper_connector_create_state instead of
  drm_atomic_helper_connector_reset.

Changes in v5:

Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml:
- Drop the "Add YAML binding schema..." paragraph from the
  commit message (Krzysztof)
- Add interrupts property for the INT# pin

drivers/gpu/drm/tiny/ra8875.c:
- Move bindings table to above ra8875_spi_driver definition

Changes in v4:

Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml:
- Drop the sentence in the description saying the binding covers only the
  SPI-connected device (Conor).
- Drop unused panel label

drivers/gpu/drm/tiny/ra8875.c:
- Catch error value from ra8875_write_pixels
- Use consistent include header format.
- Return if fb is null in atomic_update
- Drop unnecessary extra byte in pixel data spi write.

drivers/gpu/drm/tiny/Kconfig:
- Add depends on OF, which is caught by intel 0-day[3]

Changes in v3:

Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml:
- Add gpio.h include in example to pass dt_binding_check
- Remove spi-max-frequency as there is no reference in datasheet

drivers/gpu/drm/tiny/ra8875.c:
- Remove debug-only ra8875_read_reg function
- Chunk large SPI transfers to 16 rows per chunk
- Remove unnecessary includes and spi cs setups in probe
- Create ra8875_write_pixels function for clear_screen and fb_dirty
- Use 2 spi writes instead of 1 write with 2 transfers and cs_change in write_reg

Changes in v2:

Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml (review by Krzysztof Kozlowski):
- Add hardware description to the binding
- Drop the display-timings property, and instead require it in the required block
- Add a required vdd-supply and an optional reset gpio property
- Rename the example node to a more generic "panel: display@0"

drivers/gpu/drm/tiny/Makefile and Kconfig:
- Remove TINYDRM prefix from the config name (Thomas Zimmermann [1])

drivers/gpu/drm/tiny/ra8875.c:
- Reformat device_id table to match current convention (Krzysztof Kozlowski)
- Drop unneeded linux/mod_devicetable.h include (Uwe Kleine-König)
- Use drm_dev_unplug() instead of drm_dev_unregister() in remove callback
- Move stack-allocated cmd/data buffers into ra8875_device struct
- Add mode_valid() callback to validate height/width against panel maximum
- Add optional reset gpio
- Use dev_err_probe() in probe function
- Remove connector detect callback
- Remove unnecessary |= on register write return value in hw_init
- Migrate from simple display pipe to manually-handled plane/crtc/encoder,
  following the simple-KMS-helper removal effort [2]
- Use defined constants instead of magic values where possible
- Use drm_atomic_helper_damage_merged() and drm_fb_swab() in plane update

[1] https://lore.kernel.org/all/fee2a743-d3e4-46b4-812f-05c3cc3a46ae@suse.de/
[2] https://lore.kernel.org/all/20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com/
[3] https://lore.kernel.org/all/202610042347.idGisdDW-lkp@intel.com/



Adam Azuddin (2):
  dt-bindings: display: panel: Add RAiO RA8875 display controller
  drm/tiny: Add RAiO RA8875 display controller driver

 .../bindings/display/panel/raio,ra8875.yaml   |  86 +++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/tiny/Kconfig                  |  13 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/ra8875.c                 | 719 ++++++++++++++++++
 6 files changed, 827 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/raio,ra8875.yaml
 create mode 100644 drivers/gpu/drm/tiny/ra8875.c

-- 
2.55.0

