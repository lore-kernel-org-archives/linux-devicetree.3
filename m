Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903868;
	b=VOVm8gXHlvkvlKLFidPX0pesvWl7EHtIw5YOiToUAJbruqgT+vX7pCEGNqJo3Fhgz8wb
	 z42g9ayZAZwheux4GTivWkVAtmWQEjSbC5SGf28zzcY4VTRJG+YdCPlOlQFQbcasAMj4s
	 Yjt3JNuh3jzFM5VT4RNOEsTf+oFXYVi3gYpcE/S8+5aDsNj+D0/O5k1cLzgu1yifIeBOY
	 5jT/Sr7ap8HFgl9I4JFMnEDRbItejxCuGS6MYOgu4iCZIoGIOFmkJvzP5s85gp32Ga6a4
	 5spQO9CprA57HqvQnv3IP4t5iGlTHo9YkzrmADiTuBYeVPviWhXVfsFvDL3yypMBzzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903868;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=qnzy4BU7CFfQoiDwnU+oR7x0cJx2X4FyBHG/I6YKRMg=;
	b=PPlEyuDW2n2FlnzSvOUngQyNuvvrMTnXv02rh4I4BVok/W+vbxSVs4bpwkmreRkBfoAz
	 /rdUsT7S9jo+8RuhB8boY0efwCQXgwkMT0G/ldiEDzZBJe8G4vEWZnr4B0XFTJDbPG8PQ
	 t28+82mDHHhggcbz66z792wc1X39LAmTxCtqaFoIKvwxiZ6IYDKK8GgoYAxPtMPr7YLP8
	 yMtR6IyH1/UtEAod6rHr9aKdIk26HUQIKWkPti5Of2okP9O4KZor31EPNqw/3a2u+xrsi
	 s/3eTiWLp7Gc7yiIeRalxG98XJeolwDWtz4YYjc41Nm2Mp11B5+MwfeZ4UshfaY5loQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=OOSmJG84;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D108C606A32C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D108C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=OOSmJG84
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c445c95d553so632664366b.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 00:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794903866; x=1795508666; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qnzy4BU7CFfQoiDwnU+oR7x0cJx2X4FyBHG/I6YKRMg=;
        b=OOSmJG84RijGLublSYWVTMpImlN/WVaYVWH8oU+ddcnl85mJ/nXFQyXqkaCNhDH+47
         KhPkhKvIgNqhs/kM6bF4Bjnb8RAXPDNiq+6SRu1e4EJd5VM2sQCBSKFGSnfCqWk9sOeV
         MIVJpk5h3nFj9f/1YrTEHJMEXcWrwO99d/pZ5BtX58KFjfbONFw225vcTxt9ec8AUS/y
         2axT99gaXokVpb6sSCIlV0RXDZWOkSp2aDJuhAZhA3KYRVANLXZ0bHRnUjRTl+KsPlKC
         aKx7YZKcZ3YEuWgllL/cLAeG8Fp9dk+/dWZQ1/7ZMIicNIKl+4smwKMlxNp6B8uf2lWw
         hoig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903866; x=1795508666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qnzy4BU7CFfQoiDwnU+oR7x0cJx2X4FyBHG/I6YKRMg=;
        b=S6Skiu5XpYIQVJC21fkrvRSmszID7zKva9QowmAXuA8ABv7VHPWNHCT+k/GUURfkw2
         xkbhWAp7Gb7zhR3Xnje2TOmFNj7gNGvO8QCpAAWIUX5vh5XWerBPJhxC03XRoirnpEVF
         EzROUJrRHdTe9/bWsf927EN3IZ0VRz5aggo9ZmSyxC+WwryeIMpEZO6zMdtm22fhyYSL
         AXkD9rEaQDdmMUiWB4dpxuoMxskjgIfhJ1wDoEmiCytwgj9Xqows0NiZRHLbbTTCd6qo
         NdbNLF4bGs+gLB296iPnjnuyxmxrAOLVwkfdTpoMoUUIYG8yyAX+I7NivFLhRJruKm1E
         Az+A==
X-Forwarded-Encrypted: i=1; AL+hErHGpdtysNTqJQR98qEBsPT7sjpiZGwi7WnOoYo9lZYjB5MVk+DrlHCxYY0+qVLUFqteFI2dwG2eDgx6@vger.kernel.org
X-Gm-Message-State: APuU4Z9Nm1jb0T/ghQmhmeCF/0hXs0FYHVdPzmqeEUi4JefbrPXIZGg7
	A5eSh1YvBQULVIYwaNiz8Z9qfX4g+o0KCwHbSCp7N8zrNtEYJpB1jN1ANpxPOjRKT7E=
X-Gm-Gg: AYBFou0UnDqtvj+N+PCEhM/pYwC7XJQj6raZS+qvNK62EV51YFW7OK4oJeWohmdLy7o
	1iQYKeiIvEoUrMzMAUmvXQNh6pK9Ar0pgWt1++ABiSpan19Z/wqdzyjSqFVKt7rOIJ7S/VONDQY
	bMN761a76PGm+LNSwpdTaXuMC/SCHB/O0ltzFbwcLh5jGBAIgYWza815TCoQV5CBwTQbxnhgPu/
	y6DEfoqn061dzNFCJbP5R+NEaQzc4wnKqCP/8nYwx5oOMfVrjx1fsiFUpj0iHc6Vdu6KxeBwkFr
	dOuv/IkP9zoMZQBkN/SAjp3KYlheVpn8t1kD+9PVSENUG/o4DJ7MMd04uQPSg73Qn4atu+5ManA
	OyqxEr7XMsEQ8Csn1DOkdylEub/hSgv3WEj9t5Yg0DWNk+3UVBaP+h74vEWNtl3BXFO6eAoCaNn
	oz4XjRKYiEQq6PEbOZm6CcKEAJKNqEeLfI8yXfujntfVUReaUgHxm/eR4wAdLYh/HnfV6bIL2xZ
	M+Y5uvxBbwz6hNec/lm+/cijFuxGbi3V1eFUx1TLKPxz1bjz+WEgzH58rhp45qghhqyBcGO/W+N
	9oUJ3yXMoFd+4q86Px1YNW5o1pZrSL6CwskGN77Bqy1bHIwhvM1zvRu6dmOM6oJFhDLab1PPp0c
	9R+Rpul3ZZHlQVx8tFdkp7uXodMkrKViyHWOUM7AbACrxU4n4
X-Received: by 2002:a05:6402:210d:b0:6b7:9ced:824 with SMTP id 4fb4d7f45d1cf-6b7c0c6f70amr9699533a12.26.1794903866141;
        Tue, 17 Nov 2026 00:24:26 -0800 (PST)
Received: from [192.168.101.179] (2001-1c04-0504-7401-4b2e-1820-6d24-b264.cable.dynamic.v6.ziggo.nl. [2001:1c04:504:7401:4b2e:1820:6d24:b264])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23611casm5616953a12.9.2026.11.17.00.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:24:25 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 17 Nov 2026 09:23:12 +0100
Subject: [PATCH v4 2/5] dt-bindings: thermal: generic-adc: Document
 #io-channel-cells
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
Message-Id: <20261117-bat-temp-adc-v4-2-14d5d309ebfa@fairphone.com>
References: <20261117-bat-temp-adc-v4-0-14d5d309ebfa@fairphone.com>
In-Reply-To: <20261117-bat-temp-adc-v4-0-14d5d309ebfa@fairphone.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Jens Reidel <adrian@mainlining.org>, 
 Casey Connolly <casey.connolly@linaro.org>, Val Packett <val@packett.cool>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794903862; l=1375;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=I/NJZJX7ehckBNBNEstT8hdZRvbJ5dgDjnQjjzYNTLs=;
 b=Va/ZiG9pLV9kgIqnenCHkblc6VfgP1Axc4rzf1uTf/VYu24H6meIDJzjF7cPq8pDHyZN9T6da
 Mb3xtpa7EcBDjzIwW6JQazspouxo37NOrWeZduY4MV8OdBzf5BelcoA
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the property to allow using this sensor with io-channels.

This means that the output of generic-adc-thermal can be used as an
input into a different node.

As a specific example, generic-adc-thermal takes in an ADC io-channel in
Volt, outputs temperature in degC, which can then be consumed by a fuel
gauge driver to provide the battery temperature readings to user space.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml b/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml
index 12e6418dc24d..317fc39ed46a 100644
--- a/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml
@@ -24,6 +24,9 @@ properties:
   '#thermal-sensor-cells':
     const: 0
 
+  "#io-channel-cells":
+    const: 0
+
   io-channels:
     maxItems: 1
 
@@ -58,6 +61,7 @@ examples:
     thermal-sensor {
         compatible = "generic-adc-thermal";
         #thermal-sensor-cells = <0>;
+        #io-channel-cells = <0>;
         io-channels = <&ads1015 1>;
         io-channel-names = "sensor-channel";
         temperature-lookup-table = <

-- 
2.56.1

