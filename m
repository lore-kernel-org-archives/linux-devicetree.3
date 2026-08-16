Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E2E209F43
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 14:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786889169; cv=none; b=mucw2uiSScgBqmwJlwD1tJBEsVAbIjMdgtbT0PBz8NTm1zyzIgeRznk5YARWx2PA7Nwj59xMxU9XylQITnM8wSZQGmJZzZ3hl7VHiG/Q6+WrMVkcbTPHcnc+pEiBy1ZbGK60WSuMz+b3+6xYzI248OvG5ymUxDLk72OPi9hDuec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786889169; c=relaxed/simple;
	bh=3hhlZ1Fi0jWDKXWe3uonqCke0ZqoqeBiOykrMppuuAc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EOH8NVbWvDIvOXQvco2JpAVOdX1OIXfl/5yUJaPfD2+TI0oyEMMRLmzbucprvpEiP8jIlZhgpTHw5E3tVIL7gu+ZY7GoJWPMiTKys+2jg7BMETERzlGz559oW67JWhSsTD3Ta75nz6sTp+1lrwdNaAqJnkHNGQqceexhNMkyuO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=i4toc+fx; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="i4toc+fx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=XEfY0WKHFZWFlZvlZ6DrZDRwUYw98lksOKl8DK8DS7g=; b=i4toc+fx9Wv8ZMHV08VulARQHd
	dJM7x4oLgQAA++Zld588tuG2du+Yt3r6zXPH/BP8cLh2TKl9dNf5qdrGtoBiaJr4wWr2wa9Dpspk0
	2UT0rnUINOrJHu6aVLu41gSMJWCSsIcTojFkZrlMTRXeerlamby4tCHxnOfK0mEhvTLTlXScxAYXy
	U4FOZkQ+aWyM9KHxYVr5hs0uzAiD6ECJrh/mst8iHEePM1L4+SHHAE34Gz/eUgDPno9kXmlUL9KP6
	JvVUPveurGpwsWc3zb35kK3b3xFPTAbxK1Vrp/+quVlsDWV3XQhQ7NeZ0rYWSvOR+ITVJ3G7oYwI4
	AwCgoNPA==;
Received: from [179.105.94.163] (helo=[10.0.0.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wvbUu-002tuI-I2; Sun, 16 Aug 2026 16:06:00 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Sun, 16 Aug 2026 11:05:41 -0300
Subject: [PATCH 2/4] dt-bindings: display: bcm2835-v3d: Add an optional
 reset line
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260816-vc4-reset-control-v1-2-896444373716@igalia.com>
References: <20260816-vc4-reset-control-v1-0-896444373716@igalia.com>
In-Reply-To: <20260816-vc4-reset-control-v1-0-896444373716@igalia.com>
To: Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1041; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=3hhlZ1Fi0jWDKXWe3uonqCke0ZqoqeBiOykrMppuuAc=;
 b=owEBbQGS/pANAwAKAT/zDop2iPqqAcsmYgBqgcO4hSm7N0GRYiFkdoVyEWuLx4nSx1hqieNg0
 UyQXw099RmJATMEAAEKAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaoHDuAAKCRA/8w6Kdoj6
 qhk5CAClAo9OtDmH5mNxDVvKPWpRHNCkQ0lMXBgWANZksoO8zvDPtAib5FEnw8Vb36POjk6kPQ2
 hUFmupFYf/52evpXdxi9Z7kfRaRyMvpsNTUEucujZwIbK2mdh1chXO0AX+S+tJbCROGA6U8+2W3
 hL0PHOtUKd4ejGPuawbbSLgq6XC9xGcceoioFd8mGf69fP1BaB81k5m6f2VZeoeGemRwQ9+Qr3v
 JJrPSDXKI66is2LnjCj4erhvRB7KU/QfcrsotKwkvImniwh/gIdG+O+24RqX1Y13QXLrI5zC3ym
 dwP7JpEhKWhFv7Qe0UFS7AxtuSLN3fkz9tq9BQ47skHmXJ0C
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA

The BCM2835 PM block has exposed a reset line for the V3D block since
commit 670c672608a1 ("soc: bcm: bcm2835-pm: Add support for power domains
under a new binding."), which allows the GPU to be reset without
power-cycling its domain. Document it so that the vc4 driver can use it to
recover from a GPU hang.

Keep the property optional, as existing device trees do not describe it.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 Documentation/devicetree/bindings/display/brcm,bcm2835-v3d.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-v3d.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-v3d.yaml
index c55a8217de25..1063e686647c 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-v3d.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-v3d.yaml
@@ -27,6 +27,9 @@ properties:
   power-domains:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
 required:
   - compatible
   - reg

-- 
2.55.0

