Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785683CFF50
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 12:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779883813; cv=pass; b=t5IdcL9DtVM1cV/xKzIXa5Y7MVxABtvkay/6MbXCnHHaZyh3ANDSvU/e3HUAMoAzMZLrw+5bDLMVoTkOaIJwzM/6+hex3HzbF7laQ6MV/cnN9CMHolEWIwSWbR7GfgZBi5nPcGW3aHVjO1S7D/xpydpCabaGPIPe6pHbKlMwu1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779883813; c=relaxed/simple;
	bh=Ag/ppvZoyTkNd7TYh9ViBMAuPSf8VD0l9EAIvyylsXE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zz8qleDfR6gfU7uepcuRJYeqi6UWULjuH9fp46QIcWw9M9u7vwIMlBSitWfKZRNpb/ijN9OX69WsOn2lctGHv/WYzm4KMftzLfpExpRGzX6f6yRMosDN67pM/YgJ2zq94r/Q3lvI4MalI3qfkLK/W+VSFB0LGEndt4ACSJyAbjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=ntepB5uB; arc=pass smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="ntepB5uB"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-366330b6751so9058200a91.1
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 05:10:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779883812; cv=none;
        d=google.com; s=arc-20240605;
        b=O9YzxKWjEcmhhqUv3+HYHPVaNu+db/vmCD5WWOfckNJ34+kruPFCPgJhQ0hg9cS7P/
         1nsdiX6R16aJ8bwr3jPZnVG6QUd7qMysZaO9gAuKnSp1W+E/IB+Ww/eTYE+hjbBDbMQ6
         nltWPtW21s5JpeDnHC/CGimMu1h4Dqlh5NfmrDXaIdnp6ajSwEQK69yWDxI8/3cerqC9
         GEpZZnsYzMFiEBECIRh0LYam4GAa8hMw8oeJKnQnnIgrfwYIPqKt7px9Flsgr+DZHFr5
         CZkpQPIjV9+2r1Q9J6aRZgX7kmBZVqsSqtMVeLNcMKzsW3H2V2Ety0XYitfbgH3+XQqa
         JhoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UA7H1cJ2c1rnFku0SEtcNXK2Zu+NtLZlyk2G3W4GAZ0=;
        fh=GkBms8musOZkyZLfgVdEItkzjTGXpHuyumir3SVBgcw=;
        b=bIQxyiYdhDzDldZDKE/PyaI4dUlU5WidSOpqj8+TV+i5p1H+rsrDneH+CvwzKdZcEO
         P4+3y9iITgZlccU+IpOEY1tsK6gdl/GZ2bxMsPrOQOu2rHo+ItxsWvNcm0LevtxHEeXU
         hhpCA1hQmh3ZJoHWSoWV9sFXSOOHQMkGdYGU8YhnnemSTGcvOsKuooZMr8kyGxsxSJc0
         Zr/c0M9slzu3jS8r1vK4rhe7hxuoQLEh3lHgvXcUsI5uioPtYOhYdGSFxmsIO/81n4Sl
         ibPXk/wTdNFgPzfM0Yv9XvROCARk0mrGljNzq4ZbwD8ySVTA9AOZckLPFBJpnXnRwes8
         7y/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1779883812; x=1780488612; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UA7H1cJ2c1rnFku0SEtcNXK2Zu+NtLZlyk2G3W4GAZ0=;
        b=ntepB5uBnTFqtKlqBqZLMO84ONMrfHhjDdA6UK3aCJjD8W7KNNsG3JkMZO1TfFETgl
         Sdzj5iP1rdrjaZrvImV4OnhiEuKKEaW96MGbd56Slxgrl280Cnco+u9Sn+5hPtKrOgP/
         yCboplChk56QZvQKATPOWmuRnRzLY8hcI1j98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779883812; x=1780488612;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UA7H1cJ2c1rnFku0SEtcNXK2Zu+NtLZlyk2G3W4GAZ0=;
        b=LAS9GAzDNhLaMH3LpS+FgjmgM+FNGfgDR9+mgrXTniLecZGloqNWr2vMQg+zvswzy7
         B9WW6xTfx3G3Ja1lhvkZI35YpaDYij4nSLAx0dNbUbyG8Lq704XrCgf7Vrw5fvuhn3SD
         GVPwIkTndeYi743rp63BSOSSut4NgK491atuTZ20pah1gIr5PpzMfunzCKbF0iIip1BY
         aHfeY9w0CVvcKHo156hORGmHzUXlat4uskDJ+y/M8jQWVPoGNpe8mVBwv7Uz22zzlWba
         QPJ51c8dgNMW18nipbD0SX2jkoFqV8biGHW+FctQ9XauX8X7mm0DdfheRTUvP9j+A3w/
         v50g==
X-Forwarded-Encrypted: i=1; AFNElJ9M/66CZUB6OpuChS/1YtilI6KSNnviFZYVFPZW4Guw897mXuFHOGp4BH2CAS5tJOEAD5SRyKYGIqiG@vger.kernel.org
X-Gm-Message-State: AOJu0Yz23OJSshcmIw17LInpRI/OuJ3r7bXNqM7lBQoIasfvOzlBsLwT
	g7dcuv8fKBNX2CFT2HGTTqgrTjouGMf+Z/9hgeyeLqiLEh5tWqElKVi+3/YNeSPudKvLcgaqyMJ
	9TPXn3rdFVj4ZUdqnhVKc6Ii1KZeE7xRj5xjBAW2jZw==
X-Gm-Gg: Acq92OEwHjl/z+auJ6Gv8Ny/hqtsVuEp3MBsiWwzxxnxdV9yMOXAT71buWrbEErmpR6
	Ft2TUJC6jlXU76ipFeXAR3Vz4fdxkiPM/msrJcCICbUfCONDkEHwxHR0h28DexSfwJrFkiePR09
	w6T3W1I8WUAKtxFO8dxHvx2XlwWLyZQ0yNCaLjLpfKiCnyVaJJoV+J2pYiKZXtLk60mSNVoUM1T
	VxoBi+9hIUKvzvzC7Dql3aYN5GF4NoRxbkivX4DBD5gqX0VE7lvHYei8FepWB7Rz7MpIj/EMLad
	vDOK/+4/q+/W4PVZUQXmtiBV9neXALPN0wW+vO20v/EOu5SCYgjKDvlLgQKRvC2UodA7RzhUfs+
	ygda10azv69AxJLI62aBL4i0mw3Qnb8C8D2yC4ZUVel05sfixoHRBqRMsuC66vq2t7d1HR6g3HF
	9Wn1zKhc9PtnPDxcZm414uYfdm9MFv3q/fkwmVamfZU4q6UlpE/15mg1YpBmw=
X-Received: by 2002:a17:90b:2290:b0:36a:72d6:8cc0 with SMTP id
 98e67ed59e1d1-36a72d6a600mr13729265a91.13.1779883811814; Wed, 27 May 2026
 05:10:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526112409.66325-1-daniel@quora.org> <20260527-rousing-wren-from-valhalla-ff5a68@quoll>
In-Reply-To: <20260527-rousing-wren-from-valhalla-ff5a68@quoll>
From: Daniel J Blueman <daniel@quora.org>
Date: Wed, 27 May 2026 20:10:00 +0800
X-Gm-Features: AVHnY4I6MCuY7kwpxbvMADrGNNhVz2EWiO-Pcx7pgD4XWv5SvMjg3RBQ3ipHkCg
Message-ID: <CAMVG2suh+7Vh_YpZwjWCK3=yxAP_aNro8==Vp9-sD9T7PUFexA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: embedded-controller:
 qcom,hamoa-crd-ec: add Lenovo Yoga Slim 7x
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, 
	Anvesh Jain P <anvesh.p@oss.qualcomm.com>, Maya Matuszczyk <maccraft123mc@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Akhil P Oommen <akhilpo@oss.qualcomm.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 May 2026 at 17:41, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Tue, May 26, 2026 at 07:24:04PM +0800, Daniel J Blueman wrote:
> > The Lenovo Yoga Slim 7x uses the same Embedded Controller as the Qualcomm
>
> Are you sure it is the same?

Yes, this is validated on my Slim7x. Both devices use the IT8987 EC
and Maya's amazing work found similar firmware strings.

Thanks,
  Dan
-- 
Daniel J Blueman
