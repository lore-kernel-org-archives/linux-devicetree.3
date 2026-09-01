Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9C3370AE2
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 21:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788298953; cv=none; b=HYw0hiK9LqXULYvfAWrmP2k43gj3JUKa0C5/5wmqsb1o+aqqn5NSta1VNyxEewn7qP7ZWYtgNqoQbZZJ99U1u7yGGO03ZTFVqqqDSA4hhYDPw+rI3nGsLyR0TaSBT928oSUhh+wqD2SljaNfaV9KB2eFcSd8LP9meAk9uIokyYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788298953; c=relaxed/simple;
	bh=81GtuhM8WPaQORq30yLJ9T7RnVg1D0CM09jTFAW6Whg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UDwrkxZkeKB9YLDY80cN8ZsrHXShliwgpm0+pxyKxd49IG3S22HjyGc6mBBgnyrClUiMil6I1TV4qj/3wz6rFNor77XSWTjuV1jFgRKpXz9+ZyAczsJmtngaGHmW9mILAjl+bKLVHXbL45ObfsfKxJ35xEuOtpPU40LmPKg676k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mOaowlb2; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mOaowlb2"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7e9ecd7216cso203228a34.3
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 14:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788298951; x=1788903751; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=y249H53XhLZ2onZan6XPWtvu2gNoxIJKlrKV115uQNw=;
        b=mOaowlb2nBqpA2MI2X9Q+0Oy7O0HGn49oi6X/L32JIQ8IB9uXwckHU+rdRSJbtfM13
         ewJfJvInM+eDOnpta/LlkkqZJfN5qpd790gj7UrVDuCmS5PDNKErvjBhDkxcSngNTtgO
         bYAjgbqoEfQ8KVvdY4EARjiLQsIFXVpku+geSOdsrcAbdjH8gOMXZYCf2wUGMfZtu8pa
         GZ7A9CKJhYVnygNSyli+iEKnJ4fGbHxo5/nctCjQDw+mmuu5deRZ7WyIfDCob9Lu19dA
         dRtmXMgk2EbAtm4AEnlZl4h3mfVd5yH0tuMXrfFEbmQn7PIOLd5WqOR01XYsDnlrTAdE
         S7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788298951; x=1788903751;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y249H53XhLZ2onZan6XPWtvu2gNoxIJKlrKV115uQNw=;
        b=sJLKIyy5Va5No7oaubxjT4fByN0CTi/1XAUBBUGns3VEv0g6QsKG4oUchTf4G6GKgN
         2KtwzKkef1684JmoESH4LbXEgo8w3WqjYCtS5de2gvIeJ6RtXPhY/b6XV/bmFjw1BRQy
         OKagjMErkXnnV/EKYQll4QqGOE7tnaPtD0nbZXzUSZGyLH7n0MT3BXErB43+DAqqz9kP
         il6mJS+SoozACWxFq3z8td+sq11urryM7Cxgtbx0pM/Eaf5whO1JbYfr60hr7xTdM98L
         i/fdHf7MDA7vhPjZIpqbLE4PyoeNY92SFRGlTyNvouGaY6wkqWLFY3cMVkxj3yHo/5Nr
         PBDA==
X-Forwarded-Encrypted: i=1; AHgh+RrjW/GFlRJj8Zvth/5Z8ujwrOkXtcJp7cdw32N3u01V66/NzmOCSJLYIyFzJZ+AnDlZZ63zduQb1Nt9@vger.kernel.org
X-Gm-Message-State: AFuF++kZuO/qKB63jZ62az1kU4nCDt3X3xXif3nSkvQTHw3tLM4NhicD
	uTNmUyDmfwHhG0Ef+kDwpDrZSJjBw/eOQI/Z+3XvpkbSeYfujLhn6bAm
X-Gm-Gg: AR+sD139uC3CvVBN0CyOUPmzrkjlu/5BsXjIq0tthrFYJRy5qpm3Br/6TCiuEWeexTr
	P6q/J0czfhzg9DG3t4QyvJChboo1wIJVp89+SK5R6zl+s4coJbrwZVR8ZU/0yivrNz+zQ+uOfDH
	wb+W2a6+dKerXfcUU8ndEYA7MRwbmuc8cJzYTYtvtfnujup6zrSf4/ZUjavIGBRiHMWMvoyRCda
	B6/J/cCBMDtWfQpxQzKpKuPteAJgGxJtjHYt0tw+8T+dumzCuMAXJF4wt4JMjEJQP525BLacbr0
	l4cDZtjGLPj/VXOQd3UMTVxEq35uOGPJyzoKVv+Xd54b0aVr3ONvbWI23NsxdYlRnC8iAZvJ0y9
	i9mrbC8tL/85cBJZzhx545W4P3LKcm7kckIMxMJinnpUiszy5bRw3WSXRPgBDmwojRAzCerUuzD
	qCGfkMfb7KnVADBDbkMDPP64UreToX08PB/f4BuX72vzxUW1PcTSah52x+DY6IYrExjIXRnC0Oj
	IJf9J9lhphGLEaSr4f+jZe1EXBNd0uuAPPeug4tkFz7hMy7nVf3MhSmAcQIIacW3cNdfNAADbqv
	eAwvNoWrrJclEhOsCHUy1J2SDoMk1pJBlBDZvXhNvDgxkA==
X-Received: by 2002:a05:6820:824:b0:6b3:6bc7:2ea7 with SMTP id 006d021491bc7-6b36bc73476mr11612524eaf.7.1788298951280;
        Tue, 01 Sep 2026 14:42:31 -0700 (PDT)
Received: from [127.0.1.1] (140-186-136-19-dynamic.midco.net. [140.186.136.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b40ba648f6sm1094703eaf.2.2026.09.01.14.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 14:42:30 -0700 (PDT)
From: Robert Nelson <robertcnelson@gmail.com>
Subject: [PATCH 0/3] Add support for BeagleBone Black RevD
Date: Tue, 01 Sep 2026 16:42:20 -0500
Message-Id: <20260901-v7-3-rc1-beaglebone-black-revd-v1-0-f521950b777a@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALxGl2oC/yXNQQ6CMBCF4auQWTtJS2OJXsW4mBkGHCXFtEhMC
 He36vJbvP9tUDSbFjg3G2RdrdicKvyhAblRGhWtr4bWtdGdnMe1w4BZPLLSOCnPSZEnkgfWeY+
 dEIfBUzzGADXyzDrY+3dwuf5dXnxXWb5V2PcPzG7msoIAAAA=
X-Change-ID: 20260901-v7-3-rc1-beaglebone-black-revd-7cab3f1a6563
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jason Kridner <jkridner@beagleboard.org>, 
 Deepak Khatri <lorforlinux@beagleboard.org>, 
 Ayush Singh <ayush@beagleboard.org>, 
 Robert Nelson <robertcnelson@gmail.com>
X-Mailer: b4 0.15.2

The BeagleBoard.org BeagleBone Black RevD and Industrial (00D0/EID0) are
redesigns of the BeagleBone Black Rev C3. They feature an IT66122 HDMI
PHY to replace the EOL NXP TDA19988.

Signed-off-by: Robert Nelson <robertcnelson@gmail.com>
---
Robert Nelson (3):
      dt-bindings: omap: Add BeagleBone Black RevD
      arm: dts: omap: Add support for BeagleBone Black RevD
      arm: dts: ti: Enable overlays for BeagleBone Black RevD

 Documentation/devicetree/bindings/arm/ti/omap.yaml |   1 +
 arch/arm/boot/dts/ti/omap/Makefile                 |   2 +
 .../dts/ti/omap/am335x-boneblack-ite-hdmi.dtsi     | 184 +++++++++++++++++++++
 .../arm/boot/dts/ti/omap/am335x-boneblack-revd.dts | 166 +++++++++++++++++++
 4 files changed, 353 insertions(+)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260901-v7-3-rc1-beaglebone-black-revd-7cab3f1a6563

Best regards,
--  
Robert Nelson <robertcnelson@gmail.com>

