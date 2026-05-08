Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F39B366049
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 11:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778239176; cv=none; b=dRdPd/DM313L1zI4P8FPQ8svOdDSYyWk+Lc0ZZM8FcqekRnEFhd0WbuEeI13fBd7YzxRhV0p8mRKlJOgJpuuGpxB03dWmLLVmFs+E4HaX7bw6t6GcPUG1tjnut1t3ISVC50SzquYaFVEaTqitHrsCSIzbdZP8hwCdHMSVXsvw6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778239176; c=relaxed/simple;
	bh=XIXa8EjOgez3qsla3pU5FqSnug5qtehX8v23sK1H1LY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NYhW3vOKyHenA/9uAm7iPDHC16xyzrHJeRZ4ipN5iPu06Iqm345rXU2ZcuycZRz3tyKD6gYUlnAjIuRllVpM4QRd10Yrw/GiUYcO4lLyXODEzuhWY30cXstrS3SEeLHbZjuynMzruQfnlNQVcvpMn9I4lv1xt7Tma9pqRBI7fSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LH9PwYO9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZNxwfB5T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LH9PwYO9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZNxwfB5T"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648ADAbD2183596
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 11:19:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xe4gq/TPDXHM1b12bLr1gd6wDh+pc+1Zrgp9yNQWEIQ=; b=LH9PwYO9vUoLEIWx
	r1y3sQG7C8wXlQW/DAN9DYySbt2kNsRK3Cwh3D0ioknOOpo8aH+JZZE9erreLTot
	0WbrqaWh0FLZtBxMMeIecKZNpZE9hcgSx2s7f0jqVHgASs9T6MsTOsyskXTkAZ05
	QtEJ0Eki2Bw2OHA/qg/8xtxNExYu4V1vAxXhdJeQ8rrvHC46vxmt8t3URw1VOW7W
	dIwtEJPgir69s65jLcryrtFjkyPJbRfJlP4mAcQMCoLlj+Aeb/O4gcJrarYeGd4y
	iw//+uh4lxoJbJqMKqiIDI2+UcNVKjoCmKODxSEZy3uLYRjIyu27b0DyNQ5ypPeI
	fdch4g==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e10pyb45a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 11:19:34 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56f8a5c02b4so206466e0c.2
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 04:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778239173; x=1778843973; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xe4gq/TPDXHM1b12bLr1gd6wDh+pc+1Zrgp9yNQWEIQ=;
        b=ZNxwfB5T6U2KXXfyqScN4JiiYA16iIVMUKYU3TU5pO5ZWGyx9sVcMBBC2p8HOoEpI8
         AmWk3jkcp7JZV+/xId0WXaDGDpknB3NPqXAQfIHW1GqgQ9Gbm+bYL/eXQ57v3SBs66gy
         X5yJ5/Tui0YNL9fVmn1OVAQrXboq+5d9ihf40WvnGcq6roYhJXwp/fKbHMul0NmReSvt
         igaRfmfiLGvU0K/U7cGnDlL6qz3ni7m9VCAARJ4ga8ihNF+aetMzVeHP1ub2l9iNPgmP
         SWrWD28Mb8HF6+d7s9fq039+0qYc+FuXK9o1pYqxqYxr1KlaP42QExvn37rnhvwCwuBI
         kP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778239173; x=1778843973;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xe4gq/TPDXHM1b12bLr1gd6wDh+pc+1Zrgp9yNQWEIQ=;
        b=Qe1zLEpEfDuCZGvg0pteJGYiQrMoHb9VP8XmVFwXq/34hS7fIEA3Wtc/GSbjTjS8is
         KoL4dYq36WbscHv98pdke7cdmdCs7b6Ze/bMRLN9pEvN7WmfIVWVKgK8XUUBjrZmqbNJ
         FzQB+rvvERmJ/nyfkLjJ8W8VqOrlhw8XaoaEzHb+tvmk+mdI/ahEo6oCTpad0OLk0TnS
         rDFqsV7x/8ptvzZV/OmTajVckJa7nllr9lJWSeIZ0tI270CKiGDryaGdUGDBAZH6Yh61
         soTr/JXByyDaQQHHUkx460Hh6LhYMd6buru6yYCeWuT7+JiO5r3LbF3vPoUissERuDO+
         9P6A==
X-Forwarded-Encrypted: i=1; AFNElJ/V9+jtSEEJS3CaKmDJ39uEpNIlOhfNZ3/3lmJnPLfSQ6HzwA2sIw8GH+4kCNE9VDGecU8+SyA9Kyrj@vger.kernel.org
X-Gm-Message-State: AOJu0YwXCsnI3RZOnsUo1vEGq8RFgVuh42whDVrJ1AlHit3rx1siW8gh
	Qqjl8nTEqkJKt7dOQu/KOain3SSfMfX2KXQ8N7bLyQGMW5r0JkVIvDEvGGl2p0FUqwlSr83oi7E
	Lvj9sZn+t9nDFg7MiaRwqfUqhcFHWcnACATPY8DYcCVsMVPzSNfHEw0ZNMadZS5LK
X-Gm-Gg: Acq92OHZmYar+yQdEkejOmX3bQLzTkLMpeFiQ2ieV0oCLURP/vEh97zoxELrTFQ5oaz
	c0oKKoB9S+YeJI8X8IEOjcNBmVj1cu9IHALeo4DkkbotaG9q8kEZ/5dSJL43xp3UEB7bhHIrWiy
	/zRI1yUw8/njPzfpz4NtXAdHiWxR+bLh1w2ucPWvpS4rly5m/tzITZvMZHye0HJ8lxlYarUUTpC
	3fgNCwYM88ovbcIbgsWhhoYK/s+o7Y1YUsBEoB5iIlGCx1lOY3LwWwDVuxO1pXnIWJOoFNto3Ll
	iNw3+omAAbNdemu6PR9Y8oc2guZBe5C707f0EHjPAjTOaa3VcmlOxlnvZUwVzUKcnNFvfNXEEA6
	FzoyUQE+p+rjNgIZdpN1y67DJK4Ju3Wk9FEzz/KgX47DkqFqHX8mETOibUiB14cwhJLki+MPihy
	kM2jljuSDaHn8eWg==
X-Received: by 2002:a05:6102:2ad0:b0:623:52cd:4cb7 with SMTP id ada2fe7eead31-630f8e77f88mr2676913137.1.1778239173567;
        Fri, 08 May 2026 04:19:33 -0700 (PDT)
X-Received: by 2002:a05:6102:2ad0:b0:623:52cd:4cb7 with SMTP id ada2fe7eead31-630f8e77f88mr2676908137.1.1778239173166;
        Fri, 08 May 2026 04:19:33 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac398b017sm65898666b.38.2026.05.08.04.19.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 04:19:32 -0700 (PDT)
Message-ID: <a6d6e638-6e61-4e39-9e06-bbac7703c6ac@oss.qualcomm.com>
Date: Fri, 8 May 2026 13:19:28 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: qcom: imola: Move analogix video/audio output
 to dtso
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Riccardo Mereu <r.mereu.kernel@arduino.cc>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, broonie@kernel.org,
        linux@roeck-us.net, Jonathan.Cameron@huawei.com, wenswang@yeah.net,
        naresh.solanki@9elements.com, michal.simek@amd.com, nuno.sa@analog.com,
        chou.cosmo@gmail.com, grantpeltier93@gmail.com, eajames@linux.ibm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, festevam@gmail.com, imx@lists.linux.dev,
        m.facchin@arduino.cc, dmitry.baryshkov@oss.qualcomm.com,
        Riccardo Mereu <r.mereu@arduino.cc>
References: <20260430132140.30369-1-r.mereu.kernel@arduino.cc>
 <20260430132140.30369-3-r.mereu.kernel@arduino.cc>
 <CAFEp6-31LQX+uHJ2PFES76RGqmZKS43dO3UoziVZ-KWQGCy6aQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAFEp6-31LQX+uHJ2PFES76RGqmZKS43dO3UoziVZ-KWQGCy6aQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DZUnbPtW c=1 sm=1 tr=0 ts=69fdc6c6 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=T26Fge9w-xJM3eegr2EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: Qd1fK-U1L4PbEki59rMs5MqNroYbJN01
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDExNyBTYWx0ZWRfX+MSDMk3XImC+
 wP8zlJgvFy2T3izI6H2ennLMB+JDxNKMN5MfcV1wSVw4BZ8NdDcgJ7f31l3yX3RmWJbBh2WSFct
 LxDJ4KjAgOCmRlexF+qO4TVV86nc6rdt/V1k6MjEqHDxi4KcpRsAAJWG73n/QzEpH//wZTQkmHY
 8KhyFZY/s4w0aPNzun//1VQkFzjZHL+vcLdsa+z0QDKfomu660OlXEgPZYjj6QRlM5FeRTUPWYL
 XuQYII2lxM7lzgJRXqfIsyyIhEk7eNzGZ+Vb0Cur+odUXjzvWnDp7LKvzsyokDn3aG7hAtS5ifY
 GdQjmbShF+jluatU1aViGSvts/H8Z5PI7VN2pDg4bTKH3flG1NLlrqZFVq2oWF+Ag/XQ9C94LZV
 qoX2HzPKJYKD1eyMmfp4QDszXN0vLmKAG079+URKlRSpkvgwyOnC24ydbNWWeu3jVu0NmLb8AWu
 3Yrnd7dbQ3LCHfAJVDQ==
X-Proofpoint-ORIG-GUID: Qd1fK-U1L4PbEki59rMs5MqNroYbJN01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080117

On 5/5/26 5:44 PM, Loic Poulain wrote:
> On Thu, Apr 30, 2026 at 3:21 PM Riccardo Mereu
> <r.mereu.kernel@arduino.cc> wrote:
>>
>> From: Riccardo Mereu <r.mereu@arduino.cc>
>>
>> This is done in order to support different video output over DSI.
>> Since audio part is linked to Analogix USB-C controller it is moved to
>> the same DTSO.
> 
> I'm a bit skeptical about having a separate DT overlay for this. Is
> that really the right approach? The Analogix block is part of the main
> board,

Oh I skipped over this!

So, does the media board require that a switch is flipped or something
like that, to route the lanes away from the analogix chip?

Konrad
