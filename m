Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792746650;
	b=W46ovTL1tJqkKn80a6dFveWHcHw6/8ELHi9QnXhUANOFCym9XhH+klAIALW0xmluUJdO
	 QZLmSVfM4jIDDH+k3aje7RcQ9/UKYRb4EJriyKsOnMVVoCptHYylVmVZvuzhjBKfTSLIe
	 WKiqnUzml7IwgIeVKQ1JjTIO91ZV6Av0nCif+MsIqf5yaBiizYv6oG8nUZLY5zONvTtIG
	 EhbUPUP2bBkNmuE0x09aXHWojef/C3R892W/i0MtMk3sT4/Blx9PGdHtBBwIkTd2DeIaT
	 bFXYeLo1TGEMQnrpGB36NqF4aolLkjRXLi9GLjbuyNcHTn2AyPRj8+UW/goHLyOhT5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792746650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=iks0aFSHOkkGNM3nhF8ovnYM+3HT6MOjrI6VZAWf4VM=;
	b=iMxuNCNOuxnTqcMFFYl38M0UHTc3L1hc3MlqQftiwEMY5jU49ia4yGAUlX2JY7mMWE0G
	 Ge2DQ3hIaxOQpofM/GPFJ0YP1OHXBfVq/fmrzojMF8s5B1pTJHZAmIvsmv3Yy0q5ORBik
	 gS5C1SbBaUpzdyWDSA5jrTSHydsjrgj78pDRH3HaK/wNw8Fa6CnoyLpiK0HvBQsbIrptn
	 S1zGoz+RFrCWrOfUGK9QJWztQALZDeiHPNfFFZLyQOpKQL9oYq9qys5K36BWiiYoF+9+W
	 WHA4iHOp7TTZIratf9NeROAhTVCUXoTXoD2CC2GPlnr5CS5yxE78WDqXOiCSsN7McPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Pbn2YXEG;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB37606A31E
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 09:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DB37606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Pbn2YXEG
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so1269204f8f.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 02:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792746648; x=1793351448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iks0aFSHOkkGNM3nhF8ovnYM+3HT6MOjrI6VZAWf4VM=;
        b=Pbn2YXEG/rXrfUeBygvLj0POXdzY0Tnwaufs6IOfsyh+72cx6EU0qZmQ6wPL+QL6Tz
         rlAu7ZbVJekIeLLzIVX6D7UNR33vy96PR43DS0LqjT4HM9b4YQn7oHzchOijnf11FpS4
         EnZOCUYWilwSKVDKgZFe+sVWlBDTVrNfHFYFnRxBmd1xhKfTAASYnT3CP0BdJjKTW00Q
         NHZOWTS5p9fZFwmi+b9Ok8ChNKELCdXBnNAh0ixKiFIqQCK+VOATwZNYn/njd86KTwTq
         RRSyY87JuOScGciBuE/F9YUfAXKIXhBpeYN/kJf8APs8X2Eoq6t75dHMEU0VBRKdQtnw
         oA9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792746648; x=1793351448;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iks0aFSHOkkGNM3nhF8ovnYM+3HT6MOjrI6VZAWf4VM=;
        b=M1F+pGLKywNmv/cthfJUgSXWagH807cQMVxpDeDJpeIbSu9jyvM8YFlt/174yf1v4V
         Qf/Yse2S6n1xgi3pypTdccc3i7l7dwLgoQl2iLRMOwRSDusHFHLSxBuIwuITDoSQXJ/U
         Hd4D9mGqkCzJEZ6hI6QRW3bdraKZP9/RJWhU6z0WuLWhP2h7R/VNfwjnCTEmlyi5GDpU
         U+rEgAwImoqrJONLgqjHJ/xWDXwx2GhcK2Iah6qWT5FCnOtpezY+xXROCY40R8jCf1fS
         UEHbOGpI4bWrJ/iWloGyTmOsk917eRac4LhlxzFq4E6m6FKz+IVAOvmtTUQBsKrmaS4A
         EkXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHDKzFGSTmRcvG2y4LanPSrrz6GNL2luVLMrw8AN/JqmVYjoqg38MHZ9FUx9qaRz876aPa9mXQ+MBA@vger.kernel.org
X-Gm-Message-State: AFq9FYJBwi4UG0VkaHGTk/Zk4WtPqMK7lH80Hrz/rBaotJuSQGtsoS1K
	HEb1rkRbEzYAHk+8JVsum24jJMkXhFJNtDoLF9mctq9afI+dcMFcPqNB
X-Gm-Gg: AYBFou0Dpp4q/mKrEvrESJL4kHCRMvVDMpFBkM+Xyg9EWhebSOHxhMSHzF3UP7NnBSq
	O8xWL1RS4fH7itLRVoPFHUu4Eryv4G9SFaGJzphYSSbgLNzeMg/CUD+F6cew1lCpc3Eim4kUaem
	jX0Ghy/ZiZM563lPdw9DCVuMijZXb8wN9wRdfMFZHPTPObgZNnYQMNDYDNhv6zyW2bL5iRqePlp
	N+VPyqFTQsa6J/gpxWyPZ86H+hx3locFoA/nawNg2T4dFXR7PGeUdnWzyz+ZClWicNL8Jlw3EaP
	OWcftoIzWp4UjJpIk0sGDIQGWtELeMJyXe79MxmG2myUTdTAn1lGCcw6TUgOkMKK5FrXtRS4B0L
	QABB/gJzVg0INKjwKDuSyJ1MmYDi8NvJ9hTtrE5y716BrPRwA2yNOqurZEyq1HXnLBQCsL7ls/5
	I7YJIxEYT/rZJ8cgx0C4RAG7kk4DAy+mmTVbS1z9H9KblRjk9k+iKc4QmBzjpfRhPlRnrO+C0WA
	PP5wZmJlMmESQbkuG+eEQ6irsTCVTGfMd3bbdBnXbaW7uqRXdPFmVGl+Cl5Xue3bT40drJA+7S6
	jXqk7hPsc5Sv9DmC5/YtT8jyFfPiujqZMQMHQucVjJrEN8mIiDQ10YJ05hGfsMr6gtTJaF4GuLy
	RmarRFLOE9J6Cvs6xrDUtk19nfKOe2BK6vf4dhE0kSZx3TjPe1W/Vaa0Wi1PSSPUW73ImPcXrnx
	3vu2syw7hq9Vo+aUry0SJC1jmAYlNaTSW34V6+nksReaRfmvp4JZ2hHdqhyfSN1g==
X-Received: by 2002:a05:6000:1a88:b0:48e:884:affb with SMTP id ffacd0b85a97d-48e2d273444mr10748908f8f.24.1792746643235;
        Fri, 23 Oct 2026 02:10:43 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3803360asm3931375f8f.29.2026.10.23.02.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:10:43 -0700 (PDT)
Date: Fri, 23 Oct 2026 11:10:32 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Jesper X Nilsson <jesper.x.nilsson@axis.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Stefan Windfeldt-Prytz"
 <stefan.windfeldt-prytz@axis.com>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <kernel@axis.com>
Subject: Re: [PATCH 2/3] iio: light: opt4001: refactor driver to prepare to
 support more devices
Message-ID: <20261023111032.0000019b@gmail.com>
In-Reply-To: <20261023-opt4041-v1-2-45227f82d05c@axis.com>
References: <20261023-opt4041-v1-0-45227f82d05c@axis.com>
	<20261023-opt4041-v1-2-45227f82d05c@axis.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 23 Oct 2026 09:48:14 +0200
Jesper X Nilsson <jesper.x.nilsson@axis.com> wrote:

> Prepare opt4001 driver to be able to support OPT4041. Extend struct
> opt4001_chip_info with fields channels and device_id because OPT4041 has
> two channels and another device id.
> 
> Datasheet: https://www.ti.com/lit/gpn/opt4041
> Assisted-by: LLM

This tag has been deprecated.

> Signed-off-by: Jesper X Nilsson <jesper.x.nilsson@axis.com>

...

> @@ -388,19 +411,19 @@ static int opt4001_probe(struct i2c_client *client)
>  		return dev_err_probe(&client->dev, ret,
>  				     "failed to reinit regmap cache\n");
>  
> +	chip->chip_info = i2c_get_match_data(client);

+ null check and return -ENODATA on failure.

-- 
Kind regards,
Joshua Crofts
