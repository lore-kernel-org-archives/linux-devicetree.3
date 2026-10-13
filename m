Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B8C525A95
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 15:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904667; cv=none; b=XLJpv4fibHBOt0FU2dt5+W/14w6NYOkxPY7MwSqDzsVjB5mGbxLdHcym03KvB5vHgfgsdryeeaKIk41mAmM900566RqanwI3VNXXMuXtyaAwa8yuyy9wuDdT0hAijXQAAKDgOMB5xUHaXCyMDfWsJ6wbv1RtGrsdaTLfr9CBx3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904667; c=relaxed/simple;
	bh=bz0c0FzRoFwONs0INWzutnRV3/uG+7US0x6YY49BHmk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IkqIQ80/IcCHemkdkBhyPJPzzjC5ND84kQjMgOl8NZ4CNx4cH2LUIFrk3/ihegfbMC8qcimdDL4b30QvHAgpC1qXsTToE5rlWKjLJzUy9LVRxHXsS5F3G6xCtPSPJxZz5dzaPG+d06IzZ0SJbn0pcbCLUmU0oNOeiYSs2vfP5W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=iM3WoLBE; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="iM3WoLBE"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48870973bddso1891563f8f.1
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 08:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1791904663; x=1792509463; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7hnlvbehMSyPR6UnmFPNMKU268xjGZhcR+ZNGcu0l5I=;
        b=iM3WoLBE1VaZjLLXEMM9S+0ic9vr81RCtyR+I4wPQQWz4a78U0FJw2uQ223vH6wK3v
         bubob/J8xvnfFs+5vbGFbkoFgqGp0jKqPr5M9VO+NAOzgAsOJYZyI1zPLbR6FBN+EZTe
         vIKmPX2oZN8l/+hSG5LTIQV7SDXydRwSzOElYhVqFg1lhd5U7GZmmiiZLacLyBf6TaOK
         mF3dMNKBb+1NREbFyrzlyE159ptUqdOgNf9no4DFvjfN8SKZPWkjB+w9Uyo0WYQybP6n
         TMPXaDpFPzEn9X+fkny27+fEkW8eEspw9wMYn9vm0125qFBU06/qLh5b8k6WyJI2Ubw0
         iITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904663; x=1792509463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7hnlvbehMSyPR6UnmFPNMKU268xjGZhcR+ZNGcu0l5I=;
        b=FUDhjxDZ+SnYVCE3ITpWr0fpTKjkg7HrbCnIkMfuNttHIl3uDKPzmPTJ/ZfksrdmeN
         EQzwMErAfFqLzBOvE4qdOlnfo3gC3OTLb4BBWoOu42TllBDmMRtfhfyUxwoE2jAPN3xk
         mBhvIK/cSJEtVr0pmAjomoFTTfHt8I/tIVL5ItUWNB/kdk+xgP9A/FWeoQfMnhrJt8Ip
         a7fyatz2QS9sJtCRQQWSV0fP4NyKeMUs1eGkqpAkw2UjeQTQaQttpItEjlMAzXQYF2hr
         FzPahldCfXBzCEWQyx/uOgs3FcSLlQpziVjaJrB/CGYuHw/BTBnjt5vjZq5tuY3TnB03
         gZjQ==
X-Forwarded-Encrypted: i=1; AKwUvByv24LV3Yu4dQv8yr7ne5zljxSRmdTjdipaZ3G64yh1kSaHPCGM/N1PID366qVZ+Wdoqy37eqFv2Su0@vger.kernel.org
X-Gm-Message-State: AFq9FYJgprldmm43bWiefInWCxsZYXRnoL7+Nh8GkfPIb5I9oS3FGwmy
	mo1UOeXx77yeJ3rWb6gX8nK8BkoKgTwt5vfcGfJ9K1jPGZIwCfOvTzsqgLZZf66Xy0s=
X-Gm-Gg: AYBFou1DhTPjl9D3JLUDzxdwW1Y6xsofUU5KVs4Nhwi1S/2774KsRF/qqL27lOgVMnB
	sjd831PAecYiFjfk/c7aN9vE4323YrrgYyUR4oBYc6bd6nSmHhl+y6FxMT9SiUzbjTLIB028GDb
	l1mU3O34+6j9jCYhg1FMYjiabmfzDVVZOY73lhnFHWvOcXvtzA7/4MbXR9MiFi/jP6xR62GNXuv
	81Nslua5UNNzML9pLe0enXhVibSX8vBZjlo1FZgki9+xHSt1puT1C45X9L4lkemKcm0gDviAfzT
	xWvFZ1xIHxIEgPIhXgYXFgmnBhDCEn9qwKKJ7fJA80mU1Nn/JMuX5DFSPWw1VGEP9oOAve2cVoY
	FuJ7Kg8LlY5AtihQjHxaVhUmJ4Ph4fNHS/y4/8UMkPy0OXUyRiWHaEUL1q79eVXSQBwL+1dBFBj
	TSbKixesbzwsurKch1qmxz4Oi8mCfj/2LPR6CFMvuHiLdBFYuzlhWDObjkvG17h689UDxC4XfFe
	OfVqiPQUaM0sSECEC3oritje5LmdLaUVCT0cs2/Q/hrjLC6AA==
X-Received: by 2002:a5d:444d:0:b0:48c:585b:8825 with SMTP id ffacd0b85a97d-48dbace132fmr20717882f8f.18.1791904663170;
        Tue, 13 Oct 2026 08:17:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaabb8sm6529743f8f.15.2026.10.13.08.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:17:42 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 13 Oct 2026 16:17:02 +0100
Subject: [PATCH v2 03/13] media: sony-starvis2: Always program the sensor
 in window mode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-media-starvis2-v2-3-3670722d250a@raspberrypi.com>
References: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
In-Reply-To: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
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

If the requested region matched the defined active area then
the driver switched to all-pixel mode. This left the possibility
that the active area was incorrect and not reading out the area
expected.

Switch to always requesting window mode to avoid this potential
mismatch.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index c7fbc5c132f4..20f3489b58d3 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -918,9 +918,7 @@ static int starvis2_program_window(struct starvis2 *starvis2,
 	int ret = 0;
 
 	cci_write(starvis2->cci, STARVIS2_REG_ADDMODE, 0x00, &ret);
-	cci_write(starvis2->cci, STARVIS2_REG_WINMODE,
-		  v4l2_rect_equal(crop, &imx678_active_area) ? 0x00 : 0x04,
-		  &ret);
+	cci_write(starvis2->cci, STARVIS2_REG_WINMODE, 0x04, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_HST,
 		  crop->left - imx678_active_area.left, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_HWIDTH, crop->width, &ret);

-- 
2.34.1

