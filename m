Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936817;
	b=jT2Y+aG87j1qe+P/UWMH2A7sayFhhZnhh0YS6l1OVRyrvUN3+39l6tZ1VSyXDgs7Xh8n
	 tSUhCa0KFYLZyUvNpvg0qHyu1P4fJV4zZBURtfu1cZvEaKqCJ5n+zfyKIg/10ZIafBKq7
	 /Ob0isq0Xh+puZAYU3yZn0OiiqWK9M+N3WPJ1A6JFmOAOBiddb5dGqRwVQOuL8hyNHAxt
	 dUk+3WChgQV3Jn0olx3JGu8OUFyjuJxOSm5kSfa4VmVU3AsyV+EkXIQI+2syK6HjYSGNs
	 uJXuWoZ49ae44iBy7cCC+17yErSz/df/kjX5qqeu8cyprZd3zC0EzCNfYsNM1SH0EBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=BrMcWd7pvu75CincI1DxjIJtK+iHHZhWACFR9OMESAw=;
	b=PeGYSrZOQPSMqFY5GBmjGP6HXXlRFa8DriFxIFbrNoNR6TOlMnEPcBHQHzXxALuu+8iq
	 bUkm0xWEBSuBK+p83xKBPP/Q09+4r9LeSgrLGegmV4szc1FnBOsrd+PANkjrrjqH/Gqub
	 xKAEFlh9Lyd8JjRxAnIGyKzEnTiecoCDFL5knzPUMksGhiYs9DrFZ/WEe05G54zkEh7Di
	 87huliBNDVwv+nGBpmqOvRhU72Rfinwvr6bNw9tpCzDWZbkej/xa8hy8dwdNWd+Xd2RLk
	 m2BMP2QEa4ozfuGJVaYUyRvPw4owGhjb2s6ih8UyNCk1+7OibezNgqVP36EAOQbapJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qq9cWzZj;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28542606A32F
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 17:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28542606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qq9cWzZj
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso7714f8f.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 09:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936815; x=1795541615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BrMcWd7pvu75CincI1DxjIJtK+iHHZhWACFR9OMESAw=;
        b=Qq9cWzZjrgVRuhct9Bs3XWPLq2gc4ngF99znVrHxGFg29CgIdyg5bdv1KU+5GCR47Z
         W/1CNTm0RFuyhIpOtfdFSDIYysMReXu9u5BkGqEZl1RqmCPbOIpv5apywR/27GszE4xG
         sl08M+PNPYGAaFy52pn8LZWsyjKd17q0jvIWtgJXTmK7bvHJfJz86Ijb2NIXSk61GxXR
         zBKdUn0p+UXoSd7HduOaTpXCQJXHXjJJ6Nw66bDPKeK3vhAgokzBUMH1YIrff1SLlMp7
         NQ5jTq/wn1Mn4jvL+AluffZnEGf9Wm+FP/G/j+Inm9WVYi4S4dABC0428Tgjx2HmggXu
         m7rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936815; x=1795541615;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BrMcWd7pvu75CincI1DxjIJtK+iHHZhWACFR9OMESAw=;
        b=ZwYm3hLKh55l6mjM/FueBxFdneo0h2TtxnO0zDcEjacrStwYjq8BUeOC06A61rCDrE
         2MQ4SdIUF+K6IjdovtZyI4fsNQXwBucx878p4Iekk54mCPcqIcnzJRbNakNv+zT9vPOr
         gkMvl8JkIYjVa0lUfIbMx0/TLiSX5xCrG76eaHvBtq1X1Q7B958AVhJiHoNBDemV+8Nv
         cWM6Mbqd6t6bNl8TpoWJ0lQrWcf5AzPVKllOnot5wopO+oShqIj6joxtiL6MK1xm6r4t
         yU/bVpFJRVO4iGJgUYLWhZiSzlOFU/eL8OCQhQXO6Hga3rqbSnXocim1LGLWJ+rH7LOH
         p5Bg==
X-Forwarded-Encrypted: i=1; AL+hErFrYLMD9N7734YRTfthe+ErW2f2xZg9L5+ynUK713VbPkqp+lAvag5/CWOguD/+e3tIIzUpl4iJsZDv@vger.kernel.org
X-Gm-Message-State: APuU4Z+koWUlpeHhHSYE6jhTcfB4Sj9zzc6ivEPq0ZmpkXUP69dtoin9
	9SbYU/WaUnJtQcx6oukO0w891EOyAzTY7kIGWwvsFLHPEtzlzOkgl0AS
X-Gm-Gg: AZFdTZcBu/dABLv0a0MP0G95+c/KtHmxpBExYtfbpOp0tUQzXCqb4nGSsv0feO5W9Q4
	WTYcNg+6wehtNmtz5Hq77Va0rgbIyOZ3l29ypFGBp6vUmgc3BswFDJTGM/NkIsUI3ao1jDismhR
	WPVWbw1UIAxliD72b4GaGbietP0F0Rw8wMVpylPj01z/yxdbx52mbQVFyumMCA016zXmxciwslp
	l7iKP1gl4plnBwRUx532Tm8f+mhJXQUcQOVpbzjn2MxNda2HPPSjr+zftpi4ZY9ILNNoqYKqXe9
	QNcDFf6iy4G4pF1SKVZKeQMCKXkvtLHnoyh46jR5+AysvXejtNWtsAZIjV8FZjCw+b56isYIUnE
	5FmNdVzP57MZW8xNvY8bP8upQRDqEuf8Spuw/lboC6Jwalk4XJLK88h83zeUiH4XeSBPLULEuun
	N+OVRiqDe21QWlAVerRUakEakbDWJwGrXB0rkNh2IKvMKDVIVyCT9wpXLz0NKd3lxlp3xV3rBEy
	8ZK+uvYspE1vGWeYmAUoVTcmzVcLtGlMf4kmekykKj+mWsVPVB9nermgw4BfVi8wZY6raLJTFkP
	XHM6zuEM/yk=
X-Received: by 2002:a5d:5e85:0:b0:490:f775:b00b with SMTP id ffacd0b85a97d-4a63f64de54mr255493f8f.52.1794936815359;
        Tue, 17 Nov 2026 09:33:35 -0800 (PST)
Received: from dl360p ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a2e6c765dfsm8165024f8f.33.2026.11.17.09.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:33:35 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
Subject: [PATCH v3 0/2] iio: proximity: add Imagis ISG5320A (Samsung Galaxy XCover5)
Date: Tue, 17 Nov 2026 20:33:31 +0300
Message-ID: <20261117173333.1853986-1-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116074013.355363-1-tadilhusrev@gmail.com>
References: <20261116074013.355363-1-tadilhusrev@gmail.com>
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

This series adds an IIO driver and its DT binding for the Imagis
ISG5320A capacitive SAR/grip proximity sensor (I2C), as fitted on the
Samsung Galaxy XCover5 (SM-G525F, Exynos850).

  Patch 1  dt-bindings
  Patch 2  the IIO driver

v3 fixes the real review findings on v2: Sashiko AI caught a High-
severity INT-polarity bug in the reset sequence (eliminated by
dropping int-gpios from the driver and binding entirely, since the
pin is already described by the required "interrupts" property) plus
a Medium-severity devm unwind-order bug and a Low-severity unchecked
enable_irq_wake(). Both are now live-tested, not just built. Per-patch
details are below each patch's "---" line, as Andy Shevchenko asked.

Tested on a Samsung Galaxy XCover5 running 7.4-rc1 plus this series
(2026-11-17, kernel 7.4.0-rc1-00023-gdcb8b91fb779+ #30): the driver
binds, registers as iio:device4 "isg5320a", and in_proximity0_raw
tracked a live hand-proximity test (baseline ~0, swinging to
-12817/9748/10759 as a hand approached/withdrew the sensor).
checkpatch.pl --strict and dt_binding_check are clean.

Based on v7.4-rc1.

Tool usage
----------
This series was developed during XCover5 mainline bring-up with the
help of an AI coding assistant (Claude Code, Anthropic), which drafted
the IIO driver from the Samsung vendor driver's register map and
drafted these changelogs. I reviewed every line, built it (arm64, 0
warnings), ran checkpatch --strict (clean), and tested it on hardware
as described above, and take full responsibility for the contribution.
Review comments are welcome and I will answer them myself.

Adil Hüsrev Tepe (2):
  dt-bindings: iio: proximity: add Imagis ISG5320A
  iio: proximity: add Imagis ISG5320A SAR sensor driver

 .../bindings/iio/proximity/imagis,isg5320a.yaml   |  55 ++
 drivers/iio/proximity/Kconfig                     |  11 +
 drivers/iio/proximity/Makefile                    |   1 +
 drivers/iio/proximity/isg5320a.c                  | 848 +++++++++++++++++++
 4 files changed, 915 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/proximity/imagis,isg5320a.yaml
 create mode 100644 drivers/iio/proximity/isg5320a.c

--
2.53.0
