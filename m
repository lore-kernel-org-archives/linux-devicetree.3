Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903946;
	b=y18LX77I5HfUs7bCZiQMx7g40tKhvlcL7hg3lvzhN1MbdYBvOy3LMm1PDuDUmtbtpURd
	 YNXJu6qRrLDj1nUV/1r9NaeIQcJbPS4OBmMv6jjaEtFcXPYQvvO11NmzBHkl1xnwTePjO
	 XTb4OanAVAcJZQyMaOsPlDf+1X4qci2T0utb2NT4wizsrLHPiCXypLij+0nmVIFX4cz9O
	 Fr90Bm7+KLw/Ks8TjaVCuCI6+PyzS68G6qdExMQRQaYgTyeYNB9q7n6UvUeILtxFXSjb/
	 5Q8lpfASt1kzIUPGWv/KX4EjbXJCHORe4oCbxnFJcqkgNZj/NLfqfRGlV+t9Sr9f/QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903946;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=XGcxmoYfjlX92YHiOef8ZcG7B1FJUqi9YCrtia++R2Q=;
	b=nodPWiErqccJxbKkvz/FLHdJoYi6m0fTTc88u/jLxZl6IWrFDKrwC2javmlVw5vU5z+W
	 TFw3MjA4tpp0seckCZoLldnvGOmXtzsboGDNTGVlwUkfAdAvF1IqoIwyzp3Oipk9/zXhW
	 D/lgmj646o/0W+UDZxCZK444C3HwqSBdDJ44xVuUoy7ZkJ5RrgUIR2/vlpfeY7hin/FmE
	 LT09O6lOiW/ycP6Yjdvf6SVIRRRP+OHok2T+bI066YtrutAKyCZsXauLU0b1F9lm/UdB+
	 dOTr9ovdvBjxtqVQmRRwZPwEAyKAzK1qs18HeQAH9SadZjw8wsxTSZ+i8iU7vX34YMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B02606A883
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:25:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5B02606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e98798cbddso22605265ad.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 00:25:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903945; x=1795508745;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XGcxmoYfjlX92YHiOef8ZcG7B1FJUqi9YCrtia++R2Q=;
        b=xGQy5yJv7Ws5BMNzQ6GFTHjgGcj+C1jnrqKToZJArG4H9QjaR5Wnv9INKZvgPF1akj
         kCLFXEHRFsR8QRbF7HDwpUgS7373tiiESleIRxvncAP9N5ZBtqImfWui2Iv4J4zD4h1M
         eDHU2c39OdUtIfAL/44/Xjbk2iRoerZWpGxl4ve/enyC68WfcLd1E2t+AbrMJeqMnWW0
         k11VizTuOtwI5A/xog3X13f9hTiQ8b/ItXhcI5WG/gvY6gq1vlkmZ3/xkHa6ArJUsKi+
         TzispusHTzMbpCfs9xX3ejTluT0ux0mAbBZypzC8Kzcvy6YnuOYyDQ+feo2109avzZHp
         Er8g==
X-Forwarded-Encrypted: i=1; AL+hErHZtwurhf8uSY+7kKZ0jd6xJu6M4RRyIJsnIwDxMGdC+kes+ajUlt0GEukCsbFqVKNp7js26qJ4OANM@vger.kernel.org
X-Gm-Message-State: APuU4Z9Q3Pq5cWqmpWGuu87L7asKe7UzfY+pVvjcHAWOClTgwyy7GsiM
	gxPKwJgCJa93bAM5eKZ3JqqWeGXkwexz6LF5AfStx5O77nkMCvZpVYdWicmgYkQL
X-Gm-Gg: AZFdTZcqvIonvnggCzC60BzGsNSByK/Yh0OSan+BGdsbIYTAgNRVhk6ix9ElfPvejNz
	GhJxnP2GfxIKVMfE0uga6e/S7yoMj/aC6rMKuajxjuDqVdnpTF9d4H4b8mIMWgqjBOzZiRfaEg/
	9bYt3s1SkdYzJwIWJKmJyZk4GKdjd5A+D6cUsG1nU7nQQP84tRMUR2DcQyuFU9B+CDWGbiK2SrF
	RhlwP57a6RepjA5Xob302FhICsf00QOOAoR8Ppc8DIK53mmCXvmrc4PZN0eYebJErwKZwyjMYna
	owAEsKfO0mm9eKDBEVQ16rSb2MmXESL7LRT2zenBpnQA5Q3Ppg9EvFT7a223whz+YhCDKUS34XA
	/cmKpVqt8MNJ/KrpI2/Egv5df4PArR1i1SkrZ1IIi2URl5WN77Oq5h7OZwHontnGaalnV6Ctau/
	2UHbDmZqP+3wG31TJC8U2E3BK5QIM9s+TV+00g1exdNNsV91jLP7kYq96XbaTdxVlowEUuSmcG7
	btcDwZK+SFGMPbFVrZRDqxqVnmK/UOzfvSn/FztP0ZW0B+qyjJpLfwB3aBqtZxmcSCe2m2xVGYF
	q/07Y6t6zL0QHnE4IC2wHBsXYpx0ghNpS5yLUvIfXAg5FegF8qOg2ua97VtHzcz2kYlZZmriXRa
	TUeqAt+9/bEKWAP4IhbqtxaR/qV4r9oGG1SCmFJUPpsMcpNcXrKYY6viLtrfcC6+fqQ==
X-Received: by 2002:a17:903:388c:b0:2ed:29a5:7828 with SMTP id d9443c01a7336-2ee0de418c4mr129938575ad.11.1794903944969;
        Tue, 17 Nov 2026 00:25:44 -0800 (PST)
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com. [74.125.82.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a85f12sm11011075ad.63.2026.11.17.00.25.44
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 00:25:44 -0800 (PST)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2541028eec.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 00:25:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGEnUQBc4PCyOdADYx56a4XXaQpspkUVgjZAvjhsRupkqLS74fZyKLwzH3c0CNE/TDtZEV2PkyvOVXi@vger.kernel.org
X-Received: by 2002:a05:693c:811a:b0:36e:9763:9268 with SMTP id
 5a478bee46e88-3796695b721mr12921261eec.26.1794903943562; Tue, 17 Nov 2026
 00:25:43 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-iio-ad5246-v1-0-ef6b7c06d4b0@telaak.dev>
 <20261116-iio-ad5246-v1-4-ef6b7c06d4b0@telaak.dev> <avwNWJnsOQaZSWi8@ashevche-desk.local>
In-Reply-To: <avwNWJnsOQaZSWi8@ashevche-desk.local>
From: Joseph Telaak <joseph@telaak.dev>
Date: Tue, 17 Nov 2026 03:25:32 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ6jC4S6ktOBGZ5us4FgJEep7QeFOP3zs6NgZyV=kTJzrw@mail.gmail.com>
X-Gm-Features: Aa3M54pGquVNkJTL3e8HLCz0b2WyudTbs-YMALBBjS-DCyuiUkBpa6nnBIohZys
Message-ID: <CAPY4CJ6jC4S6ktOBGZ5us4FgJEep7QeFOP3zs6NgZyV=kTJzrw@mail.gmail.com>
Subject: Re: [PATCH 4/5] iio: potentiometer: mcp4018: Turn on the vdd supply
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux@analog.com, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 17, 2026 at 03:20, Andy Shevchenko wrote:
> + dev_printk.h // dev_err*()

Will add in v2.
