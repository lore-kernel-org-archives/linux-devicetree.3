Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792701001;
	b=ssluFniZ3gEH7UMgxc7JsaM2XUki9UajsczyCJiogYLTcQhAO7hkQH+2TsnE9Oy70aUC
	 RI0bahtkhbw5hkI6ROMeflUK1cgjTokFEqDH0tvMGcGMx5rKiTBElT4ewbhTlyV8Fov3m
	 wyd2GKfyv7FZtnXz88WxYwGCyCDPz8T3hZ5PnBRR+RXyJIuF1G8ZHmHnB+51Jnou/opJI
	 k82wabUQBjhmDGuxxNAWsanpTw15YJqyHQdm8g4gPYkedsHczq+ePMUxV7vg/s0lxUEmx
	 q7WTT+zAaS2UufLEeHTRRgp9EqIBayIXcIpK1vwIhc9oTVz4Gx/GclYsaDPiDiqHU8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792701001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=4OMETinIJovlu+xPrTCy4U2UZUC0fxwIa7F6Gp6I97A=;
	b=028fEtrKPtYYg7Io/3rafZYYYlQFZtPLBJTJcrPJFiGgovJf/TVl3SnRrvniC6lr65hd
	 wRv1EwiEQMFblZcFvbI3T4J/RtvDfkPRtWt56dHudeFuXpGHZp5oADeoI8BM3yeyVAxs+
	 GO0vHMJtiojJPTrfeWFeY0Bs1yJ/mARMNvhJ0YF/xb1i1ju/njvYg71DaXljokY5pc2/a
	 A4BLlIfIXGYo+JPzB0zUUdo0O4qfAJHFq6k/VtWFigwo1N+iazqoXk6wBTppA/W5xsgY+
	 lx0VqCx+6AhyvrsSxTGT6xxc0ezqMHtJi+DbaMmDG4pZZLd/umSogimF0UUKFj3DVoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YJUjGNb8;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634CD606A31D
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 20:30:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 634CD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YJUjGNb8
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36681e85e87so447608eec.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 13:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792700999; x=1793305799; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4OMETinIJovlu+xPrTCy4U2UZUC0fxwIa7F6Gp6I97A=;
        b=YJUjGNb8Yl8mGPCvs89vOVrh3nTSSFqGjw0MJ3lTwQxhMeQoLkz4swbdVDBxLqCcZD
         9Y8YKAiMRtIyrXdOezbGdWQgh5Lz2ZUKrZrCRNNg016N2Vkl+XLC/vjEm+scY1SRl48J
         Lz0g0QW9yqDmEhu9BsHbrhb3sJeZ1yAKDLBPNaH/3VJ8lUayqwbQVeR/hWMzC0sSs+Bi
         9tetxkY9oy2sZbNmfbSgTX3tfXe9ocSTTphOap7cxIfiitCGKk/Xt7Q4Qu9uxmlCc9ss
         NxMZINguawe9KdwWUzt0Yy0TTJPKOL31TvCuoMktQNqORVHEgXgDw1Vv6+lMfID9OmEy
         0mjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792700999; x=1793305799;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4OMETinIJovlu+xPrTCy4U2UZUC0fxwIa7F6Gp6I97A=;
        b=cxr6+26kuaFhOdYtePplelo2BPm2WqRgZy+yjp1c+gnfSB71pFbLHw4MXkv8LK+gE5
         yLKOu9ZyLUxgPWHFsmfzhEMRkLEUkR4q3x9MPw5Zz3hg2LwhspOGciKZpGo1f69alH98
         VVoNQJkBeDJ/4OLWbg0IFyGLMatQ6je7wDUmEYqwJJ5bdDMrVt+4hiQXLlBaeakvIg/U
         mZRbG0TLuuWivt8Jlmtjx9FcfPbFwXyF+1DV75IEkNbjFVckXJjuaRH9jlwUlafoHhSR
         df2tlMyxJS8LwMZJyFvnr2Xndv7hVVCide4swEc3jm9m5jk0qwJC0c42WpgiAM/BSsFh
         Dp6A==
X-Forwarded-Encrypted: i=1; AKwUvBzBrtQZc31k+UyUXLyXPUEh0VKUamcgMfqPPszptt9iNrgWzG6t29f1yOU36D5lVC7waOhphIWeCYFP@vger.kernel.org
X-Gm-Message-State: AFq9FYLaL+L32pm4vjEnpbkAGdsxkAhw+BECq1LdzQcmOBB5odxjnPb0
	ctt6pTKsfkTpvbBVQj3WchrC2HkpK3o/ZG9yCB16PswSrwkrqfoNxWjYXOEnEA==
X-Gm-Gg: AYBFou2QiiLbkqfndTeIYHyp6kUQNWM5lWYejeHd980iorX6YGqS1ULxfiUI9JgYqL9
	bmvSEQRCnbWFJwhisBaPJfu/iS+JE5joHpLSEcP7eFOCR/PGFWgc3usLaJIJCNpnbwdxuQzaeiV
	e4GQ985AwW9NB2t7ncCkRzdULJOBs/qus+kS3OU4aEnRE1Y+LXowDW8b0JJ510SO8bNkCrbbcOi
	XLabtmzJeV7NL1cgMOOr3j61EEwheMV7v6wkzL815UBEP8haSZOn+T/TbQePIcBsw8ciUpJmYMd
	jvY2HB6qdnPmhEj+AqAUa5kcCe0P33yyQrTFmK7UB5wIeHokw57fQI/nIwbkxEDWTzC7F51ew5a
	wSI4ASO6yJie29stUxxduiQjfQBypx0FMalW+qP/v20a+azxNMfroAd1T4HeERRyZ1K7lnOTt/H
	/0EIt6MGw45Goj7bOxrdM5JiNOvdb5C6asC3dnH8t+pZ1mEJt77RTmNcuvSOuPK01OFLop4sZ+d
	m016c4AdjVoVrBXuKGQEIt3fHKc7BFo4RUDl/xB288IXSrIqG5QhuCz2bkoiOGCQa8UUdoUp798
	pCYDovO02IwveMzgDtUqRqwPG5T/gTSSghOE1U9lkqHQ
X-Received: by 2002:a05:693c:88c5:20b0:366:bcf9:1807 with SMTP id 5a478bee46e88-369d983d38amr310690eec.36.1792700999195;
        Thu, 22 Oct 2026 13:29:59 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f2d1:b7cb:a745:829f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9db6865sm283894eec.17.2026.10.22.13.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:29:58 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 0/2] ASoC: codecs: twl4030: external mute GPIO lookup fix
 and binding update
Date: Thu, 22 Oct 2026 13:29:45 -0700
Message-Id: <20261022-twl4030-extmute-v1-0-3d2dbe260df9@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADly2moC/yXMSw6CMBRG4a2QO6bJbaFNZCuGAY8fvUbB9AEkh
 L1bdfgNzjkowAsCNcVBHqsEWeYMXRY03Lv5BiVjNhk2TrMxKm7PmitW2OMrRSh7gdVuYrB1lKu
 3xyT773ht/w6pf2CI3w2d5werLGA/cwAAAA==
X-Change-ID: 20261022-twl4030-extmute-59e516f0e056
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Peng Fan <peng.fan@nxp.com>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

This series fixes external mute GPIO lookup for the TWL4030 codec driver
and updates the corresponding device tree binding.

The twl4030-codec platform device created by the twl4030-audio MFD does
not have its own of_node or fwnode assigned, as its DT properties reside
in the "codec" child node of the parent MFD device. Consequently,
standard devm_gpiod_get_optional() calls on the codec device never
succeed. Fix this by looking up the GPIO descriptor directly from the
codec child firmware node. Also update the device tree binding to
document the standard "ti,hs_extmute-gpios" property name.

Note that to fully restore external mute GPIO lookup on existing device
trees that still use the legacy "ti,hs_extmute_gpio" property name (with
an underscore), the companion gpiolib OF quirk [1] is also needed at
runtime. There is no build-time dependency between the two changes, so
they can be merged independently via the ASoC and GPIO trees.

[1] https://lore.kernel.org/r/20260724051822.3545532-3-dmitry.torokhov@gmail.com

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Dmitry Torokhov (2):
      ASoC: codecs: twl4030: fix external mute GPIO lookup
      dt-bindings: mfd: twl4030-audio: document preferred name for external mute

 .../bindings/sound/ti,twl4030-audio.yaml           |   8 +-
 sound/soc/codecs/twl4030.c                         | 108 +++++++++++----------
 2 files changed, 62 insertions(+), 54 deletions(-)
---
base-commit: 8f7df005a7564bd7ffa75da9c3085d5b996f1e16
change-id: 20261022-twl4030-extmute-59e516f0e056

Thanks.

-- 
Dmitry

