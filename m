Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD23D25A321
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 02:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779674784; cv=pass; b=bVS09tTQoPQRC8S/DnYk+UsWgI2uADfOi+eyrBZnL4r5Sj/RlKO0IKjy7PfpwUS8O9JFXCOHp1PQINnmQj9Fe5MziSMqNhv4TLCJLiEROSO2iDtRSpm6yDWBwGDLDbjLhiHsTKcjYqVWIxe8UCoxeh2PZlh739Jksjkab66HN8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779674784; c=relaxed/simple;
	bh=GeyY02fXXLqYni5DO6cTHveG2PvdWPCsfFeQ+wHiVvo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MuMvSgD3ZJn1YOi8f+5vTYGNOmrrzgp6NYRgayje+fI6GDtr1SX9gJBAX4HA1vbE/d9vE3FuownU51b/tMm26a/EGJXzzmhD26tvPveVRznjzc4K5Phx90Zf2dtGAkrL/to/NWi4ExF3FiRdaAE6mKvG7n3IcjezsQEeK4Zi3yo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hZ9v2cyf; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZ9v2cyf"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-30455f77e0eso4482534eec.0
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 19:06:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779674782; cv=none;
        d=google.com; s=arc-20240605;
        b=OXOroF36V7/jEO4EbFQ3ER/+grokyIos6rnJZO8ryhSKG6s9VRkZ2qmpGu8yc321oc
         t37kYEejlzjL2lLSlRtM3lneH/Y++sq1uBPMbyqFGWXKsg74tg3/eomWnT+F0BoU0ntz
         t/V0sE1OG1Koevq8JiXUasCA9Rq7tpvZZWBO/wGwy0inW6EorPP8wx7sq3YqtTWbvMtF
         bFR+Ehe2zIY/V/A5DUxUppI12uAf4JJD2Gb9CN1OZC2tNglXgmCsLT3+Clb587r+fpLW
         y/cXTkZbHi2llzX0SuOrJNdrcc1V4RliN3XnKzaPh7dshPxjZRV3eDrcuu1/uL3tEpuS
         86Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GeyY02fXXLqYni5DO6cTHveG2PvdWPCsfFeQ+wHiVvo=;
        fh=4kL5hK6e7MBE9Gv5+VeUhJuzG81X0TctZkiCdg4dJVg=;
        b=dxQTC71El3eVpD5M/uXY6j7v5BgnLU47vBpGoe0I2Yv7rHkc75GCn+zedHDmBUO1F3
         YQ66CY7TYpYLS4Shzj5X2vgHtL9ZedJjppoGDRioQwhiQ32zzHexfSmBvcInrGUqm7sw
         pMcw1C2yM4+zlzeojv/1dThdC73U4rDOkoSGqIDL8xlYNCCbNkJ9wpKsfr8lbmfW5wWB
         /7bhoiGkI7nkTz7qa35up4Uf1f7ncSYaONuJcOierCc+mR3SDHRfw/dNg4nVLTX7y54h
         6YcOzgJf9lWp1FrySc1OyiCtYBVf3mdga0tRLw9Jv82ykinHmBcrx8yVVMsFBKy5beG7
         8n/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779674782; x=1780279582; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GeyY02fXXLqYni5DO6cTHveG2PvdWPCsfFeQ+wHiVvo=;
        b=hZ9v2cyfcod0bLgAV20sasR4oWfV55bAMpK1Sy5wbUZp+QX9TMOAhOlAI3o+Xlz1MA
         FmyLNEkskFnQkoNIPlzfNV814PTYGZfvEhSPP0QylnyOQauMkmLxfnQeBBJjzilHP01s
         VuKiZK/mFDi58i1wiRCYq486kUBpGO8CCwO6XysrTU2POeb3EjQy2D899odf2quVH0hq
         dnND68L9OAO/fTax+yTEtRiR67Whx3T04n939mhN8QwvLvCubY7flBE0yENjhEOtFK0T
         qydfBbBaczgWUzxLxuQ3WxCXr/5ZJMETtwpbAorJTDabPqaR4yPBrOR958zuomzHFijE
         Lsng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779674782; x=1780279582;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GeyY02fXXLqYni5DO6cTHveG2PvdWPCsfFeQ+wHiVvo=;
        b=U6NlbX8jLRdQybhw5fA9eqXtf5yhBKaUnMg6q3pGDxB2uX4l/PHBGd0/pcId2+gCDy
         42nkQL12Ju+jR9xOASlHC9kWSEjENeT3cgL0LUSpYIyDTR5GyivsHiwQ/hkTdxGwXHyw
         XfrJHtZ4b0pFwKcUHoZZFgWFh/pftyEg7sP/eSv1Qg2PSNxyoUwqMnnqS6KmtjtHS3sY
         o71rgax6YNiVvoi5y7cfDYDXl/BqKQD6lfoThBc+m6CovGtWt82ffdGIa8cesL6YKQsu
         j+AbtOV6LqTkHvDcv/fggqQGXoE+f8k1En2QK23pAWhET1Nz435u+U6DmAYju2goEeQy
         lzUw==
X-Forwarded-Encrypted: i=1; AFNElJ+ejWSXQWiLxUuCSwTvhOfjSgG8wg4mJuwJubudAYV3Rzh5tCWKBWP8+BIBmz6MVh8+urEdgUIgtsvR@vger.kernel.org
X-Gm-Message-State: AOJu0YyxtsE/d/YOhyshOdFm3FUJAKcJ+1ellRo+ji2PZuNDUGXPZiTo
	49R6ybKTS5ZnEBWQA7jYFnUElXnS2vtdihigOSD/DrFwhYLWCmaQUCjqfWL42BMW0kIgauSg2sY
	KtLVv8cfrKuMDJfUrdgqqHyCNJ1YI2kQ=
X-Gm-Gg: Acq92OEpUAMrAa7NRb48Z6YD00+blastyJ9jauvxWrPtpAJPz4nNIZ/c3gJeUkaTlRD
	Gvwb0SVQf3YBV6Q41lgqLpB8A//KdBl2yEk7V9mqFdPgk/iIfqjeVFOJsWw1jdSWiItZnAa9Djg
	BUicbrR3SDXCgZNwn/8rD7G3ObzBa/q3ItKv5D6BGBpARIbrtIYOxFK9U5nXrtfyhUlc/Gcmk0g
	Y3mNF+x5PBtS6Ta9PobX55Ykr6gQlUrES2qin37jYTZHKGleSHQBPEbtDgzGBmArXHv1q0uoLpX
	qvSQ9xRwee54bRg9cUDVXpdoVLrBt/zxRx1je4FdFPI1/1LKRTvBp4henYE2SV5uPVNFINFls2D
	49ZrRdg==
X-Received: by 2002:a05:7300:b214:b0:2da:7e33:9261 with SMTP id
 5a478bee46e88-3044919c02amr5953161eec.27.1779674781835; Sun, 24 May 2026
 19:06:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260524085312.15369-1-kimjinseob88@gmail.com>
 <20260524085312.15369-2-kimjinseob88@gmail.com> <20260524-tidbit-shorty-a4754de1db64@spud>
In-Reply-To: <20260524-tidbit-shorty-a4754de1db64@spud>
From: Kim Jinseob <kimjinseob88@gmail.com>
Date: Mon, 25 May 2026 11:06:09 +0900
X-Gm-Features: AVHnY4JjCqQC5U3akmZsfslS7rD2_33BpSSVrOHsueQkvNsMYUl96ClHBKJbwlA
Message-ID: <CALMSew+Bn6dLxueL4AdLQEkC876XUFGvp4rSjDBiAD26JiBaug@mail.gmail.com>
Subject: Re: [PATCH RFC v2 1/7] dt-bindings: iio: add Open Sensor Fusion UART device
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Most of my v1 review was ignored it seems. Please go back to v1 and
> respond to the points I made.

I missed the v1 DT binding feedback when preparing v2. I will go back to
the v1 thread and reply there before the next revision.

Jinseob
> Thanks,
> Conor.
