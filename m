Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109242;
	b=HmorsACbifOF1quOjEuyxpBIwnamEjx3zuYcUiPlr1bh3F3gsWJ3iAvP4fki84UWboBw
	 HroWT74mk/tEalV1RNaTF3F7mBfCLGWnTZc+Lf76LBqYL9Y10xhmpEt0TuNGcamJHdJR1
	 1DIiYviujDHAWI5uQjcQhorcn6iEZ6frN9uRB0nuklcAvpV3bPr+fbLlDL/j/C922DTaf
	 9b0M5YgpSXacvnqbm4dAw87y5PRsTIMTJ2XGAU1q/JUMGX9MqXQod1hOyrycc7jxqeKlW
	 OzC8T6tnWyhTwc9pilNNvYkaWqh9SQLlVRyKWulIeg8yxcuPTWBOSS9ZwaAJZXyRqAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=udMEtEpdximcj4tmN6XEoXZYcbf6JGtTIKRmg964qrM=;
	b=5dZ60KJATZxm52XGrcwoHpiFub80FD7AMKbPXw8ZsGSntgvURIqDlciAsisN8+EEk/hj
	 weqMji9bi8dv72Ov5f05UWMKYn3FNAxYR9aOS+W6+uOLcHdNs0uuA546xKy60Bnc8Ps/S
	 lYnQcTSU8DLvD4LxrKOcjUJBx08xnKlKeIBWQEqeXTro8fX/AaEMwXtyn0cN0QqvzBLyN
	 LWZ4Y37wSCWdSck9gPw/kJPQc5d6OEjg1sy/+OW8rRStYgVlKFu88B7IfmW24d+M6CefI
	 ZaLE4aUMBrq5SJCv1uTPJ4GLkEqL2fIyJ11g4A8I2SoGKHBMZXSwFm97Yt2+nFEewGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oimiZnio;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED1260A2639
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 13:54:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AED1260A2639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oimiZnio
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1990544f8f.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 06:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793109240; x=1793714040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=udMEtEpdximcj4tmN6XEoXZYcbf6JGtTIKRmg964qrM=;
        b=oimiZnioitMUEnEBSrenFhRbAKwenXYmVyqgKmWsRYCXK/JKGbsa6e1hchO+K8E4AP
         aKqtDi+/aJJxJ/ZpulCQo0A0FFLFB/P4ruAZvVuMg/2UK5Qi5nmFDuEhOUZtyGtwcLe2
         Cy+j4nHDSbUeCVSFCVw+TcY43hi62SLj4fCqzF/nem7rtyWJ28BtO6lO/RiZua4Xss0f
         IIxPsaHdtd5IKWoq+iFATJQSwz14z2HjyaC167tn5z93TbWRuy2QukEXN6vuiDh6h7kH
         IjmyOEcbEQ6slNZxbs92lcTHtMkLRShklgeyiQ3bXndapKr3p3emUgxr1TirGAYeVUY0
         6x/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109240; x=1793714040;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=udMEtEpdximcj4tmN6XEoXZYcbf6JGtTIKRmg964qrM=;
        b=FIICibGsbcoWy2SI2EdN79moxynwUBov7zAJYVOfAbDyLxESUHyJ9K3TNCbthXrF66
         NsDKeNFU8vUt+Qw1OMfoT+bEPRQnL38tfDGTYiyPK89YmTJ3lzQKHIQ+JUK2KtpwkAdy
         4AL07RbmsXD6lAFv7SW5RAZ+a7C8NNxvZmAvReuZ2pVX7i8gDErMYbXPyFvbI3CYibiy
         rB52M1f5WFfo+iC7A0hxQxLRuyYqAfUHpy/s8lkvuRJz+DcqBLVnqScF5efMEMhhtY5o
         HAUtYYSzcTa2kyb+GYhn1lU+9+t7vf/1VZra9L4OzIJGY00kQI2rKw3mJUxXp6HVE4g0
         o8rw==
X-Forwarded-Encrypted: i=1; AKwUvBwWgGSc+muLKezoufLk3h92p7Yqtt50pM/E3dF9AZhQsWALTVzhoMgY+XTVb2GEJQev65vsEx3az0JJ@vger.kernel.org
X-Gm-Message-State: AFq9FYLW14VnXj4lSWwJMG5tT6q1kMEhflODIiXyJLh5RhF8vwZw87Ez
	bwIdel9Z++LZp+4cgjHD2CsbyI9C1YkPHmvKYmMPF16NrKa0gPy8D9p0
X-Gm-Gg: AYBFou1R19xp/+G/iAa8N419OHTch0JVgBlIHrwsFNag9hW5GbNRSmpETKIO/wlfxvm
	T9Vk9NPRN6PsZR6CGfcNaxYiYt7/fi1x7tKKb5rDnXz40YQsLA5hi38u+zmEWK23IA0VZvO2pqb
	xpKTbh4WzIzzvnjy5h8T0+1Cv7r45wIWZh5pBszNm56mrhkBNe5fsmS9UFOCQbWqbunNPRf5B7H
	nXMdfEuK6/y1LmrsMcnBcJce4HIMHPgrVXP2fd/QuWVdYonoR7TiHH5uaWmodz74TrYhqt3TaW1
	8hkXUa8xhcg4OuDG2UwSGzsjXI6w1sGUDAsm3KtMj4dH0AOpYK2AcSkvpunFDEV6h6EDZG7Zpl7
	ujIHVcNyGHzrY/0TaT0mRpfSM2ljNIqhec+EIK2z/mAwIW868cEAQ3c+c4VWddSQmp/d3em2oB8
	qzPdHC7W2uCCbwll3J2B03UpcdvCvgAZ4ghZ8Lwn1t6qplmovwfxP1fXi3IvvA/+JBj3LCRUMKh
	0ScEKIiVJQG0l1aYHy1YYXhDxG5suJtxGqSVlcu4OluV1eTuX7vG1DkI+O4L6hy+C/rxh+gF2uY
	OPLhi1Os+wXfL8JUzOWHiAZ9Kivj
X-Received: by 2002:a5d:5e8a:0:b0:48d:f56d:be56 with SMTP id ffacd0b85a97d-48e3eb7642cmr19483905f8f.13.1793109240024;
        Tue, 27 Oct 2026 06:54:00 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb846sm23128058f8f.25.2026.10.27.06.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:53:59 -0700 (PDT)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Helge Deller <deller@gmx.de>,
	Peter Jones <pjones@redhat.com>
Cc: Francesco Valla <francesco@valla.it>,
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
	linux-fbdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 06/15] drm: docs: remove bootsplash from TODO
Date: Tue, 27 Oct 2026 14:53:33 +0100
Message-Id: <20261027135342.2003632-7-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261027135342.2003632-1-maximpedraza@gmail.com>
References: <20261027135342.2003632-1-maximpedraza@gmail.com>
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

From: Francesco Valla <francesco@valla.it>

Now that a splash client exists, remove the bootsplash task from the
TODO list for the DRM subsystem.

Signed-off-by: Francesco Valla <francesco@valla.it>
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 Documentation/gpu/todo.rst | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index e6d36f8da086..5e987e18bfcd 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -756,23 +756,6 @@ See drivers/gpu/drm/amd/display/TODO for tasks.
 
 Contact: Harry Wentland, Alex Deucher
 
-Bootsplash
-==========
-
-There is support in place now for writing internal DRM clients making it
-possible to pick up the bootsplash work that was rejected because it was written
-for fbdev.
-
-- [v6,8/8] drm/client: Hack: Add bootsplash example
-  https://patchwork.freedesktop.org/patch/306579/
-
-- [RFC PATCH v2 00/13] Kernel based bootsplash
-  https://lore.kernel.org/r/20171213194755.3409-1-mstaudt@suse.de
-
-Contact: Sam Ravnborg
-
-Level: Advanced
-
 Brightness handling on devices with multiple internal panels
 ============================================================
 
-- 
2.39.5

