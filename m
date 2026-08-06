Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153BF311C2D
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 18:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786041257; cv=none; b=CKOIvIe6sLlMyMkS+RFl8l6e1pdVwVCwEVxVSLYDAVj6/ZcdY2lwtdcpM8uFJHqSN9zilmk0Jn2MyaqX/aoI21jJv/hpHQcipqBEqN6T2Qju2qAJ91vNvA9wRaLEHWSxboLCZVavDY7rDvcpvIYV0ZDgjStVl8sk2XqpRUPwurU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786041257; c=relaxed/simple;
	bh=G8P+y1KOAQ0sMjU5M458bgZf/2vH+0bbDZyvKEz7PMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lNaOyUhPYdmgeTKFAssoU2c/7zx506MQxZIC2ssYfHS9r9dZBoyq0Z3keCGdT5bNMdTp+RYJqoms05Mc7mECLxhFXTHA5UpDN5rPQvVej8Kb/cEbBP6jpFjD7m5YbgRb5Kk3MdbOc17Jec68vKR6wLeWG9JzU+cRqCJHNawnz7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RhkJQEfC; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RhkJQEfC"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso16563795e9.1
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 11:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786041254; x=1786646054; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=guNARlXxkuof9kUROgwrVcSK0CxwVUDL/WVDz9p8+W8=;
        b=RhkJQEfC77AnaZIMXknRUwo26arwiU+N4Z4KiZ6YFqxMOsRyupxt0klaXQZIdOoXOL
         FxE+YtFSP/cMeCiK8NktJzsgllRWFO5hvt9cLfNI2bQXkBYtv+xrZiH7EDjGbpt0D3PO
         nZpSSklMZy44dhxljIYlgN/bELnSjrIPJOeDaRti8XiTDHxfs4BpCOP2xUE1IIpVSe2B
         /3n8d9fiR9/us8xg4txow/dmDGJxTyTCbRHeAB2+2X13hFIqwGGII2oIj4WDamsyhZCf
         kqJCkz1Vil6MV/hJoWgY9m73n/c6dFcmBQM7KAZ7bE0RsDrf3EnUm5KGEFJamHYjLi1m
         o1Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786041254; x=1786646054;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=guNARlXxkuof9kUROgwrVcSK0CxwVUDL/WVDz9p8+W8=;
        b=ZtOCGh9z72xfpPbxPzno81w9koVaSfRAYWD5/zFNVIBIsCIQJRET3T9+hBqzdaLPTr
         Hizt9WAAmPsp0IfcIaKH+a6SSA48QjOZ5dxMWmJt/CWgtMYFTuSkzXhU39+6UPht/wAy
         CP82eMVsAf/5TgSJmHpY6GUBKFLNRTncIRJJMb/6iGV8VMD8ibWKnQASHwS1ZdFGCGLk
         o5Pl2L7iwfnzBShcyDS0YNAqEldvf8bH2xk46Bd+ULt62Xdg9K0SppyLO++cfOeZgo6p
         9qcZJleRfpHcVk79V2rEYUz6T4DJvQcCBfbjGUgL4ZnBRUayKlNlHK3Lc+lM6FaGCrmQ
         nNKw==
X-Forwarded-Encrypted: i=1; AHgh+RqYwLSpU8EToBGqCFWKd5Io1Pjqd8l0ly8twcUVefEeu60GS7lmgBIDCWBroRuoByRsHD4jUfZIEktk@vger.kernel.org
X-Gm-Message-State: AOJu0YzzpZsBVybVpJ6zUihLuatwqT0eYMrZzHTKewwA92O06AP5U4Zy
	0C3sQoeCzHvBkUEb/xCbl4/M6DwD44DsP8VMyaqO1yaVY9nXrLCTG7lC
X-Gm-Gg: AR+sD12a63WeuCi/kOZmPGAICm0xMM9KedSvTU6Qs8zGvBlweX04wGRxtGLmqpwN6LO
	Gf4TYEqHj1b1GRxYOWw2czKXlGY+5zPceFu53CKphWk9R/hZZPCldqtaKslZlZ57RKklEzmx4Zu
	mGDwCaMJxTt5t/qM0ZdwS+ro2lP1mKagaWLwgaSlJJg3DLf/NO7lgOXbfTtdA5UZ7DEIVRnn+Bi
	0yBn8JKm/c33OQ7cqXfS9r4ZU9YWDs1dCzleiBGc6idGWBEgaGFcp1Z0vpOsPKat/p+QMQ6AJMr
	Ko3RQSHwpI5yMVy4yqfJsGkWGQgJ5WFItzjUBIjb1Sa6jHaq+h0gZm2q9cMmuK1QGTxrwz7Hxpn
	2AfETe/Esbo481wnPg2+dLgOTk0hzZZ3Eo25dT+rT3Wah3KWEzktLvfYuOx0AAMegrjGOSteHE2
	pH6dOnSG90Ui6qA1bslpiDSZNRQrtvUyt0AssNiwur55c4ARIfGji8rtPU921DwFccu+Cvc2P/W
	KY=
X-Received: by 2002:a05:600c:8b17:b0:498:14d3:562f with SMTP id 5b1f17b1804b1-4994e7cb3efmr202318785e9.15.1786041254074;
        Thu, 06 Aug 2026 11:34:14 -0700 (PDT)
Received: from silicon.doe.home ([197.250.226.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c7a3d1dsm14165e9.3.2026.08.06.11.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 11:34:13 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: sashiko-reviews@lists.linux.dev, Lee Jones <lee@kernel.org>
Cc: vkoul@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev,
 olteanv@gmail.com, conor+dt@kernel.org, neil.armstrong@linaro.org,
 linux-phy@lists.infradead.org, robh@kernel.org
Subject:
 Re: [PATCH v8 04/12] mfd: zx297520v3: Add a clock and reset MFD driver
Date: Thu, 06 Aug 2026 21:33:54 +0300
Message-ID: <MiZ40QjqRtKW-pfFo_ZCYQ@gmail.com>
In-Reply-To: <20260806143103.GN2869284@google.com>
References:
 <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
 <20260727184155.2F0A61F000E9@smtp.kernel.org>
 <20260806143103.GN2869284@google.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartbZ2Luvy9Smq4ikTWC0Dxgg";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartbZ2Luvy9Smq4ikTWC0Dxgg
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: sashiko-reviews@lists.linux.dev, Lee Jones <lee@kernel.org>
Subject:
 Re: [PATCH v8 04/12] mfd: zx297520v3: Add a clock and reset MFD driver
Date: Thu, 06 Aug 2026 21:33:54 +0300
Message-ID: <MiZ40QjqRtKW-pfFo_ZCYQ@gmail.com>
In-Reply-To: <20260806143103.GN2869284@google.com>
MIME-Version: 1.0

Hi Lee,

Am Donnerstag, 6. August 2026, 17:31:03 Ostafrikanische Zeit schrieb Lee 
Jones:
> This is correct.  You must not pass one device registration's (MFD) data
> through another (OF).  Use a defined integer instead and match in a
> switch() statement.  There are lots of examples of this.

That's what I did in Version 9 of the patchset here: https://lore.kernel.org/
linux-arm-kernel/20260802-zx29clk-v9-4-d05530d85d28@gmail.com/

Though I did run afoul of the naming rule (my enum has "MFD" in it, which 
kinda has the implementation detail that the driver is an MFD driver baked 
into it), so I'll address that in v10.

Cheers,
Stefan
--nextPartbZ2Luvy9Smq4ikTWC0Dxgg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmp005IbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoi2E4QAKy9v/glfkTD822DgZKq
qPzYOORWeaxqfAwwJsjuLkZsEMRDinOZMU6NjOgjam5gH6xFW24xOdsdphnttZCS
PuzRThxDv3kudLgQFG9NA5k2dZ3DVolJBolbNDCrNSCby86zJB/PQo2i0rQe5Y5I
KjnY1/NfOu9eZsQjIYdUSGibnKLebz3FdY/KrwrobpWranqBBXTG2PYZPxtOaTsL
NvpHuzg5X9VdwBMStJGMqowPrGawDzbtS4/P3AWfVrLA9hcLsleni9Dopendlpnk
AyEniQSQ7SnicAeFnutaZfD4q/E+RpaFJejoCmeOnOdDcnJ7SbH0mEoHQqjlz5TJ
hJDo5PBAjLZ3DmD/qOiXFN7UhvMHtDxUEm6jA/UKmOuu/yFQ1zVIO6z8Y3mqYwBY
qDNXuOZ8UN8eZvC9kWDZ8phcVejRJt/YdRG9WNEkZO9pGH0kIxjBWvRcYYgTBWhY
2U0CBCr3lyEtcfsbOL56eJwLbHZinU9zj+B0S60UGEK7frgR//3mGufSaT/szW9H
e1aZAdEiLN677Bmm1DkW+NE16K+QcB6/U1pLyoj+HHhXdOvigOLTZk5wLHBIMBqA
GmEvS+6BcwK/7xy3hGobS4ZMCUbjgyUi8QJaUaTi5k0P6NtQzaxyzmDalcrKWIIq
sCzkCfPHIvDsbbnLIO8Xd2SP
=1FP0
-----END PGP SIGNATURE-----

--nextPartbZ2Luvy9Smq4ikTWC0Dxgg--



