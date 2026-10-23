Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737582;
	b=ERRyAal0PqHm5clAH95yizA24jE7rTryGmMsEEzOQalqzSPqgM0YUmKlhUPjnX2NnXhZ
	 nnAHFV8nncRwlnvfOkhz36grMWDXYq2KuYNeE+jHEVPA8spWHO1bgP2wkqTsyqKaduxVy
	 fWQ02z5JK6NnRHeTm6nl654mu7Idl7M/c3WnYYpBtIiB4Kl3c6f5uRHM0zKVHwntr3YwV
	 nn5oJKIaJ0h9mi04ctu9UNWmQ61+YC7RQ5sU2xf/srxizlYRW9+D8/M4KjQIUKuylhR4O
	 y88LvS6bTucrc2lcWS8cVw2u6iYNQN568imDkKzbx/3cBs3MNPLcjQwQMeI7R0QABIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=e9iXPCmoOhpVXWg91psYHS0PCZjsptq0x3nugAHkv9M=;
	b=acRdx2Sq443LuBfuBaFGc4Tlpf7eXEFgjiFpfVt3bB8JSfVBu0v4Mgj+d6BqnPVV2xko
	 i8RCpHyHkEr2YHw7V51J5j3OH/aneaY9Papya6bEU7SBG40G/zlrmPAFuGU1FzZgaWBN4
	 NDS/elylvnpRHU1nUwrXMyg8J4P5NKYYBLm9ghFIEBY9PAbMxrheDe/dXFW4j2Nwu7ClE
	 XeY6nNwRSxkcSvMBTAtT97/ataNdNaPIohtTmiHqxRJWDSjACrJFDaY1EmtOc4xv7JDBZ
	 xVs1n6AGuZz8n9lrJCO9KfUxS1UK8tfBgQw8sMfZ29n2JGIye1pqZGqX96Q6+KZkTEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UQBmNYbY;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1F8606A339
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 06:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB1F8606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UQBmNYbY
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso5493375e9.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 23:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792737580; x=1793342380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e9iXPCmoOhpVXWg91psYHS0PCZjsptq0x3nugAHkv9M=;
        b=UQBmNYbYzunSxlqefzQwlfzStDGIZ+9O+P4YzFq567SYqEcPNcMq8eNnih7hPjpmBr
         L8WJT1AH4QjhoiQQMwDxZpUja1QV5Z9Ndg3UInkU3QqkE0YIp5iop6LEpyVEeZg4/YBl
         tXWfus1Qe7w0Sl4ZfuPeTnaMSaaqm+V6iO9niRnGMaxDhAClo/ysPfkoj5EZTd4LVDWa
         4gnW+muQvuA7dEkA0uG5vZtwvTfZqtrmbYW44dkV+3KdX/fyWsQlPG42WUq0sMmn6Zsn
         hDCsNHwA+T+Sd8M84FGeOgCphhp32Qe7uNCO/Tggh7L4eqFsqZvaJvekyhQhS0RrFsL6
         t3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737580; x=1793342380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e9iXPCmoOhpVXWg91psYHS0PCZjsptq0x3nugAHkv9M=;
        b=ZDNwoKnL7rtrdgmM3xOuv59O4+yd6ojAYBwsqHmKKMaxNdv1v+evMMNCQfxW3u1UZM
         xgJOQaZvpTRP0b436B6K2gxwXickd3g5uEopG0xHn+7BTVPkludJH2d9/fjrbD44WMJk
         /ytoG/FUiQjhzfd1Z2BDzjkSZB38xuhYH/YpX3s96f2zU/wQNkPLbLJbeGQh1ZpzXCYg
         wKt2lIewkSm8k9c7uLeGBgzZHf8Yvy+ymOqk0NRy+fDexDq4CR7l2aebo+5Du/eWnIQF
         WamK8qG7QmLhiTaCeE778mvR65T8L1jfk67g8LIGQLoqFu46p7BTnzM/7/CHdTYELXHB
         jGig==
X-Forwarded-Encrypted: i=1; AKwUvBy+PeBeNjFIQggTwONJt7aLRWBgRtedV6O7DwAYeDQXLd+HAZfGYgWyi6PcveyNv+8Cpsk+Lat8QbXW@vger.kernel.org
X-Gm-Message-State: AFq9FYIHr1YJMsjXfAYtNwU8BYFTHevihxrbIteDUpcVgyaZevZS+E1w
	U9AooKZ9GUjtf9PI07yzpPcr2y1StpDLHMd5lJs+FMuyjku+Ix0IZQl1
X-Gm-Gg: AYBFou1NfbEwVB4tq0LGvWlslRhItWZZ/zMKJN2cOrvPWdkf+yQE15ag5ptTTh4XOyE
	z6nt3y3Dh+iXg7uR90yFPkS6l7uuFvLG8C37oVyMkB5bWYe8A97CI+dnagQc9TfZSgayt722U5G
	9n4uA4urblTTLutfFjrpxqK72jeesVNVKZqD+IU5Gz29lZhv3WDCv6pV0E8OMVgjMT9aX690Yzp
	fz+pO3zT98wN2eeb3b8m6/l+4BeccRKE27sYHev5QLubuFBiZVenjk4BwFjuOVlJtuhiy88eKLR
	S8sJftUx2/9X0tvlxHRtagLiO78ndn2TWEZCqyKUPjD+0Tl79fJGuU+F0xckQey2EzPTcSQN2K3
	an1S+tjdled2Ihm6VGkhe5Scedd0BzUgw/SYyYVYOdn5nci8f2a9E6CcZXF2h4bVWFrymMIhsrR
	R8eF28/5j6K6RTvoNUnPXZsI8sFd3KTxPikmON9X6HVomFllaki+y+4IFSJB3n9ezT719YY2Tmi
	a93/pJPxUMScmGArMys4YIwE500rt/Nz1mS9Wyu899z4CIbwbphC99o72s7kXEqFpUWpocqFecE
	P1Y0SYDS/aNPGm/B96ZTCzUrDreq4/wL1MzGnDXWGrK7WSoDpot3+bYmQsnV5J34gGPNx8QgVz7
	j8R4=
X-Received: by 2002:a05:600c:a46:b0:4a1:db17:c7e6 with SMTP id 5b1f17b1804b1-4a211c50e30mr19135615e9.2.1792737580211;
        Thu, 22 Oct 2026 23:39:40 -0700 (PDT)
Received: from [192.168.1.22] (cst-prg-49-173.cust.vodafone.cz. [46.135.49.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38030c47sm3104782f8f.21.2026.10.22.23.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:39:39 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@gmail.com>
X-Google-Original-From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 23 Oct 2026 08:39:26 +0200
Subject: [PATCH v3 01/16] dt-bindings: remoteproc: k3-dsp: Add the L2
 auxiliary and DRU regions
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
Message-Id: <20261023-thames-v3-1-3ab40aa17157@tomeuvizoso.net>
References: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
In-Reply-To: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Beleswar Padhi <b-padhi@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robert Nelson <robertcnelson@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Suman Anna <s-anna@ti.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 linux-remoteproc@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailer: b4 0.15.2

Besides the existing L2 SRAM region, at least some C7x DSPs in K3 SoCs
have an additional region called in the documentation "AUX L2 SRAM".
This is just some more SRAM that is accessed separately.

Also add the memory region for the control registers of the DRU (Data
Routing Unit), which allow starting DMA transactions and polling for
their completion.

The two entries are optional, so existing device trees still validate,
and are allowed only for the ti,am62a-c7xv-dsp compatible, the C7x
generation that has them.

Assisted-by: LLM
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

---

v3:
- Initial version
---
 Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
index 8b1ed384ef22..278b88b7f906 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
@@ -122,11 +122,17 @@ allOf:
     then:
       properties:
         reg:
+          minItems: 1
           items:
             - description: Address and Size of the L2 SRAM internal memory region
+            - description: Address and Size of the auxiliary L2 SRAM aperture
+            - description: Address and Size of the DRU real-time register page
         reg-names:
+          minItems: 1
           items:
             - const: l2sram
+            - const: l2aux
+            - const: dru
 
   - $ref: /schemas/arm/keystone/ti,k3-sci-common.yaml#
 

-- 
2.54.0

