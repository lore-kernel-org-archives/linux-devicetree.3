Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F59D3AC0D0
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 08:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774339326; cv=none; b=EEb5BnHduEkrOqOhYTWGZio3gGxoMzWJYQAksAytJ7UuEy/REbV8smtElPHUIZ1GlCAOsaz6tQhPesKDdzYs7bcK+/UVzD5z3bxnma/yMDmmoNCndEw3K1muz9k/VMbj6BnnuPfvomJtUVB+MdIhh35lcKV0czk1lp/mChnu6pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774339326; c=relaxed/simple;
	bh=5SKLbVjvo+BklmZUI0W4Z4Dgtp9azMKMYYOdJ4abq+8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ax6rsZNTLVfoccesjNH5Grv+jeN2sVW+QDqpoqKOevSx4fJzf0/fKNuJ/NL//j7EmYYxg4lwLaaqpO1SXtQ+YHqhm0sqWnizymbDYP4VaJD6YXHl1cZNBPxehNxj2vusuSmisz56NvotpJDCERuexcYYHEymWxkpqnt7QRSP8KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XaS7RrN2; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KTzzS9II; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XaS7RrN2";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KTzzS9II"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774339316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Bgd+vofP82cnhY2HCjU8+4Ds20YvfUWfxFen0NOxHQs=;
	b=XaS7RrN2OuhEUn+7HuIBHCuNtBbdJTrGnr1sNoNVXI5SMCzOen7R0BR6oaDRS+HbvN4GqT
	V4n7MZoiMdvqDNVpPIQX8FiwOHAuoBG2eObJtWylDtNR/d9hnPBnO30Ij+XzVbkULV2KUS
	2LmgcOSwnWhc9RSrL/DYQpfLCATRkyU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-uhGZUMRYP0Kv3_cThR_B9A-1; Tue, 24 Mar 2026 04:01:54 -0400
X-MC-Unique: uhGZUMRYP0Kv3_cThR_B9A-1
X-Mimecast-MFC-AGG-ID: uhGZUMRYP0Kv3_cThR_B9A_1774339313
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-48535f4d5e1so11058785e9.0
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 01:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774339313; x=1774944113; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bgd+vofP82cnhY2HCjU8+4Ds20YvfUWfxFen0NOxHQs=;
        b=KTzzS9II4xKcAZK++i+1szfYcextYXnKANCYrkDr51tdh96Qw3hh547neLZeoiivqV
         wYABCXC/JXeXHDzwJOJQzJFmyPrDRqmYlSsPOMujxFU8ioFCM1YX/47mpnnZtx3TEhYi
         FJEfO3xLLm9a7e8vdGFmQCbqSLuNQFeiO0nskTQVyVZJRtH+p8NRLXKmGBr5WU8jreMY
         9/cc0eoIwT3HZeAEsT72wLCpXB3uWb98XzkjsJI9LoV2z9s4Gj7OVdKZSM2Om18yFhEY
         9KGXj9+0VHQk9N/VHwS86c5BFVy7xu/zJ3D6y7y/Q0RbBnJIHVrgaQCgoJEy3VC2yvqr
         LwcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774339313; x=1774944113;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bgd+vofP82cnhY2HCjU8+4Ds20YvfUWfxFen0NOxHQs=;
        b=QMspdh9pnd0Xkms6RJIbyUMd+ZbswSWr8MyyM24sbrSc5Pu9Jm6C+IdzZj48ARhenZ
         4eZ33lxSR1+R+fj0ln3CDNLIVmM2Dk3+8a2HrQnXrT1XczJKUm7nCdNiifJWJyQNKNsh
         XJRNPt9gQXWCP7Ob08tBr3zxFKWJsgL6pvnx8cQYoZsw0I2TwL/w3sdCyA40BIjf7WrS
         ggsI9m6VNIqE7fQhlJ+2nT1//C1VAM0b/tqoBGeyYivo8bKouKwObm8fuvpfWxV9O7C8
         doeetsjatFteF0FdMBgSmv4Opv5VcRH1qEUqtSm4s5QSk5FjVo8SfM7Y5rFAGREKZODw
         zBJw==
X-Forwarded-Encrypted: i=1; AJvYcCW5Kq5x0ybTXPJcwxxb5+wrGuZcKt/E+wdVCygooiKvaF8/7z+9gvvmuE5cc8KaGJkeulCjL2arZ1KM@vger.kernel.org
X-Gm-Message-State: AOJu0YxA0u7Cn1eGGM9dPya33ByEtbLfYAjOeHkC4+4/LePpt0BOFrxy
	g0cRgkg4x4hUnAAfsrwPoa8ajYRq0bFZoc1//B3TLPlnbz1ToYlSZSoZl/IPVOpZAzJWAirOW04
	s4ejPaPW136JVgZKPr4EYdfP5EPd3IKq7awr6q0lFWaRJhsod0cwMsNQ7tsSgnWk=
X-Gm-Gg: ATEYQzyYGX7DqIpLwjudyfFRbzNURxKyYX69EieDdolo7x4XH5ZBn4bvfxjcoVIM7V/
	NTH7nj2BW9O17s2UAzce51ZZj36oHk5yT9XkwWbn4J/rWdsP8aj39J0BM8D3U+Q4pT5WTG9TRQQ
	Lh8ZZZHwMzOH5dHx3MObddMcNz8nPcFI6TZ+jpVSInfxfevQiqRa1UC/DWbu3lraJHSiMeat+lk
	XIZtEYCV3vK8oirpI9FVC5Yg6DCSPMH9EKKvECMht0lI3iDwndHAMLnLbl4MmFAGKUykq16kmm3
	wDTyrFz7hM+PBfb6RnxqVbK331/EJ8IVks0VoQvXj4oPpQ7bKRiZQDJe2RICDkNZ9PTO/rj64Hk
	12gtSwEKk69SYzp9C2WfyT20pv1DwtgppAVJC9TSwEcI5TI3CUYFWO1sJeMBTpA1VFLQyu3nszN
	+ZSaPy
X-Received: by 2002:a05:600c:3554:b0:485:3ee1:eba5 with SMTP id 5b1f17b1804b1-486ff01cc5bmr216112545e9.27.1774339313298;
        Tue, 24 Mar 2026 01:01:53 -0700 (PDT)
X-Received: by 2002:a05:600c:3554:b0:485:3ee1:eba5 with SMTP id 5b1f17b1804b1-486ff01cc5bmr216111995e9.27.1774339312748;
        Tue, 24 Mar 2026 01:01:52 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116f173csm38812215e9.2.2026.03.24.01.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 01:01:52 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>, "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open
 list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, "open
 list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 5/6] riscv: dts: spacemit: enable USB 3 ports on Milk-V
 Jupiter
In-Reply-To: <20260322203356.2206927-6-aurelien@aurel32.net>
References: <20260322203356.2206927-1-aurelien@aurel32.net>
 <20260322203356.2206927-6-aurelien@aurel32.net>
Date: Tue, 24 Mar 2026 09:01:51 +0100
Message-ID: <875x6l8xlc.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Aurelien Jarno <aurelien@aurel32.net> writes:

> Enable the DWC3 USB 3.0 controller (USB#2 port in the K1 datasheet) and
> its associated combo_phy (USB 3 PHY) and usbphy2 (USB 2 PHY) on the
> Milk-V Jupiter board.
>
> The board uses a VLI VL817 hub, providing four ports. Two are routed to
> the 3.0 type-A connectors, and two to the F_USB3 front USB header. The
> hub requires two separate 5V power supplies: one for the hub itself and
> one for the USB connectors. Add an always-on regulator sourcing 5V from
> the DC-IN input, along with two GPIO-controlled fixed regulators to
> manage the hub and connectors power supplies.
>
> Note that the board also provides four USB 2.0 ports (two via type-A
> connectors and two via the F_USB2 front USB header), but these are
> handled by a different controller (USB#1 port in the K1 datasheet).
>
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

