Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29CC3C8C71
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 14:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900440; cv=none; b=tA36iKDiEG2dEceblLR9qWwuygOvF4/+RWc0dw5SmVSIevsnI/lQZb0qSVjw3U3Rm901pUXW4UZuRsHg9sB2eRpr0ktfG9qsg7xJslgHl8U9Oegj16C7YDt6r7O5ph8sVjfsQIzVixJ4oF85nMQX6QZUOuGUSqlELXdXBAfGFOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900440; c=relaxed/simple;
	bh=PwY88Z4+XMaMMJpWgpOoudQzWVWqs19jK/ovq3xR7Qc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TIMlhbp24vxVjH9PP3OaXl+l91lu0Lf09ZV6/2lh3uj3UqJH3QkwyOpeAm1LOny/QYBU2JK45KjqNW3uYzbuLrzpn+sXVOsSW5728rWFjMsP2CwG7Igl51MiQ9Zs6MomDQqXaFRnqcDODQNLmtS46E5wAjOtxchNQXl4Qw2WDro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s8IfWpH2; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s8IfWpH2"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a02718da81so24190915e9.1
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 07:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791900437; x=1792505237; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9uAIb9ozMRkPqsmw9yBOOJKC9hD2HvYyYUjtqyKcWIA=;
        b=s8IfWpH26EupeKdnvT9OWhVaTWmveVRQLLATFvOFmHX3TX7viikZ/ufRoudHtuYIev
         Fv3GgifpBRBtXoKgrh5Np/ZFJUnDuupAl7atSeDf1UqZptV4Qh7mlTHrCFezLuGEDGjW
         sDr27Ssrdy9lJ5VS+7SlFDQHM9Dcvzlb8H6TFDacjjxZPYNfpI/AfW54Co9fg1rUs5e2
         BF5qW3IFjZSjzxnswrar4mcV30Y5bxeVIkjVw+IqxqT6wJNm2B7v2977RDUznsm5F70i
         StEesq8TllqejAlUOQGl9vHaUF7RbYWfN8dvCufFLz4bx7dTKQ/8loLYhXjPiNicn8gg
         devA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791900437; x=1792505237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9uAIb9ozMRkPqsmw9yBOOJKC9hD2HvYyYUjtqyKcWIA=;
        b=jS9dvc77nu2kqKfhGixiTa6eYC2QYYL4q3hpjdtByyVBV7GedzW0JJ0sGv6zLW78kj
         Jklrl0kmui8PhBhx20eNAkl97aS5CkY8KsAbSmySjgHb2YGTHZ+t16VZhz3Ob3emRszE
         ys3/VEObvjdJ3T4MoGqvVvxhc/khr8teCAPVL8rwB2h3ptinPTP/p1P1X1VWy+2ck6h5
         3dpFTX/CSJ96aqfZxjkciz78hkwbDto2XWWRVJNFCbM9T6TXrx30VeITMNKp4gkgb/y5
         pSap4uZYvAb6EGt//qK99UAS+j3X0aQ0T1dELsMXLdZld2v2BYWx7C3kNTtdRXldApcR
         ghnA==
X-Forwarded-Encrypted: i=1; AKwUvByMB2LInwdrSctDFQ6atfq30dLtON8G/NAx70aecLj8v/QwiIboXD63SoRdJH8yNkN25liAPCnR2u1V@vger.kernel.org
X-Gm-Message-State: AFq9FYLawlMKbMZb7BKCIVa1hlUxYKI3cyD6ftW7B6gqDqD8w3/N8cqC
	DN3O0YKIiJF+ddtRYtYDSmSycStCMM42vOHp4FowJdKoN4ofoyNl/eNJdzIsBABU6Ik=
X-Gm-Gg: AYBFou0lADRkRkWRt5zdLdDFGJlrbSNPNdsypaQ0SfUPf5ZScS17IaMoL9Kvh4PLUpz
	OSFPkeobWdiwnuifuokqkcN6f/VUwu8h0xf44Z17PN8t5H+XoWVawviQOmEkZPqU+0uxkJD/Fe9
	CO8r+HDuPbXhv2MbUcr/TgrEDFRes7QhBpDuInLmv2kRXA5A+TZV7uM+UvGoyHXDsKnBsAd8ysj
	/h1qtZCs+CGR1mUYYj5pdQQRqHRnhhxCrfTGS9gPN+5yGPeJlZ43yHfx+pJyJSTFwzFXSJHDkac
	uPhRji8WBzWcnOmiEXEAl3rOBN2XqeKZlYyY/b9u4SXAp7jd5+3/GKbAcMl38YuPQKAx9WaSRc8
	9EIchPqcy5AVt9WHNAWU5RYltQhLoylpbDjRfN5Me3Ne7+xfjNBU1ewS78TO+ycI+zXaIIBDFE+
	gn301CU2xGnXtOiFo7lL74EvfPh66sYP09wDFOvTDP7Oyn+FWYbKCZWvgJEjGqs78uJx1PB6khX
	HgDG7vwFh2kBZkJkxo7dSAS7KF14w==
X-Received: by 2002:a05:600c:3b87:b0:4a0:1b15:8852 with SMTP id 5b1f17b1804b1-4a18e4a977fmr315806495e9.16.1791900437031;
        Tue, 13 Oct 2026 07:07:17 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bead84esm364625305e9.13.2026.10.13.07.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 07:07:16 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 13 Oct 2026 16:07:12 +0200
Subject: [PATCH v3 2/3] unaligned: introduce be56 unaligned accessors
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-topic-sm8x50-iio-max34417-adc-v3-2-d3604ae4a229@linaro.org>
References: <20261013-topic-sm8x50-iio-max34417-adc-v3-0-d3604ae4a229@linaro.org>
In-Reply-To: <20261013-topic-sm8x50-iio-max34417-adc-v3-0-d3604ae4a229@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Marius Cristea <marius.cristea@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1443;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=qfQWKiFOPYNKQaFmvtbGsS16Zvd0DPHnTyBZWWyunTE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqzjsRf8f9CCRX3WhkWssBiYtxRfNs1C838kl2ok44
 vKjfqemJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCas47EQAKCRB33NvayMhJ0UY3D/
 9D95tPgiwjHCBdjbSQsRBU/1olO7spPQFVohqobqNYWeNlSuys+9HpmAYH36U8BMwiIQQwODpp5WgV
 xgYVezJsKBRxV0+NcBdRnVxePtIhiRQQ40S1VBQ0kVegElsB1IIMDtnrqvFLpO6k6fXJ1I87Rreb6p
 IMm+ShCqGKBeqyk1eYx80eiyqX7u8ZdtJnhrZDHN2mW0ih8FeZyUCOLkS6GwfBBELarvLiwe9Y64aI
 22HUF0uXMVJEkj2tuBSPjVPABREYBEMgm8a17xUI/lsaWrWIb0ZMXihNGg0bXa97IKXn9Cpbzvd6Lt
 rryrP7hJlHbjIXUmJ8Ii/sa/UfQUvc4Upm60/zbYQawm7WaqjG9hm1GeByP8cja3OnQ2+3a0kiuG2x
 NcOKwV1hG1bKTLKd8b5b73K9xuvfPo0ESrZ03LMHFo4wQxREYuI8me57Ah/bV5tIiM2+Lwy+qFx7k6
 dTZx35YA9UcrdF/kXmh6um5J6jN9fK91UMyj56uS2McqhvZBQdsbNG7IUuRm6qHhoKuYqgdGSPK9Hy
 dQ9AZRZQdq54JLFiC++8ygmVl6N5nFiKd6oR77h+G1jRVUoBVuLQVhRjVaIGO0Msar80JX7jEJvzem
 RIWl8a2ePH39JtptiXPvbSYXLxua2IeCrikPBDD79fWUPUdQc3rQ1l74s/uQ==
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

