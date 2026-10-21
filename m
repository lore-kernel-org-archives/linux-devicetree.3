Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792536617;
	b=NapV4QfMDoUCOOgjCdlKJfGjInOExu0oCINoOO7ul+Bixm6pJ6WYmSNCe71kjYa24Z//
	 u3bbhY21JhHjP2w+xcS53w2JvR0HO9/oVkNJk3EjCVsEk/qmj5Eo2wjxEnRnaj+Og4u1c
	 a1GB/81gmWQ7jNKHiBLHB9TstQ4Y71ApvzZvdpDF7tEmJlQS4g6Ilufke0R0nkbFm+6p3
	 cjwpYHK3smqyQvE/qLXvpr/SR8LY7AvDtUdyYZzi91f/+B35g6APp89VxD6wxgyHYFHhZ
	 hT5qQ8yisSOkJ8BtthSbSIdaL/0WA8P9m9rrKGpcpekrh1OihqBzXr1yqniBnY6nqdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792536617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ux8U6EoVJ4/TwWYPZhWrag3dDFgz75/l4fo+qRdZwqQ=;
	b=koUU+rHyODLKRJD7yotp9ufvnMY5f+D03JcdrLCU9rEJt2LYkv69+MaKCWgpTMaZrK4S
	 jXJBwxiI9FnY+4OKKmy2KSW9pQVkoe4W1b0kkDQ4bC9CXaxd5P8ndY5USciywlhHNBuY1
	 fLsG30vXL4zlruYJ1uhuChlZNX8kUwV9ITY65H6P7JP2sEanjEZFxGzLQljf97rKN9Rrr
	 S1ghmNXkOpapnS3rJjTS+1qHKm0eaR8NL7Xdb7gT8FYtAUiKkwalPU0AMmlwznBHG7nq/
	 ji2pmUEtb8vmENghA4XPMZ/0Taaf/SAm7JycnMv4aIUMxTvzAlnBaUxSmpDcZSuK8yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xgg4e8g9;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF6060A2637
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 22:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AF6060A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xgg4e8g9
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so429835e9.2
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 15:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792536616; x=1793141416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ux8U6EoVJ4/TwWYPZhWrag3dDFgz75/l4fo+qRdZwqQ=;
        b=Xgg4e8g9l9wuL+uMK94dlj39wYD58bkokWU6IXHDrEqFjEn1wX0v4SrdzIFkhDzWZS
         8ouLkCKjKUZhm8g3VXnnGB3Etyxv8xCqkfAeJDb0dGKAZP9yAXPMjkQx3/FaJgfIyIOL
         qd5cIi57sU8hx5/MQRqevp6bGulBcsGqthmrkWG2GnRAec+eZ8oaYylyX89FagTpVYMf
         i5XxQ886ba8N3uWHz2nMLm7yRybHqEdszfjY7kRWiInnMb5VAUR3sg/ovWvtn/Ke37lG
         xdVqDCJkXAiksSuvlFGP4vkc3RX2FntaW9vBtB9eEDJQGH/8iYUwbx74DfSSLvJ4SD99
         MFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792536616; x=1793141416;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ux8U6EoVJ4/TwWYPZhWrag3dDFgz75/l4fo+qRdZwqQ=;
        b=Va+JwhKvvoSZKjJLyChjjuYetOMq7wKlDSt986W+A1HSzgflIhiaEvKFuSH+eZTLjy
         +3yD/lX7BjhT1ibZRoR2O1S3v43itvck04wfk/70pLD6EVuBDsCuYBBVmIvhx1RlVyEH
         aSV+NL9WLNSW57gjqyFVfgY7Tart6pkuUJgplxjP/MlWwbgYK7uoyB4bxyb0Yck5USwV
         nwtWnN9dYvWAUQyha5waWv2qidE6DxtCYBs3U5pj+925OuCIUWWw/xRUQhno6pKfENX+
         TgS+qMawZl1YXmPNIiV3TSAPQs//OpjGChTdhtt6bfC8jPg8gO6bFquC66VNBDGtj0VE
         aWSA==
X-Forwarded-Encrypted: i=1; AKwUvBxji7lXLMHVNrIqrtRn4xcf4HiP5G7j8fK4O8ejM5sGd7IJGodf4c5SEFm+4aBDgELCHKbiXV7cRFLJ@vger.kernel.org
X-Gm-Message-State: AFq9FYKvGj5oNxg42fsXujmhSBPUklAZYpyHu8CceV9P7GaRx4QOCN6O
	gLghbLi+mRvr+oNvT8lA+AnZTETNZuBHi8FWoXc3tN60OIZBplUHjrhI
X-Gm-Gg: AYBFou311WibmDEuavkTGq2XuAsis1ErRUUNdKV65J8Wcx5eGHkeazIPN33Q+QNRhum
	VEfY3LipQfnbrXSgYMNCZiIiwIP+t0Baxn20nI1uqP9bw8CaGO3E4dUU+VTAhu1JVSt1X6Inb9g
	F2KOwWl4JYJQN6yK+ltT9iaG/FzfvEwbIPLygZ4Xggd6hSHYRBinbgVnhV4GkjxA9K5VADgp+Dm
	AgR3NMx30goUPkTz0XlNtf6pBXWoHm2oVc9NXq/+3FutPkSfjFhKiMj/bZahppvnHaEcyr3vOGd
	DgcWdUiNeb+16W3yghRDtQrhyuVzoe1XWeOBxRQ/0fVUNX2s0ZPhUbm0mjWv/1Jekcnh9GbZ4eV
	JxNsQhBxLFGjqQ+2oM4++op+pn1lLFNPHt2wd9ETeic/Rl+CoY6m3l3Myn0kjXE9kvvcLhNaT5M
	UdoMrCZ2lR6cB+yCStgWdd+CTOkudTCdC2VGHJ1Oi/NzD7LxmPD42EHzJp1Mx9kBNQCxnlwpDL7
	wDcmImzt/mnFKi0o2ErEaxx
X-Received: by 2002:a05:600c:3d92:b0:4a1:c646:3edc with SMTP id 5b1f17b1804b1-4a1fdd0b082mr2686075e9.11.1792536615591;
        Tue, 20 Oct 2026 15:50:15 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc0b42bdsm17511805e9.0.2026.10.20.15.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:50:15 -0700 (PDT)
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
Subject: Re: [PATCH v5 07/13] drm/client: splash: add a device tree image source
Date: Wed, 21 Oct 2026 02:50:03 +0200
Message-Id: <20261021005006.2341200-4-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <9834b569-935c-484b-befb-b913acead9c1@suse.de>
References: <20261013093243.505776-1-maximpedraza@gmail.com> <20261013093243.505776-8-maximpedraza@gmail.com> <9834b569-935c-484b-befb-b913acead9c1@suse.de>
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

Am 20.10.26 um 13:04 schrieb Thomas Zimmermann:
>> +/* Where the image comes from, in order of preference */
>> +enum drm_splash_source {
> The logic behind this enum deserves a separate patch, I think.

Agreed. In v6 a patch of its own will bring in the enum and the choice
of source for the two the client already has, the BGRT and the BMP
loaded as firmware, and the device tree patch will then only add its
entry.

Best regards,
Màxim
