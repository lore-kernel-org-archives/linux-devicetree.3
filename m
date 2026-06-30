Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F9C30EF7E
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 21:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782853370; cv=none; b=OmV4OcxyepVEwUsATUCPSxpGQicU3eyF4D6VCPDR3/KxF8QU8u/hDP0BHjyVUKerzO/L/B/hJFecijN9+a8Kv/0U+Jrbk6p4bno2rSNyLuiGN2kuzYH+QKqRU431MkPZixv1sETbCnodoksKhTNPn2faYTBtDPh2ULo529Um+LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782853370; c=relaxed/simple;
	bh=am/loPvYVzdyGkax/MQb7j+deiZ5J2fIhC8Mv3BpdnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cCXzILjdRHNV+l+C7BZEB8pQKTlxLc4zsWj9YFaLUrYuwGpndKYlfR4FCbw/jSG4Dk2S1lxwGA2c61g9xSvWbrByg3N15fLUt2P0VqNnvrGrm/WfVGmOS50crKLPnRVHo8kMJi0IdKGYr/RkiPOs8C2+zZRQJAVDRG/emyAZdEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eZmKz5nk; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eZmKz5nk"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aeb99bc721so227852e87.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 14:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782853367; x=1783458167; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JBDyBnY0nJ7RYEFWtLzKwV49v5iiA3WOTXV6Ek5GG04=;
        b=eZmKz5nkrP8o7yh/aBVfRf8KW+qF3wfDn89cOEievA1uf9SzjM+Pdm2cFBzyRshy3w
         7RQMI1mBBW7c625Zeq+B8s3Z7ilBLCxizBscKHGLnTUD7ylmExciv/5H/qz7SsJvB+Da
         s1H3tZiLvXNli2bJaQl+SROwHeNVzeegfYhRXNcwMUgfg3FZAXxhzsIXIrmjwtaTROKV
         Zw2kBrt96NPxBmhuLDefSshUeB4rj8LkojRXxdhG+VKxY0+KpxZIOIJzPhiF/66XyK0F
         AvTDbpbDtuK11/LVU8+tcWZS5UxFNkCJTs4oTNC7dNG0PBwtJN0NSowKNsd+k0dtaTRe
         GMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782853367; x=1783458167;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JBDyBnY0nJ7RYEFWtLzKwV49v5iiA3WOTXV6Ek5GG04=;
        b=l2COQkBys47h+k2K/dfleiB/lSrMcZDMMb64/vbvsEzaUT/44XjWrmufO1jCi0J87s
         BHQbyhH9J4hzNSc5bT6C1o2SDbuYGRM3MZMfa9tNGU1cuqSDAv8LRY0V90ruzF70zBQW
         64zo+3hB93KOQ7zQEwa5cB6AF1Q2KOfVvYPshmtHE+Zf00rEvodMSFiSccEzIX5/k2th
         9gccOCy6n2DUkeBzmauc+/9d4EIePykALSOy5E4vWMTXApW3GM804TbqtN/qqggzu3uc
         F0LHJzP8egKaepEFgWFs/emb3zMKZid/z9HAGC2YVtBPAIi2BuxEZ2jEVjiRwzR04LQM
         C1Og==
X-Forwarded-Encrypted: i=1; AHgh+RoWh/YVQck8hsqvPpq2ovYr+nP5czb/rN1ti2VMagDOtmdhqpqHIyj9R21wuj+tJBao2RvvFe/97Hc2@vger.kernel.org
X-Gm-Message-State: AOJu0YzNm9gCUlf933aO7emU6cAvSLq1kin6knrNTWAkpOhqALCzzctG
	QXI6PrM1sXVPOeexap9rqCD5VUG+v7t1oxQ1iQcesK53Gy4tFj0eYlEFUHhcsjBZpiw=
X-Gm-Gg: AfdE7clcwxZAd/uCZcmbqlm4qv3OcnetSTcP7swgXjZgp9KIWUSjM7Bm21PvoyXdARl
	E3/KP23h0GoML4V1k63KYGvXoCgDk1TOLvVw+h3wFi5CbKJAyP2fEiyRypWsGGgJlbh3dnmgcjs
	XmtilQt7fFp+LVXw7scXBSlGgiOXj+MQJfe846DWJwVAv9h5XDT8BMoy8rKsK9MWPIGUBdQ8dQV
	zz5xwn8IkZaeC8Z5op3n24ZA1XnpfzGZXffplX+Nqd88Df3Oq3hgzUTVb7gb1MIJbOpsi/h3IIM
	VwMiS5FU716k1aF9ZgYVcfswIfSqoxsiNfnTgHRlF3EciymYkLG3vDUaDXTzxJiTNkVc5vfc0EI
	mbAaKXS2QvTK6oQ1Knx8MzY94PCugOuu/bXzxhCwJ98LCy7eqGhyJbfya00DoOGAMZye622G1X4
	+8O/aDtAgqSj+QxoBCixzrjb5Dmkgcxuw381EkYA4nLV+qyKSBKsbEb+AiZXprp2k7bxtHBr08X
	Y0tbQ==
X-Received: by 2002:a05:6512:8353:b0:5ae:a6fc:171c with SMTP id 2adb3069b0e04-5aebdba8241mr427628e87.3.1782853366845;
        Tue, 30 Jun 2026 14:02:46 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aebe4a884dsm814235e87.67.2026.06.30.14.02.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 14:02:45 -0700 (PDT)
Message-ID: <a77f2042-8dad-4b6c-bcd8-b317f464f0f3@linaro.org>
Date: Wed, 1 Jul 2026 00:02:45 +0300
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
 <IDwf-TUUNejblXqaFbAmpHIv49qp0PH0KB_H5HGcm1Wlj5zYf-q8Sota7H77GgDFcvhI2RHMCYmKRaDn0Q09fg==@protonmail.internalid>
 <0161b69d-62fb-46b8-a43a-df0c8af4956a@linaro.org>
 <257f9f48-4831-4f36-84c0-f7e6c257dd3a@nxsw.ie>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <257f9f48-4831-4f36-84c0-f7e6c257dd3a@nxsw.ie>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/30/26 23:24, Bryan O'Donoghue wrote:
> On 30/06/2026 14:32, Vladimir Zapolskiy wrote:
>> On 6/30/26 16:19, Bryan O'Donoghue wrote:
>>> On 29/06/2026 14:38, Vladimir Zapolskiy wrote:
>>>>> +                interconnects =
>>>>> +                    <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_CAMERA_CFG 0>,
>>>>> +                    <&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI_CH0 0>,
>>>>> +                    <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>,
>>>>> +                    <&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI_CH0 0>;
>>>>> +                interconnect-names = "cpu-cfg",
>>>>> +                                     "hf-mnoc",
>>>>> +                                     "sf-mnoc",
>>>>> +                                     "icp-mnoc";
>>>> Since the proper option for describing this hardware is to have it as
>>>> a child device tree node of CAMSS device tree node, which should serve
>>>> or be percepted as a bus, it makes no sense to repeat and moreover rename
>>>> bus/parent's resources, here is the list:
>>>>
>>>> * "hf_axi", "sf_axi", "core_ahb", "cpas_ahb" and "cnoc_axi" clocks,
>>>> * Titan GDSC power domain and all four interconnects.
>>>>
>>>> Only "jpeg" clock and iommus are left specific to the hardware description
>>>> of this IP under CAMSS, right? Thus, it should be reflected like this in
>>>> the dt description as well, and the complexity of shared resource management
>>>> has to be done in the driver, which might be tedious unfortunately, but
>>>> certainly doable.
>>>
>>> JPEG should be able to vote for its individual NoC / CamNoC dependencies
>>> / requirements.
>>
>> There is no individual interconnects, JPEG interconnects are equal to
>> bus/parent CAMSS ones.
> 
> Not true.

This is exactly what is present in the dt binding, if it has to be changed,
please report it to the author of the change.

> As a matter of fact, the JPEG encoder has no use-case for the ICP MNOC,
> now that I look at this again.
> 
> Even if the list is identical the clocks, bandwidth, opp tables
> represent individual consumers with individual votes.

I cannot parse "the clocks etc. represent individual consumers".

Anyway, it has no contradiction with what I've said above, all shared
"CAMSS bus" specific resources should get description in the CAMSS device
tree node, all individual subdevice resources should get description
in their own device tree nodes, that's so simple.

There might be no SM8250 CAMSS subcomponent, which operates without Titan
GDSC or cpas and bus clocks, then these are "CAMSS bus" resources, then it
is immediately known that every CAMSS child needs to acquire these resources
from the bus/parent, and it means there is no any single reason to repeat
them in each of 20 CAMSS subnodes.

>>>
>>> Both GDSCs and interconnects should be described in the sub-node.
>>
>> Why to do it in each child, if GDSCs and interconnects are CAMSS bus/domain
>> specific? There is no acceptable explanation so far.
> 
> As we've already established some of the power-domains are function
> specific - for example MXA in the PHYs.
> 

It has no contradiction with what I've said earlier.

>>> There's no functional linkage between CAMSS/IFE and JPEG - they are
>>> peers within the CAMSS power-island. Over time we will migrate to
>>
>> I do not refer to any "functional linkage".
>>
>>> individual nodes for IFE CSID and these too will appear inside of the
>>> CAMSS "bus" -> JPEG etc should describe their nocs and power-domains
>>> individually.
>>>
>>> camss@X{
>>> 	camnoc@{}
>>> 	csid@{
>>> 		interconnects = <gem_noc>, <cam_noc>;
>>> 	};
>>> 	jpeg@ {
>>> 		interconnects = <gem_noc>, <cam_noc>;
>>> 	};
>>> 	ife@ {
>>> 		interconnects = <gem_noc>, <cam_noc>;
>>> 	};
>>> };
>>
>> It makes sense only if the lists of interconnects are different, this
>> is not the case.

-- 
Best wishes,
Vladimir
