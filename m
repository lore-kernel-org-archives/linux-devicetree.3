Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729480;
	b=kVEYdxZCEW0NIUtUsOhHRoxPz/5yx6q/HOK1IR4IrS+IICXzntuRG91Zxkqhf8yncYLH
	 LdnvWQysGTcxsKXTjTR9Yqfzj8UrkYPi7/kuCbN5MdXFuSDh51SPlGUiWetnquISgW4Gp
	 8XtlMVplUnhrFQljDbNhQw7azrsuM9vVB902hfBglof7nTtz/DJZkCBgsRXb2S3SqpvbJ
	 P2+s4fZkhKUoVpyu5bVLyTUVi9nbYrke5NvxrEaSYrTPD9WppzPXhriCG8T1udtIC8dC9
	 M75/XL9OD8ZuBnMB1N5WTM8IZpbRL3YRE+oqMlHFS8C89GR/TMYMv0fGg+TcyA5bGdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cLndCsyaUJbef6+HCqjnikoRIrtmLL/VU/FOWgoJqac=;
	b=Pwq3tODpW/lxJQER8f8bG8FfcFXvVRBuSA6acg50xlcofQF+CNmw397xz6JX1sa38dqn
	 D4F5KiOxMuWJkd7dIo+7R1B1mTwCpFRoYzXTjD0371y76LYD3Vgn+LZRG7Idx7DFnHPlD
	 llwfsqWMbBusmg8Us28EyvEOQh++D4touLpfad/UTrC2fCerNuvauxxK3rC/2yG6FH0vY
	 b1onSqM6MOJSymy2SKwMeZtSC6n9p2xhnCO9RdLs68wV0xAk08wWX9EpMXZWG+17V2ERY
	 rawG8ST85b3g/GOQP61eu3J1jftKjQFCEGpJozdrxBBVZ9pFWe16KeMe8rJx4vJ29Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ahmvJj+l;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280BE606A69A
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 21:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 280BE606A69A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ahmvJj+l
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-491971ac844so6624521f8f.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 13:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729478; x=1796334278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cLndCsyaUJbef6+HCqjnikoRIrtmLL/VU/FOWgoJqac=;
        b=ahmvJj+l26DjdYSWBB2FpOZI2aMDuDqgj/e/4KEe75QAMAoNsUWO8PiCWFY7GBaMGj
         3QUpIM7Sq7EHNx+r3L1ucf2DWFGIStRoXkRmdpIsLx6Ba3jqyKI6qSzd9KJx21zc2kmf
         tSvTW9siYOZyeOiQu4ma5JoGC3ojVeOXGvsxskw/ri1BXaU0GXx8exI8632VCj3Buk86
         v2I19wXg/XJWNabH/+ZpeN8gepMO6bVB1X/Uc9mZSmvE44p7iDz50T2n/Y+PgMEndp4I
         cj601tddDir+7JWHQYL/9sNZh5++BuPpIYVKX2dxKvFq7H2raEeBZLvMr6lyh3w5gohK
         w+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729478; x=1796334278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cLndCsyaUJbef6+HCqjnikoRIrtmLL/VU/FOWgoJqac=;
        b=SCNJORhw+W6YE+7NfjFIynI8s2TA2xcvSskfomTD2BnnYVDh7zqBfswuXTiPiw32ss
         Nu39qLPohOSUToiUW5QWCONBhOHImFFWnJjrUEspB/u7Fg0RfM8zEnP5en2XvJ6bOZZY
         VM9jYiazQEb9Y8rro92m7ywHzzkUPvqdAML8KNqfcYz8eqfCy7w4tsZu3NenJkQxw6UA
         mYaRNqhZXX1qpxRTAroi6LTexB0Pbra9UgpLdtx5chpjG6IerY2G4+OO1yVCYzab3R2w
         m24JN7Ty7sWfLPAwxBaSUuZvhuTAoVuZLSxmJ7Fng4chsLlfT+r+uRfDlVLXUznA0Duj
         401w==
X-Forwarded-Encrypted: i=1; AL+hErGfroKvpVjL8wY1aVENOQiddE8JTIuWuNF92gRi5A8Vx2P150+fQoe0r+9p7ypaod1i+0J+WXoOyEEM@vger.kernel.org
X-Gm-Message-State: APuU4Z+GkMbz5SVJHMtkaNn7BQwdwtNiF/DXNMprR+2SEnKHEoVPkhxb
	pGmsrv8d3EJ1+hR3lcRAw2u62/uEeNfoss7b5TsUGbXH3UQ2niOx2UBh
X-Gm-Gg: AZFdTZd2N5yoxUnevH7Sqj29Y7NBoM0jn/YgZ0ADSnVEBK0eer2ONdcXdf3ipNTY/Zl
	pH/cxFob6MLbmdZpX8SzfhbWhtkgH5gH9GZFAA5z2ztRiMZXYQp9Rt6R6hx/+RDEfsuTAi9xJCQ
	+lu2F6656zRevluBEx5f53WM7Yi14e6CN7R4cfpuWNit8C3f8zZyBgEnUFCYSpWysrYrTuQbY7l
	7BBGVl7A/e1l53az0ACfvvx3wy8Hx/cmT1h0UmrfpgrMcgoZlgBdDXRHdea8/GQRa6n+tgCZhXo
	ntuSUahSpVqp4n6FsWc3Q1GFWviPoh8xAkyn3L01FqQAkCC2r8PN36BDFXe0fkMI9j+GlTbs3Pi
	rFoQ8lc0A0XCVYQqDqSqhPp0d/gni0hy7EX/9iz9UCxFr258SyGLS9yUSl5hOzR/gQ2hmLxeynk
	svw+kT1whsp55MX0nF4ASIgosLSxlhoKs5veCIIiaqNRvR/bFvR+++ZBbe90eEks+BQQ9MiKAxC
	MH8KmRBVr3z78N+S4eEd3NR3vkbPIQ2xbPdfzCGaOZGZGqRAdGTYaekPM9pwdoFgwxIPmeRyx0i
	dBSROemoQ4amkbsZG8rDt5Ghq2Ybh/dqsuhLHV7YN3t/U7ow2ar9MRxfwCD//EBSknlw+lNPIO5
	vPpi9rjojbQPJ/GQZ5a7xLse98Og++y55Mr8cLrrFr6//j1t/wtCUFfhaPG4j+bkk53dgOS7vkU
	BOpk/xrdzyyLScoFTX0CC98Df8EmFfqxzu8e93+6R03686XGrx13f03T5v4h5bSyiA91Up5W85M
	LTZbKXZ9q1bfLlPY4YEI3lOlpLEyMU0zWhbEuREtEv8upbg1FuQvEd5SePsWII=
X-Received: by 2002:a05:6000:2607:b0:48f:bb92:c5a7 with SMTP id ffacd0b85a97d-4abb0c5d665mr44566145f8f.9.1795729478381;
        Thu, 26 Nov 2026 13:44:38 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:37 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	jernej.skrabec@gmail.com,
	p.zabel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/11] drm/sun4i: Add H616 display pipeline support
Date: Thu, 26 Nov 2026 22:44:22 +0100
Message-ID: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds the remaining bits for the H616 display pipeline:
TCON TOP, TCON LCD (R40 style) and TCON TV support, HDMI PHY, display
engine compatible, DT nodes and HDMI enablement on several boards.

TCON LCD support also covers SoCs with the same die and full LCD
outputs, like T507: both TCON LCDs share one LVDS reset, so it is now
requested as shared, and TCON LCD1 programs the second LVDS PHY. TCON
TOP now also routes LCD TCONs to the LCD pins explicitly. Dual
link LVDS is not supported by the driver yet. As on R40, only two of
the four TCONs can be enabled at the same time, since there are two
mixers.

HDMI PHY tables follow the BSP: PLL settings per TMDS clock band, like
on H6, and BSP specific values at CEA clocks, including their 1000/1001
variants.

The series is based on linux-next, since DT patches touch boards which
were changed in sunxi dt-for-7.5.

Tested on T95 Max (X96 Mate DT) with a 4K monitor and with a HDMI
capture device: picture captured and checked at 25.175, 27, 40, 65,
80.14, 88.75, 108, 119, 148.5, 178.2 and 297 MHz. 4K60 at 594 and
593.41 MHz shows a clean picture on the monitor, which reports
scrambling, lock and no character errors over SCDC (channel 0, the only
one it reports).
All capture device EDID modes set and checked twice, plus 15 hotplug
cycles.
An earlier version of these patches was tested on MYD-YT507H (T507)
with an LVDS panel on TCON LCD0 and HDMI working at the same time.
Shared LVDS reset and TCON LCD1 (second LVDS PHY) changes are build
tested only.

Best regards,
Jernej

Jernej Skrabec (11):
  dt-bindings: display: sun4i-tcon: Add R40 TCON LCD
  dt-bindings: display: Add H616 display engine compatibles
  drm/sun4i: Add support for H616 TCON TOP
  drm/sun4i: tcon: Request LVDS reset as shared
  drm/sun4i: tcon-top: Route LCD TCONs to the LCD pins
  drm/sun4i: tcon: Add support for R40 LCD
  drm/sun4i: Add H616 TCON TV support
  drm/sun4i: Add support for H616 HDMI PHY
  drm/sun4i: Add compatible for H616 display engine
  arm64: dts: allwinner: h616: Add display pipeline
  arm64: dts: allwinner: h616: Enable HDMI on several boards

 .../bus/allwinner,sun50i-a64-de2.yaml         |  20 +-
 .../allwinner,sun4i-a10-display-engine.yaml   |   4 +-
 .../display/allwinner,sun4i-a10-tcon.yaml     |  11 +
 .../display/allwinner,sun8i-a83t-dw-hdmi.yaml |   4 +
 .../allwinner,sun8i-a83t-hdmi-phy.yaml        |   1 +
 .../display/allwinner,sun8i-r40-tcon-top.yaml |  33 ++
 .../dts/allwinner/sun50i-h313-tanix-tx1.dts   |  30 ++
 .../allwinner/sun50i-h616-orangepi-zero.dtsi  |  25 ++
 .../allwinner/sun50i-h616-orangepi-zero2.dts  |   5 +
 .../dts/allwinner/sun50i-h616-x96-mate.dts    |  30 ++
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 420 ++++++++++++++++++
 .../allwinner/sun50i-h618-orangepi-zero3.dts  |   5 +
 .../sun50i-h618-transpeed-8k618-t.dts         |  30 ++
 .../sun50i-h618-yuzukihd-chameleon.dts        |  30 ++
 drivers/gpu/drm/sun4i/sun4i_drv.c             |   1 +
 drivers/gpu/drm/sun4i/sun4i_tcon.c            |  67 ++-
 drivers/gpu/drm/sun4i/sun4i_tcon.h            |   2 +
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c        | 170 +++++++
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c        |  15 +-
 drivers/gpu/drm/sun4i/sun8i_tcon_top.h        |   3 +-
 20 files changed, 895 insertions(+), 11 deletions(-)


base-commit: 3dd8c790a7b7027abdd568e36db5e82ffaea7c77
-- 
2.43.0

