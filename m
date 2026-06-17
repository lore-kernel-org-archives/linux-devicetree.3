Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A773A2574
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 09:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781689384; cv=none; b=M8ygXWbI4yW2uZ6MwkTLrK3eZ7JxdzfUSiJLRNwL3HGZ0s68crMCcMklc6gGkvtpVI2DebrXU7fCkAoB/ZckADkEMv4gxxAa9N+iV3awUh0MxYZO4Rpt2S1DOab/atrwI/Ctec4wJi86DA4QfOauzzkCNlE/ACEW3sCv2rdq5fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781689384; c=relaxed/simple;
	bh=EZr0nMvAPIMzIkfRESwH2m1KRPNc91oLSbNsVSniRXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pSCmdEMz2JCVxjRCYOSkxt6u9nH3ABpFsZDXR8UFmjblztCqWQb9R/MVXW0Yox/m0WwVxmjOvGfJox80MWpmLhWWtTBAAUagP7GifFxjD9ooh6Ao3fgcnSrDHy77AKe+tT/whn1oyHxLwrAIxHV6Jo382fNW6k7VgK+zxBm9jMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GX/i+kn6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I64vRHfJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GX/i+kn6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I64vRHfJ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UXVa2217646
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 09:43:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y0PFZ3dXkaCLzVPbD6H+hniaJto+R8rtLevzujc1O/Q=; b=GX/i+kn6Y6I3oDWo
	aKZ3q+/3afC6clikdCrc1fjsFR5e2YYq18MqmjNtGJHnszSyPl6hwpd830Ak7uek
	bi25KgGDgRZSeh+nmw4Obz/Njq1fFljmEQOmJtBNmi8wdgg036Ni/adGyzEsrQxp
	WQq6yOWPI3MIHxn0YKWWwQR/Pu6uVowDZSgkjEgP/SBXKHpagFDFUY/5EhtHygzc
	qcH8nqgKzEOoiboJZJkdYWUW7AQiGGJKa8rIpUKjcOJN7ThxhMMziDXPuAgLtjFq
	3e1oxGiP35MSTBItCrgq7JVVvSNUV1k1lKVvIHRuaU32O2ZK+qVLUx5NInTVqnUC
	uGPRhA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueerahc1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 09:43:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5178a632a12so13539451cf.3
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 02:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781689382; x=1782294182; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y0PFZ3dXkaCLzVPbD6H+hniaJto+R8rtLevzujc1O/Q=;
        b=I64vRHfJFKTgXEifK0756yBgDNAGdvaYSe/XCd6LDd0IX2Pxh+iFryjyGI3uzXqnGV
         w+jRZrRIcfh+HPfHsXUT4y0Yww5w2MjAowGIRhzTJSszfCKZ20cZYHj4MaRBRcvgznhO
         X07ZvRb2hbbcx35aZa+uhBR/B8yY4Vm0YRr5P/QC5ccc5cDXoYQVKOTvBfeXM+JbWL+N
         /UJxADBkhZvhU2jrVWoiEQynBhpxw9MPYupTb+NHZBHIctfdy23ZGedLELjz9c5bBcyb
         FOBe4SI7ka3T9EzbkfiiOjgE6MQuvQuB/kxBlrhaGBNZb2OXYzsCkDLh0ucw8AuBfj5V
         FLgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781689382; x=1782294182;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y0PFZ3dXkaCLzVPbD6H+hniaJto+R8rtLevzujc1O/Q=;
        b=KJHoayTvLD/gc/wJ5zQoDbj3dwFxFpu+O/k4sPHticBQnl3gkbJ5ZthK89yFkzokEh
         kDdacQKX7etbN6bMeqAMu1sPZ8xviVFnpwESbZFVlZAVZVHMEYM95I4G96RXwhrPuX7d
         IkUlxWHJGSncEheTjVUAqJSR2hRDUXVk5TkkZekRT6Odv4f2vYJYQTWJsWoljiL/zosK
         Fsb5MnMyQ6Vb57J/gSOgyUe2his+mywvII/F5QWqxjitQW+FZ6Rg0Iq4slE9Xn8Jo6iB
         7FISkqEqFhX82x07cc59IG81aR5SP+D0/uT4YcHWGtJFuH3JCWoZ5GKE8Ar/M7wu4Q5V
         5XMw==
X-Forwarded-Encrypted: i=1; AFNElJ9MvVIi/CvJAJq0bbzAaAI52k414esYKwLWQLT9hhaHVFFf2GcbU1psITDF0qbagXB4Zs4Vfrh4IuX6@vger.kernel.org
X-Gm-Message-State: AOJu0Yx96XC69K+hbaOpL/Pb49ti9Lyg8mF4OeXjRng8j3c2WGoNrwqg
	yCNXgJBfcQ3hN62xXlS04HucudejhW0HhFyb8NMWtuQItsGqHr+xytlSzQ/6FQrEVSyFRlWXPRZ
	XDz2J76DwrxrUWHnFKuVbVnbccL5Cp874r4AeXHXM95yjLeWoOiClsazdlrDgD27R
X-Gm-Gg: Acq92OGw+84JSDKI9n+s6vNS0lJ+vqYny338FwbEeZksrkrpxxNWi1JtsW/pUAE0MA3
	AkBw39wRVzDH+HTx13CpKFXqBQvXgJBMRP6XYUukMGoXM1VLpoyzQEUgVWQRmRvghPtB/M56n4E
	AARqYieDInimo5s+o7JBzh/vQT2uTqTPV7dMUTUtzTm77f2BVhlwKj4FeXxy5/z0W+KIlO6sGcI
	aCiF8p2KeagP4KPmbcTUlQrnR7M+S9d+6qfJTks6H45KbB8sLF3e90ykrgJ8IjImH9O4BLrc6MX
	HkbMvMUkbYdhIHx3C0waCCn/2McAo+FmHcrDfND9VIGpYP7VNYLCrP3mZ9HirD0I2v6cA3f0KVh
	qSvmcJ2YyPC24FCJGGn3k5hZswVC2Kw9vhBE=
X-Received: by 2002:a05:620a:1727:b0:915:6433:2599 with SMTP id af79cd13be357-91db94877e5mr256352885a.1.1781689381491;
        Wed, 17 Jun 2026 02:43:01 -0700 (PDT)
X-Received: by 2002:a05:620a:1727:b0:915:6433:2599 with SMTP id af79cd13be357-91db94877e5mr256350885a.1.1781689381048;
        Wed, 17 Jun 2026 02:43:01 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937919b458sm6374523a12.5.2026.06.17.02.42.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 02:43:00 -0700 (PDT)
Message-ID: <4f3c6bee-3ccb-467e-a466-89fece0e6a7f@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 11:42:56 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 8/9] arm64: dts: qcom: shikra-cqs-evk: Enable
 ethernet0
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-8-f0f4a1d19929@oss.qualcomm.com>
 <2cb658f3-f564-4396-884d-d025eaa674a1@oss.qualcomm.com>
 <ajF+xlipLuZtf4HL@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ajF+xlipLuZtf4HL@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA5MCBTYWx0ZWRfX+cFd1WXCIpkY
 2megWPst2I7pC+hFZBmmcYfsOvEQNZ0vB7B7CPTJ6EBY+ewuXNqU+suau8hpw+1p4kLQNp2om/F
 FA6jThZhj5a9S9MaxWK5KcibJGMt588=
X-Proofpoint-GUID: VeEJukIBs2_Q-WoTcO8x_SsSWAzIPDeQ
X-Authority-Analysis: v=2.4 cv=d4fFDxjE c=1 sm=1 tr=0 ts=6a326c26 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=zlF0UblE2nBlcRgU2acA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA5MCBTYWx0ZWRfX/WFqJXa25ewL
 UVkpsSid9sxSAmQMVeotpomsg08Qlxvsr0ecVkuepjTVC/vmO5E8PzouWR87/haMe+b/cVMs4GT
 Y4NCJDMfKs225w3sYP93FBxHNTkcZcjkAiKacGRcvm92Fc5cqxLTh/iLUYo50F80wzRjxqvxHhB
 LBo4H9XIKB29TkXJuyrixjnSLlnBUjaswxsOqlAKRylNpXtIk3INMfHNXQp8uS6OxCxy5tEXDRG
 mWjuukbFCCnlc/lyEaLJ7JD0mhyYsOjbByapraJx1AIRSU7g+yuE8V6r9PHo0wN2SMqbhtFy62M
 t77jAZR4U8A549N/zeI0uS3gohlYQcAFziOEBGKzRqpLmKuzAiCWpkWN0QZooZ85+mzcKedrr4V
 oIcSvYZ1nEIuo3bXuFooA5teS1Zdb/cAnelO2uDEuuYePQhlONVecknX5dkdoOvWnu+xqGEaV91
 H5yOUnwCwdh9+LwK9VA==
X-Proofpoint-ORIG-GUID: VeEJukIBs2_Q-WoTcO8x_SsSWAzIPDeQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170090

On 6/16/26 6:50 PM, Mohd Ayaan Anwar wrote:
> On Tue, Jun 16, 2026 at 11:50:26AM +0200, Konrad Dybcio wrote:
>> On 6/11/26 8:37 PM, Mohd Ayaan Anwar wrote:
>>
>>> +&tlmm {
>>> +	ethernet0_defaults: ethernet0-defaults-state {
>>
>> s/defaults/default
>>
>> Please move this definition to shikra.dtsi
>>
> 
> The CQM and CQS variants have identical GPIO mapping but the IQS is
> different. So should I keep this in shikra.dtsi and overwrite for IQS in
> shikra-iqs-evk.dts?
> 
> 
>>> +
>>> +	emac0_phy_en_hog: emac0-phy-en-hog {
>>> +		gpio-hog;
>>> +		gpios = <149 GPIO_ACTIVE_HIGH>;
>>> +		output-high;
>>> +		line-name = "emac0-phy-en";
>>> +	};
>>
>> This looks like a hack - what does this pin actually do?
>>
> 
> The power supply to both PHYs on Shikra is gated by a GPIO pin. I am
> unsure whether they should be modelled as a fixed, enable-on-boot
> regulator or just like this. They need to be powered on early so that
> MDIO can detect them.

If it's a regulator, then it should be described as a regulator. There
was some discussion regarding the power resources of PHYs over here:

https://lore.kernel.org/linux-arm-msm/SN7PR19MB67369F7DD02F702437C0F1919D1B2@SN7PR19MB6736.namprd19.prod.outlook.com/

Konrad
