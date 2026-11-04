Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778433;
	b=Fo4xVKbZsAnXjy6Mr4jo0PwlrL9y0qMr9aZ71bGmq+KTEW9A83dAsXIGUxNBsxnj1XeM
	 ZtWjrQ75veZ2SqmX8yQ17z+BNI2jqOL3xMHz5a1dGm+voXfReAx08t2RrD7oAyO97Zdxk
	 AxMU3/leCHHgB2kVhrANhYis4qL3Ld3rxJ/Fvj8yRyhmYfE9Ky7gS1TMtPvM5w21742cy
	 nodp1l1fDsGE1Qe/vSrkbuWOd5kW5bJ6LXbeLC6dfElDQlgX9rzMC7hlmPHtfp0BqESSE
	 Hn7HPvDg7kQfzS44iTFVRfZE98AXCJ8saiCgsNJO6VruCdPT//5qStfqVTbQzVTwvoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778433;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jjgf4WFy8rP1HtZjj1ordHEDu4/2wlD5ZvDyvty3vOY=;
	b=Asjce8QXBnJzWCPj14qfOe5snYMKHC3ZIpAJCphD3u4ZUVhiTGpqqMxQQUghQNbv9MVf
	 D2p17o0A9Xhd1xoRms1YozwXxBK9wI8WivWnmd7v4zn7GveIe/3GOizATwCoX2pHaSxmn
	 D5z6JeAFdKjEgz1FbhzoDXsitmOpsClEVuxETypDOqpvNfd+jN61x4fhOh3nEupxuk7K5
	 htWhcU1GP1PUnqsUnr5mr4RT1zlLWJ6z6bri0Lk7a07jVpGHNjfnzcpyBHTgJFIhQQjax
	 asixxF1VoCOw0H2MDS2HVnJWdz//6r1oMLlccUrTgz4QTo3o0QIlxDa8t5AvVIqZdJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Uy/6dFI9";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hCFA7ELR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C13606A326
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 07:47:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6C13606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Uy/6dFI9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hCFA7ELR
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A46wuXi838256
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 07:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jjgf4WFy8rP1HtZjj1ordHEDu4/2wlD5ZvDyvty3vOY=; b=Uy/6dFI9WcQ8Z+sF
	IejwJHo80qwig8uyqB08dM3hJ2CGKpzyZVGSA5W9E/sVhM3roMhN0r4ehq9i83ms
	TKbuBnKpdGzxIyM3gRr3Qhcj12RnuLr0yB+yro9T5iUqqUiwQ8sklAf1CkOP8IEc
	0uQSyiDPCdUGfGOGmqU74/ACVcBX6mpgAmZ3mNyRP9fbDSRG8o/Ai7SyIHARmxJ5
	Mb5RoiQDIwP2pm+u6OBtlvuEcuU7y0OTW6s4iQDWTL8bK6z5bslNF6UP6vLnuQOS
	PTp4mPGgLMymttHlASzgSxGiMtGuOy1Ltn9Vl6B87UGGFcwTAwfaI2DbwfFiUJk8
	Q6szjA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8mtpn9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 07:47:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-530cd3dff25so358081cf.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 23:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793778431; x=1794383231; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jjgf4WFy8rP1HtZjj1ordHEDu4/2wlD5ZvDyvty3vOY=;
        b=hCFA7ELRaSROmFukNQ5iyoTTpEdB9KJnK7dRRvvilkuM2dauddWXzVuiJfAhZrcLFo
         s4Bqik3MxZMfaCDjXMhG+VG30E1ruVAosBT+7xqlwtvZ31RSjpnYnQD5P0nQjoAu/Eta
         lXXQZf2wMp36etIrKZ51AlyW/4FpPW3pasgKbFmY8cOBFvTV7v5QTezwpln+X6Jgn5oI
         LbgneaN9zh7TovslTR8lbN/483F3YNo3L4dCVLsYAvplNqHjHiFDSw0OR6cCq1GpwJmW
         cbmLF6GJQNEknvNLxEb+Z0k+0mdLu9vIRtN58X82kWciGu2YMkTSlq1de6MQe5OjfUsf
         XZ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793778431; x=1794383231;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jjgf4WFy8rP1HtZjj1ordHEDu4/2wlD5ZvDyvty3vOY=;
        b=Afjply8GqCrPuAS3ugHpHqMkMOjy0dK3S7gTOoV8Daqg233UlnzjyC2K0hdQtmI03h
         vyTRV8sXiVUsVa84C+0CIU+DRO5Tmjha0SPhjafYhX9uYb5f0vpvWgRKr3VIp0OybOls
         JxS9vYujil8UtqnFtXp0YvBjyS/NtKazKfUdV0y3WCCmVjND4WKj618y/aMQhOlopqe4
         ZSa2sfSjxS9g6bRQ7tN/OdAAXyj3uemmVPkpKjTELfj8B4oAAua1ikjWwN62xjYP/K5g
         +wCi9iq+A6pI4IjLFc99sNW2HEh/QwBWdHnIU3UxSHS+kNqCFmHk5bw89yXvPPf10lpo
         5pfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVPeODuPiEfBsv5n6nRBh0Ob4Am1g98cQtPNscFITfcMbVadvsREKmxg1MyFFkPY453dEd28fKzXhK@vger.kernel.org
X-Gm-Message-State: APuU4Z+K0oD7KqrES6LupmKZQGTYY/rqUHgZDW3M+++PHDSyoda8BAno
	MBiJmlIcdmNqTdOlUJvHHJ8pgNAjZO2toNmyGf/GMON3WyfCckDzCfPth6TMzKHnw5rUcez2kVj
	R35Dp4lL06MsVxYt39YL1tYocNT4aPRQSxxmLcZYuzLFF8RYzKMJFdSt0zTr0Q5RD
X-Gm-Gg: AYBFou16Yvh5Enn34QkS0GCShjU4QjzMK9kCpU5eEQfx1HbqRp+Y/piQ1lcc5tahCmV
	fUFk00hG6lSvB/QzU/P5qyJYKMWtYPY5zd68d45/+sKMVLLZlvXdw4Eqfe0me/12TACXNU3PIjD
	xRAOgV/lsY43LWv4tyCW9wbZKUDjVSXS35D1lbMFq90OROVJmnpZ1DIVQF/rWOVYJLv9+8nriDA
	zJTn2Jy4WTOa5bqNUiPmnVLkejS3FoEyliG1kPNSJdtirdBl6ARxZdqQ0Q6a7UnYxvHyTBRZGze
	JR932urVKLXlAVg+Nq/2CrzYT0pB2w+FjRtXeXLro22J6xAB0IoB8Ba8PLidrXZJbe4suZs9A6F
	2lW3X3x7iKIjREjN64ydqIuqzNyYcOZnySij6vcyWfVJ21LELEQRJGLmn9D7YhKXQaQnZ
X-Received: by 2002:a05:6214:8506:20b0:91c:c923:8a15 with SMTP id 6a1803df08f44-91cc9238ca5mr117022826d6.3.1793778430733;
        Tue, 03 Nov 2026 23:47:10 -0800 (PST)
X-Received: by 2002:a05:6214:8506:20b0:91c:c923:8a15 with SMTP id 6a1803df08f44-91cc9238ca5mr117022696d6.3.1793778430295;
        Tue, 03 Nov 2026 23:47:10 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e41e0fasm43893066b.19.2026.11.03.23.47.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 23:47:09 -0800 (PST)
Message-ID: <f8fc49f6-762a-449f-85b7-7d6ade076f20@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 08:47:06 +0100
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
Subject: Re: [PATCH v2 0/6] Add CCI and CAMSS support for Glymur
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Christian Cortner <ccortner@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
References: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
 <179346368177.44447.12360580299773199469.x2e-share-camss-dt@gmail.com>
 <a30d7d12-9cbf-4920-b4dd-d9791149b6c9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a30d7d12-9cbf-4920-b4dd-d9791149b6c9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ICWIQMe7TV9kdxoJIrHi5P86eGr53Wbo
X-Proofpoint-ORIG-GUID: ICWIQMe7TV9kdxoJIrHi5P86eGr53Wbo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzMCBTYWx0ZWRfXx+RkSpahUiv4
 1QByu+UeQgdWrXNHNitVsyTQY3XCgWE+zA1J/AryJgGbP7h1BMtZtRsMBHN7s4g+Krr42rfZhei
 IhI6ZgxarxJbTjxP8p2zhKroAiLJJLhLZNu4qIoxsN5KNPwDj+v3wtvcQAWIKOXDyrOGyMMsxzn
 s23vi5jL7hlOTTKRg8knxpCUCpiTXM8Anvbd7Ts4xtu7BW4kIdSTIrtwQ33VGbmxZKPgEbCHpMM
 Xg61IlPI5RQaP+fGMgBOwLsb2E994V373LTnNk5iALaVA1PuCgRMFjEvA5j9e9AaBrWQsWZXvsN
 cnbWJ/7x8w3p5E1coDnvGd0hxIoyp0fRuqQTYdIhdEK5RtaBNNN+XI86QExUQrfVNTF/ziU+mCx
 l6e3goPDfm7IMYK2Xy8UhFMqu+UHbKP4GEdqrRKOtfj4W8t8sIAw7VFY9Qr88yyJJ2IYXJWyZah
 Nh4rRY9JGcSYL5VOFkA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzMCBTYWx0ZWRfXwUJaG3i1vs8Z
 wGHUV5emw296rx23J4mcMMHtigUGOc9H9g7Kqt28X0/HC/DBrw4jSPjq4k0mpXY6I2rybPkHbwa
 p2+D6fUevW+4Y/QAehSqFhJotK2sXH8=
X-Authority-Analysis: v=2.4 cv=HbWB3SE8 c=1 sm=1 tr=0 ts=6aeae2ff cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=LIoDc3MRPIFTSzfBSroA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040030

On 11/3/26 7:25 PM, Nihal Kumar Gupta wrote:
> 
> 
> On 31-10-2026 21:54, Christian Cortner wrote:
>> For 1-3:
>>
>> Tested-by: Christian Cortner <ccortner@gmail.com> # Asus Zenbook A16 (UX3607OA)
>>
>> With the PM8010 I2C series v3 and an ov02c10 on CCI1 bus 1 and
>> CSIPHY4 (2 lanes), the front camera streams 1280x720 at 30 fps
>> through libcamera. The A16 node is the CRD wiring with ov02c10;
>> happy to share it.
> 
> Hi Christian,
> 
> Thanks a lot for testing this.
> 
> It would be great if you could share the A16 camera node patch. I can
> either include it in my series, or you can post it separately as a
> follow-up patch depending on this series, whichever you prefer.

I've had one in the queue for both A14 and A16 for a long time
awaiting dependencies. Let's get your patches merged as-is and
not expand scope between revisions.

Konrad
