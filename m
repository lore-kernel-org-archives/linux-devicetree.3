Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CAF2F1FC7
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 13:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790255973; cv=none; b=dbsFzr7j6rjEFEbqBwa7SDnuJ+bZoBstZLFovXOEKgCPUg/xtXD5H/OJ30iECQrOF42+3KfOkiskCZEGHbz6ig9SxlyaO6z8kIEMYTL/RKR3R74Y/05zZqSCMkhZkypyuEfjSHgtIBpoYGAXcJB0cqb+znKENSVpANLWigrEdow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790255973; c=relaxed/simple;
	bh=Hk/Dt2k01tdiGA5+qEU3xv0Qf6fMEQqec9bNw5PVAdc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YYVnPt68EUeNTy+u8Dv7mFIh8J4br10OSKz+trpBu4kKrhE6Pnj9VUibMW+eqi5c2IjIHqQis9dvuM0Q0TovMOp2/FTB6g7klzwHlhvi2jXIwMu/D2Cqiks1vtSl8d92IYYbHYX61YhzBOCnEawWF3Vy6xZJBgn3Fyt1S8jG+gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DUr+OGQq; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DUr+OGQq"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351831so1303648f8f.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 06:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790255970; x=1790860770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZltodKwVC/1L3oIflvyPLA+UFOrcHNlQS3o0eumbalY=;
        b=DUr+OGQqke8is/gL/fzwJHu8yzI8YygZraZCvtPfCFZclLPijTp3PRyULpvQQI4y24
         kCmRe+QCMVq1hmFQUo2rxVHzze6/yuzGq7eKIVuNr8fqmMlEd34nlEtElWBMQmziMQce
         2dwqQuiMIvgO2g/1TZBZEEoiPCaPHThieud+/8D1k5z3+WxzBjJ/+oGOqnqMtakmZLlf
         VTI4AD7OeVCtfbOVd+fqjHF1KFjWJOhWrnhFdV3OkWtBZzsAm8YQlLYmN/x9665vro80
         Pvz3mfbPgrh7V0xyrMDbCcs3Q3emQVCbXsHSAjcva4VLLuy1npNFZKT8QL3UL5iey2Qe
         WBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790255970; x=1790860770;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZltodKwVC/1L3oIflvyPLA+UFOrcHNlQS3o0eumbalY=;
        b=vNL0qeaY0lxmXf1qhXKdLTUTF2Xe8jffk1etERCO/LcOHOebpdThQfMuITn8z11bxf
         lYfoV9ZzIAA3WmenV81/zzBHZXdRBt00cfgbBORv+iph67sRH+3kPUpkfUDrSMQX/Lk4
         3DBpYhKezwqBQqAJO4xEOE1eDqCRHU8RcRGYLYWASmrIG8zcTd/GcfW1VRhANTWo0N/5
         Bn8RECHPYOZ1+bUjTGJKICQ6lfWnEfNP3qN0LS9w1dsOGbICenFePGH1nMmOGXs6bPdR
         uvcffCij/l0FCj0QgRSWqufwpKkxJ+oXgp5tlLdZmZJhjIvyvUwJUuFRcH3dq4ZG0D5p
         0FnQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4FwTtnC4DF416yzWDFZ72x1IAojnVBHlyf3nJTH7BsiBnm/2kC4mi4SAHoEWNoh5qr8g01CxJ41Pn@vger.kernel.org
X-Gm-Message-State: AFuF++krTmmwQ10RkJEJRoTkCi2Zxff2JU4oz/6r1WLsQxJqhX5VjS+7
	dvcVnzW4G6Fmzfi2LNHHjEjpe2zSbDJUBJ38xqjyVI316qec6bOcRg2e
X-Gm-Gg: AYBFou0WHqUXthkl5mlf4V9/ULSp3eabX+wZZ/mRipjGpO2wtHTZNjwOuNmXubn5Wf0
	TifqVpwuURoSrfdkWjbzl1YeGLxhiGrY9b/d6bRYrp3Qc5zQ6ElprWBd2Al7g3PMtv33YAeYoX5
	3B+lUJIbEbdJDcrNZ2vA4kEn/5MV1uGLeEXDG9qDED1xLsq/l0AIftUbl1rH7A9D+I7nmBJVahU
	q1Bc3gqDefd5kh6nCBZwY3uEQWT33mpR05kh/VkDPoKz9Na8FimOLBtVs42G1n5h4TqBFKYijzP
	iJH35DhTpw6R23p+FjZ1GrYtbH0UGhOE6V6PNmNZnOCei3J0U13L+vPtEKAtL0xayJc/YPwkJk2
	bveB9dCuoKNCJircXivqgZZh6z+vX34Vjvrw4T+G33fkCALZUxhSBdo3B5AFsjZxmR1Hw+CaFwr
	VLitOkMxwToKj6Saqqg07lsfkKC231OoVGn+KEdYXpcAHwn/NlB9qTgZ7WLkVX3r5NDn6l240RL
	Z5pAv9OuD0B9QVKLGbW3N9IEbnApXFfvcOcmlmHbX5v+Uhw0X0Zo7BnX2+MJa3ds+nJosfw/79d
	UCNMw9Q7FpVvsIv7p6u+W2ebDR8NedYHW7L4NpUg4rc0EPLSRz8coYx5pNlC9/g9YPBZXBvsixf
	++Cv0DTrTXcK9jqG9wZ2IxABmoPinornQ1gdzQpXDr5wXL8n5uezIO2Jrmh6RqpJDM7oPlhLCcS
	ejo9m3
X-Received: by 2002:a05:6000:610:b0:488:60ed:a359 with SMTP id ffacd0b85a97d-4887174be77mr4666700f8f.33.1790255970289;
        Thu, 24 Sep 2026 06:19:30 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868486408sm13384846f8f.9.2026.09.24.06.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 06:19:30 -0700 (PDT)
Date: Thu, 24 Sep 2026 15:19:29 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Ariana Lazar <ariana.lazar@microchip.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, <linux-iio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v8 2/5] iio: dac: mcp47feb02: protect EEPROM store
 sequence with mutex
Message-ID: <20260924151929.000008ec@gmail.com>
In-Reply-To: <20260924-mcp47feb02_refactor-v8-2-17dc2ce3485e@microchip.com>
References: <20260924-mcp47feb02_refactor-v8-0-17dc2ce3485e@microchip.com>
	<20260924-mcp47feb02_refactor-v8-2-17dc2ce3485e@microchip.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 24 Sep 2026 15:59:20 +0300
Ariana Lazar <ariana.lazar@microchip.com> wrote:

> Move the mutex lock into store_eeprom_store() to prevent race conditions
> when reading volatile registers and writing them to the EEPROM.
> 
> Fixes: bf394cc80369 ("iio: dac: adding support for Microchip MCP47FEB02")
> Closes: https://lore.kernel.org/all/20260819125128.970911F000E9@smtp.kernel.org/
> Signed-off-by: Ariana Lazar <ariana.lazar@microchip.com>
> ---

You're missing a Reported-by tag for Sashiko, but perhaps Jonathan can
add it when applying.

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
