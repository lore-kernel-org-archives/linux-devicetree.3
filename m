Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94573C0634
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 20:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784579167; cv=none; b=IyfAjPia3pPnd5eVsOvd8cuPgLjSoIbLV14f6uAZ/3gkiHxnKOSPY022gtKdsrJs+wh3USMkNjdRbqmgErbiPSFDdI7TpCRjTAOeCatg4N7J43vUd6HxM5NvMnZeznz79x31d8qPKcgVsS7CxodE+zxWF42YnJe93pjdW0KOIaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784579167; c=relaxed/simple;
	bh=44wlK79p2iFBlaDNEJYYoVrsZ4V64y2DhfrkrngDWyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gnz9arl9c2TqJAewr9ltLaRFLvUv+dZWYbM8k5eNf552c56Wr6xL8ZT7dA26s/c4m0dN6CfHJ3Hl4so6gdD3MjK/pLdlB56G0zd0eGT2ObPMfdw9SRG4AzPxyZ06m+KqTHWwuhJwVjiMwlEn7Fx9m+VcD8+QjSWuD2bNqF4gkys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQTteM5e; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQTteM5e"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-491bc1d4e6bso7061950b6e.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 13:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784579164; x=1785183964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KaUmQ9JpbnpkUCaTH5UXy4GKoNzMoHaVL3LWpQbAxts=;
        b=NQTteM5eSBB9+BHj42/k1Sn021geTGnJB7ZVQgq/RHjTzJUWfK/kTZchuHAaL7gXkx
         vGDfJZomFDx2EA0VQ5kUCKqreguKv7tEFO1bBfoLdfg2jb9b9Q1fg2jqQQWcapl/rAq0
         crOd0YrYVtvOh7f+CiQwPIKDTw8ynllaU3K61NbSgBNhUl5czzCeSmkzxjpo7IG84eDT
         2OtDwkrdzx4W7UhwSfeRO4+2eKEWxlumaRdQhKKp/pDrNWtiz4Fh2qpfgZhttZiEaVvm
         C9G6a743dIGyKFHHuRPrVGZoq+kpm+7wVVqqspePnhsvdMVqfGA6eRSjVxRcmSHmG49u
         TpZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784579164; x=1785183964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KaUmQ9JpbnpkUCaTH5UXy4GKoNzMoHaVL3LWpQbAxts=;
        b=K/goos1j5jEV3nuG5cbtLKO2a1rUWe94c5sYpunVLgxWzvx4DCusVD2xJHU4RieOwf
         up1Uf+COwhih8vdREdb7qVazAPoBCMEJkkenU2e6IDinSvtUe/6izrymj4BKfbunuGbZ
         fbAopUPKj0flKNA+5Nb5km6pkjjbvTrGZBBJf2O9bk/W7aBh0qQDJUM05gagCE69GWAK
         82EKAD8NKTLePLZDw4HO9EjEfbWUk7YIC4gO17H5eC+HuWPLqYVBLKIQYwtDtRAIe7gx
         Or8n2B/mhqywFxXGVJJ/y8dAnx/L9B4JtdS0hgFlqfQPSqsAgHyARWTpG1bZ/orMqLgS
         Cssg==
X-Forwarded-Encrypted: i=1; AHgh+Rq+EHdU3gHNqHbYqsXeil+1zGM3Dp2ceAbJ94/3vi9IBWd6WBE24W2/qh2b7l2mrbRUGFD+rg1inwdY@vger.kernel.org
X-Gm-Message-State: AOJu0YzLxYL/2VW34RRVvQdPu06J/Y9mm4c89wojVVlrRWtzXlfKLT7A
	ETZlIsETkYqQm0vDRrNa2CQyZIf5egv653K+D3abNfzwBTSHpS7w1O1x
X-Gm-Gg: AfdE7cmVhpWmriCTU3qGhVDsyztX3F28P0S9UtjoYmPUIRVpPN00sUqa86LIJcJT9VJ
	0Xx4TbNkxt1JU7Jw6TqSq35Gmc93A/Lc9fTpoWNJfxuMPG5My2cSrTIUjBelQrovh7hFrVsVjuA
	gV/rjjEkiiwJQYQmYgyqdGh8t7R+JMFXIX9UAEfkWBzn/uQesj6tNmPeVssAnSJP8yIFDN1yuaR
	f4IIUCVpyXTgHrQdSJwHhRFNdddhXI+lgtH2TCHshohmmHh61MXGuQVNF3RmE30506Eac0PthyN
	RrkWlLW2htNJI2Xim7nbnCiKKNP7c7ARw8IzSDJPrBfSd56DXdId5ETotse4r4pcruye/5BYlRa
	8FHKQSAZfKHMncI1QTjUaomAHYe719LGW1ebqJynXKXAG/fWdOp05ShexwP9eP3xzdxl5C20TZ3
	huiIsGd7Dajrz8yAGic8Gx3Q==
X-Received: by 2002:a05:6808:4fc8:b0:49b:40b1:2d7f with SMTP id 5614622812f47-4a4d0392e6bmr9614571b6e.34.1784579164367;
        Mon, 20 Jul 2026 13:26:04 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0:9988:5abf:3c51:d168])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a4d3e5a0cdsm8029550b6e.18.2026.07.20.13.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 13:26:03 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-iio@vger.kernel.org
Cc: andy@kernel.org,
	nuno.sa@analog.com,
	dlechner@baylibre.com,
	jic23@kernel.org,
	jean-baptiste.maneyrol@tdk.com,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	andriy.shevchenko@intel.com,
	Chris Morgan <macromorgan@hotmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH V18 1/9] dt-bindings: iio: imu: icm42600: Add mount-matrix
Date: Mon, 20 Jul 2026 15:23:33 -0500
Message-ID: <20260720202343.70138-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720202343.70138-1-macroalpha82@gmail.com>
References: <20260720202343.70138-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add mount-matrix attribute to schema. This attribute has been supported
since the first revision of this driver, but was not documented.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/iio/imu/invensense,icm42600.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
index 119e28a833fd..9b2af104f186 100644
--- a/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
+++ b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
@@ -53,6 +53,8 @@ properties:
   drive-open-drain:
     type: boolean
 
+  mount-matrix: true
+
   vdd-supply:
     description: Regulator that provides power to the sensor
 
-- 
2.43.0

