Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283529;
	b=Mla8mMxtb5JnN9ysafxAfzGelw6de5sPIpGAVnx/cAIjMAzHduCu0PO0Rjr0DoCrarQq
	 +DFt/QD5k1TaQ3fHQW5Lamma6mGNGdG1MhLyYD5G7qarORusaJlaS2ogdsGnxy370ZCKi
	 13XIxrJsKKbDSy64XreLOUhgD2l9ci7qc9NCRMywCbdr+4va/g48A1Mj2XnmnrohaYnIR
	 EMJxKja6yG5Fy57HUT4ycRQjRZ3P3s5G0hiG9TPPDtpNEXeOiXEdvOjKc68KV8PP8aIuo
	 Z4Dj5V4q2hF1NczBOxIyoIc4H0HXYScHxccOxwe8ZPuB7odsgUG9+IPWqHRLaYeXVBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9mhEjzlz7Jj16x4izypj1+gLbuZfUyq1nl602Q0+1VM=;
	b=smWpjHCpfuufNb7Id3BNBDoQfl11X2RCiXFBJUdR3V3HzGB0M9iRGNbdlSmAwGY+c0A1
	 mWrFclhJ5frJPrQKX9PcpUZ13ez1RHmIhobyW2Kw/ymwSo2GwDkjZDfx+8y1AzJmcflsB
	 m60fnRv9EFzMO8pjPwdqGuwjpn/TOGmfEFL6YzmEVQ34jjJzkXEmsWlpJK/elr5N5Er1m
	 k3zS+dkZABOZ4N1WN78KzE/C9KejWZiYtekJ+nMPcAy4R/Kmr0NQOWjPbfPwFPR+mt24b
	 Wplff+cGzUt3O8+Y+6VdEuA3gjlagp6k+UVyjGeUyMYh7pTUR+AUA47M7bRZ7aVMGtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=VuQ6YNnT;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D599260A5BC0
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 14:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D599260A5BC0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=VuQ6YNnT
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso461551f8f.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 07:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793283527; x=1793888327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9mhEjzlz7Jj16x4izypj1+gLbuZfUyq1nl602Q0+1VM=;
        b=VuQ6YNnTgDGal7pGqxbb1jp22zdKuxq84mqOZgLbuQgfcCXAq7kjDq40hUZqQDU8+j
         jY1n2Spkc/iBS0mf2p2iS6jiCK0tW1iLr7zKQwh50pWvRu8O477NaP7KnfdXYX01vw+f
         mP0HcEmNQV/zTn62hJ9kvtSzZuC4BMYhlWlEsECmoKXpKUYNgHnQPpqU4NWsdtXtLBsW
         kekOnOsfI2DCSeoG1jhAvHw72xG1XLW6GOjnUaktvxYr/aNAHsYp0UQrMQosi2n3UQtx
         G0J5XbMLH+sRu2GlOXeqOKKEdQiLIELi24u+XSqEaL7AY0xPkBaR9s0e6EAoTk/BKYF6
         QXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283527; x=1793888327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9mhEjzlz7Jj16x4izypj1+gLbuZfUyq1nl602Q0+1VM=;
        b=YMvtVFc/wW+KMHcxRTM8SEVvAs07XhGVURWcGDJIyEjKAhNGeTk+J31rqWPXajyHzb
         5nwmpGCgvtTUxuP9vT2QP3/sqGGjr287M8WbxD1ZRPjNfv9yLTR49Z/o1SQ+ocBQ4Usz
         8pVB7pg+a/2XdpAUnHbeTXPihe5Nwl6U5lnv6AvdyaUGHA9Ki7+tHkqRS7sgBxIypf8n
         WrisMjDJrMyvydmQ2KTnc8mOTw4TAyzAZ0WG09PFD6nUr0k1/fDp7RhxzmLAgrrUfds3
         CsJhDvcWoBQDBPE3GL5CPrnW78hARL8e62KEb1WotPhd/698H9xrz8t/RqE4uaEX98S4
         /aDw==
X-Forwarded-Encrypted: i=1; AKwUvBxukC8VQZObKaY1JH9G4V9ASeVj3MLK9R7tmBjF8OzOAFxPHljtPraDYKklFxzmY9iaKp7skVXDTd8d@vger.kernel.org
X-Gm-Message-State: AFq9FYIHU+VdSodYofbQM+mnwf5101wgCWbwS6vAUHrKjVN2DstNPWPs
	H1o7u7MIDDrnf3X1YL5p9DowL/CBhsE/49sxgRWdRIRnQ4C6SiGMpSuBXhPi1nMLA2U=
X-Gm-Gg: AYBFou1RKm1yNspaVtUd2fqfWh736oXvFM+KyswrrzUu0CGfIaSn/4j77S0imuWIKx6
	LAMjL4NEh9Z0jV+RjY2I2JXlmVyxLqB2ppD2bQKME/xqpkGPtygZylUAXYWdJSUSs+K77Qed61f
	bttxHl0hLLqwRTOf5c9dpOLxxi68XPRj4Gl5wZFG2Y2vzCkxMalwbudlIP3HA1GPwvL8hJ30CLK
	/DPhHxJsijiQgp1LmroofvhXu6E4p9RkhCCPe3QDiQdzJpH3LR8h5EMbxTe4zfI5TcIKjpWmdsI
	oKgBwqDY4leY/8N/Cjg8pMrgmGRemBIiAgiEmGurNK1GdB+5ms1MqnE/hh0mK6CTXMA42Vxf5WP
	oVZNImMJ8FtcS8X+4VmNvox3nTLKoBpqXO47eV5GadaNsdvoBgE3AuXQZUtJq+h1GSxxsiq/jg7
	Rdj1Zd/USvNiVgUyvQMEsvMeOtVfWsCVLcov6EL6xUalvqdArgo66Z7c6SWyfo5GFIo9w9I+lxe
	YCy8obY/Pio67vWsiRIZUVu+BFU+DuRvhbIfKVov6SRbVo13A8DBm2S/r/ar0T5ceevclTWK2Wi
	Br82gjFdjl3Da4ZUBHVqylKfTdQzczI7AFeTFOXnCAjlmtOqE4njR0P9lt9bzJ2k6M6I1HGabmy
	uGmSs
X-Received: by 2002:a05:600c:3144:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4aa8823df43mr66919615e9.16.1793283527182;
        Thu, 29 Oct 2026 07:18:47 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm66702755e9.11.2026.10.29.07.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:18:46 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 14:18:30 +0000
Subject: [PATCH v7 09/18] media: sony-starvis2: Use pm_runtime_autosuspend
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
Message-Id: <20261029-media-starvis2-v7-9-b33a1332fdfc@raspberrypi.com>
References: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com>
In-Reply-To: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com>
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

In order to reduce the time in stopping and restarting
streaming, use pm_runtime_autosuspend so the sensor
isn't powered down.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 95da8a9e671e..27357cc293be 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -858,7 +858,7 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	}
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
 }
@@ -1049,7 +1049,7 @@ static int starvis2_enable_streams(struct v4l2_subdev *sd,
 	return 0;
 
 err_rpm_put:
-	pm_runtime_put(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
 }
@@ -1072,7 +1072,7 @@ static int starvis2_disable_streams(struct v4l2_subdev *sd,
 
 	__v4l2_ctrl_grab(starvis2->link_freq, false);
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
 }
@@ -1447,7 +1447,10 @@ static int starvis2_probe(struct i2c_client *client)
 				 NULL);
 
 	pm_runtime_set_active(dev);
+	pm_runtime_get_noresume(dev);
 	pm_runtime_enable(dev);
+	pm_runtime_set_autosuspend_delay(dev, 1000);
+	pm_runtime_use_autosuspend(dev);
 
 	ret = starvis2_init_controls(starvis2);
 	if (ret)
@@ -1479,7 +1482,7 @@ static int starvis2_probe(struct i2c_client *client)
 		goto error_subdev_cleanup;
 	}
 
-	pm_runtime_idle(dev);
+	pm_runtime_put_autosuspend(dev);
 
 	return 0;
 
@@ -1494,7 +1497,8 @@ static int starvis2_probe(struct i2c_client *client)
 
 error_pm_runtime:
 	pm_runtime_disable(&client->dev);
-	pm_runtime_set_suspended(&client->dev);
+	pm_runtime_put_noidle(dev);
+	pm_runtime_dont_use_autosuspend(&client->dev);
 
 error_power_off:
 	starvis2_power_off(&client->dev);
@@ -1516,6 +1520,7 @@ static void starvis2_remove(struct i2c_client *client)
 	if (!pm_runtime_status_suspended(&client->dev))
 		starvis2_power_off(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
+	pm_runtime_dont_use_autosuspend(&client->dev);
 }
 
 static const struct dev_pm_ops starvis2_pm_ops = {

-- 
2.34.1

