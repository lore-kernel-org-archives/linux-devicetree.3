Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793901048;
	b=meNHILQ6vhAJC74afD2ACsIdidRPLUYBPt+oYay4bTZbKtFQEec3LCRFQM5O5xxYesO0
	 +3TCbep6Qb4O9qZ7inQ/GNX8qdrAY0nMLAQ/3rNr/MZSWSRk5fiXfpmO3TOG/C8Qnw5Qm
	 kAUr2xgVgdEJiTthW/v+62P9e7HrII/2hizqpX+ub7+2zogoznjoz0jlr0M7B/sX6FcvU
	 MWmOZitZ8qy/ONOdbx9BMbgDUFPojZGgGMM0rJ23eC2xRPA8uA0a9pfgKZXr6AIOHH5b4
	 4imy0M+EmD6DlB8P07/T7gWhGTzi7wvHDpyjhwZ514GfVZ6WpaEjjWlNzLyQHhVkhhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=T10mg0NCtNOcMbzwRpRiIpkOxV69UeTO/LUX0z+nOPY=;
	b=OqkGbhEWu5Ph4aNrrVAusNSWXOv90O5sSDJ8jGEZQiGwOPZlQEI9UHpO/BntrKZT1z7x
	 PKZnDM4ZenXamxZ20wfP4pX922zmPRG8V5R7CRtcQN4pBJN/2BUrtiQDk9gLuqoAQuYbk
	 6ukBDGcJW5I/ybzeSHH7a5SbMLiQgTzJIipbfh6+sxDrr5q2xHjRY+Vs9l7CrSCU+SVCw
	 hmBCe3h2SfoVOfSlABi3FQfMtbbcf9N2/mvkLpPcpMfcObw6YPfzgOWDkcibyd9BrxN0S
	 ypO//S607D8Z7OwOUuyCprBd+T5i+Pw0N/2Mc9QPcebs570/4FC9UrHKi8U5MK201+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=D1BjaDN3;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDBE606D803
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 17:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFDBE606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=D1BjaDN3
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso23714395e9.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 09:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793901045; x=1794505845; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T10mg0NCtNOcMbzwRpRiIpkOxV69UeTO/LUX0z+nOPY=;
        b=D1BjaDN3giwMB0xnnxKh1bUEQGpUhdG0kZk1gL7UF+p8WHizQRl0jrvNOxqK5rC+mw
         lbOmz1xvnjGBmSjQ0L4URnpCpFMDBK6JArKhf9oe/V8DdOrZ7EsJWSxnJvz3CeDMAiGr
         1nHN8W2vedsKHq8hWMannwsk0SLpQsSzIZ9RCwe5wGsw3gUwygbw9odDIgzyrgnJyF+W
         rB07uyL5ihzRlcut+7HOIJoPIHu5+ajeuww7vD2yZA2wzinaO9bppiZhMkWs+8DmRyOW
         VmmPurtaeI1wwyJeEIH5caj/9g5UapocpihJlzlrNt+F2hIPwBpPi5RXCe9nDO4/DwGE
         EVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793901045; x=1794505845;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T10mg0NCtNOcMbzwRpRiIpkOxV69UeTO/LUX0z+nOPY=;
        b=b+kfsxM7oCUprP9riQyEmxX39/tZy579UdD2DFtx5Q5XhFxxTYbapGJXffUDaEmwgc
         dEPK1NAvHz5MZxFZaYzaZX7QMuODmBKLKNVhfTFFmAlnFlZGB6jKSyzWoZvsTj6GfCII
         9LTkNhExhyVVdflQPIQbJHUGNyoyiyRRJg4Qri5WugaBc0RYQpOg4Y/X6C8M/3xBlS7N
         mKTysrrfcXSqB0Dib8sBGMpqYgwX/qmD8y5xu4WDl2Za7J4FN3ZbqtFq3MWl6v8pxIk3
         rKTwI2sGJHwoXvIjBtK3v+R0SKMaDB3oaoznuFL5upTjQs8Yb/g09hotm5xbj+YinIp7
         dbQA==
X-Forwarded-Encrypted: i=1; AKwUvBybe+bObtT6SNZy2NY//brOfKxXLZ2/6yp0GmT+4gSFIIB4z3M/YMhrF9loVU4i9AX/8Av82vv8dO5+@vger.kernel.org
X-Gm-Message-State: APuU4Z/kj2+Fb+78gv2rDDT9tNuBJYMnzkrt7dRgiQZYSdVTFdh9vdwI
	Tf2wb6CRJM4PgwbGSzbrfhYgWr5+p8+WY83GkVgVtLqo9b15oWGGU8xhzHIqXZml2Q+DlsTjrcF
	YJwGS
X-Gm-Gg: AYBFou1X+aod8naCO9GuGa0gsoaVYxGiDivy25cu/1iZtw8wuJEDyg99ijljPOx8R4+
	npj25sh3iywmTivx5+tYqzPXBhFp4cKlcH9/yRMo4aamvxTuY1bw0wWDQol59sqhSpLdm1AiJZX
	savq1mPtvYQtG9wHGsWgfYnCY9tI43nWyI+5OV38DclzkiCJsUbdMHLiRHr+VRSbnjPqW6Oh0Sp
	E9/BFVvM+RIShgUhGXPHOT8PfumIzkRPeMwxPUwUAt0OlTH0m3Uat2ov7QZq4UCokRavBiFwvEW
	aF4liGmr+umr3qcfXJd4+RKhVaOK/RBwWXA6fxc6OKALdp23Uk9QphYTgpjUe6KBThZZSx33V+G
	hJ9MQJDhQGoIaFZNy4DuZvnl5l7Vj6EsuljCk3hSYx54E8lTQ/6tKTQ/NOT4KN/i5UTQ6O5ypu5
	QO7rJ6Jreon+IIGdnkThkaNaJKjEWhTGmK+fZTS+ehyKAJPfArgrv1U1M+96nbETkWVTynVaPhr
	y5wtQtMg/2VwzVPNDFLeNtRA0+sy9A1tF6iL4wUh5zhREGWOZPcFyd2stWPUR4jmsgoqFYA3YO+
	BWElSTqI1SbzL9X3UOJoXRtyCIhDjgiAzrKjZO7yfA+XsWJE
X-Received: by 2002:a05:600c:6095:b0:4a3:7344:13b5 with SMTP id 5b1f17b1804b1-4ac182dcb98mr390804805e9.16.1793901045109;
        Thu, 05 Nov 2026 09:50:45 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm200497845e9.3.2026.11.05.09.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:50:44 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH RFC RFT v2 0/3] clk: meson: Refactor PLL pre-divider as
 a divider clock
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261029-meson_refactor_n-v2-0-ff4ac74e527b@amlogic.com>
References: <20261029-meson_refactor_n-v2-0-ff4ac74e527b@amlogic.com>
Date: Thu, 05 Nov 2026 18:50:40 +0100
Message-Id: <179390104084.2573818.1569105668888286892.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=858; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=RepJ4XPfeKmVot5v9YpoyqtS578offaAhAsWd1iXvqU=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlvDn5uK2lTkH16raHEndtv5saPH5IMuqqOZpy7sclwE
 0/l/tmlHaUsDGJcDLJiiiw13NXi7yS1vsyarnMbZg4rE8gQBi5OAZjI37mMDJtFdLed2ra09Lmo
 zrWDh2rO+B1+Oq+XJTNH61xGbjJDpBTD/3TGS63HFoWsmzpr67XN+jMYOd2f1k7Z+adJdorCzW3
 tiewA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> This series refactors the Meson PLL framework to remove the dedicated
> PLL pre-divider (N) parameter from the PLL implementation and model it
> as a separate divider clock.
> 
> Currently, the Meson PLL framework models the PLL pre-divider using a
> dedicated n field in struct meson_clk_pll_data. This makes the
> pre-divider part of the PLL-specific implementation, although the
> Common Clock Framework already provides a generic divider clock.
> 
> The pre-divider is not intended to be dynamically adjusted. Each PLL
> has a fixed N value as part of its configuration. Most PLLs use N = 1,
> while a few special cases use N = 3 to satisfy their PLL input frequency
> constraints. Modeling the pre-divider as a separate divider clock
> removes PLL-specific handling and simplifies the PLL framework.

s/framework/driver

-- 
Jerome

