Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34513CAE7F
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 08:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363049; cv=none; b=UzXYo/ptXhXA3bbFXwA2oF6izAUSDvRQ+ciWW3bd3cVeLI7nkhR+iykwshiYwaYdXdIGH1JK2UO/8YLG25V2/xXb6YnK1RBunOBjr4uosXJr7bU4NZPSV0GyM7KMkfYwcVTCXLmuqxBkFBMrupr2K6csTnEYCV6TcgwKW4Cvass=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363049; c=relaxed/simple;
	bh=cHe6pNVAlfwywiNIl0FJcgzfLRQYKHW301gBEGF6laY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KfWP8VfaaE2p8sKLUJr/slsHzvbxO+rht5nDkdZSNx2xkWIYNvhY7WkRj+RBBJmmOcdF0PmPQSLEwL8pNggQOpJILJseDJHHlcDlm93LjUtKlkG4W17dzgrClfMKH65f+Y2z0XVjOsOJNgkw9xTypwkpgd2IplKYZq2Eipz4VVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Otk+qGT5; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Otk+qGT5"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-486e70f2457so1690339f8f.2
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 01:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791363045; x=1791967845; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cHe6pNVAlfwywiNIl0FJcgzfLRQYKHW301gBEGF6laY=;
        b=Otk+qGT5X3luUwt9EMp/n1Bmmb+Jysl5xzLTVNisJC0ctlcibqEmUIAxX6xtzpT0BE
         PCiTD12lrNapau+/hVigUT0NhsygClGJUc1f55c4W/aiFfbcGI0acf5vKuzo0DI4IPk7
         bfEI0jNadIsADsUEMWl5jxlP8aFHyQXN2hf3J5nzRukKCE9VzbCLUvQLViBh9ywiePX8
         2ukkUsW4n5Add691FwY90T5cHnrIKm1z+XJH+NUZifaKEE3Ldgdac1qDmOzdrIR3VIuP
         5cVAPW+3vYV3UwWHLK7bwSj3WUmi91yGglTfYY2JFyfJHokgdOfYVjx97bjGqP5wmg+f
         tu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363045; x=1791967845;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cHe6pNVAlfwywiNIl0FJcgzfLRQYKHW301gBEGF6laY=;
        b=sriunU/SYFUXLbrB9TcxP7TPnoAeWtOGjU8Vv8M0xMUCIuuyK232ggMj+nOM7NoMFo
         Lq0W9QxV4iNP9ir5sGT89FQTUHdTuiAUd0hO7gIlKXL003FFnvU4s0kS7iKwzsyTrty9
         V0l5f6XyoQcCHiasdEkJXrF/SHBKBlsbPGfJjlDc1TAv79tQoGi9DQm1+7uV4yZ7mUbg
         H9RWYKrnDpJL1FaiFp1gnfVRZ0Roi1S/h5DavbxFpKD+8Tvo8jmLTJcgBC6pm1cN/z86
         6EHfmjHSxDizcdctt410AH5sxClkacU7pvxks65LC4Td53ZrO4MdaPlILPYB8OaugY+X
         parw==
X-Forwarded-Encrypted: i=1; AKwUvBx3alX0aJT8I7faltMfMnNBzw9qxjp+6uCBbyRQUENgXj8loewPEyAKOrJu7vFRs6wp8/9SaN4d/Eph@vger.kernel.org
X-Gm-Message-State: AFq9FYLOAwjiS8EYKsh6pPk0H8y6Yur/ETacqmTJZaTaksyvJNSa6KyT
	pajVaXWjik5zMgs1NEuoT/KCkH6B+0/cvUv7Udebxm5oIKh4MEPJxaRp2LYVke7mnRk=
X-Gm-Gg: AYBFou0XXHB5IStWq5q7rLnAG0iDaR7sNPqEjehAyaUuyyLOOUMYVrFCvuTHfaxkffq
	b7GbuA2Ls9bW7mujh4yU61jL+CyjntEEqV2hPHcv3dcyQ+4s1KQHBqr4rZoP/bk4HGqjBhXXpvV
	KsTfMtyPQCAMlHV6rXvmlMRQh4bgVwTXbUtjz0ntVEmUfE/DVwJIJJV87/45zJSkhh8K4268QKC
	gQR4e7GyY89e0IutqHz5FVnvwz8BA9dkFeawAvLeXiWCkBsWOtaLH9241/2M3/F1x7faodIGgXq
	TGa6xsKK901DZNUQebad0HGqcuX4EYxV4bbn+2jRJ0j0P+6FMbd4P22d6FBoRV1dsrE5xN4JTED
	sXK76pdYjNgs/j+Ezk4TNJ0mBLSr2L+g1f+oinWHHpY+fwgJDsHM/HXWZABkSS0BGEMCARHuCHr
	k7Nxr0UwaLa+qrxLrU7WnXi4XlmnSPXyM7Lxayj/pcdTjQ7S/oUZ8uw1jSK158gz3wusYBM1wgK
	girWU0/XU/+HL4=
X-Received: by 2002:a05:6000:46cb:b0:48a:fd58:a7dc with SMTP id ffacd0b85a97d-48c72787725mr1780822f8f.12.1791363044915;
        Wed, 07 Oct 2026 01:50:44 -0700 (PDT)
Received: from localhost (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3050asm3959269f8f.50.2026.10.07.01.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:50:44 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
Subject: Re: [PATCH v4 6/7] ASoC: meson: gx-card: add support for audin FIFO
In-Reply-To: <20261001-audin-v4-6-2476646118b5@baylibre.com>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
 <20261001-audin-v4-6-2476646118b5@baylibre.com>
Date: Wed, 07 Oct 2026 10:50:43 +0200
Message-ID: <1jzewpyjvg.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 01 Oct 2026 at 18:06, Valerio Setti <vsetti@baylibre.com> wrote:

> Slightly modify "gx_card_cpu_identify()" by making the compatible matching
> string an input parameter. This allows to easily support also AUDIN's FIFO
> with minimal changes.
>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
