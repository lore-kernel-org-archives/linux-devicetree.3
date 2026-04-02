Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AAB3C455E
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 08:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775119824; cv=none; b=KgvALupa3d5HZIsfj8vUyBr7Zq2yQJRe7HcDozsI64XPuG6V4Y0XoWWF82zRoE+565BTxjWfyTWdY/95mMjR69PnRnO1tj5QGTz1ZAKxk8l46iRj9XoncRZ3JbxKjsbEPjFLSpwuMAkADOsIdQnONImI0gvdWIgvjyayxl0SOrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775119824; c=relaxed/simple;
	bh=nT3uv/bM3p4U7Cc5AFOq99C/s5Fm/zMmpDSpH9xpC8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tCk5byZ9RoLiaE8bvUyr7laMpQ5m0aBia0n+9e454BFyJRlBXdCvie+2afocyja2WW3XcIBysrmLJkhRswmNybSMPF2rPRXI3HT91fPZElGeQYnGvYBQzfnEZKbFkVZ5Dd1Mq1O2Ux62hjQNtudtM02hw+7Y+kx160MqHWhoDlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IBfuHd7Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YsYKRZCl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IBfuHd7Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YsYKRZCl"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6326w3ob1129188
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 08:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WOEmyCA6mMKdAVKcBD2Tg4Vqr0s6X3W/aysi1+SPwzE=; b=IBfuHd7Qy3ZpClMx
	Bdr2GrGoxnMnk8lHFc48N+XohkHsxAJjoWc1jIflnSGkIBtcqH7lEqpo2390r5lv
	kPrLz+yaPYTtzeXjqxc8iknh3AcikGS2GKvfSHR8NsBhUUF1wYrGcifda24VLTVU
	7Gjxlghj2O3ukgVuHfHwRItIVQZdNqI5baktLHbjuARLKLEM7Yhpu8xal/cG2Tq5
	hlS2BQDJtIBOsAS10mBe6jz8Q/vZHZvM9YujmDPsxgUsAujJXSPk9pcJ691bWD6c
	Tfl0MbafgEo+mRIpADL9ED4ZfzgnsMWYFq0k443PuoshX7LAnjcQ9KH1WGj+Q0LR
	Myl8hA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d96k9b6b3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 08:50:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d0095b0d80so16096785a.1
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 01:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775119822; x=1775724622; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WOEmyCA6mMKdAVKcBD2Tg4Vqr0s6X3W/aysi1+SPwzE=;
        b=YsYKRZClHgfZ447zqIf1M5NXVNtq8qKY7YvRUYd7aJk7v8wNupolAUEW6dYhuoy6a3
         Y284uGUWZs8TCQZ4K62hCzdMm386T3ZwnuiQOFtgASW34zv5UoV/C/ba2NqQLaIugHMH
         hscFvkWxX/YyW126ahoRiEsFKgdmdINUORjO8clrPS8fDucfHSZRdfcLUbvf1qwbHk9/
         ywEXGAfmVD+QPGvgngsZTx6TcB2xTIm5/AI95ZvFnPUsSA1mWuISV8dBw+A+0BGsm6em
         /qUzoTjcFaTgvQmwJRvrGzuY//wn1dx8l0fPujPyhy+SZ9PrO4rZkewdjnwObpCS8WLE
         6jOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775119822; x=1775724622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WOEmyCA6mMKdAVKcBD2Tg4Vqr0s6X3W/aysi1+SPwzE=;
        b=fJfJ9UHd1njuEFfP7S8ahk6TgyNLZ2yb1bqS0eav63RmNp+ld1ji8Yu7fF5OBJG6Du
         mtQu27SztKH83KYka+sDPdgfXrQWcgLOh6aKhqLzjQjPQvsMkNnbpqo8yYzbjo+nuqyY
         vhK90FhneUI1bFvVMI7/qr3+wwd95FSsbh2E5Lrb2qwP5Th2Yh7pM5zH6qKQdBL3g7L1
         fOT9LleQkAlNBpBaCzVMopn2EksUaYrTHkj6F5PjEvkrx0sjZSPM4038usQEoXZ4GUKS
         ZRl5RXnpwELHtzrgfhU8TgYJPMcZSkeNpaPBwENbAsu6D/ydwWc7v5p5QqVIVbxtniyg
         4r3A==
X-Forwarded-Encrypted: i=1; AJvYcCVlhmi9CiJhzhjhN8GWe1mDtsx4bmEZJLZUrrxHLZUwL6TCWhq97CMBiEtGnPHXJjLx3cS4Fvow4JhR@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1c6VCPhm2XvPZ4KTjlYt6WKy9jGCor0RLTtoDDaIKoodwFZTb
	m6CNsCpR3MFAtESu7hcG6JCAhmRIC2pwJe9GSqJBtFHLd6nWorPlsKz9nb6UI5fmLG3rD/h+Lax
	oTFMo+Rc3oi3TEAWH+2kYcc/amsZXiQOTsNd9QNB+FRyywflD9E2VGEtIeV6pRNXC
X-Gm-Gg: ATEYQzzY/FUHJNBRIWV2GTqrVB7FLqy3Z2z4U1UDPnDvx0Q+rMY9egZcRnVSsew0bng
	xAJYvtILZ52qy6pkVjq65v7ecXC6NjUg403w/N3zkiwdLddAZ1EfH3XDkGV/IeI0c4lBYQaOluf
	A1r/WoYD1DNGGFs8pebWnNDRgfc2fTPkpokTmS2DUzmsVRCWMqI+Osy1Rdq1mg8i6N9S65AA6u9
	/QpNtQ/CQSeydIXLSnI1hMu5Q3alXOeBKKdCtHM3atgux0eGJL06Qh/cUTdyIVWRHe7b+kGxaLv
	qeJX/I8crPd0K3gLv5AUgQfWO9jv+X9ieErmGJKO8eQHAezXp1zZ3KiRFaaylBK0EyQ5jtY2DH4
	tORH/jorMnn9EOKyQ12Uwk7pqeVSrhV/TKc7CXY4l4ORdbUwsOj9Qgv99bb3kX25of99GYOR3QY
	dsmMU=
X-Received: by 2002:a05:620a:1721:b0:8cf:dbad:263 with SMTP id af79cd13be357-8d1b5c43b3amr732119185a.7.1775119822036;
        Thu, 02 Apr 2026 01:50:22 -0700 (PDT)
X-Received: by 2002:a05:620a:1721:b0:8cf:dbad:263 with SMTP id af79cd13be357-8d1b5c43b3amr732117885a.7.1775119821615;
        Thu, 02 Apr 2026 01:50:21 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e02d44fd4sm526816a12.8.2026.04.02.01.50.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 01:50:20 -0700 (PDT)
Message-ID: <734db4f3-3db8-48b4-b630-5efd0069a2cc@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 10:50:18 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: sdm845-xiaomi-beryllium:
 Introduce framebuffer
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Sam Day <me@samcday.com>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Petr Hodina <petr.hodina@protonmail.com>
References: <20260402-beryllium-fb-v4-0-46170004da28@ixit.cz>
 <20260402-beryllium-fb-v4-1-46170004da28@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260402-beryllium-fb-v4-1-46170004da28@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=doLWylg4 c=1 sm=1 tr=0 ts=69ce2dce cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8 a=6HfXokFIjMK-uoYlQTEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: AsSAfpbnspn717JzHG37GD_z6T0WNf54
X-Proofpoint-GUID: AsSAfpbnspn717JzHG37GD_z6T0WNf54
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3OCBTYWx0ZWRfXyreSzq6Q2xZD
 9XTM/95jHN8kv69bOVi6ookH4Sf3r1eajiDQDAlk2uEUf+O5ZHXURTym8RSj+wwAEg90lAiruae
 0t2xfSjcdt48CgUK4x3pE1FHjd6K5QxYk9zaGnksTyc3YSZJzS91RhJfQ17zHuD1zOFd6c9htCZ
 XQXNjpWnTuEVqZzhjMr/33RwU/svdvTpDOjPh/Houbd4cBa2ti/mc6wrRg+h4o/PwiLrDG6+5RL
 SLPkopEtsa1UY82bbJXUfv0G2Uu82UhAA4EM2p9nGgPx3VHZ3gNHJPSpaoKf5625Vp232dgZ/Lv
 TohKJf/6TbbiXszr6ecEyw9yM0Q5rpYsd17uCNxhYp3+CTx/YFujlKjtuXASYV1ozd/BqyhlBYo
 QSVG2WN5Rviu5FGyH8RrZU0WW3SETZVr1zEVUxpmHv4v2fShzUlr359CBtJgpmjh5haYZeUQhab
 HxJubhCdG1OBPoCJqlQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020078

On 4/2/26 12:39 AM, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Add framebuffer for early console and u-boot support.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

