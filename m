Received: from 8.mo583.mail-out.ovh.net (8.mo583.mail-out.ovh.net [178.32.116.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EF022F74A
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 12:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.32.116.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775823497; cv=none; b=FoLSsw4P33Dh2PCjabt+cQ9NdXsU0YMYsUAzKnvk581PSSvOZJtc69+46lg5LebvwiiYTaSUJoluELtg4t4tctQ0DLY7h0KcjwAl9u/8Rpr+ZnyawlHz4V4USI7aof8ArVsE5wROFWLKUT7ZeqzLOTLqNj8KfhvKJvDI63/g9jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775823497; c=relaxed/simple;
	bh=3CW4diUM/JB8LiWZnoXA4stnM/1uNg2TuLFEj95TcXU=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=XiQH/alM84nLH3DhXVUaKF/TiZnT/kqn6k0nVyfTY5W6SXWMNYvugS3y+apnuLYJRcCKXzslhks4KYBFdhdPXnL6SvlxywmUpTBJcCpEIaV241Q0quOn3VqxqltceNb9vrzlEbTMVQglTpCVWwqeF/v8rs9lK30qqsrWMWEkU0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=milecki.pl; spf=pass smtp.mailfrom=milecki.pl; dkim=pass (2048-bit key) header.d=milecki.pl header.i=@milecki.pl header.b=pElMn0Jl; arc=none smtp.client-ip=178.32.116.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=milecki.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=milecki.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=milecki.pl header.i=@milecki.pl header.b="pElMn0Jl"
Received: from director8.ghost.mail-out.ovh.net (unknown [10.110.37.191])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4fsZvH1LP6z5xv9
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 11:53:31 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-thxv6 (unknown [10.110.101.93])
	by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 3F4F5C015D;
	Fri, 10 Apr 2026 11:53:30 +0000 (UTC)
Received: from milecki.pl ([37.59.142.108])
	by ghost-submission-7d8d68f679-thxv6 with ESMTPSA
	id Q1CoCbrk2GlosAsA37Gi0A
	(envelope-from <rafal@milecki.pl>); Fri, 10 Apr 2026 11:53:30 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-108S0026f3801b7-5a6d-45c8-a682-cbea1b95ff79,
                    CB257AE30968F6DC1ADB9B1DFC9DF9D0FAE0E632) smtp.auth=rafal@milecki.pl
X-OVh-ClientIp:91.134.92.225
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 10 Apr 2026 13:53:27 +0200
From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To: =?UTF-8?Q?Corvin_K=C3=B6hne?= <corvin.koehne@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Pavel Machek
 <pavel@kernel.org>, devicetree@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Corvin_K=C3=B6hne?=
 <c.koehne@beckhoff.com>, Ashley Towns <mail@ashleytowns.id.au>, Dan Murphy
 <dmurphy@ti.com>, Gergo Koteles <soyer@irl.hu>, INAGAKI Hiroshi
 <musashino.open@gmail.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Olliver Schinagl <oliver@schinagl.nl>, Pavel Machek <pavel@ucw.cz>, Roderick
 Colenbrander <roderick@gaikai.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2] dt-binding: leds: publish common bindings under dual
 license
In-Reply-To: <20260408062942.7128-1-corvin.koehne@gmail.com>
References: <20260408062942.7128-1-corvin.koehne@gmail.com>
Message-ID: <4fbad496f9f52e11f4ff3efe2a5ae4d0@milecki.pl>
X-Sender: rafal@milecki.pl
X-Webmail-UserID: rafal@milecki.pl
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 16481767265536823906
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEVdcfbvIOBJB2+bRFZN5uvglsDeTJ8QMQd6jIracklhyuhdcBcD8Ww3maFkZ8kXin/gDDz2L3u1T8MRzCXgDZz9SBrqf2axe7f3Va00KRBaXT9+sbp4qW3HcpxWQmyur05ln8PZ94dlYoKVza273GShBBSxFdgTntIEPD4yn4CBJSLMeWHD3I0Mz88aYvdWye5Tsl8VMrmv6aoKXWMYBPyEE4kKcTZR9K037BOc5yAoZEwhaSvlD71Bqzcb0exZDvDw34EHVv+u5aGyMOORbMK4NIRxUmDf0acHbqlRkUZNCm6NN3v0XK9owFAZhkWv0za+YkvRpfr0AdSSIv+SrfWnAXFg58l9lgsaV/sLV5XxtaTscASYYVjrBpa/KBLvGWHr/bBa3/DgFYJSDX+rT6/2syCpi2CZM/9VAMx02deA+Ow6Gv+BUhbklCXUPttGXiXfQZIHp2QAyylIhg87IIewZ5KEzgGxgSxEqn9L4BKBE/HcxnStN6izMfwn/DKSx1F4GXMkdtSGN5OdBCitPEIEGcvYr24B+5Ttiriv7sB1V6u6k8NVuAox/KK1bYtFEunBeHi0itmlweDJxL+TTNIn5DEZIejv7O+2KSgH5qglQMTmuods7f54B2XxEwdmiP9kE3vY27ns7RQt6SjTqbwmd9Y3RdS2APx7XayYff1oA
DKIM-Signature: a=rsa-sha256; bh=m8v0/pj5YIHBXmpmtcD4RBpe85xEWaB0LLlNYUt+3rU=;
 c=relaxed/relaxed; d=milecki.pl; h=From; s=ovhmo3028686-selector1;
 t=1775822011; v=1;
 b=pElMn0Jli13QIPOARmikAjJsixTLKCgaScBCOR9rtLEH3yGDOjs6CrodNZyQjZmveXH3mzl1
 BNa/s1h2UvNggNzi5Iq3u3F8zDP06QJdyrcGbmucS1dZyk6iiYsgxrmh4eI0jXzX60lcHxQdOBw
 gEG9aH5M29MMumfbHNXdJTY1/ZRGnlNFuCYvdNtH9Hcly+kmxqJSJO9/M1WgjOrw97++UChFC2k
 r0CyPHv+0lMAmCLGF+wvvoOWyf47aAu5EkP5b7lO205bhrtfpdCrjLYHpucLAuEO028PTlmAUr1
 58W2QMHWKX1elB4Swz2E05FlljcqXJ88X4byyk5NkcqTA==

On 2026-04-08 08:29, Corvin Köhne wrote:
> Changes leds/common.h DT binding header file to be published under 
> GPLv2
> or BSD-2-Clause license terms. This change allows this common LED
> bindings header file to be used in software components as bootloaders
> and OSes that are not published under GPLv2 terms.
> 
> All contributors to leds/common.h file in copy.

Acked-by: Rafał Miłecki <rafal@milecki.pl>


> Cc: Ashley Towns <mail@ashleytowns.id.au>
> Cc: Dan Murphy <dmurphy@ti.com>
> Cc: Gergo Koteles <soyer@irl.hu>
> Cc: INAGAKI Hiroshi <musashino.open@gmail.com>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Olliver Schinagl <oliver@schinagl.nl>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Rafał Miłecki <rafal@milecki.pl>
> Cc: Roderick Colenbrander <roderick@gaikai.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Corvin Köhne <c.koehne@beckhoff.com>
> ---
>  include/dt-bindings/leds/common.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/leds/common.h 
> b/include/dt-bindings/leds/common.h
> index 4f017bea0123..b7bafbaf7df3 100644
> --- a/include/dt-bindings/leds/common.h
> +++ b/include/dt-bindings/leds/common.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) */
>  /*
>   * This header provides macros for the common LEDs device tree 
> bindings.
>   *

-- 
Rafał Miłecki
