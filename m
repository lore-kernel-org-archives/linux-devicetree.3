Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B1E46F4BE
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 07:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784706743; cv=none; b=aFd6fb4aFs1sFyHeOJMqC5kRHV5VCtyPqLhjX2dLbkzxZV0v9lC45suIW4cFmsGxqIK3ZcCQuUOhjEiD+lwin6miNJ/nGK3lboyL/sibWeyXDeoSJnhQcdFtIJ+1fMK2C2oMeox63JqHpeMCV49dmwR91iw569Jezrv+n0ZVLXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784706743; c=relaxed/simple;
	bh=vmofqkQfwWNeQwBuf38BgPrbvu3MRJcmzd6c4ATMpF4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=O2ylUIbUnUCizg8qD09qgt00ybuDXRciTaamg0nRz80AwBMrZ9WoueijnU826igvMg3rAcVlygc4XGwjpvmmsv0DKTTi6HeKUEn/DksIImP8jyVeZa56H4dhHAl+zliRXhtegtR5uuxP451wWE7B1J7qkReBQCUDcFZj/H/aYGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=esENstQf; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SOW5+edf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="esENstQf";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SOW5+edf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784706741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ve+PAmrMmy3YGE+ZBaGl9LBgIZtxakmaZDmlMaxCHrU=;
	b=esENstQfgZQYIksxU0GJsWPaPq8p+lu1WAwHzm3h842tkK6zeWD6eEbFr2GmCO8dyVwGZq
	s4BGKLa+1kk3JICdLKm4hsMl2fFfFxUHCesPcfog8xX2yJgCgi5DxIXemXq27nSH8f3XN6
	u6xz3yVU1uXTKKEHFryJmbvAV9iB2LY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-0HO4yt9kNiiwEKCsE-DmQA-1; Wed, 22 Jul 2026 03:52:19 -0400
X-MC-Unique: 0HO4yt9kNiiwEKCsE-DmQA-1
X-Mimecast-MFC-AGG-ID: 0HO4yt9kNiiwEKCsE-DmQA_1784706738
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-47f835ac1aeso723859f8f.3
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 00:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784706738; x=1785311538; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ve+PAmrMmy3YGE+ZBaGl9LBgIZtxakmaZDmlMaxCHrU=;
        b=SOW5+edfwXrhc8rSoWfAwBLdfO8CEDN68YXymKibg0Od4Gwwr1/J6YeP5wfMXnodHC
         xOIbeoMpyfGd6ZBxsh2M0nzeMdSq2g+e7WCACkQ/Fcbt/AGxjv4JIe8oszAImT/KAc5s
         kFMCpG6t50zrRbHPMj+FiMkBo3VHmG2qcAzL7aR2Gq9XNfcD8H7x5pJt8SA3bAQXQbmf
         NhdjwphlmPY3gjeZubPsK3SJtAprkwp7ylywnZcqUjLp0LKUm4uMUCrQXltS0p76rd3h
         UrQY+VLhRRJnDJXe73GqHqGO7jefEOiiKejy57JeI8QFMqDgGYZ10VrjswevfMKw/c5R
         6M0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784706738; x=1785311538;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ve+PAmrMmy3YGE+ZBaGl9LBgIZtxakmaZDmlMaxCHrU=;
        b=bIKLYAY5jVQoXumdOsa4CtrHHrcR9DccGXJ3r1rc0eozURs6pA/VSszWIsOVB0COfT
         ABld8fUVwdXca/rODr/5UxIrefdMnkegGWrE8rq96Zpfo0WNOh9x536I3lvesYEpMyj2
         UVNEFTU/WDk+eXsIdPTZ5lF3RAfodr+FJjXlmLQ5TsiAJEn/YpWXoHT+dJhg+C6HigZ5
         5pNvRDAvgdkd/oPBLALTzmqIoG0ADVaKCiTMS0tm+o9eejzaqKGcgISV9msDwAp9lGdV
         pbisXQoAlqpRlKeS1KTyAjDuR4RftR2EG+iMvEnfdgkJVHLkgDZ1LVYHX3aZhtVh6/oK
         wRbw==
X-Forwarded-Encrypted: i=1; AHgh+RomnQ+0/RlCGWNnFU65A4mXt3aUkAzjPAcUhG0/7V126Qp2yO8cV4eboH5sJq60HdiT0lOQeOUeyNOS@vger.kernel.org
X-Gm-Message-State: AOJu0YytgwVy25R62puGvyAImZoBhzCsiUmLOx87fxUWTymec2HsQ3oT
	qlVmFBjUe0JnXfaH8WwN0mGHzf0Y3mgXsfJFuaYZ603L2FNT6YE6+CP+VA415qUgmmGiP2Z/0eh
	GDzpAKnQCnAFCeXYqmci+GCwkjkJ0kBjtQirk+NJAemAoqqJVYPbA+i4hjOF4V2A=
X-Gm-Gg: AR+sD11SNZNyPx3PFbrdq1RCbajcxqcecFaTi/102SVyLdFmQ43HGYTApqv8hrg/45K
	WZmAkAdAlVj0xiywVa7sFwwY1TkXLbmuJjlUfyF75x5576PemFIPqhEILQJru//jHCZrKxIBwSt
	QoL6i33Q75OAO3kChmxpe74A0viWV6wMteoNQUAXe8ScpMOw29Af9ncbE1au/b+dPd1JE7cKvP4
	FVBK09dY1jfA2IGLeilxdw51/RVuA0/vOawgP3wg+wneoyuK3nl6+MQjKngpUjuMXkskK3AN6fw
	rqGnAzfX6HEkLTC920eGB1p/pYSeLAL+DvNfGJPLY8HgMI9+GomEv3QJrQX3zsyLDE4e3Iu+M5f
	5LwwKAbULtRYK7sMVWfSWsGQwaL746Hf0dj1f9n3kBuzUMjBdLKYFaJd0NJI=
X-Received: by 2002:a05:6000:41fc:b0:47d:eddd:a90 with SMTP id ffacd0b85a97d-47f62343c9amr25508107f8f.61.1784706738355;
        Wed, 22 Jul 2026 00:52:18 -0700 (PDT)
X-Received: by 2002:a05:6000:41fc:b0:47d:eddd:a90 with SMTP id ffacd0b85a97d-47f62343c9amr25508076f8f.61.1784706737752;
        Wed, 22 Jul 2026 00:52:17 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5a2sm3930493f8f.7.2026.07.22.00.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 00:52:16 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Amit Barzilai <amit.barzilai22@gmail.com>
Cc: airlied@gmail.com, andriy.shevchenko@intel.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, robh@kernel.org,
 simona@ffwll.ch, tzimmermann@suse.de
Subject: Re: [PATCH v3 3/3] drm/ssd130x: Add SSD135X_FAMILY and SSD1351 support
In-Reply-To: <20260722071921.43687-1-amit.barzilai22@gmail.com>
References: <20260722071921.43687-1-amit.barzilai22@gmail.com>
Date: Wed, 22 Jul 2026 09:52:15 +0200
Message-ID: <87pl0fsbps.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Amit Barzilai <amit.barzilai22@gmail.com> writes:

Hello Amit,

[...]

>>
>> Can we move this to the ssd130x-spi driver? For example, something like the
>> following might work:
>>
>> 1. Make ssd130x_write_cmds() to just be a static inline wrapper that calls
>>    to regmap_raw_write(ssd130x->regmap, SSD13XX_COMMAND, cmd, len).
>>
>> 2. Make ssd130x_write_cmd() be a variadic wrapper around ssd130x_write_cmds().
>>
>> 3. Add your logic to ssd130x_spi_write() instead of ssd130x_write_cmds(), that
>>    way it stays in the correct layer rather than having a leaking abstraction.
>
> I agree, in hindsight this code goes against the transport abstraction.
> I'd propose keeping 1 and 2 in a single patch, though. Making ssd130x_write_cmds()
> a wrapper around regmap_raw_write() and making ssd130x_write_cmd() a variadic wrapper
> around ssd130x_write_cmds() are two halves of the same change: routing command buffers
> through regmap_raw_write(). Splitting them would leave an intermediate state that isn't
> independently meaningful. Happy to split if you'd still prefer it.
>

Yeah, as one patch is OK I think.

>> Also, instead of checking for info->family_id == SSD135X_FAMILY, we could add
>> a dc_high_params member (or whatever name is more suitable) to the struct
>> ssd130x_spi_transport Then other families that might use the same can just
>> reuse this option instead of checking for specific families.
>
> I agree that hard-coding a check for the family isn't open for extension and should be changed.
> Adding a member for this in ssd130x_spi_transport is a fitting solution, I'll populate it in
> ssd130x_spi_probe() using a static array that will describe which families need dc_high_params.
> I'd keep that table in ssd130x-spi.c rather than adding a flag to ssd130x_deviceinfo, so the
> D/C# concern stays in the SPI layer instead of leaking into the transport-agnostic device info.
>

That works too. I don't have a strong preference on how should be
handled. As long as the logic remains in the SPI part of the driver.

>
>>> +	/*
>>> +	 * No long post-reset delay: the controller datasheets only specify
>>> +	 * microsecond-scale reset timing. The lengthy delay seen in some other
>>> +	 * drivers comes from fbtft's generic reset helper and targets slow
>>> +	 * parallel-bus GPIOs, which do not apply here.
>>> +	 */
>>>  }
>>>
>>
>> I don't understand the point of this comment. You are not changing the logic
>> of this function nor I see how this comment is useful.
>
> I originally added a redundant delay that I saw in fb_ssd1351.c, when Andy
> noticed it he told me to add a comment so others could understand the difference
> between this driver and the fb counterpart.
> I agree that it shouldn't be included in v4, it was a specific mistake and I
> highly doubt others will see similar situations and if so they can easily research
> the subject.
>

Ok, great.

>> Instead of ssd133x_write_pixels() and having per family logic in the primary
>> place update path, I prefer to have a little bit more of code duplication
>> and add an .atomic_update, .atomic_disable, etc for the SSD1351.
>>
>> Yes, I know that your current approach reduces code duplication but also
>> makes it harder to change the primary plane update path for a family without
>> affecting another one. This is particularly important in my opinion, given
>> that contributors usually just test on their display family when posting
>> the patches. So I prefer to have per family callbacks if possible.
>
> Agreed, I'll add per-family .atomic_update/.atomic_disable for SSD135X in v4 and drop
> the shared ssd133x_write_pixels() path.
>
> The one thing I'd keep shared is the atomic_check callbacks
> (ssd133x_primary_plane_atomic_check and ssd133x_crtc_atomic_check): they have no
> family-specific branching - the plane check is generic and the CRTC check only
> allocates the RGB565 data_array, which SSD135X needs identically. So I'd reuse them
> via the table rather than duplicate. Let me know if you'd rather those were split too.
>

Yeah, I agree with you here.

>> Again I wonder if is better to have a device_info member to decide whether to
>> register the backlight, instead of harcoding the check for a specific family.
>
> I already have a draft for splitting ssd130x_update_bl() to be per family, removing
> the need for this code. I prefer to first submit that patch, and then mention it as
> a dependency for v4 of this series.
> Feel free to suggest a different solution.
>

That works for me. Or we could keep the family check for now, knowing that
a follow-up series from you are going to remove it and properly handle it.

> -- 
> Thanks,
> Amit
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

