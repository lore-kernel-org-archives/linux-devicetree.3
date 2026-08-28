Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249AA3CD8D7
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 06:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787899124; cv=none; b=drOQVSBFdsSsjmQ3/kkxOvBhw4X627bUqsmlMbrZZbZYB5Q5U4horjv29UiZhwSbTgvNKMOhKhLSRRXOXwsUiUHIQNycikIf6Aa4SucvNjS4A+UvmLqaT2fqE7L3EomVVql2U6HEJXbe80cmWJJhtNxgqkAN2rXkiDAoNVEUuh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787899124; c=relaxed/simple;
	bh=Krf4k0YzPCfh28rpFAoWa340zlykWxBJ3urBqYrCa2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j+VQb4ycvbvCFpMVAtFQMtHNpOaD+RjicxL8tI65w2XmK4zyeN3eJK6OMHrCVjZL8lAwTHiH4AGqn17pGD2XQ5nl21F3GaY9dusa/gsszggXBzcLcIBJkZc6XXlrJB5sj3jm/w329qa+u4Up0RtUZmvXj6BBZcVvqTa1k1r0M7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GmGFXTob; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GmGFXTob"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5c5ac25089bso299017e0c.0
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 23:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787899121; x=1788503921; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G5Uw2bvQ4z3aZMIzs9KIbg95WFBUx0+3WqEMDxXt7kU=;
        b=GmGFXTobeFsXTikgNUeZbAhWQZwkLC70u0zFLf4r09SaFFxZzfY8tF1kvIGq+NeGKc
         yk3+XD0K6LuZZh4rxnWej/79GKV8DjaFNK/1X5nXco+TmZaF9Qe0r0RgJGoXLuFw8JfS
         zvBAjiYO4SnEq3FyvfUF2bkEKdX0L/7hZG3Bhk1WpfeXhPCBW6mDK16XlCCVzqvsHkA1
         egl+TL5j0bFOJ1DAVjID7iSIjNEdCThwm//fibFQV668GL8jShEMDMtDz41V4u4QfqSE
         4jwbSBaGgBjyOv0LVvco9veW1VlXuOh/TKsQb30kP7BEUeUKFobZb52WHCWFOem2R9fm
         rZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787899121; x=1788503921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G5Uw2bvQ4z3aZMIzs9KIbg95WFBUx0+3WqEMDxXt7kU=;
        b=BHIhCZfPRzxqb7OqCPbbJUybBKcFbEUTe/fYnKK/aYPbK8qp+uTP8WPVRH4Wufv6ni
         MurB4HuYT/65a44M1JLLE8rIfcTacYJ74BpEuSN+0FfSZbuyg8nKeHjDgzQLSKQY4DQl
         0gJTheg6GgwABx+5EM1umAvfUvsgS9LE/KzcDZMYBx4F6VB8fBJymXi9d3yUoxnUK839
         xhS2zTB90a6RJu0I2A2EL2x0XyCZ33O1BBaIIoD/+g6E5+3IdeXtYwlIEm/wjt+otImd
         TkP/tW83vzRhuIWs6uoBNpE3m5STirpBj3qc0YSLoxYNvUqBs+GV98nwNz4IDIiFuibY
         TezA==
X-Forwarded-Encrypted: i=1; AHgh+Rp4U+jYmwFu9WGd79s+Nd6ueg6VznX7cvLXaXOMOQKeQ5WPywzLjK+F0OqoMUlNdgopLBAT6wIqfBK8@vger.kernel.org
X-Gm-Message-State: AFuF++nLJMEIYx3lnjbY1I9mVrsV6JTeszSGyv7HkGODiEgpdpXfkv42
	koVVDtn+S0XwUtiuMvw8DLCpk1gbqjVpR7KWdZLQtmby3KKDekjYahQcITDrMw==
X-Gm-Gg: AR+sD13Oi719GZO79Gpz5us+NmNymxBbtmTH+Rj+TYe1a14CTZI4Su49vC9HQ3vVADQ
	TeDX46HSSbAXJfDR8ZOK+RONZzDnQovXtfBuKh7ak8z+7Cy4cVmuZd5pBiVv5qlzv16WcuNHQVR
	OGMTNYV/IPTkg4mak72qQresvlv059Qcf8UspOdWCoMGobjduuHq4CoYE2XhSq8/3hyXI7tFExt
	+Mzii/c4hPbUrMmsQ7GIjXURlAyjSY4yftjuAELl4R8r+9Ek0lumriXq1rP0cb8/HSYDHPvWk06
	goXw/jrH9Y7jxUs91wNR6w77U2JU9ANFjieTEHWfSanOXynsW6d9p8FEiRrOIFpG5zLzVDeXjBY
	y8OxJtkUDoI6cvzoFYT2hRw05nWZXc6/HkHXj0l4NKhJuoQ5vAkP6tQj5XAFKvJLwAYfVHHT6Fj
	/LLjl5HTAi02fG/xtL3gS7n9rqnqm0m4zjBEUaIvZRmdPI88gMMZOUytlwmddTSk9P
X-Received: by 2002:a05:6102:50a9:b0:783:79ac:9dc3 with SMTP id ada2fe7eead31-7859a49efb7mr1250451137.10.1787899120853;
        Thu, 27 Aug 2026 23:38:40 -0700 (PDT)
Received: from [192.168.100.153] ([2800:bf0:61:1127:ab87:5602:531c:8dfb])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97e849d8494sm454195241.1.2026.08.27.23.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 23:38:40 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Fri, 28 Aug 2026 01:38:16 -0500
Subject: [PATCH v4 01/10] dt-bindings: adc: add excitation-current-chopping
 property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-ads126x-v4-1-1dc27e9c0260@gmail.com>
References: <20260828-ads126x-v4-0-1dc27e9c0260@gmail.com>
In-Reply-To: <20260828-ads126x-v4-0-1dc27e9c0260@gmail.com>
To: Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1728; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=Krf4k0YzPCfh28rpFAoWa340zlykWxBJ3urBqYrCa2I=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDFkTdV6nztI6r94nsmnC0cozS0t97H71Wx9POvfO6799z
 e4NuhObO0pZGMS4GGTFFFnaExZ9exSV99bvQOh9mDmsTCBDGLg4BWAiCz8x/I+pOmUWk+7zpujz
 sgPLnpsK3Pr67MmKF9V3j0XGMOzPPreG4X9pp4TFsyO/Qx81JLz/8OD4xu646ikr3p+3sl15SEP
 0zj1OAA==
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Add a generic excitation-current-chopping property. This is a feature
seen frequently in ADCs that are designed to ratiometrically measure
resistive loads, such as RTDs and strain gauges. Enabling this can
reduce any error due to excitation current mismatch by swapping
excitation sources of alternate conversions. This can have side-effects
in timing and filter response, so it is not always desirable to enable
this feature in some applications. Therefore, it is best to make this a
property that can be enabled or disabled in the device tree.

Suggested-by: David Lechner <dlechner@baylibre.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 Documentation/devicetree/bindings/iio/adc/adc.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/adc.yaml b/Documentation/devicetree/bindings/iio/adc/adc.yaml
index b673eaa5d072..fe20aa8f1bfc 100644
--- a/Documentation/devicetree/bindings/iio/adc/adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adc.yaml
@@ -109,6 +109,14 @@ properties:
       sources. The index in the array corresponds to the same index in the
       excitation-channels array.
 
+  excitation-current-chopping:
+    type: boolean
+    description:
+      If set, the excitation current sources are swapped and averaged on every
+      other conversion to reduce current mismatch. This generally comes at the
+      expense of added settling time between conversions, so should be omitted
+      on systems with high-frequency signals or high data rate requirements.
+
   burn-out-current-nanoamp:
     description:
       Burn-out current sources provide current to the channel's input pins for

-- 
2.55.0

