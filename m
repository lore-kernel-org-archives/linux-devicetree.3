Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CD630F7FB
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 05:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775022785; cv=none; b=ZfvFJJ1HZkJ/W/2sVlCIzjLRK09podSeDUd11wFRoC0b3QeK9jo3YwBJu2ydVDyg82vlKHuZg7qFFtoVy1JCizEn3qDj0PG1H5mb7o6p4yucHAqRioCYOdLAjpQPXI2lDrUyiHp9q3PWsJKQjzt1lFQRr+OtLo9N770Byb6ucks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775022785; c=relaxed/simple;
	bh=vn+Whyqndr9lPTR+5c+7GGHj6JO+k6GBr1ThCNEZSec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EgrKwlaLKAQ4i/9g6MsAa5SzY9g/pQSIHK24fhaRLWmUiRbS6rjVFiuSF7n7wKFPxtGzfsdMqjBJfM88pFLDFkNNWMp7H6EM4SdNJ526+Z2h8+q9PdVHCffF9y9gevAUvEchmWR+rBCvww/vuXiTWQGFfr/5PhXbJYnQ7RJR9IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HejP+3xA; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HejP+3xA"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-486fe655187so84036155e9.2
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 22:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775022783; x=1775627583; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=INcc211bG9FjWsZ9dybz2/l2jRpAaGE+SI/LHykHcTQ=;
        b=HejP+3xAkMpVkd3w72H84ARFeSnZUys4TU0wTI2asHqDbjLQv8Sl/Q0X6zW0PFgFcv
         +SGNYMCSM2h2h6QjWwYKqAz5oIZILR8nguy9LE4Hk3NMUzdUlxlIZC+xZd9nsXgNqQ1l
         r/vNTNLjSH4XRxs7rgMvQJAjp8SddCH+kW05pAqPBc4GEKK4JZBvTJzbV6U+qG3pdEtn
         9FtscbDlVH5WBsdUHOoZI8epL+AMEQr3oGmUN4vQXTfztpCtkMmUUkgAtkU24HyUQHS2
         B11o/dG2+TUMxszaD1mYGO+xPNZU7VoFUwFB1wY/zrtLTDFLZgpdVYgtJ60Bb14aO4F4
         uxaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775022783; x=1775627583;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=INcc211bG9FjWsZ9dybz2/l2jRpAaGE+SI/LHykHcTQ=;
        b=sQXZg24x1/GU93aMfozZnNnBoKhtQsgPqSh3aS3AqM8pjJNhs9UlVE5n+Lx9Di1Gxu
         00E3iO8bEU2+LR5piy0JAys56Q7hgonxkN1O3WVrBN2BQ1sBqh7+f/lZSp99PkpzRKrV
         BVHmkPAA72xBS4k0c8VNcasaJ0//vnQFN6A79waWg2Wxz4WI6ELOH10mId2oACcBygA/
         POwqgpDTeBhJZC/Myxq+zoVOWczicNyEJDJK31C8dZ2CJToPcqFKX7tLFb1drxQhvMkb
         Zi8yMURmv53FAkcJBXwIPQVWNOtYcWIKCm/2v3YFyaf6iNZMKmMrEhaDxbMEUmkfNzlq
         6vPw==
X-Forwarded-Encrypted: i=1; AJvYcCUzmgC8F0TdGgNX0/RNc4mpIug3afOf26Wb+Lku68HJZ28mEMOJpINeTHK3vrC7ptSwbhc0mZzcM6Pk@vger.kernel.org
X-Gm-Message-State: AOJu0YzlSoSZFK3MD54mstuKb1bMMgBgGQ3QdmC7DvpEhBNWvF90LK7w
	t+jHEeGh8DvPw9kMB2kB56S4B8Z20Xyr964HJUYrxX8VIUybRxU7UKUd
X-Gm-Gg: ATEYQzzzfdKSIw4/vAUP+5Bc8yeU25wyKvusX1c67WlnJRmaomodyA87CZX4p9HAkYS
	EYAwnQn9B4gv6L2LMtGPLwL4wt+AvrtGmPhoR2Eo/oYhRVLq2KGNEhuRZ9J8af/kSSNb2i5OVmt
	T4qWblOmGPCgkSgJBDEyyMmTaxOOgH9ft1hp5byWZ826XwhHMTNxdxW84sBZMzu11NMuE0XKKoH
	yc8vGQfMDy4U7ZFX34hTodPCNPluxqSYKTO3VCKS4DIyn4xq116pl47WjItxeLfBTKvBTSysejE
	3t49yffzNr5i8VaPujMfqorWtzpOfSAyhYYoDrzMdMApgnjST50NmoQ+woylVCwnrTIcBydkoJ1
	INBGGPIKotNNpmGfMHq32kChKsY8PMd16J9EmB8GtPLa3wp3GT04oDhv7kt+7kcBZo1layizefp
	hcFgz6MzAI2OF9qLgke237kEJJSCCd
X-Received: by 2002:a05:600c:468b:b0:480:1d0b:2d32 with SMTP id 5b1f17b1804b1-4888356275bmr32683845e9.12.1775022782457;
        Tue, 31 Mar 2026 22:53:02 -0700 (PDT)
Received: from [172.25.98.130] ([5.2.194.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c8ee2d3sm34684675e9.32.2026.03.31.22.53.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 22:53:02 -0700 (PDT)
Message-ID: <8e8acf76-2101-4566-ad09-ce32b6f51e94@gmail.com>
Date: Wed, 1 Apr 2026 08:52:59 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/21] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: "Dayananda, Vivekananda" <vivekananda.dayananda@amd.com>,
 "dumitru.ceclan@analog.com" <dumitru.ceclan@analog.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 "martin.hecht@avnet.eu" <martin.hecht@avnet.eu>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Cosmin Tanislav <demonsingur@gmail.com>, Cory Keitz <ckeitz@amazon.com>
References: <20260311-gmsl2-3_serdes-v9-0-41499f09004f@analog.com>
 <MW4PR12MB566835A0D88DAA21D6642832E856A@MW4PR12MB5668.namprd12.prod.outlook.com>
 <86a96690-1307-4a6f-8265-1d6d30ce6d6c@gmail.com>
 <MW4PR12MB56682D24FB2D7B1EF2D53B78E853A@MW4PR12MB5668.namprd12.prod.outlook.com>
Content-Language: en-US
From: Ceclan Dumitru <mitrutzceclan@gmail.com>
In-Reply-To: <MW4PR12MB56682D24FB2D7B1EF2D53B78E853A@MW4PR12MB5668.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/31/26 8:43 PM, Dayananda, Vivekananda wrote:
> [Public]
> 
> There is one other patch that is required in addition, which enables the remote-control channel links from port 1 using REG3. Adding the patch below
> ----
> From 36936732c6ecd599f1a26744bef3031e41194229 Mon Sep 17 00:00:00 2001
> From: Vivekananda Dayananda <vivekana@amd.com>
> Date: Tue, 31 Mar 2026 08:12:20 -0700
> Subject: [PATCH] media: i2c: maxim-serdes: max96724: allow selecting CC port
> 
> Add a DT property that lets platforms choose which control-channel port the MAX96724 exposes to the upstream I2C host. Document the new property for the MAX96724 compatibles and default to port 0 so existing device trees retain their behaviour.
> 
> The driver caches the chosen port and reprograms register 0x03 after every reset, restoring control-channel access regardless of whether the deserializer was power-cycled. Boards that need to talk through port 1 can now opt in by setting "maxim,control-channel-port = <1>;" in the device tree.
> 
> Signed-off-by: Vivekananda Dayananda <vivekana@amd.com>
> ---

[...]

Thank you, will be included in V10. I'll await first confirmation from
Sakari that the failing v4l2 compliance tests do not make sense for
serdes like I've considered.
