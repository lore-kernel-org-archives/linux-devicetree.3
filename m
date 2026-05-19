Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C3D4A2E1E
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779185669; cv=none; b=Ee/P8GnZ94gd5Z8iJQ5Z3xS4sTz2KlwfcAjMgRnBBGpExT3drmo5W0cSBCL6pRbltx8onoxoXeJRAFjtUeSO5jvSoWsJ0h30Tlk70TsC0Dr/Sl2jJpRfLI9aLaizjFPzuzSbOznTQqQuuPMjFJTkZl7cy36mr93RcaoTvNkCuEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779185669; c=relaxed/simple;
	bh=MlZzsCiCJz/qU1zTGyvtf9iZTc9M1v0MuPCcay3MIV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JfvCtQrGMIVzT+aBxM+sE+mg5/MUkNxGgOOMuLYzsArMyabTG0X/wlj0Ej6XpsfMnuCPN87WSMvxt8pNMqVlkWh8eeA2E7e6FL/vGoGilbfZP8TKwrJdaZWbrHnIugO6FrurswOcOXQe941ymh10wkLkqiVg4Spdm2Pr/Hwyt34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dfa7yMlZ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dfa7yMlZ"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48e82c23840so26479955e9.3
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 03:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779185661; x=1779790461; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=68UC5v88IYbqRoSyuw3awSX++kyoya+p9VCms7nJOuE=;
        b=Dfa7yMlZhiDDdJG1CoBkmsZlBIG5QtQ2+LwnK0D1vZNbwDN7OChr2wewIbaU0x1vfy
         ojN5Y+uxuSo9g9fTh4nOpBLS+f41tntgzH39bBFX03l5eU+RhLvEJ1rMsq7DrgWWtAuE
         3vgh1YDSQheGGs+yX7wlo4HHzMUjWDQxZOHx4/4SKaAm3xVXxgQgRx6Oh0BPsj2HFbmk
         JoJEq2tld03RdB/TG+UJjrOB6is2a+juejyfhGe+0M7pWE5MnpkPnp+r+vb+3dAyrU1v
         V7Zr9TI/9560UXge1JLK9dE2FBXLn0hnZFlzlb2Piln6XhToil0kzWp3eqBiAl2DFXKu
         HrVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779185661; x=1779790461;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=68UC5v88IYbqRoSyuw3awSX++kyoya+p9VCms7nJOuE=;
        b=js+vHSMxQZ8WUBBRqRoRDMH1ugH3sYinvrRP1UmRr5n+H49ekZWq7NNC+CaYN12rrb
         D0536g5F0CZaY1UqGgDkRu/IAxTDzTBFcIj6XbffbD4WJsSAARHN3oP9VAXyC6Y1Ts5Y
         RB3zJGlWu78eiFhJ/aFokw/Al5DuAAV6jqn9lFsJwrjuprQmSKTgD/oDh4IwF/AhnWGC
         Klx8akKkVYkJufXMMD/kG3hj44WCAVCO1FhQAt+SZAvssSF/6rhAaY0JZaC05RxkU38i
         PwXdnUqFjTxsc0fp8cU7sbvRsuq+a3ak6whWRvKsGL7G9kJZpisoRp/m5jNrfQulDbX7
         oFPQ==
X-Forwarded-Encrypted: i=1; AFNElJ8yzamQ6zKGNse9699h1L3Eq+VyW+lv0W6efXy/blUMrMTyvXGWmwjS9Txaw3xCHcgpaBXfVRyantE8@vger.kernel.org
X-Gm-Message-State: AOJu0YycexkBYUsY15F/C52KW7pwfp6Us9DkMGZOP/mEsZtgp4UkE6hQ
	H/WxOhUS8OxsropgeNJOmPSxxyQjOp2ELSlNkoZxpmdGyR+xeoKIp6TtLJ9j3omPPQw=
X-Gm-Gg: Acq92OGZ6Y9iyB5MO6w+aOVhwA20fakYUs2EV97R96I96tWPpPe9vzuqy4Uot67z9jf
	WBfAAH7eY+iN0/KU9ymAvtJ/fc5uv3tQpxpp+DoOTEN3JcattfG47QKoMInrqEcUxcLoA0Jf753
	FOQk9MWr+sIOXNOyVmtVPhXwOpoVLC08WaqN34Ld+YsofljwOU+0gbIaNLbuwx3TFMTDq+huJD4
	WT57DfWW+0z1ZFsI0OPJ+vKP6ojrpIkO9Qm22EFyMmEfp4nhWJdn7uhq4co2T5rffN1nlw7iM6a
	A7wYqSdCWUT0yn2//NATL3RnF5iZaREZQ/vsvVxbO0EKM7ufPXUPAGe4rGZrHN2Xa6SMg7tAlmI
	rpR5crwneZ9PFzYP4s2yhRjZBgKpF9eAy4ozcoRoKgdUwtm3xhEHlCGfa3A8DijJflinBmmVje0
	jimA57/WUTseIfqjkF+St8v8UefvY2luhSIA==
X-Received: by 2002:a05:600c:6383:b0:489:1c1f:35f9 with SMTP id 5b1f17b1804b1-48fe60ea4ebmr288426235e9.9.1779185661151;
        Tue, 19 May 2026 03:14:21 -0700 (PDT)
Received: from [192.168.0.35] ([51.37.145.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm47579782f8f.10.2026.05.19.03.14.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 03:14:20 -0700 (PDT)
Message-ID: <f8bda354-ca64-433e-9e9a-4eabeb9a7169@linaro.org>
Date: Tue, 19 May 2026 11:14:19 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: usb: qcom,pmic-typec: Drop redundant
 port
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260519100014.282058-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260519100014.282058-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/05/2026 11:00, Krzysztof Kozlowski wrote:
> The binding defines both "port" and "connector" properties, where the
> "port" is claimed to be for "data-role switching messages".  There is no
> such dedicated data port for this device and role switching is part of
> connector ports - the port going to the USB controller.
> 
> The driver does not use the "port" property and there is no upstream DTS
> which would have it.  It looks like it's left-over of early versions of
> this patchset and is completely redundant now, so let's drop it.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> index 6d3fa2bc9cee..975032ba6004 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> @@ -84,11 +84,6 @@ properties:
>     vdd-pdphy-supply:
>       description: VDD regulator supply to the PDPHY.
>   
> -  port:
> -    $ref: /schemas/graph.yaml#/properties/port
> -    description:
> -      Contains a port which produces data-role switching messages.
> -
>   required:
>     - compatible
>     - reg

True, the ports are in the connector now.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
