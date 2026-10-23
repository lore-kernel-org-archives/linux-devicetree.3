Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737628;
	b=l+08t4zsBa25IIVFAXHnZ2qqyOntrpAin5F1e5S//613Zpatcq8ahw16Qd9aSNDU5TdT
	 adw/OBoDQgk6VSAkrrMuGSg3om1Q0pkLXerINfzTZ4QllLRTLhddWEJ+SjfqFkak3IYuF
	 VPlLDxSM9O3rp8PKaD3Mj3b/xD43295zKn7lGZP/AL7nPmxxRC0LTBspAM9DYjqd5DYDO
	 YDOXaqo35PaEb9T3EBAeCi8r5o8+aexMbCDgxHMZ/plAdmCDSZtCvDvp6omxF7ZZ883Xk
	 DE4WQ1ZWsor8l3oPP51WqRA1fcmaBOZd2EEQ0l3qmbnS5pcWmFglDDtMI0BlshG/mxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=qBC94N5Vlr3FlLO5bq8d1hj8zBP4JCR0k1VspHMjzxs=;
	b=HOB94lzOAKTsF2YlMeZ/nV+yPwvAkA0s14GWXWIxCn6ar3p2rP8g3ioORjZBNe5q+I6d
	 Gt04DpT63KEdf4oIa9Tb6LGlMgnXczMFPgXyKCfEFUjP3hjXGkVAnxJtxKlDoV8ake0A3
	 pP8u7LXbK7A1pg4uHa7ZWAB2o+BR8nikyynxO3BIlqidK718IJJMZraVi1Fk4Rpc2zU4o
	 k1T8s7aSQgz3ltdE01GssItz1BmpvbuovSfLkKOYRCs05hM7pB4g4OGwmT+3VeJi2juv2
	 KsVgh2o4aifHJj6StAwlzl3eGWxMozgsncFl2FW2rTuId7HFJf+USnrrYtXvoBKWUNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D8JttAdU;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE9060A3831
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 06:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EE9060A3831
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D8JttAdU
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a208d93758so5018835e9.3
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 23:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792737626; x=1793342426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qBC94N5Vlr3FlLO5bq8d1hj8zBP4JCR0k1VspHMjzxs=;
        b=D8JttAdUXWMA+C1tKErktnwsZZCy3HIUbjnaGh5X7r4L44Zk6RhL8BtNIhqkRk/36D
         IhFbmfHjF5EfcEOihgCUgXSY2+8D8PaXFo+uQ02UUPUUAw2gwAFF19tS0ABrtWDgGPoI
         HeV1vZ9M/nK1FKD6a9Az0iXO04LSuORvWofVstmgcVohmcwvPiihakPXSW2lCaaAmIrM
         44okde0ifL/bu5PZilTkScI6CcMm/uxQrgXHl4ejdowMVXSXesaaRI4KV1JkxQwpFHSe
         lbUVCuoQoCWi6cHLQQoVeoYI7ZAz+2azP2ToWhFHPNSGGzAZ6OxQW0g+zx6nEOJIwLvb
         eWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737626; x=1793342426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qBC94N5Vlr3FlLO5bq8d1hj8zBP4JCR0k1VspHMjzxs=;
        b=XG6R8V/CZDUXSglKHtQp/f71ltcMdLmyvrtb26Pzrk6DXP+j8MobgqSPDxoqpxumob
         dyMuvwHj2yIhF2H5DYvDPl14q6HFLAlyp5zpmRT9KuGLnDbY60JJFHthkAnaeRuc02ww
         oL2s43PNZkRO7JoQav6EReLsgpCue2ax4LCF0CyOYlIyuleBazs+02KgXzvP9HgU1OZO
         oKGCMHbHY9zHYA6wZst8rxFv5zEcxV9a1erLDSQe6zkWuW3hA7sj2fILuP1ofqmfFanN
         VkHKrIkpbM0J8R7pTb/xxPc1/xGF/k73SNMzc9wAZL/7GjnVBuGskW/vFgXo2tnox7yy
         NQ1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwCgwyq/OHBan12uYjFaHo8ar7FAoi5uceIPA0TX6OetqFGmShiZNT79wT01fUcpIQHhstJfcctUus1@vger.kernel.org
X-Gm-Message-State: AFq9FYJJ3+7DNRN3+9Zp+ePbIagVdhOc4z3bvuvDUhBBPIOgfBVUcMOu
	z9qyxLFsKfpQoteO2GECTA+0pC/aAI5gH5wkUnDCaA/JoU5AHCt6Y8lt
X-Gm-Gg: AYBFou2YcmZf4Eh2fB+3yvbQgPo7JMzAm2ncZeKYCzZY0FdISCyRZGn9TJ01M9PjMJA
	aQWTAslfuiCn+Cimqp8G1KbvNPPdoRFRR//bvpGETSIGEron0o54+dh0ZSJNBDmM3ksNycIfvI+
	jMwAReFkkgI0YOX4clEyL3G4NeULlwyK2oL+UG8hayAyc40j10AdTOL21ZMJAkqfwKHLajS4n1m
	Ajhm4yx/6Gtxf08J73bG1LeJaIOKJJ9E3xWmYKq5zzNiGNeTUKTcIy54D+8bAziPs0rkHrY9ZYK
	rl0NUKejBTJarPJsMrQNIzk9htxLQkvh7m2HuNi9xKstRED4l2u68/4i44u29dORc4pgPrtdmB/
	tYbuokeDZuZaxoXpHbI7QyA0uRAqKabUqfrMbAcUIlPq7x/hFQvYGnAnYfYXT8+iivBTLSBwd4g
	nfGhZy54pu+GgE5MNp4NhPGynNyMv6zsY+DuwDz6nf6vOK93hUhBx3J8rlplbuYiIm6Zs55DSIn
	qr8RlLWLrzbMVB7w7KrXL9Nd/vrL/ddNCRuKzE5k7WA8I42KUKCSbiQq49SiA9BwHa9+ERbzh3c
	W6eDfD0Z1eVtFNDwPhRVrrClD7x8CQ4JsOUlGy2eCiXG+AHOtOVl9ftkA5UR36vpwKjC1BHJivc
	iYlE=
X-Received: by 2002:a05:600c:3486:b0:4a1:722a:d2a3 with SMTP id 5b1f17b1804b1-4a211eec13amr18677595e9.23.1792737626234;
        Thu, 22 Oct 2026 23:40:26 -0700 (PDT)
Received: from [192.168.1.22] (cst-prg-49-173.cust.vodafone.cz. [46.135.49.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38030c47sm3104782f8f.21.2026.10.22.23.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:40:25 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@gmail.com>
X-Google-Original-From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 23 Oct 2026 08:39:41 +0200
Subject: [PATCH v3 16/16] arm64: dts: ti: k3-j722s: Reference the power
 domains of the C7x timers
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
Message-Id: <20261023-thames-v3-16-3ab40aa17157@tomeuvizoso.net>
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

Make sure that the timers are powered up so the firmware can use them.

Assisted-by: LLM
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
index 611220ff2655..7639081dc913 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
@@ -166,6 +166,14 @@ &c7x_0 {
 		 <&mailbox0_cluster2 &mbox_c7x_0_client>;
 	memory-region = <&c7x_0_dma_memory_region>,
 			<&c7x_0_memory_region>;
+	/*
+	 * Both timers on each core: core 0's firmware drives TIMER1 and core
+	 * 1's TIMER2; two entries also keep the platform bus from attaching the
+	 * domain to the K3 driver's device.
+	 */
+	power-domains = <&k3_pds 37 TI_SCI_PD_EXCLUSIVE>,
+			<&k3_pds 38 TI_SCI_PD_EXCLUSIVE>;
+	power-domain-names = "timer1", "timer2";
 	status = "okay";
 };
 
@@ -174,5 +182,8 @@ &c7x_1 {
 		 <&mailbox0_cluster3 &mbox_c7x_1_client>;
 	memory-region = <&c7x_1_dma_memory_region>,
 			<&c7x_1_memory_region>;
+	power-domains = <&k3_pds 37 TI_SCI_PD_EXCLUSIVE>,
+			<&k3_pds 38 TI_SCI_PD_EXCLUSIVE>;
+	power-domain-names = "timer1", "timer2";
 	status = "okay";
 };

-- 
2.54.0

