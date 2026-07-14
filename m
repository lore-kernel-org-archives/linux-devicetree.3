Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0203FB7EB
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 08:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784017051; cv=none; b=lZhYKx5f48nw2AxcLppfM0OIH+TifVuYr3aifA0GWVYFi+2yC5djDHPnQXsoB+s0g0mDhUrflVHkGYk4PiFddw51Yf7F9KNp9bbe9Zk4qcE8MuPtFAr4j0o+atO1AJq8tied4aMk2Xp8J046HUh7BZHvYnHF/lt+RRXvLw0dJR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784017051; c=relaxed/simple;
	bh=0Q9ueRtJpn+0V8fYajXPPgDhnxfHEHQJcd5MZ4mr6Ak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RRpqimYV3zfriV3/7sszSGWKAVe1G1dgTgeYihkLMBBTfwMGDel5J1IieKqW4ms6LKhg8zQoz3wxUrskmmwxgSsV8D74kRGLq2dPmQzuHAVxu3U5jidmF0on1jDS55i+hl77Q3IuFd3AIyzsExP6SPcgimtBObaSKiFK0+8T2lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OoPf2NgZ; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OoPf2NgZ"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6983f20a8bfso6004138a12.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 01:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784017032; x=1784621832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qmXY1tinEamMA2gpoRwrr0YINADk+qjq8kgIZNm3+Os=;
        b=OoPf2NgZVRHvFeI8zG55Hxp8Zex1dK6//4U3HVECoAX05l0hgAtzlC5jMJIANK9yVI
         w5S2+ci/Zs4Xau82/xE2xIi+b7LFfxwxcmZjCqkWBA8B78q3VKbM5l2tuKMSjD3EkG0+
         GzEYKINNESMcMXGn8kjRINZuKZHnppyi3qwZ8KIWRhbHO+uYhucHBnSQxRyBQ7MQCvpx
         eMvKK98a3jyMUHjbTR6staWQXOCRvCjmNNJNoxLeJvxaUYAXIvrje3G3ue4mON6NGEMy
         42lfOZ0w+wUGGeVCDIMnwKu0dPUKyIGmppgSVMj/7GKnxIgnZ5Uz4u0VJDnV1qGSV7Dc
         EPxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784017032; x=1784621832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qmXY1tinEamMA2gpoRwrr0YINADk+qjq8kgIZNm3+Os=;
        b=BFTVP4XDekNBehyHyEPkMUtxwTvZpYcn8BYWC0E9zzQ4oYcyuvyw9n8uMPn/JMvRej
         VF6eTQ7m6lilPhKt45vfz2lIyxOs1BUax0aVzSiJje2TdmSwlElFdDepawhyfZaS9CmG
         QfZRTj8kmku4xs5HIJ21p3X6Ggx1DDSLJAcacbtF5YdP0uDTxzVai+dWhrcsqGUHgMAp
         r0dt12wcdL1HFr6XAOAvpgqXuCPYpKF5jc4Vxjj/OPLN5lRqmGyldrM43OgMh4rGMwW2
         f0eSsTo3OXlkEFgaj9nqIC11cOBPuEDlCpmu9PrhKZwmz9hqrVHA4wU5dTxw7MHuETyT
         /3YQ==
X-Forwarded-Encrypted: i=1; AHgh+RrvF9OAoKeyhialaiw/crYAY0n2RgusZ9YOKQWLLDHMVbvQl7YTRdqXOVnV19PpvVy5Z+PxsIeBHo8U@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0LKxcynLs5vHOGksMQs74SiWF7zLT8sAlIkp4khG7Z9B+Jrc6
	1dh+rghYfa/3vzWehMj5YPLLDYR2418f64zck3qO0YOXbXt8bXrrCB2W
X-Gm-Gg: AfdE7cmRe+WQdPrbiC2NxAnQXdcWaUBt5R3gkPOaatzJpJkb1me+JU4ZZGpunXmvdla
	tEYyneRKXtZLBlC8S+WUYR47HyczrcqtK82NzOT6Ono4stbvt06iyt9OTml7imGtVk9b9DpVifl
	CjU27Oz0SedgDWnPyJBnyiKwUgnx028MmBqoOwfuOeBNy3MXjkNv58tCNVE74kqEFdm2Fiph6dz
	f/YnFmhnye+0VugBkyqlWAbZOrzzjEEbL2pd7GwH3kepIMzd5uP/QswJOmFZl04ddmLX8a+fdXg
	KQDnlo+MJ19zs/q1AbFRFP5LW1LlSPLw2MdAURqG3YM+MRggHFWPCcW6uKreQLRz3elKgKFn0N7
	B1NPICQCP4dnqSeCTptlcDWIxHtN7U71htHeWGkKA0fe8n0T1WHonYrnlxYnafHxxEG2NLxwokG
	bRVO7d6mNF1lvazeqcS1f0vWFlsglN5LUT4kLPAT+4Qh2NyA==
X-Received: by 2002:a17:907:60d1:b0:c16:558:e6a6 with SMTP id a640c23a62f3a-c16678c8425mr68187366b.5.1784017032296;
        Tue, 14 Jul 2026 01:17:12 -0700 (PDT)
Received: from DE-PF5B95TD.embedded.cmblu.dev ([87.129.199.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15e353d2f8sm723085166b.34.2026.07.14.01.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 01:17:11 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: William Breathitt Gray <wbg@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/3] MAINTAINERS: add entry for GPIO counter driver
Date: Tue, 14 Jul 2026 10:17:09 +0200
Message-ID: <20260714081709.17846-4-wafgo01@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714081709.17846-1-wafgo01@gmail.com>
References: <20260714081709.17846-1-wafgo01@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cover the gpio-counter driver and its device-tree binding.

Signed-off-by: Wadim Mueller <wafgo01@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 06a8c74577aa..14f1a4e9fcf5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10984,6 +10984,13 @@ S:	Supported
 F:	Documentation/admin-guide/gpio/gpio-aggregator.rst
 F:	drivers/gpio/gpio-aggregator.c
 
+GPIO COUNTER DRIVER
+M:	Wadim Mueller <wafgo01@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/counter/gpio-counter.yaml
+F:	drivers/counter/gpio-counter.c
+
 GPIO IR Transmitter
 M:	Sean Young <sean@mess.org>
 L:	linux-media@vger.kernel.org
-- 
2.43.0

