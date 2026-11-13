Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794574971;
	b=XIamAoqROM+HHLzUbmZv6H7sEg1rSm5dg4Efs3MuSsMiCmoup0m9kKsj2foR0xMFbeaA
	 vvWhSBye3CgNqIjjdTiGJ/pCFzOZwk2M6dpNs68kehcAgwIuUxeliE10IcVrNlr0VA2+E
	 5WGDDlW1KEblyo2mC2K3oA1ZmDxAO/PRP5kVFkPrXRr/iRqRDk19alIr90b+WAKFch/2T
	 k754KREMRdIMw9OsVYXk0Wu2EWw/u1HcCXtSy4UK+tHHqxFasERBAT0l43jFa3GOTHi2l
	 g0JH4anpBS9UXBuqyj261n4mjoES8+GHR5l9nDNO0vUjoIDwtqpESiZ4vCd1OveC/ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574971;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type;
	bh=SmBoR6Vj1QeVffmXogWgD5Pkl7UaW+NO5BD9KJS6mXg=;
	b=DJ5NeX85Nkb2vvKlTJxI8doj3eJyb4F/OpWqFbNXtB0yQEQC2TJGV1zmYFiPVZYmqh9u
	 ouB2ST9wmOAbodF0d7DXVzj71O7RTO/ooQ2Zo4kDBmaCBaNhuk83nvvKhiD0z8htXKUz6
	 xf7JD88jpEwmk50hjPNf3EfYppi5xtJSr2rF4VZPSI09FKpsDzvRDyJH5yQKkq4p4ODFF
	 VtRLFBR31S5a1bqa+AmoID4/C9nlV+rmsmZFvbSZbzoe4EpVXN2aIctQwDf7MzIvFCFYp
	 mSKO10/qEbF0+hvwfZprOur23+6H8T7SQkUyLgmeJlMb6gLzUCM1kZsjpZlO1td0p8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OrmL16bn;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=o0hrBIkg;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9207606A32E
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 13:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9207606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OrmL16bn;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=o0hrBIkg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794574970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SmBoR6Vj1QeVffmXogWgD5Pkl7UaW+NO5BD9KJS6mXg=;
	b=OrmL16bncT5YSRoa1HEMvNgm8vut3WONKjbSfpfRC+ZS8fJYDyYz6jT5G3SmVVj+p9KGWp
	ekmQiHWypFJMU55DBKs+QZVKot+4jAPrX2z2gHgFi1tqmqk+coktvBndOlH6kpEHvl9SkF
	iNEbdt1BTFFf+eHZJWjCM+Y17R7AK1k=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-lK23epMTMT-pl9L_AOf_4A-1; Fri, 13 Nov 2026 08:02:47 -0500
X-MC-Unique: lK23epMTMT-pl9L_AOf_4A-1
X-Mimecast-MFC-AGG-ID: lK23epMTMT-pl9L_AOf_4A_1794574967
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c505ee610feso93078566b.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794574966; x=1795179766; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SmBoR6Vj1QeVffmXogWgD5Pkl7UaW+NO5BD9KJS6mXg=;
        b=o0hrBIkgicwuWvPInNgVkgwCNjBmMxIMYNhunoB5f1q1kxSrTokco2KY2WWL9l1alC
         /+2xx0UgyBTRyEUMhy9G5YTyLyjj/F2GGzFz6+FF2fymwVv7bKVEhFQUwP4YunLY8j5E
         v3PiNcdqk8qY6mchQEdRh1Jq+udbS7P00ZsQxxtDRhdPdxbshuGD8H3yQUONw5D2purH
         q/NPhMSbgfRUU1Ozm3GrHiRDFvQYQ1gAybudb6DbdYQXoU1zx6G/rW95yJ6tvhBv9o2c
         Q8QMg2Aspi9sulSh5TEFm7eThufzpVSPLH5qj2uzAh9KN12ABMaEUULf4P2ql6JO9PPs
         zekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574966; x=1795179766;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SmBoR6Vj1QeVffmXogWgD5Pkl7UaW+NO5BD9KJS6mXg=;
        b=2w51zyPA6tRLXe95yChl9aug7xz6/nIQ+el7hVCyo81k8nz/zRS/lsHDxHnazmk/zA
         eHanAJIUE8fOceJNeMAdHYgkplPX9ZL/G5D0Cm4WAnfshuWzp6JNDmcLvDwE6PfwDeyi
         NiuNRoOS2wePo4YJy6qhmP/1UpRfmbh7Pzf+MQX2DupbEjjEr4iBC+5lykJoiabJK47X
         ecEv5PY3xjeMA9BQloqUA16odl63mWOgXIIR09P3f8/vExk42cuUd6HAyosxWpgBh2WB
         oJzC9klftLQZ5arVVf/1mCthrA07z//enPyd4db4gKrQBccIm3yh8eIrn6lTLgz93Auu
         d2JQ==
X-Forwarded-Encrypted: i=1; AL+hErEG0hdZghPIuVTHpx5UBXL/oU09YWp5xQDZL3Z6f2dbGGeY4puQGBhH29KE6+fXhGSOohrMYpd2V3/F@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZhEetiIdXE25cDFOkmdIhVq4qs90q2/p80o267SShdgD361x7
	XMv3e7CvuPsk+EJC5ODLU+RraD2Jfu0E8rFP4t67On2GUhHpADzduJnevmQKLO1SY4J3kCRSQCa
	DFm0J6Xy9OHq1Tgj7kJ+Y1i4NarVT1cyM6iRmXRLJqdlep6NjcRoufwnEOXqnRkcVNdrhkFU=
X-Gm-Gg: AYBFou0e0xOD6Z4xk6/Xnlkl7cfPl5sEXMwdN6O6rk/5ej+upLovBPXC4b6FqDBZgsJ
	Mk3r8yXZIRl73L59qhdZPkYEH1hylHOEt7UL3LG53QPswPDgtW7lxAsjomLdzmUf+vLIxxFyh55
	aSYCCJENzidKyr+bL33FlA/B7EcAC2EYFpidqbepSEH5eXzCTcedQUPBfjxe3peaJziD+xz5fTb
	PfCbXF2UrYDMvwG565quQ24zpB5CvMITFwUV87MYG6CJds+ShvTH65uvrHC+voHn6V9+ctpc2Cr
	GsYIqDvb223lC/y9ZpSYzUd4CHzaqCEwB7qsKDRSNgRiCiypA3m6uOhK2itGkb4drO5d5HtYjet
	oKzOd/HAnN+S54HsDDbn8QCpJ5+qL2BVlB33ebYqL01xZeXxX984iOhTBP4NDlm3ZFNHEpRo3Km
	qNiqi24YNWKy5EGcpeAwe1gAftaE8Nh91fyDMdFvo=
X-Received: by 2002:a17:907:868f:b0:c50:475d:980e with SMTP id a640c23a62f3a-c50963ced7cmr207752766b.38.1794574966270;
        Fri, 13 Nov 2026 05:02:46 -0800 (PST)
X-Received: by 2002:a17:907:868f:b0:c50:475d:980e with SMTP id a640c23a62f3a-c50963ced7cmr207744866b.38.1794574965555;
        Fri, 13 Nov 2026 05:02:45 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c6020bb0fsm4784229f8f.34.2026.11.13.05.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:02:44 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Fabio Piparo <holofermes@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Amit Barzilai <amit.barzilai22@gmail.com>, Mario
 Limonciello <mario.limonciello@amd.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: solomon,ssd132x: Add
 col-offset and dclk properties for the SSD1322
In-Reply-To: <CAB3Lz5a67uvP3+1fXd8iUeJWzH8wUoPdauu8zVW4t4KXMbTN8A@mail.gmail.com>
References: <20261029205751.3513474-1-holofermes@gmail.com>
 <20261029205751.3513474-2-holofermes@gmail.com>
 <20261030-dynamic-oarfish-of-dignity-feaef6@quoll>
 <CAB3Lz5a67uvP3+1fXd8iUeJWzH8wUoPdauu8zVW4t4KXMbTN8A@mail.gmail.com>
Date: Fri, 13 Nov 2026 14:02:43 +0100
Message-ID: <xlv1wlqgsx3g.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Fabio Piparo <holofermes@gmail.com> writes:

> On Fri, Oct 30, 2026 at 8:06 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> On Thu, Oct 29, 2026 at 04:57:50PM -0400, Fabio Piparo wrote:
>> > +  solomon,dclk-div:
>> > +    $ref: /schemas/types.yaml#/definitions/uint32
>> > +    enum: [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024]
>> > +    default: 2
>> > +    description:
>> > +      Clock divisor.
>>
>> Why this cannot be deduced from clock frequency?
>
> On this module the SSD1322 runs from its internal oscillator, and the
> external clock pin is not on the ribbon. These two values only set how
> often the panel redraws.
>

Yeah, the property name is misleading. Note that properies Fabio is adding
are from Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml,
which is for another family of controllers supported by the same driver.

The ssd132x, ssd133x and ssd135x families don't make use of them. That's
why they are not defined in the DT binding schemas of these controllers.

>> > +  solomon,dclk-frq:
>> > +    $ref: /schemas/types.yaml#/definitions/uint32
>>
>> Use either existing properties or - if there aren't such - existing unit
>> suffixes.
>>

Again Fabio just took what currently exists in solomon,ssd1307fb.yaml, I
agree with Krzysztof though that these properties are not nice and don't
really describe the hardware...

The ssd1307fb is pretty old and was originally for a fbdev driver, then
a DRM driver was written based on that for ssd130x, and finally the DRM
driver extended to support othere families, which had newer DT bindings.

>> > +    minimum: 0
>> > +    maximum: 15
>> > +    default: 9
>> > +    description:
>> > +      Clock frequency, higher value means higher frequency.
>>
>> Why would the frequency be fixed/static?
>
> Right, it doesn't need to be, and I'll drop both properties in v2.
>
> I still need the redraw rate to be adjustable. I drive this panel at
> about 200 FPS, and at the default clock it redraws at about
> 115 times a second. One way would be to offer the 256x64 mode
> at a few refresh rates and set the clock divider from the mode
> userspace picks, the way panel-newvision-nv3051d offers
> 640x480 at 60, 100 and 120 Hz. The rates would be approximate
> since the panel's oscillator is not exact, is this a good way to do it
> here?
>

Fabio, I suggest to just drop this patch and as a first step just
set a default_dclk_{div,freq} in the SSD1322 struct deviceinfo.

That way, your driver changes won't be blocked by the DT binding
schema changes. Later, once your driver changes land, we can figure
out what to do to make all this configurable from DT.

But Krzysztof is correct here that these properties don't seem the
correct way to do it. They are just exposing raw register values
in the DT, which is not the proper approach.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

