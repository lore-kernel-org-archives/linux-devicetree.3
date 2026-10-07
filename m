Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044034C753A
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 16:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791392370; cv=none; b=FQhfc7AsIHIam4unJs1mlOtUuNVrhWLktI7WvknBvZVSvf4MIap3iCuCKflYw+KKeIZ8II5Qa5C1DIEYyum0ge8vqcP3Bim1p3jHO5zJvdtB0ep+sTZhRxmUq35uoQZX59ARCiM0bi9Gnv9jTiKLABcb2pZsA0GWsXBg8XIMgE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791392370; c=relaxed/simple;
	bh=HUyYKCYOxqTADKL+UZSNNPi4asvXUnNM2CoqJTjTAZc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lfCmMaFcPV8MjklmBHfttJtJstlPJvbBr0SQOP+S1lRuPGl8zC6ZQ/dNr9rZIJeng3dZRY0tFYlMAtjB8B8E1B9jlvr7kp3nt8nSCjcRh//8ZhQRhl3iudh1tCdoyvyY3Z2U5ojTeXv1o3ILSHW71fgAsxEJiRX346p1SikMp5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JIOVqA2u; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JIOVqA2u"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so9051975e9.1
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 09:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791392367; x=1791997167; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NBoYpGZisa/R4sIsPl9OzZlpg/z76qlLC9dYgcsAHGg=;
        b=JIOVqA2uXfr/3c/Qh9WPV0A4QwQwytUxTSm3636cb+JjQKK0PAgO4RXOpwyPMW/8Ap
         CimZ6ORxriXhtLJhgTsED3oUCMjfxw6Xm/BkVzdIlT7T3Vtz9+EMRX1o2IHftLCnjPnC
         y0yiIqPD9eNbGkHsJRWD5q9BNSeBIHAnFIFOaeGXYphxshN36V03PHjHcRmyzOQBN33e
         eXGBquA90MMDTGenuJ60rHvzgg3IRJM2252mGxiDgwqxJqnSTKv3nkvfQaPTb1FA9gkv
         6d4XsaCg94a/QpomMFIrGiUTm9wbjwEmrXH9CUKOPb1p1rZ9n5t4CUMQaEuMJJrSStxY
         z3vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791392367; x=1791997167;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NBoYpGZisa/R4sIsPl9OzZlpg/z76qlLC9dYgcsAHGg=;
        b=qK37RVFn+AdZZTt6ip6muh4A3TZxTQycVVXzZl56yvcP2QNOKedG8/z9+lypxXxymf
         Erg8Zm5IiroCUx2w0x+SyKL6MrbN0joP0ERvdBWImgfqz94Ggju5gJUNH/4vwOaNj8lX
         0r9abw753HZ6I8HU5LFOZIF2pmjXsw8gMkNAAa/UhyGm/IF4sBecRhslaKUTzq+hOP4E
         xs1lB9o2IxKJmgNa40qQhgfn9Q07xtG3Ggyiz8tz2ZEExZgfupNcamBs5qcOfcHd+KkE
         4Ayxwh6ewS7VqA8GDxNBEmVt5+rudMtjbCPuq5wJLwiZ+0cy4zFEQhhT6ZFiz+1f+M9F
         jl2g==
X-Forwarded-Encrypted: i=1; AKwUvBw70Sc+DW5Yb52ry/8wxLgRzfSub1kzRb+DvAMSAQBE4uQNF/i9mpH5kNAhF2FWUoub1yEik3XkztO7@vger.kernel.org
X-Gm-Message-State: AFuF++mPGtaPkJlTUTJNXkCHpzz046MKV9e8o3RtbqtDHXFga3Wg6phY
	Yo3GqbnT5nDPO6tJf2+Id75/XfLZoC2+aoD8nZBUs9mS+uYkfLGEcHu6XUA3zA==
X-Gm-Gg: AYBFou1NcnjggfZqbo96LyNXvKl0us2XbwuuPEBG3OFLeXQJTkizIQhVElGFXgMU/N9
	oO/A7mClLEgcUWKnO5RQsDsErdQ4X36kLxznMQo7GuHVVpGdUQIVtw88PndJb1qJxpgtWiRSqIv
	QRFCNdJ/XFDp5XS421xnJ0CH5fzcUdS7DBbhMN5PTkCh5QQypUyZt8Nc6eor1cFXnvRQZqI4QjT
	uophSYIFlVztzOhOmD7Spryt/mHYcT/YtHrVf0B6XF96HNbENUTxz6V11ofDGfW9usRqoDTNwjx
	GuOJ/seBTpgf2KY/z09oNsuhX7wp4n+c9bLtcKMno3oaloZfSOgKo2wCUxfgyEkkvnbwZv6ZeW/
	uzhXpERWcbzeBbVpGk3VEJnSLraI9z3TkhcxrlPbZT5ARh/7Yov5I4zOG05Uog7RQZ6OaqQL2sb
	mZUXEp9/dsAnMCUGoEkvWcGTbNljsyB6/OCgBij8hyF2A4BE44U47JiLevSN5mblPiRRp5y5g4+
	HzuMLFyXKKJL7uUpXULZy0F4g4=
X-Received: by 2002:a05:600c:3152:b0:4a0:174:579e with SMTP id 5b1f17b1804b1-4a180650660mr41757035e9.28.1791392367152;
        Wed, 07 Oct 2026 09:59:27 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1843d198csm4682525e9.7.2026.10.07.09.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 09:59:25 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: [PATCH 0/3] add 'qcom,ipq0518' compatible for the TP-Link Archer
 AX55 v1
Date: Wed, 07 Oct 2026 18:59:19 +0200
Message-Id: <20261007-tplink-ax55-v1-ipq0518-v1-0-0ef058756596@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDMBBA0avIrDswiY4tvUpxIXGigyVNE5GAe
 HeDy7f4/4AsSSXDuzkgya5Zf6HCPBpwyxhmQZ2qwZLtDdETt/jVsOJYmHE3qPFPbF5oO+a+Y0f
 Ot1DjmMRrucef4TwvjKzhdGgAAAA=
X-Change-ID: 20261007-tplink-ax55-v1-ipq0518-2455645c0cf3
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

The chip marking on the SoC used in the TP-Link Archer AX55 v1 is
IPQ0518. When developing commit 5c59666c443d ("dt-bindings: arm: 
qcom: add TP-Link Archer AX55 v1") and commit e6d33c8b2f80 ("arm64:
dts: qcom: add TP-Link Archer AX55 v1") my thought was that it
contains a typo and it is really an IPQ5018. However as it turned out,
IPQ0518 is a valid SKU.

This series corrects my mistake both in binding documentation and in
the board dts file.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Gabor Juhos (3):
      dt-bindings: arm: qcom: add 'qcom,ipq0518' compatible for TP-Link Archer AX55 v1
      arm64: dts: qcom: ipq5018-tplink-archer-ax55-v1: add 'qcom,ipq0518' compatible
      arm64: dts: qcom: ipq5018-tplink-archer-ax55-v1: use 'ipq0518' prefix for dts

 Documentation/devicetree/bindings/arm/qcom.yaml                    | 7 ++++++-
 arch/arm64/boot/dts/qcom/Makefile                                  | 2 +-
 ...tplink-archer-ax55-v1.dts => ipq0518-tplink-archer-ax55-v1.dts} | 2 +-
 3 files changed, 8 insertions(+), 3 deletions(-)
---
base-commit: 7ee8eb0ebeef2e7bbf2ec8ebc43bf43f2a10a1d7
change-id: 20261007-tplink-ax55-v1-ipq0518-2455645c0cf3

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>

