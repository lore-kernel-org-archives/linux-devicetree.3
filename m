Received: from mail-oa2-f1.google.com (mail-oa2-f1.google.com [74.125.231.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78586355057
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 17:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789320232; cv=none; b=kHosSg8+8ZPjamrVTqCRvn8FGMK1gYORAdMRpAQ3YHWY5Hb4t7JHQUmZOJSLAJBjsZEV0083kMJ0p3I7g88NiwTM+nhNRkppqoYyDHtA/fSTzQLmYGJspmSILKKgPmvRjcws87UCvOL4auFnX6KjsLYKv7K+FbQ7PtXVeUWBiMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789320232; c=relaxed/simple;
	bh=nK2g6PCG8RmaEW0yEszSpyDSTDIVp2sQ/UCkE4rggGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XeU9eDS0EPaEAlrcvqWFzC5UzAjz7zKjscWCo+ISjSeuZRT6yaCDLa6ffVOAwMv/+He0d4vEgVHlONxlGvIVCEZbvvxcFYGeSEhuJxX7TQMWzU5uvzdbJBXvdqNWAlOEvaMGHDN//Gmuy4R3ru+ituy2jMLWfH7JCL/om3IZhcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hPWg8v4a; arc=none smtp.client-ip=74.125.231.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hPWg8v4a"
Received: by mail-oa2-f1.google.com with SMTP id 586e51a60fabf-448a12ddfb4so1181657fac.1
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 10:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789320230; x=1789925030; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AE5k/kG8YJbF9+P0eXSyvzyutUhB0PHETgWhH6QKTKQ=;
        b=hPWg8v4a2iMQMdHsn128VXbUDJH/mn1Ls8iJf4DgChshPpVV/tCIl64v88pQiIVhj6
         D9LZthxEXGAasfmfWSaD2wLqWtB6YwNnzTSOoR75g6MikTFFh+n5YS5jXfYjIRKWpN9T
         rw5IRGolSVtdEb1jCGhtMRhZyOvEsIcn0DYTlV4nC0SXcf3TkBx009H0cI1RUCBtkwIz
         rWgvYduc8JZdkl3O5HkaNmT8t9TejdRzln+ODn4kcOU6zwXvqJw9ZP2+1W3pLRNC97jl
         CwMx1KIYPP5JzJk7dAsiQTvdVNowqrOHwaVkm+XUWlWEcBGZb66QzjiyAE215cM7N3co
         QRQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789320230; x=1789925030;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AE5k/kG8YJbF9+P0eXSyvzyutUhB0PHETgWhH6QKTKQ=;
        b=rBBdirBaPanOhSc7xJvxDVLkzbHdsWzlZWjH2kOQ+/BgeUykoAj+bkhyIq58PSGwzM
         s5OBiugos/k3Jl4iL7hqoynLXyh7xerBgpqWWtjfZ7c6yme5WmaGKsGQqxKkc/Nil4Wf
         tPmy4A1IXfSx4iOO9/5V/ex4vhiFagPUFTnnDs7gXg+uCipXhlWl66T6wFGdIyR5By0c
         enuQ+tLK46OJFdcdD06JwrC2mrwDEkKo3ISCHOFiwrhCCeS2/JGywfYubrIMnbgly1gB
         rptJcyNZkk6TXf95nEF8dtGMjLg63QCjTPNVUP8M0WrpM2k6DoX1Q9Q45pUlvork3dOG
         lOEQ==
X-Forwarded-Encrypted: i=1; AKwUvBzim5D2Qxv34YEDd0Y0z0n7bJ3drU/5R6TxE8K42mXuaKF0QfrWYWF39e4VdGhrJDAZdEkjn592igAt@vger.kernel.org
X-Gm-Message-State: AFuF++nKb/JFCmKCwpDDQ9WVQknCTUin+nXx74UHUADyeViT2aqEVzBG
	Q7JMhlzQ7YzC6UDG8px9u63lQN49MC3dPpDYqPBvcrjPTJk55MEehMwHXAzHE6ak4O0=
X-Gm-Gg: AYBFou1a/8sKBvAD/yQkI3VIolvrY+UgKmqTN5zkNhlWUQOlw9RfyK/NzaVeGusTamW
	gNPj4NVjak/HeE1hllTdGUh7sm4xhglEYcRQE/axdMiKB/CZ0j4KhJLgRwLOXLWzUWKCsr6NGp1
	O02sM9CMSryRJfbFRmmm2SAx9f0Gkuf0OhHNSHdopudKxFeyDAKKyFZ14p9YGWFB69qAkTndGC/
	n2yV2M0pYveMpZ4LO+ksMW4MZb1nvNg9/XNTubbYMbMKyLR83RAbg31xdwJUMIJ0mSij9KltAmw
	4bjv2mHR3bGkZW2lhaRpjZKK2i/xYTm9RHtsvk8zrzfyM7QsykjjaodlGf7w3c3QuQmjdiTgRcS
	izd0Y8tzEw/H8mFdKy2p1KskRaaf63XD0FKr8SYbs98tnxa+WD3vvKp5+b5zYZC+Vpx6D4patWe
	OxRr1sls8Zr7VuexvQK1O601xfLr0myNnxvVZQj0ORnBbvgmkXTYiuQmIInWL7zGaya8vB2DtiE
	yqIwmtvi1GFWvzL
X-Received: by 2002:a05:6820:3411:10b0:6ba:5d2e:cdbc with SMTP id 006d021491bc7-6c0b9d4e352mr11117155eaf.7.1789320230280;
        Sun, 13 Sep 2026 10:23:50 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::b712? ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8bc8884sm6899818fac.10.2026.09.13.10.23.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 10:23:48 -0700 (PDT)
Message-ID: <2ac704f5-40e5-4212-8b16-6b23912ef4b8@gmail.com>
Date: Sun, 13 Sep 2026 12:23:46 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Novatek NT51021 DSI panel IC driver
To: Nickolay Goppen <setotau@mainlining.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexey Minnekhanov <alexeymin@minlexx.ru>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260913-qcom-novatek-nt51021-panels-v3-0-266bc5d7e8c9@mainlining.org>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20260913-qcom-novatek-nt51021-panels-v3-0-266bc5d7e8c9@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Tested-by: Ryan Brue <ryanbrue.dev@gmail.com> # Amazon Fire HD 10 
(2017), boe,tv101wum-nm0

On the CABC teardown for the nm0 variant that Sashiko found: the write 
is a single DSI generic command to the panel IC just before it is 
powered off, so there is nothing on I2C for it to collide with (the 
LP8557 backlight is a different device and is already off by then). On 
the Fire HD 10 the full disable/unprepare then prepare/enable path runs 
on every DPMS cycle and system suspend, and the panel comes back cleanly 
every time. Skipping the call for variants that never turn CABC on would 
be tidier, though, and I am fine either way; I'll let it be your call 
Nickolay. Thanks for pulling in my patches!
