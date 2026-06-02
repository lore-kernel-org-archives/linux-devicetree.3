Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35548395D8E
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 21:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780434031; cv=none; b=G9iXdTbQTMyVbGk3PU06M14cYJjs30ikcZVy/Q5jChCskn8DFoMZ7MZudlibKdnH/NryMO5Q4eY/2tLq319Wi3cgcp+2DhDzah10VudPBO/yCtCu3+XsG5w9HjFqgpSb1fYrsOU/bZOD5e+V5If9VJIChFVFuyYfH4whV4TuxRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780434031; c=relaxed/simple;
	bh=uvhufSHkS27pkk5zPIVNeG5TbVytzxmiQf16IumQwvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DItYtQ2vhQZcDoHn5FtLKVh5ZuaMiKZpd8kCmoz8LDM7hBTee9qS8X+dtSZQuZEktcZfz3ulJYluTinCUhr6eVyQPVoABHgWAKeQmeGLI2mqq+Besr2CXlwfpHrk1rfrlGGyWSh/O/k2aenPTOXiqGpfQaVPysCvOx/cRghIus8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YF2xCCuJ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YF2xCCuJ"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45e9f4a3510so6917207f8f.1
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 14:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780434029; x=1781038829; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o3xo5dhddNfd1GteqLJrkhqAoPlpEA1sqWA6MOtGTrE=;
        b=YF2xCCuJxynz08ycnNg6UkGnNlwN05tSjivjUi6jtdz29GiqQFZJScpt1NiN4daywK
         bJzpU7BKkgtjHO0/WDpfCQBHm9+Y4mOt5Zkzggh8aXQgojDIrr8SlZImvuI/rEmU+k/N
         dsY8DchWBwumWwSe4RDNVzDjOZ7A/A3rwWmPO9vtIrAWhw6PZDVexwu85JyBuk6s34T6
         XEdGt6WD67CL5/X5TRlymbFq41L/kdsx4i6Wt1TP8/4jZJoXihOJU2lba3CwkO5S28Jd
         TMrw06kE7NntZRrgMS1lE8bf6rbDBERJEklUaTnkLOpvqDCHZ6ur3rM6HsSs3IqheaK7
         cppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780434029; x=1781038829;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o3xo5dhddNfd1GteqLJrkhqAoPlpEA1sqWA6MOtGTrE=;
        b=TTvU8PYhWP6sUvD3KBCI6M8ujw/jt8mkN2lmB1U1z7YlJ6aUJ1fSn7JMxjzZoxVihI
         IK8Jn0BRBh/xQrDKVkK47O3QNqNqx/S0cngXqFfxPX5o0VGYix3FNlFuIJZgAS4hTjzA
         dchgwP+GzMrD+5mVPL+nLFwMTeFh9W4TveynZNYvoKZXiyPXnwEBVwmvKuIRgG4Ae+wz
         ppZV0fyOGiPCnMldWwlIDIBmeKcCguVC1yMMFWrqchS1FdwyH+RyBeBavGVg0ZJKNbJA
         6ukD+4b6dMJkSFfPnE4brO2Irs+MqYU/cITxOcf1pwg/mc6V8wqEcldYxpH6lxSRftY9
         z2xA==
X-Forwarded-Encrypted: i=1; AFNElJ/PF8LQl0KAwgqf12xonV3YOB9rQfa242n37C4KUm/2m1ti2RD/JOiMk6LBllYqOt/SK11RWoLjpMW0@vger.kernel.org
X-Gm-Message-State: AOJu0YxPrA1/Sdrq6bEh/NPDeLepvUXIrTCrTSaP04dvYdkaEMXRxYrG
	59RPQLm5sbViMdDWbe3yDrgkqxcUQy6Z/Y/9O9UiVuJoywM/MvbOR3C0rTiFtXz8spU=
X-Gm-Gg: Acq92OE04u0CjMmkEaHamK1UMimqgL3jhMwo6LivFU6vUSy3BZ8po3DnLfxJCyWP6Ec
	+rjhz07ORs42z+xLHk6pZvveJCCZmg0x93JNdqv00iARzlW1WQ3iSpiSVIVTAv5Bpfj46UmqKQP
	ezNNI4KPUtbGtKp0siZ6JGaUeGb9BW0kS51dUCarobp+fQiX7KCe+LjXEEseN/q1LQaie3sm2og
	SWCYkUri4FB68QllczQIjKBs8Zn3vqvygB4xx3gQnPE4BNWatT6z0CozOqtALtnLmhZ8VoPH5Om
	8jVQZyYEPnFMwdtkrsaSzV2JnCH1GL9vcMsaG9YgTpayJ4HRsW9JHxP938As9jstq3Z3eSoWcDc
	+Hd7NoVQdY1DTj6LP6TvUsGG3yEEqphJO/86WacCije3jI1npyFmPvRoinNHCmiYzUYL/Xu077E
	EfmPKeQDbWb41U4D2ObOHGRbfpMtxJvCevGxIJtsKyjGcZ
X-Received: by 2002:a05:600c:4513:b0:48e:7854:1608 with SMTP id 5b1f17b1804b1-490b5fe9bd8mr6349125e9.25.1780434028575;
        Tue, 02 Jun 2026 14:00:28 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.42.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6d16f0csm1316135e9.15.2026.06.02.14.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 14:00:27 -0700 (PDT)
Message-ID: <d45f3000-35e7-4f65-b9fe-5348105abb0f@linaro.org>
Date: Tue, 2 Jun 2026 22:00:26 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Frank Li <Frank.li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-1-a85668459521@linaro.org>
 <ah9DMPcKUaTm324I@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <ah9DMPcKUaTm324I@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/06/2026 21:55, Frank Li wrote:
> phy {
> 	...
> }
> 
> csi2 {
> 	phy=<&phy>;
> 
> 	port@0: {
> 	}
> 	...
> }

Agreed.

However, we also want to support "split-mode" which is a special mode of 
this PHY where two sensors can be connected to one CSIPHY.

After a lot of debate adding ports/endpoints to the CSIPHY itself has 
been pretty much settled on.

---
bod
