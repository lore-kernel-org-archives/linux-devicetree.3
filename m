Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FDF2EC54C
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 08:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783326360; cv=none; b=lvKlPBJKbhBQ2HJ9uTBI9pkIcNaV+nLAkthQcQcxQVQ04gqz3o3j3pBEXbMp9X8SDcTq2MGGOCQUdaOZbWwAov77g0rlX/uGjncBFeSDfIrG9PlFIt/k3G6Vn6kSDGDorRq/UmxnwwmlAOXCJj4gWbLD4CmV5UL+bs0IZ/6qZJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783326360; c=relaxed/simple;
	bh=4k/0USkPSRP2sC81fYVoyZkUY5+RydOrcxw9BWeJKnA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fMv1UzRKSEGDgrkvh4TTKGVfJDBdYLLtyiJYyQE0yJAdIjCqXC/aqaY3+QJk2+pAwLgGlAJStp1LQR3TKXF2kmy/gfnRf9ZXmYWXnrMbX9qe9hoQRvIWV9QiWyQSjEs8csh80Agn0YFQhfjfwQnQRpVIuxX7eu2+XhrX93dRWgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fWG7iKRg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a6rDcU6E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fWG7iKRg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a6rDcU6E"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641Toj3623848
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 08:25:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cAjXdDGsyWcWm9Rj/x0IO4gwVFOjTa22Uaecq9GESbE=; b=fWG7iKRgB16XFm/N
	b5KkaDzOmKGbedsiIl6Ou8Isb58ardhAEElQ52j+aGL98bFLmYgJ4yeztBSAsw5k
	4CoXmHp4yt1KhjqQPLjRtds3uJ0uooPl4+7iC96BGoUu9/lpVNC20B3ltnB3PnhW
	gqLSTF+e/tG6TWz2ALCDFAL4hZuP+llpC10YaxyMdq1gn/nrvc36xwy9G86sV7+v
	GULaiHBehiCk+JqIv7w2HUyqYGtUxPmn+Ydet2aJEhTqayQ/nkCmqyGOj5OtpmdY
	ONm3uLOpk75oaAqdrAQFkq5x5UVt9y4pe3Ms83Y7cNw0wHXu7KoqNUqu4ziBv2xS
	A+JcDg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s4swde9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:25:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e6cb57d25so86823485a.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 01:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783326348; x=1783931148; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cAjXdDGsyWcWm9Rj/x0IO4gwVFOjTa22Uaecq9GESbE=;
        b=a6rDcU6EbSuT9qnnfUBKn0DwhrTwIYvI8BPLQBXJ/dYKl2tlbv3XyIS46xxIjxy4cm
         p4SrXih8MDjx17IweI12nnVURvq5AiV+nwqTK9M7HS6nlbtvTQSemrQllI8ukTx8Navn
         ViLnTV23orf1W0KmDibHjCxZiOtv7l1RBbAnUWxC+k3rweb6cFZYR8CWlGQr4qH5iSPe
         ZBI1fuUrHproDOclBS0U+YMbh9J58JSjJUV8p6DSHm64JRpYL3wwuqrg9dvJueDHWq0B
         l1tPBnKDX1Lt9DXlVksVURcakxV8r03gw4fE4kD2FFB//CErAiaZt2AIlR9LD0W3RXDl
         rAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783326348; x=1783931148;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cAjXdDGsyWcWm9Rj/x0IO4gwVFOjTa22Uaecq9GESbE=;
        b=TjTTTeR51XisLhPEybJn1ds9aEdUE/oNgA3EboiWJvOZZesxbSCkyj+CPBHUwFjIng
         BORlIYFjwTEJVa52RAhiw69LBOIiC1qBGUHf823H2IoyQkK1f8h3y4l7Lr+a0bKAtWB5
         v/9B2/l44yJAgBVNufs7PS5ji5cXNIppyz7+uXVTadn2EgukSF8GCR5zDjWNRYuZlSBY
         K+q8ls/wVv/kvHnPIbeMbYJXlSc37u36MVUxFd68ppGSn2K5TQT2pqducbnIFrrAyofK
         4n6HUYhReVZ2yDP4Z82VidkDUbDEgUeeS4wUH5Kkuo1yM/unoJmx9F8nhHNy4nLdYfEP
         LEvw==
X-Forwarded-Encrypted: i=1; AHgh+RruCkXFqcIGAGHjYGYulxQ2Yzu1flGYLotI/1KS47+OfIGQXKqcaIElT/M4loIJ6CXypIXNSqAa83yH@vger.kernel.org
X-Gm-Message-State: AOJu0YwFEjhdJHKhyslerZreavm0WKgHDzTJ8C/VzwolpbNK1Bkgv5VN
	ZqqrAHRQGy/N8bmWYImqA2sNm5QxxSHu0wLKIoO5N6Ynxy+yGxuUDNfJdMlvESD8ItTEqsLDEnk
	/1qyhB5uOq/88QLBEY8nxcUwd7Ig+J1vXM6EBrt/pMai4hjgvfuHDQ3z3b3i/wx3e
X-Gm-Gg: AfdE7ck7fp1XzV0WP6++v+eQ5AyLn3ruLB/YTlRtdd0MOjdTwtxTo5b7ssuBh/ZJYJO
	EeF7ShjTD8CLtwVn+rggyffzbHzjBYAVjgjwZKJR2WenGf3gT6O5TDT/Of78AClwgew59L2wmiE
	INhtF6qA78AQjl6uUaZDG8F+hsMSu5KRAmVFUP22Ur1OQdykge/Q3lZrmcZpoVy/qxwTkoUn8TE
	qPBHXyvFrKNc7PzmOPbv9XV7etI86LTE8ghgXnOGjRKxxb6WsWf6B8g4i3bNl7/RWe1H22Xj65I
	lKxoYx/sEiAMGnqhnyUjmWIQZ1A3xL2RAXlhKbP/P9e2yXp17diPUwRdxj12gkzFV65TnqNP+GQ
	1GAe8WVn2GzOnHUHETqNx2aRXBmgu8Jlr2Z4=
X-Received: by 2002:a05:622a:15d1:b0:51a:8c9c:7de1 with SMTP id d75a77b69052e-51c4bf465a3mr85914081cf.11.1783326348458;
        Mon, 06 Jul 2026 01:25:48 -0700 (PDT)
X-Received: by 2002:a05:622a:15d1:b0:51a:8c9c:7de1 with SMTP id d75a77b69052e-51c4bf465a3mr85914011cf.11.1783326348127;
        Mon, 06 Jul 2026 01:25:48 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6093794sm687325066b.21.2026.07.06.01.25.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:25:47 -0700 (PDT)
Message-ID: <78a5342b-0a38-4d28-bc33-d18a24d4595b@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:25:45 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: Use tab for indentation
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260706-dts-qcom-style-checker-v1-0-16ce82a2bcfd@oss.qualcomm.com>
 <20260706-dts-qcom-style-checker-v1-2-16ce82a2bcfd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706-dts-qcom-style-checker-v1-2-16ce82a2bcfd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfXw1a3BfFPgPze
 GBAXkeV0HYyVuQQDj/CjkHi/7Tu7sZmTyVP6eowUIpBXlNkyLdJagpHL2JTB91mp8MmAh4WqFQ9
 ruOCd1x3Jw1CyZgfUb4NbQrErk+KRig=
X-Proofpoint-ORIG-GUID: wg5UScKYjLxMLHow5J-oKy3psZx9X0wq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfX4SyY+jVyZbLg
 4s3sNWQS5w2PQGPZ55k7+Ks9qXdWjAlBZ69Pc8giOYAB155nNFUfJVnPbSlbQeowobr8tSkpVGx
 Qwa7ROo//6QsqJWf0Vi0rmsbLZWK1xdPqRbnIVfjJCduj52KnunA36+gsu35M0g2E8KD55d9jXp
 vJFWLpE1C+Xh7E3iT6gT0oeYQSpHI1oHeQHkhG2A9QVrpGk1kk4nE6Q4VJmBRDZWVm2qCGDQQl5
 oOloAV8Rf9/eVwiD/kaw1ptMpJyEyeRgr0dFD6pvi5VQXOgEl7Vzrn3o6njUkAgMvHSdrTfGB98
 LCa/tAUzDEDlJ1qkPqC7zBKAXnZpEHEaB2kf1p2+utSZ8l4i4RH6/FXE7KIvJqCKXvJrz7hPi7E
 1jEDBaQ28yUuuQn2JSao5kwpikap/fh2ifLxsJTNepo56LGSPPQvaikzOOWPWs2HZbQDgUhkwkT
 d6RaOk2Ge1BwmqhLGOw==
X-Proofpoint-GUID: wg5UScKYjLxMLHow5J-oKy3psZx9X0wq
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a4b668d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=AZJ-QSGf8ivbqnDstL0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060083

On 7/6/26 9:03 AM, Krzysztof Kozlowski wrote:
> Correct mix of tabs+spaces into proper tab indented lines.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
