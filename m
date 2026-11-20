Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171334;
	b=1ChIoG2DTq6Vexqcftqy/ibp7Om99tnxvhJvApTWYD9j6i31xjBAJoO4mvnsD7DKjIbl
	 lCCnQkdu2p+HWxFN6smHmgogTojwx25r6ckTbrVhH7g1M4wY65VkEodRnXYsApYCbnCnf
	 dwsjbdZuokpwhdK9Z6MsIIdPRuroKik5PLlreXY7NEi/wNRL2t7vmv47c0woZ9JxK7B7V
	 mKoCTjzOwy8OUJ4uksSv0rjGgIUeMdW3T1R9o0Wpdk39S4LH7dQud/+4ZYJlI6DVofWLq
	 sBy7fm6/8C8a02FJoG8H4121V/dWMjbE3LHWL5uc+3losWCqjgQEEmuDWrYvwKTjKhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=m9qCn8tiC9eOR+AeR03URThDVh6TlV82DdOIxf2Zrx4=;
	b=USIIPlI+/SeCE+4cGlctkLJnih8JgbUnrQauN3RsAspr+Cys9ZzZDKmsDTqZHb5uZ1lW
	 YQpJ/1MACiU6GVAwHSEvA5oUtF8IHpos3K3dk0RjcohGw+ciffCIKKPA8vO7BeaI8jUHJ
	 7EF0D8TRP65zSPul/3aL9TrzpHyIC4sDe9y6ISzCKIUvT9GjeBO0c8JOWt0rIFRjRkCt4
	 SVr1rRH82BW8Z1RmddFUpFq2TRAXd38Pe2DiTcZlqDvlACfbtbSjvFBia+/01kMBp7+Iw
	 ZicsIyPlR1PzOdFZZoU9yz3HpDf+J9+E63OAFdPZeXzzoB/QiNZDwvMA02JbY5GrQEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pQVzF4v1;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0138B606A325
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0138B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pQVzF4v1
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso421737a12.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 02:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795171333; x=1795776133; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m9qCn8tiC9eOR+AeR03URThDVh6TlV82DdOIxf2Zrx4=;
        b=pQVzF4v1P1OuP2wKnd6z4SLCqXpo4yn1RsI5GGPDXu8dOMT4Q6634x/KvQ6yiLtIwK
         aCDbrQcypxJ0OPRgwRSgXOFjCGvuOAULzzf1ab/J1vb68dpb60KcHB16dXwuDck4xzLJ
         vF9eC2gREpzaEyONHkDI65ChLZKix1MbkRQscBKzhMcfOwrLOELPuNoTxKQwSbU30JYK
         nHW6f2t3+zrt6tzCpdpFOFEfa/1qvxrQayrGFQ6PM3qxpVrpSNesBy3X/FbJTaLksI9z
         Z9uCp5Ca13VsxW5hLQU428+CvSfk3Q3wUFQm4lkcM21qK3mHT7fTfDO9m1yMmU7qNCB+
         JYyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171333; x=1795776133;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m9qCn8tiC9eOR+AeR03URThDVh6TlV82DdOIxf2Zrx4=;
        b=GTkbNzhLds51tCHV1UXEWUE1+wkPN170g5ovTT+7axn6Dlkc41a4DwC79rnEpY/Wzg
         sOglKBc4pCjV/VljUNJRAqJXZMWkVHcgRwizEoGuF0FtcBb3gpPlC+Uw8SntCXxr/ehs
         EgemxSvof++vDP1L7pkSmHxVNua50JNBR3Qr+IyAvh+e0BZ3+yGyGtdFiuTTFXnj8yVK
         7HTbZtA+WyS9oKFoQusCEqFxTG4u40/TFZhT6mCA0UGoe1aEI9OSJX3EPS/ly/QO6Ihb
         myfAsnkPzYomC7vMsxlOpxOhWuiYGsyBUGMfoUIc8JtPk+bEDi0wfXH7O8PBpci/aMtK
         AkpA==
X-Forwarded-Encrypted: i=1; AL+hErGACVUXT1cOueMYr3NVwXn2kVbqmXNYFQWlX+h5Oxthq4lKH/fBbqfObZXz8x8lk7Vh75XZhW8rSvje@vger.kernel.org
X-Gm-Message-State: APuU4Z96ujAsN3isEQwkEVV1Y1pWddQWXhAyu2sIIaj3kL6MP4h3AhsC
	XiZ40VOJkoyDLZcWssl3wwVie6hZbsLFg6Qt+AJkDlESPk4ckiDC/k1j
X-Gm-Gg: AZFdTZeb++Bs7gNnivick/QfpdRhTdwOST1SmpySA42bvvwnZBi8bZaiI1z8P/8iKKx
	C8DdJKzZNX/4ffOt2zUGJrxxZpvQPag29B1Uv8NhILIsOa46AL8wr8KX2bZvYHfC5FyKd7wfDZU
	sS9Y0fxmLvu5fOV8yUCspb1VKYHG8hIT1P5iVEBEBJk5GqucUW9INmCqi3zFqNUPAAXak45MlOn
	SvvVDhelfusAMiNkB5Pe8teUm9AcgpRPCqZZhQTuXhqp5jjIIJ9chLNfwFl2WBabiANiJSK12Qt
	7LFfGJ8VzGasc4knq0wZO4zx244Eu0wijhkh/fYSVmzAw/CkI6zRF8+5n9aVm2VyTsdd0+JTI7T
	ZEy4f/KZ/QVjx+MlLhHBhYsB3p/dat0MYIngKafxWmpG2J+7Jc67lR26mVYnOKPqmSd6t8oiW9i
	L1aKGjf62u/OWRW8Xuu1EZTaTTDNAazw0HYyE4ZLQDkrDVaUFZmuRbmUizM7c66qv/Ig5RtQ0XC
	q4vCeAyVA5Fj5CMtrYHHwb4558wArVHMEv6VKX0OnSrPt+SJF6de5kkt+OeFQEkhNshCURK2XRt
	pwJZOLwbmqeTWLMaqryJxXxglZlZuIHVH+NBULKrusLITVWwkHOKtnnrKyxrReMeTkn2hpw=
X-Received: by 2002:a17:90b:248e:b0:3b3:a9d8:ed2b with SMTP id 98e67ed59e1d1-3b41c8fe24bmr1594114a91.14.1795171333416;
        Fri, 20 Nov 2026 02:42:13 -0800 (PST)
Received: from [10.25.164.32] ([128.77.72.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b52dsm4115150a91.5.2026.11.20.02.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:42:12 -0800 (PST)
Message-ID: <fa77b633-2c99-46fc-ab36-03f6b5653262@gmail.com>
Date: Fri, 20 Nov 2026 18:42:06 +0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] arm64: dts: imx93-9x9-qsb: Add DMIC codec to replace
 dummy codec for micfil
To: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
 daniel.baluta@nxp.com, chancel.liu@nxp.com, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20261120031853.1175454-1-shengjiu.wang@oss.nxp.com>
 <20261120031853.1175454-4-shengjiu.wang@oss.nxp.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20261120031853.1175454-4-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/20/2026 11:18 AM, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The "fsl,imx-audio-card" machine driver uses a dummy codec by default
> which does not allow configuring the channel number according to the
> board design. Replace it with a proper "dmic-codec" node configured
> for 4 channels to match the DMIC hardware layout on the i.MX93 9x9
> QSB board.
> 
> Fixes: 31b2f4e4c4f7 ("arm64: dts: imx93-9x9-qsb: Add PDM microphone sound card support")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Chancel Liu <chancel.liu@gmail.com>

Regards,
Chancel Liu
