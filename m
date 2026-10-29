Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793250423;
	b=aiqMY0eJXzHeT98ET6i8HRfIQouWwgmbP9b67dLZnGXt6RxU6l3fQp6nJj/P9Zz9oZyX
	 w0hzIBE4SpgAd/tgNBPdjakGgaQ0dUVhfuMA6D3g/9DkX3LSClr5VZi0CnpzqOKDfjUHq
	 tD5gc2qywEB7Ovs0qRjK+NiqBasaMOAb8qRQeBAz5SQpAPHTwZ0q6CPUsL8DBSc0zuwgu
	 Q5a/k2L+MvmpHT9WqpgB18RdiWEscozC0tBY1aK15iBUhyQDj+SOPuhld72dK5NMKH9q+
	 lphJEta3JqTvZsvBnuVS+3kbtumfiE2eEFIqA7hNf364AMxAY9wk0HkV1d+ga5sDigA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793250423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=Qf62xHUcdwxTQhTGo7oUzUtykTsLWeHZ04Gslg9ulB0=;
	b=2iSBjPhejUq2TkaeIsMjHB2QNnEw6QPGYd/ImzmrSHCMR3Jabp9QLPVjqwN1ExaO/DE5
	 ULigbtg2hbg9J11QknAFiRyPcNVw6YUiUV5UY0cs7SaP2XX/VHFl4J5k/v4ffHHkKKjvE
	 c0qUa14PxaCSS6Hm8qC4P3dfhfl/iBRDZEtsvJQkhm/3QjEYW3RVSEo0wrttXHwGltamZ
	 QqU3K+3Kwfd2xCNhQF0pRVKHIrzRMIGCq0ct1gKcLjqbMOByZO5izioYD6+7Ho5bW/SoQ
	 Yxe/XOf21/258lgTYVTZudh6KwJs3OJtdnLMqHz++67ykCGdUC4oWXJvWC6xwtnilCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jwi35f5T;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E6B606A31C
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 05:07:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7E6B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jwi35f5T
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ea7987517aso10491105ad.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 22:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793250422; x=1793855222; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qf62xHUcdwxTQhTGo7oUzUtykTsLWeHZ04Gslg9ulB0=;
        b=Jwi35f5TK9NEOrvRXbIbHQzmViWwUkuV5Yy2ISL3C1ivrmVTCemVIljYoOy17cn6tr
         JpellHJL0zQ2nZkUX3/lgwEsUKH1BYRMQMIOsP3IslcYVdkK8PelyG84J99oY2ImCKp/
         55ll32AMYAjoWN/vskYDkhwQXaWxDKazw31V5nbbsQdJINvYsITVg01imn1HCcwPlRJq
         aBMgGbvl9K7u7gZKwBWNZmEHSCVJJ20ApkXi5XJqIsPHH7R0GJqbOEs1zj3ndDEh1Af6
         GrDz4L1HQ5WSRC0GzdaQATInrIFjtfW5Py2Iz1/GTzjdm3V1u/2N3AUZIn/G/n1lvNHL
         s3NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250422; x=1793855222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qf62xHUcdwxTQhTGo7oUzUtykTsLWeHZ04Gslg9ulB0=;
        b=Ei5erxkbAJI9IUVKeGtRvylPBclegZJ+VkeGmZoFk/Fsy2fjivxS0d5kLUzADq1CMD
         7iFjgQLTh62qPT16sl5yEvn/63n46nbgiOSobALg5bTiAtf1QzHMm2rsNE9uHAyj9V5I
         nxhoFq0ZO3V4M63Wise/g3zS8CvmmnR85lWDgFnxwOhsCn6dNckTgtgk8M1tvt9G7KkH
         0vCKx1IX96hz22JzRKRTLgq+W8e2RQSu4iryTr6oliPQsXW4ZUwlw2m8i8nmc3GcIWE+
         flOf+yFfIaQoVgYvrPqmcL3B6h3xhHFgxjGvtYvNz9yPUU5erhMwnmYencTUyBAGJV0H
         A1Zw==
X-Gm-Message-State: AFq9FYIWQyEcFj8q4dRaEefSNiDYyK/WYSVqdDl9mw0Pxhsrq8wHblUY
	1T97VSKNnYSqm30QSOuVJD065ZHzaPtrLHQ5BZlwlxKtxWVG9BkL83TO
X-Gm-Gg: AYBFou3J0VUuC2H06PDkR1W2oR/69gIgswoktF3PcPw+tP3Ftgl6CsZ//xQer6tL/b+
	viX6w+sJE1n595CRt6Jaxtoz7hpPJ1k10s9kf/BNRnrTyBJ9j5HCreH/l/8jxCjnb4cjnHwlgWm
	fLYM4BBXRjTzBUWWNLEXsuI5LbWcWVnSPfekWNsCdnvtmpIjY/qFQ5W/KNTGGmwIGI4kvbWltbx
	UPwacwUWlaUEqCY1sbHJTmy5/W/0IO+xtIcu6JRtgnMMLByWaSpMspwqL3r1W1mNOxldSiyjxsj
	6/Z3/O3Nv3dxkmX6gdEYS5+Y0Q977btugAPjewGakwHtm6dTPizt2JQqrZllEA44WjL+PQq2WfG
	fvhDw3Qb9JDqvpWs4R9D5eddKAGx3y+qc96YsySKaaMOzYO8LwX5B21xtTO3l/JfEa41aQi4qYS
	/+TvgYDvp2eFnS+a4LDQ/zZW6r8nQ6JkuqSMj2oheu9arvBZX2t5CMZDB0AluQO4OHsb+CwJXdU
	ROedo6cSFFRcqSxFoCoW5jYkG5VfB1eFyxWfkvvVIltY2yqFhhZta5RCIQ+THBLOSDaO049UDsv
	mCgmVe7AP0MnA1TClWFQJAN4FKGF
X-Received: by 2002:a17:902:c40a:b0:2e9:4048:3031 with SMTP id d9443c01a7336-2eb0054029bmr40770025ad.39.1793250422229;
        Wed, 28 Oct 2026 22:07:02 -0700 (PDT)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9d2cesm28159685ad.65.2026.10.28.22.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:07:01 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
Date: Thu, 29 Oct 2026 01:05:49 -0400
Subject: [PATCH RFC 08/12] riscv: Add Bouffalo Lab SoC selection
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
Message-Id: <20261029-rust-bl808-console-v1-8-b736ee920078@gmail.com>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
In-Reply-To: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Kwanghoon Son <asdfkwang@gmail.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
X-Mailer: b4 0.14.2

Add a platform selection for the BL808 64-bit D0 processor, including
the T-HEAD errata and common clock framework used by its UART.

Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
---
 arch/riscv/Kconfig.socs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index cecbce0c498384d3283ed23cbf2514391eee361d..ea4667da7716a9a8d2ae156c422b277064b42530 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -12,6 +12,14 @@ config ARCH_ANLOGIC
 	help
 	  This enables support for Anlogic SoC platform hardware.
 
+config ARCH_BOUFFALOLAB
+	bool "Bouffalo Lab BL808 SoC"
+	depends on 64BIT && MMU
+	select ERRATA_THEAD
+	select COMMON_CLK
+	help
+	  This enables support for Bouffalo Lab SoC platform hardware.
+
 config ARCH_ESWIN
 	bool "ESWIN SoCs"
 	help

-- 
2.47.3

