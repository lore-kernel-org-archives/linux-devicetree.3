Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F7E381E83
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 07:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786432998; cv=pass; b=Zy0uTNvsuZxZwAmtTSKAqeTnX8XIGJsGFNZgOaDvSFNJRDLhz/jHh5nSzkLuH+wSt++zKhDSa6pIO1nXT1wbSmTEVYuFwYErrMfR1LTfbLWNny0SW9IODx2RhqFBVjt3bjXWT5xT0/aq+Te8ILJsyZYhdhp/piH2BXFcGz76w4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786432998; c=relaxed/simple;
	bh=yHbrcN2txt2k4QTXQtVEbYyaJnkVhYsYaFz+JtTpWtA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SKbz3pXkeYe4y5UEPn2xQZ+KmkVMjeIG6iB8z97k9t6aKs5J7s5a6MTXUXJM9C9HDb+Rckz1uHnbr7lltRLsHAsOaNwYr2RPX56ADmdKQcba9N4TyPvDhWVOKuxlyhO7I3yrMHMrm2OE8h0jreIeV1XoZdFj7MfdmtlGembjPMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S3Fn9pi/; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S3Fn9pi/"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-69c108fee7fso3716105a12.3
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 00:23:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786432995; cv=none;
        d=google.com; s=arc-20260327;
        b=mh5gQCaEDxQQqfQUNm0M7+8VEv5ybJE8e0LRN/i9RWV3RA5frtOQcoxc8vc4fT04/u
         NcxZTHnHF6l3a95jkNZxHdfUGY+2OWX5Xd+l2F9KaKNDpfN7SteZ+6OPE1jOHWrjEY/i
         GsGC53oMJ3o7NWlyaOdjNFoguakFKwLEq5edn8eID2sdR69rw9S8Le5MO5oWxaFV+WXv
         5aiiDK4LmoDshOG2JGFFbWjsFsOZzP/rtiNmaGKnHybYkSCMVGMOXbgwqtE9yGtXEV9B
         DaXH6/cT2JnMNFgsW9W3cD+TBMLdTzv3Z0err7jHBtaKrNN7MuixMFRBfGntNw9CbW/4
         AfVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yHbrcN2txt2k4QTXQtVEbYyaJnkVhYsYaFz+JtTpWtA=;
        fh=BIWsmdnWk9+EOIgwYxWQFAapR9HnS8InVD6335R4WGM=;
        b=egaiZ0YFjwqMuscSIarQZa0/1iMH8piZU4Dmg3WT2+0AfMplhm6Ky2EbPCj/wlx5kZ
         YzDrEhMXI4oMZbbQbfx/bTS6SYhauqLl7IjdmEZmAy52M6KauZfHWYeTZxzg8sqHGXf4
         iwYPcJITvScaM2pZXtGPa8j4AKpmIB3h5AAF27tHZjEWv70CssqRiJgaA+iXSa9pjbBd
         1hlNycSinPwBFKlxmUd9/MwdOk495a+1ASUdhruwOadMb5OdP1MtSkxFe+UNsFFZaXCr
         voxRK4/2cmDIc0kUabuPjGGdpjC8goZGJmlRjDUQzH5CrqNRZOvdnKYcOIlL47ntCxu/
         m6MQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786432995; x=1787037795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yHbrcN2txt2k4QTXQtVEbYyaJnkVhYsYaFz+JtTpWtA=;
        b=S3Fn9pi/xHxf0BAwMKR3PAwztPIq41cQMCGb/ud1Cef8nlB4caD6k8gd6hpiHAo5Gn
         SSTWcBYBeIMO9wnaRH3um48p0umLgifMfAbxNbxqh9p+zpiRyOaZ4U0Q/EXUKnj7tQiM
         dionJRg+T+pvU+zopIBx0xgPdAM0JtaEufwU2FjHqG0Udsugccmw+CZysun0qTot+LoC
         7khNCm70zLMsED8ya6g07MThrrk1ZtfpuvX4MAQoKYYhIxq8Xk3prgs26V8rOwNmDmj0
         wvmWW/Tro0oGE1WDtMrbDGI9R+MGNFzB0SKGboKxOCS/Bq49dw9rZizn0EebkzKvnDvo
         EVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786432995; x=1787037795;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yHbrcN2txt2k4QTXQtVEbYyaJnkVhYsYaFz+JtTpWtA=;
        b=P5zE8xDfXtIQ1xETBT2xQEj21Zlaz9BjIp35il0wFAHhtrDCL1K9tNb2TZ/fUnGWhh
         wdTyxJ8F5gdeLuWNvEL+dwzlID/kdf94pYsQRf6P8xyqdiBkbZF1EcZ/SoGrH8UI2J5Z
         LAxXwCtOZHdSC7IGS37zb+D0GWaNwnHBCmaPHbIq71GFamKLQAE8bri+ytsNCJBr4vjU
         3quflSHb/JCBj0yWXYMMne6bNj/xuYzY9K7Mn3KKICbr8zDOBtUkpGnDW3Ov6XkWrBa+
         dLBFbcg1ink8bXGht9K418LnmpYo9ZYK3Tuw3Av9/5zC1cPEu7GI7xceOICuj4g8eFO9
         PLDQ==
X-Forwarded-Encrypted: i=1; AHgh+RqoLuQSbcjb3zksgnOm4HUg9JcIrlaainwiC1bI5bypiw0aaUhIXIio/VHt8T7U8E0q77T5HkgLQOyQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzeLlVQju4vPKN6Rfp0gUDjKw9LbkYhNTwgEuTdJT90BMUnPV6D
	hKOB77Jq4sZcfMU2W6BOaLXlQ5fQxexudMyK0JWd4uVgeOvyaEQ/oL6rCw2rmVX6yLGh7Fd+RHg
	0lb6VlXkC6PX5g624GI0lf4WIo2g7rDA=
X-Gm-Gg: AR+sD10rjZ46Nooz4f1V+wdaWPM0xyqiUWPgJpJYMszK0xQIdi+CMq3v0I/e0vTUKK2
	3UKQz0EDEb8EOlF3XKDg8cOMu0Go5QayQsHP5w9PWqChPT0JFD3/XKbzgHqwEUdY18Y4W9Y8A9t
	2syP2/Fa4tKjUbcSDCRKp9Z5w9kkuXuPXt5tw0AJsG90LdOIiyPiDAE39oYM0dG2bV23OeUNNmU
	L5MA8Uhj1F5EnGSSRKu+MNzlGqFrDCXDY/y+fC8uOfLCa/OgB0HoBW3vfAxyX+bB6OEBD7oNkPf
	ym0Uz+tH8cK2U9mHR0DPwUEUwudOpDoKRMRt+QwdHF4BFxeIBPt0jef3+RW0x8WwEXyx9/0dKuK
	W3K3UZCiNO6R6E5RYjXWRX9vnrmohBwq+iGDiZ4rUaL84ilLBBhWRxvyULjcWlpT2jgBVPR33w7
	qeTXpmaWm9xDB3UWIOidS1yhJkATeOxLuaQ2441A==
X-Received: by 2002:a05:6402:912:b0:6a0:9b04:bf76 with SMTP id
 4fb4d7f45d1cf-6a3645207b0mr709391a12.17.1786432994503; Tue, 11 Aug 2026
 00:23:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260809-submit-acx00-of-dynamic-v1-v5-0-bfa1f8518b28@gmail.com>
 <20260809-submit-acx00-of-dynamic-v1-v5-1-bfa1f8518b28@gmail.com> <ec826a71-bf33-44cc-80e0-dfc7e92ceb61@kernel.org>
In-Reply-To: <ec826a71-bf33-44cc-80e0-dfc7e92ceb61@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 11 Aug 2026 01:23:01 -0600
X-Gm-Features: AUfX_mwSJJFbFSerCvy_IW10-8LHnrAWQBwEVxYFOtjInvRCI8z97kTvRuJC4Oc
Message-ID: <CADvTj4r==rKP4ThVZog51MQ2AVDLZNFwrPH+uDLFV2wGZueAtQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5 1/5] dt-bindings: mfd: x-powers: Add AC200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 1:07=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 09/08/2026 22:28, James Hilliard wrote:
> > The AC200 is an I2C-controlled mixed-signal companion IC containing
> > audio, video, RTC and Fast Ethernet PHY functions.
> >
> > Describe the parent device and its shared input clock. The Ethernet PHY
> > is represented by a PHY package on its MDIO bus, with a phandle back to
> > this device for access to the package control registers, so it does not
> > require an MFD child node. Function-specific supplies belong to their
> > consumer bindings rather than the shared parent.
> >
> > The input clock must run at 24 or 27 MHz when the Ethernet PHY is used,
> > matching the rates encoded by its documented clock selector.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
>
> I do not understand why MFD and net are combined. And nothing in top
> part of cover letter explains me that (which I asked already - any
> dependency or merging is THE MOST important information. Where do you
> put the most important information which maintainers should see
> immediately?)

The AC200 PHY control registers reside in the I2C-managed
multifunction device. The AC200 PHY backend therefore consumes
the regmap published by the AC200 MFD driver, while the AC300
backend accesses its control registers directly over MDIO.

The managed syscon registration change is used by the AC200 MFD
provider. The net driver itself uses the existing syscon lookup
interface, so there is no compile-time dependency from the net
patches on the new syscon API. There is, however, an unavoidable
runtime dependency for AC200 on its I2C provider. AC300 has no
such dependency.

> Bundling it together suggests this is somehow incomplete and later will
> be finished, which is wrong by itself. How to fix it - decouple
> dependencies.

Could you clarify whether you mean that the MFD and net changes
should be sent as separate submissions, or that the driver
interface should be redesigned so the net side has no dependency
on the AC200 MFD provider?

>
> Best regards,
> Krzysztof
