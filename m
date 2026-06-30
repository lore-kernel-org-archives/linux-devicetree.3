Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733EF29BDBF
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 13:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782826335; cv=none; b=Up+fNgz1agCAu5s/f7tUCWyNOR/rFzWlwpqxgKY2po7R8r2L4ycRBXtd6XChARchuj7WfymOyeCoklIXWj7M2u9xQ+XSjQP31CpIMvA4jgEQGHgy03QV9wkbffL8Zh72oDETscdlwRHHYp5Tb+JPAy/cZRYn5EcpHG+0PaT0Vg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782826335; c=relaxed/simple;
	bh=xpPMmV2m6fv5jfNde38a5Ol4Pz7X2NWCQ/YN94erzc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HQDbRTZl8oJ0NwBBd87gnxGkpjIraH3DdhN9HRqFvHYLsDygcGv32Bna++H4cCjz+Y7vqZYUBiT2dKQdbWES5imOgKXvM84e11JI80E50udu+FDkV32oElgB+F+O41NvisJaqzWjh5VwUTtC8sjKfWFTZtXlYSSS4YR65NXP81Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HmQxxYiS; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HmQxxYiS"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aeb8cf8134so90827e87.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 06:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782826332; x=1783431132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3k0gXgFqIFH85+EiNZcDCFD94DA0SXlTQoMWB+Asgdc=;
        b=HmQxxYiSA9I3I84UF5tJvaZ9OzFJm6BEfoirCpUNuEjqlaLZlM1EAhsysznRY/m4mf
         PzqVTHZN+fr1oRqSWmDSEh5pQdW4qDQ82nLCyRnaix7onaiQ4J4OWXs+KxEtp5X/9xyj
         556m5Ptmthq5QQDsTPXQjqdvSD5n0EMF7UUsXxA78kqiKR+s926E+adgmi65GBIrjkrH
         yGheD0Hrkp0Fi7RznYdSQi1l+GK/WYvjcjxMHm53jM5GtuFmtnnGWB5saWSxbjni+JCz
         OXax9syPSHhl+TpNV6ZsAPNwhTUY3rIl4OpbHkPLoGNrbvTH/8LZcHDs4eZWFvyBnIlJ
         FCng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782826332; x=1783431132;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3k0gXgFqIFH85+EiNZcDCFD94DA0SXlTQoMWB+Asgdc=;
        b=q7b68tNj5N0m514Ccfd7mh7RC8ZEgYRpsqmNbd9/q9OW4Y4f/w3Dm/G7MsTpJIzOEW
         dKaZtHxm2NtG1mslGM9v3bKhuBdLRnD4KYsOlhladaHTu/R9G7Bk9Bm3UEp73ZRHCAk7
         uM5n+u2oT5E1RSTG/a034jj7HuKM9qGZC/VI8iZ2+UMzTLyIvNZ+uNW+DDvZxdylIEqE
         UioC4Os9qwsXPhiu5sfq2GtLwJhzahXQMSRgUu774rgwyQirND7dhRfOoXmorQqkADxb
         4RZW6gU87zHwoK4KNoRZRUB1MlnQh8nek0LhgrUN0PQyuruWZ6YQ6rSBnYg8tX03GP8G
         cqhQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp+pEtEj88IKiwOlOk9r4olSAHw4oysv76pIojac3dTNVSJChMpTq0uxnqMzZX2HXReO0lLYKR9nBsA@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn3M1c5v6g0DovVP44JrpbCCF0+Z2eF4wxOGhC0EmVOYMW1siY
	YaYJOiXdUTAfHeDQQo6CcYMjd7+LuxvCijrrWHwy5GYhWAYjoTeNbkJaoRYPs6TJ3VU=
X-Gm-Gg: AfdE7clUnFQgrsRD0HhRTVOfvV5ZAp3cngVXIuYPj4/QSVMZGt3NK16ZLyt/FHDlTbE
	LwTAuJG/i7KzN6yNSg9GKDnDqaO5C/r+kdt5ED1vrSPICSVM/rLuEE+6y86R9cmtYRM8AgvLJaZ
	To3weJJsz2P4fHkyIJHlyvjA8HKkOfleYKezNmvUm/EtWmX+IYRY0akYgD0PFqHKPWQ9PA4pqlh
	Ky6kCev11OaR9L97CaO8rRTWPq907Kz85hLwoOLHVbYhQgIKAv+l1U2qQ/lhp50McmsEyYC73Jn
	n0Io/B5TKlW7EFbcX4qy/unig+ZK/BadQx9EK0sPF4dhWhtoMQu8iaNmXmqCU1Av5YzSYs2RRHn
	X3X1gVXPWQHixz4sPNPrhOXnBIYs4EOoNKFoaAFHVEaRW9eGbtTiI1+C1+8LT8nyLR0yERiAc7G
	sIjLeoUH0uV+LRwgpUwbDIn3yC/2jlgzhbwyIN9bwPUfE1D4TGYNgdIjpDjH/DNZtTFGDm5ga9W
	GSXVg==
X-Received: by 2002:a05:6512:8396:b0:5ae:b9fd:a0b4 with SMTP id 2adb3069b0e04-5aebdbd8724mr438715e87.7.1782826331545;
        Tue, 30 Jun 2026 06:32:11 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aebe33ce5asm564051e87.21.2026.06.30.06.32.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 06:32:10 -0700 (PDT)
Message-ID: <0161b69d-62fb-46b8-a43a-df0c8af4956a@linaro.org>
Date: Tue, 30 Jun 2026 16:32:08 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: media: qcom: Add JPEG encoder binding
To: Bryan O'Donoghue <bod.linux@nxsw.ie>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, andersson@kernel.org, quic_vgarodia@quicinc.com,
 quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260629121750.3469292-1-atanas.filipov@oss.qualcomm.com>
 <20260629121750.3469292-3-atanas.filipov@oss.qualcomm.com>
 <_zZ7OLAmvphzTdIURTW71m_LKDwA-DEQ-a40gIiLYSqgDrdOOEf1bElz53zTbmSaDoqc8PDFyQXa7bycFaSTXw==@protonmail.internalid>
 <569539db-b079-439a-bd05-cb97c30141c1@linaro.org>
 <fbc018f5-c025-4747-85f2-53b45b0f0496@nxsw.ie>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <fbc018f5-c025-4747-85f2-53b45b0f0496@nxsw.ie>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/30/26 16:19, Bryan O'Donoghue wrote:
> On 29/06/2026 14:38, Vladimir Zapolskiy wrote:
>>> +                interconnects =
>>> +                    <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_CAMERA_CFG 0>,
>>> +                    <&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI_CH0 0>,
>>> +                    <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>,
>>> +                    <&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI_CH0 0>;
>>> +                interconnect-names = "cpu-cfg",
>>> +                                     "hf-mnoc",
>>> +                                     "sf-mnoc",
>>> +                                     "icp-mnoc";
>> Since the proper option for describing this hardware is to have it as
>> a child device tree node of CAMSS device tree node, which should serve
>> or be percepted as a bus, it makes no sense to repeat and moreover rename
>> bus/parent's resources, here is the list:
>>
>> * "hf_axi", "sf_axi", "core_ahb", "cpas_ahb" and "cnoc_axi" clocks,
>> * Titan GDSC power domain and all four interconnects.
>>
>> Only "jpeg" clock and iommus are left specific to the hardware description
>> of this IP under CAMSS, right? Thus, it should be reflected like this in
>> the dt description as well, and the complexity of shared resource management
>> has to be done in the driver, which might be tedious unfortunately, but
>> certainly doable.
> 
> JPEG should be able to vote for its individual NoC / CamNoC dependencies
> / requirements.

There is no individual interconnects, JPEG interconnects are equal to
bus/parent CAMSS ones.

> 
> Both GDSCs and interconnects should be described in the sub-node.

Why to do it in each child, if GDSCs and interconnects are CAMSS bus/domain
specific? There is no acceptable explanation so far.

> There's no functional linkage between CAMSS/IFE and JPEG - they are
> peers within the CAMSS power-island. Over time we will migrate to

I do not refer to any "functional linkage".

> individual nodes for IFE CSID and these too will appear inside of the
> CAMSS "bus" -> JPEG etc should describe their nocs and power-domains
> individually.
> 
> camss@X{
> 	camnoc@{}
> 	csid@{
> 		interconnects = <gem_noc>, <cam_noc>;
> 	};
> 	jpeg@ {
> 		interconnects = <gem_noc>, <cam_noc>;
> 	};
> 	ife@ {
> 		interconnects = <gem_noc>, <cam_noc>;
> 	};
> };

It makes sense only if the lists of interconnects are different, this
is not the case.

-- 
Best wishes,
Vladimir
