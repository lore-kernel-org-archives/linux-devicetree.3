Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378501;
	b=x8OBtSQl/9npH92swAireERkjboLKejyhFbJrebuxlSRKuJTLGYEWx7jYOmO5Cbb4tCR
	 CRMzWKcdInuWXLgK+3LALr05a77a2/yhDjZonwuA62f44sq7F/p6KS7J/mEl9pYRHWYWL
	 uIUTfxC2C0dkEn7bq5PtEssMj24egeGSGv1qeqCpqYCqMLlDJOElxkz/MwQHLoNaK4vuI
	 NHq46isfwhRFPP7Vl3+63tD5wbQNUqskB6NeOy5ANTVOyAlReIpny+tm4W8B1aS+WDtcZ
	 x3yW6YAjqmeynrMk4fFPzFg1xxWciqiq1mI7MtEFLYn0pElzb6+bMANQCZvpmR+g+hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378501;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Y+TVwTlX7c3XctTEzScMeDWLIyBaOAtPHRcEpBS/ezk=;
	b=VnNxgziSfz7vVCoXUJTRWQQtq9nSonnKAnB0bHCY6OcFvR3M+VYjfZas4MDQpsAr4Rtn
	 dG8bqamrFUi4ihBMAfzOICEasyT/kjUuxAOL8uOFQJ3wU+gNx1gTUMcdAuBUDS0QnZUDj
	 o140wQ5rkVY6KAK9uvUzeoo2gOMp/NJGZex3mbop6kwRjNT4uqSupVyGUxF4U5PGzrw5V
	 psXck1+GV9KZU/Ut0xKjEP9ZdW7LTRrJosA7wNG7LK29ow/sztNfmZZ/rgpvDKt//8OGK
	 eEF3yUQd1SzHQAE9yJuJduAylAbxyWE+lioGRoruuqNSy0cv7pe+z69gicSE1UO8x4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mV4S7s0F;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D14606A684
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 20:15:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0D14606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mV4S7s0F
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b87a92c17eso3645701a12.3
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 12:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378499; x=1795983299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y+TVwTlX7c3XctTEzScMeDWLIyBaOAtPHRcEpBS/ezk=;
        b=mV4S7s0FSBQ8EhKjdIitZA7eBN6Dv6QzdU0jpu0+5ZnD+DDNounbp+Lj7QZXks6ho/
         CkkKf4eSnlEVxiOHTa+q/f7D2TYvG45nAJFDDBwKxskEDV7JXZHfdhg11gVqpd26xlET
         aXP/QHgoZL5/6uRwJEqwDzmx1Or/iKhzJdpiaBR2sFldJlww/vtWzeCJ7KCHR/ahnGFj
         5ETgU9nDYRb13y20bff1n0VbzUl2QXB9kWuXpyaE8HQI4Rtg9nHmROccUGs8s+z508dR
         XTQOpLrMZHy95JZMvZjn4QndHdNWHlfd7z9UpZVS7GU4CHhflfL7sT7TZ9AIJ+ocNx9G
         fI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378499; x=1795983299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y+TVwTlX7c3XctTEzScMeDWLIyBaOAtPHRcEpBS/ezk=;
        b=mtjaOGLuHvJNgtyHW2k45sQ88kMT3J7kX9j82DEPqfJY7LlBfgEQa5UpTJHOIq+tsK
         Hlzens5dDQZlChUbTIQ6YtRKAOHIx4lISypt/kixM49kUgfN6KvfxPoglCcWbztGab2O
         U3ImXkPbjfsCA95VHjrG3ST0aN9woOb/it1L9A1FNZpvr08gv4oGE7WtPIjkI1NwbAtn
         P2EfbjQyUdRMDN/UfvKMSRjk9T4IyTm46DeUykew8V/+m815R0TQhpiK3Vhd7Pbb+4eN
         tJ1DNaqg6c/zwT/mJN2WKNB7PwxowlAflMw7YYR8WB45+mxeHfdSk/gmXvX3qQGPZgHy
         Hw3Q==
X-Gm-Message-State: APuU4Z+RolkECQke405lMReEcHPUfJ+CLH7rGRQJhoDTSPjib4ckVRUG
	exE1W7PzJsBW5EdKmjp7u9qrw7fCgBgeXc5PCGvWwtgAaZiO7ROvEfwt
X-Gm-Gg: AZFdTZeOprQxemc4+dfRWldYSMGsM9/1AmydzXhtmeUESML8K4PeJjmn6bZH9nOZBwX
	5PIgeHOlsqCjUnhh1M/HAktBj3+N2cCe4JvGQ/OZY32LlmC0fpvuarHiTZoK6Qo54MoubqrZky7
	DxfVdTu6LOQMllki3T/A2mK/+TMMZubmMW5hLBCVXMK3IVL8Sa/Oq7UZl5oGGP6YigEi6+FxtaC
	gI2XXJ44NFHDkR6xQdpsKtp8Ekwd4FfQEhq4EBQn8K/UhAsFqrChhnU504h0WxRXEwmPnb6j5hp
	i6VarLcXvfnvr7V0nxk3GT+LfCM+ChVxrGbgss6cJaADV6TpkY0FDQI/KW5hMXVdaNtDwtJQ6ng
	HriKqZvtRcKuLAWKMRuxW2YqIw+qG6RW5CTLHVIdoOobcjGhILI5wu2ysziFxLsvfF7JEFF2qAK
	XsmUBqY4y7MRUhIHQNwSgCfPrjcfEhbxEH2BBssRmwSz3GTDiNbrhCD5c1qWWrbU3/Ang1pesO2
	zaQpYf1eWH4p5VjT/S1a1Pwq6/h2zBoQCy/f9MSl1XMh3tuGqzIYafinGS6vRdl5RDdsxTm9FmA
	s6NC7xpeU1+ANy9h3AtNTWn2SWdgK3UpRRVH0kJoFUPN/DuUlMwIgcvsC9471R0tDYmO8nRDzOY
	o5UbttcrY9Q==
X-Received: by 2002:a05:6402:1d4f:b0:6ba:95c2:750e with SMTP id 4fb4d7f45d1cf-6ba95c27ab5mr1629135a12.16.1795378499006;
        Sun, 22 Nov 2026 12:14:59 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:14:58 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 15/18] ARM: tegra: tegratab: Update GPIO keys and switches
Date: Sun, 22 Nov 2026 22:14:04 +0200
Message-ID: <20261122201407.23742-16-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122201407.23742-1-clamor95@gmail.com>
References: <20261122201407.23742-1-clamor95@gmail.com>
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

Update the debounce-interval for GPIO keys and add hall sensor and tablet
mode switches.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../tegra114-nvidia-tegratab-common.dtsi      | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
index cf8cd037a732a..f6b167dc8d338 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
@@ -2295,6 +2295,24 @@ usb_connector_out: endpoint {
 		};
 	};
 
+	extcon-keys {
+		compatible = "gpio-keys";
+
+		switch-hall-sensor {
+			label = "Hall Sensor";
+			gpios = <&gpio TEGRA_GPIO(C, 7) GPIO_ACTIVE_LOW>;
+			linux,code = <SW_LID>;
+			wakeup-source;
+		};
+
+		switch-tablet-mode {
+			label = "Tablet mode";
+			gpios = <&gpio TEGRA_GPIO(O, 5) GPIO_ACTIVE_LOW>;
+			linux,code = <SW_TABLET_MODE>;
+			wakeup-source;
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 
@@ -2302,6 +2320,7 @@ key-power {
 			label = "Power";
 			gpios = <&gpio TEGRA_GPIO(Q, 0) GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_POWER>;
+			debounce-interval = <30>;
 			wakeup-source;
 		};
 
@@ -2309,12 +2328,14 @@ key-volume-down {
 			label = "Volume Down";
 			gpios = <&gpio TEGRA_GPIO(Q, 2) GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEDOWN>;
+			debounce-interval = <30>;
 		};
 
 		key-volume-up {
 			label = "Volume Up";
 			gpios = <&gpio TEGRA_GPIO(R, 2) GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <30>;
 		};
 	};
 
-- 
2.53.0

