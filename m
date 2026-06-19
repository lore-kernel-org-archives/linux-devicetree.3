Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7B622126C
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 00:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781829200; cv=none; b=jQGpqwFusbdc2vvVjsppVFZyxl6qlgW+heAeyY62POCP+e06Z/av4H++GHG4ml4VhfNnRC7k9wulqBtXltMFKU6voD4w3qteapgflJd/t1wHdYS4usvX3skId54KEOhml4FlWT5hnU5vudK8ZukRf2DSCOdTJVtq5lC5NoVkXf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781829200; c=relaxed/simple;
	bh=93B9LNByWqbkUcw8YTfLFyLPF/gQuktYnvqvIQkd918=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Osj+kcSgAwh8i844MsiNWxXy9zs4YKYtxQBxdU2GCdDEGX1Wl6Etkdcqj5POvmAt7Vj0LfNNhNoBDFq+Gi/iV0ea4BHNLmKo5VtZCNTorEVk3zibr93z1ZCVuKCvqWU8LicU0jqpdAPhY6/DWRZnHzmY/IQnsAw3erRLXjdy+ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UaQ3Ck/K; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UaQ3Ck/K"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5bbe617d624so681920e0c.0
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 17:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781829197; x=1782433997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MwHM3FchbyVBWBrJlS5o6K8hKzhNV74Xb5lNC7TOpR8=;
        b=UaQ3Ck/KoeuAKBfDToJweXgEyei1sU63reLIxFH+lNTND0mb+9ogMeP3cyvGA9xuV7
         u/hRxlaFzu9MRPRz/OMKXE/INhsKUpI4kiGSm9sQV+Cp/vM/G1NEhl5WzsGSXWqYNwHV
         ohcViDrntNVjSoSL4d9hkL41zroBQYpLbtqYBNFNApBov2NSpYXSAvws8GZkS7pa9zvV
         IWetBovajWPPub8m3YVRA1ryZoaEhjXSDUmpbHh3OhMGToXuRzQhbdkY8UJW84BcyNJT
         qqegCbJRi/2TH9n+CcA0V4r1m0o0R37TEUaoZLlk1NZXvagpask1WrShhz0WzvRJzb9K
         wVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781829197; x=1782433997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MwHM3FchbyVBWBrJlS5o6K8hKzhNV74Xb5lNC7TOpR8=;
        b=PX4cbeP6P6gaaoU7PxV+OyNuqMEYeuifjWV2l+WXfW7xbntyMvvKQUnZmlAeqdded8
         NuUPaZJrj9PIqmQPgPyfmKNWT6kiIACJLbOufBE4IDwAIsBCD02SbD4/XHnt0kxxXgx+
         xFFvoR2zTRKdK09OUN1shG1VVYfkaSSrs4nOVF4D8uD9/hWXUhf1fuAy18swz8psTTdd
         8zmAt008xmpIgDsit4DVtQE7IjMOOfPyF6HsIOx8AgLq+ri86naLxNfZayl7SVfUFGnW
         ZUFiTXMWG9Foyv2HbTTVJFVHI06gyJ1RVxkllf7fK5c49T2eeKDk9vgpJ+Ov/eIAVRi6
         8rbQ==
X-Forwarded-Encrypted: i=1; AFNElJ+AhcOWDBxKHvM01jUwdGYjv5D7dZ1UFZa5c9nf7SIaIlBl+2pkvbn9WlYQfAKJnmVixLXvhh3cz/j3@vger.kernel.org
X-Gm-Message-State: AOJu0YzeiJ+vKqIxfzyZfQ4hNq7Er771FtUmOMHd7XXUQbx/rsSD9qHE
	T8zKy4OCCj1JUSufJoVO1r9x0QBvr8mvSWAr0B46t9AnlgMRhUQdp8qIw9h7Jw==
X-Gm-Gg: AfdE7ckGGv6Ul97WUkZGGQ5XD7YxVJAw/udI7WQoQUHug96wyrUKESyzm1ngoYJLkNz
	ZRABX0ffgm2Z5KOiQnGHdVrIYbs7NMIcbg7m6768w9fwcaNUAYvpIh92Vz/XOneTs6+gMhs0VYO
	Qg/bZNI2JzIxMWCiRYFSiZv6+2e72FgwZmn+CZ7uU63QAjo1S9l3cGFxmECrxxc6hFC1DPJ5iqS
	H0ldaeRQzklZU+HRlLY8Oqs+sa/hRlQ4RoWvaMk7i3m+FN3j66Xa8g59vL4NlxZA2cEby3Yh3Qd
	NO0MPDcKIoJb9zjBixtUFl/tFZOVdnMaK5rTbTHmWhCV67wlojN8dsvyrIuvR1G/vqDCGVbxkl8
	XGV79590ZP12jRocRsO2r7C1RCurQNDyqi37nM58EMAuFFX9Dnj6tEUyVpLAPXH8gvLFWm8sCq+
	+vhdkqh+hoiCW3X64=
X-Received: by 2002:a05:6123:2e3:b0:56f:696a:4fec with SMTP id 71dfb90a1353d-5bbeb0b594bmr649894e0c.5.1781829197406;
        Thu, 18 Jun 2026 17:33:17 -0700 (PDT)
Received: from [192.168.100.222] ([2800:bf0:177:563:8f3c:3421:b12:7a09])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bbea36b5e6sm861581e0c.9.2026.06.18.17.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 17:33:17 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Thu, 18 Jun 2026 19:33:01 -0500
Subject: [PATCH RFC 1/3] dt-bindings: iio: adc: Add reference-source
 property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-new-channel-props-v1-1-963c1b5cf40a@gmail.com>
References: <20260618-new-channel-props-v1-0-963c1b5cf40a@gmail.com>
In-Reply-To: <20260618-new-channel-props-v1-0-963c1b5cf40a@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1033; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=93B9LNByWqbkUcw8YTfLFyLPF/gQuktYnvqvIQkd918=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDFkmfZ66+gp/+dgXy3NYP1UVmm4gHvb/1KWTfgw8Qu13H
 Hu70jI6SlkYxLgYZMUUWdoTFn17FJX31u9A6H2YOaxMIEMYuDgFYCJ8+xgZfqZsmv132cw6kca8
 +FbNqbaC3CKzxdNmzNV5/Lrq3ptTigz/s496mLD6NYY+Yq/V8r70aPmHA5YTnfRFg6YlfzhhvUm
 QFwA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Some ADCs have configurable voltage reference sources for each channel.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 Documentation/devicetree/bindings/iio/adc/adc.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/adc.yaml b/Documentation/devicetree/bindings/iio/adc/adc.yaml
index b9bc02b5b07a4c..c74c2084fdb68c 100644
--- a/Documentation/devicetree/bindings/iio/adc/adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adc.yaml
@@ -73,6 +73,16 @@ properties:
       device design and can interact with other characteristics such as
       settling time.
 
+  reference-source:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    maxItems: 2
+    minItems: 1
+    description:
+      Indicates the voltage reference source or sources for this channel.
+
+      This array describes either a single reference source or a positive and
+      negative reference sources.
+
 anyOf:
   - oneOf:
       - required:

-- 
2.54.0

