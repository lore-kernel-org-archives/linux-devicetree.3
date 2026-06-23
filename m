Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B2E3D5222
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 11:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782215034; cv=none; b=bKJxI49cxQBj70mNQyy58dFk1+kY3ybpEl1DH9fkwqikm5JhkomUlZfZ/+nWaNf5gcgHTRBySBKUkqaKXSA75jidc2xLEZF8DEIbUOgB5Z8SqeHKBTz5E9M7fLk9a5fKWf9kK6Bmv0G/bSr2DRWBbxCqNfeWl/QHy14IMy7F/Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782215034; c=relaxed/simple;
	bh=9xbBXXxIqa56/q5c7t8r4Zk0YJeO+xdElWD1RrJOVkw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mcWd60Ex5Fj6tokvDaSJLo4wxi8ATKRVwxWV5W8ssclwBkkNgdZF8sjoSGEYHGyZUlucJVqG4OhHwFqRyN7hAs1BfKhnx5TkY8eQI4FmtBGshirXZb82xUJhOMhx3ORsR1ltceKmsM0f9YmhpxDK1DSu8SkXdODLSZGjbTqn/W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F1BCHQUo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Aevswgcu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F1BCHQUo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Aevswgcu"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBXude3673594
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 11:43:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rv1hQEHAcQj6Aub7u6JH8fJsjCG1ILRkkbQwG0SXkVE=; b=F1BCHQUoyV4k58s3
	Np7B/Oal9LrUJem+nwByLUoBVzOCF6jeabLp8C+nNeCfW1mfpRTuzX2B+SP94OQr
	sRrk8NY3m2cK+dpryb4lB+Z7iOG39dI8Wo+MGNFqw+t9LiKlxVR5FBsUUzDfEoYj
	ltP9e0EaE2NCSihLArsXBcB2Z39hLqn1Pu1blBET1QTEpp2QOX0ZxLMW3dq2SIaj
	BioQDUa+/GoWgF7F1fLExLUx4lOS7x4bQdvMrxBytHoIHrZAwnsQBrU4lRspAYoe
	ksA4WVc2vH3F9SrVFXlOKb2x/Rp96JcNAbNARmcyYTCNYayFQz01czRiNbctitJa
	58aj5g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey729v893-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 11:43:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517bdeceb54so2234491cf.2
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 04:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782215031; x=1782819831; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rv1hQEHAcQj6Aub7u6JH8fJsjCG1ILRkkbQwG0SXkVE=;
        b=AevswgcuOWmdFl3PA8bZxt6RNnM7ukFx2bgJD/C/OZQH68yYp67jsN9b+VQ1AKIJmj
         EUCciXYuZvvSeguIWn4ccDI/okQnYhIS8XerMB9b6zuWN+MtUIQrkM7MsCi9C1ku6ueC
         diyiQ1tIrhaBsaENJQHHiCGpRFkRQ6/oDc85BzLku+fnqi8iXdlMEX9WmvNQfJbAIl7H
         N+BF9kIieyflxd7xbcUd+5/qVavIIKY6zXgCEO2MbnNhhyFkKzmeXeWFhELVkEVctNa3
         D1+1yFpbHgF9tAE4IoXksqgPmNCUAo/pFBYjRwTzTTLnH3rTNb0jLFgxYN7kwyVqNdwq
         f7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782215031; x=1782819831;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rv1hQEHAcQj6Aub7u6JH8fJsjCG1ILRkkbQwG0SXkVE=;
        b=eEj0FdLPhybpc9aUL32EO/owKNrGYGgWEjuatcCynrBNL/blXlR/j3dxt/Iyy79W67
         vvGEzf6P6SAmNN8UyI3JqRa+dmA+JzbZV3JZqOUMeeL9unHh1bH3lERbM7FB4+2bRr22
         ubeaJobU9Oac6zrEHf2hKtClz5t6oMJ9GFlZBmXYJ53/4DGH9Nc0tHrCDtdUJYKXahT0
         2fnx4PphCJqFW0VAIQGdFu3/QCA+5tNQVZ+xtuPoh2DKr0H1upc9eEBXt/hJeCOdyo9y
         8AFSS4WClgZnk2DpSsGb7MlegYMOHYVgxmeMiRckE0YVwZERKcPCaG13sXE+zxsrJNdc
         c8BQ==
X-Forwarded-Encrypted: i=1; AFNElJ++i6QA5zNqGTSJ3HlkCw5/hZD+uW8Cgz73ueaTR4K+jMHWt9HRviEklIi4jiflat+IHQ7BNBP+qfWg@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1XIZ6HK62YHvoDaq5AvHcqKOuhMrkYVa6uukDafzVRUdDbIZB
	82dcan0XXIQFwD2bqhQJKyxpdCXKG/5BQTZsApKR7WG1u64+49771/NDYug4ZNXNDFSiwYBWnGb
	2AjHzw8cK+QmzpxsOn3cxPMicFpSUz96C/MBcz+jvfv7p6+Pndm9wi/nztEY/6lJo
X-Gm-Gg: AfdE7cng2FoPmOXwTLjZVqAhp9fgUJue/ctBYGW5bwpq/ei4gjwNGBoLoJeAOojNGWH
	0nX4RPrfmXzErliPsf6QpKhpMHTG+nXC7YhQK8xR6mRI4C0mUQIZlkh+e2oXSfGMjN9r/vLSWfJ
	MUVvdqwJ7U+wMN9b49IjEPnBK194GpRDvdxNsGhs6u6NKX6bSElzB0nzbQ7EgkzKu3HtRI2jmib
	TYAfOL710kRjOaw4ZXM3Hyy7OLYeROQ00ZbkbJy9rNBQvo+pwqk8bPEZslNJUUqanTWJ5iCxQG0
	aR2hqL+khiVxdYHfQfOU6zRRmxbPkhJGnF2/UH73jLrXIM4C+t/yCYdeabowQWNtBkTTuOtI+cH
	sI2dhCB8he+mwFSiBHnbzMq9xyR3z+Ieb8Ho=
X-Received: by 2002:ac8:7d91:0:b0:517:5e32:f3c2 with SMTP id d75a77b69052e-519febcfc63mr146663721cf.1.1782215031565;
        Tue, 23 Jun 2026 04:43:51 -0700 (PDT)
X-Received: by 2002:ac8:7d91:0:b0:517:5e32:f3c2 with SMTP id d75a77b69052e-519febcfc63mr146663481cf.1.1782215031129;
        Tue, 23 Jun 2026 04:43:51 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977be4b9f6sm4376257a12.22.2026.06.23.04.43.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 04:43:49 -0700 (PDT)
Message-ID: <3d24b1bc-baca-417a-8f60-a060cab5719a@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 13:43:45 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Fix disp_cc_mdss_mdp_clk_src RCG
 stall on Eliza EVK
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260623112755.317180-2-krzysztof.kozlowski@oss.qualcomm.com>
 <de941d2d-df5d-44b6-b95a-437e35917cd5@oss.qualcomm.com>
 <be95b95b-dbcb-4b80-94dd-a7e97ef4c446@oss.qualcomm.com>
 <6ad8d604-b04e-4f24-b616-980f0e18b4c5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6ad8d604-b04e-4f24-b616-980f0e18b4c5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5NiBTYWx0ZWRfX/AQZsey3vMb1
 6u4ZnKXPU3BTEMZtRPhtlE3GnzpFphWY8lltFpiTfTvNxZDA9EzgNkMRbJkaioKJ+klNLAtjQis
 om/FS265aM1RLX0rMKsjkPymHU0yYwk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5NiBTYWx0ZWRfXy3NO+rogom0p
 RR2C736zwtOb37fO2HKjLw59lZlHizltftougZI/UFofoRbog1x4Hc1uQw8I8tTLdosbgTJmVdV
 xKNVwMZPrJBtmw9ZgVeK/gDZMGg0YznnyGbF9Q6UXFrM7S7oED4G9lBkdqDXaiMBUZU2Aiqw7Le
 Ao3K/AhwES8DVO+mScRBbxcyako8LdQszaHj0TyXomq8x3zWWx/U6Ume6wroRGiArKr3gS/XeX3
 Phk8bSNFS4VutCDtpyBIc81xdCkIU1lyPMSBHizw18Q6fS0n21EgkbuuSw1azX6WKYjKSGgnS9l
 Rfa6oGWIuFlo8zyw/LUDYCFJyhu9JQxgiY8YhZid3QGDVW7c70eK14VA2QjWm8VMJkEsQtnAnVu
 034zOMphya4xd4Q5dIQDl2L6YjO7WMY4XGXNEOYkkTtIJZpFUGdzsyRMsU2cImXVDQdDu/k/Gpk
 RHIofPZJEpld6bMHV+g==
X-Proofpoint-ORIG-GUID: XYzIPAx0WSXR7be6Tz-A0ETAVyLWxazF
X-Proofpoint-GUID: XYzIPAx0WSXR7be6Tz-A0ETAVyLWxazF
X-Authority-Analysis: v=2.4 cv=eN0jSnp1 c=1 sm=1 tr=0 ts=6a3a7178 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=XyekhbN6Ike5yq1yYGIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230096

On 6/23/26 1:42 PM, Krzysztof Kozlowski wrote:
> On 23/06/2026 13:38, Konrad Dybcio wrote:
>> On 6/23/26 1:31 PM, Krzysztof Kozlowski wrote:
>>> On 23/06/2026 13:27, Krzysztof Kozlowski wrote:
>>>> Eliza EVK (eliza-cqs-evk.dts) does not have display enabled, however its
>>>> Display Clock Controller is enabled and references parent clocks from
>>>> DSI PHYs.  Devices which in base DTSI do not have all required resources
>>>> available (e.g. because they are simply disabled), should not be enabled
>>>> in the first place.
>>>>
>>>> Having DISPCC enabled without DSI PHYs causes clock reparenting issues
>>>> and warning on Eliza EVK:
>>>>
>>>>   disp_cc_mdss_mdp_clk_src: rcg didn't update its configuration.
>>>>   WARNING: drivers/clk/qcom/clk-rcg2.c:136 at update_config+0xd4/0xe4, CPU#1: udevd/273
>>>>   ...
>>>>     update_config (drivers/clk/qcom/clk-rcg2.c:136 (discriminator 2)) (P)
>>>>     clk_rcg2_shared_disable (drivers/clk/qcom/clk-rcg2.c:1471)
>>>>     clk_rcg2_shared_init (drivers/clk/qcom/clk-rcg2.c:1540)
>>>>     __clk_register (drivers/clk/clk.c:3959 drivers/clk/clk.c:4368)
>>>>     devm_clk_hw_register (drivers/clk/clk.c:4448 (discriminator 1) drivers/clk/clk.c:4672 (discriminator 1))
>>>>     devm_clk_register_regmap (drivers/clk/qcom/clk-regmap.c:104)
>>>>     qcom_cc_really_probe (drivers/clk/qcom/common.c:418)
>>>>     qcom_cc_probe (drivers/clk/qcom/common.c:445)
>>>>     disp_cc_eliza_probe (dispcc-eliza.c:?) dispcc_eliza
>>>>     platform_probe (drivers/base/platform.c:1432)
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 4 ++++
>>>>  arch/arm64/boot/dts/qcom/eliza.dtsi    | 1 +
>>>>  2 files changed, 5 insertions(+)
>>>
>>>
>>> I should call it RFC, because this feels like a band-aid and should be
>>> fixed in clock drivers maybe. Eventually DISPCC should be enabled on
>>> Eliza EVK for HDMI, but DSI PHY will stay disabled.
>>
>> I'd say all of that hardware should be kept enabled, if only to
>> make sure that it's parked safely
>>
> 
> You mean enable DSI PHY, even though there is nothing attached?

Yes, so that Linux can shut it off no matter its initial state (which
may include "partially initialized" or "partially shut down")

> My warning probably can be fixed same way as:
> https://lore.kernel.org/all/20260622-sm8450-qol-v1-1-37e2ee8df9da@proton.me/

Quite possibly. IIRC Mike Tipton wasn't a huge fan of park-at-init
to begin with.

Konrad
