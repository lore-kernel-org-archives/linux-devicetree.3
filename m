Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9665427E5
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 17:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790702865; cv=none; b=lWPOFppz5lzvd7GPYOCR1ROT2qX9I1k3Q+u/9dONPLVCe4k88iIiUEO09rUvAs2NpKXl5Uiqs4N9LB6Qc+UmLRkDaPVPZxt1sxw8tjvhvJZIjWGUwCdRrfnG43rtMcEp3ZAmFIGpJLt3r+if3T4HqlqzpKew4eW8KvTlGudWsUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790702865; c=relaxed/simple;
	bh=XAr0ib5BIPLtsY2IvBczHBGu8cAfEMxCkyCJpApDgVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z2lD7LEd4edYoeo86nJThahVbTZJT1JQX19wt7UKYL3VWlx4mVZoV+Uq7X7BXfTdf93/Z/WzyfSJ4xq5tFJrQXcXihKup3wWCN8W8wQuAsXrGsRkruSHGajXMg/fUrNXbP5Vn2F9Ye+VNcjreeEvY1jnA2+rNZGk+AYA9Gct8qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b0PhfIzm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e/dMLSiL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b0PhfIzm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e/dMLSiL"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TFG4jV942201
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 17:27:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u3SUEE7AbKzsNjWqdW9tpkLCiHmZCXAa87H/nM0eXMM=; b=b0PhfIzmOk/QmqOk
	FVyf9GPr4FheKSIazX6ZpB5hFQNl6tKAh5GNR/d/ZVbzld3wLYDvfdGjOyQ3voKI
	XJfEGMIT36vPoGXzXRJFpyFaCryKIreS5dNbSqvqXRR1TsW+odAvrfpYModnZuhA
	dZDb6IvoP4Sc6Fk06dQRWW2Xbp5ITvRx3P4n94xXEaatFET1PQFBtZlq2xEvIpH/
	9XxzPTSFCkSyf4/AWpb1CxgjGQguInWfBvsNK5rYdhbQ5+kBbjEI7kXOh1lQPPzA
	NA6GdmQ7BdgKVKd9JLAKEPxGFoYWVT/utozk0x0IY+o1HAP93KM7G4qSUQdprqbB
	z1KXMg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0ftugkyx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 17:27:35 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4fc935a11so3203838a12.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 10:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790702854; x=1791307654; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u3SUEE7AbKzsNjWqdW9tpkLCiHmZCXAa87H/nM0eXMM=;
        b=e/dMLSiL/P+O9Uxgv2+zjBQhtYd9s11k3eJat1ql8/k9h2UgFQ4Upm6tB4TFuUKjOh
         xBUsIFQBYsYgMOCs2ZJq1RTE5aCXNPBb8xnCJw6JJxd9xQGHKvC34nEYrcdQldGFleMn
         9bhed1n8um1dfSb4mmrewuSfOxMbnkPVD6rJyA9GeC/OxL10egbeo3BGQ3ItomoxNgfl
         BduiZ5ijovTL+aSNwHflQzntcWrEpcBD2CSC8NEXwj+ySee5D3vsFiPG00XrCLdrvlKq
         R/GMG8DRC0+V18nhTECLloJfNXYDUE6TKmeU84u3Vt9HlFylVpNiTf+SC6+6NNCJZVLl
         2ZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790702854; x=1791307654;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u3SUEE7AbKzsNjWqdW9tpkLCiHmZCXAa87H/nM0eXMM=;
        b=MJudzEaZOaf/gs2Kj/VMtvsBpFyj5aL6DsC0133wK8WpYnX2IdMXlHIiUua+7ftuFf
         SRI74VOolUg8Rc58jknr9cY+fYi3LcyXC2to9NQad4mReYcQmCobhtfYPetCcldGIFth
         perWSv8Yt4OJMa4MkKnmXDOdSlLJ1pPXQzofAPe7g1a2Ia8dwOjgmPVhacXdiFfIeDUh
         vNdDfrsKPlqn7dOK3CKNzF5EvNOfNRhxiZWBeoid4nW5v1faJ+H991pI89sJQx9DdJAg
         a7NEAcbguEXezdL5unR1iTEfmVqviGyXKlu0bNg9btxU5MV73WAw7Ojd9JAeIAM6gCxb
         B3Ww==
X-Forwarded-Encrypted: i=1; AKwUvBykgQeaQsXW9virAq2GmE5V7p3DPudA07T7m0tf8MSC+9lAVY52uPyMQuNyrtRWrgT8/MZkUbJxah3X@vger.kernel.org
X-Gm-Message-State: AFuF++mcEXF+VYrRVDod3dyeb4Mc6oakTNaRGJSAV/6iZIpk+aK0wmAv
	ztyca692E3vfnSJIx+EKCbQGVhrI7LwcJrY5Y9fU2ohT19yIJICGNrrYVWM25mzHpIOiOMdtpo4
	C1LT8MX0vJKIgiaSzOR/NndwDru70vCaa1RG0Xfjeq4FW+V8QQqU0s78DtQMhGZbm
X-Gm-Gg: AYBFou2vkpYe8ph4pHJ3+0R4rDor4i7Cji978IR/Nol+QK9OTheh3LdHSStVuy0AtK3
	77S3Vv6L3J30MuFgvTKdChieZ54F/qoN/7s6+mDZFDr/k5Dc4TDPoJ34O1sYeCjDuMED+5CmVgT
	ZfHrRbc6q3gGs9oFzPYCLkEqg6weKCnSYzobDH4r1NjGOQLmq30dKnLTvSoQXfRfNbTLJ98P553
	LRBiGPuO1x3mjJkfkX4idhPsU05stHSwQ2GmC+YA17BwTNN6EGJ2BtZPREOL/pl/24ok2EIjGit
	CtvsDCj8GQRtlfvsnkNKe+lPPIP7ip3SnPBmYsQOsQzuomymhbOwE/IvzzovWZCDZ02lpY8VKlh
	2LfD8muHBu/c9a9aXnvhPpmympm7Diq6hqnpHOtkNtoQ=
X-Received: by 2002:a05:6a21:398f:b0:3dd:85aa:d26a with SMTP id adf61e73a8af0-3de0e7f02e6mr14024934637.34.1790702851335;
        Tue, 29 Sep 2026 10:27:31 -0700 (PDT)
X-Received: by 2002:a05:6a21:398f:b0:3dd:85aa:d26a with SMTP id adf61e73a8af0-3de0e7f02e6mr14024769637.34.1790702846060;
        Tue, 29 Sep 2026 10:27:26 -0700 (PDT)
Received: from [192.168.1.3] ([122.164.83.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8868c9d62afsm280619b3a.44.2026.09.29.10.27.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 10:27:25 -0700 (PDT)
Message-ID: <b77e8d79-fc90-4bf8-835e-23e84198a008@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 22:57:07 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH 00/11] Add a few minor enhancements to the
 Qualcomm IPQ GCC drivers.
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, stable@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
 <179065171028.2673486.10540547681271836423.b4-ty@b4>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <179065171028.2673486.10540547681271836423.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2OSBTYWx0ZWRfXyHy+qYbJ2CUE
 LcNx8CccotzO69fApRl/fHIB0PMqOYGbEUciYcQ1KJvaURRInC3bSrMQqX/lAY/sWcTRKFhkBrY
 PN58MLgJY3CVBQzHwP86eHQpUvTBd7Wec7CmXPnLoNIE6ApIHFlR56QJDURu/h3SdRLH65/Gws2
 dHkP6eoBaOfdG5ejUQHNghwnPvC4SglELlks0YKpzN7HsJEt9Lucmzri1vZD2ompII1ZVOG1e+r
 eHAveXYWo2O2l+ceSWWNEPMhtlm4qOROZfVTqOdDZaae9Hd0LKu9ycXx0rsyPzTXSnrqDkpbZkP
 zyfXxCR/EP1QI3hZ0f5PAIWJQpVDoona/HCAyGzPuol0755TqfUU5623R9A+4P//Y4WuU2E7Dlj
 Pa5OgUG2J4untfrtlgUaWakIGezulkiGU62AQn5vyCVc0gQu3pqU+2do6F64sTK117LnEbBx+vQ
 YH5tFT+tCtqoKQm7fww==
X-Authority-Analysis: v=2.4 cv=AoB7T+9P c=1 sm=1 tr=0 ts=6abbf507 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=1HAn/k65X8NeSyO5TsuCIQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=NSf5Sc59ZZly-qZ_PXUA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2OSBTYWx0ZWRfXxr+bv0Qxu6/C
 DnO5hCiBo/iliYj0Ojxl9w2gEcWntadRx/Q8ylIL7TDYI5XZD0QF8sgIxSTX282puEaLb38p8AH
 0YYLIyQBQiW2VZSSqZuYeCGZzczM8VM=
X-Proofpoint-GUID: Qy0-EjXlf3MDeM5HJA-9nv7DJSk99CTs
X-Proofpoint-ORIG-GUID: Qy0-EjXlf3MDeM5HJA-9nv7DJSk99CTs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290069


On 9/29/2026 8:44 AM, Bjorn Andersson wrote:
> On Mon, 21 Sep 2026 11:49:33 +0530, Kathiravan Thirumoorthy wrote:
>> This series adds USB, NSS, and clock-related updates for several
>> Qualcomm IPQ SoCs, including:
>>
>>    - Configure the USB UTMI reference clock to 24 MHz on IPQ5018,
>>      IPQ5210, and IPQ5332 to fix USB enumeration issues.
>>    - Wire the USB3 PHY PIPE clocks to GCC on IPQ5424 and IPQ9574.
>>    - Add NSS MEMNOC clocks and corresponding clock and ICC IDs for
>>      IPQ5424.
>>    - Connect the IPQ5424 PPE clock to GCC and document the required
>>      clock input ordering.
>>    - Add UNIPHY XPCS reset definitions required for NSS support on
>>      IPQ5210.
>>    - Fix IPA-related typos in the IPQ5424 APSS clock driver.
>>
>> [...]
> Applied, thanks!
>
> [01/11] clk: qcom: ipq5018: add 24MHz rate for USB UTMI clock
>          commit: 0fe2995196a5973e226f506c9ec705f0dccec82f
> [02/11] clk: qcom: ipq5332: add 24MHz rate for USB UTMI clock
>          commit: 33e6a4864ddc4824f8a9505a97232b7879eb5528
> [03/11] clk: qcom: ipq5210: add 24MHz rate for USB UTMI clock
>          commit: 0336b65aef4721edbc01073dffdf9bc12673f0e5
> [04/11] arm64: dts: qcom: ipq9574: Wire up USB3 PHY PIPE clock to GCC
>          commit: 117d8d40be1ded4f35f3252efa83607a7134d5e0

Thanks Bjorn. Patch 10/11 and 11/11 are independent of the IPQ5424 
dt-binding discussion. Since those patches are not bug fixes, added into 
the last part of the series. Can you pick those patches as well for v7.4?

>
> Best regards,
