Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482227;
	b=BlnSkJVBM/nbc8F4FBWINjCJ8J8rEmYgpNf0ZClfkbphJHK4+JNMz7I1vuDQ0ARZtDur
	 WDgY+EkMlHU8mOp6WAiEoFoCFGcG5m5rY3ARYEsTthQ0kCcH6+9eE94EQEp5c39x0iFVA
	 Z28OOaKNbaZiuauYdg2MjlUUFTjuUa6EGTNqJ8BkZ59xLZmib3IxeyMK+wkoXux0pQgrR
	 7mqWDoeN5elKDRhLdTvcWNOkq1H+flPq4D7NxSL6ftrV4pPkPJph39s+8t0cdyn4TXOMs
	 G2cbrnljOMHmRQsZN8mKSG3AX7wkKmPl0qi7Fy1tAGc9mNsBVOFhrS65JAtfq8JWKbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=yC+gZPV4aotNwixKHOtH5yvTfu3V/PuIgqyMW818p0A=;
	b=B8hO23FVDgGB87mYwFODzbMXR55TIHnC/IFQnaon1va4FkQ5Fz5fgWwNGTaYSCW9L535
	 /gvrJI3qGFnT7Zbsmli/u7pNPVvCBEd4kVzfBX9XRKWDcF55VYafUjhhMsj0VTQYCDMTe
	 T/IWdHlMBaH9nVXae8yBiMOHImSu8GtMX2IoYcdT/j3dM8VF60BAq1oUbtFNl9fs9EJcE
	 OL0TAxrxxWB8Czwx1RJhU871mOR52fpL5V3VsPGwqSHauQsKPYeFIUWzIiBPiVjL6Io72
	 wr1vFU9P8uDehooL2yqEN8Ghb9JsGwSNcsx/mwOQG9VjOYCHBxpfvQe/isBbJCPa14A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=GDn9T631;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E1B606A31D
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:43:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83E1B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=GDn9T631
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35c76e9614aso5524346eec.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 00:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792482224; x=1793087024; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yC+gZPV4aotNwixKHOtH5yvTfu3V/PuIgqyMW818p0A=;
        b=GDn9T631t40lyH1UVbWyfrqO2wY53BDnmdzrehZQ2IJwW6Log2x1p1Bcxo13teXjZe
         S2wsXRftK/azjVLiiVcWlX+aqXAo/U/7DvDfEBj5nLg1jsOxzLmuVHGiWLAglDgo5Nvn
         dl4CbxxzT5t4SxM4WB514iz4fde1by60lK0x7F4gmG0uYoz0aZHQz7eeWP2AOIDM972z
         J/++zzNo8p6AwQRgg6xkmfbAEgf/nkyand6KmdTmPY9H/ONy5pii/tir0nWGz/B64xiG
         7lCFPR1Kcx3KzO1angnGq2Bu/rD2zCxW9qeQOeLXCJwkP8vwuyXK6MjlBNdsx9i+FUGk
         mS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792482224; x=1793087024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yC+gZPV4aotNwixKHOtH5yvTfu3V/PuIgqyMW818p0A=;
        b=maUH5JSsyuTb35r4UnaAGT80EK68Fi/Ua1v76GIM53ibQmVpp0qyAeYqR6PTYdPwq7
         XcTUVSkH5HnNXIeyrVmH5qZ1IPNV8PQEjO14fppkAXRVwQx7fP8JSr24stTZBTwwSJlC
         Q1oNp4qdF4r+cttyd/TIXKAY1JL8QQlQXYizcq0VqY1pDFanQ/qddcIgs1NQ7YIQ6Ud0
         /r4IH5cjo/C7fGClf2/6uBskU5AsLzDDiS4hQT3tgyscud/MTeStj8Lgwi/CUDFDxo5m
         4zjMVLBCVSSjtNUd4afFEjHkJ656MQM/gwaceGwqihHBVlRgGI1ZuK7ZgEUh/wsD/Kxr
         sxmw==
X-Forwarded-Encrypted: i=1; AKwUvBypwof2U5HeungxKr6YYJ6I0T92Lj0H0tuH5Ej8MweYwJVjiUr0abjjbPJOxFFmHN2Ta0jPZxvLSpHB@vger.kernel.org
X-Gm-Message-State: AFq9FYIHw4DjZnba9CqFEkYtcwicAM4ArCWHftiKsBCkhOrNgISZTd6v
	oGpGwBjHbcPKQ0byDXErQKeieHldS1bSstAUs3PRp0FxxSbTDHrtA+m/RLhgEzb5z2dnZtVu4hn
	YAG0fxi8=
X-Gm-Gg: AYBFou3wqgEYfnw4N44aaLXM1KU41gxJWwLmCFoGkpLDjgvwszyljQizHxEvjaoH6gd
	o8O6QEDu/8aPSScQb+ku+J00mbQ67h3tKQjdKS8t7cuTPsqbqNGIbI3JJotNaEpyZGf3Pzy7ZpR
	xd8jkWib705q12ZNIgw9B3HYZ8j12tT/WfYCNuz37YlNI6l6S+kRGYQJMVVaEGPrRpGTOadt+Ic
	VMqXj7wj1yXY241v4RXDXr65NaqMXU6LN8V2dsRkLitJJf4sYXC47xSfDX5SCRlDhKJfD7HfBe6
	jbmRQxFAuWvnMmL8AA2EILRFY+f5y9UKjeelR4Tug+vYPB0xLoXSBmxxMw0IN+rXRiNycm3vZSR
	ctt05W7pc89fjsv8Rl0AXFZ3CPcqtfy8N+XTDDMCpt7W4417UXj2ksjcIj0GuOQgzjkrQJRuRfu
	MkdKFwGBLKzAJoeH0FKP+hiva1ZYOwFKZ3IJCEAkd3Qp2/KUfnYgGKmKldr+bdDok8K61BmsHaw
	w==
X-Received: by 2002:a05:7301:fd82:b0:35e:7bfd:4613 with SMTP id 5a478bee46e88-361a302ab1dmr13910871eec.40.1792482223591;
        Tue, 20 Oct 2026 00:43:43 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36083283478sm37010238eec.29.2026.10.20.00.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:43:43 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 20 Oct 2026 00:43:38 -0700
Subject: [PATCH v2 2/4] dt-bindings: trivial-devices: Add TDK FS1412 and
 FS1525
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
Message-Id: <20261020-hwmon-pmbus-fs1412-v2-2-3396c3a08251@nexthop.ai>
References: <20261020-hwmon-pmbus-fs1412-v2-0-3396c3a08251@nexthop.ai>
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v2-0-3396c3a08251@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Lars Petter Mostad <lars.petter.mostad@appear.net>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792482219; l=1094;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=TihSnAyU+oM6Z6xKPg8XulncCvOA3Lsm7O7YZANDhAs=;
 b=mp7sRHtCF878AE0rEF4+2BUgFCTEPTTF+jqzbW5O5Fcke5i00ovvP/Y7ZA7M9N0i9MNyG4mPk
 xxLm7V6x2itAYD2v5b+PsbOVOFtGTCznbSP8qYSxGqZRZoJ/NEX7OLK
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

The TDK FS1412 and FS1525 are 12A and 25A uPOL regulators with a PMBus
interface. They need only a reg property, so document them as trivial
devices.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 2de8eb09cb7d..996e1eab52bb 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -469,6 +469,10 @@ properties:
           - synaptics,synaptics_i2c
             # Ambient Light Sensor with SMBUS/Two Wire Serial Interface
           - taos,tsl2550
+            # TDK FS1412 12A uPOL regulator with PMBus
+          - tdk,fs1412
+            # TDK FS1525 25A uPOL regulator with PMBus
+          - tdk,fs1525
             # Digital PWM System Controller PMBus
           - ti,cd9200
             # Digital PWM System Controller PMBus

-- 
2.54.0

