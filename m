Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792471299;
	b=fB/kMqZy+VJ/3oSpQofRQDcrrOUSQlD8Jsw2KS6V7767LgwgJYl7uwHCkdnSuu3l0Eud
	 CsBs02FEL+FNpL8h1gpbai6PCSEPkAg9/+ntKqS5WBuNydxLT89kMSgAEsdDcKU6B2Jfn
	 oAjv3+0yqsYv6mcDeR4t1bkImscvzjAVBokSmGQxt8KMkZdYa7nWWN1tQ08UfpnSBkW3b
	 owDFiFGQaUH7z6kgu9lhbE3Oqy1dhlC5+XQtxzzJWlQWB9B6I0W4N2Yl/2y1F+jO2tSMt
	 2gBK+eYsO3kqE4YR+IrBi0Onx9X8x+Yd9Bw8iR4AmDvXL1nRJ4cPqTi14KuG4EG8ChQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792471299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=4K10gDOkZE3PD160wnpT0ljtcztdT1+fKIxqNnjTmeM=;
	b=wX4gcoVSCVToN6olKd5of81+ek91aC8vfxdjXg22t94hwAO/zSf8vxVrMeUIfh28XRJg
	 3PzwL1lNZzlWTPgxGcW3i0wfcBDLDK5SUy680WIyMnDmacvAQBRUVLC/iVuqGuuL9IjHd
	 SDfOqRvN9hRopuyxFPh5hx4Dkd/3uB8/UXReqyyRyP7nyJxB3Q7/g9x+fQRsXNzzYfdGW
	 0yNWajaVttc2OkdzsVbAAQGSvILOsYC1V3XqGNr2YKitGhTTMquSSzjho5a9Skvitb/r/
	 Wmk7pR0SK0WFh3UHEJP7nvNsmRBVvN1EC0Rvq0vJXwXq5uqXTg8bZ3AUQnynQO8spFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rCj6oB0T;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94E3606A31A
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 04:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D94E3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rCj6oB0T
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso1758620a91.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 21:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792471298; x=1793076098; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4K10gDOkZE3PD160wnpT0ljtcztdT1+fKIxqNnjTmeM=;
        b=rCj6oB0Tts/buXDRhQwBOZ/wE3fvSFwMm4Romi3Kym5+buRZo/KSyoHyNk9oVOhnrY
         LDqCvzoeLh6Ys4OJTn0CTU7ocVB+dvFL2wRQENTILVBo7ykIj5wxvrLwTFkm2cOglvqD
         a278cqvnIkQkH/yGwDQVRo+tw9il34Xs4c4r1QGkdaeW6dnN9x6dzKD09CD31+um6e8+
         Vp0bKxVrCJZ7g03nQ+C7zxsSwoUfomx4ayuQUMGFHjEhY+r2YaytKqDMMqeAAtx4Kvus
         6nd0UYEp4N//9EA9GBkMFavNmGHzLKf7JMcE8AJp25l9rHhmfn6LQUu7cG24Ss9v7ZEv
         WKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792471298; x=1793076098;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4K10gDOkZE3PD160wnpT0ljtcztdT1+fKIxqNnjTmeM=;
        b=w4WKaWWJSRrT0NvrpnXg+HbfHvxtM4gdYvHr/nITrWFlxR69tm3g+2sJ+bv6iAtZcz
         P/0tCDYTBEv0XelCarRKWYdW7+6keCLw7vAvSPTqAZriu6AgRKw3DnSB278fQOefG19q
         3cBLNfNqLnrzxe5CCVJ1eMJFfJYuUeK3xizl7MZAU80KpNe/7LjstypeOWnEezJMMQdP
         Xrd7ZvFlIZn+FqFMF+VPr9AKZ3u1rQk27kNFwdkXKXD/7e/UEOZchaH9gY5TLa0e8Fhd
         0gAVkd9mNd3fbDK/Wv0L61y/3XLk/JunNRAxSObJpG182b5zMhLL4Mh8xi5/EWdoY3Oo
         dQ1g==
X-Forwarded-Encrypted: i=1; AKwUvByyzPNIf85wes0BjgXIGYPbFvLNkGutIHMhMeUPRwO26Qyr9g6CdNpwoGLRP0x9tvGihHfAbgHmFCyi@vger.kernel.org
X-Gm-Message-State: AFq9FYJQrNZRMiGoXk5/lZzAf5agqQknDh1RM0MKdm3IWTVGpkz/YGAA
	kT7HzPUV+be7WJajjYrnVPnpHOdovFq5/Ctfbficx/UV9L8NTPx2hpqw
X-Gm-Gg: AYBFou1AbmHMmEqZEAFSJLEzAx/u4tBRxAPhLSrWSpjDhQpfV9qz2iULSotKu8pcOGE
	NqgareQKhFjDLSipXCYnjkYSBL70r8m14N4bOQpNybfiD+/0oRQwr+DM2SVw+g53+I0b5c8/1TI
	O7BgFaxY3uf2H06JbPDzERhdUC53sL+kQI1pRdk0t/GVaUfO6PjF9/xi/O6RWeInznFa3tDjNLA
	ixiE9JQfGpSOb6Lp7fq94Y5jlAUY7cuGVUv63auS4S5WY30T874AaAPkjKho/B9qcxT4vWxvvFh
	bkvc1QBlzODvo+kDCrvp7cb+r+x2WQ3J5yCON5mFOqygk+vXhmbRacqEOY3CO4gxpM9wAHnWNtd
	jSlL8w2ZO0nXu1vdpWRgLCnd4QMZVWcG3El8EF4v9NPb7vagHOUolLscPqv9VCTsg3zvaV0nfar
	tqa8+zz19KRiKlzYUbq3wldJyxozbvNm6Rmtj00+nhcQwN91Sz51mWe4bMKi0fBjmoR9xIPxPpS
	2CVNdcjENjY6s0soEq6OJIsNvlAb+Plkomhjm5h
X-Received: by 2002:a17:90b:3851:b0:3ac:9e76:aa93 with SMTP id 98e67ed59e1d1-3acee2939b1mr7440626a91.7.1792471298112;
        Mon, 19 Oct 2026 21:41:38 -0700 (PDT)
Received: from [10.10.15.228] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad60274fc1sm2242645a91.0.2026.10.19.21.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 21:41:37 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v10 2/2] rtc: Add NXP PCF85053 driver support
From: Potin Lai <potin.lai.pt@gmail.com>
To: alexandre.belloni@bootlin.com, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, devicetree@vger.kernel.org
Cc: pankit.garg@nxp.com, vikash.bansal@nxp.com, priyanka.jain@nxp.com, 
 Lakshay Piplani <lakshay.piplani@nxp.com>, 
 Daniel Aguirre <daniel.aguirre@nxp.com>, potin.lai@quantatw.com
In-Reply-To: <20260914141537.3881890-2-lakshay.piplani@nxp.com>
References: <20260914141537.3881890-1-lakshay.piplani@nxp.com>
 <20260914141537.3881890-2-lakshay.piplani@nxp.com>
Date: Tue, 20 Oct 2026 12:39:05 +0800
Message-Id: <179247114505.1909331.8772243042180533977.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792471294; l=1059;
 i=potin.lai.pt@gmail.com; s=20260522; h=from:subject:message-id;
 bh=n5P1atnEZAPMo7JzNsBwROdmy+J5EY95ZUsmftBy8h0=;
 b=EdjxSeP0LCf0fvkfNg8X4WS1akYfDY8F5W5JzCUosWEW6Mg2pEAecfdbNqRFLjP+GLLWXEXrp
 qBasBTb3fAGBjoTyxOqGvZoH434FUHzjg32btWvTbtccwyuiA/ETbgh
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=j3/nMxzz1ZPpp1revghyZ8IqOnwi6RWfuxXN2XrNMRE=

On Mon, 14 Sep 2026 19:45:37 +0530, Lakshay Piplani <lakshay.piplani@nxp.com> wrote:
> diff --git a/drivers/rtc/rtc-pcf85053.c b/drivers/rtc/rtc-pcf85053.c
> new file mode 100644
> index 000000000000..2eb94b1da3ed
> --- /dev/null
> +++ b/drivers/rtc/rtc-pcf85053.c
> @@ -0,0 +1,900 @@
> [ ... skip 770 lines ... ]
> +
> +	dev_set_drvdata(dev, pcf85053);
> +
> +	if (of_property_read_string(dev->of_node, "nxp,interface", &iface))
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Missing mandatory property: nxp,interface\n");

Hi Lakshay,

Would it be possible to provide a fallback default true for
`pcf85053->is_primary` if the property is omitted?

In the current implementation, nxp,interface is strictly mandatory.
However, when users instantiate the device via the sysfs new_device
interface (e.g., echo pcf85053a 0x6f > /sys/bus/i2c/devices/i2c-X/new_device),
there is no way to pass Device Tree properties. Because of this, probe
will always fail with -EINVAL.

Thanks,
Potin

-- 
Potin Lai <potin.lai.pt@gmail.com>
