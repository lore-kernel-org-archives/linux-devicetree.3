Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B86E39BFE7
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 23:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778281927; cv=none; b=n0bVfm0dUOzjZsIgkhDdfhlegjLZsOb2FcAbw+T0MTY0quGAt9wv9NLiqJ76xlQjIaGyHDQBEFJSX7YGPSrfd7OFmzDhfLDFmwfljubBOYoe1XQgVJgjlgkS/hQWRzbxENnJFRYp8gdTKkHYAaoZquVUJlGPrn8ntIwx1trSvBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778281927; c=relaxed/simple;
	bh=Rqcuv+zsPQMoE6/4nu2MYqPrBaf48QbiYiBe+vMu0/E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gepiCyqvKvjAuBujBdZ+mvgVYCST5NgY3t6Ac2Y62rM6VxfPeBBmdjlQDiul8wcvyTP3NBpigqg0Y6nYMtX1wnq+CbMk4AIsLhx0kuY+lQgnMCaE7o2oK8dGXlGsCBEF1mffFpkmG9IQrsB6/UUy87Lvubu5ptfjX6Yc7+k+LpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FGtYiXjo; arc=none smtp.client-ip=74.125.82.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FGtYiXjo"
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-1329fc4bf77so712501c88.1
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 16:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778281926; x=1778886726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nnbu4qTvY6NB+P0/6X2z8nimAgju94X8lj1wzzY6I5U=;
        b=FGtYiXjo3Hb8gPz8hni/wimP5PpEEm3o4NYvZAoB5ylLntOXVcLruZi2aKr4gU+SEC
         Wrrc2jPZgSKxy0ju+cOYi2TuwaRr2RqadfLEEW/c6KGSm4yFMvwHvbUgFnCve8O4Z2Bq
         kIZNEj8LSDg4p4nipXhvi8HZQpRO0e2wf3WXXBjrIHZtzwg45pd5GL359QTIpf51sMYZ
         lExvlZ5tZm75fYA4RzMcEvoB0sPbe0hpRRviXzXguGWe1UilA7FzfJ54v6jpKrLidQo/
         Q+MDgFZSkYx2LhdEDIjmj1SvyY9pPb36XqP6Ge/AVOoEdX3sNng/JGubmqjQboUgRnQ2
         /JVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778281926; x=1778886726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nnbu4qTvY6NB+P0/6X2z8nimAgju94X8lj1wzzY6I5U=;
        b=eF2bmJHZ5yQ317Vs8GVwdabgZzN//bjuZc9lHRgw+2c7FHHoofTIMv6XLfFu53bgKy
         M5pzv5PG1Ui1DF200MC/c2yC/4hMrSZjHpzWBxrN20RZ6P3/1TfXLxiWtZJQp2TQXqgl
         DDk8Rmtx+hl6eFYrrKzzEktmEeCcVky0ymgCKL6rTUTWSuCuHqZQxt8+m7reBz7Vfryt
         sLWA46J0zzwxrf3ntn5C9gm6FH31sMQL1LFjMjTw5sUtXAXqZIVTEpGUmjmajlyfpaBz
         XBlI8aIGm+SGchFrgiCeLmgPLLHUAUc3fBIHcO6RLhzIh0itzEuvsZkSYnP8J2wv+yg/
         adtQ==
X-Forwarded-Encrypted: i=1; AFNElJ+0xp4GkV7Xx7g0BMKIXrsVQbs4zMtdBzZF2yxUWe3auzpKD1oMQtcR91IEY7SJh0YnBXJvgyOYVkng@vger.kernel.org
X-Gm-Message-State: AOJu0YxnItmSXYG/faB1YzsdOnHtTzpkYn5CKi80vUQRVP4tL5W7TU3F
	nEbXEBzCis9T2uQLPaKq7uZIrikMKnFv7DLpUnpbToXoI7XSkzBkrt0F
X-Gm-Gg: AeBDieujZoacFsBbxzR3NOs+Qo3oPS3DoHs6dsDX1kkT9weQNRtZ2g7ve9gXbtQyZ0J
	9T1PLzQno9liR2U3PmdOAn9f2Vkyjy9TZXcoILSLgGXr24LZmM1OOLuOstyJzJJPsy3aJ2FP7pV
	MECFXuSYhxiPvxX3U67jF3hSgaCDcNTDQ7zQ6LybOCUK4Osksd2LkYoN7wXBNSbo38RWvq4f4PR
	GL32bFVHrUZ+WA5iTQ0nTW0PJDl4leHOWQaGNplWhHcDwYA9fWuAul1I+U9kTyWDPYGkJgDwlTG
	mhKFbiTfJqKLzyFFUIoau7S6R/s6r+Gs72ZMN3qvsLXItW3xwDB5xIezMmSY4PXxEhtIMK66C9t
	/573/FJFDeciItOpk8UdqwCvOxQu7xrtnbkbknHD0rI0/3lJTjLpo2xcf4vx4z9WlhzDkodwSkU
	JJJ4aHxyNAbufl3mb6To9wAeQ3gT7SbuWE7sC1mYrPWqBJOQEzfNAzRj4cKwo7UL3Z4g==
X-Received: by 2002:a05:701b:2204:b0:132:7ab5:6cb6 with SMTP id a92af1059eb24-1327ab56dd4mr1421565c88.2.1778281925572;
        Fri, 08 May 2026 16:12:05 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1329fc4bf3fsm972554c88.5.2026.05.08.16.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 16:12:04 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: jic23@kernel.org,
	lars@metafoo.de,
	Michael.Hennerich@analog.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2 0/1] dt-bindings: iio: adc: add AD7816/AD7817/AD7818 binding
Date: Fri,  8 May 2026 23:11:46 +0000
Message-Id: <20260508231147.77044-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2:
- Fix commit message to match binding requirements

Hungyu Lin (1):
  dt-bindings: iio: adc: add AD7816/AD7817/AD7818 binding

 .../bindings/iio/adc/adi,ad7816.yaml          | 94 +++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml

-- 
2.34.1

