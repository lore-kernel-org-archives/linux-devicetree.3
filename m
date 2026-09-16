Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B254F796D
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 13:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789565223; cv=none; b=GLW3q9xpmKc792jbacCts56gyOHFSYsxD97jxh1MxSR2TpqAI7p+k3TrNwQqFffqYWJsOjxlfUR9WSgEXcfomQPQZd2ekajGfN6lQoR9tDGrca79DC2+0WYVACf+Ti+x4cL6Y/Az7pCH8GqFyI92wPudNxl85PajzlusJLXevP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789565223; c=relaxed/simple;
	bh=0MVH1UVmAUe5/J+L/Yf6YJo56Lmvi/jOR7Pmv6KXqjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fqqx0KJcDI6slDvSiy33whEJEqyK+u/Ya81N+By9/AMOaa+TcrCWdqM2IkSGAHqX616KVUBErDGtrZFl9iK7ijgfnyDygcEUs/ohKBXX2ISrCi2PJBSP3fuiFEfBSAARLcD59ujC0Hz3kqtyoXY5mIIcRs0A7FV8wwtBxxO5IH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mdcQP4VE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dztp3BoI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mdcQP4VE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dztp3BoI"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GCYYap3636724
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 13:26:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4MESC1KI0wX6qjB4s98iNgVKHGPJ6KH1ZIsZM1iGaT8=; b=mdcQP4VEcQ2YZ7in
	MjoGc0dkFhF7e1Dv5zwqOWromheFG07ioVoo3k3geil4jNO5TfeAxx8TGU5y1HZu
	2S5kA45hKqN3uVlAdvWOEDA9DjRfgC6bS+2GETOVdeEYfGkhVvztUVhxSV+chKEq
	aE7jNidhypXHnk9ChR+Bu4Va2f6K2fHY5rC9SO2LtcKQxPTGELynf+pImUOz6ax6
	uNenbmdMs/6J1dZVR4GqsvozYFJAuUc8Sds+eikKm5BkiFd4w4eGhgRT7Amyf28w
	uZnLSRZUXZZfz03+eOW7zJDFQeoF0qViAU0pyjG4nYDMV2oVbJNslXVNQqbJtX/Q
	KZejwQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqpu2sd96-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 13:26:59 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86261e66700so5262539b3a.3
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 06:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789565219; x=1790170019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4MESC1KI0wX6qjB4s98iNgVKHGPJ6KH1ZIsZM1iGaT8=;
        b=Dztp3BoIeZHfvXudcOEYSml0sUt+Zg6opESAKOF4Oq8OZsq825TGe1UWtZUb7/PNkA
         xBLwNguHSEkw3CYkoQmITvC4QqMg0KC3xdYPexA7YAVYUAMQfv5YBomYZAOVQTK7Nr5L
         K+aEvjGjQi2sh21RAWxXV6voNu7E+JJvLaYjbCxcbpDXdFjFnNiCZjPQf0+IhNQQZp2P
         n9kbkTXnG+B8NSoCHgeSeB6VPx5/qZEmIefy8XRi2hxe1SiVXJhZxGjUS4voNd+7KFIK
         aBIcR2+x0oFGJcUsouMhbHKvW7cqbYt3z3gTvNXiIfYF72tbhh7APK1qxDhCFIax12zv
         gDcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789565219; x=1790170019;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4MESC1KI0wX6qjB4s98iNgVKHGPJ6KH1ZIsZM1iGaT8=;
        b=PFxIEZrteCJbrfizfQEPXcI/ge+RrwJqDSxjQ5dfCHa3JGhyp7Qhc4kSM/l3O+KZLU
         oXQWgpVX6Zzf/J3ei2B4D9yrNl9w1hi8zJWLMfYjVYUofzBiBFeMiJ81Z4pVYdiCc1oW
         p5Olys68giwd9/YwmQqgoiPwCq9Cs5AI5jc+LZMIUPVZ4ESbe4iorp3aDplnA5R0Jo/q
         G/EXGHN/MZJpET4hwZq2mOXyo6t2dHyavgXnG5OmryJThNCJVgL7TaqdjXcgrs636hR4
         jWwPZXHPs+TM2bdEkqI7f3qC9k+Je4XaTDror93nZnGM2Gv1W4CyL7mtSv+ae/WrCDHW
         /zag==
X-Forwarded-Encrypted: i=1; AKwUvByNAj/q9v56W2li+YA9U/lEv/aZLPFvV/lRwWh8B0tGHnjraja8TW2FJdMyOdU7XJE9rc8mrYsEXaOW@vger.kernel.org
X-Gm-Message-State: AFuF++mvGry64yRX5QhECyjWsvxn9OOSg17I4WJAPKRRCNO2v1S4f9eC
	WYJTTmz0IX7/QUovnhorC0OEQtutrRY2Bal5r/9LOAP08yJ79WDJ/0akKzOPW52PHDJi85GmQax
	ga4MAhMboRrnvmAk2o6Vp0KdtBrAVw94neeqtARFRzczVQ6P39EMdE3cmaNWuVRvA
X-Gm-Gg: AYBFou2dWWyFITSkHNxHaTm6JfrY/tn/9z7ClTZu8gjBigGED2UkUojahmmMoBTaOWJ
	8EUbWj+gHtuewy+2ZPPav+zamng3GWuHOimX85JnrSKCif+PSuguDhKrlOKCO3SNMz+9DazLQCr
	R1zdBp0dwDE+CC/XUq9OI4uvrBIa5dTanSzNw665wY/IxI7bkoMoIlLiQrYQqZVs/gEgwNAY1yI
	hYBXf//f74KfB+YwY+Ouv82HZX/WyRyUYjlfLyx1zZmLKqCIJD0DWaKtTyKlkv3Hz17FXM0G4Op
	/FgpHjUuD4WiqVWnmkoYocslhFCosNXsGVLerXlVSIpzeYISrA4NTRsV+dJTvEa+c0/2SGmf3zB
	mEd3RXnLO43C2bBMjBMzywNYpZgGqO6Im
X-Received: by 2002:a05:6a00:3c86:b0:86d:c2d4:f3c0 with SMTP id d2e1a72fcca58-872376bd23bmr5119019b3a.9.1789565218617;
        Wed, 16 Sep 2026 06:26:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:3c86:b0:86d:c2d4:f3c0 with SMTP id d2e1a72fcca58-872376bd23bmr5118933b3a.9.1789565218017;
        Wed, 16 Sep 2026 06:26:58 -0700 (PDT)
Received: from [10.92.206.34] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87201d17e76sm1241562b3a.49.2026.09.16.06.26.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 06:26:57 -0700 (PDT)
Message-ID: <5f862178-ba18-4b27-b5db-1732d57d7b47@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 18:56:50 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] phy: qcom: qmp-pcie: Add Nord Gen5x16 PCIe
 multi-PHY support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas
 <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
References: <20260909-nord-v3-0-b0a82721c547@oss.qualcomm.com>
 <20260909-nord-v3-5-b0a82721c547@oss.qualcomm.com>
 <aqJFo3beKde404qd@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <aqJFo3beKde404qd@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uOD8qIih1HsEZKPhAWfhW4yLvmvdYfLc
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aaa9923 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=L3-XMscUPCAweoWNVT8A:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: uOD8qIih1HsEZKPhAWfhW4yLvmvdYfLc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE3OSBTYWx0ZWRfX+VQwSZhTRZg8
 OxtoVeRMO/04h7BYCeEAC1s9REoEEhiEkyva5L84yJSy3AtUUSdlonlc8vDcWBWUbB+ePypf59W
 hhp73BuVZfw6j9I3llxthhlujzBtTeupDsREuk2GYyWy3e8RR0wuygnkp81TXQByxC+Yn6fSRMe
 wwARnLlNssWi47uR+iKGf+w8sSqC+UZeSPxHnGg2+5PV3yVmEfycfpEUCU3PgyaEUWOxy0ty4rX
 VpiBWpo8fYstAzqNb/ie6W1iORiJSXxNKWKuM9tXlHZ6FfY4cH6KpFZQCfjjD74w5nXE7kmFJFG
 NUVMD+1U+EleQfLxzETGRGfpD7BZ/HDflTwDNoknQeMrxmRofp7ckoYU/hMZWGcnvTkXgdEsZrP
 44uriQnSOSS6pD9y4B0Ag3Mm00kxDbA6hiClMESI+3JgXjR4lPWJRmWU4Fn4XGUzozTIV7O3Ky7
 4XGFpfkgLbJzFgvPh0w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE3OSBTYWx0ZWRfX7gcULddLrofX
 ZaP5d+T51HEqJw/CAOd+5euYwCtBSSFfCAv0+dpGIVQLgxEP/MjBvumTNr+xs3h3i90LUcmmBqE
 2f3sb7YeHUPdXIVVWRVZRcmCaCums9w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160179



On 9/10/2026 11:22 AM, Shawn Guo wrote:
>> const struct qmp_phy_cfg *cfg = qmp->cfg;
>>  
>> -	reset_control_bulk_assert(qmp->cfg->num_nocsr_resets, qmp->nocsr_resets);
>> +	if (qmp->nocsr_resets)
>> +		reset_control_bulk_assert(qmp->cfg->num_nocsr_resets, qmp->nocsr_resets);
>> +	if (qmp->resets)
>> +		reset_control_bulk_assert(cfg->num_resets, qmp->resets);
>>  
>>  	clk_bulk_disable_unprepare(qmp->cfg->num_clks, qmp->clks);
>>  	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
>> @@ -335,6 +1067,20 @@ static int qmp_pcie_power_on(struct phy *phy)
>>  		goto err_disable_pipe_clk;
>>  	}
>>  
>> +	if (!qmp->skip_init) {
>> +		qmp_pcie_init_port_registers(qmp);
> Have we tested the patch on Glymur? As Glymur's cfgs have either .pll_tbls
> nor .tbls, so skip_init is unconditionally false for Glymur. Is it
> intentional to run qmp_pcie_init_port_registers() on Glymur?
Thanks for the catch, I will test for glymur before posting next series.
>
>> +
>> +		for (i = 0; i < cfg->num_regs; i++) {
>> +			qphy_clrbits(qmp->base[i] + offs->pcs,
>> +				     cfg->regs[QPHY_PCS_SW_RESET], SW_RESET);
>> +			qphy_setbits(qmp->base[i] + offs->pcs,
>> +				     cfg->regs[QPHY_PCS_START_CONTROL],
>> +				     SERDES_START | PCS_START);
>> +		}
>> +
>> +		usleep_range(2000, 2500);
>> +	}
>> +
>>  	for (i = 0; i < cfg->num_regs; i++) {
>>  		status = qmp->base[i] + offs->pcs + cfg->regs[QPHY_PCS_STATUS];
>>  		ret = readl_poll_timeout(status, val, !(val & cfg->phy_status), 200,
>> @@ -357,9 +1103,36 @@ static int qmp_pcie_power_on(struct phy *phy)
>>  static int qmp_pcie_power_off(struct phy *phy)
>>  {
>>  	struct qmp_pcie *qmp = phy_get_drvdata(phy);
>> +	const struct qmp_phy_cfg *cfg = qmp->cfg;
>> +	const struct qmp_pcie_offsets *offs = cfg->offsets;
>> +	int i;
>>  
>>  	clk_bulk_disable_unprepare(qmp->cfg->num_pipe_clks, qmp->pipe_clks);
>>  
>> +	/*
>> +	 * While powering off the PHY, only nocsr_resets needs to be checked.
>> +	 * This way, no matter whether the PHY settings were initially
>> +	 * programmed by the bootloader or the PHY driver itself, we can
>> +	 * reuse them the next time the PHY is powered on.
>> +	 */
>> +	if (cfg->pll_tbls && !qmp->nocsr_resets) {
> Every cfg in the file (Glymur and all seven Nord ones) declares
> nocsr_reset_list, and qmp_pcie_reset_init() only leaves qmp->nocsr_resets
> NULL when num_nocsr_resets == 0. So the condition is always false, no?
Thats true for current targets, but on future targets it might not be true.
I will remove the check here for now, in future if we have any target with
nocsr then
we can add it back.

Ack for rest of the comments.

- Krishna Chaitanya.

