Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0087331203
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 08:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784967134; cv=none; b=fNnfxH0ap+O3OETl/ksWIhVX8ejWnPnD/dCcFOwngbN3Lq+RgZX1Y6SV+LOHXNI3o6i7GvZWve7Ugv1AovsFgDNDPMjX6JY7gdUyI87Rugy/d7UV7Q/t1PLjCHLczY6DD+iVuikmYMBHxDK0Y79DDTm5WLSIzDlQQH1aaHZQRSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784967134; c=relaxed/simple;
	bh=b3mINTHQtv2zBQQWidwSIYv1mOw4iSfkHVzuPqJpMuY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BQcyszG559j2YuNNKqztMPvHvYUdBbi6eyyLIEiYSEdKbagQydscqXqJnMNrnVVzBC/ynwzfMdoK9w9ti2HF9ddQZTouDF2jSB6hlI+oPl3aYBLGhTaDpfOrOE8J4qo+w5XHnsslPJogMS9pxHHCbO2o4+iEMzLiCMA5N8/cs1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LOASwlkT; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LOASwlkT"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-495437bb891so10665785e9.1
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 01:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784967131; x=1785571931; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G1XTqKHyp1mTZN9MChbQUL99Guwmopp4ygsT+DbcbKM=;
        b=LOASwlkThx8vKef1MJYi0TTbwUQxlCLZ148xzhyIZ3wea3YSRd4qvVHGSz03Dw63Kb
         mGiMYNTYr50VSX0MwX7o5nUjVzAU2UiHDv+ZbIkCd3iSjgsXPpL87m6T/ulO6K1bvbit
         MgOr+Feet1sgdl9jVH4Q5+fWEG6UUmEZe6Po8bMmWEEpCe2eTldbPqWSSMcsxYfH7boc
         68/0G1ERq8sOJXUbt9TUfnYjDvkYqhitH6NbS+Z42HJuWzd4CygyFpM9fojC5kjHHzk3
         L9z2irTySonsahKNz5gRZ7L7wrnOttFjboj6oSzGubpuHVjtHH1hDdnheV1u7q8FxN6G
         MZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784967131; x=1785571931;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G1XTqKHyp1mTZN9MChbQUL99Guwmopp4ygsT+DbcbKM=;
        b=J3VOFmQI865zbiZNBMeiNexFYynlmZ3y5Yco8+6aFXmVwOQS1Q2+v3wR8Ysi4aFXK3
         laCGwXByglYUQrHkkVTn72NdkHvD0FTyW6n7wvhe4nQIlDjM+GctX9LTMLiIkPWXg/Fx
         /sPqXG4oPPmyjpMLjUJljPWVwIsuhIsjpJcmz/NPqdUDjJ+A/xVM8owcJidbw+JSsQXu
         nXfvS8a7fPYpq4bxhyLnvYi76pc+99HAkEKFWIm6DnB4SpHiDNa8u8Rp0Wg2Qa1EF3AZ
         UUD4uVk54bXtFol4FKvRqtr/hu626/9YymXblbGuz4kCmHRziLruw0bWg7/xwv2+zNsC
         IIEg==
X-Forwarded-Encrypted: i=1; AHgh+RoHbyGWIq4SJTnds0aauhUCWxTa5OP/uv9W74dpaq+2lQPyUC9YHaAvBCdmemAFpraTHl2Pp+3y79qb@vger.kernel.org
X-Gm-Message-State: AOJu0YxORCRvDTOwkUjGFRS2CHpVBQDF6GIwS9zF55Ft423wg+GcOekW
	5jwhLGcftLNH5Gav7DojAx+AK+GnzRq7DXtI2S9l4BHQ9zeqq/oP4HE3
X-Gm-Gg: AR+sD12Uk0yTuuupo8PQ1Gc2pHjMI/Y+t/eps+u28viyL4polHwMVJjSdohleLTS59B
	RTJ4vGiQ2ZVaaQcbUkgHfqfaAbSAYyP/VfZsmOaVcyeczMKJcbmAik4rDAaiUPqxh1cmXckIYv8
	m4nx2ri52IzGEgRy/rJe7rz61xUAzgPzOVfMPmjLbN819oynmhQPgeXVJHUypTUKdIDTjMJ9BxE
	pymlmiD31UICACbbU8PYP1Q+9oqbcBdxRPVM8n4i5gwKRkVXcJV+Wr8kzRY55OFEoDvIBK1YqaV
	WU6hH2ZBypOlwovlK51zI/b2yPtckCppSZBkdy05tNPY/g+Wh9NrVEl23pLKTAES4hdXQhy6vL2
	SgDzBty54gL4FSYdcjz7bJZosRBW7CvlHSYBLLGFmYZ7KwvfApR1ZNjeOK3Uq/gGoCkCK03sGz1
	5TBVjmg3PfnDL1uNgFSTlV5GtdOnM+a7agoFInsqy9esk2CTcxIMCphWYurTTVN/CA7B81wkhiv
	xhC7vX+GHunbrocOZ5Lj9pgmKKUCZVyvDyifkuhEyCoKKp3x48SgfyqgiXloq0gygtYSkNVoRp5
	Uj2+Z2gf4Vfp0VT/Ui7Chgg+3to2jQIJLA9qQZaNz+MtprgxvmvYGFBH9Xelyg6LOUerx/3lvSX
	AdcZwDw0Ppfw=
X-Received: by 2002:a05:600c:4f89:b0:495:501a:fcf8 with SMTP id 5b1f17b1804b1-496b5c7181emr17455845e9.9.1784967130814;
        Sat, 25 Jul 2026 01:12:10 -0700 (PDT)
Received: from systembl0wer (ip-86-49-244-181.bb.vodafone.cz. [86.49.244.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b499cc49sm57113005e9.9.2026.07.25.01.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 01:12:10 -0700 (PDT)
Date: Sat, 25 Jul 2026 10:12:08 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: iio: dac: add support for mcp47a1
Message-ID: <20260725101208.06f60b70@systembl0wer>
In-Reply-To: <20260725000439.5ad6f4d1@jic23-huawei>
References: <20260721-mcp47a1-add-support-v1-0-da045a2567e3@gmail.com>
	<20260721-mcp47a1-add-support-v1-1-da045a2567e3@gmail.com>
	<20260725000439.5ad6f4d1@jic23-huawei>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 25 Jul 2026 00:04:51 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> On Tue, 21 Jul 2026 20:24:38 +0200
> Joshua Crofts <joshua.crofts1@gmail.com> wrote:
> 
> > The Microchip MCP47A1 is a 6-bit volatile Digital-to-Analog converted
> > which communicates via I2C.
> > 
> > Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
> > ---
> >  .../bindings/iio/dac/microchip,mcp47a1.yaml        | 56 ++++++++++++++++++++++
> >  MAINTAINERS                                        |  6 +++
> >  2 files changed, 62 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/iio/dac/microchip,mcp47a1.yaml b/Documentation/devicetree/bindings/iio/dac/microchip,mcp47a1.yaml
> > new file mode 100644
> > index 000000000000..3322fca03b3a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/dac/microchip,mcp47a1.yaml  
> 
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +          #address-cells = <1>;
> > +          #size-cells = <0>;
> > +
> > +          dac@2e {
> > +              compatible = "microchip,mcp47a1";
> > +              reg = <0x2e>;
> > +              vref-supply = <&vref_regulator>;
> > +              vdd-supply = <&vdd_regulator>;
> > +          };
> > +
> > +          dac@3e {
> > +              compatible = "microchip,mcp47a1";  
> Hi Joshua,
> 
> What is the advantage of the second example?  I'd drop it.
> 

Hi Jonathan,

Per the datasheet, the MCP47A1 can have two different I2C slave
addresses (0x2e and 0x3e), which allows two DACs to share the
same bus, something I thought would be good to illustrate in the
example.

-- 
Kind regards,
Joshua Crofts
