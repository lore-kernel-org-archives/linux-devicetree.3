Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446468;
	b=ibAS6DqVG83s0tD1bty8b7SdXERN1mygS5wAnQk0N+MWFfhy2neogaBr/D/exM0TBL/q
	 PN4BhW/F63eP8SyLVxEp9urSLCw1slsQ+jPfRM3Z0reQ8Z7ljQSMnz5bl6yum6gbJH+A3
	 LfPs7gG49DTBG7h8tmzMDCKVULJq9b4+bJZ0zMQvpLBUVEioWh9nTyefE6HFB5XgoNeGL
	 wkw5Fe5pSL7Jg2hDrs8wiYwZ8QmoL2CLENS7ILwRD+6VCuCVbEfc4FlVuys5Hl9turEIG
	 gxE2wI7MPxc5qwIdomeMcb1/5rmuwlIuENB0KZJBhJUMcoBKxSUdX1RqVkwVAJpja7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xh8JlClPQjIKYSMwaXks/N+gTEcs+PhZFyDS0fpX7rw=;
	b=m8uXTehvGey3+VuJVGjxVnJ29pEQJE5ihm7zlYSrn2HKmC7TJDQDGIISyu9SiL0CJXcK
	 n9of7zmmMtDIbLlEJoYJSmQPMLNUKi+cYK9nABhLm1eWE6hRw0ke7BooTZh/EK9f1eDB1
	 Li+KMrNFfluMnE9JS2oirh9iipW4nH+sPgYIwa+fhravmurKG/qFtDusbJySmveXRVpUZ
	 BkoEHYgCwz3G7P/YWVWw0SsIHY77pP9BxBXqTpsE3SuPH9N2cgH4Jq0mN8xi1SXRqMCyn
	 S/VRp8FBUb31/yLDphuDLSW5c0dIlntwUIcHuImWuHYSD305hqQG+JK3owNbo0kL+iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z3xcFD0X;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE27606A337
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EE27606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z3xcFD0X
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b876afbb86so4285114a12.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 07:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795446466; x=1796051266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xh8JlClPQjIKYSMwaXks/N+gTEcs+PhZFyDS0fpX7rw=;
        b=z3xcFD0X6rjc7qxVPfx4nIHKdcQsvmgdw6i5mi7HnD139rzKT/gw0Ape8OiNUGzE/v
         P7uRLfxSHx6KSzuIQNTBC5PoLU7MAjxqXEcF7DfP63UQFYM4UBAbWCCFCfJpOvIG+3uD
         nvqhggWkw4NdXLJ4moVlaOHGCPXRKyjt0/eN8+zGWKWnhc6dryG1WL9CiuD3QR9zy7cp
         1sXPYwLR7Q7Hk5zFm7rfKmURIARmWP3CklIaRV+mjCUWrVBOyapv4eWRpo1kK2FnTEln
         AE+VkbAp3ZpJjiZqBajcU7QrBdsRotLMClMthu5BWOvnLez9hQNtLNdBPmQH2nXBi+Fv
         Tt7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446466; x=1796051266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xh8JlClPQjIKYSMwaXks/N+gTEcs+PhZFyDS0fpX7rw=;
        b=mzFhPIy2kRtm9kEQDXJvN/Ti4AWHmSImye1nOIIoxzaGDOpQS+HgE5c4hNQDIaO354
         hyoHR+XND9rTAIJMtwwvPxgXdQ4rRbFUHOqJcs9lLR52ntKdy/xPHYF+y5Fpcaat3POL
         VGv+CE73l29e5siLj/82pNCvu0foG93ATjSlHtu+oDw2U20MTcw/RP/S7FF1kY55exJj
         QjiDsbmqN5rD1rBO3UOVcmmNLuH6prOMZszonK21WWdSqf6FXvO5OjsN9pZYQ+VOYPuM
         9U/sk697BI+w0geyoPLAmDDKGjKfNga4SlZpTTda8F49KhZ2ePa3/NtjEYnWYHQ9PGD/
         mZTw==
X-Forwarded-Encrypted: i=1; AL+hErEVHSr8I76u4L+eqk+rPA+NKBh7TfuWKsO3jFXTVQt9dN9VdnVeo/aymnZa8KjnK7L1z7KvgFfWz5gs@vger.kernel.org
X-Gm-Message-State: APuU4Z8kQIMvDHcvuHOhf577t217ynUs7x6umijQ1gVfXeZ/5ipchooP
	mXm4xZnAvetxhBtmNXfR2O+1xzMC7XGX/apUnIwcjkUirrDRSO8bHppb
X-Gm-Gg: AZFdTZeV/mWGqm1JDlxM9LkmzBo5Dk7BnEIWYHEnNOHgHfLQoZDj0mz/YiRa4hui6ni
	3431QxXh4OtT1cmwQjAucf+8MS3OiG67u7/6A4rkheJAIzQRk0nHv9z7qmQ+DxU6NSZPIDLpIgg
	XQGd17WNIHK5c6Rh0pGnTLiJErzKag++RV45Ecnv95i1KkhYKwmGmsgrWrtgsK9yqvo6MvXzHkM
	4QNaRoXnfHd90pn6199OEtal9KX8akWKLntrViPWkRqMqnBrxPPPwYaO6T6i4pv5rz+99StA0sn
	wTrYNMzyst1jjhqMg7PlNCOlFIJTTfhqqwADa+UMhNXakxEkKDJ6ThjvXRsJUPKS+xCvZ01yI60
	dWkIRZyekFNP7VjoITO9S14n78hoQBeWRKr1huLWqhG7DBgZ8eTmNJOwN1q2hJXslyFF4hm1mb3
	o/EfmQPmKhUQHxk8OGaQOFcZT0sehTcoFw6/byNuw32aDFr4vQVnI22/hQ8m0Q9UrT5yy4AXNdg
	yAld0CCaBRQ6JI6cYQw5eKO6Q1tEyJ+mkseyZKqypZvTlrSdn0tI5eJfFRvuQssXnYd1pUMpmxL
	SUwOPcGjxlQg6YdDcveWgmNBv6DR6gYcSvz/fX4r4dsMU2JIP4E2qaGGl90TMergQ8Mtvjyo6cJ
	qeq/HVlzg/A==
X-Received: by 2002:aa7:d789:0:b0:6b7:6c8:70d5 with SMTP id 4fb4d7f45d1cf-6ba37c76e5bmr5952130a12.3.1795446465996;
        Mon, 23 Nov 2026 07:07:45 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fc020sm5446279a12.25.2026.11.23.07.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:07:44 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v3 4/4] mfd: max8907: Add ADC cell
Date: Mon, 23 Nov 2026 17:07:25 +0200
Message-ID: <20261123150725.212836-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123150725.212836-1-clamor95@gmail.com>
References: <20261123150725.212836-1-clamor95@gmail.com>
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

Add the ADC cell name to the list of MAX8907 cells.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 103294c76b97d..ac7b41ad400ed 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -20,6 +20,7 @@
 #include <linux/slab.h>
 
 static const struct mfd_cell max8907_cells[] = {
+	{ .name = "max8907-adc", },
 	{ .name = "max8907-leds", },
 	{ .name = "max8907-regulator", },
 	{ .name = "max8907-rtc", },
-- 
2.53.0

