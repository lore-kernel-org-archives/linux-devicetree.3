Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F624287510
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 16:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786292655; cv=none; b=iPPqBFtBQnzOJJ2n6kOixJZzuEaE7FlMO0MCLm5t+m7kFMbhoFmrkKPWPZPWEJi6LR8R7g+LjMzVRJEhetfmO61sXaTgfjCix7ZLtukrOofwBPUogxO0vHGnWVeVlwbAOtTDjasENV8azb/vV0damqP7Qs/7Mxk80MuSX+13CB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786292655; c=relaxed/simple;
	bh=L8jVhzcEx/1Ri/TiJ6hXDYJPVTTnzDVvCCZJTFtQQNw=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=hW4ItO5hkEXEIGVqOnJYh5UgE2MejHDVHtVy7QQ8HTLmfEt8TxOUItd1MJiW/nLc3BcoZEOMkzAkXiJ+EQHE9LVRXBPrNcFd5iXqDBRrvcvoy8bkNut0GSuaWNOI4D67m6a0Nv1kX30C5NY/x0Hnv/XOboZ6CBK49yK64C5pKF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R00Blv2j; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R00Blv2j"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5bfa99f8ef8so2544575e0c.0
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 09:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786292653; x=1786897453; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L8jVhzcEx/1Ri/TiJ6hXDYJPVTTnzDVvCCZJTFtQQNw=;
        b=R00Blv2jCyJ1JHvOuRWxIirbnXSieJQnaFuU2qIecCIGssL2OXmby9NhkIpXoGkRHv
         V4nUCAP/zl9IUOas4zwgcMDvP73s5uLLWL6rdtod7P/3TKnxcEkEAG7HVcy9ycyioDOt
         gAApCeEgS8qZ81mk1iFxSACvDPGQ/eTM2qtA3l/Wz8iTnzo18Vi6Dwz7XCWdC9g+j7QV
         ClZVK+56rnmJ8HyMwTURBkICw4WGXy6U7u8Jk9R3iaTg5JmtLFu2HoxT/TM0XfDHTz8R
         TuBoUkQrcEsJYQUH2Sn9miCwmkUGudqDOELVw1UaQk+hJZKMZdilOMaZH7EChD+xLJ5J
         5KGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786292653; x=1786897453;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L8jVhzcEx/1Ri/TiJ6hXDYJPVTTnzDVvCCZJTFtQQNw=;
        b=aFtiH8+gVWFCOCZtLt5aS6yF/bA5r4B9Fmq14m3fAgwNginUg9UqquxKCz3xgdaOO+
         yYeiVGGdK727GCPZSaRhakhfKnpQjzGP3yk/vd36AQBGjOFmjSloMDTiBh4gmTYDvyuV
         0BPn0zhjesDSJQSEPWH6P1eg+FkPIPmUjggPehF3FhS+A0nA7hczJmFRQTKHc/iu4QzC
         pyaGmyDc0f3kjtZLQbDGpXWimOr/rhCUfDFYELbzYrlpNig5srMs9Dpd2KsLm4WvWzDr
         69lbKPmqmksC2z+E8BMrTtROP9W0nCTyAUD3Q5LWQKkCW898ztJL3z9x1fJgF0TsAvgW
         Drcg==
X-Forwarded-Encrypted: i=1; AHgh+RpHnWUKYZxZp3vqgv5Q/BjfPnQeqfD+rM5X7Ai+6zcHLGf7rvA68ca4xQEZe/qDSxwofZ0tPSOMWlUQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxwcRXpCUDFmUEuycF3mcJLHpQRgpXTvM2dXpkRSLm6E4e3pZLj
	VL7HiS9eVwwa/Z12IshbjZVN5E4SR81tr8u5RCcsbUg98Xu5Ex+4slRe3TlldQ==
X-Gm-Gg: AR+sD10VcmB97CeIiBFBABsClZkFCxaup3xfEWsQd8XSFEN+FXpZGh+odE48lL/wKva
	4Lu4XEPyUDVMenYi9syrQqxBI6qHBLZJJ1u7WDw9HmD/x+MQ8w+K5b3JrS4b2A0PhjWCdbcqhDF
	U5FcguveMCWcCKSyk8RlUEW+PdiFefh9NApbfIx3DhONSu9Q8k1N9GkTzPZBtH3LMB3O12tSX08
	1XnMhw8odN+FQNokGRYAcSKZRq1fpSr5K2UZjLlefttVrSx0xwXsM+ZQxEb5ujLCxZXHfs3n2rh
	dwN++gbUQT2JZdyVIaKfHAI11u6stMi9MuXEBsewEInhlEWs1v/L9ggIzQAX3iq1tT1L7wGst6X
	oJOAHeQVafwlzHGVdHCnF7h9Mw6ymkdFJJz25VFT20VNYJZIENbARY4rKPEbeG+4x6Al1RWUBIB
	DJbktslz1O1BMcsLBikQQlGRi0DSi9vt3jPSTNXZKGrPct8b0OxO0=
X-Received: by 2002:a05:6122:2385:b0:5c2:c79c:c093 with SMTP id 71dfb90a1353d-5c4152d5cf1mr1326569e0c.5.1786292652899;
        Sun, 09 Aug 2026 09:24:12 -0700 (PDT)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c4133821e5sm2592233e0c.18.2026.08.09.09.24.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 09:24:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 09 Aug 2026 11:24:05 -0500
Message-Id: <DKKJW8KLSTON.18355X0IQHY5C@gmail.com>
From: "Kurt Borja" <kuurtb@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, "Kurt
 Borja" <kuurtb@gmail.com>
Cc: "Jonathan Cameron" <jic23@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Linus Walleij" <linusw@kernel.org>, "Bartosz
 Golaszewski" <brgl@kernel.org>, "David Lechner" <dlechner@baylibre.com>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3 2/9] iio: adc: add the ti-ads1262 driver
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260807-ads126x-v3-0-f89925d72792@gmail.com>
 <20260807-ads126x-v3-2-f89925d72792@gmail.com> <anetMEd_kLs1YXwu@monoceros>
In-Reply-To: <anetMEd_kLs1YXwu@monoceros>

On Sat Aug 8, 2026 at 5:28 PM -05, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>
> On Fri, Aug 07, 2026 at 10:58:24PM -0500, Kurt Borja wrote:
>> +#include <linux/mod_devicetable.h>
>> [...]
>> +#include <linux/spi/spi.h>
>
> Please rely on <linux/spi/spi.h> to provide the structs of_device_id and
> spi_device_id and drop <linux/mod_devicetable.h>.
> <linux/mod_devicetable.h> is planned to go away soon.

Thanks for the heads up!

--=20
Thanks,
 ~ Kurt
