Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C59A37AA91
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 11:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774611829; cv=none; b=bphV0n6Ax0A3a369oKgZ1eByD6UlvnZviwl+e6w3Hr4mOJQawS+7e4/kQ/1KAHrRKb1OiHtpUxE2Wv0+PJqRvoipd/6W5knvB4EKgmh9ehFsvhXx5wfXMG2Sl9bUdLHn0ht2vi2sIXSRdQDnVcITvjvT5/i5dYqTYZYPPFw0uE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774611829; c=relaxed/simple;
	bh=DYgRiTpgVxM1HUd8k6yAnxBm1+eeXn001TUDzFfO7D4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ttyGULVEqGwPEh4StTn8boTb13lASqJ+sb5i8EfRfV3RUc40T6psRuVRrOYqh/YWKmdDIkHtaLv0gPfR7lqiOxM1NSv5a+vxLOeoaeFlUxQmXfFYvOTKUg3TN8kVZs1tkHY6wcNmp2aTRbnD8N+EhsIWKpyOt8JOKswsVEuLZQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OHTeKsec; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OHTeKsec"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso20841805e9.3
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 04:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774611827; x=1775216627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYgRiTpgVxM1HUd8k6yAnxBm1+eeXn001TUDzFfO7D4=;
        b=OHTeKsecIQkofgPEK7D5yqApFCgHiJyxutEFFCgHUl7f5wz2/L7cQT4pXxSBbxenIY
         xOoxoIpHuoVb/jmnqfsfa4h3DGVTUI+3QEUwNBSFfnj+Yq+bQpOgsv67pwurvkoiaHyu
         xETxYmRTyFJ22nGqq1LT0/n6ataQB/dGzwh+9KZkp5obvTjC8MQFQZ00orgnQfsTxFcK
         RLOKlzi7k8Ofg8ASxtnXIaAg/28OHQRjmQHx/1D1uCM82cUDEGfMZyeRfjn65rP9t6/1
         DLxEWmrS1i+H+VWlSyU5H55Qoms5TRrE+bG4OW669d9dHkVYRwrhpr8tILmUP/0rkxUe
         LZdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774611827; x=1775216627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DYgRiTpgVxM1HUd8k6yAnxBm1+eeXn001TUDzFfO7D4=;
        b=LjA2KfRpdFZsRmwsDSxStsXrw5v/ov5aWmpeHcp5KvHlQnYBk+NAYwkZ0t4/76yu5W
         8Me2XOVKE6JJtT6UvH9lPh12Ekuy1BsrKMQho+WySt4GWenbuiEdjQTSLjP9ZoSJ3SdO
         vx2mDWcMudKzU5HsfhR/yNJFqPuS5pOnNEhyElxd9m1yYkqiBzXK+mmn+n2DStuffNDT
         I28MmtupFsaujnBSyoTrBT1FUQtEov6z7sxi90tYnjhBEga99/WUCZJR+xkwfmJyym66
         P3Fgv1c+lhM2Xcjk93bUASzlhmEClYf//mpHvLTLn5EbbBEr5bEj70uZv+pyy8Nd8L6D
         NJ5w==
X-Forwarded-Encrypted: i=1; AJvYcCU6/+PGVwgdyMRI26SJpl/M7zZvPHnCp7b1jZObOqtFaAbV9oJ5OH65y4aCu6byO8qHuvvUR+YPv04a@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqj2MOUueTvFUzrJLFkrK7co4uUS4CQq5K8ExyyHgcF4AKAr1F
	+t5JHCXvVQk5xE0D9qA0tIB/Xt4FnaxbyfxdcipsIyCbmjY7Wi7Bm9Dj
X-Gm-Gg: ATEYQzzk29rvePl0eE3Q10tml3jNYruI3MO0XQqynB3FiliWu0ICP5x5xPn0k1wAY0G
	COtKD8rEG/+ttKry1XPHu/CObk7zae3zlV0+Ssykf0nsBOCFJN/hcVSPWV3pTDUKYia7KWxu8i4
	FRpwUxK5j47Vh7OV5S9mUh6al+TxZpxGw+8eOgsfrSH3ubmri80ASplK1kjR+oRRbbNm2Lnwmxz
	TrtDyEmnJMxnv8cP4gwhNAGzF85SKDg3b8a+xG3vxohZxApI5lhsVVoiGRQhebuA3iqKBDLm6Sf
	uDToh/L0jh/LdstT8lGLcyX1JT0wezf6tdqCbT8FF13oD8yztXgRvW/KDeslvrfA7kY27hGLY1g
	lsqLskKk5CFH6WJ95q+W2V6QcTX7k2spauMQvChrPf6Y0f/Jl9cAvP1kGrEskpX28A7kZNlVGUM
	WTJmTbwUfoleISl+XnRF0MxtFib2Yk5a6EaSRm0duq6fbJ3okKPbT1mhhAS4fVBpJeppFvNr7qA
	ATN5HIBnYMtk7/TKw==
X-Received: by 2002:a05:600c:8b6e:b0:487:716:2fa9 with SMTP id 5b1f17b1804b1-48727e883c4mr35679575e9.13.1774611826618;
        Fri, 27 Mar 2026 04:43:46 -0700 (PDT)
Received: from jernej-laptop.localnet (118.red-213-98-130.staticip.rima-tde.net. [213.98.130.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919e265csm15142518f8f.32.2026.03.27.04.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 04:43:46 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 3/3] arm64: dts: allwinner: a523: Add missing GPIO interrupt
Date: Fri, 27 Mar 2026 12:42:18 +0100
Message-ID: <5086436.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20260327113006.3135663-4-andre.przywara@arm.com>
References:
 <20260327113006.3135663-1-andre.przywara@arm.com>
 <20260327113006.3135663-4-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 27. marec 2026 ob 12:30:06 Srednjeevropski standardni =C4=8Das j=
e Andre Przywara napisal(a):
> Even though the Allwinner A523 SoC implements 10 GPIO banks, it has
> actually registers for 11 IRQ banks, and even an interrupt assigned to
> the first, non-implemented IRQ bank.
> Add that first interrupt to the list of GPIO interrupts, to correct the
> association between IRQs and GPIO banks.
>=20
> This fixes GPIO IRQ operation on boards with A523 SoCs, as seen by
> broken SD card detect functionality, for instance.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Fixes: 35ac96f79664 ("arm64: dts: allwinner: Add Allwinner A523 .dtsi fil=
e")
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


