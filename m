Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36ED23368AE
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 07:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784704787; cv=none; b=GQXTbn1kQiAq3hsOyduCXDEN6r3wBQG4u8HNhe6dwoHHA4xSq+Rh5aVk6IqC/8XxunXAqsEKIsWawEahR3u3pUjrZ8Py0F42dBPg2rYYp9JnVReB4Op+1E6Wc+LV5+WQHB4PIDzN8KiR1ADbCuX63SWxnrEYOk5TRCtX3rbYKZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784704787; c=relaxed/simple;
	bh=futbNr31vKSA7UXUNzyS12WaQ9CpNJhsAJE8Fswuipk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b7E1/7+lfFIvG03yPlveLJj20g91x7uzCy/vaBzdhJvsXP4LdpCRr+hc2Hnx9WyIbI0FYAdcZo7eBdD0f+IxOaPeVTYDRBlNq71rT0098aq3wBoQ+JTltYCvusJUbKb/xrBEnfzNqlXlqWMzVtVG8TmVHUWjlDAUctq7w7ndCP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJrCUdxL; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJrCUdxL"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-902e4af2d9dso61790436d6.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 00:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784704785; x=1785309585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=utW8YbbssTVsulJvHfz/jBDoROF5Koo4xil5lPJsJM0=;
        b=cJrCUdxLIfM93x7D7ilu+gg2qlafEdavR4irL2h7H1IPWEx6C2MGSLmh3ocgHjJNeh
         gwm0IX3FbH97YeN+z6hyIknXU1mBmvhRaYEYov/WM47KEyX8Vx1DXwlK2Wf94VZCON0w
         uzeE6MhfZQdWjx59OUoM/yOii6NJW/Imp61IIO3X3cungcAQBrJP75MrNeiRkFi9EGIc
         7EfQuRwsZNQ2tIGEC23zELgcUNGFvB7DB0ePwSJaUe/HyFkTj8xw49Z4laWVLrOwqt9a
         61qdzJb4ICg8c5NsTqacwAyjCmjnTi3TKNcGUjThtrr1qMBpIhvrGoPunVnYezRpBwfn
         WZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784704785; x=1785309585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=utW8YbbssTVsulJvHfz/jBDoROF5Koo4xil5lPJsJM0=;
        b=lnYQHZBa3bBeJL2Gf8TtwMs6wUPjU3IimTAIDcPgDNtbT/0WIJcBIbhZW9teroo40m
         GjvF1vPRufajKhLC1/hTeIw2G3KADmyrjM8TeMTyf8LLU5ORFFf3WPYqxKIU7Q2FjVUe
         29W+YiZOup99ZCZX9MTqEzuWD3kxM3tBsLg4ZHWEOxj20d2ruDqJnef6t0WoPKfV60pS
         o8/Y+Ws48pD9+ht5ysFjr40oYxsyTDbImU2ouzD22pzdcdxz0SQEkh1DXG8rgSVeCtkv
         4+zI07YXPmtZDSVyYFFPQ+pL9c6k7Qr/YJY9/xykVHVIn2dNerNCQ8X47kpyXHuXCF1R
         LDGw==
X-Forwarded-Encrypted: i=1; AHgh+Rp/LOqkeAvFnAqz7kXwNW/t7wXsHEdv1/RIXqs4047LQ5w5FOBt9Ip9jG9tRsW6kXznSUXeRjHHcF2m@vger.kernel.org
X-Gm-Message-State: AOJu0YyJJTbjJVggKxRZQCjSZRsVpCY5oi9qK86ME2d6r3Xi6bHTST6V
	DOADIrCkFybclp5zkFFBBo+bs1pBTw60XiD8O8eDexVyVsDYv2U6NcRp
X-Gm-Gg: AR+sD10NEPv7Vm8BtmaaWax9zbvM4um2smEVrX+L/9y2/DDVy0VVQpu9XiinpNKIINh
	hOrv65rs0nxmF6jXzNgUAr17w2HfIKEE4ZJNP0I4XSOp3jb9wMVjB4dRAKu2iYzfbQ9Gf+BunYR
	YVvc5d4186cIekdR86/6nC7UiXCWKnEnnDURkDA5xNTYhcWb4szByglQED4yrN09vDjYLniYs1S
	k/cysz7G2TR8ohq2epUVKvwZ3OWnaES6Geggr4PwiTLx1qlxJUcWrwTLG+SEQCGucvUVQbaE1SL
	vex6PFWWLMwOaa8NIDng8f+neu4vr2UAcI9N6sJndPdOYGMbfriuT5OVy9gSZAU7JLdf4EEqECB
	d7qB7nwbMORtMHYvZWrhS43pof/BPiflcyb545bznhuUuBv/YLDBjPvNhDtjDFDyfoVMSf11A0n
	V7ee8Ss3P1dOPsLwhKgYZARlCT7DPBUjL5Iczh3aoEQGU=
X-Received: by 2002:a05:6214:4992:b0:8f1:617b:2692 with SMTP id 6a1803df08f44-907b9b3cf0fmr35036926d6.10.1784704784815;
        Wed, 22 Jul 2026 00:19:44 -0700 (PDT)
Received: from thinker (syn-072-043-128-189.biz.spectrum.com. [72.43.128.189])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907ba9e18besm15269996d6.24.2026.07.22.00.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 00:19:44 -0700 (PDT)
From: Amit Barzilai <amit.barzilai22@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: airlied@gmail.com,
	andriy.shevchenko@intel.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	robh@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH v3 3/3] drm/ssd130x: Add SSD135X_FAMILY and SSD1351 support
Date: Wed, 22 Jul 2026 10:19:11 +0300
Message-ID: <20260722071921.43687-1-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87y0fbs05w.fsf@ocarina.mail-host-address-is-not-set>
References: 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Javier Martinez Canillas <javierm@redhat.com> wrote:
>>   */
>> -static int ssd130x_write_data(struct ssd130x_device *ssd130x, u8 *values, int count)
>> +static int ssd130x_write_data(struct ssd130x_device *ssd130x, const u8 *values, int count)
>>  {
>>  	return regmap_bulk_write(ssd130x->regmap, SSD13XX_DATA, values, count);
>>  }
>
>>
>
> This change is correct but need to be split in a separate preparatory
> patch. When you do that, feel free to add my Reviewed-by tag.

Agreed, adding to v4.


> Please split these ssd130x_write_cmds() and ssd1330x_write_cmd() refactoring
> as separate preparatory patches. This patch is changing too many things at
> once, it is better to have each logical changes as a separate patch. This
> makes reviewer much easier.

Ditto.

> I don't like that this logic is in the ssd130x core part of the driver. This
> is supposed to be transport agonistic and should not be aware of the D/C#
> behaviour that is specific to the SPI transport.
>
> Can we move this to the ssd130x-spi driver? For example, something like the
> following might work:
>
> 1. Make ssd130x_write_cmds() to just be a static inline wrapper that calls
>    to regmap_raw_write(ssd130x->regmap, SSD13XX_COMMAND, cmd, len).
>
> 2. Make ssd130x_write_cmd() be a variadic wrapper around ssd130x_write_cmds().
>
> 3. Add your logic to ssd130x_spi_write() instead of ssd130x_write_cmds(), that
>    way it stays in the correct layer rather than having a leaking abstraction.

I agree, in hindsight this code goes against the transport abstraction.
I'd propose keeping 1 and 2 in a single patch, though. Making ssd130x_write_cmds()
a wrapper around regmap_raw_write() and making ssd130x_write_cmd() a variadic wrapper
around ssd130x_write_cmds() are two halves of the same change: routing command buffers
through regmap_raw_write(). Splitting them would leave an intermediate state that isn't
independently meaningful. Happy to split if you'd still prefer it.

> Also, instead of checking for info->family_id == SSD135X_FAMILY, we could add
> a dc_high_params member (or whatever name is more suitable) to the struct
> ssd130x_spi_transport Then other families that might use the same can just
> reuse this option instead of checking for specific families.

I agree that hard-coding a check for the family isn't open for extension and should be changed.
Adding a member for this in ssd130x_spi_transport is a fitting solution, I'll populate it in
ssd130x_spi_probe() using a static array that will describe which families need dc_high_params.
I'd keep that table in ssd130x-spi.c rather than adding a flag to ssd130x_deviceinfo, so the
D/C# concern stays in the SPI layer instead of leaking into the transport-agnostic device info.


>> +	/*
>> +	 * No long post-reset delay: the controller datasheets only specify
>> +	 * microsecond-scale reset timing. The lengthy delay seen in some other
>> +	 * drivers comes from fbtft's generic reset helper and targets slow
>> +	 * parallel-bus GPIOs, which do not apply here.
>> +	 */
>>  }
>>
>
> I don't understand the point of this comment. You are not changing the logic
> of this function nor I see how this comment is useful.

I originally added a redundant delay that I saw in fb_ssd1351.c, when Andy
noticed it he told me to add a comment so others could understand the difference
between this driver and the fb counterpart.
I agree that it shouldn't be included in v4, it was a specific mistake and I
highly doubt others will see similar situations and if so they can easily research
the subject.

> Instead of ssd133x_write_pixels() and having per family logic in the primary
> place update path, I prefer to have a little bit more of code duplication
> and add an .atomic_update, .atomic_disable, etc for the SSD1351.
>
> Yes, I know that your current approach reduces code duplication but also
> makes it harder to change the primary plane update path for a family without
> affecting another one. This is particularly important in my opinion, given
> that contributors usually just test on their display family when posting
> the patches. So I prefer to have per family callbacks if possible.

Agreed, I'll add per-family .atomic_update/.atomic_disable for SSD135X in v4 and drop
the shared ssd133x_write_pixels() path.

The one thing I'd keep shared is the atomic_check callbacks
(ssd133x_primary_plane_atomic_check and ssd133x_crtc_atomic_check): they have no
family-specific branching - the plane check is generic and the CRTC check only
allocates the RGB565 data_array, which SSD135X needs identically. So I'd reuse them
via the table rather than duplicate. Let me know if you'd rather those were split too.

> Again I wonder if is better to have a device_info member to decide whether to
> register the backlight, instead of harcoding the check for a specific family.

I already have a draft for splitting ssd130x_update_bl() to be per family, removing
the need for this code. I prefer to first submit that patch, and then mention it as
a dependency for v4 of this series.
Feel free to suggest a different solution.

-- 
Thanks,
Amit
