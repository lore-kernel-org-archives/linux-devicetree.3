Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CBC27EFE9
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 10:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783334807; cv=none; b=DbPxqToBMq6qEKsz1tKm8OkKliSjyvBorxH/WJf/U9i0JCCeReSlAHumF84ctT+1hub5lyRuLO7mKAICCvcD5L+eZS2RzN03aVzMAR1VDJvplwVPl5Oo1hQvpGMenRvQwUwbxfXPkx0h6EcTAuXEVxtLPpFjwPt3KLz/gj5QVDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783334807; c=relaxed/simple;
	bh=3OCy9vTyc2og6uHKZBERTMScvBxOyfL8SSA3SxVBmjM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oLW/Hxf0pov5+2tgk0/3g9hG8iibHgaRcykLzpUbaQNc6frkxQX8LR/4c72EtocYCGYTCyijFFEtujCB6bA9FU2pNQ4Jl76NzxSMcEy75wE2rKStLRY5yBHUtzMPSbwHYGlRWH37wyecBC9qLda00qOUqTJLX4INAQZgmZAt/PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GylsO5V8; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=RXSee13a; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GylsO5V8";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="RXSee13a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783334805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v3yUXT8ygGIwRfvHBxKy7x0rY1d4D5PmMqDi5qQR4k0=;
	b=GylsO5V8tgfmiy94a+PlHAq0HeJRRO2BdKLugrEOtAMdPLL2oMRfZ1WiLSriGJjDFeb+M2
	nGdtLA0cprLRFZGW+HBHfZ6wupy6JWs4QyYqaNlIrZelIEi1qjyfouFUNhOjHIvM5iOQV7
	+cy73KqOJQY7LiWi3yGPjGk5NdQr3hU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-V0R2Q3f0PV-3Y0FuLz4Kjg-1; Mon, 06 Jul 2026 06:46:43 -0400
X-MC-Unique: V0R2Q3f0PV-3Y0FuLz4Kjg-1
X-Mimecast-MFC-AGG-ID: V0R2Q3f0PV-3Y0FuLz4Kjg_1783334802
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-472bdd6f529so1664602f8f.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 03:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783334802; x=1783939602; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=v3yUXT8ygGIwRfvHBxKy7x0rY1d4D5PmMqDi5qQR4k0=;
        b=RXSee13a1olzy/DYa60U4WK23mG798GvWc5uT4RFLOFrcRAeIwt6VJGtev2tPa359B
         MKX8RXQ1k6k//LB5leyTWam398SMbxPaj7/4SXBO3DdpZYyqJmf/XRDDdhwcvtIpCVjr
         kqWpJnt7+7KS8mH0gVkn+uqAggQ16vC3hG/WZv/AEucTbfSGJaW8Wdlyj83HSrW8lI+U
         X2sTCRPlzPOHXzF+lkq/1Svuh/lz0PRfqAqfJz92xWNxrwiKG4/pq1ojtoMSX8B2Mwsv
         CwbzrPgygbeOO5BKfy2z3D8nJS7iK5gCbzScAQ+JX2TGcTZoj7izgyw9pRl9GIGtRdlv
         OcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783334802; x=1783939602;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v3yUXT8ygGIwRfvHBxKy7x0rY1d4D5PmMqDi5qQR4k0=;
        b=lR88HyH5gOkevm5ZIZ5X8HghHEhjlb8UK9KtdMZUtL4Hbr/6jBCC5pjFmTHfQW2pAS
         AaBRHiOeRySFTjDDVr6J6at2BSlncKoRfuRX6Jw21SQgv9KthMjO2RjAzuu47npybOv1
         NWKKTrXrRcJbio01Rlwzk+Otnoz7q/f+845bRVAIsV+DVc6xFdIgWTVcMI9XO+ycOVAB
         edIXjcMsVMJQqYDLwLmWsEaDpzvNEyOX4jCEHRMQbOlg54nGgYT3ArOyURJtzbWxILsJ
         YbG/Pw8YKxgv/5HWiZEdlS62R8fWwg5FZeKpiw5wsVMMhLsC3gLRdN5jWp/F78lrEhTt
         BbjQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp/KZ9ruXhh4fvKQmmPMcijgLUK6lBRxpnSX5WisHK4bEf9PjP9zk+WPWsDZNiJGRVji75mJv66Hq8K@vger.kernel.org
X-Gm-Message-State: AOJu0YxpO3sS1wStUSmoOB9s1GFE1QMSy5rJll4DgwGXVhxnq5Z/wZ9V
	WBDv1Zrj4+ULQbXEiWqu4SXfcT0g0oiFzrut1c7sUoRWGzpcM4pQh392dMaPg067geDXs+9EDF4
	AMS3S0aB4ZmdiyWRsWXz6BoOT4cv7T9suyVrGRHU0dyox45I4Hv0AHhFec6ddsds=
X-Gm-Gg: AfdE7clzqD5IA0Moauu3d2Ujh7t+/Jsd45wIffi71GSpepDOiDGXwlqnuSyWA4sWL08
	samd9oBNEEhg7lT0vlSw2bXAdkpRYSn7DhJzHIsWVzEdGHcSw+CpowZw0snjxYBB0tZ43wf58Bp
	9kZWU6mvaRsyy+PBYlNLigzn0btfrcoFWO+epAWzm+RJKTRcP0haFFT0HRsUakDm7SAtTRgOAoo
	VhdzWsyFFBAXHoMFloDAkky/UlPW+K8Pamh1QGQGa3aODR2a/ZOuwI1xv+L7rUw36EfMY7cnCuO
	iIqHg04rMQvF8+ob9FcIutXf4hTitqeOPlCz+cax6kpzwmNKi7uAiWQQN5w95Xc/Di4kMIoMuf7
	ssVGDct2Puh97C/G4EqfglRO94/pJqVcAGZM5HroLlna7vneOZfl56ebAxj14c6jkWCNoNw==
X-Received: by 2002:a05:600c:8b17:b0:493:bdaf:83a7 with SMTP id 5b1f17b1804b1-493d11f8c55mr115690265e9.28.1783334802408;
        Mon, 06 Jul 2026 03:46:42 -0700 (PDT)
X-Received: by 2002:a05:600c:8b17:b0:493:bdaf:83a7 with SMTP id 5b1f17b1804b1-493d11f8c55mr115689945e9.28.1783334801980;
        Mon, 06 Jul 2026 03:46:41 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039b126sm23234060f8f.24.2026.07.06.03.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:46:41 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Amit Barzilai <amit.barzilai22@gmail.com>, Andy Shevchenko
 <andriy.shevchenko@intel.com>, dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Amit Barzilai <amit.barzilai22@gmail.com>
Subject: Re: [PATCH v3 0/3] drm/ssd130x: Add support for the Solomon SSD1351
 OLED controller
In-Reply-To: <20260704080925.75113-1-amit.barzilai22@gmail.com>
References: <20260704080925.75113-1-amit.barzilai22@gmail.com>
Date: Mon, 06 Jul 2026 12:46:40 +0200
Message-ID: <87v7asbdkf.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Amit Barzilai <amit.barzilai22@gmail.com> writes:

Hello Amit,

> This series adds support for the Solomon SSD1351, a 128x128 65k-color
> RGB OLED controller, to the ssd130x DRM driver:
>
>   - Patch 1 adds the device tree binding.
>
>   - Patch 2 switches the SSD133X family from RGB332 to RGB565, bringing
>     65k color to the SSD1331.
>
>   - Patch 3 adds the SSD1351 as a new SSD135X_FAMILY, reusing the
>     SSD133X plane/CRTC and blit/clear helpers. The only data-path
>     difference is the explicit Write RAM command (0x5c) the SSD1351
>     needs before pixel data; it also gets its own init sequence.
>

Great, this approach looks correct to me now. I'll review this series but
likely will do it in a few days.

> Testing:
>
>   - The SSD1351 (patches 1 and 3) is tested on hardware.
>   - The SSD1331 RGB565 change (patch 2) is compile-tested only; I do not
>     currently have a working SSD1331 panel. Javier has kindly offered to
>     test it on his SSD1331.
>
> Dependency:
>
>   The SSD1351 reuses ssd133x_update_rect(), which programs the column
>   and row *end* address as a relative offset rather than an absolute
>   coordinate. This breaks partial updates that do not start at (0,0). A
>   separate fix is posted at [2]; until it lands, the SSD1351 shows the
>   same partial-redraw artifacts. This series applies independently of
>   that fix, but the two are best merged together.

I just pushed this series to drm-misc-next, please rebase on top of that
when posting a new version.

>
> Backlight:
>
>   While adding the SSD1351 I noticed that the shared backlight path
>   (ssd130x_update_bl()) is only correct for the SSD130X and SSD132X
>   families, where 0x81 is the contrast command. On the SSD133X, 0x81 is
>   "Set Contrast for Color A", so brightness changes shift the color
>   balance rather than dim the panel. On the SSD1351, 0x81 is not
>   implemented at all and the brightness byte itself would be executed
>   as a command opcode (e.g. 0xae is Display OFF). This series therefore
>   does not register a backlight device for the SSD135X family. I plan a
>   follow-up making the backlight path family-aware (scaling
>   0x81/0x82/0x83 together for SSD133X, 0xc1 contrast A/B/C for
>   SSD135X), which would also fix the existing SSD1331 behavior. Happy
>   to reorder if you would prefer that rework to land first.
>

Oh, interesting. I think your call is the right one here and this
backlight logic fix / rework can be done as a follow-up series.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

