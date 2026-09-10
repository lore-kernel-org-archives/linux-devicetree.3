Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A86E3E5ED1
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 11:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789039087; cv=none; b=GNa140+7zc9fxA6tZNZeYlED5x9F5kfeak4dTqHzjOo9Mv06MZA5YPNbJraNiPW/GdKnH93OiYsM8/pVeN7pBxajY2N75U2rKbwmNhCEgy9EpIHI+XbZ7E2pnMtOtswfo6kSt6PgVBnOIcvGZEP8kuVS7qHf+APRvlOF4XfCEDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789039087; c=relaxed/simple;
	bh=fTXI9XeDkoiRYKraIpQnpSaQthAuR3nEbNOkNYs+NaM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EOZTvrm9BGq4ZhtxY37tv7DcSuD5psm0xm5r4px4LQBv7dgMWFgq1ezN3SvPL4COX7ZGg4r4m804KtMswDaSDAAYSTY0ODJae5/JUXNY15GxyKhHtnF1M/421jQ5sgoh5bpxZ1mb9PyV0aUGV8c/aMxPwRrue899LEnEpSKxLOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bCJA9psL; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fZb004ab; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bCJA9psL";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fZb004ab"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789039083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FZ/vaABJSYubFY5BrcerrZEm/i8qZMA36SfngBUQr7w=;
	b=bCJA9psLz03TTfZcYucYbkYgsKnGAnmPER7d3DXpKSijcPvVLPCMD2jluvDkqowxRegk9r
	3UK0YrddFLYktdiA/5UhssrgMRNXKIFVflL/PQI2znBXrQ0HbqBIixySXzMzPDv1R+TNMW
	XSkxY5c/GypkXCvuVm7G84G1Hg07O2Q=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-450-OSbRqPThP4u7l9f5ZbVIKQ-1; Thu, 10 Sep 2026 07:18:01 -0400
X-MC-Unique: OSbRqPThP4u7l9f5ZbVIKQ-1
X-Mimecast-MFC-AGG-ID: OSbRqPThP4u7l9f5ZbVIKQ_1789039081
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-484357599a4so4790804f8f.3
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 04:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789039081; x=1789643881; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FZ/vaABJSYubFY5BrcerrZEm/i8qZMA36SfngBUQr7w=;
        b=fZb004abuOxTVylkaOrMoSrqGBPf3lBFc0M0cufADwFBYeNAYETJ3Vh/TbzT8p66qi
         64kDXnkRaPqbZtvpI7FNiFdEip2vvF0iCN+I20scDmmjit0Jzilsa1+4FBm3A0dd2tCe
         UbiL4f2uh/4Yyk3iplek193On4d9nd+GIhMcaV8UtingtzhYBcFAzsAwhOMxG3phgmLv
         8VlUHYJ+dcPsbnu2m/cJjLNOV7J7L5KMb8NwsvDBY4s/ATeKuE7IQdo2dLiXMH73N1Rb
         Pg+Hb6JIKpjRHwJtSDgNpiLmXVtFTDbqzt4NOeNmL856IcfPDDukREMUZUFQ8IU+sz+l
         rTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789039081; x=1789643881;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FZ/vaABJSYubFY5BrcerrZEm/i8qZMA36SfngBUQr7w=;
        b=s+WkxHqih5HI0OnS6mVgOJ7FAsaOFQzqac4mZXVVI7yzLZxRZpLVchFyez7IanXsTj
         MDM7f4aVJP0H6b0YyqdLL0jggR1wBqwlAyJ9X3PcM1Sj5wJLS0eIgOkTPMBCFNR9Vw71
         zVVkso2nFgB29VOOBo+PYqGFOaWuIDITWyz6eBkQFF+MBpzK6zSyQworPer6oE9cFIhV
         NzL8mus+ICqzU9krGdZezVg/+Ic+/T1AL1bg2mHhKVer+l2mmFB8JKR/RoVhJI+0RlRI
         FSFxGibGF64g4ze/ulCN4RvXExXi4vkUWt8FF2BUGOmg22ef/pc7TNKuyHWwbY/ypEiG
         y9mA==
X-Forwarded-Encrypted: i=1; AKwUvBy+kwMcNUiBlD7CfBwRXkODYyOBZwlgRpwugnEJqUMi7ZkiuLbQpI9tUfqSYWzOXKGRJeWt9A9lKAdC@vger.kernel.org
X-Gm-Message-State: AFuF++n4y5+6htu3Zou8uqDvra+MGP7sKgqLkQu2UTO9+gBxpKdBt+Qc
	nVT7GdaxMGZM6qxy3IQ5R2Mo2/4zv6IOicoAEZN4OTPIMS6R/+25Kra72S1hfQZwGztWYDJuoEI
	XZ8xqfUrm3tYdFbb6Ix2EVH6eE5I5YNKZDG++3oGglGBUafId2gYRwQbDlOMLqXE=
X-Gm-Gg: AYBFou3meAC1BTiKmI84x31ceEyrwYA+UaogFJ6Ha+4x9s/rz2aGxcXF0nG7nJJyUCF
	dDb2tr+aT6IdRzVbl7bAgKZAXn2lDCV2ScS0aaPcpSyhJLDVJ11o+nB1yDPc8wx5Km2kn0hykUW
	iyLkpqMI+fw9/rF/rasNwPfwHS4/Z0YF51eSB7n994sfxqKd3DtzKbPdKuwYX/zHoKRev6+/sla
	sxsNnL4Et9eMX3T04kQs56LAeVxZKQ6ikevt7pYIUbY5b/IaL+XVPAcyI05gd8m+x5ks5/JAXc5
	Wu88BzIf8DFB1rMUHGQ7R2I5N/2McQs49DnH/5GoDECe+5Oq6IU00++VZExNGZi/IwEED6wHI7/
	9uoZNOgtX5RJ7JFAhf09ZLk47OC0mKKPrWS9d2cB7QynPe8snclV58SfNmw==
X-Received: by 2002:a05:6000:4911:b0:484:3310:710c with SMTP id ffacd0b85a97d-485aae0e2d0mr24817472f8f.24.1789039080673;
        Thu, 10 Sep 2026 04:18:00 -0700 (PDT)
X-Received: by 2002:a05:6000:4911:b0:484:3310:710c with SMTP id ffacd0b85a97d-485aae0e2d0mr24817200f8f.24.1789039079463;
        Thu, 10 Sep 2026 04:17:59 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bbb51sm52829680f8f.30.2026.09.10.04.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:17:58 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Amit Barzilai <amit.barzilai22@gmail.com>, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: andriy.shevchenko@intel.com, holofermes@gmail.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Amit Barzilai <amit.barzilai22@gmail.com>
Subject: Re: [PATCH v5 4/6] drm/ssd130x: Replace positional ssd130x_spi_id[]
 initialization with C99
In-Reply-To: <20260823111959.17029-5-amit.barzilai22@gmail.com>
References: <20260823111959.17029-1-amit.barzilai22@gmail.com>
 <20260823111959.17029-5-amit.barzilai22@gmail.com>
Date: Thu, 10 Sep 2026 13:17:58 +0200
Message-ID: <87zexpl5i1.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Amit Barzilai <amit.barzilai22@gmail.com> writes:

> ssd130x_spi_id[] is initialized with positional initializers, which
> easily create easy-to-miss bugs when changing the members of the target
> struct (struct spi_device_id in this example).
>
> Change this to C99 initializers to guarantee each member is initialized
> with the correct value.
>
> Signed-off-by: Amit Barzilai <amit.barzilai22@gmail.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

