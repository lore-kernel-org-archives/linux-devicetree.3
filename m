Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795263091;
	b=pn2eQuW+WAAJBaIbxyAp9bK2fzXEiR/S45Dg7ihlJEsRWvqbIQADJDzWTgV8aVKsNRc/
	 TTAT1nDHDNCRKWrvcXxE2Um2w2sbBzQYHgUm4IATJfyq54Na2pIT5SVTb7x+j3HQiCh5n
	 iFeDgdPjrTwjBZVQ9/W3VBVLBo+CevggK33hv1kSDPOcyCey9cNkYpKSE93x8F7zGgk+8
	 Ym3TLbkGh2zoLeG1TUDCZyGY3FSruCrHYksLuS5l95akeQLBOTdCXn7f1jDq2BysffluB
	 t0p62R2qX2zIIK9iUwXmdqAE+TOw4bNBK4XUnCu7YFaMWoXcqoKxV/r5g/aAN5eMZaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795263091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uEZb922kTk9cPdYuJdRQn/n68pwJkacBa3uckuCCVJY=;
	b=dQeMhZtWcNasGUDRTASzH8WtSUji5l2WQ4Gkum4wuONKsLFWIVa5yEJ7XgV7IiBBoqrg
	 jZPWoIgd+I7j6cHXTvXyuvyHlAPt7pxyDYYzgLt19mnJI6yryQRLKZJ+duP+yLiiFFh0Q
	 yJVyoVz3ufT6j2nBJYTGqXgutRa+YPevHisD4qKVdKEA7azeIAa+7kwmLIT+mU2mBy9Gw
	 fwgv2il7ppRecOIah0WNR0yfoHPFh2PaZemNjDjOBLq2BWwr4PKrpOe24W811PVJKkd47
	 Jk51siWGWzBRNrAMDhmvnu5n2fyguk1R+oqSqBVfaVcdBD0wUTKuzeSbiZi2L0j4IUg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nztTc+aL;
	arc=fail smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C7E606A32C
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 12:11:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00C7E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nztTc+aL
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b360828905so15187057b3.2
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 04:11:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795263090; cv=none;
        d=google.com; s=arc-20260327;
        b=Gww8QQSqrOFq6b8PrK7do1O77sHiMnNTXpDxf0usfeXpHAeW18mDF/ewdRS/eGz8hS
         jW/CAy8Vm226/8TA1hXeKPlgknkE7nsXm6VJPEUuCinzu3P744s95X4fBIaTnuvhpWru
         fj2eCv440mY3C0tnQ/MHhUAfpMvLnYMoq3xWJBL1FBw+rCn5oUHwwtRMEsLGUYkEV2rE
         YmYAknJqzHm3IjlBZFPwgfwgWb3lCSB1WcZuu6p517k2Bb5vJMACgavP6G4V3dWPSUou
         sSNMF7RMKo6gpN0Huw0VVg7pNsaqYLzIbinP3uXcuchdq9o/3LN5wcung0RWsgJGPhFm
         Ey7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uEZb922kTk9cPdYuJdRQn/n68pwJkacBa3uckuCCVJY=;
        fh=bfZqXsrcs97U+eitAmWTRkUmb1uAVNyKiJjkSoy3Ebc=;
        b=oGOpoTO9mEeI8Yrk2+ZGF5Y0JmIjAIhTNPUSTsNb4pj2V8BDU8TQKGqzHm84dDrZCr
         aPv4zzg2JPr7lA1BNdLB/hkV7Gwn6y4HXtZ7rkcLd+2lkk4tG+tAaFZa2oJOX8EI1uwe
         4JAxEV/JRxZUVt5niUGLEtdMSjgvOM5JV+VwBMA2Bfb9rvoZ6jMa1zBgXRDrx9hAde5v
         HybXpk35ZROtwb3KY0SSTfsKc/KYvlV0RJOQsbm9bZbhOd38BToYRm8W/GZL7noW68dj
         ePQPIGylPZx+zz0LJlQA/0ulwpuhcJg2RbogWbfvUpGE6vFCrUGr8ubJ0w5eCTSwI98c
         kEzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795263090; x=1795867890; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uEZb922kTk9cPdYuJdRQn/n68pwJkacBa3uckuCCVJY=;
        b=nztTc+aL9u5WDXTPuo6C4enyM26FqftJYOIkjzZ8zL45kb9P4tzDdoVVY8ZgKp+InE
         R4VXhrgBRNRjU6Xc8iyYWd9Q5m6+4b/dPVK+jqkLC8VGYOr5VkCheS9rvztn46i+39hN
         yN0JJbe0ltAJQVCstH/8bfbxpsEQd6GmSqm2nOFZcLY4VsBZLzg/Ja3IZ9n8tmmAOdY4
         D/zXqn7pVbtXd/IWAufNzpWa970fGrxojsKUqlXLVd+5txEvabkLaVx/KRMxqbeOU7VG
         OkCOZ1sgZVziPAEWqct+UR15HwSFX+s2v445FeWnsLS/vxFe/ilpesRoFhzm3NYt1EOm
         uiqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795263090; x=1795867890;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uEZb922kTk9cPdYuJdRQn/n68pwJkacBa3uckuCCVJY=;
        b=JYr6hOOYlkMMCstR4FE/efynKm7pG+H9qs7k07a3c1uKkfoV4wKV/7LTzDcFgxaEPo
         wjgJUc1uRu9u4PIA/tytNdI6dHqdmQNKCEeHy+YwmraJL1p++0zSjQg2yI1mZ6eLLc9n
         nJCGkNpSk6lHOF9LnPBwbu+jEuYhoZyZzayZZ8tnmYu4m1fauaUoaAasKnJ8yPLmzYwM
         1HjMFCx0fm6vVzbqp6HOUDq6OHYabXXLXJF2aWL0LX9lf1xoqrfbWt/dN0CSayHkZWSm
         cZySWHct+kj44ux8KMqx7VhE23Tmu4pqWvMI912Sfg2yIj2XRJkLvHOUcNfccBXVcCtr
         LHJQ==
X-Forwarded-Encrypted: i=1; AL+hErEmK6u65fsGQcR7gp567BpgQu1gfXvIPEvJj5FT18dPDF72pVhSFbaVlpTHSnp8USG8w8++FrW53tH0@vger.kernel.org
X-Gm-Message-State: APuU4Z8G9Idbnn9VjjfKtvo/Oj/J56gPd1ZXIhnh5eMcMJWDYnVDQ70i
	MwexbHmH/JEh3S29aCwaWGjyZ54tc234UQAi/LgI78llis/MU2l3RNGvlmIQw1+DOJbrlt6Bkq9
	OR1Dk8TXj5RX5x2S8A21vY2Dpv43Dvi4=
X-Gm-Gg: AZFdTZc6ETtKhopaUhzEHVIyWtQF0dio73GqQpskWm3bl3t4o/B/gJqKG9/mdQe0axT
	ie+sMRzQmi/VOIgDyugjRz+qRAqvsxY1q/ouX+Ygb9gLpYexAnv8plX++EsB7rGdSw8oxgpxegN
	LdfYBUZtJ8g7AQqB0+pOCF6tFYDMlSXGx+h9yenFZupLqBRxG/ms4qlESnegF4y7VCeIA6aJqIf
	YTfl+fXQCnFAERwbOlpvETNw+vzPysPjbGssLJUNRL2qVVtDo+qfAtIHTRlxBGZk658xW0Wytd2
	h2C19H0EaIseY+j5tYAgCeJvUxZ7G8EuvdFOBXrAuadr97+lXMJ76tlzQ4iBePDn7jcTs9A2GE1
	/aQf2uSi5tqzNFsjYvnifxuYV6F13PJfLKfy3fsloY5ymKge03XnfhPSzU9r9ZGqvT9OhEyuBjk
	ZAXR0h2ZRLFVxRduWZHCjICFIkcw==
X-Received: by 2002:a05:690c:61c4:b0:8b3:5fd6:a544 with SMTP id
 00721157ae682-8b52047e1c1mr19674487b3.58.1795263089936; Sat, 21 Nov 2026
 04:11:29 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121-m3-cpufreq-opp-v1-0-42a0c07c48a4@gmail.com>
 <20261121-m3-cpufreq-opp-v1-4-42a0c07c48a4@gmail.com> <CANpmGNvd3Bnv58BQX3UcX5eOip5Q0DfmPhvPp_9DGRQQUWOqQg@mail.gmail.com>
In-Reply-To: <CANpmGNvd3Bnv58BQX3UcX5eOip5Q0DfmPhvPp_9DGRQQUWOqQg@mail.gmail.com>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Sat, 21 Nov 2026 23:11:18 +1100
X-Gm-Features: Aa3M54osrg6doytRUFLjK8s5YltogEr6ZngrwFO8UHAiCYiFQIm7-VCyERe-Cqo
Message-ID: <CANpmGNtfmk8QODQf9x7nkVSr8F+=8Hfh8GbKjCOnxvw3PXCTFw@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: apple: t6031: Add CPU frequency scaling
 and OPPs
To: michael.reeves077@gmail.com
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yureka Lilian <yureka@cyberchaos.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
On Sat, Nov 21, 2026 at 10:52=E2=80=AFPM Michael Reeves
<michael.reeves077@gmail.com> wrote:
> Oops, I accidentally forgot the capacity-dmips-mhz for these ones.
> It's just 1024 like all the others. Can you apply that when picking
> this up, or would you prefer I send v2?

To fix this and add proper T6032 die1 support (as suggested by Janne
in response to the cover) I will be sending a v2 shortly.

Thanks,
Michael
