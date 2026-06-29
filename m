Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8373FF8AE
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 12:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782735521; cv=none; b=qawVqEreaiB9ng8LXCmmI++lyL3rrE2M7XdBXotM/J6SSo1o3UP57UphL1JhY8nn0zz7vJi78Z7C5UXPbNIGnXk98hODqZthnsyeKzRcE/5auF0qPEP5wsJjzum0yEGxrYBKVf8rjyz4lkOxYmB/ls3YoHk3SWUdqWZc5OuyP8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782735521; c=relaxed/simple;
	bh=o32en7Hx2ax50iG1AuxYbjYfAwkfTF+FDEJ2dBWHsGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BZyjvOzRXaKmWfFzvHUG4pt14KvE1jLzzVkxeO+h7cnE/R32SksD00W0GGLhGJg8wxC87JBT23PrZQIeO2LFWqLJUiJfjGuJ+HNWzuNlOhLKCq8rXsV1ZFPEIu0VGdgCgwCoEzN3E8jJqk+puoV6t01O3ebPBsNFlXQTvIG9miI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YqsWHR55; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BdhtUZFW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YqsWHR55";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BdhtUZFW"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASpev2601110
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 12:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dTFF2lL8qXXy5msaGXAgnP5dRIvRf4GaK1lLNo891d0=; b=YqsWHR552fGbZw0W
	KNVwft65U1+B9mh01kl7P718io5yknr+9lOK6TWzyNWVv1JaUeCWFmyynW9syh7Z
	65fTjHFKSC2jF10C3N5QG+DDsZDLt9r7Jozk2mmPRgEcmhnPY2u7OiMssb2KR3DF
	wWg9SjMKLifmuJlRV3HLLR6T26d5pUJQwvBnoX+rSNtBQsNlDq6LocqH8d67O/6a
	mDenWNxHYTAOaLNsdRbC/xcoLMSZwiXCp6fyM+GrDPicVhgodnTFt75fNXYxxtqq
	FvkTYFzkVFauQK2cSXqq8KFZuMY5FkgiNMpQeQlfsJPWFI3tYr+9oDu82NIrjHPZ
	dDJRsg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nnw8re4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 12:18:39 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bda959ebcaso31676e0c.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782735518; x=1783340318; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dTFF2lL8qXXy5msaGXAgnP5dRIvRf4GaK1lLNo891d0=;
        b=BdhtUZFWhSyA3UowaNUI8fXqp+6RtvjdW3pKPrZ8spWpU1LLKsS9y8e6l7h6q27mvA
         nLMoiiZw6R1gta74ZkfbdFK+v+XF/4WeFRtxvG9S5tH8u6xSa1mkqKyqgAv9DihG+TH3
         3MRh+N4Uw9fJJsMsNK6h0wdo8a3TOj35mQtFfdYkn8wDR0UArqUjIfjnjlHPGhuj73IH
         G2w/ct/PryRFkEbxoNnDAr0xF1XQVSYxozdQZMxCVJsU8Jo5QueHdS0+qxTvq2Eztczq
         gNAaVeV6My6NIFcWMf5UUSazH79NrDKL9EpyeyC0CF5aOY/n0BPsDWJ/bXImkQgqM85i
         CEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782735518; x=1783340318;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dTFF2lL8qXXy5msaGXAgnP5dRIvRf4GaK1lLNo891d0=;
        b=ADoZoHZLi+SVyM7InL8YbW39e7/MyrzZzEZtrjs+lpR6QN+n/Nti/IChqt1d7+H9Cw
         fKVudKkTa9BaKXCy0cL4rSjHsv6+fNtFeNQuSuRiGek6mkk/2I4V2zIwcloil36WOycH
         cJpMSZuum4NHw0TvHumbVtQlzoH6gJcoEsNRwlAtRQysb+CvY4NMcYTsDXPl6nqYDswL
         rUOnRl4HPnsACM4ZSOfnJvwRev9Pn/5GSQKSTH45bdzZU4ZgeYfKnrEmM+UVMuMDYU0w
         wGQwDB+ZVcKeYgxGjDz5DWVzQlRgLl9ic25W4iA1Ca2s/GzkGJXhwg35kFzi7ZGdRU4Z
         Ae2A==
X-Forwarded-Encrypted: i=1; AHgh+RoVi+gv7ruxlq2XdOVRCK3aVpekZgLogCNGdxt8JgiudmIBKZo5Mmclfh3yjdstlUzP3Z66ik2+xHSl@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1nG3hBEEpNIG0o9s2PpPknf/siGLERaGffgbu/Bylm5xNpHLI
	+CcudQfJP1zjV3F1QUTxmtEzaiWWvXp1y5mBQSzalzukA9nk54JBbrNFSsSS1PfWWl3nZ8Ot8X8
	OdlgQAp7geag6HFjjx39MGP6gxrt1uT8I4I4lvlUQFnOUbjuwERImpU3sU32tOXn4VqM+1DiN
X-Gm-Gg: AfdE7clVWUO0SiR5YwDb1qkRvXlP6FFezgRGuCPPUQRrjFch2y10/c0gn3UEqsDQi5G
	Sp4+ZSMdUt2649wVFTy5D5jQ46pkk+TEOvQLH+jMxMYjQjdZZ3GcYvRb2k+ZFPWtxLSFCPYJneW
	d8ExM3+8XCd5eqcWugT//uzXOlpdEaz4UBEXhP8Z/Ob98UgneJyVqvjea8fgiG8lzfok/XuxH2C
	TfLu0fO3PYYFz8fo0H6r424eaoLlw07Co76hFXwihR3dsE1LkJz0YgIb2bmhwgh/5HQMJUfxXhX
	xzc3R1gXvmRaGRbtgOkxDJEcgmiEVzS0hISudisagOlEv0wEikCs1w7njDbyPSVqH0a7RbX5fnU
	pRg9Q6SuS6fexBRJi4ZVuYcuVvYKkn1ioPs0=
X-Received: by 2002:a05:6102:32cd:b0:739:64ad:bf4e with SMTP id ada2fe7eead31-73964adc4e6mr249537137.7.1782735518219;
        Mon, 29 Jun 2026 05:18:38 -0700 (PDT)
X-Received: by 2002:a05:6102:32cd:b0:739:64ad:bf4e with SMTP id ada2fe7eead31-73964adc4e6mr249524137.7.1782735517777;
        Mon, 29 Jun 2026 05:18:37 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69848e5ebc0sm3117738a12.3.2026.06.29.05.18.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 05:18:36 -0700 (PDT)
Message-ID: <f2c68d67-1b12-40b3-8097-5b863d7710ac@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 14:18:35 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] phy: qcom: qmp-pcie: Add vdda-refgen supply
 support for Glymur
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260623-phy_refgen-v2-0-4d15983bf91d@oss.qualcomm.com>
 <8811c181-9caf-4797-8e17-52311702e292@oss.qualcomm.com>
 <akJhrpyMuLnoXzJM@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <akJhrpyMuLnoXzJM@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwMSBTYWx0ZWRfX14OEcUBEoF4P
 6E0E2pU+iOMAMdmSYy9vWKaLScpF6muaVH6Rs4deWjW9f3rYFSU9xcBYrE8fuOZYpCXwbjsE+RT
 gCiZ5gxbyV+3QWynzuUXCDqnUudXHd0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwMSBTYWx0ZWRfX/vPg/D4ju/c1
 OyCGlY5neEUzO5HN88Z4l81XKbd9d3WgzUIDLEjsD+2eNCDr1O2dRS1jtk09SiRfVX7XAdJy1OR
 HxwAu76/QTmgTUx+89kk8Of/NrAtxyblx/nA5ZfPypw3SZch0p8IvrEpS1W7JhNV9TRPWRTzRyG
 AcXfuVLAE68LkOnag6/ag9nMcwCj88/Cvp6JxYivFZKm40eA+8ngSYC3b/mlJ0hLr13w7WvNQzk
 5QBWEgXC5d20kMnndpi1RSQ25y/OqYTqDkWnuqgoQqi/xQHq0iNRZmKJmnRm682JKzEHb5Tx/zn
 ZrU3H5wh1CRi7mgP3mbndfYRGPfTiX6JJTql1Sdv47pgxK63/flKuQdhL/ZHmrvHM+tHa8yMny0
 Sp5CjBT21/PFV0N4IjnQi8NpOlVkVnPeK+og1eZeZmOoDWB5IkpT76bsjjSF8dHTtdtPnQKuVN4
 utqAKzT/NJpP3Tx/M7A==
X-Proofpoint-GUID: wIqFymL4vKAawYZXSBSvejkLy9hNnZlT
X-Authority-Analysis: v=2.4 cv=cefiaHDM c=1 sm=1 tr=0 ts=6a42629f cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=x4UBAUAyasPmGnV1h00A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: wIqFymL4vKAawYZXSBSvejkLy9hNnZlT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290101

On 6/29/26 2:14 PM, Qiang Yu wrote:
> On Mon, Jun 29, 2026 at 12:51:55PM +0200, Konrad Dybcio wrote:
>> On 6/23/26 3:05 PM, Qiang Yu wrote:
>>> The PCIe QMP PHYs on Glymur require both refgen for stable reference
>>> voltage and qref for stable reference clock. The refgen requires two power
>>> supplies: vdda-refgen0p9 and vdda-refgen1p2.
>>>
>>> can be extended in the future.
>>>
>>> This series creates a Glymur-specific supply list including the refgen
>>> supplies and updates both Gen5x4 and Gen4x2 configurations to use it.
>>>
>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>>>
>>> Changes in v2:
>>> - Add dts patch in this series.
>>> - Reword commit msg of dtbinding patch.
>>> - Link to v1: https://lore.kernel.org/all/20260208-refgen-v1-0-87ca84fd78b3@oss.qualcomm.com/ 
>>>
>>> ---
>>
>> Is this necessary (for Glymur) now that we correlated some of the
>> TCSR clocks with the right nodes?
> 
> This patch is necessary for glymur and mahua and other Qualcomm targets,
> which can be verified from the REFGEN page and power grid page on ipcat.
> 
> Take Glymur PCIe3 PHY as an example: it requires two REFGENs — REFGEN0 for
> the PHY itself and REFGEN4 for QREF. In the TCSR driver, only the LDOs for
> REFGEN4 are voted, not REFGEN0. This is intentional: each consumer is
> responsible for voting the LDOs of the REFGEN it uses. Since QREF uses
> REFGEN4, the TCSR driver votes the REFGEN4 LDOs; since the PHY uses
> REFGEN0, the PHY driver votes the REFGEN0 LDOs.
> 
> For some PHY instances in power grid, you can only see one REFGEN, that
> indicates the phy doesn't require QREF or the phy and the QREF it requires
> share same REFGEN.
>>
>> Perhaps this would be necessary for Mahua since its clocks don't
>> require QREF (or we can lie about it and handle them there)?
> 
> For Mahua PCIe5 PHY, it doesn't require QREF. So we don't need to vote
> REFGEN LDOs for QREF in tcsr driver. But the PHY requires REFGEN. So we
> still need to vote in PHY driver.

OK, I think I got my mental model of all of this straight. But expect
me to make more mistakes and sorry for that!

Konrad
