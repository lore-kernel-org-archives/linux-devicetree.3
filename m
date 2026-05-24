Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19E433C1AD
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 20:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779655882; cv=none; b=hzA+tiILDewo0B/bq6dYYTCHbKRDGZC4jj4GLZsCoHpbsTJR/9/OAKGOXcfpYHf2aJ3a0uRb5JrsGjXr9gjluVNqwtZg5aOpmq49tv52UrjdLyuV+JYnSPXGJsLH97Iar+Fpp7I50ILJcvqD99Bm0+1ans2XDQriwhE+qzHFXfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779655882; c=relaxed/simple;
	bh=/E6noZEAxsmqEWcfMOy++WDBnV+JRuYmIOlWaCLHqFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O2S/mDPCiUzA9ffpFZsmS+BKhzEWFxMGBrwKsOCbZ7PRmoEd4jzdcQEWNUxjVFKC6hDrpD3MqYQW31ZugPp7S3AlySBm+jinzpeJOX5uv+w9DoLGQVaw2FjNaA+E+CC2eOkGsldd/FW0B0fRWZR3oWw8hLyGWQ5mUD1cvLpgfTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oTqru2vc; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oTqru2vc"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48d146705b4so95070495e9.3
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 13:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779655879; x=1780260679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFd4yJ/TC4wEbZC59wd9fQSCOjR2w318PilPDVoxbPw=;
        b=oTqru2vcdTnZiWMZkpNMv9u7o2L0pLHcfkA7TkK9woFGYlYbPozZtQqICzS27/ybPQ
         nV/KWK/0vLAl0EshAzJL451DxkaIRToVSt1sROHanFWDS5KihzClqoK1VkZmCh342cIe
         +U8xMkoVVBWw7unuREfntsXHbt6nSV3q6PK8frZ7kG9CCC9L3EaVeU9YM6RV0S7wDbIu
         NE0UnO4LHuUJe21vbXexD/7db2l2cK5DRqvCAp4+PJVrwnutv3AQCHCfEZCYiVzL3qXV
         0NnlLhU5Ix7kwfWdh6t1rDy06yVIgRA6JCdJyCJnscSNt8wR0PoAc0SmSEoaj0R6P745
         Wapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779655879; x=1780260679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iFd4yJ/TC4wEbZC59wd9fQSCOjR2w318PilPDVoxbPw=;
        b=StnX2AErP+HTgTB3u4RABCHd5+VGzHqQtHw3+gnw3dJMaFnEffxje4KZkgdUWOg/XB
         v6osn4ejuDQVJ3mY5inmcRibtgBlUaNvylZZjkp0zTVjaQ8GKeZWHt6dw0oB2WiRVHq3
         TjWZP4gpLGaOuLLVmQph55OweAozzJ18shgZoT6Orfftxn7EDUCVg08f5+HxzcBPonKq
         h/+6yrQegHtYWdeD+rkF+EOPBHnl6yF7aPAdC9iA7iDhr9V+phWdqpytz+/+1qLu4zP+
         qkWKg53s8OpH+jSAQDPZVm+QFPfAcQtLPRlYHWYaAy1JsE5r/JFjE28vCEISFE90MnfW
         co/Q==
X-Forwarded-Encrypted: i=1; AFNElJ/doOafkWWMDYDnb/t32tK1pWybdyyuZXr7Zcj0zbPsjbs5lm7qjUIbEUVeuWEtGtuLbokc8H32bXhi@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0Cu8fOUDDBh/fPhvwheLfbCcaC52yZeTKy7x9EmgGR33Kvt1k
	qrmyQGrFgiUZvSCOGa/0XBTBn840IN9blkVY7WFhdGCg4kghwCBuJkoS
X-Gm-Gg: Acq92OHQmvPUbL0MLZnZa11hcX69IdB0YxnIvPKWgzAgYnr0lXm5KfjBcxZkM6coAmP
	gLcKae9fjne8lxKE2+wpeyQI5GPkco3YzE/AVcvx9WXdRN9lib8YJznQq3+tYu9cNbZlG9wkEam
	194xGxqQxT9ERJ2PmGuzjJ2fs1GySVCqeDoufceNToLuG79vslePjVWA2HZZBjYouzSM7tScE3u
	uo7ApeY46f/n4sm7qqtcdGOIiTPA1gwKjfIIZV+HAds5LT/HwEWGxaIaomvtdzQQ5/XhYoZyJ8D
	5zEggFi5qtZ3kp0iA9BILBuuxbnHoYE/5cS1GegtqC/NFIFumX+k6wbi7rmbNdhTNulCdE8H5i+
	Isdmn6Xvj2I35EQUgRbqiPQ99R+s8qCo4Y4NjkBTeaZh7aOryc8TLUa2i4GFGvLJwKjFDRzePjl
	L+pds1
X-Received: by 2002:a05:600c:818e:b0:490:58f4:ba23 with SMTP id 5b1f17b1804b1-4905c60ef29mr62901095e9.30.1779655878894;
        Sun, 24 May 2026 13:51:18 -0700 (PDT)
Received: from sefo-laptop ([2a02:8071:50c5:5c0::361b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d6ebf0sm22738588f8f.34.2026.05.24.13.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 13:51:18 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: jic23@kernel.org
Cc: lars@metafoo.de,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net,
	jdelvare@suse.com,
	ak@it-klinger.de,
	linux-iio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 4/4] MAINTAINERS: add entry for Sensirion SLF3x flow sensor driver
Date: Sun, 24 May 2026 22:49:39 +0200
Message-ID: <20260524205112.26638-5-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260524205112.26638-1-wafgo01@gmail.com>
References: <20260524205112.26638-1-wafgo01@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wadim Mueller <wadim.mueller@cmblu.de>

Signed-off-by: Wadim Mueller <wadim.mueller@cmblu.de>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 06a8c7457..5cafa8c8f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24187,6 +24187,13 @@ S:	Maintained
 F:	Documentation/ABI/testing/sysfs-bus-iio-chemical-sgp40
 F:	drivers/iio/chemical/sgp40.c
 
+SENSIRION SLF3X LIQUID FLOW SENSOR DRIVER
+M:	Wadim Mueller <wadim.mueller@cmblu.de>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml
+F:	drivers/iio/flow/slf3x.c
+
 SENSIRION SPS30 AIR POLLUTION SENSOR DRIVER
 M:	Tomasz Duszynski <tduszyns@gmail.com>
 S:	Maintained
-- 
2.52.0

