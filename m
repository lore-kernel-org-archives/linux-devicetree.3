Received: from mail-ed2-f43.google.com (mail-ed2-f43.google.com [74.125.228.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612B139FCD7
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 20:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790194996; cv=none; b=c2rEu8pT830AedXCzNjEm+iL0CWa7Z4uQZZpssYgl/6z+I4earWUEqGG/4coLokfJGBKwIQ27LaVZTXVxuc7MXQ3hOFy5NIat/B0yh/SdEXAb7U5rdx4/a0XGr373r7LhbA8pmPROR0veP9BCF3UM51natv9gIFmP+iTd/En6RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790194996; c=relaxed/simple;
	bh=dplioYOzQkTgB7OtXIdIJ8d7kiQ1EMlzvR3wJI4xDb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bv0kl6nuHaWm2KWiSr4mefVndFAvgQWlsUdlIFOQihJHSpviFa/v4gSIFbTlReWVL7lsbuKe+YFw/pZOgr9hzeUJ1gzA5ZOWfFM08ppAtaayLHmHOYzKPvkHZbQuogUjBwcdRsB1+3JhWkOowxMPkvVTeGm0BS4cUHos05TrPdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aVx3nFqc; arc=none smtp.client-ip=74.125.228.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aVx3nFqc"
Received: by mail-ed2-f43.google.com with SMTP id 4fb4d7f45d1cf-6a9ba73bee8so1161354a12.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790194990; x=1790799790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JVRS8IDqRClJGzLh+AyZKtdvQwPlkBwHKoeRoTOl5Sw=;
        b=aVx3nFqc5RSXsBi/t/8ozLsswb7DlaVULRelW9mYvE+4Jbx1F+WnagcCQwk7PyWotJ
         H94aBTvMh9yZ6PwmsTq/mhwHwquGquOYGGZGimjSGJInruRlWbc9X3zszpqh2BWOxr7n
         itoSNkNwkUBvR2hbnjae5nEr3pmWvHWUGqNApC3n6Ad4yYT6bEY5hnCnoST8/MSr83/M
         PHj3t9ql7qe+gAfFHAewLqvR73ZQvVzO/YMwD9UhuJc66I0/zWOAFFohxDp2n1/lDNG9
         oZA+zgzGOsGDORpoNYL6XZuVup2ipPvDTuPR7eRhqUsVX/6qIA+1kn1ynNMAfdG37feM
         WU5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194990; x=1790799790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JVRS8IDqRClJGzLh+AyZKtdvQwPlkBwHKoeRoTOl5Sw=;
        b=K1yQpRifJejDwxvf4e42kAEMFfVff7ME//L947eYpHSWWAH3+XZeqNZ7cooVZOK+qv
         4U17GipUutIVIAfw2BbVkdIYMEbRVbE++5lJQzAIjaAMbEqNJs71CtHcwngBfVPiecQs
         TyI1Xn1EVIJ24vqFrXvIWWRTjU7m8OabJmACIqwQqZA3yiB1ftOe7JS1BrB6XhVQFdeD
         Dw7OKtYl4T91p+eiJNr+By8fbIW5JkIbl6a7KqQ7DmUZNqpvXODj5FvPMn3Qaa7i2ASc
         9vZwX2FWYc5tJnOCX16WQzw8GcEiarT19tV0CNCCHmpFu+sr1zHyCew9iqXzpHaS04tB
         esmg==
X-Forwarded-Encrypted: i=1; AKwUvBywKbhPoKBBoqJ6nzm69Di3N0TS/vdoZSn63B+hzmCmkgJe0qmexviH/VgJ2Xu0yGm2o3f5A2rYz/ho@vger.kernel.org
X-Gm-Message-State: AFuF++lz6Z+cmWbrSxF4c0j43v/mOwuaf3+1e4WlBu3bfsuIAqu+JGNk
	ySObQs9pJQwpIFgufiRXP8V7TWi/bMi8j2k+2MBIkeJzrFnY0XA7lE60
X-Gm-Gg: AYBFou0EDEo2kRX9IH0Sx6waHugj1r/HLgvrH1DY7aj9MQpzVn/odkdh84a0qqmGyA9
	4KdFmbQ5FxXySz2r+MtUF6hiRR3aKp3zqG7d+LE/G/uau3y9EyYVrvFBL5pbsGy8gyUIAVcMGQZ
	FrupNGNLQUC5QK6winh6UrFZDhchlaHxeBrvFTYNBuiM1H3iDH+LbcO7PQIBLE31mZHltPDrtri
	9PJfv3kfaXrO3ek6k9Cdx1GgwGvf1J+RuoaB71cnLAnVneG9F3lEoJ67PAXhSTR0kEQzv+SD/Q7
	4PFrENs3gyHM7Q0Lw3dHv/amWFw+9qXj0/WB7K6H+wJcRpWW8KHSxxj7ohcT0kAOnZ+2QgMxaSa
	yYHc6dPlAGN0dDCByHxpCPEZGI8Bc8oBVPmug4vxMtRrkzluq3v96dNeA22waA3+triD/4S1Vhz
	ySq00g0nGwDOiGBG3KLNicwn9KUQy6TwBo5gp+B1tIcr9LQ5mrbYt1LAlksn8f+DiVTpVILABjd
	Pz/vHmCLpDbcEUWEXoPu7A3kSgoqmOq
X-Received: by 2002:a17:907:6c17:b0:c24:6382:2648 with SMTP id a640c23a62f3a-c2ac21f98famr25358866b.5.1790194989894;
        Wed, 23 Sep 2026 13:23:09 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c8a44sm177243566b.20.2026.09.23.13.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:23:09 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Ulf Hansson <ulfh@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v1 08/11] dt-bindings: mmc: sun4i-a10-mmc: add Allwinner B288
Date: Wed, 23 Sep 2026 21:16:58 +0100
Message-ID: <20260923201701.43391-8-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923201701.43391-1-pmazzini@gmail.com>
References: <20260923201701.43391-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the MMC and eMMC compatibles.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
index 9e9610bb1eda..c2ec7151dccf 100644
--- a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
+++ b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
@@ -32,10 +32,12 @@ properties:
       - items:
           - enum:
               - allwinner,sun8i-a83t-mmc
+              - allwinner,sun8i-b288-mmc
               - allwinner,suniv-f1c100s-mmc
           - const: allwinner,sun7i-a20-mmc
       - items:
           - enum:
+              - allwinner,sun8i-b288-emmc
               - allwinner,sun8i-r40-emmc
               - allwinner,sun50i-h5-emmc
               - allwinner,sun50i-h6-emmc
-- 
2.53.0

