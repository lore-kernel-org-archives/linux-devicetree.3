Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634356;
	b=sgwDa1XJO4xaAv5jPSRgcrtwl1PT+DVyWBe3G9d+DAcKuTESDgBsR6YBQdxzPU/oR7lr
	 P9gHUECWRa8X7C1lGsJl4X45LK5t8TiqAB9qyhXDmaXhjcKYwjsgZSlM0wT5qbUoJnxsd
	 H6HKSKtbYYuq/GEOE4tVrQSuWzoaoo1ZR6oT4X8Djis6RKJqpt2eY53M3fzpD85VeNMwz
	 2LKD5NMoMSnAqLjrsmgKhbBPD3H6orKlBWsXRpDbPGfGe/IAVV5bFophVXFuOHxjz7JGF
	 qn3rbN6xwYqfBwb7GQL9o/ib9j51z9FgKyulsek9EtiGUnFARBdzCUxc1cH/LeqvO6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634356;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=CDQbjZRD5r2LD7/4BjsL2T12qmTPHlWO1n2mr1qyPAs=;
	b=oaX9vfJ3atfu/ChkXxrkWGZrNHpdhdzQJF2sLpsw5yrm8uUXX5ZfGqPKp6zpw6rdNHzU
	 ZLRiv/w3dgHAYXbqlUou/7MgHQk6cvcdcxE6063fZEwV6CHZLq2nmm+glLJ8gPQDtX5Mj
	 HeA3CTcC9fFv8aZeVkUFfo9MOwRIBOS80wHfWz/rBjgn4QAkA0MUTPL4iSnzDvXGeASJG
	 DIF5h/X1VweHfskDrbJ1Dzm8L40Y+AVWtv0ReOaEcckJYaBx+6rLc5UqHIC12Aa0DFf8y
	 v/aUzlUxxPbXuNbhfT7KX6C/z8DX9MWtwKA/QbO1buZvOt7yUPe6el3pvE6DHoxQaZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="AMecBw/O";
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9B5606A321
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 19:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF9B5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AMecBw/O
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2f04ad2c46dso38663195ad.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795634355; x=1796239155; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CDQbjZRD5r2LD7/4BjsL2T12qmTPHlWO1n2mr1qyPAs=;
        b=AMecBw/OeClvoiGfo4CBS0vwu3d45iyTlSHTdmQzaMi4s/WEAxD7o+i1BbLKkhtvmY
         i/G4pf7qbzvLrWIo/CIQbAVTuhqj0fDs0YDVEdvlpSm3ii6/q5HgItZpFVr/X6pWiP6j
         8h8AqkDhyr2qybSh1bBir5+GZm7WaXm5wg1WA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634355; x=1796239155;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CDQbjZRD5r2LD7/4BjsL2T12qmTPHlWO1n2mr1qyPAs=;
        b=qWi/vF7PIzXUHoZyOnHdH6GMP5gfjp/t+IuBmrU8FVNkLabqvxjnWd9y1DkMuKk6i/
         0teueMuDiPU4wnok9tSZpgEO9STyOgO8ZCaYT975/0jtcFnocXtElpKRE3bP/TMvBDLr
         Hj11OshfJBuuTo7BEq6UyYq+/8ALXnEu6xIziK81da5hg1OvvF6UIt1c1UArvewxRJnG
         D6gfjug0FgmjRfcAe2ZOvDKvSn4s9LzT/yZt9/6MzTVeSh8V/zqOGaumPxJ3L2eF00tA
         HxEymx7jjzpccLt6fpKdXmx0YB5LQ1ikaYMRqdgG6lcJw6V2OUM7Dqup1uMGqiGqRxbN
         /XmA==
X-Forwarded-Encrypted: i=1; AL+hErHojhXmQ1/jhkmUd2D/LRir0DFvZkYv1OA2FNlGaox7cVl030Lnn9JXYhe88Q7SeLTi6T9OW/tJ2eUH@vger.kernel.org
X-Gm-Message-State: APuU4Z9ibZpEqbd8aT0JUgYqNP2ElqVBUwo7WVmQk6R1CMNhOp57ypd9
	a7fHVrOj8T0whfWpUNnFBtpcYkYLSuActhhu+o9RnhPr/412dbArK2ib4r2jWlC8Xg==
X-Gm-Gg: AZFdTZfLmkI8pvXwo7aoh5PEII0r88lWcoiSkkOIBMEnJy3pumt3iQ8ST5IpUg/7gVM
	DJe8DBW62v84YpxJ2RM1aewlXAeWVslxL1apnTjNPJJpNuCRldNRz0K03dk3Qr7G+SHGEbzl8cM
	QVkxNu7UxHcIreFDb1gIZgcURjjfpt4tZSJKieoZVpA/Rbx4ed0GelrHul7oMCj11JptWE2BGA8
	ID2VkRJgMyRFHZqyLqBNxzVw2EcICkbPiPDhcPCIPD0ke9+baEbOwG+oM9hLUTPuutStnat5UgM
	pI8sJo+/ZL7ygiZNZRmexEIc71Fq+rvmAgUzeo8ew8S/1vZJqLVzptlmxUSoMvyE9zgXv3WSxq0
	7XCu1/ATTavGASlXnnbeyM+UF6BbiptYzkqQd7pYOV3uCnxznexi2ogns+bK6ciUrvBujEjTG4P
	yvCzBBebRAAZ3fxcI9lNXZo3+Jfsc+fNfYX9z8ZfeciY7n4dyMULJNLFQp8x4qQcktLGqcU1uJD
	52aBEVZsawsNlLby0FKn9EwjoCoMA3QjkcKZCSGRC9dfbm1BnmVTRZTcQsx2dWAzfE2Y9szbkQS
	ofwmp0yNIUbguAv+0Tmzf1wJDTSibZbmRGK9+x6O7xCBR72f7pxs6zhbm5vKr46p854=
X-Received: by 2002:a17:902:d511:b0:2f0:446d:30cd with SMTP id d9443c01a7336-2f0446d33f4mr180619865ad.31.1795634355343;
        Wed, 25 Nov 2026 11:19:15 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:d0a2:f616:6ba:a1ce])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2f03ee84364sm93389045ad.5.2026.11.25.11.19.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 11:19:14 -0800 (PST)
Date: Wed, 25 Nov 2026 11:19:12 -0800
From: Brian Norris <briannorris@chromium.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Radu Rendec <radu@rendec.net>,
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>,
	linux-clk@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	Mariano Marciello <mmarciello@google.com>,
	google-soc@lists.linux.dev
Subject: Re: [PATCH v2 5/9] reset: google: Add CPM reset driver
Message-ID: <awc0sBl6q6A2Reaq@google.com>
References: <20261125000349.3385325-1-briannorris@chromium.org>
 <20261124160343.v2.5.I0b1ad34a718a9b5f667d2481041970ea45989dd3@changeid>
 <f89e293688feb3f9bcdce0f1b6fed0ee424e5cd8.camel@pengutronix.de>
 <awbJUwrBQw5TnowW@monoceros>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <awbJUwrBQw5TnowW@monoceros>

On Wed, Nov 25, 2026 at 12:43:40PM +0100, Uwe Kleine-König wrote:
> On Wed, Nov 25, 2026 at 09:48:04AM +0100, Philipp Zabel wrote:
> > > +#include <linux/mod_devicetable.h>
> > 
> > Please include the specific <linux/device-id/*.h> that is needed
> > instead of all of <linux/mod_devicetable.h>.
> 
> Or better still, rely on the bus headers to provide the needed
> *_device_id structures. (That is <linux/platform_device.h> provides
> of_device_id (for patch #2)

Only very indirectly:

  <linux/platform_device.h>
  -> <linux/device.h>
    -> <linux/device/driver.h>
      -> <linux/device-id/of.h>

> and <linux/auxiliary_bus.h> provides
> auxiliary_device_id and of_device_id (for patches #3 - #6)).

Also quite indirectly.

I'm not sure how to take this advice. I tend to see "include what you
use" feedback (and not rely on implicit includes) elsewhere, which
suggests I should *not* do what you say here. Do I just need to guess at
when an implicit include should be deemed intentional?

At the moment, I plan to simply go with Philipp's advice, as I don't see
the harm in targeted, explicit #include.

Regards,
Brian
