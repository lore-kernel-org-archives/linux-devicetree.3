Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA653ADB9A
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 07:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790668568; cv=none; b=pYpNUC+oVwp15Mj02g7Ub5lz7TpQAuCzF3AU6gAjdm19wugjR7j+OjjzJ1XEnqyeIjo0FYeczlx8FXN8MFdrppFHgJPByC4ql+RMlVNr6RsuIkVCT1P+/a3CrXRYHdXdV9znr0XWAHoLQ+tPvYHJhGlMuu2SNmjiDzy7JiTKqz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790668568; c=relaxed/simple;
	bh=FZSe8HgfY7ih+9qZIOV1xDysbmaDeK5MObFJHVmEAsg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pckSVkvoFwqVMaPSO2nqFyiThC6faHht3L2iA0gf/gVstU6K5Ntv1A+60xImOvf3EDfXrhO6/VXnVPMec1TgDdyslZndjuQlnLpBDLG8MS1ofozeBl5IIpxFKEejDzp4B5pM2N13pZUpZJjEOC2ufd0e6WATJyYmCiLkzjPTt2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D9UycfZ9; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=BdMLjF0+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D9UycfZ9";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="BdMLjF0+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790668564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RTJ7TuOM9LkPJunaWpeCcattfbluIgbJm2Adgvc46zA=;
	b=D9UycfZ9zjm8RQcJbUJshjnm2LIeQk/LX4/WpMz3uhpmV/UtUgQDcTRODAAJbaxiM46UHr
	a536yxBuKhXqUegFdbFxBxvImASc+TyLH/jy1JVlM8mZZImNcsDmrFjOqr14YHZE1k08jt
	GUSlMCJfRfElQByJDs2FZbsdgh3pckI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329-DdRMFquOMiy3ig4URCFhog-1; Tue, 29 Sep 2026 03:55:57 -0400
X-MC-Unique: DdRMFquOMiy3ig4URCFhog-1
X-Mimecast-MFC-AGG-ID: DdRMFquOMiy3ig4URCFhog_1790668556
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48af4a0bd0fso140438f8f.2
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 00:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790668556; x=1791273356; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RTJ7TuOM9LkPJunaWpeCcattfbluIgbJm2Adgvc46zA=;
        b=BdMLjF0+XP8s5VZwKZnHKzrO54U6Bud+/djn9qzXcesiuUe+pYckf4Uhk70FU2owFf
         qHsQUk8pGQWcBsfloRhy6EkSxUeZT4ZfznLDoNoKIqpvsvtPLDaMibLXH8c2gqFGY2Tg
         dxab+R7XbSD49jUssW9UcOOCiuL2C/oTDJUdTl3GDL8KoCXpwmWiP5NyZaX0g+1u1krb
         vYEDHg+XMU9RWV1vvvC40TPkVts6A8iNwkPkcslORWTuNV2VQJptzvu0EPpRl6639cOS
         9a8oQqFLWGq5wemv/wpTN7vbONDItIm5Zf6ivPD5kfLdDxbjvqfK2lmfu9FrbHWrzQS9
         9BkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790668556; x=1791273356;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RTJ7TuOM9LkPJunaWpeCcattfbluIgbJm2Adgvc46zA=;
        b=jc6w5NTtvR2/ZnntCZfRAL1e9aZXIQj5fbRq9SSwjR4xWiLQg/vWWHnMl6dssFXBfT
         +3HvzcHpSNSLgwe8uLRdYXIgs0pllLzzBrFpqXGT60BjUW/bmmF8sky5abJDZzkx1gkl
         VZVDimaE+Jyy2lnx+7sncvUVQuwtTgjHbVmdXwhgDALis013m1i2XWbWrtB+DYbY2V1I
         9mZX1GPikRuaXSWijx0Nzub8ao3ESnwE1OWnggGFRYyVI1qY2SK+T1bX3mzpRraL9ddO
         RRe3hAw4jpi/3pHfQv5v/cBxHAixgDU4hsFPeOlvqopq5rA6VFhZB+O5TWxNO5rfU0nG
         bNJQ==
X-Forwarded-Encrypted: i=1; AKwUvBwz+x5feFm/7+J1LDBBhbMVy5/GXUOHJhU8ggBWcMXplcKrUFfa+bcXIAm7MaVjaxydRU3lUuq6vkS6@vger.kernel.org
X-Gm-Message-State: AFq9FYKwN/vaWyR8JV6hOSWsnZf56gWb+6ld78LPtnzrK5hLyBcd8at6
	5zu9Te42WZ3+4PvqxhuACKCGIr/JPbUs2QuMM0bsNqn9Cz1517lKzGnlKbUpoHmkOPdUiq1XNic
	sVfmmSmTSXV+/vErLVavaKGm0JbCzdP4HHv/1WQame9aAEnt+Q5Slck8n5e13oQ0=
X-Gm-Gg: AYBFou2NwTMuKYZNaBPbMKuRghIyvsKTwJwwpm8yMiDi5WvhaMMdXZS6TQI4VUxNkBR
	+3r5z0xG2DfdX6bYZFtu5snIUOC0VD9OLTa/RAzkYMJEXGvPru2Gw+Oemd/hBwQ5x8J+nm2hXIH
	iM0OAxL5p99NuNcFhyOxG3g7q1OGybx6JS059b1nuKgBQj4+7cQFmw9dvjGLKyLp5TKuKzlMNu/
	pGwdSUvk970z2TOFxWZwgAxR4edaoSUTtWzWct6Xn1OA05WKiCtid0qWMw7JVRz6I0pJvrbU+aR
	nH0ZFqmRQ+NZM7DKBbaU22aKQG0IbsUoHM0WRt049CAcBsHUZlM/657DbTUJhKGBDNmj/bEvUS0
	xUlasSphdar2RnJ4Bm8VQBg5zY5gMrnLGZRrSic+BE88TDeojzokAtTVBm/q4DKgM9Q==
X-Received: by 2002:a05:6000:614:b0:487:22c6:a623 with SMTP id ffacd0b85a97d-4887166d7eemr27549818f8f.8.1790668555873;
        Tue, 29 Sep 2026 00:55:55 -0700 (PDT)
X-Received: by 2002:a05:6000:614:b0:487:22c6:a623 with SMTP id ffacd0b85a97d-4887166d7eemr27549769f8f.8.1790668555384;
        Tue, 29 Sep 2026 00:55:55 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af4f88352sm2268962f8f.4.2026.09.29.00.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:55:54 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>, Jessica Zhang
 <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Albert Esteve <aesteve@redhat.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/6] drm/bridge: Add a BPF-based MIPI-DSI panel driver
In-Reply-To: <artpBMeM13Dd0lLy@houat>
References: <20260928-drm-mipi-dsi-panel-ebpf-v1-0-5244926aace4@kernel.org>
 <6b80cb97-6706-412a-b013-9423f6f75153@linaro.org>
 <arqhwHiVf00j94J7@beelink>
 <0259fe4b-3118-4ab0-9b62-55101bfd7f33@linaro.org>
 <arrAqg5n87INTHE6@beelink>
 <674314b4-6b80-4b3a-ac15-eefd31cea607@linaro.org> <artpBMeM13Dd0lLy@houat>
Date: Tue, 29 Sep 2026 09:55:53 +0200
Message-ID: <xlv1wls4ebjq.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Maxime Ripard <mripard@kernel.org> writes:

> On Mon, Sep 28, 2026 at 10:36:18PM +0200, Neil Armstrong wrote:
>> On 9/28/26 21:48, Benjamin Tissoires wrote:
>> > On Sep 28 2026, Neil Armstrong wrote:
>> > > On 9/28/26 19:24, Benjamin Tissoires wrote:
>> > > > On Sep 28 2026, Neil Armstrong wrote:
>> > > > > Hi,
>> > > > > 
>> > > > > On 9/28/26 18:22, Maxime Ripard wrote:
>> > > > > > Hi,
>> > > > > > 
>> > > > > > Panels in general, and MIPI-DSI panels in particular, are pretty
>> > > > > > difficult to support and require pretty much a panel driver for each
>> > > > > > panel produced. Most of them are pretty simple, and require an opaque
>> > > > > > initialization sequence that is usually poorly documented.
>> > > > > > 
>> > > > > > This creates a tension between OEMs and distros because OEMs will
>> > > > > > typically get a new panel to react to a sourcing issue during
>> > > > > > production, and thus need some swift turnaround between getting their
>> > > > > > new panel and it being operational in the OS. Distributions on the other
>> > > > > > hand can take years to ship a kernel with that new panel driver.
>> > > > > > 
>> > > > > > To solve this, I followed the example of HID-BPF and wrote a panel
>> > > > > > driver that will rely on BPF programs to perform the panel
>> > > > > > initialization. That way, we can ship the programs separately from the
>> > > > > > kernel, and with a different lifecycle. If this driver is accepted, the
>> > > > > > plan is to have a userspace component started by udev to identify and
>> > > > > > load the right BPF program for the panels found on the device.
>> > > > > 
>> > > > > This is kind of late for serious applications except if we manage to
>> > > > > solve the bootloader to Linux display engine transition.
>> > > > > 

Besides what Maxime already mentioned (that most general purpose Linux distributions
built the drivers as modules anyways), it doesn't have to be mutually exclusive.

A simple panel could be supported using this BPF-based driver and then a panel driver
added to the kernel, if is found that some applications need to have it built-in and
earlier in the boot path.

I don't see why this would be any different than HDI-BPF or other BPF-based infra,
such as sched_ext.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

