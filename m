Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B4346AF25
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 16:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781627261; cv=none; b=mboB88+3+vcY31cSvOS50oDjfbE8KkpuPM+Yfme2x7tgL+Z79ShuIP+H9ya+JMqqDMeqb8TuxbjSr2/KYQO/RUG1JVxNZiKnkHXNCMZKB6r807ku3SGd4TuIiWiPC6S/tpJLeICKN/fFPGau1GN5saHaTiUjY0ClUryYcWAEiEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781627261; c=relaxed/simple;
	bh=kUghcp6LbEAXRYmNtVjn2OnzfDOMmCET7f0ph/Dtj7g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lza1GHr7WQbDYYj7J075jC+vvWgVveqUzjdw487498Cf3WIgL9jl9puKx1odC28LsQln4iR38YzR3vM0oY535+U4UJk6I2X4S4u2pNdLJY8gxCBOT6w1vJ8atBD9Ofgk4XF4EDIpMUI8aGVZG72Q2dVhMaIjSzk4kZM7i5MCmaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UDr+Fszu; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QEQIoxqw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UDr+Fszu";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QEQIoxqw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781627258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ONTRu09Dr+Ry3nIH2CFE3AeVpsjq5ZCjzHdim5kHqGk=;
	b=UDr+FszuotcMcCMF+o6ecWBYdFOy33fZViKDMPWK1b1xosXwIj4Wl+EuJl55d9jPWZO0g5
	hjrdonasKgFYV7e+T6MlH+C6aYTuAr0eZF6EOZX7EmGIy+fjYK4sImODFj63JcZes0IzR7
	TUV629VD1KDiIBy4+QO/1t77rcP/HAA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509--Ked-wVqPYyw0KTamNgQIg-1; Tue, 16 Jun 2026 12:27:35 -0400
X-MC-Unique: -Ked-wVqPYyw0KTamNgQIg-1
X-Mimecast-MFC-AGG-ID: -Ked-wVqPYyw0KTamNgQIg_1781627254
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-490b9cd54f3so28231155e9.2
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 09:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781627254; x=1782232054; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ONTRu09Dr+Ry3nIH2CFE3AeVpsjq5ZCjzHdim5kHqGk=;
        b=QEQIoxqw82riJoFiHRnuFw6umnPPEQ7h4SmDPsgH+ePyThRQAdWWl94Y2eYzh4/W58
         QYdnxevbF5K3bTkqun/bkOt3SO4O02C4dPTb4EPtgm2Axyq4QMiTbGxFU1ZhXVDbgLzl
         DJ0Mvxv6kAaM1t19YaS3NR7hqP2DyQ76hZIWd2cl/lnSYMymAZl14UsQTID/hGxcmPVe
         mCHQR5Ci/Dvs4LgyOCyBo7a9TP6DU2jtLxLZ47SqugR2Lr4ilceblUqCI56aE8qN0cTP
         C9am/U8KQjPvEsXBuv3zYOiLM4WA/Ua7Zmrs5O7TCqa4dC3xHwSw5jh7deVsHqqag+PA
         02vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781627254; x=1782232054;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ONTRu09Dr+Ry3nIH2CFE3AeVpsjq5ZCjzHdim5kHqGk=;
        b=cW6de7JnizP1TiMaTkpo7YSU6ImPt6N/NUF61Wyu2XiwsJXkjlYuXRpnbM8p65yYhU
         Z7eTcAA7lH+YzBTJnN0omD88p5YuXvmlR1l0cbYiVTCyq1mRBupLbzHERP+owJV/C9Df
         iDQvvFKFYgkWJBM5GgtDv65hxGgNGySQJWHpyNhvW5pTUbQMm8aqUxhPtyTquP9XB7vB
         NQxa//U1hGll3FwHVDiZgS5cXUyA+3C0MYoPVlY3nBaosBbF10e0EyZNZAwnIj/MR/8I
         h3w4lk5YbdPu6VGvv5x83KchebHCkIDcSszrZXLkfp8z1tZbNm9147cmf6UKw/P5woP1
         T8ZA==
X-Forwarded-Encrypted: i=1; AFNElJ8n34PvmmypepgApQ8exSlJF9APjzLjxT1EX3fZ8M9+A4JwO22xWYDfaHSbxIvFSKC8T7aT4eFsC2Ei@vger.kernel.org
X-Gm-Message-State: AOJu0Yziu2opFGwTZyOxChTAg95HNvhQbnj/9i8AplaAi/dHk9Q3AY2f
	ThD3ekORgdDFUWk9Mn0twzxqo34l7TJtG71nsaHKDJ0YKDr6dkk58cAOtGuf3EUCBqkCOgH+hiP
	XuQ8ChY+krI5HsaUFX9SrB4fJl5clfpCpOxOmiCp51TEALdTWbuh+/F6gIb2BNQGzSjb5Ykk=
X-Gm-Gg: Acq92OF70pr6mgJBfA36NYR02RK4dCg1t+3I7WtQyt1eSwIcZydeWlskpcJxTFjaFjF
	4grO5jyJVNM/Yv6zIs7XYfQADLbNMP20xyWF/3tZ8aNint+40yra/htOHCJNT2X2im3gu1pNRhu
	jnD66XnFF9767J2uS4cbaZS18E8UqyJSq0Ril22TW3s2lypzFZSoDjkECJfR/MZrfrTXQxeGUHL
	166sfbiSTNJKRDB67YGdQl5dLIKanbATH9zzZNCY4Wa7f1zMn3OJlCREX+x9GBWSbVAdIUKtwDd
	NAqCmcqOx2G4aFkMLjytbJGpMZ1qU6N6+Ht2Lo5f69mY915QKOMYmDWi/ptBVGLbvHjP6Nn9qG3
	Y42qha23O1UNmOi+SyA/WJxIZgcrbNFPHt2Px8gxT901FfRZ/eNMOrzDsyarUP6MHtExRdO62An
	n1j66R
X-Received: by 2002:a05:600d:848a:b0:492:1e36:bb04 with SMTP id 5b1f17b1804b1-492333f84acmr2657325e9.37.1781627254323;
        Tue, 16 Jun 2026 09:27:34 -0700 (PDT)
X-Received: by 2002:a05:600d:848a:b0:492:1e36:bb04 with SMTP id 5b1f17b1804b1-492333f84acmr2656865e9.37.1781627253899;
        Tue, 16 Jun 2026 09:27:33 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-461eaa0d275sm2513344f8f.2.2026.06.16.09.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 09:27:32 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Conor Dooley <conor@kernel.org>, Amit Barzilai <amit.barzilai22@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch,
 tzimmermann@suse.de
Subject: Re: [PATCH v2] dt-bindings: display: Add Solomon SSD1351 OLED
 controller
In-Reply-To: <20260616-nautical-obstinate-a92fd80ef483@spud>
References: <20260615175620.88828-1-amit.barzilai22@gmail.com>
 <20260616-nautical-obstinate-a92fd80ef483@spud>
Date: Tue, 16 Jun 2026 18:27:31 +0200
Message-ID: <87a4suzc0c.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Conor Dooley <conor@kernel.org> writes:

Hello Conor,

> On Mon, Jun 15, 2026 at 08:56:20PM +0300, Amit Barzilai wrote:
>> Add a device tree binding for the Solomon SSD1351, a 128x128 65k-color
>> RGB OLED display controller driven over a 4-wire SPI bus. The binding
>> builds on the shared solomon,ssd-common.yaml properties already used by
>> the other Solomon display controllers.
>> 
>> Assisted-by: Claude:claude-opus-4-8
>> Signed-off-by: Amit Barzilai <amit.barzilai22@gmail.com>
>> ---
>> Changes since v1:
>> - Drop solomon,width / solomon,height: both are deducible from the
>>   compatible and are already declared (as optional) by the referenced
>>   solomon,ssd-common.yaml, so a local override is unnecessary.
>> - Drop the rotation property: it has no consumer (rotation is being removed from the driver).
>> - Use dt-bindings/gpio/gpio.h flag defines in the example
>>   (reset-gpios active-low, dc-gpios active-high).
>
> The user for this appears to be in staging. As far as I understand, the
> policy is that we only add bindings for staging things when they move
> out of staging.
> Sure, this is straightforward but why should an exception be made here?
> Are you working on moving this out of staging?
>


This DT binding was part of a series to add support for "solomon,ssd1351"
to drivers/gpu/drm/solomon/ DRM driver. Amit only sent a v2 of the binding
schema because he had some questions about the driver:

https://lore.kernel.org/dri-devel/87cxxqzwxn.fsf@ocarina.mail-host-address-is-not-set/

But yes, I agree that it would had been better for him to post this as a
part of v2 (and I still expect him to do it), otherwise it is confusing.

Specially since as you pointed out, there is an existing fbdev driver for
the same device in staging.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

