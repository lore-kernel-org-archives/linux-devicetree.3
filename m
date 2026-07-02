Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE9735CB81
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 10:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782987126; cv=none; b=VvmGXQDowaTjl++CYdwDf5OmdAZRgHUlAP2Cr7H+3AjZT3YvkTyQOsw6QQlMrQu3DOe+XgglrM6SqvpED8qKY+ikEN1Kn7SV522lV687BU6hVbmaKM3wFPz7XkUCJuMYHu+TeXDJLK7UjYNWaOruAzQiAzz13JypRsTozbvBePA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782987126; c=relaxed/simple;
	bh=WPbU9zyN41Kz3ts39tgtUWXwby7aflswHhIE3AAgyTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=In/XMRW6ENxqbYdz3TJwMpRqy/tSuRph65/upl9vbkybjJCLa41U9pGnr0VzysTVnq3F/INhx+Sc8jFlFQxUN9MS/H+krmmvu29fjQfk14MExr+MCgNcUdFDKOWKrm51dfVcZbde45Op1Y2AmLCHAwPJSyzTTq7FU3H5CJeNyPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LdJKowK/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C6xyaoF9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LdJKowK/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C6xyaoF9"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629nNCx4139472
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 10:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/W4rwTUsblVQUb2azkuxNIAxMmfdF2CA50hNgiVoaSw=; b=LdJKowK/UY8C+Tgp
	s3AfQxglZDGApN7sw5NlfvC8YAZZE/C58SrRlFq/0StdAGctnYD+hcAhXCL+v1Jh
	/fSHn6kTl/tynImwlqXCCUgBmTcTN5JHmgW5hNJDBmT1ElbUzSG6MPKmQ6eWJmL2
	egV8ddqzeqBpZfFvbZ91c7QvkBsAqHJaM25X7JGHWHRPmet6vdDaCrPzl/qo7jxs
	sfYOsNKsfD+oTvcRitul9tbDVb6zBoTyvcKehYjyX+8MsntIN16KiNvci0L/DJWS
	FSfcSbJTH2OS4uniCv4bEjbPhmpU4K0uDWd8DibMnha6Om7wi+mBx+NysW0HaJp7
	bqpQJg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5npr82yt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 10:12:04 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-847ac21582cso1934804b3a.2
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 03:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782987124; x=1783591924; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/W4rwTUsblVQUb2azkuxNIAxMmfdF2CA50hNgiVoaSw=;
        b=C6xyaoF9S/q92mHdKhu8HYXUcJsP49nF6X2/FLwTrk9BuKfYTpQSoIRANu5NEEkFn5
         njdLO4NHC6rSAVdLpWTUCeUGEHlRRi0qTnw4b3ayMmOIzmDPFdUyFQtuB1mPT/pRkMJb
         M3xypQjjH2gYVsSQ8hnIzXjobv65tz2HV8K35mBkrtjthujlbAM6LhM0tiw3kWN34daU
         eVjgWQkCvh+l0ISY8EzzWPUvsQg37zZYwFOvztdRvVtvA45BMrl2vvALujingo+AWU/s
         Be9InDN2/nD6Y9wN2h3eXyOFKK50jZ5gTJrrI+y4t1ogCVVoWzJvH2GFfFv6JsT7JWds
         2L8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782987124; x=1783591924;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/W4rwTUsblVQUb2azkuxNIAxMmfdF2CA50hNgiVoaSw=;
        b=kbQ7LqRYy09GqOLCNgtjEdzVT/rVBwRi6UF2j8LoG8BQz1pOl97zd5dr4qAlrgBZsy
         cAIcjUd7zNTjjuo4hzAdca53uRIFCUQPMntZgRkv+Z3PsVfJLk++mw7asKempJua96Ta
         kGOpufK56pK7QjLxwbO4rVJc+rDOlcgShpe+nRND8t3sB4E6z5gSWwkCZVLWH2/M5Pp4
         1YhZmnEjmW5T0V2Nu/Emuv+US6ioooZsibRBDgJbje4I0vEdFUlY+W6n/CudwzlHvp2X
         d8Dmqya9UyGXUd5D983M3qitXbs+etx1LsiVl/migGD415IO0Qqulqk5geVpPpbvV3uN
         iZSQ==
X-Forwarded-Encrypted: i=1; AFNElJ/yLbT/65aHnUQC2TvQ29IZDY3P1ZXTgSAemUgN5i/kPJU+8HLN7g3fC7D9UNPP7YyFviXdMz18pkbd@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbn9nxUABJAhbT3xfkm/67AN2YxtfH2fGYNTZslxfXF/6gC0ie
	P1XOroIzkAddDX3TiZjOoTezQoBQNS+JXA8dRMly5W105arOIVmfG/jlj1Mo9HxLheiGl81DNcl
	FyG0Hd4VZcCbx4ygwVRdbgyg6IYfDhBCnWjLssvvt61XBNlOJA9sWnI90b7cjs0J8
X-Gm-Gg: AfdE7cm51Pk61N4xcN8pXDV3lsfP5OCx3yd6CiudO2evF2DsWfvYgUF/JtCvvQH+qHA
	EhHSkNm6DpcvrmpOeGDpKs+M1vY0nzLRF787wWhRli814VwDGrgiDK4qYjM03naAQBKR8OWKJmB
	Wobkj7mm1phybg5YIrhp2Mf+tFjA/uT5kCye7zgxMjEFu28GEXs7EdTnsvrDzET57NfjGwjUUYV
	hdey7HMbGH63bw2yCg7jJZcrYm7U3qZ0e6CS8Ms+JUkdAxjMSLESx3HdBzvSZRFdYxreWSj1UYc
	Ap4Pvi4sx3CrB42MWmn6k9ztJj/a1gZ5OAo0DvcirDoKBb3fTJ6Rq1H5qgUIHqTL2qMNLhQJhB6
	aCczTVK43591ghqM2GQ+i8aRmy4AArpO568dpFUmI
X-Received: by 2002:a05:6a00:1798:b0:845:df39:b15c with SMTP id d2e1a72fcca58-847c08956fbmr5292514b3a.37.1782987123960;
        Thu, 02 Jul 2026 03:12:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:1798:b0:845:df39:b15c with SMTP id d2e1a72fcca58-847c08956fbmr5292472b3a.37.1782987123492;
        Thu, 02 Jul 2026 03:12:03 -0700 (PDT)
Received: from [10.218.39.201] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb9b409fsm1130752b3a.52.2026.07.02.03.11.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 03:12:03 -0700 (PDT)
Message-ID: <88770279-0c63-4c56-a727-dcebf03c32c5@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 15:41:56 +0530
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
Content-Language: en-US
From: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
In-Reply-To: <8ba8a59c-fb80-45e3-b4b7-0db06614df49@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: g4hr52qc_JlZZQ0rEbryOY94To_hP67E
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEwNSBTYWx0ZWRfX/GYxJrq0sArn
 mAzNwY2iXyP9a56sEI5Y8OHQswTZDZ6gMicSsZfqCSW8i7ZYH/W+En4vwqGreCAy6lW21Lqk/fQ
 1JZ+twmwBl1UeYIcr3hImjtSJVi71Iw=
X-Authority-Analysis: v=2.4 cv=NsvhtcdJ c=1 sm=1 tr=0 ts=6a463974 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kG7O8nbCROFF2r-TvSsA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: g4hr52qc_JlZZQ0rEbryOY94To_hP67E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEwNSBTYWx0ZWRfX3T6rHAbn28Ee
 /dhMs/rKVTaaCkGxTFBf1SfMWXrPYNRfOJ+t6EUityyMQPFeiXL1MpZ3wo0WoAn8wBrr+hw4Yfq
 GEj3xgKvceTJGTMnAO4Codd3QUyO6sBH33T3oN/3GiQWY2Qsw160lN1CeaqS8Kwc7iXySMVHa+O
 NEwp6Y6LNltrH2XbDwUVBjqao3+LHE+1/tjCR7Pj6U8uxImZAcAVgQqdeJcCXv7LnzjE1WQjEgI
 oGEazghzCuGpV0irkPn+qasGHL0+hrgjmXP9rKUddrLYz3mvO3L/7eiV7MUL9JVv6m6sx6gzPU/
 3MxldIsNAP7FAxcF5VurlavRPHjTQO1k5YCP7Ayyy9Z0LtkIodjNl2n8Su3yO3+tlx8CzuJBE+8
 XtmlGPNbsCz/M1FMOqf55FRIwmnXlzVtFPVbSUCBUKXXkK0pHePrulTxdvLehPAhrVVnOm9ZOi1
 MBNYHWE6NwvD0vdYYnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020105



On 6/30/2026 5:03 PM, Konrad Dybcio wrote:
> On 5/29/26 8:02 PM, Yepuri Siddu wrote:
>> Add a DTSO overlay for the M.2 E-key slot on the QCS6490 RB3 Gen2
>> industrial mezzanine board when populated with a QCC2072 Bluetooth
>> module.
>>
>> The overlay configures UART4 (gpio16-19) for Bluetooth communication
>> at up to 3.2 Mbps. Sleep pin states are defined for all four UART
>> lines to minimize power consumption when Bluetooth is inactive. Host
>> wakeup is handled via a GPIO interrupt on the RX line (gpio19), and
>> SW_CTRL is mapped to gpio86 for power sequencing.
>>
>> Disable UART7 in the base industrial mezzanine overlay as it is
>> not used when the M.2 slot is populated.
>>
>> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
>> ---
> 
> This seems to be a single, unthreaded message. Please switch to
> using the b4 tool for submitting patches - https://b4.docs.kernel.org/

QCC2072 is an M.2 E-key chip. As M.2 Power Sequencing changes are being 
upstreamed, we will reupdate our existing patches to align with M.2 
power sequencing approach.
This includes aligning the bindings, DT and also BT driver changes.

Thanks,
Siddu

> 
> Konrad

