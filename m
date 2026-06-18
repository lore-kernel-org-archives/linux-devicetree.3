Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6733B42CB
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 14:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781791317; cv=none; b=VRmHjJiHT+yKQvdfQ+lX2IfPCYsW5VSHEzxaHfhCAy7DYVB+3xh9Alo4rJShRo2Aj1xQs+Fux16f8+xQ0Kqzezc+ihiu2GbQoL9NjmZNaOpstS8xBnNy/pVbDtsQFjWxhsn7orucHbwmkg9RovdNROvvN3UzHYdJg25VBVwrFOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781791317; c=relaxed/simple;
	bh=FhZwrKcVVNINuif5GPKrZJSTMSnjLUqQBKRjryvQ4g4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fVgMbvU+crbPKpWuzJ2PI/6dYwqtdyQhfEIWa7XGZBTR4wWG1DNzExCLT2LKS6mwAORkKmwa1N5mrDNjcELSd3l9vXEW03DRwFDxsUyjrV1T1K1BLTmO7gDb9VNZkzZGLz6oCjmQHNTyKeoxCfvaUdlWGXpPLGrVHs3SDa26Rak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fhjRRZ8l; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fhjRRZ8l"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4908b92904fso13121985e9.0
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 07:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781791314; x=1782396114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lmuac1vs/+f91HFLziPLpiPQkE/k9A+lUkC0pHKOV0s=;
        b=fhjRRZ8l6g+JP+iaTqqYZV+n5UR6nXqpvGnVMFVtUz/dSqfQ7wC8mzhJpdDmguXYXn
         dT03+RcCTIpOG31GJcdvAGH3eFvc2ujt7TaSiOfiKt4fYlSGXuYKn8AaVhV2Zu7/fKue
         Yqjh6dU72Y7wt1AGkRx8O2nGN/CLF2AM6L11dIy74hZT4X5uWDxOaFH0/DTFb7iB2h/T
         HKTbe9CwlaGBH8U0vm3y27Tob8Q/L9zUqAU4am4Oi951uZZ7h1eu0zuxNEFVTOytbdZB
         t1QlhHM7nGPdDkbPCgrNQAi1GTdyZaOC3vvBgTXaIyTKxg783lRmYutK1CEYmPs4BFmd
         fXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781791314; x=1782396114;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lmuac1vs/+f91HFLziPLpiPQkE/k9A+lUkC0pHKOV0s=;
        b=qmxAZem+2HLPOrZlF9vp3NS4IsVcGJDz4nX7Y6K6cMN/CG8arJSfCO6VCXRVW1P8e7
         ezG8BEWfF9/sE986BvtdLo3D9oKuXyC6WR2BcUnt/vw4+QZZgLjRmU+cKdQSZ+IOpPtX
         ORzkijen+cLfvnFqGM+szoWuEXeIq7U4EzHgaI0vM50ZfwPZPUWlZxYbQW0Ntw/ksl77
         MuzSk9JmKbb52b1Z2rdAHxQQNbSkEl5jX2v/RSSsYqa+b/BStMQeQSCJowVweDootNJ2
         Jtpw7PjzEo5bgFjQ9Rlc62/+Lu8I6ipy307W2fIoGu+sppawszLi0N6sGneF0q7ueuGN
         wY6Q==
X-Gm-Message-State: AOJu0YztKnnHKJFl6lR9bDozHcMTdEQFZEqWR9bi6GQRVG+u8PPGHSZe
	5OkOjqMjxc9X8c6A/LNltz0ogQ0QR7aFv9bG/VksLRpl4+yOEbvKrePXYxXHbeTg7jV8i4IKznC
	Xb+v8Uvw=
X-Gm-Gg: AfdE7ckUwSrhcsj83lFfNGPp2AaWn5CiGKocHi595hiw89kivjnNFCijYc+L+rM1i2+
	eDwQSS8hOmUZbBuKxF7SMVL/A+IJdfNg0pdY1PZ7IqdX5OWkUyxpk6iPjtiR3xZPOaBjyWobBla
	3xSE1Zt3VCyIh7mi2QkJQA5+SnCKAs/dyOgVeXzBz8WJV2Qm2ncqag9ME6lkhztqGU8xMY/VrxU
	oR9il9YZJ+d3E98RCde9w2FjjGno1stSywqjP3/K6/BPshh3vWaIjaD9KJbp512OhNw9nybjRK+
	2xJ5IU85yBYycfYEIjZ4Ma+P1ct4LW3Pbt9K9vc8bbl1H9BYCozJct8wTNsXnbSz16AU47twH26
	WTGFYoJDHnDrHNk5ILhB64GAVpASVWZ6GvqqdMdrxEJojGZ7ZKKwVNxXWzIVV3ebD1P7hxHICp4
	J1DoSZUUHpJFJbZ1SnedXKwftYPE4rjkeoRw==
X-Received: by 2002:a05:600c:8b45:b0:490:e1e6:8988 with SMTP id 5b1f17b1804b1-492340ff6f1mr124191785e9.7.1781791313722;
        Thu, 18 Jun 2026 07:01:53 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4620b3ed0d2sm27901309f8f.22.2026.06.18.07.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 07:01:53 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-rockchip@lists.infradead.org, 
 Chris Morgan <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, xsf@rock-chips.com, sre@kernel.org, 
 simona@ffwll.ch, airlied@gmail.com, tzimmermann@suse.de, mripard@kernel.org, 
 maarten.lankhorst@linux.intel.com, jesszhan0024@gmail.com, heiko@sntech.de, 
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
 Chris Morgan <macromorgan@hotmail.com>
In-Reply-To: <20260610144407.438846-1-macroalpha82@gmail.com>
References: <20260610144407.438846-1-macroalpha82@gmail.com>
Subject: Re: (subset) [PATCH V7 0/6] Add Anbernic RG Vita-Pro
Message-Id: <178179131216.245596.2940101862662422510.b4-ty@b4>
Date: Thu, 18 Jun 2026 16:01:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1

Hi,

On Wed, 10 Jun 2026 09:44:01 -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add support for the Anbernic RG Vita-Pro, based on the Rockchip RK3576 SoC.
> 
> Changes Since V1:
>  - Updated documentation filename to matche compatible string.
>  - Corrected order of allocating IRQ in charger driver and switched
>    to using devm managed function to allocate work queue.
> Changes Since V2:
>  - Corrected issue with naming of panel binding document and added
>    fallback compatible string.
>  - Switched to devm helpers in panel driver. Note that
>    devm_drm_panel_add() is currently only in the drm-next branch.
>  - Optimized setting GPIOs for panel driver.
> Changes Since V3:
>  - Fixed numerous issues identifed by Sashiko bot, mainly relating
>    to unclamped or improperly clamped values from within the
>    charger driver.
>  - Corrected hard-coded values in the panel driver unprepare routine
>    as well as correcting an improperly checked return condition.
> Changes Since V4:
>  - Fixed errors identified by Sashiko bot on charger driver that could
>    result in an improper value being written to the registers.
>  - Corrected some error handling in the panel driver.
> Changes Since V5:
>  - Corrected minor errors in documentation and added default values.
>  - Further corrected clamping behavior in charger driver.
> Changes Since V6:
>  - Additional corrections as suggested by Sashiko bot to fix potential
>    edge cases during probe for sgm41542.
>  - Corrected an improperly shifted value being written to register for
>    sgm41542.
>  - Changed a MV value to UV in sgm41542 driver to simplify function.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[3/6] dt-bindings: display: panel: Add Anbernic TD4310 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0fd6ead8270270d859a28d0196a4b47e7d6845b8
[4/6] drm/panel: anbernic-td4310: Add RG Vita Pro panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a81b4fe69e7bd2667524182e76c635f04c1ead7e

-- 
Neil

