Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792477776;
	b=HwizcOVxfEtwdVB3LzRHJNO8yPh9h8KvEs4XtH/IMOQvHfebTp3HE9EW924JEW2PtRZB
	 Okb3G9SAh2XN5EvePgLV65vCZJISFxwhUFe9xmGJ/cByvavkCNuppeCiO9YIvTtg+YuEn
	 9tQLPo8KTnNKGFekrG85zrKibdqXYPnXdFgC0koPLzdPsOy4at3jIdtTKbcFkPEUj3HwB
	 t9A7S5VD43Z/yGIlL5qkeYj7qlquehgF44wI1J2Zyl6TNREFgBW7AXFJkGj2vmO9yyUoG
	 c+w1n+S3tRCVo46KRT4MtJIFmYjTYT4IOdsGX9B1uDZBRnAQ46vZNvaVKIr2oOFJVUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792477776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=7mkrcGya/k9xPQHP1kLMQ9K/TBFMnTEolY10HA2nCkE=;
	b=bZ6daDygvi2l0zH30W2L295vOBOuy410UKs2ewQvJRlQ4n0EpG82YJcefYmqM7BFsU1f
	 E9CIwZ/leG6SeAfjw/xuU7qXeAjBm/35FdM93sLIOJPhKcBAY1dX5qBXUX0b6+ufJ+FYF
	 jwm12TH2zOPqqrwkie89hgjYgkm+Io6oKCvjQZE+0gGPs16rOgMPlgdbkFnzlG0b43KCh
	 op89ALVeoPaEsSngPCyUg9Ozx4UYfAE3ZaWlS5DIkzasEV28endRp5w5me9JFgAFAJxId
	 YX+Q6bw/NZjUBcN7eTepWz5mumXhIDyWiQxNm4TrOBemkhi+a5r5npM4YCjZVIGcuZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=elxf+78x;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EEC606A319
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3EEC606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=elxf+78x
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so278501f8f.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 23:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792477774; x=1793082574; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7mkrcGya/k9xPQHP1kLMQ9K/TBFMnTEolY10HA2nCkE=;
        b=elxf+78xlaN2+qBalzGsO3OM9GsMJcfqAFceAUiMP7K0mNd8dmkJOJ1zW5+JYF4X/J
         504zjvb7Hv6ECN77kmPFPKyZQ/mWyW2KfWmxH+ZBVVxOf9vqrnOFz6DNPFCOLTfq6fln
         iiFckYDAELsvpzXTqW1IBovXl7qRaTidqmcOkPN7CoYGkNkGOf9jWXTvY36/nCMKlFun
         ulT7M3Y7xD0wLpl9WWjwUKE0DYqnmwuIR5H1TSUAx6mityFxreNIVd21bK0FTROpCyLa
         aYbtwFQur8V1eRS454QxpLWvGh4UoPqQGEIqA1KP33Nc8QfbNBNlieMiOntd3r1oC0v7
         DRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792477774; x=1793082574;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7mkrcGya/k9xPQHP1kLMQ9K/TBFMnTEolY10HA2nCkE=;
        b=SxInzh/HR9SmifdnHPW2pf3aqeaHBKXAMkW9PaaOxrLk8Vb4QaTSzuIJLb9R4GoIvT
         Aa19GmmrgmtrYder4k1ZCWb2UOvTpFyBOpiSP4+Wg9d9hR3MMQwCXx6E+4uH669nH1Du
         RHHKRryFRxCvHtLjP2QK44tzlhXkFBYRTYvmdGIV7UcN/2jjiTJ1kXArbeH4re8QBBL6
         CyGqKGIkiD3lTHoKzr2PD9/4pezR4VcpD/WrZ0K+F0UUHvT+8xPfTvz0uZn0GiU0cs5Z
         Lp7N6vAC4boZY5RDMasTXMj+UOHgiQ0+WUAsJLHkpFwze997/KV2eJ6UHTl2BSU89gs4
         TkGg==
X-Forwarded-Encrypted: i=1; AKwUvBz0n+/h0VKtK3VuPLLXdGV+tJGqhulZ2Ur0KmGecpTIq7T+7rvlJVqW1yQQ/F0KwvLStozg+ZuKHCKg@vger.kernel.org
X-Gm-Message-State: AFq9FYL2DR9EAyqSIMDpO/ny9yyfilgIo7wiLp0AI6JsXTRjs4lg+ACX
	UoA5wjuYwhv1aeGpFRckJVhe3tLwk26t899Jo6iDg9wTXNFxwliVnjn4
X-Gm-Gg: AYBFou0Ft5CcfRzdvj0eH8he8tFvgR6s1Sqe3uNmOnIGPR8oU9B+Niv+brGIRN7EqiC
	g/ACfCII5WHGKrj4qpAU20f9eYpGwOLbkoA3zlB6EgVVS3Ie0VRF06sB2y2tcpiQnP0KkeswhtV
	r6LeSUGg3OsWkeaxXB84liZvI7CLqA2l9c+ddUO6Dl1U2dQU6CflcX4+NnCT8WeKLESy/cyMRSe
	iRKhh1HFEvLUHX4HvT8q6Jch0D/wqQUAVOJsdIz/E+lCEJehAEYrSayHDhzTLvqAEv6v7JMYTVO
	MjgcVKkVjX4x4nOVaSbTdaGuKJ+dHCctsv5kllIMhMS2d8di1x9WtTbnvVy84oqoR6pNbTgocAd
	pDe3rGCxgzdfpayQXWMVR2ZiJ/+Z2gzSG1n3o4ISbpAR/anNS3QuUgrTanWv59fz0O4ku65YDFI
	2D0A3W0GTP7y3LeFGNdmYvyetkvrWpf0IYFj1r35jKSbrdL4KijxKu7xfxl6gzdlVYGkUwCZ98m
	4s0CxAKeQZCtx//HSKc9jhIAKxcX8IfE3FadKhSKtHQEF9Fh2Mpfhzq19Wf3f9Oxf/Bl3AeLjj2
	MfsHl0TiqhkWXaKE3V7fPon9J7mqzbCLQBzoes/hVUYi3BRimj4F8kHQ27gZgUJAih9AZVJOwgM
	Ra7nU017KyRDtt4Ejn/hx7EFU5dHgD8uG+cFyjAjlafMSgCte3sPsFpePhR+qdmjW+kFTA+rHV4
	1QZelT
X-Received: by 2002:a05:6000:458a:b0:48d:ed0e:6bb4 with SMTP id ffacd0b85a97d-48e1e7550e5mr2034223f8f.4.1792477774042;
        Mon, 19 Oct 2026 23:29:34 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8314b0sm3948944f8f.55.2026.10.19.23.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 23:29:33 -0700 (PDT)
Date: Tue, 20 Oct 2026 08:29:31 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: wrmfwv@163.com, nuno.sa@analog.com, jic23@kernel.org, robh@kernel.org,
 Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux@analog.com,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tenglong Guo <admin@micronull.cn>, Sashiko AI
 <sashiko-bot@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: iio: adc: add documentation for
 adi,ad7816
Message-ID: <20261020082931.00001c99@gmail.com>
In-Reply-To: <5d43ce8c-18a8-44df-afa3-d0d1d7b771b1@kernel.org>
References: <20261018110015.39497-1-wrmfwv@163.com>
	<5d43ce8c-18a8-44df-afa3-d0d1d7b771b1@kernel.org>
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

On Tue, 20 Oct 2026 07:58:44 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 18/10/2026 13:00, wrmfwv@163.com wrote:
> > From: Tenglong Guo <admin@micronull.cn>
> > 
> > Add a YAML binding document for the AD7816 family of ADCs.
> > This fixes the checkpatch.pl warning about un-documented
> > DT compatible strings in the staging driver.
> > 
> > Reviewed-by: Sashiko AI <sashiko-bot@kernel.org>  
> 
> Drop, never happened.

The entire patch can be dropped as the AD7816 driver has been
removed [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/commit/?id=f22c353859f3719ffb1f2528eb5be8415f680aa6

-- 
Kind regards,
Joshua Crofts
