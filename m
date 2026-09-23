Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFA253A39F
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 19:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790191887; cv=none; b=T7uk+PiZGSaLYhFoS+dJYg3yzVy97IVNt/TcMY4ksrbeEtokd+B0vRHbW6Epk3xahLjy64935SqfJ4hxBRRv4Wy3xrdDemnCYtxw0laE7uPwzf1O78m85VueA9BeoB7cqQHX4aVE3jhZaqhbtM5VQayL6GtGJdmLr7B2AlpBw3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790191887; c=relaxed/simple;
	bh=0bAYyi3GCLdFiwrtiO9nW4HRWiGG3z+wSQsq4pbpR1E=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=jOAg8d2dBC4ZgatlH0A4ZUjQc2DC/D5lUKMLrMvsoPJIajnu+9i2JchvDsbeuMnq72mkcbUzr7LmNQUj+vPmoB1bjggsNJTXreg1Hr3C45YF8L4bsTQ/LCeNbtaq8aTvveOpqrTbJLL90W8PYNKF9HhUpNlKo60f+rmC8TqLbQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U15TE6Ty; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U15TE6Ty"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d097b4939so7243735e9.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790191882; x=1790796682; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0bAYyi3GCLdFiwrtiO9nW4HRWiGG3z+wSQsq4pbpR1E=;
        b=U15TE6Tye4M5WDsw35fFP/Oh0EEjWzmo8Bk+GlPMfFg9Z8xiMQ0F6gAWp1AZyVpxxX
         C++x70T0ka8JR9j9/NiHGp18izRt/Ko/M4xBPlD5jAfmNG7Fw6V2zIZNPGvKBlQjAfKs
         c419SoCCExy/qT2RovQBNodJdoJ3uptq8NFTVlpprSFajPal3YLiJphbKZYQ7pObiXLW
         WnhhEaz8lX5z0VU5oa8w1EE7tfXV8+VR1lB0NK0PJduXxmvpy9TxBFFChPp5S+sKZZge
         6l3JSEm1p9Tr1gZOBxzCk8ar748lZeHXROF0FH5u6aL0Z+Ek0Pqv1ICZ/uQEZBqFQgUN
         i/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790191882; x=1790796682;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0bAYyi3GCLdFiwrtiO9nW4HRWiGG3z+wSQsq4pbpR1E=;
        b=dOMyzXqcO1fSKXsahDCe5pg+ytdmI1QYD4Zybxnt3hQmkt/L1HxjOL9EBvI08LPj4p
         4NyZ2r2br/ejvCXEBcClelf/RgHlH925Z9vOX2L3HBtoSJ/KCRbJlNq5pGVBK+M0eGK3
         Iiwyr2n2yBfZwfq95Ad+01adZAYraGFUBNgYgiHXFbXXjKLKKE0qJR5jB1StjTn0Ibbp
         DAEFO9EnEUu5JDv5dMWJG3NUB6YzBeY3FIEzblVnwdC1ng+fbIgECweJZJVAMrEvsGT5
         iw8sj1HIYThnWFE2S8H6UAvK+dHwy1JrMsK1XL6mUBNQGx854PrvrO5ez1KqW10MTzqE
         kLFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkiaOOqDRUShf+GVBgWsx4nJLsO2a00ObPDkSFZTUhDVrq4IapzL/vGUw0XFiiCDWzG+lK2P7xy55H@vger.kernel.org
X-Gm-Message-State: AFuF++mNqLsDyjHH0I1mV/0t2mSJJRSJTGQWodx/6yVwfSgip07bpY2v
	32pZE3Cn/lYMoBCy5kyXZ/cVcl3/XT+TXcwPf6/rZE0IGMQ/h5Dns0ZXs6d1BQ6k928=
X-Gm-Gg: AYBFou0JsKkm4TW9/kCsq9oynPOs8ugBhqGyzSEDIGdC+QPM5Ep5siUCupCvRV9NDFB
	vaSR/AQNPZkvbCZ0Wl5C0haj4hsyJN3aWyucw0c5vRHh0U09UWC0rd3r5svxsex1eiQoZsAk8Ff
	6ordu6cFr7idzx9Cg2NfpGGEUMOQolDTEV/8jxEiLrnAaSuxlJ//vP6lgX1Xx/VzWZquQln0wZh
	WMPqcmQWbyYM/LFA6joOmMp6Yzd5bOuz5Q38uyzGBmUHSZjap6v344e0isgTJv0rghByoYXxvPq
	KF/IhTEDYPG2RW/j1HpvrqYk4tkmCTM+ruKb1oNSRVwFrWNKsEfkw3Prbs/lB03ul93XxOhHFMp
	tStgNt0nkT+AP5y8oPlQv1dKWtEfeZTAQ1s3OwmoHl7ybXrXm8rmyPQnMpzneXtD2zVx0zfIWo4
	mlavPnWPeNi7dxyeP5ISEcwVNGnAF/+sVpUJmk7R8LaLJ44re9qT7g5J+G1xTV5ChDDEsicuyqi
	AwmfWM7a8LtR/YIUDTA09VM8k2P4Gu47zRHxEib2i2vHA0dPBJQ2on834S9l9pK5HpxoA==
X-Received: by 2002:a05:600c:3514:b0:49c:fa21:e749 with SMTP id 5b1f17b1804b1-49fe67043a0mr3428765e9.31.1790191882395;
        Wed, 23 Sep 2026 12:31:22 -0700 (PDT)
Received: from localhost ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd42f2sm8534355e9.15.2026.09.23.12.31.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 12:31:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 20:31:20 +0100
Message-Id: <DLMY24LXCIJ4.15ZGPGC6UR28R@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>,
 <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <andersson@kernel.org>, <konradybcio@kernel.org>,
 <sboyd@kernel.org>
Cc: <dmitry.baryshkov@oss.qualcomm.com>, <alexey.klimov@linaro.org>,
 <r.mereu@arduino.cc>, <srini@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 4/5] arm64: dts: arduino-imola: add support for sound
X-Mailer: aerc 0.21.0
References: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
 <ca8cfb43cdc08851db1283df2108e77b22fedc6e.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <ca8cfb43cdc08851db1283df2108e77b22fedc6e.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>

On Tue Sep 22, 2026 at 11:11 PM BST, Srinivas Kandagatla wrote:
> Add support for sound on Arduino UNO Q board, which includes
> - Headset playback and record.
> - Lineout

And "Ear Out Playback" as well?

> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

It would be nice to see some Tested-by tags.
I can't it test because I think I don't have this board and no time if
some fancy connectors are required from scratch.

Anyhow, by just looking at this I don't see any issues, tx-port-mapping
also seems to be correct correct, so:

Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>

[..]

Best regards,
Alexey
