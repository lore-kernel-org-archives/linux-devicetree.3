Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CEA3515D1
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 16:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784824342; cv=none; b=SnFO09FK5Z5bLr3RGKJn8ZgUypMFCzvZmsj2rVQgUjIIrYnCuVw/5FB+mSFiKSg9PJl+IG22HXTBgvl0BvR9sa/ha5yxFedXnbqpVhEoZCim1yjCUUD4aXfehNdSkoB8Af/DAIpuVDUnwjEgkBMP2hk4DITv3dnLPQQGZOCG7KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784824342; c=relaxed/simple;
	bh=3GsCtopjO+bT5HdhUJ/GppIlZFQfqMz+16aoNJV+tFA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uuZrBeUo9MUIiinIxWJFrt+YZwi4XgSk42aLixZDnVy/IrmnJ24MPzY+hVfEg0D8v6/o/36l79bXuvcKPmWqph6huw1AKZdqfJS1ZSauUOzQgM4lOa+ePIoG7b1mSWbT1DjeckvkXTJGsXPSKdKv2XAMXGs/PsO3JzSYKpKNTaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JawhSxzA; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JawhSxzA"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8C3B01A119C;
	Thu, 23 Jul 2026 16:32:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5E3E86038D;
	Thu, 23 Jul 2026 16:32:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 94D1E11C11162;
	Thu, 23 Jul 2026 18:32:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784824335; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=DFknPV/GGHB02nua1SEKnaLuICGqgcjtDBUVB39Ztr4=;
	b=JawhSxzAOl6E6aBJe0CaN1Gr8aoZxJvWHlkvwa7jKNFI2qDSJ1FIWdFoM7t/A9Oe7HZ39K
	7fNlAbALMJRDv661IJTVfaxsQbaiqxw24+xO2QuVs8r5Ae5sS7+aRJERcZ/fEL16LGqcRm
	Z6aIBH2Ch4KMU40080tT8Y+uevL6m1K1KKpdjlMCCzMKCRur7X+aSMtYaZcvbLKa2CZAya
	DaoadFv+KMhbTSvxKba/hG0gbsi0UVA3GnE2OZauyTL/AnpMjw26ZrmPs6NbcYcfcv4DR9
	bsDURO+5tr3H+5KeuiYpN49CtP7prxuFkDQRiOLuDmfkmZQ5KjqGerejyWVPXg==
From: Paul Louvel <paul.louvel@bootlin.com>
Subject: [PATCH 0/2] drm/panel: simple: Add support for Ampire
 AM-800480N3TZQW-00H TFT panel
Date: Thu, 23 Jul 2026 18:31:48 +0200
Message-Id: <20260723-support-am-800480n3tzqw-00h-v1-0-6a4ae0575a19@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ7CIAwA0F9ZerZJZaZDf8XsALM6TGRImRqX/
 buox3d5C6jkIAqHZoEsj6BhihXbTQPD6OJFMJyqwZBh6kyLOqc05YLuhpZoZym25X1/ItGInXN
 s2Xu7Z4Y6pCzn8Prtx/5vnf1VhvItYV0/r5aMYH8AAAA=
X-Change-ID: 20260723-support-am-800480n3tzqw-00h-7aa686bb8966
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Paul Louvel <paul.louvel@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784824328; l=706;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=3GsCtopjO+bT5HdhUJ/GppIlZFQfqMz+16aoNJV+tFA=;
 b=/SzAMGo548M1mxkVtyd7zMansXGrN73Nu6oxSm3eBrfAHO0DdKLxHpZ8L65I4uSahSJJpcrrh
 hPYCcs4dpYMDnB73y5lio91NSjE/x4L+R7lo+ybkrPDesz4CxLoJ4J7
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

Hi,

This series add the support for the Ampire AM-800480N3TZQW-00H 5" WVGA
TFT LCD panel.

Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
Paul Louvel (2):
      dt-bindings: display: simple: Add Ampire AM-800480N3TZQW-00H
      drm/panel: simple: Add Ampire AM-800480N3TZQW-00H

 .../bindings/display/panel/panel-simple.yaml       |  2 ++
 drivers/gpu/drm/panel/panel-simple.c               | 33 ++++++++++++++++++++++
 2 files changed, 35 insertions(+)
---
base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
change-id: 20260723-support-am-800480n3tzqw-00h-7aa686bb8966

Best regards,
--  
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

