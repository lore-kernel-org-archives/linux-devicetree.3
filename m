Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF25137F75B
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 06:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778826617; cv=none; b=FH66BHA00ifR8WMg87y9/O9H3F63OKEBx3z5YzTj+rjIcvZ+Vkb3v50EeGPdn4V/cQOF4wo5Rs/W7c2OhgIJeiK5JTr7JcWOxPvcej6yxf9rrCA3S/OqXL3JN2K4b+1aGSf179DKF6Nog4ViMQn+NiNtdRUCTm+5kpNVuzUHNPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778826617; c=relaxed/simple;
	bh=4OhkOUm1uinge3W9lUySjqDtHM82URbONjbpN6SzBlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aPZ27LJYRZdyfmLVObZwaulQ1z3So6+gocGrHUpyn5Bll7JRvqK9exJOLPj7AHIW2OmyXYdJwdcO8WScVJ/ozfRVQBwfa2cvgotDGe5+vtNY23sZ1nSlA3tuJB9vBxn8AdyV3ZISjzAFYmT5KRsw0PH6npTBxL2VuGxFBn4BrBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bT6q8Eat; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MQF/F6xJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bT6q8Eat";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MQF/F6xJ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5KaFI3513372
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 06:30:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hb7U1c0ZK+6x5WATBstJlJ/LiC1OoHYdzdqkvWGt0dM=; b=bT6q8EatEKwk6vxA
	WJJBCA6dFpa1H690UBjIpDA4OpSfUpE3jcYK63S6pyQd2qKOLCQDORLgOL0NscT4
	e4i3k2XLTLIqQ5wJaJiiu0kazftGdhggq3SlOKaqR/37IIvnd4cxdW/xRpw80FOe
	MEhiU0QZfAv8jT9CZlGiDlwUTxHVqweqxgx5zimpeh75gjlBnvYd1ubKGXsArYIX
	TTFnTiDDlw0bHhgQTmtJcZ4VPADHx/HYPI0h45BOrrRIFpqlejRqplejXeiNzqlG
	aGYmYK4x+nQFrduTKmrpvwt+vPcg9qzTBUGfi8t4fg9tuRVj4IKTEB0AJjqhTA5y
	G0AR9A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1v9wra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 06:30:13 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8aca29dcd69so214831986d6.1
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 23:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778826613; x=1779431413; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hb7U1c0ZK+6x5WATBstJlJ/LiC1OoHYdzdqkvWGt0dM=;
        b=MQF/F6xJEYCtlYvsmTFzdaFCOIX5JLulPTuy9HFv0X85L3D5n6KlpvIrWJ6Q2DosEr
         aX64tq3fxAtz/K2T4rtn7/q6aJ/1cuhk4/1s6DrQqXZ8GoU0WXRYO5jfg+2AYmuJlnbE
         9POgI/+bfWEnvbPeFW+lFDWSFi6gC+NQkWfqcSkl3XLyTgI/v8IR+KEEhj5zWwGqf1g6
         KcvPV5bUcF6wqLoQErUdJar/teDL552Yi3qT8lpXrdX8gRlibGbhE8qBGvpFiDsYWdeq
         Qp4RmdTADjorRlhsSp6wUKl61wO25VovhUZzkhXoOzPaH1bWlNd9NUckZADTZrZT2KCc
         +61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778826613; x=1779431413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hb7U1c0ZK+6x5WATBstJlJ/LiC1OoHYdzdqkvWGt0dM=;
        b=g1BVCsrpxW5Prk5Sy2nfMbrkx8xQN1GLBsGzsdAS6sgjO9v+J668wpRh7/7v1XrBsL
         0trMtLKrDQm+taTcyT+zWZLSFhycX/XHSD6XsZTqIJk9ywp6AXriSm9VjjaDBzFspm/X
         At9qqG1O78jqBeldbMZ/aIfghCnY/n7bhsl/aB9CMacDKYzJA59wRgPz55rbrYbKi8Dj
         2t7+0ov3QT5DGuOqXKL72ONXZm8/vBqh5Mp75leRx1kzTtBmKbrhmvMB/2nfoWKmCUSk
         fDki9fGbqvv7p68p8KhVuZeSarfZQwbduwk8nm4LY41rupNmm+ebQ+1A5mpnt9kjbnV3
         JaWw==
X-Forwarded-Encrypted: i=1; AFNElJ9MObhWNUMGgyUZP2ffgkHyYj83uyHWsrbAp560Nm4wKlGTrgazM/6Ii4h+/MD9eDI8YVOynf7UsQ1i@vger.kernel.org
X-Gm-Message-State: AOJu0YxOQdJ0fpmHoo8XNKGuIN3kgBbFw45FMfbOmVtgRGBecZ/0hYNI
	gBdxOZVTZlBlWCw5ZEf0MX7i90QEVTvrQLBDj2Mia20kX+EAlC4ll2gTDvYtgx/xOKeEg8U/+KO
	VNBG0aCLGrpw7HsMW5OnGefIeADMBKGqwyalRK4d4ptHkUqnqzMIFihMVMjXg50hX
X-Gm-Gg: Acq92OFAUa7wPa4Go0qckp93fy48isfRfupyfNU/cBgBSwIMItn0Mxa2M+gC+Rp0D7H
	70+C57b9gbe+3dmCFeFCv5pzVtMkX4mDWE4SmLAoYsqM4oLCfGqHoNcFUK2PtIpylH33FZy4loy
	XtZXjhUvUXsfScXTnB59AZcQbOq5mO5iheS9VnZBV1oFWCoQelY0KlfAtRkjiLSbBmynGlIQmMT
	Ry7Br49G3ytOLaJB7V+nbgk8T3468GalJmPSXPmWc1QSQzbkouf9ZMYgFPEuzGnYdEdm7IsnC4M
	RS7y+oiSQSTc5YE+84SClVg33KmyL+QmFJbbJsbv51d+InINbx/9L/4G/oselvSK7A5cfswyVZ3
	PPy3KCcuslWah55GVraPVY7/kkZ8AhxwnHD54XcPlBCYlbQHOfj++mOPyTB8Vk5SjNglS/TVAfI
	bpuXq43uwG
X-Received: by 2002:a0c:f109:0:b0:8ac:801d:c3dc with SMTP id 6a1803df08f44-8ca0f5c456amr36977886d6.9.1778826613205;
        Thu, 14 May 2026 23:30:13 -0700 (PDT)
X-Received: by 2002:a0c:f109:0:b0:8ac:801d:c3dc with SMTP id 6a1803df08f44-8ca0f5c456amr36977306d6.9.1778826612525;
        Thu, 14 May 2026 23:30:12 -0700 (PDT)
Received: from [10.111.160.50] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c908f0d92esm43711496d6.19.2026.05.14.23.30.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 23:30:11 -0700 (PDT)
Message-ID: <7d34bc76-fe49-4d8c-8ac9-f563c2c35fe1@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:30:04 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: media: Add bindings for
 qcom,x1p42100-camss
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260511-purwa_camss-v2-0-22608ab9126c@oss.qualcomm.com>
 <20260511-purwa_camss-v2-1-22608ab9126c@oss.qualcomm.com>
 <20260514-carmine-magpie-of-imagination-5dddfc@quoll>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20260514-carmine-magpie-of-imagination-5dddfc@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA2MiBTYWx0ZWRfX9CYppy1bWm82
 uPoa4RtXmsCndMy04SOyYSfiOA24ZXbKaO06PEZ95+IrYVyM5h5oO6h3BP9JNEMUgtCbre5ipED
 AFoSypzeahWxVaPqyNMlgGXz/Dd+F5A+M0wh6AWIRDvS3p+ctgjEW+iOG4JB9yg1MgTRoOMdy9u
 VNhOpTFdDZ9nPLJINEh30m/PyarZWikEQfye4YVEU7Zt3RIAstacpPg/23OMHdlrjHDmv5jGxuY
 Cj5IUdgmdd56k0L8yCATgioofTfSYpqFOi1o3uJalufbT4bXy/9E1lu2/8AWljmZjI/osqwgbv+
 oUiF3f7ZzL5oGPO8CQkvPNB2AihArrSLttSJihJJWyKPv5LX+HdAl66Ee/ef6XuvRYImYfKoja9
 rre4vuQ3+Qwwa78DrPzlIJT7H0+ChNGYF55PeWDHN5VEmO0XoJ5dhdQKqjRvS60hBQxr2xX2dSn
 taizM+13G7SEI9jdpjw==
X-Proofpoint-GUID: lkHrL8_2UEHHlE1yNwKweP8Vob_MWvkS
X-Proofpoint-ORIG-GUID: lkHrL8_2UEHHlE1yNwKweP8Vob_MWvkS
X-Authority-Analysis: v=2.4 cv=BvqtB4X5 c=1 sm=1 tr=0 ts=6a06bd75 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=CMSjfWuysNDtZblWgkUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150062



On 5/14/2026 8:19 PM, Krzysztof Kozlowski wrote:
> On Mon, May 11, 2026 at 04:59:34PM +0800, Wenmeng Liu wrote:
>> Add bindings for the Camera Subsystem for X1P42100.
>>
>> The X1P42100 platform provides:
>> - 2 x CSIPHY
>> - 3 x TPG
>> - 3 x CSID
>> - 2 x CSID Lite
>> - 1 x IFE
>> - 2 x IFE Lite
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> 
> I do not see you responded to previous comments and FIRST one was not
> implemented, so I am ignoring the rest. Not going to review this.
> 
> Best regards,
> Krzysztof
> 

Hi Krzysztof,

Apologies for not clearly addressing your previous comments — that’s on me.

Regarding the first concern about dependencies: in v1 the series was 
indeed based on the csiphy rework, which pulled in a large set of 
dependencies from Bryan’s changes. In v2 I intentionally moved back to 
the existing (pre-rework) csiphy code to reduce the dependency 
footprint. As a result, the remaining dependencies are now limited to:
1) Clock changes (expected to be merged soon)
2) TPG support (planned to appear in linux-next shortly)
3) hamoa DTS

For the csiphy-related concerns you raised earlier, those should no 
longer apply with this approach since the series is no longer based on 
the reworked csiphy code.

Thanks a lot for your time and feedback.

Best regards,
Wenmeng
