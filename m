Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F475572EA7
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420117; cv=none; b=hBGmN220JHGHBSoTi29HHLyTvwZ23ybRWhR3qs9FzHnEEGo0nrooAfYSJuzmTjNZedKLVYA0bux6J6mYJoJz5vXSINFS64SFR5obTOZ15Ga+ikPzhO7LJBVEJ0iQCtOGmFROQky89ePLvDO6OEtqm1DKQvFN906YXLY/hV9zBkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420117; c=relaxed/simple;
	bh=QrUTULrAzmLGnxNb3WOiSw1gB5Q7qbOJEVQG/tEUjDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cZvp+r1Yi2PQfQJFO/DwVrXLR/UIjb8MJMSHneNpWPtQ9BjQjap0/h3w5JXhADaMWrMN57IW6YVppDSyBrvULGAHP2blL7DWYU+Ck28VWCGIgV+GKnF45OyDVyGugP5hhiRy3H9+cG7XusowTh1Q8XD2Cnr4+VI9K/3URtoB0ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=OgYCA6hp; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="OgYCA6hp"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1e3b87ac5so11183825e9.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 07:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792420111; x=1793024911; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kul4vFEXVE06RfU7X7+iYlSBqPrNkIOuPBTEB3ZLc2M=;
        b=OgYCA6hpION7n3MzDqQg14349pO47uG/jMASVyAtONrvqKqAD6haWpIkhAk4mduVJD
         K4qz0vmbIIHnmUm0DV65yxlgOxi4nIyTxt9fMJROhqnA/jGYJM6XW6EKV/A2dDvirdZV
         zTSoyiFPoLSRclKNah+792PIfL8W+s5pXXNydwrgX3odeCf6bg+mw8rXvUX8B0hPE5Td
         OJCD48tmSPQYi8PKe1I30rXlSlte5DxhWblTSOjtcYRBVvK2WACCB9J2QbO/KpbduCoh
         9CMiDZX3XwQEXnXsBlVFtsYGXbGZahzoLsbJlhkYCLxW6ibVVqqsZ8qcgl80X8FO5eqv
         eUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420111; x=1793024911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kul4vFEXVE06RfU7X7+iYlSBqPrNkIOuPBTEB3ZLc2M=;
        b=0iICP6Iotq5ViexxDf9ik02WkKsC8N+b45kQoeqxewbs3DIZRYH2yxa9JYVzyMBI8c
         u1Q5p+D/fI00VcFbxiGHxZX4o1P516H0HBL9vVPtGyl+droF8IMSzYs5EnfAecAZaAfn
         ujWe9E09iboDlhOSsnMPPoxNO0mDYa6xQbW3nxDCRO4XWfcHp94FJky7j7I4u4J69AiE
         edeIklzXEuambRjWBkkMCQvzZngLsXQNKEK5dQ5E71JcI43rti5MC0d02tRDJBBFPmP2
         +A7dbXSUbhLmNrEb0SzQ/KkOlOOYfwfRQI+5sONqDUTfN3CigK3ZKWH62Az/5nyua+qZ
         KTkQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjN/nxIJNZKgWUY982E55sq4ka8Hqn4vbhmYvUgg/TphXZvVpWfCkziWjh2IyDVkb9hqJzyqkxCcjw@vger.kernel.org
X-Gm-Message-State: AFq9FYIYOexnDSXqAWFtMEgUfjBg+X2QO/H5Cs7E4Ivp1xBs7O2AhGD9
	1Dt0sOqVVOpk/t62ONnrd4AMFs9CPulfpxy7lHO0VL4bF3WsS7ZH2SEGxM4w5m/SnT8=
X-Gm-Gg: AYBFou0YdINd9YKaVlJ346zfu0fCwgciBOIdo0lO0qJMjFfUImxlDcpvp+h8xcEjIqI
	4H6CP3Qj/ojCCmxpUW54BtYHD5PxiI+M9TrsS6pN4PRCqVyTfmxWUcfQeEB7seT6ZIeTeOiRIPX
	T6Ttepo304IUmmeA4onWD60r8r9nT7c2Hv+yw47NbYvteec0mSF3WWF1tZV9Ju9WAGnHy+JahjA
	/HckqyIEf+EIYqxXq/heTrmJaVT6wws4bqi7HqFkjg2tjy1ubF0B21ny+YswpkkcK1TZNqS/95/
	IDF+v6fltXW7VPOguEu64KMM/5X8tDhkZ7ak/wp4BU/wYTaGEmM5R012ky6kruvFgDvdrfLQ+md
	nwfXS3JpO2RQZopT75+y30lTAotijFeuSuNbqd7ZF84DKbFfySEsUn2DpaIbYeZD2JABEazftsO
	1z4EPkUoky1LFFppbF0TIDZRgk2Ex37cmxyuZQDok80JYt+rKtNZ0m+6Oe0oHcH68L2kGwUVvu1
	jnXGMe9D68Pxt+2bnb82+gl4tGtrFnIw2kM9ldiD8Z3LXqmcg==
X-Received: by 2002:a05:600c:1394:b0:4a1:d492:1604 with SMTP id 5b1f17b1804b1-4a1d75f2524mr173737685e9.11.1792420111387;
        Mon, 19 Oct 2026 07:28:31 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48dfd540bc4sm23854576f8f.2.2026.10.19.07.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:28:30 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 19 Oct 2026 15:28:14 +0100
Subject: [PATCH v5 07/16] media: sony-starvis2: Correct the exposure range
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-media-starvis2-v5-7-eef935347ce9@raspberrypi.com>
References: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
In-Reply-To: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

The software reference for imx678 lists register SHR0 setting
the shutter sweep time with a valid range of 4 to (Number of
lines per frame - 1), and then gives the example of all-pixel
scan mode with VMAX=2250 and SHR0=2249 giving an integration
time of "1H + Toffset" (further defining Toffset as 0).

The driver defining STARVIS2_EXPOSURE_MIN as 2 would therefore
be contradictory, and doubles the minimum exposure achievable.
The maximum exposure is derived from STARVIS2_SHR_MIN which
is defined as 8, when the actual minimum for that register is
4.

Correct STARVIS2_EXPOSURE_MIN and STARVIS2_SHR_MIN.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 56fa2d5ea3fe..1c3dcae5e0a4 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -61,10 +61,10 @@
 
 /* SHR internal */
 #define STARVIS2_REG_SHR                  CCI_REG24_LE(0x3050)
-#define STARVIS2_SHR_MIN                  8
+#define STARVIS2_SHR_MIN                  4
 
 /* Exposure control */
-#define STARVIS2_EXPOSURE_MIN             2
+#define STARVIS2_EXPOSURE_MIN             1
 #define STARVIS2_EXPOSURE_STEP            1
 #define STARVIS2_EXPOSURE_DEFAULT         1000
 

-- 
2.34.1

