Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C6233ADBA
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 08:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786524505; cv=pass; b=r4VB0517T2yMQNlqKkTFcViHARubpmPAycvjIu73FIHE4mXtY95NMqzCOKEbrV704SjK/ejLf3wdtWwCKg8PNEKhOA/ODaslLiP0jF5+QJIhW7kPZa0/ZM1Isl+pJhv3c8szTmMwmfEa6fcuGlyla9BzuouqKn0/xblWZYFvBCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786524505; c=relaxed/simple;
	bh=9NvP3s/dyhM7ohI8AouovYBTcuSGiqF4Xz940L/QClI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ESx8HPFjbldh5kRMcH2jJ//9R49krolQD1mxkbTvx9Op990eHaw5rspR2WBqm5MI4K4ahbxoRiqh7/IFD+43sD06WZzxIZ5C35tUr2mri97wxu2YSnCqeB6HL4Wve+wIaGDE3eWnzvi9jtG8EdIrvvG20dELOWUBhIXaK4hOpz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HHfwIPfI; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HHfwIPfI"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39dbe684115so14754461fa.1
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 01:48:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786524502; cv=none;
        d=google.com; s=arc-20260327;
        b=r4sJOEfeJkFU9Y376p92a/X8S7xgDs/e6uBY9dIZq6OwMJt8GB/GIvhL9ZCAQ97ykc
         SYujuIGZYFNeh//5pfHiYFczpvl/fsLfRHtHdTjE+3CNXgMpnFYcxITGDmDmQMHyF/jL
         +uEzTcIowuNhcEofxXrVspJQeh8aVLWxmXxhxHnU7YLfp13bal+ZuvL6lza0KxiR6U/e
         eTR0/eS/zin+v+32RutD0K22EZkiaDTZExBdzCeDfibFYU5V8CLupaBH79MsaDfX5VK6
         Is8neveSJXkhqyNBEZ0EtprM9a3SrHW8b/EC64afgYZtdTb/st4e94rvWSg+OQfua370
         OLww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OlnRbXrMzvM11HciwJ+tnrX7tsgXaPOfRuDz+RfwHQo=;
        fh=77WP6tmMOJPpcWzp06oaAmbgfWC3cUgxILHNrXrZOLo=;
        b=PxGU6FmLa/5Ub5MxTNXCRx+0sWa90gvqu26aMFhtqS0YUBL3m4RrBxF9fWiuv+q5CG
         6BrE/gjCO2QKj9gHwK6beOl0Czm22QYpHteQasQnrrWgjRDY67Hz8f6c4LSOLYpPAfwF
         rj5+A5soum8O5qo9c4rXqV9KO0OHDRNfH+AFNp7AbXJRTINJWmomBV+koblxl3qSdoB/
         BRU6TOHJtcWXEky6P2gMFLHjQHwB3SIz96fXVeWP1F66kEWQ4fwCmWHb/cK2X0/4Sypb
         XdwnF0dDDVDI7Txi6EOtPLrRMHX8b3oPFsEZM0gcoLjEE4sjnXm+jnnc1Ox2DzBVcrXh
         VP6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786524502; x=1787129302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OlnRbXrMzvM11HciwJ+tnrX7tsgXaPOfRuDz+RfwHQo=;
        b=HHfwIPfIzD7xjEKCB3Mp9I/yLEGaAY+5AZGkZ9VhkQMyulS5X7tB9LRwQruuvD7Wjx
         aT/qeUS36XN2n0fIsOhLtjLTMA2nbxUwBKn3nBg7Nx8gQ3tEUJMnOYLDwPanOaTlI/Zi
         FJmr8l1Qx3azKMV/NB8QRLkBHJub9siM5L59sgvp5kmqlJyUxOLbYnQcJ/Lry3AyBttY
         QeMMDVoUl4luCIj0ez/d+iQN0oympwynvHYM95l+ZvVCb//GLl1oph2jRrocgqRvZF44
         r4QgWmei6gBOH1yWj+5fdPrQXPM/IfgzfEt7n6K3nEa+cRWp++YlQCErBfs0BW6OqrZZ
         J6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786524502; x=1787129302;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OlnRbXrMzvM11HciwJ+tnrX7tsgXaPOfRuDz+RfwHQo=;
        b=D5cDLjG/wROzS3P7lMIk/AgjCrf5Bskuh2D6V3B8ZVg7gB9rtEWo4MmiK45lv8amRC
         VAG3lhRWyThtOJhYgNwyTWzQJdB78ZpRvz3n3K080lhrrZR6exGXBCSKzcFwcjkgm9DO
         UKYZs/wW51y3ej4/EQQuzbVA4LVH32anllDDI+1BxztZZd6gYvS5Gn6H8N8LWJIPbycM
         MkjMtAzLx90bMKdr8kM/yGHcAinvhCvqSkEug4tjrOVzjpzZMCDIYaTaM8d5f7w+qIfk
         gl9xbcudbidmGocjLpdM/gzXhXIrX6qus8Wl9mytPhqmN8Bz3F41SKoMx8ThH3U/p6ZB
         nqQA==
X-Forwarded-Encrypted: i=1; AHgh+Rr3Nt/ohzsdO3JL0o0Qfasq9hGSopBO4cclCTC2MzzXhDGKHd2FflrLCcTQzw78UHnIKfLP4TwIpYfF@vger.kernel.org
X-Gm-Message-State: AOJu0YzOA/VtV98tLAUMZYmKgEDnC9+xqDsRiQkNNgRQMdDCzh+1eBT4
	GGd1S2KmpK+EPt98Zk2WnAWA57fzgG6h6jUGgKQVrDQXWYZ74886GRf7PVZQE/snM2ebWPiFwGg
	YQ+EmiaUafYcmMjzwXi07J1Rh1v7iMTA=
X-Gm-Gg: AR+sD12rIvSPCKqJn25OdZ52pSIQzVqEAEIgfwIza9Zo+zk4ub2aBL1xrpzUQjV5hzL
	3oeWD36wTDxRs6HfWJwo+W/qVxKuEKQJgjf4O5njMV3wxsenZA5KT2CkXnjI2KsD9olXi5s4tUZ
	d7TwQXTanFC7Cx2KHvO3WKYjsSu/OHla7E0Tzbuoeet2mnU0BnwmSok6ag++fuycVbBkfib27et
	eemupgoQLZoEjySzqzrT7kT2MlXefesIOXUt0AQm8ACQsY2xYZ1ev9Gm2Y5ZkdKzXOCwL8UXWXX
	ddiFaWTyQMFVqI3aCG9vP9wPb94W1lwFJTw0hpC9IorOETrQbOI=
X-Received: by 2002:a05:6512:ace:b0:5ae:bf3b:c96 with SMTP id
 2adb3069b0e04-5b44e951a5dmr529743e87.19.1786524501776; Wed, 12 Aug 2026
 01:48:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811-ti-ads112c04-driver-v4-0-ae704ac17241@gmail.com>
 <20260811-ti-ads112c04-driver-v4-2-ae704ac17241@gmail.com>
 <anrt5mJBz5h-a3OL@ashevche-desk.local> <CAF7HswP7+79Y5M92PVoHJ_H_J6rU=Q0p5qWDm1gcA2mPfg0VDw@mail.gmail.com>
 <anwhFL8PeCMmT9xS@ashevche-desk.local>
In-Reply-To: <anwhFL8PeCMmT9xS@ashevche-desk.local>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Wed, 12 Aug 2026 16:51:12 +0800
X-Gm-Features: AUfX_mysTYJdzGQvQzK6px-DDPjL9Q17jJ6tnw8oJ8juQdaYgfumooZwBWopT4o
Message-ID: <CAF7HswPvpdgGz_B_cYWBze6ab=+q=X1UG_LTKgdCj1i9Tyz1Ug@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] iio: adc: ti-ads112c04: Add support for TI ADS112C04
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 3:30=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
...

> You quoted tons of comments to which you haven't replied. Are you agree w=
ith
> them?

Sorry - I agreed with all of them and have already applied them in v5,
I just didn't say so. To be explicit:

- wait_for_completion_timeout() is now used directly in the if condition
- err/ret swapped in ads112c04_wait_for_data()
- i is unsigned int, declared separately from the assignment
- reference-sources uses fwnode_property_match_property_string()
- single-channel has its own variable instead of reusing pair[0]
- ARRAY_SIZE(pair) instead of the hardcoded 2
- fsleep(1 * USEC_PER_MSEC) instead of fsleep(1000)
- the internal reference macro is ADS112C04_INT_REF_mV and now sits at
  the top of the file with the other defines
- the IRQ is no longer disabled at all, so the unbalanced depth issue
  is gone

I'll trim quoted text and reply per comment from now on.

...

> I'm not sure how the binding might be affected by that. reset-gpio should=
 be
> direct replacement of the custom "reset" GPIO handling in the driver.

You're right, I had that wrong - reset-gpio builds the reset controller
from the existing reset-gpios property, so the binding is unchanged and
David's Reviewed-by is unaffected. Switched to
devm_reset_control_get_optional_exclusive() in v5.

Thanks,
Kyle Hsieh
