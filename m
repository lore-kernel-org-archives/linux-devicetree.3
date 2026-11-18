Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018404;
	b=nZZjvlIHv0zopz4kg6VJmx02LMxF2NjmlTQZS31ra2O4/fAC3dxpen/Atf0+IgoOOCQB
	 Op60UOB3V2KWfKmc84gSiyNxlffYGnQ2Lvawj5QHJrNmhzxrS9P9nzk5hOWA0JApCemoa
	 WrzMyabyn0FAS51FXWGxJj+eM830P8R6JKYXfgMtjJYvThjoavhepPWRDxFxkQB/EzDHS
	 c3WjErGx/9pX/jU8ueExB6kxAzGQAOGHSSqg3irv+jOQadsuiAqENaV7gWPGajkHxoLH4
	 N2qlODubPVUwZZDzI+P8SdS8iuFdXrH+U6hefY322uM6KUKxwgE0zvqePKQReCVMoUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018404;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=3Lq/7sTlAJbfIIqLa7wmAuF2tMNPuQ+wGipfJEmlBdE=;
	b=hwkwowGftlDOU2dxolbJ4fAdPqocITAfzdUOt5g+db9bKCcQ68K36pawFD+qoYDr9Wip
	 lGCTrIV1RcXm9rfqE2zI7a2Xdmp3wf1jMLWSW7oD5bdqS0tsg0CFc8spiBvernqzzYq8p
	 NMux768MoTpv3SF5HHl7Jek9qDMEQdOpGXvSh7yX2IkhKksruAVG+4gbTJeW/iDDsQ2uI
	 7HxMgQNUjC2zFBGnGIz+0i9dDs+jWOmW5j0ZNPozALi/ATQI17GjLElDYx9tWGLDeCx9l
	 UV/dLHNTH2k3R6paBHVmgO81wpTW+xc5qhOv1MtexOH7TlECrJnvHVPGp5omiMrclRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=FV0bltX0;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F32A606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 16:13:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F32A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=FV0bltX0
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so2045766a12.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1795018401; x=1795623201; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3Lq/7sTlAJbfIIqLa7wmAuF2tMNPuQ+wGipfJEmlBdE=;
        b=FV0bltX0oekj6/9f3wa9B0/l8zl9COMFFyQ5EAruEn6+3u8/cdTM5/fAof+ws1va0+
         9V7ZDTR58f1agBhb7jH2ZL23CYfYjNxO9GWe5UnzWp/TDmnnGY2nLr8Kic0Ewgy0cvoj
         0YFwCl6ZFhMviqdtHWJ7uNUE7iVBQ9qja0BQtawatKhVTmELVv/qTlkkbMn7FFPzE7+t
         eXoRoWgCAjRLWh80ANeC3KOnPoeMh687hvXa8XsLwshJmADDY3F0N9ej++7BVjTBWgni
         JzCzrJrBRgmsz6I5zgmhaUZ9e6xoF5WOnjD/Gel1Oxr/msrr91dJmbK9CBW/d0LiXQ9B
         CBhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018401; x=1795623201;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Lq/7sTlAJbfIIqLa7wmAuF2tMNPuQ+wGipfJEmlBdE=;
        b=egxA+Sn8OrEWMleBgiHattMGpWAQurzMQWp/Yl+1Ydj6GEvewxGBMuXK8X9j5sTjsa
         5doiPOK7bRU59WvvJwNcUuGI/zwR8EqSq91YPonKRKovMq8yloPNd9CiF/xeW9GvYRJD
         mqn947QoWxpgJRiF7hRwS5xtotCYo9MYlkPSE3UsxlWt9Yq060Cmyb2OlXEPUttAneO/
         K4TNZB5PfOORpF99XcpTUlXK7gVq6++3eJoOl1vy4SioMwYdQ5fYblNadlxxRVe9X/BI
         6jLjb9fqscDuzpUnvAUAUtGP81qP09QZ2IACNTw2STSODsjgK6n/zaKpDn86t+5eL+a6
         pH9g==
X-Forwarded-Encrypted: i=1; AL+hErFC2gyPcMKzedy46j28invpD0FrDN3SZQB1dIV/nHbVUYmKUOfYVAleg78mH3IdRFiRmwc+2jifh/yu@vger.kernel.org
X-Gm-Message-State: APuU4Z+hgFgXKIB+VQwgpJvE1ZNUqyjYA8l6/pXFQC0GtkvdAyhlN8xW
	GuI297p55sHfvqw+lNl7/63eHEFUQN61CLDm7bBPZ/sA5U5UeKoNCUv2RKXtxmkOLAk=
X-Gm-Gg: AYBFou1iU/ff282r0uZtzUxAhviaC4Sv3k3k8Vt6nyHTI50AnL2Egx/CpIo9gk7rSca
	YB2fBTSVgYVdOShFIRN4Phto0Fw7/9UP/EP8yT4HKCeUNsDzQiJ0mXCfnjkUVsQjNbH+RPR8JTl
	KhA00G8LE7AHAdS9XuLWd3LjmZqhUrGqHCze/06QbjcjtRVoG2AyEBHeZz0uptcV8wnjTZTS9wk
	MaQwQWUa5/QCIpWQLuc8ZwcU4dTPJ/OFJmLeRSgbD22XGc+WrWndaswfi3/eVH77W80V4WwnCw4
	xyCBScEPifJFQEtgvoiEFNpzDMdTwB9R9327+0Vyk/214HMuDWvtYa8lmBoW4fNMMY2K8cvAAkp
	ha5WTh9MXjS+o8ojnnDMczmdeEL6ykRQz9G4/OL8zigUKjtma1YZq1YvzpeFXuxg9Gd81RvdwRN
	26CSneRMwrVXaZR5Ip1/iW6OIokgTuOgfWU+QF7RhWuiInAQVMX4XUhvWL9OjnWPeqvDS246hin
	6mg+nRHVu73hgCFIJVNAsQ+Qgg6MTCOLLVVlONJg68/QNr7vrwOT1GIXSz1EnIhBgSm+vB4tEnb
	CKEG2SlqYvxghpNX0RAvATeyjJF4/6NeE2fLBqaLDcA/AopKbryH5uYzoGLuj3xViYgmZbQWXw=
	=
X-Received: by 2002:a05:6402:693:b0:6b7:5712:f13e with SMTP id 4fb4d7f45d1cf-6b887e9a998mr2171788a12.21.1795018401363;
        Wed, 18 Nov 2026 08:13:21 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b88a6fc230sm1256698a12.36.2026.11.18.08.13.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 08:13:21 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Nov 2026 17:13:20 +0100
Message-Id: <DMYGX16XPQEY.PD4MUZN1IINL@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <wcn36xx@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 2/3] wifi: wcn36xx: Do not enforce interrupt trigger
 type
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: <arapaille@atlr-engineering.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Abel
 Vesa" <abelvesa@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Loic Poulain" <loic.poulain@oss.qualcomm.com>, "Luca Weiss"
 <luca@lucaweiss.eu>, "Eugene Krasnikov" <k.eugene.e@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261118-wcnss-series-v1-v1-0-a64d82e151bf@atlr-engineering.com> <20261118-wcnss-series-v1-v1-2-a64d82e151bf@atlr-engineering.com>
In-Reply-To: <20261118-wcnss-series-v1-v1-2-a64d82e151bf@atlr-engineering.com>

On Wed Nov 18, 2026 at 3:58 PM CET, Alexandre Rapaille via B4 Relay wrote:
> From: Alexandre Rapaille <arapaille@atlr-engineering.com>
>
> Forcing IRQF_TRIGGER_HIGH over the DT type makes the re-probe after a WCN=
SS
> restart fail ("type mismatch, failed to map hwirq"). Rely on the DT, as
> commit 1ee6c5abebd3 ("ath10k: do not enforce interrupt trigger type") did=
.

Worth noting, that all upstream dts files that use qcom,wcnss-wlan
(apart from msm8974.dtsi which is getting updated in this series) are
already using IRQ_TYPE_LEVEL_HIGH, so this should not change behavior
for any other SoC.

>
> Fixes: 8e84c2582169 ("wcn36xx: mac80211 driver for Qualcomm WCN3660/WCN36=
80 hardware")
> Signed-off-by: Alexandre Rapaille <arapaille@atlr-engineering.com>
> ---
>  drivers/net/wireless/ath/wcn36xx/dxe.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/wcn36xx/dxe.c b/drivers/net/wireles=
s/ath/wcn36xx/dxe.c
> index 801f1218ef..7852f71368 100644
> --- a/drivers/net/wireless/ath/wcn36xx/dxe.c
> +++ b/drivers/net/wireless/ath/wcn36xx/dxe.c
> @@ -552,14 +552,14 @@ static int wcn36xx_dxe_request_irqs(struct wcn36xx =
*wcn)
>  {
>  	int ret;
> =20
> -	ret =3D request_irq(wcn->tx_irq, wcn36xx_irq_tx_complete,
> -			  IRQF_TRIGGER_HIGH, "wcn36xx_tx", wcn);
> +	ret =3D request_irq(wcn->tx_irq, wcn36xx_irq_tx_complete, 0,
> +			  "wcn36xx_tx", wcn);
>  	if (ret) {
>  		wcn36xx_err("failed to alloc tx irq\n");
>  		goto out_err;
>  	}
> =20
> -	ret =3D request_irq(wcn->rx_irq, wcn36xx_irq_rx_ready, IRQF_TRIGGER_HIG=
H,
> +	ret =3D request_irq(wcn->rx_irq, wcn36xx_irq_rx_ready, 0,
>  			  "wcn36xx_rx", wcn);
>  	if (ret) {
>  		wcn36xx_err("failed to alloc rx irq\n");


