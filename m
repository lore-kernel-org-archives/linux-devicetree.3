Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533D038E5ED
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 10:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782988859; cv=none; b=LtvQ16WAJ71kSu0/VjLgSqCyv62OGVMRypxIW7CNwRXsQzHmr94n3GbGHb0VjecuW+fAzaW07/h51u4ydcx/hZbQ7j7oCO4T3x5lJcVIVq3Yh09TcLkYKJ2A8JPnxwk6GtjAq1nmxJiu9Su0mmAUInrraJ1JlP+UyLzLtWWr9pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782988859; c=relaxed/simple;
	bh=sebh+utV2CTFOisKY1OgnSqraF5Xbo/dLmuLfRjNQZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s06zslE6s/7O/4HryS/I9d++fcZE7pTxKs22EaWqjFaTvZK3K1Yr6xhGj0H0Ism8y2g2ViCLvcia/P2Vnzdkh4mZ4P4R7j+txGvcCCDPgtmTQKiLr3yMuMyZ6yza7j3RwcX4lS4qH0E7qB4f8UMuZr9nB9rf0xdjxLf/YGnY6e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gcGrQWQX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hCbEyJZH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gcGrQWQX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hCbEyJZH"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6624lXOe3485590
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 10:40:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vKPyCeFSLo0JTSMTQNfV2R92Q7AZZ1/B+TBr6BmrZT0=; b=gcGrQWQXCAdVftbe
	JpopkdnICD7YzHrEmSkgjbsTz1ufP/i3VvIHxWnko3YYgzweyL+Am2JcUUFw6nRy
	dlkjyCQT6Gyfuv3YvXaOD5gB8KNvrke4+dEp1rmqY4KqyZvnf/cYhf88cE0eBkFW
	i3bYfoRxi+nM+H+d84garjbP/2TZjojpAP+NsiJbHZpP20RbbIf+bXXuzay2LlNd
	s4d+mLt/hYThVtnvyZO2G2aGdOeCjdV4BAhIstttWh7/ykXG1P/DJUt1l7y8S2kH
	fDcQgyCuQHT2hk1GEpC7TvPc5tahIOrf2EqoSlq2dBY/VspUbtpa7WMMS7yKpVVa
	oF73ZA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h98h8fw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 10:40:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c81c7421abso37813035ad.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 03:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782988856; x=1783593656; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vKPyCeFSLo0JTSMTQNfV2R92Q7AZZ1/B+TBr6BmrZT0=;
        b=hCbEyJZH9Jb4pIp2vM+8S5Cd5Muv4MuGn8adwCyBQQXbpWTFm8UvfSnHPOt8UB3+MQ
         0vrcMroTcMvja4nd/M1xcW4jVinA+tP6Ov7zcguEspp4uX4Nj4qOPGwTAUkK58E1RY/o
         oVQzOd6ndDB98p0UF6tQ/AdkX41i7jNrG0ZJM/Bp3vzxT1EEa6pxg5AvNMZhEOPop1ef
         iMaVSRjxwZtFhzaalUe5bFrLpi/rriaWFOabIDBpBxGMo8ArtcJjMjzQGTtNh59n1ATl
         2aFokBVDCho8rSsMxiZq9nwG27OwzmfJ3PXMaXNduBCT6PCxy4cWQmXp2fYxKuE66jvs
         u+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782988856; x=1783593656;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vKPyCeFSLo0JTSMTQNfV2R92Q7AZZ1/B+TBr6BmrZT0=;
        b=Cqh96BZ+wFmDZXzbDwzA+8SgGWU9B1EpEQL3UTI4vSo/ws3KHmCt0VH/Ek1Lsbt/II
         ReGTP+K4jEJ7R/MwJNy+OE7Hg9OaepC8koU6c+6N7jdfluKM2XZC14MCwatwGS4hmBbx
         td5+CAoUl2Qw2NMXDYGM8gQssx7qTvbXH2x06MPp8C+xQGuHnk+iZ/At7MCWeGURY4Cw
         iPBP0XBK2oCnoNup1TEhZKxvS8p1gi7qgf/wDWUyAyYh477t1visz75i2qkZeEzZ8hFp
         xR3KfqAFu+j+g0RhLRxzv75/0zAERIGLuKHNNP6k4mUWFXWuImP3kqztGIukFr1n2sON
         lSEQ==
X-Forwarded-Encrypted: i=1; AHgh+Roh5bwxBCKUIpIcycy/9arus1rK4XdrE3+0wAyS1s+ZQm5PCGTdoIp00pQ4+bZRD7jRdN595Mqt6A6Y@vger.kernel.org
X-Gm-Message-State: AOJu0YzmvuMzZ93KxUUcqWZBjt5w0fw2yq3ROSejKVA95SK2+bl40wiW
	c2bHXHx/TUH/P2Y6l+DLsYYbg3zMz90aRKy8+Xd0z5SB4gkTVvEncYsrDiTnD1YLE9Y0nDqLwW4
	zEVYASqx2Th/sWsv20weV0XgxMAOlqx1hng6GugjTmSz0UomIw5PJCScytRXWbF1N
X-Gm-Gg: AfdE7cnXOuZOvtOkdl7jqo0QxodRGEcG3eWZXlD6kH3f+gesAn8XuKPrChQix9iiiAp
	RwoCkqpopfu2JgR93GQoeLrswvddvxhQDtH5TTmcN70MX0gxMA7MCTLJRq3sSMps5cKFhAwyMTL
	BeN2zuMTtPouEa5GeDh1j38edqSG5R2kjbZSzstVn6MWAZFJpxWvsDqz0O/yw8mb4HpSHJuAUjh
	TlHfFgBSp1gXwnppA7Ffx/TtUyVRwcjLwCvYIUOn/CX9gRJHqfgZ2p37ixlnXeblOWzL+bu3o5q
	CXb7tTPbxaUORh7L+YhH7BnhDDAUQax9z1DsCljNIqH8/Ri/BDPFVps/QDmQvWGNSKNSj6i5tCm
	rNQ+iFFLnqYqmO+T1SewH56/AvubGAS32P/GGOYrM
X-Received: by 2002:a17:902:f547:b0:2c9:97a9:2099 with SMTP id d9443c01a7336-2ca9123c3d9mr47503455ad.45.1782988856293;
        Thu, 02 Jul 2026 03:40:56 -0700 (PDT)
X-Received: by 2002:a17:902:f547:b0:2c9:97a9:2099 with SMTP id d9443c01a7336-2ca9123c3d9mr47502955ad.45.1782988855605;
        Thu, 02 Jul 2026 03:40:55 -0700 (PDT)
Received: from [10.218.39.201] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a8f8458sm11689655ad.18.2026.07.02.03.40.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 03:40:55 -0700 (PDT)
Message-ID: <43b94089-37e1-4e4c-818f-39cfbde4770b@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 16:10:48 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add QCC2072 Bluetooth M.2 overlay
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
Cc: quic_mohamull@quicinc.com, quic_hbandi@quicinc.com,
        rahul.samana@oss.qualcomm.com, harshitha.reddy@oss.qualcomm.com,
        dishank.garg@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260529180234.3373056-1-yepuri.siddu@oss.qualcomm.com>
 <8ba8a59c-fb80-45e3-b4b7-0db06614df49@oss.qualcomm.com>
 <88770279-0c63-4c56-a727-dcebf03c32c5@oss.qualcomm.com>
 <9cc33cc1-b7f4-4fd7-9bf7-2ec58283cc4e@oss.qualcomm.com>
Content-Language: en-US
From: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
In-Reply-To: <9cc33cc1-b7f4-4fd7-9bf7-2ec58283cc4e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sI5ACDxg4QBZVGkrj7d4fxWO1lB49SKW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDExMCBTYWx0ZWRfXyhbquvnkTdRJ
 Q4ycgzj2izpgd0munjN5yJ2WJKyH8mJkwZ2FGo7ssG8EP1sRKZSVEyMR8d0y+xGsrHNdYsz96Pu
 N4sDWVPT4WRrVY5kQA/D+wOM064FoYned1WkWt41v81u+WKa5lKCkJG7UlRUonD0S2pXm4kCXqv
 0YFKoDh27NpDKZZ5uf1QScuvvEak9GxvAR+ZOof+wi6mAvV6Li+yXIfNMsr9fQOWU2yzRlVJMkJ
 Mjr5lxZFaA71RFWWEXxyKdOqI/gF8/Z1/aOs+Ef/tUh2OBo7UAGLyoWoLsdQgiqUWw2CoF50OYM
 J/syR/HYP3dxzs5Law2xKUYw4t7xhJHuaip6xo8SW6nO8/pVeV8Z3noqW2LiVNfCxvCNoenmhXu
 CUTSJTVHEe4FxRwFM94IMPLMwJ6fTSbnHCheaFbz+iFx84kl7R5OpvQilkbbkLdtXUrntrMj+Zu
 +2mVB/NFrC53OAg4UFw==
X-Proofpoint-GUID: sI5ACDxg4QBZVGkrj7d4fxWO1lB49SKW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDExMCBTYWx0ZWRfXxYcVaovnamze
 RKq3evpdhwz1biIOnd8pZ6waQVoM3wHwM7EihsadFTs8XSqirNP1zAp58a13yLFrNa6LFncsLLg
 zEgER4axSB/i5P2E8Oik/BjqJcYW/D8=
X-Authority-Analysis: v=2.4 cv=bdFbluPB c=1 sm=1 tr=0 ts=6a464039 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=u3R6sUP49V7FBL3LJ_8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020110



On 7/2/2026 4:05 PM, Konrad Dybcio wrote:
> On 7/2/26 12:11 PM, Yepuri Siddu wrote:
>>
>>
>> On 6/30/2026 5:03 PM, Konrad Dybcio wrote:
>>> On 5/29/26 8:02 PM, Yepuri Siddu wrote:
>>>> Add a DTSO overlay for the M.2 E-key slot on the QCS6490 RB3 Gen2
>>>> industrial mezzanine board when populated with a QCC2072 Bluetooth
>>>> module.
>>>>
>>>> The overlay configures UART4 (gpio16-19) for Bluetooth communication
>>>> at up to 3.2 Mbps. Sleep pin states are defined for all four UART
>>>> lines to minimize power consumption when Bluetooth is inactive. Host
>>>> wakeup is handled via a GPIO interrupt on the RX line (gpio19), and
>>>> SW_CTRL is mapped to gpio86 for power sequencing.
>>>>
>>>> Disable UART7 in the base industrial mezzanine overlay as it is
>>>> not used when the M.2 slot is populated.
>>>>
>>>> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
>>>> ---
>>>
>>> This seems to be a single, unthreaded message. Please switch to
>>> using the b4 tool for submitting patches - https://b4.docs.kernel.org/
>>
>> QCC2072 is an M.2 E-key chip. As M.2 Power Sequencing changes are being upstreamed, we will reupdate our existing patches to align with M.2 power sequencing approach.
>> This includes aligning the bindings, DT and also BT driver changes.
> 
> This is a tone-deaf reply to a question I didn't ask.
> 
I apologize for the off-topic response
Thank you for the feedback. I apologize for the incorrect submission 
format. I will switch to using the b4 tool for submitting patches going 
forward and resubmit the patch properly.

Thanks,
Siddu

> Konrad

