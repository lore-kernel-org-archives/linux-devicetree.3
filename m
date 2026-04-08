Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC353D3CEA
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 14:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775658661; cv=none; b=Fonb0yksdtNEHyj6UuCOBOJ4npKFI0pPevV3izZ2Z+jGC5IO/JuoHRJHKzdTE6sUy8A2LUGRJw3RfPFPv+YK/A0uYWW/6f7lYpFABUi1ZyjHmRalgxjRL4hZ3BYOkw9tQ/i1PIS1ICvmbdwi0lO1dCrv1AeW3jeWkLPYzwxLrd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775658661; c=relaxed/simple;
	bh=CxH0oCbGTr6B8Wm+BS8m8qhdCPE3WP5aAsJAIX7L2eQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=sJp65LqP/oniz6OJbiIRj5L+FWuIx1adesRub/RFYayuDpflk3uQ0Wbf/yPGcFWYoDndR2Ot4op7bFJ5QYCEcy3OKVC3Cke0VydXznyCe+1eBAn/FWo+OVSEWCdXJl8t8oLMZsN+sA6Rny6txtUKyWSoxzK/8mrRXkCFXsMmzIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lm+/BRgt; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lm+/BRgt"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488ba6366a7so29156785e9.0
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 07:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775658658; x=1776263458; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CxH0oCbGTr6B8Wm+BS8m8qhdCPE3WP5aAsJAIX7L2eQ=;
        b=Lm+/BRgtsVNmyu+X8bOaxFfWfEWZPaaOtpPKl4vWOX9EDRr+QEfWDNSWGcHIng0rii
         Z6+UGG1gxrUKTjTElmU2D6cedEdi9uxbIY8owq1QlLmOUvH4gS1aQxra1/5k232nvSF8
         w7aMvtM3dH1VytuTstSKeVlVJcYzZElte/W7pEH88KKXQcsjyGfK9XfbbJ3UTN8ZJxUt
         31hmAXOTy1A92K4ud3r9eJcvjqrbG8RDHLgKy/tUJKtwxlsXBltaJZUqADHa0UwabAAB
         tUSpaIje6ta9bet3oCCZUVODOiMwdRrORDFj9pSoOteIW5YEaTbUxIkvUnj9rLDRoSZQ
         uAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775658658; x=1776263458;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CxH0oCbGTr6B8Wm+BS8m8qhdCPE3WP5aAsJAIX7L2eQ=;
        b=qXcvF+HS/2BgyJzDHmSjBiQZ35sa9axs5joRcPuBJDCRwqCRW23OBiiluDyfwuLSI2
         aL6eCho5t2RX7RwoHatyFFNP/IJr9JoCDW1V79z5CpZxI0OAdJjj5ZTLij8Y0Q68mkUA
         C0U3EsQJR/tql82H0m3kWviF5zoiRgOvwexuYS/6XQ0I9pNC0sCxUmmIgcY/UEVbnD4I
         c3w5b8Bk9ZKu/cgIh8JGCzfVINU7YeE/o5oUe7I3GMt41DUIp7g7Co1SS3LFQWuIObIU
         MS/gFJzgx9Kya2kHAsEt7TDHiryNbvqqoiJzveJJMN4aF3Poiy/fBEnst8ioCyw1c5an
         SnSg==
X-Forwarded-Encrypted: i=1; AJvYcCW+czOSlMclAvcx1y6pXPSk1vTUQRwZOYRZY2yquIkYxPFlQ+b8/ykVS6XGbbGL787x8vLUpoCm32AT@vger.kernel.org
X-Gm-Message-State: AOJu0YwaQvg653KZPi6HlHUiJfxq2F1kyW1MHKU+bs08T7TSpZTi35Gg
	lPoO/279cvosjxce1XfhfYn/80/KpIoQFSJo0LOEatZ+nC+EuRllo7knW6oTef3v754=
X-Gm-Gg: AeBDietzwRMP5pnmf0GYkP/5eqn45w/kBW/JmV+SgtA/OlOmDVKfXOQeqEOSeJZsYXi
	gLfUwU9fSdZjFhhyhWr77heFK7uEHPPz7KQN5VTc65h0UaDIXIh/Ta4aXHrPgYsINlaWYbBVxmf
	biMFTcPbP8WhSaatWTgBgGJuh8gA8nxLB+u6zbrAe/JjVxE51Z71Nm+oHKJIQjK7zbzDFci+6Rv
	mAiiHDRPJrR4P3cyHR2U8nLNH+UCXGlnoOzwdTytizCcgvqA8f4ehek5gOfA9GmtMfRVURQfBhN
	BbwNB2dzJKV7yAKhjdELrCYAIXKCLOg8Dppe6tq8d0NwdfM60hfm/rxFj1PVP7dw4CH6+dKuJ1q
	DBdEiRYUmkGxsdUKGlAes1gDIV5z1Evw1kqu1VLUTYPsI9ViY9WtaqANqmZYKSBNg/Cp23jc9BZ
	DxB7W+Tp/czKG00nPy/u0jWqm3g/+/ZzRZiTt1cuQp/knNap6QTkEcHQ9E9xDGN+wbpS8jAgILF
	bi22tGi+Z1VjsB+Wg==
X-Received: by 2002:a05:600c:8710:b0:485:5ba3:37d8 with SMTP id 5b1f17b1804b1-488996b0589mr341915565e9.5.1775658658541;
        Wed, 08 Apr 2026 07:30:58 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:9775:58c0:569c:bd74])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e56fesm56397818f8f.27.2026.04.08.07.30.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 07:30:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 15:30:56 +0100
Message-Id: <DHNUGLJYPTUR.BTHWV3J1RRVT@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, "Sam
 Protsenko" <semen.protsenko@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Peter Griffin" <peter.griffin@linaro.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: soc: samsung: exynos-pmu: add
 samsung,pmu-intr-gen phandle
X-Mailer: aerc 0.20.0
References: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
 <20260401-exynos850-cpuhotplug-v2-2-c5a760a3e259@linaro.org>
 <01ffe5d3aca040edcedb084386ab6e195cb93013.camel@linaro.org>
In-Reply-To: <01ffe5d3aca040edcedb084386ab6e195cb93013.camel@linaro.org>

Hi Andr=C3=A9,

On Fri Apr 3, 2026 at 11:17 AM BST, Andr=C3=A9 Draszik wrote:
> Hi Alexey,
>
> On Wed, 2026-04-01 at 05:51 +0100, Alexey Klimov wrote:
>> Some Exynos-based SoCs, for instance Exynos850, require access
>> to the pmu interrupt generation register region which is exposed
>> as a syscon. Update the exynos-pmu bindings documentation to
>> reflect this.
>
> You could mention that this is similar to the existing google,...
> one due to same requirement, hence a new and more general property.

Ok. Thanks.

>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>> =C2=A0.../devicetree/bindings/soc/samsung/exynos-pmu.yaml=C2=A0=C2=A0=C2=
=A0 | 18 ++++++++++++++++++
>> =C2=A01 file changed, 18 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.ya=
ml b/Documentation/devicetree/bindings/soc/samsung/exynos-
>> pmu.yaml
>> index 76ce7e98c10f..92acdfd5d44e 100644
>> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
>> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
>> @@ -110,6 +110,11 @@ properties:
>> =C2=A0=C2=A0=C2=A0=C2=A0 description:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Node for reboot method
>> =C2=A0
>> +=C2=A0 samsung,pmu-intr-gen-syscon:
>> +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/phandle
>> +=C2=A0=C2=A0=C2=A0 description:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Phandle to PMU interrupt generation inte=
rface.
>> +
>> =C2=A0=C2=A0 google,pmu-intr-gen-syscon:
>
> Please keep alphabetical order of vendors.

Sure. Thanks for noticing this.

Best regards,
Alexey
