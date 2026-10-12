Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7970244163B
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789888; cv=none; b=XOppLxWDebES/WkcSw2DZc7pCzPUcW+C8ayoRW1fnvHwwPQVWGYJ5KJcFtMqnHteu8dHbLZu1XlTnU86RnoLHu7ZwfqEb1nWQuz9cx/TV76DWdiy6Zb3/adDfL+1vlQd3RwfrZ3oKJfr9WDWcKoHnEib8qEn7+1dXQbh3n83Qkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789888; c=relaxed/simple;
	bh=jV17N1XnG5N3su2j27UvWD50Emp1boXs8D7A8+3TlcU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NDLIBk6LOu4c8XEG0mphIW/zfaOTwd65R6E3rUPOV10rdzl7Ge56Ccb/eM3rSFB1fqWJqwJHTN1FtaFmmxudhblzxU1UjZ07SZOCT34K9t5GtlIL64cY4Q2YaxI2EPEpBdP9LH2wlYOd/pLJ+QhI11CpL2wp3tt8oVCOIHxRTtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=de2lYInm; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="de2lYInm"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c45111bebso805224f8f.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 00:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791789886; x=1792394686; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CV4XRNqthVu3jHiDgMNv0zc2zrlUjFwHtxZxyGCKLaE=;
        b=de2lYInmXLjrAgQWTM2tuSxy18BhEZYiJmZQYuHlxVsriTY2f+l0E5S3dDakUFxK+g
         vMfFzd1wZ78JMnHTXjv29O8+7EGD/Sprhy/X+n6kLq+D3adBmJAjan/lx9FUgPgy6msq
         XROyye6iEomYtJ6wlfbtT5MRKdjdiuSkuxGSJWy/Vxh9VZaAK+7sWwoSnenYb76GorkK
         GrLu+IAzaR30mWYMSlJULjk8oPVBA4ntWFZQ6AxNN21w7bNC36R7vdbu8xBQLsEzwksK
         erKKDLaTGcZS+FVA7vk1lEYdPAuttewf5y4cTAyUbZCClGE34AHbJwEbfsGPWSkKnoxv
         37vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789886; x=1792394686;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CV4XRNqthVu3jHiDgMNv0zc2zrlUjFwHtxZxyGCKLaE=;
        b=Ad1+ZFJ4jzOj211lmJrVY7W0RCIvMi/nhTpFSO/CXgLr7DtsZam+FEj58Q7w4jwiTS
         79yIXUTFOeUJDMwWe3KlTdeRntOjH4JkMdSd2kZG1jz3/urCEg6u5UzdvcC2nm5OsExE
         TGneNOoGBCBl4hBM0du6UY+R/ELwVGZA9+EmfAqaER6nidKNrrXFSZxVMCO1gL09G6DD
         w6bEp8pY+CztuL5uyLqwEsCzIeLJ5P9ffEBe9y1C7CEQk9G8/0hbK5MsEWpFGWpcN2uI
         wbX1TN6SmJKNL/pzk1EbU09Sa3f79YTIAEb6ZA5sFA3+bqkv84F0AML3X3r7JaSSeeVV
         yT+w==
X-Forwarded-Encrypted: i=1; AKwUvByafY5uyNukwqthV7QH2zT0//oD4lG5LUuqLVRZblgsqq/W7d7VQ5pQsy1pf6nkLf1KxtwEc3I6iLw+@vger.kernel.org
X-Gm-Message-State: AFq9FYIJvVZs8vbIOBCtSSc5wh/lOhtSzYlt+NqIE6mmI6P0vF2kKmgv
	O+1uPvR39MexhjF4jMmtmgbH2oE5uedsdEA7pKnXAcXV6dMN9+7mo4aN
X-Gm-Gg: AYBFou2lcGWK0nGbj3bZ5+OYs1gWm4dGjSJhmCFbiq1j4pQj/mRd90UEvGAav0R/YUy
	fnwLFmAdWkQ8rbv1bdsrjDBk0R8HDQmpyOzETcrEd2EPpmXemR6s69uLg4E5VKZeND+NKkSk0ZQ
	3Jww0s1wTQqCqihZ8faAUl2Lnpr0ocffP9Gbdq1qiLncUJOjqTbt+4d8LQ1N+m5yV33piVmszfv
	3fGG7bD9B1UXWiV3HMWWWcH8eN68gL4nweLHr9ezHlIYiiScXYFugm5rX6QgMO8FbQa44kKy2eR
	+ZZMW88dHglC0W+TImiEDJUrNhcw41S6ADtaaFNM2NossOUDQy68sWMu3+ZQuH1mG/ecFn2zDv7
	/1ZPaWOEo5Zbd/Q/FCgfcL7ce3LX6JSgxYvs6tfpPh0w27s3WliAMRG+en/N60T1ehvYoqklQFB
	DQWWzjs1Py4lpF62ja0GACupfaWjrXf2iyic24at2MzNgCregMH+ItF3P2SndqG4Uzhsfkl9iXx
	GePbPh3Z337bYpV6ZrdBoYjuAOrhJMAbRDGW8jXq2v3RWvOZLBSxTRczpQ15xjaKtE=
X-Received: by 2002:a05:600c:4ecc:b0:49c:fa21:e749 with SMTP id 5b1f17b1804b1-4a18e4d55f2mr191008715e9.31.1791789885437;
        Mon, 12 Oct 2026 00:24:45 -0700 (PDT)
Received: from [127.0.1.1] (ip-024-215.users.dtel.ru. [91.210.24.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e48db03sm380276065e9.3.2026.10.12.00.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:24:44 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, linux-serial@vger.kernel.org,
 robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH RFC v3 07/10] tty: serial: Add Cortina UART driver
In-Reply-To: <b48bdddf-2218-4164-8a76-e9cfa2802111@kernel.org>
References: <20261012-b4-cs75xx-v3-0-0e0d17a098cf@gmail.com>
 <20261012-b4-cs75xx-v3-7-0e0d17a098cf@gmail.com>
 <sashiko-outbox-167778@kernel.org>
 <b48bdddf-2218-4164-8a76-e9cfa2802111@kernel.org>
Date: Mon, 12 Oct 2026 10:24:34 +0300
Message-ID: <179178987463.76422.8459872081179927553@gmail.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

On 12. 10. 26, 9:13, Jiri Slaby wrote:
> On 12. 10. 26, 9:10, sashiko-bot@kernel.org wrote:
>>> +static void cortina_uart_set_termios(struct uart_port *port,
>>> +				     struct ktermios *termios,
>>> +				     const struct ktermios *old)
>>> +{
>> [ ... ]
>>> +	uart_port_lock_irqsave(port, &flags);
>
> Seeing this, why not to use guard()?

No good reason. v4 uses guard()/scoped_guard() for the port lock in
startup, shutdown and set_termios, the sysrq-aware
guard(uart_port_lock_check_sysrq_irqsave) in the interrupt handler, and
guard(mutex) for the port table in probe and remove. console_write()
keeps the explicit lock/trylock pair for the oops case.

v4 also addresses the RX points sashiko raised in this mail: the driver
now sets read_status_mask/ignore_status_mask from INPCK/IGNPAR, reports
parity and framing errors as TTY_PARITY/TTY_FRAME, and inserts the
overrun marker after the characters drained from the FIFO. The hardware
latches these errors only in the interrupt status register (RXDAT has
just the data and a valid bit), so the error is charged to the first
character read in that interrupt.

Thanks,
Fil

