Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239110;
	b=G8zKJ+iwFsQjBFyQIkPcbvv0w7aSMZzZELERoKLE3NkaUzscVqD2uv3khkVPbf+quGYe
	 TWcI6FypQOcXv+eQ+2ZIT/xsIHWUWztMOAj16t4Mj/FE556GRocHWnxbL7OcJqABvm+f/
	 QHVepZ3KzbYGymM8jGzSX+dzqF/iEJmXIrfT0gqykxeSolWKzojG1ZT1i7rwpABBhjy1z
	 2jUKVel3bb+/8n/ioUPq/NbO7qTmvSEGUUVGsYC3WlnELuZGKiiZa0cKAKUFqFDtxUtB8
	 2wjfYhdXjuQJKpj049HLTVONWmPo5DXbVfUEPmJPzScK0FiJ9vaHK7WvYNuqsvC89WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=L2Uvgg/TH8ek7dpiyCaiigwe788vwtcSZF4TPOxN5MA=;
	b=01Cftgr2v8jiSj0lSnuFBcVMlD4lpTiSvYbRzdN7Rb3Np6pB3nDNwdoOgbsNGwlce1M1
	 2ekC2V8yJwD1eXf+aaxQor0+ImJWaq5QMCQoxzOeScYH929LCPV9z/6l7QheHhUCl0TW9
	 aSFyEUVo87EDpTGtSbZMJuk3e6IA4e1o+o2t3gLdbpuPT+8MY+koYwf2Ffz0d/7+gKK2n
	 kctn3Yj1hNTmQFSHmXKmgax+5WhZ0v/eqVpusNgdz0tQuYqNFv3dEMxYyYv4kDpGGii5u
	 jlLFY9JuVldR1ndwEl2I00VKI4PD3+oTdlKbiM/irNF48DpBxPFIKvxQyyiXq6/b4xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kxMiVwrH;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D9E606A33B
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 15:45:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89D9E606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kxMiVwrH
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so15097045e9.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 07:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794239109; x=1794843909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2Uvgg/TH8ek7dpiyCaiigwe788vwtcSZF4TPOxN5MA=;
        b=kxMiVwrHgthmZG5BwH+M8Z/aD7QF/ofqnxPCU+Eu92AUH+c1cK1DpdSeAK9TAJjwY7
         7sMjuNWTQasTENCjxM9bbsMcrlKik0NA8N58kzbdqCDhjyYsCLaXuP1yUnfNSwLsKlNd
         SJRfy3RU0210TAvojGoZsNPp2KPGZo2KkKeUW+v/fGCcHXnsYXukEjDSOmVpTMf7vXgl
         eEBAXoLRpUc0/SCthO7tczp3MpGejFcn7R1po7DtzPz+OftVLFE74NloYZvexw8zkUrs
         BKwkaQJtXXb7QQWmnIEKRf+4OjzMuXTStte2OfYkD0sfJyPqwg8kR1+wDRV1UOu0xm74
         NTLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239109; x=1794843909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L2Uvgg/TH8ek7dpiyCaiigwe788vwtcSZF4TPOxN5MA=;
        b=JancKYVjZXJ2JEydu9BgI/WQXLDlwMGPQ9tQnkuYVwr2KgCJN+mgsbsazp7UM29Oe9
         qQ9Vz+T0REWXgWotnMNxxyJSAU6dHCUwLKT6tqPkOnScbTSYHOkwVy4XYX9EiNeSyyNM
         r5YHVVLGWKOCaK7afeaRFQRRJpH3oXkdqEilcYICx868U2aaJvAAyAKImZndMEpWtx0P
         4+75mqVsZ6HcIhgoiFvPCm1s21mblE7iIDAuC4AqWzQHVeErdxR+C0ROD7cZcliSLh1x
         mwYL36niJ0NcbwEPMEUZik14h6j3aknZzN858U/BhEpi2VIrNpRsEz7VIIJ41ftKNQWi
         qFfQ==
X-Forwarded-Encrypted: i=1; AL+hErHTFSJ1ePKbnbgGDx87p60SmAeAkQ9PM32SJBwiKrqGOLW/nLWVzMCi7MHX50cTXmMWomHX7LmR5gdk@vger.kernel.org
X-Gm-Message-State: APuU4Z9QSEji2j5FxxJhe9DhWT6RrMPfiwV0DtsEZVOU4jqoFmF5hO/u
	i0sDTBGSokwcx+rmZiRgFbm5RX7AtCW1ZSBllqYiTR5F6+00jG1mK3WY
X-Gm-Gg: AYBFou3cNoK6Ecj2OTSDwYqLYMMorTJuknc/lCeLn8nft7vifIwD8VTKONU4ekGkN/j
	Ds7uhEKMMcMpsxjfb/SLNsegKxq7wqEJdFMyKS9VVCaF+mfPIc8f7o3LGvy7lzUWphdI9v+oMy7
	jcA3j5/3fCo/gO92LIjoqkh0XvXxewFCVpjuahUsJJX2/JVxq22FsnmHs59sjqW7z4vohyLPNLD
	/ZeonNAQPRyojTE5x4Vpcgeb12pqukBFt5pDY8Jc/HKwSg/3kW8hJf3zWW43hMUYchVUfGpoyST
	exd3PgAnkbXGY/3YHtXDHp+PDmztV4+cBuDXCGh22/qESvSuAiuJF54k+bPegTVvv51YicLy1Dw
	LZNQvU7BG9JQ3SpKAYFdaVi+SQqumuEc++W47YK/PZzgfBrtZhO18xITDE0RKx4xJcX6ohYAdwF
	dYSyZetplxs51IjBmuFgYzEDkUb09oEiVOc9XuIITsUC3e5Um8RQcHcbz246jvrKqYDlccRdJ8S
	2BTA+CgXewdqN0JI6LZfoxmucc27W5wQYSnzZQ4OtdONef58OzWiai9+oJHK30imDwzS6DOKcWh
	g8GHjrGVhuVGLHi7cUzTMJSKUb6jTuDfCg==
X-Received: by 2002:a05:600c:1d08:b0:4a9:2a92:231f with SMTP id 5b1f17b1804b1-4b960d9b26amr81779735e9.7.1794239108805;
        Mon, 09 Nov 2026 07:45:08 -0800 (PST)
Received: from hp-z640.fritz.box ([51.37.204.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad4d1sm257163645e9.5.2026.11.09.07.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:45:08 -0800 (PST)
From: Owen O'Hehir <oo.hehir@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	"ziv.xu" <ziv.xu@starfivetech.com>,
	Conor Dooley <conor@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	E Shattow <e@freeshell.de>
Subject: [PATCH v3 3/4] MAINTAINERS: Add entry for the StarFive JH7110 RTC driver
Date: Mon,  9 Nov 2026 15:45:00 +0000
Message-ID: <20261109154501.63762-4-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109154501.63762-1-oo.hehir@gmail.com>
References: <20261109154501.63762-1-oo.hehir@gmail.com>
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

Add myself as maintainer of the StarFive JH7110 RTC driver and its
binding.

Signed-off-by: Owen O'Hehir <oo.hehir@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index aa647f5d3..2ee86a46c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26877,6 +26877,13 @@ S:	Supported
 F:	Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac.yaml
 F:	sound/soc/starfive/jh7110_pwmdac.c
 
+STARFIVE JH7110 RTC DRIVER
+M:	Owen O'Hehir <oo.hehir@gmail.com>
+L:	linux-rtc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml
+F:	drivers/rtc/rtc-jh7110.c
+
 STARFIVE JH7110 SYSCON
 M:	William Qiu <william.qiu@starfivetech.com>
 M:	Xingyu Wu <xingyu.wu@starfivetech.com>
-- 
2.43.0

