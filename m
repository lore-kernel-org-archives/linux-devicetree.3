Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E0E433BAB
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 08:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784019244; cv=none; b=KoxsNmyVv2LCHyHUzE4jkf+NfWXxXbWsA8pHZQRFINIJsRDtPiag0nUoA3yHAHfUyEFVrTQhnWahM/XVXGojLdFJk6nhgovt3l5k3TU7MCTXwqnoiGCK6oLPAA/tN10dottrjMIpEQ5a9a+x1EnGYNLhH6HczDXLyW44ZCJheBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784019244; c=relaxed/simple;
	bh=b9WVh5Gqjl+KmpFaABDI9OAx3mPQ6/J0ttV7X3dUrU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XVH3NSXzkKz3/GETqOyE8s56vj5dForyiHsSyXHQ/zt1KoijXzC/7f3SWcgXpx+8ceRWdjiOrBTJVQKsBZUZjCu6TxKVmaARCWWUjtTxN9uhKKbpBAGQZA5VibNg6iGOSMS5z9+pnL1lpR4+OWbM0JVx6LBB1c3i7r38FVgaFiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B07tS/1h; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B07tS/1h"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-697564cb69eso1507434a12.0
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 01:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784019240; x=1784624040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mHNTM9mrSWHg/Adj00DnnB0usdvvj/sz9rd6+8UIJfA=;
        b=B07tS/1hEEJRbI5808Bk2oBoRH0OF0EITL3CnUTORXJ0ri4wpEBIN42RkP6c/8ffpP
         vDLxbbbDGHVpzO56dsdE1M4nwWedo512f/bFc7IfV0pQ9+BCJx2rW4IEMZ5IKVn1wlC3
         1s0FN3OGFEvFkhTohPM5FoBdY/1V+Scedv4//180j6GNmIqtJ2O1kzxWcLGpou73/dos
         Y/cs1M4kWERo3uc222jgWqWZDE4VpdPESPGKN+uEcvynwh4i1rrL8rKFZ/ONkiMvi3JA
         K/CykOiGS0iXe/boJVu4tW5NxcFWcbOpvQZ1xYjTEldP2afPsB+XzKsuo7dPwxJoewK3
         wWeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784019240; x=1784624040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mHNTM9mrSWHg/Adj00DnnB0usdvvj/sz9rd6+8UIJfA=;
        b=Zx7JPTgg+QUeEVbXdqJrBB8Am2VQS3ohvu4IvqbxkVopBZi7uWVnGKW8eD5BSCzyyF
         6gVLjsfnwSeyU1kpUS1OBY7Uytf/IuKvoLZr8wCaW6TQ13O8PNEnNRy8ipmttKpW5sQA
         Jc8XqCJEDwYKIwUgqFrUe60UDW7lfhFmHtPjkHIY9kmBMb9R99TY9j+xgtTDRiLimmzF
         nXj3Sg1pHaDPPCxFtnB7g7m3XLAkMnf55N+vZgwPZr0x8B/0JpNq2ufVIZwoMsvIUiHu
         q9UIZcyI+zPkvr0doVCzcYJu11WPvslDCHzHL0Iyr52w0TzmAxZFNijhYE4SeAlu8WPA
         nlpw==
X-Forwarded-Encrypted: i=1; AHgh+RrhbKXNtxjwMQk5xVjMw2xLL779sSOJFyYbPgl/AuhiSfxDHyxTHvssP+rJuaeHUixZHvA8rJ+AWxJl@vger.kernel.org
X-Gm-Message-State: AOJu0YytzHRe7VEaiMGVElm0ES3jXC3AzM/4wEI11SDUEnmEqeonIKd+
	aMgvnMutXJzIWYI3h4RHaDy0sQo9Vgi55yI4LZlFz4khkOpwdaCKi5YuRcDI9/Jl
X-Gm-Gg: AfdE7cmKlkmYl6AY9B6QpWSqJxWSahiOwTKHxiL1roxGYdwy9g6ydn18OJLCZEbbvwX
	TDA3c17+6pD1/K046+pLg/KiD0VVuxBj0WIQvT7KOJ6+9rpsJvmyvmn3uSeNFkiFJWnDyOxmbKl
	+cvpPo0jn2vfhDBcfdHHbIHGUhfp2K2TTp+CRJR4kJRFDY2gGG9uuMP1tw4tW6+HKhZD0XR9mxU
	PrGYsRZCeOyYn+BVBHJ8k8g5L09DEjag959Sa/d1Mfv0F35Z7lW1ikOgCIFBlXIIOwVYI5F7EfL
	CK6GuhtqTsMFAsLntoRurDnz/J3oLGf4ZjPlcTckdd09RTYBIUXvaFcA67GeAmQARSUInbZBQe0
	PAuimjqg5zEIVpI93DFMucY2bKATbJP+HevOIX2zA5+0St8SS8+OY7Z8e48r9UCYehCXGEc4gUU
	OCfo98zpqYaFXmai8EWINr+DaHOq8EzMXwZrk=
X-Received: by 2002:a17:907:2685:b0:c16:5855:659b with SMTP id a640c23a62f3a-c16585567f5mr231653766b.57.1784019239910;
        Tue, 14 Jul 2026 01:53:59 -0700 (PDT)
Received: from DE-PF5B95TD.embedded.cmblu.dev ([87.129.199.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad82279csm1143689366b.13.2026.07.14.01.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 01:53:59 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Maxwell Doose <maxwell@maxwelld.cc>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
	Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Subject: [PATCH v5 1/4] iio: types: add IIO_VOLUMEFLOW channel type
Date: Tue, 14 Jul 2026 10:53:55 +0200
Message-ID: <20260714085358.20842-2-wafgo01@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714085358.20842-1-wafgo01@gmail.com>
References: <20260714085358.20842-1-wafgo01@gmail.com>
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
index d8d6d85235b0..8dbac1004fea 100644
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
@@ -2496,3 +2498,12 @@ Description:
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
index 93c2540d4cd2..d6b547207591 100644
--- a/drivers/iio/industrialio-core.c
+++ b/drivers/iio/industrialio-core.c
@@ -99,6 +99,7 @@ static const char * const iio_chan_type_name_spec[] = {
 	[IIO_ATTENTION] = "attention",
 	[IIO_ALTCURRENT] = "altcurrent",
 	[IIO_COVERAGE] = "coverage",
+	[IIO_VOLUMEFLOW] = "volumeflow",
 };
 
 static const char * const iio_modifier_names[] = {
diff --git a/include/uapi/linux/iio/types.h b/include/uapi/linux/iio/types.h
index c9295c707041..d0fb714ca0fd 100644
--- a/include/uapi/linux/iio/types.h
+++ b/include/uapi/linux/iio/types.h
@@ -54,6 +54,7 @@ enum iio_chan_type {
 	IIO_ATTENTION,
 	IIO_ALTCURRENT,
 	IIO_COVERAGE,
+	IIO_VOLUMEFLOW,
 };
 
 enum iio_modifier {
diff --git a/tools/iio/iio_event_monitor.c b/tools/iio/iio_event_monitor.c
index bc3ef4c77c2b..b5c5479b9d78 100644
--- a/tools/iio/iio_event_monitor.c
+++ b/tools/iio/iio_event_monitor.c
@@ -66,6 +66,7 @@ static const char * const iio_chan_type_name_spec[] = {
 	[IIO_ATTENTION] = "attention",
 	[IIO_ALTCURRENT] = "altcurrent",
 	[IIO_COVERAGE] = "coverage",
+	[IIO_VOLUMEFLOW] = "volumeflow",
 };
 
 static const char * const iio_ev_type_text[] = {
@@ -196,6 +197,7 @@ static bool event_is_known(struct iio_event_data *event)
 	case IIO_ATTENTION:
 	case IIO_ALTCURRENT:
 	case IIO_COVERAGE:
+	case IIO_VOLUMEFLOW:
 		break;
 	default:
 		return false;
-- 
2.43.0

