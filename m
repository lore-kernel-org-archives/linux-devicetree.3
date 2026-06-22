Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF1A349CC3
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 19:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782156679; cv=none; b=ECWiqVUYSGLSCkXtotANAsBjm2xSWgDbVPnVDo/BAOaz9rVa32fWKpmg6Khr8X7NHSXBcFBehiIInOobOkBQblxaLTN3DL6F9Hd2aLMOaPoHR+KRtvVl/2Ji8iL1Wy+qBwA/W9TDgFBpyexG5BcDYWaDeWZn9Q9dGpza8PY4hMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782156679; c=relaxed/simple;
	bh=+pJ7uCu7ybV5f7cr4+RX+XNp+Kxe/oMYY80h+wFJXws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j2K8iA4DVSHx5lycR7yBIpJqwe2GlyuMkv8NipyeaspcLglif6McrZnFp8STZ8E0Lm8HTgscAo7BddnpPqFQQXfVGAk+nu+LWaF0k6pzEsu4eOz/dgMRK13/0zTIBbxmYpAe9ZtHUfM6TnefJ9JzvhAgM5gR8Z1SJvqPvBQnvUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UM3Vcnb5; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UM3Vcnb5"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-966f003be09so1036785241.3
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 12:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782156676; x=1782761476; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Obu4Xxfz1KmGEQnekwRPaE60IevUUgr4/ZY5B+MxY7Q=;
        b=UM3Vcnb593/ti6jMWuDq4QuyuK+3VW4yHSz8k5vBmvVOQ2LlkOPmK/F1uUDuERoOUX
         I/cqgv2y11hvzyn7YKL4uKydZFVvUNaxp4E/Ic3B9FySMoENzDDFvv6kfnjQGANcCSUB
         rnQV6mMoavktU/dALMVgUjYcDR5b9SdhuFV5VIr6xtILmulBYDGQgwrMy0Xq5O+1RxBx
         ll50/NzCLCRorb17ivJl8KbRKXaKC7QbSSHU7SzG/YfbcYMaunCMig3eMftdQXk1nVxg
         VfQ/rJVs11zM9Hr/iFVxMGzfLNDe/aXI8cWXx4ol3ZeRQT/FO9bdCKrqK84XL02Dob5A
         ud4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782156676; x=1782761476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Obu4Xxfz1KmGEQnekwRPaE60IevUUgr4/ZY5B+MxY7Q=;
        b=iXeC3T0KG/CsUQigNYMKgSwi7tkOKFIiAS02b+MhHpYhvUUcvu595YitKq4GTWlVWn
         C2t1j9+WgY71+aKrvz7prPJioOEnLgx/kdmZj/KOarTxivdMda7eNZ3gsHiJ+EZwIcgp
         3mUU70GAY9RBRGVH1gI2ijz2IBJms2g78WPYNAia9ZPClFk+qHOfRwgV2LL3fjX9XqLf
         8bFu2tsXuXi8MeY9LmvdKtnsqMab5PRRGmkclc0Dy0ZBRNaEIA1sUWtRUokoysvwxjYm
         pblijB+TX6KCHYyktn9Yz4pFwnKAh7v19uPmhfrbcs23lYEP6v868w4W4W/Bu79O+wh9
         wITw==
X-Forwarded-Encrypted: i=1; AFNElJ8XlMrFXz3nzGYwdrCWmjJFeCHEdRo/07nkTVyEY79FQBLSNNPwvAXMH6wUI3gT5VrwqwC41Elmdl8t@vger.kernel.org
X-Gm-Message-State: AOJu0YwSRIixzxJH3WHABqRd5q8/IO2ew3H4ZG/CRT3O2t4G/1q/umdi
	ehXcTUGdME1gq7KN0jNr5XUBM5ADI0ONqQXPR86nms7bgZlLQFcUsuAL
X-Gm-Gg: AfdE7cmegOsaG3wTa92noXLtBauiK9CgImERIiqf5i2UrzbfbIoW8DnWTi1gWa9SN3w
	M/NoP3jcVXSBB68mg8O5hrK3ooZdZzo5ANmGmFXHywYfSxfL1lbpx/sghsxUhPZGIUMGOQsMRwK
	efxCUmlsMtieDPQJ0oagmAr4k68NmuwFMFhq9A31PlLe9iz5U70mWLVZSUD2RV4RBQYXlpwd6QC
	fEhM9tdLcPOogmw6+SFC7Otd9KbiAXXiD/YthVH8IcbG4UXndrr1GPt+Hybpqd2EHaLeRNrPyRi
	89BPX7nE6pylKt8M8l4QFhzmbpqaKaJBZZJYFc9tELEVSorSvSG3ZxAwka1lOOznqdJv/Mo8VS8
	Yl6OeXUNDpxDCfW8AFjqUVWKIRQhQyDDxUuo3QcCkP0+IKP7O/dJnS8Ht9rB3RjpY8HJeWOBKsL
	T/LSOqF8UjJ7nMiA4=
X-Received: by 2002:a05:6102:358e:b0:6e0:3d72:3044 with SMTP id ada2fe7eead31-72a791d459emr9268814137.28.1782156676248;
        Mon, 22 Jun 2026 12:31:16 -0700 (PDT)
Received: from [192.168.100.222] ([2800:bf0:177:563:8f3c:3421:b12:7a09])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9670c0e484bsm7227910241.2.2026.06.22.12.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 12:31:15 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Mon, 22 Jun 2026 14:30:45 -0500
Subject: [PATCH RFC v2 1/3] dt-bindings: iio: adc: Add reference-source
 property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-new-channel-props-v2-1-aafd5369f253@gmail.com>
References: <20260622-new-channel-props-v2-0-aafd5369f253@gmail.com>
In-Reply-To: <20260622-new-channel-props-v2-0-aafd5369f253@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1254; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=+pJ7uCu7ybV5f7cr4+RX+XNp+Kxe/oMYY80h+wFJXws=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDFmWvfWJB/LT6o3aRbRn+9jVXq7wVelaVWus0efl++fMu
 2/Gyts7SlkYxLgYZMUUWdoTFn17FJX31u9A6H2YOaxMIEMYuDgFYCJFpQz/vY4KhnbqMe0pNgi+
 OlN0baLtd2uhqvteTzc8+a306vxBR4Z/NsmHl3cUL7zg8Lz1oOO/thmP5JZVagSs5N+0qSHk8St
 vZgA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Some ADCs have configurable voltage reference sources for each channel.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 Documentation/devicetree/bindings/iio/adc/adc.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/adc.yaml b/Documentation/devicetree/bindings/iio/adc/adc.yaml
index b9bc02b5b07a4c7..fdad6b8276c934c 100644
--- a/Documentation/devicetree/bindings/iio/adc/adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adc.yaml
@@ -73,6 +73,19 @@ properties:
       device design and can interact with other characteristics such as
       settling time.
 
+  reference-source:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    maxItems: 2
+    minItems: 1
+    description:
+      Indicates the voltage reference source or sources for this channel. Some
+      ADCs usually allow choosing between internal reference sources or a pair
+      of external pins.
+
+      If a single value is provided, it represents a single voltage reference
+      source. If two values are provided, the first one corresponds to the
+      positive source and the second to the negative source.
+
 anyOf:
   - oneOf:
       - required:

-- 
2.54.0

