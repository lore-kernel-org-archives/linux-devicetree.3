Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEABB366074
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 12:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777292397; cv=pass; b=VtvsXL7BixTyfhLVez2and0+z+9IIglL+6VonGK/a9G9xzW44DJXLddPmW+HIQXlnY7BHr9Kd2WgrQVvL+OnY6cCHA/4qn7XB8llF7yBpulRIJ7WypWGOWCksm+JSRCiNwivdrboB8+k9Vsb3P+J16vastlX6yIpPzCDhTTgriE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777292397; c=relaxed/simple;
	bh=KxyyF4KDeTUUJkNv1kEM2kmDh0ESdFo0tr8ZYsmxUFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hvytKks/pbT0wN8h4k18HKdAfmS9i6mcrYPXxm0khSmiXHloUWcp2YSubuoXuKn5LCiD2RLnOJgrbLEeGOTsS4zbvh0ayPuLuGiho9bsDrx1Et2b6wSNEf9XcbyzGzXidnTO3ouJccyPNpQIkXHw97U1CvwMZAb1WJbq9ZdznSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ovbFbZy6; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ovbFbZy6"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-50e614fdb42so78883431cf.3
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 05:19:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777292395; cv=none;
        d=google.com; s=arc-20240605;
        b=f/+JjqWoBtvM2LI3TW7kwJ+NRvFogwQIVbagLzJNMvk6ab3LhrZN+if/kaJ1egDWbC
         R6QffSOrudY8IAvXpBr1Vd2+bS9eYPgm3SztCBmqAipnr8wgTIW4XQc7imvHc97I4G4H
         EoLa8cUHevZ/jH+oHOj0zyvLGpZXHzUuWBtuQssXAAndIW4HFy0eCcNVRewHEneyJ6t/
         mdzhVq6afT/bjUOMNs1QsG5hom71FcEwf/r1kysIndunM6zJ8cOoiDUGC4T4mnh5axJH
         ODsM/tNCCKPqRa5tT2mX4OV0Q0+2Xew1XRVPq3XWNaP4JubcORGbigPxs3Q9/5s6/cB4
         96Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PJcxGiVkZlfjJqmXJdSpcQcuZLHP2CGOgvZ7uSde88A=;
        fh=EUiERAahpuRSKmcgBpYUfaY5HpHYe2PoHF5GM7dh5s4=;
        b=TZ4ckPO/aBEVSQCzQYnAjsD/Uj3FhRdmtgig9DS2JeLQT/S07HLMSTjU7mVdyOUY32
         1rwTDPMNUIsAFQ9P1VSzbvcD90oM3SsfuYUN2qeSVkEOrrvTThfcc2d/qrxT8oRJABvn
         OGTq2GJbG9MbJrNzsKn4/Thz0CvqAv2F9ZXwetaDJir7OE0dOajvwk25+FdSQ8Y67DwO
         X2cXE3i13ZjBdztM7Oi2qZFTkKIL7Ww0EWUgxTC74vKwrOOWJb8Q71atMZmbbSsCV9sq
         c0aZkoyfPFJVLYrPP+N0YHIqWrl4PPCDIx4EYnmXJaM/InMT8lNYnvPNshQGIVqhok0R
         ko2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777292395; x=1777897195; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJcxGiVkZlfjJqmXJdSpcQcuZLHP2CGOgvZ7uSde88A=;
        b=ovbFbZy66+BEAkVGNaAIjJN5JMaHt4+mmAp9FMeafhpE8Cm8uCYXnNpyPUERAYruzq
         LuzYcsZ0KNGm5r1l8nOEjpwQU1OkITsEsUeEm+mMGFA7xCqlvvOuj9n6CYUbRinWCA6T
         F1zpInrEUHxDRbinWmEtegHf7L3LYVEjDlP6qjcPasK1dyyiXcC72OYcrHox5dqpLdMo
         9DA65A9VcOxi74kzIdysPM7b0OBySPROQKzLQWmfl6y+TuJPIzTf/9h14o7nO31RrxpP
         /R38lpZQcgejmD1xWHdJ7bKSvrPbWBUBurTHZ9e+zbfqd5oGBOVPA1PSWYfTL+ZngEEz
         /NeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777292395; x=1777897195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PJcxGiVkZlfjJqmXJdSpcQcuZLHP2CGOgvZ7uSde88A=;
        b=iXfNE57o6GLeBNDMBEhBsJgo/Oc26Y1WhxBnmXKcqDGApM0PAxPLygvXOeP6rDR/kn
         1bFGUXlTrkxCR1l1vgCsfv26Ip5+AbuTKE+Vz833JEEuxafzWJh4HFU8ac137x/PHFgN
         bBXLAuF5i8cTG2qJg4KnZvwchfzSYv4I5nePqW5xDCCu6o2Q8t/+jpF0qszesTGaaFjo
         ySF/VZxDubYVpM4rZd63d5czXMK1md4kn8w+Wc4KUA4vJ98/XQ6aLY9nXqOTBq8cs2wL
         6BQp77MuUGirxzK75CZ4GeY4iP6j66YvpRumkypXBdTZcOSYEP7jS68pX5pKxrLdZhva
         fAZg==
X-Forwarded-Encrypted: i=1; AFNElJ9zTKmZc9cTY9uTGrD714PCHX8PGuUjYEX2JknDB/k8ln+GXXctPjUtMf/xr0QKzAa7gcTUBH2wwGFT@vger.kernel.org
X-Gm-Message-State: AOJu0YxakiOfPCDQc1JfWo89rMVQQlQtL3Nx6zD+c8nNUBj9VYDHC9zH
	sTO592EuJPTj5gYtc8eBGxx3Xco5Unthrig5KMNwe7V46eDXqOwQ/c01gvYIAdtgK48eLZ7NfRz
	abV/MsFHIblHUactrJLeRLHxFIKq+vdw=
X-Gm-Gg: AeBDievZJd7dqwkKFPET3OVWkWPbD6lOhyZM+3zpcSSF6fyNjdwSozn0yvTmUHckpCr
	mCJL/mRVCSqqzR5/Wi6b2wR0HaQsdK824sY9lL6d6a0zNUGECwdNeWffpjIlgzCpSWhXSvbNdwY
	wDE049XZp0/c709RTeLugqgSo2OucYrJKXn7hJk+Modz2RidBL51UwQvci+didh9xb24vjmX2s1
	/AudLOE+9NHDp64V7IVr6oeTEb804Dl49jKZuu9/B/FG6mUITTEhLj2Q4G4B+NyBAO8yZJPOeDG
	r1Ml4hAbxYXQ43tobg==
X-Received: by 2002:ac8:7e8f:0:b0:50f:817c:5d45 with SMTP id
 d75a77b69052e-50f817c676cmr442478311cf.23.1777292391770; Mon, 27 Apr 2026
 05:19:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260425031011.2529364-1-dennis@ausil.us> <20260425031011.2529364-7-dennis@ausil.us>
In-Reply-To: <20260425031011.2529364-7-dennis@ausil.us>
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 27 Apr 2026 16:19:37 +0400
X-Gm-Features: AVHnY4JMQA7P3RUKZV7Q2ZiP4ijZr_0utVOWXuWYUEbZIgaWmckkoQwwj3mXN60
Message-ID: <CABjd4Yw_bqi-Lj5MX--y34X_4GZPwa+ajwRGim7=nLGdqEOjEA@mail.gmail.com>
Subject: Re: [PATCH v8 6/6] arm64: dts: rockchip: Add Orange Pi 5 Pro board support
To: Dennis Gilmore <dennis@ausil.us>
Cc: Heiko Stuebner <heiko@sntech.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 25, 2026 at 7:10=E2=80=AFAM Dennis Gilmore <dennis@ausil.us> wr=
ote:
>
> Add device tree for the Xunlong Orange Pi 5 Pro (RK3588S).
>
> - eMMC module, you can optionally solder a SPI NOR in place and turn
>  off the eMMC
> - PCIe-attached NIC (pcie2x1l2)
> - PCIe NVMe slot (pcie2x1l1)
> - AP6256 WiFi (BCM43456) via SDIO with mmc-pwrseq
> - BCM4345C5 Bluetooth
> - es8388 audio
> - USB 2.0 and USB 3.0
> - Two HDMI ports, the second is connected to the SoC's DP controller
>   driven through a Lontium LT8711UXD bridge.
>
> Vendors schematics are available at:
> https://drive.google.com/file/d/1qs1DratHuh7C6J6MEtQIwUsiSrg8qgTi/view
>
> Signed-off-by: Dennis Gilmore <dennis@ausil.us>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../dts/rockchip/rk3588s-orangepi-5-pro.dts   | 440 ++++++++++++++++++
>  2 files changed, 441 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.d=
ts

Reviewed-by: Alexey Charkov <alchark@gmail.com>

Best regards,
Alexey
