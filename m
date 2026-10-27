Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793136738;
	b=tO9SKwNZ/38rI0USGdOTJbHfbdK5TEuKczLjwoUPBszf/AZYIURn/PeTNzo1rxnamax7
	 rMqe2gemPg88Kxj4xBwHf6dY2eYsdUEmHLCqNQ1wOl4hR9tld3wcNz0AEO2e//dZ4x0P+
	 3cxY+My7HiQ+YdsUKPeuibCSAKolAunAPdwGCQAmyawxA+NbJSsPJodrNwBFwXUMopRSn
	 fXhSQz8FKy5i0WXwFzG0WOb52nSZyC5rcIDUGxkTLkT14HVQbRmIksFBdWEoJ9qzUw+BS
	 mkLo6RlntVES2mOlqpjZZNJ/X0d6bHAa8Kxhnj1VC0L8idmz3JidLiAn8Lf75pghIHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793136738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=s8PGc3rV/nkDLjOBf3Blk9H7tWvd1KHQ/b+xwHLjFYE=;
	b=HCQuJzXkac+AfPmv/Y3j95dWcM7i78gFaIRsVaiqhb9Ti65SMiMgJiURiXMNpfzEKABL
	 L8mXfCHe40r8yoX5Gbxq6rEztQuHM+5Jkm6Ouzte8ZWLYEwjVOpntyOsDbgCsKzzqrq1G
	 fEGc94Mq7QW/iHHKHOWhOxEzvkibumY112gnNrIX6s2k9LB938KMQNHlyENwv4CWX2Gi5
	 x5MRkNxCVFcWTYsbthDvY3GZWu7W8pvpkaWzMzGhKperKdIkJ1AbNadaAypl0rCDH3jfJ
	 5ztgH7y+okTsOrvP4fieS/+tKcSkaA1SfquC+EWtzADiGtlUWfmFMAVI8YRWu2vBMTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sjfnSX9T;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E70606A335
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 21:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23E70606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sjfnSX9T
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3550c917fd3so460906eec.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 14:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793136737; x=1793741537; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s8PGc3rV/nkDLjOBf3Blk9H7tWvd1KHQ/b+xwHLjFYE=;
        b=sjfnSX9TUcA+Dwn/QuytXXbxVFg9QT5pJdQjYAD59bkWmVGLRXIfO/xgfmWHhM/OzV
         G0B8nZk4iPGQFtsnfP0wlJxXeTzjUXY/uAoPWCSS4E9DvxIUxlmImpWe/ekR8wGYoO6p
         U77vnURTnZsfv60X4Z9KDo43QTcIdDe/q05Z/8MgiVgXnKc+DO1N6/BqbW6jLXFNleRd
         2RPh9kZb59HvkJpGxKAcuWox3r3sXwE0M1YC9P6P1fyWN2BxWkj/LQxNqTgeDXGlxnhe
         FZ24IZrAoS+2dwE25JBB+L3pS6XPtDztNEgs/BSYpCEzXrCnv/+rEz5m7iUEPu/JZxtT
         REwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793136737; x=1793741537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s8PGc3rV/nkDLjOBf3Blk9H7tWvd1KHQ/b+xwHLjFYE=;
        b=qwN2fVYstUsqbE9MVJ2UcizZxWeDYXbNZ24NL4rnbp791WS3quLE4TpVJgD483HB2U
         lmm2aSRzwmEWYWm3ffhZIB4/06W1PC/EW2SNoS2NlpQ8N7t635IBRVqIqptCQTL9up7P
         TILzgkeAjPFABF/4lcZbDfbB68+pR5Uz05/3CFOjpjf2Sqe7aPRbcl7G1CEAt3iwNdww
         QKnAr5fyCLeZ3FnDVUCxlcRz68mXjku7V7t5kKfu7gtzA44SSIx26XhuHS0OfVsFW5go
         lp9Ul5yUbgSyD4RJ4xkAncyYRp7QuCSYbIYREzYAYiKh0RYSKGrrc93DU5vzRwZiL581
         XgFw==
X-Forwarded-Encrypted: i=1; AKwUvBxV1h9lDj+oFt9pYRgJ/lhQuag8hyxmnmMLtVNB394ESrneA9YwFYFT/c5b7PRAOrKutOxBGG03H3I1@vger.kernel.org
X-Gm-Message-State: AFq9FYIEib4bUk/edJ/caXZU+CN35VVZTyKxehnmlV0saxzPVrWrHIvI
	Tefs2VL05UkiEylC3D+vHCcrtLDb2899SYRLLUQ/OcD+ieodivJCJ+yo
X-Gm-Gg: AYBFou3Uzq6yKm+3KHCrPqG6aie/67U04JvPQa3F/5Zrtsmsinh7Nw0+bePKl6EZlSp
	dgAim6Zf2Q+Zl8hjXsiQIAEs4dfOcyqmgSR7WvLXUGbU03dl1VU/BSSQUxbeXGiZR34wNWrdipQ
	0PVtFHC5yke7ps5oIidy76ZrPI+6qMONSzK5+tqgxbsYqlrXTJWq6Z7OZK5eq50vEt/8q7aF2/e
	Z6ityADM6DtToLX1ltxfWWEYV+pnClHf1QIBgTkzbi0BOoCihC8Aeqfk4y/ytPZEo3hyU7nPMZQ
	Bd4QIiwwuxFrzE/eLtPkyeumeqdrNNbelmBUhJvxccwgF8Y6IL0C1tzE9KFvnL+lrA3467BiVlI
	OvgkYUQKI4m1xyTEfHzYQv0+v2Y4ldsJRbUeZhe/3LT2rrJX2VZJ8eKGVilNUIzIDsinRL+5LAw
	bQzDsxcYqsOliz8betTdaVke8h3R3cJtCvGOjwfvOSBXn4C7g+9TYnVfguIVQq4TzVpnCvoxtd0
	VnVebrgkJbNSbhynbL++B7yvYsFczQP6quSJCyxDAP+RP67cmjcVtNKW3HjCwbemdjlaqDOvTn+
	zLLUmyyYpEZhSIJdlSQufSIFkhZmY7oQIhL4Xo80zQW8
X-Received: by 2002:a05:7301:fa0e:b0:351:1e2e:da4d with SMTP id 5a478bee46e88-36a203d417emr1224861eec.23.1793136737039;
        Tue, 27 Oct 2026 14:32:17 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:9958:9525:7799:82b5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm61693125eec.25.2026.10.27.14.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 14:32:14 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 27 Oct 2026 14:32:09 -0700
Subject: [PATCH v2 2/2] dt-bindings: mfd: twl4030-audio: document preferred
 name for external mute
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
Message-Id: <20261027-twl4030-extmute-v2-2-c7e0c90509a1@gmail.com>
References: <20261027-twl4030-extmute-v2-0-c7e0c90509a1@gmail.com>
In-Reply-To: <20261027-twl4030-extmute-v2-0-c7e0c90509a1@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Peng Fan <peng.fan@nxp.com>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Proper names for GPIOs should use "-gpios" suffix. Now that the
twl4030 codec driver has been converted to use GPIO descriptors in
commit 178c169a30b0 ("ASoC: codec: twl4030: Convert to GPIO
descriptors"), update the binding documentation to list
"ti,hs_extmute-gpios" as the preferred property name and mark
"ti,hs_extmute_gpio" as deprecated.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml b/Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml
index c9c3f7513ad4..399693bed077 100644
--- a/Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml
@@ -39,10 +39,16 @@ properties:
         description:
           Enable the use of an external mute for headset pop reduction.
 
+      ti,hs_extmute-gpios:
+        description:
+          The GPIO specifier for the external mute control.
+        maxItems: 1
+
       ti,hs_extmute_gpio:
         $ref: /schemas/types.yaml#/definitions/phandle-array
         description:
-          The GPIO specifier for the external mute control.
+          Deprecated legacy name for ti,hs_extmute-gpios.
+        deprecated: true
         maxItems: 1
 
       ti,offset_cncl_path:

-- 
2.56.0.307.g5fe7bd680c-goog

