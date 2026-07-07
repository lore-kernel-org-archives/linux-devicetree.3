Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFA43845D9
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 05:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783402882; cv=none; b=RXyIuwsu7zimZQcQ7KH5/B6R9RHH5C9Uwi8sRqS71LpdKMuOVvXFjZQ8ujgX7njnIrhcWnyLp9q6OjpRxZLEDbVqQMYh4kC8uQ3ZeyT/MyQxON4nv1hB3/rPyhrMkx5LbIWM6FKQMiiSuxf3la53jUGWlhfzBnPD/I+I43fVrHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783402882; c=relaxed/simple;
	bh=lflEKyZ2GNpJuinbyFUPuuftqGQc8rX0sKQ4/Oimemk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SRN+gQlcGpIv6DYaypBujRuh3NUEHN0lVJ4ZP3P/SRNFomYuL7r6nNQoWWf74qXRXreG1nU/kW0TC+OggEPgx6JwkB0x6yZn5BXOe2SV6zdoTVE+OTBlUvHUVRV9vOhdQyk47LfMYLJO0Fgj/Iq0Ds2vC2irDN51w3s18+6B81Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pIBWH6C/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zfcg6zWU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pIBWH6C/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zfcg6zWU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66749Mjg2645714
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 05:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lflEKyZ2GNpJuinbyFUPuuftqGQc8rX0sKQ4/Oimemk=; b=pIBWH6C/GRvvXGyK
	UUKYecCk/BmHWnvjJUWbpCrXeEV6AzYwfHLiD/JB5aCTOi99/Eyg818IG6T3R2FP
	jph2mKiIANbeN/NHviifXypy/T3ol9IJCF/k0UQezDxP8McA5FHoA8+sHRnMXBSZ
	DSQSPVzaLXvJG3VvKLHXaN7DaXUpyvC5o5dH8tcyZY1lMdCExYakJCs/knZd1TTn
	4ezS6YhRl1KMmmkwPbEEWbkj/HQVuJTvFH/XFOJZceOPxAo3lxZX2y3a0SogvRme
	OfpN+ylzzHLEYnj+m+vauhahORUeja6sJGN0XG8bX9g+RQAHCH5s6hL3VH6zRWSo
	aDuq5Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h9cskq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 05:41:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38827cee19eso153709a91.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 22:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783402879; x=1784007679; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lflEKyZ2GNpJuinbyFUPuuftqGQc8rX0sKQ4/Oimemk=;
        b=Zfcg6zWUKRzoQlefCZvmJ/aGKiYNse1E+mPF8aM+zEPioOBh4AmHAQ/x85LbYlX8F8
         mA4EuExwm50BLcmR0f5VPAYskRtPuF/aQqrDkb9Gr06vfMcUJUSE0EVLy5X9GMkSGxWD
         6N8Wyb3xQoYprdFy3f2wr5CwiktQI6G3AR1Z3UybRCBdj9A1ceggzy1swGh4E+WeqBJt
         Sd+IrRXr36gQpZmYn7mJi7y37EhYycRG9GSvaa2rOHRdSmgTS5d/AfRtgT5ehg6qC/f5
         XST2ZFyJCZCOWPrqtKANxTpdhDikOD6rkt9k/tSudk7WA9eLZk5oU/YCkmFlHvq9U6fz
         vOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783402879; x=1784007679;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lflEKyZ2GNpJuinbyFUPuuftqGQc8rX0sKQ4/Oimemk=;
        b=hOTqIVYA2uJDWWCgenqG8wdTVXG+C4fKKS20efsO5vw3aeFT19hyX2TZIrmMjT0PMc
         pp9iYqlAI5x/t28qLjqxLV+GWd8tbUyC/Vd3sM5xMP8koAIwsL8oaxHrvva5W4ghAtkd
         XSaMDSODgZ9IdVAP9s9XTHgfNybGcW9CTyyxPnucEfb4AeNwdRbjgd8HcbdsPJXxXrbG
         XoIJrIpMaaW2XSjAefJHVAKq+vJKMiDZaO6bSkftVcTE9yqOcpp4jBi3zJhr88X8Rs7r
         4NeeP/0Eu+vAEgODsCQqjhF4Aa4h4MlXs/131t7MrSlMHFidaeHfxufP5I3J0/ekapBC
         16Ww==
X-Forwarded-Encrypted: i=1; AHgh+RoeBhHp3uofGA0YnuIlQNWpISv0ttSfxRLQnx6hzckLp8/BCOHn1g2SoMU16Dy2/FKv2wkIj7zg5Eiq@vger.kernel.org
X-Gm-Message-State: AOJu0YzXT5gHhJb21ahduQ2mDs7HkUWAIatgoh39g3JAyYHo+fs9E3Y6
	L2v6gXfIUjJ6QbHOkZy17qj7fmPSyt8vMmm9losNT9JUnvtf+Z9JPTxXrQ6A7XEe+nkKMVwC/DI
	L9XZ03XtHa+1uKwC2Vdta/EM3fRsktWjNoLV8d217Z10VhhFWg4GKGQeE+HBMNkPc
X-Gm-Gg: AfdE7cmpOaO5HZMJAcDUMf0fgU+b9nViOU3R8XAlc7rVMV+LQbG63u5/NZC+w+W9pX1
	a6mdWH6JR81x0gNpUoW+xHPK3On70cLVp2eHDCsrWhJxrNc92a6edE+B6RsHTJr1PkHOpl/Z6K2
	dY9FVAn1jBd3MNq61zU7oy1SAvQ34KmYFYcPvwmM4GGlhZHLnaGjlR3S7gfz2nV4nP5drVzUxwi
	QleCgCF5Eg46SG8CEVONTEERoEko9yse13l2p/RT/ikkEz/sG1cG3F/Fy2sBM9W0F5Kau4flfUD
	bqrvQdxVgGsA0hXRnb4a7c3dkVfT45oJCnCqps3MNjJGHCaIDoS70/EVd2Ows9pWh8bfrzBbC/W
	gpeC+nmmkC/Ig2LDlszBAZqPtkZHQWcLZzO1lRELhzmueI5coZqSjJ/LXtakKQ51tqMxWAaua9/
	1ZWnQL
X-Received: by 2002:a17:90b:53c3:b0:37f:ce2e:32ea with SMTP id 98e67ed59e1d1-3875826180emr3950194a91.19.1783402878811;
        Mon, 06 Jul 2026 22:41:18 -0700 (PDT)
X-Received: by 2002:a17:90b:53c3:b0:37f:ce2e:32ea with SMTP id 98e67ed59e1d1-3875826180emr3950171a91.19.1783402878394;
        Mon, 06 Jul 2026 22:41:18 -0700 (PDT)
Received: from ?IPV6:2405:201:c409:b03f:6d0b:bb83:7a67:4093? ([2405:201:c409:b03f:6d0b:bb83:7a67:4093])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d100b5c9sm426934a91.3.2026.07.06.22.41.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 22:41:17 -0700 (PDT)
Message-ID: <1602bd87-ecc3-4051-b833-5aac43c2762d@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 11:11:11 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] arm64: dts: qcom: shikra-evk: Add TC9563 PCIe switch
 node for PCIe
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio
 <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
References: <20260630193059.GA225112@bhelgaas>
Content-Language: en-US
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
In-Reply-To: <20260630193059.GA225112@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: m2QPKlRDj92yGz3nlmIvD2Xk8tsgyRlO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA1MSBTYWx0ZWRfX4qscX7f0miwY
 J2v1pwU2wasXG/9eX1y2OZbzs5AMHOdCxm3ZDcry5EIZTa0Fbc/83hLN4rnrPjjjG2RcGzajxZr
 AxgyVu3TC7PUz70Du3JZYkQ7LKVzL/k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA1MSBTYWx0ZWRfX+W03u14UDoMf
 wWp1VEbonCJgFP4zPtlG/vzH9vlZ7OLFmG/TaLFsKeNbCPrd7tNvl4IiM89iY6dO03S3nyz16O7
 FCNdv7Ahhzdjo9IHxWZtDUSWCdtjeo4Q9RFzZpMm4KSWFFc0Asu+xJnY4sva1RHJMeZT5imezv7
 1Xq+L76WZjZdp2U5XlwrX6EaNuEOt78aY0aT5cQHPccFg0+XJDgNAFLHKdj5EatnBImlb7Pd22L
 4TFaiFBlRuvmd0hkomgDbDnXAo11xsKRW1F8As3NDTW09qFIy403BUuL4JfZern+5qUcOqAQ9Dz
 WMV5mTXJyhjcvwp1oI7RUTH8B2YqWAuO2VnW2v/ZvXEFWEMFbV87Xv7VLpfkMAtmJwcK0aXlid+
 RU5t+zgnR6MZ+Eh/RVAEuuaQ5Y6kpeUl3JcpM5gnIECRXD9NxIQnbYCimd+nJOh9PivygeCdu/V
 wTB22CWChTJS9LCq4EQ==
X-Proofpoint-GUID: m2QPKlRDj92yGz3nlmIvD2Xk8tsgyRlO
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4c917f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=S2spThItiBpve86ZF9EA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070051


On 7/1/2026 1:00 AM, Bjorn Helgaas wrote:
> On Wed, Jul 01, 2026 at 12:32:50AM +0530, Sushrut Shree Trivedi wrote:
>> Add a node for the TC9563 PCIe switch connected to PCIe. The switch
>> has three downstream ports.Two embedded Ethernet devices are present
>> on one of the downstream ports. All the ports present in the
>> node represent the downstream ports and embedded endpoints.
>>
>> Power to the TC9563 is supplied through two LDO regulators, which
>> are on by default and are added as fixed regulators. TC9563 can be
>> configured through I2C.
> s/ports.Two/ports. Two/
>
> Possibly subject doesn't need two uses of "PCIe".

ACK'd.

Sushrut

