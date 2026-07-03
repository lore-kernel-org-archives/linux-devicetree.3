Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007383EF0C9
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 10:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783074920; cv=none; b=gPNnO2PXsw0zpVjVVQENWaX+IKUGePA8NNmIwKF3McPkr1jnX9OzexO5rDHHB6SJpfoGMAYgKW7YGUknZti4aexvsuokrVK4squZqMcYDwLadeEY2jl2TIHSVmkm9xogZxcb9cFDCvTZLipbPrlpF/uX+clS8+hPb2jo7GB1Q7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783074920; c=relaxed/simple;
	bh=D9xZD89AFQxQZaMA47uckOTpOnR7IRhfK9Ps5nQGCtk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZJJ/zO8mjC2LAf3fyiJIAhyWEUypDc7FMyqMiCMmWGuLCaHMYxVfC8sKg60k53M6V3hMxX4KNvD5t9r3VyjwWWrHgfI1IgmGEXd9a7T9TLFADsT8cQRavkER+mjQ0xwElFOSkUmdoXW2is4/QG2L//a9FeY5Upfl3dI5dmFaEJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=roKBdB7r; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="roKBdB7r"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45fd464d51fso225812f8f.3
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 03:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783074917; x=1783679717; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9aa5VRYjwfcBa4J0ha82pG4RI9w9o+IbdPuBnZ7LdEE=;
        b=roKBdB7rIA3wqv8wauR3UzV4vHO1ba6+zmtqndw/VSlBY6I6NhwkNmV8g8OMCTLfYP
         pv1/tidv2BcuAAU6iYBjofEaEGkoAnBlM7m5rEBP+dAqojeNAAhRSr5ndxEkJ2gSzWBV
         0UiFGrXRwVUl/vsze5+lkLHsDb4jWyFSwxXSW7iluDMilTP4MQTeKFni29/CcNmZk/4q
         MOAK46TCFoq06ZT8NHMoAs8ohQPOFiKTAwgCqviooPvUYJDV9nwOuWgV7WvtEXw2NOoZ
         iAKFrHa21QEJIbDDuSYKYaOjovWvNV0x5eiA0B8eUlU+f5YAiavIctuqkZ2BXwJ76bnt
         06sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783074917; x=1783679717;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9aa5VRYjwfcBa4J0ha82pG4RI9w9o+IbdPuBnZ7LdEE=;
        b=kcjrB2xxUCv2EUt5QaLOpqPvQVDDdodPYnmc6rJae/n8MxPfwX7DcSeCn3rzeX2yna
         YhyM4AOViUGHmMwk1TcUFSDHCj0ahnaaLTPsG0auf798sxvHfTTHhlz80UdjKw+tvSiB
         tUMEqugwjnQ1u7nw+iDiHqqB2RDNoKBhjcKfNhHJSBkPVUqEj/LwfrpBliQQAG5LQrKJ
         SbOlJskT3MjoLTUnX+LmK6VoUPix3jov1ton6g3B04iu/VJj7bVjh45OJDffcDXknPfB
         yeymVhNFx6El0imAAqgQXpx4JRuw0v5C0Zv+25rsNlm9o65JYo32mU3om+sRIZlarkVJ
         yk/Q==
X-Forwarded-Encrypted: i=1; AHgh+RrN3M4fzSrTCfWvIWtQo9uQgeBcbCpGsKn3XEMuW56ZnlVs3j3QvFWgcTgN2Owv9OBngcDQ2Z5J5fog@vger.kernel.org
X-Gm-Message-State: AOJu0YwwGZmtHUuTuA5vFSakijQ5gpaj7VZOGchSGUbhychL2roHOAY4
	h6LNpL8VcFr60u/Sncv4wNAUuIo5shEJsvRQNa0Np8u7vUdp/VbzdRYD08VruFSC718=
X-Gm-Gg: AfdE7cnQACWIiy466v0xlTpK5I6mX06G+0hkibhv959i52WtTbbhV9ifmBszzazYvWj
	qeILCpHzoWXYkuGsecv0ej2sCP+l+UumeHVhWQcQdmcnR0uMTuw5KAjI9Zwq+G2lxVF3JY4s5q3
	ygXy/tOP6xlqGyrCYT8fIMJf9oy9WITRYwwf2e61SjSCPXKnAmMuLW/912OguIg+4D+4T7orPvF
	fg/APv/WTgj5A/aMvy+XphncseIeEG8xho+PSUzATLnabAcNsxSVV3arj0x534RLrt0MQXFeH5k
	2ZSTJq8nKrGvJA+wDa7nzqOfkzytVarnjicmXzn3Q0MZRgs4fbt4xv0cxj/ZPO2ihefHVmQLAbI
	anLg8udKbO1IvR83awMAJvzFbbBVmKehc2blQyM+eoleE62mLEncwzHEy/8PMqlQHmyDkB3HugD
	zBL6Ykf75L+fMHlo64dvCGDnl0iJIfeJXolkMpwZcfsXpg
X-Received: by 2002:a5d:5d82:0:b0:473:fe94:9bf1 with SMTP id ffacd0b85a97d-47757f4c487mr15276685f8f.26.1783074917112;
        Fri, 03 Jul 2026 03:35:17 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a450bsm18149405f8f.10.2026.07.03.03.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 03:35:16 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260629-a9-node-v2-1-dadd3401fccb@amlogic.com>
References: <20260629-a9-node-v2-1-dadd3401fccb@amlogic.com>
Subject: Re: [PATCH v2] arm64: dts: amlogic: add some device nodes for A9
Message-Id: <178307491598.3384545.582524500298213361.b4-ty@b4>
Date: Fri, 03 Jul 2026 12:35:15 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1

Hi,

On Mon, 29 Jun 2026 07:52:53 +0000, Xianwei Zhao wrote:
> Add pinctrl and irqchip-gpio device nodes for A9 SoC.

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.3/arm64-dt)

[1/1] arm64: dts: amlogic: add some device nodes for A9
      https://git.kernel.org/amlogic/c/3ecd66ea250b81dcc847253efa6e4d691e6523c8

These changes has been applied on the intermediate git tree [1].

The v7.3/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

