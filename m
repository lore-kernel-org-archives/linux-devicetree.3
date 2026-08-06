Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD258381AE4
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 04:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785990599; cv=none; b=lU0cpE0KUwA1DDembKU6ZyPSM0vFVc2cY3UcbvMWPL5z4lVWhW4Pz8OQVYGlQoRXxLzU4aRAqp1wny3IsMGIKV4HY6o4IC/dhtj9BZGyDT7XXHgq1JxTbPXwrqmnymJ+ODu2aUA2wdm8YYNcvACY6fAgijjpq/VlYAXDDYsUTzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785990599; c=relaxed/simple;
	bh=Du4Hbj28uQ8JJYIXnXrB+2yxbx8ntIi8t57UVqDBFe8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hfvQLDVrXF8yS/Xknc/j6PH07hfBzdlhYYt8KsW2QEalc/XpFv+wZqn2fVPfaCfwEG9BOaPNVbYtAuZFwFBzcvx3f/eHLTB5cMpr2M70NL8gVDw2K+ZHdr6spWlKK93gSp1ZtqCRWff37QsT2BzE4cRF2Z4pweMVE9Dw0qzo1DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VuzhkvvN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FGvZGIQR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VuzhkvvN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FGvZGIQR"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6763x1Sn482471
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 04:29:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9xOdMFThIiIZBHNtAytYWHqK1fLwO2OnGzkdEI36ESw=; b=VuzhkvvNyy4VH/OY
	uWLpUR+1qYHaqf0+zQbM9t27Z2NzBfEFIRqdEe32vAPbTIuy8PYoeD9SGVOGMwKf
	4BGTaR3pn0KIaOfudSWnjXztsNVvJBg3VZKDTSNglbTOFGxCSGhSxFv5vx3iCE6z
	b5c+RBKdNWzOvlOVT1PWOtspDlhNRDjWYNU0NJtWqYxki7GYq7OsMvTgrWDvjr+6
	mqbRTam+h2VtKMlDyK9TfI07KGbYegijszvwdnO3k9WjghYtD/081ihq/ZSc2t/K
	/u0vt301nBkjlbQiTX5REmxD9vJhNeglISOMeXoFpk+trCg5qQFAZSHGLHWeGIG5
	Avk6Sg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjueg32g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 04:29:56 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso1447464a12.3
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 21:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785990596; x=1786595396; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9xOdMFThIiIZBHNtAytYWHqK1fLwO2OnGzkdEI36ESw=;
        b=FGvZGIQRqVrO9ObzvEBbsVQI+v9tsWydd4sZXkfMk5hg9WzrATq9Gp/oEnnZ7otaeB
         /FmvGLVRXnb0QHJuxwaA/k8OUOYgOU39zKkfa0GM3E/5LhJid/gDlq0UjrS4bV2Fzw6D
         j7vFJEdyIP8ApNv/Op3wzyIKUy8tZdAidvE/oXQgoTOP1Bo44jLZC8WgFOar8ZMt8tkH
         70of8lRFDH/cZoan02e6mqEeoPu+pyv+1DlWph78sG/4N1sVMeCb31IE1gD7t0T+UUyl
         ZWDUSz+nQm5OuE19OcmsLwGGmbgwCUWQtvLpP/E0cpNrPF7ct49sjki7MT4WBFGQ6rYe
         hGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785990596; x=1786595396;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9xOdMFThIiIZBHNtAytYWHqK1fLwO2OnGzkdEI36ESw=;
        b=mYzy5K2tFj+ZrRY1zM1FK42sR6l6lwzWu1QC2Fq4A8khtSbo7CerBSaamSSocydzlp
         X45teTrwLvasarwabfmwHgVt7MCzCkICpjnQi7Ep4kWtm+gtGr8v3bMGrVH70/Q8HXRD
         POSMWH58x09rX4taSVAmYHGYz7f72yQM5JpG161p1u6IwFWG3TgNcd/H9AZ4bwq8zM0Z
         mxqknKEVLQ/XmwZRkb6v7qI7J1kuu1F/WFlle+rzkwj5MtIYtRhaBUnzMvaw/wS24BSq
         cd2M3GpCyDlzRNBlu9KmY3JVG6YctkfUQGfG7gGJPq2+s2H11Ux3refcJK1I+iO1P8RG
         OcsQ==
X-Gm-Message-State: AOJu0Yw5SZqFC8FRT6tHrDARpblFVZvBsZy0CodCIm379uCTP2b8P1WE
	/WGZIpFa+WbKWHXzYPCbvm/wTlMhBN5jL8vX9AzCz+QE0TwadK0gNQY54GA+TIxDZY9AI1le7XA
	SQFRNDJDEBFKYo9YinZBc/MyYRkd3tP8x4wjDfCWVVx6p4zc9p4s+8oNo8pf9KMq8
X-Gm-Gg: AR+sD10apUquUPp7tEisYNJc/0rydpte1gYq4ik830FO1qGCV0nOMRa6jmUIvhUAHtK
	bCcEM26OJNwFlDLrFSyqKTBtl+te8hIuEK95ajiYY5AlQWj/MK5RBEJuUjY0eh4SPSiSiR60FWO
	uSxEiobUjsddD7h8bhzix2fwujOZOIYK6nvd8Fn0y0Us+Rbg7tBu37ypHIVkjaKlX1qZRv/ozMe
	+HXBXHvgMUbTO1WNK0hWWk61xD3M5mJItoRN52oCOrzTdSkPfBZzGnRIwy++9ySJ9Y4GdK1GA5Y
	73rrmAr8pBQ8F79Z+cTJ5+b7juItuXd586fNTgx/UvnRvlgBbpyaUtSTcUTaAVxpVAabeCFr6C+
	Va8WA6GOBXQPJfxtlQOjwAI6kqrmKL5jzgALS6FeS2QPqrDWT39/JFK8BT0Jci6EGrqVB5QgOwZ
	+MTdncXkK1/NAm
X-Received: by 2002:a05:6a20:2589:b0:3bf:a0e5:999f with SMTP id adf61e73a8af0-3cb85e9415cmr13011395637.22.1785990596238;
        Wed, 05 Aug 2026 21:29:56 -0700 (PDT)
X-Received: by 2002:a05:6a20:2589:b0:3bf:a0e5:999f with SMTP id adf61e73a8af0-3cb85e9415cmr13011371637.22.1785990595745;
        Wed, 05 Aug 2026 21:29:55 -0700 (PDT)
Received: from [10.79.116.175] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673bb38sm24013042eec.14.2026.08.05.21.29.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 21:29:54 -0700 (PDT)
Message-ID: <f7ef45d6-c530-410b-a66a-22411d5d9815@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 09:59:51 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] arm64: dts: qcom: x1p42100-crd: Add qcom,tsens for EC
 fan thermal management
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-7-771abd65ee1a@oss.qualcomm.com>
 <20260728182653.8F6841F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20260728182653.8F6841F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aNzAb79m c=1 sm=1 tr=0 ts=6a740dc5 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wO-kaS73QcRLlypTDvoA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: FVM8zta0Atgylq0s977xrRDXJ7y-303f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDAzMCBTYWx0ZWRfX4BCS+WDi3EgV
 cxdUyfAvzQLpoMy/j8OWzMlPEpfAs24esq6PDlAjjaIq7Ex2rIF6AURoHnGLyl0Ihl0VDqCF4Th
 qewv9DXR0irPD8bK8PUSN85N5oJ/wqnC0mCky5ub95BsI0vBMUNJlwdbUvyBSGQDeGOtMKeMz+5
 dHbHblISZs1iHiqLaUIoX/syYc8Bzu0B9JQ6NOjTL7s0KzfixMUgDU2keeLZQNdlq00UPMwzMVZ
 eaSmdq/PSCwVwWUBvrsLxNGoAfqVt39SrS0NIWhqh0eThi/cysx+QT53Gg9PCf8iWNKKxHzfxaJ
 /VADvRgyxyRVllJc0nrG5GBINYMePWvhBVhwI5IN3FZHhc15U3MQJKBwP7T+7Cw2cvfiKyBa3jk
 TCg88flBGbR9P7MQQZ5zTCXCmBlt0Pd/nQB2G8vRwfJvwqujoFlBHPPzJovrHtJ0ouXUN5ltUnk
 /3VeT5DZfsrl9d3uafg==
X-Proofpoint-ORIG-GUID: FVM8zta0Atgylq0s977xrRDXJ7y-303f
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDAzMCBTYWx0ZWRfX0Jpcoaz9Xskz
 /6sO4UKM5srhndiS+0qaFimMafk8CcyOFxWPV9SrEzbSvOqgB1vdL6dfrfMroxE55yZdlPhvRKT
 XO40E69gel5z5eKGrkuzmy4qaYeP5Aw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060030



On 7/28/2026 11:56 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The `embedded-controller@76` node is instantiated in `x1p42100-crd.dts` without essential base properties (`compatible`, `reg`, `interrupts`), resulting in devicetree compiler warnings and driver binding failure.
> --
> 
> --- Patch [7]: [PATCH 7/8] arm64: dts: qcom: x1p42100-crd: Add qcom,tsens for EC fan thermal management ---
> commit 6a0028e3f0e9078f36aed5052ae5c17e337676ff
> Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> 
> arm64: dts: qcom: x1p42100-crd: Add qcom,tsens for EC fan thermal management
> 
> This commit adds the qcom,tsens property to the embedded-controller node in
> the x1p42100-crd device tree for fan thermal management.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts b/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
>> index 7ed4116b95904..b46b67c5e4366 100644
>> --- a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
>> +++ b/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
> 
> [ ... ]
> 
>> +&i2c5 {
>> +	embedded-controller@76 {
>> +		qcom,tsens = <&tsens2 11>;
>> +	};
>> +};
> 
> [Severity: High]
> Does declaring the embedded-controller@76 node here create a new, incomplete
> node?
> 
> Since this node isn't defined in the included base files, it appears to be
> missing the required "compatible" and "reg" properties. Will this lead to a
> devicetree compiler warning about a unit name without a reg property, and
> prevent the qcom-hamoa-ec driver from binding?
>

No that node's already fully defined with compatible and reg in
x1-crd.dtsi, which this file includes, looks like the bot just didn't
pick up on that. Anyhow, I'll switch this to use the ec label instead of
redeclaring the node under &i2c5.

-- 
Best Regards,
Anvesh

