Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEC53101B0
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 18:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783102948; cv=none; b=pFnKCbygjPZFFMh7gdboMO1zFYVLswhsTv0wFqCMdjqtF6dZoHVLbjooFZ9Om0eAlR+I+3n2i6jVFBr7x+GmEUOnl1r1qtWfuvtitoNfNKcWeE/q+6zcWk1PY7R42P1/DRSqalg7wH8TUuGGzmcRXfaQziJRJl9prRkhz4Na+S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783102948; c=relaxed/simple;
	bh=hxBGVg1I3Scx5arwHErmUZuqdQcchgsL/BnGaHD6KXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o9Vds3MPb9jH/EJHnEcoTes/51lKrlSUwTaMYw8FxQUi+RlaCswvnWNa1N1WQPGHsvo+/tnmfrRnNB84cPq0BbnW5/4b/FX/iOhE5JocGVRIN2Gp5IYwm8V4dUJEhwL2zk44YHMMvnDSi0FZ8ssMNxj8E6ZMGRlwkwEUNTqNsvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+PZACzA; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+PZACzA"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4728c12ba97so519204f8f.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 11:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783102945; x=1783707745; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=bxI7BvM12Nerj4aOhcbX/lZ/mvSXXX9U7cR4vYDN6E4=;
        b=T+PZACzAU3Z+o6UqtQlXQggO6fAQenhdbZMxi4AHXwdW4wP7yYBuVqsmHXh54c5uEq
         ArKcmDza1O2+4/ZocIVCHNEvkLTWqJhecZinubXA+GugaudOlnSYDUM2PFp23nsqOxJs
         9nzT6UYTZAu3pnz4C5lKP/kZgZ2QU97nhOi3qxrZFNeFKAViTmbBgvrnd/tn23xOwTPb
         1fD1PB9j0gtTAineiFdGDtKJWrDcDm64L/lhKVO2muZDPQYAVzQjwjtEA1dQ2EFU6ezV
         ZlFwzUB0Tv+cwt0Utg1EEgDJQJ9FsogxRUEl3JO+1HUQTwsN3VwbbhiNVMibcJmcAXxO
         rEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783102945; x=1783707745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bxI7BvM12Nerj4aOhcbX/lZ/mvSXXX9U7cR4vYDN6E4=;
        b=dEVFjuOQUX05yxXM9EZO2fhQKltwXpxZELNhexn8ttLb2s01pFOC8WD6QJkUaNnE0x
         DEBx00cflXtVkv+pb46xRECWwjueH2vLbSIWLBazZV1PoIEUuy+sH3o/q6NvO4xtPy2W
         nQnS3qEWmzgVuScMN/IEMPannairlOT9utoTVYz29KHG8NsqxEgq5FSPn6AVDGnvBzcj
         JntyfRBpWFwHEwSbi6NZ4miWGgKktsaKhVAsbsR+xbx2P7NjaVtgKLEfqD4gahS0v/CN
         w7i6FvmFoDwJzPRShTKP9jSPW0KjDo8tOGwo7r61g6pMBagDF2RGjcG/jgQAc2b9yLT7
         Q5oA==
X-Forwarded-Encrypted: i=1; AHgh+RpGyf1tBYlAFqTXtSqHE0UyiWPFj/O2d0HenMYs4OKX9b3BbqsD4qGUBt7jfh3ZPXveeixxbC4sYCAl@vger.kernel.org
X-Gm-Message-State: AOJu0YxlR7xy2nQM9Gt4uUeX9gJ1bq4IFyGpo/m9A6WkK8N//M31rMwX
	N3x72DHBgPPzl5QGxthPRIq2YT21R6ixDC4XEZHT1QwWd0zCJ538JJMx
X-Gm-Gg: AfdE7cnqjnEcIJgmScoPeHF/ZcNpc7SJooLeflofrRv3eck1/z8Q6Be1057xwEjuXaF
	pHfS8+9REN5Sha//gG7mer6lyL7nFoxCEukaKe3okQivHBPB4c7ksSC7S9GnRcB49lHzk6KXrBx
	x6KuvPFsivAMFP6gF9Nrz3Q3iiEE+gQZyiqlqkhQc5VB+JznfU7SopR70Cxry/I+Fjw6+YR00kY
	hYue09uww900PPAOu5+eLr4Zu6CfkRmfd3cppFsEpoY8zZHn3/eHSSY+8pGOtMcCd9sHTi217OJ
	xU/NCm7OjiYprQvLcEE/RR83u54ZDAQTlNqLTaTBtA5+5jEEnnrhqWQlxdsL2LJTH7OUATCpf3+
	tAxO1VS+OCHf7pmvXQCk9YBE5JVhMLcYscXWbqXWDBtxtWkXua8meRTUwpXT1xFI8yw+wWUcgRp
	xYYtGmhhnjr7FWN6yZM5pNrhxg2szi05ScpJ5rU36DDCncyDm1gr1zw/S5xPhi0vLO3GiyqXsjB
	CYVdyeL
X-Received: by 2002:a05:6000:26d0:b0:470:258b:b20a with SMTP id ffacd0b85a97d-47aa96997eamr636555f8f.10.1783102944899;
        Fri, 03 Jul 2026 11:22:24 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9b4d850dsm1388530f8f.0.2026.07.03.11.22.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 11:22:24 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <8c2f0ddd-5722-43b2-baf1-4653de8025ee@gmail.com>
Date: Fri, 3 Jul 2026 19:22:23 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] media: i2c: add os02g10 image sensor driver
To: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
 sakari.ailus@linux.intel.com, vladimir.zapolskiy@linaro.org,
 laurent.pinchart@ideasonboard.com
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>,
 Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>,
 Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
 Walter Werner Schneider <contact@schnwalter.eu>, Kate Hsuan
 <hpa@redhat.com>, Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260702072502.7907-1-elgin.perumbilly@siliconsignals.io>
 <20260702072502.7907-3-elgin.perumbilly@siliconsignals.io>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260702072502.7907-3-elgin.perumbilly@siliconsignals.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Elgin,

On 7/2/26 08:24, Elgin Perumbilly wrote:
> +config VIDEO_OS02G10
> +        tristate "OmniVision OS02G10 sensor support"
> +        select V4L2_CCI_I2C
> +        help
> +          This is a Video4Linux2 sensor driver for Omnivision
> +          OS02G10 camera sensor.
> +
> +	  To compile this driver as a module, choose M here: the
> +          module will be called os02g10.
> +

The whitespace of your kconfig entry could use some care.
The usual style for this file is to indent by 1 tab, and then for the
text in the 'help', 1 tab + 2 spaces.

- Julian Braha
