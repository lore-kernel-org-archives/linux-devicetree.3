Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737588;
	b=IZwr5xqVScGibUY0/IAlh0o4jPOu2+mlIcHBIKXAFQq2wNQzW+1iKBVYOiLuWheehXoD
	 DRfUBei+EF6PgeaXvOy0wFyjjS+odMCtQ5ZTCSnnEQ7VHOGXhdreGsjUqXEK1l6uyEt/W
	 pILoudWxGVIipgPRmNgDcZqB73Cc4xrSdjGkvsrcw0rFcxffXPlEFrsu+VawVArBvym14
	 vP9UOBrEneqHKDRpctt/hKOlp2krSM6r1kvbGUz6o1OqfTXpAsur8wsLjj2phzkiGXYbJ
	 5mHTz3J3aUfPX8Uy5k2d+uc/ZKgCKY/XRW25jJVO899nlte8rfPXXOYAdeOpr6ahwWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737588;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=zM6qRbp5A9CbBlh2Bu/tmcTR/0lPEgQHJG0kewWnWN4=;
	b=XhWMom+Vp4IESzBA8PpvtJkcy/JPazpHxqrrQcm1aua77Er5vpACVpJtfDLcBppHfhlM
	 s3Qe70eMqSAMowNOwf79tJJp8kD9Ajos8eh6tFynMeoDXiJ1v3n0lQT8uHzmauCd+LnDM
	 DNN7FoZCFNuEort6KvztgXBbabuG8EInxds+9R5UN+Kbj4TO08rztzmh/slQiUeQ0LkS0
	 K2KtVhYw4C/N75MRkKW0R0WdFxLxGzTQqp9LLRRcaYlJnjF2tpcD2yuCqYcfBZduK+Sp+
	 fuwV6Vdr70zPbTIxy4iV8jNNcmLRN1neBmXSfavmV7A92P3FJbxuM7j6ydpgwhfFCHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dTYQCezJ;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427A1606A325
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 06:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 427A1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dTYQCezJ
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso273579f8f.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 23:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792737587; x=1793342387; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zM6qRbp5A9CbBlh2Bu/tmcTR/0lPEgQHJG0kewWnWN4=;
        b=dTYQCezJmgcg9GGfQwV8y0d2iLfg6yCWGHqDKMyjsr8yZxOhyUsBMSf/ZNFgwODWF7
         Ca65GerJrzoQMUWzaApQ6FsH021ecFKPP84Vo4xTo6/rpTav2Td2W5SPBRlg3hXGl1px
         xP9Z4zO5uXlxiArcnHL2bAJmJPkPMjMl648DPWqdP90u701pWOiEyM5G/1muxUzPFpq2
         GELahv1hSqryhdLHy5UgrSQvCjuip2O+DMxqQdyrDLqCzm8Xny5XxFUUYZp9tLCW119v
         aS17giMu5xehA1z1L3jBEqcI0NZSj+ukea/DASddTVYuvZWF7/0CR1CzHU/29htSAxpq
         Vazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737587; x=1793342387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zM6qRbp5A9CbBlh2Bu/tmcTR/0lPEgQHJG0kewWnWN4=;
        b=EYWCo4buN0Ukr9M46k613djQNqpXJkUjwnSZ2EnJMR/q79YMz3quTPAiKUSnPbMmY3
         sCXWlu3ECIS4LZiWfO4a1pVTYK/Xo85S0jWEWsfS92aTj1y+GySTynLKPrFKG8JwUJFg
         7+Gc6/FDjKdMQyjjJOlpJQx6QMUhSjIOaqaiPQYtvnbrTMv4wnfNGzY1NRwjsd5F3Chy
         ONaxGShhxCR7X2pm1nexYmpF1o+N4ksz8m+jQIO2PBuiHyXw6M7QdGB8mlSlakPguLvv
         zP88Czh0BRnFGSydMmkvaIdbefDbNBjHxb6cZFP2iK89Yz62GuogxW6NLD987YN3jd5m
         X/IQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYE1VGkYf8MIUk/AX9CN/LMs3ujmm2smBCFDowRERss/ekMp1jlxTCjDuCVgRuwivQdPilnvUmug7N@vger.kernel.org
X-Gm-Message-State: AFq9FYLgiw0OfDrJTamipMtfJG/K1SoZahFlbzm95KZ+ghUZeTgo6AXL
	KxdVTsmm8QLRCwzt4eHIMHPu6wzACbdLpThnVpb0r8nRCPFcw4O93B/b
X-Gm-Gg: AYBFou2S9Gmj/cfkxGo4LkEmU0HmrXwOgL2O3l9pr7HnfLbdbuP+ZoffQ2xFjHNWFyY
	d8V4zuqe213jHst1JE9Npo/fAQW/d1/MpKikN8g67N1RCRRomEBGEHVNinqZ2N4/imySCqcfzc+
	ML+e1yDzi8383FX+RqGNR2W+TA0ajIwsMsjpAvrq8cA530rufM23FeK07q3/Wg2jaMNnu2j1dAR
	40ltHfofeQdMptyLp9A3n/7A3BWLuSEWgNXqRV6WcPPPUUP3B8CH1dMTVVcaIfJnoQiW9Oo/eur
	/2AaGt3DX/y/15ibcqUy3+7JAVB7E8F46c8IV9S8asQWCzwWSUpI6r9kvC7cweeQwEt2WYBChby
	NwkB1gd2qEoVQvzJFERDqHlpU6T+Jl/pz14N+lFHD1DT0BhZTAJTlnBSWySVNEOPT5M2ttnNxyB
	LDTNj8PxTKYGFv4nAg5qAQj11JKxsmAt3TSxDzzWayF49MP6HJQNlSyr81Q/RSsCduv3L/VFqVA
	f5VJVeBLVw3aeCFImPIdju0BaVcOIEbawN4T/Ux2zqtxLnv2pX0kHbDTuJdRLq/AlanuQITD34R
	YDVtAMRNRj074Rb4QJ6qYhC4ZnVR8bcIYJgYttP57F+y1kdZsh/686O/OKq22UvI0ao/ZvSf/Ej
	0jzc=
X-Received: by 2002:a05:6000:41c9:b0:48e:dee:52bc with SMTP id ffacd0b85a97d-48e384e4205mr1725429f8f.0.1792737586551;
        Thu, 22 Oct 2026 23:39:46 -0700 (PDT)
Received: from [192.168.1.22] (cst-prg-49-173.cust.vodafone.cz. [46.135.49.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38030c47sm3104782f8f.21.2026.10.22.23.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:39:45 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@gmail.com>
X-Google-Original-From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 23 Oct 2026 08:39:28 +0200
Subject: [PATCH v3 03/16] dt-bindings: remoteproc: k3-dsp: Allow
 referencing the timers' power domains
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
Message-Id: <20261023-thames-v3-3-3ab40aa17157@tomeuvizoso.net>
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

A firmware may drive the core's timers, which need their power domains
held; the remoteproc driver does not hold them, so let the DSP node
reference them for a driver that attaches to the running core to hold.

Assisted-by: LLM
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

---

v3:
- Initial version
---
 .../devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
index d6319c8e96f8..80eaef0a19b8 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
@@ -76,6 +76,23 @@ properties:
 # Optional properties:
 # --------------------
 
+  power-domains:
+    description: |
+      Power domains of the SoC timers the running firmware ticks on and
+      times its work out with. The firmware programs these timers itself
+      and makes no power request for them, and the timers' own nodes are
+      reserved for it, so nothing else requests their power; a client
+      driver of the firmware holds them on while it drives the processor.
+      The processor's own power is managed through ti,sci-dev-id, not here.
+    items:
+      - description: power domain of the first timer
+      - description: power domain of the second timer
+
+  power-domain-names:
+    items:
+      - const: timer1
+      - const: timer2
+
   sram:
     minItems: 1
     maxItems: 4

-- 
2.54.0

