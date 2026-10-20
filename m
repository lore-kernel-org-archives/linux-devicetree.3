Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792533939;
	b=kPQXwQX+VF+XzjpxWk64AMo+gD6PbFxoO8anqU+wBqNz0RtW4Hdejj1psdCsvTU3///U
	 PSXePL94dArPqvDzHqV5M8SRzqs5CRfNhwuIFbO8fIw/07mr0siFyzJTOa2brM0nOVlNG
	 CIpJlUAnPQh+IoArzDyQTvj1o3hJsDYyAiOw/37QMsI0FZAjtb2Rg8drCjCWPqdVpiXMY
	 5JeWOZPb6QKAYKVrufhswgtoc2Z6kkOQxJ2HQl3oKyL1a9nUMoY3gfHttCdmNSOqmfQgq
	 jN2KSrJEZlZ4MwVhsFjh84jx+OpSxcRKaIq7Mw5JbzcUOLBiqI8U4pipy5u0rJYENfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792533939;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=yC+gZPV4aotNwixKHOtH5yvTfu3V/PuIgqyMW818p0A=;
	b=N+aovtDrTQdb8XxFHzmMnjmRX5H553YoV4ZwnT1Cljp8/0jWsN8/7QqjDBoX4o+qyuIu
	 n2OKRUzq3ovEfkNYeoNYdQNiYT9AIXcGCdvhSBdEmEsFp7J7EuRfoUjO5WVdlVOKRbzo2
	 ptxRXeGymhzPEmbji8+r5ElrBYhUEqPmXCMYUbzR+DYyolJfIlYuUSax1J86nNZ5bN7C5
	 YvtV4YIixDbEpqcA+E/cUMHtm6hWtoZqYlBz24LFH7I8+vXEhuywLIscgw7cUsgebsgWE
	 17BPTlWVw4Q4Y+QUj576tvAo/2KWlI2a+eVttidPuzQYExRVF1fDkQwvcaUzvt9mSlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b="AsV8CSY/";
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55ED7606A32E
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 22:05:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55ED7606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=AsV8CSY/
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso201058eec.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 15:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792533937; x=1793138737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yC+gZPV4aotNwixKHOtH5yvTfu3V/PuIgqyMW818p0A=;
        b=AsV8CSY/FdkRK3D9/1KNe7BgVcelwRhs1z0mHznTdxwQMr2iFbwwUB363Vf/p9W9KX
         8fS00qkgynfdEfGy6SOYp8MxhNrU7cn3ddfa74UpAzElWvKuf139ystaiXV3nCUylyA3
         8qqDxRQh0zGIhkVCWgO7Dddtrjjns1+8/StDLU3JgXwU2YSK3uCqkLdyYylhtJ6eUZga
         Dp/cgvsKpzWR0AoHd9+GAAQon9o1sSSedj8aGuCU24TQyOEB0JymXZ8kS+/eBQTYNNHZ
         AEd/ddl0aYNJzOcDn2Uf356RCVarHLYaN/HSVH5q6UkejoqdNucHypbK05mH9+E/lsbl
         czsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792533937; x=1793138737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yC+gZPV4aotNwixKHOtH5yvTfu3V/PuIgqyMW818p0A=;
        b=BU6iuFNLKx+7QshrzahzIdSnw9haZ2w9Z5026mP/MF3VgvaoKxBw6clKkx3cd4g6Ba
         IInrQjMCw/gGxbk1XN8FXlDdHXHJSYkOiB8vvaZkXvaSBB2AOia+Q50Q6cGLL5/H9sHC
         wDa0Anzugbvcd+8dv5NluuqoZPVqZ2vdZkKX4iVevXYEntktwWUOlwkiRY61KGQGBC+s
         WLvrjNfTIomonKdO+dJQNwHPUbDZzOFN5qXEkggfNd8I+jcu2Ch7FxELcra64FQPecTv
         Icn/RMKNMiYjmsAJCq2bSxMApQZujGfs5LIuEEpIDNRir3gSrNObtxaAoHHqkdtYWPDh
         dDTg==
X-Forwarded-Encrypted: i=1; AKwUvBz3QeuoI0XawREszyusMJV4aI6S5c7W23TYB9peQpPcRM6TFrk17NufqfGTBhQlKRvCf+rQwcvb6ZmK@vger.kernel.org
X-Gm-Message-State: AFq9FYLruCo3IVNnQwqEUAb1zOIwdwKGzqCH9YP5B6Dpi8ZTw99S1K+C
	VfxsSA4Q4q7IHKE0VcDa595vxYAYNDK8WYVebBRwi207goXcs0UCl7V7Nxmrm1RPXUjqUxogaGe
	+pclcWdI=
X-Gm-Gg: AYBFou1SbLqxyjCd7g/lvpCWYSCCbNNezHz3n6hJBI9OzqMUd5hkhIip3ZhHaKFVxtJ
	IL1qI5GjmS+Yw8TZ3yXuxDpYgh0lmnfKGoCjsvpnp4U0QwiqUgq01Uo2NqJxrKczqxoXxS435Ex
	orxDxpe5lt+WWE5eGsLWPzizyVL749rnWCDTusNq3clJKQ3+3RnlOzmB6EtdxXuHj3ClO8kRfob
	2hY8wsq8cYlAL/niI4VMihWjOTIiOm9u11xWfQgg//+vctIaBVYU5qa7T9qGDc2CJjEV7Dbux1T
	GTPxzu8lVYJFJ47Zz7UqS545EO5P5jif+Ze3ECjl6adIYwSM8gXV/7reH1sFb77hFnNclubLGWB
	HaECb0WeHHaDY5kTolchnmCfWeG+JOdFBZAV7O3ctuXEvzPVbWQcpb9axDuPuWrxGLhCkiDVox/
	y2qLQ6QKPhu4spqNmijoxBLPgWbJGo7GVBebbgEBZEjWMBX0isGlkYuuUnROqwb8WfSK8NDb8AF
	7LcvLaQj5bO
X-Received: by 2002:a05:7300:f3c7:b0:366:3257:771c with SMTP id 5a478bee46e88-3674eb33844mr720723eec.16.1792533937462;
        Tue, 20 Oct 2026 15:05:37 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198f1d8sm1917021eec.24.2026.10.20.15.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:05:37 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 20 Oct 2026 15:05:30 -0700
Subject: [PATCH v3 2/4] dt-bindings: trivial-devices: Add TDK FS1412 and
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
Message-Id: <20261020-hwmon-pmbus-fs1412-v3-2-51df629e13d7@nexthop.ai>
References: <20261020-hwmon-pmbus-fs1412-v3-0-51df629e13d7@nexthop.ai>
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v3-0-51df629e13d7@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Lars Petter Mostad <lars.petter.mostad@appear.net>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792533934; l=1094;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=TihSnAyU+oM6Z6xKPg8XulncCvOA3Lsm7O7YZANDhAs=;
 b=rZJt5k4qDB1MMTkhJjfIYX2LMM4Ew4G5PDKXZLCBM8NiAQFJTDWyj8o51aUe5b5PQWBLGGThR
 +D+asvvMwBdCTWgGnz439D/A/lN3CURvvsvaFuTkffY1vlFLkAIh0Yu
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

