Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FBB438468
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784223373; cv=none; b=qvcuQh9yBjH4GFOH03qBSO9I/hkIn3dl5o9VyYhNe+/pYHjXQp9+8Somma2ryTjXbRjD/m5ueBMLcy1o+hmyCEHJoDFoPdDyn4zW7anoFi9nyVeCLsl6Re1NZhEoK99jNJPOED9Hp59zGLiFe8EbyxTCZvtWRPYptlfSRc4oHlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784223373; c=relaxed/simple;
	bh=0/os3UGGr9jC5LqbcRUq37OjhSoeK8XI8arvuQdhT5U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kAxy3e+UAUiOG4/KA5lSvSmG7B/LjLfGg9MUZhdexHsz0WXyd8XuRGOQ+lPewB7zOjwljKRoRQ0ra7nO9rW17KLvGQaLZu1XdXQir56vdlRKaAOk3AV/uAAPSr/0SxC0Iy87no7RmC3NJyOlCGcBGiKgY0kxFh3GkonOW7Cb01s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PedmUxj5; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PedmUxj5"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49546c690ffso3355095e9.2
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 10:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784223370; x=1784828170; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9gGq/+o/q+CruwAzUVUDhA87sfX1odFD/Lak8PZz2Xs=;
        b=PedmUxj5u+h9WgdMpdWyL+A/72DdubHMFWVdwUJL1FDeDAEnCkSOUvZ/IlkIvdyj8E
         41BiQFcqwpDa0kaPweXbmP3H86ROyGmxgubYH3PgXmNN69kHlMp5AdcqM1+5wBU2gn78
         S/PFh4pF+qHSHaQdLT+ytJIHVJjd8VFwrg2oPX1+xC9RnbOL67c9+iRrfzwcb06lHUOa
         yWnmK9fFqUUIK85+nxA67ZCBSJcwP9/g3wyp3giSggR/4DYAYZdmJ/p/XXSMlzqSL3ws
         LJQ195OcNxy2YYo95UcxB+A+9hBGkLGLttLWSWV9b/EtaIkQuIDa76s7h54ZCD1ZjxD8
         P6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784223370; x=1784828170;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9gGq/+o/q+CruwAzUVUDhA87sfX1odFD/Lak8PZz2Xs=;
        b=bDRpciKzAP0hpqQ7+3cYN9rDLW1sl10PrQtUkYEGTd/XdpjJM4KLG+CDTW0z2zq2lL
         oAlfzkjtBMkjGzWQ0867+ZjsvQ+ul9xrV2WNcIV8TKe8RTY1EDZo/DXnv6N1Uk1A22X5
         o39+HtJ0iz+8D0pRYXa/EyDTIi298uwFwlmqNYahH8HZa7TjfXD1a1GivOddX/6kcTkO
         nnyFpTAiXn+XAjbq0thK6mwp6XFG+XyUi6vhkqXzA7a+YeL/Vuifrh5ABWuD1V/e0UBG
         LgxtTyB5kkdbkElfSHco3URi1rTYUaU8bOwVpLVYWw5J236yIy/m4FlCEh4b/TQ0LXpP
         iCHQ==
X-Forwarded-Encrypted: i=1; AHgh+RotyEasN4StE6H/pILwO9f9/fQfWi8y3Puht4r1aPxK2n+SsWtexE3X2l27lYmVsmBIx1LUdHmWeLeF@vger.kernel.org
X-Gm-Message-State: AOJu0YzN+i/mIsZV33aCVjvx2cPtyheNuE4K8El/pO0NaVzVoT+kZvPo
	s2MQS8cEJ2tMzVkRX4hLoEiE09OMwIpAY+GMD6R4mp7AzdNs/w91vHvp
X-Gm-Gg: AfdE7cmgnN3wO4hBQ67e2EIWMNs7zjGtMHrfKWZXVzuq7+NxWd1iwZwmZ8mkQ1gIukd
	oduiQTPCKYHKRYIKx/vey2TQjAZbB83hXc8ehWiauHkQ+V8ephgNu5H9r4X7uGjlOMq0CL/h3fM
	AUrmmCsSuwth/vUWv0p/bi5cXULgnaszB6C2WBgTDnN46WkcKqRanxjw0JT4GdA+rU9CiZjiyLY
	HgdVUVZI8Lcx35Ezrt6LlpLLhFvOIVTAa2F/YSaap+r5/I9LysPVg3tutmp+fjUFgib9dVIttGk
	x94lvu98j6S77ZTGppIsiKeGx/SbiMXRpmo4R/QStqwvVuWjzNVj4VmVRan0YqYYGs00/4FO7Jy
	iBmVE73Xu9ua5qbMuIwNSJdve/ZbnYkKu0Ki7eDjeDy+AJ/Wn5BgGc6gy5FJ+VfK9393RMoHlOM
	IIdy5/4oVOJ/F/twyxECIo2m9SiYTtCqnrRQG+0ULz31c3UOa13n+SnnnMHuS/ustO8es=
X-Received: by 2002:a05:600c:4e93:b0:492:437a:a653 with SMTP id 5b1f17b1804b1-4953c286bbemr95377425e9.26.1784223370131;
        Thu, 16 Jul 2026 10:36:10 -0700 (PDT)
Received: from izzolab.play.pl (77-236-3-190.static.play.pl. [77.236.3.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954812f0d0sm7983005e9.12.2026.07.16.10.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 10:36:09 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Wi=C5=9Bniewski?= <pawel.wis.me@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ak@it-klinger.de,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/3] iio: proximity: Add Cytron HC-SR04 support
Date: Thu, 16 Jul 2026 19:35:53 +0200
Message-ID: <cover.1784221074.git.pawel.wis.me@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add Device Tree binding and driver match support for the Cytron
HC-SR04 ultrasonic distance sensor.

The HC-SR04 uses separate trigger and echo GPIOs. A trigger pulse of
at least 10 us starts a measurement, and the echo pulse width reports
the ultrasonic round-trip time. This matches the protocol already
implemented by the SRF04 IIO driver.

The series adds the Cytron vendor prefix, documents the
cytron,hc-sr04 compatible, and uses the existing SRF04 configuration
in the driver.

The Cytron vendor attribution is based on the HC-SR04 Product User's
Manual V1.0 supplied by the retailer. The manual was prepared by
Cytron Technologies Sdn. Bhd. and contains Cytron warranty and
support information.

This is sent as an RFC because the vendor attribution and compatible
name should be reviewed.

Testing:
- make dt_binding_check: PASS
- srf04 module build: PASS
- Tested on Raspberry Pi 3 Model B+
- Kernel: 6.18.34+rpt-rpi-v8
- Device instantiated using only cytron,hc-sr04
- Trigger connected to GPIO17
- Echo connected to GPIO27 through a 5 V to 3.3 V resistor divider
- Driver bound and registered an IIO device
- in_distance_raw returned changing distance readings

Paweł Wiśniewski (3):
  dt-bindings: vendor-prefixes: Add Cytron Technologies
  dt-bindings: iio: proximity: Add Cytron HC-SR04
  iio: proximity: srf04: Add Cytron HC-SR04 support

 .../devicetree/bindings/iio/proximity/devantech-srf04.yaml   | 5 ++++-
 Documentation/devicetree/bindings/vendor-prefixes.yaml       | 2 ++
 drivers/iio/proximity/Kconfig                                | 1 +
 drivers/iio/proximity/srf04.c                                | 1 +
 4 files changed, 8 insertions(+), 1 deletion(-)


base-commit: 37e2f878a7a660a216cc7a60459995fefd150f25
-- 
2.47.3

