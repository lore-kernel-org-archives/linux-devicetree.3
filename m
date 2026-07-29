Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C8348CD77
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 14:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785334060; cv=pass; b=CWKASkfjfzCJ9fl3a5kLMdmxUCukdkpH33UFFWZxB7YML2D2LiFgjTuLee3DyB56YaIVm19WFLURKiMl4rLqH2lEZXhkDyTduDupKm47+Gy201aXgHQTV/itxfh9EpdpRe5qkT5aBCcjKQyuyq8+NPMy94J4J/deQg/u6fFXHp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785334060; c=relaxed/simple;
	bh=VrzGFMnJSG8RS1Ua9Ap8Q6qp41waby9L/H9BOPTAg8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qCXkBePb35ua/U7PddwmzogpchvMGIvRoe9cimekwxKv+Ieqk0zHDuq5I6NaVOkCGaQbD4raHBazkk+tt73N+CUhk/hNUyEZItMJBUk+eesjYODxSqqyHIKcwODfz44BfgfFFjgxfG/POHnONIxN7BeD5I+4DJ3J5HNmhV1qRKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HtDQJ4Tc; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HtDQJ4Tc"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-69f2c67650aso1485772a12.2
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 07:07:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785334057; cv=none;
        d=google.com; s=arc-20260327;
        b=modYLd64hy2bGMThabBbzcbE7/K/F5p6DEY/gTJBMQvXzWdiVcLUczqbenTPBiLPH1
         N2jDzEqyUnsVviENxnSPlPkLwS+Kch3KQmYPXD2ThRngaLPDg9X/xtpevg+xNRw+C5Gk
         VKSae9Xmiwx0zcOXSRZXqFK9NVqwda2Z9JzBPeaLJEyYVoL5eZIqMIJCSeYBeIB+TBO2
         1You/SailzkT05ZWg9yY6hvsUUYkRiPgwxLbfsBwXDebkyFSnZpeWIMpRhcX6Greg6kR
         2poj5nLYqgh42CUsyhktpNISa3sM/UscKHAl3yIaVVT4kdYb8UbmZaBRwBgcjBIaKlEl
         +7Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VrzGFMnJSG8RS1Ua9Ap8Q6qp41waby9L/H9BOPTAg8Q=;
        fh=cW96Ptym+LcaSVTkrZdyvj4mJATzSI60YBITGcwwbyk=;
        b=UDYeso+j7qriLeBqN2zF0RgZZ2l6xqmOuE6UmE4b9HWSuKi8KgpgR3rpiJgj/k16Sf
         zYCM1kLPeCd73yjSLe6JDRJTmpq2riA/PfBFulrioTtWB2+JB8lYWv6UcEUfSOtrXKVB
         zp4wIRN1ScJVgm+/dgxjekAvsQR9JVbAGkcbEliLLdcEOKu6YEBnhpUZfPwZ3zgBT2bZ
         ShzIpRIzxyt3p5DtrnMrpBzMmipsOI6MzLUB06mpbqQ69RZBc30NA8ZUGstwoxwC68AV
         0nCqSIJ3ozqsPnXLlwO2mvFFjCPBZ08J/37nvgqQ7XHNmqiVGdUrRf4kxy7KBCJ24cz9
         g6tQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785334057; x=1785938857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VrzGFMnJSG8RS1Ua9Ap8Q6qp41waby9L/H9BOPTAg8Q=;
        b=HtDQJ4TcQagH8qPfoMOM6SuRte4nQKEE0k8SRdfl8wqQiqegcyYMuzSdL8eDK888rz
         SaQF41M/YTppTAQCTXX6Ym9sRiO2LVoy2eFFhYgGJaDtD7ZP0njzFbUwWIqFVscUOBId
         xvuOPuMn96J/dMAVKYtFY/VZxOns1quWmcDsh4t1krCg/HxTGzVNVQIIlu75hMVU7Y18
         X+DtA0DH2jfNqgNurRYHzhNJrN/rN+0Md0+UsUi8wlEsl6emBxKIOmX/37CbuK42mzQu
         tbYie5cDwGuOSMY1I92sJOm7KE7GqcbUb9L4wnUStdI0znk7/nDda97ID1l1Bd7k8m+F
         D6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785334057; x=1785938857;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VrzGFMnJSG8RS1Ua9Ap8Q6qp41waby9L/H9BOPTAg8Q=;
        b=Xk9HYEbkELr8rUwsL40A42P+LIg+b0sr0NxSyMJpxhyFOPao71icGytxk5/a12dMpM
         9F+C+UWFy/0KZodVD+St6EzyTqYQ+7ZjHfig7aZl3YLSq976+ScX7aEJzBsxr3j5WFmg
         /SQTPNGApygrUMDMnYnT8qLqS5C1nua6CJCFg2/tKOkCf/Aauoj4nKaK2oOu94MHbnGe
         gVUlnwq/WTm1NTFoxIUPlQvxLbzp90ojX7G9c6RgvkkwDSawzG+5qW8q06HJB61YhgqL
         4jG/7SCpep1nMcffldjjzSl0iuKWjTQDnwaHuFjfwVDsnTRP/WspKE570pwxLJD6xAuB
         rvNQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp5p2+q2lkXE8tcIvTqmbtUWXNLdlxESjoNNfPDWbsD/9u44Wo8VEzGj9IV/4gdS7u96O9ahfXENuSF@vger.kernel.org
X-Gm-Message-State: AOJu0YyfsFG6R1BXsyNm8g/9oj09kXDlv5j5ul5n011AZA1bUwrvjidx
	17FrruD2fXL6OIcUBZbpInbmHn/rQ3bpCdAWwZ/it4wZpcxG7JlJBwQ9V1bCSA0pcPolgOjkWbJ
	a9U63dLzIYInSA/BYAPHCTwv3CPYSVQY=
X-Gm-Gg: AR+sD13LYG9N4GX/YXfWfDG+2Kv0BVHH0RdiINWw4avUf5lOFg9ZjXDUHQfsOJoLtNW
	cp2gwypdo0fWSLGawiA31mmjsyeoJ6uzITHlaWfUD+A74AgUTWNK0X6cesGifbcxH8x429lH1bs
	6c/dksj7vTA3Tg1kLhQnqdsvlEfuJFdIwD2rTlQzJEmiGrpXqLorwWkqQzQomBZsbsm9pp8uf/t
	2o6ixEOW6NoJi3EkeDVmaDK8ezKFeYys2EBx/LCt9oI5gro0+FnMetpA5ktB99Ot3Tc2V+eMhHA
	gHKf0AJEbhXTZN3F/shBD/aQq4PvdSAxdxCzB/j2nG8h9CwlY9vR5f0gNoD6J8lkaOW+1Xdv+ME
	N6c+E+ChlfIbUovmrZx6EZ3o+lJDzhYU0fBUELY9Xr7vUVYS4PUQv7ZqAVGeNe3Tr
X-Received: by 2002:a17:906:9c8a:b0:c1c:332b:7611 with SMTP id
 a640c23a62f3a-c1f7250305bmr372713166b.65.1785334057138; Wed, 29 Jul 2026
 07:07:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728-arm-dts-beagleyai-gpio-info-v1-0-783ec90d54da@baylibre.com>
 <20260728-arm-dts-beagleyai-gpio-info-v1-2-783ec90d54da@baylibre.com>
In-Reply-To: <20260728-arm-dts-beagleyai-gpio-info-v1-2-783ec90d54da@baylibre.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Wed, 29 Jul 2026 09:07:07 -0500
X-Gm-Features: AUfX_mwiRGtPxSNnFBSea-x0qqLP9Q9SD_5RU2rCzNqnBoXpjkML7G6TFOH4u-s
Message-ID: <CAOCHtYjeBV3JK+cJt2Acc7Q_s6r1Pox2JTkk6n5UuFG+HEwCAA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: ti: k3-am67a-beagley-ai: Add gpio line names
To: "David Lechner (TI)" <dlechner@baylibre.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 2:45=E2=80=AFPM David Lechner (TI)
<dlechner@baylibre.com> wrote:
>
> Add gpio-line-names properties to the BeagleY-AI .dts so that gpios
> can be requested by the documented name on the 40-pin header (and a
> few other board functions).
>
> Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>

Acked-by: Robert Nelson <robertcnelson@gmail.com>

Regards,

--=20
Robert Nelson
https://rcn-ee.com/
