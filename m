Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D868344E64F
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 06:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790836165; cv=none; b=p5jpne0/Q/yniY/HH6GrsxMq1msRzczCk0N6T0qjLM8BRiG6fT4vZQjgvB34CiaphKoVbE6OIRxjkGzRV1SAwipASt5rgXNV2mJXnjAn1ExCp8kitoNLAJjuxABE7dXcClkV5if/W0Pm1hBI/BIdF7/qaLZveU2L8L/PhFaNQoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790836165; c=relaxed/simple;
	bh=YmUdotlXBym7+M7DTZqezt6CY+s7rUVFUXVNY2HpXtE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DAIr1Z+wp2r4iu0SyGi/D/Sf/ByesVst3SWDjf5iFQOwdodp5NbPAEK8Pk0FJpGCMNy1zRXPb7e3dF01JrM0URunJLBUaHWKZ0PKtDf7MXlqdMAZnGGdtb9S1EyHqo7Lvv4eW3vObMiaMYRngwCXYacESWPAWhUJpZAZ42uLvCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=imDGyIpb; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="imDGyIpb"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffde3cec6so27466925e9.3
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 23:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790836162; x=1791440962; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YmUdotlXBym7+M7DTZqezt6CY+s7rUVFUXVNY2HpXtE=;
        b=imDGyIpbLhdUCU6ZwJGdYV3V+BvxbPFAcSw6ihdWmf2fEq9XdbWImKLW9aDqi3oWaK
         R/qsRtLntGVTEeBu0JLxT/dAh2E7s8RGeS5rCZHang7j4ZpakzNow1IT7k1y2P5Lkr0/
         mxIhjMCRx23xjUDHcpyrVPH2InyW05zwgojKkfo5bEf/+MDxE/EndNmHCnOG4iZuEgVY
         mlko2i/6pTi4nOU+JxYxGZHztZcWjGOincDmcCgyByLKbiNChjJKXxvKLOh13bF9TcXz
         nrwOjYD086YVcWyA+pj2rf0+4rVOht/Jve8FIhCH0O48ddKNgUb0z5P0VDOokudP12Ll
         s/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790836162; x=1791440962;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YmUdotlXBym7+M7DTZqezt6CY+s7rUVFUXVNY2HpXtE=;
        b=tkIq0Lo+Orb+r5MWGG5lCtapHJS5GILTEwSwI6aUsdm6XwW8vNiDKyWcsQAdyguON6
         +FZH3bogHHKeOH4JZLxATy3Ks2SbmpHOZ4SuiFQGX6RMveSZ/kqaPSqAKojtW/GiJP0k
         iKyjNJk84oLaSq7MvUXJm/W/CAjyix0HFZOSx9EAA40HNlG6x1Bnw6LXwsYE3U/+qWnk
         iBs6tguTjkUMDCxB7oqZWY5w0EZ7C3lKXmZKFsuMFwPj+8PkF76qq1q5uAOGBoxTeANC
         ZtlYBkj0mDUGhZxkXlGkjaipLUE8ixk8YlASglFjaSqVTRJ7Ig9nY5Gmx8vliPRmFkUI
         Rq+Q==
X-Forwarded-Encrypted: i=1; AKwUvBw9vbugtL2x1aZZxpwwr+f8okbO247YH75f6uXWSKVBbab+pMxoVsVcMcHmTySOIpxT4J4Jg3VnyUDp@vger.kernel.org
X-Gm-Message-State: AFuF++mizlsbQHXcWH8EYAIuFvyEU8mdlS64JGxZwbK17yN9PaqNdHBE
	hgLCndOd0SFlsg6URoraxsnKx1sGfjqNqNILSdtPOJyaUSkvmIRUZTIa
X-Gm-Gg: AYBFou15OIqtj3ooDIYg2yF/P59hGHn5ApODNj54ZvTfHtpzqKzgQ8nhg8qc/Inp1FM
	zgSfVbbRIsnTpmO69cihQq6TN2PqAvEQsvSqnyrmgBH3K8gb3ZoLvWwmSa/FAqdkFUtKlvfOo1R
	DPFgXctbpVWVZWJqJpR9Zo4CFGRT8oHvaPwt1C7KDZ0h2/igQh+f0PtjyLBiBbvJtvVZZ2LHjJB
	wiseBJ90p73yR9Cv2g4fLYLXJANl5/EBEMPPEZJ3NgbvVkH1ATfGhZibhT/TtyprsZDQJbPD/pT
	4JpWjcyy1ZcqNt3caf2kZYc/3HBvOvpvnrf9P73au5wvHTtNsf5vC/YSdBJc08OhrFHXgJbkiRV
	dzOMI8mEcfyVNXl8nv2tKqvHvd2H49vQwuSzQW5bAE4v27FJJSnuizugqQWWGpWC/MzSWC8DNur
	saIbjDfp+kLHzlm4Yhu0cnjkWjsFaJyqOdrcjWjGjmcx2HifBAJcI8h+OIWGHSAfKvfzOW8kOV6
	FawxAuLAR1XZqmueRU4Sbh+tuDnGysi
X-Received: by 2002:a05:600c:6088:b0:49f:fd66:5fec with SMTP id 5b1f17b1804b1-4a01ab4d57dmr54370375e9.0.1790836162047;
        Wed, 30 Sep 2026 23:29:22 -0700 (PDT)
Received: from [127.0.1.1] ([92.241.26.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068ff891sm4026217f8f.9.2026.09.30.23.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 23:29:21 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jason Li <jason.li@cortina-access.com>, Linus Walleij <linusw@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>
Subject:
 Re: [PATCH RFC 07/10] tty: serial: Add Cortina Systems CS75xx UART driver
In-Reply-To: <3ddf4b8e-14b7-442b-9d4f-5167875e3d64@app.fastmail.com>
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
 <20260930-b4-cs75xx-v1-7-4617c4463529@gmail.com>
 <CAD++jLkzcf7gJB82XT3-xb4jLujtWSNz1kT2r1-4N54rRfRNMA@mail.gmail.com>
 <1d81c2ef-7a5b-4306-83d2-ff96b0eb6a06@app.fastmail.com>
 <179076749140.3134070.3869742286743401078@gmail.com> <SEZPR01MB42087271C56AD1C7E926AF35A28A2@SEZPR01MB4208.apcprd01.prod.exchangelabs.com>
 <179082517588.138645.14615134489246049313@gmail.com> <SEZPR01MB4208B8B4A5A7F48F7FFE0C9FA28A2@SEZPR01MB4208.apcprd01.prod.exchangelabs.com>
 <179083239972.193541.4791387611943615705@gmail.com>
 <3ddf4b8e-14b7-442b-9d4f-5167875e3d64@app.fastmail.com>
Date: Thu, 01 Oct 2026 09:29:19 +0300
Message-ID: <179083615914.311026.2458351803214458859@gmail.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

On Thu, Oct 01, 2026 at 08:18:56AM +0200, Arnd Bergmann wrote:
> No objections from me either way, but I don't quite understand what
> that will mean for the older parts that that are still sold by
> Cortina Access: cs8032, cs8022 and cs8124. If someone later adds
> DT support for those, would we use 'cortina,cs8032' or
> 'cortina-access,cs8032'?

I would go by the part number, the way fsl/nxp is handled: the parts
that came out of Cortina Systems with a CSxxxx number keep "cortina",
so "cortina,cs8032", and the CAxxxx parts that Cortina Access designed
use "cortina-access". That gives a rule a later submitter can apply
without knowing who sells the chip today.

Jason, if Cortina Access would rather see its current CS80xx/CS81xx
parts under "cortina-access", now would be the time to say so; I have
no stake in those and only need a rule for the CS75xx.

Thanks,
Fil

