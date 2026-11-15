Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733899;
	b=QOOA/jFFT82d8cFs2ztqoBRX6e5fWRFhxYyabvTmwZXhy4JWAg3iuo86iqpJsk5n499v
	 EOGcUP9rZOnJ+2cWi3b0B4hjjeP08Y9NwNPzS+PRDB80BMq8YFS9i8bALqEnK2x40Nyj/
	 ug0fqZAFWNTVtf4ARa6O47Ri0+pO7D/dI9/bFT4r59lT4FzEi+/JB/22UXiP8mG2XxC+Y
	 GyxdVUYbIfWmLNG+znvuZ2kY9p4W9nXBbvUZzoj7JA45ye8wP3F6GNWb89tD5+AJ5C31z
	 a7sa4n1R/yFOFOL13rAncya/sDwnBWaGguxnXB7OVhl7B+KbB3p/JB6dNjegPw3o3zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wcWcH7tJyixpCkmaYR6T6VjPcinuyJPX3UgBgsh3a94=;
	b=eQEi04Ei3z9ToI3prRGeMV0HMIBTj/WsDNJ9J+koFHeI5LxzJbN+Jrr+cNMw8S10pttm
	 LvZF23re4OGxoCzkpBAQp0dUHXuEKGIoIlK03G53jFAV/jBQINLeoic/6qJTlyLJUiFRF
	 egIJEzuTOKHiBi93C5D43/zqO8WO44dH4TkmwNATpVH8eX3Q9rzk10kB+NfgdoW5kpVJJ
	 Y0qi/aecDFA7c+AhQxW0xk0LsgvHcyxMCg+DWXsejDjFJelRQmIu3OudaeFmugCuE0bJY
	 IAXHOAzqfbQDBVfIebqa8kzeCP7QBnn5y7fGMErmRomN4id3O6AzNm4/B4x61Sw8KVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a2A9FU46;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF8D606A883
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 09:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FF8D606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a2A9FU46
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c50933bdf4bso505411366b.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 01:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733898; x=1795338698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wcWcH7tJyixpCkmaYR6T6VjPcinuyJPX3UgBgsh3a94=;
        b=a2A9FU46G+YiztCbvxrFji+SXnIeWoZe5W8H+k3kUQ/qCHq4YhLKHZwlVzkXq8280U
         IzF0NuXMD5lXnmObxGmcMI/x/hCT6srMphYqu+k0ksoKEa3JysO06aYhsnEpihXcxEUV
         AG49snclUtE0sPUtYP16iCpRIs8IrDC4UHZYC0mn/4ctNphzJFHeww94U77LCOqWH8vZ
         UwKMOem6ay7imGpw+AVFsZlHetX1a8Hv+s5JcrUsWOfXhjhtJJIG2biWL/wpuwnEEfEy
         xHXbp0GkHCWddGBgMnnFLhS3zfkyxUMI19a9qoGAgqFcp7Wyl426+sP5BPywD7QUYaVp
         okRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733898; x=1795338698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wcWcH7tJyixpCkmaYR6T6VjPcinuyJPX3UgBgsh3a94=;
        b=ktvKMF7YZ9sm7zJirfUFfSwHFzAl/LIAwWuPSQoIBZ+azXkNW4bZ391WGNR+vJYH1D
         l7sp+lgi61jE12j2HSjQ1PJ296btmxS8VmMO1u6ATDUltRwSPspnSQVY6ic7VplFKTOe
         XV3qvTg5ussZbTdET0wHJ05fOiEVaSSEhrtHkRzOrmBZn/M51HN8oQzzt+YDlbpqxo9q
         r29RJW3p06hvDeiXfKBXiLMO7RzFU9CG6XI6XMfxp/HuoNZadQ550cQbL0TVHX6/pspj
         bIY0F/rBLTes+YP0herngpiXzqHfQq4/OIVjwGq7UL/Ca2yEc0mMh3a3MmEuQyaBfSc9
         rUQQ==
X-Forwarded-Encrypted: i=1; AL+hErEBIMedb84BmDyohXhXYjGl5gyLNKY0jxpIb5bxa8NOKjO6qgXhldFRMh8DOAZPeuXawhSoM/1o24rz@vger.kernel.org
X-Gm-Message-State: APuU4Z80jSi38RxyjFGI9Tq5u4cZDKlOnl/8rud6nXJaEHoueVB9nbRd
	uQ3rMCk10kZ4aQIrjOPHecztNg7Cq2Yd2kOD05xOZ1oUlXa7f9PFsTMo
X-Gm-Gg: AYBFou2WrskuO3L/Da4PbVdO+/J6Pv/TH2UE+gYDh16RzH3pTXznZBModgwbNFt3LzT
	swcO0ObFvmmpe2zslPvUixvyF0udH8vFUQ1mFG35DU7rC0UldmgB4+Kkc5pQni4TaUgZ8lo3jFi
	036g+7NoTALrrb3ts1XeN4PDqPe0aekvfDLjtRpEsyj1mr2IrngajF/NRyHdb8o8Qera5Vd4TlB
	uzbJJc05ng1rEqYg68rHTGA96OLF9LeL+xL147zjGb9OQGkggeLxEYxEGkIQqkjyG95xwmOfWJ2
	x5/cJRCjCegsJYLbLijhN4JGi/ya4sPuZJKKTd2XnQyheLLR23WwqsJSdBlsuP8aAGyrAI6SdnE
	53Ojbjv40cXlwBsyq3qe8ipfEx3hg+Dd0pBdWheo4nBbj64ipqYV3QkN+JwZOCUd3wChzaEqQc6
	0YM/hCnfqciOUzl7sU4hQLoiOvNWgijfShUBW0TyA9DDr5MqdBWVmHf9gcRExGqYwFva131T1up
	zwoV9fvOThox4cdCG99budi49Yj4WIt5hM83/H6c9APTBUDiuS7zOiGaYPaCR0qj1yS/jOe0cga
	yH2b9bD7KtbjSzJAA8YBFSQpGUWCqcVs2n6WVe5gzNBhRfGc91+9UwHlYb8X5nXguspd5raX381
	44AIAU6E8Tw==
X-Received: by 2002:a17:907:3f8d:b0:c46:8b87:c212 with SMTP id a640c23a62f3a-c50963bba0cmr735412066b.20.1794733897981;
        Sun, 15 Nov 2026 01:11:37 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b3dbaesm289392366b.32.2026.11.15.01.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:11:37 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v2 4/4] mfd: max8907: Add ADC cell
Date: Sun, 15 Nov 2026 11:11:20 +0200
Message-ID: <20261115091120.108684-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115091120.108684-1-clamor95@gmail.com>
References: <20261115091120.108684-1-clamor95@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the ADC cell name to the list of MAX8907 cells.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 2aaea750d1690..2d94248011915 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -20,6 +20,7 @@
 #include <linux/slab.h>
 
 static const struct mfd_cell max8907_cells[] = {
+	{ .name = "max8907-adc", },
 	{ .name = "max8907-leds", },
 	{ .name = "max8907-regulator", },
 	{ .name = "max8907-rtc", },
-- 
2.53.0

