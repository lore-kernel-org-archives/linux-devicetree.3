Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793136733;
	b=WB6qPs4dwxnfLk+BlYmcWg/xXOOIZ0X3uqk6PXmJmkdnVNxwHppA8PIALngqFeAoQrgW
	 T7vLzsxWOIFtJHM6IIabwGaZy7FrKoD0tBfbqbZuIGQS9PzBn9DIlEq799ZYEfgMZIZ5m
	 LpT1bc5jVbyVLhZlPNzzNOfzigZrJl2QvBlio35jBqPRNnKA987zgr0JdNQKKrVhetsaA
	 Q0rG7CgxAoBbYlR4E7W4uloRKh+V15tT2GpZf59NpMwqtu1D+mqC+HEBlzWxLxcDfVBss
	 KBixO3as977lbtbjbRPlE4Oa2OQFC2gXAIAl+M+LaL74SewyufHhDnQHeUQMKXu/QAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793136733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=DJ2w2d78rWYDNrNgxDsC5/JY1fsAdELb1GQ5pSRrXZs=;
	b=K4SjtpM/RWTz7cOzoAaVRNERt84HOsRQPTMdzZV7ro6f70NrZJ4cYWHZi1d+3cMT+hLU
	 /m2eyWt3isNoJTKYzTir8oMkIohPgLF8OoYg8eBGoLeQW0gJk9OQjT4HQV/fOTgHwe8dJ
	 dynN/FVywdVaSZnQOAXgV++3wks7QvX/PX1KEAtqSZdJyQW2mFh3yfHS3FOlKW45vQ4oj
	 eBdq0d9EwIVIMGYsEQ0Zhrfd1rA/dO7BYPx8L5kmWWqqRtL5B9oDOY2iuCjwPWXLabLXa
	 1BSvyWwvwTk1czH01780BTmQXJ1HordnrYWVV9i2ZyVMiWBz+msUip2oITFXLKA5W+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p0IBx9JU;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079DE606A330
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 21:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 079DE606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p0IBx9JU
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36a121bb8c2so395635eec.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 14:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793136732; x=1793741532; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DJ2w2d78rWYDNrNgxDsC5/JY1fsAdELb1GQ5pSRrXZs=;
        b=p0IBx9JUeqLNQKKLgrDYtI9hCHfsipOF+VRGSGZFhrAy0spjEU4EHRrZKKovrYz4Rc
         RcDEV8+9d3MQoV0Gf2/oUpywHi8OO+b/NjKIxbq902elA4BvzwXjzgU/Wrj4nuqhsiis
         9BfxNsq9c28+btj3j4fxeUQqeVFhTXffpY1WwwcIF8Uk2LXvmlyiOPqongxcvaUpgzoq
         CQ644GdTW2dZJOGWO53sPVN2LDYXpLogY59psQlgdpI86Eh5QFy7CR5bKwHshjLUCriO
         nGsnvHCjpJm3Fey03vtRohjfOrZqz36nI3fa5Lg/cQ5LqEAdMWdYiM6RgP42Fw3ZyyP+
         9coQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793136732; x=1793741532;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DJ2w2d78rWYDNrNgxDsC5/JY1fsAdELb1GQ5pSRrXZs=;
        b=lJWHxBHpfCJl89LLl+xI9BkLgNJzUS8xh5e2Bt6bDb/VAdwFj2SoH5QIbHhhjS64c1
         4Uh1g0Fvb8SDCJnyX0FkGFycsND/E1YBHyOGb4tszZH3V/1/LcU1npiHfPgJLDFYQmve
         OaMve6jJEBghnpi0fmmSumLA+Nepq0BimcQEdjXz7Q64jGHBshX3k3N7w1/o2U1/Kdz/
         Dq6a9eX6OaWubDyM+l+WtNkOWpTfHJjD+SbN1w/SjkCvx4sBOleazGGs+o6yx7Q+s5bA
         iB2aJ052dRlbzY8KjIaiYtlKi7SDYzFsHyMrvxgcEjjs5ZHei1l7s6i3oW0oFpfVtcoU
         3uhQ==
X-Forwarded-Encrypted: i=1; AKwUvBym6dY9yLvKeNWKUGXLVh2css0lQT4wnEtMDn7hrgkk3ovDxh/A1mABh0BQiw59iAUeLQIZYiNgKPrJ@vger.kernel.org
X-Gm-Message-State: AFq9FYKbCmYc++XZoZITP0ToL4sjyj4Ev/OYn5PYbTJ+207KMgZRyzRr
	sH88HlfvH5d+e0sHuBMdCqBJP9k21eFGgd0GwrNZvLaYapOiA4SLw4m0
X-Gm-Gg: AYBFou1/mPCLUF1MFef2aKfT5ZcV/3abQc4CUOpoAXTJyuQvlYmwwIxCzwvb9FxrxIW
	MseqrRrnAIIjuI3BQuHu546LvqLmQ3/LqTSELq511u/Ia8zaIMKIMjrGzAjVr/n4VbuyHlkqXA1
	4Y/WitrVoxRzAbL1bnpawctftmHIJKVji/ntSDVbuX9UkoLSX2/EfDLNjfcrf05lwOrfQ4HVnN1
	EjmIKFYFEJiiZsEUBXYzTgSlYxB8XX8+eztvt/RB+c3F1WbQ2ysol/CTq6KeBzItWWxMQIzL+NS
	li/ZXbMmWi5MX8t+gjWypqLTXB2KCvTie4GKslu6roZp/gg+762P4+Y5wScoGlDh2SLBVejFh1I
	lt7lLTL+tbmJxjprVtYrP/aY9nqIxSLEnfsRBHnTsqilLH4gSi6QyJok14Mn6dwUn04J9Cb9Dw1
	I1PDlbhdMYUaILdLO1uDqOXmrmGO+rQOzuv5exIRe6BTusIZlMK1nRnN6e7HKmiROhe441SI/Nw
	Sqq+poj5HVgA/O0hjRCZnGMiZFlUksBcQ+sPc7r0DS9OJnQ2rYu8ofO4sIEEzbKCxU70SWiEsuI
	JdlfIX2jQ3RgTIo7hjPx8EFB2BORLF/UjlZadumRWP3E
X-Received: by 2002:a05:7301:578c:b0:369:f644:fac0 with SMTP id 5a478bee46e88-36a2253a951mr181484eec.8.1793136731987;
        Tue, 27 Oct 2026 14:32:11 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:9958:9525:7799:82b5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm61693125eec.25.2026.10.27.14.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 14:32:11 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2 0/2] ASoC: codecs: twl4030: external mute GPIO lookup
 fix and binding update
Date: Tue, 27 Oct 2026 14:32:07 -0700
Message-Id: <20261027-twl4030-extmute-v2-0-c7e0c90509a1@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAFcY4WoC/3WNyw6CMBBFf4XM2prpIE1w5X8YFkAHGMMrbUEM4
 d8FXLs8ybnnruDZCXu4Rys4nsXL0O9AlwjKJu9rVmJ3BkIyGolUeLc3jFHxEropsEpSTrSpkDE
 xsK9Gx5UsZ/GZ/dhPxYvLcGQOoxEfBvc5L2d9eP/rs1aoYku2YDJoq/RRd7m013LoINu27QvXg
 8U+wAAAAA==
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

[1] https://lore.kernel.org/r/20261022-gpiolib-of-v3-3-42c3b6439fba@gmail.com

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Changes in v2:
- Drop redundant $ref on ti,hs_extmute-gpios and add deprecated: true
  to ti,hs_extmute_gpio in DT binding schema.
- Link to v1: https://patch.msgid.link/20261022-twl4030-extmute-v1-0-3d2dbe260df9@gmail.com

---
Dmitry Torokhov (2):
      ASoC: codecs: twl4030: fix external mute GPIO lookup
      dt-bindings: mfd: twl4030-audio: document preferred name for external mute

 .../bindings/sound/ti,twl4030-audio.yaml           |   8 +-
 sound/soc/codecs/twl4030.c                         | 108 +++++++++++----------
 2 files changed, 62 insertions(+), 54 deletions(-)
---
base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
change-id: 20261022-twl4030-extmute-59e516f0e056

Thanks.

-- 
Dmitry

