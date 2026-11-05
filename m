Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793882576;
	b=hXRQD4gvTtlukt2wIaUZQlafoMdkRBNgEnJVdgbdCD8JgiF7AGi1KIqQ6hU/rfOnUxPt
	 slpkAfxyorvfCDAHvh8uaJTo72zTzyvWsbstlQIvbrUe96soQYdP2TymbjK5YXvGRa52z
	 R8p74+p+Y1xxAidmN+wx/zh9YP+eahxpdx/Sbh2ghy5HQqq9bChrtPuTsF5tiV/iSGSJg
	 3bUb9wFc0VCxFupuv3dSs0qI2HP0MOJJlPFwDxVjB/2aytGnYB5nhW7v4lwJijpTQvliC
	 e+VQPcLXUKFK5xZr7jM3puCqnIKwlfndUBNnUNx9KGZt5g+LDXzS2ZOuiGP450yVwAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793882576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=K/V5t+jqFiHhP0+zyx64+sk+HwdaCdpfP+GPzqrY/v0=;
	b=yOOeRB349zQL1Q7ZSQY7l4CKpkuph3THsUVkLjAeOQGN79HT7rVlPoR0trT3R+td3HH8
	 938YLnL5OOL2zHOytf8PRqmZ4ifHPgqhaIQeYfhByq6YpdFHsYImDMgieVKQGWn/fKT5F
	 gcKZzxpTcitqWzGB5Oi8e/qFjhWnwqDK2d+y08ANAp5czLWkp5TaoWkOPbJqqHyjoEtwW
	 lZ8Nt+cjU0NEeOsyaVb6ExfbL0veBkxR5rpRz5U2KkhGePVyHss4u/jX3o1Kd8dZ8KWYF
	 tgr9h3iK9LD5u5Lwqim5fpzxZ7mnHUJNqykxTMG+OyGtSARCKogjBjLVoBFo91l69iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=H9okgcbP;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03D76082BEA
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 12:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C03D76082BEA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=H9okgcbP
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so11094895e9.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 04:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793882574; x=1794487374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K/V5t+jqFiHhP0+zyx64+sk+HwdaCdpfP+GPzqrY/v0=;
        b=H9okgcbPSjBNMwvztiZTix0H1RSa93G0pSfDKK6EnbuXehpLZ05M5CWd7nExDKprD9
         KwulzDFWraiuBhUlZCPgf9BOLgFjoacw5op7rIwl/yEn7LoSKjkJxz9u9lVQxnX+tY04
         OvaQPdd/yGsWFkagF6tGZu+u3qxtEFcKULQ1MTgQMXTRRcVPkEFtTpDZMAG0et2BGM2d
         Y+2JjNwLiUJMV3L7/xW9tUISZ2rO/LE/iFZLJW/qFKBD/9eqqvqXPeD/2H9H4l5WFC8q
         4ZDQyXRep7fqZILvwOwqLSEOrFJVOaKZyBXxb3HDXH+DNLtc8tUGri1P++qZuMDCmbmr
         iJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793882574; x=1794487374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/V5t+jqFiHhP0+zyx64+sk+HwdaCdpfP+GPzqrY/v0=;
        b=qQvt/vEpthJJ1W497v/9AbxPcWM4LkoQskq5bUcexCBJmQFkCgA0AeKM4B7A2Q/fVA
         slzNQP+Is9FL6anyp+zINZxwrVdyQjjiOxZ5gr7cezY9i3vsMWZTAzz+0/lpZOxwik/F
         5ftSN2W5EusD5RFlA//RrN1FpP3ZnzmNFpvWjxbNcoVIbNCjs1ufDZ+ASes4A7tCf1D8
         wNEEYvGX3ial8JHMYEgQWv6EC0+60R691ENzHSAy4jftxnGI4izZaHN+FmX0brwQQXQ7
         utLdmig5Q6guTYIpvTz0t7DB0k7SWLyW1tlVnKKD4H+H6y9SdTtGQbRh96im1wVk82sn
         TuWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxg7XmnJy5C3TV4T3gCQ0TBfF8s3g44l2+1LEEd2mgoR2U/1G6ZQO0EkOtfHhgondiIPVYYF7wPghfl@vger.kernel.org
X-Gm-Message-State: APuU4Z+aD2ipNWlF3xx99dr1YhFrCoMI1qROCMrOZPvzQaYq7SxncLan
	2MXkgi9ks/t91dNriEK+PZ1d46v7Mkrnsx/IL4bKpLHz2090I7KqGtHYRZpOIJq8gOs=
X-Gm-Gg: AYBFou3jbiv3hc7YZgDOBEd3ElAwX5Y+e3DXwHRddsOxOTBhCqa8i3pAdnI79cjW3J6
	su4q5cxIoU8ir62UZ0kmPVXhwkfSS5mn6JHuGosirltNCTVz2BaSLYlB7DdNNnxxassZL1Pv7qL
	o/K7+JcmeD75o+bW1AwyxX/zHLnbRTr+XBS+B+vYlAoEI/2EObXibhqKEnpx/iCLBc9uv+4soOh
	dbVEpd2naXklKrGAxcI0ne1/b4hvyeAcm/JQ3aMLumn7Wm8Ox45oPXUPMxa3Bl+KA4/0tk6usHc
	1Bc7ITXMAs+0v59rxTE9zlm0gBonzX72+OFU4fPGPCJpMbLrlGLQCWz34zPfRn59zn89ljT2vEI
	tKO0sp+3kMx1DtUhPjyDUcIGA4P4jXpDik/2Ti54+FmpqJA2q5aSIfJnBdgBMs9+htAZuo57y6R
	0Ld3c2vZOYO6DNC+NmVKxI7eq7lilZ9vFFvb6gs1Vq6Zr/yXLvDat0QuOl+96vMsa/Sz5IRKhvz
	YfsuzO00wV/NJeGtJHil2ao6PD5faPZfYUj69EK8O/wSezVBtjuuJq2qELgFkTK6O8OA+gQRDXU
	Zzr481mhex5ReFtA7rDV3A9UwuaHFmBx3NAILNFppojJ
X-Received: by 2002:a05:600c:6384:b0:4a1:702f:c736 with SMTP id 5b1f17b1804b1-4ac150b20famr423844785e9.3.1793882574155;
        Thu, 05 Nov 2026 04:42:54 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b57373f7f1sm73487895e9.15.2026.11.05.04.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:42:53 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 05 Nov 2026 13:42:47 +0100
Subject: [PATCH v6 2/3] unaligned: introduce be56 unaligned accessors
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
Message-Id: <20261105-topic-sm8x50-iio-max34417-adc-v6-2-63b4e8279633@linaro.org>
References: <20261105-topic-sm8x50-iio-max34417-adc-v6-0-63b4e8279633@linaro.org>
In-Reply-To: <20261105-topic-sm8x50-iio-max34417-adc-v6-0-63b4e8279633@linaro.org>
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
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq7HnK9rfw2wWoTGuH+jwP+i35rXB5WvMZ+jpraK9W
 rwN+BIOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaux5ygAKCRB33NvayMhJ0RkeD/
 9cRCQ6b4pl4S+7SXkMrrob6IWUG/2drVzNBJXnHQR8xH/XtyJmJP4IiW7MP/0UJCMYFVDDP78n2nVl
 WYFwPP0zp+V8QKA/9q/fm1I+DzPqlHL+CiOUwV9+3PGROZuOaAcWngkDOETREe7K7WD6wYMaU1r+Us
 BYZWwKRF4ebe/hBSDI2/QNSuo+iiZyzp6xavIRDYoDvVZuxFipN/BGRblJCii3iJ2pgQdHTJ4WrGaC
 KvpvvqwH+PRp+d8jlCh27v+96FGiQ/5HFz9yjOF06Ln8RLsMAWkTWLKL4lOz3OBuPUkF5pVFxva9oR
 D3o0D/Ox/edONKs0iXJOaymctFX84W6qPOFiTtIlUl7wLNI3Y8ozIcs23o6N1KMLC3rLzsNIE7OVxN
 7qU6cWB2jY513+5MzuMg1ec7IqAt8nOWPS3yb1pQGlB2mLsCNm7OfNt0ssQ2zzDLmgx/jn4x3L8RLz
 mtsfIrl41kTbZkRL/oX6IVmrtPYJnk1Z/m2yu8A5GsoceUQZ/8c9Yb0aI4YHKYf2PiGMu38bviL/+k
 xA10jiJ3z74tNJJLywQIcEubAhi8GGUOqldBEuTeevI8hDW1iZlzonH6Y6GB+QmBaK8IxPL5aUcrMp
 1SLU6S7ndwusHEjTQPuxSrut/s4FeL27GHR25oh2cOgr/dh5morJT3njn/oA==
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

