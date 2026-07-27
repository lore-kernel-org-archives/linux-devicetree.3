Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11393BFE26
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 11:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785151075; cv=none; b=gOB5lNePE6i7lPSVT+ujXbG//eiAxF9NaqflJSt7IHWRWTIDXVFWbdJbHGiYHbv0JQM2Z3CGvphIXkAWJJBXwbqyNfG2FltQHiQdRLFBoqI2dNdwX4vXagXiYUmxTZlaSYJenzubnYGYvRdAr1FZyliDixxjTN1uioi1tyT0SEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785151075; c=relaxed/simple;
	bh=fwc929VBWUs8HNtC2JsbnDBcC7Mzm1uBJraV+rwzoKc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N7qni6ypREYhuGcLpzdQ4IcU0tGwsUxe/eTJs8h26BK3utOvIl3FgR8Ffhlqyq+BlULfudDLVOfthEQzNblZDScf9ws9tLfCw84/tNkDrHD5eH5Q5GEmA0q2ra8kx2jT+rh28MITyx9RmVUlGEJKY6bR0NWF0VEMlZILkJLuCz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BApUwmAk; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BApUwmAk"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4955de8797cso15738465e9.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 04:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785151072; x=1785755872; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fwc929VBWUs8HNtC2JsbnDBcC7Mzm1uBJraV+rwzoKc=;
        b=BApUwmAkC+7LTxmOtx6kfETXd+YMHZ5LqvAJsuAv54cvQZFMhLsdtgArwaLaXkQ5eI
         4UJuYDF7vP3F8lNwcgxW4LSZhl1Ec7KU75xGFjRjWZ6Unto48Nu3I68JoMDVyaa7CleB
         HF2eszjC1yWzHCw5H01xRDDp6inAWvQBGdCwrt1FlQ/YIeKHq3DRB5Dk2qep5DZvvTzD
         yEYLDJSEdZxeShHhno3y+K8QPwbr8jfihfrRrjfRWDPPPjz/tZ/jXvr+qnPv7FmkhjhH
         sgL4eW3IxtXM7Yf/O8AWTo2a4gUA+XERReB24F6wfy22P0BfOQ5Pq3nuBVoQD6owTAt9
         seqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785151072; x=1785755872;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fwc929VBWUs8HNtC2JsbnDBcC7Mzm1uBJraV+rwzoKc=;
        b=j0Lw57UKEBJo57AiqpVMvpnOuHUQXt17IAF0spIUuVRMTwP6HMSFpx+sOUHA/OznZd
         98HL10YLrMZrccZVUnQA9MyXkMR8Y1d5tQJtfUn8sa/ilqguDiPc0Tu8qHtWWPIV+rhD
         /VEYy5pZwYegTBZVW3ntervd2nZmd0LEwf4/K6hCB7lNKZwymGXlfXyIbXsNsDzrJ/RR
         CO5yg48xClr+4iekO0/cBfT6IIPnlfozE6VtDeaFkOJkGNychyBQWRjJf7NYLVTftngQ
         BfljPWJFZz73yml/BY6kPHtmRgUZmbpiwmQfFPFNIyH/GHKgnuEfBhFCbiMNPdfLCBJW
         EA6g==
X-Forwarded-Encrypted: i=1; AHgh+Row204JX27qJdaJLJJytG+PdP57DGYM2GQimyxhY2vx0ZJ+gYgg213mBO0Pkmy+MFX1GPjwSyLp4fqR@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh0Y7ePyHwSHbok+8e+dQYH3WtLqYNOdHI8+H2w5Q0gCBnSMu+
	Qjsdb5sjQ8gtUqA/JSE9F2pe2E/oa51R64erc0TaG+iLzP5cV+mIhxbvyTznHx97Yhs=
X-Gm-Gg: AR+sD10TDP1vYdtfNGXCbG7qn9nX5x1gsdhq9fYran0UdXNUY0f7C0XdzMYwVJkLvJM
	MxoDd+Iw6HhvbiSdaaZc24/fENHaOkqO+fsfJ1rkly1KK515mmaPDNecwWiUw4BsoohgS1mewbj
	gAEI3uRIJFrTmiNYbHW7asquXIgajFePHcIFaAogWeQ/UAUTLgmjAhDcNxh6CqgYPOQ8q+gyy+M
	pBDtdAiModCb6CWci06f/Oy0rp/zHO3gCnt7FN0iidUj60EqZtys/LQdunfcB1DsE8T+XmTgxez
	kWnaBc83SuUELaY6jOi7iHjRplPzkdfSDzwRgwo1k8etcaGxWyIMHvHOBO3r9Ybl8Sy1VJP0FIk
	2T3M06a99Xon47ofM4O5x61pUy/tVbzESkgIgTA5aApbkaA/Rrrnw1rSG1MQCQV0m7RulSG+HUW
	DLsybXKw==
X-Received: by 2002:a05:600c:4ec6:b0:493:e6f7:ad75 with SMTP id 5b1f17b1804b1-496b73c6dc9mr98804395e9.11.1785151072036;
        Mon, 27 Jul 2026 04:17:52 -0700 (PDT)
Received: from [10.1.1.59] ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c67339sm50401481f8f.31.2026.07.27.04.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 04:17:51 -0700 (PDT)
Message-ID: <4fc5f291e62b62f3445e1c72f00a23b01e04dce4.camel@linaro.org>
Subject: Re: [PATCH 4/8] arm64: dts: exynos: Re-order clocks and align
 continued properties
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Ivaylo
 Ivanov	 <ivo.ivanov.ivanov1@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin	 <peter.griffin@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Sam Protsenko
 <semen.protsenko@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Krzysztof Kozlowski	 <krzk@kernel.org>, linux-fsd@tesla.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 27 Jul 2026 12:18:09 +0100
In-Reply-To: <20260726-b4-dts-coding-style-strict-v1-4-e9e3e9879d05@oss.qualcomm.com>
References: 
	<20260726-b4-dts-coding-style-strict-v1-0-e9e3e9879d05@oss.qualcomm.com>
	 <20260726-b4-dts-coding-style-strict-v1-4-e9e3e9879d05@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2026-07-26 at 19:43 +0200, Krzysztof Kozlowski wrote:
> Trivial white-space only changes to adjust to DTS coding style
> (clocks-names should follow clocks) and fix dt-check-style strict
> warnings like:
>=20
> =C2=A0 [property-order] property 'clocks' out of canonical order (should =
sort before 'clock-names')
> =C2=A0 [continuation-alignment] continuation should align to column 39 (u=
nder < or ")
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> =C2=A0arch/arm64/boot/dts/exynos/exynos5433.dtsi | 282 ++++++++++++++----=
-----------
> =C2=A01 file changed, 141 insertions(+), 141 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
