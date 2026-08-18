Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D89746AA9D
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 13:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787058448; cv=none; b=n0MiPWeFRe7PAkR4mBGgsBOdbsUxhubLnvJy2WLoNfHpaqmHUr7HudgC+6U3uB5ObKs2Ken5kkm0NzZDuVpBWD29DOJYwwCtGu+CTNMgt8jEyeFNXdOUuPLYwoWjk34Rr42E7JAIKkWJlUgUrJT5VHLWfCCYmcABm3ZtKTGeKfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787058448; c=relaxed/simple;
	bh=fliuTsK/BPwnCwQ0bYrWsjoxZs1aF8oNRd0XItMwxkM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BewGF5CMXOZouQ1WSc/umGv7BnuFypXNzRgZ5+rD2l9rTiTx8qLwVKrdZtst6G+1s9c12pjyoardT37hOqr+mtWo8JfN+9M+QijGnt6i3v/kRu015n7nX1CWurQaHcnFLcsPisrFLZ+w4/+fuobqonmQWC13GIKpdJGMJd+Qt00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YSITYX7/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VFB5/lFZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YSITYX7/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VFB5/lFZ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ID6OoL1407110
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 13:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TxJFpHpsVdgcJukWbRkgadowwJYA/kcIja6NBxo7lvE=; b=YSITYX7/I/Zmq5Gp
	EQAOOVs8rWKs3IjEdvl1f4780iMXtYqJUWdqHRemKtGcTbo6XQiUOzRb9rSqo53w
	9uWeTnZxgoHAwcqMdVnGWYgOpQdbE/p8rXc69zCEY1LaAFzIk4Qk2s7aQiFD/TA6
	P5w969GyyTN/WECeCWi8zWy+z9o+m69WazBQqLIO+VcPG5kX0IHs8FwjzRg4+hqM
	X7rnlfvIsTYAhyWRo8O+ePB9QfiHTHHMaIAp9++FziAlv7peplrt5fcPkrEIEHdu
	73wFTm8DQmkgUaxeeQULptp3hZPkJRlBn97FieweXOAcO0H1HLmccASFKyuZmJ3T
	zVjZnw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4qyx006a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 13:07:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930bd2bfc45so127165385a.1
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 06:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787058444; x=1787663244; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TxJFpHpsVdgcJukWbRkgadowwJYA/kcIja6NBxo7lvE=;
        b=VFB5/lFZklPGPArEB1tbO8C8sb35SUFdstHvcWsPt1euE/cOklY7u0g7DsbrEr2CWV
         HIQ/mYDpZ0G2E+rQvGytxqR0xkhP0dcVo7qYYD7j3YtdZeMFt2TWhDC0ne+qSFIJPPYi
         GqMRCTlvHvVYNHiDlrzeXli4qolIQhobGWiFM5Whk9wNQIbkb5kafhffzzFKrlx4HpR1
         7Tc6mM7vlgDzGu6TIbGtnC4Yo9gQBb9T4UHMxiNUkwAxCxq1Yt3WYOHARqVZYhbLNDvF
         7u0eP+YypHfu3MMsLg4yb3bm6nAHgW8o7zNnUh6JVgC+yQZ2qk62hfvKnhKSuhuIQPJi
         0Aqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787058444; x=1787663244;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TxJFpHpsVdgcJukWbRkgadowwJYA/kcIja6NBxo7lvE=;
        b=sqnqfgCBaT1cKmPPecGzE7Pagk/qaQmYxgnElgOwOSgGIARGk/DXnFIAsgddhCMIQg
         k6gs/BKZgPDBqq3MvLbFe6L/x5dFXZRdV59nV9UrKbKcGuAtWxjeE0f8Y896bHekivXV
         6RvPOCZZkHS2b/iazdcjLvtV4wHpxfrZ+ovYj3q3+r+rN2pMFLQmqfmTE2rQTXHyFeDE
         vJ7twh/15YUkwP2lVdHjsgqBYYLTcfEm95S0wvhGA9FDUZ74vfnrIkbX6CvuER/9Xxzs
         tenKP0SqsFPaBkreT13zpR43i3hA6WU/KGP8e4HTIyoDXz3DbhCnfKHBPk3aFSphfOX0
         5UiQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro9LVpWkT0XXlcqNP+RgGlj5Gvcb0gDzyFtwxJOt+skN4VJm90PvU9VcfeKOzwi2YDQoZsHIeNa7Sa+@vger.kernel.org
X-Gm-Message-State: AOJu0YwcbD6sgQz1QIkpqRsfwXhB8SCPF2YjgL264dktEyR2yuT1SMhh
	H+Td4WTuIdckhINjgim0kdPIuNBY9hz3TAZd0okBSS+frW57uXTZ/ZWSr79lmutPKyidT1xXQ2h
	oDYmQxKKgTJ63mSVdh0HC7QIx5VooZKTd1k4j43whaN5vVhxn/apNQDSfu3EBAphl
X-Gm-Gg: AR+sD139opk6abf8mpR6cT6Kay0tl64d/72hzZv45n0tG3WSvVJ3U8UTzItz+vozKYb
	HL95vEVTic94bUChcS9Dj1T6rPq/RJ2KXUq/85CWtCM53frGRoKDYdMRYlB4HVwx3rdVmNJuVmy
	vnrGz/8mw2yhdsqDjEY2B2tRddlhv7OAOyEhMKXqpoEiEaLz5JD+0/7tS6QtP4eoQfeV+hAbn13
	Iunoq4rI5DvOFsyT7BnqiDK3J7B2vd/CtC2TuA4wc/lGJSnI5dJ7n7ji8ZB0WHdwGtyrFVQPDzR
	ilTQqBf0Z35lkbRU6wDvFfntWgszVd8Usg9wfYyZ0vVlV4Qyai7LSDa8R79lPgzmFyE7IZ3Z7OU
	ejyNSYB7rClUzS2W2MwfOZAFm
X-Received: by 2002:a05:620a:1a04:b0:92e:6485:f640 with SMTP id af79cd13be357-936d261aab1mr2368800685a.4.1787058443846;
        Tue, 18 Aug 2026 06:07:23 -0700 (PDT)
X-Received: by 2002:a05:620a:1a04:b0:92e:6485:f640 with SMTP id af79cd13be357-936d261aab1mr2368793685a.4.1787058443274;
        Tue, 18 Aug 2026 06:07:23 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a16b204389sm12548431fa.42.2026.08.18.06.07.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 06:07:22 -0700 (PDT)
Message-ID: <1343ba70-96dd-4476-8bb1-0e81f7ffb3c7@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 15:07:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 4/4] arm64: dts: qcom: Enable SD card for Glymur CRD
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260722142342.990384-1-mchunara@oss.qualcomm.com>
 <20260722142342.990384-5-mchunara@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260722142342.990384-5-mchunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA5NiBTYWx0ZWRfX1HMA0RRy/joA
 FT5RB5GXlip0Vy4Js7HgxLsa2iMz0J+toCpS2ooYyyQ2ILEyBF1jqXRoPn0VtbiUKFWQWleDtRG
 8M5xtIf4pVMSVOnzAlDkbtW9kdXN8TQ=
X-Proofpoint-GUID: Q8CEf5BbtG853ZNpB_az5kQueEmPjA8a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA5NiBTYWx0ZWRfX+NZGh1Om85FB
 mQu6Z/4XqaQQLFcmBMgny+Lvs0b9mG0FIQ6Z1OP4r0vOw8PHTiF2aTDBOmNV75MxYv/d+cQlSIj
 8ZUCLU6djsvm7TVrR28JH35XnNFEoaNVM8vK63ZnyHzLMXvwFi4swzUX5FOaO9aEN4tTfQDO2tK
 r7UgatPsqMjkRSBvRFLZ6ESjBE1GmcVK0Abjddkq+uNb+88Fjd3zQm/J+9lpbyIkQo+yLcthilq
 BZqe036FelhWvd7qLvDFtGk+1wMtpvQiwmQkhVwtRIffF9b+RY8msHRZ5uU9MltPJhypmjCaQLD
 leyc/4RqwJxUQY4Faz/50xAIwW+JEEa7BarzNnMkdKP37N9AHLs9gwIYEI27AmEPU6cCxMp+GPJ
 hylUKT1w7eNQTn8c6v21plPe2rhNtTUSVuMAzViTwzYzd2Ox1DifzaezXwkaBQYShllYIapOs74
 I7d343VjExvkqbzSU6w==
X-Authority-Analysis: v=2.4 cv=Ad+B2XXG c=1 sm=1 tr=0 ts=6a84590c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=FZAofsGHiTNuLk9495wA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Q8CEf5BbtG853ZNpB_az5kQueEmPjA8a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180096

On 7/22/26 4:23 PM, Monish Chunara wrote:
> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> Enable SD card for Glymur CRD platform. Configure the vmmc/vqmmc
> regulators and gpio-based card detection for the platform.
> 
> Co-developed-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
> Signed-off-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
