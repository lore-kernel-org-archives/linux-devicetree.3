Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8A03AC0FA
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 17:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780161848; cv=pass; b=GtLS3suckwqgNTm0QC1dEdwh6CkZBCpsH4PYxGZUn5OQXig3BPaCubk6nX+i8OuWUb+zRqm7l+hCdHasfrUR6hTw+eKkS2oPn25pE4Xwoa2VaqJgX2XU3kCOX9DtVGDKZzzBDVbvQ/QHS+VSxXN2e+DAd1SP3HvWqvQsu+n1/mw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780161848; c=relaxed/simple;
	bh=UkBSBLxIZCuuB74htmYnx5hF1++Wk1amY553OBJB/1s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P+gad9xTF6+/O03TKwyV2DUwOBvSWe2S9QreFT1vc1v9vReYHhL0NKgc78e3XHUxErI7HNSo6pQ6JqQ1dhFJ2mS9hhHpshQv+bHz90VfvOn3X7++0wZ4B/UoF8mfTEs+N2+uVvhLbdak79W4PV80QRYa8fpZ4ZoC883NunH4QxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mhPyY83D; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mhPyY83D"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45ef42dfb26so430583f8f.2
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 10:24:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780161844; cv=none;
        d=google.com; s=arc-20240605;
        b=MxDInByRAMH53cHEFPekbyQxBk/tP/+wrdS0tAJnt/GDt6VrRrW/VZQLzFbc6/aI25
         W69tG03CEc+TKf2WnqpkNX4CIf/zON1+CqYiOmMI4Sfs/BSpsZwYA+HS4kZYbkNDQBMm
         /khYq74DKCX9DEvZDBhKeGL2mS8jacAGiKdMfCp45XphEzJXPS97fZy+ZGa5gELB7y9O
         SZhVY+0kgX/34vFOntMSDG/G/FrW14FE84O4zyIdjrhiXIC85/hglhDCJe/Zm8l0Ci+9
         P/PO3fxKmAoFIleF2S/CFJu3terbHe9vgmzgsMEkS3u2J+g9p/4PBkgRtPACKyrfJrSF
         S6mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AQlzPqtSzjfFVqBmEZsclhV7SR7e0gsG8goezRczdv8=;
        fh=sbjlha6+KmY3bEYyWc4FCkkHvI8W/E/gP7CK465t7Uc=;
        b=Jw+62IOuZ+A3kStUb5NyDnhGsWTjcZcoJLdKLq4mnk66+3Odx/DO57UUjzgBirnhWs
         ObVlhYSevpl1slCg9y7RK2U7oqtYrbG4B36SOCXIIiOZdUKiz1eYgcMM1cG6ccpPh8uX
         SRM9Jm8rjcPug/fOzxC5eTmBoNjG8U1CEEMXI1k/oh6fIAgks39bANu1/S1+QBfRM23L
         r97tZMzjd4zc/UfMbgZjoxmRSO5pYf7PRQrMiiITYuPj4DitbCRu141/DRDGa7Nlu5IE
         g3esK/Jw7z6sfX5V4+7KdwqsPdi57OWvNqGNbqnb8b1Pu7cwWgygt0HeU983f8vMoR2I
         WMaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780161844; x=1780766644; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AQlzPqtSzjfFVqBmEZsclhV7SR7e0gsG8goezRczdv8=;
        b=mhPyY83DGCwhOqJd43QnHEk0xaBYXPNaN66oZVS0F2zBsJkwdzpr6ibWpjoOnp+CN2
         Ta7sIVqN44tSysTX8mO9w/MdKtjPAa6wk2oy3724RSb6jAG7vHdVNBuzCdj+iALLC+3B
         Y4Gd+tTgQ+ovwT1/WbIHM8zi8GMnCk4S4lyIHKy751iBn32RSDC0t6JUy/bPY8wjXvj9
         gQpGRbvMZ3uinxBx9ZkkFAMoBSV79qT5YIzRaWRHXuFzhnMcw4VGS83wTD0KgR1niUfl
         BF2uOMIGyPFVjzuIzEDYMu5UpwgcnIDbweomL+hV6jMoZ0WU1nJ62C7eeHf0Yax5M31q
         fC4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780161844; x=1780766644;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQlzPqtSzjfFVqBmEZsclhV7SR7e0gsG8goezRczdv8=;
        b=aUPCtADGS/C0Qa14KmReXkD1XOBDuY3WkprOyTbiKakngrhzc07GS0Vse8NcqSfkTu
         8U3oiBwKg6V9MwXL41xdXuHrRtUe1YzxKAnjbrX1cd1imiotC7Z2AU7JwPqIODCiTvTS
         CyI/ZSOe1VLf4DK1sKzj2M8tub9cAQX5uNmFbrcEQF20BhP4fB5srncaeKYWmbKhemZ9
         RGjHFS8clOwum7oL559X/XyqvcokOlfYGaUymt1IqMkS5xDiSt5OcyXBnWKKuT/MPxPs
         aDr9DWPq8n6uS0Z8YGcPOpjNLimGW7hIF6xAVSxccRVZzhDgTrHMLkQ2IJ4D7hHFZNPp
         TJUQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ghQRvpWj0/cSkX4wad81Y30/XW6H9DZxCt0y39T/9/xoqeoctxuJsj3gyC0KLjcEpzwigPgsef6KN@vger.kernel.org
X-Gm-Message-State: AOJu0YzGRJ0G201FkmsQ58noNvMuNdjORZ7VfZTs3m6AbungLj9XO9UA
	PkZW3D49sYHO1wH2D0et1BeBa1eRkwxLM9q+nhsFlQvQtaSuKle3qA4rnWjzzSSOn8Z5DAolGi+
	FnSOXprUEl3V4YtKE0RhENLlNo+znvQk=
X-Gm-Gg: Acq92OFG2C+yd33Xx3XfvIJCD3abnM4ECWSJgmY/+GW4m5Qy63G4MAgVMKt6UraXiPO
	qQR4LrLXD89+tBIc2JHwpP/YU594Mo0cjKmsMnUXZmT94sH2vba7LdaEn8A216hox1Er0T1myN1
	Ui4jg/kl+Vs7dkdNCM7UOCTK9leWLeUCeyYygo3OPsPB4XbLKMCtzm62KcZEMEHLL2HHQAuEATo
	+yluOg5yN35Iw9AEpMftk7CkZRskf/nTi2ZwuDGd5WWSS+NEJ+wZ4GErX+e8o5S0Ly+djZy8BsT
	d8q5FwJnX5/eUscF7ioXrzUtb7708L3vQjgkBqYBGkdHAM0Nl4wZJrBjvhsQIgEhd9T2GHHbcHw
	CDcpS+F21T7V1bAtGxj5TD+qDvz/CDK2sZSH21DjYICsWEGwKw11WJWIVghB4awg33P3fIlvhZN
	9DUNYiCpH49sD9DU+VW+JyF1gdWWhFEWb6Crv5hdOU74k4NHyh3g==
X-Received: by 2002:a05:6000:e88:b0:45e:7c19:a328 with SMTP id
 ffacd0b85a97d-45ef6b71568mr6258240f8f.28.1780161844477; Sat, 30 May 2026
 10:24:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530-veml3328-v3-0-dd562eaee8d9@gmail.com> <20260530-veml3328-v3-2-dd562eaee8d9@gmail.com>
In-Reply-To: <20260530-veml3328-v3-2-dd562eaee8d9@gmail.com>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Sat, 30 May 2026 19:23:53 +0200
X-Gm-Features: AVHnY4J9riritd-tavTskEndG6BWKdCZhIsEHM46Emg64TDdMke5aGxbGUNB_uY
Message-ID: <CALoEA-x5h==eL_YmbZ-WV-N=ZokPRF2pC7+p2Z87KOxDAFzu4Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] iio: light: veml3328: add support for new device
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Rishi Gupta <gupt21@gmail.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 30 May 2026 at 19:07, Joshua Crofts <joshua.crofts1@gmail.com> wrote:
>
> Add support for the Vishay VEML3328 RGB/IR light sensor communicating
> via I2C (SMBus compatible).
>
> Also add a new entry for said driver into Kconfig and Makefile.
>
> Assisted-by: Gemini:3.1-Pro
> Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
> ---

Sashiko had a few remarks, two are bogus IMO, but it does mention
that the device isn't put to sleep after probing...

https://sashiko.dev/#/patchset/20260530-veml3328-v3-0-dd562eaee8d9%40gmail.com

-- 
Kind regards

CJD
