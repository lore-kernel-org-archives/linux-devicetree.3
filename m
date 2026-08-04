Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A705371049
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 15:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785856342; cv=pass; b=bKNZvfKPMzqNXW4OjrnmmV9ZAC2DR551NOnUary3h2yS8fNRNv8vnQqb4BxnfRAbKcwOf6q1jxaQlN0GnaU8ukG5Glg8FYxOV81TLldbwGohvJm5YlWsg3eX3g5OG40DCyEpC6O5HWRwOMpozQCkzir8GqLdqmbDCOXNgyJ/gc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785856342; c=relaxed/simple;
	bh=cjSC0VBCJlRsHK9Tnc8vxBqu9ttux07An39HyrNLSeg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Shaiq/NFXzPJOKunKT8wBzXVzxiGcjmU2kUv6t83DxDLfMBwF2l3u7SBXlKay98ZBi/JwC5bjtYrBU2g038Ow00uwq3hYw2L3REI8pqvJvbUuPnCnBWrcRfvzmCIgjSKTmG2Kgc7S9FtsaG2NWL3jwX1gmz7/dvCQPSjr2t5LXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VjW25G0R; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VjW25G0R"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c197e7e4e94so803475866b.2
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 08:12:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785856339; cv=none;
        d=google.com; s=arc-20260327;
        b=KS+HDxWPATOhIlxuWIeYLq9zY6E9Gae002EsaQeUPeW0XsGC6uSuO3F7hC/Z7KnqdF
         Ty5LUa8OqhF6jrUCgmIKU70fYe3x5swjkexxu3963BYtx8TqYyuCH4+fjeYpl+2T03fw
         DUwh+G3mm5mMtkqY5Ma9eGZGZxqnWFwLHvPqq/FP0DRCSpScx3F8re5DZ1NKWEVeS1hb
         q4/myoXHcwIGt73fEbgQLxB27WOQg/sHQ8k5Z+LayXe8r1umnZQzMqSzy0OQbLKZlKe9
         pCdoTYBVLiLzTtBZIWs38hXTZDIOr2/HZckuPmwGQgTlEeCsQlqh4ooop9lOCSUGkppH
         V1GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cjSC0VBCJlRsHK9Tnc8vxBqu9ttux07An39HyrNLSeg=;
        fh=3IgqSNL8L7ZUBPfSzIpfQDcQMeOOKi/WGrY3OtSpeCA=;
        b=kIUy7V0HXu5BqGqqSR1YZDh0TTzFeKEgDpWVDwkQuEv0ZF4ErNJU6rpbjn/YGFVB4p
         AiP/m/lqcT2pfAWkwAYJqdv2rDCHpOgGm2t9I4lFXCO119UvzBmlC6EapnjlKSpKlmGa
         y43+eSunZm03g5mtOpcoS5E2bhgsfjN5dklliAyu62fGhnWIBin2n/C746AaQkmDNYDN
         0Kq5Gr0/QKQMRfsgWi+mhxrbmzjeIzvE4P16k+384xbDDOPkJ/OglaocoJq1JAPZjOvj
         c8s9dEf5rqxkZBxV388XMSkKWBJEadlekeZRX2kSdy6SEyF/2AcZS5iFrBPLxpgqnLpg
         /XnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785856339; x=1786461139; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cjSC0VBCJlRsHK9Tnc8vxBqu9ttux07An39HyrNLSeg=;
        b=VjW25G0Rss6XwUaVtGx04JAmB4gl7fBIZn6eNYltP4JHODs4BZ0gmWmYmYj258T7h7
         0GOnEO/D67UFkZa0Mg2l5KGVGUoDHbzb8LMQ8P0YbEf1fVmIQxRZ2B8ynluFM1P+Zuhn
         yCj30Rakomek61pPl2uhSCLeU/WMx1id0v+jwJMwxBH6/VNGkpeSj6vZAbb+fv2zzWHJ
         0cq6AbQjueKzUSzo9ZaZsO4IS97Be5eWYClpfaJTfJdyidnK5zhrGm1R50Vm/qotpisI
         MKfd2xjJ6EhXhzt6oWTySIc1i43378aXG+f9SB/d4a3fYxKJKu9JHPncHqWBdU0b434f
         nYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785856339; x=1786461139;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cjSC0VBCJlRsHK9Tnc8vxBqu9ttux07An39HyrNLSeg=;
        b=SvCHH2JakE8M2dPxwNZSMHXU5tLXThSIG/UWKfnLxirVcfMsGL7uxYP8wI7qrK9iJI
         HctedWh1+kF0h+htockLPmvaVjzrMdZFX+j/2+YJrfHBBFwWMfmdOgkwsBipMq9Fqr3B
         iysChrONJJRNMShhJHAX5o+sb2ZWEtUVtwRk72uoAIVaP4rALAX5IjyKDoPyuth8OqWZ
         p63vaRT+BP4uXlLT/QPU/G+DTcKjEFQpGbUf8GFbYGO2697V/9qMfHYBE/ZaeCnHNeQI
         ax8rTr8yYy8pU6rElISkcdHQy0zvZLhkffOLLWjlZJtLSiawEqnTD8hZRU2YaWzC8/Us
         cc9w==
X-Forwarded-Encrypted: i=1; AHgh+RqyoY+tFUvxHgHGQSIx3LrMeoCTB9mvPGbu8hy5C4oUJXeAnfZLwmtLFleV8nsgXGSK4sNChcIZKUx0@vger.kernel.org
X-Gm-Message-State: AOJu0YzP88ZDnoysnvRffHF8rrsyCg2qWWJTderypHw862OLveXZNRlI
	6oS2sjvaUOF6hYjJ9nk8j3v5qx++WEleNmsgphULGi3BFQay5tOpzughG+F3Qr8j0iKBWKyX9mN
	zWutD94pKPlf7eXPHCipmjFxB2jXdQvE=
X-Gm-Gg: AR+sD12U1qYeFOMr8hhHAcOOqOFjvSwMJrdWS91f/Q+x7l/5GluGkAUFmSjAxx4zxBq
	SvvzcSNgRrXZs6my3JkfXoq/Ms8IMSWrY+lwHww+L4jdSI6Hlo15WrsXFTC8buUirXnCFJIm5IP
	B1NghLej7Mkrk0U3g4l53i2TOWExFwIm0pGFtA5EKvhEfGMKnB7qY38CBbI6ToOIdh7T9V9bl6n
	i0idECrzf8o2RjRzMderSunUXmecwPTbVZXN6mhwVNn9G7f07dmKzJ44mdsIm0H3sTsZ0f/DBJd
	uh/bf5zaWtjv9DAoLYyRcZuVzeNma5n7o/aAfCvVSFYwU+rmeTpXjV3F
X-Received: by 2002:a17:907:7283:b0:c1c:4a80:30c4 with SMTP id
 a640c23a62f3a-c1fe7ea3bf0mr1264423266b.11.1785856338657; Tue, 04 Aug 2026
 08:12:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803101734.270821-1-a.shimko.dev@gmail.com>
 <94fb1a6e-71d6-42ae-b221-cc03a820d2e0@lunn.ch> <CAOPX746ZFCE1XwXJ1H0gEaBvdvq-4GAiPTKkT-3XvZi0n_f73A@mail.gmail.com>
 <2ccd6223-dd40-406b-8869-021881755f72@lunn.ch> <CAOPX745w-Hfq1k+H0qLWQjsjY-5bb_9N9sw5LBJ0QM-n4j+D+g@mail.gmail.com>
 <5ce27e97-bb4a-4f17-a445-16331af0a6f5@lunn.ch>
In-Reply-To: <5ce27e97-bb4a-4f17-a445-16331af0a6f5@lunn.ch>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Tue, 4 Aug 2026 18:12:07 +0300
X-Gm-Features: AUfX_mwQsUa4lDAx1alAI_-UYCS_l4QLs7qTpkYy0RJXxYv_OxJOUZPf5jgwV5Y
Message-ID: <CAOPX7452s9D=m0wS7_zwitYTBLeL5aZ=H66nBWe5eXc=m56CSA@mail.gmail.com>
Subject: Re: [PATCH net-next v5 0/3] Add DAPU Telecom DAP8211R(I) Gigabit
 Ethernet PHY driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Tue, Aug 4, 2026 at 5:41=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:

> Another things to explain with a comment...
If you don't mind, I'll simply update the DT binding example to use
the standard 1950 ps value,
instead of the platform-specific 1050 ps value. This should avoid
confusion for other developers. I think it's more appropriate.

--
Best regards,
Artem
