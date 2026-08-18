Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1B2451068
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 10:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049108; cv=none; b=HZOQepaITYucRvuMfGtjxWlPHfJkoolQd5xcmlI+bAlDCcUw/spbhmv3GQrd0NCqJU0RIbuvnvPuaRpbNBDa1zMqUo/rSnke45+pmDgkICqPR46jXj7W6yPWTtOMsXIKvxVaiGqnp0ec7ym/bwDckFt03ianEUH5ruHzb5HzknA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049108; c=relaxed/simple;
	bh=MB7LGi5bia5b4s3lqho08nciPjjAh60PaTv8Fxk69LI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t2quut/QtUZgvRhc0M/Ht8QVEQf1z3uLCYYHXtzS8cSnpc/pjKDoJ7yoTcb0XZTCV58ALuO/XAY2ByUZPyHYRdR4dhjWzKw5HgONz1UQ7fVk0+a1eM69T3UQIn1yCy1go8jCwBDPuk2cG2blocxZS946E8Em6oWAJik/Nqj17P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=ZpPL1hBN; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="ZpPL1hBN"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4956869750eso29951105e9.2
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 03:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1787049105; x=1787653905; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SehFAIGV4EScw1eNaWWBsUyEtfJAkEOaG1RHubt8kHo=;
        b=ZpPL1hBNAhh9e7Fa/gznaduk147YgM/1Qp/GspKesEv31lYOAL3WB8RPrvzF9l3HT8
         wEdlYcwLFohII7K1oKz/7/dGnczF0sXAgQsDkMfxoN937zUaf7n5m1IlwXRuksn8mJCF
         EqdmAFR68dY0nQ6kIQw+cZy8RsBycZCXaXaPett10qOfxZ0QP+aEk+J6pZJfbAsYbc4d
         Bt6VOvWkJFiHkIxcmlzpGwL3d40HVaxKFtOLr4gMnHar7mD3Nf2KMsCGu/vxACBEkDr8
         0z/fbpRQDZQjDW3/omP5FfT7LTXypYSOVCcPySNYTv4EEJycD8SqkW3K7BPxw1gnpAmk
         AZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787049105; x=1787653905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SehFAIGV4EScw1eNaWWBsUyEtfJAkEOaG1RHubt8kHo=;
        b=eCsJx5hAMRyBGdxejul9p4CCjnHQRidMcIPd0DyK62hmw5VHC6FvAQ0Xfd5fSLBywa
         DyGs439ipLi35Ma3bJZVfdZPE5hwclJ6ts4x2nIgYQlJcl02z0wJDlQogzWGn8Lpq9X0
         Cf9gWhE1k85zkerSUDCJLM5yO/XzTyscEaMAn4kntUXA9AyI4P7y9gP22pEcR8oSMB6u
         C9le+A4zCVS9a0+BmHjWm15Uk3HOqIPcU7NIrVZl5HjHIIaidVRxFwsN/DcLtWepPXgB
         gNkDVUyoRZCbsM3xuhD3ZxBmzdWJ9rorX4lgdx1r5sr4CzJsBMPyC1hZNhHH7Y4YVuZa
         aOyQ==
X-Forwarded-Encrypted: i=1; AHgh+RoE1ypZUghJlfQ+vjQJOR5bDEyAF3FQ7HX+62xUIOQrQf9kUEiLJLWNUz5Fy2YZDF4UmEu4QMBDvZO0@vger.kernel.org
X-Gm-Message-State: AOJu0YyLFTsMjtArctrD+jlIWrtT0f85vF8cY3ignOu/GBh5GbHn7utM
	loDHd86A6HwAILtVakrpU0MBa11TzhVJoS2ckt6Q1L1NKz3UN8MO24lX+Uyq2/efWWA=
X-Gm-Gg: AR+sD10Y2qoq6Ht/JekJX/4LYszVwvZBiRLZcESvYzZsWAbb+vMo+eK/1BvcAt0Kmbl
	Lot2tRNHTuMcqWhmRXmhyusv10s9qq/8nEtry7AoGQxUjjps9KrC5EraP9CzZzSFdoa/8AY+HLf
	uE7i801DF/PNH+bOm/1OB+fwbkIpCZQ81IwJiaJazs0v67igj3ZjzSH8TWejtHeYEGJxcMjrqKs
	QCKXVRNNJxKr+nQV2aVkZmnDGAQDN+OjPaPKwNkMMKZpYWHCxIVMy8MinVnn68jndNzttEGPghR
	VgPiNlvTyene6HOJjGn4XJBIAf9PzRDWUdtDxQGlSEMkgDx6nMtSo75NfBSBBjkXrXgZuW34rX0
	rwqJ77lBpfmmXWf5jSqoODxEaBZsOtRq3zCK0gZgu4aZNOJnSURgpW3TqjmUDU6ViZUJ+U9aDt5
	7rzgMDAv0lWXKJOx11PxUZlmcRbrCwBqp0CfvAoTObcJWpUkVcxftIvmFF1SwsjTrxlgWSxDp+q
	eHSeL0qR2h8YNq4dTMTHErblazUv35v3FNHaqYJLZG7bvkBACyHObcNjwKP
X-Received: by 2002:a05:600c:3049:b0:499:781e:25fc with SMTP id 5b1f17b1804b1-4998792e359mr338967655e9.3.1787049105086;
        Tue, 18 Aug 2026 03:31:45 -0700 (PDT)
Received: from [127.0.0.2] ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499960988c6sm246025575e9.0.2026.08.18.03.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 03:31:44 -0700 (PDT)
From: =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Tue, 18 Aug 2026 10:29:15 +0000
Subject: [PATCH v6 2/6] serial: 8250_aspeed_vuart: add aspeed,ast2600-vuart
 compatible string
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260818-aspeed-driver-v6-v6-2-fd7cc0b338ea@9elements.com>
References: <20260818-aspeed-driver-v6-v6-0-fd7cc0b338ea@9elements.com>
In-Reply-To: <20260818-aspeed-driver-v6-v6-0-fd7cc0b338ea@9elements.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 devicetree@vger.kernel.org, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Gr=C3=A9goire_Layet?= <git@gregoirelayet.com>, 
 Tan Siewert <tan.siewert@9elements.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 mfd@lists.linux.dev, andrew@lunn.ch, jacky_chou@aspeedtech.com, 
 yh_chung@aspeedtech.com, ninad@linux.ibm.com, anirudhsriniv@gmail.com, 
 =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
X-Mailer: b4 0.15.2

Make the driver compatible with the ast2600-vuart.
Enable specific configuration for the AST2600.

Reviewed-by: Tan Siewert <tan.siewert@9elements.com>
Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 drivers/tty/serial/8250/8250_aspeed_vuart.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
index 26fc0464f1cc..6afa2f4057e1 100644
--- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
+++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
@@ -560,6 +560,7 @@ static void aspeed_vuart_remove(struct platform_device *pdev)
 static const struct of_device_id aspeed_vuart_table[] = {
 	{ .compatible = "aspeed,ast2400-vuart" },
 	{ .compatible = "aspeed,ast2500-vuart" },
+	{ .compatible = "aspeed,ast2600-vuart" },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, aspeed_vuart_table);

-- 
2.54.0

