Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC78A42E8C0
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 14:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785508410; cv=none; b=LBaF8cWx+dPr4CGTRGX97LefGDUGQQThrWp7pQa+sJrrtBYDz1I30D6Tqi9aEchAdTGlYcJKxu77FuHN4RyA8bmB67VcTPeKaW6+u6ocU4uRFYuTFwtSWwim0g9OqDAzDHXEjnQ+G5i58MpsAluqtwifGtRMv7bX49BzYaba8UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785508410; c=relaxed/simple;
	bh=ijNh1l6urWW2UsORZiLTXZySDEmKMwL5HbqApkuKIsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bh69hjvHrg0udFdsERu4UjQcQLXQb38dRpHAnYtSy4eXXEa9x1tsRrOS0ox5eX3W134hQPIU7leD/v4UzD07xGhFZWDaLbNYWRB5Lf5JrrHlnZTdGhGUMCXb/9g/W2eOmeENn2niOehdqWQq8HNtc13LQl4yCgh7Z2zCzDvZNnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e9AfqtSF; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e9AfqtSF"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39f631dbce3so7365021fa.2
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 07:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785508406; x=1786113206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eA4/Jfq3oApsdwkMmM8JpBKsrNAF9FmOl3wpFinK2xk=;
        b=e9AfqtSFJDgyyeRFiG2tY3K7naZGDh1FN+F2CE63VVSaP6TmSheGFJXylc8oaneNlI
         6EDtgbsNHcQCZsRQjl7dmEhGgCOdeqV51LsGsjgrOMQWVFZ2XzD1CHFB3gWGKofKPD1y
         jcM5CorF7o9gZz6vEzn80KErhxaSyCzX3scFUZ3D5NvAABqe9P/hDR3sX09ibkkRQPQa
         0UOKYz9Qv1Uc8yfFlJM57D+eOTyZ6xDEY7yW31ZdPTdgQDQZjJAUiFr4uHybzcGqwnCP
         9VkyHhi7XDSmdXyGH9vHvW1fqpjF1qUbesJ8l12xezYyala8Fl1e52OHZGt8wQZH5qdx
         p6Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785508406; x=1786113206;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eA4/Jfq3oApsdwkMmM8JpBKsrNAF9FmOl3wpFinK2xk=;
        b=I3uoMRcgiTTVgS0Xv9llVLomnCpVGgdpUpX2CsQQoDanRb9wBpV90dGCX2sDlpLAID
         cfeNiRdMyQLQMxijdIIKeghXpOVXacxrvaNxAIsYo72Znlv7G1F5oEr63xhMdiUxgDzF
         upJqfCGLYFQIsf2yelK0QRXtdMwiHFtYkCGye0KC3PQSe/rCOlBD8H5/ERxukvbpLNVM
         wuHpVNJwvhwcivy24pse9CgxftQb4zgQcyqerhx8qUaSv7o3w8nLIgjITL9DHpe2LGxx
         AldhMLmiaDgsPZdU2Qmp60FM0idFAj/M2Gs/z54KmSisayhL4GcxzzDTgqaZysYhQtSG
         LfMA==
X-Forwarded-Encrypted: i=1; AHgh+Rr4mqzwogE2VwUn+8B97ryh8w218cQjCXmybOnXesj7S0S/9u4yUK6W+lTXj6CbMfD09ngwVR0UZkU3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9U0dB8SJzzWjUWKuLhy0XMwRU0hRzrn7ZhqjhfUVaHrcs5ovm
	B/y1G6CRp6t3Upe2TpGfpACXhvIKlA0G6w1w4WcnqDT97iVGA9LS9kRF
X-Gm-Gg: AR+sD10rAO5xZ5pTv1ijqToWssGx4ahqrUHsv6HA/cp2jA+NVfbJF4FdpHLrNoJbaAZ
	xEQ3tCzpiOjmyk7+eGmcICgH5XGdoxE+U23lPLhgO2QZu38u1NMqx1o2tFkqGJWQl370478ZDAr
	UBoiw7WHOqyC5IPmLAm9E1qXkONtG1w6j3jcNxX8bPtwNyh00kEMy7GOXzkOGt/7IZAT20mZTPD
	PgzVOnKbnJXEqa6bBNA2lrSgaaI721Tt/P+wca7pCPXlFAPqgaxmS6x9cGkLFr/Jp+vWcBEXwRi
	4TbvbKHAvcDvwgujAt06UOEtxQQtSUgqgNIVN6/4wSme2mX8Aseeug7VlSLlQ8B7q1P5kCB09KH
	nlzMg+uutIoNs8Cxp1YKqXxhsfB+W6MpATfcjWPMUTKFvKeC3pjk/gbwPqTqvaFSKqs9+UK1+fa
	nM5AgBbmkhrxft+vXNTqtBeYMb+H3aLPsdv7V4vAtL3AwaMgYJIe7KfF8s3H3EBa+cHX6yNcNr
X-Received: by 2002:a05:6512:3d0f:b0:5b0:17e7:67cb with SMTP id 2adb3069b0e04-5b2e1fc6317mr582376e87.17.1785508405470;
        Fri, 31 Jul 2026 07:33:25 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e23c556asm341380e87.9.2026.07.31.07.33.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 07:33:24 -0700 (PDT)
Message-ID: <38397324-56b0-41e9-960f-152a16ce8b12@gmail.com>
Date: Fri, 31 Jul 2026 16:33:20 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/16] dt-bindings: usb: mediatek,mtk-xhci: Switch to
 ports for USB connections
To: Chen-Yu Tsai <wenst@chromium.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Manivannan Sadhasivam <mani@kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260721065413.2306137-1-wenst@chromium.org>
 <20260721065413.2306137-12-wenst@chromium.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@gmail.com>
In-Reply-To: <20260721065413.2306137-12-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/21/26 8:54 AM, Chen-Yu Tsai wrote:
> This reverts commit 454a1e3cd36c113341d7b71e8e691c6e47ab4a8a.
> 
> MediaTek's XHCI implementation supports both USB 2.0 High Speed (HS)
> and USB 3.x Super Speed (SS). The block can also be synthesized with
> either HS-only capability or HS+SS capability. The SSUSB controller
> handles the device or gadget mode. Saying that SSUSB handles the HS
> portion is wrong.

[...]

> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Super Speed (SS) data bus if SS-capable;
> +          otherwise High Speed (HS) data bus.
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: High Speed (HS) data bus if controller is SS-capable.

FWIW this is opposite vs what the (most common) DWC3 schema defines:


(also true for mediatek,mtu3 and renesas,usb3-peri)

-- Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
  ports:
    $ref: /schemas/graph.yaml#/properties/ports
    description:
      Those ports should be used with any connector to the data bus of this
      controller using the OF graph bindings specified if the "usb-role-switch"
      property is used.

    properties:
      port@0:
        $ref: /schemas/graph.yaml#/properties/port
        description: High Speed (HS) data bus.

      port@1:
        $ref: /schemas/graph.yaml#/properties/port
        description: Super Speed (SS) data bus.

Konrad
