Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611A0400DE8
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 12:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782736953; cv=none; b=AZ/ljOoeKPEseED3IG/Z59ytHA2YqDQ2l+BD+RVRaXpPL3X6LlvFPuFcN/7yPlz3vo1JI0b9CYy9Dq6rnAq54MF2NfTQej5tuas4c2IN16Z0E3pHuMKrna0aoiSKi8mI++KRXmNp85XJaXuOG4OvvXDoI3EhatFGjGg6GZJpc6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782736953; c=relaxed/simple;
	bh=VJAHuue9pm1FiRZUd8IJhSgHvJF2qQrN+3NPC5/4llk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C+ji7f7HFVMpRwpmfC9QFvkpM1roS4oraSzEdLnUDVVENWUhWbIKgbHnYu/lZNUdOSm5Hxt3pvZefudc1S1RJOLJHVrmFoYNGOsCkfnshjsdbF4GQIPKqFOtN6NWTaVwZxxtz4mNtiyVvhUODMcb2N1RDX1HkEniKDs5nVLU5M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=A020oAqG; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="A020oAqG"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493a285ff0cso7767255e9.2
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782736951; x=1783341751; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RuY0GYLoz4Pl54AHbNMD46lqQfrjHQuItDMfVO0XptY=;
        b=A020oAqGgegFwxEnN91E7KAUxzYTx9izH8BnPrlKj4CEXNMxHHRQ+lD1G30vflQBos
         HYQOMce+mO5YDeGXhoIvdNKI4GmJbjDlodOlYC1qVw2Fj1j/JzaFv8F4NilgqEkHELiG
         njfT27MHaE4oDE6MNhdz+GkJ21/Qj4WiWQpxxymKvE47rl5m95jcXOmly+v4eQBy1gQw
         qusMkApJUU3C45+m3vXNKXpYbv9mpegj/FvzxxcMREhDfkckbpT5AdyN6cb86f6Hr5rH
         BOu+bqFTMTEIjRZROfIDrr5v+uCKQmM3j3b0g04aqEPEGOs10EwLp2jJDtBH2RISVxwU
         cXUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736951; x=1783341751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RuY0GYLoz4Pl54AHbNMD46lqQfrjHQuItDMfVO0XptY=;
        b=DQlL4ZjLYZy0g6CHeVb/9fnP1QJZewfKNF3XhZZA0tXW8wne973cekO5e+f6Fhkz3j
         uh4qcF+NhgxCeiVoLcVVwooEToX6zuOMnH1+1KjXMRefw9vaKx/mMco6ox8G9Ltdhpfj
         TQjGDVPUkNZDFQSpcKIsfIKzhGUe9mk2RxnmBvrGZxbdWskaw3qdBpi2CawnE8lm8o5+
         eTG9q5aIduGIcAfsygkAsXg6gtH8wD0aQ9llDhflAJEgEnGvsVeoNsW9urUoEHTHcbT4
         q323h7AWT8WqDM75VdCUhG23FIaQYLiLrg8cp78GI3QFzv0mU6Y/tUE39kIX+ANxLGwG
         onzQ==
X-Forwarded-Encrypted: i=1; AFNElJ+5p9N8Cs5thcUJHbWdtGGL6C1izr3++opgQBqncLLHtB0BaIPaC8YXLGN3hfvOelG9R02aU+WgfegR@vger.kernel.org
X-Gm-Message-State: AOJu0YzkKQYdAUGnUdYxmFVfbJyJZU6kLsDmxiyf/ZyXpisLfVBZsXpI
	/Xyx5BWLm6Xg4TjZKeEaFDXz4Fw9HUVGrs/N1IYzbc92vT4qgdRXf9xzS0Srkz7/RQ/s46+Wtoy
	6BLRD
X-Gm-Gg: AfdE7cmAng567yKPbOwDwdvRh1oaFuLg4WKFk0MnMIAUyqG8je/zk493LavoJXUXSjH
	7afFikcudX+4F8wun1GOJtc8Ph22WqROcIdsXjjEDRRYEk0rNwoYRbFTrKSO29oMVjXVax2pXiC
	uVZ+n41IGGB/9KXp5cU/6t+qsfTK8iXi5E1xMoJ6NVoi0uPk/lX/kORy/hhmt8j8NkgvqFLMe9y
	qj+HMXxaapzKSwAldRFWtk97+ZgfW7qNC+o0Rbwz65+SbFEz244MImEsMoq/jpPwt7xxwC95+bS
	S8iM0GSu/lO2vD2oj3u52C+agXCX0kOG4Rl9DZP7016L68QX2ylxbyuLd7fU0jb65JmD7+qpi32
	eC7G1cl79/V6D2qKDOoAaoq0+nPCl8yEiGc3KovAPU+/j9Q4i8/Eh5DbdYJKZH3ozMZhiTh5s
X-Received: by 2002:a05:600c:1d86:b0:490:d354:bcf4 with SMTP id 5b1f17b1804b1-49266885dc4mr249806255e9.27.1782736950484;
        Mon, 29 Jun 2026 05:42:30 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d21:f5d5:2d3c:23a7])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493adf3d98fsm80822085e9.8.2026.06.29.05.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:42:30 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 29 Jun 2026 14:42:05 +0200
Subject: [PATCH v2 1/6] dt-bindings: rtc: sun6i: add sun60i-a733 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-a733-rtc-v2-1-7b72112784f8@baylibre.com>
References: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
In-Reply-To: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1439; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=VJAHuue9pm1FiRZUd8IJhSgHvJF2qQrN+3NPC5/4llk=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqQmgtW52pl9ymFcc6wjZ4sTtM/p/LNN9ZtDgRc
 WKlUartlpaJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakJoLQAKCRDm/A8cN/La
 hbtuD/9w9j2Osb71WII1hjlD5NY7YjH4OtroF8D36BpXiVm1yn4a+2So1WGl3c1Ng6kXeswAdqi
 Voc7emUXjLwvfHsTqWpaWdw7nYDMRwFYL0z8vQEVAPFqOWNOnqe2q84vAcN7lXe3H/0MR6Dipw4
 g0g0wS+fNOAkq47suPO8WtnqTcDxTCb1xQB5oXHSoioI2Wuy9HdnQDzKFd6UrvrHxq9CQAOtQJ7
 MMcdfmPkKBjxgCm7o0VOlJQfv4b1A66MTB+YyvJwwfzNM66Wl2iNYAK0UhaDFOakyIAMN4C1d2A
 /P1q/fSXLrE3bnpqILA0uwSphLEnN5RHT2zXBej3qW0ksFQDe+9aCDLB2Lw0Ylnu/nD+NGqZtIh
 XcMVHEJrtK/nEL+wBQwzZZ2ge+MajYiUNiki01R4uTA0degnUSWthT0cZX+Uf72BplztqN+YrzK
 ntskS7l4EhTj0lQ52MUTSv7tOptAZwGgpvuggGeUj1rSkh2OKdVAMNlCsOAC/ow6qrfq5sba6qY
 /70T8N708Ii+ljhUX8CDE49RJPF1KvZn1l1F3yMdmpEM5IZEVMcDEISSUcUNDBMz20QbEp49Ejq
 9xcudU3c6XaQn42dv4yVj9Ff1l3plINHqKVyShMj0fg+2j55Ft7u9mPtoRK3RLkDLruVp8Cl8Vx
 sJZ80FAnPrdMTiQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add a new rtc compatible for the sun60i-a733 SoC and new IDs for the
peripheral oscillator clock gates of this SoC.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml | 1 +
 include/dt-bindings/clock/sun6i-rtc.h                              | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index 9df5cdb6f63f..197a6f67b180 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -33,6 +33,7 @@ properties:
           - enum:
               - allwinner,sun20i-d1-rtc
               - allwinner,sun55i-a523-rtc
+              - allwinner,sun60i-a733-rtc
           - const: allwinner,sun50i-r329-rtc
 
   reg:
diff --git a/include/dt-bindings/clock/sun6i-rtc.h b/include/dt-bindings/clock/sun6i-rtc.h
index 3bd3aa3d57ce..5132a393ca4b 100644
--- a/include/dt-bindings/clock/sun6i-rtc.h
+++ b/include/dt-bindings/clock/sun6i-rtc.h
@@ -6,5 +6,9 @@
 #define CLK_OSC32K		0
 #define CLK_OSC32K_FANOUT	1
 #define CLK_IOSC		2
+#define CLK_HOSC_UFS		8
+#define CLK_HOSC_HDMI		9
+#define CLK_HOSC_SERDES0	10
+#define CLK_HOSC_SERDES1	11
 
 #endif /* _DT_BINDINGS_CLK_SUN6I_RTC_H_ */

-- 
2.47.3

