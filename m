Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5DC385D75
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 05:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783402951; cv=none; b=pW3P/0sBqKiCfBNXJRDCnw0OobxcLqYxokIHV5R0ViFIcgtZ9E6AWSRfdpRjDpJmNzTbb8eUicXet1mZu8yTHq/xpY112tZfU4waKU81KMaQ8aKsoXc4GK8974mqfmn2P1XLGujt4mlXu6tWWwpNGHLaJhNANbcZ/HeAwSRbACk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783402951; c=relaxed/simple;
	bh=SaJhfRfeCBEEdb51HU7xQP6Qi0RYIjzXwMnuKXaNLHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eM2mzMqh33CrYaiZevJ+1fQE+8WMAnw+VtAeTPuTJUxyDcr9br5zlS9oTqEU5QDi0p6AIQEx5VqMK+0WcUmV80mHK/KTdq9jlufTAuY78V/OQQM53iUfbQXmoqYcrtKZqLmPKBzhiXpAFQoJ6E9jZQEfuBG0Tz9mFM2KEfD9CoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b7z4dGHl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TlA3CvcS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b7z4dGHl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TlA3CvcS"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6674ALbP2501539
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 05:42:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eAzXorLcGHEyoWUBEpjb+W55R9Exavz3+bJHHBPcDIY=; b=b7z4dGHlOeLApk4H
	sFQPhYMYmOHOfJZuCM1WMZ3T5QYfOjM2C4mczoEqaW5VvOMfjQsNfMCexXmuEhoy
	nsOjD+LPuku3K5b2IbWjRPioFk/0DhCh62uuyxV9/3p1TRVQreQA3qioeNLpH/03
	fpKaoYenWDNnpxGnggSIeo4TqPpA9rRvnefkMufPwE/UtIPM5m2EFpEvk6Fe4YFZ
	O/28qjpmHD0d8GDiTDl1gS/1R0eVubo9FqiF2tVrZ8HWQ5nGTY+RxYoFBXBUnzvD
	yJoe51nRCwy7H4d/f0Ii5PMH2jqy/GdpFpau+IhD3d/c9ReNiQ6e3oPJotT34NzL
	QGBK/Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hscsvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 05:42:27 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-845e3ede1f9so4437382b3a.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 22:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783402947; x=1784007747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eAzXorLcGHEyoWUBEpjb+W55R9Exavz3+bJHHBPcDIY=;
        b=TlA3CvcSP5gfJREvPrVbVr4ipJw06s6EuTnJkooKA9ODNfxP8QAlLUsGUEa4NUHVWb
         G/D6BhSCCvar5MgPWm5mPW76ybhi1T9D2X91nSzhtFjfD987q8Mn2woLboWL999e96B9
         BEbw1bmAWZFR0Pl6vLHs0KfSsWdSOAEHhL5Qof3qxNnbYLiUN7y+lKv9yOXk0V/Jj1WW
         BocaGWwhJpQWDyhUIlWdcsoDliSb/WWZPU/yuq++PRQLzsJZnui6g105ijh/fW7gYSk/
         +h08AWATD2KFfiKrh0NzgGUHueIcsFRF31EY+U/JhSz72Mk3UgBjbjjjATyFl8Z3enZL
         AeDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783402947; x=1784007747;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eAzXorLcGHEyoWUBEpjb+W55R9Exavz3+bJHHBPcDIY=;
        b=XdFAIXoCR6Kw8VKHrww3lb7FEr05joaygkXsxxWN9SYmBtc+8vX/U6RJFzATw+EOtz
         Us/00qhPUdQRUpNHA/9PPN6aQwe3xQUKs0JrMC9WNFqtWFooctVQyPWHHnOiNFJRtPLp
         iAVoSrPNsjgIpx52b4sOMuTc7XqKcVtgoTmtAte1BIHcXrMB8DgsjtnIJmYbKsrPCSQR
         c3gA/W85OsgTy/vOpNIRReYbgzcIhwX0uhB+K5C98H/rnH8XeFVfw/fMJ1b1yUNHl1iJ
         WG/XNwsxdgPUfodIsMkumQV7fVAB+2G5lHwaWZD9LOPI69QMIC3X5RQ10CZjRkaWFGvz
         ueKg==
X-Forwarded-Encrypted: i=1; AHgh+RpgX/KLHpShyV3EcuO+18iRS2gggHwx1502dswF+wJ9y+J6TE35WEPyFSuqeHLoRiu/8vV9mhxylyJ+@vger.kernel.org
X-Gm-Message-State: AOJu0YyzihOYU2TKgK6qEZ9SinWR6jrDg/dssssBF7Nx8YVsMKACmYKJ
	T/jBmjCym2UFRo4Fu5xLwBz2SxZyY41kXs5lNszzJ5FjwGiumt4rfhEWrjmxTXyymdIYkBwGRYl
	0qqC4hbtl5hyHgEHde1UbtZ555rM0Ob43jscJ47whroA1v5fQX9RNJCvVRbC2049z
X-Gm-Gg: AfdE7cloPfulD30Bq1ey+u0YM/al/EzOBypgk27YDECRSq3mEhDyhCOsdVHBBudijku
	7EPONp1gGt6eCLNnc7vlm68p9ERmmo12qn26cKIAE6si5/eWwFJcpqw8Cd+d6eetYc2XZI5mw2O
	ARsCcAHIPaQRSICfOOVtES8ehP1/nWp3LjVcrgT5PVthWpSKT2IUusIJ6q4lF2bd1c9iXPaq304
	QybnVtqn6miuqBqHqUTcULhjHRtvq2xSwHFZJjBSKYsNk00EcNS8h+gEVK0LnbLbaS5RXkrhdoI
	N2NMavtq8XsdebICxKXaSbd2bmjbzfD/HZgGRz4jvOxoe09uwW5e8V7Yx9DdzifFiB9cVdzKqX1
	N2jjeHA1hi741x8GSJAXBNhKiUhcgACoIeJ2ENvbMkmeL4PywTvytYisEML/d4fAgUJESzPF9mx
	4BivRO
X-Received: by 2002:a05:6a00:4091:b0:845:a435:a2eb with SMTP id d2e1a72fcca58-84826d3e479mr3223199b3a.31.1783402946563;
        Mon, 06 Jul 2026 22:42:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:4091:b0:845:a435:a2eb with SMTP id d2e1a72fcca58-84826d3e479mr3223164b3a.31.1783402946056;
        Mon, 06 Jul 2026 22:42:26 -0700 (PDT)
Received: from ?IPV6:2405:201:c409:b03f:6d0b:bb83:7a67:4093? ([2405:201:c409:b03f:6d0b:bb83:7a67:4093])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d496besm4787914b3a.36.2026.07.06.22.42.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 22:42:25 -0700 (PDT)
Message-ID: <9f938b35-9102-486b-b4b8-0967b2aed1b1@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 11:12:19 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] dt-bindings: PCI: Add bindings for endpoint gpios
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Helgaas <bhelgaas@google.com>
References: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
 <20260701-shikra-upstream-v1-3-e1a721eb8943@oss.qualcomm.com>
 <178285172702.288391.13610342196466613275.robh@kernel.org>
Content-Language: en-US
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
In-Reply-To: <178285172702.288391.13610342196466613275.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JTefjuKsNQ1ZSr43nJMiEpUxaH3W80Gw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA1MSBTYWx0ZWRfX+KwhsAuad1n8
 czoDVfePGwVfQC1DeA/f90t5Em4xt4kJUFC3zbJKizX9XFMI/fwSnXv1LVbsctmnIbdWzhE+M35
 v+p6ftvTc3+dXU5LnUFcJtXjbHXxpJ8ODXDmMMPc+NHCp2radPK6xp3coS0ZUKFZrV7jT2l+cev
 Hza29dytJE0Mhxldzme5ywi/YJrUn+f25REcwAtIHWWT1CzKXbEeAMOUGWJDUAfYLz+3yUVIBji
 7ouTCxIaFgma1/p84PSaueaaMeaqdX+/dWvy7Jd/bLd5buf4kDi/hucWtbDgLiRsygyQtYnzxeT
 gXGYs1wFxFA5A5o0pgH2oQYZDJ3xbIGVGH/VBftZpuiIF72vfgw6Qg/bzimT24RnnW65B+FNjOL
 bb7yi9BkueEp1Oinu1Jw9ESLC5+Hnwf3xr3NSryS8mHcI0CESKWQvQ45Qh+VNmrdMPJRALw70Uh
 yFNnlxdOpygQ+iTn5yQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA1MSBTYWx0ZWRfXw/zARIqVFhhb
 RehwfrZPoKiWVRT0Y8gROZTXUOjTIRhNkWWadKZeOJ37lbwx0qPRNY3ILC5/3o+JAXjr5x1F/2T
 QkSDPa8knxKpiakEKVL/PxHb0JJePeg=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4c91c3 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=QcnDgq45NsFIHwn4wVcA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: JTefjuKsNQ1ZSr43nJMiEpUxaH3W80Gw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070051


On 7/1/2026 2:05 AM, Rob Herring (Arm) wrote:
> On Wed, 01 Jul 2026 00:32:45 +0530, Sushrut Shree Trivedi wrote:
>> Add devicetree bindings for TC9563 GPIO's which are
>> used to control endpoint power and reset.
>>
>> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/pci/toshiba,tc9563.yaml    | 22 +++++++++++++++++++++-
>>   1 file changed, 21 insertions(+), 1 deletion(-)
>>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml:32:9: [warning] wrong indentation: expected 4 but found 8 (indentation)
>
> dtschema/dtc warnings/errors:
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.kernel.org/project/devicetree/patch/20260701-shikra-upstream-v1-3-e1a721eb8943@oss.qualcomm.com
>
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.

ACK'd.

Sushrut

>
