Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0703C30C15B
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 20:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789505507; cv=none; b=Hi9OwBrQxdKfLSRobK+8q5XF+Pz8649WRkI2do86P2uoZR6MIVwYzD6rr++w54LJPNRkZOHWIhsXjW/rljChQItTD45h35qp/LTM2BbakNegfArfJ3LAVrn2Wjr2PmQdsSu2XL0zQ6aRrfO43KQYuJ1xJJmfYGmYWvpOoJFg/0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789505507; c=relaxed/simple;
	bh=+1vCCICnTfTUPZja9+FN03P4GSIFk+wqTqZhGjuCP2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sxnlYpHaupOcrMJzv+bBmvsuQztI51lZMpebU+e63JWDEpk3BSfIbA6mShS4oHpffWvWsvLkhHHeEUi5fqpV2JLOYOEli0v2bWerVkYeQCP99g5tlZ+gkcbx1zyGlDhify7akFGUEcMKjUxP5kNDw8X2RpEGT2Ltl71KVe73tcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=A9uacRKF; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="A9uacRKF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=agEhBlrbDZrVFoeurHsyAEFpY0A66t5ppdPVVxBJvh8=; b=A9uacRKFtdNGgTELdvjWdTdNkQ
	rS9YjKrxfFRK2MRt5XIWt43+z9VjsLv0aMp31FnyutY4AlftCsKX4IP5HIy8DISt0hFUxnN+UMhBv
	H4Z2s0FtJM+ZJkQNBQ3Fuvrgt08pshoFPiUOGC0qoLpmEIQApFx8YyK1fhYqhXNByaxtipZsFWBL9
	Ap11T4DYQ/6Y+XoT5Yxf8MfduyXC/oSixsC11JK7KQkDbLHBL79KLHlbeElcQWggGPE+1SfKJf1aH
	flQ5Vzrw7P1u4pu/etItX9M6h9PO11x9PYaZntVFNuYxVvaX6OffKS5IOVQqRWrKkfC58ZC+a+6lI
	XBb27DGg==;
Received: from [179.105.94.163] (helo=[10.0.0.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x6a7z-002dV8-KV; Tue, 15 Sep 2026 22:51:43 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Tue, 15 Sep 2026 17:51:25 -0300
Subject: [PATCH v2 2/4] dt-bindings: display: bcm2835-v3d: Add an optional
 reset line
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260915-vc4-reset-control-v2-2-cb3a25b07822@igalia.com>
References: <20260915-vc4-reset-control-v2-0-cb3a25b07822@igalia.com>
In-Reply-To: <20260915-vc4-reset-control-v2-0-cb3a25b07822@igalia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1024; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=+1vCCICnTfTUPZja9+FN03P4GSIFk+wqTqZhGjuCP2Q=;
 b=owGbwMvMwMVo/5mvq6zj1yrG02pJDFkr119Q7ZkrqFXI7esf99Bz7jK1XUd/5vtMe6X8b1Zgu
 5T4m4cRnYzGLAyMXAyyYoosP57E1jKKlbNrLiu/CDOIlQlkCgMXpwBM5NNU9n8WQrkVdQs28m4+
 +HNb8SMWcY9bJby6JXJl1joNzo7sO5a7/dQTnPGsyD5YaB3b1kJDC+XHB/uX2iw+obxP+N2dDza
 5BlrCXFMUd5+PMa7QfsNgu+dw5uu8r9F3F67c6rbycPGVtmwJB53y96c6LjnPP/T8qlj1yned3/
 ewvK2Yc+/vJdGi8Kpf2ydwFfIyvXv6TMNAc8s3Y/7qlfzqcbZX8y/N1i6xkttq2XHLT1+gVEpty
 7lp4oFR89o+lXp2u+fzLhZmmXu5k/NL95S3LEaWB2X7hCRdI/vLqjbo5DjGsCQGxjlv8Xzt4lsz
 xVONa8/SrBP+M/WiZl88vEh6XeH19q7mu8GPxSvyWa19AA==
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA

The BCM2835 power management block drives a reset line for the V3D block
that is independent of the graphics power domain, allowing the GPU to be
reset without power-cycling the domain. Expose this reset line in the V3D
binding.

Keep the property optional, as devices like the Broadcom Cygnus don't have
a reset line.

Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
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

