Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A01317D6
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 03:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788491537; cv=none; b=VPkQ69iUGVRltHWXwY9nFaiK665xkWyc/RLcBAwbl9rip+iecMzff16caCrp7LP3x96y2o3fTso7K9H0WvsS2Lq2Jx6jzRtkQYHHmI/bK5JfxPGG57fa2gR0rASBX20v66J0sAl/EfwcB4DXmr26jB9R8r7FWA/zxihiGnsRsRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788491537; c=relaxed/simple;
	bh=Y95yniYLVZizFK9LcvuTZpHxT3C+HIs4lMFSHQEGUeU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kcgxKOKWu7nX4j6satHHuj+2CWlkxZdmlmopoxWe8D2QfUK7ZU4LUmEqObT5Dq5HcakeGFDCwgkA4Gg/y0pAxAdCZQIqi3vsUOB76vw2/k+pLZu4+DjTIQuBwqkQF2eqpgBSAm2ZowaHy4ViLgg2ojyW019SofJH4Bkz2Pwymh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YXa1PWzk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wd2gGfks; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YXa1PWzk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wd2gGfks"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6842l5dJ2473840
	for <devicetree@vger.kernel.org>; Fri, 4 Sep 2026 03:12:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JYxawr2n1gJxIiwBliti1lTRD1HZQn72h83Vvz9XPv8=; b=YXa1PWzkYa+PpBQn
	yuthV/+n/nwhMJa97ivv9cQNpOyPlzFI4yiMZgzn/I0VF0eweO1V5+DnPLtAaUHK
	DPnMlBRjPKq/U+m7OsqL+aNtLw6vBIrhkqkHtqFJIFyVEwsuQmZhtmsQV+uUxXBJ
	bmr/tAoa8/orQHhesVqwOmd3u7b0W0ltF5ysnAFmZY6OmRNJ1qUURWrkHz1EOybZ
	CzNdYgCQ9nOrLUd7pQZvZ0BGNVI2el1i85dk1XUkCedwr7lxitiOgDQ/2DAaLJZW
	jVp6tWNi9jcJM0HWZ2ZXZFlTZXpV66rpR7SKgFQh2f1O8N3TZjfFCv/904R6QMYu
	paJcJw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekmryy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 03:12:14 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8538a72b430so243957b3a.2
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 20:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788491533; x=1789096333; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JYxawr2n1gJxIiwBliti1lTRD1HZQn72h83Vvz9XPv8=;
        b=Wd2gGfksMUGl+GgZ6ZDLGMDdW06gh0GExCt0X5LaYbqz7L/dA0j+bwFughq3GFeqWn
         9BA29+ZdQ/LU1lT3/h2uIQXtS6U8HoF+rznLsMkD9Ll+TAyRvO/k+etzDixaUbLkrgdS
         aUllTqgQ3YL+hh5r1y7GWF7h1msShCC7SV6IqK1BZbDSk9hB2DJGUGb6gSwWAxc9pNb1
         31XCCrJMwFLigVowQcB5g4SJCpcMlAnTfiRfGWWSaYdalMUSp58h5yYbZV0rUqjrshcU
         aNRZuRGpPwYVSfM6zCVhS2XoXSBAxHyZOs9hM16GkwLA1v1XA78Vq8HKzjxQjvdG4su/
         ak+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788491533; x=1789096333;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JYxawr2n1gJxIiwBliti1lTRD1HZQn72h83Vvz9XPv8=;
        b=XA+SV//TdrZh6C1Bvp0dmwlt3fgGc98KRAveeTFI7A/28v8kdpRv6huf64MTEZi9Ru
         zgv9XNyf4/PoTDZANNNetoX7DQCe9QTHLXQCRhfl9gw8h6hZiU1xAivjWJEABIiC90kw
         wCnD9hAkRmApGsF4orOkaMJln6x2cG3gAsmnnhhE2M64vJOngR41Hz9vk/XSzTnvVgL7
         Mc/0Rn5NrRJSHpRwJkLOrCM/psklKFiTiIixGMxCJi3Xv9ZAN/Swhns4iwUREidihZOr
         FpXKCAxDcAojLcu0UPUVYNxZobyjk+Iu3cVqR8KfNooPAA/54VFjj+vD49V1smatgKSY
         GgGw==
X-Forwarded-Encrypted: i=1; AKwUvBz9hrkevyPaCkRvVKg4+a9HSkaSJXMgzNOyNSnAEZpfjzelvXd97W9vB9c1d/RpsXDiimpXpLLr+LSb@vger.kernel.org
X-Gm-Message-State: AFuF++kEFfc0ATGa8UjQ+6K/KxXPgp7+61Bcr93N4LMxv9vCstwW0/z8
	uoML8l9nv235iy0prJyuaHKsejP+g0uZ+jRr0oPdsWP+BWFjC89sgmoCmxg55nclJl5+7xb3vd8
	kahp2bDf36tzNYREWttNEQjKvBbqIYBSQ4BW75B0BSkuCT7sNKcUrWjFFiaLhPeLW
X-Gm-Gg: AYBFou3ipwFWmZ9Edytb26riiIrm+mBzuC91wiU7lt60mW6pNR7UIDpzr+wDZiHxZZn
	uOQP/EnP10vkwoQE+j2bvy6d6R/4Z/Ol0leNxghMpBpintA6mZn9Ec+shllGKNLb5GFaRHoVqSl
	jdVVH6ZWy0KLvoyMJlBZV7ZSQu8d+TANus4SvajcEwX1kDjhNGTzIPBs0iooKVPmUQ2D9NzokOQ
	9ukYZFYJSOL2k1PCcSElw/v8zTlQT6MdJEJ+htQ6SzJoSSzsF5yWxV5doaU0L99VAuqHH6i7yrJ
	7yP68AyKLr0m6O9VXeNay03aYZnhpECL9C5hX7TQfOLk8ZtOeAdaJXXDlhLUiDiNs7V1GHu2BEQ
	XUgEu50yghwZOejYe81gDfU7WzJgToEfhMCk18+o7smud4bg0Z5HBo2QweD61lcv2
X-Received: by 2002:a05:6a00:8c11:b0:847:9aa8:d3ce with SMTP id d2e1a72fcca58-861662d4cd9mr5413465b3a.2.1788491533049;
        Thu, 03 Sep 2026 20:12:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:8c11:b0:847:9aa8:d3ce with SMTP id d2e1a72fcca58-861662d4cd9mr5413384b3a.2.1788491532557;
        Thu, 03 Sep 2026 20:12:12 -0700 (PDT)
Received: from [10.133.33.207] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152e2f1e0sm581870b3a.36.2026.09.03.20.12.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 20:12:12 -0700 (PDT)
Message-ID: <460cc3a2-c9f8-493b-9958-9e0c9a80fdd6@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 11:12:05 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 09/15] arm_mpam: Fix MSC MMIO window size to use
 resource_size() instead of end - start
To: Ben Horgan <ben.horgan@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Conor Dooley <conor+dt@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        James Morse <james.morse@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, ganapatrao.kulkarni@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, devicetree@vger.kernel.org,
        driver-core@lists.linux.dev,
        Srivathsa L Rao
 <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei
 <huang.yiwei@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        linux-kernel@vger.kernel.org
References: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
 <20260811-mpam-resctrl-dt-knp-support-v1-9-ea6397bead59@oss.qualcomm.com>
 <93eac14a-5ee5-40c8-accf-f623cf0e76de@arm.com>
 <74b52fcc-10d0-4d45-8675-4a3431ff4b03@arm.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <74b52fcc-10d0-4d45-8675-4a3431ff4b03@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xzzku_ri2d6ZPytkEMzgzPoQI0Jxlf5b
X-Proofpoint-GUID: xzzku_ri2d6ZPytkEMzgzPoQI0Jxlf5b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDAyNyBTYWx0ZWRfX60jmMqHHGvGw
 FFMT6YM/mibnhTaIc6fDBzrNZjXUPNDRAOlyqXusZGGGHLKYWL3SVHs7/Td9ru0D8wz4h1/Gqck
 oirL24Ye9uyb6PUWXqivmm1sVhjbeQqlPzOuEy2FR0vWaOIrzkt14GTHgtKbEZggkVMN/I4Gnsd
 IVdPbHbQjEyadolGCJtraptA6JJu7gK0jHwVmuGYQ6RWlPwhmst5d7oxsbGTEwyIcC9ACB5hpfC
 0fKpLQrMaZcKUmV62t1N7xw0zYBnj0sMOPu7tcpHwywsRKun4TKH4hYaSvddTWUfcJvupIUXnix
 pF3XJ/BfA5fnjMg3EhQBNjBqpOQOTISfp3b8MRJIOSGpH0P82vwhARoVHUx1lctkQQYpIWXw4Ib
 7aJJxxn0d5NlWWramDrC9l0vQPLip6WXwU7FEadEbPymR7UlUZVe+57TPom7MPKnOiv4/zU7PD/
 p6EgdvZdmz+G39Sb57Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDAyNyBTYWx0ZWRfXyz0bYhVmBH6I
 nSQ04+jLiMGxo6LF6fX1BvHqpRfJ1LJ7gZT09boB2G3cGntz4xyYP2+xoM/MPsB+iFMD3RaEiU9
 8uC0e6Fxo3jkA7hxFHgijvdcDj9UKmw=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a9a370e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8
 a=ZptWdTKgE_tpimiw5rkA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040027



On 9/3/2026 9:23 PM, Ben Horgan wrote:
> Hi Yin,
> 
> On 03/09/2026 11:20, Ben Horgan wrote:
>> Hi Yin,
>>
>> On 11/08/2026 14:30, Yin Li wrote:
>>> struct resource uses an inclusive end address, so the correct size is
>>> end - start + 1. The previous calculation of end - start was off by one,
>>> resulting in a mapped window one byte smaller than the actual resource.
>>> Use resource_size() which correctly computes end - start + 1.
>>>
>>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>>
>> I just got a kernel ci report for this one which asks for tags:
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202609030809.ObirDhR3-lkp@intel.com/
>>
>> It doesn't look to give a useful fixes tag though. I'd go with this as that's where the error was
>> introduced.
>>
>> Fixes: f04046f2577a ("arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate")
>>
>> Looks good to me.
>>
>> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> 
> Scratch that. As Ilpo points out,[1], there is no functional bug but just some misleading naming
> which never the less would be good to fix. This does require > in the warnings becoming >= though
> and there would be no need for fixes tag. Do you agree with this analysis?
> 
> Thanks,
> 
> Ben
> 
> [1]
> https://lore.kernel.org/lkml/03055fbc-281f-4ed9-9282-4853d560e17f@arm.com/T/#mdb57d40c888ff4ce656a9d9a00ecf5d99466530c
> 
> 

Hi Ben,

Thanks, and thanks to Ilpo for the detailed analysis.

Agreed — the current code is functionally correct because 
mapped_hwpage_sz holds the last mapped byte (end - start) rather than 
the real size, and the ">" check matches that.
My patch switched it to resource_size() but left the check as ">", which 
actually breaks that balance and introduces a real off-by-one — the ">" 
needs to become ">=" once the size is accurate. So there's no functional 
bug in the original code, and no Fixes tag is needed.

I'll update the patch to switch to resource_size() and change the
corresponding ">" checks to ">=" together, so the naming becomes
accurate while keeping the behaviour unchanged. I'll also reword the
commit message to describe this as a naming/readability cleanup rather
than a bugfix.


>>
>> Thanks,
>>
>> Ben
>>
>>> ---
>>>   drivers/resctrl/mpam_devices.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>>> index 1e082fb60e30..5d1854d97371 100644
>>> --- a/drivers/resctrl/mpam_devices.c
>>> +++ b/drivers/resctrl/mpam_devices.c
>>> @@ -2296,7 +2296,7 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
>>>   			dev_err_once(dev, "Failed to map MSC base address\n");
>>>   			return ERR_CAST(io);
>>>   		}
>>> -		msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
>>> +		msc->mapped_hwpage_sz = resource_size(msc_res);
>>>   		msc->mapped_hwpage = io;
>>>   	} else {
>>>   		return ERR_PTR(-EINVAL);
>>>
>>
> 

-- 
Thx and BRs,
Yin

