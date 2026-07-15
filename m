Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F86F43E4A8
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 10:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784110926; cv=none; b=I/FFP8EGV8Hz8WijA0wmfOBf+xIQHZzRJ9w4IXt9s0lpJYMvmZzMfiKienh2v40VG1fANqQGSmEQ/TaERJpFLNH+q4LioSIgWcvnWY0LMwlxpet8TxgDN22GtCBuxgh9LfAfVSU5EQaylutLhRSHOQbZlOqnkCQ8XdB96VWStPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784110926; c=relaxed/simple;
	bh=0N+jGFTzK1YOcGgJRM76zTpaojaay+dWSq85ymGWrVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VAICfy/2UvRl1Q/5fmjTUgFP5EeNHTUemVTqMjU20ba+zYu06qcwBjZd6xF5ThqK+JaYtrfTZ1XHJjWMqI4VZ6LT7ATrwwkz08L/W9dW6dorJvw5wNokgfYrsYJWtRu/w9WvG0qVbbGnFwDtXc1jdYIuyV541Nagstl9Z3NKbF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ow1Ak6lr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=An4nmNJa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ow1Ak6lr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="An4nmNJa"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FA5HBq3547536
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 10:22:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iNjk1qyyZlIgEh/bwBE5j1BMx4dlxzQvPetF/yBxNbw=; b=Ow1Ak6lr+iTkl8b2
	tidekL58xk5IwySbg7KOX4mCSdF8Zg/37teb6huhQ19HaJqAgzpx6e3bryiQS9wl
	A8BEDS+fO55Tnf5T7ucqKfBpe04V6KLU2yfujSwwIxxqJcXe2nNdTc24e6ASsK0Y
	wDSgx02z9239be66v0yGArqtHG9HPkNbyNyt3Pwbuf5EvZ9cyBch8LqpVeN7mJH9
	KM5Ymw7whofuqxqJsOBHgpZXHJYWq9nCNJTqrfn2ffGGEQTiHVpL+Ul+v0eW25fr
	sDTnub7FmnaiRLWGDX5Uvt00aMKnCkNhfBYHATu2hXRXjozARPBxJs+9CAleMMdS
	NyUQ1g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe8558236-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 10:22:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfe75b7dbso13608771cf.3
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 03:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784110923; x=1784715723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iNjk1qyyZlIgEh/bwBE5j1BMx4dlxzQvPetF/yBxNbw=;
        b=An4nmNJawaLEfMZsQzdQeQVnazua7ULVFLXSdkq74qe8tT0qmizPUB0htfDVPZbyQW
         jRMoIv+RXNTf1BZ/koqFNsIXsrDZMZ6RnZO2OOlYLKoRltvOZTEp/Za5q/YsEeFUWosh
         gfvO95IHNzhgzRP3vkPzTQGw+Vde3tbWZjmDxrb9q2sXCH3y5MgjpZtQ3CIvdJKpJfeo
         ZM2tFeA7Cm1KJ+HXECPj5306iEXZZuiNiUNXb21N3r3+KvaakcAsm3nWOFwXg+ok+HuZ
         OYqohYethAL0fhMC4WnMgc0NjFEueEzWbp1ciNQ0AE2f2tDzP98+9/Ky+T0NAAMvkIkz
         gD5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784110923; x=1784715723;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNjk1qyyZlIgEh/bwBE5j1BMx4dlxzQvPetF/yBxNbw=;
        b=M4th8UyADpRXDJPMWiW9IFztpOWzK+Fav9la6aAEThLexscHbmYRaMsuI24KrFigNU
         dQ92pBlNlKuu3m0iJaomUxctOpHdvAv1EQCmnM/pc5pVnyc96jOYLIJqGz+gxN/KQ7+z
         XsniaEju9Lr5ScCTfCquAchxx7sXq6YJOkeylbmtd/YbTe1liY7Klh/SiiJcLZxQb1Kw
         mBfDs0nN/1PlwGjfP79AHjYmWJECvIyH79VbgPa7YJfaQiCHE9ZcmE+s+rRNlrQydxgu
         nRHz1fJuVzPY67LKQpy/0b8QdYVYolFykVr28ANvm4ZYLGoYxAb8PsK9UzzY6dJFV0+e
         rjhA==
X-Forwarded-Encrypted: i=1; AHgh+RpiStuVquGK0PFLDGgqHGT5ymNeA3YIhESz1Kf15ZOvV8mgv8/BQV1jtIQpWl1iyxoAKhpB3Bo9WTIx@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc4deixyVg2iKy+haoO/n95eUBAKIAG0B/zU6iLfNVaub87wi2
	VOwujP02B4XGOR8ti4Vb8E32LRzHeDFP4mYz1Prw15DTcxWGRX4mSO9vxufJ+Vd6gdN0XPdTC3y
	YqZ7u+kOIg7rctG+K7KfCb24ZPFke3Nx7s9dXEXih5dwJlAEGo3lbXUOaHnd12aeCgeoIZ5FK
X-Gm-Gg: AfdE7clUAk1oNwM2ysVmoZKFpj69jGkRX40nzuuwVAPGHMndga0gJJY/4hrT55sOTw7
	63TsyY0XYwh5NC4qM9JWNk9pv9bv2K9AokAfEd4wMRi2ed5UABZcsGExg9RyVoLzT8Oz8UYRLBW
	USGOBWKH6+ATQcFLDY3LH6uDyNy+xL0ki6p1c6H1FsJ8ExNzSZJqnjb2kXjqkMfkFGq2eL8B+sj
	pRwOTriDhHU5dPm4s+NhGULWd2T8YKue/5Mxsd8YflmP1O9Dfo1V4gW7Rb13WDcpj4dVsr+MRxU
	ClMtf1G8neV4Rl0sjbraebUoQiwQlSOFOwP9V8n6yXkNMmm10eXclwfFmPgJ7ff+rAmVcBxgR9M
	/fV1ETYcV8eQ7moU9r3Ib8AlnKk/Wzhih8bA=
X-Received: by 2002:a05:622a:1391:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-51cbf05e114mr135257381cf.2.1784110923150;
        Wed, 15 Jul 2026 03:22:03 -0700 (PDT)
X-Received: by 2002:a05:622a:1391:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-51cbf05e114mr135257111cf.2.1784110922634;
        Wed, 15 Jul 2026 03:22:02 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd2936143sm2758647a12.25.2026.07.15.03.21.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 03:22:00 -0700 (PDT)
Message-ID: <06584428-0f0f-4ac0-826f-69c1e8af4bb8@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 12:21:58 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: ipq9650: add the PCIe support
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
References: <20260714-ipq9650_pcie-v1-0-4197749d06bd@oss.qualcomm.com>
 <20260714-ipq9650_pcie-v1-1-4197749d06bd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260714-ipq9650_pcie-v1-1-4197749d06bd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gTJcGydq51rZvtCGJNmFpZx2g1lrDs7G
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6a575f4c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jIVGqzqqGd92ZoTDXmYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEwMCBTYWx0ZWRfX+dURB28PgajC
 mI2U46o2pA2qaNqkqi/OlSffzqFLXrvyHNGxWPBVu4viTeo+d7I+i6WgWwEzXHGSc+yq2ZLp1vY
 97b7UK9oeD+FP48vvKXN+xLQaIFeLnknYVEVO23L+y6VPULTayFm8ATHCbSLzqSR6IXkGG72aES
 jE6muudafs8oQ1chUaiU5vmMhSRK9IgQ2XWLJl1ppNj/ec0M8CXK0aJLjpE1WurV8NhP3vWBAw5
 0NV41DZcUHgYO/Q7RHmKX1o09IDS4nvEzX3JB47ttPAHAkBZmTXnY2FpDZ7kCrAQWC7eC9eoNef
 Hg1mjKTNHi17f1fZLH5TOnG8pCAasr3GnP7d5WK5ZzzK/jafGoLWlI2KOOZIKfM520T8A1uuuTj
 regmyrmS5rH7/juahKbnh+/6wPL4rwdQaZN7zDiUStFQ5HRo+bzwyIxJX2TGI/H8ovHE1JE4BGx
 1+PUozSX7R5MupCF0GA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEwMCBTYWx0ZWRfXxDpb++p0UAad
 v3zjb976X1p9kPeNiNOK42ElDdSC5BgNV9hiTe4IS6IJ1sIPI2ILs8GMJwvDGV0ho5R7CS+F8RV
 e5EzTXu835csTlNGC6kbkrtEpiNqZC8=
X-Proofpoint-ORIG-GUID: gTJcGydq51rZvtCGJNmFpZx2g1lrDs7G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150100

On 7/14/26 6:29 AM, Kathiravan Thirumoorthy wrote:
> IPQ9650 has 5 Gen3 PCIe controllers - PCIe0 and PCIe4 are single lane
> and the remaining instances are dual lane. Add support for the same.
> 
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
