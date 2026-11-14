Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794650466;
	b=Kenv9xSHi+U0S/tsWTZohOZzMNRYjOGpRQf4BelBozAUCeIooAaynJqHQtwl084AzgoX
	 QfL+/ePL0bnYTrE3WUzFawU/w+AiR0Fa/RczX5rYn8BpgUknn7Ko5YOvrYYdSwu+AHt7B
	 FecRDwQNvM6S+ZHJvg3qtidD93DXL4iVPsLclDBZxuT56A6GofdOsn0Er11wcBxdNaS7V
	 oW0oqWNDEiHvNX3cimQokYMIDiAckzEZA/m6GbbJiTBQKJwZxaV1Dg7Fn9PAtGjYxE17c
	 z7itrJTd4uKYN1hb8gb4CY480RS3kKzAJaTD+IAHD5RitYDHNL8SOR68bQKF7KvFwfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794650466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=eC04+x1Aj5L0dZDAOuUn9+6Z9aX/XkxoD9/WXm06rNo=;
	b=hCF7z767ArHyYMcK4vWdmnhvhk+ydHAAsVg9A69eNRNeGLQa3E/XojBMmMbm5GejB5s+
	 bYGmaLwxvqPsWY5t38Xc2MvVvimZe6pbYbNVap7rUrDkhnsAhy7jJvIb6akLVeNCLtbcO
	 SMYfhVsfkDVkNRDl9GLbiKTkieGhttqUpLqOnksrsiwGQso0m/vhqsztp6UWH/jyD3WDX
	 Y9P1tHR79dt0Iyeju0reUBMnwsiw5AGW3eX3RDAdwQG+HhCaVMVrI3cacjEhxN16Ffh3r
	 dslkJ8u2GdEodIORbYM7WmuqsLDuYsoiuYCDjHrITOV4uvlYwidnO6xnqptT0mjsF1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=osyx.tech;
	spf=none smtp.mailfrom=osyx.tech;
	dkim=pass header.d=osyx-tech.20260707.gappssmtp.com header.i=@osyx-tech.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=l8BELnJI;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA3B606A337
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 10:01:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBA3B606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osyx-tech.20260707.gappssmtp.com header.i=@osyx-tech.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=l8BELnJI
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-49412eb1474so843936f8f.3
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 02:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20260707.gappssmtp.com; s=20260707; t=1794650464; x=1795255264; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eC04+x1Aj5L0dZDAOuUn9+6Z9aX/XkxoD9/WXm06rNo=;
        b=l8BELnJI3pTWl/XiiJbX3dWKO1ce40yOuv4TxMK+VNNJm2H1bwq91bW1m4zLaivmQY
         dwXh8KVHYsxhkFlL4STp2Rp9kx+KNDjQt6HmsciUFgo5GzZ3BGZ6Viyu6f+/rZnVkHz4
         qrGftZRjp8zJ68DPPcLIar6jsw/Rv1cGzPyd2BUOH5aWPMUzh1v3Jdos/oyS3/0a6x4s
         G9bG38Jo30AUexs7BIGS3uaQe3xI8QByUx0jJ5Rv83iFWEcdnGIBzstTTZFMo6XChTFw
         J3piGX4CaQg2c+40DB4lM4qnMdZPAkhuIDshGHpW8Lwe5tjqVM9rCkar3sFmAIOhoc/1
         g9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794650464; x=1795255264;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eC04+x1Aj5L0dZDAOuUn9+6Z9aX/XkxoD9/WXm06rNo=;
        b=JqktAi2O7KgMqp6vMG/tAJaZ48hoQGneEmhpHLJhi7ITOH/9ptLC7g0Sa/3ukjhO61
         xMaZaXqny5VXvnpZxgu0PwM5gy0ltKhnc32ihaNxdyeD0I4gDylDcU08OzuIVJrpEMPw
         iGl3dl/rRr6IKvxuGMx/riXH3mMuzVYFa/Y7ViyR2NarlDXb+UwkTTFrtGV3r2cxcKqs
         3hcuJZ4HXiCpHqSo8XG6oFDV6z7+gGGDGPJRjpOy4gf3jHIq6yr+B3ICECO82zeXgqmH
         VZUBMLxI3xpOcADo2jAdWkAtjzdnRRXdQQyD75rTLBYcoQRQGV/d+IcmBeP13ee/5P0m
         2jKw==
X-Forwarded-Encrypted: i=1; AL+hErHdxTOhweSBt+A0CvxX5ZmEB2hSDk6DsopTXswCRfKRlVfH01wXnDNwyhKCrcoo5BREGHj1+bhLa0XY@vger.kernel.org
X-Gm-Message-State: APuU4Z8ECzdz1ZOt0FnCevNxvi0kPD5GV0V07IYK1q+LpgawBteWo25I
	O/ddr/jTviuoWhFhpjFBMD7n70e2eIukTuauElSDe/8WBQ930qHQzI6MCS+iAAmJ5OsS
X-Gm-Gg: AYBFou0smgr/TDXlCH3n+cnvggyy3TlCfajUmy6bKYWz9BJEmSAGzVpT0dpLpCbMiwj
	GIfQ0qjrSErl/gNF4JNgu0jxn27TnBcz0fXdj5pLS/0k4OnOpokx5n/hZ0vNO8H1Xc/LlT/Xxt2
	nzuxqOsWB+TP64Y/wJxkf0i+rO1hXUihgOHbOxouUeZxEYphS/bmJZ0KQDSRSWhGqAXrqED69fW
	m5rt2r3O2u3w6XKmAoDbMKVuVq/rnVmNNIvvBX1bvGzQ+u8tJ91lNaAhgdpbIWFfZDxeTYKFmls
	rKgr+fgNinmhtkO+p/yozqOTlyQQI7x5hNexs9oHLylybPYiXlsJTfF9ibSVPTQP69a7D+lE19k
	qkXhVnsT2XwjNlFkUBPt9GYHhMA/Mg/BQ1ZZKg1ow0PXFw+Al6Nd8SaAy/ehLCchb8VmJdOx3PX
	ogYoTljMhemC9iEU5dQJfo0teW7jlXHnEZY8sA56RTjiZyP+C8NXddEHasd1xUReA0cwTFfYHGQ
	fEPhg2w9pbj8jzd/F0JXaWmIO/+an8h2tUSAfy/8rz2y5LenL73KMUcej7i/9m51tDlXQqLQB6g
	zkuFH4ZSaX1mSBeDl8TJeNRMktMDq8J41g==
X-Received: by 2002:a05:6000:4918:b0:492:b1c5:6db4 with SMTP id ffacd0b85a97d-49c723fc793mr10335695f8f.26.1794650464192;
        Sat, 14 Nov 2026 02:01:04 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:a084:d599:46a5:5c31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608d10b2sm16920053f8f.44.2026.11.14.02.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:01:03 -0800 (PST)
From: =?UTF-8?q?Jo=C3=A3o=20Peixoto?= <jpeixoto@osyx.tech>
To: gregkh@linuxfoundation.org,
	will@kernel.org
Cc: catalin.marinas@arm.com,
	andrew.jones@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	jose@osyx.tech,
	davidmcerdeira@osyx.tech,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v7 3/3] MAINTAINERS: add Bao hypervisor entry
Date: Sat, 14 Nov 2026 10:00:49 +0000
Message-ID: <ab06a2173b01f4e18dd24c68e03ef846ea933098.1794649714.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794649714.git.jpeixoto@osyx.tech>
References: <cover.1794649714.git.jpeixoto@osyx.tech>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a MAINTAINERS entry covering the Bao hypervisor drivers and their
UAPI header.

Signed-off-by: João Peixoto <jpeixoto@osyx.tech>
---
v7:
- No change.
v6:
- No change.
v5:
- No change.
v4:
- Drop the arch/*/include/asm/bao.h and include/linux/bao.h entries (the
  files are gone); use the directory form for drivers/virt/bao/.

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..dbea081447e2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4712,6 +4712,14 @@ F:	drivers/video/backlight/
 F:	include/linux/backlight.h
 F:	include/linux/pwm_backlight.h
 
+BAO HYPERVISOR
+M:	José Martins <jose@osyx.tech>
+M:	David Cerdeira <davidmcerdeira@osyx.tech>
+M:	João Peixoto <jpeixoto@osyx.tech>
+S:	Maintained
+F:	drivers/virt/bao/
+F:	include/uapi/linux/bao.h
+
 BARCO P50 GPIO DRIVER
 M:	Santosh Kumar Yadav <santoshkumar.yadav@barco.com>
 M:	Peter Korsgaard <peter.korsgaard@barco.com>
-- 
2.53.0

