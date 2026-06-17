Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C1233A9E8
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 17:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781716678; cv=none; b=sCmkQxU9mhcvcfb/YEHb5ncOUNMbrb80QuU1iuq4KZbxDXAV44e54f2Ptv6fQw/S+fT5qKBcifs+W952ZzPQp5hgxfGdvoo5KYa6OhBRlrcE9IaPtN7NoYL8tMAIPZmg+BXxMauTCi3pJl5BMjflkelaHsFB4IaU3kD/0A51cE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781716678; c=relaxed/simple;
	bh=V3CcxOLia9CY0H8zjb+ZTGSXWDv/g65LFKetUF1X0Sg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Be3m7z+z6gM4OoULgHa/IQKr3hYoROC2fJvvD72mRT0xuQvlhCyLfhBEw6FSodzKR0i43dhu3u9qBe8uH66Lhu1BU5OaJU8t94ajJ3extwox+IC5oEEZjMu7WOUCjyq97X6HaUuV9xH1d8djkd+m1w/xLbUiFL9ovWaC8IrOcGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fQrtBGsN; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQrtBGsN"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45f3cf907ceso33738f8f.2
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781716673; x=1782321473; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=DHkZUMk1sAqmgYkyu6MiPiSjqHXH7Sbq1n0RCyPRFfc=;
        b=fQrtBGsNkl8jfhmhK2liKOfbaXsrqWGRmKfHP/5/oXW0UD7hJ3oahOR7qLAeo0OpBe
         2e6X/h8jQJOlMdK45XemxG1KXwmVmdOdKR/3HW11AMVUuy2FDKhx6t1kO60FJocpgZDF
         evkBG3W7V5BZARoJSX0atoEmHPrefGTeO35FOicNCIG5aM9OA1ql0InW0OLMoRJ8YDk5
         F4FnkE0SVPSi73SuQwgeOTPBhIBLWh4kel/JQ82o5Kh0CRc9f/rmAmRv1x7q+mcCAL7K
         8/0Be+VLTgQ+SA5VSHT4hBla88HOCJYiOJO6Jm6SRXG3FLP9Do007JkkLXKlE+Yr5EpJ
         mzuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781716673; x=1782321473;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DHkZUMk1sAqmgYkyu6MiPiSjqHXH7Sbq1n0RCyPRFfc=;
        b=D6DoveUlM5ZG0kYmwskRiTt3dtumKtP6uF+hXvfu8NbH8RGKEy+CwrqYGG1OY//5DD
         9hJ3ZW13zT6gGDXQ4cjGEi1hSgdy/4EHxKY3aYOOJrM46Vqo5jOqdOgDBNEDP7i7yVze
         mOmLNOipdzIsVOACCGvc18cT9ZHxdyvxaM3vVuB7z4w0PUwDfkVg9l0splIsb+iVmD9g
         xxQ6t2VujQS81r7NyKOEmDJuwR224y6OaQR2x9YNOy4TRYF5PELwdg1gyJd/G4yDw87F
         u+3E96DSybeIVKdRR6Lsuc6Pu8zs+RAnzJXEWTz/PSiU7zNGaVf+S1Cy96WdPBTHnbhC
         JH3g==
X-Forwarded-Encrypted: i=1; AFNElJ/Gu/QTe1tlO9G0iwk+7lerOtye0EaAlMU6ymnjnGIz7TA7A88n4YwbOTC8AVm7/RWKiL2fvfuZ9dGt@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/dedwtMtgtX0Pd8auczNymlwYrl1KCtaj+lVJUqO89EUt3p7X
	CJaTS023lcs4BFhJo7EVsB56GlDtsz1KtsXpuKXDYVvDBC9f7/jifBob
X-Gm-Gg: Acq92OEM73lPSRm+caT/YSfO9SNfx9UTQYJhveccRIMX7Tg6niv4BFTQF/9e8KMW5sJ
	ivFCOyGiwR6A0iXmgP07jygx92ULmtClPuIvrx0qksZUuFZB/4Cyd9yHIaHuN/3O7PDBnerhI0x
	itFd+ugLRciRZ8deY5FkdKerlQr3N3ZCPmI6uKFJXtvf1rEFFcqX8ZZYwpi0ikBqmjPejnejQGF
	T9fdGow5aTH4FynByvQy697F3XVs8z2dBJ9N/aOJYYiR8uiMGc/YdkYNsdOGqhNtBBRJIobeznn
	e3XLROpA/3tTJCYQ7MJA5c0GrwHCjhg7+afqaxlEZT08fCg5mxWjAUuh97/K8KwkUkw7mV3oW3B
	4Zlj9zS9UNckPheKt6CWE09giLvIPkyNcRANn8a5Im4G1fxmh3YtksokKY8J4SrF3pYO384qodU
	/rCyTi411JFCCO1RxwQGflEvyCWrODS+/EN5wdsKiUgYcTS4b/Xwv63iHhw+gJWAcFFo/ZCKvsj
	zCxB/I=
X-Received: by 2002:a05:600c:1394:b0:490:b8e6:be40 with SMTP id 5b1f17b1804b1-4923821bef1mr5753465e9.21.1781716672843;
        Wed, 17 Jun 2026 10:17:52 -0700 (PDT)
Received: from [10.128.11.42] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2dbfb1sm58928836f8f.35.2026.06.17.10.17.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 10:17:52 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <58f7163f-2fce-41e9-bc35-d1d8e6f4a298@gmail.com>
Date: Wed, 17 Jun 2026 18:17:50 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/10] ACPI: APEI: introduce GHES helper
To: Ahmed Tiba <ahmed.tiba@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
 Hanjun Guo <guohanjun@huawei.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Shuai Xue <xueshuai@linux.alibaba.com>,
 Len Brown <lenb@kernel.org>, Saket Dumbre <saket.dumbre@intel.com>,
 Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jic23@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <djbw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 acpica-devel@lists.linux.dev, linux-cxl@vger.kernel.org,
 devicetree@vger.kernel.org, linux-edac@vger.kernel.org,
 linux-doc@vger.kernel.org, Dmitry.Lamerov@arm.com
References: <20260617-topics-ahmtib01-ras_ffh_arm_internal_review-v6-0-91f725174aa0@arm.com>
 <20260617-topics-ahmtib01-ras_ffh_arm_internal_review-v6-7-91f725174aa0@arm.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260617-topics-ahmtib01-ras_ffh_arm_internal_review-v6-7-91f725174aa0@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ahmed,

On 6/17/26 14:54, Ahmed Tiba wrote:

> +config GHES_CPER_HELPERS
> +	bool
> +	select UEFI_CPER

This config option should probably also depend on ACPI (could just move
it into the if ACPI..endif block), or at least have a comment that
selector options ensure ACPI is enabled.

- Julian Braha
