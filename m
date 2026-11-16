Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835455;
	b=c6C27M1vSjXLeW5lGDiZDE0aX10TcYabnIURxDeTEYDIn2MIFP0LC8wFQ89lORnDnrZj
	 Rs4esC7EOMyqXda3BoD3Y61WxHUdihGj9G8Z/jaLTUgsc0dyhTFxqNO2gUWrLfj2CeoP4
	 3p08CCSiAdNWN7a6spS5B3X/RcMMrvZjYbqZ8c2oTs3boGJkAvTGg/j2h7zUDTV+HdV6g
	 Hbr89uVW58tUzhfxYj+d2vzyVdCOqE3GCWoviXnPQkzWrIsDaq+m017yEowRfAVX79UQH
	 Q4YmpPhmmxYxe3Kr/GiW3+bh4BNpv16JIhGBrE2jNU0I4VRmqZdTUs8/Caw9ayVgf1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835455;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6GT+ctwQTYDljqzVdZFgORZTpXEykaknfRW43itVU2g=;
	b=DLsWdS86VGfHR/yZ93w8OSkOi5RnkeEO2Qr32lkSu+BCUMy4UOm8c0t81NLR2sHJEQ1M
	 jrK2qj6YbLkk0VDnmOJp179Kw6DYIyNScw4JFwr4bcLNJ2WlEmvxfq4SeWvPmLE3S+c6S
	 WxcgUesUSKSXLsTCX3dRh6wJLBQVBOMlzdDciavTIKcll7mR6bsXudR3s02v0211QGYL6
	 yQElnParodb7lHtCHHY7nFWtf7JcZ4o4nlgWhERHsOjQ9LvBeuu1UsTkDl86i5kq/U7mo
	 6Y6mSqVvIzJeeV9Z+eHJqgl8lXZZ00fJ+RjPQ7ko7yeSOmJN0aVL1fNNpYBjW5/RgeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mUmLm6w0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hFdBtd+7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BF9606A31C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0BF9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mUmLm6w0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hFdBtd+7
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC0pJW536243
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:24:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6GT+ctwQTYDljqzVdZFgORZTpXEykaknfRW43itVU2g=; b=mUmLm6w0uxqesYPS
	Ycl28Zbno1cCOzo8OGx4VA4nr5um2NcJiafzvsEP3xlK7/YjonvbDzhOo9OyM0eX
	4KyKj98LuzTNgkadTttSMN8laKVHt15hb2coRwewEluUR+nyAsiekLT9bdaVZGkC
	K5972To9wkAUEynnRlGBguxMNDBWsY9l2ceSt22+9Y5CbLtViVxibGMNHC/nS9Ru
	yjowr4U6qkXQE2bTOUeTf8MmLeHTWHjFHA8qasMqevDJ17WsD7pAgYT37K7yad8W
	XoqO21cVjsoscDSx9VPP52ONW1JsmirPbG4pdXw5bHKAZvcOr8qdqPgSb6J6zamY
	yuK9Og==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyqggpr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:24:13 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-8615687aa4eso4007850a34.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 05:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794835453; x=1795440253; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6GT+ctwQTYDljqzVdZFgORZTpXEykaknfRW43itVU2g=;
        b=hFdBtd+7kwjToKw0YZdJCP+sQULKvCtS9lqPoKCD15cKtWsymynBbCl2v+/ZtEvyVf
         qNaKKXCh64Xqm9YtCeKR/q9dsrJlbUUJ+K/apcnJppXF7LpL+O0SuspRc3GaiPOUj2Iz
         HdXOg0tIWqmroFQWKtIT3uoN3XAWHT/PDx8Y3/MhJtVwTN4lH6FX+aIHg6NPfPgEjLqL
         qX6fEkEl2QdI2zyNJbvlXJ0++qNdGSoVZqegje1XD9MDtWV2Ao89R4rnUJUUe2a8St8X
         saYV3YMRZ6Ozrb1H2ly/CT8wgedNOs2caMjtKgqJOSc+H14izLMny0lhyKYSfzxuo9dW
         qsiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835453; x=1795440253;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6GT+ctwQTYDljqzVdZFgORZTpXEykaknfRW43itVU2g=;
        b=lnVcJWcIdwFVW8lnTvVdMElPtUJNSjtuZlBk5lq7k+pE0dsj0b3HdkuhjE8qeJiQml
         UKwXgLq72uwsT58avfZo3u2qKlNja4vdkfxayQ5EghzYGxsrCpnX6yocLcJUdYkwSo5F
         6C6fTzwuBdnFDS0VMwyEXGtVXJQng9sCMfx+s7zzezrlvNoidYp50AKLAuy8BFdgqcRF
         t/0MheDgtcvoFMj/MeRKkjayQkO0rZE25ECZBgN7hvHowZAwG3zGZjmIc78NXoyZiWhE
         6/H7McvqlPX1kRQCGbh+pKcFK+ecTYH2UYCxitE6Y3yb7ZNwdMQDD2W/ezaKs7S3b8Qr
         WIbQ==
X-Forwarded-Encrypted: i=1; AL+hErEMIIp506Y5JfpLXo3ngBJe1ezBTcaaEhgW9WN17kIkXshlIXEhJhjpciiKlVNtYUpmIb8b761cnvDR@vger.kernel.org
X-Gm-Message-State: APuU4Z/NBNMXLiwAFvsRzhXFCsyIESzt9DDNSlZ+EI84lkZR2ccyEb3v
	tVStVEuPG5ifug05fs4mgthOf993TOZam8RCFkoRnMqvhNPbqi+0D4Wj9U0Zw5SKm6A6PyQnCsi
	9kLC3xJ5qdawHk/2Ry0o/cQ0DRz8dNCtApQqh8z2Xrm7vpPmfeAOWCi8DtdwhObmOMzaUCLv+
X-Gm-Gg: AYBFou2jvWSeI33rWanXcRLuCy8jsytqpht2UD+1NeQ8kibppBqRKyjDmkD36V/O5o3
	HRLRx3KCpk4nNVu1MrKzi0GIrUmafWrxXCS4/ZOtSfAnilwPox383Ivu4FP41yKwOqt9eVjJnQw
	TSR7Bip+IoDfOn0Xl1ynI4lEyE6FQl05684Wa4tQ2TP4+57tWXKBcSfLLU0/BmbY5epiQXqCTbv
	CpGFTH71zA3MGwz2C4rn4OPSK59vvPjSH62Z5FigagsS7jcz/m7MSRkS5DehzNHbONpxbaww0JS
	QDeQSk0643VHrVj+ucTSPPkF1MbVIKLYMV8rRA8L1z+Xcyyx+wHdrAAPV5zLaGVLs7p/pOYcojk
	iDfGw1aJiv6ySGhzFhrL7uztF7i617xO2lWSSpDqUqVOF0f/22jUn4jBBGMrr3F0ic2Vfq/Fxug
	C1iJUx+A==
X-Received: by 2002:a05:6830:4ac2:b0:839:c62a:1661 with SMTP id 46e09a7af769-861526771ecmr12512621a34.7.1794835453145;
        Mon, 16 Nov 2026 05:24:13 -0800 (PST)
X-Received: by 2002:a05:6830:4ac2:b0:839:c62a:1661 with SMTP id 46e09a7af769-861526771ecmr12512599a34.7.1794835452702;
        Mon, 16 Nov 2026 05:24:12 -0800 (PST)
Received: from [10.219.50.182] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862c67db8basm3095156a34.13.2026.11.16.05.24.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 05:24:12 -0800 (PST)
Message-ID: <52890e46-95e8-4bc4-b2f2-03aa059b59a2@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 18:54:06 +0530
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
Subject: Re: [PATCH v1] arm64: dts: qcom: glymur-crd: add DisplayPort audio
 DAI link
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261105104657.621104-1-rohith.chiluka@oss.qualcomm.com>
 <e24d7d8c-ee7a-4a83-8daa-4805a7920f44@oss.qualcomm.com>
Content-Language: en-US
From: Rohith Chiluka <rohith.chiluka@oss.qualcomm.com>
In-Reply-To: <e24d7d8c-ee7a-4a83-8daa-4805a7920f44@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1MyBTYWx0ZWRfX/jX/7E+RIKiK
 83EE1Bu9SsSHISDMlv3mC1sxFLJFWswV+W1JzZ2dvUtnzZKejrQ4Pxh322pHQWk/O7m+SiQ1cKw
 QfRPv1WGygh27oeybbPBVKnHNaTgJ6M=
X-Authority-Analysis: v=2.4 cv=epRKXYpX c=1 sm=1 tr=0 ts=6afb03fd cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=QTr3mE0PPTBUZRDae74A:9 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-ORIG-GUID: 081IBqORxH1G4moZUY80SkB8tD_kXhUF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1MyBTYWx0ZWRfX1Inq4jmOgU2/
 eHKxU1RG1/WDyYN+BKPlCQQmrM+QwynqlaJbIZUqbWmR+RP5CXFuUTsIocya60kmb6vbly3CEGI
 mVBU/dOJGIZZjsUbGLOXzTyLt2JTyLdOvFuborlBhU7xn6YrRNhKa9Pc7jLuTN3jgBJ8cHl4FP5
 VeXKsIyYkAXlNPxtkCLj1QBpxooP5m/ecFKHm9gEEgowrAynKOXrtJK0P7BAc82Ncmzux+DV1u0
 XuUl7v9PHPDP7WSw60nYNh1mCjTQ7GNF4iFfMsHO+G5q2JKI/XZXaRPrQWiuoGKodrwjidgT8DL
 G+s6tTq5WUcq8muO6JCBdLslawTZamnpRvRzvut4Js+CPGycUwozexnPyKR0b1e0+I9/sNrTHO2
 PWASRiSGK1qZromVdKyqXvfmKj0tC4x64zYIvMSCoQ6z9uPekdQRj3L3rB1K9eh8cDVtqHS3uyZ
 2cHH6oZlpOU8pVU5xJQ==
X-Proofpoint-GUID: 081IBqORxH1G4moZUY80SkB8tD_kXhUF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160053


On 11/5/2026 5:37 PM, Konrad Dybcio wrote:
>> Add a DAI link for the DisplayPort RX path so that audio can be
>> routed over DisplayPort on glymur-crd. The link wires up the
>> DISPLAY_PORT_RX_1 backend of the q6apm ADSP to the mdss_dp1
>> controller, with q6apm providing the platform (DMA) component.
> Why do you think we should only have audio on dp1?

This patch series targets |mdss_dp1| exclusively, so |DISPLAY_PORT_RX_1| 
is used here. Support for |mdss_dp0| (and consequently 
|DISPLAY_PORT_RX_0|) is planned as a separate patch series to keep the 
changes scoped and easier to review.

Regards
Rohith Chiluka

