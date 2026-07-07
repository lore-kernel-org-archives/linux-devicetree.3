Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A1241DECA
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 13:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783431806; cv=none; b=fnuX6sn4drjNDsUheiOF//Aiqv06HQiEKTToG/DnZyQADcs7J/vy6tU++Gsna8/UMheRgg0Q2tk/K8vKuDw1LekzjeNzAKcmR+8BzYHj5gyOS+7NxScQclDU02G4yEYInRhMkmUs65KOi3S+sFI4sky+lP6Wr4dlbbQIWEL7Kko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783431806; c=relaxed/simple;
	bh=gxUSNck89gYwBMqUdYKokKwDKQcNQfZ3Hv0Ejt/slvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iur9HLOhmpGQyUgPCYoeCY+ryJXVI2skh0NK1owx4ctXQfgN3BV+sL51H/My11scvc/8hldOoql3g4cgKXreR1Vu+reNpcwk6zZCl+pM/klyaLDh/HEecGOodzVIDwBV9taCcstCQDg26K4uYi4VcxrUzOJIjt7VWeifkAs5a7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LPYkXHvG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D79YbOn2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LPYkXHvG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D79YbOn2"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C9OES3741081
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 13:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M7QEyPtVfMKyZk5fDZPPH8A31rfGPkH+xRl0G+FLYR8=; b=LPYkXHvGDrjDuFeb
	WCjQwoOxFUfzbx5qjIgqsEVZNsZWMGva84hBLfsvR4u9GX7KnljOqWNxOD0zjfGD
	JJzMIoZ+FiNeAje6JbMcb5fMMO3yR/SuYeUpvgTggdovlvjs8cc2mtTNuDHWebgU
	rHkH6L+Rl+xEPLL5O2D107bTZtD9Z0Rmg1qNUv4MS0FP6cx0NrB1NK7EX2AgOSs8
	Kdnz8weCHHG9zhsWaJH2kbpemx0FcJhbTAOJDrQH7vne3tX69rSSULkKa2qMyaEE
	zYXUf+mDE3U7mo1YeYLgFINrbKmPaJin66t4iQBKZNTQkG2YaHPGpB/86eXYxHmy
	YS3ZTQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v9a9qfd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 13:43:23 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8423f1fe39eso8490371b3a.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 06:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783431803; x=1784036603; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M7QEyPtVfMKyZk5fDZPPH8A31rfGPkH+xRl0G+FLYR8=;
        b=D79YbOn2LEZ+N4urrfi1nqwyLIcP1C/DI1t8R6Q3qqlwpF4ZiEq58JrYL/KVjn+8gR
         rtl49gqWkg26hhxO21dqCqeTZX0OMGwMgjabdN0+U5DYYhMUm1w8RuPoWKs4JysKAnvd
         fxZWuqI8w0PXJg9aMdAjQ6ZWJkK5ggs+6oac+VJBFYCTItkmIikhExcIPgHcpbvDGw6k
         6vaykvds23x/IE+c1lucRcPM8XLIo+rWAGeg9eegIWvbwzJ0xs/s+Ji1hgsCWYM5RhBb
         He+tt7y7KrSdLyoTvOynInQ7bzrn9+HJnuglWJuMC0thkxZOSF86UJ/esFut70WDLuj7
         UZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783431803; x=1784036603;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M7QEyPtVfMKyZk5fDZPPH8A31rfGPkH+xRl0G+FLYR8=;
        b=LfVJBP71GmSgVRrKDuT2On5And9XpOu4mik4757XMDut9/QsJSyqAByvD4aTwMEUhL
         mba+s2sDbi+FhJ6VLbEAgx+XpiIDwaD1WtXySXvnWm62vzhtM6uW1bKzzxPux4CooPKK
         aqOJHa2CmrTpvOuB+GBTYIi5x8URCHGtfrR5CBDY+XITqIzeBlH9eCRPhNeqAtR0TdkR
         JHq5s42NzwwFl5lYDN0LGkuW4jAWahcds8T7xdGAeaqX7dP0K6BTE1hhRCO764hhuHtz
         FJ2QaJZGLoJ9b2TOuXNt6XAH0YYWFdYKBvXQcihlNTAXfF+lBl/3AVuG4Yynb2gAIMX5
         a8rA==
X-Forwarded-Encrypted: i=1; AHgh+RoNyHbA4d1N0wulTz8esntohQdtrNMvxpWm20SN/fi7oKuxYiVlbxWqC2zR2ZRWsOv8IHHL8aor+LbO@vger.kernel.org
X-Gm-Message-State: AOJu0YxDev3FefjxIgZkLHItF13tQ6U3gCwIgybt7YDM44DXotPyGKx+
	4hpr174c3QdspewRcs6ZfzoHInoTBkOpW+NUEgjwhndhYBXBwBBjwGz8lwi2r9ZcE/EGRs3wQuW
	o5wcWWAnTlTzzmax/8Tn7EZjNTNxVfsjBswQ2lKkOxpyfxl8dJ5EOJutqrBHwBPf5XhcMfkiL
X-Gm-Gg: AfdE7ckLGjGUQT2tdnHm8ycotDqpQ/7y5zcI+adOoXqvZcsFs3UicqLkROcOdpqNp4T
	94zq2mARm4NmQBG3z/fR+sRtVKXY6JLxdSymTnTa3F0KXpQmE/q3mrnjlTvNukhhvwMYSXxQ5sf
	s6sX4DzW6tvzV2pT7VgGdPjFpppnFenmLnSRRMVe8fVoLlY3MJBZ3MnnG6px4EygN6EQmgQYMEV
	o5Y7TMvBiPtqfexfOgNFRlbr4txpSr6BcEHSRmTr+ilorA60ehppi538yfr+UGK3gSAx5JIXvy2
	JQvHj0bzwF8J2BA4bO7dkegEm8fWFjoiL9kJQgnyQohameNrkWWvuPK+NjKXcfQ4fuTWbAVvv+A
	TnIkcp/TPP1bnX3ni4/acwv5xp9lVojE7bXFvwIc=
X-Received: by 2002:a05:6a00:3288:b0:847:893f:2d0c with SMTP id d2e1a72fcca58-84826c1edeamr5401111b3a.5.1783431802987;
        Tue, 07 Jul 2026 06:43:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:3288:b0:847:893f:2d0c with SMTP id d2e1a72fcca58-84826c1edeamr5401067b3a.5.1783431802456;
        Tue, 07 Jul 2026 06:43:22 -0700 (PDT)
Received: from [10.219.57.117] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d498adsm5372916b3a.32.2026.07.07.06.43.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 06:43:21 -0700 (PDT)
Message-ID: <ca657be0-72c0-40a6-86e2-9a34f763d24b@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 19:13:15 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/11] arm64: dts: qcom: shikra: Enable Bluetooth and
 WiFi on EVK boards
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
 <20260702-shikra-dt-m1-v5-10-f911ac92720c@oss.qualcomm.com>
 <0ac50f09-8a62-4735-99e3-b8e632621ed5@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <0ac50f09-8a62-4735-99e3-b8e632621ed5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gDNUubijlDpijMkctcWqqRnWTQVRIzpu
X-Proofpoint-ORIG-GUID: gDNUubijlDpijMkctcWqqRnWTQVRIzpu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzMyBTYWx0ZWRfX9QXj/MDqyG08
 ViyJR4GOsrUeWGJTkQ+TnTvM9q8pHbjM+0Lpy3oxC0BhCnCpnWo+tIJZTa4NU9I8Vphr2qBkH8E
 35duLggBx4AbHsd6GxB0yT/QMLTsvds=
X-Authority-Analysis: v=2.4 cv=b9yCJNGx c=1 sm=1 tr=0 ts=6a4d027b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=6-GiX-wp50tAbMgTt0EA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzMyBTYWx0ZWRfX3O5SUk2j8/U4
 dn/i3l64csQlquIcrndWdR4RCFnNxfyp6+UamZFFC6MSSjiNuG3riTB1wVz/68Q7b9M2QUphsPx
 umQ+yAL7Ic4VU/Ar39Lq/vMbS+BFyx4VMc3ZNImvJPHdk5lf8yeUq4453Px7UKaoIhVNeA5GcGh
 5sEOLI5lUs6mfCQobgfHivNlRLizG9HvBEOMEW10/sPmtFidlPXBGUTsp0JKCkJKRg8xIEd3SwY
 Weg1xBKLLQKPJfnKm+gqyshN0Rnrd3w/3O4eA8wtfk3f8hbvVMQXjmyf+MDOzMD8Rg7d1osYSiU
 RfAya0jLXkJIg4Zog9a4QTluuBkKvzzY5GML35FRZPaY+ZPiDY3GCAqmxn+mUKc2ScGs2d1x6kP
 w9vt8NTtg+HZp6hpID4/FF20s+ebXHVkECImt+NdwAyW1O5Jkp/OsE/xhTEsv+2W82e36Y3G/G1
 +Bmr+zL9f8sl1+3+8RA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070133

On 7/2/2026 4:29 PM, Konrad Dybcio wrote:
> On 7/2/26 11:50 AM, Komal Bajaj wrote:
>> Enable Bluetooth and WiFi connectivity on Shikra CQM, CQS and IQS
>> EVK boards using the WCN3988 combo chip.
>>
>> For Bluetooth, enable uart8 and add WCN3988 Bluetooth node with
>> board-specific regulator supplies across CQM, CQS and IQS Shikra
>> EVK boards.
>>
>> For WiFi, enable per-board with the appropriate PMIC supply
>> connections and calibration variant selection.
> [...]
>
>> +	wcn3988-pmu {
> Override by label, this works but it's super fragile.

WCN3988 is present on SoM. In next revision, I will move this node to 
SoM DTSI, so there is no need to add a label here.

>
> [...]
>
>> +&uart8 {
>> +	status = "okay";
>> +};
>> +
>> +&wifi {
>> +	vdd-0.8-cx-mx-supply = <&pm4125_l7>;
>> +
>> +	status = "okay";
>> +};
> Since the module is on the EVK board itself, push the enablement of
> these nodes there too

As explained above, I'll move these to the SoM DTS.

Thanks
Komal

>
> Konrad

