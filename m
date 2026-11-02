Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630957;
	b=GV7fJbFTkai4RyjlSxrYpuRa8o9EEPaJieWTvCc4FY6k1WhlrTFtewdP+G4I4Tb3/UIT
	 Dh/IhZ/AoG2xP/W8Z5kXz3l1PVgX24ta4tqjlkv/+qFWHbZ9LkSS6OUSt2PFjuy8xhtcO
	 97EtPcRDa/Wdi1fQOF+2ED5TCQ65FH2Dq95oZhtUFD5PkdOIL2an9YXMdLvV7PAdOfy1z
	 6SiY7I1w5bK8UqpnNiOFF7FtiMT0RsKjBDf7tK24jGDp7tI1IkSiyh5Hs4gowc3iTiPZR
	 wU9m690Snizjtsk9mOM8PBN4mH/6WR2di4pYlEackrL5d9GvDi79jum3rjGvL4lxlXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=K/V5t+jqFiHhP0+zyx64+sk+HwdaCdpfP+GPzqrY/v0=;
	b=XPw+u6YgNQdeBIXWb15vDPhoYi3l8lwEQkAqOPH3cM+0Tvu1EnbQtB0EEyduxBnihSaG
	 OgKfMIFW/XXJe0FN0/jb4ezcplO07wQi/2b9hYOWYRwz+eBudoD1/ZMBu/9IInXZpI7yv
	 u1ED0DTATp2PYNTC3bm4a8R0ov9Jr20yCiLo5VvNTDJ7uCHo5rOK44N8xPN4vNj5DM03d
	 GBpHAj0DYHn4vF1yA8Cb8/v59ucqTwWhlIG3eXXxK6i3PYXWJ47SYm4iytN/EnEFhX0KC
	 S7g0Y5O4HgcMT6TGzvAOMrALYpS1xoskusL3EcJrtNaL8+2M3uQ65MEdPXY4x/TyGvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rWNWv6uH;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8646087A26
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 14:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D8646087A26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rWNWv6uH
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so18906985e9.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 06:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793630956; x=1794235756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K/V5t+jqFiHhP0+zyx64+sk+HwdaCdpfP+GPzqrY/v0=;
        b=rWNWv6uHyaGaK6LrFg8qFru6mVZ4exHOSisVkTk6L20iqAGNIWFp/9ob8AR+oKdbj2
         DdnHefWTPExVwIIb1bI25AgVV80vzO05vepSyXroaQIBDxLpRi0AmQV5fQLV9Kn13lID
         F8iJ7Q3Bsq91cqz/wklKz0yhyddwGLJjNC5q2A0wxE/P+wKC6/ZFIjqXL2gujeKBQUJr
         PESZ6LeheiBy6/CQcm6tBoRVl0ydPrxi0k0eOZeLAThX1esvXm0Ue48Tcs87q6gd0epI
         EBGRIY/whhJvOxKBKTRcJh28zmqlkGnejYhqtD2sYz60Q0ZlyoDnteHYqJIQKvAKVzYa
         OCOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793630956; x=1794235756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/V5t+jqFiHhP0+zyx64+sk+HwdaCdpfP+GPzqrY/v0=;
        b=dFSRyI5kusvYZm6f5dzoAM6s58vnWuWGzO5237DUdcy9RwSwd6n3/9Y8LFbleJOK7Y
         Vapm4+TlZU/vXNkUqJNmkqlQQRM2pLiWOym4QcmU3QoqL3AYu4khyW9f15d062wwR8By
         H2Gu6X3UeeVviw32fhqjbOlB5Qo9ch/9q5kcESvD8ueuPOSNPfEpqMwtYnpGEG4bpCx4
         QphrkuN2F/BaL/n5DsDRVphFDggIuVMopokPDl2qzvbd9vnpV0V5PwjTs5zdpA5KKcEG
         KY8mJ9/8ngZzfgrZbLRJ6YqdIgtC+5Ujz3xPzILPG8x0glEjAybLGYsz9UT3i0FEHdCP
         hMnA==
X-Forwarded-Encrypted: i=1; AKwUvByB6St66Q3HhOsV0taKqUAWflIMfdoV81Jp+cS8mL6BkZAGrblo2N/U1N8Y7kMMWPNjiv1+/OpRNnTq@vger.kernel.org
X-Gm-Message-State: AFq9FYLhVJMiKx5jsog9upsZNU18G+wGTn3ofQH2/TOU2CFLVtYEUdA8
	TAB8bYpbE4U27FevBPYX9WtiBUdgFWODLX/k7qdT/8/oqhXVWx7iLWxpIWhPA5vADrr1fbPZLzw
	GuvqB
X-Gm-Gg: AYBFou3jionSrKykMpcSFMuEm6k/BuwCSzhDuUJ5Qz6R98bduO83OoLjGMpI3klF8lJ
	TuyGEM/y/h2HqzPtF0xki/dELZ8R7fSaaRAhCC4RF7CpIfSA2ODy72z+jSXydUWlW1WGgw1TOGl
	sccz5+goT6e27AM1G4NTJhBabHqQ9QgP5aw/Mir5Z8W7WI2ncTn2DBKK3Gj1LgTt7RVEXbEan+f
	CF0xE9IOosaioFoV1tQjiEDClldaKuKPHeQo0e+EVdgPSwVtK8Bb9yGvts4MJlhfXUWsoNXQj25
	BGDIZfphABt4k60SmRkC1HaL8p5R9AeyMzt54om+h7wmd7q1xTQnKRnWZT0aHRC+hJaFzsPq23X
	ashJaj11yom8DN8te3Hf+gEiY/i5O3z3PXdwMWu55engVSrt0+NpJRZ0i27jlzHma3XMH3uUssZ
	RvjplOiHXHvKqAaZUST5Ud4TJ+TaxxkAQKznvvsuUmVSyitukFeQ2bX0/tTYpgxAtn9eSPAscAI
	XotZA1QlmkJb+WIGl2i12hJUhPVrpWuKeQ9qjpB3NEA5lGcU//UXZSCN0ogkOLH8IhpWWzT6pza
	2aRiQOMkQJNr0Ta1P17rm33Q6ngv+/wmCqHE/+hOTFdZEF/Ziz0fs1LOLGlnVZq1Bo7TaIZ8
X-Received: by 2002:a05:600c:34cf:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4ac150b3d01mr246636885e9.2.1793630955558;
        Mon, 02 Nov 2026 06:49:15 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm447287005e9.3.2026.11.02.06.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:49:15 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 02 Nov 2026 15:49:05 +0100
Subject: [PATCH v5 2/3] unaligned: introduce be56 unaligned accessors
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
Message-Id: <20261102-topic-sm8x50-iio-max34417-adc-v5-2-0ffa5e5f2d5c@linaro.org>
References: <20261102-topic-sm8x50-iio-max34417-adc-v5-0-0ffa5e5f2d5c@linaro.org>
In-Reply-To: <20261102-topic-sm8x50-iio-max34417-adc-v5-0-0ffa5e5f2d5c@linaro.org>
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
 bh=q+s9IUw++9sNzM9FIO/G1OqBY3KuaSP0G+EMey77yQE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq6KLn7W/XNqDRG6ymWAJYw2576T5UyM8w2QGAAVwF
 uECyAhiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCauii5wAKCRB33NvayMhJ0a4YEA
 CW/ceDj2KIYJjKXvikOgSgTOTmfGfSTkfJWIgrntcIlNUe/NS2RvGYiUQWi8X/iNCYMkXiUoN9rj6Q
 r/XJmqJROqvBB9iVvUkdZUcKQTddRZSYB2a/jFkZ9GHSHfagzxGtnupo7hJvxlhYUR6I/t9QYpOyb2
 BWUf4gZ/rfgt5Soj+QASIoUUrNgoJyVHp33lCak6B8qP/jnb9/CHkKSmxEirZqtL9E13Pp+sZvJcZJ
 NpJmEmVzD65Nwf2PPg9IFCDa1rteLed7G/fdckHA2JXvPf2sW3i6HhecjPAp/CdVrq3wvVhSjegmkK
 R9JGwveX5T7kcsh+fLvMwExC72fVopUYZmQnaCowmm/AjtKtc5oBOYSerxl1iA8YIGj+HVCOLP0gXv
 GeJjeJxjF6hlv3BPl64veIX+5f7iWQNhqKBs1v1HX/ypDyRD2NkS3jj6JsQt1/J+r7Vem3IaV4d96K
 KLnraLKIXuzdrnONZhCu9G3/zeHetSQO8C5sOKUHJJkPfjOgwuk2jPbEFsOllQzoiS2mZuC7rePur5
 /r/BGixeyjyqtafe2NeM4/PsvnzqZCBD6BdQ2C4ui6r+N1bsaljLxoCfyag65oeKJAisZPtMflyTM5
 2l+iBqJd43j6QC5BUvpqBNR7GHz5Vapmf2LC26tCDmAMZxVsYaZoP67e3csw==
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

