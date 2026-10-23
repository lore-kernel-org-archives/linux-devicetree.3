Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737585;
	b=5QZLhK8HZewTlGJ2Pvo5DF/nFojl6ddKWHyWvTl8VECSdYTGUpkaqjc1C94o+m1/wsDL
	 N+yUgRRNmofaYB2ZPIfdtZSD78I78pDX/QUR4CzLdXY67iuzy1Wg2ovxxVXOUVGi7QrsC
	 +ywVT2B9lwzBfIB7UXGULAbkO7zXfFFwcvhVGEuU/tfLfeKwFfBBGY8WQMAv+FAnl6kpM
	 JHMlmwqDppAAuoCVMtMzuz+nevSnBvz2vTzEc/gFURBTrHhlFOn3qFBRbbCRiwmoxT0mE
	 6Ojn2+DPWQDu+qbFVHwveiu1266VqrVCErwjJqOJUnUFsWgYha7feTmjk35cnFCzQzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=zCs0TMoU/xtdfW2o//Qc3w2kO9KE9uGMF0SrdJknZZc=;
	b=u1H/2xs7DBO7G6EkeyjHYNNQFlC04nsSuJ45u7CO0VGiq+IyD3+LikDjvuQ8t3Xq5Wsk
	 8C1NP80PzuLz1y9ePnXEOTeADjzWwuXAXa2I8HCencNQO6ccy/l1mE7VYVXHtF1HtfUEM
	 XG0U4wL8j5iJtUgdNQJyBFSXHFchXLP6znNnKaLlybV8SKvlIcS+N4UZ8vX5Hjc9Z7Ldb
	 mdc5ecX+lk8hoL9L4RHFnf1l1sI/0DWVPqYtNmUDseoqqPbirAbCM6vOwSMAsFZCuZ0tN
	 8ppegfcFZCIGP9iS6kGIawwXGkuvu/jejzGoAd1X0cfxfiMoPoTl+UQ1cLgW3C4ZMfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K5gmrOYj;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45537606A31F
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 06:39:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45537606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K5gmrOYj
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-487049569b6so254219f8f.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 23:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792737584; x=1793342384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zCs0TMoU/xtdfW2o//Qc3w2kO9KE9uGMF0SrdJknZZc=;
        b=K5gmrOYj3tl5gpqCrSw9ozcnETPEC4k8tihxf6zDQDJzO6W1ugLAFbGbsv9Cz/MxUB
         quIUfAE6oCPFSLcX8P+JtzAwqC/EvVQVqVldkQtMgEtTOx+hyvg8NvWOS4XYCf7ud8/o
         Gzc0esoT6mvjMChNOgbAm9m7/Zm3rnihd7W0X1kADDuHzZZYih0caal6tQPHJOejfhVK
         K2BbjC/G+1p6cfFAnupiIBsCBTQOgMBNzgIf/8rwbqnvo+qua43tmcZ9lsB9uE0vJbXz
         TBLYu0YNtvQan1lTxqxqkmOEetHMR1uVhpgkfELL7ASKGJziVeEfwDGBOoqAdY7h9Fsl
         950g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737584; x=1793342384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zCs0TMoU/xtdfW2o//Qc3w2kO9KE9uGMF0SrdJknZZc=;
        b=reIr4Un/dhtzNvbcSwyA6R0lvZM+JHgSgYTx/EtjTOZLWsH0IhtM3QYm2Xon+kWn/u
         XwjjiT27Q1gmKGoV1hn3p2Bq/8srd1URUft8u6cTfv5wmv/Z+Rb+n9ieQCwm/S2xIgBd
         lLmteFERD6ilyJtI/dwPgIgcKj5QCqJxNMLxzNFDdqPEAilrqcSdbS4egCi/sedDEDld
         HpF65JIvXT0v8F0L51L3z05aChGJI7qWG8Q8/IFM5kB0kAJPIUh+fFDBYUfinStIyRzd
         t0ZIJ5yDIFW6FP7Sz7nVZ5SSEWDGTnoxFBWsnx9R27iB9vMtvZxh8K0pts1ekwP1qAPp
         7Tbw==
X-Forwarded-Encrypted: i=1; AKwUvBzGVH/hALrXwdCjWP3E2iMz7qsJXd2UP/vXo097tQYgVHNBJZna7derBlsk3oKzixOYD1TqRSAJ0Y2c@vger.kernel.org
X-Gm-Message-State: AFq9FYLXy1lIMaSUjNEEAUEVl0Sbdef4Dtl4ZhuCAzySVUyOaRItYFTf
	okN62oJzLGegZvWupnf48UbZxtbTnaQVuCfx/1QneT/sVvgtkveFbhu3
X-Gm-Gg: AYBFou3AadOrwt76MYv9rYm/kgD1kzTksU0NcXlVR6Xvp+RkRrFmHTvrCrq9VxozHya
	0lq7MfIGwAc5Su403g6VDS8EbPLfDXRact7m2xVxNE8XFAHHHRI/daN4y1RY0G2QY+VZ1fxQ7rk
	Nntg9g2VSIrAPkg9VHPGiodaGvHEqqkU1w9anwBSWNLgfvJlo9xzxUbPbS3XihCg9QcmqTV+qkN
	kfQaKSxASPu14EdN2P8aLW0aVaLPFwSEPottKLP4syw5Vl5p5eN8SJLHpLo13VXB67xu+xSDMqi
	zX7gBiMMwHvIluZkfnePyM+5B53BiTN2UFEzv9ZI7BwgR0uRCPfHl4m1TUDgENSI2c0kHd7bMAW
	yZnas+N3PhhATsknapuxr/CMitL8xAwUSyz7RGTE1sbl4UzC7dp/wLFguyIr2MwD8zdJXDgJb8R
	D8eaaXktp1aQBfj2d0HXonDCQrj7hcvxErLHDKHhEd9UczS4zM7/NFLvDEh8XsibEXLvi/HYSFC
	LhIE2LxyxpAAWNnQCNy2BoAeXh134BCyzIDtRSArdMZNCJC3pn3WCYhnJGSx1WgC7KgLGcTjePe
	6TMWint3+o9bQ3JAgs0uqRHexvpvgqOWrdDNomIlSRVrxmtY+Atkm59lhU1TkBSsCl1YL9jJsrs
	u0TQ=
X-Received: by 2002:a05:6000:15d9:b0:48d:ff0d:cfa5 with SMTP id ffacd0b85a97d-48e385b9322mr977703f8f.47.1792737583628;
        Thu, 22 Oct 2026 23:39:43 -0700 (PDT)
Received: from [192.168.1.22] (cst-prg-49-173.cust.vodafone.cz. [46.135.49.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38030c47sm3104782f8f.21.2026.10.22.23.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:39:42 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@gmail.com>
X-Google-Original-From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 23 Oct 2026 08:39:27 +0200
Subject: [PATCH v3 02/16] dt-bindings: remoteproc: k3-dsp: Allow a second
 sub-mailbox
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
Message-Id: <20261023-thames-v3-2-3ab40aa17157@tomeuvizoso.net>
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

Allow specifying a second sub-mailbox that could be used by the firmware
in addition to the first one, which is taken by remoteproc.

This is required by firmware that doesn't use rpmsg for their
communication with the Linux kernel.

Assisted-by: LLM
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

---

v3:
- Initial version
---
 .../devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml        | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
index 278b88b7f906..d6319c8e96f8 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
@@ -51,10 +51,12 @@ properties:
 
   mboxes:
     description: |
-      OMAP Mailbox specifier denoting the sub-mailbox, to be used for
-      communication with the remote processor. This property should match
-      with the sub-mailbox node used in the firmware image.
-    maxItems: 1
+      OMAP Mailbox specifiers denoting the sub-mailboxes allotted to
+      communication with the remote processor. The first is the one the
+      remoteproc core uses and should match the sub-mailbox node used in the
+      firmware image. The second is optional.
+    minItems: 1
+    maxItems: 2
 
   memory-region:
     minItems: 2

-- 
2.54.0

