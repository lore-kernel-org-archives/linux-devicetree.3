Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9DB44C64C
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 13:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791725299; cv=none; b=oHPxVXFIRBaTVQGSVaIFx10N6P+/Y6AD9oEQjZGLn9bvQNRstOwHjtmN6aUUbBCZYbRqeZHlCt6HKU1y4G2Z1277BC2k1CsDsTdDqUytuwynJFXcHAWaZhAdKbrR8vQCD/BRuFWsdzTGhwH4URiECEGmXZ0+m3R9C1YhcZWIB8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791725299; c=relaxed/simple;
	bh=bmKBnxSlrM9rBY26AIfTXLAwtzZx8fLdclkPI0vbXIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nXSijsyS7Y4ZAOkGGXE3Zc4sn4pjiyRRY+KFF4QI1/cvnGIYlAlnDpYCJa472aIXNKjYUtbwK8nRNR83pHbODFTSvE0mUvSKbMMHUowJtuY2921dQJlJaSptG9Ae8RcFIt8THMEzCjupV+FT7RMeENzmY26+3R5ISNmONCX7NMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T5GW/BQj; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T5GW/BQj"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2e7496f947so174483866b.1
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 06:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791725295; x=1792330095; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tmhk+556JexJYWbKIeWCGwz8JU5Skv6kMn9t5D0fvfE=;
        b=T5GW/BQjPxz6VsLIsP7UcXY1u5eotPfmYoNz2ZaumkqD1V9f2rDVKafqeoJyM/6rWz
         /ZPtOYXBwCsD3UcFtvjXqUUeFm5wVB4jzKfXV8ZG8Q/Zc7hGl27SSF1lqTGoLxt8ZHRl
         jYPJQvy07cx3REUG8Zrls1PvwATlBN9Z6LksYGnDmLXkuhOjhka5G8l2kwXyrlaIsOkj
         VtkmjH6IP29NNKpNyz0RGiWZjzEp0dblTCvUxj6GOkzHNGGowuZKd+7vFSYrCue1O2py
         JQAzyFZtrH7Ry5kU6m65TqgSQ5mQbsgAS3n2iJyAYLO/BZwZZbqIDzSYACLsyF8gqEA5
         qu3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791725295; x=1792330095;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tmhk+556JexJYWbKIeWCGwz8JU5Skv6kMn9t5D0fvfE=;
        b=g17ij6b142rlqY7vAAJj5FNewMJDCcbqom5UnfknrTAZOuaJV3/pFhVqQ+EteV4Bs7
         LYyBUJUMBvMChSggVaO8gNTCRXbTUyhDUGuJrH8KcMLQAS5REgltztXqG/zF2caLpflP
         Mo/Kv6ZLZB908ASJ/mYLxGtl4R+Hyg9DU8E0pmVKEyK7U73x10L+RzAGbaBkC5SUoXyW
         hblRiIMDFJmWnzTPK0ARgjB3oWE4Mg5oFLg6GwzXcv5FfnHxuT8GMNYCJ/d8XD7r2e++
         LLST1yDjzWE10YYcfAi0j5b1nDeDZqywCs8j3JJPyaDV1942ro8eQpdewt8nnS7Jeda7
         cfwA==
X-Forwarded-Encrypted: i=1; AKwUvBxkMSLqyBoD3DYFn1uQy5D3vL/gAO6wxvkAu/Br/v8xboJImz3DIePtAOW6bPaBqSWpBbMG4dKohD7i@vger.kernel.org
X-Gm-Message-State: AFq9FYJKh+addBWf84ubzfi6NFg6uKR2rV0OTH611Fiz/zy34V1tBq9r
	N+SxRTKFuGAf7WACeP+3KzwFU+RwC9p8zjmk3PO105nxlwZHL65sDAoY
X-Gm-Gg: AYBFou0Kd3Sg+INhPpf1226RVeJJFZuFVR0MeNENOsi470dNYILNsusdbKRUeOYLEIm
	ktvWKEfA1kQs6HIvHuW+guYEuxNRvH7gJXA0ozdkJw3tkUJ/PUYA/YsGcylDJANz2Ylxq4iivdl
	TAWBE3MtjyMp2XmZZ8ogxra0EMDDBaFTqQrxUANbrQ3aE4tqsedlkuOa63UBDlTkHVYUbLC4oIv
	PsGtuVBzMi4jxYyiYBJ2e8vfbmCWLMwG9xNx5Hj+Tfhk5xlBkxWlBDk8BrglH1LPMZQEAFE7xQs
	EINRw9gLeSvsOxxM4hvqBvN/xlYk3vPdKaUpper3+L7ixfpMyPpwUH3YJBuig8XBYd9nO/yLAYU
	Zxsg6P8F51VZXSnrsJckCI2xpy5w+yA1LezS0TSa3U1g85Lhd02rsA/uvQu+zxCivSCsftvLjNP
	L7qxB2jCa1UEG96OiTCt7CREvL9f4Rj4uxcPqVWtGi7iyheJMW5rEoYRS+LOw3Pjgasb7OXm5dF
	666fhVeQ3Ug123YpljX
X-Received: by 2002:a17:907:2d12:b0:c2c:d06f:cf89 with SMTP id a640c23a62f3a-c31a9a10df4mr621177766b.2.1791725295323;
        Sun, 11 Oct 2026 06:28:15 -0700 (PDT)
Received: from [192.168.0.193] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a3ae6csm359503166b.17.2026.10.11.06.28.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 06:28:14 -0700 (PDT)
Message-ID: <6a69d4aa-d04c-4bb2-912f-1584abd31e0e@gmail.com>
Date: Sun, 11 Oct 2026 15:28:13 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] dt-bindings: leds: skyworks,aat1290: Document
 FLINH pin
To: Svyatoslav Ryhel <clamor95@gmail.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261007085457.98762-1-clamor95@gmail.com>
 <20261007085457.98762-3-clamor95@gmail.com>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20261007085457.98762-3-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Svyatoslav,

On 10/7/26 10:54 AM, Svyatoslav Ryhel wrote:
> Both the AAT1270 and AAT1290 feature a FLINH pin used for mandatory Flash
> inhibition.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>   Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
> index a65d92522c9cf..596b5e284f44a 100644
> --- a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
> +++ b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
> @@ -31,6 +31,10 @@ properties:
>       maxItems: 1
>       description: FL_EN pin
>   
> +  flinh-gpios:
> +    maxItems: 1
> +    description: FLINH pin
> +

You don't seem to make use of it in your patch.

-- 
Best regards,
Jacek Anaszewski

