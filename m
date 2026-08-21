Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D2B38CFE4
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 09:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.65.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787303987; cv=none; b=OJHItBHjxEXeN7ZRQCe50D3R63ibX0GrQagI/YNhPENHdLZa80K+l29gJ+3pf7PHLtEt6CfZUS9BY8/PPPhL4xxaGHjQGy8jOqGsXZXbgmWiS6KX9pUPNw8ORti+sOrE0FAxpm+hSwYezmAQHcJYSpRIc0P1yGRub7KRZsRJvx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787303987; c=relaxed/simple;
	bh=fASmTc1+4WUosnBJCv26scoFHh3RrNoMkn9ReuKY3XQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WEHc15gpchQjvJ274c12cXHPB2wws99R/JJO8e8YlGwnSc0CLB9laA+WpWcT5OPffueh6DIt0rA5U5jEwUZMRdlq7mpS9vZsL/ndXaoNTX+/2FWftaUIRv6b1jsr5eW68Yt/rBSC/Z0FVcT+d1GLyvuIVnopIsDE7HcEWcbOtfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alessandro.zini@siemens.com header.b=dZSKNHOd; arc=none smtp.client-ip=185.136.65.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alessandro.zini@siemens.com header.b="dZSKNHOd"
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260821091935d708c86c7d000207d9
        for <devicetree@vger.kernel.org>;
        Fri, 21 Aug 2026 11:19:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alessandro.zini@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=oVcMN0/piicBYC5HyeyMbJvD9tp2n1UeCOioN+Ar/fc=;
 b=dZSKNHOdUzSAulQdoFO1TKdqZ0JBaaMT2wZOywQ3mvqJgYHiDrKwXcbPRXL7RyArL9dh/S
 l2qTeVk/zmd9dDAXy9yC9kxvs6o7ukZlw0m1aIZHSTaA3iafWF4eQRWO0T3wxLaOoIu9tspL
 XNjWPXKOz3tCDJ1zOjFh7xsfSErU2y+DaVbV+mEdjOFkbaRzDnSzDWzJMLzEuhVsN0LiLpIr
 92SJn2w18um1kvOhzJ3xUNBvjDuauqMx8Z/T6kKrxZMSKcmqVSBj3sVnv1wnoq4I2Q2FmQUN
 5KGjFm57SdfddkISonyzofH3jQVR6QArdcIElxYquk3Qz5JJndWeMG2A==;
From: Alessandro Zini <alessandro.zini@siemens.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alessandro Zini <alessandro.zini@siemens.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: trivial-devices: Add Sensirion STS4x series
Date: Fri, 21 Aug 2026 11:19:23 +0200
Message-ID: <20260821091924.18975-2-alessandro.zini@siemens.com>
In-Reply-To: <20260821091924.18975-1-alessandro.zini@siemens.com>
References: <20260821091924.18975-1-alessandro.zini@siemens.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1327013:519-21489:flowmailer

Add "sensirion,sts40" as compatible for the Sensirion STS4x/STS4xA
series of digital temperature sensors.

Link: https://sensirion.com/resource/datasheet/sts4x
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alessandro Zini <alessandro.zini@siemens.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 435c4baab4365..48ded1b746723 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -423,6 +423,8 @@ properties:
           - sensirion,sht21
           - sensirion,sht25
           - sensirion,sht4x
+            # Sensirion temperature sensor with I2C interface
+          - sensirion,sts40
             # Sensortek 3 axis accelerometer
           - sensortek,stk8312
             # Sensortek 3 axis accelerometer
-- 
2.55.0

