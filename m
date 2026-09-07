Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED26468C3D
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 13:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788788363; cv=none; b=mwWGd5cEO2PxdMahsI5mTqFG4VdLJXwS1ntfqhivEJw7L/nzQX/myk6m3nyRJ/rCR6t3eNTA21LD6b6+hhvDMOVBfxAHJ6yd0kUPtTdP8Y0e4camtfoUJ7Zvnmz9WHDnSlXpQ2dZpp0zDNia3lw3AZ3yPgJhj0L9hZyMND8WvaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788788363; c=relaxed/simple;
	bh=LuoUpMNshQ5t5idHuLjWLOPZmBgbq2ucZ5M7HsXdSsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mq0u507sbtpkmR/TlLzKad/3UvaQRXaPn2Ii436H56R+vWH4d7end59Oegr6kZkM+eujqEU2xR9STgn2i/+bRFiAwoUqdm//1LYDE2aQXynpjoaVn9Zh10agtK/FamIpHTtDKE9HT2ZmAkc0WwbMC3SH4DNAuDRQCUhi7+6B1gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DcMxJJhQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jUqHCYk7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DcMxJJhQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jUqHCYk7"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687DdKLw041165
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 13:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Imd8sMtl7PDNNp8Q9khBRYLBDX+X8v274yOTSj2qwzc=; b=DcMxJJhQghvdxWJi
	Tk+FWZE67WMGXYylw5stS+Yt6WvgpXD1v9e/5yP0Q3GEDupUy3TjWkK86Y6gJR7u
	XYgkEkT63u/sqmHyp0ju/wzf0x1qx+DOv6La8QzlyOfRiSYc2N+j6kcgyOl1jgFT
	vHAkGJnSEviXjPWfSum+PBHah2REvWgKr5eSWrAR5YyOrLJjSycmjeaJdS6DLADY
	QgfdOskRmAIw4DSAcYJhN/WeEjZ41otAoUwVyWBVBUvonzITcziEjG+qVi9NntBx
	1htNsmCZGyHKClaEg3IAW0M4w53HrEDGeHtYxb3cTiIbN47636msAM/at6koH+Uk
	BWnl7Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghq66j23x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 13:39:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-399311947f6so6096965a91.0
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 06:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788788359; x=1789393159; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Imd8sMtl7PDNNp8Q9khBRYLBDX+X8v274yOTSj2qwzc=;
        b=jUqHCYk7LB58iIfT0ZBT1j8rofwQA9K+zgN21+2uJZ0UdqZ/kRsyVg8PL6/XNqL/hp
         XlrvB08FGrP6sptVfnKhYALTTljJe1QHAeaZWcokKOrQ+c9JJyyBY3vzq+uPboTAJwIJ
         kMnjUDqbal+fzp6dPfqPB3/tIrYgp9RlyqY9Wwn/5kWYU8c6F/zUvtzAKGIgmWEtIkF4
         lMZZT0LyjDGu+tu4RCBN1x+ufRGqnUjnOkjLQPtzHQWp3hZ3lfPfBykMXcXBeB/6i1mX
         Isho7+lgwM7F3yePOnRxHi0iE8DgiEEAXFea7oWTkDKQ5oEKmFgYq2yPOylEiZi4wiXF
         65jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788359; x=1789393159;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Imd8sMtl7PDNNp8Q9khBRYLBDX+X8v274yOTSj2qwzc=;
        b=gy4oOsCnEKeQOx6Jydg+MkeHQnWDspO/dUj2YcqSUN9drUh1QZ2creegqN8Syv7cLR
         pVRj/916rdWiU5a1pe0vt1Tm1jUtpjY5EzMFCccPdSw1OjZRc3UwvfaR6rCMNVlq26aD
         S2YXSKP+wzGYjaSRT8d9wUqd5nRRRYjefzkP9y4oNXpHY8nMbSPqyUw7PfU0aIHobUUq
         WtjkEx1cNnSvVN63wkS7X240BODWILzRQSxhO2pWupzK1dcPl8NfBCVNe2G4PVvwgDVe
         2ZtHiin8jPHVqEHUHkUTiw2zPS9y0wAneUSTted0x9A5FiBmeJHzIQgHIR+qZIQc0KhW
         ZlVw==
X-Forwarded-Encrypted: i=1; AKwUvBwas5i6Fk0Yy7Cchn+OW40gDiI9oCrvL1nRVnN62UUfs04Mf2wf6xuzrE1HrPIJh1yc7Kja0N2whp8a@vger.kernel.org
X-Gm-Message-State: AFuF++llIW+TTZADFi46OgJuW1hNGZlpYDwdzn0BSANLEjB+g0ZlsjAX
	gF5BDq/POoD7x6jRArbuUQWhUvM9CpZUkOZhdIXI8Vmogv0ysVc6JowNV6z0QY440jZ/MgAVy4A
	jk3psiW5aawcSqcd8ijXyQkApl+3GUAYz+or1JS0S7O683OmeNvtgcD5MKAvpa0PC
X-Gm-Gg: AYBFou2h2707gwpQKLD5160J8gU30u7FlhzeFlfmhw5S5wzSaNRWlDzuIAi/CSinP9N
	NZrl22CUWTbfZ0ixVjtmY1mMrbFeQ9WnhgX/Xc1aDf3OONJH9eHGbPBNm9m+8t9TdbiUs/d5ueI
	e+VayPqT/6zzy714O5nzi0JRUviWrCh0qtM/VDJNN7sCRMKBA0suIJy07JCNl5X6YHqCPr3K2nq
	gz35qnBOVEbGS13s0i+0HkrohEHCJPKU5zO1fX91aHcWe9B2vtKM77TufiUkDctsvxvmOvrMKa2
	RNnj/1AjEoJRhF0IKvJdTjVrRmBnB9aUCJf4BW47wyUI78H5bjeU0w2r6fbNJEp50yIUduB2Xs1
	Zkmy+uv3JgbUmHl8AYHeLIe9xi4HYD/4=
X-Received: by 2002:a17:90b:5790:b0:398:9bd5:4910 with SMTP id 98e67ed59e1d1-39b2624f0ffmr33905926a91.23.1788788359427;
        Mon, 07 Sep 2026 06:39:19 -0700 (PDT)
X-Received: by 2002:a17:90b:5790:b0:398:9bd5:4910 with SMTP id 98e67ed59e1d1-39b2624f0ffmr33905857a91.23.1788788358993;
        Mon, 07 Sep 2026 06:39:18 -0700 (PDT)
Received: from [192.168.1.12] ([223.230.61.94])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm32726196c88.5.2026.09.07.06.39.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 06:39:18 -0700 (PDT)
Message-ID: <841a008a-1ce6-40f9-95ad-09b4abc7456a@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 19:09:10 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: shikra: Correct QCE node
 configuration
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260907-b4-shikra_crypto_changse-v6-0-0676f61894b3@oss.qualcomm.com>
 <20260907-b4-shikra_crypto_changse-v6-2-0676f61894b3@oss.qualcomm.com>
 <iow4xf2uflvjduax55tkbhaw2r4436uqvys22u6pbm3ry2gryw@g777gu46cgin>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <iow4xf2uflvjduax55tkbhaw2r4436uqvys22u6pbm3ry2gryw@g777gu46cgin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QPhYgALL c=1 sm=1 tr=0 ts=6a9ebe88 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=YDt4qybLIboWMMC/SFNjLA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=9GsNmjbEMOpVDnpVqTcA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: wbCIM_e0m3lEZmjp7t9Xg9fTFQ4rrcF1
X-Proofpoint-ORIG-GUID: wbCIM_e0m3lEZmjp7t9Xg9fTFQ4rrcF1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE1MSBTYWx0ZWRfX6FvyE8gcpxas
 8k0n23BAdw9oMs/n+2EaGjixRChA1WVmCufKVwMaT51lLYt3lsiahXHzg8F2US5KVq8Cozn+Auv
 wRp3dWI5D5/UOV+7ZetklYAiFg+YPH4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE1MSBTYWx0ZWRfXzrC3+KOhGQTF
 MOaPnRJ/mxSbDycsjtdhybFeTFZN0+tFjhq9cwNa3t25Yx78Nlb4QWLek2/KaeKp7iOjvJTAcuL
 FFaP6Z2rpgmmiNXfpIiP6JaFjZUld+oiLBm4SyHXiNIpWVNNO3Ew1EMjzjp2bpTKUYvUPRXMlXq
 49ScEApViFXVchsDLXPaxt/1yPWUu/jztd2oLmVPPXNqql2fp5GUVRNWSpuHTOJwsxUB24Vd7iU
 kydeDXiaSnXqcmo/0QXU0WewUHLpLuZeoN8uPcrp/Lnwqn7LgAE93Fia6goIyHzIVemtRFNk/NH
 D6Q4hcySnfc/u25qEebGjBXJyf/Y9OkwQ/MADEfINrzimHCYOQN6pckcgU+mbUi/jHULt9cAXbu
 BZs64FimCc2BykGIJNG9BkiAL8wfKwLJMSBq0E4m7DiBSEvlHta1PzHh81Q3Sa2wiU/9cjoLLsW
 s9coqEhjXx0zXj0TpZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_04,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070151

On 07-09-2026 19:01, Abel Vesa wrote:
> On 26-09-07 17:33:37, Kuldeep Singh wrote:
>> Shikra is derived from Agatti and uses the same QCE integration.
>> Update the QCE node to match the underlying hardware implementation by
>> adjusting the fallback compatible and related properties, including
>> clocks and clock-names.
>>
>> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> 
> No fixes tag ?

I was having confusion so didn't add it.

The parent change is in linux-next branch and not in torvalds tree
currently.
Shall i update Fixes tag based on linux-next commit only? or not needed
at all?

-- 
Regards
Kuldeep

