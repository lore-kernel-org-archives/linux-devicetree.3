Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D243749EE
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 19:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783020743; cv=none; b=Ovez6oDAU6djMSwE98+Kn9NsG3pdaJ3SR6vuWsVcslLzYPUKirfvpoZY+tTBlRy1YW9tX/75K9mDjD9Q6zfe1jItldXdmrZ8HygqPZMBo2gBAggtvjOTK0bnNzzrTCH/iE5HNU2ZgOHAmFDK2ZM5KsfeheOHy+TeDPzB92nxpmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783020743; c=relaxed/simple;
	bh=Y3myU6PC6Y/+0AUV070w4T/IlmTKT4MrSxy6LSocXzY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SoU9EUKurPy61wjjWRDBPTZ5QPcyHTe09XdTBjZfLv3CbQlgqXVwTxE7a3ZVF9XEL+y8fVpFWBtwt5Zen0sWoZa0D0Jd8q9xEIqzAzLPQXVh5r2gcv2m26m0UrfUm/UpR+z7yJOyS8Btup5o02l+BDVNNLccQw8kLwblGJf0FMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R65Mr14a; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R65Mr14a"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-474303f3c72so1398560f8f.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 12:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783020739; x=1783625539; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7qgcEW/wpSAcIIpifYaO2mjjD/biPw57/pk0Dft8EAU=;
        b=R65Mr14aYPfKyxSUm1zLBhaYQf6Yj6CoLwN/32NCIhC/Rg/tcq/SL5MK5Mhp5NH/qM
         Tj/3Zgu2h2qpWY3s4yIe/y4GEwa0OeY9ma95KlNIvlWJLVw2/d4nQJzP3OWtSVbDDabM
         /uz5pwT0bKKt3MWqs9Hi/dM4rfP4UMlYmXUgYDK6vn0uPrs11tNTA3tbzD+f1Sc3vw+f
         TCZHpXlYl2KQrvUfOxrcDMWek8gNTI9xmNgHc0votNwoKHyHlsCnHzzVNSxXhYZqx3d6
         xdyWM0EbG6vklvg6p5U4X8axAwUYbgprWUAD/3aK+GaEqFJPGB6QAWgsWxWBaA/ZWVMC
         +s/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783020739; x=1783625539;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7qgcEW/wpSAcIIpifYaO2mjjD/biPw57/pk0Dft8EAU=;
        b=ADS7Gcf4kbMbyMUlZklJBsN8l3dw3UJl0xnfEfqxIn+nQlRVv+R/OK7cSVhPYpqMJs
         RTyJAijOwarFLenoUC7/uxSFXk61L7yqSDtNz7afynjPhK3EU/kqKsW4sXX8zm0YYG/N
         l3625P3BLKnwCwFU2mB9bZPzC1zUWik264Al6jzCT/uBcxeDRxVkuvanck3pxPv9uGOm
         4R/xiWC3y0BgbtBBIVMNRHi6LakDemGERs8Xm6pytcynF3XoIABsq6xU9w9BJt8dBiAn
         JW0p70/RtX26WhDoeYf3q1Jjk+hjKmrPg2gqdX49Ws4ory4qkO9lRXeHAOWOY21dIX+J
         WTEQ==
X-Forwarded-Encrypted: i=1; AHgh+RpPsqxMDBV1Wk6gQn2hJtE4WDkvDQ7fhO3AvnJycnC3Z61L8FSkUOAy4e+u2IzcsMVW28Uw1d2nBxxf@vger.kernel.org
X-Gm-Message-State: AOJu0YymQtaCXhbFIr8SkK3RSRLFtMUt5StFe/AMmzwpSvIsMH/hl8UG
	KvT9krEHT5q97jdr8dKFA9aCF+OWEbm4KO4q/P2d8D+ukCTrOVtCAEv1
X-Gm-Gg: AfdE7cmVtMySAhXYJWVim4yB26jXrd4sZLBEQHYyinvnh4UvOyvDthAFszsMIHwqaPY
	tCc6gcRpFjzNK9il+aAj2lHQexjoVzqRfzucrahUqc5nVXYRJe8ZCQRvBEUkqyZWpfM9rm7nOqg
	SSjNDlHjbzWHESU27MUdEHz/NIZabQXGrpMOcGgZwuOTUa+zsKOAqrhWivZQz/UP8EhiDZh44bQ
	EH4xbXUe2jk5HSwrTEv+txQFCXN0g+HBDOOA1XlX9YaRBYKywTSMOn5NpCeYnhXOpRFgBsPCCuI
	H2XZcT4TTkRFlnwSZdGhihM9Lnq+OsF44sX/j8ddEVijy6/iY9m7GnEOiRyhrsjQF0gfPuqKCSo
	sk2HbIBQ3YvBOyjkkKC+OLkGT3TECwUfd2GNyN0YwC3gMoj416nduIay2yB0AnYYbrBCyfH6fIF
	xowcEKklH+7JkOejQlFMVPuOM1PK369nayaLZ0V2peMCwcNXlC8Lrdu0luR3VlSbUWWFAIdfQZR
	VjkilnZ
X-Received: by 2002:adf:e00b:0:20b0:475:3a97:8e47 with SMTP id ffacd0b85a97d-4775918fa48mr8502412f8f.29.1783020738996;
        Thu, 02 Jul 2026 12:32:18 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477dd94ce4csm12070471f8f.17.2026.07.02.12.32.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 12:32:17 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <a0cee001-7bca-438a-943b-da28528e7df7@gmail.com>
Date: Thu, 2 Jul 2026 20:32:16 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] HID: apple: Add DockChannel HID transport driver
To: michael.reeves077@gmail.com, Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 iommu@lists.linux.dev, linux-input@vger.kernel.org
References: <20260630-apple-mtp-keyboard-final-v1-0-506d936a1707@gmail.com>
 <20260630-apple-mtp-keyboard-final-v1-8-506d936a1707@gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260630-apple-mtp-keyboard-final-v1-8-506d936a1707@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Michael,

On 6/30/26 13:54, Michael Reeves via B4 Relay wrote:
> +source "drivers/hid/dockchannel/Kconfig"
> +
>  endif # HID
>  

> +++ b/drivers/hid/dockchannel/Kconfig
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR MIT
> +
> +config APPLE_DOCKCHANNEL_HID
> +	tristate "HID over Apple DockChannel"
> +	depends on APPLE_DOCKCHANNEL
> +	depends on APPLE_RTKIT
> +	depends on HID

APPLE_DOCKCHANNEL_HID has a duplicate dependency on HID,
since you put the import for this file inside of 'if HID..endif',
and then also gave it a 'depends on HID'.

- Julian Braha
