Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604D83C0A0D
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 07:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789025359; cv=none; b=mSQqocak0E9TIGCDIDjxO6WHi0sFHXf31V5D7tX8VaEgdJbwUzeu8aiGWv2kqE52YpoFTTPvdvu507jyHhgfED8q2bOW9abLsy5FF2u08ZIuqVblW5JMYeqwvJCH56zbXWTyyzbCb4Q53PltBZFO/vHsLE2uRgA/X1h38YOvE3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789025359; c=relaxed/simple;
	bh=ubn8C0i/LhdZcwBCfJzPdJhodrnW1sUuabb94kkckfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ip6nChddeiMqrEq0Ljvo7hkpFWn2IDCdKClLU71yLsMHDbDve+h+G1j/H+G1U4BFhNLYYti4DI3DCOs3oUW8UAEg1tnq5QJjPK4he8kmXTlPQ5sQxa3yp1iWqKui6WlaNo8UEqAgem+/3gNkcRW5jnIPXNwpIvabX6xcLzI5pFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Aaj4bOj3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L1/FxC9T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Aaj4bOj3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L1/FxC9T"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5GZWD4187833
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 07:29:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6YNz9aQncJ1CZpH4BcRbIvGfWFPMmLPfprY8Gmu0G7A=; b=Aaj4bOj320dR5D6v
	wbaN3MPQjYF7rVVSxVaKvfBKpJ8GOJKqqXXmIuHRDtLeWXMDo2ruaBFkxynLt+SV
	WlPxz86h1cN95ZVKExJwIK0lO8gmcgVZWBjrjQXHfo+JnNPXlZrb5w4y06BzN55+
	1GkPASd+1H+uSiJbw8/tlJ4EPBoHGCxoTpPZknCodatO+Q5a2E8EsQJqpO62SzW4
	f/WKKolBeVtani6d48+SFbA1KX/N5YXpFy2FKE8lSCvVwuyXkxaZo9lMtdvioNiH
	THwvmmi5cDQBoM/b2ebZzuFHwZBmN2xjXjB0qPRfO1y6vwntHaV43ZmyJ9Yi/4Qt
	TPhYdA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcygtmwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 07:29:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52845bd815bso13378921cf.0
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 00:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789025356; x=1789630156; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6YNz9aQncJ1CZpH4BcRbIvGfWFPMmLPfprY8Gmu0G7A=;
        b=L1/FxC9T5PPvmy3n5uP/XnR+XBVrAKOQhS7wqG9WVaBrCBpBtHTsCc7xjodHhKal4a
         qQG4Fs9RZIGvPrxeg4UWVJwD5dvgOIqzSo+bYOH7QAJo802Qsbic9hREsPZ3iZav477y
         uoaGLMgFgXklfousNQk+oLBFz06vjAIJ8qTtK9YVlptmADiKeiFeN8GgL6RBTY+0uYRY
         eUUZ804IZ5imI4iaNpV/YPg3/13IQT6d77TTPguMZ8yyFLeD2AxA6tvn/bLE4vl4Hxqx
         NUT/Pl8wDua0lvwaFgyf/KH2LGFVzUlUQEKSZr4ULIEfSK28XB7SMtrzEA10sEiUekVX
         oDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789025356; x=1789630156;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6YNz9aQncJ1CZpH4BcRbIvGfWFPMmLPfprY8Gmu0G7A=;
        b=GD2tioCaj0ec82iXvCnEOK+CjApKVaQ3uBu2BoVmQuA639V6MmV598d6BTHV19cd2S
         RWDc/SpsVLK/KAponyXkJuZ3m3+GxsgWi6cIgFIrassB1Yr0qhSa8+JoDB+pZt2jEyrc
         H52F8kA7ISQysNKWEhvdLGYFcXE/kIrYehJzO4uNKqZfzkvbIi/+lBvv0VLESO1Kqbm7
         v4uTeDHJ6Yp5qYFho7zknLQXEb7TI+NZR+cBJDi3oiIlMb159RJjcBSX9FJKrBLYcmZb
         lFYO7nDZxhw+5IOx0Qhlr/fjjt3GCoR6xTc69bCVVMecttDiSma01VeGcWJzT+09rzj2
         NG5g==
X-Forwarded-Encrypted: i=1; AKwUvBwjfzKgtdXy4difYz8JRZmDLt4y7RQTuTyWGtge2m3l6WDYjtFveG8dKzE0nXRhxs0EoPFqkzjb9E5Q@vger.kernel.org
X-Gm-Message-State: AFuF++mhESH7VS4HV3roBmKcteVUByyUpOBbx0+EIQBYVjgb8vKnE28D
	urEdVbwEDvm7uVI1GXDWmFYl8KxL4KlnsAtJWZZcMhAWvyQzKsog7LPkB7pin1Sm1pHgZjQVMSq
	iaEFnbvU0SSC9QM6S+KvKY4zEgw/N3X/46t9pSrNB89/C4T/4/sEj480/iojR1lof
X-Gm-Gg: AYBFou29lOxrkoM+jxrJpyVe1E1aZ9nUcaG9Tioqm3CDESl46jykMHSUcOSqmsOQkNy
	5VAkVZ4WkSVqFrM1wA8oKGvxG+hkDohWvgIUrg4k4iaw1F0yv6pbMH2P1A4Hu13zTb6CHtxprsH
	zd9DJy/h56cUwcwhAqKKJ0vh+PSMj8n+etTljWRyzVlkBWnkc+6fDRuG1R1RnwURWZlpWfOIPmH
	KfRW6c5d78+eTynL3wjkwq8lahlN3KfvxGSnxTgqJ/hWM3AoRcmN4F1g22kvfYxNbAasQdmga61
	DUDL6SO37Ruqq1/IZNQBy3xBjSVDIw5ro9HwDXxd5i8ZDQdzwLKaJnX2r2TpVyaFSHW3xjDD+Jd
	QioGybmEBu9Q3qkmzlhiNXA==
X-Received: by 2002:a05:620a:4409:b0:939:8bc:8826 with SMTP id af79cd13be357-93991702d25mr3078276085a.2.1789025356648;
        Thu, 10 Sep 2026 00:29:16 -0700 (PDT)
X-Received: by 2002:a05:620a:4409:b0:939:8bc:8826 with SMTP id af79cd13be357-93991702d25mr3078268985a.2.1789025355527;
        Thu, 10 Sep 2026 00:29:15 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c28e9aec296sm586663566b.28.2026.09.10.00.29.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 00:29:13 -0700 (PDT)
Message-ID: <678b6d96-6a61-4689-afc0-363b7a6f209c@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 09:29:10 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] PCI: qcom: Add CGC disable workaround for Nord
 PCIe
To: Manivannan Sadhasivam <mani@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        shengchao.guo@oss.qualcomm.com
References: <20260909-nord-v3-0-b0a82721c547@oss.qualcomm.com>
 <20260909-nord-v3-3-b0a82721c547@oss.qualcomm.com>
 <smgyk5ray7laj2ltwnmx3r7cfiouj4hyn7tyfmx7rpsrhu7kin@p5pr7wdoprjn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <smgyk5ray7laj2ltwnmx3r7cfiouj4hyn7tyfmx7rpsrhu7kin@p5pr7wdoprjn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA4MCBTYWx0ZWRfX1oQbRAeNU2DH
 aOxBYwaC/Pm0wBtpHS87xA2/vS56umKmZdVkibQO6lZWI7FuTc+6655ir3PySW2Dm4bbEXVduk1
 NjCWb4DQuR/thdQEypn5+CnItpBeNPOE12s7nXDlGw2XZrT/xwtPgKykyvJ9g8zeiV7exRRkYTg
 wjvMWHiPdWal2+oWOnKOnOqpuyfOt7KWzzhLGHvOVZ8Z0EGyYOEx2Kdcwa47ConRLjc2sSHo8nw
 Fqxa1blD2jpm3dGCdEjr0Kd0OHyeBmNQ7rcrG5eHjmfG70/slxsXiEmgWpEFKJXR1EYlSFgk7er
 pGaIbAs/MOBSSxK/mdP6EEKbqtpPIwL/UI5gySTffphUWamriySsjijfK6lXU7ok4XwsMfNlv2j
 u7p36USn8KXZBllYixqkk5hIriWTC5js0Th/Cdg7++f2Q7OZH0V9jRsP24MEexxPeTO3tO4C4Zl
 fk0dK8uEFN3KdOfpUOQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA4MCBTYWx0ZWRfX3kkJiWks9Z3w
 gDbrLlTdXmecLlJqt60mvmUQISgQ7VMFJbBR8AFpHM9oaiKjIrpZJBShSZqwgT+Uzl4KrVdyrcH
 UVP1iF0G9C5HLKHlP/yk6dzGP8ByyJ4=
X-Proofpoint-ORIG-GUID: IUU_f4fXVf_b77s_X-h4UwWtkmWTdqc9
X-Authority-Analysis: v=2.4 cv=VONIDNPX c=1 sm=1 tr=0 ts=6aa25c4d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=XiBqvqFe6rftMWUyhawA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: IUU_f4fXVf_b77s_X-h4UwWtkmWTdqc9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100080

On 9/10/26 9:20 AM, Manivannan Sadhasivam wrote:
> On Wed, Sep 09, 2026 at 05:18:18PM +0530, Krishna Chaitanya Chundru wrote:
>> Nord requires a workaround to address a timing convergence issue in the
>> PCIe power domain. To avoid the issue, set the CORE_CLK_CGC_DIS and
>> AUX_PWR_DET bits in PARF_SYS_CTRL after controller initialization.

[...]

>> +static const struct qcom_pcie_cfg cfg_nord = {
> 
> Can you use DWC IP version instead of SoC name?

I'd say it's fine given other implementations of the same DWC IP may not
have this clock gating quirk

Konrad
