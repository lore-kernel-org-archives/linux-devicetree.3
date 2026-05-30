Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7C330EF77
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 20:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780174507; cv=none; b=oQCc6E4tRSYxkFjIPmEs4TRrLkN+dmMJud6Mcv9QJke9+6OYHfZiVhiq1O9tnFPZU5cufPTPl1/TsLEPHxqvGHpfcP8A/55GkeA0LmOn8kQdwkTnGXD99ZLcgvNWaXc6Xzp62YkB3pKzWzWWYQnuw2aaOc1JLkZWHGqXMhL/Fz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780174507; c=relaxed/simple;
	bh=Nx8EK67/RioyI6Z4M1OApHSBUTezoml6mYEJkUAfw1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VMrvKQo94nalxL77P7rqNLdVYPgyBevSafqwffP1wls57xyElDzNS/y0SqVig9GMyxD3XqGHByV49cubqXIUEuoSOn5BzlAsPj2c4TTmy6etXfhtz7VNbPj1QC+9dwHebP3fPYvxMwAxOt6D0EwfdjsfI8hxGCWxc+uvTikqThI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HhwLfd9a; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HhwLfd9a"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490a7876f8cso846455e9.3
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 13:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780174503; x=1780779303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8qQ+HP5KO/pNape1oL4kHR1H0GGu6Zsl3upOKWiRgzM=;
        b=HhwLfd9aV3uHZfViJud7DScv9nE+K5+hkCG9zvUYZcU01jKJ01EBOERV5vZgj4xZSO
         BQ3+SJ5QFcr8LHlolvW8c/FLwCNaQNTZns6LjDy7CmzPVa9Du5KXuSMU1GNIjCxJ+jyr
         Z4uLZPooULWV35QLJgrquMuJUWlEKsF2mBboLZhB6cEyjg3pFKl6pmMdq0aX1HlaGma9
         eeYXFgIUrqLKIAKvtxa39Vv0eGNlKEnxKbsGysxNbuegnx2ZiiKHK8lNlwG8W9gPd1Zb
         Qy4hBd04DapvuvZ3m6t/psDhAKx17tHpoE/8CkRbBAHBmX5kqLjSaK8lq2wHJnnuV3dv
         MzBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780174503; x=1780779303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8qQ+HP5KO/pNape1oL4kHR1H0GGu6Zsl3upOKWiRgzM=;
        b=o+ekEHLCBsjrN5RgUeHBo8ze96vZTnMnX8h9QyGo2k+e3QfOJY1YRmDHFjaTvrRvmA
         72qiqtyiejrbhCAdnpZMU78WlBehN8QkKfgtpSAlOk7ItJQ4mksNn4a+RAPpm924uHbj
         FZFpb1AmbtidD3yxk7NyAjwU1wcnV/UPp63zmjKwLZIoWl7hWoi1iuC8X7IaqxXbqY+M
         lH+WcsbyYBKiLZcOF3GiEpkmVIezW/64r23DTmLDZ3ymo76ywWhuaQQyonRm3qPixBel
         eXLu1dgteyRez4e6RryquZsX8PnEgtQtMq/Wz6aJurXJQQdJgzkCzCetIQLKHAIR/wZL
         I1EQ==
X-Gm-Message-State: AOJu0YxEZbb/UNKTtTHE/YuXYuPXJNWfhHz4gXPT4nB/TOoUfU7idkh7
	Y8g5u7dzP550/OzGXoCFWWnNWasFXfeYYpfkW18IZYNFn1pmpjt9ZHRh
X-Gm-Gg: Acq92OGfu0CqKZOgovkZiM868vDg018nYF97UTnPMZjTNT0MipzIQorZ/J5e0oyFYQK
	TvPzxoJKxdYTAes2YEzQ+b6wwQ1L4a3WmOFwDorpMlGqY0YSkieRgqcAbNk4ClTbV4CmdN/foeN
	VP938IVsADKXGadfrXkImnvk5CxD4Rec2qyNFb8fxnVP7+lxmAcP5Rd/y3nBOwTuOMbSAMc2W+O
	2cpQk8I0vKgtN1RXA+7yADNxl8R5Xh9tNdtc3/hfOLEFwoJVKiVxcjc5O8P8eZHXo10IcenXNLr
	CUsXekwuPYKNHH6kJ5g9sy8TLwko57LRo9zq+OelsC0W86/GwBrI86cCb1vHHo4mEwGxyXQf2qa
	rGGLin5Lt4ZwzdmhNERuW6TF+H7DfJ0zevLAEmE7vCFT6Iph+Rd5APiFZJ+TKFWpJw/jqjEqZPu
	jA45jG61kQmsZSJ54=
X-Received: by 2002:a05:600d:844f:20b0:490:4973:91a0 with SMTP id 5b1f17b1804b1-490a292191fmr65148555e9.10.1780174502753;
        Sat, 30 May 2026 13:55:02 -0700 (PDT)
Received: from sefo-laptop ([2a02:8071:50c5:5c0::361b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909cab0e94sm132288225e9.12.2026.05.30.13.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 13:55:02 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Maxwell Doose <m32285159@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Subject: [PATCH v3 1/3] iio: types: add IIO_VOLUMEFLOW channel type
Date: Sat, 30 May 2026 22:54:30 +0200
Message-ID: <20260530205435.37326-2-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260530205435.37326-1-wafgo01@gmail.com>
References: <20260530205435.37326-1-wafgo01@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new IIO channel type for liquid volumetric flow sensors.  The
unit exposed via the standard _scale attribute is litres per second
(l/s), so drivers reporting smaller native units (e.g. ml/min) only
need to set a fractional scale.

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
index 5f87dcee7..2188557cb 100644
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
+KernelVersion:	6.19
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Raw (unscaled) volumetric flow rate reading from the channel.
+		To convert to standard units (litres per second) apply the
+		channel's _scale (and _offset, when present).
diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
index 22eefd048..aa34fcd8e 100644
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

