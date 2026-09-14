Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EE444C4FF
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388895; cv=none; b=MSDju3pDMnHZdNwUvUOMMKWPpnbkTmIv+npbyj2pgJAyWWmcmlbZ3cGrZa81eJSElKlBeP+cCh10D5DmBJg8PoM2ZBKczoyWkDppRWGaNIn5egIbf53GGnu4UywKWuOeYR/+g9WLR9oenZ71RnWENQlqGLenk+0ps36jqlOFJ30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388895; c=relaxed/simple;
	bh=VpuCNzuMJrwEAHkSgZh2kSxsKdhfDFxxd0rHj0H+4tc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iz9oywOzd2ce9j6y4e+UaDEZ33y9Ym9XElf+G72CPCgHvSBRh7HO4g/PxsyoPjrBwHHLkSNPj/Ca6rpVXkvIc2YDilPbobDI3Ht7LevEbCqDBwxT8LfbapC9qSEi94H/GNFZv1dhZec9xnotC2tjB8/tZCNBoF4rmuT0rtZvPQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V3+NdD3y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jn3+hjUd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V3+NdD3y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jn3+hjUd"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmNX24032584
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:28:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CVpCVqznGYdz5Kv7onwGPeux53rZACcfYzZGz0sTBpE=; b=V3+NdD3yWu5yOc78
	hCJf7MuzAMU+xjqGvaDB/5FB9PUqPZC7bZ3MeTNRjJVbpFWdLPVxVpI2l+JWUg8f
	bHGc//vhzP3W6WJruUhjdoy80HBl4KXBBQiLF+oSbUjtV+CRWmhomBDGCc8tDgE1
	AGbhBQMWY5uweODDA5DFyl+CYEvX0ygPIk7dJzLF3xugLiLSYf5MtuMXpscky5+e
	WGqsVwwt7EektvHZgVLjrTNkujQJdIS7SS8BuYKv9oS4R1iNzhyoEcNVKyDG5atD
	c43d3aSNuZi1diVLJxGh0uYXFz/iRRjEwA6j+P23hOs2jyvL1Ma8gP170kXgtz4F
	c5V2gg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuq8hc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:28:13 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90e921f84a2so7018486d6.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388892; x=1789993692; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CVpCVqznGYdz5Kv7onwGPeux53rZACcfYzZGz0sTBpE=;
        b=Jn3+hjUdrVELi1zJ+OSRh5hmnLzEqQaGmuWyv1HClH1rL3qZK9GGdM/zGLB7squJTn
         GbsTPpmeMqbuF90gd78loZe6DNirOnAnj2BSq5+5AbxFFDiALK6voLqS1IBwXdrj4f+C
         8o7baVh97dWE1cejbTr6t2yICTwOaXXQZFS6q9xkbM7mgrY7qTRxTt0I/1CJwq4mBOGs
         kBI0g1SNS1526mW/Wyc2pmw5CBlxYthuksrWmYd6u5zE0VrMzvOpblm1mOS7EjM1/vAi
         eqQrtYSGHtO1X6TRwtJTL38Yh1ktdEkVC26+Qr+N4yuxsnWrSv819OGL9zkADY3dS9w3
         4wwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388892; x=1789993692;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CVpCVqznGYdz5Kv7onwGPeux53rZACcfYzZGz0sTBpE=;
        b=mTpGZeUN4bNoPG2GsyEUfueQHJxI4T3EfEaI87tl+BoISRZ0XWOo2Gn3hyhRMuQwAw
         rDaddgBd60K41nRUwd15bOW8I8hlpdOqaNuxwCBZypcTrxQPGH1WnOfKor9jNp3YM3XP
         JTtcrxT2uTay2XbZd/rek9SAeIEy4uk4SVUqRkEtYXllg7TqIBoy55UrOg4WrOF+NhDX
         cBxbbrCXF315vT9t2iAkicTOYGkwhcMEiX2vrZcCSwBswyCERTgOnW44eFnZa3Juzpmm
         XOD+6WA7godOmy5+TT8SImbt6vZkidX4+Fc02p2MnCxDe4bumakXZXCgMRMLLFNAIGHd
         kR6g==
X-Forwarded-Encrypted: i=1; AKwUvBxbFX1QY24Z7AbPgGXL1XKvWjluMPyOZrlnt2KdUJbCT809kNOHvVKFHLMQ6GFCLEniAn97aIGYSV2X@vger.kernel.org
X-Gm-Message-State: AFuF++nj+YTS8Km+MXJaJm17bVEtu8oY2E+FHXS7HCwB3oewjdGEXKkF
	h5j4qsW03O+WbJ3ykZM1NqJLfZKdAYXS9IsTAR5azPxTlHXpP8Ms9REHq3QdN66dLciow0WrHCE
	4YE23/4YXbaGTXlTVig1DIMEmGY6YpThitGTBo2gqYJ6zAqJDvY1rjNlVv+ZCggGS
X-Gm-Gg: AYBFou2oEEebfW6KW7AbP/Ad4JE7TKr6IfnKqcXXxYOCL7HV3ys3/AzPYl1W0jXSQ+Z
	/u0KLYxcX3bFWZg35z03W7yEmHHtlw7fKl5qJlrYBH9682JdAYdYUHF6aj/2jU9NJiamrCO20yb
	kqfY2nh9/ftslZV9WFWW8A5pmxCc0umLD3x87sU2w0myJt/j6cWmBJNcPe4T8IvaJA3vATtryAc
	NJYLT8qW9ufYUHI/m2EjF39IW0Qjx66UjG8jTb25y0L4PJ08cyEBsV5XKVdMi2soxGiXHNBaoOC
	NuKgiuc0fx0RqCAmlzdCYy/dQf3fWF6nrYjugUNwrbTBMEZNxO927wA6RTf3qSRdDMbunKfC7+t
	WDLBxTVLRckhEdFVQlVK9rw==
X-Received: by 2002:a05:6102:50ab:b0:799:e864:aaba with SMTP id ada2fe7eead31-79b58b76fc7mr373743137.1.1789388536188;
        Mon, 14 Sep 2026 05:22:16 -0700 (PDT)
X-Received: by 2002:a05:6102:50ab:b0:799:e864:aaba with SMTP id ada2fe7eead31-79b58b76fc7mr373738137.1.1789388535775;
        Mon, 14 Sep 2026 05:22:15 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0471b6esm2391714e87.59.2026.09.14.05.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:22:14 -0700 (PDT)
Message-ID: <1f44c90b-a8a9-4d9c-9b98-3412b9086b3f@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:22:13 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/31] arm64: dts: qcom: hamoa: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-4-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-4-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfXwdRGrOQOYDND
 /7woVc4yqQL2xYrZ2OIWOM6w2iGyUZ3We0FA3QV55d1PD+eA18U5dazckIYHp2jaAe52mj2bTuS
 8/q1Ozk0xF+MCU6fBTFLzkFz/OuqShYP8jGGChVMNthqEzKrwrwRbNWLorob8QjB47n1yXO5JS4
 l1fA/9Bg/5bk94bGmPjOZ1ufPIWzxSdN0FfvynPzv0zvnDMmURk9o0X8vGxHfz4tosHkfiqwjke
 qZADkFqsRmnTkndz4kpgaS1BZFms/A78fS0/OGPGBNT+GaydTZSZtzIMdnxTgZ9t0h5rdxEsQHm
 ZAK7UG4EeYKulMILesHg+3NW2b2D7TCTBOlEAdT+6RIWo21+0+HPydABk8DgFiDd74b588Tzj2s
 aQssJ6Fb2ZfPwCaUSFQkFyLYS0huMM+wUdJ27QBUKnou/ATgAmWS2Q/7LmERVA7tha42Fot25og
 fhojqp+obA1B7q48OkA==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa7e85d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Dm1D3uWegqzzbaKFt_AA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: hIuaD0NsOJrTsWrFq4YxFWueF3EdTYsx
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfXy3bu19Tl8V5t
 8+leGzGrcGdScWccG2x/bPPlFfIiN15N6um2Xd3JwenoG4upcSRsYwlyTLIoceWf+3bBcUikalC
 Qx8cMXati/+BRYrIAC2p28HldC5QxRA=
X-Proofpoint-GUID: hIuaD0NsOJrTsWrFq4YxFWueF3EdTYsx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140177

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
