Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEA43C584E
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 08:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782204627; cv=none; b=cO6VVdsrMwVCmMJ9nW0YxFBpZCg35XJ69aP4ABZdAYa8KRA4EB8U9kPna7WD2v8AK/VSgp34V+UcqPo4LhmsQ8YlzDq/bea8eiOWOpkJWVKdueDQLEkNowwT7HSv7MqiYilUAGNdGsW4TWOkAXE04/kMRN1VMIXC91RABDVLzGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782204627; c=relaxed/simple;
	bh=TZ0+5146xwe6OT/CbQdW0d6uHCZxJf8UjdEd5HflsKE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NpMOVh1fCcVYEiZEOAnPYyGrfJXWLI2P3HSZyCXg9mmWU0SrbEu1XlsgsS39/4lYZafPp5hgrsmdF5Ic6CYpuMgr+zv7oHpfaYtjKQafNlvNoIpOxMy3uPIXF9ryi7ezDI2Mi36ptET2EjHavBvIVaRDJgBSgdWBsSJIJsGxKFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YVS+Hz7U; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=eFRKYZqf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YVS+Hz7U";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="eFRKYZqf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782204625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BuoRitIZndRdwR/IA+zUZeOYUkqVtr5e2wU2WIH4U+g=;
	b=YVS+Hz7U8F9d9rj7BnA4z+BzVB+g0apBKbVVieZPywox+7O0SzCfGPZ9jfCxdTAVUZ5HL6
	nctU/nkmmPLS801t1bdx43e0OZxAtS1QDxPCU7c+XZ/pCOb6I8Y7L2W4n4SfKP6yUr/tTo
	N+D/Hny29EaK/IUq049Xflifyk0UJ2k=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-zSg0NVFCN_25Z4W6E_cYRw-1; Tue, 23 Jun 2026 04:50:24 -0400
X-MC-Unique: zSg0NVFCN_25Z4W6E_cYRw-1
X-Mimecast-MFC-AGG-ID: zSg0NVFCN_25Z4W6E_cYRw_1782204623
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-45eec2ba533so3753486f8f.3
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 01:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782204623; x=1782809423; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BuoRitIZndRdwR/IA+zUZeOYUkqVtr5e2wU2WIH4U+g=;
        b=eFRKYZqfEI4d2Ou1bhQqmi/QNCxjvMsJWN8mPBRzgAE+UqsoMXJj30zi3lY++wtvg8
         ZcaFoJuvUPR/7qck1mL4PuhmQkJ2Wpir85Oi19FVC/PHyxZztb51IvpePSN/jn7ajwFT
         5kOdmo3JYHKA7Dw8QA47JhZpwZAdXSNSq/6VE2ivTR3CwWCwcDJyc2eDCJJPY3NlSEjR
         u/I9RYcGDE+USlg5BXroQOqnyiMdZMozp0wp62IdGYh02oOstrrpERwwToe1hvziW2a6
         hz17mfmC1UDoOfYpARPyPty3Ak6v4hkCGn5GpnHmNcEDC5ZqP+fSrGIoLh/gG1agenQp
         wKbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782204623; x=1782809423;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BuoRitIZndRdwR/IA+zUZeOYUkqVtr5e2wU2WIH4U+g=;
        b=edd155NC9Ex3tLlwReFXD7GP79Ph7iG9e32lH9yaVqtETATnlhgF/FUOZYVfsBvbf1
         xZrA/CQMGKu94Q7V9upurTmtttBS1zWlwj3qK7ryNGuPWoM24jnzITg28NU6L9Xq/IoC
         yDsASFEMN13V8qRHZHfbAY8ME5cS6SAoqUsGRMuRqDjJxdVEOo7JqC65iqpzo4MSMsjk
         Ki2K9K4ufijUCVStzCB1+RqYjNvala1P6BSqMAl6Gbz4UZ2xHfem132KA7G8ikg2K4Vk
         MMYxz/ladvBdUCP6uyjeh69JGdL0q+KoCYvljI5/cx7PWTnBcn3a4+bQyE3a4wMGYSNu
         6Ldg==
X-Forwarded-Encrypted: i=1; AFNElJ9/v18CU7AYZ2GmdBlFWeci+XuxG2GP20Kn6qunwDoPYERPROFfjk15Nz+Rwnqg/KlIm/JPlIbTsgCo@vger.kernel.org
X-Gm-Message-State: AOJu0Yz135tX1U/TfaGPeN+pYK/UY1HpgIcli4zcbWJ5+Yw8Rhm8luQj
	Jf89yhGJhN1RG0c6oeBJc21pb74ppMOD1hPoKZfitvxkbO9bwf4Ok0LijkhB05Jtsl/1EOOYrx+
	WfjQHZ3kufGg4TwNgT7UzwAdJohgLhtig8sbqVWTmAhaxxt16HBYO5jOvcAHiXlw=
X-Gm-Gg: AfdE7cmklQON30hMb8QN67cVRMxpnTgL7zu1ORWTYn9AiEBJfEa3RVftHgO9BBSuWdO
	iUurbN2UnaHm6aiB1Y+uC7NvtbX8XH/y0E3S1OVPo9xoXbznIb1dmSO9gYiKh9HDfbrXndZbCnK
	ixnSygWQYansUUbYUBJuDkk5LMq+mLagGmIuz9D0JzZenHcEpJqTODZBCVGasOGhMJBb+xqx9uh
	wnHVbKkyWRz67cJFBZHpiJ5aowJR6UijowL/mkjsAAM5XSQahu51xHKBgeYhPHSYLiP6PfDfloY
	HO0PZAiJ2tyGiksCARiRFun5fDpO9T0XddLi9+9IsMV1LIp2MxQ6PpNrXEc3t+/NNxQnWh+spQA
	3a4/MxVJWDkWtFQkMm+JyFNhWTHlVXAt+CauHfc8DsnZmW5lfomy+KYNMMMwHpepwypSDzg==
X-Received: by 2002:a05:600c:4503:b0:490:50c5:8153 with SMTP id 5b1f17b1804b1-4925b3896ffmr24629485e9.2.1782204623032;
        Tue, 23 Jun 2026 01:50:23 -0700 (PDT)
X-Received: by 2002:a05:600c:4503:b0:490:50c5:8153 with SMTP id 5b1f17b1804b1-4925b3896ffmr24628745e9.2.1782204622485;
        Tue, 23 Jun 2026 01:50:22 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923ff8a9e3sm389322615e9.14.2026.06.23.01.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 01:50:21 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>, Amit Barzilai
 <amit.barzilai22@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andy@kernel.org,
 gregkh@linuxfoundation.org, deller@gmx.de, azuddinadam@gmail.com,
 chintanlike@gmail.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 4/4] staging: fbtft: remove fb_ssd1351 driver
In-Reply-To: <ajpGy7K4eM8oJIfD@ashevche-desk.local>
References: <20260622152506.78627-1-amit.barzilai22@gmail.com>
 <20260622152506.78627-5-amit.barzilai22@gmail.com>
 <ajpGy7K4eM8oJIfD@ashevche-desk.local>
Date: Tue, 23 Jun 2026 10:50:20 +0200
Message-ID: <87ik79iqsz.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andy Shevchenko <andriy.shevchenko@intel.com> writes:

> On Mon, Jun 22, 2026 at 06:25:06PM +0300, Amit Barzilai wrote:
>> The SSD1351 support was added to the ssd130x DRM driver. To avoid
>> confusion and irrelevant updates, the staging fb_ssd1351 driver is
>> removed.
>
> NAK, the fbtft has two drivers in one (SPI + parallel), plus as Maxime said,
> it has its own binding.
>

Yes, I agree that we don't want to delete the fbtft driver.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

