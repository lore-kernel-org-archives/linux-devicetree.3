Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87C439EF14
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784279838; cv=none; b=kD87zoJN8UtjMjnms49isgNp1dCMLf2pSoLRrfoZ4un6r/9ezokEidNwsnPRQvGH57U4LT+lorjlFmDjn2R5/Rs4NQV/wkaX/O241mbu6iKPMjfk1fDzeoHvExMsVeH8u9cfoN9DhFvn1Q+5fvvyybQYkvj9lNi0if9OgZJ6p30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784279838; c=relaxed/simple;
	bh=jPNEl4Yoh1ZLXaB9Wd8N1Msiuq1Ol6ibvp5vgFfqNBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g2LHvU1fEL+IXs6T9UTpcSK15twSA0+tVAa1I3sP+dpKxoGBu12kOyyh2uFqt/vvBPUww1nhQ8AyUaOJOzlnSgzY7cdc7U1J3smp2q5HsBmPacLvwX6O1FZibMqx1040nBWC/1BuRIZCBwyp38jWdK4LzdHw3CBuIOW3jzP2krM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YVjg5FPl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P8irucX9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YVjg5FPl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P8irucX9"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cJfJ2098601
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HGQUpW0PKU9SI95eE/1MrXbN+xazx4ocxBKiJkm8p8Q=; b=YVjg5FPlpN8+7fh4
	+elqgQFxo8rgkaI2AvS9J1dQy68daj7sRD8EipvpMJS/uzW7th/VL+K2zf2h5ivJ
	xTuo1Y4r0mImlncssFzidamVSzpD5YNPvRCrfWOKoj7JGSdJp2mI96D7oWieaNIE
	Yn7fXtKXLDcD3g0h5ftRIlkZn9c1q9V0inrgcDLuX1Kzq6bMxZUN2UCtzhaRm/4D
	Hd98OC3oRAlc84m2wSO4tC/MR0DSgLfBa5WnM+G7aXRoizzbqgEtwuNJXMr+sY1m
	7JHIB0SyPzYx9UjfAJAfFm9PKytKlAhJqYg8yHaZpQkEwI1Q7F5OEAYFcli4f/fx
	m1k/Lw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u6k0mm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:17:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92ef7c6e9b4so125380585a.0
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 02:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784279835; x=1784884635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HGQUpW0PKU9SI95eE/1MrXbN+xazx4ocxBKiJkm8p8Q=;
        b=P8irucX9vBZFFAxDkfjVMQCb3ozu0iEH14F4t0trQ5eQAeiyFZ9SYd9dgjVdGZfobE
         JhWK4hx4XcQmoJUUxSqOFUSPy3hcQ/nM6y9PmpdXJ+X1zF13+wpgyGL0t72L5e2gnHHG
         XPGzno95WEwnZtGyOski+mbkeMXXMvG2mtZHmxInsdzbCWjGcDACrUyVnaKEQ5Bg6wCT
         0jYolJzq9VkL125f8+6xkkicEayGIY6iB13bv/O2hX87ARUNkjCD0TINnWd/rjfL2coT
         SFSssIoXOr1Tz8GN35hTSBSDn7TIMTKx/qtjGgW8V+KCv84H5/1txN2V+wAyYosNLBBb
         c/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784279835; x=1784884635;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HGQUpW0PKU9SI95eE/1MrXbN+xazx4ocxBKiJkm8p8Q=;
        b=D3eIsbhgO5J/Bod0z1RtXLK6BDx53Q+31Y6Ojd+Mpn06rPWccE6YqEj54KkmoaoBlQ
         ogFO8Emkgiw5jQsaSW3LxiSTAZeUl7kxSWUGtn0qyFZz+/MlEFhY4aT8KQSEcOndUkOY
         Juv31Mt8fkJ8LIKmnKXi/q1i1dxIwO+cWx3QsgVbxBUdypcxfUB46a6bH8KIDg8Ig6KJ
         JfQ5hHgtKQWpONuMnT/8R9ksw5SX/9IIJ8Ous61sqKjgKUgzZrK74DI5um7le9Wyn3jm
         BLoAOlkBKYggHxXigQvEV9KNkYgFDTLirZbJEf78zpmtLStmcUdHpxJSCwFm1eHAuHcL
         nGXw==
X-Forwarded-Encrypted: i=1; AHgh+RpOYP40uD6N0G1VKdUQYSptTY4apOsx7KmYQtwhc8CzdVVw5M1eedhrJ0yuYhiq9YqrZul2MdvZuAok@vger.kernel.org
X-Gm-Message-State: AOJu0YzS7VXntmtPen27oqxRvG4Mg1NkSu1eG7x2X32H9RwYyXtaMcek
	kkkUIlIi35qZ9pZRpCOvJPmL4ugPA0EkjNJnZk2jhmqJ48AXtavPH1FzTKNWIWinrYmg5T+/Zva
	IFkB++ygSOeRDBkeL6TuniUdBW1Xzz3lr1KV4aVNn/bNJCgTq5RpLXOkJOsPi37MM
X-Gm-Gg: AfdE7cnOqLr66MfjxHU6dNCNyY8DhojNg8HCLTtPoroFtPBvjqLxfcFETLiE5rMhfj0
	G+U+G1Arww+KcO2k3M/HTmue7ZVi6N6ebYvSbezoSxVQDIE0OSjtjXCS23fQDJ7j7jKxGiQu7Lo
	zMnyJlmGx4ycSPJWEodpJi0po6k8Tq4v58NLamJyT1mTlAkTUatOJrLtKXbniXxnSsBIUS6JtAc
	8lKAdbjPlqXaX6kATOZETnRTcZue0viby5ukYVWCiEw1ebFWWX+0kVdc+Xqzis462QhrhMOcYv1
	8HEneyZrfYlnht7poSICH+2quRUM66B4BFipYmfO3Fs1UC6ogGsjNue5SmyP87PReWito0UjbMq
	WQH6+6ILFa13KXn4Pk+593hZZ
X-Received: by 2002:a05:620a:a107:b0:92e:519a:7c06 with SMTP id af79cd13be357-930b433f303mr114737285a.8.1784279835232;
        Fri, 17 Jul 2026 02:17:15 -0700 (PDT)
X-Received: by 2002:a05:620a:a107:b0:92e:519a:7c06 with SMTP id af79cd13be357-930b433f303mr114735785a.8.1784279834875;
        Fri, 17 Jul 2026 02:17:14 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1734b1918asm44377666b.43.2026.07.17.02.17.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 02:17:12 -0700 (PDT)
Message-ID: <04a9d8ce-e83a-4307-8b14-4afe739b31e0@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 11:17:10 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: shikra-iqs-evk: Add LT9611UXD
 HDMI bridge support
To: mohit.dsor@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Mohit Dsor <mdsor@oss.qualcomm.com>
References: <20260717-shikra-work-v2-0-86ae8552259e@oss.qualcomm.com>
 <20260717-shikra-work-v2-1-86ae8552259e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260717-shikra-work-v2-1-86ae8552259e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA5MSBTYWx0ZWRfX7Jw94f+rYnRg
 tW6t/TOtDMTWRz1oow6XmIKDvwJFVmKnSv0T3uobBS7PDUMi5AUxxHkVKr3jMLncyNZfguFD/wa
 jvJDUFuTRLgYKrlVKyFHLttAL3fIvTf6OsN9XHByvHAIGDb2PMlBbC8DabHlntkyiIncSyx35qc
 CcyYncl2EgxSdm8uWN10/BhZTFCgaGXZ9N2X7hVUxUrXv2OxHKmy7CFWvMPtiLKpy6Nt4V2fZSR
 0u/uc90gsxrCJHGA763VGdjOSDj0JHYxI5sI28AKisQrIQme0KVGOHKy9KYd+LTFeoKHoECzgKF
 naoNE8hxYsaL/T3P519fMyarr3THgRLhvVoBDLB+H5wN2W/1dfQRcZhZGNYgvuAZndMSE+yCv/8
 OIgcojUvUWbP4IhBEqFV73chf6lqmRhAqDaxSumcNRz+vuvamIXdCUhMInK+OU98MhOlb63VqWG
 pJP4rk9iN3HPlrg6ZbA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA5MSBTYWx0ZWRfX6tP4fN4RtJ4O
 QjWoy2tseLZUCP+L42778P+Bfv0jVg/j5nQrG2UUo3CNnBjvn14P6yCK4bgS9eXuP3d0BlBfi21
 wk8qsmcaDe4ncpEPKGp2XEzVtnBCvmo=
X-Authority-Analysis: v=2.4 cv=DYMnbPtW c=1 sm=1 tr=0 ts=6a59f31c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=evxpD-9nWyVjaAOWT8gA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: yR0dRrvjzFEXhxK8CY9cXRCit_0Yi99p
X-Proofpoint-ORIG-GUID: yR0dRrvjzFEXhxK8CY9cXRCit_0Yi99p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170091

On 7/16/26 9:30 PM, mohit.dsor@oss.qualcomm.com wrote:
> From: Mohit Dsor <mdsor@oss.qualcomm.com>
> 
> Enable the Shikra MDSS display subsystem on the Qualcomm Shikra IQS
> EVK board and add the Lontium LT9611UXD DSI-to-HDMI bridge node.
> 
> The LT9611UXD is connected via I2C (bus 4, address 0x41), powered by
> a GPIO-controlled 3.3V regulator (PM8150 GPIO4) and an always-on 1.8V
> rail. Reset is on GPIO76 and interrupt on GPIO85.
> 
> The bridge receives DSI output from MDSS and drives an HDMI-A
> connector, with the link wired as: DPU -> DSI0 -> LT9611UXD -> HDMI.
> 
> Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> ---

Does the other EVK not have this same hardware?

[...]

> +&pm8150_l11 {
> +	/* DSI VDDA - must be at NOM voltage for PHY PLL lock */

This comment is superfluous

Konrad
