Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792536624;
	b=fsVjbqrHD+tcQmoaFUCia/pELRn7SUpLzSgTHQ6wXWeKTBFntFsD/XFiYHPMjzr/8vvZ
	 1Cr1gZDrb9z84/VVyporbb1vCWehlRRa8+tDDMmkZu6KdRbZT2S1qWzd98FzdBpMX9QVt
	 MMwD7GELmpHjJec+/30Pj4s4RaaGa0JUlp0Pj7WDJ3l02ROmfshzaTBLSwx7mKDfSMZYo
	 rfKT45pGQeje1i60KwPBcMNnKHYIH2ky6KQFbqXOUI/u3oz7segJQtei3wQirqc/U6Mxi
	 LE9jnB+owLEffdOkG0hQGJYsn56vyJtFVKPhsWO83+nzLsd2V9UqhE+8k4XeIh/UinA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792536624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=4zL0S6kvmtkQoYmoWRmufP9rJujsnjUqprK46hj2fn0=;
	b=Ldde6dfUg+GM6CQw5cq5tvHPsQr2iFnIIGeVf7GjUoAroUaxCmMlf9mRR9RzJ+ctfEV/
	 DZS64wCU4fDzdQJryqyj8Mj1DeYucxNhdcSQ3zxY8HkJFTbKI06WBSxsZVZzNGuCSdeC3
	 AFCh8gCuZAyne73Zy9ZJkOaohXY3cSpK84i2yKDQlpZPkL9vrnD3Uhu6oZB0y7yqqXfyJ
	 blWxML46fGdSpXWZbuqnxT2+NDCEFVdu90dXNmgNkWlHqoowepUMqNqnn7xCei0MX+zpe
	 O3gRnX+HK+zOtly6rOPhN70DiACcM3PCE9cUt78vxW5cKreDknX615lRcCFQmR+C9vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y9FIbqDR;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD56606A325
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 22:50:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CD56606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y9FIbqDR
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so1346975e9.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 15:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792536618; x=1793141418; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4zL0S6kvmtkQoYmoWRmufP9rJujsnjUqprK46hj2fn0=;
        b=Y9FIbqDRFsiHCh6wCMx/lGXYMzbEMpcYPExHRKo8kxmfRwSdsbHKcVN6b2o3fsfWmS
         EMfNStvVEXtwQlwGFhTspCN6Iy8LsIslmTQJZArs9croRUFFsg9a0R2Wmowm78fCGk+p
         qoMRAjWrlWyjvmo/cv+QOkjio/QCUym29eIrZxNWbZgTO868C5tZQiYnBcrDy/y+qYxV
         AxXCy+jIbfVSYNWbB6SaV+1+cus75rqPWlO2twcCFTqCAqrzmVEb5SQPuQ0TN5KrYxQd
         MNdNYIr9ltemS55NjRHUaTPPPJnI8hAvgtgmCV7T01bNB3UVCcpT2l7+0a9cI5hk20GK
         EuaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792536618; x=1793141418;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4zL0S6kvmtkQoYmoWRmufP9rJujsnjUqprK46hj2fn0=;
        b=aGeVcopfhp4wXza9gkUY6DUL+335oBvuQ0x6BRMF1IKVKzZYV7ihXTFQH85Ki60d0a
         7B801E7MGvHlfLf8Qz3nb7xAPxIdhOfOBCtZK3m6bRdvZv8g0Z07U8HQGspKOlhlibQR
         HXNwWYfieCGSqaKSkbw9Th8JaMAFNPOndtKxj8mmgkniAcH920dBwSDn5CQaZWcaNAKj
         kcjOPD1kVFJKl60T5MkXtlR/Yvx7HUeHKycqjZA4fNtqBoVjShbPT5bRQljJY0d7MsYu
         gh03qVNr076tiE9KaFI1cf6sH+GNAU2A67gSlfldOYS8rw0tv10xs+0zBnO40x8JqMkp
         jDyw==
X-Forwarded-Encrypted: i=1; AKwUvBzlfYE3QrONbVcSJvjuFGGDYvyUxVxpJSzP9WiPKZrMG82fqCWl660DJn8+H3HSQSsP3L8DUceWaVFZ@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6i30OtHoPwWjkh6x0FVCYYu1eSIwYvo3ZbYlBZca7/EyJJaWZ
	OnwDcUJMVcSjylEODPb9AGulXhjU/entxrA8hEzUlURQP6nykcoy9CJ4
X-Gm-Gg: AYBFou0XiSScdk/lDtDcSQOqoMxhKz7PL2MshYO/zqEeJfe19HoF6sVM13/TS6UJCUj
	3eY6Vip/oCgAVRJqM1oXcFuEiNOTFU6BMlcq008aLEmTMFCJR712fo07KHdSYXKbiBoI0KqKyjX
	+dYx1MOV0qeuVSwex3X8u0YN1gySWNdB+ly3O12IjIHGz+/ZdihI7KOsjK/76tHth/YPBV6piZu
	NV5SpPfW4aKp5d+P9cXa12wCSdPzS/kpb/qYnwN3l7+vCku05NIaBcy3wBu5J2YvEuBLnDAhrjY
	FGtG6PyoEn/FvAZzgU0pbJch2nIRAdvJ8mQWOWB8l5RCzeTOgmrw3yHWIcYvNoY6a+WQiK/ajIT
	tei5jjq/zeuDJbZttkNBW/3daRalcxGFR17kM5mCMVO5UThFkWa9Sf5xNKQX/9cl1unyDABkURD
	tGKColCOHkM4crbezuQG1x7Vki1vFdIo+HPtQgotK3jNozS8M8KuYxfKHbGF8K4+UkXxypnLxvM
	43BruAa5r7/UyRUGVheHtAC
X-Received: by 2002:a05:600c:b8d:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4a1fdb165d8mr2576335e9.5.1792536618009;
        Tue, 20 Oct 2026 15:50:18 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc0b42bdsm17511805e9.0.2026.10.20.15.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:50:17 -0700 (PDT)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Francesco Valla <francesco@valla.it>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 09/13] drm/client: splash: turn the device tree image as it asks
Date: Wed, 21 Oct 2026 02:50:04 +0200
Message-Id: <20261021005006.2341200-5-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <350adc03-dd7f-4120-ac9c-b6d04ff44faf@suse.de>
References: <20261013093243.505776-1-maximpedraza@gmail.com> <20261013093243.505776-10-maximpedraza@gmail.com> <350adc03-dd7f-4120-ac9c-b6d04ff44faf@suse.de>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Thomas,

Am 20.10.26 um 13:16 schrieb Thomas Zimmermann:
> Reading the code below, may I suggest to do this in two steps: first
> read the image data into a temporary buffer, invert height and rotate as
> needed.  Second, copy the temporary image into the graphics buffer and
> adjust the color format.
>
> Eventually we want to have a useful and flexible drawing/blitting API
> for the DRM clients. Keeping drawing steps separate will help a lot in
> the long run.

Makes sense. v6 will do it that way: the first step turns and flips
the BMP into an XRGB8888 buffer, and the second converts that into the
framebuffer's format. The buffer is as large as the image in
XRGB8888, up to 8 MB for a full screen 1080p splash, and it goes once
the image is drawn. If there is a helper you would like the second
step to go through, or a shape you have in mind for the API, I am happy
to follow it.

Best regards,
Màxim
