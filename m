Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193554;
	b=u+fhrBHxjgvartcov5/ZilHr9VLQelkqMwqQGEjHEKYZhYTmbfLNNl4wiOKRj7i/PdqN
	 ZSmOk3KOo0h9nJK3h/szDhiwc/rLh4jyUlE0apywv1EbLukkzLOdBdPN2wguCacegwEXy
	 4EpfIqsVMp+5gpzuCW01XdITniEbFvE+Z638wQTyjHrwjOaE3OQSDZ5WqvmfthAFaIyIa
	 VyDwrct4fUOuZuLVZQ6qNXIffLtWcVPt657g8uzU8YP4gxLceHP1ck0tIYp6UYjxm7gEP
	 rt/1mNSgq3whj1066HZVBB57k4fjt4xjgG6sgjoqbPESelOvVsL+s1HovmfNK+PjorQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=9uAIb9ozMRkPqsmw9yBOOJKC9hD2HvYyYUjtqyKcWIA=;
	b=Kn2QcbPG9llfPiYIjR6t6PUBM7sQhc/ehK2E5FhTnjD3Fm63Dh0iLY+Zvsiq4Pq066Bh
	 bA4QHhyI+Y0Ju+hVGEG84POci42DeI3XLxqp60/ilLNHp2z/Qppc4P1SMQgtKiyrggRqF
	 jCJvsqU7FalYTMh1/IgwgoD65+1WzMMi/KevzlT7F2GDD7UUwEl6g66ZTL8DtoTsn6wxQ
	 kiaB33YF+CtPSzoZYsC2r0+OD4F9+NnTbiuFzn9icp/Nb2+V/Vao+aed2cZ+6rDyJtCjf
	 JyW+BtCNREkfuL67FhgfiCN30A6mb0JciMbPidzpyBYhVNX0OZJJpYwgIJQi+6tVbhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iMXd1g2t;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDBD60A2600
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 13:19:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FDBD60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iMXd1g2t
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso8526695e9.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 06:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793193553; x=1793798353; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9uAIb9ozMRkPqsmw9yBOOJKC9hD2HvYyYUjtqyKcWIA=;
        b=iMXd1g2tBYkihoc5u1/R6QT7SOmDZvI4CPOEn7qtT40TDcm13pH4/Pqg0nJ21lcYMN
         gHz/cTy1n+cpf6zzGsmzUoPogBB8yDicYGgqgPh7uMeWP9l8uQSDqycV5BLDnXCJLg1+
         I0d8K5BFFAgAx1QJp+E6GKeQMSCGfz8VxXILv5cYyOxpxmupe9jT1OY71A/0RQqHzG4x
         CRJr7brk0pe2OwMXd/97r675ix8hGQ8rY4mkMWKXEmnur8BiURLbsvskC5+PWfHGYXKt
         E0st/FZrILS+bsFXETdskOqMVnF/6/Dt5FYD5FcG45/PA8GV9Z0syqf8DDhZFXkMZZ1F
         r+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193553; x=1793798353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9uAIb9ozMRkPqsmw9yBOOJKC9hD2HvYyYUjtqyKcWIA=;
        b=gi5jQNuSV0OvBiqXnHba1YuMYAlwU8yWgu+/40Ll24IJHafIS5Hva6ROY7ImXufthd
         wRC4mcM69Xc9FlioIsfst4Q/PaAk+GvuL6+2VN8koE8xzd4nSHDXKx/lXm7SUSrDFPD1
         y5/syQA+Mru/Apc2qdT8R8ynP9kIKtVAS2XpiJQ/wvpZptmAmEAKg0gx1evTV8SusWOg
         cH/bmLsZBRMP2Xgt7ZBDFTPtyYY7VobOEn6ZC4fj3w9I54ALGGwy5XbpkFZbbpH8nKrd
         2smUm4BWSf3BbBVyCG0kU7/ztaXcb3UzY7/dkeL66bCz8f1zYzQ9xQGNmT2Uo9cCqBij
         fnmw==
X-Forwarded-Encrypted: i=1; AKwUvBzzDQxFaAdo5rfK0b4X/3ICoiV/mlqHojbHp3MyLQf62rXZaM2xMfv4QjQnucCZ10dMBvu1/76bVdwb@vger.kernel.org
X-Gm-Message-State: AFq9FYIJZaIIbPQZH23HX5aY/k54FpAd8SdUWYbK3EnZmrRmaP6Yvdcc
	Dy3u5fLCJncVaZo8p3dg79zDeoxVC2J8QinbAE9H2ZJbf+NgWTndirvIxNA1N1BXctw=
X-Gm-Gg: AYBFou336uMkCvKBqLFMwI4bx/MMaNiXj6zhzBJnjyNEreJX4yVa/mTkbgY+u9w2Ytv
	rWcSDP7xgEPQ1OSn6VOS/Es1kn+Nu+bH4ywtNsZD2W4Bgl3qaCE9FE+h7b8TnjMy5lipO4yGBZF
	KBVpYwAH9RNHPRjvEbJ6NVpDMfLqXxsLlHhg3WgRKVDXXUkEW0MEW4KjwU9lU/ZC+0a7YqDAYtk
	dErYmZfg6IUkU0UFRagdht57Hw6ArUL4ZCOyL+TA2tgoj55KtV9s8mulHHzW2rMYeJxSGF0sfT8
	vq7mSljrzIGZjDOHH1KlnNPb+n9Gk7dcdbabzJsD//J5MdIksdSXYrT8dkRsrloXszuf17SVO8z
	kHP4MKAvM8oz4qQRyvhjBP3bKVWpSnqA+T9APrw4uXz4qDzjxvs66CG1tW566CmGoY2iXYQ8g5x
	nd9Lys9LK6qXSMzmYqWyiDq+aIIhdaA0FqV89FM9XKdeLCu26BNKvwyke8ZSFTud8wtPFnSh7p5
	hnP/m92BabDOHNF8RCSSUSPGYgYyu4vOHquIzZSt8SxKX6JSfVSVoOg4iv8RINSUe+46PqeoRau
	Hgfk6b+bQsShklU+wqrm6E5fNWaBaEw8h2GOuTnklRc=
X-Received: by 2002:a05:600c:b8a:b0:4a2:b89:b02 with SMTP id 5b1f17b1804b1-4a96667c848mr47048085e9.10.1793193552104;
        Wed, 28 Oct 2026 06:19:12 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a996aa0ff3sm19869395e9.1.2026.10.28.06.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:19:11 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 28 Oct 2026 14:19:05 +0100
Subject: [PATCH v4 2/3] unaligned: introduce be56 unaligned accessors
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
Message-Id: <20261028-topic-sm8x50-iio-max34417-adc-v4-2-d4baaf3ee903@linaro.org>
References: <20261028-topic-sm8x50-iio-max34417-adc-v4-0-d4baaf3ee903@linaro.org>
In-Reply-To: <20261028-topic-sm8x50-iio-max34417-adc-v4-0-d4baaf3ee903@linaro.org>
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
 Marius Cristea <marius.cristea@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1443;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=qfQWKiFOPYNKQaFmvtbGsS16Zvd0DPHnTyBZWWyunTE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq4fZLttrDpTiI9a7fF3u6Vq/mkfoNhMhsaRUKeks4
 cPp7zECJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCauH2SwAKCRB33NvayMhJ0Z6+EA
 CKtHVa7jGBl285caxNm9xQSN4MTl330vhBNWXGFu5yC82S4NBo/cW0AGmnjb0hfLCbcQmTv14Qop90
 Erqm6Sern9H7ljNz8gHZXmipoIlYUE3U5aAB3KSCJBau5tNqWrBrrI9FAaB6kX71wEFTiQNpubSz3A
 ioNyLm6FRaoUTIdqQhuosHkJdM+inqv0Qtw7fwVESL7VjZGTSK5rSFE3WVyHPMW7HJYAVRZPY6ys3A
 qRjQjGf8XCJxLTqAJ8vBAIkX3Ztc1m+7ry0unPW0MkPkTjY5ceJFo6XqRtufZRs+igf7B6BW7Vxfrl
 qQBdJJkcCOixBr3gJqgm2iJM9oUvx7MIX2H8otzdtuowO2soismpKaLCzOV+QEd3P0joa538sKaOWd
 QXeY1Kw/+qDruF3fCi2APWxGME/ksnylZ8+kwN05i5bPn1L831P6rx4GLDcdp+qHSUXGwpZ2cmqZj2
 cyLqlu+TwNptFZbhj5eJS0bU+eQ3HarEwiH+y1s6eO0Gh3hr9XzL0iuDMT5yNizrlUOKZ6oPRnJ+R2
 GlNxzjGsVUraP5xTi39msbI0AwN9+xl7TeW7rA6PN8CypMvq6Cw5u+Gb5EpTxqIt04ltktxPpK7ZdH
 hO6qIAMtABkT3ACIed64a3INU5dZnqtgyfN15/EREM+0p31qcL/KrNppdoHw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

From: Marius Cristea <marius.cristea@microchip.com>

The MAX34417, IIO driver, is using some unaligned 56 bit registers.
Provide some helper accessors in preparation for the new driver.

Signed-off-by: Marius Cristea <marius.cristea@microchip.com>
[narmstrong: update commit message and move to include/linux/unaligned.h]
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 include/linux/unaligned.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/include/linux/unaligned.h b/include/linux/unaligned.h
index 4a9651017e3c..2105743b1800 100644
--- a/include/linux/unaligned.h
+++ b/include/linux/unaligned.h
@@ -143,4 +143,31 @@ static inline u64 get_unaligned_be48(const void *p)
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

