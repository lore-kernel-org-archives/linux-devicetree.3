Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B123FBEBC
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 13:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781184426; cv=none; b=Av7xkixCyyVJxOXADVXG41Kk64/KemVpl7A4PyT+GoP8D+IQon1hTQtyMHNblG+8eAVO0ZOwc+Gqqa0mnopzcMHG6mXvoZhve7MOYdAT6y0kax8i37mO4E3jHtkDrkSLJxjC6xsA6CCz8KR9c8tL/jcjKO3pPT/8XWDaOXP9OUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781184426; c=relaxed/simple;
	bh=bZtWTA8Pdq+LUNldR7nbPKimHL2bnByMD6C88jjspQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gnmxIHLC+5O9HGr8cj7YYYvr3f3cwlM2+3gy1dkACWPydZ/OMzgJb1akRgqzCYpVElZ4oPcRVNHcnaWHrL9I+zxVHeC56iXtkDq9Xvaq3YAAfPATyRtJ7yx+zR6M0aujrR2qU3WWP66RkrbOXhvadUTIAhqn7fm9rYAlEWAeoDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EmMTdxYA; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EmMTdxYA"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bebac79fff8so857018866b.0
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 06:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781184423; x=1781789223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/g1+4hPRTHeyQw8XjLZ/+qucq0mVKpC87N/BcdVJkGI=;
        b=EmMTdxYAUfKHAHXu4AZA7R1o9LSQjOaZq/4XlXp5ls8Z15WSH3ryqKwHmjfmTZVlsA
         Xlq0W9Z09doyZ2KIv3ApxFdhOIyH5v0H5peg4fEO0wr0fm3VHpABZZz683gk3Rs167u2
         7w3TUg6ME7V4bkKcpEz4zUrjawiFeFYdfvw4TQ7IySIHxJxvMqC0vxKNAJvNOsU+N7Mf
         koFvjvhnrAgxDh7yQbKRS4E+t3XyHcwF9U50T/SBmulJJxkJjNHCDj+2NFBP4Bl2fvgr
         HKjZ05PAMi/upAueJzARGJ6POi5M1a2P7PdCCiDWpKutHiCbOXsZlbFFkEXA4L2X8EoV
         7KGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781184423; x=1781789223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/g1+4hPRTHeyQw8XjLZ/+qucq0mVKpC87N/BcdVJkGI=;
        b=q4XV9sJ1xY/Wk6jgsjR2YE6jd2viVaYbvMGmznjlwSTPqAQ4nJ7dqA6NokkZdET6f8
         2KfN77ylH/Blbol4yzWMbJmKjKPQC+C0Z8IoNCQQ8flMS22fzQQGAioOanYFP92NZRpk
         U01CtEbtIUmGK8V4tYXZZfeQQmp9yRFTsoloMe+eKqeol2dNimtVMqJqEU+gWks6AFoM
         zyupstYd7xYB/IKoayQW8GAECVy8zLvq2pO0cSGb9E79cdq1vgeBbSz3hEb8UVi+kgna
         lI4DHq3PNcMiiedDyvMASR5C2HU7qGObe3yct1WwLSvEq7AHG22yAy0BPquq48o0Ysc7
         zt1A==
X-Forwarded-Encrypted: i=1; AFNElJ8aT1p7El+H/pxmK8GSEtVyRz16BjYib17PGUYYoJ5ZuUPYkHsk+W39m9O2na/QAMySGTnS3w2GUtim@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+peBrXBhUrw5uYyZycebu/In3CN/SLhBz4nSOdCRM9XsZU3aE
	MKdmzq2rMYZMrZ9ESEbVx8XMoJRNAufuLBLa4xDAPtT7rLzGvs8w4+YA
X-Gm-Gg: Acq92OFUNjOL6cnODsG2347wXkR9BeMgt5xxPIqqn28e9oBU6c0Ai2uquzre6Jw0R1B
	fTodQwABHxMy1ENCLpZzICf+f2CagEhijYM9dLQNMCb6a4PtzXVRBO4xZJoIFJ9uKlmTJwHlQpn
	qZJCy+8jU+N94q0S3Ljm+JVGI+xk/MNbJG0c5AYbJ0gYnA1oXM1OjX48JiT4Awlsxozvu2GWRS5
	Atye7q6wn2xxVNv0EUIRq3p67wAvrAJu+k3lXMXIH+CZo7/jMClPka1GtyDNHGpUAwzLkZm0rdh
	wj5tK9P/falYvG+fvbK1uSn4MnhuI7B8rWrgfhzDNd6mc73aPS4GVevz3cymvw5t4+tYnZ/YpnT
	sIuVhfya99gJgaik13nz3v14mf0XHlnjJ7iu8go6xvWafVMyeb2Ve81FOZP+wLubu4TVYPzWzNa
	uXRTEZS/0pjqU8YO2FzUJ0yYUgQorSdV4PrKeGHhVTTYHizzHI1egYzY13WIhjucSG/HC2StokV
	czo
X-Received: by 2002:a17:906:630b:b0:bd8:6ac6:d722 with SMTP id a640c23a62f3a-bfc87af8941mr134047566b.24.1781184423339;
        Thu, 11 Jun 2026 06:27:03 -0700 (PDT)
Received: from fedora.clients.cmblu.de (p5df027fc.dip0.t-ipconnect.de. [93.240.39.252])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb1cf077asm65719566b.26.2026.06.11.06.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 06:27:02 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Maxwell Doose <m32285159@gmail.com>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
	Rodrigo Alencar <455.rodrigo.alencar@gmail.com>,
	Wadim Mueller <wafgo01@gmail.com>
Subject: [PATCH v4 1/4] iio: types: add IIO_VOLUMEFLOW channel type
Date: Thu, 11 Jun 2026 15:26:57 +0200
Message-ID: <20260611132700.671322-2-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260611132700.671322-1-wafgo01@gmail.com>
References: <20260611132700.671322-1-wafgo01@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new IIO channel type for liquid volumetric flow sensors.  The
unit exposed via the standard _scale attribute is cubic metres per
second (m^3/s), following the SI convention used by the other IIO
channel types.

Update iio-core's name table, the iio_event_monitor whitelist and
the sysfs-bus-iio ABI document to match.  The new _scale attribute is
folded into the existing shared _scale block; only the per-type _raw
needs a fresh entry.

Signed-off-by: Wadim Mueller <wafgo01@gmail.com>
---
 Documentation/ABI/testing/sysfs-bus-iio | 11 +++++++++++
 drivers/iio/industrialio-core.c         |  1 +
 include/uapi/linux/iio/types.h          |  1 +
 tools/iio/iio_event_monitor.c           |  2 ++
 4 files changed, 15 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-iio b/Documentation/ABI/testing/sysfs-bus-iio
index 5f87dcee7..e278fda4b 100644
--- a/Documentation/ABI/testing/sysfs-bus-iio
+++ b/Documentation/ABI/testing/sysfs-bus-iio
@@ -507,6 +507,8 @@ What:		/sys/bus/iio/devices/iio:deviceX/in_intensity_red_scale
 What:		/sys/bus/iio/devices/iio:deviceX/in_intensity_green_scale
 What:		/sys/bus/iio/devices/iio:deviceX/in_intensity_blue_scale
 What:		/sys/bus/iio/devices/iio:deviceX/in_concentration_co2_scale
+What:		/sys/bus/iio/devices/iio:deviceX/in_volumeflow_scale
+What:		/sys/bus/iio/devices/iio:deviceX/in_volumeflowY_scale
 KernelVersion:	2.6.35
 Contact:	linux-iio@vger.kernel.org
 Description:
@@ -2458,3 +2460,12 @@ Description:
 		seconds, expressed as:
 
 		- a range specified as "[min step max]"
+
+What:		/sys/bus/iio/devices/iio:deviceX/in_volumeflow_raw
+What:		/sys/bus/iio/devices/iio:deviceX/in_volumeflowY_raw
+KernelVersion:	7.3
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Raw (unscaled) volumetric flow rate reading from the channel.
+		To convert to standard units (cubic metres per second, m^3/s)
+		apply the channel's _scale (and _offset, when present).
diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
index 93c7b8c46..571b8ba4e 100644
--- a/drivers/iio/industrialio-core.c
+++ b/drivers/iio/industrialio-core.c
@@ -98,6 +98,7 @@ static const char * const iio_chan_type_name_spec[] = {
 	[IIO_CHROMATICITY] = "chromaticity",
 	[IIO_ATTENTION] = "attention",
 	[IIO_ALTCURRENT] = "altcurrent",
+	[IIO_VOLUMEFLOW] = "volumeflow",
 };
 
 static const char * const iio_modifier_names[] = {
diff --git a/include/uapi/linux/iio/types.h b/include/uapi/linux/iio/types.h
index 6d269b844..49480f321 100644
--- a/include/uapi/linux/iio/types.h
+++ b/include/uapi/linux/iio/types.h
@@ -53,6 +53,7 @@ enum iio_chan_type {
 	IIO_CHROMATICITY,
 	IIO_ATTENTION,
 	IIO_ALTCURRENT,
+	IIO_VOLUMEFLOW,
 };
 
 enum iio_modifier {
diff --git a/tools/iio/iio_event_monitor.c b/tools/iio/iio_event_monitor.c
index 03ca33869..078004750 100644
--- a/tools/iio/iio_event_monitor.c
+++ b/tools/iio/iio_event_monitor.c
@@ -65,6 +65,7 @@ static const char * const iio_chan_type_name_spec[] = {
 	[IIO_CHROMATICITY] = "chromaticity",
 	[IIO_ATTENTION] = "attention",
 	[IIO_ALTCURRENT] = "altcurrent",
+	[IIO_VOLUMEFLOW] = "volumeflow",
 };
 
 static const char * const iio_ev_type_text[] = {
@@ -193,6 +194,7 @@ static bool event_is_known(struct iio_event_data *event)
 	case IIO_CHROMATICITY:
 	case IIO_ATTENTION:
 	case IIO_ALTCURRENT:
+	case IIO_VOLUMEFLOW:
 		break;
 	default:
 		return false;
-- 
2.52.0

