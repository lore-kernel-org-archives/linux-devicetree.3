Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5122142049A
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784120514; cv=none; b=XLpnIGiG++33yV9qtvrnjtsEg8QEOrXn/W7caCd9aFA3N9EZl8RGF7HYW2b33ksJ/FMzFnEMS2Q/2yCfRblok8WZJ47CYLzV3YhS4A6oRS+cuEUgoDf8VfDVBHapIlV1Bw5SlOBlLLeVXfwWr5aTSIBS3bgVlHM8lDo8gbGHskM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784120514; c=relaxed/simple;
	bh=eQ2gKYc9XnJfTD+PUNBgiWdqiXRs7D5irdfEB56YBN8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EpxvNx4yl+ZL7ckxSvZf0JVlCaUIFZGjvzZ7Iy4z30mj9cWxVzcSKieCYRM2qvprngjvjYov9Bn3QRxj/b70MvII+lX8Dq7JxWYpVH+A5oSASkf6H/pVDYcDqYxT+WNtBF6lvdDYjxSmtrXqokiSlFuJC82Fwr0S7qjMO5Mubog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LxkY+4W4; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LxkY+4W4"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso2982212f8f.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784120511; x=1784725311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cP01oA1jkrZKwxr5XPjzYghqVKBxOj1lEgy0fuomJtY=;
        b=LxkY+4W4zR0lOH/X1hnsj5Ph7Z5Bg0Cx17K4TZC98Pe81O2hvchn7vU34Xz79APavO
         V53TCKkLg0E6kVzkkuxb0s+bv3Bj/IZXY0IEsUslNftB5LrpqSJmV9Ot627VEvgbO7dk
         CM3myTSPlr3qMrTIOn7n7JikEpIzcnIQOC9ps+5BCEz2cAi5G0y6glu1buCsU4CDKKyX
         61D2mLF9OZOBf+QoJGiDWJv1O0zEtYtlDQ+wM13EhreOdXsEGQLWM2B14nuyJwICasCQ
         TZMDAiGmRa/CF9hGFcilGHFPApDXhmatrdJd7/ZRBy8b/iN7zi35kXhhQoKLuz9s9S83
         +Z2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784120511; x=1784725311;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cP01oA1jkrZKwxr5XPjzYghqVKBxOj1lEgy0fuomJtY=;
        b=PLdtjAoJs46YifMACQctINW189TtwnP3iuZmO2DBLiNl2+hWmsBCjigBYD5YRW2sss
         BkcKgT5wzH3+LYzJ0726c7FYv6H3uYWQHgwJXbMswaO3oz0hulwo9opxD7y61T2K9eA8
         2Kr947OXcE3/jeAu+WS8qBXfWVAEQI3h4MdoHQGhQbsq86/zIcssiO2OjWjDWXt46QXN
         zCgfCOM3HnC80SQXai1/JfgKpDBw8QcM69w1pjlqItjEbGKPKxeMXZvvO34sLTFHhAYy
         V+o3aSmWOsKVVYCTJ9gpqa2uNSRLvgiwIZbdVtHlcmkB4FoE5YhO+Vu6b34aKmwYlMsA
         Q2JQ==
X-Forwarded-Encrypted: i=1; AHgh+RqFRnHTt/NVHVq+/QD2PoLYaENW9zif+lpU3aihwvLNYLbmuKQhP8i78boTR5kesuGYUz22m+TED6ZQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz8vxuJUDwBrHJo9GE3lSwSKIM+bReD8XLHHw7maYJZDWG/Ebv
	TIwTlyM+IfScXjVACufl+n2jMczgkUnwc2qDjDOXJm1CL3QhBQ8lHiSc
X-Gm-Gg: AfdE7cm/c0YcH82DSIrJ+obHJBULJTOivL+mTG96U5gQQ3RP3UEwZQuiCgwBghj1131
	LJ9sxJBHMV7SN0+CSeylo/8vLbXGpo2Rvh9elLGo20JN/qYL+y98K/wVRj4swlU7TYQrQVdBlO+
	04g6JXT11RvhWv/hHAr4h1OlSyzzy62TOtf1CTOqYl2xbAuSDmaAJziRgebDHPkS1L4ZQTa54Rz
	lWoh5Znyg2JLWme9NtHc/1iWPVJhQ6RuWIVc1Y7ayPqmVsLkMH1nlGAe9KOeBih69PLY9Wb/smM
	xxc/yK0667sW0ydD1gi8dZRkONN+zmpuirWsYuPFriD8NkMJpqs9S1F/BhXCVm3+tkb+KJtJRJ3
	kHYzF5lFLEL/DqkYAUioI7Cmknjn769UJhjqpHjxKUHZZYvGpm1h1oLhwladraMxIuQueKCAoYN
	URKlSxIrZePVYHECpA+XUg+THmWOIP5Z6S3LZbLKS7b9cDWbAsBt1NJstMXlBOvqm8ap4RNbc6y
	PSdPZxSGVGKtPYuKRW8DQxYY/bVByvXz8Viup8vAwAKYAkodZZDY9CiLbhKtbHKfgQbrv93WGLF
	7kXPhuznQoGDHLi2mw6vr3NNRZUKqgDVdo4Bxt2SdXOHl4DAbaTc550V11uW02RopObfieoXbUs
	rCJyps92uJi+2nkI6MDeusC0=
X-Received: by 2002:a05:6000:2c0a:b0:47f:4893:d180 with SMTP id ffacd0b85a97d-47f4fcbfd0dmr2975258f8f.21.1784120510933;
        Wed, 15 Jul 2026 06:01:50 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c9cc3sm16825947f8f.35.2026.07.15.06.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:01:50 -0700 (PDT)
Date: Wed, 15 Jul 2026 15:01:48 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Esben Haabendal <esben@geanix.com>
Cc: "Jonathan Cameron" <jic23@kernel.org>, "Lars-Peter Clausen"
 <lars@metafoo.de>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Martin
 Kepplinger" <martink@posteo.de>, "Sean Nyekjaer" <sean@geanix.com>, "David
 Lechner" <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>, "Andy Shevchenko" <andy@kernel.org>, "Martin
 Kepplinger" <martin.kepplinger@theobroma-systems.com>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] iio: accel: mma8452: Allow open drain interrupt pin
 configuration
Message-ID: <20260715150148.000045ad@gmail.com>
In-Reply-To: <87bjc8o32z.fsf@geanix.com>
References: <20260715-mma8452-open-drain-v1-0-b1dd2a440c60@geanix.com>
	<20260715-mma8452-open-drain-v1-2-b1dd2a440c60@geanix.com>
	<PLKuTyVcES-o-CEsU7WA3Ir7-phI9WLM9PJ5UErJeahWgus8heVF4GPky0SC-EpaHLv54lZya37ivhub3W9kNQ==@protonmail.internalid>
	<20260715104542.0000433d@gmail.com>
	<87pl0oo5iq.fsf@geanix.com>
	<0RfJ6kNIpjdTDIh2uWC-FK3HRObOpQWqSWRm6hTgOFq6_wdHDyRfpatKMsvApvfFc0r-ye6piEWG888mBhp3yw==@protonmail.internalid>
	<20260715134053.000012d4@gmail.com>
	<87bjc8o32z.fsf@geanix.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 15 Jul 2026 14:21:56 +0200
Esben Haabendal <esben@geanix.com> wrote:

> > I'm not sure if this was intentional or not in the original implementation.  
> 
> Ah okay. I assumed it was intentional, hinting at the hierarchy of the
> defines.
> Should I flatten that, or is it okay to leave it as it is?
> For what it is worth, I like the current format :)

Up to you of course, nobody can force you to do anything :P

-- 
Kind regards

CJD
