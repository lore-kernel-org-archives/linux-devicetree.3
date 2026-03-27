Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35A93AF66A
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774607286; cv=none; b=Twv9Jh4trFBb4bI8qeBytlXXjn7VVSBIanGMzu7b62tnJCSZNyBXF3PNyGjszf+NljpCXFxvyTe9HFS8jo/sbNLOxw71hlAhsgIS4WGL6BrrdtE3bu2Owr3rkc83/+L1vtRHfjjVQ7CEfNDhyQevOur64vbEfViTwzBDs5VdOF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774607286; c=relaxed/simple;
	bh=x4SiBt7V6Sk2WFVNfxLTaA7+5TjSVas4/7Un9ol0p7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZJnhLCXuBKeIayAdiBY/yTF9HRDEhZ0yk6fuvGThOEJx7kdjdkb6EHwanT7G7iWO5k2Mq9avtm5z5hwNYwZWhCVfHLHX8nObb3dmJsBw80yfi8YNRWjlUG39pNTfibrBjI0nVrU+H4yWb5KMjBx+zdyUexcs1DlSFb4T8l+oyaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CDzKLN6l; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PDRk9xqe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CDzKLN6l";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PDRk9xqe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774607281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Td1UEV2F3jUbtWfOC+hUJMZhhPXqcdPMCvHHDB6wWwo=;
	b=CDzKLN6lPUWZqGTKb3uY2RbBe0TlZyFt2Yxqi+TwDKZE20VN5+KwJ4nhtbRihkzWfy2gOK
	PdlmYyeFKW/OV6rt2LF1iq186Aty/CC6QmQ7oEPEAgQ1TVklm1qDuz2M6kiqGS5TrzLNa6
	iOh3Sl/rnEM8elIMbOKBP6VivkkOgao=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-77-qo6NhaxUM-eG2i-bAczv5g-1; Fri, 27 Mar 2026 06:27:59 -0400
X-MC-Unique: qo6NhaxUM-eG2i-bAczv5g-1
X-Mimecast-MFC-AGG-ID: qo6NhaxUM-eG2i-bAczv5g_1774607279
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-486fe3b9441so15253605e9.3
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 03:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774607279; x=1775212079; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Td1UEV2F3jUbtWfOC+hUJMZhhPXqcdPMCvHHDB6wWwo=;
        b=PDRk9xqeQXfokS8l666uPSVLPaxjE29OsFa9Npka0WgWD2h+JC23lUjV6xn3SLLmIV
         0jI8FD42p/SXDjLYUbddYOiLglAaxCOxbgpMa9puqgYEXsqNiv+1wRjKKa6ESFzarR4v
         A5ahi4p1CmJmJwdfxQ5Ub2sKKEzCOl8q2sHh9PXGKdp327irvkEkd1Tg37wDxMy50LmU
         Fz3D3yI1PRNcZ+fhL3/EIhI4X5/Dx5/R+RRXw9Yq6o96U/IuTU60hLD+FTTik1WyMZXT
         42yjXOv1axrE4bU5Hijue1faJ+598d2VxAF3H5xqoLnxPsNpRzZpd23nxJe2njpS7sNx
         pvDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774607279; x=1775212079;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Td1UEV2F3jUbtWfOC+hUJMZhhPXqcdPMCvHHDB6wWwo=;
        b=m5wBmXUqEUp1ger/sdSOqa8b2c6fh/ieUlRjCk8qFC9MssCXZVKfZ6KZNPpLaKoI1/
         zn0zceb6jJkepHD4JkuuyvsQJSqLKtlpKYramhCO5qdmnWUaXsEWusAtENciV6asN6gf
         3Rwf5uDLz1sRyjHhSZ5cCUPxkz41+3CSTVe2vSLZ+GWTDgRMLzc73Up6DEIH+OvWm2rW
         v7ZJbqXfB8emPjoKErQ5C9VvM7gdvh42+vnaZXWHjTyv9dWJs5WNB6rh9zYzqZqFM4ec
         WscPwORkIQ6nd3dQNH13bO0748XfsN08OdkujPU9ACR1aTM6Jrpbhf/fg77nZ086XEU1
         yunA==
X-Forwarded-Encrypted: i=1; AJvYcCVlKs0Smyv4XRqz8UPnrn+1RaVmdremknPRt71caEaW7wBRH1O5nghuHke6JS0cHNwY5CBXaqza/KCK@vger.kernel.org
X-Gm-Message-State: AOJu0YyvDsmlIUGrq9U1fVEcZ39g9wDZX0sYNXMJ4dgJ2R7Vki/PfYoQ
	IYHpbS3aFB2FJW54N9JmCJBGqjUIeNbN1mzzEsnmXZf9Op1THr6N8m96IDz//gX+oW4NMwiaoGb
	xpl5gYdPzvF0ViGrbt4RbubrLV6a7cvahCpN0/D2uUWns28xP9lmx8cOXp3KTb/s=
X-Gm-Gg: ATEYQzwae+/OeBbVQsnMuzJxnHZvnYaeL0g79wDm0HcdwQCj6fbI0kvBxgplFUty4tG
	oEDQGdGiZFGlP8s5TJtoPevQe9oB4RpJC7lRWKTci66g2W5QombyLE4Gob55L1B/xmI8xiPcphK
	DhaTVj9nTp+m1xoZBANJ8027N3vkp1QX26Rl6uCsU34da6lLdJyPMeJCTXaBYm9oMwaAW6F5jWy
	nt7SIMXCxFd655zuNpOUql8oJp3FwNPFAvjeH4Sf3fU9ypfbdo8PKoZ/UR72EPtelQP3k0Etujr
	Yeh6/rVdLlyQK6iioA+rZiuX2aH6guCchM814GBHNHtef4UOBdcBI5LHI1R0d89kr9k05aKu3tu
	OTRJRuonayu1gBY2oKOsV
X-Received: by 2002:a05:600c:19cf:b0:487:1108:48bc with SMTP id 5b1f17b1804b1-48727ec7695mr33006215e9.17.1774607278579;
        Fri, 27 Mar 2026 03:27:58 -0700 (PDT)
X-Received: by 2002:a05:600c:19cf:b0:487:1108:48bc with SMTP id 5b1f17b1804b1-48727ec7695mr33005795e9.17.1774607278095;
        Fri, 27 Mar 2026 03:27:58 -0700 (PDT)
Received: from [192.168.2.83] ([46.175.183.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c9f0afsm156453505e9.10.2026.03.27.03.27.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 03:27:57 -0700 (PDT)
Message-ID: <5764b509-9d02-4d0d-afbc-8176a7c44ca1@redhat.com>
Date: Fri, 27 Mar 2026 11:27:56 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 4/5] dt-bindings: dpll: add ref-sync-sources
 property
To: Ivan Vecera <ivecera@redhat.com>, netdev@vger.kernel.org
Cc: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Michal Schmidt <mschmidt@redhat.com>,
 Prathosh Satish <Prathosh.Satish@microchip.com>,
 Simon Horman <horms@kernel.org>, Vadim Fedorenko
 <vadim.fedorenko@linux.dev>, linux-kernel@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, Pasi Vaananen <pvaanane@redhat.com>
References: <20260319174826.7623-1-ivecera@redhat.com>
 <20260319174826.7623-5-ivecera@redhat.com>
Content-Language: en-US
From: Petr Oros <poros@redhat.com>
In-Reply-To: <20260319174826.7623-5-ivecera@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Add ref-sync-sources phandle-array property to the dpll-pin schema
> allowing board designers to declare which input pins can serve as
> sync sources in a Reference-Sync pair.  A Ref-Sync pair consists of
> a clock reference and a low-frequency sync signal where the DPLL locks
> to the clock but phase-aligns to the sync reference.
>
> Update both examples in the Microchip ZL3073x binding to demonstrate
> the new property with a 1 PPS sync source paired to a clock source.
>
> Signed-off-by: Ivan Vecera <ivecera@redhat.com>
> ---
>   .../devicetree/bindings/dpll/dpll-pin.yaml    | 11 +++++++
>   .../bindings/dpll/microchip,zl30731.yaml      | 30 ++++++++++++++-----
>   2 files changed, 34 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/dpll/dpll-pin.yaml b/Documentation/devicetree/bindings/dpll/dpll-pin.yaml
> index 51db93b77306f..7084f102e274c 100644
> --- a/Documentation/devicetree/bindings/dpll/dpll-pin.yaml
> +++ b/Documentation/devicetree/bindings/dpll/dpll-pin.yaml
> @@ -36,6 +36,17 @@ properties:
>       description: String exposed as the pin board label
>       $ref: /schemas/types.yaml#/definitions/string
>   
> +  ref-sync-sources:
> +    description: |
> +      List of phandles to input pins that can serve as the sync source
> +      in a Reference-Sync pair with this pin acting as the clock source.
> +      A Ref-Sync pair consists of a clock reference and a low-frequency
> +      sync signal.  The DPLL locks to the clock reference but
> +      phase-aligns to the sync reference.
> +      Only valid for input pins.  Each referenced pin must be a
> +      different input pin on the same device.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +
>     supported-frequencies-hz:
>       description: List of supported frequencies for this pin, expressed in Hz.
>   
> diff --git a/Documentation/devicetree/bindings/dpll/microchip,zl30731.yaml b/Documentation/devicetree/bindings/dpll/microchip,zl30731.yaml
> index 17747f754b845..fa5a8f8e390cd 100644
> --- a/Documentation/devicetree/bindings/dpll/microchip,zl30731.yaml
> +++ b/Documentation/devicetree/bindings/dpll/microchip,zl30731.yaml
> @@ -52,11 +52,19 @@ examples:
>             #address-cells = <1>;
>             #size-cells = <0>;
>   
> -          pin@0 { /* REF0P */
> +          sync0: pin@0 { /* REF0P - 1 PPS sync source */
>               reg = <0>;
>               connection-type = "ext";
> -            label = "Input 0";
> -            supported-frequencies-hz = /bits/ 64 <1 1000>;
> +            label = "SMA1";
> +            supported-frequencies-hz = /bits/ 64 <1>;
> +          };
> +
> +          pin@1 { /* REF0N - clock source, can pair with sync0 */
> +            reg = <1>;
> +            connection-type = "ext";
> +            label = "SMA2";
> +            supported-frequencies-hz = /bits/ 64 <10000 10000000>;
> +            ref-sync-sources = <&sync0>;
>             };
>           };
>   
> @@ -90,11 +98,19 @@ examples:
>             #address-cells = <1>;
>             #size-cells = <0>;
>   
> -          pin@0 { /* REF0P */
> +          sync1: pin@0 { /* REF0P - 1 PPS sync source */
>               reg = <0>;
> -            connection-type = "ext";
> -            label = "Input 0";
> -            supported-frequencies-hz = /bits/ 64 <1 1000>;
> +            connection-type = "gnss";
> +            label = "GNSS_1PPS_IN";
> +            supported-frequencies-hz = /bits/ 64 <1>;
> +          };
> +
> +          pin@1 { /* REF0N - clock source */
> +            reg = <1>;
> +            connection-type = "gnss";
> +            label = "GNSS_10M_IN";
> +            supported-frequencies-hz = /bits/ 64 <10000000>;
> +            ref-sync-sources = <&sync1>;
>             };
>           };
>   
LGTM.

Reviewed-by: Petr Oros <poros@redhat.com>

