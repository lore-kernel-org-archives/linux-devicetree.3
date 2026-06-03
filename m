Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51E0389441
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 21:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780523218; cv=none; b=E5PM++xkuK8WG5p/t2J1czQh/5xN5orTOM6nkJYaKY5Tn7K8EF5a2ZQVQX3WsA5CdMUwaw6i6gjBuceV46UTOV212QFLa8J06l6o0XS8RjL3Vu1KNZz00NjvQebWPs3VA7TFf/9O7r0KqyPkMZoNlLeyi809Td2iLHsrcde+wMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780523218; c=relaxed/simple;
	bh=oeYALUtDYRkyR7oPwz2HFEy/K998aAgoV+N/hPqd17k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j8ffjTgMmrfZAISFeTKLkd095wmazOuZ/Vd41rPoKY1XUkIKdbRyOKhmR6SYP+5nS58Kar5R9LR0K1dhj242vqoo2wAdQf0fv/XjbCc6Tg/eV7uSPSWCzfdjrO/n6NmMYzgkhFdD3uiML4VSeTvGlKFmyIwT4eFA5wCGMYB+keg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dtOMp8RS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ONrGrEAb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dtOMp8RS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ONrGrEAb"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653HC3iF3552292
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 21:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YI4SVhkK6E0eWN6DtYQRlG4n4FVt4g9e2Fn1B2lcMFM=; b=dtOMp8RSacUZoCYe
	efjvGKC+HAT7c4p7w5nn4raTde7oWIY5XZlQgiRfGawn8NrHS9oFSxPGWbOR1n45
	MIZnFNNphA3PwHJNnaqkyKQSIK6zxhABvK9/wHqTMtJrHLONWZHrEWFLYYefwj09
	reHvVmClMJxAzr1vpptI5H4u22+dosRl3wOs1LuywneUwJcp8lTBZ0/P8WgWcC6I
	KP1E8waRuSlG2krZMV8ig9P5eGZ5C7AtevDb0q4h4v6C9zj66jQfX8+DWkkmNgpD
	Yjzss6O8AOrKmUya8ylbqjE63vsZC6XfcZKGKh+EYD8hxIEnX2jFes5RTuD4BNiX
	u5a3Lg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj9mturj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 21:46:56 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304d8613efbso7444596eec.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 14:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780523216; x=1781128016; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YI4SVhkK6E0eWN6DtYQRlG4n4FVt4g9e2Fn1B2lcMFM=;
        b=ONrGrEAbG47obKukUm9JCF4K0xSgJ7sAEhco7EMWcG08HHUV6bx1/jJXYgPreQo8xM
         B4u1O1htL2fecOFJoah6jRi1Tgu0+nQtZYDpQBmwwkhSNDi2yUWpAYWJR3Cr3q7nzYVN
         V+5YoWty4mASFuQAa8JGI3uz1+EDxBzVlFNll3iCAisIkg14r/dQ0FzFlh3PVyC1LjGI
         yN4hAfjjehl1IKVsuYl9LKo2tObYidSLU18O9n3QsrB+eoBSinymMaCpVdgr3E2rcC4T
         7NqlmP0sNoXpH0oDG/AzM8pjsFt0EC3TUT7Cdg2nvZwNvwnURSvfAbPJ6qsUz2v/8pjW
         cQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780523216; x=1781128016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YI4SVhkK6E0eWN6DtYQRlG4n4FVt4g9e2Fn1B2lcMFM=;
        b=YZ49SeJg+O+jqnz2IZbWCkRZPzyMizbuKvzO4cL9gVcGdDu6/Y0oPjwEoa3b1GWX2f
         QXa76/JxY4c6uhrfq6JXZ64/26YIgAveVTVTWxcFY/Ql2nS5p6jgJV8ziCF7IMztBIjH
         AbjXFfXWdmLqDbAG18fJ2iNMXmtLveQdxlqZEcAMXkdZyWS6BTM1nx+R82L+iSA5zMsb
         YoC5Cs0pbi0iJ+cX7mQ2R6bSc5UnGQkXP+UKIr59EJJUOjM4QTMzmFYPLk5XR+hajXMv
         Rp96LPD0TdxKcpzu7iCZLNNQzViFOEWToa5dLdFt10m+AyzTR32wu9L1q4YjeDC8YEyk
         bA/Q==
X-Forwarded-Encrypted: i=1; AFNElJ+gAFlpOZOJmIX7ldIPCQr/8OzwZu29E4QqTv667FPWNGfKSsndBuVT/c6gdsyH51IpTYQHgB/z0oqt@vger.kernel.org
X-Gm-Message-State: AOJu0YyE+pSCQ3BPK18UTB20Ozk7/M6PwVMlP2Nvy/bMJ1FTAlVWIKxs
	hXOp3P6BgZvT6/HPX9EBVjzDzPfu15HrFPdH+2MtSzOnamwsCwaTqs3iFAYQTRuTYkqnm+VlT/F
	lmg7Zwdv2Q7flCOTKLty2kZYKpztDGr/x3KFOvy0eGQOkotop/0dEM6FoyYzeDTPC
X-Gm-Gg: Acq92OGVfh4N0QVFpV2UH8QFm+ciS9Se3uL7RcQjEc+y0YTCHurjuBK8VqZzL8uCea6
	i9A1jrnWDq3NGuwkzosoYlvf+uBxkPtYc3o4L+k+ISVOa80a9prLwipYM91XWAysPlmO/ydy27f
	iuh6t/DKVWDd8NplXvw9URrcTSW/Bf1EaxNs73+jNEjbCkTmryxQToHpq+4uJKUmn1VS0NuYvQw
	JGHYmAmlyj406z59K64KyLtLNrBrFEM7u9I3RCfytgfBUN0ftGs6yTMzDaL3W8+8v6EoefkTNmy
	ZBT52IZ9tGAGoBHzoSMugHMLlRBKGRv7j9FDCKLsVXPc9Iy8Ude/2QFO1oaOHkbfjkoWXYFzu3a
	uP80rBu9DUuZXNqrI3fWPyqI0N/ZBXAIL3W8o55W83rO3pYVgHsWQtcClZZGLuJvyUWJQnoXMoo
	HmKCzXXxsxqOI=
X-Received: by 2002:a05:7300:7250:b0:304:997c:d4b6 with SMTP id 5a478bee46e88-3074fb4847bmr3287892eec.17.1780523216043;
        Wed, 03 Jun 2026 14:46:56 -0700 (PDT)
X-Received: by 2002:a05:7300:7250:b0:304:997c:d4b6 with SMTP id 5a478bee46e88-3074fb4847bmr3287882eec.17.1780523215500;
        Wed, 03 Jun 2026 14:46:55 -0700 (PDT)
Received: from [10.62.37.26] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db85e10sm3362286eec.7.2026.06.03.14.46.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 14:46:55 -0700 (PDT)
Message-ID: <21facbaa-c001-4e82-954d-f2f6838d41b3@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 14:46:54 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul
 <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-1-a85668459521@linaro.org>
 <rpnNMsR9GY8gbynzeBO8Zm61JAOq3ubt6sp0x3WDPPwkMAJzlcofECD1kabN-IUoK6sSwP5P6l28UIZLFCOpjQ==@protonmail.internalid>
 <dda32577-04e0-4507-acaf-a5694f4f31b3@linaro.org>
 <478df3ed-d4ef-43aa-bb84-e2075798542b@kernel.org>
 <ec98ef2f-02b4-4086-8b4b-07b6953dbd20@oss.qualcomm.com>
 <514cf213-5778-45e1-8d70-d3fe27991fcc@oss.qualcomm.com>
 <7JNJ4dUNz4ennJ5dkzhfLSuVo72JpfZAbprICPRqlRYnSzVDJw6x3h-1nESd_PK-3us9f1V3qOiLiywsTqP8vQ==@protonmail.internalid>
 <f01c0e22-4e5c-44e7-9ea4-4bc8d53aea2e@linaro.org>
 <29e8491f-20e8-4082-8943-66bee7e3af1d@kernel.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <29e8491f-20e8-4082-8943-66bee7e3af1d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: g3-XT0uMwDA2ywpRnAoz5caOM2MChDYB
X-Authority-Analysis: v=2.4 cv=XK0AjwhE c=1 sm=1 tr=0 ts=6a20a0d0 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=R4he3g2KxIACXk2nk8MA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDIxMiBTYWx0ZWRfX/wRserkeUF0x
 XnmG4bSWhyXBFG1Nz0qCzT7yw0lJ3uscsJJfXs08TTcZfjANdXde4qEVAZ0Ss/WTiIbkOE9U9O3
 aEnrr3c1eRBEnsB1D6x9s69ewyBWSclb/QAEVqVLtr5MNvQd0Gx96F2+gKtpyYyC2E1Epq7twZ+
 iWo4l45JLH6hQk69Ec23X2XbZ8AdtzJKjQSy9v1/4wN/3W5YE5tdj1iqq0Dh8CdDCrXo/BNuHMg
 lTX/bS65Ha6IjalWPcqsXT9ljht5jm8Yi7iP/CXGrCde34+TMC8Qx16F1GxI71KhR0o7fbw6IG9
 6rRUnurwYzp09wYxNvX7zP0uYGJ8DTFHDdSM0emBrUbhzaeI/Thqpg/+DjekoS7FHCuFOiksvxQ
 RWrgDGYbii3G5iNOSBcOivJ/1nINesCxUAVT16dviX8aj3X9ad7+VCwQG2EE8V0AFN4m2HOkTUy
 MyLGCe1JKlLseydis4A==
X-Proofpoint-ORIG-GUID: g3-XT0uMwDA2ywpRnAoz5caOM2MChDYB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030212



On 6/3/2026 2:18 PM, Bryan O'Donoghue wrote:
> On 03/06/2026 21:51, Vladimir Zapolskiy wrote:
>>> Actually, one more thing, Why isn't TITAN TOP GDSC here?>>>> +
>> If CSIPHYs are true subdevices under the umbrella CAMSS device and well
>> described as subnodes, then likely none of power domains are needed to be
>> repeatedly described in the children device nodes, since this information
>> can be obtained from the parent device by the driver.
>>
>> Technically 'power-domains' property can be safely removed, I believe.
> 
> The policy is to describe the power-domain dependency fully since DT 
> describes hardware not software architecture.
> 
> Also for a very practical reason a sub-devices can probe/run 
> asynchronously of the parent device being active so in fact we do need 
> to describe the PDs fully.
This makes me think. When the PHY devices are made the sub nodes of the 
top camss node eventually, we can discuss for somethings to be avoided 
in each child, which we can come to later but for now, you need to add 
the top AHB clock as well in the PHY node, Bryan.>
> ---
> bod
Thanks,
Vijay.
