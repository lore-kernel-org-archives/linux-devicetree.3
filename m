Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779478;
	b=h9SX74jgN05bHGPzS1jvAkLqnHJwjNKWXiojNuH3upWpSi8Dz1am2YzA2FLKVAytX3NW
	 hgmQ3/94uba/GleB6pyzHnTBBVKnVBiYwQJxAZj2fENUpi3XRZmF6FxAN15PtZGZv7vMv
	 P3tGl0gfeEAP+BY4Dpex5rHLiCUjX/+aTIW6MnsKybElQVld9lVsA54ZVxL8b1bwF7IqF
	 /9DSYOp2W/Pm6PvV633sOfhPgG2tw+EsRxj+8x+HfQ8Z+mWYad3tpxZTBc1gZuw+AJr/d
	 Lu0lgXmgJCGIkbgEkj/4PKU8bw+IFwdjUb4Uqym/1a4LR2I3TymlIP7zode4pjaJYsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779478;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kgTaEL+t27qW+9vwPPLbMOwWN6Dg2fyARer4F49J3NI=;
	b=Ob69wLeFkwqC7aVQm5sBqxx7v5UVJY9UOpbvYc2PveaQeHWPmASNjg2NP+P1UVnC/zYd
	 dGvryK5Y4GYPmfQjZJsFnF6dpHvmdOymhyeGkHCFGmxKm0m2XWnMGyulqUjg5N9rgVnLF
	 lLVZXFaOhZbUKeW7m55EaQnfBPN8mMHGrZT5fT7/99gcEURIWVcdHw6qbM938YdtXeaye
	 M2mf8k+PVh/7rzzLlb8fURdyWPG9OKL2rxEOe66xL5j0JQx9y7ufUZLkgjWK4OMU2z4mF
	 CwwGaCW7thTqaH+JuCcFOQ2/0dLSzJkL+rAwM+aA1UCkzZ7Iwvv6Xcq+5pbywgyYm7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AxxaHJX8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ApqN1Um3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41290606A31B
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 08:04:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41290606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AxxaHJX8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ApqN1Um3
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A46pkAk1191284
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 08:04:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kgTaEL+t27qW+9vwPPLbMOwWN6Dg2fyARer4F49J3NI=; b=AxxaHJX8hPHCHxOm
	A6nQm1Hh82MA5pNzS324eYzPdp56/BTXy791bYQ5OQFtj/0pGbat+ALqfYo/3XTq
	MQTy9nMlhJAleEox8MSGY25eUsufnCcSoirk/kYY8oF8O0BCn32SN30kds9kvDBE
	GdmF0ONvcSkcTM/eG0CzBIPbmWLpQ8L66rooZyV6afKNHNond6XwSXgbxhSQtIj8
	lNcsbnpy9GrAeWLY7t2JGsQQF+N7wKduxRwdv1qHqN/l7o36twJHweVlHYiu8/tZ
	wtw2gunKpblTaiOyUZAbsHweercRs9CJIf0v1GD2s9J56LQQEN/cMEWZwARyDfY1
	YB6zTQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqm2pk1g9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 08:04:37 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc2c798d76so10955137.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 00:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793779476; x=1794384276; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kgTaEL+t27qW+9vwPPLbMOwWN6Dg2fyARer4F49J3NI=;
        b=ApqN1Um35PpiYT4827hlwR+RgLOSgmQjvuTrzHiDjhZffFBBoJ3hOOqSpHOEMXBo+E
         bLog0wYvGuk6eZ0hoJF51k8yfFeaMijGITCjl98m2vl5a2XccEm1SfNhgc+MN8zIQU0i
         mH0Jx8MKIlX345aCY9iN+1jR1s8vQ01iMLSYwUkrYgRRNNSj1Yd0d7ijK/K0WT7KsV/D
         NOobQxHjUH8rzBnmUgy4t4Ry+SSzs1GWr6D3ODvxn846k3x4k4VP44YZZIG2ezOkRIVI
         Xaf5FRi58uepG6TdaDWDdjdIhn8n2xQZY4YPn1b5LliTele9FdXd0HYa1mzRQ7C0dzmX
         a+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793779476; x=1794384276;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kgTaEL+t27qW+9vwPPLbMOwWN6Dg2fyARer4F49J3NI=;
        b=QiOO3P/1SYGlnPe2hqkhZAgaDzvhG0Stf0TZHBabPNH/JUFA3vVzPIsHLzS2oMG2Bf
         iai2022wzV33KIgTXIZzHhO+wNcYzJPxL39apXwdGgsJBtV6nVtsvGVtqemv+MlN9kMo
         yqhq9Urppk3/bGb1Pec5U2vY1Jymnhc3cVEUtftg9Q1nh5F4c1nscuxtM9DtLXJmMsxl
         CQlczY0nGmknhFtmCY/WInWdyC3g7hcHoQLCn5rcz5wWJr8X4bHua+18ygTxEHjg2yf7
         zQKWGdAL6Df7SyHqmztDkbYy6u3dbV5JvZRZ/URCDuFNmsPkaZ4/0T+S+apXCGo88iB6
         RsTw==
X-Forwarded-Encrypted: i=1; AKwUvBwfz2qcql3wz4IK8jw7A1HHfUrwqgCZT0FZAP9qGqh4Qb62YjquXbvGQlYduCDDlVpXcMVLsv6M9pyT@vger.kernel.org
X-Gm-Message-State: APuU4Z8ajsKzhg4iWAShx8ceQ2CupXJ+dnehRU83zD3PixUgEyK6IePb
	/De1cr11oCf/lmvf61Adx9Dhi5AVQpWnk4hObwzSs4c0izBWvpAigI9xd37cDtsF6BIDGMgYEBp
	vBUtjI3UkXSVjwp3OzkoJHTE9h5yfRCWyTZONod9OyXIelNqPu4gfSgUJrL1GvErhgteji5GD
X-Gm-Gg: AYBFou3/Is0NU4j768te2gQ17i0n98X8tSYYSI4GXcRkDQBFJvOts0/bUb7yuajHCWZ
	r3jUY4toqQBwsRtZ2F0bLiUGsBNdTuNFxDyvGJXT1nGDA65j3Xwlp6g2nv/JSyBKuEf9R9mhBQ2
	QeK7irhPcY++hG4g/BjeHGBN5fvQWKqqViO8Y6a3qE3jO1oVI3FuglW/aKDAF5af6u7dJ6EVT6E
	17KOIiSVNjmd+pa88yD1SAhgAiM1niVuE60tHrLeBWtQvbvakPy2agXRFfOd60KQvQFc7Kqmj5V
	Mj6HHkRGlwkMNTSqYKYzwcXzCD6lLpeW2VFFvyBO/fpSL9ZkJRhYaWz1IeakMPgLysvGkHDseY6
	ULbOQ5xacjRy5NWSAY9m2VvTTu3vJD0UxIy9YmhuZ8ae2Y2IVYJdRLXFrQPLk2YVgN12u
X-Received: by 2002:a05:6102:2004:b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7d07255715emr6037626137.2.1793779476489;
        Wed, 04 Nov 2026 00:04:36 -0800 (PST)
X-Received: by 2002:a05:6102:2004:b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7d07255715emr6037622137.2.1793779475937;
        Wed, 04 Nov 2026 00:04:35 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e4467a7sm43308266b.42.2026.11.04.00.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:04:34 -0800 (PST)
Message-ID: <02ebb6b5-4f74-41a3-b6ba-bd8ff24ef000@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 09:04:33 +0100
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
Subject: Re: [PATCH RFC 1/3] arm64: dts: qcom: nord: Add Ethernet support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261101080413.1428016-1-shengchao.guo@oss.qualcomm.com>
 <20261101080413.1428016-2-shengchao.guo@oss.qualcomm.com>
 <658a44f3-219e-4810-8931-192a26ebdc3b@oss.qualcomm.com>
 <aurl7S0IEOeNHDo3@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aurl7S0IEOeNHDo3@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzMiBTYWx0ZWRfXzkuq2jr7Xv/g
 Nyd5Lev1xLFuv3IfUa/KUKUaWMwySXa/YWDnDkkPMyxCAEbyi3UnzsPzuX2FsiOdag0el9eV/aX
 YvLpvw54iF6zk5vjUBqv9FGqxPR24sHWvhrTZVP6RAE0bpkYGvhlxTIwqWs1bOkCA6O8gEiLOZu
 iWJEIXMrG0I3QKNZwkMlhmNqkoEIWtDZqN6HhBvIgSPx6NovHey0vfjv0+sRzglKQ4mBV0ricuY
 YJAcQq+m7shjlMbV2RnbRk8W0jts5J2ZLreeB3rJoMW1kba7KfBUzpu8J004SmUre/IUHCNrXvI
 SUNwQfsO5RmJ3DWske8ivBXydQKAyrBNKgj/xUkGLqvJ/Qne2G8m5LsZKFQLxEf8an2AzgkTx+0
 FBFZ4j+04tEtV80kUhUTLSwMOEgBBboNcqouHoYIvmZBQj2BTWoj+IqbNt24hMOaxBu9k6tCJI2
 1uaEK0Br/Tst+H7H1PA==
X-Proofpoint-GUID: caPAht5758hM4EU_KdwZAHzEvrv54UXE
X-Proofpoint-ORIG-GUID: caPAht5758hM4EU_KdwZAHzEvrv54UXE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzMiBTYWx0ZWRfX5SXmeHTEqlhw
 S1EMdAmafdaS/YuVTP/a4ue4lOrEpTZJGraBlK8ONKFewxgJ5mKXRsMJ942HiMkRBjfoCAYBt8e
 NgJy/2jZEMYYI/ecAiCxi2M6Zj8+cCU=
X-Authority-Analysis: v=2.4 cv=c64+0h9l c=1 sm=1 tr=0 ts=6aeae715 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=lNFNs5cjDqv29Spi1AsA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040032

On 11/4/26 8:59 AM, Shawn Guo wrote:
> On Mon, Nov 02, 2026 at 04:01:03PM +0100, Konrad Dybcio wrote:
>> On 11/1/26 9:04 AM, Shawn Guo wrote:
>>> From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
>>>
>>> Describe both Nord 10-Gbps Ethernet controllers, including their XPCS and
>>> SerDes blocks, clocks, resets, power domains, interconnects, SMMU streams
>>> and DMA queues.
>>>
>>> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
>>> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +	phys = <&serdes0>;
>>> +	phy-names = "serdes";
>>
>> I believe this holds for both GearVM and embedded, so you can move
>> it to the common DTSI
> 
> No, this doesn't apply to GearVM. The SerDes is owned entirely by the SCMI
> server firmware for GearVM variant. LDOs, clkref, reset, and the per-speed
> PLL/RX/TX programming driven by an SCMI perf domain whose level is
> the link speed.

Right, but I meant the assignment to the EMACs specifically

Konrad
