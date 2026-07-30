Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF404028C4
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 09:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785403559; cv=none; b=kgitnEYcr9f1yec+nXjjwUBIdeaLhgjfkLdnUVVXUPzJn8mvDntUKCLD3oynhXv7ej3SoPGa6kotM0GDedxt7QczUETb+/2EV6y4QFrrnHFaBmw4hNyEepQ8YFqE6NdJ4hZZOjf4SscdsfZO3t0DA9rcZhLkL0KKpPuBdDYN7b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785403559; c=relaxed/simple;
	bh=e+kemegnfd25Sop3xdW/Diw7KF46KmCCUk4+XwwvsRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ef6ck/iyBNQdZk9iGrABsbQyuNlzdluD/HcZZ4FF/lplhqjORJHqbeoZ6RudREG/aJdBLT8Dbs/oTW4XL+nsUjQvJgLdSvD7kng4YKmJ9q0sAb8CefOT6kvvlzZcwv+N+dorgVyb6bK2eU24Qqpg9mkf58UEoWmRm5Yul6u1GXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=djH7gx4i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d9XYEhMY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="djH7gx4i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d9XYEhMY"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U9HRvL834621
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 09:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CpwG7cUwCiBQiNOvTzmfNMlN8+MeLdJPK4zcBEkWFB4=; b=djH7gx4ile1RlJg4
	SoMWfm+PZI8SQ7T6KhXEmU5zRY/TWjmp5u8wMDGtp9mnYPuWd+TAcjdqiF9UmrlE
	E3B6m0XJNsGaXTRS+o9ANbm7PBAXCoERL14DOzk/GfCwYzleJwRRh9RVOlQipfUZ
	L7cXtrTDaJSsyrM/QWoSn1DJJWPm6GjD51trDw9kmx77fv0CkNTwPAe+7Tj3OkgT
	C6hpb9/+Te204tTpVCa6cSkIf0v5uu8gVH0a7H9m1FE+MCjseV90VLrhgYiQUD87
	XVSMWe0hZe+rJXa11yLw0m2QkAEF0NMsQUHhSK6heJZPWuVz5j266zc/xMecN6d+
	YqnarA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3uqr1a6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 09:25:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52845bd815bso3339421cf.0
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 02:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785403556; x=1786008356; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CpwG7cUwCiBQiNOvTzmfNMlN8+MeLdJPK4zcBEkWFB4=;
        b=d9XYEhMYjHlaGfZnQfbxdUOkZCpkCkTxxeNspBU6SQqmcuzm7V1w5N8IfvvgGjYOuJ
         /zRv4e1cioxqjvGgtZK1ROnABzWRiCXE34s0f2B0J9pOtdEKPGEUJYWVhQd628qECwMy
         dxn34AaOoykTyb6jeT+QzMruQ4wlBNqdL5n6CUtw1sa7ME+4RcQR2rnwpfmWR7g4tap3
         IHfjiFY22hmjJxejo0ObpFyBK+ZQABqx8K2fwxz+3ElOE9j+EZ93ny2yUbQLEI/W6w6j
         YEBke7s6Ze5YDsNM8Jv14RBikH4M8i7pWaJ03oVVmWH8QJLHyNhNYhkmJE15We3YR+lt
         /KTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785403556; x=1786008356;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CpwG7cUwCiBQiNOvTzmfNMlN8+MeLdJPK4zcBEkWFB4=;
        b=IVOv1qJoxgARmW6bChI38O2t78UxJTWkzniAihsWVbwUUAHolL8jw15KmKNvhOUtSI
         OduCNSRfQ5eq4xVEKHlV1rfK8oKcN/L2TNnQ4k567Xz4QjxqjAFS+7z07vHRs9rQktnN
         OpeH9+qrAIy6sQWDeA1uMtqVRaIVdecFcfAFeD0XEB4i9G2lEqXJAV92Q0ZC4HDCvqpR
         jgdLoj62Hdyw+l9YERtjBJwoD19JK6T9NXN31WyeXU8PSjtFRy4YcIRPrPPgSWQO1tMt
         jzBPqMPNc6xD2yUsrtkHpc/luX0ZoL08QIOa762HROCgKk9d8hgVrAI+QvK7jbgkj/65
         jfTA==
X-Forwarded-Encrypted: i=1; AHgh+RpkrvjLRQXI2AAIB2Zv1hSXjDueZLAjaPanPgNPaxIAC7ZVC0+xR1hD/ekHHUrnXuAi4Uhc8kI3cbTE@vger.kernel.org
X-Gm-Message-State: AOJu0YzNQdYPremWHrE1T3zYzc9BFExJwfO0tDWhyLjPKGsb5HoDjI78
	oimGMCzX4pJqNCRkg2Ae5tGpsB/wx23V0fcyvat020eOVAcMycg1blYtrkGDKX2+UT5/4FMLe77
	xXY/Z64BjMYKWUoA3NDBlacfryz8G7Rk9lKchKbXggjdsdcTcYnvXZd3rPOxrRn4/
X-Gm-Gg: AR+sD13nP4lNVq+Su66MO89kFdGuTWmgmSllrKBMT5hxLrpCi/3zOPyZu+okWxyUmWA
	y3fBRxHATocHCzLixBT+DmlO1OK2TtIjQ4U5FeHSDz40gpWPHw5GLPJccVF0uIFYdKg4lwJ/LAj
	5x6XacydnQUVVgOp25PuymnlNU+gRnB+XxPjSRERCRZn/SVYmD3vRpSt7dV1RsnpWn5Z1BJ6/3y
	efX5EZxU5ps6SfM7rOk2PZF9bt/eW2/QOhnuq3y2IcA5d+3uQHrBaB5TUvwGNsVIyhqOFOnbOUq
	Mvcx0z43H24yNcpYsbIcGMWSJvrR3v+wsi7lWWAJZkKFtwxUl/jldbLp5UK1H5AA5x2M31D0CM0
	YKdDxpEw69lWhNmkONdV3WgHM
X-Received: by 2002:a05:622a:4d8a:b0:51b:f40b:2faf with SMTP id d75a77b69052e-52b386e56d9mr33502241cf.4.1785403555722;
        Thu, 30 Jul 2026 02:25:55 -0700 (PDT)
X-Received: by 2002:a05:622a:4d8a:b0:51b:f40b:2faf with SMTP id d75a77b69052e-52b386e56d9mr33501871cf.4.1785403555230;
        Thu, 30 Jul 2026 02:25:55 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8bb46f0sm46325366b.44.2026.07.30.02.25.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 02:25:54 -0700 (PDT)
Message-ID: <f122889b-1278-43b0-966b-562b5388e587@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 11:25:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] arm64: dts: qcom: glymur-crd: Add PHY supplies for
 pcie3_phy
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260724-glymur_linkmode_0724-v7-0-65c8469c6b65@oss.qualcomm.com>
 <20260724-glymur_linkmode_0724-v7-4-65c8469c6b65@oss.qualcomm.com>
 <74907d0a-cf14-43b6-bcfb-8c283926a820@oss.qualcomm.com>
 <ammhm1mnHhn2okgJ@hu-qianyu-lv.qualcomm.com>
 <2091d5bf-8c76-479b-98fd-fc75b3adf644@oss.qualcomm.com>
 <amnDqhTpMffP9M1w@hu-qianyu-lv.qualcomm.com>
 <cc185dfa-4271-4c63-89a9-05b8990db242@oss.qualcomm.com>
 <amnM/dVT3tZeR4h7@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <amnM/dVT3tZeR4h7@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA2OSBTYWx0ZWRfX0e3+2DvJ5FCQ
 oI9zZOGCgwacKYi9jOZBIWsCoO388GLu07WCo2KdDbBMQebPy4BXXtpZzFa5ACZkBPQh7fuzLLT
 slmORgQZmZBdBnhggwP1hNNuHMru7x0=
X-Proofpoint-GUID: 5BC7BORYgY3N4YabUB2M4cWChov5UcVx
X-Authority-Analysis: v=2.4 cv=Do9mPm/+ c=1 sm=1 tr=0 ts=6a6b18a4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=yc642J7MXfvTOP0XSmYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 5BC7BORYgY3N4YabUB2M4cWChov5UcVx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA2OSBTYWx0ZWRfX9PPraHN64xW4
 tNbH8Kii+ptmJEN+RCuLBMu0tdPQjq2isRXPh1BJOw+T2HbOkwCE0qxIZFMpVGduqEwrHljUoiC
 JRZn+8e4tgjainW6nZa54ASn54iHYvWC3JbQ3aLVWsBjaUw71FwntAtsd8r5klkpL2DiUH1qhm9
 XwIoaJSBDUv9bIIg9E26JUUzLbiH3Mmb9vNVyKhWyt11i55EzHpm5Ux413cMBiy2g7UmnHMQQ/Q
 5A8P7/hfYdRV6GbnrGDD5dqNRreC2mvah+SdN3mQYHzQeHbzGD7v8ZLUjfp6fpdHKK1DLHbqlQn
 tc9uzqSk/SXvkGokI+8Qu6YfV7CtlYHK4aIL1kasrlR9WWShYiIQiSviA2QewXKg3YcJJ/0v4If
 nErIcmvFITsYty4DWZEgo2Yqx3248mI+MfkGbQvhmD1YVENC5/cG2Q7rYI0eADyrYqdd/uEmccg
 +qBQAMJXp0aoHxTCfDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300069

On 7/29/26 11:50 AM, Qiang Yu wrote:
> On Wed, Jul 29, 2026 at 11:22:45AM +0200, Konrad Dybcio wrote:
>> On 7/29/26 11:11 AM, Qiang Yu wrote:
>>> On Wed, Jul 29, 2026 at 10:30:27AM +0200, Konrad Dybcio wrote:
>>>> On 7/29/26 8:45 AM, Qiang Yu wrote:
>>>>> On Mon, Jul 27, 2026 at 04:47:15PM +0200, Konrad Dybcio wrote:
>>>>>> On 7/24/26 12:01 PM, Qiang Yu wrote:
>>>>>>> CRD wires the shared Gen5x8 PCIe PHY's regulator supplies through
>>>>>>> board-specific PMIC rails. Add the vdda-phy, vdda-pll, and
>>>>>>> vdda-refgen0p9/1p2 supplies for &pcie3_phy.
>>>>>>>
>>>>>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>>>>>>> ---

[...]

>> Do we know what happens if UEFI sets this to x8-mode? (is that even
> 
> UEFI will not set it two x8 mode on crd.
> 
>> a concern on CRDs specifically though?) Will the second controller fail
>> to probe and become a sync_state hog?
> 
> PCIe3b is not enabled in UEFI by default, if we enable it here, we will
> see probe fail.

OK, I'm happy with the patch as-is then

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
