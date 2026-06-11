Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7277149553D
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 16:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781194933; cv=none; b=ShaN0t/gxxYY7Yr4EvoIPMPeucLNcY+rCbSwEMn1IYPBk7VeQJ2KUmmSzYYb6pZKXNSHpheGZAEeh1+95P6ttCh2K1rQ80HczEAMfmOLeuI675CCjv6t28DBmKNZ1nR+o3mCC2+6CVKMn4o9tllVdHdjIeKAYWbA7NN1xe42XyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781194933; c=relaxed/simple;
	bh=MzZh791wBBcduzU8eKa8zBcQoGZIdqkJ3us7JknTT94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X7hOjib91GivVYC5qJFTJd8W1LcjN6ppkVKDyH6Kx3mG0w1sShd/g1ibRSdZF9OBOOR61vMPF600kWZGJ3xVzPFxqZajxCZ4gBJV92LJZyHGja0zvWBr4fprlRDz23veVghIxfOzZ/HRKJWYeWUoYvbDGGR8H8qejHUwzcVicNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RNEoKpZp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HoKNa+xk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RNEoKpZp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HoKNa+xk"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BErwh9975445
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 16:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ym9JHhuGJVnxTXzvMLa8Dh5LEiXzF8dTCSzFskP6WRE=; b=RNEoKpZpXXlhW19u
	rkq2Yg+M6qExhzikZiCg8s/DzeWVooppQDlIjVVrvvAJmismaREsXBMA3P78+34x
	N9OCj4dDl7wCDhtEyXkecvSMlECLaAxH+lF76hZkkoy4ZypghqJ6irCatdaCnWJO
	eBQwfW8Lv1f4a7xPiiHP7eeacHVVc7BVMfA8vCvvdoEdWNOKZrDGTv6zWWdpLyyD
	9XvxXNIpmfJc5z1iCKaprNgfQ07MqaBwmdS68Z+7ETNP5nJV4CrXh/gZetvSVBs2
	C96DKy3inAJ8+PUCOyCqmOXeWDas3Czz0SR1CBBqFcaqPL0h/QP4kybalCBu2w7a
	1gDu3Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6smess-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 16:22:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf32259e0eso402825ad.0
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 09:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781194930; x=1781799730; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ym9JHhuGJVnxTXzvMLa8Dh5LEiXzF8dTCSzFskP6WRE=;
        b=HoKNa+xkEK3CNEx2tPvy36GJkaky0jPrFTM19FF6Onzq0IwBQ1u9Rw/ako7EnMIz3z
         HI4cjO+e9QmxP7wZ8h9HaUz9bgViOzUdWDzBKxtehrunR9G5EYe2rx7VM66utEYhwiKc
         eWwiet8wzLmyLqnB2xD+aqrGMcES9htbYzxHdasjx9uYCJgvkdXUUhDv0cYdjgH/+acN
         KROQnrqS4Gy4lUEvuevk2qYiLPDaFeITpSMgQDXi2+9yrtXsaWjGAfaJbmv+lYgM2FqG
         aaKESxg57AWbiFmEnNHBHkW/RG/TYruKCJjy0c1mOETur0J17eQnrM35l88SxmXefw4e
         M3vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781194930; x=1781799730;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ym9JHhuGJVnxTXzvMLa8Dh5LEiXzF8dTCSzFskP6WRE=;
        b=jnLrpxZcgmNM1vfmSdj7xxYFu0MzSTDxbVC59f/dMHMGuqzbVBY8CWHguSL9UN62Be
         NeHsZO2mMCLjUoTf4/YzSI41n2tLmNrseE6AtBLckfxE5jvNxbdLZSsDYC80KV524pqX
         saWj5F0yuK5goqSyFZ2SnfoQ5wc3wzZI4kFLQfk/paqVUT7/4zuwZNZD649aRWqAYlYe
         rosEzjZ21PsmQihIHjpWDGE9tEjpoK5h96QTNlEm3vGaiHlGp/2yrFTZIXOAePT6TMmQ
         Bf3arwVenlUvPjvel2iqphf/5jRc05R0lk3xq+ua+0gODKi4I/iLoogNhljp1ae+Kof/
         YLig==
X-Forwarded-Encrypted: i=1; AFNElJ/T8Gxj58L5HPoRf+2JbhzSl7lXRrso7h0WwQ+1WlyYHUVWeV7bdEjnJazpsEcGh9kSSAeL3C7hylej@vger.kernel.org
X-Gm-Message-State: AOJu0YzzwYOQgL31Y3RhgOHNyPW2xhRRb2UDoQeaw2LDaLfBPO92bQs4
	MdEWSvnz9NxIYYLdRqiVZRa2MydPFNyvpewlu220bMpmkwrU8MnknvRl2saQCIzBUayCYuqSkzN
	dUw+ZL1+lCtPKRK+4Oe3ORhx+NWn0EOQ1pVG7kujb42C7xeNxOewk3qXMHMBO7SVOqNJCkkyr
X-Gm-Gg: Acq92OF1B9oBbvZRlpVSqTazrUVLggd04kuxWDSYrD5SScQkWQe3D84puegtCPOwEBB
	NAQSBP1w9FahvaLLxxSFwjHu61wWEU5yQsN396QCiFm9RdcgmOZDPNU+mkSyHu1LPnN8LQXhUfz
	Hr+YzN5dFYEDu8nBurKOH0UMFepQjIksV9lJLmwinXKr58FpG6fRAlr0Qc2jYvXORYRzcLInU4g
	PohJJLK/dFQWP9T2g+3wzu2LdlmxG4AQWPEw4hlI67hVh/eFiO6QCyaliUnjZi84WQAfZCwsDBk
	bu5+gc/6HDnv+8iYQDbERhoRLgHMbh2IfnorICNH3NPVgcpacJG8pwFFVGLkfmGJ0mlNIHLCtwz
	HrjASvzNwg5QHKp6jWnkXwc/8Fs6XU5TUL7Mtx8NEMI03tZXAFb/6CM42D71Ornc=
X-Received: by 2002:a17:903:1984:b0:2c1:5135:39f3 with SMTP id d9443c01a7336-2c2f0639a6dmr44760155ad.11.1781194930349;
        Thu, 11 Jun 2026 09:22:10 -0700 (PDT)
X-Received: by 2002:a17:903:1984:b0:2c1:5135:39f3 with SMTP id d9443c01a7336-2c2f0639a6dmr44759545ad.11.1781194929759;
        Thu, 11 Jun 2026 09:22:09 -0700 (PDT)
Received: from [192.168.1.8] ([122.164.81.0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa3a5fsm296310835ad.36.2026.06.11.09.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 09:22:09 -0700 (PDT)
Message-ID: <8a0e9314-0c97-48c8-be95-986c7e6fe641@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 21:52:04 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add support for the QMP PCIe PHYs in Qualcomm IPQ9650
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260602-ipq9650_pcie_phy-v1-0-d8c32a36dbd9@oss.qualcomm.com>
 <aiqYtowP2DQt7Jw0@vaman>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <aiqYtowP2DQt7Jw0@vaman>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: FRw75y9FAcy3XMdzIVAJjBXL9hOAbN9F
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE2NCBTYWx0ZWRfX+rahznOqMt+/
 3RkcPdanT7EksIoCoSOXgajO3t2OmpDJtl2bIUnWb1v3frBYUEue1Ffu8KnD2QVVL0gaJBouq5q
 C8eTho1sHID6W0at6aIWShSRR5xmOVk=
X-Proofpoint-ORIG-GUID: FRw75y9FAcy3XMdzIVAJjBXL9hOAbN9F
X-Authority-Analysis: v=2.4 cv=Kux9H2WN c=1 sm=1 tr=0 ts=6a2ae0b3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=DVNErGSwdtF8OHn2hLoakQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=MO7iE5JbH1gLMWvasfoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE2NCBTYWx0ZWRfX6q832slbViem
 FGYlnTsVeqc2PpqtL6hKTxKyOUCQ+S3JIWLpLDk22nBQlVqllMw7vHX8j68Z+cJHgxu1z4mQ/Si
 gCErABqRYVyibMyjBvnJ7mZEZpXB/du6VJuXrRPjvCw5Fhvd+GzIX/8xdtxE/269xfiCfzzdI2/
 oyTcFi/Oicxmp6UdaV8XndZGAbvfs8a52I9lldnAFHjhE5rkm0aPYtbLSnJGa70IcI7ObDtHMnj
 u1k15rwWp9Cu7KttFm6EDe2wJcnpq+t++Z+CPHfsOVokkbHoklEY8GG/AjXZw+MvWGPKHcVBvx+
 4XFBR08GQYd5wiZ9Zy+EZDpsT+2SvFQ2ne6lJXZdxR28aWxJgnRY/qPWjH+QtQj80dujP8kCsdw
 u5aAAw41BsPZqJQvXpjazA51/OEzUVOqZxqgpvac/pX1U7AH2fN6RkQQSeazzPKjyKAtRSmWjaV
 i1egPTcbuPPv+A8EV3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_03,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110164


On 6/11/2026 4:45 PM, Vinod Koul wrote:
> On 02-06-26, 14:40, Kathiravan Thirumoorthy wrote:
>> Qualcomm's IPQ9650 SoC has 3 Gen3 dual lane and 2 Gen3 single lane
>> controllers with the QMP PHYs. Unlike the PHYs in the other IPQ SoC,
>> refgen supply is needed to bringup the PHYs. Both single and dual lane
>> shares the same HW init sequence. So reuse the tables.
>>
>> Document the compatible along with refgen supply and add the phy driver
>> support for it.
> Please rebase this on phy-next tomorrow. It does not apply for me due to
> changes applied ealier today

There is a discussion open about the supplies[1]. Once that is 
clarified, let me re spin. So we can take up this series for v7.3 once 
that discussion is closed.

[1] 
https://lore.kernel.org/linux-arm-msm/aiqYtowP2DQt7Jw0@vaman/T/#m37a571fac0c77fd00f6379ad9a2414b60431820b

>
