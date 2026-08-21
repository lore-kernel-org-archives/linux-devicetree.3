Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CE540F72E
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 07:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787296353; cv=none; b=AmsqW64MTa4DyJfHBhBrr3sALYeTcs2eqCvsboNdXD32VoTwDGZM7BaV1m5RjrGDTYFDn/ost4ThvSG5CRMn0XM6A8WZX2xffcOQdJLktzRiLNP9IlgVNEjOlSM82eHSxqT18hxWxUKuC4vr4ytvCBPltT47DynNq1RvUbH9p2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787296353; c=relaxed/simple;
	bh=tvgIcEmwbkn7e2pPKun/10FnYGAhaEA1A5qBEsJ80ug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hyQQT9KEe7au2WH1egfROENiecw0HKINm2aSJSCbK/PHW/+EWXN8pajD0z+VUiZOYoDVBx3g6bGVrWyJ5m4DZi3t6cXScIjRBVzTKZEXu8RySHAQxq8CBecVC8dFkfIvdS2Fbo+94sAaEgJXJ+zCInrY94IPKSCVAIaCDUD+TGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=SXH+E/PC; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="SXH+E/PC"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c1c26d7e951so102229466b.0
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 00:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1787296349; x=1787901149; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=csXrgEgazCRDtxpVG8iq7b2VnqPzoGLj29Ecu+sqIh4=;
        b=SXH+E/PCi90IxhbPjZQlYuxqAfaSoDPU/tNf153M9xeht/aUHDwZv4ZvB0vcy5yGLb
         pw12IqvIjeFFBMO8jOuBhWdL9tjMVurOy+lgZcwhRuqcoV6Xns8tvISqUk07dTwLo63g
         My2IrFbBy16JGgDAB9Rt7EV6SCkhovu2RpZPzaIHvTaKdr6wFBAdAnolyhUpC3bzIOhm
         851OGMkdNaeQ1hYyxItr1yztCd+5pnDxF6cLlsOOlQRQfEIb04fxoGMSwbEWO6YOYpva
         w70qVrxuqgbRIKHXvQZmKT+kd27lsREoRwK3ft+UoUeXxVsJkhUFeXNL9CX+vz6YEAg+
         OCjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787296349; x=1787901149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=csXrgEgazCRDtxpVG8iq7b2VnqPzoGLj29Ecu+sqIh4=;
        b=cB43YEm8lps36lonqLYBOf2jiYTbhjW301JnyAJ97g/nU/HMdr1d09uDLg4nOF4gl9
         fVfEL8buIOcgrGoAOSaFAx/VxZtF4J7k+mdN3Ly5U/jkO+Z3MuylYf2UbIy9WNSqmJg4
         J38anCZITYun3veI9G6dGyW4zDIXrH08ChEy/4gXe2o9fiN27t2sghDD1z20HgqtBXFA
         xWsrEkoOtdAL75dS4GTF6PC9pzLIGiDAriCKqXjdDnEczcjF6FunDkEoWIzYkJPez9E4
         gTqOdD0C00TU06vpz5uCraw6E0tNyLi0ac07TEDJx4ZiWH+uUvLE+wbhGKof4j3/GgS7
         kLIg==
X-Forwarded-Encrypted: i=1; AHgh+RpBsGKq3FS+QF7FqU5VWnatz9n0laiPUQvoPS8pyVOWaudTC3d0+tH8rj03/wKckZpxNlp18MQwkBRR@vger.kernel.org
X-Gm-Message-State: AFuF++l0R2E8p5QhBSQD4sDPnbzHzKzB92HO1yRf5PBUZsVghRQdyevu
	d9GbCCPmYfsEk0q6Uv+nkDcOXDq82c2aKgCr8LlVrFYAu+rFAAJAOUe9vFocoDS+L8k=
X-Gm-Gg: AR+sD10IS19c7pSGQ984n+aGgcGaKilzwwBE5xNUbA6ZxvvGMUkDY9mOOzqgOzNzV7l
	YLNkhEo8lOLw6XGcDpzWLoqbdKbaf0TBq/I9ph6fPoqpFS10MausGcErO6DvNJnmUV+slL87ZiW
	IjLU/4HxgFitjNAOhkESh6h5/Y03IOTsFKIKHRluCcUzoxonFRRaFAKcZ1x7gfdgo7tPk6PTWAb
	kubSuHW9G8mhR/Mnp7pC9pXdtPAeLd+NRKG8i6G6de5SV4YhnRpqoQ6AMPfvvyEJEl06R09zqBH
	1Ka73Zscn4endiZPrpRQAIQvj1lREAwso7UNVGjcwhfiZE3+EDwnSzDTspqXgJB5hpZNQBsMZ9g
	WvpfLcMVgaCsFdXfRJ4FYdsGOdlHa7J95vgWSnoB+5CCVUvVvpCnl88cznUKpFQQga3Jg8LFAi4
	qzGfXLIPIWIS4NdtQbOysy5lLc8geRSeirA+cTry9zJpPmmQ6ctxkKQHAIoiUh55ZgwT8taZUQj
	RyDcT1iMbfrKDe/zOl1LRBca6l8xDWch2AHeXVLUbY=
X-Received: by 2002:a17:907:961d:b0:c24:469d:5653 with SMTP id a640c23a62f3a-c246a653373mr384101466b.21.1787296347585;
        Fri, 21 Aug 2026 00:12:27 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24589e04b5sm339431866b.5.2026.08.21.00.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 00:12:27 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 21 Aug 2026 09:12:18 +0200
Subject: [PATCH 1/3] dt-bindings: touchscreen: trivial-touch: Add Himax
 HX83112A
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-fp4-hx83112a-v1-1-474941bd8860@fairphone.com>
References: <20260821-fp4-hx83112a-v1-0-474941bd8860@fairphone.com>
In-Reply-To: <20260821-fp4-hx83112a-v1-0-474941bd8860@fairphone.com>
To: Job Noorman <job@noorman.info>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787296346; l=1037;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=tvgIcEmwbkn7e2pPKun/10FnYGAhaEA1A5qBEsJ80ug=;
 b=5UI9BRap8wYkbwAe4UYWWdiFDrjr2MCLWHh+epySaUfuTZuusa3nS5sWs8RdUGwP9akCuISd7
 BhB+PXXHX/BBwllIwqdRqub7ah+wgkBTgqZCRFQekyjkihxPc1LYIKO
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Describe the compatible for the Himax HX83112A touchscreen controller,
which doesn't need any special resources not described in the
trivial-touch bindings.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml b/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
index 6316a8d32f39..a4b535bdbd6c 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
@@ -18,6 +18,8 @@ properties:
       - azoteq,iqs525
       # Himax hx83100a touchscreen controller
       - himax,hx83100a
+      # Himax hx83112a touchscreen controller
+      - himax,hx83112a
       # Himax hx83112b touchscreen controller
       - himax,hx83112b
       # Hynitron cstxxx series touchscreen controller

-- 
2.55.0

