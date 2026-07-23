Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5E44582CE
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 11:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784804590; cv=none; b=Q8kUAzUxogkKgAtyO1QuOMzb10eb/qLh7MSn3fJ4pq+zMIziRmv842N8R5MRiupjuR9dT3+DP6HAFHBKga2nRGIy9JCDOQsIjnmLxWGKoJP7FlFYjiSx0xrHgiK1xosX1vgZfk/sc5/6wjol++qugk94Ceu/J3bJeGRUPKzswAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784804590; c=relaxed/simple;
	bh=3s26Vdb3mKqRAbHFRW5zBeLdM3S6FsWEuze20i41KLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=na15uXSUpdO6FRiWwCkeAwgAsCsLZL+e8O3EUEkulPHTnzeuOTGfwYp1T5VzCsupJ+LfVVh9aIxEHkbvbsorCj38Byt2PnVNrZjIAFFtfSIKeEKt9hdX0nJR0F3qv+wHcpO4q7qNhqDXBHLcO9yt8IrXcmPnr3HSSQd5+rlNoog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l5/xmkAP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XajnCaHN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l5/xmkAP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XajnCaHN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N9Dm3u3567730
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 11:03:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8ztvueMVJEJAC1AJjh/aLjN/yFYMvLc/M/qZzkG7fw8=; b=l5/xmkAP+Sdcbc71
	E+eaYdRUwMYJ1EFx9HDk+0SYCjV0BzYoUBfQLqg2hxjLmh5VE/PWcvppCJMwaLks
	cuXSpAa4zs2ZNE24i/L53+saPmr+/TX0pqZ/Dktigp+bluzoYl2hswUHVNJDCyrS
	ZuvlBfk4DQs9iaJT8nX0KBi/PegBe5MUEdF/ygu8Wi+j+TO30Ggx+t2uSCuVINB0
	xrlLxG63spY/8W0k9YVlmqQknsaTsHqdwpFtkwBlGLFzjvSI5fa5MFHCmz5I9UWC
	iDh3EZh8vZhmKRM/LTPvgB1brfBF20HY1rhtRTYHEZIV+i1ZwJkqY/JuKQhlICN6
	C6uWfw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkg520cyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 11:03:05 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73966c839bfso34018137.0
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 04:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784804585; x=1785409385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ztvueMVJEJAC1AJjh/aLjN/yFYMvLc/M/qZzkG7fw8=;
        b=XajnCaHNgRrjLzelvEFMHWmAE0ioJnPVlb50D04zvk2RPNQ6AU8N//xnSTLrhzSwn2
         /2a9fyWe+48a04CxYLCobduJBeFktSm3y/FvctRfZOjpA1AJMbEVLMMb4PtV8t/A4Wew
         VDaq1liTbYg+zERtQLeBp9GxxHzaK2dZh6v8owqeDFItTNelU+dR+q5FuSqWDD/eO/dR
         SsHTRM8j7VWL2AUu7GjmH30b8NsZ5iSJ8OUltfein43bgB6OsH9EeVLGHgjTd1wCeQAo
         ePRRT2M1B28g2t9CLJVLB+s4BWhVCZ6T/iYLZyOGEkbLb5fXln4NPyvzRo2mdttMKV4V
         ew9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784804585; x=1785409385;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ztvueMVJEJAC1AJjh/aLjN/yFYMvLc/M/qZzkG7fw8=;
        b=bTd3OzCp99fz13PMJiD8du9uRwGYs2KnmICLYFR0Ooxl4pyatR9UeeWxjCU4n6VfXl
         YomixnvfPIprFPvR12lRvZRVjlzaHdxXN0Upp1iU/ljkncWTYcPKNzlASIfSIsfzL+vl
         D0GWN0wpKR4DIyV9Mw4jZSaUjzLvc6dZXEAaKR39xTjwMlnSFG6UKcsXQzBL27LbVslW
         QZJRul9ywG2NSZzX4xATIOCDIwcHGCjNu+7KlM+ZYjpNZigfYU3oKocz7rLFP4JM7E3B
         7cmYmjCK1OE6qWkiw/vr9z91VJiSqUuQ5BVCCLqZTQ/gNNIpjn5bUi1lQ1s/5foGyFpg
         H7UA==
X-Forwarded-Encrypted: i=1; AHgh+RqSRJWoYU2NiREjwk77rfwR7jHApoKJKizsXqp7I1TDV+zsPNp9Nkt6CVmUTcL4UWwnlvf+V2TG6OtT@vger.kernel.org
X-Gm-Message-State: AOJu0YwxALjwd0XZCJEUDkP+UDdJsUevU7Nj81MgUgkUMBJkAcqv9lAP
	9dO22b5BirB78D6cmx29/7Sl+sq01+I4DTAWLZC0Wg/D6bKSp2ebOfJI3z5HMJhykxmnlnIUO1K
	NG3DE1xQLuVnIpclQaBdUDNnYPUxLbE0RZFKNff6/eu8D9vzZMZaFsHVmfoySZBAm
X-Gm-Gg: AR+sD11gi+M1n1kLYmoknaH3Hl6+QIWL6Xwq4xf9jKUmLTT3B+dGSEB09qq3sHeJAwh
	lYiJI2ngzY5Rb4jpx85GpryHJf0fa3pFoi6RTv0qjOAf1oJqqbok4HoPY4x1+wNqbzs/OJhE1ag
	fAFO5xLLyZ3qhlKKkpSnCRRT1T1sn/ueI3T5uatkffnDsUMPjJ/YmLN/2g/8gI7yj4bYZmji6uU
	UvJ2EH2aFpOU/7Ylkk5GQdEg7QToFN38c3J3jRaBp1Pu+LkQQ4kohQYImmQV+xCDNe/T2mQ5O6o
	CiGYWKJJhfW8spRUQCXPcePHzTO7dKtNgv+kTEFx3LDcifISh8mAVEdrJCpRT8Cip+BUOBRicL1
	gYFzdqgZikYFL22qr1OFYchkL
X-Received: by 2002:a05:6102:644d:b0:740:177:fddb with SMTP id ada2fe7eead31-74d61809a38mr271913137.7.1784804584635;
        Thu, 23 Jul 2026 04:03:04 -0700 (PDT)
X-Received: by 2002:a05:6102:644d:b0:740:177:fddb with SMTP id ada2fe7eead31-74d61809a38mr271893137.7.1784804584069;
        Thu, 23 Jul 2026 04:03:04 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ac9d79sm214302966b.21.2026.07.23.04.03.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 04:03:03 -0700 (PDT)
Message-ID: <970cbeee-df24-434e-8d16-4131a978a477@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 13:03:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: hamoa: Add compatible to the
 PCIe Root Port
To: Wei Deng <wei.deng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
References: <20260723-hamoa-m2-dts-v2-v2-0-82254ac101fb@oss.qualcomm.com>
 <20260723-hamoa-m2-dts-v2-v2-2-82254ac101fb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-hamoa-m2-dts-v2-v2-2-82254ac101fb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DtZmPm/+ c=1 sm=1 tr=0 ts=6a61f4e9 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=b08uAuFw51IagC8vmBQA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwOCBTYWx0ZWRfX5bSa0IVKjxOC
 2VMZ+W9BKGzBbBfjFuUVWsaA87+w8qVkbl1B6rG3TaVkSdEQVkENfQ44ubrW1k4zy1rcl2p8Sij
 Dmj504NtZM/SVfwv7vNomGejkTP4l9g=
X-Proofpoint-GUID: e9fy3kTfyhOjKJ-Jb27J76ZIuss27K8A
X-Proofpoint-ORIG-GUID: e9fy3kTfyhOjKJ-Jb27J76ZIuss27K8A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwOCBTYWx0ZWRfX7ihe2V5jL76c
 fTAdoGw7dRs42usVe7Y6FxsuTW/D0sv7ZALsl0q6dg4LRNgwYjaZpojFCH4o4//rZlJMuyvP/xx
 mo4Te2tgxeS8hM82c/K0yIZFkTDu7vYt66Fje26ede8M1/jdTShB6zuk3AFj6VHQVopL/4Ni5R3
 IOy4hi8ddbcQ7WkHOVhxsGGPhQwR3P/UL048FaQWc9QTJ1hTX2aco4sSxru8H24hMp6bcgWsSYq
 YEGOBlnSx8WYgbAdNC+6XFNxx98LR8OT0jTBPcOox0M/K/TwYcRu93Qn6qDQuYL7hlGNjpbyZQw
 9w30xqvIwiQPAm1EJ/JOUkUHc8sg9gbQ7YADVPCwFzsVdmWPTElil8oWv0AlQdoxgh2ogEZeKEz
 HG9VEt6/yMr2xqYhMddAtwgA9JWcSygOPW/gahBK/n2/62X9M6fXYuEEnwl3lc8hRrWvc/6LqgH
 Tvkzlm/+niTrO9F0bow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230108

On 7/23/26 11:56 AM, Wei Deng wrote:
> Add 'compatible = "pciclass,0604"' to the pcie4_port0 node in hamoa.dtsi
> to allow the PCI subsystem to associate the DT node with the PCI-to-PCI
> bridge device, which is required for M.2 connector graph endpoint
> association.
> 
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
