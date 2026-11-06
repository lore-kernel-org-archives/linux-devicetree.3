Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793984081;
	b=H0D06VCtNXHOM2sTPlpfROYhtUpf1xKA74r1SpNYsqdp5PZshSeAQ5KoNcHsvgUKynIo
	 sn1CqActQNkPPkDtyo0Ar7Y6w5MXEK7/hczmj7o8J+npFstv5HFVLhxJ6PB/paIgqL6Uo
	 HCgNbCEvZVFsT524DTYMApunZOGfgj5UGqeaQ/KmRxdh69h8VLG7vrUf+fcIKYQi//1st
	 oRoal+d94H66UzZ/vKCQXrI8jHIOhr71PrQ4TCQzmOXe/2oyv4TONBAovKEW4IRhoYx+U
	 8xcVhUtHQ49HeHvGvLw7ptG2Nz5kyEnRhR99H4A+UEH4B5TvPFmn6LokkM5CS5Kk5jg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793984081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=6i4oUXdP885wW7dG5qidGLk2DhrD6UR6ZQWDrphycws=;
	b=GFn6JyvuHMfJ+Gwm7X8YsoDewsI46uUcC7Wmso4M3aZ0nOK34zY9y6ZFCdpy+F8hAAOQ
	 DiJMG73KETGV7+xnV0QMhpP1421w/VDyZeIzcubRa7Nw+Ew3dqKhDtDowkLaHyLa3enz8
	 QmTmuusyq1XsnGpYSfffFR1OWPgU+Z5L7IEgFa9aTGOQKF7RtrdtYJukydU3QjmYK96Sm
	 E03hlA5owDqDIrX7g6B48ElLkGu1w7XfTiygGLExZjk0J1PCOntZnhwI+FX5aS0a5nE3N
	 OVPjznSetTQv9dUW09epwbmZE6p/KE4z1k3eBpUAi/rKOG5R8kspfRjf8P05HnymZOQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SmHlFGNm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBE1606A330
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 16:54:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FBE1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SmHlFGNm
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so8030225e9.3
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 08:54:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793984080; cv=none;
        d=google.com; s=arc-20260327;
        b=dKX50f0tajfMcsUb8dUjxvxj24yYMNtkxg3OMN9SmnZn90GXsasbiq/mjwuv6W4M9x
         skOYutoT1sedfj2SJd4F3FOgaB9l7UU5MGZoWYAHRPElwfq5YT5CVZanB26UyPRakX2T
         wklezgNjyHL2ZA+PB+ucDujasSUgL5XBVmKYW3XXt3GQTTrtJsmzCMruojU2tl3F/w2Y
         /ubZoX/dnon/+cKQz1hRkNUpmO+erHIPB131k3m3XoWWcnYQ0y4cgCQLWQQy88o3nJzI
         MbAxFKZtGWLQAy9d7wsqjg/ZXD8YclWbAl41I7OmB28Wn0mGEzWC6/6BOx8npFfcj6x5
         i7Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6i4oUXdP885wW7dG5qidGLk2DhrD6UR6ZQWDrphycws=;
        fh=JTl/wHQI2lhMD1qlPG1mZ2ArMX625p1YeEHR2pEz9T4=;
        b=g8lDyPjSgrvy2hMt3Q97CHNnVZjeZhbXU/4Q+QGCENYiwsezOAb5iNFyASKMAOSJW3
         OTJMvvkrTZChc8Bzq2Pp6DQR8jNjrcrM0D3Ozsc/Mbsc3f2JUf7ELU6qq5PPDOFpVtDg
         4klLAP6Lr7iMlsi6FjDtCl4H/bb9DvPj3g7mGwUZgHUAExp48t9HDbJbL+LjIVL/7aAk
         4p+hUbOM9qU6uvyqYYSadfuUXBBqP/uHnyvK/tet/r7bIRoKoJ8oZR54GHSeXyqNBcCT
         2nYKSlMNkeVL//3XNjcI/lWf9EOgyCH0Ic+F5toG1deCchl5xXyRPHlFPwjd6ep/cwsD
         wZDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793984080; x=1794588880; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6i4oUXdP885wW7dG5qidGLk2DhrD6UR6ZQWDrphycws=;
        b=SmHlFGNmIjwnF2DR6HyMJZLS9Z0G4KCuS9VIwzgtntwh7SHVYAa+aqmdgqQM58kmzU
         U818gJGJXeEpPlLRbtB5p1E/s3HFYuv03oRspD1QMAEN8ewS0/FFrny6z5U4ajmdEc4U
         ZPXH1FKEhomQbYsIQQ0CnfpJtcQiO+OSn3QZ+ItFPl+ChWgbC0bajWNWVJs8c2/0idaM
         1nFml4+5UEmW0s42p68V40UgsuXOvyokl20xeCfrwrVgYWYTk0+r9sAQmYN2g0Tda1T8
         sLzAzGvF7qDcmwU7dWt2qdZcaINHneZIzv23xaS00rwhp9i6zEMAjUwG2YYoFA6pxrqS
         ntmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793984080; x=1794588880;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6i4oUXdP885wW7dG5qidGLk2DhrD6UR6ZQWDrphycws=;
        b=QVK1A/+UP2bVtnAwZY3+b5s+xx9ckRwznRMQxCTuxqRO4Kwh2dMdZRrGIHjVwODc95
         sKECQZ+WjlK5s/YFzxb4xPniW9TPaNIdmy9yQT5tf0wrhFonO49NfTWKPfcuEEIB006i
         HdfZ6/GJAyyo9okks8EXccWCzWWh/6KbJdyrPEQ37OtIQ2LqzhBahPijkMcBvI+WomIs
         cd8Gi259Hm+MKMeM3XfBXqxjJtg1ExR01wDEKQUx6gGEQ3lNj0+0QJd5fcvMos0DNogq
         DEK1R9uwwBgDWDV94KtrkGeECXG1gmP9GtZPizXo4q/Yh0D2sYchu/CXJmYtI8Cs3S5V
         Ps1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwsWZ8pcEkjuBvgL0Qk3+ty1vjJpXl5deRGILia/n2xkEESxbvG6n7ZQwz2dRPOBuX7a4kDdoNh6y4c@vger.kernel.org
X-Gm-Message-State: APuU4Z8GNVBMoTo3DQ9JCFCp5JsONYlQRo4JHrq8ZpbhEyeLCnj+SRow
	gePs3tP/19Np5An57K7pUqYUGqhTahoVZox+vDkr0jA9e9R06d0CZ0J6BY6zYSagPFo1zZ90LZ+
	2hTZhnM9mm+HVl6kA43Fb8OhOSal9XA4=
X-Gm-Gg: AYBFou1dvbXLQ+UDGz2TuCAcpf8EhzsTakFlX1xGJ1rNwasG41EMLUMZTq7/99FhjtW
	EJq+WZUGmpv2UJIOOi0ixdk4xy9+BhEcD97Z8itrgE8X+QHfB5Wmc6egvmZaMaP6rqs4sa3CbDn
	wytTM7umLK38Bbkk21CwOYO7lL+kmKZpALHriAaBgPSSWFdu7uw/IX3GU9Z3KyjNqJcTggs+n3n
	XgtEU17Jvf7rSVq3KSVW4A4HDBuzH6Y+rXA3Rjnpvps4yPzb7u8ZOsGGmDWC/huGdoMsZte47Lp
	UXP1pk8fSOo9d7RRcNl59qb8a903wzuo7WxTYKDxZFYJba6hj+VbPOUymhLDsuqsFfYnsTZMbyj
	L8DUZ5C/IDHTxE+cYOtpPfTVOEr60y+ehh7zB5Xt6pRrwS59V+7ghub00MmzyZCJwkY9qlqtYci
	d/RY97LNgTDWugjgU=
X-Received: by 2002:a05:600c:19d4:b0:4b4:49d7:bc25 with SMTP id
 5b1f17b1804b1-4b6dfd97b92mr54279315e9.21.1793984079658; Fri, 06 Nov 2026
 08:54:39 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-tle493d-v1-0-3246e91e6394@gmail.com> <20261105-tle493d-v1-2-3246e91e6394@gmail.com>
 <20261106030419.23ca9b26@jic23-hlaptop> <CAFkCdFyi0GD9aWMUZfx=QrZMg1ezjUDCdRr+LTsD0JMMT1DeiA@mail.gmail.com>
In-Reply-To: <CAFkCdFyi0GD9aWMUZfx=QrZMg1ezjUDCdRr+LTsD0JMMT1DeiA@mail.gmail.com>
From: Viral Patel <viral8854@gmail.com>
Date: Fri, 6 Nov 2026 22:24:28 +0530
X-Gm-Features: AclHuK-KYnr_aQ0yTXhRBn11b3ztP800Zk1SFF5R7aNF7AVjePHX5gpKZEe8GRQ
Message-ID: <CAFkCdFztjTpXnm00C-TQuW0_GC0Mbm91gAa-JF-fuincgfAZVw@mail.gmail.com>
Subject: Re: [PATCH 2/2] iio: magnetometer: add Infineon TLE493D-W2B6 driver
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Nov 2026 22:14:42 +0530, Viral Patel viral8854@gmail.com wrote:

> The Pi 5 controller doesn't support Quick, so
> the reset was not exercised in my testing.

Correction: that's true of the mainline DesignWare driver, but the
Raspberry Pi kernel I tested on advertises I2C_FUNC_SMBUS_QUICK and
sends zero-length messages as Quick commands, so the reset sequence
was sent and worked in my testing.

Thanks,
Viral
