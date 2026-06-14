Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BA22777F3
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 08:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781426157; cv=none; b=TX/81k+5yVqnP2+tLJ1E+u2NznXeR89RIscjpSjDahOskoWix2YEUBepw+c5zJTNg2+LT89cVIEcNDLkMpB6tPXikKYMJR3HszUWsL2elh+5+MXQnNmzb0jDAT2pQeT5WZS21fuf/jqlm5DxD9km5MXKn1Sea4OUJOkhQ4gFcHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781426157; c=relaxed/simple;
	bh=QvqgdZHeqgEEqc9cqofJhBAJO9XcXQK5dg3RhzWhdyg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M2giCJy4PSgBZsddNGFfaj32xPwtRGwC5LFPk0liSoXks5FHmdVJutlcBMQnL6jcmMJyv8eCdTqdnba/fY4a0KBK29OtYOIvypr+eOqvyeGLAProLVVFl7Vx0WW+69qPN9EmDcvkZA2JrERe6Xq8mHyYx3l4AcpucSMoiQKexh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I4DRH9SM; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I4DRH9SM"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84236f9b638so1154276b3a.2
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 01:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781426155; x=1782030955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=REc377Cx8g8BwECwGCoYljt/5HARM3EnQdjrMGhJHwo=;
        b=I4DRH9SM/IG2BWx27d95q7AB1e8qZtDnMz+O0+UJM18PK6GHT0Mt0jk7aNFCX600Y7
         1B2THWFaBguXks37AJSnezEGfjrtOP9CA3HAqiojVDUMeQj4l5h41Nc7oimJFgQvarwQ
         oRU8lrPUicVGst1NkOwZg+4d5xgvY0nMgVEKEeIgH70WkWDWCTyuPsxpFXULyv1hqS3f
         tSLDcNZtsSgu/tpY44Jvzcq4at5OVFlk7RF29EMbMaMoiSt6PIw+ABYe65u0/gC3o41n
         LaVKu67LEga+8ZbwLVYcYjojP3qCMzz1Q5dYTUJLdbA8vxHLqnWEoEaA/fRXG+O6nh/N
         DmBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781426155; x=1782030955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=REc377Cx8g8BwECwGCoYljt/5HARM3EnQdjrMGhJHwo=;
        b=rfy92FCsf+nksvGpEAWLlwx5IC+QTjrzNqfm/ii49xbTs8+EvGoZPQzK1epAxh3yPV
         qKxkz7NKGNUZNiNxmgITnF7jap7+xpCePSi/OiZkbis4kC2dIerFIIjWtSZNUfMKb8CF
         cTj9HjmonypDtWETlbwUVbFs1NXgXs+hU0A5o43sjRVuVrp8xn7q6k/mErf3cq0MHkVE
         T3SvB2zOCuLuiGDWLbnZ7nfQGBGkUcjPhivOFiUVt2oQDbtclIvj5vg1enkh2i5YgLcX
         +0A4TBqW3ADwfaNZnXFf95jZNnBtWU6pctIsLSaFImJ6Nq2vWZ2VM036+Ab4V7ZrRZfc
         LEmw==
X-Forwarded-Encrypted: i=1; AFNElJ+T/8vcfKfLR4t07YlLvI6zsC9qZmxkU65xACyTczrNfSvXgc1EqpvQFborxEhE3FpanJAMfJYI8YLL@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1oqI4U7mNBCXg+uekaXjxxmRUej81XvStnFgUvZX7Cf0TWOU5
	d23OaGazSKurBXGy4Pq+oLuKvdYZRYa80wBD33ofk5Um0P47li05KbqN
X-Gm-Gg: Acq92OGw6wnOTUH1QP8PSIo8yee1swftvCALJmcttwi7XcvyKotXz7vkC8CWnyQP8PC
	dxHw9R/Q3e/T6BfMXsiTYQoEGaGoOvi1HCf1VsNvN7GxOx4upD8Oht+/tqYVqAu6bNdgQeqtuRp
	IM6ULvCydN6NhL5kfZ8RBqo4cjbEJPKPR4PSOKFE2esHroWZTMLOVAS6gZDI/OCDsLTfUd/KZCf
	3u8E63r90Pn7LJyX93QYkUsDrYbY1Dr8WlMBfFnSjjJVW1rWfCv7C32+gfvjY3hsqWRiKE9AqoY
	GPoCAj5Aknz1DtCWd5akblaG2s57jkJ86/p2JrN0p5f2cnHdJrCs1dPON9l/fpEdLc+aXskiLDI
	2+tPMihEk66iiL+MO9F9+ZRYOxZ/26gPZFgg+a+2c92PVQ6CYOuveg0WcOr2CJKdHvmPxUwbdvc
	APepx+3m8Sxf1ZjfkaS6eX+w==
X-Received: by 2002:a05:6a00:238c:b0:837:e9cc:d46e with SMTP id d2e1a72fcca58-844e1a2af43mr7234263b3a.21.1781426155058;
        Sun, 14 Jun 2026 01:35:55 -0700 (PDT)
Received: from nuvole ([2408:844f:2361:d7cd:deb7:4e0e:26d0:4076])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afc8fc7sm7263053b3a.37.2026.06.14.01.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:35:54 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 1/2] spi: dt-bindings: qcom,spi-geni-qcom: Add property to force GSI mode
Date: Sun, 14 Jun 2026 16:34:23 +0800
Message-ID: <20260614083424.464132-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some devices (such as gaokun3) do not disable FIFO mode, causing the
driver to fallback to FIFO mode by default. However, these platforms
also support GSI mode, which is highly preferred for certain
peripherals like SPI touchscreens to improve performance.

Introduce the "qcom,force-gsi-mode" device property to hint and force
the controller into GSI mode during initialization.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 .../devicetree/bindings/spi/qcom,spi-geni-qcom.yaml          | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
index edf399681d7a..80e394c1c715 100644
--- a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
+++ b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
@@ -45,6 +45,11 @@ properties:
       - const: tx
       - const: rx
 
+  qcom,force-gsi-mode:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Use DMA (GSI) mode, even if FIFO mode is not disabled.
+
   interconnects:
     minItems: 2
     maxItems: 3
-- 
2.54.0

