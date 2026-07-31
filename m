Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A466A3DEFE7
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 13:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785502967; cv=none; b=oDzuLSL3Xz3dd69E42srIUpGVDcmgYoXRjZllY/AuQXDfDywuTs36TlHNga12f+g7XQ4FbdpCc53Krro3PrvbfqiAr78zar/nlRyqva9ffjHseL8U9psJqcpeZWzS5L6do9IqGmOhpGijeJkLUQo9KlaRh3EgNmY3sf7zhCz5vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785502967; c=relaxed/simple;
	bh=jyLfUDRKUGR+QzdlDRg/ygdwuaQOjB35r20qE6JtzlE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jppEqYgf4j8Tka4JfgRkn7um/hqdM5Mf3J2QDEZa9eTdUQe9NOtlGbbgTAqA8YQprrvDj7h6rlcToRfJNy2mAHwbMvRh8vf/aQ0etUnuY8BMMEdAk9uaM0ZCw+U/MsK5JV6uIoTxKD4q7KrhLHZXMhA0gfG+cITmQHeGH3Ki+8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=anwmx18Q; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=X/XhCbmF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="anwmx18Q";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="X/XhCbmF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785502963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=63z+74IiNXo7CtWiuSgL8tkqVXTD4W+l7gvHsFCZ+/I=;
	b=anwmx18Qw8L8a13qXSoIirE9R0iGUZ3EAA2iGG+WawzB3YS8rct2m5A+cmbUV1CRFy3BEG
	DxUmFZQTj6jOwcrrM9BXTN/URqe8QyQlPtHVDhHN8cRNTMQvcpOs3g7RSEC+fYegG3OAve
	J9hiCK+Z3krALqzfPj2Bsxqq+Os+f8A=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-204-NeI-Xc0tMu6NUn_WoAQZ4g-1; Fri, 31 Jul 2026 09:02:42 -0400
X-MC-Unique: NeI-Xc0tMu6NUn_WoAQZ4g-1
X-Mimecast-MFC-AGG-ID: NeI-Xc0tMu6NUn_WoAQZ4g_1785502961
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c1f548718d0so126448566b.0
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785502961; x=1786107761; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=63z+74IiNXo7CtWiuSgL8tkqVXTD4W+l7gvHsFCZ+/I=;
        b=X/XhCbmF9i7BCC2OBdzMb58AEBYPM7wzwt7jDqwk99EgqdmO4P17jdkrtBIlbmyuDy
         mTYHyflZRgUyclydSlxfUznLg5Xqut3/ERV6IRTMmmHxq8W69xNFKQQqdxclEf7W0m3s
         RYSIIxZfJ1bCn9xWEdcZLTuLaIAhuvb8kQq0guA1BDpt40xTh0xgDKhAv2im4bXVfvQe
         77Q0FGeS/SIKeWuvC4eeRcTpBChjnZf/oWMqrG+N+E/GtHPOGMp78NyVxIWAFO8Tr2FJ
         /evnIHSENvkEtqlzrnH4ztepuWj2rZmptD+77HRoD7yA19QDRDCWncg5SKPybgOeK6BG
         ejAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785502961; x=1786107761;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=63z+74IiNXo7CtWiuSgL8tkqVXTD4W+l7gvHsFCZ+/I=;
        b=L+msmtFek9rS9TVy9rg7BRBxx/e9Sct1oTL2Z3gnI+I7EaFbrPGZmHMUpjs1OBNz6f
         YZjpcethsjGGqB1b8C78/OeiLG1uPg6wZDHJfCDycjaRPQKPWc6TIb+7vbITS+qERhOX
         zE9AVe69ZCGl2YpmfMLEA7euruyI76IVmQZcXK++Hk+1qrARkzfjTvbZU99ZVdz+dJSI
         UYlT6/dgJRpKbZnj8A2vR5hO0BDBrRFj4Izn4oifxX6KUG91eTLGqcWAy3W9gmblY8e/
         jT+KvZflmtzwRvftXSy3DiBI11DUII+GmagfF2X4XP11V29GINuxo8weGfImShsn4Bq4
         L1qw==
X-Forwarded-Encrypted: i=1; AHgh+RrDSzZIAytikOEwA2QXENbUuHVs+80tYwqL5wh7lMcMN/a8uvcaLlp7w74NnF24YR6J4pjvfzpIZV16@vger.kernel.org
X-Gm-Message-State: AOJu0YzH2ZDiZdCVVj1DLfmKdGbYvYYWt5ceH+I7fBl9aO1Vx7BJYkjQ
	bmmIRfhVP+p8jGfgFR+p0WK8O2jNyoHj3CifXSN5Amog8Mof6Gc//KzA4itRvPsyAQKry2JFH4F
	gaH2TJgOm5YDR3mfFv9y5yX6QuT/PqsV0ngx67hZgtIbK7Ze1j9KsuoUFqgN3TuY=
X-Gm-Gg: AR+sD11add0LwYl0IvlXciRwDG41cjZ+26FJcY9xkFYH4g9HPOEv3PrxycrimnTpv9M
	80v3RaYdS+oaR1gGAObebvH2waYMbIMr6GpoKykAd5VIbEcNid3gUD4VP9gMSBiFhLZcXp5uPWd
	sH5/3uC47GKqTQIj22+lTwMF2AwBo0nEBwf/KOdy/t/P73YhWxmDMNndHbKOdOMColpKj8C4lp8
	UFPdtN0cA7Hmei/0inDeEo/FYRK99a3gMCRAvvntV7CFtSiT7MeV4izdckww1cvLNN40w+AGl05
	bbUoIipBWYV0dEOR/yyW8IDoBB6/V6g6Pvbh33WWySBjUJ+Sjbw55si7AsBmnqZcG99Er84xO8s
	GM2mz+8XFvZA93DB7uf6rXZ2M/2kgEWXvumfSs8ogfNPR+wFHLsSssrqhCcg=
X-Received: by 2002:a17:907:3e90:b0:c16:8adf:f183 with SMTP id a640c23a62f3a-c1fd23c59c7mr119264966b.14.1785502960621;
        Fri, 31 Jul 2026 06:02:40 -0700 (PDT)
X-Received: by 2002:a17:907:3e90:b0:c16:8adf:f183 with SMTP id a640c23a62f3a-c1fd23c59c7mr119260966b.14.1785502960034;
        Fri, 31 Jul 2026 06:02:40 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd4562a38sm4399507f8f.21.2026.07.31.06.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 06:02:38 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jakub Turek <jakub.turek@elsta.tech>, Helge Deller <deller@gmx.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jakub Turek
 <jakub.turek@elsta.tech>
Subject: Re: [PATCH 1/2] fbdev: ssd1307fb: add support for Sino Wealth
 SH1107 controller
In-Reply-To: <20260731-feat-sh1107-v1-1-e10977f76e6b@elsta.tech>
References: <20260731-feat-sh1107-v1-0-e10977f76e6b@elsta.tech>
 <20260731-feat-sh1107-v1-1-e10977f76e6b@elsta.tech>
Date: Fri, 31 Jul 2026 15:02:36 +0200
Message-ID: <871pcje2hf.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jakub Turek <jakub.turek@elsta.tech> writes:

Hello Jakub,

> The SH1107 display controller is very similar to SSD1307 but the main
> difference is that SH1107 has different memory layout and uses page mode
> adressation only.
>
> The SH1107 relies primarily on vertical page addressing mode where the
> internal 128x128 GDDRAM is split into 16 vertical pages, rather than
> the horizontal/tile addressing modes natively utilized by the
> SSD1306/SSD1307.
>
> Signed-off-by: Jakub Turek  <jakub.turek@elsta.tech>
> ---


The fbdev driver is obsolete and likely to be removed soon. Instead please
use the KMS driver (drivers/gpu/drm/solomon/ssd130x*). This already has
support for the sh1106, so adding ssh1307 support should be trivial

(basically just adding an entry to the device ID tables I believe).

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

