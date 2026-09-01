Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3A235E930
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 06:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788244171; cv=pass; b=UWuYCfFGPGJQ9GLUlyLw2rwZJeDF1JAx/Yxon6w0XIjGg7SCBY4b9ceGBQYtWbbNgVsM2uC6+viTFXuIJiq+FPXi9TrXilPWn7ByVJNzb3YRmFIyQ+dYkZJtTFkj33U75YqQxHzH5K9rJLMQ9WOSmjz50eGB+gUlKtqmuupvDaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788244171; c=relaxed/simple;
	bh=K4gZl2mOhHoZykPR7kAcqsDmqgMqQEWtRL2LJIdoA/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qJ0ES1Vnx46C1fD8EhpTYW//4NLXkTxI+o/Dd0zGgqhdHW8wDGSYW3z+xeqBp2nHLBWqpYEckD7kQ9GgCTzCTwaNUnxKFJCxiKII+1Umbe2r175u/c2FwO94O6ntEIrgJYo2zOGEuYG2i5GymXfVp5ME/dZauXm7rswCyXCvcGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fo2YkDhp; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fo2YkDhp"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c197e7e4e94so652688066b.2
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 23:29:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788244168; cv=none;
        d=google.com; s=arc-20260327;
        b=qzX9QR4IQbI+GY6pFh9HKr/nguLABeaqq6Bx5Gi8Hfs1xm2i/0XJiRcgmGtiT0p+oG
         sw0+TvY93ACNEVJ7mhKh6MSwMS6rnb69dB2VjSQ5AFAjjB3+F38ECFJaJ6m8cFxLMdqp
         CHxy/Nn9ci+23neVbd0A0wPxUul3Zrd/2vxWYmCMZi9CCgST7RTFS/snFvAlLVV9rjU0
         I7BhZTxgNF+CwYNfX648zE/LlCNOkvxN0XVdDd2wFMlPfarK8IemHudkY+iWA6kDM76k
         E48cGD1SGLLmH+3HeyG0Um/1V30dEDrF6ClS3gn1xl3j0p84YDxLSNN2ZoQpYb0cL1Lp
         hdcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bEEZ7fL9N/fBrtWdluD5mbU6vgaXF6Tfc86ggJbNVK8=;
        fh=gzMpCBKh3inioI/O4Ow3V+oozO4m+yIFJMUki1SaG44=;
        b=lLxM1aQzrQkx6bgCFNwkf20rw1YgyQ/gwnK5mhbEQrMQmPTtyxv0Mht4a/x2pNmDNh
         BDDFOm4U9NIu9+3+laa5xbbeyaQilmXQE3MeTKO9jqCzxX0w3GxF5LdVxOBgROnDw9qI
         /jxnznNd8kCOjIXx6D/G4sW3DpEHMGp6ouw5Pm8Yx2ClSGZCeQeywukf4KJ/4mcVpAms
         07f6Y5CSSBCnzzFbxK66gWM6Rp+vF2gF3jRRi1vxY/mxjrnGRpGkEuvE7OqdQWyzIzkq
         bfSRGb92C9Uq0qiYsYO4/qSuPaXPhCoWh8+3RFrQmO+dLZNTwKjNzGWFPQk4Mjh4h+S2
         Amjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788244168; x=1788848968; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bEEZ7fL9N/fBrtWdluD5mbU6vgaXF6Tfc86ggJbNVK8=;
        b=fo2YkDhpZfxnKAqDT/bIy7kMg93snOkQDUV43O92bP0KQucf0Osu7oMJS8xxDHP0po
         l8n8P2OyJog9TnxTt81NEDyUHmfJNfcliJBUagjOMFxSzHS3ThrxqxkwvtQ0TnNrAgnK
         jggJtVqkFrof6Xxl7LcbB+3MTbyUUS+MvE/9L7xCgHNzENOW8FXaiQ8ZNwoIW1Xif7IR
         3kPnIImwhJ/gHGDpA4Zqess+K0herU91/6dvhXk/OY23YasMNDhMTcxgjMZUoX8J5nY2
         C+j05AhCZlMRPXoSS8kJTXsPrZKcKRw3WVRFRCvJIigMc6G1p0LMLFegwLrQPkaHlXrY
         ewgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788244168; x=1788848968;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bEEZ7fL9N/fBrtWdluD5mbU6vgaXF6Tfc86ggJbNVK8=;
        b=gQOGbwqVT4kFM7p1MzXJ9Syv9hO8lbNKrmlWe9gowcUUmlzn0o4Hr2eXTAMK6rqoaO
         SWIsK5F3tyj3l8biTlHygYWyuZ0UDLafCSOUcNxGEBadj1dQAOhnC4vuxwvvT5OeguvX
         CwDRabbZoMgiCSf6ksdFQalDTq/uJ+w6QxV5St4OAwRA46azj6ybOMiE9rt48hG8m4i+
         sAxwjsrfKlk8AJCHV4G3v3sN5u4ceTjtQqctmKFtHpqEytfWqCOLIapWTZ2CtMbDOc3V
         or5DWWuRNI0jF/awjjtUqQtwz5KIU+LHGOllampXpDUwX0HSefGhPAfJ6Oe0FjxU0r79
         NhAQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrhgl7ncnwUckj5PF4Ljip41FDs2x0qmGtIERkc9ZIGpEDEyR+TFK6QUmJ0UnNoqEHrcQAN2rneJFRI@vger.kernel.org
X-Gm-Message-State: AFuF++lnJ4lGXzkKMQpwlUKquklBy9sjeFlNDK7GaXKFkQkdjDoh5uRC
	aNR870aXCsifQH0EFjKa9N7ZqIshbmquL4f91iU8VGLrAD9UPFrklo2WUGn9D6o4AklKO7735Jm
	cjOW3f0gKdJRuTwS/o7tFJ6L0SPPhO/M=
X-Gm-Gg: AR+sD11XbzQwujCpDNAMRBqvBkwO8XRgoVrz93N906t4LMieW4Kroe1N6wy387Rquha
	hL96HndgMN19VDqhLNWymKfnMM/aK7utfj39OMUc0CefozUkK/UuNAUKVf6338X2aECp/ntaN5B
	WldymMjBlPbLbLBUVTduWKUMG2Zc2asGdAUyxL/G35eUQIIM4IOEEEsBw9dW5eaGCq0E5L9HFi1
	Qoy5YrXV7AUpd2fc5rZHm8ghOJh9vFEcW7QuD9/QATmUSOHDFptVcvaGyaiCP5IIMnaJxQVFK3z
	Dp+08X0CxiJqAMGyXKePuW+6espwCz5TBFNfWXC4eloXmEbkRHbPNS/huGi8kdUjR+FdYuR98aF
	dqA==
X-Received: by 2002:a17:907:7b84:b0:c21:72b:dec0 with SMTP id
 a640c23a62f3a-c2556c61d62mr1936956666b.5.1788244168036; Mon, 31 Aug 2026
 23:29:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824150156.1310-1-sreeshankar0910@gmail.com> <178822856275.1835959.3848131517961346933.b4-ty@kernel.org>
In-Reply-To: <178822856275.1835959.3848131517961346933.b4-ty@kernel.org>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Tue, 1 Sep 2026 11:59:21 +0530
X-Gm-Features: AcwNN1UlOPMwx9DB7E6Z2-eTZ4gj_ZRRlYulJwE9lf5s7b-4tAwIra4YOS7pijs
Message-ID: <CAA-+ukLy9CoENCEnQ0hHGzzHTw3d-aZZfT3H2o7x8_cmo9dkJA@mail.gmail.com>
Subject: Re: (subset) [PATCH v6 00/13] Add initial support for Qualcomm SM7250 SoC
To: Bjorn Andersson <andersson@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, rafael@kernel.org, 
	viresh.kumar@linaro.org, konradybcio@kernel.org, tglx@kernel.org, 
	ulfh@kernel.org, bmasney@redhat.com, radu@rendec.net, 
	abel.vesa@oss.qualcomm.com, lpieralisi@kernel.org, 
	taniya.das@oss.qualcomm.com, danila@mainlining.org, davidwronek@gmail.com, 
	mani@kernel.org, robimarko@gmail.com, linux@gurudas.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Sept 2026 at 07:39, Bjorn Andersson <andersson@kernel.org> wrote:
>
>
> On Mon, 24 Aug 2026 15:01:43 +0000, Sreeshankar K wrote:
> > This patchset introduces foundational upstream support for the Qualcomm SM7250
> > SoC (internally codenamed Lito).
> >
> > SM7250 is an ARMv8.2-A platform manufactured on a 7nm process, featuring an
> > octa-core Kryo 475 CPU configuration (1x Prime Cortex-A76, 1x Gold Cortex-A76,
> > and 6x Silver Cortex-A55) and Adreno 620 GPU.
> >
> > [...]
>
> Applied, thanks!
>
> [09/13] dt-bindings: arm: cpus: Document Kryo 475 CPUs
>         commit: 1c8fe8863780705aba77893fade65f728e82b67a
>
> Best regards,
> --
> Bjorn Andersson <andersson@kernel.org>

Thanks,
Sreeshankar K
