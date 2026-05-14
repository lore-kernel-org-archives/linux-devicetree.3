Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2125825B094
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 20:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778788909; cv=none; b=JiSaMbps0l+iZkVZWPfeQCrL+hl5wXklKONYST1EhdHZct05+zHrKqX0Yi1Qz5nLL03phSHLo7aST96pdtOOZ1RBE0WTl9qdsP/vTOqa5mbdlbBj05LOty3ivUvhJAcyKH9lzQ2OjHmJ6sOgIPiwgWmTaVzC8AoCPr2VhkQEmB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778788909; c=relaxed/simple;
	bh=SUe2Z7csLu3EIVSgP3ikRvI6dwffX9wqRIZ9j07Ovhw=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:Mime-Version:
	 References:In-Reply-To; b=e5XlgEeK0hBwwSb4vHneI6WSIgxJ5pSh8RB9dDCyDnaowGpN699ZJH8U6avccjQT0Qlb29Bxw+yP861fJe1V3zI3GBl8wGTGpztQaWOvuDkIZRm9emS3VEOfrvdbARLNls0/8GgHg0yT5kgrdOC0Y4v5Q8NZTK7f64JGpjSV6eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=DG6zvNGH; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="DG6zvNGH"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1330d6bb78dso5235059c88.1
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 13:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778788907; x=1779393707; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=apzLLVPJoJDzSyz6mTxviWGjUoPCsnXa0PozzLDEgxo=;
        b=DG6zvNGHi200NQ6aoIFP+TdLjIn/iZoZiTfJe3oMkkcNVyw7uBWa5W/2wYvlrR4rk+
         eTNIg9nUmwwbbb7Ng16wWu5AxjYc4pFIP4UM8IbAv96ZlZVCSsI4EO0e1X68X5S1BawK
         ZQaTlhwh/ZUEcHspAlsp0NHiHBEwN11YqUktC95LIn4tR1HGqAFySAnC9Y3aCmer7kKg
         ee5CPUEFQgBzY2EDkEuj9rb+zUw6vDregfZsAMu5VbqNNwsL4A6kA/iPLWm8waNS/140
         SRZA8TNBaT3/xU7uLoC67Z4VIcn4ifF3+vyRvFuHtImf1EWjQN/le09L4ph7ItHIFej/
         D3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778788907; x=1779393707;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=apzLLVPJoJDzSyz6mTxviWGjUoPCsnXa0PozzLDEgxo=;
        b=XFMhp/qhsPG9eliHQVMFs5JyrystUtIaxppSmnjqH741D9HLbTy1rHTTUgnRU8eyM5
         AIDhbuiPU2blttPskSYUyCeWA+HZ7sgd2Ld7lLZ6VV8Bk7nnH3cKeuBGuW7kX8IIuFPd
         oU1IYs/jzofoCAFGe+e7kaiAE3GuhM7F86eKzZXYxa4XVRYI9QWQMqkm4MTqpXWDdjSn
         d2J6HYBqZKy2uh+0sBb5EL0pkEUiQZs7Ft8b/ptBBZEImPDEBLZseug/AMEgRU2YtZlN
         tzjtLCn2uThKwuJVtAp9a9F6elN4IfBjfkuDZG1Kq45gHK8TGdVbV4bf5ydN/tqCoj9w
         oVZQ==
X-Forwarded-Encrypted: i=1; AFNElJ8RAMzuI/222y0FQU/Fh7W01Q5RzTdiY6QSi/zhlZMyF7Hsrh4nQuWVbCRCEC86s/l+oRKXHVhQehUp@vger.kernel.org
X-Gm-Message-State: AOJu0YxTGkjPiv7sokZHooiAsCpglL93kfcx1XC3dsOkZG7tjhGss+bK
	lZ8cVwxsZbSbwBtgn4OTlOaIAPOqQmVpjzIw6xqQHlOcjVASqkNeBsPvP01NkOi5dxo=
X-Gm-Gg: Acq92OF2Ry7VWCfIfOueQeAKO3j9+a0047RM7PJCFQ8UZLFROHFEKfAVA58/j8UKt3D
	M1i7W9/kX1p1GNoL5toN3wVDUPJ0W4k0VRGA9bqQ/8Fnp++Pb3+dwHtw7ku03mHx3T16oFl/YEX
	Pr25q0wvdPBalJ/LaCaRJbl/AssjlrGaD7GGSEu5DZX8XwB/HuIKgQJYfVr+kAIk6Ah/eA15msi
	LCMMlWIKQbrb0D5oeScdUpJKIBskMYyRj0JsFlwz92gE9dgaLLA9q80K9hHX8sVE1Q3zlArVz82
	9NFcuyJQEGRwdVN4Wy7ppkaTLJuEyTUmDJyGkBckHxgurljgO8iRBVrStt8jM79Ufs8qdPlnwdt
	hVZ2JTTFkyVzRkKj6+GqK7pCJXTfNwJDRq6QUdUC0TpINGkTn1NDoHvHRD2Cie1MrGJGgl/WO1x
	5QFe6zvs6STLorfbVGlJ21oTiDT2ooNFJfJw==
X-Received: by 2002:a05:7022:220:b0:128:d29a:3d45 with SMTP id a92af1059eb24-1350474413bmr286821c88.22.1778788907100;
        Thu, 14 May 2026 13:01:47 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc33a67csm5914767c88.13.2026.05.14.13.01.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 13:01:46 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 14 May 2026 13:01:45 -0700
Message-Id: <DIIO1I9O6X0A.21ESYHG7CYZZX@nexthop.ai>
Cc: "Guenter Roeck" <linux@roeck-us.net>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <skhan@linuxfoundation.org>, <linux-hwmon@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: trivial-devices: Add Murata D1U74T
 PSU
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0
References: <20260513-d1u74t-v3-0-27bcd6852c45@nexthop.ai>
 <20260513-d1u74t-v3-1-27bcd6852c45@nexthop.ai>
 <20260514-dazzling-ethereal-bumblebee-d9b69e@quoll>
In-Reply-To: <20260514-dazzling-ethereal-bumblebee-d9b69e@quoll>

On Thu May 14, 2026 at 4:43 AM PDT, Krzysztof Kozlowski wrote:
> On Wed, May 13, 2026 at 03:33:02AM -0700, Abdurrahman Hussain wrote:
>> The Murata D1U74T-W is a PMBus-compliant AC/DC power supply unit. The
>> binding only declares the compatible string and i2c reg, with no
>
> Describe the hardware, not binding. What does the hardware have?
> Supplies? Pins? Clocks? Interrupts?
>

Hi Krzysztof,

The Murata D1U74T-W series are hot-pluggable 1U AC/DC front-end
power supplies in the Intel CRPS-185 / OCP M-CRPS form factor.
Each variant delivers a 12 V main output plus a 12 V standby output
from a wide AC input (90-264 Vac) or HVDC supply, and includes an
internal variable-speed cooling fan and on-board voltage, current,
power, fan-speed, and temperature telemetry.

The host-side digital interface is a PMBus 1.2 port on I2C.  The
PSU's other electrical signals (status, alert, current-share) live
on the CRPS edge connector and are consumed by the chassis
controller rather than the host SoC, so there are no host-described
supplies, gpios, clocks, or interrupts.

If the above two paragraphs provide the adequate description of the
hardware I will include them verbatim in v4.

Best regards,
Abdurrahman
