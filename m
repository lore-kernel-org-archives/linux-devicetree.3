Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793805255;
	b=xqMDS1+Zt958eV8ypgBEbNnXiVSuceePYRmbNUao549qydHlBFZacVg3D0kMxBwFYNa4
	 C0ppGjdWIw0EdbjiQ1J7TA6AfgL/WFckfxe52ePA6Yq4qLfSZB/sZ6XUxsxZAoNkLAeU7
	 ZSu9ZslpLSeYNpuvnOwFMiOmMinIytUVfFGOGCi0gRsKOTDWELWrS5LMZ7HLaBeIuBYt9
	 4TGsYdCFEKhF7d1dabt8lT/d3/C6u/qGK6afm0j2J6HV+KnXDI13KOmghUJ51nBFAkU4G
	 WDduCULZczIJk4tGNQwIrgdIeL2Dr2zDyNKecTF4XQayRNUvm+1V42RhzKVW2/7eQcA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ROC4carc5ag3yruhjakvwE9XMb+//D3RtR/BQW4q+8c=;
	b=3jBbXjYrXmTS/u72SGWlK8fpjqfGoDPTs20vEgDsDUgBwcpcTg50jNS/1OUBwZkdL+Y0
	 6lNztxhzirsQOMXC7sPnnoxwXlAkwBTgagI1rjlMFyOzXeqIk4AwzMxYp2RDS7W87aIKQ
	 6jQnltCPiv0jEUL7Ssf1/vaQYKdNxucKEQl3v6zRkbi4BohJH8icEtzH9jT6CdGkxHOKL
	 CAlNAbQRWNUEyca9LL4H1SoOPxm06KgSdoji5QTI0b65BqybTFWgroFlCg6IiQR2dSndo
	 Srjk4gOz8Xk4MQkXnqC8bm8JP/NYFzQOoC6naaPvw01woGnTbeg6NJFx71NLyicaPjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Y1zsX378;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0A4606A33E
	for <Devicetree@vger.kernel.org>; Wed,  4 Nov 2026 15:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF0A4606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Y1zsX378
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b56c428212so381293a12.2
        for <Devicetree@vger.kernel.org>; Wed, 04 Nov 2026 07:14:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793805253; cv=none;
        d=google.com; s=arc-20260327;
        b=PapDMGRlfh3bxhWB+wVFc+0tG4jMfuGHT5XA94T4EsYvftWYQtgSIqNBj/EAKSGv3T
         VnxFPIPDULrOrQ8fNOk63vqLgglEEWx31H1q8/YBe/fger51bGd8tWOPzjQRFIcQGLCE
         uNAbKG8R8TRd/PS8cJC0zIvhABW/Rh+oy3IhYV12gigObhs33JflTGDb02KBRxeGBCj+
         Y1CO0yUbMzueex7NRyoyzlwZaJvIMBCzpYYon4+cH1EayEdOtQ8rMe/dKzaoCE4NegR0
         TaUxvQTZFaSrA+TNb8msS/lWJeKxuZIahjdsKxOl1aSE59ZYBa3azAv3o03rnkHqbNKG
         aLLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=ROC4carc5ag3yruhjakvwE9XMb+//D3RtR/BQW4q+8c=;
        fh=kcKZylrkHAU1ghzNx84FL2CHrwvT+cBgbBZ46rdVYzo=;
        b=MIuGA0H9b19D0cOradToEX6RC8wEV8101vSMJzw4qmF8dW6IJWLlGXZjzUmGi3/D5c
         Ti0ZtlzGK1YhWiiuEW+rKnFZusvj8W0fCSmfxfX3aYked8q85Z4et+WkrmJomeOYECdp
         7AdtQ4X5TwzDTEUzgxEenWx263Em09D1TxuUncwqX5iFd0CroT+3MTkwSWswGoVhzYt0
         bgQRkIeQHJMi+6PgcuMLzUuf1GCu+ytvnPVe8mhqeSDkLzjoUtc+6CxKre1wBAF/ulMw
         MIaB5uwdH5eTlgu2XDrDDNzGlmAZc3cZcInoovjbIR2L6qrrhW2DMACJpGrlahPRkivx
         nXNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793805253; x=1794410053; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ROC4carc5ag3yruhjakvwE9XMb+//D3RtR/BQW4q+8c=;
        b=Y1zsX378kusvubbo0IH/Kiu2MUjJnOlUaZHAsVp3UZZHyN5MFMSQ21ppiS9c6wgW6A
         6/zZl2+wCovE6yhcXCl4JQKET7Vg7Lj6GWMT7wFe2aM8Hi/iFqk/vwJR58AUu4CiVSUg
         /qPsunGogtch3I5R0noFWiEPrhzcFTA6FCXn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805253; x=1794410053;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ROC4carc5ag3yruhjakvwE9XMb+//D3RtR/BQW4q+8c=;
        b=c8MyyOQhCJT++3OauUWosJEwNqE8FscdkuaujncxVeHPmrGeLeUbFA2zQiRoofa8nb
         hcR26XGFHZ/tQpB9Jpo9KDB2EHLG7ScckheP0gH1vZ9sQZ9909zLaoPTpUI05JanEUbo
         9IsU7w3s7DyGs/Er1XzS1tA5EHZTGswhK24AFKASAIRmOgdxY6arSH9rzCQU9kGhEqJL
         uq44iMx+/fMC66h1hSD4X3aoZ8LKRpzJuM1qjkD7uPk8KDqaSUPaCftq2dhXwj9H+X22
         jVojWvmpxFZxiDXnZWdA1uqTF4XYSTc0LtWJ429PdiXkIP/RI50Q9kNo8wGy208kzmL5
         h7LQ==
X-Forwarded-Encrypted: i=1; AKwUvBzfoMTNirrrYFNRg3YO037cDVUrT2POcCukG6P1rSr7KWvqCzZkPQagG2RSm2zS263W34pZeDBxY/7F@vger.kernel.org
X-Gm-Message-State: APuU4Z/oPSsROStcx7EUqn+yBnqlR6KIVsjgsnH+zH3z5jH/6L9bJjCR
	MDkEY3Cn/kqHtHWO0CD9Vc3uGS2G0iJs7zpuiEWBfKKmFOLfZwAaueR0Uu7fEN0kwqrzrdBSplr
	EnQBvGYmejD62R7ZfgItu31rYZmNOD8E7B19mSbKB
X-Gm-Gg: AYBFou0XkuMIG2yugr8Nf8iGyG8dvI9xd/FQA9xa7ry5XGadVoKdFaPmIuYT3DUwfb5
	/8lrew22fb9HtDs18Q6JJtmu5IsYss2bL1FV5kdZ5bfHpGEj0lh6xSwUsulS9b0eV9GEYwt9eFO
	KZebFK1KgTHTKRPInjRWu68OW2EKcDfKUyWqPaFsg0UjeKTG+L7wjmeIBqHO8zp/y1Wo7c8mmY3
	Iu/q+qDMODlvy6drS3cE0zU+2a15Pp4QUHcEjHTXSbNfGu1mNMw+rwvjOT96fIGKYYTswdLUCdA
	MxKJhc6Dy57LTUbeOT0Ruh5K1o4Tis6tzJfNtnFxbDvnksP0nFDklzPbk9hDgdM1Kh+dh+rxprE
	heJI6CuZIkPXSdSkBO2CdzgqcZFJndwoaD7Ydij1NlUkoBbs0SKeFwEDxf/rL78T6OPTnOmqx
X-Received: by 2002:a05:6402:1ec9:b0:6b5:1056:cb7d with SMTP id
 4fb4d7f45d1cf-6b51056cf3cmr8934538a12.1.1793805253293; Wed, 04 Nov 2026
 07:14:13 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 07:14:10 -0800
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 08:59:22 -0600
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261101220224.1436242-10-dianders@chromium.org>
References: <20261101220224.1436242-1-dianders@chromium.org> <20261101220224.1436242-10-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 4 Nov 2026 07:14:10 -0800
X-Gm-Features: AclHuK8q32ivZzhO-lFGb67WnRAtUcaaYFEqbKx9Uqfw07KWfEsdfk6B_95tIQY
Message-ID: <CAFLszThcMXxh05R6NNq=oBYb1w=xB5iZhpBT4sG48+PLceHQtA@mail.gmail.com>
Subject: Re: [PATCH v3 09/15] libfdt: overlay: Prepare fragment path helper
 for reuse
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, Brian Norris <briannorris@chromium.org>, 
	linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Simon Glass <sjg@chromium.org>
