Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284667;
	b=u+4q48XUZH6Yty1v+9Cssi8SH+mTdtqxQmeBFyrmmRSEdOR0O6IHBXFC1hnFs3lSeFu3
	 4w0IRs15cZw6vdHNf3JwVaKe+PorMjkcpy0TvMymntA/ztIJ0xNXe5GbsYJbHElh6YVPt
	 VySvFqJcos72a1ODFzxW/MgtLDpNc+qPV7gaG/H8HuWw5v6wLJWstvVVG36RR0ZffsiCc
	 3OJxlXPOWy1tgkmFEGJCYWzb2MZW8/3yJ0dJPE/XJC98JqX3FyOtLZG+Zu8ouckKJFS2f
	 ZDAIScm9zuQ8FcA/JNHEAiKZiQbvgEwXEiAHf74zc5uYkWppv1fGB42duMKY+Q17M0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sB+qucsTWzR2GT3huYaY7Vowbb5pb353bAlTMET9Yqk=;
	b=NqbPYpXwZrL0LUf9bqifSWdViA7hPjRucDgGC4+j4tBYnkDsZW0iaAaghUIVC2CxhR6V
	 9ukuR6YkwUVSA1OL6qI71TwwM/l7acb3FC3daFRHB8HcznifH06IdRwsQDoOWyJW6vnQu
	 Gc0H3GlalKn8poUReGz8oJLOTOCiFz+f5ByT9D1VPCD1iHeypbxqO/8q3kjP7TeC9OLUZ
	 7iCybpPE+7Wb4B+jwI7EyAUimolTuKCI1RV8EH4vrhHFok4/yliLhPxFGc3dXiXqtWQZY
	 x69tV8J+m1XSdDOIQB4VkfCDcOz2GBGfGlMQBcP1ViWmiHzxl8n7pGr9P76htPlopOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=mJf5IPRp;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9188B606DE6A
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 04:24:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9188B606DE6A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=mJf5IPRp
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b244fb7fffso2027550c88.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 20:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1794284666; x=1794889466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sB+qucsTWzR2GT3huYaY7Vowbb5pb353bAlTMET9Yqk=;
        b=mJf5IPRpeaMDArP5CRv1jYoN8QYIuoED7cK4e36mKkMDZUJhtn9XjLxGqOvKlh/SvJ
         VbeQ9L1UfiPTr+BZzPCl/sSLBpZ4cfuPErh/REXC37hTMfn067KmiQRjFcsHiwT94ONs
         YZxIjN6BmTxkAZyOOOKxnbGLVMahhWJCE/Ckn3OIstyAkuaAmDUHOQ7HHf8x71jbOqTr
         UV6l0LBgb2nvl2YKJQKUaulw4XRs4f1CT0SZP+Rfs/LzZWtkgDEU27EyHPOWc6MwDMCD
         APl8f6QQ8seEjyP8Rx60FNNuKn63F5bEiAsG0K3rn/6WKIHG2qhjOe3IQNPjW7fr2vIn
         qVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284666; x=1794889466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sB+qucsTWzR2GT3huYaY7Vowbb5pb353bAlTMET9Yqk=;
        b=IUNL6bUKFX9+U+r7NDJhLIovfy/Mfp3cJOwaPyDZkacYUWtPhTfu388LjE2nu8PQHY
         mGz/fNH3eJXGQPrfOQx0KE4XjIywhRfX/c6qtTZCPHoqaDUMP1nps7+j7OsfWzMNw44T
         glO3bILK8/j79uzw3DaQB4HiSuMXMWao6/CukOYC3tqbdsemmh7UZh2/rhJ1vMvQoQFZ
         OIksP8KO5zn1znjczSAc+mLJHLGOoFh1N0GG7U/n+B+4d+B37JiOw8atqtYwbZ8o86LK
         tEoQfTWemlVX2e9ztgjOL4TxrmkOhsM64AXN3Xu1H+NkHRtbCORTeg7u12iFpGPbmmq2
         jQdg==
X-Forwarded-Encrypted: i=1; AL+hErEcdAvG6W0o/jPmX44M/5SHWw5LLigN2N2/dXjUsa3JIj0j50Q5kjcfLKTPbDnzZyFgl8QtgDI6gSHf@vger.kernel.org
X-Gm-Message-State: APuU4Z9RctjGsIRDMxh/CinpYxY7pIMsqFT0hqrXkO7KjRyaeiYF6TLK
	6ccheWDtZ3U1Yf7WoIPKl1MPmJfBE3a/QAs0RWNpMfilLJMyyiZkl/ebH5FqpHlzqA==
X-Gm-Gg: AYBFou2bVmddj848fw1RfVQkGy0jaqZgGan0VINPHSXrYrItaGhmSVzr7oPA3Nk7thE
	j0mKDkmj6d0bQ0W0GOZK9piX/t1c8SWjcDLeeiv4Hvfwnt0BiwYLIwPgyCjTaGybmnVK8q+TnBB
	AUxC/sWelA7+gu4sIezlNNkWg8CWGJpzzf4h6qafqgNyIdohHypygjGbPJlGKELYwlzxc3Zae7H
	tqq0AHplTFvLw3ZyFuAbzlBcfXqowW1PsK4TxmCv18beVWXVD4L8vDT9fSK6z9M7uNgs+ipt0+e
	1SHip9L+k5ozOzbaKPAL3TxHsR8gar9hQ0E/wTXN3pp378bbLpywon2Uq9EEKrldIs6MqvMNoLL
	iZOvqlWkw7aHbvkDbdpPgqIUDnNgRQb8UBQjA83hdHO65o73zN7Z1F1EhPOIqqBwqX/fgrhWAVO
	dF1x7WP2y+PyRhvOKaEK++mFQlyU8rw10VROo9gugFr7E75gACRoFjfQVjaeaL04t1bJ1FVLTW/
	KkAZuGI7taQDB94+CIfhWNKAPbbXoCUm+eUcZHLf9D9Ny9ilh2RJKmRANofXJHPmpb1itudUmtr
	TJYtbGgmoIWdC0LMRpZyMrGibC5bg00CsT0O3kZFssDEJ3D/KU3adVIdz1f3IYq3a98Ouope5Hk
	DaeQ24ioLLCt8fDLQ
X-Received: by 2002:a05:7022:927:b0:1b3:a22c:7f68 with SMTP id a92af1059eb24-1b3b60094f5mr2444679c88.29.1794284665400;
        Mon, 09 Nov 2026 20:24:25 -0800 (PST)
Received: from cantal.lan ([58.136.75.91])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe32276sm3116950eec.8.2026.11.09.20.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:24:24 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Martin Kaistra <martin.kaistra@linutronix.de>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Rahul Sharma <r-sharma3@ti.com>,
	Robert Nelson <robertcnelson@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chintan Vankar <c-vankar@ti.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next 2/3] dt-bindings: net: ti,k3-am654-cpts: add ti,gtc-push
Date: Tue, 10 Nov 2026 11:24:02 +0700
Message-ID: <680b4e98af630c4759dbdf73b53926ec5f87fc3b.1794284248.git.jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794284248.git.jjc@jclark.com>
References: <cover.1794284248.git.jjc@jclark.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Global Timebase Counter (GTC) of TI K3 SoCs is the system counter,
the one the Arm cores read as the architected counter. It can export one
of its counter bits, selected by GTC_CFG0_PUSHEVT, as a push event
output, and the Time Sync Router can route that output to one of the
CPTS hardware timestamp push inputs (HWx_TS_PUSH). The CPTS then
timestamps edges that fall at known counter values, which gives pairs of
CPTS and system counter values.

Add an optional ti,gtc-push property giving the GTC CFG0 syscon and the
HWx_TS_PUSH input the push event is routed to. The CPTS driver uses this
to write GTC_CFG0_PUSHEVT. The router itself is configured separately, as
it is for ti,pps.

Signed-off-by: James Clark <jjc@jclark.com>
---
 .../bindings/net/ti,k3-am654-cpts.yaml          | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ti,k3-am654-cpts.yaml b/Documentation/devicetree/bindings/net/ti,k3-am654-cpts.yaml
index 3572749147fb..7bf5bedc2b9c 100644
--- a/Documentation/devicetree/bindings/net/ti,k3-am654-cpts.yaml
+++ b/Documentation/devicetree/bindings/net/ti,k3-am654-cpts.yaml
@@ -101,6 +101,23 @@ properties:
       The pair of HWx_TS_PUSH input and TS_GENFy output indexes used for
       PPS events generation. Platform/board specific.
 
+  ti,gtc-push:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to the Global Timebase Counter (GTC) CFG0
+              syscon
+          - description: HWx_TS_PUSH input index (0-based) the GTC push event
+              is routed to
+            maximum: 7
+    description: |
+      The GTC is the SoC's system counter (the Arm architected counter). Its
+      push event output, one counter bit selected by GTC_CFG0_PUSHEVT, reaches
+      a CPTS hardware timestamp push input through the Time Sync Router. With
+      this property the CPTS timestamps that signal to provide hardware
+      cross-timestamps of the CPTS and the system counter. The router is
+      configured separately. Platform/board specific.
+
   refclk-mux:
     type: object
     additionalProperties: false
-- 
2.56.0

