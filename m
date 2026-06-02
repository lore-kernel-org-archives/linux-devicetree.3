Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2773DA5AB
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 11:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780400705; cv=none; b=Y7RNWHyyBlrV0yVCkqY8MVYk1AThRs7S2h2gLEnqR87kyYM3DA3TBS7cz9KiGwgIvZzYXLwjVLl6WzMP/lyVl6bPdhubZBOM9BX9buycJl0+xgDnPaMFG5zKetM7mkQ+LuiNEoa6uK//nMTcIh5tg00/7mR0RpwnsUZgNCr1hb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780400705; c=relaxed/simple;
	bh=aOrDuQ2Tm0lJP3blA7WVN2huWRSYPyzQna+BYkEOMtk=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=E5a3NR47aTxXTlHMjbeZgrLhSNNkFMkrOG22cd1Krq0APr63T7zcr7aKqo8mJUvqVGxA86wLn0M5J7DGxGMrFR2fzSHxO7JP7qfXMnwurgSUsNU2NMN1hQyMD3Mfb3veFDw/CDzgk08klo5y1X7gurQQtnOOEvcn9MfDucawlMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iaHj6zI4; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iaHj6zI4"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45fe59255beso1408415f8f.1
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 04:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780400701; x=1781005501; darn=vger.kernel.org;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aOrDuQ2Tm0lJP3blA7WVN2huWRSYPyzQna+BYkEOMtk=;
        b=iaHj6zI4FxcmgLThWYP4aDQCQi72YeEaVPadwQwoQyjDbTZCT35NHRJdSXm90rovuF
         BsOOS1IZGjeVTbWEatrvrCQAioMrxfGj5BgTf0XWjOgBG01yAwadYoSqHR7uv0O0ggIM
         eZrKUpzrJwkoB8xE3Pdb/yODkXAXg5800/j58AkWV/hq17t2ohT4Ym/vO/UKPE0EGmYI
         DuXL+ljZg5ZGYsxnfhXRfvYHVF/94vIe6fWFO0No2tgWrv4niqcNeySMvO1wJQi2IsZP
         jIL1jmqTYINvXmaP7ZVVkjb+KxL8MsJ1NgSGcNeUstDQrTB2Uwd9XgaR0uBypZ7N+bQG
         MkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780400701; x=1781005501;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aOrDuQ2Tm0lJP3blA7WVN2huWRSYPyzQna+BYkEOMtk=;
        b=N5d8MaAKgWeOPAjEBxPJFREB/kLnCYtfY3T6Stb988bNbMMDaK5rZc4BogLBPUCKY7
         65lt/dzwzZXpWFIJ3km0r0+jiLeWOAt6vDet039cQDZ5zKkTTmKpD4MvL0IjKXda9p+J
         tV4532yLoCSjK9n7pc2BN7giVBPxNdTfELUfCSOOa8yXjbgJz/OL8qVtSc4T/uOq6HB4
         Yg1wRt0aG9r/qwBN6Y37InNzv2hegoMATMx9YCYC8B6TdFcAFSwOktmcNQsjlvHdk+Au
         qxEc+b398F6+VvJeo6TBpQNKgMBHkq9xMeaLXF3D1zzwN2enzEEOGSEgJajzaG0DxsOT
         TXWw==
X-Forwarded-Encrypted: i=1; AFNElJ97D6RohsICLOGxy1YkQy2j6m9Ame4a0RusYjiaEah8Dtcz9GtEJ0HeyNpOOpsPQEjfWZot3bnez0eG@vger.kernel.org
X-Gm-Message-State: AOJu0YxEhsFu5SmebOWiYKMlAtfKNYkWtYAF+D/CGf1uxR7uUfU/bq+A
	ClevzlXHR+Lc9fS22wT68d48fwhbfMIADL8/BdvsVpvfTnLKVqtwH/q0
X-Gm-Gg: Acq92OGxCqBTky8rgv59FVZmkKuWoDQDC54v3pnfYE2RfDbCnvSRYTIehSHIUCznD73
	/V8c9lUB7YHzpAZ8/sVtWebILwUL0mykTth8vIAaZKNJyt0zfnZ9j1Eyav6alwp63bzY4P665yM
	EIgSibaZpAocq9jHjaBB9e60EjZ5AH1XrXWQFtV+TOx8/Q9aPszIbaWZjBu9D2ipOevCsFXapmm
	UgA0qmmSw1/mONgN9XrgMejO1Lm/Kd+kvUPzLAsq0JB7IGiXyJvL6r8PtMhBFWtbQOxEgYGljqQ
	o5EC4tAcnES3H6j7nnXSZkuvVldQgvkqCJWFGscXZxMRvbSgRrz7CjQHQ+3iZIOPrSTtNSQGM5b
	RtqppOVh5Q83FCTcYqYMfQkfycZeIDzh6iQKN3Q5lZhEmDP4Hl6WUjRhsf2jsdA6x24UuLnuUCL
	OG3e2UU9akd8jFrqtBxMQPYfbhm9xsGPjbDkVOUmbw7KLsuQs=
X-Received: by 2002:a05:6000:1285:b0:43d:1c4a:37c with SMTP id ffacd0b85a97d-45ef6af6c2cmr23180496f8f.4.1780400701264;
        Tue, 02 Jun 2026 04:45:01 -0700 (PDT)
Received: from localhost ([2001:4bb8:152:df59:3b69:56ea:a39b:adb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cd87sm31232994f8f.24.2026.06.02.04.44.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 04:45:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Jun 2026 13:44:58 +0200
Message-Id: <DIYJDHPWP52T.2HU8B815AVKXF@gmail.com>
To: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>, "Andy Shevchenko"
 <andriy.shevchenko@intel.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Subject: Re: [PATCH v4 2/4] iio: light: add support for veml6031x00 ALS
 series
Cc: "Jonathan Cameron" <jic23@kernel.org>, "Lars-Peter Clausen"
 <lars@metafoo.de>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Rishi Gupta"
 <gupt21@gmail.com>, "David Lechner" <dlechner@baylibre.com>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, "Matti Vaittinen" <mazziesaccount@gmail.com>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260531-veml6031x00-v4-0-e64f7fdce38d@gmail.com>
 <20260531-veml6031x00-v4-2-e64f7fdce38d@gmail.com>
 <ah6p-f2RCW8VcuDR@ashevche-desk.local>
 <DIYI40YK6CSX.2P4017PHVJHCT@gmail.com>
 <ah66ljSiIc0ywFC2@ashevche-desk.local>
 <DIYJBS4F362A.2LIDZAKU7GBBU@gmail.com>
In-Reply-To: <DIYJBS4F362A.2LIDZAKU7GBBU@gmail.com>

On Tue Jun 2, 2026 at 1:42 PM CEST, Javier Carrasco wrote:
>>> > Hmm... But why? Wouldn't this be problematic with reference count on =
the failed
>>> > devm_iio_device_register() below?
>>>
>>> I could move this a bit further down after devm_iio_device_register(),
>>> but as I replied to a Sashiko complaint, the reference count will never
>>> underflow in this configuration.
>>
>> Please, add a comment elaborating on that, it's not clear at glance.
>
> I will provide the link to the message where I explained this instead of
> copying the explanation to keep the discussion in one place. The mail
> belongs to the discussion thread for [2/4] (this patch) anyway:
>
> https://lore.kernel.org/all/20260531-veml6031x00-v4-0-e64f7fdce38d@gmail.=
com/
>
> Best regards,
> Javier

Sorry, I think I gave you the link to the cover letter, this is the
right one:

https://lore.kernel.org/all/DIXZFV822HRI.2SBIT7ADW9LUK@gmail.com/

The relevant information is at the very end.

Best regards,
Javier
