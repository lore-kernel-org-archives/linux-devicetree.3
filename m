Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795456072;
	b=VhGrrdRwy+2Z5fNDJVbu5bExq3f48onMMVqvfIivjwoJsYezNadvk6v/vZMcngLUApN+
	 Pdu1zvuQ1mW4EBzMn7y3/wsYnpvhKOsAfQW0ohh3iydWN1ntisHD2UPsAgd0aDVsfU3No
	 lVOwl7i8zC7KsyBas+fa1UJ9cailkmj3n0ocZ/7ic2btkYVc6QvYWeH5JQy44oP70IJiu
	 EWKBHWw4YVHB4KjIsieklCW9qQM5bO3Ec/MdTPWF9m4z2kSq0q4cGu0wUZuT7eSRDq24r
	 NzZ4Lr8PY62eTY/LN6McDAAD/a5HDfJNwRsiRFhS7m+sc8qT0IzPKogvUhHibFhCnow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795456072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=EyFKKviFKEdPA1/mTIAZMpdo9jg03KTsm1zg5y/5lIo=;
	b=vBPGs6WBf7uu0aQPLYTA+VoLqP2URMkzTCOCZ+L4x4ah+ZjlCUQKT5zPZASf6T2V13Z9
	 SVyAZUrwko6avtDtzqOiNXNAJ424K2XNd9uf7DY1qVz9Gb/bT+Q670O/l4b0z6d4SOiYn
	 tlO39B4MxjDZhoGAU1dQ6feoNhy3Tj1DfF/ig5jMDzo8TiglVnXl+nskWKTr9bAAyO2Vt
	 yfFCOI8wS/uerqj6sDxfbGxT0pVUlFIkohj5DIIPWWqNvmjii3LjTAa3KhxKKrtwE4TXP
	 Qiv/6IJbiOG3Pyk2poH2sJ6EuDptiDJ3HKRGvmobVEwCV7oeErootmriqfrKSH8Tr2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="k/THwyR0";
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47172606A33D
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 17:47:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47172606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=k/THwyR0
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so1958616f8f.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 09:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795456070; x=1796060870; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EyFKKviFKEdPA1/mTIAZMpdo9jg03KTsm1zg5y/5lIo=;
        b=k/THwyR0d/kYN8jVRNojARRFxxxiAO0kuqrAtLFFTSpwtPjuxlq/wBQyJQa31ZNuLT
         H6E69lTaU/KOobsWmEdX7ZgUyo+oCDtHwBBcSk0wwThIN1JbRTc9F2LuNBFTst+Fvh5T
         uK4lCNe1leRBVxygJGRawJOHy76JfYj+mXsbmy7lH+tszWJBwKxaTtYPxtHqYSc7mz7Y
         her70CVbo6pYPt9s8sB5UIJPE2UJ6sXRO1W6oDfwnF28e4PAHBlYI+0jPNfCmXhbj95o
         4TXIjElcCAOMoFZBRJeGqdKyWR9NYGgO/7DNxmyaLmOHp9CPrbgzoW4ptKTl47qz4dnu
         +q8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795456070; x=1796060870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EyFKKviFKEdPA1/mTIAZMpdo9jg03KTsm1zg5y/5lIo=;
        b=n8n8+C0mUmw9DVYclrfdvwFxOEoKyjJKduvbZMp58w7X46TaXetRpxKXj6ehEHVnDe
         tplRLV9yB1malMpx1Sj9tySNFGF2UFuAmxm9LzEPY2K8Ivr8X/zl082tLt6QP8hEUvih
         SHOyrKMJaXk0ZPu8cEWpfdtKzchDnNWiaCbzVTZyPyRDtVmpj+x69YxOJRkKerib0ZkV
         1bidNZAZxwsnjjF87oNK22pOx02hMfxJwCOdRuTIJDw6X0+cHeXeuz4dhM9PbkJYdI2V
         UhtlK4sMNUk0lst2O8AQhRF+16SomVIOcILRwlW+wNCx168ERPhYRv1ab6U+igDgcVPO
         KAUQ==
X-Forwarded-Encrypted: i=1; AL+hErFTrJ5xba/+OK08eSb87kC/4HIGsJtZzxUKuA/UYEYMhkDEMkF3uRQpi2mkUPm7DP2MN1mbhom6UXgP@vger.kernel.org
X-Gm-Message-State: APuU4Z8Dv9T6AO5VBIwZhoENwUDtoOf9E8rr6BSzSY9WszzJXRtKhSBS
	ZQSwg3UVYhYGYEjNw9Ri1WhVT6GNvo8ZeU77nZAkS/yhFfE/mOR7avyyksjLbdHXyg/MMRxmOu7
	tFgC7R7A=
X-Gm-Gg: AZFdTZdZJZI/y3Rndoc2iVIg/toCGvYuDdgj0NtaoKE23F1ViT3NVMC/A+3lrDzr0Oo
	sHShWgidwCC6Z2l21O51hyTBabwvULNVBRIYtysrGdwMmnZ7o4H2sHQt9vlfGWqLK4eW5sK2IY/
	/R7jJhC6F9FIdirlSf+Q5sijTHKRqm4rsSeXAwilAHMojAi1ORGnGzUPK9517d9poOKfc81FDeC
	nyHI+3GbsDKsMQ/1AFSSqJmLVVYjd1giuwtMyxPEdbO/TA4LKbqPY8V1pJ2VQUBVq3+Bbe2RjR4
	yFhLa8K+Hh0eqoLa6hUfkFX/DWA75/Bg1ws/DH6IIVgXDthLKUEw3i+qSDf0z5Z8o2ceCJ1A+71
	YVyllnVaK9MuYoYQvkzPCCVVqFco0/d06hlVIV2eBHgo6X7h9ZU8zyt3g0XJXZLTcbUvLLuSwY6
	sNNKQn1LRizkMMEg0N7cw3vCpaMdY2X2z8TuOw5VTDBV388Y9/dpD3y1gAgxhU0jUKiDlJKr7QS
	BunCPaEneCX41Qq951f+PqHwUKiAaoKo4B3WR7RnWM0uhbV4dHkdk+mkZqZish69uiZNbJ8MulI
	PERiU7l3+PPt+l1h+hDXTwj2uX/Z+l1x1DjYLVy856MwQM4iR8s=
X-Received: by 2002:a05:6000:3107:b0:4aa:1ae2:ff2a with SMTP id ffacd0b85a97d-4abaa977260mr29586809f8f.2.1795456069512;
        Mon, 23 Nov 2026 09:47:49 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bc8ce06sm22961413f8f.47.2026.11.23.09.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:47:49 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 23 Nov 2026 18:47:45 +0100
Subject: [PATCH v7 2/3] unaligned: introduce be56 unaligned accessors
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
Message-Id: <20261123-topic-sm8x50-iio-max34417-adc-v7-2-d8f87edc5086@linaro.org>
References: <20261123-topic-sm8x50-iio-max34417-adc-v7-0-d8f87edc5086@linaro.org>
In-Reply-To: <20261123-topic-sm8x50-iio-max34417-adc-v7-0-d8f87edc5086@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Hennerich <Michael.Hennerich@analog.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux@analog.com, 
 Marius Cristea <marius.cristea@microchip.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1503;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=VWjXeVXU6bySoahX+1zByOy26x+PcpghUtYIOiReO0U=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBHxCKVwROIzlOFhKTAItsb1EQoCQGdgdGttWwo7O
 zvU7RAyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawR8QgAKCRB33NvayMhJ0TgBD/
 9KycuSjLlv5KmEbce9bO/wNf3KxVrhyzQMrEvhwhrAeChz7eZIdwsSnM4NB5Yj/fz9rzLKHrvVv7iw
 vEgi9gfVPy1CYJu4BLo8jOXJydH25WI043z2LmHlNEnVIUMVQ/lHHcX/3Vbd5lOMZZ80l9w+tJLCs6
 ofmMsIZFDjuvnQo//6TpUvIM6whhxfeJ+ZAUJOj/7cmLog/3yArX6nVrLpB9xvfS2WalcYRGKTQYap
 MvyLZRRaEtLulm41Eu0hmnnpodRhNVbnqj+w9FX+zamfmm3BdRwmJKmA+P6PfqBq/3LN1ACMXYKrqE
 ec7C7KNgcAaUqI1Lgm16fRfWMkk71iZrxa+IHTDA/k48EPZnhRDaMwk/G94lZPdoXiI/VrkgRsHNpl
 4EKIRgLE8KrQqTdQs4I+Rhmoscc2Szqa0yKXmhwfcoDlMK0KPjIdZUyOeWMKh0CHkgD3zvuH0y1Qjb
 zkLpStVbaGi/pO7bsn2ho85Zh4SZjNAKcpcwMfoj/H144pYK894GerchgtM94ofUQv16c+CoRymS8A
 rxZPpKSpnoqjTqZJ6Vn9ykZ3TlQoj18AUf2B3YH/zSxKc83R1cXlA3BcyxOKYXz8e+x+mNhHWolvyw
 EG3/GU94NxwO4M+vYDwoew10lthgjICcFnCrnlqlOQ0RjyVmnjpR+/ULT4+g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

From: Marius Cristea <marius.cristea@microchip.com>

The MAX34417, IIO driver, is using some unaligned 56-bit registers.
Provide some helper accessors in preparation for the new driver.

Signed-off-by: Marius Cristea <marius.cristea@microchip.com>
[narmstrong: update commit message and move to include/linux/unaligned.h]
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 include/linux/unaligned.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/include/linux/unaligned.h b/include/linux/unaligned.h
index 18c4b0c00e2a..d7937088b2af 100644
--- a/include/linux/unaligned.h
+++ b/include/linux/unaligned.h
@@ -142,4 +142,31 @@ static inline u64 get_unaligned_be48(const void *p)
 	return __get_unaligned_be48(p);
 }
 
+static inline void __put_unaligned_be56(const u64 val, u8 *p)
+{
+	*p++ = (val >> 48) & 0xff;
+	*p++ = (val >> 40) & 0xff;
+	*p++ = (val >> 32) & 0xff;
+	*p++ = (val >> 24) & 0xff;
+	*p++ = (val >> 16) & 0xff;
+	*p++ = (val >> 8) & 0xff;
+	*p++ = val & 0xff;
+}
+
+static inline void put_unaligned_be56(const u64 val, void *p)
+{
+	__put_unaligned_be56(val, p);
+}
+
+static inline u64 __get_unaligned_be56(const u8 *p)
+{
+	return (u64)p[0] << 48 | (u64)p[1] << 40 | (u64)p[2] << 32 |
+		(u64)p[3] << 24 | p[4] << 16 | p[5] << 8 | p[6];
+}
+
+static inline u64 get_unaligned_be56(const void *p)
+{
+	return __get_unaligned_be56(p);
+}
+
 #endif /* __LINUX_UNALIGNED_H */

-- 
2.34.1

