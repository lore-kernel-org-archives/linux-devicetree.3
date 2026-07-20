Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F00D3CF02B
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784535998; cv=none; b=MaqtuedP/AsC6GOnpBoCPikoB4qUn1IVkGMAdBnZqapykktN/7nNHgoCbrL0cEbmVKbqbOyXBwz2UHq2yZZb/T/ZeuFLJzhCxCEAZbglLkQHPdxTyVTdeutN+spw1iYlrlkSRpsBXh9OJi5OcGbSsb1B2J3bV1uOypOq1WTYtMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784535998; c=relaxed/simple;
	bh=GBF7KrHy3ln9XS/ee3pZ1AuSGTr1FRAzjvSsBHplr4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lYJep07Sh4W3RR9aSntWL7BNUAlBUEoVKygymOoVGZKt4sCuawj4ymON1Q4Q5YJbVyApgEZui2teeHLJ42YaAPBcEjzEY58YtwFOsUCrGVBcw0GrP5irWGNzuVofSBRPV0QcjlqfeV9CUkBwLN/l9rijCVhjnOIqLpSyY73nP1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pcg3ZrCN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j9bQg5nJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pcg3ZrCN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j9bQg5nJ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K76QZq1712947
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	88mJyp6oMmmLpNQcFlo95mLCzBlwISYWWKmsfIRSYFQ=; b=pcg3ZrCNOs6Pi9EK
	2wMLBp4Xz/zRAuYQFmJMbg76lWP+FisAfhVcG93JAemwkL7E/bnAlupzIap3SF3y
	izdCeMP6H1dLj65/UjQIcsi/31tWJbRd5tmwILsBKm4CmmEJBlFUzXz6uqX6Obsw
	bdqJcVrVEckXIoMO63xQR4tRLnwHugGiJCelvKnS+2gDVasV23YezOZYsN5fJ1UR
	44hO9j3oMHKhngiIYtGzqDtjeqOPJ0Fp/Nkrdfu3R/IcOCl8jf5RPzZw6e8Zgd9M
	qA8qYqJomH/0ZMBV1DQ8vGlZHXUhCYq7kKUFYs0cwzCKN0z1VAsoKGps55oLKEVT
	kMYODw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhf0c09g8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:26:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c07313be5so19954701cf.2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 01:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784535996; x=1785140796; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=88mJyp6oMmmLpNQcFlo95mLCzBlwISYWWKmsfIRSYFQ=;
        b=j9bQg5nJdfzEcjr0UY2MvXKikT26UjKNyBnI8ze1rpS9JlQqYnxgFGT7Gqo9oOdT62
         D4vXF37xKJepqLzml8GLnNx8Svfj6HSG+6gRFdxE4XcU6GbP95+gHgT3z2Ig+SLuDJ3b
         MPoG9WGxdO96ZwxW6HuO75jc2zry4ElU7uLt1nAyVQz1CX+M0rpzIMkWC/pUoqrEaLLV
         Ks3rlLYahJebA/eY41L21ph9BW/mS4Mw4pcr5emtab5EjgiWI2AxZbSm3Tix/K78RrC1
         D7ImdIVTD9B70MRFJgmmlvqqfN+fGAdfyxVeL6zb/x7MbDGQaNOubZwSOxOslv/0HiY3
         A8Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784535996; x=1785140796;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=88mJyp6oMmmLpNQcFlo95mLCzBlwISYWWKmsfIRSYFQ=;
        b=qitVSuGWfTzi8gA7GDtJuz9z0hG18MwgSEvq0Bso8kkfr/1oqZTFy+3AuLIO5QKqV/
         +HL5K4qry/YjnFPw65y5L8VwnDhx0CMnj6wW3x9wndXPsS7mFl6EOJ9cK3V7McOR2uyy
         KAKvBruF1UkCRLyDxbjuVNHUoBgxCEi1Jf1kfO/ZatDK953tpAZCUNHLG6uvi1DPrilo
         hjkG+DJnruTEQO9Mgm1m+8vGnMSkudiN4gJsYT4aTqlUnGO1CGSK4l8AY0ntINrBMZDe
         aIRnhn68qi4PE/fiPVO14RGBZ+rUix0ftHKIIX3AQ2T/q+seT5EHpiAck7LYfUVsrnuf
         0Ezw==
X-Forwarded-Encrypted: i=1; AHgh+Rp3QaLPqASlfZ+cefmkBGc4IeZNhNeg+dCxM9Yr1AmI8qstw6c96mLHaLKW1pZ5q4tUKcp06Fs8zyeo@vger.kernel.org
X-Gm-Message-State: AOJu0YzZrCjjR9z9i9lLb6LLiLv+e5rFlDD8zGxiTRBb8F0XzS0dX/Ul
	dBv28GbAvXNT9PqHMxHxX87eCmyZsO0zJiUasO9ItZLi8NXHEDjQk0qvlf6vixtIGHLWXrbBPlx
	bj2S6XnNUERM17wbWcJJC3qSXQit8H9eZuqQi6hRV9/ma6Up8dzyQIJatmA3OS8Px
X-Gm-Gg: AfdE7cm/fJVel7ww/zihSYk5dqHxexcq2HaAtbKjbqG9knfR/y3PiJC2ECrLtPFwaiU
	M5ezbZu6xEV+d4CtcQVNTkMdsfow96HwwGwP4WGhYLOSLvNZh/Bq+nnj89PS9mMCHSQ04nAZsMI
	XWqH/tjZFfnuHVWg7QHwO/UQiEwunyVK1pTJ5DE9KwqLU3VHhJHqIKqmq+AFPc33KcP8Kdg1cF9
	d21U8Vlw9K76lz6Ourh73UcP8W55iTDZmiq2asEfkJoSAONmhZdvSFeygv2iMu8TuQzQs/j9rGR
	f0K2mnJtWBlbqRxHScUb1T6xIwI+N+gLCy6orFaJqvJwnd527peDDqvDdaX9p0SBlNtZriuoLvC
	2UfRoKD/fQGRMCEmrHAt4v41T
X-Received: by 2002:a05:622a:6848:10b0:51c:1c73:51a6 with SMTP id d75a77b69052e-5213bc1dffemr77968581cf.5.1784535995670;
        Mon, 20 Jul 2026 01:26:35 -0700 (PDT)
X-Received: by 2002:a05:622a:6848:10b0:51c:1c73:51a6 with SMTP id d75a77b69052e-5213bc1dffemr77968451cf.5.1784535995230;
        Mon, 20 Jul 2026 01:26:35 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c17009adfdcsm415561566b.4.2026.07.20.01.26.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 01:26:34 -0700 (PDT)
Message-ID: <acc0280e-248b-44b8-9300-86dd32b8f160@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:26:32 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: sdm845-google: Enable PMI8998
 camera flash LEDs
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260719-pixel3-camera-v5-0-99593f1bd8ec@ixit.cz>
 <20260719-pixel3-camera-v5-2-99593f1bd8ec@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260719-pixel3-camera-v5-2-99593f1bd8ec@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HeYkiCE8 c=1 sm=1 tr=0 ts=6a5ddbbc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=TWkwOYXMJnNHLyErFSkA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: hh7gctXXFEgl70C4Gx9YQM_pe5wJmBYj
X-Proofpoint-ORIG-GUID: hh7gctXXFEgl70C4Gx9YQM_pe5wJmBYj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5MiBTYWx0ZWRfXysBwkQawSco0
 ZMMG8WJFHviDb//Yk3R8qgMJhBD4hAC6EOkVlP5bOKW9fCYAvCu9J5m/PhGcP2xKjID7m/qb1nZ
 BSRkL/Slk+19wmPNe81guuwzxUCU1kY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5MiBTYWx0ZWRfX/4U5gxQhz5vV
 Nv8OxRI0Z5x+xzLbCNbUv8g7kOA4yKaI4p/dFrUrwwDOiVGB5q/d2TXl1cLw66EW+04nvBShSVT
 mG089s9ybT9FIm8zJ/uAXR41Iuts6c8WqMTMzUaSrFuRqcDO1YIH3O7kEm9SAA7KQvKcyr9nj+s
 DdgAzwzmegyPRgJ1a+tDr2jYSIxX61/QufqxPoyjzRI/vxukFv869nHH9/oL9ZIMKLXmK569Z3d
 b6FyWlnfrq9Jv5GBq47DYTVoiOE9XBspOfkzic5E8ZCDQbShZrrIutIdRhyfoQFYJaxXNfgGRlC
 1Nhqy2z14X9KibDt43HROmY7mw9Xr3Dn1TZcyEuu9JKRGlXMc82f8uafPAHeB1SHIsjmu+V/7H/
 Vms6+Xsg5lVcAYfJdpf+xlICKCvD0kzXa7/TTl11M12gbPB0BeQXTLgRhAh/9IbNNgxf3sr9nBb
 qfb+EjEwATOxpp33lWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200092

On 7/19/26 8:03 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Enable the PMI8998 flash LED block and describe two white flash LEDs
> used for the rear camera.
> 
> Configure the LED in flash mode with hardware limits matching the
> original device configuration, including maximum current and timeout.
> 
> In contrary to downstream, we can control both LEDs separately.

Progress!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
