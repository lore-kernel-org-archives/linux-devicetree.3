Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920261;
	b=TAClAVYCDV2am/t58/Bgqh04gLvuHuWCtYAHIXofsUC9lpBF0XE65nZIQvgJnQ/36UFk
	 tlDVyi6nBuWxvKUEEpsbUzO2q/1azvvCH+uWLnGblIxWrWhTEGCb9QKGl4+Cj+p0AfSJT
	 VxUT5wEycWmISDr+QtCO11SaGOmapwaoBn6pOCFGmlFWWTnT+3fyOThg+2J7y1XSnGfOJ
	 yGjaYN54q7KMTTctXrE2Yb17O4cJtL8wkQtDgtuLk34mCQZYxSanhhM7G+BW9IpOYe1tj
	 WIUavPlKVqN816idLjfKsAp69cCL/u4LNOfT2eAoHeOsWdXsKfaJkkh3RC3bmSP7k9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920261;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=pq4AjLVwM19r78cOmsBTZmnW52I4hS/grHAe4MpsVsY=;
	b=PGhtVgGNOM18e2UjhA05cdtTfJSyLKVfUMGDh+bUMn053qG0LaILXt8z8FbPoJ9fx5bZ
	 Pstxc/sIfxtj3YMcFixDvli1UzNsGJZNJmVsTdIYZ2m1R1fghXmelRP5R195eY2n5AKb0
	 ejlAoBC6zlL5uOABiBennX2KwdC+mItzLQdcCqJSNTyRQERDfsgkyIEbN9xTnPJXp5oEB
	 Y5s8affFY/L9pPC9zsEiGuSgEtOyMsMo9AA3+7xb6KwEuwfSRG6fhXPXM2/Rhc7PrDLIs
	 ZwAgO174J2ot5mJByaQwpJPrf3dPPrIEROqsMpSeUBZVTk7q5/nolfgKsAN7rJsiV2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=hqbGnlds;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85D5606A88C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 12:57:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A85D5606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=hqbGnlds
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3282db206d3so12535020eec.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 04:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794920260; x=1795525060; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pq4AjLVwM19r78cOmsBTZmnW52I4hS/grHAe4MpsVsY=;
        b=hqbGnldsRnNYQeeJ/LsOxnTjKzWYSBL3+tdT7EhSLvinL0tTzRB6p340IkMHV/b3t1
         p8/5oMc7sOgO/k69d6xeQro9UlUOwxjJKD15HyuuLNvAf04ZelbrXzHWZmx2bj/IcNqb
         cv3r6vpnls1OJYtYo08cymmRO1BTkKmpPodoTARMRyAmGkuYRbQhfi5sCQDDgmooPoz0
         pBuu4RHR43lRX2EN8FIdUYHT6ogk4bILpwK6NYjanSs1FH22geOZ7WOrNlYBSS1/CMRF
         Cbuz9xIvdlZJbSAtn9XQbeqOPkQC0cW2XmQDM/LWud6OFk8cIKUlHmhG0rmb/Tu/pCQg
         CxQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920260; x=1795525060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pq4AjLVwM19r78cOmsBTZmnW52I4hS/grHAe4MpsVsY=;
        b=lVFjgouQ+H39o3QIoGLRcH94JmPN2PFgBD/jGfuYIO6HwrqS4IJXmTQwQHQrwA4TeX
         4S1d6NOrvTb2t2onbbtAqfILDsKd459Wi0UcyIdjmc+VGcC9vtsbueM55l974KST6P/5
         6sxtX11//aWR1QzhUUak/RD5ijFQajAH758zVICZQ8pzD0QYIc63i2N0BhLfDG8BlM6n
         +2trQMksGtzV/l5ckrObc5oGmt9koQvc/oEFzalPh0gpNQAk5REXEU/KNOWhMnp5d3bj
         jwdufDQgoTXHTcLtFFw0JGD3gDwjad1KnEW99x8TiIR9T5gQmf4lxJEyAEHY0r9RmER3
         Caxg==
X-Forwarded-Encrypted: i=1; AL+hErEkuGWQuY3W8MUEcMQnlohbrENLUjTIeJzD23lN+UppiPlTwkC1XLXWUgye/2BMBXPoaSvYohkvnGya@vger.kernel.org
X-Gm-Message-State: APuU4Z+QktNZjvJ/mvDzvo4sHFdB9rRv7RW20Qpjh698X/rniPJjcHWc
	YP0rGL/2uxFdUeoBccvIK7ICCkacsO9nUpXenjvMFDi+Ji8w4y24SkynBXGZZ7liKlk=
X-Gm-Gg: AZFdTZchAJEIvyEUv4rlmph4DcfH2rgMWKbVk5ftKqbuRC55nsruCe0dmDNGQhzGPQM
	R31Y1JUTNXTQO8+Xncbdf7Glip2X8WwBe7QDth29N/FX9kSvruvAJgSR8GzdFjJ281uQTr+OZsn
	pDq2RwBYsJTohkUCGdFr0p7qe/6KAPU1g65kKjsbCPIDz/mzjNHtXlOfQSuRcBZ1tcbMBOFbhXj
	V5c0m9lpLpwdCGkNWYcvh7vShrBU7UMl/PgJqTc6SDOtQdwq6N+vzdlHMXAUWE+4OY/XGKT2Lyf
	DId5uw3OBDHNYM5dbwOr0IKGf3vmj7lFxP/y2Hows18IsQTnC+CAEQQrQ99XaqgGz/iezG0b5xC
	HxoZM+HXCrYSK2DScVtUKXz3Mg/Pgu/oLFHZnmiYlxtAYqBmARAhLd3tNsmJ0sNw+77iJ8y9/Ua
	OFQ8hnw62Qg36O7LcJZ5+FVOLVCYGk3PzSgh9bzX7K/T/AvZlSw1AUhsY/nPgEjomyKjBdKw74u
	qzCVOl6OQkCdd1TZcmQbVet+nV63T9lehIe9MyDPpqDRZeFQUGDS569Zar1YHLhFtpFTK6Uvbcn
	ejUwx5dht2nS7ThZIU5NvZyqigOa8VWV3/5N8TOh3tSTVhbohGXBrosIK0rS6Mtuzq2q
X-Received: by 2002:a05:693c:60ce:b0:36e:8410:ecf6 with SMTP id 5a478bee46e88-37966387d74mr15512381eec.13.1794920259546;
        Tue, 17 Nov 2026 04:57:39 -0800 (PST)
Received: from [127.0.1.1] ([2804:14c:4c5:8bf0::a1aa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379559189e8sm44767034eec.11.2026.11.17.04.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:57:39 -0800 (PST)
From: Hiago De Franco <hfranco@baylibre.com>
Date: Tue, 17 Nov 2026 09:57:13 -0300
Subject: [PATCH 1/3] dt-bindings: pwm: sophgo: add PWM controller for
 CV1800B
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
Message-Id: <20261117-milkv-duo-pwm-v1-1-3f1786ea57b7@baylibre.com>
References: <20261117-milkv-duo-pwm-v1-0-3f1786ea57b7@baylibre.com>
In-Reply-To: <20261117-milkv-duo-pwm-v1-0-3f1786ea57b7@baylibre.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Chen Wang <unicorn_wang@outlook.com>, linux-pwm@vger.kernel.org, 
 devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Mailer: b4 0.16.0

The Sophgo CV1800B SoC has four PWM controller instances that are
derived from the controllers found on the SG2042 and SG2044 SoCs.

Add the "sophgo,cv1800b-pwm" compatible string and update the binding
title to cover all supported SoCs.

Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
 Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
index e0e91aa237ec..11544b47c1b3 100644
--- a/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/pwm/sophgo,sg2042-pwm.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Sophgo SG2042 PWM controller
+title: Sophgo SG2042/SG2044/CV1800B PWM controller
 
 maintainers:
   - Chen Wang <unicorn_wang@outlook.com>
@@ -18,6 +18,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - sophgo,cv1800b-pwm
       - sophgo,sg2042-pwm
       - sophgo,sg2044-pwm
 

-- 
2.53.0

