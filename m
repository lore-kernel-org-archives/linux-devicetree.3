Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D07F47887A
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785454870; cv=none; b=kl0znZHtR7avp19fxvP+nS6BuC0sWoS1bWResyviSky0mpKz6MPVdaNzev+OwLNkoipVwFZSR48+kq0BGgoQQQ9xaL3rzB6/bQEFNrJsFLAg/Cg2sqLuuSd5OJ4gcr5fwU+ZGxglLvPXTClUQW5M6RwZaoY1tRLC4xeX8qVsUl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785454870; c=relaxed/simple;
	bh=utT5GH8JwJmVzB+0txH3Mifzm/70gcqs7ugOLa5BO/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uhPn6aPjd7qdBjxXo9+Oo2TJz8jqt58vcCn7EyTwI2YUtMXI0twLBh3vTIPqA8BFRz0xTU+4jYtgjr2OOgcINC+GtemMvh4+TrJcslQO/yXN1c5OiVf6uHF+2wG85AA1GTQ6ihCHB30MbH63eNBLaaHEJrWKTsVL9XccHSVKuQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AjfBdPTC; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AjfBdPTC"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84867f07d63so521999b3a.2
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785454863; x=1786059663; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N7GFN5YpwDEZAtAP3vleYwkuNsvwAGPeTkmkPSkEkzs=;
        b=AjfBdPTC0biWBxfkhnb1djv7qI21Cq3k7GUyJDixYozexs+vh8Npvm61jITbnWp0iu
         8X2r7yYUq9ia27CdskFQSwFkvYqz7e7KdIarE/nax4Q5xJf0dINOoBCBjGc/6TNnPSE2
         pTDFkmPvDrJEpMYZ9TFWtOBYMGkGrqAk83T2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785454863; x=1786059663;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N7GFN5YpwDEZAtAP3vleYwkuNsvwAGPeTkmkPSkEkzs=;
        b=KwOpxXdCrpsstIZnyFHSWAOd2Qt5WtMrcCBkiUHPjfu1Ma0x+fNl8+VaXHDBFwRqNA
         MYpixqhLoRYNCcoUg5JhqyAVlcfQQjv5uH/i/Lrsvluyw9Yzuadh0LOsRHlcFleq1V4a
         j4OYQJL+p5YU13hs3gMqotCRxS5JQKun4xbnVu2hOgp7MB6ogVIWKMZ8ygY3JJ4HtpQi
         BD37Wtxb0uMNgHq74hGeYurdTAYfyxtxno4Y0FlvvFoAd3VzQaBazFbTHCdaCavo9+aD
         fXsgxBKL3JUvp8ACAwIqQPwvkS1Ce5SPKs5w4bYPlw7ZcOE6+0fm8E/Vd1ZEWZc5ooLt
         rmvQ==
X-Forwarded-Encrypted: i=1; AHgh+RpK5k+51ynSP4sQvzmTUirU4u6d6JqELY0f0SNLFX6acF7HAk7vKxj1XyqTCLyTd0mz+o6YKNKbaK7O@vger.kernel.org
X-Gm-Message-State: AOJu0YzfRG40mblnAZdZPQcPUz5DU4Jyg76WZ0kCRL5AuwHVRfroppjV
	3q/E1pQyy6Rxa8O/g+8XIsyk4hghG+8PHKPsS+whcMmVZgzDc7QxH83kWL+VQRGkqh0qy3qsL14
	aTBg=
X-Gm-Gg: AR+sD10KV4CXtow/Zz8dz5chXFc6mm0/+UUOI9kVOuxqV14xeIt9+wAjF4awZWQ//z+
	UMWWiy3MVxlKSJNdRDuWISZLIJCB30j+as+2o/VSU7EeKgw1IGdGba8BVwPufVnW0u79PV+LO6C
	qeyppmgcbdldFDSL5xsEgQzA8ugmwQT1yAOm+jjIjHQRO4e7gHcLsGSz2jjzh+PB+FgL69tpEEY
	xAWQHxSgI9fI3UJVo+CHqIajcAh2uecjprbQ8A+sBRaqPrdzX+0krH5nj6uIFiE0kOc9R2SIcUv
	r6AI/tAL+rYK8AeUrvgmdkJSYDtlvHrmv51QWsu/YhKSf/2Sa9MNMKGX42cpTDwKlP3ggFV9/w2
	VsTwvA55i3HYX9Le+gDD9L5U3iLmg5j8alNzWqVvlLAU10vJ8Q1Budq/d/yTWVdLfhk7NScBpBO
	UO4yFca0wVZlCZ+OlP8PfioQlKLKZo5gaCyAe44flu/nMnhGPMtT5/J8ComFv55T0NHzm0pK0L8
	FgDOU4uxVlR0HdARLkJZf0JPElvUVgA6Wq83WFTEA==
X-Received: by 2002:a05:6a00:e13:b0:848:6720:6fee with SMTP id d2e1a72fcca58-84ebc3da975mr3959911b3a.40.1785454863410;
        Thu, 30 Jul 2026 16:41:03 -0700 (PDT)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com. [209.85.210.176])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0373cc7sm3711623b3a.41.2026.07.30.16.41.01
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 16:41:01 -0700 (PDT)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8453427d3f4so519553b3a.3
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:41:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpJwarZQvE+TZmTaF/NurCG2YaI8f4YDJCsqqx3RU1eVv7a4x5/etBoh7WVkvqwXQARvrrgbsfMSF5Y@vger.kernel.org
X-Received: by 2002:a05:6102:511f:b0:745:78d4:4856 with SMTP id
 ada2fe7eead31-7574e1d5298mr1438306137.7.1785454492526; Thu, 30 Jul 2026
 16:34:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-5-3abae9717feb@linaro.org>
In-Reply-To: <20260722-contrib-pg-pixel10-initial-dts-v2-5-3abae9717feb@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Jul 2026 16:34:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WWpswZ0LbZzpj6RcyRxYps1Ht8+w2TYTviTw4bo80KZg@mail.gmail.com>
X-Gm-Features: AUfX_mxnuq3KCnn0XeSL1ZB4QNLigMdFRjElx75voPzjUsE6soU8Kl1B5ccPok8
Message-ID: <CAD=FV=WWpswZ0LbZzpj6RcyRxYps1Ht8+w2TYTviTw4bo80KZg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] arm64: defconfig: enable Tensor G5 SoC family
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, 
	soc@lists.linux.dev, Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
	Brian Norris <briannorris@google.com>, William McVicker <willmcvicker@google.com>, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 22, 2026 at 2:56=E2=80=AFAM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> Enable the Google Tensor G5 (Laguna) SoC family in the arm64
> defconfig. This SoC family is found in Pixel 10 and later phones.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)

In case having a tag helps:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
