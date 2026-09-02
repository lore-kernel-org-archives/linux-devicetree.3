Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CBE3E834D
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 08:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788338813; cv=none; b=hiZly39m6nlAfhtIwyY0m/8nk7wLMXbvWZSJK2cYbnnGy/TWmDxr/s1N22r0iRAYr6oN9sXw+aDj1rdISlP1nj141R5sGd60fhxGySTgu8GaiNYdBqSFe23gPQ7oZr3LjWj/WChCmeWA2VTDSDFRRpuWKV5Ue6kUBebpVOfCuVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788338813; c=relaxed/simple;
	bh=pjKHKY/7dk+MEWJF4cjV5fozlLxg++kp+foLwZ0lEFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MpG4qERdjNeMvAVr+HNHM3FIDQ7VgARA30dLdL4xB1/Vyw1T1MTFUUB99Q86Gs9hpx3T2DnRFURi83gs96E99mapCLDBxh6NTx7NchXc1u1XzJMNKs9mWVqrN7OWOsOjIVFgL1Zz2fIPPfOMDdhO/2qEBbKPqgWC3FnYL+uShjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Te7QxGIq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MUgkV0iR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Te7QxGIq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MUgkV0iR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826VWge1859311
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 08:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yWAwr1smx5G37cCcGObS8HBICH9bF7+jGSCJzShr35E=; b=Te7QxGIqeNWN0nZg
	ujfTMcuJSwyxPGFhWkUXvtcudiwoeVuA1XrXm9X6EloA9hx819tM1mw6Wxr2O2LG
	RdM5e5soQZTKO9DVl4+zY1u8JV2sU3S/c1SEEbm+E/GeyAkus6haAep0i2ZLXocj
	prTkwKqEjGo01Q8kfdsW+kP9R+jmFOS07MUdpqrMuXy97+7CDWVdvR3nnrv+uML9
	qkR96BXCf8/+IPXjhK2roUI4AtRj+GbihDDkqgwoAOFhKSuXuCpPV3wMQjGVykmj
	X/J53yQkvdxyzpz4IAt7VIj2S298BWyafnFxs1E/kFAWnrrjlY9TpNMbrf8H+KL1
	p6N1UA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge8whhnhj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 08:46:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930bd2bfc45so26401085a.1
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 01:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788338810; x=1788943610; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yWAwr1smx5G37cCcGObS8HBICH9bF7+jGSCJzShr35E=;
        b=MUgkV0iR84n49rq15z25h4e0bC1RRlzfiGclthWAI0lC8SGHtgXFBGRtebcxbS6Edk
         ZtKJXfrNdHl1B8xeFr+TF5p2kJsGNYbW1Ct8dFXUzAPJu2lfwUT8xRI/qkNwOTEnkuT7
         885/l/l+gKbDq0HSLmU7FM2aKFoFIuVkeiUuB5V5rfjH+nxI7fDKM9sf01QtW6t5M4PU
         +nCOqhBjXonE+BqhGuUbjzkbpgbjpURmu7fh/4NTb6d4mmhtpfPCVM3nA+Zz+uPOqX+i
         lCoXx02KVz2MZXYOoQcFWtFQBvrHexx5r3wAOyONomErQm6Dwd9tWZRgdWaGT8UDaeUs
         DWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788338810; x=1788943610;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yWAwr1smx5G37cCcGObS8HBICH9bF7+jGSCJzShr35E=;
        b=U5Hq03KsTU+1iWfQlZN7XKgJf1loAeLM7/FFLPT6NPNrFwj3GoP/Nqyj6fH54mtVkc
         +Gk7HxubT3chPSn8L4JBj/2c7zll4bnMn/YBV2gOSPtS4wBQI/QC4fpx6vmNFz+yXjKs
         weEDGtG4hcrCe2A4a3Ry+62PZvSGn8i7WmbJKDJd2as2AZy5NP45DHXE62ktZ3B4nVqk
         rCXqRWH0YImcAqyEwnH9Npad0z4ppV1ES+ciFFPptcmXQcvLrLyW5JEo5JjoR0vtAUon
         gzBgbVJipAIvG4kghiCkN7m4/mWaziI0AF1tJd4lOW0A2Pd+OjLqedyO2LDgSVLuKNMM
         PFIA==
X-Forwarded-Encrypted: i=1; AHgh+RpyLfOUdvw+7nVtU5THEXCNReNcDKIB+6GGykTZbstmvibIJveI02X+ubHjuyTop57cvYqPosUWTAOb@vger.kernel.org
X-Gm-Message-State: AFuF++l5yK2jF7PjXkMQWmEM+hQ13+P80kFXDevM9UiINQWbVhqbWBSu
	1XKn0Ba0AMlhyovXFKbHtgNxZ5PHVcdkW6lVnn77Wx49z8+D9M0qCS50svDBPzzE648sXtmmc4k
	HtTzuoplR07jFktKepNGSFq/VuSw63W+OYLQfxo2GkFP0Dw6MqL3CkHuxOai2rz99
X-Gm-Gg: AR+sD12CccLgjoToBP9m7GiVoewPxR6VjRAbl7JJf7/Z6uaS0de83B9SG6tu1No6oNo
	nj62gfpKOeLbwsMzfO9BKaCh+2wauyKDOGE7QgGqM9L4q9XMBScNtXH3HkYGZ30kC3975Ib1KJb
	nAQ3INjk9SwpqIihl1cz9hVwEwj2c3xgforNs3Am+FQ5yo6S9xTJtWUTdMXxEePNKODZX3qkXOO
	giQyWCubZEImB0EiXQ5TOR5iwj6nPF/bVrYwXdECxR5J/OyYaBJZmRey2mVCOe3ReJp7U7AlWbN
	T9JpqjOA2niw94g8p2QbHywP5RtJWWNdABKFawOwLmNfm6nB4rN68w0rRp6gD3WIgUX/bwGU+XZ
	02oF0sLY1ElEele5sfTHJ/A==
X-Received: by 2002:a05:620a:400b:b0:939:46cb:25df with SMTP id af79cd13be357-939611000a9mr217654785a.6.1788338809656;
        Wed, 02 Sep 2026 01:46:49 -0700 (PDT)
X-Received: by 2002:a05:620a:400b:b0:939:46cb:25df with SMTP id af79cd13be357-939611000a9mr217651485a.6.1788338809155;
        Wed, 02 Sep 2026 01:46:49 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25cffc68a2sm92433266b.11.2026.09.02.01.46.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 01:46:48 -0700 (PDT)
Message-ID: <e03f3b9e-e98f-4505-99d7-1bcafbc384b1@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 10:46:45 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] PCI: qcom: Add PCIe support for Shikra SoC
To: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20260831-shikra-upstream-v2-0-406661d75afa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260831-shikra-upstream-v2-0-406661d75afa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fLkJG5ae c=1 sm=1 tr=0 ts=6a97e27a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=x6ikuqDAs4aUxygX8wUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: oOCR9Wf2e4nWIOu5GYgyTk9yY96K96aG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3NiBTYWx0ZWRfX6xaw1dEYsZiJ
 eNqj8Mflj2fJmQ2dXVKjq8cRIShvwr9tN79I3rihjcvr66UlB2SWOtMAY0HaIRT5an9HDQHl+Iu
 WdD+Na9qixVFntfYxLDWgKIRj+GSNFp5Ry2FoqExCw1jbFjNqpzTWPBwBYqUlAHDs79Ghg7stnU
 2eEoTMXJsqpm4Xe5dLPLkCPCuw1n6Sob8/ASt0dDTFc7W/VQb1R/pWiObcDEvtpwZ++Q2ruLZ4F
 ujAmUGOlqZR3xAiI9HJsAJRHyMzcmWxTxfMOp76695qTRa9Mlr4BNcnQJXmv9Pc2KSeBLm+e9pq
 F2xOMY16Ym4zCdBb8rCX1VozZKyW9M6QLiVNPFd510uoIwzwt9s7O1i8mpBEpLOrutg14nMpSKp
 2/VvqfRKVZH0MUlu4bwWd+cWKb6RxRn6FiKDnQa8yw6KddtKKcvyV03FRusppCOKkGPlyPY6G2D
 pCd7hxR79JJRLOaLgSg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3NiBTYWx0ZWRfX+U9DU1TFd15X
 lwxl07zahMTZEo+7cXjyJT+xgAibTjjjVWIFGimfVAMrY4VrO6y+LtDA/f4jcdutQ+u9HhBdn+h
 jauV2iomtsaZ73lr4Dn3UG1admL3GGU=
X-Proofpoint-GUID: oOCR9Wf2e4nWIOu5GYgyTk9yY96K96aG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020076

On 8/31/26 9:26 AM, Sushrut Shree Trivedi wrote:
> Add PCIe support for Shikra target, by adding dt-bindings for phy,
> controller and corresponding phy & controller drivers/device-tree
> changes.
> 
> Shikra RC is connected to TC9563 PCIe switch on all three
> EVK variants: CQS, CQM and IQS. The individual downstream ports
> of TC9563 connect like below:
> 
> DSP1: M.2 B-Key for 5G Modem
> DSP2: M.2 M-Key for NVMe
> DSP3: Embedded ethernet device
> 
> Power and reset to M.2 B and M.2 M slot are controlled via
> TC9563 GPIO's. Since TC9563 GPIO driver from Alex is still
> under active review, current series only contains basic PCIe
> enablement for the controller / PHY. TC9563 enablement changes
> would be posted as a separate series once the GPIO driver is
> ready.
> 
> [1] https://lore.kernel.org/all/e2inl7k5gsjj6oomv2k5ximuzpb3gfiz66ufet3b4hvov7zqt4@qz4pifbos7yf/
> 
> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
> ---
> Changes in v2:
> - Remove TC9563 specific changes [Mani]
> - Fix commit descriptions/subjects [Bjorn Helgaas]
> - Fix PCIe controller dt-binding errors [Krzysztof Kozlowski / Mani]
> - Document PCIe Gen2 limitation in controller node & commit msg [Konrad Dybcio / Mani]
> - Add GCC_PCIE_SLEEP_CLK (which is actually PHY AUX CLK) in PCIe PHY
>   node.

You also silently adjusted the OPP levels in the DT patch:

< +                                     required-opps = <&rpmpd_opp_nom>;
---
> +                                     required-opps = <&rpmpd_opp_low_svs>;


is the lower one suitable?

Konrad
