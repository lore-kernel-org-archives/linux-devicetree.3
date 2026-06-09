Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2FB372ED0
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 20:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781037542; cv=none; b=nads0Qa6Gz1vqkHmARKsz4xxjQR5bSJzAdmYEUDJIjnyjacS+sww6Tdo8b0BNKAgQ5CkCbtnm/fNyd8iZGX/rB5OMb1Wh0hPbBzIHAYB60DtDq87LdR7cSo109KR5ecKEICtz+zM5eMcTomhA/FvWvgJL+odQuO8eFXqZr84phI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781037542; c=relaxed/simple;
	bh=wjrsyFAFBOqBoBS2Vr6+ezTs640vJuST6uXExrhL44o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MfW9DzF/rf1f+WeoWz6FT94zeEM9qFqD+YQ7X+zPq50882CfmSH74e3+HrF0gNO8mGK0ywr6dewR008ia7BqtSH4WZw41mD3PhtYplZM90sD2N1SXCD+B2kT/kzARlBpBGhZmHRAWrhSaLAZjmGHIg5rclQt0UNnNOuMgyIkByM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=uD15CbDx; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="uD15CbDx"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-486852c7b68so3774656b6e.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 13:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1781037540; x=1781642340; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uC/gW0bqBQrvyjGENIA0EklxnQV7jgJOX02+wy/otqQ=;
        b=uD15CbDxaDgpCz7FCWPx9LUw+F3dcanm+5CWJjR61AdNmkixfLjAga9HSe4/o21zNH
         0F+MdHfu5B40V9zrWv32fXZ7g1I6b2Dsjqcj7gjCMI2lwU+bRMCQD0DxLrKd/gwMZOMZ
         SK/4Q9Dqt+qt0uAvGamfAnV2bxS9x0cebWUnffrf5JXJKsGePfgye7Vm3qhxwdeBM+Gj
         M3rRiBRe5P2TubKg78Qxwjhec3HVg+0lWjAWc+LZnGFGNQEAPkHfB2wPJKgd2n+Nl6eC
         jXADHL3kQNAIrL9IReX17IDMSDj/RUJgOEiKS54xsbVqublmzCTX5l/FBPMyOSSbjQME
         s+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781037540; x=1781642340;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uC/gW0bqBQrvyjGENIA0EklxnQV7jgJOX02+wy/otqQ=;
        b=HE6zLuhm/Ndz89Z3JYvRv6TmtnL4oE73VcQ0yHE/YvP5oJDPyx07y1Yz6LeFL/b9MO
         NP9qL1fVlF+co7b8wnkWZnbwErZRqz0chLomarmno/zcG+XKN+AUQ/SuoezRZMVuK9eZ
         Y6ZJJye0nAODoWev4vW/UnI4TRsS4sB5Sf36dNwFm2mVvqsKQbr7mRP1nJQ6kDgWMPKU
         htGUp1nOg2JEfeShPuYlaA0Aju56B0j6HpWWntYcergLxgBq0F/y1wOqZveUp2STZcF+
         ACjT2k7cJW6sYyKMtHXlLbB03jofeg/soQRDPXn4QUJdfWGC1DZeSf1KvmeCyn3gV0eW
         UOcg==
X-Forwarded-Encrypted: i=1; AFNElJ9mq1xTl2Sp4kcCV1lBKXrqvmOFWJM0qNJqY8dk26XjINcaq3Qm/VmrCtcyU5N0YJdvydXDzuDn3k6A@vger.kernel.org
X-Gm-Message-State: AOJu0YzDlSrr31r+s3IJ1JaYI6yTt3t3hFROe0SDHV1XkMvOjVEmI1m3
	267I6myg2+aXj9snjmq6aPx47v0EX8Ltk1HrfrJ1DfkCom7K0x5FD6YsrJU3XBp8dJI=
X-Gm-Gg: Acq92OEinbOeQqL/qUF8Won40DA/aAQ5MkUD+qtMkEKN2ZCqDX9nK6DYOEjcKfPuqLE
	MuTAWjhwkagX8EFY+MJ9jPRA9jmXsB6kcEdZ4EUf2US43kGYd4j0O4Oa4+ZhRou9/o4S7Z5DVpA
	HVPb12dchDpVuo8fR6kqG4Iwh/SKjOc7UnGIGShHNRcvxGJYXMZ3Eb0gnO+bQed4m02nKoB2yyk
	ob7WPE5hFtLjLzchlxExz0amI1L9xMs0oDuFFQVwlPsDl/gLNZVLhqKoR8IfNfGmiGxlkOLkww8
	X7ANpAwUHEybxE0rjb4pNKx4OWJ5lI79At8ftPbPAucFKbLQLLzP8copDSxAeLzdVVJpM1opAAF
	JhsWX+NCsakRxS2q8d7COZxTTxBlGZvsV6Ss23M/3/yogFJcm0WpUex98FBcwSNaLC15C7h3P6U
	gIw8ugfaq7qwgL2atpqK+ywKqHvRIanrMb1PQZIk35VZsV
X-Received: by 2002:a05:6808:d49:b0:479:e869:5424 with SMTP id 5614622812f47-4868dc7df9bmr12485645b6e.19.1781037540345;
        Tue, 09 Jun 2026 13:39:00 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e6e78e7f9csm15313928a34.17.2026.06.09.13.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 13:38:59 -0700 (PDT)
Message-ID: <8bc8bd9c-2982-4186-809b-13f7b75f7fd4@riscstar.com>
Date: Tue, 9 Jun 2026 15:38:58 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 01/14] dt-bindings: net: qca,qca808x: Add
 regulator properties
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, bpf@vger.kernel.org,
 conor+dt@kernel.org
References: <20260605010022.968612-2-elder@riscstar.com>
 <20260606010120.590881F00893@smtp.kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260606010120.590881F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/5/26 8:01 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The device tree example incorrectly assigns a 1.8V regulator phandle to a 1.05V supply property.
> --

Impressive catch.  This will be fixed in the next version.

					-Alex

> commit 9408235f22241ddbd72a22ee2611a98eece3d7f2
> Author: Daniel Thompson <daniel@riscstar.com>
> 
> dt-bindings: net: qca,qca808x: Add regulator properties
> 
> This commit adds four power rail supply properties (avdd18, vdd, vdd18, and
> vdd125) to the QCA808x ethernet PHY device tree binding. It also updates the
> example section to demonstrate how to configure the power supplies.
> 
>> diff --git a/Documentation/devicetree/bindings/net/qca,qca808x.yaml b/Documentation/devicetree/bindings/net/qca,qca808x.yaml
>> index e2552655902a3..3c1b7eca33caf 100644
>> --- a/Documentation/devicetree/bindings/net/qca,qca808x.yaml
>> +++ b/Documentation/devicetree/bindings/net/qca,qca808x.yaml
> [ ... ]
>> @@ -25,6 +25,18 @@ properties:
>>       enum:
>>         - ethernet-phy-id004d.d101
>>   
>> +  avdd18-supply:
>> +    description: 1.8v analog power supply.
>> +
>> +  vdd-supply:
>> +    description: 1.05v power supply.
>> +
> [ ... ]
>> @@ -39,6 +51,8 @@ examples:
>>               compatible = "ethernet-phy-id004d.d101";
>>               reg = <0>;
>>   
>> +            vdd-supply = <&phy_vreg_1v8>;
>> +
> 
> [Severity: Low]
> Is this the intended phandle for the vdd-supply property in this example?
> 
> The property description defines vdd-supply as a 1.05v power supply, but the
> example assigns what appears to be a 1.8v regulator (&phy_vreg_1v8) to it.
> Could this discrepancy lead developers to copy-paste an overvoltage
> configuration into their actual board device trees?
> 
>>               leds {
>>                   #address-cells = <1>;
>>                   #size-cells = <0>;
> 

