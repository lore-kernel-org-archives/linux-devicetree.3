Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913802;
	b=efER+QLMhJ8HqYa37hkpoErhMbDFeqRao0WliLWZ8canVU9qjz2OxBFx1ubZSFNiHB76
	 0QHMkmQHoN04/X3zlX6TPHIUoOR1Iqk5bhKfa7cwNFdWF+kIatrwNpIRRNL61Ac6dXYMv
	 LezGoJzDFCvl6a98lgU+M2R4A/N9edJC2Ls961taURQRdYnsFbNXvXdZtSyDmapMIN1cz
	 ljP01JOMVgpnktajfw9BkSJhK43Qa6R+jZv+txsMFsZUAt1Osrq4UWuGcKB/O/584L4RV
	 VYDoRt+B2S69ls3Zy6sH9V52NcYP6VU9MrrUPR2Af0b3DGhgYm2oHevrPyRZw/CavfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3ISBPwk8qHeSYB//k/N7PsmIgbDqodoqheEua22OWtQ=;
	b=Fbu03Suf5UccvvrKxFHGhd8qIdKYSSgdfravLQNvLYjRqDa7sVC30oCUbg3RZMKMDrLH
	 FDCI6MmGArVILRAJY3Q+4WN/+eeRrmfdwuY2fhcslTTbG+WUO9Ms6blVW/Hpbip2apVQG
	 jPh8oDX8dHnwIsfMJemd45g5v7/sgLVBWN683q3cSA0ih4IYpdt5t4g/EAinomh6z/FvY
	 J3lqlNMiQc8u6ZyAmAmLZ8CKd5bAF8m6oGKpxS18kb7V4MHsIFO3/hoYhLBFWp+gGOGe+
	 OQQE8s80q2+jV9VcW9eRacM8gpsW3fMpA4gQljAspHfyOmLGXAffIBP5od2PT4X13mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oc6zcNdi;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F38606A32A
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 11:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5F38606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oc6zcNdi
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3282db206d3so12303211eec.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 03:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913801; x=1795518601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ISBPwk8qHeSYB//k/N7PsmIgbDqodoqheEua22OWtQ=;
        b=Oc6zcNdixWMFm76SSUKnhzYY8q3Nwt6oTBJekaFpoPYmoHhI+COcHchpx4Jr95eMTQ
         Nfd63rfs8Yo0TLi3ipADabObZ9bGEr0JC0cfc9xthBZsQOAA88TPcgCm3jM0udHc189f
         I8InqFADNT2BtjxtOItrIKnfBMX5cYATYNzllUrxmPCNnTyIkgQOg+n6GAFKrwdZzRtY
         eNribh2r/hC2ZKT1sEEoT/Tq3lbGEFPj56TRm3zPslCvlvFwo/SlSK3acvyKhb0xxDat
         uM1Bk/qca/JjR2qEP7YCPmfe7S2+32OFa9upCuTC+L3zgKANaT2jh8Z+qXMSSsMFUFoq
         +RqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913801; x=1795518601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3ISBPwk8qHeSYB//k/N7PsmIgbDqodoqheEua22OWtQ=;
        b=EAi/5+Y6GPdi956Mw17icZSUFkgliSmpu0Eq15vbHIP8g3XPMtUZrA83d0BKCkwpCj
         3r7+dRZbvF8UA4VVbk6/c7YOiyhyabsDWcQI3/GGa29uWf+j4oyASORnMP+Pjnp0gCxo
         Axmfx0tDJgd1QfSjoGHBHoB7/1a9HiumifulqmgARf3zHWbWOApOq1fcl44zbtVf15RG
         OD5yZ0gD9L47wZfpd+G4Kb52ko1+Vx8gcMlGd6CbEpNoKhvyZRjV1IUgNddw5vpMIeQZ
         q0dVkEKYH0cwZIXMVAg4cQOIi0RQBv+xZh+EHT2ezCT41H/3/XHifVKNhT+AuwOZKQjE
         +Cdg==
X-Forwarded-Encrypted: i=1; AL+hErEIbZF8K9U1uiLqCNHTZtaHEveja5aSRq78QoCkBIR+jrb11W7meddli3lXQ1LlHqVKriC3JbrjHkCR@vger.kernel.org
X-Gm-Message-State: APuU4Z9DJ3xUsNHCWGMhMHwi/Er47SzqQDz/5KlXnB1L8LzEsXGNOynz
	dMCdxCpTf2lM0lOTTLXHJu+lj7oKgywB+8MGOVXhWY/M5drlrWLQ/Sql
X-Gm-Gg: AZFdTZerdkbJ2ighhAu/0hfFKZmFaeHVKMIaiTsBtrWl7rsPeeu0mwwHO2lWonnX4kq
	EDQnMAg/MO3Jm+Z8xNjvJLHTwbGyxviL6EDCbAp6Y6yo+sYlmrfp5HJGczwxduE092UjG9V05kb
	T7sbyi8agufHNJ5dOHB2Mq6YoyjjTPpMRCShroFfvx0qagwec1Xb5mkelYhsr7oqwykMsPlk72V
	VfMaXG36FhNCyG9sMBnfzwuYvl1/PFMLiJ++D/RSsUtTJZnQrNiOkDYNhLPyOvefDWc9RSbOmAL
	i4UFeDioEz3/tUc3o7nNhTYG0B3UPd6Z10Zw9MP8sK07EzlDJFnU99S6+7b106CGWa8usFghtYW
	1BlIBUw9coByRP5I1vuKeMeHsau4kveqyWcPqpUQLMb/aNQWZaKDNN2RWdxC5+AG9Bjo24QZXeJ
	vM4xIZlNURyTByTjNc1oWo6+AJu92yzIDiRHp9zJfGYBf7zgrYpueodgSdAU5maH84K7ANCj3ao
	Ln1BQzc2Cs5o6vIkIKlTy7XRO41sJ1rwLZ0iAT5m2F1jvfXxP+HdNzoAP6Y229a0MF8XxFrxynE
	So5QtTSPiIUdDNuu3XaeiJDf3stT4pyMM6wk8ElPufAHMxzo5t9BEoNJ1x3bpAHeDfXvzLQKpOV
	9LRRBF6C0N8p380UcUh/Ge0kBLYtivysOXhRUX8sAqBOY8E5e9XFQxNHuBOKsANJ8accwkUkmXo
	Xl8rZtYZUmfTQI1yFIxSOVydmjy4OyPIYQ1vRkRhOiALA=
X-Received: by 2002:a05:693c:87d6:10b0:380:c2ee:4035 with SMTP id 5a478bee46e88-380c2ee41bfmr2990992eec.16.1794913800913;
        Tue, 17 Nov 2026 03:10:00 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-381a55555dbsm5560475eec.10.2026.11.17.03.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:10:00 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Gwendal Grignou <gwendal@chromium.org>,
	Daniel Campello <campello@chromium.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v2 2/2] MAINTAINERS: add a reviewer entry for the Semtech SX9xxx proximity drivers
Date: Tue, 17 Nov 2026 16:39:35 +0530
Message-ID: <20261117110939.214932-3-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117110939.214932-1-kapoorarnav43@gmail.com>
References: <20261117110939.214932-1-kapoorarnav43@gmail.com>
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

The Semtech SX9310, SX9324, SX9360 and SX9500 proximity sensor drivers
and the shared sx_common code have no MAINTAINERS entry, so
get_maintainer.pl only lists the IIO maintainers and reviewers for them.

Add an entry with me as reviewer. There is no M: line, so maintenance
falls back to the IIO subsystem entry, as Jonathan suggested [1].

Link: https://lore.kernel.org/all/20261117031830.69ac22f5@jic23-hlaptop/ [1]
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 MAINTAINERS | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0017755f593b..94797863d881 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25448,6 +25448,19 @@ F:	include/uapi/linux/selinux_netlink.h
 F:	scripts/selinux/
 F:	security/selinux/
 
+SEMTECH SX9XXX PROXIMITY SENSOR DRIVERS
+R:	Arnav Kapoor <kapoorarnav43@gmail.com>
+L:	linux-iio@vger.kernel.org
+F:	Documentation/devicetree/bindings/iio/proximity/semtech,sx9310.yaml
+F:	Documentation/devicetree/bindings/iio/proximity/semtech,sx9324.yaml
+F:	Documentation/devicetree/bindings/iio/proximity/semtech,sx9360.yaml
+F:	Documentation/devicetree/bindings/iio/proximity/semtech,sx9500.yaml
+F:	drivers/iio/proximity/sx9310.c
+F:	drivers/iio/proximity/sx9324.c
+F:	drivers/iio/proximity/sx9360.c
+F:	drivers/iio/proximity/sx9500.c
+F:	drivers/iio/proximity/sx_common.*
+
 SENSABLE PHANTOM
 M:	Jiri Slaby <jirislaby@kernel.org>
 S:	Maintained
-- 
2.53.0

