Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6C73587DE
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 15:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783265349; cv=none; b=S14zRziejJt1p0pjF3CxQJlsMfV/1jkudWpxOqNkgk4xQ1nIIKLPVk65ZHwiUQ7VPv4mIZ8F3xaDFqHUN0BKOOCkUHbPixXOdWevnypbNcnjjRHIra4+7Sej6rH+747Mk5PwE3n2mXmigx34n5C0k8D7vn5Zz7Lln6zE1RsuQEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783265349; c=relaxed/simple;
	bh=exC+UdUO3XeyXvyzztH8ExhjvNdHt5vRxl1URazO7nE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ivCvha6NjYbu99p21B19ip26qeAAJaWHjAAbzZo0Pryq/JtK+8f0pUta/zGIxZOsAN9YSDpheqOgSNxJSoX4PybCgenE6kdHvwceZezqUY6cmky62/5t7j52ARnFFj6oJ+t/Mkz+/4ElUf7zJDdOGjTtgCmkBk0J8lHADW/iN70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lSQ3nnkF; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lSQ3nnkF"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-380cda7f00cso1712186a91.0
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 08:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783265348; x=1783870148; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7L1YMX25uctPYMxza+CMs3tBM6l8yVba4bYt4/Eab2A=;
        b=lSQ3nnkFXV1vApXciTcjqt0n/oLxmgI+lPfFTBgvP0+fDUvhV0PY6YNnM0WafDAwQQ
         c+MUZZ6HH3PtC0xRTIjd2OVHhY+ojPUYw1P1v5HNYmW0GHaLV9oIX404UJbRLqW1RPTr
         jTta2lRjlyFNE7EEnaNX5cfZvHuIpgBl6L+DgCoDFlSMfrZV2he6geIpN3CLp1otMKXz
         PjpyMWYkxwFI0jfzuddZY3JCw5bJxFJjbROnz5qbMd07Ra+Mtsv16XSSlljDT/xNiHlV
         Y9zNPLdg2oMuE3hi5ky5D1KojGx4D6oErI4vEVmtNq6mSs17HSHBclrchTYR5aPnJSkS
         wmzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783265348; x=1783870148;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7L1YMX25uctPYMxza+CMs3tBM6l8yVba4bYt4/Eab2A=;
        b=ndBWhX3QDlNjhYo30UQqCzKo5QoG3GjGS4BEwtb7vsLM5O1DAXZIo1natvBs0tC50g
         0uAW0wZR/aq/p1MltM1tUPouqtl8gO5fB5uCDrslnQ7zF/qIpOWKqe5QaUCC5Af4tZUy
         MSJtuDJc5Aif+wvTJ0Vef4f+YfRbLS8aN/rnfcsJgid7gN3voJ4NzGrzvOXZZOuWQZpd
         RZwhCiYRrN5qwT4xgaPjiv/vqEsG910mklcWx3zIP3A1zU+WfmaU9a0SnkxQ4Nbu9CuG
         wrqsOLelPBE0X+QqlY/j6kP7vMEnVsNyYWnhxjz+jfnyv2dK5fTQantUgMR0I6IxJm11
         kDCw==
X-Forwarded-Encrypted: i=1; AHgh+RqovYa2xcDdF0pwl0nsQpzCiGgDX3oDD/DfXRQ7vxzAKz5mgZG/2KtI9O3KHxtWR9GMToJN/c4vMw6a@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1LzlCPgETyp/l8AexU0yoE41K17lDInTgGAafggNxtFDfcJeB
	9wa2HNZWav2682omPpq/F1gr9yihRbP4sAcZPutu//L5xGk813w2lI+Fb/za2gdNpZ8=
X-Gm-Gg: AfdE7cn8MXc1sBGvyAiPYCF/qOXD/CKhpvjo0sXdC3O0gy2DUElPSSi+vGXRBuNbmt2
	2Wi9YPFdEercMVOfnxAF82BDMHgOYg+J/7cJjrDFdaj+jQQRYDK5bLS5bdm1NBa2ugVRJGreo3L
	BK9xgeYJw3ldVEUMLmF+Ew5Y1XblMWG1lZan4LTTBxWtmG7Cl4ufsHKX3hLXds8v4lM9l3BXFjA
	S62WhdWB5LIViqjeLpe3E02sSIFSab+ZbF5/thLS0CWmL2yzKLoksvbOjqThIkBPZXvuES84RvP
	Z1BwQQN1gvg8IIkAETZLA2jH8V+SiKCIsZGqsHRRf7/X/SlmkXWr+A4berf9lPNk9XlLLOtweUg
	CPaneoQQ6xtYR/5gXVPp7mFeIj9maLg2GM6mhSxxehm6cVAoDCuELalTWBUgc219qSwY5D/yJjY
	Pz7NUOwUAZ1SUBpSWt6+6bm8IXPPxs29WIdT2ObIE=
X-Received: by 2002:a17:90b:590c:b0:37f:9cdf:f03b with SMTP id 98e67ed59e1d1-3829f5e72d3mr6328124a91.30.1783265347624;
        Sun, 05 Jul 2026 08:29:07 -0700 (PDT)
Received: from [192.168.1.91] (cwgw.codeweavers.com. [4.36.164.2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f38ee1333sm27531956eec.24.2026.07.05.08.29.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 08:29:07 -0700 (PDT)
Message-ID: <13138cbb-815d-46b1-aa82-cca6e44878a1@gmail.com>
Date: Sun, 5 Jul 2026 23:29:00 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Kaipeng Zeng <kaipeng94@gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add support for Acer Swift Go Pro
 AI (SFA14-11)
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org, konradybcio@kernel.org, andersson@kernel.org
References: <20260702063156.35169-1-kaipeng94@gmail.com>
 <20260702063156.35169-3-kaipeng94@gmail.com>
 <5791feda-226a-4a22-a79e-e6b72be141b8@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <5791feda-226a-4a22-a79e-e6b72be141b8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Hi Konrad,

On 7/2/26 19:45, Konrad Dybcio wrote:
> On 7/2/26 8:31 AM, Kaipeng Zeng wrote:
>> +	wcd938x: audio-codec {
>
> Nodes should be sorted - by 'reg' and unit address if there's one,
> by name if there isn't (minus some special cases like GPIOs), see:
>
> https://docs.kernel.org/devicetree/bindings/dts-coding-style.html
>
>> +		compatible = "qcom,wcd9385-codec";
>
>
>> +
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&wcd_default>;
>
> property-n
> property-names
>
> in this order, file-wide, please
>

Got it, I will fix the property order file-wide.
Should I sort all nodes, including those copied from the x1-crd.dtsi?
For example, vph_pwr is inserted between two vreg_* nodes in
x1-crd.dtsi.

> [...]
>
>> +&apps_rsc {
>> +	regulators-0 {
>> +		compatible = "qcom,pm8550-rpmh-regulators";
>> +		qcom,pmic-id = "b";
>
> Have you verified this against the DSDT of your device? Incorrect
> settings may lead to hw damage
>
> [...]
>

Thank you for pointing this out, I had not verified this before.
Looking inside the DSDT, I found some "PMICVREGVOTE" packages that list
a value as the required voltage.
And I need to check if any required voltage falls outside the
range set by DTS. Is that correct?
However, some PPP_RESOURCE_ID_* seem to be mentioned only and lack a 
specific voltage.
For these, should I retain the original value (from x1e80100-crd.dtsi),
or is there another way to determine their correct ranges?

>> +&iris {
>> +	status = "okay";
>
> You need to specify a firmare path
>

I will add a firmware path.
But since the firmware of this device is not archived by linux-firmware, 
is it proper to use "qcom/x1e80100/ACER/SFA14-11/*.mbn" as the firmware 
path?
Currently, I use it for all firmware paths.

> Konrad

Thank you again for your helpful replies!


