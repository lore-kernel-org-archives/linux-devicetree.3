Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E3A3839A8
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 15:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783524009; cv=pass; b=EOK+zomjQRiQ3Uf02jc8vwAynkaKJ2FoxNnUNbEN3vIMuxRRw/fhbblej+C5c/iYs6n1fqG7aubzOt0PacO32zhagfQH6TNszCDQzyOmdRfos1R1g2BlG5tMfxjbVuqG39HvK6YxGOHdkEtwE62iyX7YdEwOrrqfPju4ZCSppJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783524009; c=relaxed/simple;
	bh=x249OaL4JY8Ml6bMUfTSabz+1wUJi+34aoe0uUEkz4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ON7xuZRBt7dsYt3Q+AzIMCRwXzynU2zJMdDG6S+uxUeD0QXUUUOmwJCLC5VdQyxymBcqnaXatvWFwASFt5inq+lfLDZN9wFjd2w5tRo/pwglUQ+T7jxstanu7OFz7Nm9WJRYlUaxnNyR2hxt28pxNtnl+pA7n/28TNSAV/esDXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y1vz0qAV; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y1vz0qAV"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c15ca7a7ca9so87885866b.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 08:20:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783524007; cv=none;
        d=google.com; s=arc-20260327;
        b=UUkdGpt6wk/UVbGuRwM7n7h4GRIvZPJmvPrNleguXIJDsHA/SLS281N5X64JXZv80i
         atLKUZobHW7PCyM72LpT8W1rmsvIvS27FsSvmxSaSxHE2tEcFDSbE0J7dLxlr6ByMCYt
         XWd3jZ2SffKlF2u5k8qV9MPPjlw2NbPvuiLa/qoarzvi2gFb2T6yrWZWO7biW0g8j4mT
         bXURFyKppcoJ168A4iOV8wleQD97estCXv9sdsesvWStwJCaVCIkUtwra82AxOZAcNFn
         XExZgf1gYwR1SdKXE1nQSS4zOv/piztMsXOxqqSzRsG5JoH7E6t4BbYPD5hw7Mclk2b2
         T/qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=x249OaL4JY8Ml6bMUfTSabz+1wUJi+34aoe0uUEkz4Y=;
        fh=HAMTEBn2Z6tRJt8WQqH8JyfoP4UKZIRynpIVp2FfwM4=;
        b=VaoJ76K1odpoYl7CIs2gOIODcFuPtYX1Te9/xuhoOBerNS7rlkC+l0sHHr5IdypQ/x
         TcMqpdR8ubfDLFDp3bIQmUBnHVHxOglJ0Rs0wdYA2GjWaLjRy22h4J47TwD/QuaCbqe4
         1m/TtHAQ/CilO7RhOVXdGI9nrWE/nGrI3pWGJyfT1/pJ84vl9EiPSyiZ+LZMtsFd4YJJ
         kiz7LZRhCApRgPUyPtI+/cjAyeTO7VxRyc3qp1JHObXYT+p2xtEWSg+5xXtpz0I0CtPr
         Tj2Gg1bLIpnZjzxqVxYJ0GqM72Mt+pEqon3G+gmBXujXU0gAoUFt0vzMmIeHtIQAJQI6
         u2pg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783524007; x=1784128807; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x249OaL4JY8Ml6bMUfTSabz+1wUJi+34aoe0uUEkz4Y=;
        b=Y1vz0qAVKjJijtFqO9xThPf2tbVEsVzMPvHIDxIyXIngjH4n3dhSzfBJ0kO/pPWgeA
         LRBLY/pSZax13hgisfuxTgXTfh20+8c35QK23eykJeXZq/X5Jw/dCA7D3cDG4XawyM/U
         iHjZ72N6Q1gRh7TeGltXJAa08YcLBT0MHADGbmnHafHD1nLyPUe1XkjGOU09dwGLfCuA
         URwi4Pb0/JIDV65LTXvCW7wR9lJpcPhevgPwG+720DRUPaRMW6O3CNMrmeB/iEohcfit
         ORfGudGhsvgOezyVSDxtnJF3Q3M7ej/sGLfwK9MZxUwZaiK9SMxEaWrB0i/Qp6LoAwEo
         rnmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783524007; x=1784128807;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x249OaL4JY8Ml6bMUfTSabz+1wUJi+34aoe0uUEkz4Y=;
        b=eRs4QsY0EwV16AkTh/6IVB0TzhipQLcHRzkXe9lJJkRSqIueu7rZSGO/8fKvPQz3A5
         hyIWommWy155V7gPsGcDVsRNRGi2FUA4xX6kDEGOwa8qM6m6xCClFr1e9LIeTWnzwgaX
         WS5scgOgwwDk3WR4pFG6cjt0Rr5eXRtQOebz6uT/FsCJn37aLkuBZMMnhzIHe6AfAqQf
         MNRN1eif/zeuNIjxbKXnqS1KJ42vajoE7jsseU97seFYH+GkXBI1i/BnH4p/vs9PqjBY
         vo+JrGMZ8iz6mPNqQdIIdmUz4gKU+9QNPN8mXP9YSGAsmdHauBKmfi1i7mX68tEG0I7B
         LG2A==
X-Forwarded-Encrypted: i=1; AHgh+RpTCRZtwaVt9r3QcCfRfUYNc4OVAQOWEUmmYvAN3GOWKonKl0G2XJ9WQS84Acr+j8o/nYYhiIRmvx+q@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+PZdHQcVlVy510v8HXh4b8qPIBadJQD3gbSdXVZG6CoSUp8LF
	Tk/KdLh8TMN+puTQGByiuIbMhXLblwViv4dOW+f0ewL6h+pbrFLcAmyRTbLbUvl9kBWdGeOWGG1
	JNKa7xh9JIXxxRFJhCvlFkt4jmJOcQSI=
X-Gm-Gg: AfdE7ckT5xDXEzxkowQc2mEeI0RA7uCJKqTzdRS6iDofl2gdeWNDmPweiC5mzrk082f
	iWieDat1UI0Wi0A9T+v3PJg7+q2SesEmYIRaltln97BAfFkpYurcqBu2ICAve6we1wFvl67Gg99
	aGQ/nooRH5a75eNXJ3JzfaFHoU8XXfxfilWM1Hpv9oF7xBcUL49UO8k4OcCIEYUrzhZ96b+Uxuv
	zp/FfUt0G5SxvaLDBFh3tyneoYjSXX3D2THL7hg4DJio2r2ZwScpvkFLrRyd3nToRUL2hQ7+5lq
	VPtHy4HGdOzqkeMkRb7pbsnzkpLoSNGcy5RFkrAhqMIZiK2rpTj/KrUTDizn
X-Received: by 2002:a17:906:c10b:b0:c11:efec:6ca9 with SMTP id
 a640c23a62f3a-c15cdfe6c2cmr151638566b.8.1783524006447; Wed, 08 Jul 2026
 08:20:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702-hm1092-driver-v3-0-85faa7ff4fec@gmail.com>
 <20260702-hm1092-driver-v3-2-85faa7ff4fec@gmail.com> <akkRRCaZMRyoWDt7@kekkonen.localdomain>
 <CAJTcUFQ3CJQhEv_N7L22FmQSJsGpfMvKO1F5wiEarNca5VmV5g@mail.gmail.com> <ak4DfkbDlIvsGY_u@kekkonen.localdomain>
In-Reply-To: <ak4DfkbDlIvsGY_u@kekkonen.localdomain>
From: Ramshouriesh R <rshouriesh@gmail.com>
Date: Wed, 8 Jul 2026 20:49:54 +0530
X-Gm-Features: AVVi8Cc439u3XEK-4T29XYZN9pnFk6mhtHu9iHtSI7aq2I5-tW8zXJ2xwPEpgZg
Message-ID: <CAJTcUFSp6Y3NB5q+-DyPqS+E_KH40hhq3mJMBi5hnfcGT=wxjg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] media: i2c: hm1092: add Himax HM1092 mono NIR
 sensor driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, "Bryan O'Donoghue" <bod@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sakari,

It's all good regarding my name, the review didn't miss any details.
I already sent v4, I will drop the data-lane property entirely and add
the other API elements required by libcamera in v5.

Regards,
Ramshouriesh R
