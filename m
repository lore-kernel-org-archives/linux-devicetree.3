Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421863A5448
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 10:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774435965; cv=none; b=G2SS797x9iwI8nhoVnSBNxjcN0F4OFxyLh//BOo82n0cynDLhkyP98WGuuqbl4oMvky+GUinuXSgyvGQTcUq3IzaE2+MGF56BtD+u0nWad7c6y77PBJ7cYylRhERtRPLfKOtXw66jfxlm9tDH5Bb/heXyQn2ttsi1cjz3nYZqT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774435965; c=relaxed/simple;
	bh=wmuaaOg4CnipIOHEA8jDhmtHGu0mwlaisEtJOq8v8NA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sgIyvvpSlhkmPowNSyKp3edQ5uV19DtcZBtH1Hnw0AHuDKVgyGztWm+3IChWkuX8+vaQoJgQi2UWgRrk7vsEvXENsgxqubfxelZqakltDtxwjiXWpUO6KzKkMZA3znPnChIaxB0PCyMidx7VfnuAO6KfbQ/YfANewBkHwVoCz+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AMzm6wiL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KeLH0kb5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AMzm6wiL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KeLH0kb5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PAAQCs920422
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 10:52:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ReUMwUL96j+Y3C2vukr2YAZoWKe15yppO5rPQ/p+//s=; b=AMzm6wiL8DM3Up0O
	qBvKg1SclfNHoaAw42n+6CIiEfrcO7OifTXUnvdYPxA2bbyQ7XQnJ9nzL4TAXmtH
	SwJLoQhgtGfF16vK62QTY44w1+TE1B91aQ9H46Ij7DmJLxz7zO9O1fwXBG7x/g/m
	tCrt4D4sGCxpce3yqAVaavvl0sm1desidvqrziOMLiwVRMZBGGRZhmG6bsv8C8xU
	txN7MpBR1uR+Bknn/Op9EZPQ5b3GX1HZ9nsXLIZnh24OVSah5LCZIAERtzYI0Kf8
	b7jb9bm996i1mjH7Z0hwh2TnZLw7kV6jVsR0XbodtQZu/BuR16DUhG+OqYELUbzx
	aAONrw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d489mhekx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 10:52:43 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89a04e9d4faso46065126d6.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 03:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774435962; x=1775040762; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ReUMwUL96j+Y3C2vukr2YAZoWKe15yppO5rPQ/p+//s=;
        b=KeLH0kb5F7b4ojksy5iZHlK75E+4MO4Xv9PznDSyJ64j5YAnIvt2KjO9JimdT1+KNF
         OVvNSjnl0PQDYK0riLUe0ESwXM5k09vDWIUNfn/Hoi/jzMDWqhtBbP/p8GgUEXf/ETZS
         wPe9nB0/wTippH+sLi9bH7bNEpRS17dDiYVtmMbeOaWaDaIfJE+3iq5+TsxVquMypeI7
         doCUShyjsoX3VCUCd0r53s7yMLHCJ3sJuxwffAMpA2UOuER4ZbMm4oUetzUwdJCOoBuL
         QBYOH7+KmijpNqaBwqtNZ5KqP3vlPyGSaFeJAD55HkP8kWOrHVO7mpzMq6Q3yiGjReJ1
         tOQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774435962; x=1775040762;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ReUMwUL96j+Y3C2vukr2YAZoWKe15yppO5rPQ/p+//s=;
        b=O8ZW1vzgIFCNog8XrV/njDJdNgoKSrrj1eFW3pdszvEY7supOvF0uue/2O0K09GkKd
         xV7ZZ9bJa5Zli6JmdCHtTWUbcFgEcriNpk1SWc3M/ksYTkG72RpjYllqBPD6jqiIZnki
         i5G7Qo2JnljNw6I7YBcKDH6FAJLhj2uXf6Q/hwZVH9ylAFsWB7cGPI1TR+R22WfA2mOi
         nYQhvdUnsqox3G07I8KhwUdkantMyeJjPC40dkHQ7+k+6eXVIX6rs7eRpHKfEXHOzaes
         e9wnoIfwMnQJy24qhxnLD9tR2xJb6/fC1wmn+ueeiteVCUsMijdvoDzicTvUlt4gmBfA
         hWWw==
X-Forwarded-Encrypted: i=1; AJvYcCUElDqp67p4E+Qdv/2LrSxUHKB1FGC8ZAv7/Z+ZT9unEkQUKDVofw6g5gwGmAfJTZ7L48sHVWzWBD2O@vger.kernel.org
X-Gm-Message-State: AOJu0YyL7SfFDks7ZAbpNJQ7RTSXxr8cgK9RgvFGuQgr9pOOL8JOVeG6
	DifsAGDwbyh39C8G6PIj5XvRq9ZOOOLWk4rHDxB2yEQkZ3iQjBs1k17k6WqWsk8O1uV9Scu0Ssd
	Rz8d2XoTeQKwaYUCwZKWeVvGKSzeDOEFey5dOxcyK6W7lZDjsN1GuZfCZHS6/qoGM
X-Gm-Gg: ATEYQzzMUkqovhM6d/6rQp4PpmVAyMvr2b1NBbiJCCqkcA413qOEzEpUvcF7XtsF7R5
	Py0bs3vVgQjowfheaindkwrQPxXwIfvRDAsP5BkrnLWmqBIctqSBLJ72KOhEA3v1MtsEG5D8azN
	/Md9ZfNBcV9ILU/fmAk/CcUJavKsFBtcMqlpgDQdVeJT4ZaBVD9v+14jhN/mGHuRKhSW4f4Y88O
	a9iABz2DWRCJC0HbvmCQkZ3wumUhDNozcC00GsBaCnnX5yWgjaID5SNTFvu5ZC/+sWhGjKrmBR2
	wphipiZ2NXkhgeQKg8H60IlfW+HAJyFAxuMSRNA5VjIQB/dXXFaub+UbCuP0Hm0Iy5qixVkWn+A
	9O5K+5PfdlClzUdc7GMIPoJ3TnwE6kgkSp2rC4EoFTRsvu7E5yuHd9dHMF9diqWPSOdEa19Nh9Q
	OMzhE=
X-Received: by 2002:a05:622a:5287:b0:501:4767:a6f with SMTP id d75a77b69052e-50b80cdd452mr29777661cf.3.1774435962594;
        Wed, 25 Mar 2026 03:52:42 -0700 (PDT)
X-Received: by 2002:a05:622a:5287:b0:501:4767:a6f with SMTP id d75a77b69052e-50b80cdd452mr29777441cf.3.1774435962183;
        Wed, 25 Mar 2026 03:52:42 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b133e0796sm56053666b.16.2026.03.25.03.52.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 03:52:41 -0700 (PDT)
Message-ID: <da741f9e-d5ff-45d2-9b1e-7f15f71352a8@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 11:52:38 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] interconnect: qcom: let platforms declare their
 bugginess
To: Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Brian Masney <bmasney@redhat.com>
References: <20260324-msm8974-icc-v2-0-527280043ad8@oss.qualcomm.com>
 <20260324-msm8974-icc-v2-6-527280043ad8@oss.qualcomm.com>
 <DHB05UJMTAVN.17X2QI6XGHB37@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DHB05UJMTAVN.17X2QI6XGHB37@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3NyBTYWx0ZWRfXwKnOq51GfhTO
 5xsZ50RTFyG+AwFNpiQz0AeQ2uLd3R2hgMCdACn4CXTfL1mk+KI8gRICWEBnyDe4TxmbY2/Vhd3
 3v1RQEwjSn3bkDJB9zePuOVUeApy7d3+4eGJ1mV5KWYayFCPvyWVSpenDj4Akn4kml82W3jWqYB
 zxKWbbmxfkwiH/z/EPhZrn6zDGXIytBBT7AYbr6tejNFep4DrZnsrZjOLl9xQYtfhPWx6sjmukm
 kOAyIkaGGSfgQP+WfTRj0lk+j+Gk9slyx2JY/sKlpqj9utzkcErT9812jr9En7tWhuRZrJ+pMGR
 TqSgDv6+LpoTzXhfAFW0Pk/FcmmrBvFqTQddakN8AZBc2zPK6lNzhI/t8mj3Oq8KKsiWDGJP1sq
 19Bj/VJa7OUGiy0J9csDmIOO8C40VWp9I0VdHei9GNOnyZXPn/MQm/u6b9aYfTUeFfiT48S9fIc
 VeupFzmj7fcxnpMeBtw==
X-Proofpoint-GUID: zDlUivGun1TBYlT1S4eakSOXcIdrMsGR
X-Proofpoint-ORIG-GUID: zDlUivGun1TBYlT1S4eakSOXcIdrMsGR
X-Authority-Analysis: v=2.4 cv=AKSYvs3t c=1 sm=1 tr=0 ts=69c3be7b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Oh2cFVv5AAAA:8 a=m7pxcdcc42vr7exHiogA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250077

On 3/24/26 1:14 PM, Luca Weiss wrote:
> On Tue Mar 24, 2026 at 1:10 AM CET, Dmitry Baryshkov wrote:
>> On MSM8974 programming some of the RPM resources results in the
>> "resource does not exist" messages from the firmware. This occurs even
>> with the downstream bus driver, which happily ignores the errors. My
>> assumption is that these resources existed in the earlier firmware
>> revisions but were later switched to be programmed differently (for the
>> later platforms corresponding nodes use qos.ap_owned, which prevents
>> those resources from being programmed.
>>
>> In preparation for conversion of the MSM8974 driver (which doesn't have
>> QoS code yet) to the main icc-rpm set of helpers, let the driver declare
>> that those -ENXIO errors must be ignored (for now). Later, when the QoS
>> programming is sorted out (and more interconnects are added to the DT),
>> this quirk might be removed.
> 
> For reference, these are the errors I see on fairphone-fp2
> 
> [    5.534806] qcom_icc_rpm_smd_send mas 8 error -6
> [    5.535010] qcom_icc_rpm_smd_send mas 8 error -6
> [    5.535218] qcom_icc_rpm_smd_send slv 16 error -6
> [    5.535445] qcom_icc_rpm_smd_send slv 16 error -6

I only checked these two, but 8994 (basically largely reused design
thought) sets them as AP owned intentionally

https://android.googlesource.com/kernel/msm/+/android-msm-angler-3.10-nougat/arch/arm/boot/dts/qcom/msm8994-bus.dtsi

so I suppose the fix is to simply denote all of them as such and go on
with our life!

Konrad

