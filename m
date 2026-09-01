Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4313B3890
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 21:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788298955; cv=none; b=tV7birOfOyrujfJZHPtwP0nCzgaH0MQeTHIjBI51yC5RbZNndSlvyxFGpBWt3I76I3WK0zT2sx/V4OaiQ/bSgmPhFLHq5Hyk41zfqdpIWghxAz70bq3/xHI6RRaWvJHnuRX1FUoMJch9S0iwrUPNR+C81IogXa1Su0xUbHnMEq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788298955; c=relaxed/simple;
	bh=JPUA3viflQ2v9uEzqZ95Rm337zpwh6hXrUk2Yg+PzV8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NqbZrxtVV03psFXrLWRciWMlDmLMXzkPdGJO0c8PpjArRrISZu5gBIn48EvfP4TIyhaU3ydUxvKn5fo7owC6NrgluP7LYsoqOcgMN/3SprnHG4542EZUUzHqJ9iZ8XnakApI2IgGSXZlKEdaM3kFnr8XT7jCfnaAjuWqFoVXyPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P02ltant; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P02ltant"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-46ad7304688so1684066fac.0
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 14:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788298953; x=1788903753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F+NmUzFRKeuEQ7M+1ibV0+Pzn+8gHlXWcUZ2COu4Ht4=;
        b=P02ltantu8oshKZx4o9a1xUnDYuKblvHDHy+YNGvhEPpwpmIO9JaWHP2XDXpg8QpAx
         Kmg6Zo9rO1JeLJfEltpVgzrJSU58i6DjzOnWg4sp1Wuoo48K82TI3+3JIWQU5zDz8rIU
         j+wXa4awoJHrC1xqRbTPVDMjTnB4EbKyIzX0Ar/u5evhkTFePKY8/2fUuN7UMuTb4CMO
         T3jDgt1zMw2j6qk8jOtfVPIXvwR0MyrE9DBcVovjIM8Tj1LkJ1G+DbyV1aEWLXJtq7Hm
         YMHIylHtwTp49IsQxtQ3JxYQO7Nl8gJIb/AZDNn2pBKPAD6YC7RAftFqaK+fq1LN9b22
         qAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788298953; x=1788903753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F+NmUzFRKeuEQ7M+1ibV0+Pzn+8gHlXWcUZ2COu4Ht4=;
        b=RRIznvZPPDstOjr78y4TrL3Ksxc1uOAPgTFH6vFe0eje7+l2bRnrmE+nEQBJdxV+tI
         HYmf+TSQwgUuoGOCjCjAhcWyGJcQWjSX6FTeVho4ka9/WcdtyOaIq0Pj9GMR0dpyhPlF
         p4NnUj+DTNRFkTTIbG6MGEi5NendarFBw05cXfhiKgFm5pfbyd5mf8xlMK4L+8nRxGeT
         syhWXqBOjsiL1Id53luMlAHwF/78us+8iuReGqKP7FNRIpKFI0NXgreTurcOfLosjkqd
         kHpXFqv5UbqTTd8kYRdkhpjAZvv0Pcm6uj8B3Yv/Vu9RHkWxKRi8G77R+wWZZgzS7UuK
         xG1Q==
X-Forwarded-Encrypted: i=1; AHgh+RqBw3/98BiS1n5M4vDgdLcNJWaBRphPA3eKw9RRXMXRV2C6lNkt2M8Pj0Th2XitjFjjoZLxf8VJGHrE@vger.kernel.org
X-Gm-Message-State: AFuF++lZLaw8aCW7x2DpEEgcjytvEow/AdNkMf8owxRmbMApBWQHEoNA
	fQzxJJsfL22sr6cf6cFlWDVzsTm8WtmgSezXpOTEXW4yLtBez7QnMiU8
X-Gm-Gg: AR+sD10ltboNKD/H3tWlRp9V29ETzDLFLpG8/uzjM55Hz7X3XPITWLcvGVA4gU/6e/t
	9sHTv5M3ujzEXIek9sr1UWx/Q6imIvramBHFx8M5Z1Ml44C/NG6dXFuJ+uxDJIZxi0xa2L/RSyN
	vLAyzovCw9z/wjZ+g/jY13u7wrCc084BFFe0W4XAM6rVdYlYdogjbVUigRAgEV2F4THcZzcgw0p
	gLZtz45pwspckb/2GCNYubgLSyx4olGLQ1DI3DL3Z+UBKCJNFYKXfAKobmyJgGIOuNIWdOCuIG1
	2vXGaXBKboAb4rwQmcjC9sOSyVJF+gnYfAO3ddUUkgY8XltASCwaUUDNGDqFFkfyfVKI9t2EoHU
	x9on2k4nTMgY8HZ8rwFVhb/gCVtlZw82kFXfTlsNykNp4MBL201thgyB6qM+unY45+X4Hem8lvD
	m4IKUy5LLxVWcjKeJQdVaDpgjmTmpxjqD6udsVuVymY15aFuIRKIgRo7/uMdTLAaKDXJ2K6TO+6
	04AHabtLRD/zcSf0Z95Eq+lsb0bv6JeRc3M0eI3ELBaG9Leay5yzU59gI2H72Kvx0zL55g1OROn
	fbKvPHBHuNItn1lth5VzU2AtCtIkeYJ1dut9DECyZ726hA==
X-Received: by 2002:a05:6820:f012:b0:6b1:a812:988a with SMTP id 006d021491bc7-6b4716950fdmr99940eaf.6.1788298953204;
        Tue, 01 Sep 2026 14:42:33 -0700 (PDT)
Received: from [127.0.1.1] (140-186-136-19-dynamic.midco.net. [140.186.136.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b40ba648f6sm1094703eaf.2.2026.09.01.14.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 14:42:32 -0700 (PDT)
From: Robert Nelson <robertcnelson@gmail.com>
Date: Tue, 01 Sep 2026 16:42:21 -0500
Subject: [PATCH 1/3] dt-bindings: omap: Add BeagleBone Black RevD
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-v7-3-rc1-beaglebone-black-revd-v1-1-f521950b777a@gmail.com>
References: <20260901-v7-3-rc1-beaglebone-black-revd-v1-0-f521950b777a@gmail.com>
In-Reply-To: <20260901-v7-3-rc1-beaglebone-black-revd-v1-0-f521950b777a@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jason Kridner <jkridner@beagleboard.org>, 
 Deepak Khatri <lorforlinux@beagleboard.org>, 
 Ayush Singh <ayush@beagleboard.org>, 
 Robert Nelson <robertcnelson@gmail.com>
X-Mailer: b4 0.15.2

Document the beagle,am335x-bone-black-revd compatible string in the
appropriate place within the omap family binding file.

Signed-off-by: Robert Nelson <robertcnelson@gmail.com>
---
 Documentation/devicetree/bindings/arm/ti/omap.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
index f694dcbf2348..9666c455628d 100644
--- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
@@ -104,6 +104,7 @@ properties:
       - description: TI AM33 based platform
         items:
           - enum:
+              - beagle,am335x-bone-black-revd
               - compulab,cm-t335
               - moxa,uc-8100-me-t
               - novatech,am335x-lxm

-- 
2.55.0

