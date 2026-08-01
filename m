Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECDD3290AF
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 18:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785607927; cv=none; b=ncdd7nACgBX+gs47Caa3L5+bw1141EiKtDm6DbDgx4HGB3SH+Q1L/4j+rTWctg6L8c5hQ+9/7f+C2Ir3yjKD0sr1WvaMieWu2as8yMz/UOWskKrDGfa+F7t3kALbJQsH05+M4hDHiP+4iT744dMDGZR1xKtrxxj/XLSHzrnNC6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785607927; c=relaxed/simple;
	bh=hD/EMiZZTXqKgxjrDpfBRRAJ1kAx9ywWk+DQrs1OG88=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GvbFiK6XjdyBdVJFhgeW14IwC/B+xq7UFxkgBJMafdlxF5znNPsWFg3Rb6DDD8ffMJssIwlg7yXgy53ZstpJMnouBRp2dU7KN7LyNiCFyyPs4q1ap9HZCM5+x/Bs4a3GJx92Sp9czY7N4Sl+aeSIekxtXaORz+BlgBce9MiXgXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CtFodgUp; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZCWLzZsW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CtFodgUp";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZCWLzZsW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785607924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QuTNiFWTTsXb3gAvFi53MKk8btbhasMaATEQzE79DwE=;
	b=CtFodgUplQxmOOEsnLtDJ4QQcPFsHkSFZLouju3IX8dMjGTdw8tRkGnFsLcH2/Ta0JTKNH
	rfHl6gFfQzDit/OPKwlRn6wiM5K22slmpGnN8ZxY+DCSG9rWt06IlE20O2Rxh3Xx4C9Fet
	HAAnfnna4zWoNOcSkqaf88PuWsmB7hY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-347-KKfS1OTFN1KHVwb9jzXx_w-1; Sat, 01 Aug 2026 14:12:01 -0400
X-MC-Unique: KKfS1OTFN1KHVwb9jzXx_w-1
X-Mimecast-MFC-AGG-ID: KKfS1OTFN1KHVwb9jzXx_w_1785607921
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-47f83999cceso2158637f8f.3
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 11:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785607920; x=1786212720; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QuTNiFWTTsXb3gAvFi53MKk8btbhasMaATEQzE79DwE=;
        b=ZCWLzZsW9EZaE400Ws+WZIOvhmCakPBloIxWf3AAhTKz0S1la3OLvkEjTKoQT5/qQB
         4OVqeT+7ESqgynION8RofFSbeR3XjvsHzhARVvigMFdo7BVClpuwECufgLyDIoIm7lc0
         kNlBX4renyL8Ac1T0tEYxouSdpNHyOqTxQ6g1nQqEYBzSWbAX+5iELyvGkvaIOTWHTaA
         D+4yxEeoVRMcEsYFI+XOmpbF3aaixPgw3waiI24eoWbPQnbd+e6bgTR+yUpHdKX+9ZXn
         AkAy8SmX4Z96I8I1E5npENWW4lUnjHKGaAtUwNYya0sQ4hS7oyXovqK2Bf3TX3yhzQQ2
         Gfxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785607920; x=1786212720;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QuTNiFWTTsXb3gAvFi53MKk8btbhasMaATEQzE79DwE=;
        b=F847HeTByyJtRmQ/P6J4sTk9WaE64n8uqW3vz4TvuL9v059qQSXyI3E8i1Mw/u390d
         EFw/cUpI5fvpt23HwWvdLB7ep7W2BNGb1EQPZlr11QQyD8eL9WNh2AD1lbEofcYZPHTo
         aypHsEO8NDEI2//eAmUGgaWt3cMUZ6P/11OagFEKTZxDZYrr1i1jGhLBb4ra6wnIdsbg
         YNwp6DjrD/88xWT0jzepz0EMvW/EsotdpTFDH8HcZ+/GE6fuN5GG3EvNEaJkLw/2saBW
         X0Bk+sxoHJJB0fORyFpb/F2A3uHRFFZBpgi3Ids35DvwG1GZPmJApi/t70CLcPCnIGXq
         57iA==
X-Forwarded-Encrypted: i=1; AHgh+Rpi3ymeh0lRO2om5ItQozCQn4rFVV32IkbtjxZJtNRmgDMJGRAjOKo49OZfnr2tqDsRoeATHvLQO9Hn@vger.kernel.org
X-Gm-Message-State: AOJu0Yxml5GDi6/09n1XTaNOFyVBotRhY/mZ8KYIedoyKidNZqD4ILUJ
	9O+cqAySxORD9C1f9XHmFqDcBYTAi5OhYo9ooLGwBiluT0KryUD8koW6pRw+YwyQRuxIWt9n3+M
	nq7/tjue/XKdsf0ocWCJRHE/597VGiRj+ReX4qdunSZi++68Lh2bODABAz6G4NBY=
X-Gm-Gg: AR+sD10X94XyCAwAeGIu+nhZEk/O74N/r0QlOxFZQq8y6fOEpvKqYf9Ov3yD3ryvsd9
	uQZVuvWB6J2km7ES7D8rkp5jqA9BY+ZRjuz0wX1Q0N6x+yKYxsxGi7FGqlOYU9EUrddxS4mKg6L
	haS/9B2pz8ZnYtfH+x4pZelSOzNG/PCLtYxn73vcZ17VziCgekXMcQLUFUAiYACt0F5yS8jGwDq
	+L+gB7Dzp3wAUwo3lqPB4DVx6a/eEZbg4Mg4uLJeqoeVQoWLFAtGVkmBXHmsu7vAkcPjoWGDUtQ
	UqPGnWYHZvhgB/vDZcLL7ZSsseqkr561oljryoe1a8PhnvEuXTv36rWRGGsuZ4xq2SEdUKKQ0sS
	5mue7tUVzvuedEbh3ZlHFfWdGQ1M3mAbWvkGDmFotIkmdOkU6B+We1kuw7xI=
X-Received: by 2002:a05:600c:840f:b0:493:c42e:5be0 with SMTP id 5b1f17b1804b1-4980c60705amr64842255e9.0.1785607920463;
        Sat, 01 Aug 2026 11:12:00 -0700 (PDT)
X-Received: by 2002:a05:600c:840f:b0:493:c42e:5be0 with SMTP id 5b1f17b1804b1-4980c60705amr64841705e9.0.1785607919932;
        Sat, 01 Aug 2026 11:11:59 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4980878dcb4sm117791635e9.13.2026.08.01.11.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 11:11:58 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Helge Deller <deller@gmx.de>, Jakub Turek <jakub.turek@elsta.tech>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] fbdev: ssd1307fb: add support for Sino Wealth
 SH1107 controller
In-Reply-To: <a90747ae-e2c0-4add-9fff-1ff473d1b410@gmx.de>
References: <20260731-feat-sh1107-v2-0-0d2893e44ebd@elsta.tech>
 <20260731-feat-sh1107-v2-1-0d2893e44ebd@elsta.tech>
 <a90747ae-e2c0-4add-9fff-1ff473d1b410@gmx.de>
Date: Sat, 01 Aug 2026 20:11:57 +0200
Message-ID: <87y0epd82a.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Helge Deller <deller@gmx.de> writes:

Hello Helge,

> On 7/31/26 16:45, Jakub Turek wrote:
>> The SH1107 display controller is very similar to SSD1307 but the main
>> difference is that SH1107 has different memory layout and uses page mode
>> adressation only.
>> 
>> The SH1107 relies primarily on vertical page addressing mode where the
>> internal 128x128 GDDRAM is split into 16 vertical pages, rather than
>> the horizontal/tile addressing modes natively utilized by the
>> SSD1306/SSD1307.
>> 
>> Signed-off-by: Jakub Turek <jakub.turek@elsta.tech>
>> ---
>>   drivers/video/fbdev/ssd1307fb.c | 87 +++++++++++++++++++++++++++++++++++------
>>   1 file changed, 76 insertions(+), 11 deletions(-)
> series applied.
>

Why did you apply the series? I mentioned in v1 that Jakub instead should
use the KMS ssd130x driver that already support variants that use page
addressing, such as the SH1106 (adding SSH1107 should be trivial).

Also, Sashiko correctly pointed out that the fbdev driver doesn't support
most of the properties mentioned in the DT binding schema.

Now is the opposite given that you merged the DT binding patch. The ssd130x
driver doesn't have support for the "sinowealth,sh1107" compatible string
that is being added by patch 2/2.

I guess that should post a patch to delete the ssd1307fb, to make clear that
shouldn't be used anymore since we have a KMS driver that has better support.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

