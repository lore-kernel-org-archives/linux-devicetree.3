Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616254;
	b=CisAp8RgqZ2DNIP7CyrMHXuhWxFMhGgps3B4pdZQaWFRZ6EFltJ/+Z5W8jJjOS3gICLp
	 UdaZjvnIcI3lUnhWtqBXWKx6ggcXpEuk7HecA/n20/6GYzAIUIo34tUVsklMoA3FERWvW
	 V734wj6Y0wlNE5NYlqjEu67ISm1Hq3S7Vl7gSknooH39VMPJAKOv2FMZNEU6oho6Xl/ID
	 WC/90GCNBmipf3kT12tMyxpO/6DPJEYWRE2D80nlcGPTBdw8ZzIpQEmb9dz2++wcHNSto
	 7Kuo9IFc39qOlSstFeN31MVBHMXqxPjq78YRrNFMnswyGYR2oRMoDMpZIk71mrPIuJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616254;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DagWDRZWu91tlPDx3Rb2tSyf5VLxAyyZkV9oS3j452U=;
	b=hFjr04+3mcvIBc3L18DpJhJiEji/WbTwS7rxd0+JvQ3K5WmZ14Qvn3gfWiqAZ42Ccrc8
	 5ZvPYCbWHLndDxMTs4njGuoHBz5+QrZj6QP/EOgNu9yzYw3blwn4YvFyrRTtT1szPfVbo
	 cqHHn2O7zU0P40fqxy2cgGHxopciLKauvDi3fOhmNZA55EJfBmP6f+p9CqFFaW8+trz8v
	 wqM/aAs3+NPBwFISRLH6r3l13Sol4A+YGB7zjLXQNO2ClU/yVhv/6tJqSW2SIx5WvJYK2
	 KGD2rifdx6uIfNFc12vogFGFK9CwIc0omVneDLz8HDsGUzxZpGqztqSdJ/zQZWy3vaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yfb6bG7J;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LIwKAWv4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C77606A327
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 10:44:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88C77606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yfb6bG7J;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LIwKAWv4
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29Amvu2362083
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 10:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DagWDRZWu91tlPDx3Rb2tSyf5VLxAyyZkV9oS3j452U=; b=Yfb6bG7JJSoN0KYz
	s9+fJb1m/gh3bdTcKqBByr79KI0B/wJLFd0eHQgzsx0m2fSdDFPX0Xzc5jFJ1LcR
	zIUesJnAPFtg1wMy6Liyk5bMPj6NmOIPJxa5t02sNmZwSpttA7sGw5nHe/sdRzAa
	OroPaITQK/PJgevdTFvmWwdoFlFvI+7nXoRnOoTOTkTYsq2H2+etJ8UxiXktj5hD
	iUdatxcWjGcrQnEM3LNPoD6bq7IXZpQNl+dd0upgiIguzk+KnSA267UV3X5IWcT8
	zB4Zl8nJZtkyiROlFm46x5GOhj7zAe4Lh5yemVN43Xa785fP1duErA4xPyg1qCU4
	avs8cg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8q7xe8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 10:44:12 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c83481504so5653086d6.2
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 02:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616252; x=1794221052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DagWDRZWu91tlPDx3Rb2tSyf5VLxAyyZkV9oS3j452U=;
        b=LIwKAWv4r8dBceVa4Ij/2xQCJJ5zrSMbd1kkQsQc0ohXuaZGup21jQzLYSY3mTP3mY
         CxMPlkcJHb/d0rEwNJrdvsONm41K6gQDVCP4C5j2dmTe5vCMIcadkmwPM7fDu0pjB1uk
         cdbZ5xNSpi9y3p+lSuvsD+Ggk/EMzCHNl4PvFwpOwQRArq9L4etdUp6AqzuT39DvFKKx
         fkt5hfQmjPlBXOSsN4bLRn1APr06mhG0oNADDRk/xMAXdBePIGuxAFZX851XonU3KXt1
         SyiDSzUEx3yDFl5+uEeR+T2W4BU8tIkOQbQgcV04AQO9oXJga+ewIwEAjQcgkcmqo9Yu
         yYjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616252; x=1794221052;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DagWDRZWu91tlPDx3Rb2tSyf5VLxAyyZkV9oS3j452U=;
        b=Rxw7DAs1q7rW4Zyoq5cHGptIk+lLTi5sFwWtky+xecIscJwKVccFkRz4Rh1ZuaIdFP
         ZMaLM0DXBRvn7SOTIUXVGZQPdCRyslYUwJP+6XvnTNBZFgHgn5eJ2JO8P/GqsEjZZChO
         YvTqpKFKoh58Ud/Qbuh/GUb9S9H1LhYS4iWoAoS+F9TKP12LfmEgW5jMtjn9wnYHi5qz
         BVqcykVq+YhaxBRWSqTRJUbahjWO8EGx5XVGfvgTQvk7vzvpi/nru4LsqGHcwNu49duX
         0aEtE+ty9GGr6PpqciLfy76m2XURT/6vK/LZv6Imu6+86CJ3yEFExjtYw6oH+zHUZQE4
         Vi+g==
X-Forwarded-Encrypted: i=1; AKwUvBxlB/+V4+PZYuKILTeFcimdyx4JBRu1j4MAhpX1fSZMjKRYAPYncwdgVWT+FjuCTgIJdKnw61ma2EJi@vger.kernel.org
X-Gm-Message-State: AFq9FYLiz2LHOuzeBO4ukg98kLGocJQs/z8xpsiz0b5Idt1nmv4fyC3U
	rMSOyUd8pT1qxuzRuVM88XhCpX09idYvp6neBoCkFbjjdq4ok+CmLGsQbX86zV79s+nFH1HULrM
	sAJJmfiESzA3bOWY+O+FHkEIf9CR/vVXhX08Tv4lmAdprz6m+AxJv42aPWirNiVJJ
X-Gm-Gg: AYBFou1Z9Dsx+/1N0y/FO9dDkgHHUAO9JHxE42frE0KYZx6lbg1ZtwB2NjvEiPY7gQq
	Frq24FVWLKfY8OTyuEoif0jX8yhpC1wV2FqjZi3JQOk7bAIhhUBftFV/8ikpYiWZX8BAyEnUvaf
	B0f8SM2cHU18G4v4/21PieRULlcxFv6x86HMDi7SV+P2r6afE0cV+CW55dOhFhWF9FeNrc0iutx
	HEUD1Eu7gL9WMA4sd0hXb2knDpvHvLlBTdAr8oUUQ5PiQncQ5JDadyVKzsD0bf+1ckdaZfwY246
	QVCgpMUiOuvy1w4jzvkOd2f0YrAzJrj7q6MXYegNFZQTv+B0fV55BVRK849kzEAZwxjT3MGWVGZ
	RoWMOIFc/npYNMRaRa8691DDQxCkYb3SjHsnY+IyZE59BTPOHyAsHTUIjwCaLrlenfW8IzLY=
X-Received: by 2002:a05:620a:6357:b0:93e:6d87:4f69 with SMTP id af79cd13be357-94421666fadmr1772174985a.3.1793616251670;
        Mon, 02 Nov 2026 02:44:11 -0800 (PST)
X-Received: by 2002:a05:620a:6357:b0:93e:6d87:4f69 with SMTP id af79cd13be357-94421666fadmr1772171985a.3.1793616250987;
        Mon, 02 Nov 2026 02:44:10 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc174d0sm374997266b.4.2026.11.02.02.44.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 02:44:10 -0800 (PST)
Message-ID: <f4c2b984-e255-457a-9b39-f797b840cac4@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 11:44:07 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add Xiaomi Poco M3
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Amir Hanip <killdeath104@gmail.com>
Cc: abelvesa@kernel.org, andersson@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org, a39skl@gmail.com
References: <239d46726c0aad84feccc3def4eafab2@mainlining.org>
 <20261101164930.17976-1-killdeath104@gmail.com>
 <9304e75396496855881251cac2edb0a5@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9304e75396496855881251cac2edb0a5@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1nBZkGV9dkuB11Uq8iRmitKVdnB6H9Dw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX6w/mEJtPZcB/
 N3QqkdCO7suazg57dtacBO2wTAL1mxCysYRR5eAL2yuExmoSVQDjJCgDZBnG2ZvfViEcJwmc5Fx
 1zL331JRxnmsue+220kcpBXQazIcPUc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfXxYAyqeJoIWim
 AmPkKU7eTFQcGCX4tnky2gtMGbRAkdHhcl2wKnRG+vblr4isa7Q2zLWSJ78QbMGGppBkINszYgl
 aBbldU7y6kUdcGAVen3xzqAawgS6ZCEVvsQiweqpyyEaWHDv1XYBTb7sjXa/NsI4OHf/m3UInrl
 JeiLiYYm3moP16UzWMJJ6c10FqjFPoVEnJKTKtveMEZo+HQJFyGL1AwHn9+xlxgayDWkvTlc5i6
 3FaNn0oxrFlK8Q3f158CoGiqgoppZsddv5Ns3AJJZf2KWeIEMwJqpqgDXEM4kVKZ5Yv27Efr8yB
 yTW4iUw4OSMXsvO9f2KsmxMbrWGbRa+U+KPJD0C6hYjm8HuvcoVg59Ehqpv1e72ImYpT47OIbCK
 KgeGfLqoRFeJxH0PW6Ox9Tp2PxFtLN/5JuXM1q80ZD0hkVrwCRtnMz/zJ7Dztw2svsUCRweOx2J
 6P28o8kvQ6juafEOE8Q==
X-Proofpoint-GUID: 1nBZkGV9dkuB11Uq8iRmitKVdnB6H9Dw
X-Authority-Analysis: v=2.4 cv=PucG/AM3 c=1 sm=1 tr=0 ts=6ae8697c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=NZJFGjKaqi_mDWV0rrMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020042

On 11/1/26 8:44 PM, Barnabás Czémán wrote:
> On 2026-11-01 17:49, Amir Hanip wrote:
>> On Fri, 30 Oct 2026 13:30:28 +0100, Barnabas Czeman wrote:
>>> Poco M3 (citrus) is same HW like Redmi 9T (lime) and Remi 9T NFC
>>> (lemon) basically is a lime with NFC.
>>> So i think it would be better make a common base from lemon's
>>> devicetree instead of making the same devicetree again for the
>>> different variants where only the compatible and the model property
>>> will be the difference.
>>> Check sm6115-xiaomi-gingkgo-common for example, it was the same case
>>> for Redmi Note 8 (ginkgo) and 8T (willow).
>>
>> Hi Barnabas, Adam,
>>
>> Thanks for the review, that makes sense. I am preparing a v3 that
>> moves the shared parts of lemon into sm6115-xiaomi-lime-common.dtsi
>> and has both lemon and citrus include it. I used the name lime-common
>> following your naming. Happy to rename it.
>>
>> Plan for v3:
>> 1. dt-bindings (unchanged)
>> 2. lemon: move the shared nodes into the common dtsi, no functional
>>    change intended
>> 3. citrus on top of the common dtsi
>>
>> I can only test citrus. I do not own a Redmi 9T, so lemon is untested
>> on hardware. Instead, I compared the lemon DTS before and after the
>> split, normalized with dtc (dtc -I dts -O dts -s). The only
>> difference is the numbering of two auto-generated phandles. I will
>> describe the check in the cover letter. Adam,
>> would you be able to test lemon once v3 is posted, or look at the
>> split beforehand?
>>
>> The IPA carve-outs (pil_ipa_fw_mem and pil_ipa_gsi_mem) are identical
>> on both, so they now live in the common dtsi.
>>
>> I kept the following per variant because I cannot tell whether they
>> are real hardware differences or just differences between the stock
>> firmware images:
>>
>> - ADSP carve-out: 0x53800000/0x2200000 on citrus, 0x53400000/0x2600000
>>   on lemon. Both regions end at 0x55a00000, so only the start and
>>   size differ. I can only confirm that the citrus value works on my
>>   device.
> If there are no overlaps the bigger range could work for both of them.

Waste of precious RAM!

Konrad
