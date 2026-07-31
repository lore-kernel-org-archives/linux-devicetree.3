Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237BA353A94
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 05:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785475651; cv=none; b=okkjyv9RQV+H0qCX2qVI/38EhIPVhS6EUwHMtQcSMgzXI/sIuOUATS5H6nb1h2SNn64l1P8d8bskiw9hjDuiOQiWRJyZlHWeCmwc3GiZVdiQzeofkZxF7AiEdSKXw+/XujQZQQNTpzChmSDrFdNsdCHzQmbQK221PB8E9N35K7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785475651; c=relaxed/simple;
	bh=wMJ3xQGJXV7bZq82amQNntL3Rd4I7Rp3ZWh+Mll8cuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dtilffmFXnlDB6455wDybJ71mU4bCcFxM8gcI0WRCxfdWmw2FwJFnl8NTk7ix2Wl5cQGyVsTfOMGlmmLV0ZpCKX+xty+NMEC74coZY8i03xXvyzyG3W/4YwN8kuhcIWqLLG0qrLSFcLuMvSJZjkmblop/ss2WBlpI8CnmXYqWS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=moVu9eI3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OQuM+BQ3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="moVu9eI3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OQuM+BQ3"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V5HZuD3235817
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 05:27:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+lqVX/RPwnow+8A1vtIvSpCnxQwfN3TRAdDLdw44pbw=; b=moVu9eI3VlVszSVD
	k4eykvEMHkNnGj77hMBLokwFrErP4X6MsVRq9TzlMCEmsIpp3yirgiiz3pmNoKg/
	ondc1ADCtFj7df5uJKtZN08GfU4Yx1/ZPHQJZKmb1nh0f7FINCXZ51knMJN0RAnt
	j8Qee+Y3erIebr+PzLpIheIfDfIhrHbHMXuSIcqvEKNYy30PnCphau6jnLVSBVrl
	qt+I53ZbR11S5AF22ScHHyY8BDmirjYBBIJXx5HtQRp9shXW+B95jZNo/XngE2OQ
	NKzCSY8W83xJDMlhRlqo0X6kGCAv5dEC4qk3ltB82Das5AwcSOPZWknIxjFwR5Cz
	wVTOMg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frne5010r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 05:27:29 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c89704da8c7so862518a12.0
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 22:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785475649; x=1786080449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+lqVX/RPwnow+8A1vtIvSpCnxQwfN3TRAdDLdw44pbw=;
        b=OQuM+BQ3o11gFc/XCAsBl5dpeI7gWUN6NFZ1p7LVERzqyg0URfY//7EakRIcXollWp
         Fy6ge2DkDyXOuAKnmJaojMmAJkn2u909fM27y5o5+mX24MGwfwLLielR3lPHbvQw5YuK
         +8UoV+wtIwEchPb4Fk8zrSadM3DAUt8piG05NMGlWSbm1fkcogsHadEuiXfXZSHvezIj
         /yIovR0cGWZmO8zx8i5gJsWSTPAnmt4QxsyRNJP/eqk2IquenzhK/PcEZxuJCqAsEWSR
         e3QSfd49XlS12OAWcXdDOtYPjv3P7/1uVWWOKr+UiKQ/sHE7jSYAi9+osHk4wtV0Isi3
         SSOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785475649; x=1786080449;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+lqVX/RPwnow+8A1vtIvSpCnxQwfN3TRAdDLdw44pbw=;
        b=M8NELo26B/QsxB65CSMAbMGSiq3CC+HuauQbMFXCQ/K8pD4TCwQv6538hNT9EBGpPp
         6UCbU8qHAtP/XjwkCqnFFUWLpPcgHl3maMzdakdD7v9XI2aHb6r9izrYC9v0DQebhP30
         j1PORh1KVdy0WDkZ2y3svRtAVNWIhGZ9sX8eNRd92M/StLgIO+QZkNGHDBGSvD2a62+1
         ZA1YSPK04vRjZktr/PoOXPb4AEKtk4xm/Qii5fMqPiuLDMJJr/Y6V8mJrvr6YoEMtwE4
         ucG+v3XsCOfni/6HD28lXXe+fL9Ze6l0cmHTeUO24vxbvY4oHFu2Yers6BOMhi9G+pMz
         tu4w==
X-Forwarded-Encrypted: i=1; AHgh+RqcyC9W+gieEJCsVGWIO7mPctKKuLw5ylEqo7U2DMkLWlEOozq2Yygdf0vNbTJPK1vAixfgZQoBZ0e9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx26NUfPV5KLToFRRFqP2B8oxtQ14uuV3pAd+0Z3y5j3nWFVGCs
	St4Wm5dYKG/v6RHGPDUZC9iTyNTh4z7INrhHBHzWgx2cIcB4ivmb07Pk/lAx+nHZijGXtFXhu21
	Dhpl+9e24E08r6YAFsCGUz1XbCB5UedzzsoefOP17nduKhCZYm/36Szmb5IDJ/LSu
X-Gm-Gg: AR+sD11QFd73CAKYu8jcb5V9T5XIiLe9rJ7Z+RoCHyusuVpFGvuUOcIL4KnjnSdXjuR
	t2WGha1lOECOIjvj+RD4hgowy6FLnNkFkWFww1n4vtpyf2seSOh4aeCs/MqyNlIisEGZHoP/YhP
	uX/yTB9ypSbYgIpeTUjZweqgF6YOC/Qe1JD5RwsK/XXp5WLlvWs5xHBKIueoxS8PDNWd+D/cWt0
	aGXTRkRDFmn5q0o35k8SLDZgNTk60DUlzWoA6LtitN3e0P8icaevUocSTvXQZtsy/3+iVXpf7fi
	ZItQ3E14MvAoGSbYVNSYiuPlfvGrE3S1YKvdoakK21YcH6TdT0yxpcK9+cqXT523q2ldNj442IX
	T8P5r5yPvBT0Hy0PQ4VaLPEviOJMDznz64w==
X-Received: by 2002:a05:6a21:180a:b0:3c3:c07b:5322 with SMTP id adf61e73a8af0-3c91b1f7b7emr521462637.34.1785475648639;
        Thu, 30 Jul 2026 22:27:28 -0700 (PDT)
X-Received: by 2002:a05:6a21:180a:b0:3c3:c07b:5322 with SMTP id adf61e73a8af0-3c91b1f7b7emr521436637.34.1785475648179;
        Thu, 30 Jul 2026 22:27:28 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.255.44])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5c7sm1424781eec.5.2026.07.30.22.27.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 22:27:27 -0700 (PDT)
Message-ID: <5d8c7e51-1969-4b48-affc-94007d0f3295@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 10:57:20 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/19] media: iris: Add AR50LT core support and enable
 Agatti platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ftzsol4f c=1 sm=1 tr=0 ts=6a6c3241 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=azT4Vr2vIDLY4WjjlbZISw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=9Z6RCAdTk4ZiZ6hpEs8A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAzNCBTYWx0ZWRfX0Ru8ZfzDrUZB
 Vo48qyJIDx7/SNhbES3zSq1jN4So/ssQ/OT4FLk0nmdsTsVSJWFRjuu9nvktoCzaJi428Cc0zvf
 C37YcmAm+OhhchHqj0R4hFWLN4cmTcE=
X-Proofpoint-ORIG-GUID: NpFFiRTW6rWh4O4HgJzzWalorFpDcMxE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAzNCBTYWx0ZWRfX44yM+bNSQ8pH
 MVLtVWJPxTeNpU09zGvp7Cx6pZQb9ElfSEoBMf9wx7QZIs04j1+YM1P+OH9sFgESXhaAbprnAd8
 HoZ7Lgc0xP8yh4SNFpAcltOGHDrd0wu3DsYchl2PFg2u0tgI5idelJ7lif5KGbgUEVEpUNvoyHW
 SIrvmjriylmwrnKN5eR3SFUsATQiP4n9H6d8g58aMHf5NkpCzS3czRHXw8/J6Jz8CMIb4dIfo4A
 da6e9FOLezNJCgQ/5p5GYMxH2j2GuUJEfCVIYkq507fMdXGSfNoA58Fo7Q++oku5ESZQ//cHCLC
 rnXSF32HT0eVBo7LaKPr/Q8tAdQb/3W3uS5MFnW9cmcaShM2imCEnLgAsNA/Z2L1w5nIFdOb9gJ
 8/4wIhBBZqS/v5V+U+JolQDE2/P4HEV7v13QqRVuOMPPwd4gaCfo4W+jznGmhzbAqkLnYMIhCe1
 q29kkgsBS2A9va6HmDQ==
X-Proofpoint-GUID: NpFFiRTW6rWh4O4HgJzzWalorFpDcMxE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310034


On 7/31/2026 5:18 AM, Dmitry Baryshkov wrote:
> This series adds support for the AR50Lt VPU core to the iris driver and
> enables the Agatti SoC to use Gen2 firmware and HFI.
> 
> AR50Lt introduces a few platform-specific requirements that need to be
> handled in the iris core and VPU abstraction layer. To accommodate
> this, the series adds minimal hooks and updates needed to allow the
> firmware to operate correctly on AR50Lt without impacting existing
> supported platforms.
> 
> Additionally, the series wires up Agatti to use the Gen2 firmware and
> HFI path, aligning it with newer generations of supported Qualcomm
> video hardware.
>

<snip>
> ---
> Changes in v9:
> - Rebased on Bryan's tree, reverted the previous version of firmware
>    detection patch

I see that the dependent patch for dynamic sync frame is part of the 
tree as well, so would have been better to pick the 3rd patch as well in 
this series. 3rd part is now left out and #1/#2 are part of this series.

https://lore.kernel.org/all/5vmfrdc7skmo2e3holugnhryjkhwwhndbsrklpjp5dsxfujyvs@a64y4x6lb5mp/

Regards,
Vikash
