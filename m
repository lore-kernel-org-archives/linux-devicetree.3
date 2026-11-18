Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996083;
	b=lfpvPTPG53lGmTV/sTL0mTI692b4tW+dQp8QBbTOmjmq5Oz4jzMZaNq6hBm9IDu+TceP
	 hE75C96NJ+iB8D2GL7L7jn8O/yLNLZE+QCAlHpq8wDl5fq2FtEX1Den3oj3G1/a7KnMDg
	 ibglLMf3k6QF9VDzqvYSVZsCcgRZz76Ho4otcuIjsu1l3iFO/TFV5ouAHrGKzXFv2LTNX
	 bAq7HK+e/W/Nx6RJeMdQ8xPAPSFqPpm28+1jjWOhKjHmla7+M4tiZrLmOUi1zmpXoBBhb
	 e5Zy4xor0axm4xDTR+VOpRNn4XMdkxnIzJmdUzqKVHlxHQQhXjJcy+tEqBnA0FiUkqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Dz+hOXXzBRP/gLMriNGtkNpsg1THjB/csTcrFJ0tk28=;
	b=G5qDqfcyqpqaoPfz9BGeSMOpGXI1gHTAGfcFuKkFQZw4GHlXLCqinpCH5i6BzxAzE6+v
	 RDYG9z+9HybfI/3hsXIoXEgmmNMOvXz6ZLC4cVqU07jRkW2wZAxf0bZMJ0/rmt1p1K7SR
	 a/+ACxBAq5m8Lclpe/KRawYNSL9yFPXbJF4V4tUPUjvuiHpVDjyy/kjsSFsDPqhLRyhAE
	 1PxPI1uESGc/RLmTWWZ+ZgCdC1rS9vt4S55/Hbzw9SlkzJ2ZsSY1iy5GWD4EzBVpgEqQL
	 3R+c5SYr56tLLsm46L+JUVXvzN7CV1LIzzFLYB/Eg01CiTnGty+9CMUr5Y9hbBPwN7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pKp3pifZ;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6EF606A884
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 10:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA6EF606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pKp3pifZ
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48b001cd92bso385929f8f.2
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 02:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794996081; x=1795600881; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Dz+hOXXzBRP/gLMriNGtkNpsg1THjB/csTcrFJ0tk28=;
        b=pKp3pifZh7oPRMGIdtXhtVCIF9w7fsfK1OjN9ZPXwb6hqnHbkJ5QIO8yaqRaYGMofl
         GLVxSRH8TK4RR5BHl2jApdlJoal8KdDADynWdzAVg67RcrXeBBh65J4+2RrqB5sogJ+1
         1exnMUssiaPwgqKELu8a+21av9B9EhMuA3Vfwx6WC264T1y4rjQXUlv+ar0WmSnLHF86
         Eib9dybZnE36/WA1BukkZlVvOvA27avrYxdG6YYa/f3E7XWJwQq1nb9sSLoclVR7XSD+
         wm7rXHqyIT6BBdBVG9SNPXK6EUrWCHLMhtmFEpVn8ZhxlCS6wy+hfX+nAAHvPd3+7HDc
         Khxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996081; x=1795600881;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dz+hOXXzBRP/gLMriNGtkNpsg1THjB/csTcrFJ0tk28=;
        b=13r1zsKicOlV/sy1Pq69xxkTwuo8ite+WOTzGiwpIynYXBdAWo8dFY4ZbXFRT/6H7G
         vdm/6cdIfM1Gxv/CzHRUc2Uky3NhIn95BQ972aQm1zkhqaMx5LmyYygVM2JwymSXPwhg
         gGAO3I/V1ZkPXUqEKZZX35J5r7MMReD20ogsiBxLqENo9isehawpgxqcOYVTteMDJq9V
         Ff1F4qp9nj1dJ1e7MoSgrh4Yrxa5Z+SEt3jvIfjFGj1441OUYrAXmGtR+ow8JYXaLCpc
         MSNxnx+g5AbHfWBsBdk9ptwRGBwopLBHhCahv8IVXdnA/5ELLQnuiO/JkvHR1AyuAhc9
         TWxw==
X-Forwarded-Encrypted: i=1; AL+hErEqwhLAHRLK0r5wLVFfCHwE8vhTRcZhZEG87MYUK3KakFeWCDsL3kxfMQ4dMV5LWYUcjQqYD9bE9+wg@vger.kernel.org
X-Gm-Message-State: APuU4Z8Y8WcyE6LxR1RjtHYCnVAmlm3OTmFqGAlUCt5Oh+kh62v5shU1
	2a5XPU09dL08H29T1jilY5JeJeqSJ/y0yi2/lXfMaa/qjEaE4PrvINk05YeJBRZYgVM=
X-Gm-Gg: AZFdTZdvJgLDZE7Ox2JxRse0tledNIgsdOnZPAXpvmprHOAPfg3fIMzq9SBQALMphgc
	HW7njYmwEhdeFVpZL0agI4Cou0FPZVL0lf2blIRrPMpHl29KyWLDKhWLIX/j9/Oc0EjPb2XZURt
	r7cIz3Z3fIGxSI9Aq5UPB3ITjDJoKR4fCZjtXqLftCRKwtmDFkMtU1BA3xNh5+GQkNiMfXvUFZ+
	LOAAzYVQ48zxjd+EqQfZfUIm5CB/PbPSjFMv/4j2M5cSKxioV13qbt7X/D4jebrgHazj0eOuQAv
	tbFhyGOaQjaby0T99pnP6OjREWiaRqxQ24gfXigGF3SgBxWQ9UF3gA5FtKsyf6N8EGDefnT2Njh
	UN8SoHKdF8dgooUmPPDyAjmfve6HuAjtbDkoMXnC1nWpr+PZF2UWmewGFlNCueLl2PPWFpwUQPl
	us34KZ3AEev4qJ88naNlKCSwbwHZHv/iV1lyJaB+W4BsnL85deHTbOonQVZhXbqD2rKrcDgmLRL
	9YzkTfE/SdSRI9oL5dAdnF+wkLKnWpTDXwCxx6jjyEczCEM9Zk8aQM0bxenviJtY6jmcSpTpsN6
	nnHow42jyQ0I412bhcBfyOAoDZVSXO0b6A==
X-Received: by 2002:a05:6000:40c6:b0:48d:f14a:9182 with SMTP id ffacd0b85a97d-4a6385221d2mr4182620f8f.20.1794996081159;
        Wed, 18 Nov 2026 02:01:21 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c257sm3680960f8f.13.2026.11.18.02.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:01:20 -0800 (PST)
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
Subject: Re: [PATCH 4/7] dt-bindings: clock: Add Amlogic S7 PLL clock
 controller
From: Jerome Brunet <jbrunet@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261106-upstream-s7-clk-v1-4-7d501d62621f@baylibre.com>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-4-7d501d62621f@baylibre.com>
Date: Wed, 18 Nov 2026 11:01:12 +0100
Message-Id: <179499607256.413320.16082664027719861712.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=429; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=PtXjyJ2j06GU7bMSY1qzWJs0ZQx1vl5iBDW33+FUIt8=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFl/y3M8boiXW+kLOhSXHZTU27xnp5PmcweXk7N8ZknuX
 1v0M+5xRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACZSGcrwz2CTn+HNd5EWG9bu
 uVr/eSPv5Aat481OXnkbIqTyq5p/+DH8Uzpp5HBPWOtsl+SVHVlxdlVPN89t+rGZe5WDQ9zFwIm
 ijAA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On Fri, 06 Nov 2026 09:30:27 +0100, Carlo Caione <ccaione@baylibre.com> wrote:
> The S7 PLL controller supplies clock sources for the peripheral clock
> tree and receives its reference clocks through firmware-controlled
> oscillator gates.
> 
> Add the binding and clock identifiers needed to describe this
> controller and its connections.
> 
> [...]

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome

