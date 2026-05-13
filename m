Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E113A451F
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 18:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778696258; cv=none; b=W1RpllS0wtrprpZ8YWU+xHAOgdH96RKU161nJm2WDfvNGaqUvESaQ1jMcvt9cZWu4KZRMbtaxTwMcJFCOg69Zici7570g4V7KWTmWD4ed0hCuIX+IPv5fhf3SpPjRstxM6mk9CD5JVuX/zu2P29vFrtkb+WsAA1gyydCVs+Khfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778696258; c=relaxed/simple;
	bh=s3PbTDlk5Oqc8Ek6vf/l3d/qYjy/w+Dh35a8RCdVKqI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Usyo2mXIhowMeVgj+f+Orwc2SFldXYrsuxXUPxVearzLl8iVv8lEMSi8h1L0u1toNWtCpvALV/6GlQ4CbWqmmeOakVfilsAGFixd+WMlz26OISTw9j9l+Etcuc9gujFPox9P16jSF6wQqldMeeLhLsne7erfb+Wjl3I2/8j0XGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sR4FYzf1; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sR4FYzf1"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8367df48711so3396477b3a.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 11:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778696256; x=1779301056; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3PbTDlk5Oqc8Ek6vf/l3d/qYjy/w+Dh35a8RCdVKqI=;
        b=sR4FYzf1dIi36MsGVWSv5fDwSVqs8dBzRZQcOtHF8Tvfi4J4tHBjqywoh99MbUwAvA
         FYbG2qKlCwoF6L4GaMxkAu7c8EUmF63Tiuz8/1R/IYxF2OFHe2l6NKqorylsoyTzYc/Y
         joj2v2FX+DD9p/Q3hBi8Ma3LL+VQA3gumUHo2O/muLsS2eR9lzyKzmedzdC/OsIu2jqO
         /oexRcnYP6Rt+rH7pcv7a9Z9YMuY/jghseIdioZq9ZmVtclejKo0581FEmFncrtUAy8i
         ldo7Kd5GKP3+sQhtIDShAJCumgM3LXcBsrSg9DoquxHGlbS8vZPCwt9Mz7oqbUrAEYTH
         vnlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778696256; x=1779301056;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s3PbTDlk5Oqc8Ek6vf/l3d/qYjy/w+Dh35a8RCdVKqI=;
        b=LYJDY52AwXgzchceDKCAD79P/7S4LinWK0a4lcXBKyRSt1H66pwyawOuLF88j51gKe
         pFSTQD9Zy8A1pTccVRIezKdQCKvtbfaV+VPauKTNtuH6heVaa5gtuLSUN7ftqo6Po1vS
         aLVIPKVVAx11dtiUCKpCrD3W2TOTlpMgi13EUfhO9RGqzDlNrKp6gN5Y/lhK93/L3mnF
         GfEN9iWvalMgbUivzcI/7g8hAbIRd8m/FY81M05ZF07fEofcp3ITK0Vd/dhCneiKgu9V
         2tZOsrYwL4ITCRByJEqhpz7+adleN2aJlRxrx7GgGQIokHn5VjmaVLVd4GrACKbaO3pA
         tF/w==
X-Forwarded-Encrypted: i=1; AFNElJ8mKJ8WbcOtYciGxdwoZdwd/MoY6/gZSH9seZ3Ja7ULl5s59McpoW/JVlotXorh0Nkw789kH9Va1VF+@vger.kernel.org
X-Gm-Message-State: AOJu0YyEuWqEYySzrv6CUCA9H1fv+l2Ew4ecnNXwXQp3lzWeRM+fNK+Z
	cDD2Su50zLxnz3FFdOXJAk5WlkIzSw4jIopG50OPwDpGcOPxAViAQOaw
X-Gm-Gg: Acq92OEjptL/xhXQo7PHFRro5m+B4rYBih/Nt9rWeU+plNSL+J/hIIMKvUKETRKm16H
	bL95ZRqkEa1H1Brl1rM2yHXtxROojz7K+vK8DjJfIniTWhyQo8I1D/g9dqO6yT3tPYSVmpxWs/i
	tsj997ioizNDH70fSBcmjcVn8K4TCQyC5SVzTSO0gMQjebz6JB7ipTkWHM4g6ckfeZFDNMNP8Q1
	y/+3/n7GgV99pTbYi4PJam8JcK9kFIY9d7nmhuX1tJvD13Y9mPrmCL6DcvmLINucrXXXlCsoZkb
	dP7j4Qleh7AcnkYnFgDiqWqylgh7/W+Ptdd7TmqYC9I+QlcZT0JtVs+STnSxD4J/mWHcd1s+2s6
	suDZFuy+7TyxP8gj+6NL9Osjm7ZFa8cMjP7v3qstaSQenLNSWrI4d9vR/KtEfRv0TvZ2hczfQAL
	doJBFZMCHbKzLf5gNRahdPCYxfUNl7MsX6ctidUaNi/FZZumhyg1dqkiA=
X-Received: by 2002:a05:6a00:4ac8:b0:834:e092:2631 with SMTP id d2e1a72fcca58-83f03e948b9mr4491931b3a.8.1778696256394;
        Wed, 13 May 2026 11:17:36 -0700 (PDT)
Received: from localhost ([203.99.159.235])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19f7cd19sm166265b3a.54.2026.05.13.11.17.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 11:17:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 14 May 2026 07:17:24 +1300
Message-Id: <DIHR7242IVEQ.HZ3NLNX0G9E1@gmail.com>
Subject: Re: [PATCH v2 1/4] iio: light: veml6030: remove unnecessary read of
 IT index
Cc: "Jonathan Cameron" <jic23@kernel.org>, "Lars-Peter Clausen"
 <lars@metafoo.de>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Rishi Gupta"
 <gupt21@gmail.com>, "David Lechner" <dlechner@baylibre.com>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, "Matti Vaittinen" <mazziesaccount@gmail.com>, "Javier
 Carrasco" <javier.carrasco.cruz@gmail.com>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.20.1-4-g02324e9d9cab
References: <20260513-veml6031x00-v2-0-4703ca661a1d@gmail.com>
 <20260513-veml6031x00-v2-1-4703ca661a1d@gmail.com>
 <agSt_TGpyujxqrZc@ashevche-desk.local>
In-Reply-To: <agSt_TGpyujxqrZc@ashevche-desk.local>

On Thu May 14, 2026 at 5:59 AM +13, Andy Shevchenko wrote:
> On Wed, May 13, 2026 at 05:49:41PM +1300, Javier Carrasco wrote:
>> This is dead code as the IT index is not used by gts to set the new scal=
e.
>> In its current form, the value is read but not used afterward. Remove
>> the dead code.
>
> Does it have any side-effects on the HW side? Exempli gratia, flushing FI=
FO,
> R1C (read to clear 1) bits?
>
>> Fixes: 22eaca4283b2 ("iio: light: veml6030: fix scale to conform to ABI"=
)
>
> Not sure it fixes anything. But it might regress, see above why.
>
> ...
>
> If no side-effects, the code wise looks good.

Hi Andy,

This patch does not have side effects on the HW side. Apart from having
it tested with real HW, the operation being handled here is setting a
new scale, which is stored in a persistent register.

Best regards,
Javier
