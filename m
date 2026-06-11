Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AAE30E82D
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781155698; cv=none; b=ZEIBjYtuMZf7d+OE7adG/7HO3sIkTt6ApeYwNiVNqeGIqZAK4QeXmRKD3/74r/CrzsMVyuQet2HGp+90g8aVQagG1p8bKVnKExLv3xQ5n/7M3+u+zdeuKH5elUbz8M/jr34jAxAgNdjr9HZalm3P45KUtz0pOtK9r3l2+rdt0H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781155698; c=relaxed/simple;
	bh=srCfoqp9U9yI2rLTI9MgheuutKivBbQGCzEHuc+LBc8=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=t7qD4HjMFG5TN7Az7kiNMPpouScUZ0D9zENMpAjc1fjWu85JDpuAoDfcxeCTerpYrih5Cg4zgOH483BhkM92Ujq537gYOpaYHLsvzvPIJPcJ/J1/P0Z/Z3zz0wHaDNDoriBBLu1awOsLMz7N0daCpHwC91nXyJoAK0BRPVz1mt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AohMR09a; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AohMR09a"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-36d630c0e35so8028741a91.3
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 22:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781155693; x=1781760493; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gsRiWOtrhmLQhSwDTt/EB1kdzkedDtA7OBAUiNrmwW4=;
        b=AohMR09agjDnquSjuZpak+Q2CVn2CcvF0XRLeTvwL2kAlrJGOPTxf7m3rsDmffOalv
         3obUxVw/DC6k3iX7O3ouMbn0BDY/oWFn5noQ4W5wJgOi8TByRaI6wDsSVtXdyaPJR/ni
         lFjpJWFlj9MT5Jl2fqu3tp/qKt6IYiHXN+dtuDufSv/o3g7B1+3e6iFPMymBk4cveXXg
         DVHdMKoc2YS9Omz6vlRinx+JQyizPo7dQgiAHjHhK97bTT/FgqOKZqE4o2whwWGG/EJ/
         ToL/Ffak+MfZ6ljtnj8mGlirG8lRKKxqUVWxRoqWzM6gXE9c2hJCS9Buny/AivGgKWRG
         niAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781155693; x=1781760493;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gsRiWOtrhmLQhSwDTt/EB1kdzkedDtA7OBAUiNrmwW4=;
        b=H5xPA/JybiTBk0a9kscBh2qkcHqvdJHtlqYpySMvmj0ke4Wafn+5gycxDX3aIK8R8b
         WFw4KknOa82VXRcKgU7v3Q+KrUN+VRRzIPjD2xgmoBTFdKAd42mlXnFHrVS5xljgDPsQ
         tcGJVf3f5rpsV0v82kq4eCL3fst1gy5qgqFsm8tcNFul/3qTPNO8mMa+BPyuxrYJG69y
         JRJL/9AtcXNLUajVSyeFj7k03BEKKQVrGBnjcKzt7KySeSamAGbOloHXHdq5Lmmn4B5D
         TmZuc7+G9bd++f9xfo5T0ajyO+fiCA9cNUxaiev4HsTz/bBS+vN95FsXXEratybmCBeY
         krNw==
X-Forwarded-Encrypted: i=1; AFNElJ+nFE6tHrV6f4DTb97UoU6xz5iwl0CvsOBowR2RvYPr/bgwGphC4YCrkOcFlKloZ8dZLmCqrTdp/cgt@vger.kernel.org
X-Gm-Message-State: AOJu0YxhkbV1cxZGZdQXAK22XfjoAxASbH21EIc9E+Fg9WfL4o2IR/ns
	dtHBGCMD3ePlX0lGHQ15yRryafxN+fKFtkYwBwootJw/LQ4e2JBLZFL2fjzj8eVyRXSYVA==
X-Gm-Gg: Acq92OH1UyecaO8mU5/aPwbmMweUMDB9dPUdh9gNvPvUmcC4R21eLjZFgoY+XZV80nh
	Q/Hz3BxCllF8Tword+tQ9Rb/2OQ4ZozrOQ/kFNcT/6QqkbGF4s4bOTJqUgEQZexbNl0jminx/Pc
	CMK1ln3KJW3XybmzFSHw3xUbui1g2E/PzZGIrj7xr4gJB4IXVrw/b62Sl8xHok/QKYAPP4W+6TW
	t7AVzaiE6S1teVz+pdI5PBQuSyD+4n/Yz9JJrLDOAw2bppuXhJyHnThDzRL0PMS10VYIRzyu3Ph
	+3zxiint5SWpRZWn0GBfXeP98xJjPitizGSISat1DUglmAAWMiHLkwz8wTXb7gEwggX40cnPGhe
	DJKR/qvE0JH40We5Xvy2CmRz8g4PVrpgSvz2JiX4bi64TbwzGF3NJtaZco2Kntx13cvT/KcqYEI
	rMb1VqYkZLn+M/z0r30gs0Vvx/DS9ctzlJF/sIHlZHCfhhGg==
X-Received: by 2002:a17:90b:4acb:b0:368:7c0f:ebf7 with SMTP id 98e67ed59e1d1-377a73e2750mr1577907a91.16.1781155693118;
        Wed, 10 Jun 2026 22:28:13 -0700 (PDT)
Received: from [10.188.227.203] ([2408:844f:2361:d7cd:deb7:4e0e:26d0:4076])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-377522a1a9esm1144589a91.4.2026.06.10.22.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:28:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/3] dt-bindings: display: panel: himax,hx83121a: add
 optional bl supply
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Pengyu Luo <mitltlatltl@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260608162622.403713-1-zhengxingda@iscas.ac.cn>
References: <20260608162622.403713-1-zhengxingda@iscas.ac.cn>
Date: Thu, 11 Jun 2026 13:26:47 +0800
Message-Id: <178115560756.199930.11183711627429440356.b4-review@b4>
X-Mailer: b4 0.15.2

On Tue, 09 Jun 2026 00:26:20 +0800, Icenowy Zheng <zhengxingda@iscas.ac.cn> wrote:
> When the backlight is managed by the panel controller IC, an external
> power rail might be powering the backlight.
> 
> Add an optional `bl-supply` property to describe such power rail, thus
> allow disabling the backlight.
> 

Please add it as a hwen pin, this will simplify your code later.

>
>
> diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83121a.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83121a.yaml
> index e067a2f6d0b2..aeca3c9a599c 100644
> --- a/Documentation/devicetree/bindings/display/panel/himax,hx83121a.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/himax,hx83121a.yaml
> @@ -40,6 +40,9 @@ properties:
>    vddi-supply:
>      description: power supply for IC
>  
> +  bl-supply:
> +    description: power supply for backlight, in case it's managed via DSC
> +

s/DSC/DCS/

Best wishes,
Pengyu

-- 
Best wishes,
Pengyu

