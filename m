Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793091339;
	b=yOtwoS0gMPh4GYq/f5Qx+inYXpmDorvGjTRcT8i75iqC8xYl9mN1BKXi68gX3qAJVlh6
	 8ai65OM8lM6rfJCHlK/g/08kJ7t3qX+e33oRXKL85TcQZX2qtod+SFUBe4hdnGvM6JQEY
	 xkpQoSehzN8T0c925lUs0l1DL3h3uAOiUQ4el6ffPlnVwvKYTBuv4K+qx0aH4crSpGu3w
	 3FY+cggFEzxP4DYKMe30vtZH35ZED1grgZGkG3pWzRINqQN8Ulcd0093vhZ1wdcaB8YYU
	 dtdfkvUrohvZQGExJt8QksUo6oU/BeSUslezu2bSTxv/99w5vS23OcH5UtMz2k8aMvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793091339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ho9s6p1VYtelviR5lwhrV0eO33rHviRLYIfI2vUHdcc=;
	b=TGBqsxO9tB3tib56fyL8+SGJ85E6BXjDREQKn0i+4tylqNFqpD1atvfnrERS47PY7f+k
	 koYn7bFKVFJlj8dDDsHp9mtrbomcw8MyhKR/LTwhcOMt8ZbvmCjFoDMWfyMig1usuiabT
	 xv6+CUKGTIR89v1Pf9QoM+hETPyv0y+lnL2vp1/stQyuJTEOZ60v8jSQEh1c/xH8eSO19
	 j3o9k8OSFzP6iUhV8OSlIk4W47nkvd45h9MxIv2iG6RFB02IaEdkqW7j7qyosPtfXjnkO
	 ghQNQi08v0ztK/BLVLBl5IwHWkBd5hZNzhuyHzR1mnnpwFc/HWKqZ+HBDl6lcQhVjSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="b/So7K6S";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1E4606A31A
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE1E4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b/So7K6S
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so24206245e9.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 01:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793091337; x=1793696137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ho9s6p1VYtelviR5lwhrV0eO33rHviRLYIfI2vUHdcc=;
        b=b/So7K6SlEFKsKvpppdb0hN7X3ShpUHrDkEGpm+hdOpeXxye9etaE6J4sCSorRx3kM
         czfbxf05jtinPI2aiL8CJUaJjly9emI8ccsoyRnDlB0y/utbspCSYppB1MNcHPV9jGyh
         FUJyQwkeHy7tPIlYCOPYwSwuqAcKiYnb9p8e4vO6DoqVrdAoCSc8LHdqe5Fz5/Ajdid0
         HHXRDz1KMi6u1gdWUd1XyLiRq7erydGtwKm5Bus73oAdaLIEOf6z0IMjI+GLbqBKLZzv
         /pT74T2RTSe8g24UmLOQvAI9UqpdneqrpOjG/H42u4dI8pkQIqf3tFf6jrRXs9jtgNpq
         /q4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793091337; x=1793696137;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ho9s6p1VYtelviR5lwhrV0eO33rHviRLYIfI2vUHdcc=;
        b=xXglLwLEJCMPWyNMoA71J9VrlcqCZmSsMomdfhJ8nBDLHi/BdEff7ntF1nt48S5tBg
         useuR4loDk8G4HI5zfhtW/FWfFcOgUtK31xKxSlqa5XBhXEV29hZxTbgyyyNWWu5i5/y
         p2TXMaykS0kWK2FFoEVlWK/t1mtA3pK9Y10zkQtRaCUsQ+jMUxAfcSruKShWdoE54dhl
         gzjXxEnui6hz9QIfSKJZngRbk4pAtUs6Vvpky58f7yWyRXfWFLFd8Z8wUWZYXfUs+UHL
         vfnCL4VeTccHHwS9DhESwm+xwM5Uwa4QpLp6utlOCJPfSckwbYTukIUuNvabb49od+r5
         WMag==
X-Forwarded-Encrypted: i=1; AKwUvByGloEEgi4S5RFubZAlh29Xn0XOC561yfdI3LDaJVJNShkg3f0Rgw/eqBOzif93rR7qm6QpzPq7vZxz@vger.kernel.org
X-Gm-Message-State: AFq9FYLenmNOitJbqzmU5kFgrnzBwZ9DoO0XBgN/8CehA4cKEjnx34dZ
	UZXeW+Zn2BefhHtGD6diyyRxQsnxzIegbrFsI/2yJ1WdXMRS5u/upSD7
X-Gm-Gg: AYBFou1hmY+K+qLUqentW7nzoqyRf9bz+EpggY+vSCiaj29foYoH+FspmyNqDSU3Z4v
	Eee3hKuR50v0SkbEqpJ7BBJO0xllSXcMsn+7JEtxmC5eIKxRtvfEKNDbW8wUa0UwG+o1InOL/20
	uknMsiVPb4FezzVP4TRTChg/BriQeDYwitH/aih+6h7kb9WwP4XPcWi1QRzM1mQsKLFIkatNJ6g
	/0mOhbcD1HeVb2iQstCQphFRj8yvQqSJZi28YPxbEwMRXBS8iFUylEksacemM9HhgdWaB0qlCoQ
	SZDQjA4wuZNUOIuY/Zo7Hh3E9dVpUICyMchDVbc1FcyBqh5VjPT5kKzZvHr4UvrmfYy6fVI0RME
	tryvdErU2H1PTn6pwoy0Mr0Fg3GhG1xCcTI2IkunIIG7KfR7FQnNRIygkV2yOpCZ/IBAMzJmKD+
	zRC1jmQmwbFJsDWI5PyPM308vcmW7969G7vWgvN2ccUuHCYReLxgH/NBVi49pGL7DVbIYnSn5Qu
	XOZ1dzwze9l7WkEHIyYGrN/UCPgCTpVH8Z+x2XbfjOVQ2qbHy9lPF/iUBXmnk2dgd+x/KbqQOvD
	GLoax5kZ
X-Received: by 2002:a05:600c:3544:b0:49f:fd40:80fa with SMTP id 5b1f17b1804b1-4a35acc6b74mr187900455e9.34.1793091336983;
        Tue, 27 Oct 2026 01:55:36 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a09434esm249835425e9.0.2026.10.27.01.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:55:36 -0700 (PDT)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Francesco Valla <francesco@valla.it>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 03/13] drm: client: add splash client
Date: Tue, 27 Oct 2026 09:55:34 +0100
Message-Id: <20261027085534.1746021-1-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <645c1c2b-9aa8-44b4-8a67-dcd7bfbe8fbd@suse.de>
References: <20261013093243.505776-1-maximpedraza@gmail.com> <20261013093243.505776-4-maximpedraza@gmail.com> <fafa7327-e624-49f2-98b2-83fd602a0ad7@suse.de> <20261021005006.2341200-2-maximpedraza@gmail.com> <645c1c2b-9aa8-44b4-8a67-dcd7bfbe8fbd@suse.de>
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

Hi Thomas,

Am 23.10.26 um 13:26 schrieb Thomas Zimmermann:
> Please drop the parameters for now. If we want to give status messages
> from boot loader to kernel, we should first evaluate how to do that
> correctly.

Fair enough. They are all gone in v6: the colour and the BMP's name
are set in Kconfig only, and the patch that let the command line win
over the device tree is dropped.

> Oh, I just noticed that my comment got truncated. I meant to that "i
> should likely by unsigned int as well".

It is in v6.

> At some point I'd like to have a nice, shared drawing interface that all
> the clients can use easily.

The image is drawn in two steps in v6, as you suggested on patch 9:
the BMP into an XRGB8888 buffer, then that into the framebuffer's
format. The second step should move onto such an interface without
much change once there is one.

> It's probably ok to address things in small steps.

Thanks. v6 rebuilds the scanouts on every hotplug and keeps the old
ones on screen until the new ones are committed. I will send it
shortly.

Best regards,
Màxim
