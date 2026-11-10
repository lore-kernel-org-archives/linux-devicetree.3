Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794322839;
	b=AMUK1ZghYVNDrHRw3rvpAS6vUgcswv47O5Z2XmywigrkuG4P6F5aW30eKQPZ2UDjkVV2
	 0Mknrpk89S38DW94pqVpPPQWzWlRyNw7Z6VoeECu1YDW5MQSjXtgF/LBgP09ZbTlIaHoB
	 a2ZJxJHLIHepdboQxp0nHs5u8WC7FjanSvrIA4BPzBB3Yac9kFM0dJlM4pUpkLfOist2J
	 lSSvvuCSD3y7oitEfFhGhAjVUrr6V0NKKYwd+GmP6G+cZqvx5X689ihVLQ0718njILAUB
	 o6CxU+JZwEvxvxUBquWi05FGHkHYLg3poYU0OjyLAnDWSRLf93vzceTNwzFU4cxPZpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794322839;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=YzZIHnwUb49OQ5Ge1hfLtzEhOshkFMXkInmhEVBjARo=;
	b=2cJFJa81EWWgjZFLAmIXSLFdR7C4ZuRbZCENASpgvCh5KSC1Kt74VKBFTYWJId0xtdNB
	 2F0TrYrEbnMq824HTBE/pxz542hw0ZFK4pFb/KpLMyocPIfcBGOYRO/HiPGd/czhpiPew
	 KnlXmeW0FJmZbmBA2V6BxbU2Qz265mKqBIgZeAWd1Ng1KVCZX8YBEcB3Zv+EXe8sG0Uig
	 Ga3YbtXqCleWEtZQ00kyGbkflP86PSbEkz8JXgzkqo2B+chsVqsI5m3r0CRvs9BRTPS9I
	 pe97d0tziMKCqUL1dvn6DcTdQk87HGds7/8a6j14imahq/JtrSdX2er9HRjeY7vKBIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c9UsD3KW;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=tusOz9pK;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAA160A3830
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 15:00:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DAA160A3830
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c9UsD3KW;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=tusOz9pK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794322838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YzZIHnwUb49OQ5Ge1hfLtzEhOshkFMXkInmhEVBjARo=;
	b=c9UsD3KWmStb/oKxNMAK8SFDP0/vCTrWIN3buDC1DNThRqTcg5/sTvamBndQnu+V+XGxnt
	/7lvtSFG4S0HvKIqs3MdDrhGoO6g+9c0p9Lk3f46I+7mRMYIXrDk9byNjb/gZTIDJ2Sijt
	qxOhinJ1kBoNcrudMW5rd+u4G01EBwE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-nxU8qurROECCGVFoaVCrng-1; Tue, 10 Nov 2026 10:00:36 -0500
X-MC-Unique: nxU8qurROECCGVFoaVCrng-1
X-Mimecast-MFC-AGG-ID: nxU8qurROECCGVFoaVCrng_1794322835
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4902ce85f72so1651206f8f.2
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 07:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794322835; x=1794927635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YzZIHnwUb49OQ5Ge1hfLtzEhOshkFMXkInmhEVBjARo=;
        b=tusOz9pK2ic6QyHtNsIwAaalvgbrOb/B1eGmJzxXoiJmJf6dDJCGS1OUG6pfXHX92Y
         FhKNbyYh106vbiIJ3/1TUPtFAL82MkXSmzhDy2aXSjfrIIc6D62s5+6ArVkrHJJiqJb7
         UplRoxnkE+ebe9N9+9XDYXLpm1oOUhKAyqe6uvSiBNpzmpF44ereoOr+sZZn5qcA9wJL
         IbVv8FmK+XZ+ntUE93Bbi/0PiJRTA3xiWRy88sxLQpwXLx4xZaz0ZE1TCDvjeecJ761S
         EVha7EUO02k2gLMEcepy7RzQum3wDjgDlph6Pzv4quqEGAKuHlAsQn/evjCS5FywUX/2
         y2IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794322835; x=1794927635;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YzZIHnwUb49OQ5Ge1hfLtzEhOshkFMXkInmhEVBjARo=;
        b=0NqIf0s/LuYC5ufpx5V5jSOv11CVaLn1ka+OMt6SUPSbVIhaYi9ir9PgyalFerHoOg
         k7ekLcasuY3HatwXf6E1N+nu3mrbKEgcyszqugh2JIFwJeMlD+T26O4YY+gNlkIc5QQJ
         vuBknCgBao7MjtB8szMSRWiwHyVo+MH22fDioVmwg/Xej4hr0WQ9AKS9ZgrhHmzcl/Wn
         fVAThIYyBfQxie+4M3mjRBy3R2z+JBOgrm+AkidjO9gZ30cM20O0MihIJ8rlnSpfGZex
         ve9XgjaFgAjeI4ONvbHTa09uIkQ4Al01TE5OcE9HUTQmMK7u9Wl87AJXiGvWwBXMjcsD
         VlCA==
X-Forwarded-Encrypted: i=1; AL+hErHQztGzaFvX9XCAHXJjg/BlAaL8uXMTWENkyCgexEvb72sitMKzKEKF1NmzWZ+dE+FTUkmYtsZoTaBq@vger.kernel.org
X-Gm-Message-State: APuU4Z8lnBL8gkexpToh/KtqpvDJTENFCWHvNvHp1KzVY51AaCtcPgBj
	rw2dGqs72v2rLVUB5gBtuwZ/8Uuti0MfS3fTdlYavsVz3zv+T3Iu9/CCAa06NaouZzuncWyXtPs
	ThLxRZq2UjqyDOIyKMFU8V6Fza1LSkj3Nf8BsA2vSBiOsyDYCcNRYMjoduc/mVZs=
X-Gm-Gg: AYBFou3xnC0CR21P6OZUovS121Kz3QIuNm26/uexlYLPvGElrvT7Os2OTR/1c0S8PFx
	2+MZQC/KfHDV4p5mzsDknuQmLYfH4lS++G7JlUZ+ixoQUbJp56WPtWzRKkBhKmpKEEPTk3RYCWj
	cWJpA0QV/TfOKk7mnhX7uAoCC41LppNLgOjSy1eC40slZW20hA7uz4BT5WxypQ7xgrVCsk5XgJ3
	V5EzqcL6R7+mDuKMi+r4yJ8wpde53Boz1ZTRmOhCH6ztW8vaB2Q+H2soODJBv/sovyOiYH/596l
	BtJQPw/NyCD8bwdXYCfgNEV6dMF82YUVedmUpKZX+rLziX9nbYSryaOYXVEbzzKoJ1a7tnkTn1s
	rBT8AsPcxS3ZKEPxNd4JcmdB/zbQ++3hQarf0OvsjvY0qJgELMqfRFOyaCw0GBpFA2FA3L1lH0x
	dVzC34jbseqnVK/uxUYTkMVZ2dptYx0A==
X-Received: by 2002:a05:600c:4e55:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4ba023050eamr52358675e9.2.1794322834836;
        Tue, 10 Nov 2026 07:00:34 -0800 (PST)
X-Received: by 2002:a05:600c:4e55:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4ba023050eamr52357655e9.2.1794322834148;
        Tue, 10 Nov 2026 07:00:34 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0237fbe5sm47374655e9.3.2026.11.10.07.00.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:00:32 -0800 (PST)
Message-ID: <c14fb8f4-82b5-4aac-8c64-a2dadb210e9a@redhat.com>
Date: Tue, 10 Nov 2026 16:00:30 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v28 2/3] net: phy: Add support for Template
 Control register for PMA
To: Kyle Switch <kyle.switch@motor-comm.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andrew@lunn.ch,
 hkallweit1@gmail.com, linux@armlinux.org.uk, Frank.Sae@motor-comm.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: ming.xu@motor-comm.com, xiaolin.xu@motor-comm.com,
 jianmin.wang@motor-comm.com
References: <20261104060636.3901918-1-kyle.switch@motor-comm.com>
 <20261104060636.3901918-3-kyle.switch@motor-comm.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261104060636.3901918-3-kyle.switch@motor-comm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/26 07:06, Kyle Switch wrote:
> diff --git a/include/uapi/linux/mdio.h b/include/uapi/linux/mdio.h
> index 06f4bc3c20c7..353ca13c64fc 100644
> --- a/include/uapi/linux/mdio.h
> +++ b/include/uapi/linux/mdio.h
> @@ -63,6 +63,7 @@
>   /* Media-dependent registers. */
>   #define MDIO_PMA_10GBT_SWAPPOL	130	/* 10GBASE-T pair swap & polarity */
>   #define MDIO_PMA_10GBT_TXPWR	131	/* 10GBASE-T TX power control */
> +#define MDIO_PMA_10GBT_TESTMODE 132 /* Test mode control */
>   #define MDIO_PMA_10GBT_SNR	133	/* 10GBASE-T SNR margin, lane A.
>   					 * Lanes B-D are numbered 134-136. */
>   #define MDIO_PMA_10GBR_FSRT_CSR	147	/* 10GBASE-R fast retrain status and control */
> @@ -320,6 +321,17 @@
>   /* PMA 10GBASE-R Fast Retrain status and control register. */
>   #define MDIO_PMA_10GBR_FSRT_ENABLE	0x0001	/* Fast retrain enable */
>   
> +/* PMA 10GBASE-T Template Test Mode Register*/
> +#define MDIO_PMA_10GBT_TESTMODE_MASK GENMASK(15, 13) /* Template test mode */

IDK if this has possibly been discussed in previous revisions,
but uAPI should not use GENMASK(). The plain hex should be preferable.

/P> +#define MDIO_PMA_10GBT_TESTMODE_NORMAL 0x0 /* Template Normal */
> +#define MDIO_PMA_10GBT_TESTMODE_1 0x1 /* Template TestMode1 */
> +#define MDIO_PMA_10GBT_TESTMODE_2 0x2 /* Template TestMode2 */
> +#define MDIO_PMA_10GBT_TESTMODE_3 0x3 /* Template TestMode3 */
> +#define MDIO_PMA_10GBT_TESTMODE_4 0x4 /* Template TestMode4 */
> +#define MDIO_PMA_10GBT_TESTMODE_5 0x5 /* Template TestMode5 */
> +#define MDIO_PMA_10GBT_TESTMODE_6 0x6 /* Template TestMode6 */
> +#define MDIO_PMA_10GBT_TESTMODE_7 0x7 /* Template TestMode7 */
> +
>   /* PCS 10GBASE-R/-T status register 1. */
>   #define MDIO_PCS_10GBRT_STAT1_BLKLK	0x0001	/* Block lock attained */
>   

