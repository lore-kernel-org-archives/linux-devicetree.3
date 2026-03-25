Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093704F881
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 00:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774398545; cv=none; b=TCdAfcuygOCKSZPKIyFZ4tECSKugWW0TVkEDZtC6GRmQG2aebGWONqOaDyN1dozdiX4KNUeCS2vrKy0ycmPOfoPrvBaYlg82ySw+fIurD8uOnEud8+2vjsvjyq8yXbHHelbIgdbSY8yNQZgUIM9cdk0QwO+OG3nILS6xozNLZhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774398545; c=relaxed/simple;
	bh=+W2l6HF6dMk2sjxzN6yjkAVU0JUCRJ2zSiQX38l0Uk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BvlHnm4qy1CsMPkaog3BWTVOBP8W0bYbcUSAgiZ3zXe9nQxrv3fipoHWyT0LuOx22zzuseysb3rccaPti2I/oJJ0YU5WMVdZpNvZN/7XnxgRxbznFdx7MKh0hUgPvHP9u0LlMn2PcO6ZWDtUrY5Ifu5mo19xM/Esl1dIT4Bt0Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rIfhscRM; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rIfhscRM"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8d006a80ccbso1142285a.2
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 17:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774398543; x=1775003343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+W2l6HF6dMk2sjxzN6yjkAVU0JUCRJ2zSiQX38l0Uk8=;
        b=rIfhscRMro/oT15LQ1UEK5dRHLl3aWwChDv26EucE6WtEcratjz4HXKacEMxrfI+B4
         JjgVFvCZ5g2kNGdzLCMO9EITDK21BwJJWFN+2gFLjpE2pNvLpLopXOlTWU+l0r+/vkPH
         QuT1ueTG0FXAue9ubDoXZ8613p6RTGJcLQZhrLuy5rE1GMnt0hJ0TPWU7bNLV/nXnEJ6
         +tPYWXNErck+Fb26ArwQdSYNFp8LSeSwtbF4wvlr063eOcDBdluxlWqxh7bujmIzL2KJ
         y2Q6WEjLt2O4fp4/DhoCT5I8j4mQXAuSrUFNdYMLg1FB55k9rLJGLrVpK6owziLVxol1
         adIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774398543; x=1775003343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+W2l6HF6dMk2sjxzN6yjkAVU0JUCRJ2zSiQX38l0Uk8=;
        b=rU0Cm3UMugKdbUKi3ShV/jpv2Q9JQ3MXsSaXU+15nIWzNu+NzHdYzYXU+8Swfbguqk
         vUhxz9DjfXJoHdNtM7NtUI2rVAH4Nw5EWJSPU1xHHyMAyT+9ILvz5eY+4LiwGhJd67Y9
         zzq8zhsyvVvOlyncJdTHJlzQqZRpciuE0sADXo2a7v/0DTnYgu4Y6XWJ+syUsfdhMtOu
         XYSRlroXW5N/YXDb84iiS8Ilbzbz6lTKrlvqFslxfT3eQt7OUvHB6Qaa0uIh4DtM1krv
         q5Yubmq2ZsrhQUSCuFIjvTanXGYYu1DSr+WGkOyz+44KsqAN1Jab7SgsZukSKvYzKA2O
         OyLw==
X-Gm-Message-State: AOJu0Yy8w0/lnXUiSB+BWKtECF3GIJ8bLH9Y8G/+1eN3G3Jnd4bQcOF1
	qc5oiH0FLTZR0s5fXl8BsY76mdNDStvMjSL/0xRGkvbOsyq/QnLW4qQV
X-Gm-Gg: ATEYQzyLRK1/eCkUi2lZCnxttf8sTQz6AXQA63F5NOukr1ev0zI7LgBN9WZjQglGC45
	oy7VHVgJ6X9rW8g2AQQGcubtJm/KmsVFLbFK29+hG02r9m1FzYTNqYgyVmNt3YgocHvH3vfMd3j
	pPwbRkTQCPUgaruXnpXNVwpn82GXIFTfeenar9trpbtncMov3R4mb6BmldejDaadrwUzh7aO9Gv
	HTjBZIgQ0766mgVDY51ZfxPmFgtVcpdCtOKWN2HwtsLPZNZcfSP7i4sYE4mR60OJBBT6wYUTJ7P
	0x2pGJii8NyEeEPbVKEFb5pzW8y0gBRBeFenm95/G4/rpiSIAshNC1RkjO0rxCLTkGAUMVXmrL3
	RWShGJ2W2cbsquZ0Qzu20E2XETNXgb8Y/p0c/7FKnyatZMFTQohl7ofkpohKt/DjKAYlnnPsH5w
	K/684aZk77/YywIjH5cDaP+oBrIcZqyf9upebUu00Lthn2/ba41zwTXbYzTMze48RUPeJI7giCz
	bEwY0xcDf9dhw==
X-Received: by 2002:a05:620a:1788:b0:8cf:b7c2:fd20 with SMTP id af79cd13be357-8d000ed1743mr238935385a.11.1774398542974;
        Tue, 24 Mar 2026 17:29:02 -0700 (PDT)
Received: from jernej-laptop.localnet (16.red-83-43-237.dynamicip.rima-tde.net. [83.43.237.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc90bb7f0sm1172723985a.38.2026.03.24.17.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 17:29:02 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 5/7] soc: sunxi: sram: Support claiming multiple regions per
 device
Date: Wed, 25 Mar 2026 01:28:59 +0100
Message-ID: <7923014.EvYhyI6sBW@jernej-laptop>
In-Reply-To: <20260324164357.1607247-6-wens@kernel.org>
References:
 <20260324164357.1607247-1-wens@kernel.org>
 <20260324164357.1607247-6-wens@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 24. marec 2026 ob 17:43:53 Srednjeevropski standardni =C4=8Das j=
e Chen-Yu Tsai napisal(a):
> On the H616, the video engine needs to claim two SRAM regions.
>=20
> Support claiming multiple regions per device.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


