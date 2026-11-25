Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594996;
	b=qxfK7kHvxlMFDG3XEZ7zrFGo+dV2D/U/LBRGgN6wInz8BdBHNznfzvGl3UCXjkhLfp9Y
	 iV28hjY6TdMVffr7cAdSHxZPTCg+HWwFN5SLTet5QkCqju/qYU1UsTwXHju5hCOZ458bh
	 wPHoy0L9a+ShYSc0/+av8hBXm6qzRweUWg9xbQehyAd3m95aiDTJhqH+0sLIYzgyw0VYh
	 kqtl8ju5EBVdU8+M/sUeYD70Zu/3kK92yeCRktP4LGAQrMNo1mROkDazz8FKHghvI3iZC
	 hLYU7epQHRyvK/GWslBRNMI7XwvwlTy6sRyGUFRC7gsjdbtdHce94RmN0B1/waLbFuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=H0edrWQTC7ttu731HvGwk8eEjHUaIiiSZ5m6LixAFbc=;
	b=4jBPOW6aQgdfHcSQUA4KfQPQOipCmTY+Y4S42Qb/12efuvHAuitTCtIooVTwytGP7voP
	 L6DJMMrtW7FGzQGee8ouFcPkQ4Z9EICxFeLsYSZclagPXzNqDYO1oyr7LZ3m7VlXDacXr
	 YArvxnDFTtrKWzkScD76nwS+33H8CgxhMJeX6wX5OzRNCVNvBvu35LRMG//uAtoinuePU
	 lh1sxjdKq2D/rndITav2p+Hxl1CDi3ZPZ8F/e7S1+q/YCGsO7p2ttGwcXUGwpwqHprEsm
	 jL3O1oqfCYv/uZzqt9zGM6VRfcgtsMBs37rBcLq/ixPc+O0mmF40FpDtx5q/vinaqJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FvMgvFEG;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2789606A323
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 08:23:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2789606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FvMgvFEG
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-385c497bf94so2135286eec.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 00:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594995; x=1796199795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H0edrWQTC7ttu731HvGwk8eEjHUaIiiSZ5m6LixAFbc=;
        b=FvMgvFEGq+8EUc56aevrfK5f5jgs6whAMMa/gIWwHZV4gEN7mZWsYsZ7AUJSk32oee
         PBw1G9ixR7wyAccFrmizvIbotu5dHKm5jbzZJJSpfYOpqpalqj+2idHH9aTzksBWdt63
         DJABWtSm+qJlZ3JiKW8NDhTDHzf+odm8nplsvNyQyb4g6eA+KnhxRewMUAYpmFN8VinL
         L1AwGMTDQNNR/vRurHOiSQ2vYhRmDISVsPwrhniD0pP4/G7noszMo+YW943MiubAK6cj
         9vgu9y3w95M5Q4aLAkaKDoqgLrducM82FDfKlQ9cbaYzdpNwCuBPR1nhppVZLsytEWPC
         redQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594995; x=1796199795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H0edrWQTC7ttu731HvGwk8eEjHUaIiiSZ5m6LixAFbc=;
        b=b6qmOY5Xys2eS3qoi4nQoziVWVJRD6Fe0FycIaRhZpJA2iwP6cF5IDPJn/qkWZgXmg
         8rcDObHwkywbt4bnqqHO54i15q9zs9s4bJsH0wgBcgK6kTKQR3PERqXSd+Ix53SkDsZy
         5skgTmGGKXQthfPTbIunoIndmUUI1y5bL7uylQKtSAPvdAJQBTxjje2W4BduZrNDzRim
         AGsM4X/4FTnIjSUh2YbE0wdOyCUBtq8CEfxNoRHMVs9KDrcfqmCNN7gQwg1x84S8nx1+
         2CwNSddKhCzB2lBcwyal3L2av3DrRJ/1k7NYvTguHoHAYYkI4TK/Z/W6jLukdg9qaZ45
         9dBA==
X-Forwarded-Encrypted: i=1; AL+hErH4HPM/h7Tqe6hD00DQJKLWa9Ftq7LaJJWgCnC46mQxyzmBU2rZUuIxS8v7mwlDZzv/rNvd2zRGczH4@vger.kernel.org
X-Gm-Message-State: APuU4Z/tOG/5xi+5ziXdxd9wuYAMiZ72aPo1Bt6P/KRrYUuqm7RmVuOj
	QIns+cQxNRiR/Kx0HEJNjD/COaGJyTGCRTlJJYLIWPOFMWMfd2vvWxLGwTs8smm/
X-Gm-Gg: AZFdTZc25mUfDbKjP9O+0JDa80jKyN78yQjGtqOALyOsIIUn0IO6eKGlf35zmGBuJ+B
	iYkJFldxfzbJ1kS6qvIRqQ8LMgpX1UclNDvRYZ8Br3CqCNDjWzMs2ep4M8GVVb0eZqmBX75CDMF
	dymG1X29T7NDNFnFg9ZsW8orUxOasyqEpga6dhVDCFyHKU3KkHlv+9Zqpo0xnkm8vT7+Ttto758
	ymdOZRT1FCDQd8sCCpZPZJrUkbC6wCAWpVO7Tdc7CK/TApYa7GkMlcuc1enW9GnrraS75NSmEeY
	MXxl4xT2Pf96IFQcjmVvXg0GP653Zp40V2ClLCXtlfJF85mzhw2+PTsbgm4j0HtnsZuwC5Pv4Ua
	IVo/jhYEKOHM6hpNJ20OPsxdINma4vOM+NION/Yf7FY8UIw4KbvrNCWmiOL3WKc8DW8TnqW0rI+
	MtUZgKZLApRk7OiNBeNqi76fmOIt7vk+wN3Xtdm80/xx5toOWElRtqKet8K8ITy+RJ0Sm2tbTCO
	DykggJdTCwdiPa0oGH6asAgmocEoWdUmbHYWZNzf5Zm/VVmXbnc52LANkGbX0DVcW0UBrywtQV4
	uxcwcy8rQgFH5HG7RKlnsDniq/ckBULrW+0wkYkoMuI6rNZ00hP7zd2OGldq8Itn8rGg5t6Ixb0
	/8U9td9mgdPnODuk7Uw==
X-Received: by 2002:a05:693c:88d8:b0:386:954f:7c18 with SMTP id 5a478bee46e88-386954f7cf0mr14871602eec.31.1795594994538;
        Wed, 25 Nov 2026 00:23:14 -0800 (PST)
Received: from adlinkccoe2-Dell-G15-5511.adlinktech.com ([183.82.204.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm50919906eec.23.2026.11.25.00.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:23:14 -0800 (PST)
From: Dinesh kumar v <dineshkumarv85@gmail.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de
Cc: imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Dinesh kumar v <dineshkumarv85@gmail.com>
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add ADLINK
Date: Wed, 25 Nov 2026 13:52:20 +0530
Message-Id: <20261125082222.136238-2-dineshkumarv85@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261125082222.136238-1-dineshkumarv85@gmail.com>
References: <20261125082222.136238-1-dineshkumarv85@gmail.com>
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

Add the ADLINK Technology vendor prefix for device tree compatible strings.

Signed-off-by: Dinesh kumar v <dineshkumarv85@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index e467da45cd7a..6bbfa5619ee4 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -70,6 +70,8 @@ patternProperties:
     description: ADI Engineering, Inc.
   "^admatec,.*":
     description: admatec GmbH
+  "^adlink,.*":
+    description: ADLINK Technology Inc.
   "^advantech,.*":
     description: Advantech Corporation
   "^aeroflexgaisler,.*":
-- 
2.25.1

