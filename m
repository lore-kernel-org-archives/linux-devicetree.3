Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FF737417D
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 12:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774616014; cv=none; b=f4hz9q/LJZyaiyuncO0C2hXa7W/WUjWqdbc5XiWjTSqtcuBwIeCk3rXoMbROTaw1iK5EMjvhPhpjHG04ElIs04kUyXCpG6vyUSEr2ix+pIHy4DwDZIu/TVWkUgXbBw3kv2g8AZ98+/OD134HKGTstQ1sEF68Gk4aSwgBs1X+ObY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774616014; c=relaxed/simple;
	bh=82hBkgUQBRYsEeYM1Pt/3YAGZ95NIaM+aAvRhDaBC/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F590gE4d/dmjqW4Aql22XQnclOQ56+BR9IIl/KO0kCyJtzdQxQ8XRiVwlQZpdDWFuciwGV7JmIOF6DcthgDWM+z13lqSdGmvpjU/2A0NR2mauTmXaPNsEoIjWJl0gf8BHID3QNNWRiUu5jKF5JflNa8g9zw8jm9/KFiET5kf1q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QTxLJmX1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eNG6qGZE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QTxLJmX1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eNG6qGZE"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RCTaG71860237
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 12:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nCgve90m/nG4dKANvG2uOMtnscJK8H1SmJtIiWg4EQs=; b=QTxLJmX1xYvlflEM
	7OSRLyfE66HZq8dqabIU5HUK1AS5eKSTzyz8PLle3UkpqXOqMd7sd4NwzXwe2csL
	zTUjLkJBRLPSYs5XnNZ3giKZEcO8S+6X86yL5zglgq3QPRng33vJgIkQgaoVpfJw
	VpQ2Rire22tEXIyd263tPkOjpKBD4uYKHZSrr7KHNu/1vM6lJnTTtSUT+rr/9j1n
	6+7BwPpZx9n0eEJ7RmjUMP760lyzXTBwbrZfjKA3QNY7fazSVrVAkdk1hfAsc8w+
	IcgH6R5Hl37BGBmwAM0Cvz3iKqDySqrcmiDAdv8GdD0XZ8oEKr3JHHLMqVSKG3wN
	2IITsQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bxv32jk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 12:53:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b27636835so6726371cf.3
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 05:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774616012; x=1775220812; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nCgve90m/nG4dKANvG2uOMtnscJK8H1SmJtIiWg4EQs=;
        b=eNG6qGZEP65LDmVMVQPmT5iM1HoHsg57gWwxyRfdTCLzUdSYIGzonPLMsosxQoYhhi
         lc7WZy29VHHpb/U1ZupsjsWs57xiBIsgcIGwdMGrXgOuLjUVxKPsEhiJ1EdSNZ2oaJ7V
         29rDHY7dqtuvHtWxATVX8a4E6x4eSUTMHAK5pCQTn75trTIz6cqMtNXor/kp+3xp0JAm
         WoukDmcuqp1lqvHnvo6zY9iyXYImoNOEMBV0PJ7ZjO58R2TF4Byf26/YvSJCUN2dH/nW
         dOsqwiVJ6Qwdv3/BAIEBVOHubABuEuRqp8oHmiBGOHPbUT99ESHsdZr7ldRyQHdz4t3F
         0FEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774616012; x=1775220812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nCgve90m/nG4dKANvG2uOMtnscJK8H1SmJtIiWg4EQs=;
        b=ZIXiICvjaSXCUCm09ykDSRhuSxiNwWItQci82QxfGLeQw/wa2ZVZ6oOzVtzyx+9vjS
         cV8YAr8zzOv2A434AKS3Ndws72hGuZxC2uBp5BSpV3s6JgyV5FvRdLCnMygLD1VwNK0p
         bY590MNcJG1SI2cjh/BtU0ECiJTEppTGu/cLa0Bcy2fgtWv+EwF1R7fWhAajHX4s2Ovg
         OvV6yw+SyNw0Nsr2hTXMe1j8KnoQaL/M1tPgLxKL8oqCkHOp/29t4mYvUjAbCB6SdrQE
         HV6xunZn0N0B6J0nXP0ZmjEIy/ZeMrtJvlrQDOzsyif14DJ3DpU//8ZiX6PxKDTg8ioo
         DJ0g==
X-Forwarded-Encrypted: i=1; AJvYcCWJQ8c102E+9pMECiICICkuflTUFQwUaLN+HrV4PwgZuElVew9o8yfnfxJnB/CWvmo96Pxr+XC1wdQr@vger.kernel.org
X-Gm-Message-State: AOJu0YxOoa6Trb76V+qrft1GOMObj3ZDsdC5hzjrt585WDd7ckEWbAm8
	6BrtaHHQ9cFK3SZDcqoI6c8zS9Onnb/1+vvs/9+X/iK2GRGbk6M7VlpIbyGWpls7IYD0/PsIXt6
	gDIZ4D1tpH2YLeYAUwbysOU+0omS+1ck4sAGTFXyNkTxX6qbOTnx5NJ1gmZgMcZoN
X-Gm-Gg: ATEYQzwdbc9qttcUCHmW/9Bw23u2lpVgipBRFOhta/J6VJYkLZWR1fqMkFz3yt9lPim
	j7921rsz07UN0TD2zgW/mymS6wHYFBsUFCKt7xxhfAhTm9jWhhqEc4gMxne/gGYg63OqxfZ0ypb
	WF5t4Axz5w1CveZPa2EfgfeUlxVL49xOdJvgLUc4DqFcghuczforaTIZ3S/ixM0EHKHRhOfKBXD
	6s0YTmFiIqjDrJmOfUBAzAa5pOMd1x2+vQAn/SyXeDWnC6XRPJTwM62cr8N47fNTRf30kovmbB2
	94wJ/UFwtDhzAB1YNG+htLu0WcLkioNNpcG2X89EZrRh1Z8b1aT/km9xYfUYYaP2OlTN2ZbsyhO
	AyFhfspOmOBURrllHwigzrR9JgvERJC2iy2LaccWiM9lw/0twK5bbu3QN8kmWD68N5HS7kzUrR5
	+2BeM=
X-Received: by 2002:ac8:5a11:0:b0:509:2a92:8088 with SMTP id d75a77b69052e-50ba382505bmr24443961cf.1.1774616011795;
        Fri, 27 Mar 2026 05:53:31 -0700 (PDT)
X-Received: by 2002:ac8:5a11:0:b0:509:2a92:8088 with SMTP id d75a77b69052e-50ba382505bmr24443631cf.1.1774616011338;
        Fri, 27 Mar 2026 05:53:31 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b2029be87sm248918866b.28.2026.03.27.05.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 05:53:29 -0700 (PDT)
Message-ID: <66879526-15e3-42af-a2ed-153f9cfc66d5@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 13:53:26 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/7] dt-bindings: media: qcom,x1e80100-camss: Add
 simple-mfd compatible
To: Bryan O'Donoghue <bod@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
 <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-1-fdfe984fe941@linaro.org>
 <20260316-glaring-jaybird-from-wonderland-4f8fd6@quoll>
 <94f4fda4-504e-44eb-87f0-e34e557402f8@linaro.org>
 <471895f6-dc60-44d8-84ce-8ba0069110e4@kernel.org>
 <xSErLOaV_RuZ1DggWWH3WGK4mpUp_7CrvmjVU4ZZd33l60PWpjxiSGID27A9hHbdDYmghPXgZONyhiTJ_USPDg==@protonmail.internalid>
 <1671b8ce-cbf9-45ae-947b-f35d174be93e@kernel.org>
 <61fa4409-e19c-49d9-b7fa-dc6f8413c181@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <61fa4409-e19c-49d9-b7fa-dc6f8413c181@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=A99h/qWG c=1 sm=1 tr=0 ts=69c67dcc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=13ZpxKrbrQONVxPmPHwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: D-BLG4jEUjo_UTVBBMGij96wgT0OYBBj
X-Proofpoint-GUID: D-BLG4jEUjo_UTVBBMGij96wgT0OYBBj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA4OCBTYWx0ZWRfX0K+QXj4A5x5/
 M3ROmZYvnFpOrK6E98Z7EfdK+efNEhjYc/2vHhVEXf6CwY4HIQPFYpcOAnByUkJNIISuyL2UkTz
 dliMT8Pg10cq3hwmESPJXe534C/CHAasVY66ofVoCcmouY29Pi4Osf1uMfx4PO6SImCiBzpjCWV
 KLtV04CFKLXPLUIdhyQyeWK1nmWTBmlb3JlNH1CvRsnUbOLu40fZa6Z+AikwDnIwPLW8mZmZrb8
 UgdcBWDVoRYo/Ro2yhJ5x8hpqNOUAHUB5wDHJxCYKWtN3JB4K8TfkzEmTZwy1NmrxytqhIdw0YK
 HchODR8WR4fwRaPXzWiCkohwyN9AvZbcQyGqamlWpVJ2XYN538Fwx6PXKQsPtzM4h4oP6z1hgSw
 +SxK51FtKS7J9OGsmaoCiyoRLk8OL7P6fYr2EdooPveSSb7W8zgZTCBE8QWN73jN5TRDB4B1rh1
 RHCdk9QL66MerqdFPKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270088

On 3/17/26 5:21 PM, Bryan O'Donoghue wrote:
> On 17/03/2026 16:00, Krzysztof Kozlowski wrote:
>>>> I actually got the idea from:
>>>>
>>>> commit fe6a952b567f6a771d087d2e969914f31574d6ab
>>>> Author: Krzysztof Kozlowski<krzk@kernel.org>
>>>> Date:   Fri Jan 27 20:40:50 2023 +0100
>>> If you refer to my commits, at least read them. Do you see children
>>> there? Yes. You have none.
>>>
>>> Plus trying to get 13 year old legacy device without dtbs_check warnings
>>> is different thing than correcting a recently introduced bindings.
>>> Terrible example to take... And if you find example from 20 years ago,
>>> it will be even worse.
>>>
>> One more thing, that commit was still correct because it fulfilled the
>> simple-mfd requirement of lack of dependency on the parent. I do not
>> believe your code fulfills it. I am pretty sure it does not.
> 
> Yeah I take the logic of that point:
> 
> CSIPHY here depends on the GDSC, power-domains and clocks we've listed, its not being supplied by any of the other blocks that live inside of the rest.
> 
> They don't require any resources from the parent and the parent consumes the child phys via phandles.
> 
> To my mind that fits the criteria you've set of !depends on parent.

FWIW the problem here seems to be the assumption that:

"needs to probe child devices" == "must have simple-mfd compatible"

You can just add a devm_of_platform_populate() somewhere in CAMSS probe
(or do component_device like in drm/msm)

Konrad
