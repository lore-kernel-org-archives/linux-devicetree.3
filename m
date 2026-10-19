Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792435544;
	b=tqiyjjZD0mFTdSZoFFD/UmnK78BzCqd1hYOpvSPP225SXleB54BDW+aoacG6mjxsA3+x
	 fgGBeY1M0tS4hVPMlEdRxcJCAyB2PjzupYbTWNlKV1dUmTHCtketKMwTuGGPVtlVz1Pwe
	 zkvjR6CivtmVbbG8Gu80Q3grDkXPrwXevgcQZuX/kW/SeBafssyjS9fgjL66fFWTV+q9M
	 DKk4Z0mzE9fVMQabN6N8ncYjIQx2MFehnCU4jllnci6K2ANwDjT7rRwOtos8Zdm2GDAxG
	 OgmfYpJKaiX4FwkwCGHVscUyanMKG39vUj2ikRhza9ncTPKqheaGFOnvHexko0oHvOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792435544;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=ubn35jwYVLt+YkxDePeC6ZjTvlEn+A/OtpxEeUnF24w=;
	b=KAIro19oSNyk786RY019dU80McE1c35pVcGaRu2g/L2j8V68MQYd5AFmQXN634MOhfur
	 qIo0Fs44qlGcgmWa47JEDfAOfzqrO8bHVwZs6P89rYhmHVGZQsyP8Z95wC7M+jgJ5PvQw
	 KOmTBvNhXf5A4Btw/RGohDKSkqr6VAco0QlDAnk1qsbJyF09jgHzyU/HO4HsvmngB9cV2
	 WVL/gKq/ggaHFWqrTfMjMpo2Xomcwbqs9FmTX4rqYm4ppTGw0IT/2VvjOibyslf3Rw8Hv
	 S1rcUK7sFvnRWUA0g+YMEGT6XvE3D7C5OGULvXT7MYKlODxO4jMdpifhFZvAO/xEAHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=QWyJRPh2;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADFA606A322
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 18:45:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ADFA606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=QWyJRPh2
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-16079d54c17so5319645c88.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792435543; x=1793040343; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ubn35jwYVLt+YkxDePeC6ZjTvlEn+A/OtpxEeUnF24w=;
        b=QWyJRPh2n2ku6N6JTwzkrzVQW2ZTXtlr6T3k49GkeEBbwXD7g3h4kAF+dDFEoVxE6q
         Z5d5gPs4sj/b1051cXJutZ0bELSBIpaEbYaTzbFUAwqTGIO6+qPw4ZwK4UMMOYRoGLc3
         piOe+IKyO0w4VnXUPrc4ZXJHxpRwZRJzmoM8xsa6VJVNExA/SDykLJCxjfxBy0X1zy4I
         VO4swFm6BYjwoz7bAC0lqGH4s+1285lvWLrI0mQ9I8P1hRpQQye+moxeickxYUUzJr1U
         YlSo+YcSwqeCziNl6ZG6/I1DbcP1qySz+dbwJwqHXIhXH23vkUcTuz9I60RAKjDUt7We
         b6bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792435543; x=1793040343;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ubn35jwYVLt+YkxDePeC6ZjTvlEn+A/OtpxEeUnF24w=;
        b=EY5uDM/jFG8j7pitY54s8nLvc4vTyr4alUhS7y9dhb5Fm1mPV9cuJYEDKdOqJiICn+
         0vFUUhxvYm6nU9D/+XQZGO99XCCJAo7tT6ZiYxrGmvdCogQbF1JdeQrnsPHGmmokjGwi
         WAEFMPIxG13XpcPrPwPHLfnaMmEjVcAWiChE+VRjjXImPkkntl/LM3KvLPjX7anAfT/N
         gYro05muoPuZKDkVEDWh3/uXEp60WjfRQP8N+CvZqSzSLGSBofrA7otHXD0R6VaZFvIn
         4gowiBkWufCAqwyxg2mNKJyIpBThKAm2phXuatPXHSKl3b3y6TVdhNhsQxIhLzpfMWrS
         JCoQ==
X-Gm-Message-State: AFq9FYLtWuabCl3wBpM6tux86sPvFJFLzkzfwRqOpedwYctVlOp9bdwL
	GaTWuxU+kJalkqNZb3wNIb63uW5u2gOWIIfcTE82yxV4wFmuiXvWylIwfe95nTT1bKk=
X-Gm-Gg: AYBFou1JiOS29cZIXQ0GhsQDCh0CR9/4b37DJo7j6N6GM7TFYhhDwkq9UcoEpp4jFD6
	sC1hZrKTd6rvPFUqqiAbYyIQuw3C6B4eXgMM5zW+nCKa23BbirWOk1/X8TZJz+u7wg6R75Y7NUE
	Hx0twuypbDdzReXYaTcz7bBhML19yUINVYpVJHXLoaaWa5HNTv2v5O0Mp8N0fxC3aOhZFLmxcCB
	vYwbMVmDe6jHfngKBVQ9WrtxaSj8ZGYJaCIdoTjNtFjk+t1H69vt3f2eQHeKUcNIqKYSZQj0Mmt
	F1Z6HjLrD3yIAy4IevQrOBQryyerE6HMdz2Nqd0oNVub0Xi+uAtMKXDIW6gIzjmMYL6TZ1eRlrT
	U8Ny1VjwzPCbU4ds3LQRvCdm4wqaXJzms0723jA7Br9I9IixXLq2Wv7MG77LKgiXxE3ioqqlEvl
	HJ8pSMyUxQLtDulCFEVu6mDDh28dRS3dlXdtOSmv4A1YER2lc5kX9HDkul0Hb3P8Hw/M57Yiho+
	MA=
X-Received: by 2002:a05:7022:170d:b0:145:287:ce91 with SMTP id a92af1059eb24-18511ad88b6mr12014693c88.14.1792435543039;
        Mon, 19 Oct 2026 11:45:43 -0700 (PDT)
Received: from [127.0.1.1] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c4d4675sm29907576c88.21.2026.10.19.11.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:45:42 -0700 (PDT)
From: Kevin Jia <kjia@nexthop.ai>
Subject: [PATCH 0/3] hwmon: (fs1603) Add driver for TDK FS160x and FS1006
 uPOL converters
Date: Mon, 19 Oct 2026 18:45:13 +0000
Message-Id: <20261019-fs1603-v1-0-8adf972386c1@nexthop.ai>
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
X-B4-Tracking: v=1; b=H4sIADll1moC/yXMyw5AMBCF4VeRWWvSi5Z4FbGgBmOBdBCJeHfF8
 kv+cy5gDIQMZXJBwIOYljlCpQn4sZkHFNRFg5baKamc6Fk5aYS2WWG8xc7bHGK8Buzp/I6q+jf
 v7YR+e9dw3w9AiUcdagAAAA==
X-Change-ID: 20261016-fs1603-25483c5edc57
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Kevin Jia <kjia@nexthop.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792435541; l=1736;
 i=kjia@nexthop.ai; s=20261016; h=from:subject:message-id;
 bh=rwFsPUfG4HlTgCqA84oS+NzH6wKBNgI0OdICfG5VybU=;
 b=F8xaV5nqcPt+1FsNz9Z6sqxZTuF1uZu2n+XMdz6Hpg6xhKMLRlHCwAmHtCdonaQIwBmBG4cj7
 5qRHdSKtm7NA6evhUR51D0T3TPOOzoAmlsU9KtpqRAwQ14zNSFWrnvz
X-Developer-Key: i=kjia@nexthop.ai; a=ed25519;
 pk=TcHV4RjX7qo9R0iryPJ/gWzq3O9yq1SUw0VO2QXQ3Zs=

The TDK FS1603, FS1604, FS1606 and FS1006 are uPOL DC-DC converters with
an integrated inductor. They report input and output voltage, output
current and temperature over a proprietary I2C register map. They are not
PMBus devices, and their register numbers collide with PMBus command codes.

Patch 1 adds the TDK vendor prefix, patch 2 documents the parts as trivial
devices, and patch 3 adds a read-only hwmon driver. The model cannot be
detected from the part, so it is declared through the I2C device name or
the devicetree compatible. The FS1606-0600 and FS1606-2500 factory presets
scale telemetry differently from the base FS1606, so they have their own
compatibles.

Tested on FS1006-3300, FS1006-5000 and FS1606-0600 parts with the driver
backported to 6.12.

Signed-off-by: Kevin Jia <kjia@nexthop.ai>
---
Kevin Jia (3):
      dt-bindings: vendor-prefixes: Add TDK
      dt-bindings: trivial-devices: Add TDK FS160x and FS1006
      hwmon: (fs1603) Add driver for TDK FS160x and FS1006 uPOL converters

 .../devicetree/bindings/trivial-devices.yaml       |  14 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 Documentation/hwmon/fs1603.rst                     |  75 ++++
 Documentation/hwmon/index.rst                      |   1 +
 MAINTAINERS                                        |   7 +
 drivers/hwmon/Kconfig                              |  11 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/fs1603.c                             | 480 +++++++++++++++++++++
 8 files changed, 591 insertions(+)
---
base-commit: 400be69515c327ced60082b27ede902a8d93cbdb
change-id: 20261016-fs1603-25483c5edc57

Best regards,
--  
Kevin Jia <kjia@nexthop.ai>

