Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF5C4E80C6
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 20:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791232113; cv=none; b=PPiayChTKqgc4Wlmi8mPwGkf1hkMdDapkDaVGFjkkAe8HUNekXjE+uEeydcQmFM6L3ZtSDOL+yU7FuyxpI6g3UCdU6hpsmumETEntBRkAVxqbHAdWcRx+xYlhjsawyQgEtxnHro9XVhep0FJCLeG8dQjVriKzpKTLA4wATTeKe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791232113; c=relaxed/simple;
	bh=rF6rQofzYRml/5wBil+Xn0JDP3ogfFhOy5WOAz38e3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GVPQrpNVepNeXOVeySXlb+inuBAHfVi1Nt6SsGImzMajo/NWh0Ncs5H2ywa/k237FJcshWFmYkMT1BwYiRZwovavzg6Eo+nDb3JNy5xp2if+v4T+mEoeB9zn1HYxYh+83MMXjlF7VI5h/sICqWMqigTpcg0QtXKciaxlKQaMYa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gfkpBWi3; arc=none smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfkpBWi3"
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6afb7d4aefbso3270952a12.3
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 13:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791232102; x=1791836902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W/C9tWh0XAUTo7k5jKf93sgNA+uT1YvSZ7hoHgaGa7c=;
        b=gfkpBWi3J0c3eoKs0MAu4EHoj1EcHALK9P9EqhjFAEzwgyj46pyqSu72DtmE6QrD3F
         2L88vjqMsGJMq0qP10Kg/ayVuAoMr5yVCWEzpDBeOGcn0JtJ0J7DtRgoPcy8Gek8NTLl
         vjKWu1Nfa5aaUzOOB2EjsFj70H96KGKc3W/AzF57VKC+1llsMOzaTe+ZlD1rULxPN0QQ
         GBp1wVFQ1rw8CZodnUAkxSPXLQa73ef4d+f7TlqE421I9AHgT0bsqa3+g5X+jdBtpfaQ
         vF8N7QeJjTD16o4OUiP9UHdh6SJzHKJSuq7suWWGP/e8ydIK3/L6eR02hQLWRcgHVh8A
         TiWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791232102; x=1791836902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W/C9tWh0XAUTo7k5jKf93sgNA+uT1YvSZ7hoHgaGa7c=;
        b=gGhMLvpYFLUp5dj3q/1XxA2FoxACN0HVJ2k2ewE2qw+01tG6RGSkjyQ0ie14lUPBsN
         o1zbl8oEgfzcxUQXiGdP70JLBEYsetRrqGFbDdRWqvrSj5a3xp5Dr4Ci9uEXHenTsTzT
         f3BHFrayjn0QmnLWl/kPoQfSB1lDPu+4swN18T7FUxxsM6kVi2cyCZKSHhh4lvPgPwd9
         N4iR0MqwJtG7GxXpKJJob70uJmUVJk01z0xdDsymUUisowc9WXlFYKGETTBJzv5o5Nm7
         cIo+tcJNOl24maVEHvUFxSh0aL42jY/RM1UjCTSNqf6fWf51zt5pP3sLIZAH4uc0nOMh
         /kWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpj46iLXxeEXMatsoV2o3G+X15VeopoeMpb/hrH17T7u3Sx1vWVfp7mOZn6Z1imfTyzQ6u7+k1BsuB@vger.kernel.org
X-Gm-Message-State: AFq9FYIieab5tyZi1yf8E3Zyw90Gg1wta/z47M2CwI6unSCGntVRLWLn
	CR0xRNOtgX45SQRu6GQUx1r5FNBiaCnARYHLEXau+xSCEOp9fwAenD/J
X-Gm-Gg: AYBFou1GPdeN8etg4RZNIY3k5MQIC1IAM6gDBfl68EKjGeyERsP0NSnz6Do3Y2OrM8h
	xcY4AMe1lgBJahWuNvIVypjvJK1lEyB0gSQ4/plEsrzhWjdJcdmVi3ZrIQKelaxWzweAN2RZoK+
	b/fTzKfQAhyjcjABLIEC8MRFbOyHgJcEeaIoR3cilgaMvIA1C9e0MBjKFytJFjj/dWvsfxXClqc
	JYt6u9WEBiHT0Yv4h2NKZ1CPq65Ysw1V7irTuLrG6jnDoXF4SamqHm4MSp0H/0CbMcegBPeiNz+
	N+TIcUy3bhA9B59ERSIwd4B4c4MgOQ+6TMSYN0mBfM2AjShH+s27MS+1+7Z6sO+p2Fqp+w3XT3j
	MXMD/jrjDIpzF34v+DTsZDjryDEgAPECAp205zCSUwJGthEvCzinqJE7Xj0N3/00UWZnt3oj1zV
	UpFyxBe9/x+qOJswMkTQwIVRleQg2pihZzPQpLJFStreSVpA686QoxDTU3QvGiIVx8b2nKJwQ4Y
	yvSd2kOqrmVdcfhV4zY1kXsg6b+tfTQ
X-Received: by 2002:a05:6402:518f:b0:6ac:afa2:ca25 with SMTP id 4fb4d7f45d1cf-6af9e03a239mr9940306a12.6.1791232102025;
        Mon, 05 Oct 2026 13:28:22 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e572asm3801024a12.13.2026.10.05.13.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:28:21 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/11] dt-bindings: i2c: mv64xxx: add Allwinner B288
Date: Mon,  5 Oct 2026 21:27:27 +0100
Message-ID: <20261005202731.153971-8-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005202731.153971-1-pmazzini@gmail.com>
References: <20261005202731.153971-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The B288 controller follows the existing Allwinner variant.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
Acked-by: Andi Shyti <andi.shyti@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
index c4efcef59133..d3b6f7668621 100644
--- a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
@@ -21,6 +21,7 @@ properties:
           - enum:
               - allwinner,suniv-f1c100s-i2c
               - allwinner,sun8i-a23-i2c
+              - allwinner,sun8i-b288-i2c
               - allwinner,sun8i-a83t-i2c
               - allwinner,sun8i-v536-i2c
               - allwinner,sun50i-a64-i2c
-- 
2.52.0

