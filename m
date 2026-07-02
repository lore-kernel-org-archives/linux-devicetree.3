Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE2336E48E
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 19:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783020272; cv=none; b=LlGNBuowX76AdGnk/YgWfnRraMPouSOR4jcYL8CIepeTNMZvAx7M7SzGL1Iz60uPpdMiOQApi+FKOnAwmBwIMe6t2dSXdaVBBx4K8pYqL29mL3C6f9zpgsess67EkgeYOEPfS+hwIzO8bOdNGBKNe6Ad6nQzacLIV1hKCFSpdic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783020272; c=relaxed/simple;
	bh=STqErUIB6lQ1GSgE/uIqGk2C0fbKhYjGQq1Fu1HrLJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BbwcXWinZfxm2NxtxvPK4c8pYOQDxKpMmQEW8021u2tQDUAvrOHShgX+lnaXDoJv4ny4FVhyR1PafPB1Inum2wNhg9aYL1HE1ndaVjjQ5gWwW57EAq2QUQr/RaDWp+8rkKMReHTnCUIUF7/YZnHB16Rb++bGzo6u8GXXShkPx28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eZGkYXrk; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eZGkYXrk"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493b1710405so11900895e9.2
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 12:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783020269; x=1783625069; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=1iJoqMShC+TvOCSI7HOO+Cah5rIfKqS+yxnlq3esHG0=;
        b=eZGkYXrkdy5dByHa3w+pYBeGU9pXw0FMVms6cyobrSNyaOWCdB9UYVUvlGqej5cF6b
         Jn5jejXXkLeQXDt3X16Q3xruUfSy9oxTktyrdDYDjEYxlOOWFaZr+ZwINAFfAzWTjH+Z
         M+Pk8UFMUvHX7t6IVOQf7DM9J0BXnRhxifIfWKFcx0OSdMR5bSKaTrSGwQHQ39pZ/diD
         M5UX0ylnoNLkZgv5sZoLNw+TRq+FL210lZuK1ul5bBIb3hGebwxzabyeYu96qW7RmPXy
         Mqhn+6Ifp7Okgavgvu6dhayQiBb6gKgdOSyxWta/65INXPazYUFvEX5zFgY/H/nlIr8R
         rUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783020269; x=1783625069;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1iJoqMShC+TvOCSI7HOO+Cah5rIfKqS+yxnlq3esHG0=;
        b=CIvWutI4He180CYv2H8sAqWeJ33Jut2rYLyL9Zg8XnZkvRX3OtZJe1JUotmr+EVBuQ
         gRKstZkrt7M0ki5Zz1XvXWGAHrDbF0YreFEGQE6wh0+8nWayfPw1fT8jDbwxz5aGwKaP
         g+FZW2Szo4gEUEchDiQL5QeihZc8t/z8Oyqw4BNNZ4KOtdZY1QRGkue4AbidGJAc1quE
         O5yvv+BXDfCALxqyxQjrJ+DDqwgJwMPdMaZhzwYTDfMFgsYUkJ1FWXZIBlWrABxjze+W
         9suzKq+01PiCSYfIa0fYvmu5f++5puqptcJcvcoDvh1saTTKX6y42NM3ui5DZx9/Etlq
         bxAw==
X-Forwarded-Encrypted: i=1; AFNElJ/Detjdy9arzyRQ5FialWMRWoy/vbvRln1frGHegOqpqoNPpKZQ+HqpKuJP/tG7B78oYIuMh5W+/l2X@vger.kernel.org
X-Gm-Message-State: AOJu0YyFRokVT0reL6LOOOc/URKyu0q6HWT0SY53+WWWx4zuTiS95glg
	rYecfQWxI3NEOMMQb9b/+fJxY4xS/iFPup1qySNrWPgMt5la/JxjdDC+
X-Gm-Gg: AfdE7ck+pyzQCtF3NIlAqrks3J0aOtoKQzHo1dg/QNgvLs6VHVcvrUplhxZHr/BxteY
	JqkLQdzFJcpy5PR2xpeeEI3LeasuO94KUkmWItGBeU5pCb8Js4cnL14tVUbjf4CItDpDlC1Eeld
	9/a8HwcJ6C3UDCW3f2zz8mFvTOA3/KDh/yGghY8PADGdJGwmx8uNH8raiKMeLCUzxNuzZPJU6Kb
	jDPoVQm62WIpCxbFF+xrJOdpwxbiIqdVx4oB5fMJkYGfiKVIJrRQh4tCYFk0kou0DqiIiDkEgWk
	O6X3B5BTFiLLyZR+VxlwDntqMFQbhBCy6slApgzScNS1wkiJG4A+THlt1z3OK5dNP0wQ3ElJoV6
	EhvTiOiZ1Dt/Eui5ThQxpFbq/YABKn/PTzklNydt4YP5j4zQhwj2j3aarjhfi9DLgFsVdsP5plZ
	pZzTGsIJsvyTCTPlb/E9RRsDjK/kUKw7l5Zv9dRRBV43gent1+ScYdc+5OcEV2a6xMVXj45lhHI
	10CQZXb
X-Received: by 2002:a05:600d:8649:10b0:490:44eb:c1ea with SMTP id 5b1f17b1804b1-493c2b905d3mr87929245e9.24.1783020269382;
        Thu, 02 Jul 2026 12:24:29 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6381e4fsm82751675e9.8.2026.07.02.12.24.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 12:24:28 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <2723c6d5-7a3e-436b-9ac2-12e5b0a3d1c5@gmail.com>
Date: Thu, 2 Jul 2026 20:24:27 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] clk: cs2600: Add KUnit test for CS2600 driver
To: Richard Fitzgerald <rf@opensource.cirrus.com>, mturquette@baylibre.com,
 sboyd@kernel.org, bmasney@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <20260630155549.824059-1-rf@opensource.cirrus.com>
 <20260630155549.824059-4-rf@opensource.cirrus.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260630155549.824059-4-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Richard,

On 6/30/26 16:55, Richard Fitzgerald wrote:
> +++ b/drivers/clk/cirrus/Kconfig
> @@ -8,3 +8,16 @@ config COMMON_CLK_CS2600
>  	help
>  	  If you say yes here you get support for the CS2600 clock synthesizer
>  	  and multiplier.
> +
> +config COMMON_CLK_CS2600_KUNIT_TEST
> +	tristate "KUnit test for CS2600 clock driver" if !KUNIT_ALL_TESTS
> +	depends on COMMON_CLK_CS2600
> +	depends on KUNIT
> +	depends on REGULATOR
> +	depends on REGULATOR_FIXED_VOLTAGE
> +	default KUNIT_ALL_TESTS
> +	help
> +		Build the KUnit tests for the Cirrus Logic CS2600
> +		clock driver.
> +
> +		If unsure say N.

Could you format your kconfig help text with a tab + 2 spaces, as the
kconfig documentation shows in its example?

In fact, your previous patch in this series (adding COMMON_CLK_CS2600)
formatted it correctly.

- Julian Braha
