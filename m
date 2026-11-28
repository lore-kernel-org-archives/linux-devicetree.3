Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795853904;
	b=v5G0SP8gNRVedaFs0Ud3v15PjSTUByN+nia2NkFmgP5xFjykMNX+oDa8G/soU7QdVpN0
	 FTgB8aIo4zPlemJ8MEVGgZe/WNeuscxl2QwG6S42O8tG7Rg3kBGxbnnw0Apgr6GScGe2e
	 G2XOTCcQzoQ6ndh3+GAyw24GUmFrS3ri7oWBId4JaaN1UrdX5CJVBFEEOrSneYLjh2+81
	 D2OACONGEYG8eFtVxFFks2ayIa2I6/d/TqXa0eetsz/LQW6T6eXpMD57II+Qujr2jQ2p4
	 PLxh1xWqjQQFPNDnS6iXzRKPhTqPdL7JIzCB/TgyR2z5LdW+BQTTrBzZEapuaQQKQow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795853904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UQHX/qYS5c5kksZ77LXg1WqJxlfjKfapCZLkAYXEJAI=;
	b=VyYABIrZSbdPZdUm8rAVeWlWJelIjraqAgXaPi+KkFrCKNrkfPseuPkBSd4yEefTq5Oy
	 ocLpgzmWb6xDVLU+/GV8Hrk8hirAp1yn0ec/+862hIZZl3WV56W3s1lGve87QF3c+SwPI
	 sHAwgn4++onnUn6CikGWA4etzp+02JnJxjGfuCOzU/2l6WZoeEmUK4ceXaMY34HM2Va66
	 9T2Kg/RR/0tmEa1ualQPUE7Tr4LvZ0LDGc2f1CNmBuT8DDKlBGqDu82L1BmPV9GMF4i9i
	 192jkkTZYbA7vXIPqh1dkeTiqqbXH2ApgFQPVGefqxuRcMFQIZb8VS199Xy9ljy5UbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pL3F2Q9W;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8905A606A324
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 08:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8905A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pL3F2Q9W
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f03920c477so74038475ad.2
        for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 00:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795853904; x=1796458704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UQHX/qYS5c5kksZ77LXg1WqJxlfjKfapCZLkAYXEJAI=;
        b=pL3F2Q9WB7jP7gHpTdJVbvyZvP8l/9x6jogovbeNWcW056qwrI1F+QfS8G3+Pwn38z
         22yn8/JwUPDWE+c2us2ASxf5aaHue7JmHdRykR3EZU7CvZ03lDxRfwcP6nl0TFhuHu9g
         RaqRDceuHb/UmAZKZ2XwUb2cTzeixcYDg9G0txTsoXlBPuKKp2JWacoKM7tv7QwtgeCP
         x+C0RT8xRs9rDGJYr4ZxcOF9ETzO17nzZm5l8iNQzKlh8OykskKJaMJM2nUNKaNAzbDF
         ZzDtGi8WiTDFFO2lW6c2wrGsauFyQSDfel/2yTwVS9fMFip6Wxef9XnA/KH6eNQtSAwD
         QoXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795853904; x=1796458704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UQHX/qYS5c5kksZ77LXg1WqJxlfjKfapCZLkAYXEJAI=;
        b=aA/KFWIQYOXxeXlEEY+UVkyZup1dFvzQpw2Mr6NAPK5MmE7KKBo6PhjCpq/9aCsmk0
         TfPiCHOw5Xlfa8cKY98Q7cKFNpfq+aoQHVunfCKACS+HYzDaWqQCCIEcCQXpXqMkIgpW
         pCbtAWOgXgLmriwGmPqjVsJp5CdljzCbJEjrq8/dcnEOcatQ9aPQUZv6wgADHE0WF4Wh
         kAcAqzKfA11VGQC6B666h1uc+CFwxnoeo3x8ju3+yLuh45pdLG2fxOv+emApHjgbzYwT
         LOPp80e8SBUtsfqRmpLisk6jJc5IGOZ1NivZBv4E+flAWS8iC8bymi2pxLeEO6YAkZvo
         zX7A==
X-Forwarded-Encrypted: i=1; AL+hErE+47L2M7DiQ5jqjWa5drHk0HLy/MSGzKAA7HoOsxp+ODWDYrIGPt9VcTF55VG+pzxpW7BgG+QxLvnP@vger.kernel.org
X-Gm-Message-State: APuU4Z8FVPLpy3pVRCw4aUSIwMbJKDymWPCLgjlTwZfK6iCSouwhgEUM
	8C3JGWsaSX9dPgHoRfnj1KNCS7bnKKtTmCCBKLFzX6XqeGpEf8K1GIO7
X-Gm-Gg: AZFdTZf17b7tAdBy9F3/pI3JOPoN72hqfcX3XKFNLiyY2Gx/YNZxLwlGHwzWneRpt0H
	XStGqlUdrVkNowGG2CQWbhx/gmEEfhfUj8dO9KQKr6ledlGuiYy2S9GhxygspHq8uqpK5ZJP3Xj
	5j5zcLzGUpKn9rxmM9QmvQAgiPzFINM5/w6xybfOIBQvfkTjOzRwC6rx/PHGlMVTKZzh2LmvnRQ
	wE3BMO2iTSkuUT8jwwC3Xkm/A1Bjwf0vKfLVlnHzKbnHYtSvvOf21jFzw2KT2G+sxQkjfO5/05+
	OPl54epB45KY2YKydWHJVsP047gfg6fXxko5csq1ZThAOvVo9FCAxMeFOAUdnGlKgc6yAaYsgpp
	Kg4ZiUkWsddUT71b/Ao68x0uZ/cxPpCZmCr0BI5sKW4hbO23H8wc3+l2KfnC6xMYI9yy1NHz3Yc
	rOtd9LFfSOgPh1O1W9URjwc2YvnSid9C6ua4kSq0OhWBDZCyNAIT7CefJrYX/j4o4+gtI4jgi3i
	lZEj08NW4ZzvIBlg3BJcalEjiM35BKaM8xUvepN//U230Tl0TcfS0srsULFXEvRz3M0ebkGmomO
	vFxLc6qd
X-Received: by 2002:a17:903:b4b:b0:2df:991b:4368 with SMTP id d9443c01a7336-2f03f1817ddmr297156055ad.53.1795853903817;
        Sat, 28 Nov 2026 00:18:23 -0800 (PST)
Received: from wyb-ms7e59 ([2001:df1:7880:4::50a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f14a432sm133882845ad.75.2026.11.28.00.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 00:18:23 -0800 (PST)
From: wyibo6109@gmail.com
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Yibo Wang <wyibo6109@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: input: add OnePlus pogo-pin keyboard
Date: Sat, 28 Nov 2026 02:18:18 -0600
Message-ID: <20261128081818.365987-1-wyibo6109@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261017-literate-prudent-walrus-dc6dad@quoll>
References: 
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yibo Wang <wyibo6109@gmail.com>

Hi Krzysztof,

On 17/10/2026 20:01, Krzysztof Kozlowski wrote:
> LLM

Done, the prose now says LLM.

> We agreed to drop all these.

Dropped, together with the touchscreen.yaml reference; the driver does
not parse them from DT either, the geometry is pure per-project match
data now.

> P > N

Moved after ONENAND.

v7 sent as a new thread.

Best regards,
Yibo
