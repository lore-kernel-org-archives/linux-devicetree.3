Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795861;
	b=x+/VAlP+yRlnnqnP19Az+q7uFlFmcXBwu5k5TLyt5eWlvJZE8KkXA78aZuX3rlL07Mxm
	 6Nx8IQxe+u/yfoxeWOYfvIALJoEK63Jgt5n4mxOVl6ejWO4WqmwFdAmdKRrilHM629+Vs
	 jw/08McJbi5TkUsujRje7MvaPcXHZmxYVz0TSE6nv9iiaZ6pqM+AC8ZFkhrcw60xjL8Vy
	 duFdYTfcr5fwVn2Q9YDs1WO7x08dKJ8dXe1JW+NjEw+a/hpiv8CJ4j0ZPXj5CO9hfrEPH
	 BHLy3ki8UQ+qiDGo4sa692BuowA0do42M06CJnmawnxX/cx08H2LeL3qw+j+vP14MaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795861;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IlABjifCqSqzPKHch40gU1r/EoFeoTHIM67lGBUV2nM=;
	b=mhAsW8W5IT7NdQyTtTY0FYa3RbS7lFeX3Gp5GV2Tdi6Da84YAYLi6hAiARdUA3ip1OlD
	 7wYhrUmhqcy3Ol71xMu+ZFDTXQfVOlHSneVXX1SDlYp87vwuL/Ed4x+4YQRoof+99/jvI
	 UmI+2cspVXr3JGCD8XTk+gJ/njX/vdavdNfRytEo7uBlmEa3//AuQFXwUbe4eH8J7Mk7g
	 FCc1mdPNqJaZSMz1WSWraqbDXk5de3zXWc65YhJY5nnvXFNMNbvB7yJtpoY+ur6/gMpLQ
	 Fw948VxTA7yNHEVtbMpN6msA+7gGcPuevObwK2qc/nmm1KF9IMGYrD2tLklVBkb25Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TvySfWxe;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E53606A31B
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 12:37:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09E53606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TvySfWxe
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490d59c3edaso14499f8f.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 04:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793795859; x=1794400659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IlABjifCqSqzPKHch40gU1r/EoFeoTHIM67lGBUV2nM=;
        b=TvySfWxerwz+dWhRetETBFqzqumF0jAyeAC+LydLBBp/gqeqZaMXoxCiBfvTXTn13z
         yoVlaafMNT/vyGT/QEjCJ89zH9nNG5rVYWGFZv1rGI+0v4QS7+uOF0QOd/I4WZmGTsiy
         tdeSTsYkkak67evWJjmBGRN9YG8CAEni6vSle5comB2ZizaSoU9LTuXC8LDvPoyWgfTV
         E9hoEsfD9kSISankKZuI8mqAV7HfDg4Ikhl1PEiHLnxPrbZmK4yUPrNCILmvH2CxQ7WI
         gwJz2RAEuVniNy8j4RSgseu3O34CIXDA4PERqFXZe6gLmjWSa40Jtm51qu47wpE99/nh
         wLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795859; x=1794400659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IlABjifCqSqzPKHch40gU1r/EoFeoTHIM67lGBUV2nM=;
        b=xTucPBVND6dOzvdGFklRl3T3iKH03mOPr9/QOcRne4DhhBpqDF8ZZ+l2E71kR5p3TV
         +01jnGvU2nFm5DgZtI0DVibznN2dY/lQaJlbD1R+hqfblyyNNikQ/9J98NKPI8ZTQ/MF
         q70yQGzfIZ5tpqo3FYVaqIly4/GntbTdxXUZkECdBZ7YD913JDG+pxRdGC5apT97VVOX
         hmKDTg+JzBVQl/x/AcA0l80cxeCIQ3XiMQz1eV7hsr+xDuR4W0HtSNSXX24AbRHHmAGF
         gMRQtvtr3IKwXhQsyR5A7MAejXcF6kxQljR2D0hh8ORo0VxEjGRHnie/Xc2Qnt+o4HNE
         6GZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvTPqJqDCNEWran15FV6UZAJTqKufZiTjtq8xAOdXtGRioa6/kPb3QbWOOKBQQzY4R8x0rWstBU7rl@vger.kernel.org
X-Gm-Message-State: APuU4Z8agof1FFItjFUARSrXahND8uwj3Q4Blk3pIYLyIQynnbBDx8+d
	mRHs4uc6Ebh9Hdc1chgv9gVr81p6KwMrNDm5Itx9z0XFa9fuLeCj2MU2
X-Gm-Gg: AYBFou11uNYIHKl0ltRlBmhrC/v1oY6EFpsNSp3Yz3Hok9VuKy+FYSgdLtSVXMCYG4Y
	x5JAcG4os6obNQCAlPtwhC2sHaqc3/RYbT/yZjoJXke1FlkBHe/VVoXeRBdPCmnhs82hUcqPjsy
	dFmf4PfWYCON1CUImWjLrtLR4UnLBRI+35GSTbpeoP82dX6RJpR0gSUmu/R1iLzmho8o/YUfY+g
	Hgr5lHWRyuvahZE8zb6qV1UmNNSGLwa5tNiNz2rqQn+HyQbGhfzPfVS1qUnpLgeqr3tLMroO5ad
	mRBJg2OGSsD4VFzRQoty/vMQmDksmg+PEyIdMPUOwMzj9W7dA0PpLOx1PQr53xGHdh7ZdKGxq1Z
	DRVbMn4qvlo7Hgl003gJbakxO9x2AHX0Rr9RnQZeWpMb4l1mJwy+6ZOnrc8Iy6Vuh18XN5OIl+Y
	jIs6u14RaCpxlXnpk2JxMBwqu1Iw4d51hiFnMkexLNTAtukQ9akyNq59MuehobcsSrGQr7CBtHf
	vBFYuvCVzrvAJwMLzTV5QhPMSE8VgPvpF3mwrJ9O1SiSAChFUQwPIhfLkkCSwmAEq0Sj+wsUOQS
	tej8fWSNOetXuhn3ICvGYspoldEYU5D3D9hYNLlD2+zWFkG9uA==
X-Received: by 2002:a05:6000:1843:b0:48f:c595:d51 with SMTP id ffacd0b85a97d-48fc5950db8mr5312034f8f.14.1793795859436;
        Wed, 04 Nov 2026 04:37:39 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed553441sm3386155f8f.43.2026.11.04.04.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:37:35 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 4/4] mfd: aat2870: Add support for VIN and IN-LDO power supplies
Date: Wed,  4 Nov 2026 14:37:14 +0200
Message-ID: <20261104123714.234634-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104123714.234634-1-clamor95@gmail.com>
References: <20261104123714.234634-1-clamor95@gmail.com>
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

The AAT2870 supports a dedicated main power supply input alongside parent
power supply for its internal regulators.

Add support for retrieving and managing these supply regulators
(vin-supply and in-ldo-supply) using the regulator framework to ensure
proper power supply dependencies and power-up sequencing.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/aat2870-core.c            | 5 +++++
 drivers/regulator/aat2870-regulator.c | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/mfd/aat2870-core.c b/drivers/mfd/aat2870-core.c
index 6b1040c65373f..657ccbb9a9dc5 100644
--- a/drivers/mfd/aat2870-core.c
+++ b/drivers/mfd/aat2870-core.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/mfd/aat2870.h>
 #include <linux/of_platform.h>
+#include <linux/regulator/consumer.h>
 #include <linux/regulator/machine.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
@@ -308,6 +309,10 @@ static int aat2870_i2c_probe(struct i2c_client *client)
 
 	aat2870->reg_cache = aat2870_regs;
 
+	ret = devm_regulator_get_enable(&client->dev, "vin");
+	if (ret)
+		return dev_err_probe(&client->dev, ret, "Failed to enable regulator\n");
+
 	aat2870->en_pin = devm_gpiod_get_optional(&client->dev, "enable",
 						  GPIOD_OUT_HIGH);
 	if (IS_ERR(aat2870->en_pin))
diff --git a/drivers/regulator/aat2870-regulator.c b/drivers/regulator/aat2870-regulator.c
index 73b6d06858cff..896f39e345379 100644
--- a/drivers/regulator/aat2870-regulator.c
+++ b/drivers/regulator/aat2870-regulator.c
@@ -105,6 +105,7 @@ static const unsigned int aat2870_ldo_voltages[] = {
 #define AAT2870_LDO(ids, match, vsel, vmask) {		\
 	.name = #ids,					\
 	.of_match = (match),				\
+	.supply_name = "in-ldo",			\
 	.id = AAT2870_ID_##ids,				\
 	.n_voltages = ARRAY_SIZE(aat2870_ldo_voltages),	\
 	.volt_table = aat2870_ldo_voltages,		\
-- 
2.53.0

