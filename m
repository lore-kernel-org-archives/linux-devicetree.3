Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832F030B50A
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 13:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775136608; cv=none; b=hq0MLv4E+Y+hWEnYr5RoQQuiNAMBrOghEzattoo5agrdoq/seqhXsIyXMjeyAtVkcRWtSjlMONgtUdkoESjpp5896kFiIpxVagkKpruwQO3M7HeYoU1GxE3lSNc2g9iRSqWLJMP/whxHowtA0X+f0WoizVbOmrUp3ho70BDynx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775136608; c=relaxed/simple;
	bh=mBTUXQ3PD2dZuBmcg7mtDUejMVNBN4mR3Nsq6fwUhdE=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=JV4IHo8Q5YnOg1/hdsgKOBd7VHV6JnG2hGelgnHFqfFY6yVe0zVXVG+yGQ8JYySiCT8QaC7xJhreCIYnwMJ5xK4jZeQPJWwj0Brl1APnmk1PSqMK4VHUlWtm4KBKnldYk8kUeq7bPklqjHRP72pZ/+tAxdPpn4DC9UHkEF1ZvAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kJSykyLd; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kJSykyLd"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48704db565eso9434405e9.1
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 06:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775136606; x=1775741406; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8WxgO0tK9ltbloE4Oc/9lVYcELxtyYhqEk3PbV+jR6E=;
        b=kJSykyLdApeIzmSaNWXOBQqUuLBtHsUCO3rY7BNGCQeBsOzXxKMfu3f4mT9Szv2izV
         ASWHp4nozx4QWwwe2m7MQjvfKd2rcODsePNdDdwZ6dg2j+NpPMy0N8dID7vOPyu/fSBZ
         spPV3vf5217uIQMoxdHh8GYPd/V19IesbLT20RZr0CBHoHaH0OHTfGdsLyW7Oad1S9+o
         Cag81tcCj4nzHGJOeWXD62W6QzN0MDdWTQCGREMThnvTlpDDwJkR0mPTp4UI1QVZ4YW1
         NQHhZjfiGbZloLIQnhZtnWw4U0tE8HrCLSfp+tbZ22c8XJOB3/roqVvKy5N8maecQQcg
         Jj5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775136606; x=1775741406;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8WxgO0tK9ltbloE4Oc/9lVYcELxtyYhqEk3PbV+jR6E=;
        b=dMWMHC0uJgoHwzlYO9LLDGL6vir+AAKh3frIFxw67YI4HpgHWDfHuISRd/qHfnjt0u
         OybaJ/68l/LmcMm5Kxe/ic/6EcxZbTgxgArQ2LUR0JR74RHkegjftN2OU5C+9xPyQuy5
         cQ45inXzU8uFgg4FCDAWhfTWzJptywRv4l2y4Z36g1m1VWNy/Wzdboyo7WCtrmQNRD25
         H0uOCb3XQffKTzAsfDT/U/t+jwGbkyrWSfMI2wUN2z1MPcKZe2OlP+jEphGek9Yn7T4F
         CxilB3wpxZUuEKF2Po0zEaR229b0f9dtSJxkQu9B1aWkOx3L5sXFwx7+r3OThSTthwKq
         47Rw==
X-Forwarded-Encrypted: i=1; AJvYcCW4rPT5g3JsgiV6qJIDV5KkLXSIF8F33C1glIQ7r02CgHIOx2qaXbVPJMh1ZkLqZdp//aX43ZRHQu1v@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq7ZN6GWa1Z2HgnW7/pYB09VWcpLT2A6N/Pq+XA2PEJ/yHpw9b
	xBo2KdMMswvepWvU4/BXj1XWZvb4+uQeuSfT5V3N40vgTDYHuZu4pFEJTIgciRlPA7Y=
X-Gm-Gg: ATEYQzxc9Ms+UiWbmR/+b13NO2lCKSO+EUJ0sLzB1eo/WuW998Ld/zsTiRhmm58qPwH
	iC3LW+woqxWUw8cwF2p9U1zwzWkm4fTsata+3iZamduMwzz3WZ+E9SAWaA8w3smSubdwMFp2mMl
	uFDRSCXfH3Z7ADG2JWgrv3ulQs882acHKbQbv/AWBuHPdP5IWRnz4jZ0UH7KdmUXjjqLDZRvxS4
	u8lJfxhm9MjYmFGkqtBLm7CZ+OowB9py3akbMEHnFq6/0fXU7AbiNHybrOAcuDHQgYooED28j7+
	XEhan3tilyRaIm1pDjcU+NZylRVd7C7FSzy3fH1LxL3BCOFaw4+7i7CrCknZOYgObePzu9DqvYt
	7DgLVT9P2tkBDPeI0Hik2iRlcbapGUbtEdR69cDmKGbgubbCIGZkIwGF82L7JKf9rIFFwYAoLYL
	ysIgRBccT77D3yFCuRLukcxsSV4TPvrCVLrxJc9FaXbfQvAUg4D0M8lYlDvQYun1tqYYVV8ZQIf
	OqmfvhWmHfcKJec
X-Received: by 2002:a05:600c:a10f:b0:488:81b1:ae36 with SMTP id 5b1f17b1804b1-4888b78657bmr38517325e9.23.1775136605817;
        Thu, 02 Apr 2026 06:30:05 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:a0c1:4037:aafe:5dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887ad8d28bsm85916235e9.10.2026.04.02.06.30.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 06:30:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Apr 2026 14:30:04 +0100
Message-Id: <DHIPEQ4XDUI6.297HDXTP84FFP@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: "Sylwester Nawrocki" <s.nawrocki@samsung.com>, "Chanwoo Choi"
 <cw00.choi@samsung.com>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Sam
 Protsenko" <semen.protsenko@linaro.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Jassi Brar" <jassisinghbrar@gmail.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: exynos850: Add ap2apm mailbox
X-Mailer: aerc 0.20.0
References: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
 <20260402-exynos850-ap2apm-mailbox-v2-3-ca5ffdff99d4@linaro.org>
 <20260402-free-foamy-gibbon-acad72@quoll>
In-Reply-To: <20260402-free-foamy-gibbon-acad72@quoll>

On Thu Apr 2, 2026 at 9:01 AM BST, Krzysztof Kozlowski wrote:
> On Thu, Apr 02, 2026 at 03:20:16AM +0100, Alexey Klimov wrote:
>> Add mailbox node that describes AP-to-APM mailbox, that can be
>> used for communicating with APM co-processor on Exynos850 SoCs.
>>=20
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 9 +++++++++
>
> What DTS is doing in the middle of the patchset? If there is going to be
> resend, then fix the order. If the order is intended, then most likely
> NAK but I need somewhere explanation (but I really do not see the need
> for it).
>
> Please read submitting patches (both documents).

The dts change goes last in this series, the commit 3 out of 3.
There is no DTS changes in the middle of the patchset as far as I can
trust my eyes.

If the order in this series is NACK, please explain why.
I suspect that potential confusion is because 2 clock patches from
prev series were accepted/merged, so dts change shifted from its 5th
place to 3-rd place.

BR,
Alexey.

