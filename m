Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190329;
	b=bfg0IdGA5tOs9a8tAiNQA18KytOKhoip2jZ83Ftn/r1sckj3fEBeM1/FEA8F4nI1CIyD
	 QhQ+Iam9n6oq7sDPO9coFzBK4V95Ms9ZhJvRXHDdVPdKCblyunnsItULMhZn0jqBlj2Cc
	 TeS1NernlAeZwlpZsXnvgbHP18k1x/eUmeFiYmzbMJM1Bd6e8jRgB4PKT3LNRRy8nZwkG
	 dcOMP0vvfMAixW77Qd+uBoJG8MJ5PwIUNi6yeUNckw6lAadkrf9SNmJpuKZfkD19dW1HQ
	 p2hqjMr5UbjVOKmi7jMylEB6L/WSpgYeeGDfuyRzF1nTSAt11xpTD3Drp0sOit06bxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190329;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1RsGJ2QltHbA5w4L7lGT0rlrQVfd+SWN8BV1Y4m0lyg=;
	b=gGxfFPOoZH4dKZlzGwD9YsfethWjBGvboOUAC8EPR0BWPDgkTKlG7M5v6Yk6s64cN2OS
	 l5nNNqyvmOkehnVTbKr1oFZiuZ/4QXlhTAMMrgWig8ALzaJ9qBB4CO/lUxPkf2fhlB5IG
	 5gjuRILG8DveCH7Rlceo+CQcJ6B6dWwSRNC1OeUUWlL3fZjl/4kC3K9pven722yPMHWnt
	 W9v01piybvfCwFFHXp4x1OqBe1m5VPvErsYUPfLY4ZjquJewQSD2f7R5B3Ml9yeMiXSiv
	 8WnVzUKX64i4SSjF/EREkrkcnNcvSSUmIoJLcxP1/GcPGAzp4KZG9Dk7NVGXUjIo8Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q1ksFMMs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DMeMdlxt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE849606A322
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:25:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE849606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q1ksFMMs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DMeMdlxt
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe91X137974
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:25:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1RsGJ2QltHbA5w4L7lGT0rlrQVfd+SWN8BV1Y4m0lyg=; b=Q1ksFMMsMzOif9lM
	/hAa0VBzFRCc771ob4K4MWOfDJIVRbKmwUqSLIyT2O42K7iXw/wRaHe4mk4BGVn0
	vWPvWZs4XDxfk7LIIIFQuH6omFLY1L9SH3OmxMiBV+lecYDzP1jNVwoILutc4v83
	p2MLI1ymByewjKMqANF+TqrlTBXXeBZGB1xbglkUtAQGR6jsPF8ItPh92YDrwIYz
	X4qCYJPRrf+s86o1+GVd73MvjLbxPzZxGuK3M0lFWnC/8aQbhq3CQLR7JRTa+2r4
	SefOv2F4fjhsRPFbiFtdT3r7zYxXxWwL9r2RmOZv/WykwOqHlnRJqGk1y4X2Xt2X
	faNnuA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6f92cfx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:25:28 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5caeeb345c7so50502e0c.2
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 05:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793190327; x=1793795127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1RsGJ2QltHbA5w4L7lGT0rlrQVfd+SWN8BV1Y4m0lyg=;
        b=DMeMdlxtsy7sfwwWKbXUDEaX3WszRNg4R8HBqCsZNcXxbcGQbG6xoxgkyxdaPXCBeI
         N7qDoVAHU9sxWO5Hf7FA0I1sI7c0uFkWliD3YeKh8TiyrcySjgmV1LWfBIQbfU2/vLKb
         MDH23lszBdqpRBgFRv6HSa+yvVBl9JzMPi5vu6uiCz+0PvExPqjGfcVG3cr0/Wt9oLHe
         1sUD8n325OrCu7cIYKNErXnUYgr7gi+ZT9QnVH72R1ai9gLX9AIkN2uXUjgKnvQbe9Cl
         bT7oPdf3Q5CLInR2oBHyIaFVotujEN4BrsVJVyGWXG4lsqzf7lu1D/xG5A74jaPys9Bb
         1GJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793190327; x=1793795127;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1RsGJ2QltHbA5w4L7lGT0rlrQVfd+SWN8BV1Y4m0lyg=;
        b=Mqp8CrsDEf7MbIWUy3kPewqoHroMjKkQSsp94j7R7M8ViITJQBtD5VcEWGnnpqRWsl
         JwbmSbVuCUKvM1DK3hRNlLOIyokZPpzlOvPVztDdbhYDCHXdCdfIsfbO6MtloLDKxasv
         9hSUB/Xjl7bHWaYL4wxD4bwxPOCN+h7+fdammN3nDF5KorhrugJC7ubjrIzSV+SSzuKU
         SxrqZwYycPmRAO0+TCiJnXkCVziv+0i6dL5fmBIiRfFQTgGCzkX1c7SvGRWXa4zEaerU
         XM0STtDfrzGy7z4GS9gMK6ui3qG4q321hY1RaCD5MxOLILvRAcDhx9r8mcSBXeB9pAsP
         ah5g==
X-Forwarded-Encrypted: i=1; AKwUvBwL+19GDj4rUBfTMCZ5tyvqKjVKa1ICcvC30BnF3ri6RQxJr9bFGQD+zEJ3F2NF5WbRwOl0CJXKMfpp@vger.kernel.org
X-Gm-Message-State: AFq9FYIEUbySt9AH/0sKLHKZHPyibum//54/UYbCmNGFKHzEBqkEvthL
	KrRC+gNM6i41Nx/wWzpfPt55QdgAiaBNkPRp+wkJ1miBQd51t8RMcFly/Cs6yKV3HZsFlFgUZ7X
	a1wd3c5OyL+HbUTHS5vO9duVeUp+jKwh7Ct3Pn1c2TgA2OTEnIoK0ttUow81c4krc
X-Gm-Gg: AYBFou2n+iMdl04jwocyWE+G+/HBMnHwIDuE3rEmOqYI4luMfAkGAylTpDs9RWu5ZzF
	5qP4jAb1cVJuM0zrB6vPXQ/q2VoeECBtCCmcDwo2iSvlffXM3tnRPZOjlQVmho2KMktc3Ylv5Xc
	+aRsodVOyiIKAp2vHCDM163aVTqCJ+5D91+YzRUgtp9bMFhx8Mj9WJqxwu11eYJTVtnwKCjMZYH
	fxqw8s9RUp/6KPMHZTyuOL9hL9cxFgnK4eAyomAssE4+6d1oPiWtjUXiFYdzM6HIDkMV+5B2sOj
	IJGGsuq+ex2mewzzJR0qMXhpPppylLLpAVTIiR4GD0go3O+WQt50SoRJUKT0dPjxcaS/o2/Vp1m
	KomBjbfayLMJ2qLazONU42ocUt6ePqYAVt+qTBvQsb+nEUKJqaK+rZDtuX6IuDhawMkDQLZY=
X-Received: by 2002:a67:f28e:0:b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7d03a4e9c8emr682596137.2.1793190327118;
        Wed, 28 Oct 2026 05:25:27 -0700 (PDT)
X-Received: by 2002:a67:f28e:0:b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7d03a4e9c8emr682571137.2.1793190326549;
        Wed, 28 Oct 2026 05:25:26 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4964203bcsm1386592a12.23.2026.10.28.05.25.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:25:25 -0700 (PDT)
Message-ID: <a31207fd-2385-4d0d-badb-b9b4f9aeb057@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 13:25:21 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: talos-lyra-evk: fix sdhc_2 vqmmc-supply
 for UHS-I mode
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261028121840.3111281-1-monish.chunara@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261028121840.3111281-1-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=frhJ914f c=1 sm=1 tr=0 ts=6ae1e9b8 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FAfHesXRkd0e4_V_TjoA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0OSBTYWx0ZWRfXwZOU7MqXTH1z
 WUgP0X3O1YCf2ckcBlmM6+6kyoHQR0j2yBGEJNo6Mo2xFWeyxEg1FPD0NT5a2Jbp3x4K/kWoWo1
 HH6oZ6eilgFAziYnUtSlKwEh8mbRRTE=
X-Proofpoint-GUID: 1nE9TgIDT5ViTLhuxefBX5Y2FexnUJ95
X-Proofpoint-ORIG-GUID: 1nE9TgIDT5ViTLhuxefBX5Y2FexnUJ95
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0OSBTYWx0ZWRfX77GWOqTLn5MO
 NfsMIMFszBmGEtRTjf99ARyrdhpTdtQZRBCwcGkHb4o6F9Nc5dY48jW17Tp3khpMiD5GKxfltPy
 DCp6hk4Lg+xblUVkZNa0k6HJ8miTG9lXj7KYozeEAS0N+xY2Sf9eVmdj49JDzUvldgYSNq3FfpZ
 gPVkzAdIybjQ2YfsI19ZASdkVBuOyPFZwB/e5pxEiKDrU9ehs9KfjHS4aPgKPKCAptHOAMzzw1O
 kEBdfSs2hzqwdAH3DiaVsvsV1rPM1Uv+nml47FWQWgW++Mtxw6pO25a4nDVyRHuI8Hl8XfRD1gY
 EifpEh4uRduPOaN/jV4eEM4rfyKIuUqahLLbp3a9X9btKy88zPwLV2Gj66derp4FXuRg2RlhHP+
 o8dQQMDG9Aw8tHQxBbRrEQPh1Qiylh54MXRtggE3iilK49wPSCrkecG7GKB5s37eHJCx83t9404
 aWAlzcY0KksqMaGB3LQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280049

On 10/28/26 1:18 PM, Monish Chunara wrote:
> SD card is detected as SDHS instead of UHS-I because sdhc_2 was
> configured with vreg_s4a as vqmmc-supply, which cannot switch between
> 1.8V and 3.3V.
> 
> Switch vqmmc-supply to vreg_l2a and update its voltage range to
> 1800000-2960000 uV to enable proper UHS-I signaling.
> 
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> This patch depends on base series -
> https://lore.kernel.org/all/20261027-talos-lyra-evk-v2-v3-2-658fd5a7ec99@oss.qualcomm.com/
> ---

Please fix the base series then

Konrad
