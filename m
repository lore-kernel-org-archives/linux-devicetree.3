Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794796759;
	b=mHgNYjUxBabmv/A8kAUY+GDdvBCKbL7YOV7uWsq6S3fAFATXyHRKVZAkzg8oQuPuf6Qs
	 pEdEqOO2kIE9TyNqg4VemYRxycyzj4qjt8ESFRT0T2ZQDvPGYm1MBPaySlfY2kD2pVVq6
	 mOfKphTNbjXZDPeuCQbYmi39Oe26oaescdHCrjQSUjU0+265DvM/Gedwytv1z4y/ckNKK
	 tQwYAVSaoS5K/SF5FdWIch9xH5DtAJaCc17mvzbdkNS4kX8x+/JRChN1HmJlIsxVaGpSI
	 L0FSwxoiSykgNbrq3NUM6IvVwkb0FIyxaW+7G7unAWfb5zkhZR7v9W5/LiBj11zvgfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794796759;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=F2MkkOjtOBMugVy6AnNn+LItc3X/brWtifolQLWYx2o=;
	b=Ap9O/9/HCWDd5SNDbs4legJYyrkzLjelqrTFcguRnGE9DE7hyu04FXwBebMEL2mfvADq
	 x/V8hVyQhNEM+Xg6KMHxM8hdFctKnll0dnJ4YbVXOcccJuHtP8QsAB7g6MtX95ZqzURfe
	 MC69QVCmuucZLG+RNBYccegGnVwA2kTxuNmjiKG0V7XMXwD925PUfL/GZgeyCznmeNsX0
	 MZ3moOHrgOY2wlhDWgRrXnLtyNctlJ9qzQLga7P1WIx9tViS6Tvh9wXAc78oeK1K6UlP3
	 MAPXclrPFPVx/9KsdPEUD5otA58CJ6PSvcKKmZj+f/o/MWU+eaa8r4FWY1tJ51hEGdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YLWKz2pH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HfQpKjhF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD18606A31C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 02:39:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CD18606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YLWKz2pH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HfQpKjhF
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG1L8h92361930
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 02:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F2MkkOjtOBMugVy6AnNn+LItc3X/brWtifolQLWYx2o=; b=YLWKz2pH5QwPDe6W
	iem3B/1wBS7jDUWVIf/dQP57tMDzV0ZQ0FsCjVxQ58kQfNzmK8rCic+0V/Wce836
	a3zUO2XBuEJ9Hnboo6n81rpxC3roa+S3lIPhxCWFawqLInL64DU3Yz0qz56uiUiT
	h4nJmPvREgPVTand+c2hVc6lUi+Lz9/jH3F7TjtbXfznaj04D21X21tbAPYNk8Hv
	DJo/n38Vv885v6wAirHw7n5A9pImQz5Eb8QIGScgzEqi/hFEs7BnKCw/Vrqxq7yk
	KweXdaE0rp6tTW8CmeU0GF+BKHGP+o341A0V/UJvSgZu/nFKMiraNjN24L6jP+oo
	Xznwcg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhj44e30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 02:39:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495c71055bso311194385a.2
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 18:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794796758; x=1795401558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F2MkkOjtOBMugVy6AnNn+LItc3X/brWtifolQLWYx2o=;
        b=HfQpKjhFzghzd68+yCTcDiTZPumg2TRs08LAVA26xvRkrcKeQyVHR/w3eI88gRrfxB
         +G8Wt3BMEPzgvITc8Tny2ZE25y6D06Nlqj5nOELHZeM/kj6AFKoYWrHcz/EOxAT8hXXc
         ZgGxwXw5SEwGeIh5w7e/DUexkdpv5jNwZB4A+aXFgu4BHAxzpOwvvzKfYcJktkhTIVKg
         TGzCa5adYW9I+45oc9ScdiL4jTTIqAF7shbErwuz5g6bFcM328Tt+vwwJzyPfDCwM/3S
         BD7IQvF++Q/PqZsJGdDouiwUhCWzbYc0a1WmvKs1+Eq6hZ+xXtaojVj0kbt4c4FXlcft
         LocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794796758; x=1795401558;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F2MkkOjtOBMugVy6AnNn+LItc3X/brWtifolQLWYx2o=;
        b=R1Sz+Fk6b4oHtRjsDx1qenduE+o1EQthaLD7Iqn+6nddNnTDqK+3ung9+ANvnHiZOZ
         ISn+VHhv3DYvItq6gArto+k4czCSEN4M0GjteGv0KdLb6jUvExBAMslV/Z+GM7CiocLb
         AT/NwkPKOWMJgiONOsYMGLR6j4fO0tItWnMkvZJyxt+WJZvI3X0TGu3nnvXlG/juhkVi
         NBTd0iDNY08qiaWM1PS3gybI3YN6Y7a6Ckax1mA6UYLrEnKMuvo71sczzes0WvS0Reqt
         ONom+eYRYAgc+kUNs8P1eN3ZZQ8KCBGoh1TQJiWhJ6VehXvLonHBz2P6A3/2S+VcLjPG
         cyOw==
X-Forwarded-Encrypted: i=1; AL+hErGuPNRzHZzcdTToVQbCcqrNktLlBFPZqQY54afjsGZ6OqvjZcd95V5IWEltP2x7BdAqDJlyeYO4qgdk@vger.kernel.org
X-Gm-Message-State: APuU4Z8dkvUv3wUBbqqhebWLlysxUrT1c7ZExJOa51PQQnMC+R23yhiM
	4/3T7Z9Cd2F+mte91AySZi0XwrcwucYmOVsMa/AnsghApu3MimhgKPtYkP1UDS1EHlL338AgTiP
	vCmJ9MPiEyHeqZUBFz02OAzAUM7Jig2i8rQwimqxgnXHDBLhd36FIt9EoFN9YgqJA
X-Gm-Gg: AYBFou1kojVWx+AfieJUQzYSIjIvWDPnSZpp0Q+46/0HSkOAUZ6KM6h4z3sWvFSIhJB
	gyMXaQv6Rx05I35a+86trEuktlaeamgFiSS0/7nBMaGk8/82yVPr+nI3gOv1O6xPDyTnBi0OM1/
	zejAWLCJuInbx9+0JiaJWUqc3G7rGx0n6B/MvAsXJ8djI2vy3Yj5R5tiamlz8zstKobaxDh0XBG
	92bQgS9eAy0SlH5i79j7P4SWbIqyccvQQ63Jy3FWY3vAfzZzVif9UfGkfy4nmaDACKAkR0fKyhQ
	WX2RWXzwJjN9ap4y+oZpoS5QP+v2Jl2aZszmPBIy41KTporhBOm+e7LZIleuxyioB83Hb1AHHKo
	W1bBQj1h3nNgYyySkTCsFoNr7NBK9BpjIx1FCg9+/uhN7XhwYXgA5nOO/TxG+kMm7Nie5aJdabb
	THqOdVI31SZNpSlvGstO0VwApzoFmB7apS+g==
X-Received: by 2002:a05:620a:ac18:b0:949:5c62:e785 with SMTP id af79cd13be357-9495c62e9bcmr926216385a.21.1794796757720;
        Sun, 15 Nov 2026 18:39:17 -0800 (PST)
X-Received: by 2002:a05:620a:ac18:b0:949:5c62:e785 with SMTP id af79cd13be357-9495c62e9bcmr926215085a.21.1794796757283;
        Sun, 15 Nov 2026 18:39:17 -0800 (PST)
Received: from [10.38.240.54] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23c9ade7sm75767716d6.5.2026.11.15.18.39.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 18:39:16 -0800 (PST)
Message-ID: <12a1c1bf-df65-4ed9-8d36-23d89d5013cd@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 10:39:07 +0800
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
Subject: Re: [PATCH v7 01/23] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 SM8750 CSI2 PHY
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
 <20261114-add-support-for-camss-on-sm8750-v7-1-8ff2a11835f6@oss.qualcomm.com>
 <a4a3df2a-eb90-427f-8881-f857100779db@linaro.org>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <a4a3df2a-eb90-427f-8881-f857100779db@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAxMCBTYWx0ZWRfX4V/JnbSaHgnD
 7hbdtP+i3vek0biHQQ0UU53YebYeslT0MUlGNelJL/Ekw2Au/4L2445ZS+ubuSqg9YS446QfT4g
 +5r/W11wPOp6IwOwrFMz4bGPvaNrJnmjFkoVmIT2ObmMP1QP8xgSXw4uQlOthxNwnTjIbWYeMbz
 Q5OEFo9qhSvtgj50sc+xlkFk7wib9ElyKzwuOd8URuUEC5sOqFfmbpJEbVM2ZKkhFd2O+5Vu0Pm
 h2pIQeUyJBK+7/NatKzGLV1Seu4b/A+88CE/G+NpDtS6qd5ChTdj8b+SMQXsHA95drR3OCtOhHr
 m4f5Wg8zAKsuFjXAoWeq//olpSyoAU6ySZMZouiYdQBga+mrl7STTlmjJaQ9CwGujEDFgdRx1+b
 H6W+LOfd/W9YC4e3u5BaFM8urk6CGwDyKE0LAZGNKOJCjfdhUNoOm38jacDJdM1WTZv4N2RredV
 brMFHlY5eZLefAXwY0Q==
X-Authority-Analysis: v=2.4 cv=av0nmiZV c=1 sm=1 tr=0 ts=6afa6cd6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=bVWuqmIr14v8cS7SW4QA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: oAHzVKyrrsA5YYzrUyiHsdvg-a5DHMCo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAxMCBTYWx0ZWRfX82VavIoAuw++
 iXOwxR5s3oFKJHAajpwxn9nshDkn6EnvcYnMV35qS6TR2/yNF68G9Befllp8m00froUFWZocJui
 Vw+ls3wXk1LIz8FJzkgH7EyH9+gn9X4=
X-Proofpoint-ORIG-GUID: oAHzVKyrrsA5YYzrUyiHsdvg-a5DHMCo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160010

Hi Bryan,

On 11/15/2026 8:05 PM, Bryan O'Donoghue wrote:
> On 14/11/2026 11:29, Wenmeng Liu wrote:
>> The SM8750 camera subsystem has six CSI2 D-PHY blocks. Describe them
>> with a standalone "qcom,sm8750-csi2-phy" compatible, so the CAMSS
>> binding can instantiate the CSIPHY nodes as separate phy devices.
> 
> C-PHY, D-PHY and combo mode ?
> 
> It would be nice to get an accurate description.
> 

ACK. Will update in next version.

Thanks,
Wenmeng

>> Signed-off-by: Hangxiang Ma<hangxiang.ma@oss.qualcomm.com>
>> Signed-off-by: Wenmeng Liu<wenmeng.liu@oss.qualcomm.com>
> 
> ---
> bod

