Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D12272E56
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 07:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783410706; cv=none; b=m9RrbV4TMnEViu4auDUAKotQrCxvseKiR1kZbJHuwtBRFNdgWVUSA+7eeLqUb3Tmh1bFjTZqpiGhRWoKlPith94vJEz5iW9t1NR9EyQHwTms4nCkh243RzW8YHLM/3TxtXOeZMg7EgEtPU4suCshhHCRSpdRRMTFNJc8zQV37pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783410706; c=relaxed/simple;
	bh=GTQCbbONJYb5DhiScbASo8gdRnlKVRI049kQ1W70M00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KrFtrXLj1VMcYbY7Mk1nv+er9X06bqAk5clvg7dx6xaB5T5DNzYPPjmbYjwJBqdtYYaQQYT5ddNNKyT3comu9We1ZhYjGE3+rmar5XDYifmUfMzwqA1Txna2OVwpZ+r1aEPaohhqNQTcuQ3SGehgL6hgxLGflx7x2E/Xu95TLVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jXYE35xw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T7kzjK8O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jXYE35xw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T7kzjK8O"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6676WEH02964328
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 07:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qGsKHl4+WtIZmZys5q4B4bjUDscQEyhEgFF3Vd/4R6Q=; b=jXYE35xwTgHmf+Wc
	/NuQ+dJN/CTmFW4o7MJT2nXFyp8G8pVk6BAh6BjYOtzlgGDt5d6gjQ0nIcGkd4Rr
	1yxra+rSe8pfYuGP/WXLg52thzqEb2hz2jkeFXJHNXcrDecpW0vwCu6mrdLFti8Y
	29C3jLip4ULi34m+MTGSVtomRJaQwKfl/eiLDgMwRo9MF7lBfY7g5bjto3RcMAhn
	wAYoFEl/aJ5onuzRvQK6xM2qVxwU3J07xm7ufjRjP4y0yV34rAIpAG8O+B/jCeRN
	1BhwEV+CGKYbRT0/1EqYn83kb4gHdggrbBcQnN2mJ/2pbm/9Da2MeSQDZz4te7QG
	obAPzg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v9a8aqh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 07:51:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c15c77619so9047231cf.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 00:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783410703; x=1784015503; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qGsKHl4+WtIZmZys5q4B4bjUDscQEyhEgFF3Vd/4R6Q=;
        b=T7kzjK8OILfkOvZFV1wp4AFbZq06QPTA08uGetPaJuAgfOOzyL4iR5o5zkFIKS4Gqn
         DUiccuDcRr8HyX5JMgZD3nRfzaL87/c4X+3z8fFuU40+qHXdzVGmmgfb7JgsRZ2LUJax
         MY33tBptnt3uv47M1Ibo7q2V2OoXWTp0pU04Zu80guehdyo8j8EwzOm+kA1A7wnHYedk
         gmJNCv+SuKO4uvB2I7UDeoxv8YVdS0hx7EjaqgeSiM0wOxFiQ+yzceRpkxJjQi6D+Zgl
         0dD6MTepS9AGeLEULj2CHImVWp8pcDosNF/StNyq2BsB4IYH3rfT8GO/BPMgTYWvxYhn
         /2/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783410703; x=1784015503;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGsKHl4+WtIZmZys5q4B4bjUDscQEyhEgFF3Vd/4R6Q=;
        b=sRX6LfJC1vxxUJ5zB2fJzBOz9wxmJ+pszmupQ3NUBAVxOgU4s9kSg0NZg6leM24bOw
         +todWQle5zdDlw9LWPSpu9wiRswEerHhQ2/NBbMAGaQIbMVI1/8hd2VHmkgtwxAkkA6+
         PufHKuKKmmIRyyHCttGBmz5lCAdlIz53JZjX9WL5dO09B+UiJKKmMLc8jHOOqODVj0hE
         Mdl/FB777LzqNgr3rbJd5xcOI+BS/lwV3mvV9T9eHetEPsehAET/Qf6yvM7cfJ8N55DT
         bD4xH8ofh4q2ypQy2gSzaD3i8dvXoPBFUkKlqSPRodZ77ppEd9TQA765CIIQ7rNzFEdv
         J2ew==
X-Forwarded-Encrypted: i=1; AHgh+RpWZvly/dOBHd67K9G78bZuxxzaxBw/wNxaRAqaJjzJ12qsgz80EKzrbK6OHAKqG1SmjZT+BInb+PHI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2I3YGOB7NAe41JC1ZH7G3mamhtjtIgAdTyJw4lNId7C45UIGb
	za9AFwq9rBI0nIgQ1y9iEe672ooVKMjBXt6dSYhWHWNLSo5q7gTu2ZbsNi6bnwkRc/6bEpDRVeE
	MLRB4wGYJdjT0vMTwGKc5ejad2BuCAO6fa5bC2FlSlUiK78ZMx5Vu8/geDcuTDnoH
X-Gm-Gg: AfdE7clp3VHP+FOydUtzAmUVPCglNOqwAaubYDw9fdyX/8RTG2mKITv7Rs3aIreQxft
	Mxms7EjCLJey7U0+8eZkTrL87EcGe3Cz7UjcA+ic2G8XHsFtEwIbFTR9YsPBJPtAhKmw5xs8tRK
	w0QG60hs+hqvJKfGDPggXXWFSOHfgMGQahj0OywxGC/CRbZrba5LZDIkkE1Bkc4oN74VVUjSM1G
	3rE+Mt92x76l0zTKrxyvV2quWqrssIsgLPyuPG6l4fAJd972H2fut+/2+sLFwnAQie1O+lrGqva
	jdchzZlyvewCgYSdUaK9Ba3Bt2ohBBeFXQOU39Z3NkcE/oXgD2E1TPG2OZQ0CCThQLOyTnnFO4S
	VxxTMY58aHbizfLfNmAqzOGNWcZvRbfG+SxQ=
X-Received: by 2002:ac8:5710:0:b0:51c:db4:3cb8 with SMTP id d75a77b69052e-51c4bed6cd2mr121678291cf.8.1783410703129;
        Tue, 07 Jul 2026 00:51:43 -0700 (PDT)
X-Received: by 2002:ac8:5710:0:b0:51c:db4:3cb8 with SMTP id d75a77b69052e-51c4bed6cd2mr121678191cf.8.1783410702706;
        Tue, 07 Jul 2026 00:51:42 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d79906sm5534277a12.14.2026.07.07.00.51.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 00:51:41 -0700 (PDT)
Message-ID: <6a312986-49b7-483b-8253-5bb3b842ac34@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 09:51:38 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] arm64: dts: qcom: ipq5018: add nodes required for
 Bluetooth support
To: george.moussalem@outlook.com, Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260706-ipq5018-bluetooth-v4-0-350262a30959@outlook.com>
 <20260706-ipq5018-bluetooth-v4-5-350262a30959@outlook.com>
 <6d8c0326-1b3e-4eae-b528-22ca77dbaf6d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6d8c0326-1b3e-4eae-b528-22ca77dbaf6d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: imSOMGqqe9ZvA0vkF3PoZiVy_QrqxCve
X-Proofpoint-ORIG-GUID: imSOMGqqe9ZvA0vkF3PoZiVy_QrqxCve
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA3NCBTYWx0ZWRfX/OdyumZJnnOE
 CjplGrtrK/E/pKDfJDv7KrL+B+LVAvb3RjiBaIJ1p3ElAz9K/A+Fvqaph6iXJgwuc1aR2dEHTvw
 /s3JmVzIdruEhGjrxN/nq1IRu06ca4I=
X-Authority-Analysis: v=2.4 cv=b9yCJNGx c=1 sm=1 tr=0 ts=6a4cb00f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=iO9hu9iUymBLBQONcncA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA3NCBTYWx0ZWRfX9WWSEIVs3Kkq
 RoNHUn6ObeNygp5Cq6Yup/WjvUckzIWv4v747MbmEtkn45zpoQMxGZS79S9Iosxbm+8LGTegZ3k
 s96K6SNPzZPx703SIEtc8XfaJAkSOtsbQhftdD9D/OimCYfEuZ30Bh0P7NtaobTHerO2MH1q3Wi
 3Dug09k+VeLLafTYrZu0jCHC4PtpbCJhQvbF0o/FVrAbHm2LMan5xysZvGQjih5pZc2gdGduRiC
 3Iu4lVSGZi1fSqRBE0/Fr+eLhAN8Lsx5lNSMAU6QL4Uou8624DbsxtLGau2iRiUnZxhAfbsnbEU
 UibZREnW7CGuUgt1bTBXLVHWxITjAkIfUTYlqLpYs+zuSxj/PwuCvh2kaTPZWYCk9UdfRHhnPXV
 uJkknDwLVEm7IMS746SovzKTGXBc2GpdcZQxu2QZ2MBwwtYeAPyU9oFI9xdCgXiUwbW1RGOD4IE
 iJS/zAEIBI6reVunz8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070074

On 7/7/26 9:51 AM, Konrad Dybcio wrote:
> On 7/6/26 7:26 PM, George Moussalem via B4 Relay wrote:
>> From: George Moussalem <george.moussalem@outlook.com>
>>
>> Add nodes for the reserved memory carveout and Bluetooth.
>>
>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>> ---
> 
> [...]
> 
>> @@ -136,6 +153,11 @@ reserved-memory {
>>  		#size-cells = <2>;
>>  		ranges;
>>  
>> +		btss_region: bluetooth@7000000 {
>> +			reg = <0x0 0x07000000 0x0 0x58000>;
> 
> FWIW RAM starts at 0x4000_0000 - I'm thinking whether this should
> just be the 'reg' value of the bluetooth node. This makes even more
> sense as you write to this region using I/O accessors

FWIW2: The region is called "BT_RAM"

Konrad
