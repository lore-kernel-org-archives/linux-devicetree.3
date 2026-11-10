Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794308359;
	b=xKedbBJ30NMAixOh2QXALV10PzRYuwPDge7W7xQbyFnZLXJ04JHd0uMIES7mM5m9k28B
	 8Xp7QqUsICmNAY9otvMuDjJC0C79W2iYQ7/87uQjSvhJ6DYtpH1jpgdqHuGlL0JYlKbcl
	 1kuDT6vC6p4us66mhwCEXThC3tDWVnqVuiQ93S9No/gKhg9bhXt7DKScBGCS4haqAjrtr
	 m7iiFTu7TXnd769YHN4NDqjN4JsjzKdZOh2NipnOMWPbvaTbVT7g2dsZfhzz5wClKqOTn
	 VJoWN6j1caiG/nEpxeu6K21zd7yjUbwrdro6+8mRvmntR31ARTZgC9cwhYrEhKZ8cFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=UJErp4fTnHGZEK0HkRaGyYzZp8fJDCcyD6a4aGJJ3a0=;
	b=GvTKoftSbyRT9VipMDxN0TlvhBYJlt/CuVeh51YeSh/TguZO7BkkBi/O0vKY1dvM1tm/
	 UxJfkQMwtDeawiAmfcBMPoFfLjdM14ZHx7x5GbVhqiRh9SYpdZP1GaXdM3AE3Kj9M+9Qd
	 uU8l0HOuM1yCUUquknCoDyiR07rkSXN3yq+YU2aQpfKovDmDVy/fYgzGjSOqrtbVepamm
	 GM+9heoH+mBQuRDEKI49hZYclqFC5fakR5peVxHIkUrWNAOKUAuxRJHHuIGyCckfpAfgt
	 IyJLarEJmVRelHPOCj5N5OJ58yYY5mxcCtSrdeaq220/IxO5mY7MxvRDJ17ChYOqwjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oFX9nmsa;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D040C606A326
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 10:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D040C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oFX9nmsa
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so15789195e9.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 02:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794308357; x=1794913157; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UJErp4fTnHGZEK0HkRaGyYzZp8fJDCcyD6a4aGJJ3a0=;
        b=oFX9nmsafQAby8rQXTG/WkdaeqxbPSJ8xyjSHrFnHgYfLLfMf0MAmCOKX4sC2bIvZX
         lanifnfXcoQ6fHZRqustCSmHbExYQ3qxBUaOhH7NHZ/yf7/ZzSo7o4C2eAuis0W/U7cR
         LRS6vErXjiKGUYjGx4Yv5/zCT0L8oW0nhZnI1OpZoy/ZPdYyPYlZCLDa4mjM94gPPiCP
         54O6F50PyMrzWywTH5v9YQtUN0GtFFkOMh3E4wdB3EA+tnlXkagM5g6YbcuKXOodHXiQ
         g3Z7a6HzhqVBKrdhEMEnGhl9oDeIxac0E7/3WtCz41sM3dUNJFlEk/J0mBVI97CSsiFh
         H1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308357; x=1794913157;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UJErp4fTnHGZEK0HkRaGyYzZp8fJDCcyD6a4aGJJ3a0=;
        b=mKUiTmrhMJ6jjKjognb+Eg5l5QY3GaxHjGgTjQMfOW5YoJI7+LWqFrE5TyUCnPZ4IT
         6QnnzHeBDZ5jrPIljdwu4kyfrhptWwci8jQ3d8igxjH+BIwPkCRI6BSAwFwGswZTKB6Y
         mmLlf25rFfx/1AG8VOZMgY0pfJ22AYqEFSgDvlCZ6Jt9LIGgwE5ImN+7bUDtchAQZvuF
         r0qDu3r2YNil4WHx55Yx/ZE+dHFBDpySsqvLK7RbRzAYWOr/bz+qMGZcyvaLbXgRLHGn
         G68tiKSmuWu2nDNDDzV8letRnsFEuoOHNVPOalbUuJUgZ4NWozfdgSzNXT1XhugmXjVI
         sRSA==
X-Gm-Message-State: APuU4Z/60hViw6wAaOYx9TIGrIpvhh6ueRPhnn2H1L68jsmqDXF2gjNp
	0PQ8VtKutb3zj0TNiZ3ln7glthp5WzzdSSpRb1RSjFlBR7c/+EGO7nHeD6ko64k5
X-Gm-Gg: AYBFou1JKxDLlrdrrN54oH8TLs9ESmuDFDhniU1PY2LXAFtkX/wxfs0kMclk2ptX4FN
	+k2oQJhPUZszf5WPpiJNQzeReHG8FUH6qW6GAfJvsmcFgS0Gyb1qZfT3iY9TmDmLwmypapuOiJO
	/D79lxCb3fnUxg8V+WlwvQelk5LRAIu5Ct613AhLauFGcjOZUkm2zQEKUGfeZ1sUlmT4YJgPxGK
	s04EGp1FFzRZWtFj9HfEqjJwFSVLt/ASBKaTczLA0TzP0JiPKJgux3kGllMXz7KF62+ZZTYjE8S
	r4srzYyOejpGvZapmd4t8lDhvZWsR60Qw+j4uXyrKGXGlwYobkHDuUwUm1V09zrdp7K2OhFZ11K
	LYu7hqbAEmwAHow1eZezebuw7NLFuh6969eJjrEv+63J+n8k/zoLKDaad4RhP84GDY+8p+6/exD
	RzEuQkCcbNPS1RV9aX6XOamgqhyr41akHXhl66OiIvYzLDXn1i3MsmblYpvEAhyrfI8btLYZr2L
	/3kRXJPZDszMFamqRarK6DEashscKEwBpXFgU1Uckud3J0gFrwGjniUeiEfoXWMvAJDpcuaoLNd
	uRI8GYwt+j0kvSp0fwGkLwuqwNQXTIGZp4lN3+A77Vk0e01DQE6hsBqFUpPf64jpidf3HGjJIzr
	LsRrjjW8+teCevNj3yiuZRje+/+q2HXgNx2jWgXcaJdEx/vpJ5/I=
X-Received: by 2002:a05:600c:3e88:b0:4a1:e6a9:4086 with SMTP id 5b1f17b1804b1-4ba022c9b40mr36726835e9.0.1794308356995;
        Tue, 10 Nov 2026 02:59:16 -0800 (PST)
Received: from [10.0.1.33] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988bdef64dsm2933551f8f.20.2026.11.10.02.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:59:16 -0800 (PST)
From: Antoine Gouby <antoine.gouby@gmail.com>
Subject: [PATCH v2 0/6] ARM: dts: Add Colibri iMX6 overlays
Date: Tue, 10 Nov 2026 11:59:12 +0100
Message-Id: <20261110-colibri-imx6-overlays-v2-0-9776c186d953@toradex.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0Jm7Zh2REBX3sOwKHSQSYCa1jQQ0
 rtbuYDL95L//g6BvXCAe7GD5yhB3JKBTgX0o1lejGIzAymqtNI37N0knReUea3QRfaT2QKaqzV
 Nyd2gqYa8fXseZD26zzbzKOHj/HbcRP2z/4pRo0IuraKmpvrS0CMHjOX13LsZ2pTSF8ftL8u8A
 AAA
X-Change-ID: 20261019-colibri-imx6-overlays-a5da84ebf127
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Antoine Gouby <antoine.gouby@toradex.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1986;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=RGp/rEfbSkTgb/XJ9d5cOGIySUNjBN/q8d0hynymqts=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsj69JNZUnrRga3XGc5UPHh2d8EKpUfHb+/01uYwzVepk
 +f4Jm+8vaOUhUGMi0FWTJEl44mqIJ9CiKwHR3MyzBxWJpAhDFycAjARhjiGf7r6VxitJX6FSvy5
 3MxW9/vdD5t8DfetugU8XPwrWU8khTAydK97pucj3H6ieKUe7+c4wYeh2+rLRftMxQ/Z3HvKtJe
 PCQA=
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899

This series adds device tree overlays for the Colibri iMX6 SoM. The
overlays cover HDMI, VGA and parallel displays.

The series adds support for:

- HDMI Displays, through a generic i.MX6QDL HDMI overlay
- Toradex Capacitive and Resistive Touch 7" Parallel Displays
- VGA Displays

The Makefile entries build the standalone overlays as DTBOs, and add
ready-to-use composed DTBs for selected carrier boards and accessory
combinations, for build-time coverage.

Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
Changes in v2:
- Include 'tdx' in the display panel overlay names, to make it clear that
  these are Toradex products.
- Replace the Colibri-specific HDMI overlay with a generic imx-hdmi
  overlay that can be shared by i.MX6QDL boards, as suggested by Frank.
- Link to v1: https://lore.kernel.org/r/20261019-colibri-imx6-overlays-v1-0-e4d028727382@toradex.com

---
Antoine Gouby (6):
      ARM: dts: imx: Add generic HDMI overlay
      ARM: dts: imx6dl-colibri: Add HDMI DTBs
      ARM: dts: imx6dl-colibri: Add Toradex Capacitive Touch Display 7" Parallel
      ARM: dts: imx6dl-colibri: Add Toradex Capacitive Touch Display 7" Parallel with Touch Adapter
      ARM: dts: imx6dl-colibri: Add Toradex Resistive Touch Display 7" Parallel
      ARM: dts: imx6dl-colibri: Add VGA overlay

 arch/arm/boot/dts/nxp/imx/Makefile                 | 85 ++++++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx-hdmi.dtso            | 14 ++++
 ...nel-cap-touch-7inch-parallel-touch-adapter.dtso | 57 +++++++++++++++
 ...colibri-tdx-panel-cap-touch-7inch-parallel.dtso | 38 ++++++++++
 ...colibri-tdx-panel-res-touch-7inch-parallel.dtso | 29 ++++++++
 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-vga.dtso  | 67 +++++++++++++++++
 6 files changed, 290 insertions(+)
---
base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
change-id: 20261019-colibri-imx6-overlays-a5da84ebf127

Best regards,
-- 
Antoine Gouby <antoine.gouby@toradex.com>

