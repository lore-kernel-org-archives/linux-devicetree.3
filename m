Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A1131327D
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 07:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787728816; cv=none; b=rGbyLWerGjsoWKNm9Ea0CCZyKa+LZxMyaM6YApIoUW6sez5BF5VJk0OX9yNnuzC1Xtdh0dpj7F44tOzf+h4QTVW/kTeicKdXmU6RjmpTxHOqZpJ6jub5rr9/kEzY7rek69OjAUZ8k0LAdnIUAG8W4FEd5uon25F4X/H1XSIaShQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787728816; c=relaxed/simple;
	bh=hZiNQy3iO6KSEujh93jIhCeW+8rxMqaiJ0+rPCJREQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TWfUGsoe7n860A3oaAocwGBa8Fk+2TvfMki7rDOdBYYmCHfC1nzxQ3wL+ySvMjxRZd7BakqQoyRaBm2PdUpRIYWXDtNlm56U5zFtk4NIeW3A2J6hym6Y+ZB1NIyaPJtmMbru5LUcGKCAomdiwzJ6hNkBDkqyzzSe7A7IBUoVF7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=du7TT8f9; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="du7TT8f9"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c250c6a6a6eso95122866b.0
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 00:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787728811; x=1788333611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aheGcIIqE1nFbVMMTOFfK9uzsMEkXzfTrDVK9lTzIxY=;
        b=du7TT8f9BQFuczTpSF79ehbuQ5WFhn7AIdqMD9bl6D6WI1ze7umvJeHxkqGNy4GBhr
         oLdYWKRf4ik+oGxq4dcyOb2hdwlP6385dL2uzBrWkeHelcP47BEDNmmmQo5zFbw6UPec
         hvCEXEvThZu8OuMcwHyLh5cgsLCe2ZeR1+D5pOV/u/ETwQCcggyaVI0jqMVhEZD9eA97
         I/cADWcctt8wf2q0sBKaWAUzqPFiR0OSnkONNDwYN8m+eKy4CpITZgJ19pVbmfZxs9wd
         OOaMV2/u3i14j6k4urjMD+X5hp3HAdTTSosKVHiQgREn/V8Kj4ZSf4h8GHKN0vSdBy+R
         Ev3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787728811; x=1788333611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aheGcIIqE1nFbVMMTOFfK9uzsMEkXzfTrDVK9lTzIxY=;
        b=NNDQVX43FVCH5ZfEm6x5WTTMFboPhQs+uIxDPgVv7wV0saQbK9p0t7N6Mr0RaDwmPI
         o9e5HToRCR/03JUd3rUeLf9KmIgJXKJMq2hJ8OQc/4HPOFlix7z6XafJl4uQO1fUBKA5
         F+4h999acGeaMBCY0SYahqSZRmHkaorlIHoTlzEOecW6Al+c4uzTK+9do/x2jojZbkwb
         4Z/8oIqkyX3vo9VX0ixCM3Jd+hmR//oiyt9ZtN10J1zDxe61g1MVH7DOZFz/YCzaZsNP
         oMWtlyyimC9LRnboiVnFhpAqO70u7+a86D3f1J8CiL+p+7jswoytobMF4vbq1Doxwspk
         ZOiQ==
X-Forwarded-Encrypted: i=1; AHgh+RpP+ihCL0sQ44/Bi/muUyiVtlNtJXHcnh7RAZ06td70L/BYk943GvzaDsPdznUPvhx5FOsBPX17GRLv@vger.kernel.org
X-Gm-Message-State: AFuF++nf/7k4sg5UJLOF0qwsUGniVduJJtLSnTZFa9HFJRl8bNGqK5kz
	3PCE0rz7K5VYacjHwb2RHqyJbW8qK3B15J34kpwv6YX+OYyhE5GpB33a
X-Gm-Gg: AR+sD12FC6d0M04GP6ypQJJJB+fKfY5aswL+GMgBZO+0T93NrwhdVwC1ptGz2v3eled
	u9SraQLLvLfvYakBYAH6dttJOsWyJm/gri6sOnODwwOc4cJGH+6AcvHNBzu8DNc1nPjX+ynjqsN
	KQ3zT3ITlnojuTUBHmtQj7vyvBzVRboEqs/qPsy5l9ncBMojWHBE4DLGAApBuoIctOG2C/0J2fG
	X57YDfpJ0BVQR6UBEiJQGCgp2H3mjKGFQLLk8do++mt+orRxkJ4CBGUdzrDOxi7hGfxv6MvNWrK
	6wxQ9OW5dPlGZBHsQ3oAhx7X2BCrgepNDrvxGBMNrJSQsj8Jx4xPIEjrt+DG27Et0Aahe8JPBB+
	/kb0WfJjOTrbRND6EqR+iO2ILO5J2TudRmc95vKYCxt1q6isNXQlfXIBlgNbW69q45TYpzHQm/X
	mRNYVlFZ9nxu3k1qPhUyNiBZZ+7YxIoMXci72J7X1DyW3UPJ4heggSVCFTkTKybbs0GpdVeLTdy
	oat4knI4QZHfwFW7YbCozwjMh/USstBHQH19OFN4DZRY/4q89Q8HG6f1Vetch7dHcTEhTq72qXT
	QaCNnWrlWzL9bNHOcGXKs3tO5w==
X-Received: by 2002:a17:907:e001:10b0:c25:2c70:50ed with SMTP id a640c23a62f3a-c252c715dccmr56217266b.5.1787728810259;
        Wed, 26 Aug 2026 00:20:10 -0700 (PDT)
Received: from robert-83cx (static-dsl-191.87-197-115.telecom.sk. [87.197.115.191])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ab59sm298340066b.41.2026.08.26.00.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 00:20:09 -0700 (PDT)
From: Robert Bozik <robertbozik@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Robert Bozik <robertbozik@gmail.com>
Subject: [PATCH 3/3] media: ipu-bridge: Add OmniVision OV32C4
Date: Wed, 26 Aug 2026 09:20:02 +0200
Message-ID: <20260826072002.14357-4-robertbozik@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826072002.14357-1-robertbozik@gmail.com>
References: <20260826072002.14357-1-robertbozik@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the sensor configuration for the OV32C4, matching the _HID the
sensor enumerates with. Without this entry the bridge does not build a
software node graph for the sensor, so its driver defers probing on the
missing fwnode endpoint forever and the camera never binds.

Signed-off-by: Robert Bozik <robertbozik@gmail.com>
Assisted-by: Claude:claude-opus-5 sparse
Assisted-by: Claude:claude-fable-5 sparse
---
 drivers/media/pci/intel/ipu-bridge.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1bb3a3e98..7d3c7e09f 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -93,6 +93,16 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
 	/* Omnivision OV2680 */
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
+	/*
+	 * OmniVision OV32C4.
+	 *
+	 * 400 MHz link frequency, i.e. 800 Mbps per lane. There is no public
+	 * datasheet; the value comes from the vendor Windows driver, which
+	 * carries it as MipiBps, and it is confirmed on hardware: the IPU7
+	 * D-PHY locks and the sensor streams 3264x1840 at a measured
+	 * 30.00 fps, matching pixel_rate / (ppl * vts) exactly.
+	 */
+	IPU_SENSOR_CONFIG("OVTI32C4", 1, 400000000),
 	/* Omnivision OV5675 */
 	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
 	/* Omnivision OV8856 */
-- 
2.53.0

