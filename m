Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D68E3AFAFF
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 19:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783453062; cv=pass; b=XsKlec2emsGgk+FPJtINhWZRKm21p0eCQCAmJ95PeYVicGcp6VmXtD9f+l0A86OPAnWU3U1Tnp880X2QOdfSRiRMZwsHJxxwinVksAXfhm6Im9f9wtFjf28mSt2khb3why2QrpEGRMzKV7mb+fqH5izuQzFZieJwXGHp0W3udYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783453062; c=relaxed/simple;
	bh=Aa/d/vFi0BE7yXkavGTYUSUbBMeNwI3YLV6urIqr40g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OCsVqBFqtOV81AaDK6YMkmhVcF4uf7qx2KjYJN8uIzokGl3Ui5cbN769l1y4qXqarq1GZ4vsKYSvZlw2wrMZGNKaWex0BuR6Cf6n+64l/ZdGhL1TdfyiBn3KyxylHk+LQQ1EQS4G/62z+zJSqG0M6ugJKOeDkY4VDOjBvwIXm+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=YpFl+8RA; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="YpFl+8RA"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cabc0a1ab6so51660295ad.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 12:37:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783453058; cv=none;
        d=google.com; s=arc-20260327;
        b=lBnh2UPbLfyEzOEVv+7PyB+Gm60Qh9qg3qKE2lG6ucnEVGeSvRZA8U3j0u+Grrq1ev
         NgycEWtMF+I9GtvUk7R8URA1PKtJo/0BtLXJ83hz8tnhS6/AXnQaNxckQlObq2ud6gnq
         X9LquY4bzKGZn/o0ttBKQ1DYYcejcGDuqwN6kqBV4x+0Pix0h6wh5O/jihFxbM4Ypjxf
         ddB1rss4ymSWxU0rC3lsanEynIfadQ7MfeFY2/qPV/HHcydiaYxdLZsYiSE3fqqz10Dv
         uIHG95yWERMPR3W9cmk0Qxq1fQfpxb4eKRLRToRDN9G82SpPjeUZJTGqSv321dBbQGx0
         r5jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Aa/d/vFi0BE7yXkavGTYUSUbBMeNwI3YLV6urIqr40g=;
        fh=4J5Ce+jdT5T3avImO38txVMnVvJ4YVZ1GnwpeomO2To=;
        b=AdkUByhfcjj0pdIDiPOnickvJcOpgpLszD3Qyu5J/xQE/pmQOrdVWj/VYLW+qh3qbt
         4jsXY/tzjhycwkQvej4+b3l96ZsiZFzbGhddjKyb8YiJge7KP8Q42x8QURFSNAyLuqNi
         QmYo/1LDk3Q8iybh0nCxBYC8wLRLV/sfvPfEJxw/NGyo2GTKD866vpu233rIBBTwlVjV
         vCc3abmY6bHLvo/hzYVhJ7IyBBK8yHlql5d41NWrW3ZcEcIoQVtuBwLlT1OYycLf8fT1
         +p3zs1KIxvE8I42ovivjH9teKqYS7sKE4ggTFQTBDhZDvcCD9aUzJ9XQF9NpbsvDkxQk
         U4lw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783453058; x=1784057858; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Aa/d/vFi0BE7yXkavGTYUSUbBMeNwI3YLV6urIqr40g=;
        b=YpFl+8RAWaVibMEGf9ThJyTbTq3Rnt6SGjBO4+iykP8+TBZGOwtQSWbVQxccSGimy2
         TWLluh6IGqnL/+l8aiwPst5PzW451+IlbuN3uZ+37kY87fkFL2GTIZq2OFqSItlbUJS1
         yQphJToEmGL4WuW9XtPthyjeOOrO/JJaBCUHcLEIQt79jFTX765/e9kQFBugShQ38Ge/
         ZINBfHY6HcbdDPrVKVf/FNS6FYwR2g9pQidSMF9sxOthUztkLOd0ipt5+U+G5QVmvHFs
         KL+TCvH8ucyp65wLPXWMUlrPZxRTDj3+P7Fj2/Qo1ey0LyS1I4965HDKZF9mhXEshcxd
         hZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783453058; x=1784057858;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aa/d/vFi0BE7yXkavGTYUSUbBMeNwI3YLV6urIqr40g=;
        b=EsLVyQGQQqOYVyRgMbXMlvImb60JgX9+FDqWU52RnCZ3ZPw8clQFF0pgQ41xANsCGG
         6WQQUkQV4C6IuidLbxFfQIvGrlLXxB02rb8BuD4eYeCIr8jvq0zeB1TJ+mwO3tHoxENX
         e2jsPE25SBneKQIEumbq+JNACWk+C1UHM+UlM3dQFqFeXn7ePHAdZHP8o+3cxojQBJV7
         IGTYCRjUDbFy/qMmu5Vqs+I29WVcFCfmXfa79jNdF3KOzQUCAy18WqqarqchiIKtabzA
         9AR7gWO1pOhd/wD06QQA7sSfKy64cwgxkPCg+7nvDIUAWOOsWud5S7zHcypPLilpVhuu
         YwbQ==
X-Forwarded-Encrypted: i=1; AHgh+RqnknwbfqoXEU14FlkCh32yZWnyFibw9gMwgyX1P0ZeYtWMbmd+Er60veD+6IqDp3Z9CeEnNcjJzj3r@vger.kernel.org
X-Gm-Message-State: AOJu0Yx851g7spoTDQKI/XH/Cg4tsrKv78wP8a4pWOrCyNzUM751iIpG
	iYZURLrsgNS/cAg0EbLeGLnVfPh+EKBJv+Jub2zSaAr3qd6U9PIp7MIcG816Xz1UhhxjJ64FhYa
	3krq9N+XAFan4gSpzq0z158ut5zcewUo=
X-Gm-Gg: AfdE7cndsZXunAoeeYaS+XlYoiP8cJtYLUWSzhlH6Ra4ToW2WaS+oLhOBJf83Opq6g6
	A4beOL1qTxzMCbOCx0s7ey34hBLxDLQMQ0uES5fcnko187SVtRbVvf5gNgj9n5tWK5l0WuZ06Fv
	N6XTbHsLVKSMwF8YxAkPWOc3/E9ovEHuI8LghLuewRAfv7z5vrFM7cG1dj9prGwsZ01AiR49gDV
	wceYdtlKTTTnoYS+rHmBPbpCoSlFfN87oGy50vxLz4/k2FbD6yxMz6tUS1V2WDZRBKOr9GyPWYx
	kHDSlgRG+oVC2y+R86w9T+QGcYyUobMLpc8s
X-Received: by 2002:a17:903:244a:b0:2cc:9a86:9c42 with SMTP id
 d9443c01a7336-2ccbf1b95demr64908935ad.45.1783453058116; Tue, 07 Jul 2026
 12:37:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260624135650.727077-1-jerrysteve1101@gmail.com> <20260624135650.727077-3-jerrysteve1101@gmail.com>
In-Reply-To: <20260624135650.727077-3-jerrysteve1101@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 7 Jul 2026 21:37:27 +0200
X-Gm-Features: AVVi8CfQK0siXaeTDeQArGj0PmVREFVpRuWfBiz3ACt-27jHdJsP7_vY7xQZbzo
Message-ID: <CAFBinCDjAo5WTmap1si1=BapdaGzdbP-FDyR4Evx5_EvWSvSig@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] arm64: dts: amlogic: meson-axg: Add missing
 nand_rb0 pin to nand_all_pins
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Arseniy Krasnov <avkrasnov@salutedevices.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2026 at 3:57=E2=80=AFPM Jun Yan <jerrysteve1101@gmail.com> =
wrote:
>
> The nand_all_pins pinctrl node was missing the nand_rb0 (ready/busy)
> pin description, which is required for NAND controller operation.
>
> Add it to the pinmux list.
>
> Fixes: be18d53c32b2 ("arm64: dts: amlogic: meson-axg: pinctrl node for NA=
ND")
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
