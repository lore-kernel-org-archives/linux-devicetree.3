Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997F233F38B
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 17:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775583160; cv=none; b=beVaBkd9o0dGWh+jstti3jzNGtW6JzkDq/b1cz8xJHalVqMT9UlOn8ry4+TpSdigh9+7keEiKBHHwEqtt8/KzDANFdzVVqUKzefU68+oOpSuxe72wbJXRuZd+wDDN1t6x5GllGbTE4zOARDgeH7Udll23KFOycsmds0fHmvu7LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775583160; c=relaxed/simple;
	bh=96IxDbYipWYISMVgppXL6FngvjfItqxe5eExWZvHusY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DxSZUt1qoWURglBVpcBK4EAi2WdPCTKNE0VhuFCDYk3b8oBE6dmMkZMrTuhaXZtF91n4EVTZbSDNWNRUiezViw5WLOrd9FbIS47BG4ToVbtRCuGjKirNoGCUJ+j3kN5uxWx6qyR5oW/LDZWLPD5NDFUGin+6mHSYHmtJDEnliqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yx5zLUD0; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yx5zLUD0"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35d971fbcddso82326a91.1
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 10:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775583159; x=1776187959; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DmBs1pC2+g4fvvLGZVFgA2jNmZXb31c2twmWE1SEdkI=;
        b=Yx5zLUD0D98VSchcM5q0WsiF43qX7a/WVj24nEDg7+n377PgxJ8au5Xo109o3GNTol
         mhAoR6lkXuTkOUNcMOuCqXQv8s7FYOnlFBsKKuqG9jsHD7qKWUES6Gnw0Lw8S3kK6lIB
         8fHY3SGV0HZO0zClvzq1JHeh5ATov+jV2Ohh1l3NM9NcuTvUMAWlIfdUiyJcBVPL2zgR
         QWg2KMst/aeld5RViaoa8TFTWLuE0yn4ExAu38/D39+puW20hNzidBl7BHjG1u2t1yjy
         /Ge8vKiyg8ipp5lIU2nEWdSkfGuo8NMR+yEWDXOOsM2uOXfm7FjAZG0L4IGo4onJLwTJ
         myBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775583159; x=1776187959;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DmBs1pC2+g4fvvLGZVFgA2jNmZXb31c2twmWE1SEdkI=;
        b=bAR01lUl/cBq7lolKnJuiOkBaevmbJIMimK1OKBsidLrHCnskDuRLa0Iw5vHQji32R
         DIO5r3lejb8XAPJM8Kv0yqfzpYU7kKULdyYJ48MfURV/PZByAJuEDZrHWM45MS86IzTB
         PZzRJPsdJkm3sICmKpPlmMIMugh4FRz81bVqcw5xIX6V3sNQ4ORFjHRd4m+lTMOq3aoy
         f/ttTScRc6J28j9pOMXsP9ZhTzefZGE40I8aKXKbeJTyZJXwKUsLC4FU/xkghJjddAeQ
         Xnv2nwwVA9xKZ5OTHCO9w9ZJVgSwVfTJ7IeK7ucn3wGiuYRLr1uYVviTLxKJpW+0lfTA
         DOQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXc1Xy/4rFMazhVIukQcYeY79b/ZiWOAODmAW0ux9nM5z2RqfZ2THH5aj4NHgZuFJbrA7NHIPpmyjXQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzT8zcIFDLRpuRSGcEjnP64HiKyVYz77KC+yMZCAuysuehQAGm5
	eHtJLSoXPxGOhaihHjD9TisMi1cOsNvG1UOF0lZMbqZI05RqNWBLlVH1
X-Gm-Gg: AeBDies/RBG/FLI9Hm7bbMUsLGQALmGCHq9XuXEhdp+uWF4SXHTC9a0hDnG6JWYtGEx
	36fCvowvVXmrckx0A19uyRajtZvYcicBmAobr4Fad1SuJQLZPexZFmIW49sCRVq2r4YCylDh0M0
	zRfoHTbNFYMlnfBUFgBeJqGwqqwinqEwjuLj8ta9i83j8y5r1AmrGsg+acNnLPhbwxIcSAtfJcM
	UOndHngsgijPHsjJ+rzM1uNL6yKx4LbeXAURmNXK8smPNtmEjB5SICpvceY6eWckAteIggR93+8
	yeMfOn6MkzVB3RJVDE3fK6o+pIdOVL0g4Y1G5ZyICm7KbzktCn3rwXTy5cmFGbnyKcjPSsAUb8n
	SpzeDObohaBHXf4CLKD/yTtFe03MDjV9rIAwXJ+tL1UNWImTZL70XV/cMIgxLQgdR8ZrrME/OD6
	QD93PJ9p5WuPBKhI5P3RZLuHX9k6WKH1u0qrr2CmYHiB+qjs5IjQ==
X-Received: by 2002:a17:90b:2e46:b0:359:8957:7285 with SMTP id 98e67ed59e1d1-35de591e9bcmr14232090a91.3.1775583158886;
        Tue, 07 Apr 2026 10:32:38 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e27d255easm26902a91.5.2026.04.07.10.32.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 10:32:37 -0700 (PDT)
Message-ID: <1dd8324a-8cb8-43e2-9117-c52c37f1ad96@gmail.com>
Date: Tue, 7 Apr 2026 10:32:34 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: fpga: add binding for Technologic
 Systems TS-73xx FPGA
To: Phil Pemberton <philpem@philpem.me.uk>, Moritz Fischer <mdf@kernel.org>,
 Xu Yilun <yilun.xu@intel.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Tom Rix <trix@redhat.com>, linux-fpga@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260407172730.1779804-1-philpem@philpem.me.uk>
 <20260407172730.1779804-2-philpem@philpem.me.uk>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20260407172730.1779804-2-philpem@philpem.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/7/26 10:27, Phil Pemberton wrote:
> Add device tree binding documentation for the Altera Cyclone II FPGA
> found on Technologic Systems TS-7300 series boards, programmed via a
> CPLD memory-mapped interface.
> 
> Signed-off-by: Phil Pemberton <philpem@philpem.me.uk>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
