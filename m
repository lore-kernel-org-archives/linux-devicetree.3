Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CD53CD8B8
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 08:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784190979; cv=none; b=npZ+CaE4TL595eVpaL4boUNwU2KWIKIaduRiM6mcHJtgN+PTm1er8fIfDG/X07bafMBqBOx7UFsD7FSmszuloKFAn8p0UGM3SM8qV56PGLm/sAKajI0aYnt9Ed94S8kaov+BrblMOxe1GI9hREVa1tVv1AuyjfNhueFh6COCVOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784190979; c=relaxed/simple;
	bh=ch3LPtiZCeu+wPU6AMixE/UK5SQXTPRQNCWYOMdh4bw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RicQBjLTx7vWhK8oqs6u8Le/ne71shw3ecl8Q3XqFgyRTUTXHRRR6M2Ebsg+5UfSuBLsnK6Fqcfi2GDhg3ZaorEnalLmpZCCautjO0pJuBE1dk9aJy1Nemvp0VjQTspieUiRpEu/hHHjGE1FH96InHEivTwVILim9ihkLP62IXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=It7rDxig; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=A1ajA+pR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="It7rDxig";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="A1ajA+pR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784190976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hbd5Ry9waQgWss8Lt6g6SRQhPC0Z+JOhqwK0zr2OMhM=;
	b=It7rDxigKfxidRjGcFVfhwR4n+o90OyGKMXMYpQj6bLlYrzSl48pAGKp7xZQVCr+d18Bak
	cLiSPuN5JTLEF17NCm4O+a/NUFiT4t5AIPOuHXIrTtEWuKwhDqYy6O6EPK5DK6Fd0hUFnR
	T5e72Jr1mdSMlJUttYY0wK1sqY3N9gY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-0Jqm_YC0OO-FtDroM0-xTg-1; Thu, 16 Jul 2026 04:36:15 -0400
X-MC-Unique: 0Jqm_YC0OO-FtDroM0-xTg-1
X-Mimecast-MFC-AGG-ID: 0Jqm_YC0OO-FtDroM0-xTg_1784190974
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-495427ed72eso5905525e9.2
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 01:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784190974; x=1784795774; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hbd5Ry9waQgWss8Lt6g6SRQhPC0Z+JOhqwK0zr2OMhM=;
        b=A1ajA+pRC8PfMj7a/nutrvch+7QCHJWcWScu6uNQnEVeIvRLtEI9NAfXicQQpvLt5M
         W1NCJ1kwJB5VAVz1rM5L/gT5qX7Gr5TspX9iKGTRBa1u2wDsUusn48r0rz/1QMrZ4pR/
         EHOmf0KRqAc17PyHppzVyxUd034AMUGuPRCWTKuPZZTt5ncMemJSQmzlinMQJgLv633r
         zrqgDoP3pMTgk6QUjCyh1Z5SwiUNj2PWLW/v5ProL/YpbjfYP8V5sEkWjHvJG1llIbls
         e/pJ1iuK0eOhzQS/nIlV8eYayDgCVhuAu5fturwF1ScZAXiRVuilQ3xTWFZ5uMPupvY+
         hv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784190974; x=1784795774;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hbd5Ry9waQgWss8Lt6g6SRQhPC0Z+JOhqwK0zr2OMhM=;
        b=AX0IWV3pKwdtY2hjLjxGFzHal1eiBHZ9ndKhuzTKcF7aEJVowmexujTexujRPUVcdk
         Y7l3Ox1EcWG9tEzIWt/43ezW6Xkux3RLMpR00Qh44TTEqwbnJKmV7NwrpXuIKt+kXcFS
         QTAlieYhuyEoNTBhCLnppNj6yak96zULk+KezPS6cO0A/mSRfDNqeOxpDiIcd+/D73KB
         ie9oRd4vb3asBiV4LICtrAH8xH1cGyrT/OB4/fwHw7MZcTZw4oY7UNZJ/GqhOQYzWgBr
         XEgJKk94lFpacLL0tf4DchF8iEEfTUMielTiDdN6dkcmpGibi9T1txZ2/usACROsbFvj
         EEOg==
X-Forwarded-Encrypted: i=1; AHgh+RohH8cl04ngXW8Uw3zXnDeI1+98LzxPa5BmR6k9oLN5N/ASKvIQwsXC/k4FzEGbngnONpU5kf/oMPuJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwCvlp4dsfFhrIYR0ezXkN+782+65bpveUjG2WZOQRKe2VlzxvF
	fJK+hskGIRPQ6ZieqlQZGXgLapLYBT3fYC16twIPk13yCMcnBywD66ZY/xH1l+V+EQg636kU6jg
	Bqr6bPbz6K2BU7LG8ieTUQkKPoDM/kNEzXil8SBjoJmpaPDHWzdK6xR90vz5dmpw=
X-Gm-Gg: AfdE7cmS+JfJHOzySGinoS4ZubGW7evmSGmdcvccj/h4a5eZhDqruBwDTC1SwJXHiJH
	Fqz5Qz6Bw67xYzIAhx/+Pyy4thHhKtr4iRSOz56LajusZyxcvfrFumSciZh5BGAX34b3eEy/JFA
	t257IEJ2BP275nCqs+2RTcBe4uKtMl2kOGeP49lSp90nn42t+LcoKwQ3PigT9v1wYGQlvw0+b00
	RcQYsosVUQQ+E9by1l21PQsH1bpTlZTugwd0uRloVVste+qv3YNyeWrVfIMBd8LHSRZwBxyb0kF
	arca2BKLeBzYaEtM+MtB3KsBVOaqamOkMRJ0r8oJ/UzFcRR+2+OADz1pverUn0OQQ+L0W53g0zw
	YF4MEqDsX3Xvi54oRYZTturAlGkD91C2/WMhezGk+nwI363mHF1i1xKufem4=
X-Received: by 2002:a05:600c:3491:b0:495:3f64:2659 with SMTP id 5b1f17b1804b1-4953f642be1mr50481695e9.33.1784190974000;
        Thu, 16 Jul 2026 01:36:14 -0700 (PDT)
X-Received: by 2002:a05:600c:3491:b0:495:3f64:2659 with SMTP id 5b1f17b1804b1-4953f642be1mr50481025e9.33.1784190973486;
        Thu, 16 Jul 2026 01:36:13 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541e51f47sm38836845e9.0.2026.07.16.01.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 01:36:12 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Amit Barzilai <amit.barzilai22@gmail.com>, Andy Shevchenko
 <andriy.shevchenko@intel.com>, dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Amit Barzilai <amit.barzilai22@gmail.com>
Subject: Re: [PATCH v3 2/3] drm/ssd130x: Change SSD133X color format to
 RGB565 from RGB332
In-Reply-To: <20260704080925.75113-3-amit.barzilai22@gmail.com>
References: <20260704080925.75113-1-amit.barzilai22@gmail.com>
 <20260704080925.75113-3-amit.barzilai22@gmail.com>
Date: Thu, 16 Jul 2026 10:36:11 +0200
Message-ID: <87mrvrbabo.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Amit Barzilai <amit.barzilai22@gmail.com> writes:

Hello Amit,

> SSD133X screens were driven at 8bpp RGB332 despite supporting 16bpp RGB565.
> Switch the SSD133X data path to RGB565.
>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Amit Barzilai <amit.barzilai22@gmail.com>
> ---

Patch looks good to me now. Thanks for the respin.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Could you please rebase on top of latest drm-misc-next, now that your
column/row fixes landed? Then I should be able to apply this patchset.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

