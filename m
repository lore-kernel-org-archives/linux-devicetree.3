Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC47156C6A
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 04:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777954005; cv=none; b=Kj6t5C3J4ANU7P4k2b891Rg88znHnuuQrrLz22rlQ0cBpZQUFOnMPzp2axKXTzD8lni8bzlh9gMwMhCZsdMGVD8rpmedA+g0zp01Gs/VQVz64cmviUOvXjW+HmGpdOaElbuD70NZOhrBP+fPtrkKF0Os59hSQQe4wbH66R9Q4Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777954005; c=relaxed/simple;
	bh=F2upz59DyprDtwG6UHGYAXGVnfdJHegg8orGJRtcxYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hjm0Bguxv6W044Aqa31hQ9hW1kzm1vEsp4ryGJaBuhHQQzCGcAwl71Lp2t+3GDvjHTUHiG34nEpq2a2jJYz9p/OXRFBKndoRatnO9lKosQMsULqgDY4qnynou9m+eKvt51PoU0yLW0x5dWgRE4OGUMbt4SCh9laT3CLN0LJi8Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fb8xnIsq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hXGzKOHX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fb8xnIsq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hXGzKOHX"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644MfZsX1346370
	for <devicetree@vger.kernel.org>; Tue, 5 May 2026 04:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4pZbHtSbvA1uDcyWdB+000WDtZcm6g9KXWfPaacKoe0=; b=Fb8xnIsqLu60Bpip
	zEGtH2p7Va8tSUKwiWZ84cmfvEHmIV2GU3n0dGUpjHvdp7Z4OhyNT5C1CL/99N6p
	mWIrX/QoXQ6u0tQ+4/8gSw1fxYy8xYTaFkDDhDP76aMSsdZiKkl5D5OHPhZ6DBl2
	ommfTN++g3GsFqiVQp4KItTXc2hTnrlguVbRw/vAZ4GHx8KD9J2re2Fe4ePN4RD5
	d4sXfC+ZN+MUkYzZQaUDSwc6E2k1+QWuztakCCbLhJmjWRIc0Ba1RLxtOhf9moBr
	Ot1RrJvhE+eb1Fxbm1ummTFZz4Nmr5aVkeDTfWE4j9xptNHeBHn+alk48w+Ybq/o
	3xWrUw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxx2xa8d0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 05 May 2026 04:06:43 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2cc75e79b97so10252477eec.1
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 21:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777954003; x=1778558803; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4pZbHtSbvA1uDcyWdB+000WDtZcm6g9KXWfPaacKoe0=;
        b=hXGzKOHX15lWPWSEOkgvSWHaLpzkTsglqCUSP3bWiFY0GMKcGW3dOcCALa+qt218Yu
         yyiVILK/XgjkaLqQRceZsA8GRIyQtxhNS2lwcYWgLwTx767gBYheLwA9o3jSgNyhVV2m
         yFTVL6Q0bWx2T/q6tG2gGkmQ2/7cRT6aLFhQTgDREVnnS6X4WB8H/dryW5DP49Qgs/UZ
         BKO6AQJe9P/Vo9vBAWthyZ2Tv5YF0ibcLhhJdbipj2E4SrUPkrA3sFW2yuC5RBZ93z56
         el6vL7LPESrpsBjUIaovZEhVYFmZXee0UOQtwQzvLOcN+WSgBDfSwnI4RdAWOGuAg/KW
         kTWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777954003; x=1778558803;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4pZbHtSbvA1uDcyWdB+000WDtZcm6g9KXWfPaacKoe0=;
        b=JgZjjIOTDOG8sc4z4z/FinHUQRaPYzdvwzv9gk9g0h9IDkDf60FG1XT23NFzGq85cw
         eL4NNbFizgfz8h5zPB1+X0BXgbzqgtV4/fSAZfSXu/lzXW6oT3A9Ie7simJlB15Bykuj
         wTTnsaO4FDSnyA4cRdZBTZnQmLGHOChYaMIxDX7aDNdQflWyicAPb1gdQzhgEVZXgo8l
         kPqFvoYCcy0XdR10zEW/k394KPB2SqIJaYPiH0AVoXe4AfVsGtry2v3W7k8KsI3mWHKk
         +EgPRAvFE7gA4jRf3/Bu3Rq9OsOIb6Vb/54f2g0AiJpuFtObN6v2xtahL3XE7RK223NT
         10eg==
X-Forwarded-Encrypted: i=1; AFNElJ9hiHHx0f84TANHZXo3X1UDc2svc7Yh5BY5a0f611Q2/TPjs2itG9AMXU5VhnbonZTrGRx4BKvz4ej4@vger.kernel.org
X-Gm-Message-State: AOJu0YwPKB58+Beb4qd2zG6eLF9gs/gsxeuJDU2odQja8L5et3ji2j7u
	KuUIXfeBvVH2WVuNvwJHHSCKuI9qd35zSX4amVe3nvyKS2nUYOd55/MUnf/Kb4eusKkKktEDaXP
	bBjifVYIrUrYF/z0Gawr0IXvJbTlLTDMFLeeLb8dxWJgJrhyb9j6bpnKGnbpvc9Jf
X-Gm-Gg: AeBDietfHEc3MDmwdx7jpxn6/mknC22uux/IynEZIfKb5vrImtysomwAFdTdoU9KLVA
	090xxm1HWDKzxjtjq7IUycfcVh6t1RWCHIFwA/Ig5IQcug1+vI+JuanJXxY3topAVLMu4dP1sPs
	IF0DzDgqKfAXWD94Z8so74WhCge63BwkvilOlRIfIX3fPG4ydNnNefJKAVbK7hQsqsjlKUnv7tB
	2CP6xP9MCWhHJH1/oocR7iP6iBa/CbiFl4vJbF1vNZ3ZaMF6/7q9qkYR/sGlth1Nc7QiKZBQE3R
	TWvViNCu4W+4SjqFeQRHibTfniF+nc6cSYzFF/A+y6Mz2YL3CIGkDgQ8vHus3/wIIs3wfCyrY4G
	4inE1C0W/N2DG93ipXZBF2534vjLSNE9sQVfIhk1ROa3fsv016H7adfMbwv5TuNreC3guWAUOST
	4M5zTKmBil4CRlp2HLdvyh0KJu
X-Received: by 2002:a05:693c:25c4:b0:2c7:3a7:c7a7 with SMTP id 5a478bee46e88-2efb9f808bcmr5821721eec.25.1777954003004;
        Mon, 04 May 2026 21:06:43 -0700 (PDT)
X-Received: by 2002:a05:693c:25c4:b0:2c7:3a7:c7a7 with SMTP id 5a478bee46e88-2efb9f808bcmr5821705eec.25.1777954002507;
        Mon, 04 May 2026 21:06:42 -0700 (PDT)
Received: from [192.168.1.2] ([122.177.243.246])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f28f7ba26dsm7520592eec.10.2026.05.04.21.06.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 21:06:42 -0700 (PDT)
Message-ID: <230aef5f-43da-4b7a-994c-7a63b631ae8e@oss.qualcomm.com>
Date: Tue, 5 May 2026 09:36:31 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] phy: qcom: qmp-usbc: Add qmp configuration for
 Shikra
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul
 <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com>
 <20260504170659.282532-5-krishna.kurapati@oss.qualcomm.com>
 <gb46nv455vfkldkhvlo7c26amuonrlzvstirdpbzictbqgyxox@6vypar3byxhs>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <gb46nv455vfkldkhvlo7c26amuonrlzvstirdpbzictbqgyxox@6vypar3byxhs>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=U9eiy+ru c=1 sm=1 tr=0 ts=69f96cd3 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=SdbDppvB4z130zS5fHlqzA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pkhheSlYpZ5lmKqxZU4A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: lDdpx86ZMboQhN_L4E6VNx6sKNhjaEkX
X-Proofpoint-GUID: lDdpx86ZMboQhN_L4E6VNx6sKNhjaEkX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDAzNSBTYWx0ZWRfX9lYJFUUGhtZq
 6eVH2YbnbMye6RtmNoK19T1i/ykc/Up7V04XAOJ+lA9teq9UyewO/nCYgL29Qa7QfRPNqWMOybi
 lazAT6K4hrdWX5kONkKO09p347tzH1T9pJhWB1+PPCWA+iLVxVI0LZuJEcOWFIxB1+yhXyLbqPK
 ITHndzApuEFcWDWhFheI822dM1A4JLFEsI95GOnHGarYxb/pCbR26Ys4VGTBkHuOWmPwq2+WTpp
 EuPPNXm64uNyn1Y7zwui2AMkvqa9bYEmgWe4F5I72Ptd2TBjF1fOT4StTNCHs0sqEBvPhuLl58E
 qfE27ydIjACsiwIzdfkJ4FUHt/XoylVk4rFS+7xVKDqI/2TTyhXZv8L5mOfz9ea3smmhoT5w33W
 BPSmAqxmyE0GLzThmUUR4Ub+zKa+ly5KcNQpIpMGGt7Ifjf3Fz+bnxqRmkNtdm5lq6Nfs5vcoUc
 km8ECzaZEJOeQwcC2ew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_01,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050035



On 5/5/2026 12:58 AM, Dmitry Baryshkov wrote:
> On Mon, May 04, 2026 at 10:36:59PM +0530, Krishna Kurapati wrote:
>> Add init sequence and phy configuration for the Super Speed port
>> on Shikra SoC.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> index c342479a3798..400dcebf8222 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> @@ -2019,6 +2019,9 @@ static const struct of_device_id qmp_usbc_of_match_table[] = {
>>   	}, {
>>   		.compatible = "qcom,sdm660-qmp-usb3-phy",
>>   		.data = &sdm660_usb3phy_cfg,
>> +	}, {
>> +		.compatible = "qcom,shikra-qmp-usb3-phy",
>> +		.data = &qcs615_usb3phy_cfg,
> 
> If we are reusing Talos configuration, should Talos also be used for the
> fallback compat instead of modifying the driver?
>

The clocks are different and hence I didn't use fallback.

Regards,
Krishna,

>>   	}, {
>>   		.compatible = "qcom,sm6115-qmp-usb3-phy",
>>   		.data = &qcm2290_usb3phy_cfg,
>> -- 
>> 2.34.1
>>
> 

