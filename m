Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6AE2E285C
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 22:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786487532; cv=pass; b=CnVbIbLE37/nx6z/ES10tkCCaNABUsSTkTspi0UV0OrH1W4Gemn23FdDBnDt6ZODx++mvvkrMJV3B4VNNbZUZamMT8DR+i1sWgKdWGxxyfKuCZX8m6ShFL/emEC4yO/vASxky8NkqoU/e7aVvejJ5KE6bJAMJM8HFnP9eAFXzmg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786487532; c=relaxed/simple;
	bh=AuxgX/pY87Dos1ZhmL8usKTm92ZBhvXMmxS/SuJTpqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oeBDpGCRHo8NhULzgHccmgAb3Yk11Gak4V3Tlgm11EVjcP/NVnTILvTbeaKTlS7NNiawKme2icuB2sPgYc3Taec+/6sxFJolz3WLTUSd1Sw6RMGG2TQ9CPMqSS32A1M4kJVY0H3Py8/A37Ba9xeqOz1zR3BgJrmf+akZ3171hDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xw7vICT7; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xw7vICT7"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a082b3671fso207179a12.3
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 15:32:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786487529; cv=none;
        d=google.com; s=arc-20260327;
        b=ZwzWWbtUovxKIrNs1lAjzALGUc5qoLetPOQO9hxNLAbjnaYK5uiSsHXcA5iy3pbhLd
         ahjctRbgTH+HrY7loAaWfZuET62yQUf8com4mXt6/26JG/1CkGGs1NVn5gXNAKD2x3Z+
         ho+x7xLjUvqlCgfXBW2BA2IlQXJXeIZ9c56Lc3Trzm9kdNDMc7z6hqbrIlsFn2JYEc3c
         3PErjq+G7vCTYTwLgp5enbstIHdZiDXL2eI2Tnn9w/4vtysS6m1wfBCyIjMeI+xteG0Q
         dl4JmFYEDjKvqYtYoEOZ+xqotwAxiULpNSitgOPYNnyZ32imvy6b8QYN9DaYT7/CaM/m
         okHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NDhag9T7TgtaVJbOY8rWrSF9da5OrhIz5kdObvPrx0c=;
        fh=7jnn73Q+c+hlyu+rAlwajfncsrwcVGwwwnaWldW9LJ0=;
        b=Gr5J6/PmGaT8ExYngVE923LtQ7K9S1cb116JGjgOQZYuXYh/EcuP6nX5Dj2Rim5AQL
         JhbLDQu50UrfFVzxno0XgZ07HP4UstRTqgxkUrixuKKnK6Mkm9HkYIkvsfjRxzRebn2M
         9JMbNg+pQ9HW/IG1GOQ+dMIF+Y13wOTsntW3CjhQIsXBHdEaC5dqTcgH6uXfPoBL+KDq
         9lKVcJ6SPlC2yKepvV1TUwilj/KLChMMFrV0iUSlpjkKoh+9YYwKH+MViSm+4FjM+5H3
         ZF1U8mp6yLweqKEngokEIxldHn7WSxrBNqdjcQAD9XMLJnAqDPC1ayyQbXlw6OrgPqI6
         K0UA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786487529; x=1787092329; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NDhag9T7TgtaVJbOY8rWrSF9da5OrhIz5kdObvPrx0c=;
        b=Xw7vICT73Hr8lLLYZqguqcWWSbDpkK6WMKWEuyWJEZIxDPeCU3Nmwat3noNJYjLKPk
         frFX10hJwUuCUsxxONeMXuGuBMkxDXYNBJEVce8l1KYGfoG6wN8zOAvqJrVhSCeOSqBI
         Db14iGbW/o3l5TCX54mpnuQSIWvOfWtZGFvo+s1SE4SuwzNcaGUvmiR3VGg0g71HSh7J
         Nsoi4vEypqkCX59NnAJM/m5TVdh3CqSjtlygZ5XLIspqWKZWE2B8/MmJWHwL1bWX8Mdz
         hQPGoxf35qR/B8eUyMRWcwUkIfUAIp5Yra7oL56kkf88c/asJonv7nCwlZ3hwpWRrBCi
         bD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786487529; x=1787092329;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NDhag9T7TgtaVJbOY8rWrSF9da5OrhIz5kdObvPrx0c=;
        b=BnxVyYv3APGfKB4Wij32xbYzq8I3ufhj+thb2ZXZDhMoflQ3Ft0H7d/8JgEakUYNBK
         g352Gs2AGzvmfgEUol2WfnCUKi1Z8aqrCPL/0SF8cUqP7tfDTlZbDIkoUyDE4ldqnzgI
         lHwbAciBEvqq0Oz/NiOLBf5xkO4zxwLyV+/Go8Hotr9OA0QUijpUCjdKA/zLhjzHeYgV
         J213Prttx6ZNAbBuMOm4wUK0DBNR6e/kq22oaxBHDINRpAzaJDkAX2Y53wp3aUdOp4Kr
         9jKB8LF17Pw0tJ31rbEdeyP1BtUPBX58gHPAVBJ20Jl9y89Hk4pFtBGHxg+YMJQzQPEZ
         T96A==
X-Forwarded-Encrypted: i=1; AHgh+RoUhfVmBw5IT6d1qLX2YSGwoBYK3nWPAdwl5iSiHa1kBhp2mILRwUnWP0GZRhYFc8TWZtD98qji0sTp@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9LWDhkprfMPv7dpS3/oJ9mf0beOFwIxVmnPcEhF68m/gm8qlz
	p0EpCM1SSx0KXxfaxAmAmh6F0nxtXmjqHdoYe6/JsypyvCdA+z5hUBFJGBu2xz5LTlqpKSPSB8v
	0tUrTbW+wE45kE8gkw1CoanPxMkwIdMU=
X-Gm-Gg: AR+sD112M9vRFIduYdxBd1FvVBuBBgvMZ9y1pzFPcvOGKwrBQJUDBxQk2ZC29gFuAy4
	zlR8zJKJNNOBvgykHZV/6spiGE0b4H8pPm8HBK7RqkSGpwyuU4UIkjM0mGHihygbTcgKJWP/jRk
	qOChyUQHSpIfYxhPCIVNRLFfQA9p5Zy/4cOKr6l6K0nDo9hO3Yv/JmGYi9MV4f051dV20i4c9Bo
	p6CEub7jY5FcOg5ucuO9v4Bh2FFSVryeW3PzbiHiOCoMlU839yLnIPrLtUelT3ymr98qgRhXi4f
	LJRokvTLpkepFcRiB8xP4uCyczRYpVwS84GW7d6/jyWL
X-Received: by 2002:a05:6402:2792:b0:6a1:ffc4:9c0f with SMTP id
 4fb4d7f45d1cf-6a375f5c06fmr15680a12.19.1786487529251; Tue, 11 Aug 2026
 15:32:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731215043.30392-1-maximpedraza@gmail.com>
 <am2mvECnCcO9IxuI@monoceros> <0219df57-06e3-4776-afb1-d167cad2e795@gmx.de>
 <CAEUXW=GUY+x1A72n99i1Cpgy03jTYv3FPAX5nY3DCHqmeq9YVg@mail.gmail.com> <20260810-devout-pig-of-performance-595ccc@houat>
In-Reply-To: <20260810-devout-pig-of-performance-595ccc@houat>
From: =?UTF-8?Q?M=C3=A0xim_Pedraza_Padilla?= <maximpedraza@gmail.com>
Date: Wed, 12 Aug 2026 02:31:52 +0200
X-Gm-Features: AUfX_mz7nXWHSfkKAN1Ac7JJQdBN1iB9iQXcLpUm_kEW3oLMc-SNNbJ2H3j21U8
Message-ID: <CAEUXW=GuHypVE5Xre8AQBmkrcUbPQxh03Lq8os=kjcLeGahOgw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] Boot logo supplied by the device tree
To: Maxime Ripard <mripard@kernel.org>
Cc: Helge Deller <deller@gmx.de>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El lun, 10 ago 2026 a las 11:02, Maxime Ripard (<mripard@kernel.org>) escri=
bi=C3=B3:
> If the sole reason for this series is to keep having something on the
> display while the kernel boots until DRM catches up, then you probably
> want to check [drm state readout]

Thanks, I had missed it. I read it and then measured, having earlier
claimed in this thread that our hardware kept no state worth reading. That
was wrong.

Dumping the LCDC registers at the top of tilcdc's probe, before the driver
touches anything:

  RASTER_CTRL=3D00280081  FB=3D9df13cc0..9dfcf4bc

LCD_EN is set and the scanout address is exactly the framebuffer U-Boot
reported, still holding the image. So readout would have something real to
adopt here. tilcdc is not one of the drivers you implement, but that is
work rather than a disagreement.

One observation that may be worth your time. Pointing a simple-framebuffer
node at that same memory, same device tree, only the driver differing:

  simplefb   the image is still there afterwards
  simpledrm  the buffer reads back as all zeros

So where the CRTC is still scanning the bootloader's buffer, simpledrm
wipes the image it was meant to carry over. I have not chased down the call
that clears it.

What readout cannot cover is having no firmware splash to read. U-Boot's
Falcon mode boots the kernel from SPL and skips U-Boot proper, where
display init lives, so there is no image and no programmed CRTC to inherit
-- and Falcon mode exists to shorten boot time, which is the same reason
one cares about the logo appearing early.

So I do not think they are alternatives: readout preserves what firmware
put up, this series lets the kernel put something there when firmware did
not. On hardware with both, readout is the better answer for the handover
and I would rather not duplicate it.

Max
