Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3207143C7D5
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784223374; cv=none; b=jGKrSnOVqyBRFxSt1WmxfyrvPtsPVMQxjmT5sjUS2qThgK8c1NKyq5k/c4ayy0u9R6gScShCbQwbNWjZIpvNsKnDw6IXJoq9vRhV5qAemZM4aY7ewJXpl/2ObQi7M5izgcBLNX5JKP/QV/u5EHQaa+E11gZYSnyZGigac/S96U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784223374; c=relaxed/simple;
	bh=bc5QG0qfOT3JkuoLEz2SVAqPbdoa62KjYYqYrd/+rEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dzTQVlPSRr7xpOD7pqjhyDjDtNOXdvhaoRZ3kIr5+vdnj/4I2y9+vw3mXBXz/ZlP9Y3jwaTuqYu1OarbmTk0X51arQySy6T1aMCR7m29ebvvepPrGqBQ2lGfPrGl+euq37kcH6IcD1sIe3zAVx+WWYo8dpZWRkyJcjqGvqmXPp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2I4Awai; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2I4Awai"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4759b4f0897so2044908f8f.1
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 10:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784223371; x=1784828171; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dFLXNqHsnzDqTBRxYwiZ9Q7DvX7sx+x3Mwjt1PQZnaw=;
        b=F2I4Awaiwf1CdU88dbTwtfeGZG9WhcZgwygT1rUu0vHN3qnXGwzY9tBRXXVvAzC3yO
         JGiwyFAca3ghSkyEV39qc9pLA+B1bFmU3bJ0l8z9WVfV50piKq9kWiK9rrUvjxJunnME
         WmVJS9/KDF6xZftwTXlEsbCztY3kcvQhqxlkVbJ/tph7x1nNwKwAsDA2G6FszaVe6nHM
         86p7tg/SZLUl//AVb8uPgbeBSkMiqz23rGb9xg8wNEzf6m/THluvvXvCvoo4XC2SzjFb
         Ly9AcSK5/QX87zu4IKM9Zef/9mzOnaMeYso8nwxUccVhBUJtwoxFawJO9OGCfOlnRgNz
         E4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784223371; x=1784828171;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dFLXNqHsnzDqTBRxYwiZ9Q7DvX7sx+x3Mwjt1PQZnaw=;
        b=oHFx9fehu0WHWJrzmwnPEqxF7az3NxgxLlJRAaOzRHNhevDP1c/+8h0cPhky8Z5G/5
         j7DmVT+KvKyYCvv6w8//eW7Ku35N7kMhJuuw7T49Oj8asGStoSLRcmmGMi6KiUhXoMLi
         iWcNS684Xk4v4rzxE9sB+e+edMFGWJI6bw+SiJuFUdZ4+F9hC99LEdma4Bm8UOWvnm7Y
         p92UAkcIx9HV8Jxo1DT8TV9vcDGshqXYC4af4SbSjcAc4Kd8TaSsR9L7XRq4qLg74bOz
         WQGE+4rRBUN02YL8q3VreP7vEZ/YTh6cOm+CzlzvR1QjKLD+ZasGHZF2CzMvc4raQzaK
         WrEA==
X-Forwarded-Encrypted: i=1; AHgh+RqqXxOClygo0lMiNLhsSSfruSxUF//4DOQ72z1sA5y9gNTKMF96xrI7KcAjLmo/shvRHP7W6Lb/CvQu@vger.kernel.org
X-Gm-Message-State: AOJu0YzViyEpSKbm8OYJp+1zLzr60xGbxGmlM840ESfeFSwSNj5JUis6
	oh/tCcHyFHO2jyPOiJFXSPsAwfasRZ0L88/r2P/e73hTZLqtRC0VhPZX
X-Gm-Gg: AfdE7cm8u9aaWEPPDvo0d5nlhGd7zuJieNs3+KKwz4GG/EjHLXPxL+sqbaFwvH4mRuY
	/2wUMVgzdxWfnFb5BFm3r7CRXTCJh5lzb2OqRWhc84iSF9nxJ/3KvlSs66LuTcPgfYjpVJs4uCO
	UgLqH1oV/DjkkPBkyCiGJeAFb9lzxEZiiQp1sMOe8oczDjNh23aXqIHhYXseQwnweO4V/n5rNs4
	BuKej0v3wWiW7/vukC0tbIQtk2ST2deVQCd5zIBIBZKMyiUZCw5xz66xgLkdElbwRFMScvWUSpP
	3tZ28ivqV0BISujwfPOAjU9/mTNq4B7i0ILnsh+HgNY3kW3mCaGOz7/b7PyT2vzCiPuoCEXKV6V
	ZeJ8yfNV9nA5Qtk4CGuhHTaP0e3F5AymcVqFgMSumxPjRWXUxkclkvG+jvrnwOZs6WxWx8I4P1U
	aHzrazmmNOrQdEJ4MJwr8s7MhMpU4nEQFS5/lADVWNQ601gSHWtmGQsq28Eu0Gw9bkEBw=
X-Received: by 2002:a05:600c:8b4b:b0:495:3dd7:ef06 with SMTP id 5b1f17b1804b1-4954839f167mr3249535e9.12.1784223371240;
        Thu, 16 Jul 2026 10:36:11 -0700 (PDT)
Received: from izzolab.play.pl (77-236-3-190.static.play.pl. [77.236.3.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954812f0d0sm7983005e9.12.2026.07.16.10.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 10:36:10 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Wi=C5=9Bniewski?= <pawel.wis.me@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ak@it-klinger.de,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/3] dt-bindings: vendor-prefixes: Add Cytron Technologies
Date: Thu, 16 Jul 2026 19:35:54 +0200
Message-ID: <6200a36aa6daf63eb913016bdb4de114ecae5382.1784221074.git.pawel.wis.me@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784221074.git.pawel.wis.me@gmail.com>
References: <cover.1784221074.git.pawel.wis.me@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a vendor prefix for Cytron Technologies Sdn. Bhd.

The prefix is used by the HC-SR04 ultrasonic ranging sensor binding.

Assisted-by: ChatGPT:GPT-5.6 Thinking
Signed-off-by: Paweł Wiśniewski <pawel.wis.me@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f368e7..cd4674569133 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -397,6 +397,8 @@ patternProperties:
     description: CUI Devices
   "^cypress,.*":
     description: Cypress Semiconductor Corporation
+  "^cytron,.*":
+    description: Cytron Technologies Sdn. Bhd.
   "^cyx,.*":
     description: Shenzhen CYX Industrial Co., Ltd
   "^cznic,.*":
-- 
2.47.3

