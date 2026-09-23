Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2B1472098
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 09:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790154511; cv=none; b=MPsLFhfFZLExc9ohjq4nWROMwQJ8zHN38Byt3Id4F8VO2XEMuDRj3zTvBDgZyyckE/+W1tZ7E7p5QzioWsB2+OGk1rBO2zAvESWtOIgo/U0UK4hPlGyF3BsUvXjoAtS7ThVttqE7Wgl0+cdwK9lAwzsOvOTa9nhagPXKuN0RQGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790154511; c=relaxed/simple;
	bh=hsZN9w/yBMg3XwXCPTH2FjCd6O3mgOb7hefdaLZK+iQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u/EygA3wJXFTDjZrMqMMbeeWbOzbNYBULBo//Q3ObPG8BG9yyZ9TxZhWkODNnKUOaibvH/ALPCBCSGGv692AZCvFWlYgp9vA3tI4JhtgJF+K83AH8bX3PepRfw7YqgaI4zqam4+DqFNlia/SRb7778uWWTnhXIQEq4EUQyy+7os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XPghEJGy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cjyy/0St; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XPghEJGy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cjyy/0St"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8JaRb1387434
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 09:08:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UuMzY/2gP/TrsXmfp2JQVThkPImdpZjzfTpqeteHCp8=; b=XPghEJGye7f8clxT
	2AKClu46dghCAFZ9pVrRzlG41dpeX/L0882d/BP8fen4JJ16ocq0zBIFx/WfmyO6
	ImvUWfZGOkpDvncfTDuLp9B8WrA0cTf7YlkLa8UeVa6T2t23ioJXsiFCvNdvLVvl
	mglsRomXbiu1ThJ/it0PQduLknBO1jsJeeK1LT7miKmjji6NlCSa5NwnMs6/WRC9
	QPZOLaliGiB2DZ2HYndIdOxwTIW6dmItZlnSp0hrOfyNCa4Cs2gYzmLzQs+0rK0i
	3/OfwqLq7IHarUtzCZgah4ANf1+i723LMyIBkL4vh38+4kQyvrMPPaPEaO+78gE5
	wC7axA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guyma3206-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 09:08:29 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91240299f0bso1505446d6.3
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 02:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790154508; x=1790759308; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UuMzY/2gP/TrsXmfp2JQVThkPImdpZjzfTpqeteHCp8=;
        b=cjyy/0StWj/30lfeFhkIaDFRmQIjV/LrMf4YZITLwRriB+YTACr4H6X6PR7ej2e2R5
         EWyFIh+DAlkqKHB6lj4P8x3lGwJn0w2xaUIDsJX4xDd/eiU3UZhSH7cQsq/7wlrDABY9
         knj2ck3yPrJdRnCr4v+XxNQrvnYyrhD8fiqG3m6IOmtLjuPLEzuI3DDj/YHqjNRcFGeH
         NNyD416ASK+9ghAUI/egIXn9saYJsqLBhQtW2QOIhak18gsTILN3qjrmdw4NrZvdancu
         p0q3g8OVuQE7iGUyrDt+gwloEE4omrv2CBkd98im83ITqNWv+E37Vp1nnSkhz0hHDsWk
         4HPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154508; x=1790759308;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UuMzY/2gP/TrsXmfp2JQVThkPImdpZjzfTpqeteHCp8=;
        b=HHFEX1dx1OCmAM4Gjhi2UFTM7A/2uRyGFyH+bYQPxaVbdSDEDHEbJrQuBeNJZKZCDw
         kO5I7cjwN/roBwZrIDhCclDwlEbfYbkYtD7Kw2A+dymdqJD1BJp9F+8+OSwJ6n+Z/MjW
         +asa+DFjXNtjhn5FVNuMvi9Vs3id9v7WPwZD3CMpfnosqB9gZYbD6FWMAXIb4NA4Oy5a
         jg0V33B3GRanZF04v18khAQwgv8beJDMTbIdpTojXRVWfSxRJghT+ZopUhso1XhN7n4A
         KLk3EBy8wZRtF4ozLd+duZ9ezi33vn91CaxJLbKTIlVRZoHWJUVWo9SfgcbeVdFPbSxj
         KuWQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2vv80LV6us0VQ23mePpGP+7Mo7GUMjzrp3z1U3PKcGvdZIH/1M/ojy724E+MUZqUtEEVLVQ7EGT67@vger.kernel.org
X-Gm-Message-State: AFuF++ljrm//VY8Dvg4krP12QNflagZNKRxRgM77UHy/9sq/Ke/mUCHG
	XtqPDqo0eMZ/3IJY05oY7SYqWiJhdS2E0fyFiyUs/HegR+PWW76y1PstEEcZw1T2ysvItkPmmLc
	tYKwk6aKb6GK657VNCdy5yGsKvrUQ5xjrxUcVc8C7PbYPQj0xdha3EdYaWqwBub6p
X-Gm-Gg: AYBFou3KjPNRkQGDlpL9VaUgoK6rqj4q+9fAjni/yLcz1VPwfCyYnIWBMeckmyiF8rF
	TSA4ZIrX43eu4y8gZBfGAD8SU3TUUa5xy07B10QqyCVQqiUEkTENXIPm/oOJQPMsTnlI2Tgc5yW
	WO9sgOGl+mMo2CgPk8jKaHNF0ajsZIyPWlw4fJh6CIRuXfjC4KNNbhubdpyY4r3gvwNCUo83K3A
	IG1nQ8m6HGSQbkM0CEWUxr7/RFJ0c7iDmdyFNucXs4idnU/INCvQudGHgQwAM3thfY+Z2pYNpxZ
	mdltARxNZJLW1SuRLsQkVUHHq5HfO4JqRIbKVIINT26xqRNOrJgXNUkWLhtMcfH1d+568tC++2x
	OzVEp2Ln04crFLVe221XjyQ==
X-Received: by 2002:a05:6214:5c01:b0:912:127c:d7f6 with SMTP id 6a1803df08f44-9140c50a456mr32390126d6.4.1790154508117;
        Wed, 23 Sep 2026 02:08:28 -0700 (PDT)
X-Received: by 2002:a05:6214:5c01:b0:912:127c:d7f6 with SMTP id 6a1803df08f44-9140c50a456mr32389946d6.4.1790154507504;
        Wed, 23 Sep 2026 02:08:27 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab386e5aasm1203497a12.9.2026.09.23.02.08.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 02:08:26 -0700 (PDT)
Message-ID: <19e6915f-403b-4dc6-a1e2-8e79c468a819@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 11:08:23 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, abelvesa@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, johannes.goede@oss.qualcomm.com
References: <20260922181818.5503-1-daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922181818.5503-1-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: uA2e9UkKFzeyyWnsLSAGAo27QEOwFRvE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzNSBTYWx0ZWRfX9PMCGPEvA2I1
 v80IDdt/SsGTA8Tk2yNu/JgQkWlTlhd8riXAR6QBo93RkKmRSt90sN7BUlvCVmSAqC7gAAa3fwS
 AaeviJsOE2jywEFB5WxcfyfNGxhNQjw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzNSBTYWx0ZWRfXz5mitc9uQArB
 +EdBd+OKfPg6GeVzZzHUXSleWb+a4j/VLn+q3+KhEYJhW61qZhcNiiLnLBY+GeqjzDw3m+3BuKk
 mv20GspeDe+Yom/KN+TZgqZxxb0uLvmwmrEXZHRM+dKIbhphmpWN0aIASn+o9P9TUFvvyIeYrPc
 OZj/NCB2HXRqaL15QbwarO3bWck4ecKNAr8oN+L3mRfjPN5uN84/Pty1IsBwSwH/Sa13gmmC/EW
 eiYddh0jt6MYP0t6i9lHDNGKAdvaJQ2OPE7KwG3sVE1kGkibxrBvR9/2TNNAenZbRErygmn+gtL
 nI+o6ys7T/bkFQSJjN8merAXRDnFoKNhKL/edpfXoO7M5RIhCOMyTzCfVUDlXaQc9Aq60tDh+dn
 Suo0ilsQg+5SM94P6EHkqhfwl7YOc4nwvQR+w4Pe3Jv0aE8EvsmvacV7zpTTi00urrORULPECVU
 Heez7JSFAf8I14iiMYA==
X-Authority-Analysis: v=2.4 cv=N828hG9B c=1 sm=1 tr=0 ts=6ab3970d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=nvMlQeE-hM3dkRo3rIkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: uA2e9UkKFzeyyWnsLSAGAo27QEOwFRvE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230035

On 9/22/26 8:18 PM, Daniel Lezcano wrote:
> Add the thermal zones for the ThinkPad T14s and describe the board
> temperature sensors exposed through the PMK8550 VADC.
> 
> The keyboard area is the main thermal constraint under sustained CPU
> load. Add a passive thermal zone for it and progressively throttle the
> three CPU groups as the temperature approaches the 53°C limit. The
> groups are activated at 49°C, 51°C and 53°C respectively, with a
> 1000 m°C hysteresis and a 500 ms passive polling interval.
> 
> The cooling maps limit each CPU cooling device to state 6, which
> corresponds to approximately 1.9 GHz. Testing showed that the system can
> sustain the workload with all three CPU clusters capped at this
> frequency while maintaining the expected performance, making it a
> suitable upper cooling state for thermal regulation.
> 
> Several configurations were evaluated while tuning the keyboard zone.
> Using a single 53°C trip for all CPUs allowed the temperature to rise
> quickly but resulted in a stable operating point around 54.3°C, about
> 1.3°C above the intended limit. Introducing staged cooling before the
> target significantly reduced the thermal overshoot. A 49/51/53°C
> configuration kept the steady-state temperature close to 53°C, while a
> later 49.5/51.5/53°C configuration improved the heating response but
> shifted the equilibrium slightly above the target. Based on these
> results, keep the earlier 49/51/53°C staging.
> 
> Also add a passive back-cover thermal zone which uses the GPU as a
> cooling device at 64°C, together with a 73°C critical shutdown trip.

The GPU contributes much less to the thermal situation. 64C sounds
like a lot for backcover - what is the threshold on Windows?

Konrad
