Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792436492;
	b=LJHUnJxSkKVxxJ4MbwcT+b+lLIz54iZeOleCjDmnvkfuL6ZKTD5VgCi9sY64uOupS3Nf
	 DjrA1/oJP+3L7C0mMXI4mLKzHkaZqokNFb+R64gSqEqwvFBzccj6sb6Vpq1rtQHkDl9Dw
	 E0wZ1g5mzptw1iFfwM6PrTqZ3GAQfLzWqKi6ZX//cf2+VzBCGKDj3nZsrprrEisRaHrJc
	 siB50iHofuKtBRs+oBv9G8Wl7agA0psyxlV4WFl9uZ0QQqxBS4+O4NkN6uEEnhoYkImUQ
	 ZgOU6c/L8TrMq9+/KNCCeTkecnxwqAQoKNeg5/0bLcqtfB519mFkIDg+k/bqSG+RQNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792436492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ssNnql6T4QoOjXfpwZ5XX0q7jJl54eqkrFJ3D8Kx+tc=;
	b=q83R01iLht18/JK2+kfRqnEOGgFSZndH5I9frSHMA0f7R33rTf62TK26LlNmza4ak1Nw
	 A6aLHC29EutxjjwKKw3ldgCbAwr2cu6rmKwjrI6B5Iu3+I2r7lnWwP8ns41Wpe/y5FPCR
	 2b5y8Ve112sqybP31qs7eYKtK/TgZG84wlc56iSKZN6kM7R4ms9YYJpJCwro9A1ff24xL
	 ml+76+YblpoKdTOCEFCdTRziAUdzvVPQITL8qtNJkNX7Oo+hezZw5ZmNpXMniBHDscLAj
	 h2EKpWVmzcpHvlhUSeEfB1wErsBhqMAZA8PzK86QJM2F8xUvpwF6cFC0fXyp0kwS2Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cRYpaBTM;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA395606A327
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 19:01:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA395606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cRYpaBTM
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e9995ce866so18322855ad.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 12:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792436491; x=1793041291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ssNnql6T4QoOjXfpwZ5XX0q7jJl54eqkrFJ3D8Kx+tc=;
        b=cRYpaBTMVC7XVXSau9iQnNb982otn5J294NaNijuz0X4dHP9n0KRgvYCrOplTS5aBb
         QNtAHSxHVdqETcgFENkX00iuJS60yVQO36lr6lyNUs5Ej+Qd7WqPb8JUoXieKTCCu/1R
         qJufzAwS5wu0jOzMVbtHU+oqZexlZf/2UYxKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792436491; x=1793041291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ssNnql6T4QoOjXfpwZ5XX0q7jJl54eqkrFJ3D8Kx+tc=;
        b=e3K5PXB4Luv2KEDhM4AYNNHEotNVGTj1Ik6v1uPtqkhFDV2vv9JZRD15klonXzRIB/
         YbeJtakf8khmnAWjlQwkPd/XXe5pcctMReO9wVFMTJtRc3k96fjTAiYm4eUQ5N8mVrih
         LBtwc92cAxb8DBRONM0LomB8zR53TD5pf6CLjNzi5ybgY4ThZaSQZOLlGKUHbXDUbbyo
         GGcO6CPLs9ujyUzr1GvOkjOCjTH0x/ERrV9aLRNrm4uXV4O3IOVyqCfFUnDsQSvrz8Y+
         mhkSPTjMOGsxHMYsSLf03iFZSid+bPhIwr+FKVlnPo7q5RwHKVRj5eRSJ7XRStRAkDZm
         24tg==
X-Forwarded-Encrypted: i=1; AKwUvByQUQZVaYORv4Rfgg3buOxe+x1kG4+p8EOaYJYPwP6e/Q/lruabSoQvkwEGLmKTh6LtJdgBcs9jKnjC@vger.kernel.org
X-Gm-Message-State: AFq9FYJgVaxeb7c42vpqjaSuTmFJerLYOsW6AAWfFyFK3Dov314wcpee
	9a9OAqBZbf/TsXBNzX/YbazX7mnVxxDoUKjcUrLouTnsM8ExwTuwdyA4sKsq7g1lLA==
X-Gm-Gg: AYBFou0LHCDJfoAOIxDISpwxwyxG3BnR/BHeilzvu3FkIFb4C7FOZ/HuHSVoPMckS2t
	S4pMOHH6P/RKjbvmqG1D+DI7gk7MJg5FuVbEkpp0neSyDlWZG7Ajz+cTTKzIf68j0nTTQmRrqhs
	shFv/rYu/MEJnHPOVIqZULShX6YUkB4A41Hab/p1Dg5v0LH7qOnqfNHztAs+p17oQKuSD30uipm
	AOTb9BOYU3vBnFgyhj200mM7yZnzMApA6FdUwEv4VKuASuLAEBEBygWilBiyD7d2gR5R1sdXmyi
	dyoc9Nlc87fgu78UcPNsxAWBJre7iJ0pKktlhF9MJQg0VHolbn0Sn/CFHbrMHXr9Bb9piD8sTlk
	TRp/2wN/xQex/EdYSNA7y0ya+Wn9MQoSPWbiI5sGCNbsgUFYLRXdZgtjESG9RIFl7LSACu0I2c8
	1SM/vRq7CUNNVa5hvGrVlCAzj8nvrMzKbWvPAQCycVp84nJKcqeiXo6P8E1kvx07X/wR1EPR4ZB
	g86s9wNEATJQ2ehlRFi9flHTQc6l1T1Cb5mDAnx1q+LR0gjeThnEeRn5f5pK47EV+jvjUYWD+Fy
	EOJz4A==
X-Received: by 2002:a17:903:22c6:b0:2e4:b37a:d583 with SMTP id d9443c01a7336-2e9a6d367b9mr71528345ad.61.1792436491064;
        Mon, 19 Oct 2026 12:01:31 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (218.117.230.35.bc.googleusercontent.com. [35.230.117.218])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea151e1b7esm4473105ad.75.2026.10.19.12.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 12:01:30 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Mon, 19 Oct 2026 19:01:13 +0000
Subject: [PATCH v6 01/11] Documentation: Correction in HID output_report
 callback description.
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
Message-Id: <20261019-send-upstream-v6-1-cb9ba4b3d6fa@chromium.org>
References: <20261019-send-upstream-v6-0-cb9ba4b3d6fa@chromium.org>
In-Reply-To: <20261019-send-upstream-v6-0-cb9ba4b3d6fa@chromium.org>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 hbarnor@chromium.org, tfiga@chromium.org, fqwqf@fqwqf.xyz, daleyo@gmail.com, 
 Jingyuan Liang <jingyliang@chromium.org>, 
 Jarrett Schultz <jaschultz@microsoft.com>, 
 Dmitry Antipov <dmanti@microsoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792436487; l=1212;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=3F0PUGRvwtvEKibOIad7sMQuPUN5v644d10H48NGstE=;
 b=oNrr9I9JcmB+rovcLexc52aW/JcbxtVxrpwrTYSTNrVT9zSgQ72OmH3qacvYoupyivVC/2ZPi
 FOYyp9GlaJNCdYZ/PxNSjL5MCAqvSVv1uPmyoBi0jqFRO7HCzmMYTCH
X-Developer-Key: i=jingyliang@chromium.org; a=ed25519;
 pk=VTYSdqslTtYOjWWoIGgYoWupGWqNSidrggReKMgfPo4=

From: Jarrett Schultz <jaschultz@microsoft.com>

Originally output_report callback was described as must-be asynchronous,
but that is not the case in some implementations, namely i2c-hid.
Correct the documentation to say that it may be asynchronous.

Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
---
 Documentation/hid/hid-transport.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/hid/hid-transport.rst b/Documentation/hid/hid-transport.rst
index 6f1692da296c..2008cf432af1 100644
--- a/Documentation/hid/hid-transport.rst
+++ b/Documentation/hid/hid-transport.rst
@@ -327,8 +327,8 @@ The available HID callbacks are:
 
    Send raw output report via intr channel. Used by some HID device drivers
    which require high throughput for outgoing requests on the intr channel. This
-   must not cause SET_REPORT calls! This must be implemented as asynchronous
-   output report on the intr channel!
+   must not cause SET_REPORT calls! This call might be asynchronous, so the
+   caller should not expect an immediate response!
 
    ::
 

-- 
2.56.0.212.g129ede20d9-goog

