Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF7F3E765A
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 16:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791994220; cv=none; b=Nc3g6d9kx1x/WXsxyWFVg8cYTxcpsFlweRDgdUkhLiLHqxyKb+8EwFigx78zoYQHlxF6Js4LlSaCZaUXM7OWN1/CPTph/r+/2veBIHP8/g9PfeLFbBZJNmW+K80VDBzdhmjTSiLeb/DjxE0c/G18FsIVdnRbxMdGEt0VcvRIgnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791994220; c=relaxed/simple;
	bh=d9AZ1icpKYyYzs2G88pYV++7oRZ7y7xW+WF6rTZ94hQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l2Dadru3NBjvEO+a+jl96f0LzlrtVEqDwBx09+OBnF3/uOPVyT4kiZOD5d338YcAOfHxV5gRrFrH9+wWfHJgPmqGsmjsFvY1ffShCxj58lKBCTS8XGykBp1Nbc7MARiKqlYhAAYbz0a2PYYhx3IHxr/16atDAI+1ru7wMLJIYWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o1qBldYU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aJ0/26cv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o1qBldYU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aJ0/26cv"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEbJuF3642818
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 16:10:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qj/1rZNvt2LirJIMlx3gBCi7fV2daYoXIXFAvUvD/kw=; b=o1qBldYUgfBT0Wyj
	lXIe2uKqgeyhqOtQPoGW6iuVtRynAPqqzMzlW2wXqn1A0W7AxuOgGZPv8mk7OwfE
	7aNrA0jCQ/E+nM8M/4UbJwO+nkdq61lXxvMRUYKZhz9Trv5vmfmXNMRHoVCJ3PMa
	aw7zV8neGhm4Tiu4ke7TgQLi9dx6LYcvz0U+8GScZEhDInP8fPRh4BxjX8hgI9To
	sk2IiOleoupJzsDZBjNz7IGnZe3KM+oj9MPWpTljbxFTU4W4TM8eCJNyA612FqFe
	M5m/4OWHOQMNIyr2Wj1k8sHwSBsF2PA0kTt5SMGm4jjnZ76pT8VOaq+hFHXSLt+/
	lvokBA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha470ad9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 16:10:16 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac6795617aso517292a91.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 09:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791994215; x=1792599015; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qj/1rZNvt2LirJIMlx3gBCi7fV2daYoXIXFAvUvD/kw=;
        b=aJ0/26cv01m92AxYvpERc4rKjvkVyJrb2IMsxvYc77UxPw8+2uXv8hPjj1z8dq+ul1
         qt3SWamSOKrOkjJsViKRAmuQsl4UwdNCjEmE6Ech2UM1s6hyZu8r6V43wQAu+WveFShK
         7UpXcWdQktfDi7IqjOShNKU2dJjgYWUlZmqVNsYkvGlOD2g2StzxgPjrofkbC1qFXztb
         DMWF1reBWi+dB+qS4K0l/RrCU0CEvvZpc4ZRF89NfueDQF1LlHwX0O6jbq/7pUzehvuV
         t80A1sZD19CRFQVMwlwiqDFY+ePRNqq1oLAsIp4ouJj0hWdv2dtET0qPQDF0iOz+CqQG
         eGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791994215; x=1792599015;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qj/1rZNvt2LirJIMlx3gBCi7fV2daYoXIXFAvUvD/kw=;
        b=EYujRLVU4Wz5gw0SQKVpO6WDvnNchM3AmrlvtBDiRANWe6TnFIr88eJMPhDiet8s4Y
         cAbO5fhxuuk9/0HnVUWIWlPZU0TF9sU52T99q4+WZuB0pEVp6opxi2zLTxC5C0BElikM
         tSKPewJVPqomk5u0HUBQc5OCmlfZBDZn/iZBZ+3HUyJPXDDkdS1T2SX9hTiqSy1wiEYn
         THN4eA6etVMLt6Lm8H5DEtUF48slS+i0hrCTFyxdfXMf00BJ57s/lp3v9OVEksLfM+sE
         t8v46GhGYR9uEx/0z1BqFF8VCrTL/ISUxisJdZ+NXDgloPlX7J5CRsOIhnllYFjXgiqV
         Q7FA==
X-Forwarded-Encrypted: i=1; AKwUvBy7H/kLel53CX6IbaSZyqWoYbmDaALo3Q9UcxwnZghWhMeVdysvcK5YjESopyJOyNyGNWkp0mZ5AOG6@vger.kernel.org
X-Gm-Message-State: AFq9FYLKxHsBEwM141H66c29EYZDSnt45aeoGf6wB2/miap9PwR11VYF
	jnmFNCgTXDkUOmJ+Sd8JX+iMNcCcd1QfqYE2g3TwLc7zE5SCQA5gpf6gvQnRaVjzyhHPJ5I1Rz7
	QR9urqBL2z1vUrPL1zjLJqZwrGDTRHCFmLsnmjmI5Vlht8X1ULHmuCeLwoQ3PBr+5
X-Gm-Gg: AYBFou0OzZCmMDSaalT9A0lpu7QK/GniZE90jYO37lvowP/4ioRUANGtDbeIkjSsr9s
	6oJror8v82gCYvOFH6nfQcNc6RhXuXKdFGc672EKqMx6h1uMGQ94pb8dPInOb0fxULSwjpMS/W5
	Nh9ElstG886kdSIufeAcPC8DwpQ0rsJfRLSMV+xGNZN2T0deUdrHg1CfN1lz/ON4BT/hyYp3cY7
	9U2aSFhlhtiKG9JWFGgLaygv9cwKZj1AzZFVCwzZiWu/PaCcnDAOVXKbiHctdoOMtkRKS41WoxL
	YUDHXjKOYX+VtGE4IlKSy+KjVeCWD9ooEzHuYmJ/QF/PIiaavw2I+1UCO/G7iATY+bTFNvlIkrn
	8kDcAnsY6NIIfWKUL/n2onlkmF+MdO6cKLVCEbQTjkJU=
X-Received: by 2002:a17:90a:bc8:b0:3a8:545a:9e87 with SMTP id 98e67ed59e1d1-3ab3a747e4dmr8849400a91.15.1791994215105;
        Wed, 14 Oct 2026 09:10:15 -0700 (PDT)
X-Received: by 2002:a17:90a:bc8:b0:3a8:545a:9e87 with SMTP id 98e67ed59e1d1-3ab3a747e4dmr8849367a91.15.1791994213975;
        Wed, 14 Oct 2026 09:10:13 -0700 (PDT)
Received: from [192.168.1.8] ([122.164.80.129])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd635c9792esm49825a12.22.2026.10.14.09.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 09:10:13 -0700 (PDT)
Message-ID: <35bebc3a-8172-4c55-94a5-18c4047f7090@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 21:40:07 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/11] arm64: dts: qcom: ipq5210: Add ICE support to
 SDHCI
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
 <20261012-08-dts-v7-6-77bd3d68d850@oss.qualcomm.com>
 <a7f04052-37d1-452c-8755-013e6e16414b@oss.qualcomm.com>
 <as8NHH4j2SBkDYnC@hu-varada-blr.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <as8NHH4j2SBkDYnC@hu-varada-blr.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2NCBTYWx0ZWRfX62J5vXAhMrYo
 H8EUgLXtxn5K2AtAjbCUHtSAVZqT6JJBsXaaGT4SEXvYDSE1+aHE5whYuQJaXci48oThVQW8aJ9
 hvqFHMPHkHokh0kVTNqKTRdI1qwOj9R/3AoKFrYegYt/G7Q/lovqWud77frAk+yi/7PGj7j7RCs
 +10fMAE74386fWPhMAkd6JzUNGKVa4KEa8PGbPEqrW7kK02XV99kR1ZVMY5TOJe+n/xZ8/Lbhzi
 FDqfm1OnT4QxbHcZJ6w4ydo8cBaUguOVaQPmM0qRB9qFDZpdZokN+XhDCbcc8QrKub3ABFsJkdw
 PvHL7bXC2zH1wEyPdbfxsNLY6np1H9vrXEK+td/Kn90wL+EiTmQbrLPISxMqSJOOg8zYL+pH3dE
 +5WY4ttVZVcoBmDe51Hw8mkWnfZ+/YulhjvY6Xk2SMKARRkesFkyDvvehiBT3DbtvvDYKpGn/8L
 o6GDWSio6kas/ZHuPPQ==
X-Proofpoint-GUID: D2YHX1LBo_2wU0Dgc3potQpV374PZKvR
X-Authority-Analysis: v=2.4 cv=P6avFSAu c=1 sm=1 tr=0 ts=6acfa968 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=vSQal4Cqo5fxyC+YxRTyzw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IlWm7PwFmQ6qje7k7KsA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: D2YHX1LBo_2wU0Dgc3potQpV374PZKvR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2NCBTYWx0ZWRfX9GB86iGPCwmD
 kSDnAPptVVF8hkYbX2WzwHTarB4JDlR3ZqYPuuEGD9+IpNtCjqy6EobNYUHFtjGiEY5l471AcJa
 tR7p4RmwJa93tSAK/mtXJMX4dUyRvjo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140064


On 10/14/2026 10:33 AM, Varadarajan Narayanan wrote:
> On Tue, Oct 13, 2026 at 04:43:36PM +0200, Konrad Dybcio wrote:
>> On 10/12/26 9:23 AM, Varadarajan Narayanan wrote:
>>> Describe the SDHCI ICE register region and clock, and enable CQE support
>>> for the IPQ5210 SDHCI controller.
>>>
>>> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/ipq5210.dtsi | 15 +++++++++++----
>>>   1 file changed, 11 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
>>> index d28d68a10958..c14b42c22616 100644
>>> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
>>> @@ -416,9 +416,11 @@ uart1: serial@1a84000 {
>>>   		sdhc: mmc@7804000 {
>>>   			compatible = "qcom,ipq5210-sdhci", "qcom,sdhci-msm-v5";
>>>   			reg = <0x0 0x07804000 0x0 0x1000>,
>>> -			      <0x0 0x07805000 0x0 0x1000>;
>>> +			      <0x0 0x07805000 0x0 0x1000>,
>>> +			      <0x0 0x07808000 0x0 0x2000>;
>>>   			reg-names = "hc",
>>> -				    "cqhci";
>>> +				    "cqhci",
>>> +				    "ice";
>> This should be a separate node, like on other SoCs to allow things
>> like frequency scaling
> Not sure I understand the comment correctly. I checked agatti, sdm630,
> sdm670, sm6350, talos DT files and they have added the ICE region similar
> to this.
>
> Can you please suggest an example, will follow that.

Kodiak [1], Monaco [2] has a separate ICE node. For the frequency 
scaling / OPP support, series is still under review [3].

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/kodiak.dtsi#n1085

[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/monaco.dtsi#n4883

[3] 
https://lore.kernel.org/linux-arm-msm/as9ksJKk55wYuoOS@hu-arakshit-hyd.qualcomm.com/T/#mf3a36cd811e7933bfa184366aa77b3f335c5a3ad

Konrad, I hope you are referring the same.

>
> Thanks
> Varada
>
