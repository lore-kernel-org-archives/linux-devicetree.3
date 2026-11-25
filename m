Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638155;
	b=ubxy4orUHfaoFqjeqpMzUkgthn3HYu1QCEiOCPIXRlfnQ9dUOS7Id2CUFHjeG9OLKOqD
	 EqeNab+fepYLvhsykjkGg94KM8rOQMbi1D7F7nvhuyPBbGucaIvMA67JqzdoEZYeNUU0M
	 Zk7sHMVV+1rAnbaKIu589SuZ/FOJuRowysMLX/HewJtM3BPAc8eZYUULYNtmbHPTVHJYS
	 BoVtdmbkDTqdvfiHtTHVY4h6gSOLJYU22yBO0tdCaFM5CnHfhG6H7n1X5GP64oSEHZEJn
	 505Evl/CyWt4xIwfIcOD+21HXVvi46ikZq0y/BMI1j/7iD80ZutTEsNWkDjxsMAVyPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638155;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=Tw6abP5TGyJaCCJ/3YqhHDtPs9CAOD/H6iKvRgGyxpM=;
	b=edTQZW7R58pL+eYPWONI0dTd73qkWJClhk+JfZsTktRP/fPq3Odn/TBwKRevgMcQ+PSd
	 6Qv/waLu5qCQzZhaPBXmwcsNguJ6pVDkUEXNR3Q8fzbDhhmDGM5hd3aU2bKMi/zFTw6+w
	 xwZbGsqZdgHfp1ekA/gc05gTOlwEBwjv4Xgvi9olszMDpZD12W4oVMfNTb2f9loHsFE8L
	 paVXSMTsNxQ5N79r8NUJv7nEzr7UpO/HnLfsUG+RuMwdzI1lR6qx5iDQgLv4Gnt4rG1l+
	 wajg+9xIzfGV1G8iCt0gQfxPyNMqqraCpYLxDDbeWO5t5koVnhArZnYg0IxQ+bPngXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BBD606A331
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 20:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21BBD606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b503e2a87bso66367207b3.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:22:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638154; x=1796242954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tw6abP5TGyJaCCJ/3YqhHDtPs9CAOD/H6iKvRgGyxpM=;
        b=gG7pWU1hK6dCm8GzRJAnG1bmkRr5c8tBPJ02bmKVeyUiablqkqZ/oQJWo94Dd09Q2S
         Q/KzRlYljdjdOFKa2nxdeJDERXZl0EaPErtzluclGGFfhmvEbB//vHcnM5v0w1m09N2o
         tqhkdm0mOsQchty89Y0dVXBmvQceMilhX9/86wz9zblN6S4hgeSyapCwB/K073x81Xov
         dXm7wNUrNkX7NKA9spNHXo5jVE0x0Yk+M6Na367JzXmz4ysLBFQ+2ntcKM7vNasAhrNP
         agDu/xhQbmHxyoiAO7RijC7lkZu+Mn8yvTwFVyLx84YZReKr6/s3nWJUaEEaZrZbSoVE
         PjJw==
X-Forwarded-Encrypted: i=1; AL+hErFl3F8zdqn3ZC5l7438k1+5pFkUdqZL/RtSuGIvrMjWnsJHYiHCkzfn3cIBpT44h9spDZnZ3wAfskPs@vger.kernel.org
X-Gm-Message-State: APuU4Z8XgQkYg+mMNS+rHWu3fU9M1Bq3z5ZAmRxX1+n/dHsWOZ4fo5Uo
	UsYBqGjXG4cgFuPv/ZOdgSkSx+4o92voiMlOy5nz6VlwPeXewHck27jPIZpgYPa9qKA=
X-Gm-Gg: AZFdTZdyILmUaDj4jYYybTTvE+gJQmHdWmqEB8I+bIVQj55MwIFQFf2axY/1OfDucFS
	ZkWWD1S/cv5a4VevTWkZ/9RosdO4IW2L7pi2UdvsYD9we1zPR3IORoIb6DR/DfvZ79WKfrzaPrV
	bfobwb4G7/qmYZzczUlx8v6fHIHZhJ1BMq6CykkBmfJHZuarRm2X29nQTaV2YAoyIOzh+2k0drP
	oRFcR3sMqjKl0ZM3puA1qdGMEYjW/GdKI8f4g9kXidYtdYNxTBXq9tftIQmeY2UPs1aSrDY26+J
	fJvSR+bgIMiuO3KKWsoH/SQ8R3X8yC5BQ++M/ho6d9ZQrXWChZZm6sPeVLEkwaJANlUcBWo2a9I
	YrmMUWnvqnRwIa85OgWxSdjYRWCD8MxC882PVtR0zNAT1OuRJqUhSWXGKe9FxEpNr9Ouc8taNJa
	HY4KzeSPGvW75AN9+Nx5Zt2vtuU1r/dRIKtuaujv9K6TH0T8XS9pG/e7UMi87tK6pLpNnx4SuH4
	nuCzglrdltbbO4teQhKnIMi8FTlc8Xk+toDo4Zbkptds/JwVUpZtGheicaky+eMk8NJibZOFCEe
	gtNfGlNGmx7OTmXlcGrXfJoOD1Zz0FV7t84dexLF1vbMnU4QmyB026aycJ1DFeVu82Asziu/+F/
	eSj8pKcGcgocK42noBpJlWgZkfsYfnOj995difL9VaNa/+bgLe9qzxHXc6IkPpqYvLiyBiqovpk
	d0xelRLvUXhM7MpXBT/0B9veLk
X-Received: by 2002:a05:690c:e06:b0:8b3:59ac:9f5e with SMTP id 00721157ae682-8b5205073a4mr100432837b3.61.1795638154248;
        Wed, 25 Nov 2026 12:22:34 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5201bb6c7sm77074377b3.6.2026.11.25.12.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:22:33 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 25 Nov 2026 15:22:28 -0500
Subject: [PATCH v2 1/6] iio: ABI: Move out_resistance_raw_available to
 sysfs-bus-iio
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
Message-Id: <20261125-iio-ad5246-v2-1-8feeb630f0b6@telaak.dev>
References: <20261125-iio-ad5246-v2-0-8feeb630f0b6@telaak.dev>
In-Reply-To: <20261125-iio-ad5246-v2-0-8feeb630f0b6@telaak.dev>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joseph Telaak <joseph@telaak.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@analog.com, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0

The available raw values of a resistance output were documented only
for the mcp4531, without the channel index. ds1803, mcp4531, tpl0102
and x9250 all report them, and indexed channels name the attribute
out_resistanceY_raw_available. Document both forms with the other
generic resistance attributes and drop the driver-specific file.

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 Documentation/ABI/testing/sysfs-bus-iio                       | 10 ++++++++++
 Documentation/ABI/testing/sysfs-bus-iio-potentiometer-mcp4531 |  8 --------
 MAINTAINERS                                                   |  1 -
 3 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-iio b/Documentation/ABI/testing/sysfs-bus-iio
index 54800847f2ca..83eb616862ea 100644
--- a/Documentation/ABI/testing/sysfs-bus-iio
+++ b/Documentation/ABI/testing/sysfs-bus-iio
@@ -2034,6 +2034,16 @@ Description:
 		Raw (unscaled no offset etc.) resistance reading.
 		Units after application of scale and offset are ohms.
 
+What:		/sys/bus/iio/devices/iio:deviceX/out_resistance_raw_available
+What:		/sys/bus/iio/devices/iio:deviceX/out_resistanceY_raw_available
+Date:		October 2016
+KernelVersion:	4.9
+Contact:	linux-iio@vger.kernel.org
+Description:
+		The range of available raw values, as the minimum value, the
+		step and the maximum value, all enclosed in square brackets.
+		Example: [0 1 256]
+
 What:		/sys/bus/iio/devices/iio:deviceX/in_coverageY_raw
 KernelVersion:	7.2
 Contact:	linux-iio@vger.kernel.org
diff --git a/Documentation/ABI/testing/sysfs-bus-iio-potentiometer-mcp4531 b/Documentation/ABI/testing/sysfs-bus-iio-potentiometer-mcp4531
deleted file mode 100644
index 2a91fbe394fc..000000000000
--- a/Documentation/ABI/testing/sysfs-bus-iio-potentiometer-mcp4531
+++ /dev/null
@@ -1,8 +0,0 @@
-What:		/sys/bus/iio/devices/iio:deviceX/out_resistance_raw_available
-Date:		October 2016
-KernelVersion:	4.9
-Contact:	Peter Rosin <peda@axentia.se>
-Description:
-		The range of available values represented as the minimum value,
-		the step and the maximum value, all enclosed in square brackets.
-		Example: [0 1 256]
diff --git a/MAINTAINERS b/MAINTAINERS
index c74dadb6cea9..ef6033c5edf3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16691,7 +16691,6 @@ MCP4018 AND MCP4531 MICROCHIP DIGITAL POTENTIOMETER DRIVERS
 M:	Peter Rosin <peda@lysator.liu.se>
 L:	linux-iio@vger.kernel.org
 S:	Maintained
-F:	Documentation/ABI/testing/sysfs-bus-iio-potentiometer-mcp4531
 F:	drivers/iio/potentiometer/mcp4018.c
 F:	drivers/iio/potentiometer/mcp4531.c
 

-- 
Git-155)

