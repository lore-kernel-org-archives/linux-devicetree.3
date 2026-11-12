Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794476023;
	b=VG4MfjDk23Vqkd0M6LIJ63g5d8aLBEKo2YHuJQeSkO88+7DUVqWVXc0lr1Bt/3az5NQW
	 gcjXADOB7YcBFTC+7PD0VVnsG3WKL8WFagxMT7MqcXzXeCFiJv3GHsOLYrLdeqWG2T8uj
	 lA7WIudEoofTKH5BEKGQSX3jaPPVkAvKgTs9h5MOAl4R/lS3ELhgAIlO56ycl9D5SGAne
	 q1cAoc7Gsz6fDJM/dMKaYNcUCRHbtaA7A2JQLpJuV2dgB2zfyMD6MF8S4YAjLD2LhhqWU
	 J1ZSHmBkgZmOMSiZR/MH1TVi01f0LbVgp7CzfEMVCdqAR+dfGuMhXIZvLXxz2VWXUiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476023;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iCHXDwClae4oFDnyJoawnDwBwVWh3VIIZGhH+xwjJ3k=;
	b=qE2nwAMxQQx7/DyhexiAW9ep8EgCWnUc1w2pB27bq6fVEoGSLZnY0I7TbLXnetkvjNaS
	 Z5E2cqHizM+SIVAzGwYzBRfTmfR39WbJ75Nh3WBRxjqOLuTBTj0LttqYKgvaUY0p/it+9
	 KFLxk2RTsJkOyQ5UZWkxAUy5iJ+px38VlHWEX7X22Z/OMLCs2hxWHZ7z7YnhiP4RrnsPf
	 OKNiPhuZtWDuTr5v6jqr7lq6ESAFkpkARepf0r9ImtaLlAL+WtbOZ8IK0LR+jQY5VW1NP
	 7iSG2ojyTkhwB+BlxmKKEEVXj8Aodx75Rp7KKWGhvbchhc6Zj3EVeK9TGfRXdZ2NuFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=osA+UM6B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VZuxsT+7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D63E606A880
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 09:33:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D63E606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=osA+UM6B;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VZuxsT+7
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9H1HS2514168
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 09:33:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iCHXDwClae4oFDnyJoawnDwBwVWh3VIIZGhH+xwjJ3k=; b=osA+UM6BNguP8NUv
	I8hEASmlG4AHeys1KN0uBPHtIozTyZ4v6JhfNz8j7En4XqgiHU4VCoAhMUOFZBhp
	k2JfaVlJESvYgibKklGA+m7Gp5WYx852Nw765KdYrL/Id34tRM6ksKmXfvcqdN1p
	ZOOH86s8+ATr7Jwdos+9GXpABc7Y2iSI6TP77iJ6UCHmAVR/rIjKAuxYHNllre+T
	XVbSGAvwyoWC9WQb5v6wY5rUcbZ7j5QOuBnOkuN8CtROK7DcYyL7x3TalUK5l2AT
	taof6C9zPMOWcHiEJPkM9U4fsLDc9DwYp+Wq9Hlc6JejTHNg64ow7e2DE9pEcD0Y
	Tlg54w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvwm1txt5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 09:33:42 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b69b8c6dd5so5299192b3a.3
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 01:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794476022; x=1795080822; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iCHXDwClae4oFDnyJoawnDwBwVWh3VIIZGhH+xwjJ3k=;
        b=VZuxsT+7DlIg/eOFppBPWMKG9i6N1yJmr3iIjOvI9tdxl+bVMI18ay3EHiD2y4HXAU
         cnT5yPH1Xq4dU98CVB/62oN9ASIxz3cyKiz7AeggxYDZmQfEDyjBQ3mzQoZg+RkwyvZO
         3e6FgpUKgRHTYsO+UoDck8mu4vsePzOtN70joXsOmHq8bVNya5HU2AWXuZs1IIRRXw00
         m8rSHrODCSqJjRAasGklsry7wtgsK80pQ1WF9DSSUOBPkSBRvnJKmK/8SshXxWJuJMeA
         LxoWe/1HhxbmU0ZxsmhDPaTfSC/cXpW88cKWCjQE2xTte1Ax4HUUNgUGqP5rWE+hEXzb
         KRXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794476022; x=1795080822;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iCHXDwClae4oFDnyJoawnDwBwVWh3VIIZGhH+xwjJ3k=;
        b=lWQULLfXZxBBhBhv3S9gjdd2SqdQkVQBhcQkw/zpD+JAPMuoRa4p79w/4ZpAtE0fVb
         QAMmiVbL88yfF4Q3+sH8qnxVMva9xe0er2tS8EPZ1rveMOHMqOMbOoL6iYhaCoCEW3gb
         pieC0P6Lx38+qYRSMpAwi0JcNoINhxZrpTope9oy9mbvF35sbFFzuBMQDpfppChI2wGz
         1S4881EUF6RT9XCdRHFjSMNgwdQXFFAieZxDM0Xyz9vPHC63kE6u+iVKdOoY7T0NqKwG
         gimDszNQmFm7DH3ZGq0+2q13asYUpLE5z3w9CyE8Jg3qxOh9mAIw6WhOU3B5Sbf8Ipzw
         WQgw==
X-Forwarded-Encrypted: i=1; AL+hErF7wJUShQzr8cRBqZ4D2VVPWZVCRHGWVUzl77Znqz73KoROgAolifP/iy1YF5Tnm9ufu4/3aPbD7Q18@vger.kernel.org
X-Gm-Message-State: APuU4Z9cPnVa8kE2zOsY/Q4+SCl3UjWd57tFRWzc0SVq0YFKIp94YffZ
	G9GRk7cCsFxVLKdWinzPGiM6PArsnch86owyz8jRcIhpnjRsaH96CCivD+lt4rlgM4jfFM77xz1
	0a/XfEwEJhAw3wuZWeRkAkytrz2F/CsEwNlx8JFI8riji0Rbfpmk8SjcQu8wd8B6F
X-Gm-Gg: AYBFou2rU6hLUKdpUSa9bjoNhIo8Cvnbz23DoKMgaukwv8H3cUTSgZuoOc03D7a0hVW
	uIKLxy30BrYxEuNPXWJSZSeG7SDIeNyPjBAfCqNmj3UvDh42EsSHFhNbBv7/YyT0aj6KOBYFLNv
	DGtR0MGRF/6RSfsK4+723LRlOyoA1XJeVHvVebaK1+rXZi8IsQLF+3he7OSNEy9JNDJRThPMoPx
	WN2XMibgjzyxnkTb6tysMqkECrPdllVMp2eEy9cYc6eKSB/QJSme9oGrbRLbj0tQ6h3Sugt6u4L
	iQNWK9sPbR1xKcO1c2RzdJ3RKiH7uVV6wpd0HovnJqpWGhW/gH65tztPVTS3T9R7FKss5rH0gN3
	OZisOwzO541QT+//xDxS3zmv3wFHlcM0UZg61qgnG/P3wlgg3IsQ3cI9e/BzmEMz70l9kjYtF8W
	XJ
X-Received: by 2002:a05:6a00:1f14:b0:899:13ee:1bd7 with SMTP id d2e1a72fcca58-8bc1c884c38mr5109973b3a.35.1794476021920;
        Thu, 12 Nov 2026 01:33:41 -0800 (PST)
X-Received: by 2002:a05:6a00:1f14:b0:899:13ee:1bd7 with SMTP id d2e1a72fcca58-8bc1c884c38mr5109940b3a.35.1794476021449;
        Thu, 12 Nov 2026 01:33:41 -0800 (PST)
Received: from [10.217.216.70] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaae3e9dasm3224610b3a.34.2026.11.12.01.33.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 01:33:41 -0800 (PST)
Message-ID: <8d449b0f-72e6-4fa2-b10a-0e034e8bdfb0@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:03:34 +0530
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
Subject: Re: [PATCH v2 06/10] arm64: dts: qcom: lemans: Add support for TSCSS
 node
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
 <20261108-tscss-v2-6-d5f575010427@oss.qualcomm.com>
 <20261109-enigmatic-solid-sambar-ada2bd@quoll>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20261109-enigmatic-solid-sambar-ada2bd@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KsnYSmWN c=1 sm=1 tr=0 ts=6af587f6 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ClY4ILnnmydcLe65dWgA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 0CiinievtlXbazfviJHrgBtANJFEtLGP
X-Proofpoint-ORIG-GUID: 0CiinievtlXbazfviJHrgBtANJFEtLGP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNyBTYWx0ZWRfX6aVgsYGZibkW
 LgJjXyLXzoHGxiQPV8ngQrCARONEoR0WKxndzubZx6H9Zm+CdYRvXhSiXwhpvV/JXLnAj8kMdUY
 ch5OOHfgPXGu7PhtbLoeToH0AsmI1M55mH5M0Q/01IJeJRvo7D3tGZwX4CWAwQ+XkRgXvZATDhU
 O/2klUYvJgm997YfxObK9v3CWzYhzZg0pmTufRQOwZbD2HZ9rgKkHtxmLeYIEZA4+WlhH9r0Y3u
 J01W633Z8U5ftfI4vInUE0JS/uPBW3zXsBbRI5qs/hJV+tEoOjJmFGnMDBoTP/L8nrZIVwSyXyg
 0oqdsuZKANIgBKeLi61OXzjnXzUw5yQvkqZ++lTTNsku/nW9gv5Vh2uXQi6NwfT2uJaCe7bsmPa
 teOYs/TTcHer+sJlIgB06QJd5UIViWDSVUgxqKazlNwxtH6FL4U+i+75Et4eZf5+jQfUCxW/7x/
 zKM+hIG2RRGPOLwPoKg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNyBTYWx0ZWRfXxTJ3P0p7llpV
 KRitupNP3kMDcUiQAp+82NmQTypEavjWXJkepDh5Kw5hqQXEdgrxUh3Z87VEwT8ELnzkwL+MUDY
 LDsd/Pgknw3BTz5BhaLlTmMBYYaLgBU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120037



On 09-11-2026 06:22 pm, Krzysztof Kozlowski wrote:
> On Sun, Nov 08, 2026 at 06:48:27PM +0530, Imran Shaik wrote:
>> Add Timestamp Counter Subsystem (TSCSS) node support on Qualcomm Lemans
>> SoCs.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/lemans.dtsi | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
>> index 1fdb72fa5518..4c76c820cacb 100644
>> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
>> @@ -3022,6 +3022,18 @@ pcie1_phy: phy@1c14000 {
>>   			status = "disabled";
>>   		};
>>   
>> +		ptp@1c80000 {
>> +			compatible = "qcom,sa8775p-tscss";
>> +			reg = <0x0 0x01c80000 0x0 0x2000>;
> 
> Where is the rest of PTP devices? Your binding clearly said there are
> PTP with one and with two address spaces.
> 

As updated in the bindings patch1, will add the ETU reg also by default
for all the SoCs, and will take care of constraints handling based on
the "qcom,etu-slice" property.

Thanks,
Imran
