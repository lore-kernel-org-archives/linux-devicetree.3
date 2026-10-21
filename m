Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792551734;
	b=zIq8zZu+fl8lbSn84PxAq0JnDELhp24Fekeuylmyi0X/wVIq+r1OZBXUF9jwnUU0qunc
	 deRiCMjOwgRU2t8qyDVoPM+4QhnqNaC/rPKWdIuePM2nDkRr0apDqoh9LGReJsaQC4Btt
	 3yvYDa2nShutV/jjOkO8EIDPpm3ZfPQrAfMtsjMjyhB1EBOLPXrBz32yHMzt9SNMrIJFV
	 IYbDpQ80IybJPBEFMghlO4T1vPHiy8aFvIw2JAw6sPZGYS8fs9MeJvG+G1uoGsxpIJf4a
	 VGPNlunAHoF910Y/gvzeSbpuUjBfYCMLVJaVzBik1zYEEkDei8WJRkzAFOW1IaVRJiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792551734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=yC+gZPV4aotNwixKHOtH5yvTfu3V/PuIgqyMW818p0A=;
	b=jUbjmv/NFG9hKDhu4OKTrNdlLyd2YFJczCiUF86BjCRwy8bDebePiKrsD+n+fgkKBcIG
	 NEU5+KKFdc51lOYalCsOI4THBtkf8Fzk9iCi2vz071bSmJKiT4vEW5GgVgsFjNaRVz6S4
	 XATHPF2sK1u1Rt7iQh9J9/iRdhvIxL4HlNpEV9gOiT+OfYLgY1FTUXNHhBSCMJNzboG/u
	 QVcuL6scngO2v3a0AAA10NTnAciGlRLw4r2G8TDrJUmfySasTBH6ixHSkEKc5AaUyO6Px
	 H2cdYetKvES/zngAr6uB8SOypKQbHMVeLC2CbLRw/hlpz8cu9588UhsT5+f3SCgQ1ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=OyKb+VRi;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737BE606A31D
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 03:02:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 737BE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=OyKb+VRi
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35b2c599f43so482691eec.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 20:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792551734; x=1793156534; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yC+gZPV4aotNwixKHOtH5yvTfu3V/PuIgqyMW818p0A=;
        b=OyKb+VRiHivA263Xy2QCsTKpkhUU/d0NypsLDpV8kv7ulF6+EIdhvwgHbCnhpjZYk/
         2TWHksOUYx/GptVqd+dFLK3WNM+ZSKBtKVb8WO2MtQsgLPjPsPoTPlhU8RPNpxIyp9Kg
         Bn6Z6AqEWD8kFB+Sj+2WTDCEFuXnEzzUjG1jE4dUVLNfOjraEmVhBuP7mLuBKCSdV7XN
         No9wkl3As8JurEkIejQWxvPNqqUajCNUHV2CmB0/CJKPMFoeSiEPiP6czha0Hw+8bhsq
         Y8i6qYReNzupZH99xefaLCFp8p4cI4wTizG3rqpgEyPiiWljZlLaAbd28K765Zgtvirk
         NvCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792551734; x=1793156534;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yC+gZPV4aotNwixKHOtH5yvTfu3V/PuIgqyMW818p0A=;
        b=Yd+FAaNMUnRJdIBLOhLpsYBc34wLUnmp1abSZquqmSC7e1o2T6fymQQqin4CFkJHoa
         6HyVMmQJjE02ZpBv3vOqHJo2nOVWY/hBIxYkQANktKkC5b8dTHIckxYCr6gqig6HFkpT
         cdZM2ODt/G4QJvwUZADZbWGyQBFHQZUZjCpEytY+BpcCgzwsxqDfPQKaPC2h/Mx+ieNd
         ezEybORtYm2P2W2xscXo8gJWdmkz+KbsqgeTVV7xBn19PnWbrAZpbrNaJhOMuBLM0LyC
         QgXz9Z5t5XOocvxGzCjzLC28Pa3aex4F7l9wwuxifd3LzQ1BrIYyRob0MxZIH9JvSw05
         kH7w==
X-Forwarded-Encrypted: i=1; AKwUvBy+OT0zSK+vtSDAUNp5atX8Tvnsgk7IFVEo1KQRH9H3X3Gp2S+lFTTLdvvPljmjyVi4CZnXr2m3rNTQ@vger.kernel.org
X-Gm-Message-State: AFq9FYIgHW/rGwIJn3CS71j0ZlfqdpR92C2DBM3UnmIB+U3PuobkKHxT
	65Rhy+0sw84q2OqmNBzyjWKibsan2abvIWK09+ynlRWtk+6T15PkqSKnhAE52kTglNwkK1XGBfE
	49+2YbrQ=
X-Gm-Gg: AYBFou2bYcaNtJv2MDOJuI0WDke/fjN5bPYl5Pev5Rmx+4HvJiOI7TaYQKazxd5mnXV
	l0grFJUsjz7kLFrgQv5LPriIJgOKstgJkCYgmGgxb+UCL6vb5kvFhdh7AHFqJPjN3euWNwR19Kr
	nNSsvMeSQAPHFgtND0MBsLWpaicIGGxDoZy55YVAnabnQKPm+ZdqiYEOPjd2HuXhRiLACZ5mHl8
	UfvtA1WEW2nhNzjODxRU0n1leFZbd+yXNqGc8Fiowr9k2ndMwgQ1+FUePGwnWj0Bbkshf5iNaWe
	mbKl9gURcvmAx8+LcQVXks9ZzIBeZ16/J4iLoYyAajGX9x/NMbPMorKaZPZZq21xChGJ2YcfIIU
	t0xKCYsml7ulHvDBivCFvMtK6RX1FTy771Tb12byzdld219JCTeEzENxEXUSU1tJNSPzHNlf4T6
	wGZgNkicfuGbDvE6nLbXpk0X20OU1CH0Nm1BTPMqcB/5GxOZl2G3bJtEQh3gnu+RS4EZUGBH/ZM
	G0aNAYp7/ob4Zk5hUNMq6J5LxkKvJFe6IFbT9yFhgbcmALqVO6U81LRdbc=
X-Received: by 2002:a05:7301:860a:b0:366:6ada:a052 with SMTP id 5a478bee46e88-3674d84d319mr1455767eec.8.1792551733311;
        Tue, 20 Oct 2026 20:02:13 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e15353csm4436294eec.2.2026.10.20.20.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 20:02:12 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 20 Oct 2026 20:02:06 -0700
Subject: [PATCH v4 2/4] dt-bindings: trivial-devices: Add TDK FS1412 and
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
Message-Id: <20261020-hwmon-pmbus-fs1412-v4-2-27ece4e43d04@nexthop.ai>
References: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Lars Petter Mostad <lars.petter.mostad@appear.net>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792551729; l=1094;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=TihSnAyU+oM6Z6xKPg8XulncCvOA3Lsm7O7YZANDhAs=;
 b=ZR+1jUcctG0ML9NJYbjTUXiZ8OahgDHMRTQAoKHG93om+tIlU/j0W9gBsUuED/bEbOC9JNX7F
 VW+Hbti7lLVDZsu/l9Qg2XhvBk8KokV79WhdB/IsNbYhtchl42/JUIF
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

