Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EA73BB100
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 07:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785396740; cv=none; b=bQBvD/Ghc3KKT5Rfdl3VhRE9z6tH6br8OlbqRtCJxnExBBUu6qjpW72xr8EJUTS7vwC8u1irR541Clg+fBxVqWEKlNT2sZV4Tjx2xd8wcXYtJ+12idO1Gwmga3VQwsAPnaj7yOVUS10Xk39czCfPVpaYQMzWfmLO5rqEwG+a6YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785396740; c=relaxed/simple;
	bh=T0es1P/bitIX4zrKG0XKjZcNMTEe6MDK6wPyki/v21A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j5oeSDFsatumogcCOO6BpDyEe2QlJ5gJVCCP3GZqhoVVn9L30hs0/R2+aPLfJDLpWesboGyH5Cc1qXucmS35n5+nj34eawREtne2AIHMpTuza1Oe9N6H7v054eufB6Xzf0vGfg9xqYCTdohVv+1Rm7sTQLWQQNLqSK3vSz2rBZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bVYJ9L8w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DrwG9fpL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bVYJ9L8w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DrwG9fpL"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U6aaSe4139701
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 07:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1V/2kuU7/xkS1hgux/0yw0TI8KeAdHTjjGG6KPdQZVg=; b=bVYJ9L8wfp8cJm9T
	oA+bmUPPPesUW0zZ9DXjRODl6ITADnZ09yr5PXc4xiIHs78HHmzeTNrU0RV8iN5F
	bXFLwKMuwb86wpdiWe8kH/TqGUa5dNAt9ljplB61rf5eP0BsmFFF0mMSaEw+gvGL
	cdw4a2PPTgqdhT12UgRA/yCD/om7botArpEvlPOJU0CtiHJCyKG8BQzmkE/VQZyS
	7q0mWwIzopi6yy49CdQZYQwAfcPOXnsC0KkcaKH6CI9AHvTMqzRtxNRFl93dppq9
	p5/+sgyE9/+enxyTUSzFAQR8iSsJXY8IOyLU58ZnUGWvqFRvuXIe13eHbSMKYrUS
	o8TIRQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr19gra98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 07:32:18 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ebb599e528so3553456d6.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 00:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785396737; x=1786001537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1V/2kuU7/xkS1hgux/0yw0TI8KeAdHTjjGG6KPdQZVg=;
        b=DrwG9fpLn6uV68n/e8E1PfWmOlaQWN2oLHHyIxWPWxOWpLbTwZ2apsMVTOn2WK+L/g
         tuOAzKQ3Y26mCtBFdxqpYd+9DaXGHnsUc9gBjoCz4pbK0VpLTHk71/XGQ2BZ70F7dnL/
         Zo/jGYJPY6Tn/koEQVsPDiQwJzo9EAnnC/AneuWCMunw+itqPjhpstQG5b51s6YRmVbA
         nWIh4V1i+R1yB2ZJjR8fYInkIt+m9vafkRdjJ0hc5BclnCZmwFKCyOsztHtUNhhTVcV9
         ljoixgcbl3YH2Jq2SR3nUIhWL4+1uFUOhXD4igD2FVR/F0SoQmYsA93wzj/S5By1OlPk
         ywTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785396737; x=1786001537;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1V/2kuU7/xkS1hgux/0yw0TI8KeAdHTjjGG6KPdQZVg=;
        b=Js7HE2B5Uib/Sl5aJFlPrtCBSFQzf+k7b09n5JQri65s0knlJ9I9bxo3PtXqxX2PJh
         xq/VvK1mupEoXCf/31ErkXpAKI5GKRgNctzDKELsu78AiT1cMRj4Bnwz1YMsALd3Qq7t
         Cd1aX+R6pSe0nGQFnkHCXFGaeXLHyAWypw5gXPt6CWuVKdjX2BdQqW3Mb4/McZpH4JbX
         1nhtkla68laehFsD6Sge6Js6nRyf+V/UHt74ZgIS5m93HJp/wVcoZ/XaOa36esjAYzbd
         mYvRX4LZdhBmprlTjF/Q/HnXGOaDSrw1X3ICM+OLlSTrP6cUCXVZaYwJM0ZQ2bGE5oXI
         t5ng==
X-Forwarded-Encrypted: i=1; AHgh+Rq9jhyfGDpDPmYiuFENI9/BcPSnp+0fxOo0kjRBvOVte5bgbkSyr7M8B+ES47SAwjMNVV5DiPx1zhQl@vger.kernel.org
X-Gm-Message-State: AOJu0YwYtZ/IPB1ZikTCsAecThMqkG4z5il5Mdmqa3aqWaxCGWnbXkbs
	TZk2FfFqjTfiWdhTJ1ec5bC1/sK5CnCGvVLmlItXXVAgedFumUx/jbAy3lrk7I8NuyZCz+wei6P
	9125WcljZkG+R53fdvw+kBDQsstbRgqJYKq8FEpLDFJwiSnnxfo7gA5VRjVHXYWhY
X-Gm-Gg: AR+sD12WVq/89GRyUOK1X7OZ6Ilwl9sESOecyVbNEdvL8+rWwaIcB9+feEldiJbyLeH
	vYbxKb33bhPpi981mKBGTKHIJu0aCORIERegOOcNBCGzBTS6uleR1tsq8ySNuVSfFc6Uh8vXdVq
	nSQW22UWlt/Ril+GMTRRWceUdx5VEisL9dKUE/SsYPaKpgqprzah0/Ob2gv5nN25pPCaIbeumMz
	zXQdQLwfCIABXfyReyxiBS5gLs278+ITjXdD8Ep3whz1C8T/jN9UtxgRLvHSstv8geGOsHfIBQ7
	AdDQNAybj3THYUfmc4txePEEtf9cHTBDtNBDBcJfwdeNqQXhHl62vOsoperwqhyAT/XyusZADiU
	mQP/cPe1Amd81c6PlY6U+UJ0V
X-Received: by 2002:a05:620a:a497:b0:92e:6071:7cc4 with SMTP id af79cd13be357-93487207edemr188760785a.4.1785396737409;
        Thu, 30 Jul 2026 00:32:17 -0700 (PDT)
X-Received: by 2002:a05:620a:a497:b0:92e:6071:7cc4 with SMTP id af79cd13be357-93487207edemr188757285a.4.1785396736885;
        Thu, 30 Jul 2026 00:32:16 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa857c8d0sm34396066b.25.2026.07.30.00.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 00:32:15 -0700 (PDT)
Message-ID: <3efa9f3f-0bc4-439a-92a1-a9bbf6b95d10@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 09:32:12 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: ipq5210: Introduce RDP504 common
 DT file
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260724-08-dts-v4-0-65e61a1061f0@oss.qualcomm.com>
 <20260724-08-dts-v4-2-65e61a1061f0@oss.qualcomm.com>
 <35b14c17-2953-4b74-af15-4677390aec9a@oss.qualcomm.com>
 <amrxShOJc+bT9pjE@hu-varada-blr.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <amrxShOJc+bT9pjE@hu-varada-blr.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA1MiBTYWx0ZWRfX92yoqlnSnDss
 /J7kGyyxdUsy+BaoYbKtHADFK8dATnHxdr+pe3NW6FKXV6s5yaqRdKbhYANYnDfie41h/Ag/Xci
 ycjnyelrqnfREP6Lm1mmdbKh0+pNW0Tev3NWBZgdiQtXg+NbBmlHo0fP+RqtxGnVemPhHf7E9DJ
 s/f2EiZrw133zVX29RK4NmWUKNlMxq5wJrRAgiqsBzPvtmFrf2KVwfBO7BcdQbxfYnackqAYjO1
 ut1bXCz/WvFjlRJcPNmTN629X+4bZzuRYByxOyz5w1U1T4LEMmywinx3BR+14zJWY7CW/6WuqFs
 Lpr20/tqxOb699zMli+WbggqnwUIz6ON9EkG9lfJn24/2Ttrmv++wxbB4IbxEsB57TXhznjEI6T
 ESii4IA4OUyVlYI2C5CNKGHlqRvRV2QjEyFL4k5cqKbL2NsR6MsT5puseeoT/la928urO/khUmH
 kcz/409i0o9RdUV6AfA==
X-Proofpoint-ORIG-GUID: 3w4kRFb2IOcRqo6USVp9n7o86xYuHJp5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA1MiBTYWx0ZWRfX999bAkN+JHME
 to75Ssi3+FI/8jmnjRi/5nt7kTqRFkRx71+6dmPNxA/y+j8G12VgRdNGBR2XxHt/VWbf64zlfeI
 cQWu6rirqDIVBuGbkXyXQg2IXieEyAk=
X-Proofpoint-GUID: 3w4kRFb2IOcRqo6USVp9n7o86xYuHJp5
X-Authority-Analysis: v=2.4 cv=d7bFDxjE c=1 sm=1 tr=0 ts=6a6afe02 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=hj7ihxJC1nvnysMjlhAA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300052

On 7/30/26 8:38 AM, Varadarajan Narayanan wrote:
> On Wed, Jul 29, 2026 at 02:10:56PM +0200, Konrad Dybcio wrote:
>> On 7/24/26 11:54 AM, Varadarajan Narayanan wrote:
>>> RDP504 has USB, PCIe and SPI NAND devices populated. EMMC and NAND
>>> share the GPIOs. The board has to be reworked to change from EMMC
>>> to NAND variant. Rename ipq5210-rdp504.dts as ipq5210-rdp504-common.dtsi
>>> and include it in variant specific DTS file.
>>>
>>> Describe the fixed USB regulators, PCIe reset GPIOs, QPIC SPI NAND flash
>>> and required pinctrl states. Enable QPIC BAM, USB and PCIe for the board.
>>>
>>> Remove ipq5210-rdp504.dtb from Makefile to avoid build break.
>>
>> You're essentially removing support for the board for this commit
>> Instead, this commit could be:
>>
>> create .dtsi (90% of the current .dts)
>> add #include .dtsi to .dts
> 
> Initially did that. In this the git rename of .dts to common.dtsi gets
> lost. So did it in this round about way. Will do this and post a new
> version.

Try this in your gitconfig:

[diff]
        renameLimit = 999999
        algorithm = histogram
        renames = copies

Konrad
