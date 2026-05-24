Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099A82E65D
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 10:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779620358; cv=none; b=cVIpf/qlR9YUICd31g14rgwxXtj2Tig3gWpL2FwAuUy9aogd9bsTd/wg2ZWW0DuGbZKu0Lr6HJTqCsJR/7bQCTuHv4L6lkYxsrq+LZGOAH16yawHmDMaPpC6lwcjfrD7cJWMUVXLpHSRA0P3nr0Mk4428q6b7Un4lTUiM388Hbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779620358; c=relaxed/simple;
	bh=qbAAMj8v0Vzlk6IsntMTRvq/WtpyYsXlahFNXLVZADw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qlMWrmZClcMO6vLRuX+LmCHleIKM8T/i+fvyqJ5kAXOvQoYKOeseI5d37T9NdW2WDK9hJrNbz5BmlEETvinTKj6oupJ6xNYKuT9NSH473c6RadX4IwiiuJV9fOMp1n8eahxPrqbhFCp+QfADU8oyYagsLgdbbn+aXbV8RVNjy9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lNKRBOKU; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lNKRBOKU"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so91021995e9.0
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 03:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779620355; x=1780225155; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7s/WuWNL9ddRgnnG+HfLCLif5sg1VJxBqglIWP1cQXQ=;
        b=lNKRBOKUFg23ALYEkoMYO6yLq1vZSF1+2xbGqtPsNy4EizZSNZoIsRj8nf0PE9+7Yt
         zRfMksz3DQsFJKMp5Y0Ckz+NR4fAVFHoNQXoI+roGlsBz8qFZVFxQs8Qa6Qig2VaczTw
         7hCn4UeJ6sx27AENt4JttGChsPCPIwb3R7WHdZFWiaX7sLoiW0Wp7MWj4QnNwdMR8dK/
         Xov7cWZilQtuR59TUAFWZvESL6yT7YNdbCVS+qTRWxrmCu8ZpsBz5JK0XtiGLNFrN7C4
         uLqNsc0WFnGOhLILrpBb4920zRWct3eEY8wdt2uNbT4mFJCNfhpDMlC57cxHlE0AfxNU
         BLJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779620355; x=1780225155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7s/WuWNL9ddRgnnG+HfLCLif5sg1VJxBqglIWP1cQXQ=;
        b=Fh39PcoKVgactFunLOvQ5bCd72dYkKet7xz+G44nZRDQZu4adCUIDLebZdn2dkhHHR
         LM9r0XlVEduKrQZC1xTBrkDjKI6T23dTygkKrYfEHANBSoatm8KXntUTVASGNtsjW7FF
         TDMXPBormieoTmV4wXHir0kDjVLwN38OEQGJGScrjMn7Nk9L+yOH4yl1rp5xfYyWjZEO
         7tSlHGcRoNiHbFzZfrUs7s0kC84uggjhYzWN2HdCNTgzAgr2Hq+07uWGZu+1KQ9s32tr
         U+ORV13v52U/LDYlCiwrLLPAm1JqgEI4ADHu7g49ArewpFDkE6uaU4UDWX6v1HoldRAe
         MEsg==
X-Forwarded-Encrypted: i=1; AFNElJ9JJU83g0wH3lJHSdUOLCIEdepMPLgKNq5uM58Rqx/a1GwqIqcqpo/weXUfPBNmxpUYsTdQd7Pi6KRC@vger.kernel.org
X-Gm-Message-State: AOJu0Yza4TUEpYCQV3PMlbLNExwg5NssUeKu7tzY1QYb+QWbNz29iCKc
	UpLVC2KOs2QjGuPhlMzaBd6UsTov8tuCf30LXrgI9rx6qlDDsa3Nw2AfSg51NMcMjcc=
X-Gm-Gg: Acq92OHNQT3dmjE6yD1TpgvjKX0iQy0XbbQCvvTYGoVSnI+0QX1L9lSvO/lWQTPvsh7
	HjPZjzVl9/9GgZeExe7Aj0viAz/5L7oWiAjPArI1I/7iWUPJfsRhUW0DjzUaT+OFyLdm+4NRRhD
	nLHgHrS3sAktwSdd/7x1H9Cfy0+LayOBhcCmAHOj/htXI/Yt96/SD6cwFhFdbBplzjiKxJexsNx
	zJ2h4iMVpTYTopSU3bB7tC6eKKpRgLdbSHMoHwushTHeTKxAtkkk3K3cTLfOiY7XaB5rjMvOTM1
	Jzt8FlCf0vZpVNE8V3SzwAffFMuD6SDZMPhktaQeM41VzDJNF5Im4vXexrtj89a3lrSt05Q5e3s
	5iwdlGmTgNdbiWo5xxj8O6xYm9NQII8Sk0x29EQk70dzklqRSNzY+mv/SLYO9pspT4O30CSEYMd
	5Gop/2vDMXtTuwxAGtmp9AlD5ywnai0PyyibzrU/vKirE=
X-Received: by 2002:a05:600c:3b0a:b0:490:60cb:560b with SMTP id 5b1f17b1804b1-49060cb57b1mr22246205e9.28.1779620354935;
        Sun, 24 May 2026 03:59:14 -0700 (PDT)
Received: from [172.20.52.45] ([89.101.53.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490428e5adcsm66212625e9.21.2026.05.24.03.59.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2026 03:59:14 -0700 (PDT)
Message-ID: <8f19b1c2-8469-4699-980b-fbd3b3354169@linaro.org>
Date: Sun, 24 May 2026 11:59:09 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, robh@kernel.org, devicetree@vger.kernel.org,
 linux-phy@lists.infradead.org, olteanv@gmail.com, vkoul@kernel.org,
 conor+dt@kernel.org
References: <20260523-x1e-csi2-phy-v8-1-a85668459521@linaro.org>
 <20260523030420.045501F000E9@smtp.kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260523030420.045501F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/05/2026 04:04, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [Medium] Using the literal `endpoint:` property name inside ports bypasses constraint validation for endpoints with unit addresses.
> - [Medium] The `data-lanes` property on `port@1` is overly restricted to `maxItems: 1`, which will break multi-lane DPHY split-mode configurations.
> - [Low] The example uses a non-generic device tree node name `csiphy@...` instead of the standard `phy@...`.
> - [Low] Mismatch between the `vdda-0p9-supply` property name and the actual 0.8V hardware supply used on the x1e80100 platform.
> --
> 
> commit 10936c65e44aeea784cc13676d51700996cf6559
> Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
> 
> Add a base schema initially compatible with x1e80100 to describe MIPI CSI2
> PHY devices.
> 
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>> new file mode 100644
>> index 0000000000000..270375f949880
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> [ ... ]
>> +  power-domain-names:
>> +    items:
>> +      - const: mmcx
>> +      - const: mx
>> +
>> +  vdda-0p9-supply:
>> +    description: Phandle to a 0.9V regulator supply to a PHY.
> 
> [Severity: Low]
> Does this property name mismatch the actual hardware supply voltage for the
> x1e80100 platform?
> 
> The example later in this schema uses <&vreg_l2c_0p8>, which indicates an
> 0.8V rail. Should this be updated to reflect the 0.8V voltage?

This was feedback I forgot to implement yes.

>> +
>> +  vdda-1p2-supply:
>> +    description: Phandle to 1.2V regulator supply to a PHY.
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        description: Sensor input. Always present.
>> +        unevaluatedProperties: false
>> +
>> +        properties:
>> +          endpoint:
> 
> [Severity: Medium]
> Will using the literal endpoint: key bypass constraint validation if an
> endpoint with a unit address (e.g., endpoint@0) is used?
> 
> Because the port references port-base, such an endpoint will pass the
> unevaluatedProperties: false check, but its specific constraints wouldn't
> be validated. Could this use patternProperties: "^endpoint(@[0-9a-f]+)?$":
> instead?

Not sure about the answer to that. Also feels like the tool could have 
made this suggestion at v7, definitely room for improvement.

> 
>> +            $ref: /schemas/media/video-interfaces.yaml#
>> +            unevaluatedProperties: false
> [ ... ]
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        description:
>> +          Second sensor input. When present, indicates DPHY split mode.
>> +        unevaluatedProperties: false
>> +
>> +        properties:
>> +          endpoint:
> 
> [Severity: Medium]
> As with port@0, should this use patternProperties: "^endpoint(@[0-9a-f]+)?$":
> to ensure endpoints with unit addresses are properly validated?
> 
>> +            $ref: /schemas/media/video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +            properties:
>> +              data-lanes:
>> +                maxItems: 1
> 
> [Severity: Medium]
> Is maxItems: 1 too restrictive for multi-lane DPHY split-mode configurations?
> 
> Split-mode typically divides a 4-lane PHY into two independent 2-lane
> interfaces (e.g., data-lanes = <2 3>). This configuration would fail
> dt_binding_check validation with a single item limit.

Not sure where Sashiko is getting this "typically" stuff from since 
split-mode is a qcomism.

But no in split mode port@1 is specifically restricted this way.

Is there a way to give definitive feedback - with a meta comment perhaps 
- that stops the tool continually giving the same feedback ?

> 
>> +              clock-lanes:
>> +                maxItems: 1
> [ ... ]
>> +      port@2:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        description: Output to CAMSS controller.
>> +        unevaluatedProperties: false
>> +
>> +        properties:
>> +          endpoint:
> 
> [Severity: Medium]
> As above, should this use patternProperties: "^endpoint(@[0-9a-f]+)?$":?
> 
>> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
>> +            unevaluatedProperties: false
> [ ... ]
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
>> +    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>> +
>> +    csiphy4: csiphy@ace4000 {
> 
> [Severity: Low]
> Does this node name violate the standard naming convention for PHY providers?

In the example does that matter ? Passes the dt checker anyway.

> The core phy-provider.yaml schema expects node names to match the generic
> pattern ^phy(@.*)?$. The current name csiphy@ace4000 will likely trigger a
> dt_binding_check warning.
> 
>> +        compatible = "qcom,x1e80100-csi2-phy";
>> +        reg = <0x0ace4000 0x2000>;
>> +        #phy-cells = <1>;
> 

