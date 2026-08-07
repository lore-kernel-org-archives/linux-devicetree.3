Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E055F47127D
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 11:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786102546; cv=pass; b=N9bAmEXUAyAEH/bre/0rC2a/8WHDHo7EizVh+H41Zht3yjp0chnqiOwSKfRDWSQKWC6fA+kas1ePGS1EVfXlKxMtNmTx9NewyVrSlTkEuYetTm4Gf8GnbiKV4J/Z49sj1Gz5NWwU2PSp73rbMP9e9EthJjSDWceuF7aaLOinjEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786102546; c=relaxed/simple;
	bh=KonotXRwXiSLQlw6vlTzZA1LY9JAAKMhrEBp5NWp/aw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fYAFlPtJkMVIncL2ZsSewFIGFbM/L9MqJLmaDmOyRdXsSKh0+SlXIRePOx0oyb/eDRJnrXc2j87u9C8eUppXRpzSJJWwjcpE1f5zFWua1MF8UYt1SIQZvSSQOLDBjZb8+tkxGRIkJmTr4LQRZvMRzJIKB0m22nvBdElBvBfp+bE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gywRWkup; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gywRWkup"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-81ecf499af9so47993827b3.1
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 04:35:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786102544; cv=none;
        d=google.com; s=arc-20260327;
        b=ZLAMqmxvsFcRHyIrKYQ9IlK/t8x8tqOqinjyyvfeIij7MHk7U8RThI83INOrMhFSyZ
         BbhyzMmdS4oXhcWXEhbUJVjVAlZN4C6A8mTi1DETqIvSqWgqvLwCuu3I1gI5QCZG1m5f
         wVkOmYscdpZIjoJcYyKdNzx4ZhTXYntlydcR7sNm/gQA5cKqbaN+JczC/6NPMkaTwTJ8
         v3q9TLWOci2pBd3iorp7r6x2fzaAQ6fGm0ztvhIh5wHKRX7LFwNUiVjqGvAEGejn85vX
         b7j8Z4KZ0IF+00Ub30IHrknMP8qGBI9piHyZwI1yfQG+1YVUgO7/IqpTpe9RJS1mUnd3
         gD4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NFbpeccrBLnPNDngnsLUG5X8Bi2l3FjgVOiCpFS3kpA=;
        fh=uiDwR7fqolbCxpB4S0DTBswCdCwapAG0L4EPbi5t22c=;
        b=rLA1xYbkZ/+qT7WSxCg9Fe6Dg2+Z0K1KerMW6iFZpUqagCmsCL13alIO+FPVe1j3cg
         jRExb+1cXlw7g8+5CG2i5IBAw8JHLlTBMdUkaJd1FAlbxOi3gdCUBij7cnPNh9G3yMaw
         YbReN4NeV7LxjCMKGl94pnZt1dH7uOY6cZhSgPs8XsJgiaHaGt/hwI/ivuQhevrcgPuH
         Z5y9B67Sb/Z2kJVJLgNe42WgCh4n7r7gcd241LFcJBjJ+Ia41Yb3uXYMbIHH4hABZ9OG
         RtzvSeO3Mr/f/ko/gOnFuJHt63RvvNQpb2ew0UcwLnOUYNo2mJPGK40agEsYuZT0pLUh
         L2DQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786102544; x=1786707344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NFbpeccrBLnPNDngnsLUG5X8Bi2l3FjgVOiCpFS3kpA=;
        b=gywRWkupYdQcwx1CAxh1NJRwVrJW56NntIg+rqr98QrAOpyb8Sl9qH/7GgAkJNczIF
         ZqesRdYr5qrwH0RKrlknW/OgIQBDeZcA+0TSJWt0R41Fwu2j26OC4AW81eT6xGJ85gqH
         Dhhx6WGz4rhe7nooO4yzXrTK1Zg/O1jCa3jmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786102544; x=1786707344;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NFbpeccrBLnPNDngnsLUG5X8Bi2l3FjgVOiCpFS3kpA=;
        b=Q6xwdIa48HtxOFRPfbfBULoe1FE2c6NmLyafZxwnC25WhHCLTL13wcjZ0Dt1YlXUbd
         pwu7ixHgr2NJ5u9c8gagjd2ajpY9hnW7Rw1HhRPaGtTaqPLY3tg6E6J2FBO8QT/3MSw2
         BwuUcOvG6LShWbXiPwR3OE4NHAvPhy0Ec4TWk3o5lL81Zz6WAABU3dEhEXHxVimVMJ+F
         m+q/j00SVDO4RsR5s3t1tdd/X1hOyTEGQqAsJl5wFl5pqpGoh9JpsD0KmyL59wesP1HY
         dGabE+Wl0XRmGl9Q8cOAJfCJA1JSNLj70PRg/b/AetY61AZ4Je+qmEjrrj8hPgSBxGOK
         YlFA==
X-Forwarded-Encrypted: i=1; AHgh+RpqMy2fB7WaeTZRQK2oWulxOzwzR+gFAs4gzfQzP5BKt55WFRwA6Pch+OZqOYYcHyF/r7tuLJIYS/F6@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7MpudWY1I7L+dJ5HOaWU48VObv1vjdIk+W4kjGLuCeVK5C9z/
	76PxNE6hOAWFzY11fvDRGODmv3MUHCRQSdqp6lNY4EQ1sFh6hDkciICw1C20QcLIIfgxSwvEjc0
	sNjlTf1HApzTX8oMeEl9AjUCyo24/JekdhTvKCLwh
X-Gm-Gg: AR+sD120jUXgDlk8Rr2RdQb2OYuaUUTVo2FsQWyUPjhEhPfrZEk5IUT5FcfuOS8yJU/
	kH0hK8m75lDMzVtXfZNFRqSQjgrfXdAn/l9+BUUAhD0tA+XM741B3PgR+Ir4OrmeSwZs8Qi/ZT2
	n+OKO41COwDPVfRiT4IACJxCWOE4dLGbzeu++7tl+NbKofJdJpjCxT41sNjQX2T8/X2jfNUr/jv
	fQlV4A7d0kVbys+FHJwJZPq6YxiaYE80fwV68zGA1ekqan1mocU1eEseJAmTVlvJYr8zOhahxEW
	jrsC+031AXwO1UPQOT0w1OhqPFo43UdLpIvWNpoJdk0ujgIkNpUVBejJZFDx/Zww40j5cSqRHuW
	GaEzRWnx6NQ==
X-Received: by 2002:a05:690c:480b:b0:81c:872a:5152 with SMTP id
 00721157ae682-82022510fcbmr127613327b3.30.1786102543795; Fri, 07 Aug 2026
 04:35:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724084328.3943997-1-wenst@chromium.org>
In-Reply-To: <20260724084328.3943997-1-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 7 Aug 2026 19:35:32 +0800
X-Gm-Features: AUfX_mzUutrA5-Q9ACqE0pQ_D7Us70orWiV3KcyO1fjFDW5_he5R56G8cIzEovo
Message-ID: <CAGXv+5ETE2WAA8jwnQKSe69aR=qrqKnALuiSM12X_ZwFouxdRA@mail.gmail.com>
Subject: Re: [PATCH v7 00/16] arm64: mediatek: Add M.2 E-key slot on Chromebooks
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wei Deng <wei.deng@oss.qualcomm.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mani,

On Fri, Jul 24, 2026 at 4:44=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> Hi everyone,
>
> This is v7 of my attempt at integrating the power sequencing API into
> the USB core to support the USB connection on M.2 E-key slots. M.2
> E-key was enabled in v7.1-rc1 with just PCIe and UART supported [1].
> Hopefully this is the last revision. However the pwrseq patches haven't
> been reviewed yet, and the fwnode patches need a review from the fwnode
> owners.
>

[...]

> Patch 12 adds matching pwrseq consumer by "port@" node to the M.2 slot
> driver. This is only used for the USB target, but there is no attempt
> to differentiate the connection type. The driver simply tries matching
> the "port@" node first, then falling back to the port parent or device's
> node.
>
> Patch 13 reworks the power sequencing targets for the E-key connector in
> the pcie-m2 driver to add targets for USB and SDIO. The former is used
> later on in this series.
>
> Patch 14 splits the Bluetooth power sequencing unit so that the USB and
> serdev consumers can separately toggle the actual state of W_DISABLE#2.
> This patch is purposefully not squashed into the previous one to provide
> a clear target for discussions.

[...]

>   power: sequencing: pcie-m2: support matching on remote "port" node
>   power: sequencing: pcie-m2: Add usb and sdio targets for E-key
>     connector
>   power: sequencing: pcie-m2: Split Bluetooth unit based on interface

Could you take a look at the pcie-m2 patches? These are the only ones
that haven't been reviewed.


Thanks
ChenYu
