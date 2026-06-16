Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDB02E88BD
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 08:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781599150; cv=none; b=OiI2Tpq96GkmwdYcGnjf2YcT7fzdG1v4Jr12F9+cL1qEkPyzIZBWgZ/oBE28KfHoC0/88kam1z3LGn5sDnLMQ8C7TfNn9xZDvNE4XbYwGSq0elRcIc89fCPH8B1w7tX/DeoO96YWwwoJzCivu+TMh0LBwOMI81fMF2rkcfUpaMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781599150; c=relaxed/simple;
	bh=67qthQB9wBmxm3ZeCIrGPjVEbE7ZYRdGnFs8xqCw+PE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=j5enMxFT/cF9vmBUQ8g0rFTvhGGwF4G7ZmQUZoc0otDP+0qUWVdh4oovW9DYpfqzyeIADVQJjvdXIdiM4KnZ3m+blmVmmjJLejLZJtoV2Ici2D7F4VMLEmI5ZOgYCy3UfI46pXI9HgppqfXQeZERZAWLxe2NPkBU3GynjnaOrvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UIgmhiZq; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=HMLOkWEp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UIgmhiZq";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="HMLOkWEp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781599148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rWhHVjmNBxttchA8qHW+tZDgQHHXjvRil6qjeh9Uq5k=;
	b=UIgmhiZqnjjIOxU3+Hp18GP4nhFEAbgzL0m48KHbwi7DS+EnW61uf8MI4vQhskHhrKfo/T
	Y4S7+zF8sYLPD5IloMLUOXxQ+x2WfEFw6XjMNJhY+yTsSoelvBbbGI75USaQ674kGqmR+C
	eOoeO4cgCiLdvoG4+aIdHrS2tEvZoWA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-Rh1bwwywO82QDfnYNbbuGw-1; Tue, 16 Jun 2026 04:39:07 -0400
X-MC-Unique: Rh1bwwywO82QDfnYNbbuGw-1
X-Mimecast-MFC-AGG-ID: Rh1bwwywO82QDfnYNbbuGw_1781599146
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-45ef616db45so3298969f8f.2
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 01:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781599146; x=1782203946; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rWhHVjmNBxttchA8qHW+tZDgQHHXjvRil6qjeh9Uq5k=;
        b=HMLOkWEptBdMoKJS21CiE7p3yCzTN926m1zMhC+B/mrykhQMbRsnXMPDubEj8Eann+
         y6yP648Pe++AaRnc9BNc3oB1dXoeO+XYmBksYlXAuVRagTVRzZvozjbO6ajXdULWvSax
         vt2VJ9dVlzstNE2qcmxR88eYuvT06U76Lu8UqnJVdC2AfMh9vepj/DEoOunnB0PDEP+O
         N7HyjOC7P4Rq+n/UEx6Dlqm7wSvVrL0US8xr/cLbEij4uGwydWHB3gjPffmBMBSbJUJF
         L3XndI6QEX1x2ZdMUezvHGE+NNuU9CZC8n503pJSgil7L3e3p3+tLgQ4qYjT6SgMSysl
         V8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781599146; x=1782203946;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rWhHVjmNBxttchA8qHW+tZDgQHHXjvRil6qjeh9Uq5k=;
        b=pgVOxZwUgwdnoOff6sCMQ2SAor7GdptYDQS9F4/JhX6j6N+3ehI0HYhWtsA37WD7Cz
         iI1EK4H6NDcUJIQfKUQSJKDXEFbLdOm15b7mu9uRf/0uJTxDwQxBJYAU4YTsDfTDeibf
         Ehv5AD5bUjJgVr3STG+OCa/HWTJFhVSI1OybFHd93dWjHwtRBoywfUmUivanorP5W2CT
         lvBDb6SDLn4JMHmMZVLiGGK8zEqwN9G/UCnW22jARp90uXrctP8to3r9KpGF7TvZEIp6
         UT66n0WbE3h8FUh+SkkJY47+KZsB26SsrhdphhYjeG7tofJ/+KnZSBETOwHvxqka1AEQ
         rTXw==
X-Gm-Message-State: AOJu0YzLFVm+FvVTpgZs2rIeovIXBLtB2Kq982QlnopbjYcw3ILN/sAU
	reCLEaBYVU5jTqi4vZ6Yxjy1/Oxkh/xGxSvNw2mk/h0qI0b5zAzH0sL46uvSSWglx7Ns1SXk4RU
	hRWbvzBy59F0u5EW7pG/OsxqR73/yU8b8p7joagotWn6kooVx1r9GrzQHW4dQI8E=
X-Gm-Gg: Acq92OGZ9sh6PX/a/4uF1jqNZBaFJnjbH+XO59Vs8Xkc0WUm4lmdw0LXEil4PM02ckY
	MO3BYd/UWYNzeaUCgOcrx7HdR+3/aplhts2W9iitgROxj6gQ9CK7UhgtXAr7TAnaueHNWwx0kO2
	ItoU1S5FonsFPhsQiSJJV8V8SUXS0gssw5wsII9EzxpElLPstG6sX81m0C5FjAh7PM8cQ6CuVAE
	Oez7RI0J6F5Uw4omWQE3p3PNnV2prt9bhrvGWD+w8u0mmuzuuFGfvBD8WG1llHxrP23fqaQaqX4
	cR1vIObI5ap+N+V7SgCHMBUuAoV9AcBPnxGwnu1OLRMkQV6OakOsIhxN0mzJXhBpIcUm43I5NQn
	PCm68GX7Webs7qvlCo4zf83eAOrIA1iaJTmRPWYXeAoHedwqkU6QypZMrgOJ+HjFP9JcrG6CdYV
	2pHVYP
X-Received: by 2002:a05:6000:2584:b0:45f:f142:d563 with SMTP id ffacd0b85a97d-46074a62560mr19589166f8f.16.1781599145907;
        Tue, 16 Jun 2026 01:39:05 -0700 (PDT)
X-Received: by 2002:a05:6000:2584:b0:45f:f142:d563 with SMTP id ffacd0b85a97d-46074a62560mr19589127f8f.16.1781599145498;
        Tue, 16 Jun 2026 01:39:05 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f263945sm43464472f8f.8.2026.06.16.01.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 01:39:04 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Amit Barzilai <amit.barzilai22@gmail.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch,
 tzimmermann@suse.de, Amit Barzilai <amit.barzilai22@gmail.com>
Subject: Re: [PATCH v2] dt-bindings: display: Add Solomon SSD1351 OLED
 controller
In-Reply-To: <20260615175620.88828-1-amit.barzilai22@gmail.com>
References: <20260615175620.88828-1-amit.barzilai22@gmail.com>
Date: Tue, 16 Jun 2026 10:39:03 +0200
Message-ID: <87jyryzxp4.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Amit Barzilai <amit.barzilai22@gmail.com> writes:

Hello Amit,

> Add a device tree binding for the Solomon SSD1351, a 128x128 65k-color
> RGB OLED display controller driven over a 4-wire SPI bus. The binding
> builds on the shared solomon,ssd-common.yaml properties already used by
> the other Solomon display controllers.
>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Amit Barzilai <amit.barzilai22@gmail.com>
> ---
> Changes since v1:
> - Drop solomon,width / solomon,height: both are deducible from the
>   compatible and are already declared (as optional) by the referenced
>   solomon,ssd-common.yaml, so a local override is unnecessary.
> - Drop the rotation property: it has no consumer (rotation is being removed from the driver).
> - Use dt-bindings/gpio/gpio.h flag defines in the example
>   (reset-gpios active-low, dc-gpios active-high).
>
>  .../bindings/display/solomon,ssd1351.yaml     | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd1351.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/solomon,ssd1351.yaml b/Documentation/devicetree/bindings/display/solomon,ssd1351.yaml
> new file mode 100644
> index 000000000000..39622d74a41d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/solomon,ssd1351.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/solomon,ssd1351.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Solomon SSD1351 OLED Display Controller
> +
> +maintainers:
> +  - Amit Barzilai <amit.barzilai22@gmail.com>
> +

Feel free to add me as a maintainer of this binding too since I
maintain the ssd130x driver.

It looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

