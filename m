Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542AF3A4527
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 05:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774331175; cv=none; b=DygJgc6mZi309qpwIu3Z9V7JiRwUejWnRftuzqBn6sOIO94l6mumH8ZL8QGvRxKoSbJvOCptRZwyQixPJOosO4DJGDx1035h2mETgD/CSI4C9rx++OMewxHo4tyPFxi4p4p80Ftz8VN/taPoGZtlXhHFakyi5VMn+wS0qkYVnOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774331175; c=relaxed/simple;
	bh=mhRBTwptysF9JNl9u86v42nktnUR7haDgpBPxNG7d3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PF/6Uo2vqJBqLApZqkPFh6puXjLMck9jYvto0LdoAkzARIt+hZSh9L7GKxF52Ut+Yh5LlVwBhiYFf4wlEDEKu6e71kluyuF5i8q6a9mrNF0z0rMm1MGgYVLmjmBEP/x4BGe+kv8Fum85uDisa82soP97DFIUGUPiHS0uujYln9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eHBgmBlo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=erSA+aSw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eHBgmBlo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="erSA+aSw"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O3nZ36890108
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 05:46:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4uXhAnSSGY4kJm4zK0iSCHMV2uOsj4LTcab+KE2uMlQ=; b=eHBgmBloYcRM9u6R
	MZLky2+ZXTsDQWNH7n1FiHziFmUZtrQFJGZBJZ5iCJ+e7Xq2XdVENClQ/A+DGRiT
	BZI5QtbbESdcsfoR6FYvP1BuZS5Dq2NtiJiTs7GjScR7Jet45iZvoHDjKc0toiQd
	UvzPgqVjeYIibgpAmSa9NxM6JAHho6zc7R5MsZOqJtQmO1k1zDNi3AGrtpbhcLiq
	BfnHO3cFyOhbl5lCjR9drbt6WLRCq7atkwXJ1uEla9nbwOBU8iV2RwkJmJe14UcW
	+9hdDGtP++3kYfcKyQSlUCJOTaq5SB9fRsac7dRLHoLaY7fCr3bp78ZZ81C6R2DM
	XyKnjw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3k1x8bgp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 05:46:11 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a0258c5e5so12153966d6.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 22:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774331170; x=1774935970; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4uXhAnSSGY4kJm4zK0iSCHMV2uOsj4LTcab+KE2uMlQ=;
        b=erSA+aSw9lTuM2cnqiizUQoq09JgazNvh/FGlEwk8ch5n2anq7YRk6iEPvBKabtFky
         syYTsTfoFHN6Kx4jM8/SmgTEOYwvE1WrKAxzxD8j9257EfC7DQZQGtF9IephEXl6ini8
         5Aol8oPzHnKmcQ01uEPenx92joKV6nfMRwq62tO2/G7mbe2G+kOTSpD+9MoZrTCKGLvu
         zZLx95iLke1XrrBQYaVR4ewkKbMuQqk/E7o9ZuLzFKTdd9lj0535T6igwLHTBWnjLFtg
         qQ25IEXJ4/yE22FsIPbYAOX788wvdhmvjeibiLItBXYDOzlc8JeLCxpxwjG+Z6NgSaiH
         DmYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774331170; x=1774935970;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4uXhAnSSGY4kJm4zK0iSCHMV2uOsj4LTcab+KE2uMlQ=;
        b=h3PxiYI8eLDwyL3iTzhJbuec/nOIG7S8PcvFP7q9YFbp8tnj7xX9XO9vZnGFNpanW3
         RAVlT5uupBbx2LwGEtrvaMhOAyKotPfbASyPycxb7Hr6GeZ7lrl9nxKDiVwxtfEOhPIR
         gtgSI9b2F4UWVB9LQJYEvhz/Uc8y10AlsAGxXKPxQX0R7ed4YF3spVYPiDKo0znvEYY0
         V93SY41V/lPp4M4ssdF9hksUDPsfWustF9oB5y6NvgWV4aYA8DSpxxIu4YjebDROlNjf
         coHDBkhFS1wKveoVKDnsTOBPW9ytQTezreCE7klct5QasTYCL+1Koq+Ar18hZpBnYv/h
         OUtA==
X-Forwarded-Encrypted: i=1; AJvYcCWYHRPbYGrCi7rnKLa6zOfqY3xqi6l38F5Fd/957IlESyvHwqTYicssAOefZPbFLeM/42ZOXaIYgShb@vger.kernel.org
X-Gm-Message-State: AOJu0YwUvyBwXqzZFU0/jNj24MC1ayRovSVVwdbtGvkcDqAdbM7WyJ9j
	A+G7XP8EGe/RaANri7Q8lfpAEFYvwCQlT4Sg0AWmFGA36vp5xtWWLM4I1dj4EUVUYStkdQd1FVX
	RSBkbOktC1vRGf+vUP5zzhJfuL0+d87X6mgfNWkzGtaGhCMu5+6KMXZcPySR6SAPB
X-Gm-Gg: ATEYQzyoFfCrNJQbkVtMKrJ6vSC0rUpmEgb+wTjGrOz5STg4Vzmm5RYnxP9y9b28WKV
	aX4wnTUIZEXHy8Si0R3fAHNFoEZ42spIE4b0+6M3hUOfHNW+UMsrk1A6IEwydajk93P3Xrobj9J
	cFZNUOKctp4rSupdyO0p5IoqEigRIddzk0CZEGW5oNwc1PyX549XWI5Z4sauEN6p2xCIFZzVE0E
	k2opD1/E50r9NIeBdDKi93t0C90uP68DEU+5PDNROQ0c+JspIc2GUOoj3nj+5zjyIMFZ67sVl8L
	FGGX/8B3nxe77/ll2JXbTL5jEqgiJ3ini5vLHV10fHdP5759w6uM2/LkNv3owXcxecyPjVgYua3
	qEir3XaJm6g5QHRLgc5SbbOTZmYbwZlCpygFKXworz/3oFh2GdCwA9Bt2FxaNXg5T8CNaCvqa/K
	MiOSISaRyx0A==
X-Received: by 2002:a0c:f101:0:b0:89a:e77:1f7e with SMTP id 6a1803df08f44-89c85a9537cmr186281036d6.35.1774331170528;
        Mon, 23 Mar 2026 22:46:10 -0700 (PDT)
X-Received: by 2002:a0c:f101:0:b0:89a:e77:1f7e with SMTP id 6a1803df08f44-89c85a9537cmr186280926d6.35.1774331170106;
        Mon, 23 Mar 2026 22:46:10 -0700 (PDT)
Received: from [10.111.162.220] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c85335402sm130932366d6.25.2026.03.23.22.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 22:46:09 -0700 (PDT)
Message-ID: <2a786e5a-bace-4442-93ba-ed27a13e06eb@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 13:46:02 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: talos: Add camss node
To: Bjorn Andersson <andersson@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260112-sm6150-camss-v4-0-0cd576d627f7@oss.qualcomm.com>
 <20260112-sm6150-camss-v4-3-0cd576d627f7@oss.qualcomm.com>
 <acH_30LE_xHXneqf@baldur>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <acH_30LE_xHXneqf@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA0NSBTYWx0ZWRfX8SMyXDDxEHFU
 C3jwDjBmshvrUepEwx00AM3Tw8epKSWPOErIf+CAyndCXhonsB2UMotDhj/6DKzB7uZolsb4Wh/
 lavWv5eMbRZg0w649Pgh7Y41u6OOgjHXjzq3RkIGabi46Oew9OYr3dSNA7Cg8JINSqqq/sEgJ6J
 JbuzJmhU/jR0z2uIzZr5KyW9o/i/s2blx0QNa/7ChdDKF6oBXNGYzHz+7awXtdSXHrAtUr4aqeD
 n+rKum1+TZTLpd9exAqWlURQ4iFBmqch0Dnm66RE0JVJhFj7vpA7Ba1tvMb3f36py8liLoYLGGJ
 fmrqsqcZKyYQCAHvR3ZZzLSC5A60uYA5G3FMMakJ4H4Qb3sS6QgA6cv0HxDcvcjpTd5py0QpD10
 HfHCgPqjBKWj1dI/ycRqkLOOKyG/4vpoRV5TZQIxgS+PmmG4aqmTdfWoQTmiVKgK7dprGwRxJAs
 TYIOe2cAsGsA15cajbw==
X-Proofpoint-ORIG-GUID: CvZ1Qk5T0XOAz7Y-uoPpBnN1_KQYMRY0
X-Authority-Analysis: v=2.4 cv=O880fR9W c=1 sm=1 tr=0 ts=69c22523 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=8aYgeAFh18_nvhlzcWEA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: CvZ1Qk5T0XOAz7Y-uoPpBnN1_KQYMRY0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_01,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240045



On 3/24/2026 11:07 AM, Bjorn Andersson wrote:
> On Mon, Jan 12, 2026 at 04:04:54PM +0800, Wenmeng Liu wrote:
>> Add node for the SM6150 camera subsystem.
>>
>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: isp@acb3000 (qcom,sm6150-camss) interrupts: [[0, 464, 1, 0], [466, 1, 0, 468], [1, 0, 477, 1], [0, 478, 1, 0], [479, 1, 0, 465], [1, 0, 467, 1], [0, 469, 1, 0], [459, 1, 0, 461], [1, 0, 463, 1], [0, 475, 1, 0], [474, 1, 0, 476], [1]] is too short
> 
> Regards,
> Bjorn

this is old version, v6 has been posted.
https://lore.kernel.org/all/2e13c91a-6d87-4c2b-8a98-0b58f97023ed@oss.qualcomm.com/

Thanks,
Wenmeng
