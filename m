Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FFC49F128
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 15:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790262746; cv=none; b=V4oAiOF9siTDXSyOIIrzOQkPdCrguHhwHaPkwysCp3PillcqVj3gFkYd2Y8shRZf39a/A6sHyq1oPeo6zfFMs3KmhGmQf+FEk6lmvEAj2mrKci6c76GO2JTEG/pT71QtH/skzXRUSd8bB9NlpeF1vULhCb+iNOkkSB1o1nKL5+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790262746; c=relaxed/simple;
	bh=Vt+c/g5xxiGmzWWCamOWYCXzu3vd6GOa/3OwsjwojAs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EbUWHgTlIPTZv8vAVC/Epf57BMaW8pULUweYNlIczmvvMZ43ShdTXiyARfAMsh3OhYPimuOtn13GOwdCe345r8BVlzL2j976TpdqAcy9wTGsaJ3PjLJgC3gZsFjHhlZDTxM8LYtjD6D1gtO0BNa7MkKEiPP35NLKBCX+1QNmK40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cGULTHjJ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cGULTHjJ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3931so17030575e9.3
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 08:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790262741; x=1790867541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1GVltwZjugbFU6GZvacC8y2lCpU5V1LZLUebStEzuzI=;
        b=cGULTHjJyKkXrWL3YnMZuoMYFBC1kS+qXKALn74YogQCL8gxlOseB9GoxhcbzntF+e
         Ftdydv+hmxiXPLt5OxV6sCndCvqWVkhyDqFOplxe/2ibM9VIYCdix+hI2yEMmqZIGRba
         FWqrF1CJcpzlzUh9F4JixaulwxvbjT7BI9LrmOK5njUie/zf4+1WtYmSmojmDnqWK3WQ
         T/g8v7vPJ0YsqiCx95/ZlKEuPJYlGa7K4i7g/r7rpS7edaDkOopgOJMXjdLleX/5ZAPK
         P7Xg2Mz6nb+gtJXq7EXfOIrl4xR+JIdpqcQF0fIwT8DULRz1QBuEuiL6G1rP4z7Dk+ab
         t+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790262741; x=1790867541;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1GVltwZjugbFU6GZvacC8y2lCpU5V1LZLUebStEzuzI=;
        b=k3IpAkcmrAjAVMMa3LnLQczg4x4zauQpo8NtpSUM42Ezrdgho+hBS4ux8wTuQ/QX5f
         Be7LI9BMA9jAWUhclsk3OYqF/rCp1km7FDNKkihBubasAafHf0COBIMdmAg7lQQllGcS
         75wUyWsVCZrjkutxrJ77k4AE9HxpetAkBBjNeIfXQHqVzgwNX654CjkCWVg6CGYe3IiE
         MITbFD57L2jg9/DMfAl3JjclVneiuoz73xoEOzJVVPr2fwrrvl8Bs78xWLDsjzFHKqxx
         bAA4XwCDCA3t2TV78XDCAkJyIxeuHCFVmENawufcoAgsul5WS9rFsnhOhzj8Ty4+gFMW
         wQnw==
X-Forwarded-Encrypted: i=1; AKwUvBx9WwIbQUf+7qwhBM1O4g+d7h5f5a+Y4NAkd6hnbJPLQhO6WtGnzqHHfbwwYAMg0SsRj9eN8y66Sxrd@vger.kernel.org
X-Gm-Message-State: AFuF++meakmMO3Q8hJRGQTXbKZzEeXEWQS7qIMYp3SfpvyrOl5OX/cfT
	ytgZrKOpWj2KYUwbipb0un8StezV6rzFtxzaDXsje4mrkoo1imRlW9wt
X-Gm-Gg: AYBFou1WsaQGFO0Ej9MhDoiWK9jCSQIA94yqxQdoFVDIxrJjp630Z4LrioHx8jaXS6q
	ROig4xyuQgEdHUTaxXqFsDLYj0mTYXy1xJ/RX6FSarZmAQnQlmkDnrcZx2NhBE5k2OXtqmPOUV2
	fzwBVZwvLGFZ9tQcWFUWhLg3gXTwNjy8iyXQ+tOEdIZ7S7Rg2eUtxcMiNKhLthE2BNFoefVbqb4
	cfg+Gt9pexA1o7qnK4K4GC4h0QYaVAAsQxRcLBWwbt8b7/PVn1+qZJkKdu2mU8t6Q5/6k5nyKul
	gRA4gqyl50rebTFHQCHKehETPkf5z8JqsZ5uMcZsSu+ms5AR8bO4PpHHR+ybHjtPncnkyg5nwgO
	iaJJeB0Y4dpAUoGtosOVLfxlPt+gDcFNgkrEnLfO/OfKNjdXxPGZigCbVVrBw1tjhMg0pluINBL
	WNw6vKF8i6wSpr/ytvdANqH7VB+OP0QiwZZE0Y7GrjStBpFvDH/MFZ8Tr0ISK/EehaLdIhlSVgv
	mesPZf313C9CN1uexBVgu11KzLd1zVMPOtFgZQdJpBD5mOC+VnsvtzcNEXfyh2FNZ85WPBDcCgS
	fWsBabjHepOmeSawJCMAWGMtjJ7qN7hCyj/WLiI+Alsro4nCQVhzTSo5SUPrVz6KCIQXqF7OWuP
	41u3hYVVILbUZOiqdihSeEMgWnjPUV7j4/jp/TcBnypCFvb4xmCy4X8q7BnIe1xh0rDfXSGE3YR
	cZvnXk
X-Received: by 2002:a05:600c:c48e:b0:49f:ce72:dfe7 with SMTP id 5b1f17b1804b1-49fe6710a41mr44375865e9.35.1790262741344;
        Thu, 24 Sep 2026 08:12:21 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd3d5csm72255225e9.14.2026.09.24.08.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 08:12:21 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:12:20 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonathan Cameron
 <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] iio: adc: add driver for the MAX34417 Four-Channel
 High Dynamic Range Power Accumulator
Message-ID: <20260924171220.00002cbc@gmail.com>
In-Reply-To: <arUxl7QeiEzFlI7O@ashevche-desk.local>
References: <20260923-topic-sm8x50-iio-max34417-adc-v1-0-41d4ba1bfc41@linaro.org>
	<20260923-topic-sm8x50-iio-max34417-adc-v1-2-41d4ba1bfc41@linaro.org>
	<20260924095457.00006ed6@gmail.com>
	<arUxl7QeiEzFlI7O@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 24 Sep 2026 17:20:07 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Thu, Sep 24, 2026 at 09:54:57AM +0200, Joshua Crofts wrote:
> > On Wed, 23 Sep 2026 21:10:23 +0200
> > Neil Armstrong <neil.armstrong@linaro.org> wrote:  
> 
> Joshua, below also something to you to pay attention to on top of the good
> parts you covered already.

Thanks! Unfortunately a v2 already popped up on the list today...

-- 
Kind regards,
Joshua Crofts
