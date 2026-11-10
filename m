Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280405;
	b=KKTcnYqNySQeBu9anK17urLbXPwcn5ITK8comLOlCHUwZh8KWspIQYOst0O9REqn9m6/
	 Iqi6y/ryUnMMToWiNBE06PMkHl3I6kbCQpJcTrOdibXJVJsoRW2oYCvXTpGk7RPf39pbO
	 vvE1Lkuanq9/TZ5zFYsMXobSWNf5YsF5rD9tJWeDNHUt0qON38U50O9vD3C00euOVMxrX
	 48l+H7kJYcxL+jvu0glchWE86OamFvpZnvHGdudjaqiNALXHGdXGpS5xiAYifloWyhAGt
	 EqN0EdtptdymZ8cC3Z3qd3hG0K7JvB1Eu8P968r5x12DCmvcK7GZhl1Xt2CYYTTyTqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ZsGYkHSaF8D1INVVG7IqcJD0MRHplG6cSUzvau3umEk=;
	b=jvgf/89dqG82UIlLAx0dyOWl08fPoPLkZUn3IMDmIwh+X04AGA5eogVWXagZudf+QBqH
	 UPK2pdfZtuyfotqXlOftws226WYJSbpSkJlVJW9Ks6I2NS4P49yDUwwlqySIbnrGi4Lfe
	 nIByPjlyPCtv3/fIm6m3kf01ZcAjyJj/B+FImlrO1hfSuTwsU4cvpx5ZQ1icXfl9kJvDV
	 QYjP5QbAdI8c573a2L1kqDckpcD8oqgd+TpNmux3CBZYhQRqhrthdiOkRm05tvOHgw4IR
	 63Gy3T9gNPAnsIOg+n7YI6mSlBi8cpxJ0rQrMzsr9I85uxfSkrcWNrHYPxVAfJQc3UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l3bjQbyi;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C632160A5BD5
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 03:13:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C632160A5BD5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l3bjQbyi
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-825b40f8a26so716165a34.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 19:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280404; x=1794885204; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZsGYkHSaF8D1INVVG7IqcJD0MRHplG6cSUzvau3umEk=;
        b=l3bjQbyiXUB14A26wKcSv5ua9dacnx5+WhNFzm0Ki3HQpqBbk3Gsc0Nz29dnZA/MW3
         +MDpuMWMELqUVajxi3Fuc8EKLVIDZJkX4mgNrYWHtfJEHjsNckS/IIeia2rHTtotdyb1
         V9u/IserDlXT9tduNcT9PTYazDOC48j8+Q4T2lyHCsjBdMKbtRzgwWa/C2kg8g7rC4u5
         IHRJFfs/PiG6lfqzYOyzpqw2wdcEBdHRYdiSKXJqwvPBCpLeuFhNgiyXpzTc7t1vOhnc
         CXswg5b/5He5KGHzjfXv4gs0ccrZuxRD3DUXplwUvR3B87Mhp51lTloovxdNsxFA0Npn
         SS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280404; x=1794885204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZsGYkHSaF8D1INVVG7IqcJD0MRHplG6cSUzvau3umEk=;
        b=bGaEVld4suZLmfMzdNHOCxiSqPnmLSK0HJ5A0uWN8VN6MqQT+uSbgpBx+TCPnd6UnG
         7TJbe7C+rEVlxpHfqxl9k9tmP/4jqpU8/gmbIu8qnwrfYXZUNu3fNdQUuxtTPturLqtG
         1T5aR95qmj6yt3hhBk3ZarrMySa5E63CV7ggIx9SlLXsKfzDXVLBLGghEHZagqaiohpa
         pZGWn8qUeG2GK+aDTsrZwMb6vorAuXQcyP9KedSCccxYzbyJhAW1oQXtoT0VpZrdQjV9
         QmPOrwg1WYxiEB7RRnCpxc+bicPisMu69uK6W7otoe8jHr+X0q8WfpVStAwwaoLGH0R7
         dIuw==
X-Forwarded-Encrypted: i=1; AL+hErGypF2MG9R2Fd4OWuVhl5ZwGJlJetr/vVP51LLjhS7JHUDbJVro0nJUjXEwjAWsF3KQ5Atmo+7fwg/e@vger.kernel.org
X-Gm-Message-State: APuU4Z/A6l/eWKFjM4ymHCr9FoQdkIoHlT/rXtv25awsXlmRK9f2QLYD
	ZXsHalRzKkmemGNK+XlB5a330O0ICGrW4hydrVhyAH8ol8jBkK5wnR7f
X-Gm-Gg: AYBFou3YPZtzVWbi07Bs5Y8VMG+vB3Pu6p5/gumHXHHafZrrPmKJCQCQmzRPi4G5h6M
	nKSAIs3XTYNWEIJzBiBZ3ImGncDLs81rc5XZGHPXC9U5DUuktyYz7pE81mjC3S05g7OJ3P2n9qY
	jdm5OWFC5h3DtbfkciPos3cNt8IT+J5W1b6hUG41qTQNvn1wUWbX6f1csjFglEHHFd8HpBRarq8
	SHYjiY2MwQHJ1lvra3VIshTqCAZ3k0+6JiOIhOLNahEs5qW/hD8H6JNEzprDbP9+lFWucdfRt12
	wuWo41Yn2QawpR5P/5XVWUgjKfNTqJDYOKgx0n2Uj4eeN2ifSQWSWp4yaBgDrDM/66j9eb3nYUk
	yUwzB9auZXUe3mwP5IonsNjho3xBRpxkUqaQgxBbBbHzE38M05Q+oPfYXWlLrwglFYu4W0HGBRu
	VDJXHqrj4YijgQiLSYgLWc9DTuDRS5Seg9fccW822l2PMmJnnDVC1CMNkZy9bvKdHUrwoHOhRyn
	oUdqwxrPTMApbqJiqnyENczPi/QgvvU5H5r0kM36vrisUUXaDlQaKSoi7Cju347qQlA7pydl8QO
	BOko/2rq5Hu1hPgTOAvD71IxOsv1sxqksUwXNsN5UQTWwKydjKcjEsaqFdxO7N8rrRding+Y53R
	0e8gp4bTwPJldqvx8Q75dA9yAtAYXKbcukEYWzgk1q378Uuydb91VMzzNcuHT+RrLQWb1XgrDO5
	elXwDmLkNu8laA5AkO4pUMuMWj/s+6tRZ8Vd9HbdOwuUrStxoZu3SO
X-Received: by 2002:a05:6808:509f:b0:55c:8ee:a9c4 with SMTP id 5614622812f47-5683cd30aacmr1359211b6e.43.1794280403760;
        Mon, 09 Nov 2026 19:13:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm1019236b6e.8.2026.11.09.19.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:13:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:12:58 -0700
Subject: [PATCH v9 09/11] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner A523
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
Message-Id: <20261109-submit-h616-uart-fifo-v1-v9-9-3f03961dae8a@gmail.com>
References: <20261109-submit-h616-uart-fifo-v1-v9-0-3f03961dae8a@gmail.com>
In-Reply-To: <20261109-submit-h616-uart-fifo-v1-v9-0-3f03961dae8a@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

The A523 UART integration has different FIFO depths across its controllers
and reports each controller's depth in the FIFO Clock Control register.
The receive thresholds follow the standard DesignWare FIFO-relative
mapping, while the optional-register layout differs from the generic
DesignWare integration.

Add a compatible for this integration, also used by A527 and T527, with
snps,dw-apb-uart as a fallback.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index fc1289073241..ea6ce99178e3 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -61,6 +61,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun50i-h616-uart
+              - allwinner,sun55i-a523-uart
               - anlogic,dr1v90-uart
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart

-- 
2.53.0

