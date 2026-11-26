Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706955;
	b=DtdLpWwULF3vItbz8zB9TxXIpJxGbNK6ikkyvCSHiAZ/UipMnG+QHM3abfyoDdGztXnr
	 8BwfPF1Uv08YmDwNZOGxaZsSQ8XvrtNFeM/O6NBP5tiaXp1fzFHM67/y+HLESkPCdnzf2
	 r8CqnC8vTqUyNFXcy1O2Tv7mQPEnf2hzZnu0rFbEfeeujtr60Y2r8vsJRaiwsvXilEaMG
	 rM5+iAjUtFEe/ATFMP+DkpMisQCsuHg7NJhBaCErR0odhj4fuLpgCiA4F4/0xJtzhfadA
	 QkyA4Uo+3PxcF/faO8P8VXqv92Ehsrp2bpQs0rR4KuezlSoDd/UYXnn+NmTBZRRfaIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706955;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4Avc+sTpAvITn8tvFDLpyq/WRXcoXa74D7F5mNDMS3I=;
	b=ys+TYB0YdGJqhpKW4nvBBflxzDmjupfq3Owk/l7+qxgogU9Ykn0navaDA/RTGVGysm7Q
	 z+x0YEz65UKjCdWlD9Vkkac9ct7LxuivCe/7DCTufOeWgMRznls7CzmLvzc2/W34Nnsm9
	 fXMk0gzCnfgqFVGUEgp/RLKRfWBZJ5G9aWfP/dnDF56vKEXxAc8yfdNt9WZ4RE2ZeWqIY
	 /+TFgLYkaHC1b6qs0hhDsjthlfTFNIDOIEfmkckaEtVceCYrgFO4Ou0FYvV2hPEfNVa8Y
	 JyVjahUihJLM6n27x4khWqNjb2MOUtaXhiFgw+RbQZsrlV5iORrQuNy7/v/Nlxm12cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dqn0kUaS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="M/GUgSyl";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4937E606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 15:29:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4937E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dqn0kUaS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M/GUgSyl
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEV52k3664859
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 15:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Avc+sTpAvITn8tvFDLpyq/WRXcoXa74D7F5mNDMS3I=; b=dqn0kUaSSTo3y8pd
	o2AKQM9P8Ie52h+H8EoQescJqbHOWMLGQikInVhQLOoOhNa4+3N7ncCsaZOlZg4k
	7wUA3nrc6FVrxvf+i1m8+66lStpPC8CRFKR1JZBcml/F3VUS56A7f/11zwPSRWAY
	RQitCzMu37BgfoWn0/lWbdxKdRJkQP74qrYyJvsXzgqbzpB5O5ocoRagzbrDKyaf
	v4DY+DJ6lYWkajnB6GkDd0BDHNHLWGgDGZQHmYoYTiM5uPQZZ7XXdOpJLfPuHAmx
	71nibQIrw60kqn/AFbtGqfGTUUsGFcd8LWo1eOM7dOWGftcM0+3Xe1tc6ds7oVrr
	cJYcxg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6h7g9gga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 15:29:14 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5edfa7703ffso325151e0c.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 07:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795706953; x=1796311753; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Avc+sTpAvITn8tvFDLpyq/WRXcoXa74D7F5mNDMS3I=;
        b=M/GUgSylRCWxD5mNp5G1i66XNGjIhbXUwCBrTh15lLw4RL/DwJ1K8Pj4oFYx5q8aNM
         lyG90mOBr05zvm4ZtkNdhIA5xnMVuPR5Hm14aQP3SG3jxKjFzf7yEAV/VZHLRZ4TDY59
         wQDgl/xCFcYiKFF7n7vfxYshrSZd3PVs7VaaR0XEd29U5sxYSNZo9RGa+5S2tr/65OLQ
         V55hDEnSqd0voK0JhN4LsYELqo+1FdFfPyI7atKvV8clDvdMQhrZClzTNjtc3ApVGoq+
         Sez+AoZmOri0emrw3K0BQCWKM44/0WUU5pv31qQd03dk4HgQizN4HotwKacFkoMtAb62
         IfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706953; x=1796311753;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Avc+sTpAvITn8tvFDLpyq/WRXcoXa74D7F5mNDMS3I=;
        b=zJYtrSej9o+ZzWgVu1q3nqjH4FlMFl/HvOY3BPaCSMK2gDCCne/vZuUWgGDXRpVYcC
         N8zTNkgDeA0Rpr6AKpwH6IqzeIs1+C9TfABiy4ZWqwLP2TsySVYvgSm4Hz36f7MHJI2P
         jdmVGCWaAzuOaS3vPxrn6MU+uDwbsdBiVjaetCnDB5vrGcOgT2Yj6huVboWlktNsdjFT
         Ew/JAXyNvpG0Pk3MF7/PE5mKPzhWojT7UEgUZAcLR8bSE3ofio87Kq+zd9ku1ScpgkxB
         t9ma1ghjSHbvrdn62QVrqoJycTz1GoO8FufzA5/v8JajtMh8xuGvWiGGiUBjRGMTbEL/
         hRKg==
X-Forwarded-Encrypted: i=1; AL+hErFIEkb/wOkExPYx2zgHU6OUYnjH1Tt7dij8ssNfvjDRmUP+1bsAU789dTX8k+Xq8l+TQAt8AvUGqw+C@vger.kernel.org
X-Gm-Message-State: APuU4Z/zbovc6sNx426WDUNcdJT2HGeMvx2QIMU5FT87m8RSABJUTi/Q
	iC74KclvlVT6N1vGvwNY6lUaFpAapBP8CfF1an71WkAbj9oRaHa84axXi0AOHGYTate8w6gwEvS
	qxoOsxSvTkKqbR3oEnpzz0/cKaPYl5AAERaKn0DvMX3ia0a7XZ99FCN+VwFzo1IhB
X-Gm-Gg: AZFdTZf+UYZ/47BimEA0HxC0Sngt6EELz6Ryu02E5D9US1rspBLhf0WbaIsu+dj0+pS
	pPcc1y7MRx20Aj9Gpy++06rMnuX6mM9DNsNC10stV7D2P6K0nkXAGVWvUMYdhpqKTrqiQTNsI/c
	T3uzHvmLwq8+rH6YwcU6q81Yf0LHMLEIeb/bpgHjdoJY1MzAXRS/Glrspw/VBA9Z3bB6v8Y3daE
	vK0mNBnxQwnVo7eGsRndxp3rULRXxvfutzEfWj/ZFGNyq/JSBTa9YhIQkAFzMzYVHvEPRzUiZi9
	3U9Ax3PrjgBOMzf+sC7ACCkF1EMuZ9PhyDSFYt3PAHMrx+yvT4aYatwszu4sVzGYmWxCCz+dR54
	pHIYBryQe3ceMUSpfVWEE9EhsAKoP6PgrI0TrLEZJsitcF2W4ofiKjvuN6AUSE46VEY00ES4=
X-Received: by 2002:a05:6122:2b1:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5ee8ad0ec78mr13671370e0c.0.1795706953477;
        Thu, 26 Nov 2026 07:29:13 -0800 (PST)
X-Received: by 2002:a05:6122:2b1:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5ee8ad0ec78mr13671332e0c.0.1795706953035;
        Thu, 26 Nov 2026 07:29:13 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b01e242sm739907166b.82.2026.11.26.07.29.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:29:12 -0800 (PST)
Message-ID: <6962c4ef-ad14-4984-9df4-4624c4bb50ae@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:29:08 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] drm/msm/a6xx: Add Adreno 753 support
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Shivam Rawat <shivrawa@qti.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
References: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
 <20261118-nord-gpu1-v2-1-8d6d9908b7c5@oss.qualcomm.com>
 <a005f8a1-76a2-46ce-b328-2063bc307758@oss.qualcomm.com>
 <70651641-b264-43cc-a745-178ef2b02680@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <70651641-b264-43cc-a745-178ef2b02680@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7_CxmkZA54sqRxtLbRxb5U1C46Ojr7ik
X-Proofpoint-GUID: 7_CxmkZA54sqRxtLbRxb5U1C46Ojr7ik
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA2MCBTYWx0ZWRfX9nbmFH9A5Ux8
 joz9XBjmfT8VYGu4Rvvzri34uE4R+bwuXOVP+77Wh85yqP5UWOwPos5cFDN4kUhmeWpccyF1ODz
 D4al/aPFHPHwuU6D8Z1dx1PSvgdPbo/XH7s1tzWuOe+1LZagRUj/3HlCtCBRAqdryzJBqnnlUG+
 35jGOO7NPr7rddEWMbCITH4zyRDeOIOxGdo/kdkUUFQltuOKggAaDkAv3W+3x3u/xmvfxynJrcw
 AQ3O67aIpDihyu2arKVo6nR6UllPJy5OI4yBXafLYjPvrjshGOKL0UjMaP/J8yt0ReoVN9WkkYq
 /7yJ8ej88lFZvo2DggMcV4WZnDhm8NzUwLncGQNh3KiLYPwxp3msr7DXLvrtEPuMeESkVQos+UE
 PRXaNH9B94RVNsfbUE8EmFBO3au5T7z7QyL8MY/YsPUzM49LJzm6ByGXWk2hDIzI/D0kyU1JDtE
 UwVzbfwKLDZOcUo2g/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA2MCBTYWx0ZWRfX9dAABQ38lkYi
 GFgpOlJTnTNWuWBt2oPhqr0Fv0scubwrO/jaZZAJkeO0z5uucXbBm61scSuzQIpLibaYnibZilZ
 6MjmOKYJOWPqr3bNkKt0NICNywquG1I=
X-Authority-Analysis: v=2.4 cv=L4GI0OT8 c=1 sm=1 tr=0 ts=6b08504a cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Ljcxbz6TTgZqL_1UImsA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260060

On 11/26/26 3:53 PM, Akhil P Oommen wrote:
> 
> 
> On 11/26/2026 8:17 PM, Konrad Dybcio wrote:
>> On 11/18/26 12:00 AM, Akhil P Oommen wrote:
>>> From: Shivam Rawat <shivrawa@qti.qualcomm.com>
>>>
>>> Adreno 753 is the primary GPU in the Qualcomm Nord SoC and belongs to
>>> the A7xx Gen3 family. It is derived from A750 and shares the same
>>> IP-level configuration: protected registers, pwrup/IFPC register lists,
>>> GBIF CX registers, gmu_cgc_mode, 3MB GMEM, bus BCMs and preemption
>>> record size. The differences visible to the KMD are the chip id
>>> (0x43051701), the GMU chip id (0x70d0000) and the gen71300 SQE and GMU
>>> firmware.
>>
>> [...]
>>
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> @@ -651,6 +651,9 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
>>>  	if (!(adreno_gpu->info->a6xx->hwcg || adreno_is_a7xx(adreno_gpu)))
>>>  		return;
>>>  
>>> +	if (adreno_is_a753(adreno_gpu))
>>> +		state = false;
>>
>> Is that intended?
> 
> yes. It is mentioned in the commit text.

Right, it says 'it's not working at the moment' - are we going to
have a moment where it works?

Konrad
