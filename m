Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540468;
	b=zIePFe8yyjIIK77ZOsucJaOaKYKfWyXAAxVWBX4f0YEYSgQob8enOfCuKcv37w85GH/a
	 mGrS4U9dKghe0OyOsWgwUoAdNfZeHFM90z6EhEsTUoeijm2Bmwu2XQAZkIE2tpEd9eXIM
	 xTd17ZV4t4p2EQzHqGfDTgPqpWMPZaacXzfbvKank0vJnYip0ug6b71thwq2FAQiV4twW
	 k2q6bg2r1/TmsS11SeRaSjfb57OJu+s+xFiSqoW7MjuLzl/LPewEixDOHISKyFAipjgux
	 RwVwKZawqXHEr9tDTdmaF9cPbYDSFfHtREpTyW+0PYnZ1IdnVfP8sRZTVWh9BnvdMTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Hd+I9pXW0sdvyEhQLvxNgU1qRGdrRwFhnl9rqEkxAvw=;
	b=YBuRrvhFK4apax6Rgh6r+H3Rl7iCA+AuDp83sygvKAcxa5K4OXV5XT1SjmqSIyt6wX1H
	 2I0PmB0XdXoBAU0LKsPGSd9gmNbVQF64cqWAyShP1FgZC1fct40F7nCoTatNPyYBwizzi
	 ObfZclRg3tz0sir62RlmXOqeblKxJazMXUBa0HYb7NiJ4Y5Bk+U3dHLNUKX24bDA+AU/9
	 f9tHEBrd2qINZsctkJXjHE6U8tnonJjjsMw6MIXPiasGNGQDQ81jcqUlP9iCHVbMi5+RB
	 ghjZFAs9Y6GNQUqTprEXwlMnHbso5G5lG4pqGw25G1P2f6QKua92U9CiWQMZLpEhClQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hAzaf7HV;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A61606A329
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:14:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50A61606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hAzaf7HV
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso46246085e9.3
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795540465; x=1796145265; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Hd+I9pXW0sdvyEhQLvxNgU1qRGdrRwFhnl9rqEkxAvw=;
        b=hAzaf7HVGSe6Ta8UOuiGwSzU8wC/W4gE7QFjKOfpPImYeKL433CsG+nsm0XitiI1GD
         y17PfOXXz7bojs//ht5Lr4ZdVftlbCUunxgWR9BaPcDiKpP+RXQZ6+XfanXrgdokC/FV
         ORgCbrv+8zod2SEdmCbDWYMw0PgTFbBAIg04iUG6aI1/aJOdtcSgB7e8sfdU1iKK74RB
         QAj8u88PbW5EgVa9t1dncQA9pWvfFM7cA/5jINelt96IdYPjyU50Qz9qQa5Cpf002GMH
         UVfpiSLYB3rLu3FH4KQzPF6Xay1mtVXfpQmtJrRjG6kB+BjqoH4Itm/RUD8wEiiXrlGA
         MM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540465; x=1796145265;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Hd+I9pXW0sdvyEhQLvxNgU1qRGdrRwFhnl9rqEkxAvw=;
        b=m5a2WYTVJgImA2C4SFzbPxIa0yi08kPmntYvQRBghXbFeKOYXerK8lpIWws5rcV7fo
         Fhdml6sZ2TA1OVzHgP8HKQNwaDcMat1Al4OycGETwQAFhdtCdcR8HFdqqMULyRrzgHVm
         nm6jQWup4R7OTsFU21nmXHHWHfy+ipNaAisEtyvRBr9Zc77NmXOiidHDq6D8LrSnX8GD
         /uoyAHLw2mu1N/v5l6qrwCwzMgB0dscQOyVI6vhtjbLIY+VgeqQ8K0rNeG3efmUc1189
         lIPUuwRZWqn2K77Wn8325ZtjLrZZE9peIpnfSM1dDx8BVDmdZuQwBdynI/NM/WSU1UND
         mJYQ==
X-Forwarded-Encrypted: i=1; AL+hErESXiGyoeYyKUuOiO59KIDB2G6KHQu5iDntTSCUUFuBoQsJn4G3/Ult7fk9GyVD93eYjUm+JrekoLyG@vger.kernel.org
X-Gm-Message-State: APuU4Z+/H3ZgLZuFFlxVrgr+L8q6gnjFeFV9xjPKk6QQ8S8TsOxvI3sj
	gcIIw3OT2xrlIUuFA/GD+BJfhuzGmrsMSSqRzV6k4/TF+ANVZJYz29dpDbSHdgy4V7Y=
X-Gm-Gg: AZFdTZddr3mqhyhAzPaVS8NlM3507aQHRA2rOWxayBY3qOZunXA3GOuAaRgwGmWt+cC
	rst+yVkX3Zs1iJQZflhGAm6a6tsPndsgiNYmTryI6qQurvOyHBQ5pvimxY7Zp4AiZc7phXubNO4
	Rs6KR8Ct2eTE+ig5IH7wQcMl+I2WAiycVqBr8pcDRrP0YLXbycx6gyFI2bAOVx1cEyLwjWvKLDr
	YQ9WSBJ4HVu28cKYNIefKhxPG0znJPfzoXe/TYOfykTOn9QEeIE+bjjMUqFCEhVWYnNb/0jvMyH
	nnbSC2PoNaB2mJZEacozAnC6GlAsj2SP4y8b+mLYYViBDBnAEGU8UZkdql1lTfjRg3i2vO9gE07
	wBSBSNWJgsLf9Q4fo+XsrxcU3LIUFRPiqIycNfg9+CR8BNGIb8ZigG+o543FsWPZGQxLtUC81Ow
	5KtlcFsaoRvhol0os8LS/bpC/kgaoRnjveMgKgXAj1ShpoJI7ecLLpDfwGS7jIEPDDJX6mncuB2
	pYKZA3OFgp6KhxbWaOwfTWhKmnTnGoGx/fjrAw2kQSQh49sVXclSTLGQVVsaXSGjAWC1oWWvJnp
	+YAWxbr+H66s0Alfc1UvPhuaxq3r7KKZ7soIXPpRqjCr473GXGQ=
X-Received: by 2002:a05:600c:5306:b0:4bb:6ac0:6dc1 with SMTP id 5b1f17b1804b1-4bb887c994cmr314870705e9.2.1795540465344;
        Tue, 24 Nov 2026 09:14:25 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm410592735e9.8.2026.11.24.09.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:14:25 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/2] arm64: qcom: enable SM8650 audio without ADSP
 firmware
Date: Tue, 24 Nov 2026 18:14:21 +0100
Message-Id: <20261124-topic-sm8650-el2-pinctrl-v2-0-fd05c8378a08@linaro.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO3FBWsC/32NQQ6CMBBFr0K6dgwtUtCV9zAsytjCGGzJtBIN4
 e4C7l2+5P33ZxEtk43iks2C7USRgl9BHTKBvfGdBbqvLFSutJSygBRGQojPWpc52EHBSB4TD4A
 ajTupokJTiXU+snX03tO35sfx1T4spq23GT3FFPizf09y8/7cTBJyKGVdOG1Me3Z4HcgbDsfAn
 WiWZfkCplw1i8sAAAA=
X-Change-ID: 20261113-topic-sm8650-el2-pinctrl-c6caf4237ca7
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1502;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=0xZyYQ1QCsRnZoyKEDk/WLh63GWw1TE5/07D9O+VLII=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcXvXtZBbMLDgvkGtCfwe5VQZTIYtV2vlYQQnUF7
 gXNg72OJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXF7wAKCRB33NvayMhJ0VKHD/
 9NUveMCAmZ2GPhLrcDur6R6JVJ/4cFN+ATqPprw7UcaSAsfPUwTCEZh0cutkUl72Aw6MK3aXydLHVB
 zKTgqsQhlw7i58wOSG0souPfTE0g/ykG+yFN1gcSGYeAzTSv/V4SeNNjSW5d1Alo30uOxaJyO7Um/j
 3mumUY7ptOKEBMV88BzD09/UKoMFzX5mRQMLl2OtJq0PgFsG7mnQ8cnwg/TA97kyt+yOUPHMC8RDTk
 qLn2a8eDPAHonAmaTGo/3QOFbRL4RFoVOf/tilSizA7I5jA0qwl1By6AWY6r+GeioVP3taxZMzNYL1
 ytFaNdQRBpo2Vmd/LN0OYyuYFMNKDh6NCFfuDJq4dDJDYXTxCpRpL7tV+GWASTu7neTnON1TCdnaDN
 bBUuD1eleDutzYIRyfcEC8rcPnICuWq0bbUuRuMYWA8WRuui2C+aATnqwsPt5Q9NzxVkIgJOBRiAth
 JhPc+YtSPC29IJDcREnBj+1WHFb5AgdC6VkyswcnFb/FtsIbdzvA4B4jHx2awRuCbPfyCgX6VlRuT7
 NpN2zjTIijkVTRbISBt04iDXpuvvpsehdq8PRxKnyU/g+MQJNpqgU/JWkgqWkvfvBSNIkGWL3jsnXj
 91x2U/VQu9iCagAr14CI/vHtIN03BWp4U8MNACz2l57Ds6sn5KOlIDZmCYRA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

This patchset is part of a serie adding the necessary plumbing to
drive the SM8650 audio interfaces directly from Linux.
This is required for boards like the Valve Deckard that boot Linux at EL2
without the ADSP audio firmware, meaning the audio interfaces must be driven
directly by the application processor through lpass-cpu.

This patchset is forked from the monoliothic v1 at [1].

Without the ADSP firmware, the resources available to power
the pinctrl differs, and the LPI pinctrl power is controlled
with power domains instead of DSP clocks.

[1] https://patch.msgid.link/20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Simplified bindings change
- Driver update to use all power domains
- Link to v1: https://patch.msgid.link/20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org

---
Neil Armstrong (2):
      dt-bindings: pinctrl: qcom,sm8650-lpass-lpi-pinctrl: document clocks and power domaines when ADSP is not used
      pinctrl: qcom: lpass-lpi: attach all the power domains

 .../bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml      | 12 +++++++++++-
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c                     |  9 +++++++++
 2 files changed, 20 insertions(+), 1 deletion(-)
---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20261113-topic-sm8650-el2-pinctrl-c6caf4237ca7

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

