Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6961D33DED1
	for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 01:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774661976; cv=none; b=pGQWFwkZC8QhXsuPmIw+Z3EbhTvjXLL6MsIXxlS9henKY2th+beNrSaQdEm6/nlUUbo2mh/stWOzF8v579WGSEhWtgdKJcs0PcR3r38Gl8BAXHp2ag1fI6zN+RKNIaE4Kct6vT3OKy/BpNasXaGoAHOnpoR6CjCioZb5S55blMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774661976; c=relaxed/simple;
	bh=MESqiG8F4DXapkfQrWlrnD1nJ4Qm9J/wC/DX80zcaqE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MVQMM492IwEIgis56zCMiBvwPj2SkaiuT8a/kl33qMMYxK7dkTL6qakul0sxCuie6nsVbjNyirnbvvoBn6mx7kMvioWA5DtaxxF1cjL6LREe8+8Pyrx86JBm3zE2algANIXEwN5sZvhpVlp1QQh4Q9OZxxe9a6vlK3Vyvfo6hms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xjONHI1Q; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xjONHI1Q"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-482f454be5bso34977015e9.0
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 18:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774661974; x=1775266774; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MESqiG8F4DXapkfQrWlrnD1nJ4Qm9J/wC/DX80zcaqE=;
        b=xjONHI1QRwhrbADwP5zhFJEXRYDuM8m7sP1q976m8/yCDpUrKLdc39H4Z9AlRuUAYQ
         Me5oiacd/9/YfUvPt/2Ulf4RuGlhmoSNTLWuYYE0c4AcEkwNPuHVSHueet/6S2OPQsZU
         YGFSXsjBRa2yLCWqq4DNiKmMmqGcD+bMYmveIPmapASDmONjcDC+T0plXmn9C/2bgqZZ
         jWTQ4tuZxY8dqKaRDWSkx0hEk9lQIUoc5OoRTsQwcVJvrHYARx6cPqXa4QGNguGfMN6w
         bF5htgm8WsIVWZmAIi6bjWuY33i2JoAcvUqhOXIX3yyZuhz50zDKSyDqvrTfNLPsz1yh
         Qs3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774661974; x=1775266774;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MESqiG8F4DXapkfQrWlrnD1nJ4Qm9J/wC/DX80zcaqE=;
        b=Doc3y6fXZqtMFG/5n0BGVSwJbvFsUNh/88g5LXVCg8SDsNgn9jsXhK8ajDIZSukDzQ
         ybD5v1BbCPdi0DQkdDk+zw0sKE0M2Php1tuT0WsHON3ew5PoG3jyWwjuv1eUpUjreAJX
         20d4HphqrlW5UDTgA4rW/jX/ajV9SGOBqguJM+PBodq8pKyTNMQOyxopYAjVWiJwcDNi
         jI4o8qBJarkMMD49FavdZXK2kzJ+txQxT1+k88jUZ/EAUj//ebY9gFQ/Mgufasy6ofPe
         ZlALQwkmK7vRcoT+8mNqO8mWuRuCt8JGomIb8x6qhbVmv+J/Kxc6dChhdbrRvJKS1lSn
         cH6w==
X-Forwarded-Encrypted: i=1; AJvYcCVuBkErXmdifSiNHniCO10YvSW+95eF+Fp1/WT0ZwuHLZnFOHNTsWpnWscfRAyE1gJirIIGuQ6u2lra@vger.kernel.org
X-Gm-Message-State: AOJu0YzQpz0QUNuc32D8+whPcsw2Fg4PSUTks1gXV+uNJPJ0tMvV4pAD
	QF7NwNiQUIM68J84mUKTcrqmAixJfswHSJtdZFk8xQywpm4HVyHworaOXK7vIr8wgjg=
X-Gm-Gg: ATEYQzykLGdq/vemRzBEZOPCHLpshmoeNZjmLdI3Qle0xzHgF3tNLhTbfCzILxia6Kg
	6SrO5FLgth/POd9hlKKhhX+08PHMNSysgDLFIRackdBqfwGznXYu4WvSv8J//QtdOwDwOd9f0eG
	OQd5xlQ45kPCIKue78QZ6iw003K91JQUmBVztJZDjDHii1A+fAfuYzN7N+lj2qmy/1Qu31DBDOq
	KOYRLbGzt3KF5z4IEBdpQBWxkPYKfdZOzvQT2e+2tVHzPGdjRNXZbFQHc0UNoj9vDnczLa0dWxw
	V4KAXmkB4m/YWpUc7v1MWKDS0Qs6gtgrSJ1cy9ncP42JHlqeUrbmTPxplFe+FrswoKsKttqleSX
	ZJ2tuMQyIBwmoyReuBI66Uons2vK0jJP8jeab5I8wH5fNuXBksciu07FVRAPtHj/fzbZOEMoLNY
	oig7W2gyD+x2mH1Hu9kVjO+TRJVy3cGPNHXxt33JBmnJBfZC/kbVEjCnXDcCIkIL8mBw22pJSZx
	yrIFwB8//HvYrDtWS2MQ8uhi9r/kRB0
X-Received: by 2002:a05:6000:208a:b0:439:c153:ae3d with SMTP id ffacd0b85a97d-43b979fbc99mr13706733f8f.6.1774661973830;
        Fri, 27 Mar 2026 18:39:33 -0700 (PDT)
Received: from [192.168.16.142] (host86-170-11-80.range86-170.btcentralplus.com. [86.170.11.80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf330872asm1286953f8f.17.2026.03.27.18.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 18:39:33 -0700 (PDT)
Message-ID: <928f6ea130e6a0b5cc430cf204622ea68e8e514d.camel@linaro.org>
Subject: Re: [PATCH v3 06/11] arm64: dts: qcom: x1e80100-t14s: Add pm8010
 camera PMIC with voltage levels for IR and RGB camera
From: Christopher Obbard <christopher.obbard@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Bjorn Andersson	
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Sat, 28 Mar 2026 01:39:32 +0000
In-Reply-To: <20260326-x1e-camss-csi2-phy-dtsi-v3-6-1d5a9306116a@linaro.org>
References: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
	 <20260326-x1e-camss-csi2-phy-dtsi-v3-6-1d5a9306116a@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Bryan,

On Thu, 2026-03-26 at 10:27 +0000, Bryan O'Donoghue wrote:
> Add the PM8010 PMIC providing the following voltage rails:
>=20
> vreg_l1m_r @ 1v2 IR sensor
> vreg_l2m_r @ 1v2 RGB sensor
> vreg_l3m_r @ 1v8 IR sensor
> vreg_l4m_r @ 1v8 RGB sensor
> vreg_l5m_r @ 2v8 IR sensor
> vreg_l7m_r @ 2v8 RGB sensor
>=20
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>


Cheers!

Chris
