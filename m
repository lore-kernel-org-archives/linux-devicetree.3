Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE9D33D509
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 23:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779147798; cv=none; b=sN3j0yxWZXjQAPKmqwiZcafa0kmzZbcEWOgkN8I3CMre9cNxqDDcIAI1FY/xRK4dbuN1NwS8zkJt+y8gHX5yJcO5a/fQyq+PUha9UG/FJ+n+LhagGgY1b7ilzXHUQ6puUFG3dLqs1zg5DQ78REcKQvpHALdoDX6DXC00NrAzY/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779147798; c=relaxed/simple;
	bh=ebvesQ8qFlXiPs2rj2qY2O62rXHnvh6W40TORpD1fUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nadusdij+Yk3Xht5Kjfnt6RVtHQVgY5Eux1hYnt5p9digSgypqMG2lVqV5JVUK3OOgeYoCVhRtz1FfoNxwiRok0HXgl9KT5XyoYcS9lanWjsJxrnyJO4GLJj74yNFyARjMu0Xd3i1zazmdB5mhwQvq3UNWeTY+ipoeg2e21d8x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ccsrn69V; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ccsrn69V"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488ad135063so21661135e9.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 16:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779147795; x=1779752595; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZEoPrUHKxysLWOASnPxB7i564xWUA+RRCTSF/dKDla0=;
        b=Ccsrn69VKHwxYPp+RUGCy8T3gGSPytVDFcv4W1QpogcqETajHsEJsC+dghGqHNMCj8
         y5rWTYdrqIS6P/dMF1l0LvrJvuaVPoAhds4GcRJvPWyS1ollmSHNW7EjL7h5KJopKnP/
         fvJIPjSVVIeAhLwAULACwYtKUj9Az0aA4dNxwWt/cxIeX30j74o+HA0uSrHSAifWGeQ7
         Wu1sGc37l7kssKj+K/rWsFq4zvjBDmoJ9m7GfHiJeR65FMeQ0ZulRR1sNoWo9DLKXHvR
         E6BqEgklMuDCMPY95kM2nst5+jm52/XtQFEf65uyaaePRNoMOUlAYArvLehFAfdz3Evr
         JO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779147795; x=1779752595;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZEoPrUHKxysLWOASnPxB7i564xWUA+RRCTSF/dKDla0=;
        b=C4rQXNz4lJakro2wZCva/Xk7CYLc+njAX5x59JoZtXQk4Fftjq6aY8mvTiFcEX+anJ
         Dau624O1CS+vxyPej/KLgcAl2txpGfGzXh/LKFp0YlCooGA1L99YcXsMrviFBxzaS743
         UKeRWxxSMzUpDMGCv99RUUe/2PkvlTxNl665vL7AF13GPZs7D5mdoLHAwF4Q7uiohNjM
         vVBGzu4Vq7l5e8fSL+GKqC9C662qXMQoFPZvvud7lA8/be3ehCFQjS2rXlYoGN6Gj6Pl
         Cfo+9yeibB85cFFydXrOs/UlomCpeFDEqG6IlPXU2g9yHl8tiGyoj21wsh65PjYewI8D
         0/kg==
X-Forwarded-Encrypted: i=1; AFNElJ/TgX8DhLItgKi60hqmOGyViD6hSMm7J4KXvhw+jhObyfdebqZWFRAT0Cn41dAUHhgVTJpHRjylroAi@vger.kernel.org
X-Gm-Message-State: AOJu0YxYfxnvqRxdKZvEuS++8sf6eUr81JHhUf11Yy7ne7LwqZUkAm6I
	P9cznphwV14fhj4acDqY7azXwCgz5ZjN7OSHAm2xRTf+6dxT39k1mpcM93BZ1IboI4M=
X-Gm-Gg: Acq92OG6g4xNYmVsHxUFadav1TsKS2ITWlLM1kuwlLLXWes3yHhm3htOTeb3ltEGoGH
	V0YMuSAemIzX2GQXXA2l/Yl+C82iNshVi56r2QvQLPp8WnM/PDZUPKkZQry3ttCI2Wn/Jlk0AID
	wk2/ztParPYlxBHUezDYZSIHiGleFWAvb2mBkJhIhwFLWZ7tTTGAcxLySgF5P9La7ob9o2vTT4z
	K8Igeezk0N+cmLE0MX3GQVCev7HY9YWFQRzLsrvwufLSaPrVOcvTtybLI/rldunnViPqDB3d4D/
	Kui3UIe+qlh6nSp1ay1n1Att0VHGNOjQj48hrVMvdC2sQVstKReWs3gFwnueEURUCkDt/uFcbIH
	AmMl6cZfSh259puhst1pPtDOykI3j1pqM9RdU3ndO55lhWScFohF6wABR7OG5fs13rIwWS9KZt8
	uy3j1qIQ8ApRiGSil5M2hAnNM2Oh6s/jDCJfh/BDUuyCU=
X-Received: by 2002:a05:600c:34d4:b0:48f:e230:c3fa with SMTP id 5b1f17b1804b1-48fe6626a58mr269207245e9.32.1779147795601;
        Mon, 18 May 2026 16:43:15 -0700 (PDT)
Received: from [192.168.0.35] ([64.43.40.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ed30110sm44562460f8f.13.2026.05.18.16.43.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 16:43:15 -0700 (PDT)
Message-ID: <ee9061ea-8f70-4b54-af87-420179da9c06@linaro.org>
Date: Tue, 19 May 2026 00:43:13 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] usb: typec: add Qualcomm PMI8998 USB Type-C
 role-switch support
To: =?UTF-8?B?0JzQsNC60YHQuNC8INCk0YPRgNC80LDQvQ==?= <taygoth@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>
References: <cover.1779127507.git.taygoth@gmail.com>
 <918adf8c-14d0-4d9b-93d8-d34592aa04a9@linaro.org>
 <CAFPzRonyVt9Kd+Sc0ooNz8By6b-Zr_jHr0sBXv-M25dQ0w9Cjg@mail.gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CAFPzRonyVt9Kd+Sc0ooNz8By6b-Zr_jHr0sBXv-M25dQ0w9Cjg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/05/2026 00:37, Максим Фурман wrote:
> Three shapes for adding a second port handler to the existing driver:
>    (a) extracted ops -- pmic_typec_port_ops with chip-specific get_cc /
>        get_vbus / set_mode / set_vconn / start_toggling, refactor PM8150B
>        code into the ops, add parallel PMI8998 implementation
>    (b) parallel port file -- keep PM8150B code untouched, add a sibling
>        source file with the same tcpc_dev callback surface
>    (c) per-chip register table + per-chip decode helpers in the same file
> 
> Bryan, do you have a preference? I'd rather match your taste than guess,
> since you'll be maintaining the merged result.

Taste - loaded with honey, chilli and salt please chef and add the whole 
clove of garlic....

My feeling is sibling file but please use your own taste/discretion.

---
bod
