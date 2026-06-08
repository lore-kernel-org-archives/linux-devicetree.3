Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9038B34572B
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 10:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780915499; cv=none; b=cSgV+Zh/ben+Mf6yh5oavBlAHugpgsdWO6Xn7c/rhGwl2BqDWldjwm0SB9d7bbAI2SKOIp7IefNEsl+cWi7sFKAfdRcSdjxwMBEJ8+5WdSBbpjgOD9iHxOsI3OFgyL4ExH/3V/CZJilW6102ToAju2lSRBH5IhbcacVpF/t+NGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780915499; c=relaxed/simple;
	bh=OQ97Cl/j+8mNGrPW+dDWj5Pi8p/nlY2y0qd6lnknoRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TDQTPLhDKoe0RhEUJHFC4XYpKm0YBNJVG5IlA/pSxEy+X40N2KWUPn1pZzOF2CGoysBkkJEuK26602uKB8nA7bGOts6esUbWu/AgE6tlvsOkUvNqSMw2DdqiRAYuvA/NWAJLWpDCR/ajJNZaBYGfA6PT052+/tle6qppCR/L0Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nrDDqden; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YrsYq21U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nrDDqden";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YrsYq21U"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65892L1j2677815
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 10:44:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	41jb4hFcUfRoTHuONKjpdm59JB4WXIc01LJAry3rtD0=; b=nrDDqdenRSeY3pXx
	5CZfMJp/i7PtpoAor3mrjCDbtVylku7vRpGYm8pQjGrQ5nnm1l7ReHFEbNfZgq6z
	HylNp6B9dB7yZ3qrkfO4et2+s1SHMmMgAKrmJHwhjL648ISp58XxV5qkOc1Rxgd8
	+Nbuc7HfUv6QGrCYwCp/p/Bha4q+lFNEsZmHC3aFQQX9nNTBfGbdCyy1ErQfzITc
	+Ca4IqnWz9GaQ41zH+m6xU+MJdlUkGDMB7cPxG+e3C6HrHg6jZ8KqquFQWzijD0o
	VG+gzVFvpXiT/TU5tyfdy9Ng6E/g2s2jsQx7VZWvXsmNgTB20avQMhrWUvQGIkIC
	URIPwA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entrkreqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 10:44:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5178ded346eso7810031cf.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 03:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780915497; x=1781520297; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=41jb4hFcUfRoTHuONKjpdm59JB4WXIc01LJAry3rtD0=;
        b=YrsYq21UMAig6JYV1O6wtRI/HJMfZNm344B+DjXmBmZw7daJlGBzMV3hEvL9oYnHUE
         nxOtTi5mQPL3l6T9OieM5S3LmRP0iy43bAZMKMWIulUexMVtzTg1DLUz89bIWvd8WlDp
         FSb7nPSwdz8FI6F8oMBfXqzVHIz36EqgqWU41NvNPBrdlyIYTPt2xn29vx25qVVb1ti2
         3rAF0qiqbjasnUI17YrKlz1yFE0bH8QGBlCkQGYJPb84mW8Oo0Ri2aE6X2TU2ksZswYJ
         2lFJixplWc0XeB8GpchzR01NWXtpXZMDrhMyOft7H9+IKDRiexoUt5KHykXZ7z0AGbGT
         LV5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780915497; x=1781520297;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=41jb4hFcUfRoTHuONKjpdm59JB4WXIc01LJAry3rtD0=;
        b=a1QfDqq6x/28swyghquBFSmWedbuGeFljVaRHYJvjcz8ZKg2KVRT1Kqmeahq7t43p4
         Uj2Ofha3lCqQN4zJ5yGHkucUbiA6+rgDff1g3LIV7vAWk+T8cGehrue8PH28RcL70Zf+
         6AgmR99/8At5F/Lpyie3f8O2KUOsbhdcvMDYI+bu7wrGsSDH63EMNNYJIyovZbvb6V+n
         npNTLyN+HCZIiNJJWYX1QTobmziy+QrfbVKk6GT86GDoOnSNuJyfgiCQzQ5v+IPrkwdT
         xhcDYOwZ3YaaS2NRNgxheVcZeN38sJ9hRxKYWn765kHAlOKA/wpWuelvwGRAB4Np+R4+
         rdEA==
X-Forwarded-Encrypted: i=1; AFNElJ+SWe3Lvq2mRKI4vKpjIZ6me5eXtfTlJe9dr3TxcoOt3k9eslog2MYTwnnqDRAJBiNdDnUU5Gx8OkmZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwIBCy7icpTZIjcIVCSq2oDk9kRtFKn+xEYTTBGK7BZwwOs19/F
	Z7MzX5MJftX2r/v6bQuLjvCkHBharQAtZnLzu007RZt3NgapzUf7yd0MjpBmcdKhoLyEU+S6UkK
	u+2x5Aob6td1k46elOeV07fGb9Sockh/hbSq7Q3fh0YazIcR8SWwyuSNzANa+FVW0
X-Gm-Gg: Acq92OHoVIHet26GI5RD05f7QOztk5wudi3JRPiK8ACnOP4j70pEZvczi5Drcm8+ScF
	4uHYF7oHqCiw+qqlXdaf8CiTYizBcEJLDMDR8MmRyEXG+2uRc/m344JZABVsr4R0L6RsfWN236K
	3bWQGJNTK/MT8GL5G2o66cSrBDwLhsParGQqaCGJkJEiS28VzDZYUInO3zfmLCnYRvjhAZ0LsOA
	LHpxJ42wmXGq8UdDl+l6+n2fYuhA2gTKc7s3VSihiK2598KYQOOnNZZUw16MJ7XYcR72RiJNek3
	jz3cm9lXBo0ljh/y2XOg81j6gV4f8px6/znVXG3MhuPBnO/lvO/o5FnDBkGOZJCwDs3qo9G9CsS
	8N7QsbTRXXA1mQ9Bi478LZf/tp3waIGFIoQ3MEkisyy/5kWPEp/qUmwQV
X-Received: by 2002:a05:622a:904:b0:50e:6311:7380 with SMTP id d75a77b69052e-51795c0d8bemr109931911cf.6.1780915496964;
        Mon, 08 Jun 2026 03:44:56 -0700 (PDT)
X-Received: by 2002:a05:622a:904:b0:50e:6311:7380 with SMTP id d75a77b69052e-51795c0d8bemr109931761cf.6.1780915496521;
        Mon, 08 Jun 2026 03:44:56 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65b58596sm6943544a12.30.2026.06.08.03.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 03:44:55 -0700 (PDT)
Message-ID: <18f5e5a0-de70-4d6a-bc5a-93d402059aff@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 12:44:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: Add Shikra CQ2390M SoM platform
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
References: <20260522-shikra-dt-v3-0-80ffde8a3dc4@oss.qualcomm.com>
 <20260522-shikra-dt-v3-3-80ffde8a3dc4@oss.qualcomm.com>
 <63752557-6468-4aef-a847-06aa39ce108d@oss.qualcomm.com>
 <3758be2d-4553-40b3-8ae6-bc3e502d0531@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3758be2d-4553-40b3-8ae6-bc3e502d0531@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: PHS5TxDm1MomoarLw-njslvYyNTTt26X
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a269d29 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jymwzkz8D7XtJHPt1hQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: PHS5TxDm1MomoarLw-njslvYyNTTt26X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEwMSBTYWx0ZWRfX1Jt6dyrDln1d
 /K/FIzbTsmSC96u4WDkGvsKyZJIL090ZIW2yLHE9g8YQh3Km4fCAOZq+D4nh41FzzxGLq9tCbkx
 +cWrkwEzVlsjJALexQbbKyGhKFIAc5mT2su7uLlsS0LeWEwSRsYSHAk1fB2pm7zwxDmt245Oc0+
 35IBkH8suawm9wLhmoNpvTQjgkKMLQtLWr/3LSLyojGoPibZrAr2Xi9hT+mpOG2fgeV15VjnyUb
 lyP+NRmTmCm3E/jpYkusEqYPckG96xzNp16DjhVNNFsw5mSUKjPmIfSmy4KEF1QhaRx2V3sLkgG
 REdI7lKDnrNuVu+ZBPh0NhuVJgtKi3B4CSFEgFjczxU41Q1yTcWLoqWXWYRs/AHts3DHxENdAHw
 yvAyKmKIa4WPQDY63ezmcaTAjzREuIXrZrDDKSrM3hVyMdLjtK9qjpmdItEpm8CtOnXJNCLdBhO
 yu9wa4SoONSqwhR9TYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080101

On 5/27/26 3:32 PM, Komal Bajaj wrote:
> On 5/25/2026 6:46 PM, Konrad Dybcio wrote:
>> On 5/22/26 8:02 PM, Komal Bajaj wrote:
>>> Add device tree include for the CQ2390M variant of the Shikra
>>> System-on-Module, a compact compute module integrating the Shikra SoC
>>> and PMIC for IoT applications, designed to mount on carrier boards.
>>>
>>>    - shikra-cqm-som.dtsi: Retail SoM with modem (PM4125 and PM8005 PMIC)
>>>
>>> The DTSI includes the common shikra.dtsi, adds PM4125 and PM8005 PMIC
>>> regulator definitions specific to this variant.
>>>
>>> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
>>> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
>>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>>> ---

[...]

>>> +&pm8005_regulators {
>>> +    status = "disabled";
>>> +};
>> ?
> 
> Already there's an ongoing discussion over the thread [1].
> PM8005 regulators are controlled by rpmpd so it's not expected to be enabled here.
> 
> [1]: https://lore.kernel.org/all/20260525093453.edmqryggp5kcqxxy@hu-kotarake-hyd.qualcomm.com/

Right. Downstream, MSM8998 (the other user) binds it to the GFX CPR,
which probably has the benefit lower latency than if it were to go
through RPM (although I was sorta hoping this would be an instance
of cargo cult that we could just rip out..).

If you add /omit-if-no-ref/ above the definition of the pm8005_regulators
node in pm8005.dtsi, does it get correctly skipped (i.e. if you do
dtc -I dtb shikra.dtb -O dts | grep qcom,pm8005-regulators, is is there)?

Konrad
