Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3180E3C13E9
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 09:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781171155; cv=none; b=MQ2LDV4btcGxk7jJDekUvE+cjQ/ntq3qDXQiftIxATE6gqwsqnmMdxBxvNvW5OHlXm7sPKrRrOD+BNNxfvfZVga5wJR8pBMC43FRbnnyA2rTgseBGFzadVxQ2yj6nX+4rsxaToS5g2wReiCDiU02UFVMABjsP9o/TemBoS3nPBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781171155; c=relaxed/simple;
	bh=pDilR8tLDzDnRJL907e9SpEpeOSWVdzZWpA6nt8O0XA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BJPeMe2K2NP7iSxZEwzLjB4GlTqL/IFKGFgZAP559ed717eVfB25gWeVeGxdaHFq7sbD1jhoKjg6MvEZcNqqDv9V98mptv4gMSV3LrucRn4NWvFNVfigbfrzKt5zMFJZEPOPWwqhfSP9+Vfv+9ZFl9+Kr+E1FRUQP3df+AxhWpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NeRToklp; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UX0cQ0GQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NeRToklp";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UX0cQ0GQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781171153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4ty/4n6l1g5FwMH6wZXov57APeLPygvD8X6jtVzY5k0=;
	b=NeRToklpLOULfu5x3/zW6Xk0d4UQceo3do6f4pP+H6pXbcePeLShLKfAjrb86n0/01hslI
	iWAOxNzW43LVNhKrw/6vqL77X9B5Iz0F0k5485Z8PhuKoZKLY7I60ryWNHYpHVjIgDQgmZ
	zlpKd7cuL1p7E7Xaj6nYaeWbQItnJ38=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-GE671rafPzqBv_OAt9-d8w-1; Thu, 11 Jun 2026 05:45:49 -0400
X-MC-Unique: GE671rafPzqBv_OAt9-d8w-1
X-Mimecast-MFC-AGG-ID: GE671rafPzqBv_OAt9-d8w_1781171149
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-490abeb7298so80673445e9.2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 02:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781171149; x=1781775949; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4ty/4n6l1g5FwMH6wZXov57APeLPygvD8X6jtVzY5k0=;
        b=UX0cQ0GQsdw0WWdUdJDIfCcMWCgGMctiEv8TIYeVx7mqidusl2T7EFT57fS8a41PBH
         Z0lpGdQVPFarViI9ZQY+/9KTuEOLNxGpP9hVu0cM3bFe2Pjn55cRNF2+9pXYgoG1uS3i
         KZXq9eZAEj9nRrFhW+mAXFEys/Y3DnQiECzE7bN0wrmqTN64LJpatIS6Rmg2oN0Vzzy/
         6VD1t+bQbgREdYHOudw3leHtgJ0A+Yq5UEQJiHSX8dobYnhhwgxJXBGypYrbMysqFC4H
         UNfZvRvd9H1v/39NM1qDKpXZK13TEi65ybqclqGhm4khnJ0SwyeP6crmPxHEBDGpcMjd
         VTYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781171149; x=1781775949;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ty/4n6l1g5FwMH6wZXov57APeLPygvD8X6jtVzY5k0=;
        b=gbtNaKJ4EGzIsjY3Eskkjsr27FesY5fIm7Zh8W94jsezXWJ3sJDg0JdRoRuKLW2JXs
         vj8i9xoqGJyun3LukCfyXuvDJz3lcHJDIoWiVId8VtOawGMqeD3Zr0HuyU/pJfdyPoHu
         UflJomiaX4Q9g4Xv9CkDVz7fEhjrcwbTcbGjYqZy6k8n8Auy3xV2d8ReojS00ZriBgD5
         s+0hMX+MuZZdLYjjYv2abiOa7Gx0M5MmYsFDDcNofMl3cjgBnTKr/z3sCPrdR+oQxkUm
         tsyMzsHrN43UW+l8xawC78xtaHhgOwZL82rRJVTrmVfYk7Q1IQTIwS5y5V6F5G4v21kx
         i3jg==
X-Forwarded-Encrypted: i=1; AFNElJ8HD1mVhqsmjVAGJ5V50/TabzEIu0O5H40eqn9pqOVIisfX3/HNeYaqgmNoJRpIJ9U/UZlNl3GZYU5N@vger.kernel.org
X-Gm-Message-State: AOJu0YwkLf39+J4/wQDUz3uNkzXGGL0UUXQppw+4Gw5+sEk6qGNQ5EZO
	A2OTcHXqmUknUlB0EJ2u3mJc5PQ5Wsp0PkBP53iVS/Wl3QYNiE4G4qKriczPQ6UpF1g6GHz3RZq
	jr1kFfngzm9izyrpIvM7+OWus1OQZ6o4yA0BTnSPb7g9jsL4Xwcx11JivUcbSWFY=
X-Gm-Gg: Acq92OHfUFtpYdwjFT/wJlKeHogoZQ9EhxyqOrocJmhjYA1gIVMw7TdML4q8rUDAjdF
	pRf6HkUgj4OwliZ6aJ/xFhzYh3YPlh2CRC1PBKMsH9BWbA1VnqJs/yRdHdzi8wn+10iyMSMTCK8
	VyL3f6BjEK5HDqJE1I4AQLN8gmyhlKs+YokCfWIo1H6UQ+GfSvEWTO8a8L3ikxiufegkPSY7uYX
	nGRC7TqESIuSBh/y3As12ExK/HsDRcI/kZSD4w79eraAxA8zyYK2+AH7DPFNZT086W6176yk1m4
	8Fk5EUBnrdczWSGGw6qwFtIPZQuK3KPQSTCnJA4plhnSIiHmjJ2BKiiDqfK3//J/o9fNljAqO0V
	2zBIKnhkJeS6i07aw7aKcYhK+Zv9JXNm2rVJfUjBH86cnXV74fMMZKm18FjGxzrPLFnEcpY5+cn
	3ecJo40VcxfvSbEdo=
X-Received: by 2002:a05:600c:3104:b0:490:bad9:de43 with SMTP id 5b1f17b1804b1-490e537bf76mr24986115e9.0.1781171148715;
        Thu, 11 Jun 2026 02:45:48 -0700 (PDT)
X-Received: by 2002:a05:600c:3104:b0:490:bad9:de43 with SMTP id 5b1f17b1804b1-490e537bf76mr24985515e9.0.1781171148210;
        Thu, 11 Jun 2026 02:45:48 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e2d046d5sm50817795e9.13.2026.06.11.02.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 02:45:47 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Amit Barzilai <amit.barzilai22@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Amit Barzilai <amit.barzilai22@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: Add Solomon SSD1351 OLED
 controller
In-Reply-To: <20260610164428.180091-2-amit.barzilai22@gmail.com>
References: <20260610164428.180091-1-amit.barzilai22@gmail.com>
 <20260610164428.180091-2-amit.barzilai22@gmail.com>
Date: Thu, 11 Jun 2026 11:45:46 +0200
Message-ID: <874ij976lx.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Amit Barzilai <amit.barzilai22@gmail.com> writes:

> Add a device tree binding for the Solomon SSD1351, a 128x128 65k-color
> RGB OLED display controller driven over a 4-wire SPI bus. The binding
> builds on the shared solomon,ssd-common.yaml properties already used by
> the other Solomon display controllers.
>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Amit Barzilai <amit.barzilai22@gmail.com>
> ---

The binding schema looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

