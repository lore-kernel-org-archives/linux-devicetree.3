Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793307513;
	b=TADCCvMsZp/n6+dp4dq4BConv8loEKvHjPkW0Ab24WJGXMFdg+yg/332B6c/+9IDTN/T
	 Xg+8lnm8yUinhb94zIqFMd+dbc1xp4y+x4TEfIu/HYx2qZ8Tv5W0zh6wM0UU/Tln+8XzL
	 83AAgCTlKvhxmxz3S5tkmO1mFvvBx+Go6gGvMYcGjorL+Abtw4NHe5/rmnNE2A6AJfnYU
	 Tsf49+ibHIVyCQm11nodRDdDGhY6sIhjOpDZ+XFHKfJUsFMR5imoW0vsJNVINobZ6rULm
	 HnznB2sE9SGwJFeBRGuTO4F699XAwX0CIx91JUPiWQ7EydqZturG/xKoDMzn8YOgS1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793307513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vJc9UrlLUv+S95tnCqwn/5femZD84UlV/9ya3KCITd4=;
	b=J0dcOwiHGDJ04Z6F7aU/yQOmTR2vVXSj37kSwYBL1gJmVYB4tJwtT1DHJGurD4D6t+C1
	 lQGbYG+dV0XpPCuwSMXaiPcEbc0UqeDtdN2PKjMK2/B5CoSwipf7yk5DlZ2m9I7LsTVMz
	 QvJp2HOZ+bKooXzhCdL8dHUL3j5eBa4SiSqb2d9eJrtptFPoq4TwCJ/1Pwz/T2MmXZ9To
	 aq2O6TH/k+bhfEb7dJpXIc7ODY+S8LaC5GMzZsRUWl/tznqNCg2ku+lC1oFsyvl4p4LY5
	 anI6igViYV2qc9a3Y6/ZhCebgNmPG50vS92Zidxge1W3DO3wiRw9K+11d5+es/v+1hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oB0t9wmP;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E8E606A31D
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 20:58:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10E8E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oB0t9wmP
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-533778ab0bdso32185481cf.3
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 13:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793307512; x=1793912312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vJc9UrlLUv+S95tnCqwn/5femZD84UlV/9ya3KCITd4=;
        b=oB0t9wmPgxAC/S0fDg3EZs7xCLtVK3YHshZVTDa81EOsjFHNhzJYqakVjqFy+QM90c
         aGy6r8dUnJoyKyIthAVQMMK7qGtV+KjP97OHeWh2k1hlFxH21y4EnhY968eNhjUS279+
         xmT4FlkMkP2dqxFWPqHfUljy0sPL2OTmcZePbh8LbmwDEPwi+KkFcDj/2FGcaeIAa+wk
         3duqIfxCufkiQA8Qh2Gsd8da5rik5EfsU67F1WikEoFcLAcxfiWzlYqj5jJGssIWq7Bx
         9b+B2J6EK6UJzvUbn0nj1SSVviHuQcRxtJN5xfJ1n0vVvDay45j/a14H38BpaNoevm5j
         njgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793307512; x=1793912312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vJc9UrlLUv+S95tnCqwn/5femZD84UlV/9ya3KCITd4=;
        b=uMjbwk2xHQCVxUCzgKuw6S+7o5priNnboNDq/d7BePn57q/hZh7gSYGB/JqG5UAQFK
         ux05LYpjMonrWPWXJ1B1Xnvm3l1aZ7hq1vLDv0uHTxmaUEVRb2tgNuLkXmozBo64NNe5
         eP9m88WDNd27vaJCmkfF20LgqodfbJu8F71q34a1yCRnYHhvuyGfB8zLppxUD55jzEXh
         Mop4S/tmt24VFieJD6eTYsx5bv5ZRpveWxU5rU6qjQCo0VduD7kFl421DKJONt4+EFQh
         cwefruMP9g6HvIBxCfbQGJ7yLwLI9xJeTsynfm85HAXh1Zm35fcIx847RVIH8rBDs3OV
         QF8A==
X-Forwarded-Encrypted: i=1; AKwUvBx8Qd6s505lIC3UY7lLZI34duU9pQ42oIHvNHDW4zJIamYkWNbtXtm5QHDVVJNnT12bpmp5gvLVAdbu@vger.kernel.org
X-Gm-Message-State: AFq9FYKyKpDoGBy3zgomejca4k5eG8UBtUB+FD9zXpe/IQpB+ts850si
	19Dee0ojC8Ygsj07jf2siNaIekkDAJRAn+1XtiBEa3H1cTYhDwiQODkH
X-Gm-Gg: AYBFou04Ks11coTdNvGhUBJKpHXeMj6yipdfp415xi3Nro4RZ1HYfEbaRBMeB9SMKLE
	pv/gT5BY2aeORX+03vjVuyVw0geIQl+7KXFhpylPwvbXkv3YBK1jmpb5D4P6+isRiTdcOrCRoU8
	GG+cCOD/LQPPhmXB596k+FLjVl9s8/6sy3zYfWjybYFdm4WSj+J3mu1HFmG3FXTL3mNM8SZuKPe
	hLp4u2krgZkrvxYvYKMLRo3MoAP/oKuoSe+603w5/18rtF0Ny4RbNdvKYtnZnAzHMZp6oT4JoXr
	DsiDMANwPgNkZVUiQorzC+uhjBjCyeWzxgL9USOTK9T9j2M+/tpxUFFACtSrFhWk4EyuGIfc61o
	ReiTyg0TlZ5LCcCFGVTVVPOovif6/7Wjf0Y2EO1rn5kOz4zJbP9m8sDU6IXqKNNY4HiXddw7nJa
	xbEjydSQDHZVygrNL9rcv+VItA6yN4Yh0KqB3Fi9uY542GnCA7i2PnnI+Xjoc5q93m9P56JZyrH
	Q5U9uD5KUBBnWfUvVAFKgttw3KFfGqQLeWcotpYwdL5UtmeMByV8jY4OKDZ8lYmiJF9x8R3mNAa
	4QvKep2n1ZCc9aAJA0BEUk+Jw9/lH4pCw464s3wsOZR90wgju6cbzpeh743j5fA1xu3T
X-Received: by 2002:a05:622a:50f:b0:536:71ce:5d0a with SMTP id d75a77b69052e-542b83f1f2amr3961121cf.74.1793307511973;
        Thu, 29 Oct 2026 13:58:31 -0700 (PDT)
Received: from holowork.tail3176d.ts.net ([71.104.86.121])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca31032c9sm6006136d6.21.2026.10.29.13.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 13:58:28 -0700 (PDT)
From: Fabio Piparo <holofermes@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Amit Barzilai <amit.barzilai22@gmail.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fabio Piparo <holofermes@gmail.com>
Subject: [PATCH 0/2] drm/ssd130x: Make the SSD1322 work
Date: Thu, 29 Oct 2026 16:57:49 -0400
Message-ID: <20261029205751.3513474-1-holofermes@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The SSD1322 has been in the ssd130x match tables since the ssd132x
family was added, but that family was brought up on an SSD1327. The two
controllers share a RAM layout and many opcodes, but the SSD1322 takes
command parameters on the data path and differs in several commands.
This series gives the SSD1322 its own family, shaped like the ssd135x.

Mario Limonciello's connector luminance series [1], not merged yet,
sends the SSD130x contrast command to every family it does not know.
The SSD1322 does not have that command, so whichever series lands
second needs an SSD1322 case there.

Testing:

  - ZJY 3.12" 256x64 SSD1322 module on 4-wire SPI (mode 3) at 16 MHz,
    Raspberry Pi 5, Raspberry Pi rpi-7.3.y kernel (7.3.0-v8-16k+) with
    the ssd130x files from this series in tree. That tree also needed
    commit 3dcb0564c509 from drm-misc-next.
  - Without the series, a modeset and a full white frame leave the
    panel dark. With it, the frame is white as expected.
  - A KMS client at ~200 fps matches its rendered frames on the glass
    through a camera harness, at the default clock and with
    solomon,dclk-div = <1>.
  - Backlight brightness 0, 64, 127 and 255 moves the contrast on the
    glass.
  - solomon,dclk-div = <3> is refused with an error and no init is sent.

[1] https://lore.kernel.org/dri-devel/20261002190030.211356-22-mario.limonciello@amd.com/

Thanks,
Fabio

Fabio Piparo (2):
  dt-bindings: display: solomon,ssd132x: Add col-offset and dclk
    properties for the SSD1322
  drm/ssd130x: Add SSD1322_FAMILY and move the SSD1322 to it

 .../bindings/display/solomon,ssd132x.yaml     |  29 ++
 drivers/gpu/drm/solomon/ssd130x-i2c.c         |   3 +-
 drivers/gpu/drm/solomon/ssd130x-spi.c         |   6 +-
 drivers/gpu/drm/solomon/ssd130x.c             | 277 +++++++++++++++++-
 drivers/gpu/drm/solomon/ssd130x.h             |   4 +-
 5 files changed, 310 insertions(+), 9 deletions(-)


base-commit: 21803a577cc692d01307102799f795a606871212
-- 
2.53.0

