Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482223;
	b=yavXl7XIBXhfe57DdW4fexO/NvkOgxaBFGWD0LqdTcJtdYrnFeqoRWRUMISD4kiAwdmx
	 u5LADas8CRWtX7PWONdvwPwcqqs6jHyNLMtmmFA5X8Mlm99fILxM9rnxBoDfSDVAWN8cj
	 yV9sgtRs3LFQXjEhw6HpxMVZNJOWY5oQqZv6WnpA2RpNVVofHbIpz4vUD0zZHlHy6l7UJ
	 V+xp5R796HI1HbY1ASpxAQX+UtaO3CgL5DYVJzO69AuwBeGxyxo9mUzYLxtDzmXrT8BPE
	 hB3X1WPj57k/VLAbYV1TTg1Hv8DIEMjNW0EHu8CvLHrQNT/UTmcnFrScEp/7I20Cy+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=p4RNd2i8xpZ0CJfOEJKH1RTYHzI0AXnVPwuk8UaUecw=;
	b=j6LkMMq1OrWX4dl2/D59GI5tnxV5acivTogP1/LHLVazdMqDyPNsYucHZ/vpF4MtoMxy
	 V9mL4uNnKk5CxrYR2VoGDbmjViUcBUDO5O5W+KWRcHrWCfgdyuT0Fd3KdYiyTpQFJAdM/
	 Go9xzylAh7ZOOcgr912fLltRZ1z2XoEp9QHEK5y3Uyw3lyPOkufdn94U/O9bOclgZjlud
	 cvyBtEH5fh007+qmmhVHY5ZBOrkTQDz8l1X4x9BR3ypHlE5unnh3EaCi4tvnNwQCOffS1
	 nZrx1NQ1SeUATUiWB2i6IvH31iT86Z0EYsPgMDpx6vZmraPD6aVER/HTY9Z3oubj/jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=jcz2VWjk;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5D2606A32C
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D5D2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=jcz2VWjk
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35c76e9614aso5524310eec.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 00:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792482222; x=1793087022; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p4RNd2i8xpZ0CJfOEJKH1RTYHzI0AXnVPwuk8UaUecw=;
        b=jcz2VWjkuRfgXbBhx/KKl5w3vkhEDoiY+Wlol1+XvK0xP+awL4v9Q10OcBvf4rFcl4
         mO/gUbwhDOwJgHa3+CTRFamicC8LDSXg83G8H2GKq93UyarAqRuppkGft3Muf8i/cpEz
         8cIbYEJLL6oweIwHxr+I1CSZS62dOD8k8EJNS1Rg6GMdNsxGAC4/4U1/46f6YsuHoBFZ
         IUy7jtA/n60fl3/GARvQ8sikZqHc5EvHkGrcUHxWUP0ZRCjEgWxnqBUw8TXkzNuGd5JP
         u/YzV0jowInNgDG43z2AzzZ1Jm0upj4IGqA8LugeJuUe+edGwWHoVzfB57k1XHwcIGzm
         YlzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792482222; x=1793087022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p4RNd2i8xpZ0CJfOEJKH1RTYHzI0AXnVPwuk8UaUecw=;
        b=GyJ0rNL2UBZkp7QVeGFjKiOV6fpiMGY9z47wzr5E1X9fDV7B7QGCq1SpWJIKa2TUAL
         NGVWP4jBlg433EjuWdx7WqJX6ijKgCYaqdV95WJRMC9rHulO66lseEtvz9ehPU4Yw0x8
         gf83bzn4v+ZmUBEHf7X6f/kiiFwmU83MEaYG0oBZDThZIjIN3T4o1nDUiENAe3PX6pWO
         xOId2HeTp6yojaog6aK2TFrumyI3w8r+PeP4EBj7dRp7XmkwxWai1QeastjppQTq4quC
         tvUkJZvXYqbdgbSNzLELkVaCYG31yV8YR9Nl1Okk+dM7KE28GUDdWibTEjYrHJyJLW77
         7dqA==
X-Forwarded-Encrypted: i=1; AKwUvBx0GW8sYxZazHR9d6QZPR3QoK7JIfMZ+qQHZLG9fK1oLp7e2mbxqt2mYKVNqIxfOSIaB7anGFuT/6N/@vger.kernel.org
X-Gm-Message-State: AFq9FYK/j7LD4omTyZqG5Kg6Zy8mOs5WKMVFe9PYfLNy+Q/EG0D+LKJL
	OSiEu7arrXO7A1cEaaM75uX8eaNwgsQkpkOpSfkJ5h13brrsiLz+jf+Pd1+5fEviv55z1gVFZIR
	y1bTkYhM=
X-Gm-Gg: AYBFou3M9FzWlFDuhVEYwDctuLNtl+B59piHcUTT0FzgC5FkGnUG4zYF7V39s02veR8
	Gp0InCwhrPe2sf5SYTS9Px8E+3FhZoe1z7c9Lv3qwWEEK1ZuMSTuAx0ldp7v4DnxRr+FTzBrVlh
	AXAf1YifEiqhEhat1AcNrSsTDhszDT+TsMOfyIRhTfWV+c31iPsi3ec4F93XbOI+ZWxRKMQvN2R
	IQD79RUPdgfdS56/tsag3/efuaw/yxD3xtzZgu+TjNIKdWRhKINl4Ygb+Eo75jPq7IGm/rkzObR
	TUl8fQfG55kR12uPQrHmTpDlnczZtGgFoE+H/aXp9sRKF/2Jt4NDxbdKV/vnbvkzOpybaczta5T
	eY4XaaRGnfnDGW1V0Fxz5Cnc+hCHDn7lySE00EMegPIfjQvOvB6/1yvPntMbvBJmatTSC8Ubvxn
	Elyot5I+V2cXPBPYU+7v9GQr0YoAtYebTt3Wtei476FUBPDvZWMR5N7Z/R7HFWySV+P2VQHuQfM
	A==
X-Received: by 2002:a05:7300:7aa4:b0:35e:43fa:eea3 with SMTP id 5a478bee46e88-361a137072dmr14671485eec.8.1792482222408;
        Tue, 20 Oct 2026 00:43:42 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36083283478sm37010238eec.29.2026.10.20.00.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:43:41 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 20 Oct 2026 00:43:37 -0700
Subject: [PATCH v2 1/4] dt-bindings: vendor-prefixes: Add TDK Corporation
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-hwmon-pmbus-fs1412-v2-1-3396c3a08251@nexthop.ai>
References: <20261020-hwmon-pmbus-fs1412-v2-0-3396c3a08251@nexthop.ai>
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v2-0-3396c3a08251@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Lars Petter Mostad <lars.petter.mostad@appear.net>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792482219; l=969;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=lNuNT+gSUpQSUsDkNUaVAjvOE/3h1o85CLNGkLI/j7o=;
 b=Gc8fMRC2VdUO2eazAV2eIUKk/69CqdZf3MnaUZXQVl+m50iPHpTIDDuZqOY9uzqOQHCX4/rxi
 Yd1BAvbA5N2ApiBCaavG6v3/71xIelOS9dkW1XSGs9FjolgOS1/HLic
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

Add the vendor prefix for TDK Corporation, the maker of the FS1412
point-of-load regulator.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..a7c484d1113b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1680,6 +1680,8 @@ patternProperties:
     description: Shenzhen City Tang Cheng Technology Co., Ltd.
   "^tcu,.*":
     description: TC Unterhaltungselektronik AG
+  "^tdk,.*":
+    description: TDK Corporation
   "^tdo,.*":
     description: Shangai Top Display Optoelectronics Co., Ltd
   "^team-source-display,.*":

-- 
2.54.0

