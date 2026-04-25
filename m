Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C467826ED41
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 18:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777143321; cv=none; b=DO4cFHUaAC/oVKXzlKIJGzCmVrI89Qs2X0xJFiY2nag+L3IYlf6rExCiRcZwphE0m6Xv99Zl2Nl2BDDJhDJsZGCuWeMCFRYu0dTbFxccRwn/OVReOi7QYOopP/grD3J2OV0lnVgVhwCp7atyHZ2IkomvL517Z6c4S2ac22kKCVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777143321; c=relaxed/simple;
	bh=6PC5k/wB15iovttGKhDrvKcF72yoyScM3QZMtUPjQSo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R/+6Q7BMFcRiAiQ1RrtC5jL/tfZLz7Sd1grVtrA/6ox0sZQiDgfIVBMm9GIAd2K51UqsEaqloAQ6S21nhdTrkhT2St7giPNSILertLMs8m3YT0OTOzGXD6nlaNTjQLktJYgNKLB9R+I3pFdQw87Ws96PwJet2qILZ4nKNUFJxq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lh457qgi; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lh457qgi"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38e7bd07656so82577421fa.1
        for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 11:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777143318; x=1777748118; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gJITLO9f82dhzr/WR0Vgm9oDU311eY+/4fzqp2zrKeQ=;
        b=Lh457qgisV6ZK+UdoVSJciORTc7YuO4PV7tqpteXbXTPAbR8RYLVHGxCMIc0eJ10Os
         +y+9uGVlHU0a1ISNPlJjDVqLUmvwAIw2mpGU8K2ye4GZqjfyp5mEvbtYOtin1xcfTxT1
         K+Y94mje9MWJIGC9te8yfXD0VLYeY1kd1e0VHXlQ+kyyFGx02D6YlinWhngGifSFUAkl
         NBZx/YCoodWr+vAPmi2wnRLe53zfo+7wePxTr9tjWpWtP+cZZAvPZ2pv4CGzB1ZmnS8+
         2IZ5O/zOWWQWbXYuo8qiXU2ZZP4U7tkl7WQ7BHrvGgohuZ7YKuxZWC0bwUGBaHPT29Hp
         V0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777143318; x=1777748118;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gJITLO9f82dhzr/WR0Vgm9oDU311eY+/4fzqp2zrKeQ=;
        b=cbKNn/h69NPVzp9x1TkkB7qJGPwaA5HSpQtEp2jTqWf6NxcT/Sw5EOZBj6Ip0aHlKt
         TtCDWbxZ0LDzgIxbxcMQTJbSlXpbSbjVn0jrgr4w1FgBxSoR6dD+TS+d5x/t/u9IGCPh
         Q/cs4CNpkTHZHrFolB9/2pOXezSLFOW3ieCO/xJ5F9lCW1fgXfEs0A65gCDWmsaTHsg4
         Y99bboD1Crbd2qX50+fBe5M5EVkzId8lcXfJmJnCGfL4TVp66qLdzc/q0dOYfFWASCAN
         zabMPzJtY2Bu1hU7p9sv+h0Mu/Vu6ApzV6Ub/HKQw/OlzBdVx9vb8SCJwgyG/9BvAQXj
         uvzQ==
X-Forwarded-Encrypted: i=1; AFNElJ/vi8zhhgPU+TIPx65vVnaxiA5iwimrBXTO8TUHGT2sVA7xOXvYEQX+dmOdiDzUIyYmnDGQ563SD8Ug@vger.kernel.org
X-Gm-Message-State: AOJu0YzvJzfwYhC795OvUwXPzEDn/PZOi5/2RhzP0/KjgKwAo728C++s
	gEqTlNynZp6cGfC9SzU5G0IFvKbbsEHcCECp0YZGj22H3/0PVY8Ypwc=
X-Gm-Gg: AeBDiesLGWRkhsqIRF4pOTJrScGdh0PCSCIc2tiapUMuHmJHqwcS9NJh0N+ziCkUM7u
	0SuParNTcQCbzn4ZlLb5/vUL0IiXxvfndekPNPY67vYfZYZW7PQuyTN47xuwMgx8+E3mAdxfcZn
	Ov7w0Yk/5wHpatXOVNWqv/WciLS526ucpa5gBpyfZfQ87WfaAsy+bJ2BdxKPwXK2R6KebLnYH0P
	WhxKvu73Y3tMPqLVAGZas6Zn6D1lVISXHZQVLiW1C/w9DlLlGzC3k/Ut/zINwVIp2paKOH0ui0Z
	Cw7N6x7HDTwLXuJru91mc7XJJ9lef+g64pwunCgX1RWJ/+lub3iQpwE7iJInz9aXnWSe8maLmqC
	cEBFBQWormEOtpWGxYjhbEbsa23L+3Cc0th7QTcRHxXRGVbLExd3m2IGLkULblOwCs6SagQYdfM
	3qu0WkD+1A31q27ODTK2Yhk0IgTptXlI7ptw==
X-Received: by 2002:a2e:be1d:0:b0:38e:49e6:a376 with SMTP id 38308e7fff4ca-38ec7acfa4dmr137809241fa.22.1777143317812;
        Sat, 25 Apr 2026 11:55:17 -0700 (PDT)
Received: from p183 ([178.172.147.163])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb4f54ffsm57552711fa.1.2026.04.25.11.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 11:55:17 -0700 (PDT)
Date: Sat, 25 Apr 2026 21:57:29 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Rodrigo Alencar <rodrigo.alencar@analog.com>
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v10 02/11] lib: kstrtox: add kstrtoudec64() and
 kstrtodec64()
Message-ID: <4b7b42fb-e3db-4218-9deb-ad609e07bfb0@p183>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Rodrigo Alencar wrote:

> kstrtoudec64
> kstrtodec64

The only comment I have is to maybe sneak in "fixed point" into names
somehow. Or change to kstrtou64_scaled() because return type is not real
fixed point type.

	A.lexey
