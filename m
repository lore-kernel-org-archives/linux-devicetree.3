Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB34413D76
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 12:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781008695; cv=none; b=RaYzBtJCvbH6AKUZFhe6Cl3RvpJN+JYn68stZ7vaMAt/2L6UHYkEzj+lzLloQZ+3om+prNPdPnd8UgBnC2TQ9T0y6N5C8e5BhGX0MP0Dcy7BQAdRGr54FgN7ODOPlfnOaQY9YDX/Zi8KWc9ek7l+DonqQ1GtbqIaG0msnKUxvCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781008695; c=relaxed/simple;
	bh=mRigYsMz/Vz1sevTe6C/YeJI+ZTCaQr7OOMfR1RkZx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C4BqG0MhpqLmL8FpwGbTP24OtqyzYTnw3W7MEMAARI/uey6RwpvOr9fOTyTz1VI20rot5Xoa+XXcT0dbMIcFLwwrU18L+DCe0t4QhM4iRlJhOprqFCzoHtx1gyTrN3jpKot7W7iaziSxra1pCtMh5rHUPq/XQsZ57Y2rJpYxA+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YZFeaw/a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ah/X19r5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YZFeaw/a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ah/X19r5"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659BndYN2155570
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 12:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SxPEQW6F7iAG3Vm1VHZntU8xGHPruOwa/hNoZljcUiU=; b=YZFeaw/aOXFI6/Po
	ZJB4LKmVfB3UXxucNHCzwUlUdadVODlnA9gmYzlSIZW704lKc2MnQiqi0zXxJYuG
	a4XkTarBFqPpxYdLoU+wQeeU1djgLp6UIowZvSpew8iOK48O3sITbgmaYAwhiRDx
	U8c1cD8DGrfTT3YzzZGFdj5b+9cib4NdqmGlJwmFMEFor7nj+oH27KvBujkZUWsb
	0EETFvLwS1QBdhN3c9ksibXR7YhqqPDrj4AZuyUc9QqN0kGe1oHrzhUVhhv2wa99
	erYtxRAw6ZS4DSik9FxCHtkWIQjm/VWr6AOhG73EajrRQ8/xZdLjzFHHrHbzO/2/
	Zm9pNQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3jrsqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 12:38:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5176ff55dc2so9063221cf.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 05:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781008693; x=1781613493; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SxPEQW6F7iAG3Vm1VHZntU8xGHPruOwa/hNoZljcUiU=;
        b=ah/X19r5Zx+R+LlxG432xjlsZzmzixUphOXANjTrqj5/WWYAdmoEZndN2Yp1exl0ye
         b+LTj2itUXvnZFihkEshIbg5pqB0+rjduyIFdza0D273lEv0iqAqXAfx6x8XvHzeHd7v
         o3mYq/CCz5tUF9RkGIZe1NC8X4HVU1jSGZcNlcWgnN4EQGvWwRgMnkatNmFWT3ilNJbW
         Pigu8bn9k2hjpTo7EIEnRoIBs8NC8VK92UUfFetlputsa+UjU+pxfHNhnTxggy4ucO00
         cjQkIdiMnd0qbhTKihGm1hA32sVwIWZe+luT+jSjN2ZJlCoCgkw1Ezee1yxgisBStzQT
         3s5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781008693; x=1781613493;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SxPEQW6F7iAG3Vm1VHZntU8xGHPruOwa/hNoZljcUiU=;
        b=XW0BnHb3iwqxUwTypisayyxvM2XkneMZ0hChhDNvYsNV4TmqdLVTBUY9u+eZBs7Avg
         W8Pdmy/lQHB7ru2bO6B6nbd2k7/SJ0Gkfegp+jPYlKs4lOrwWRXvSSXKZbltww9JC7+6
         sx0Fc5yKaUl7rX3uvlhe6VMm4LeRrVB2Fy+AAs61JnMJShRrBp40rE6vVWqr6ZxmGghA
         3DvZ29i+TB2ITS9L/6WpiMxOQrqoDw1/Z3Za95E/b1FZnTJAJu7fVPYM4xh9TtguyICc
         8d5KITZrADabqihWoHj/TR4/0H6gnnDPpurc0pggkdRiDAUicMuSkDCosKGUuXYz1iU4
         u1vg==
X-Forwarded-Encrypted: i=1; AFNElJ+DAxorFFriNgkEYKgLRsgtD+pxfirmA2junScQMxuHkSMU8bpRv1nDPMooNP4S4MfACia5Umm9zuDU@vger.kernel.org
X-Gm-Message-State: AOJu0YzmtsGoC7v7Lns2PIzSWQ9/s9bgEUuFexAhErYHGiw1hW3e7+Ea
	3IfU+r4iZPn1wyezGN9eTrYorXfV4Ha4MCCoRwKARFe0ucpzMKljFUimiBaptLaHz8n706/3jf7
	tEIEjYXou3hwYhcd5+TS/15TiMe6IKkdGdnDqNdDc1Rwxxts2K/LM3L8yG7GvrOzJ
X-Gm-Gg: Acq92OHGBSs1NGHRABIeHo5sR2neY0Jd6+xXffvppdeoyeoMykIKPB7MoAxBsqaYd47
	ErrKtMYdnpmsbX0NwjUuoDSlPUDHV0rIBvqdYTFUhF8pMJgeL0IEgITY1doH0Q4K7NnbLy0ip6Z
	HRH8ItblQ6q550lvri1BuqZXgi4lD3mb/zRj3ZpcXDSolxGeqFyLwyX87ZMr89SYV18qMcyKwx0
	0oH7TeU6Nsg+1HBMJZL9X8Rxh0at1A0zdmi0q4HM3MqZD9SbckXZmET6/LGaNzvhEYIGSzzrluU
	xyta23d8d5zUSQ51TT5FZaREiFcOsuRaP2ISYAFpfMERfUqpymV6zsp00KMPc5IRWHVFfLFQ7Ug
	EJ1jsPOyzBYI1yK4L74nkkixwoQy4PU1/I2pedj/nOkBcXVorWpnZ6hm6
X-Received: by 2002:a05:622a:93:b0:50e:5e6a:c7d5 with SMTP id d75a77b69052e-51795aa8074mr167158861cf.1.1781008692649;
        Tue, 09 Jun 2026 05:38:12 -0700 (PDT)
X-Received: by 2002:a05:622a:93:b0:50e:5e6a:c7d5 with SMTP id d75a77b69052e-51795aa8074mr167158511cf.1.1781008692089;
        Tue, 09 Jun 2026 05:38:12 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051c85e76sm1053734866b.15.2026.06.09.05.38.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 05:38:11 -0700 (PDT)
Message-ID: <034a70bb-43f7-4b94-8a85-dce466081473@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 14:38:08 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] clk: qcom: Add generic clkref_en support
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-2-ded83866c9d9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260527-tcsr_qref_0527-v4-2-ded83866c9d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zYbklbjF8bHSi6yEg--tKVZyAa3X9uF1
X-Authority-Analysis: v=2.4 cv=aa9RWxot c=1 sm=1 tr=0 ts=6a280935 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=4hBvweVN3K0BpMZFuekA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEyMCBTYWx0ZWRfX9nQUFNL1iW8c
 NaF4zBFndO6GPeTMalaVzpmkTC8PGYbg5V3myIUrNHHAebQ1p4v2UZsq5YGqU4a+eNbde7/MuVN
 MRjCPuU5AQJp9/YO/QT387zIxNErizXbXEZxXSS90uT9mFDGPuSCBN4wMxmOxLR+emm6eJm2zdM
 ozV9dEmFGbGyQMjLnO01NvTfKq1NWTwCeZtdcFSCQQc0Lv37R086uUWeKrg/rigN5DsXdZUyh3A
 dQa0MzwSyDxEahBDq1gHwrdZHiuiXldwnyq/GbYf73BUMMa2+6IPNGdT+siUdh8KbEMQa0P2jXF
 J+oavfFUXBE2yi6orogemnBuRF/2k3wVylgk4faxZHaLh0D3QQc3jUIdSlQ5vauRAjyzmjf+kfJ
 8S/mG/wkegWsRpLeCiiTVUrI8KvbK5438X30797eSEb7ig1u2hm47n+n1COIs7kzvvUUo5weoFW
 5JlEvc/eurmVTQk2v1g==
X-Proofpoint-ORIG-GUID: zYbklbjF8bHSi6yEg--tKVZyAa3X9uF1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090120

On 5/28/26 4:29 AM, Qiang Yu wrote:
> Before XO refclk is distributed to PCIe/USB/eDP PHYs, it passes through
> a QREF block. QREF is powered by dedicated LDO rails, and the clkref_en
> register controls whether refclk is gated through to the PHY side.
> 
> These clkref controls are different from typical GCC branch clocks:
> - only a single enable bit is present, without branch-style config bits
> - regulators must be voted before enable and unvoted after disable
> 
> Model this as a dedicated clk_ref clock type with custom clk_ops instead
> of reusing struct clk_branch semantics.
> 
> Also provide a common registration/probe API so the same clkref model
> can be reused regardless of where clkref_en registers are placed, e.g.
> TCSR on glymur and TLMM on SM8750.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

[...]

> +struct qcom_clk_ref {
> +	struct clk_hw hw;
> +	struct clk_init_data init_data;

We don't need init_data for each one of these, we can construct it in
probe scope:

struct clk_init_data init_data = { };

init_data.name = clk_ref->desc.name;
init_data.parent_data = &qcom_clk_ref_parent_data;
init_data.num_parents = 1;
init_data.ops = &qcom_clk_ref_ops;
clk_ref->hw.init = &init_data;

ret = devm_clk_hw_register(dev, hw);
// not needed past that point, __clk_register zeroes hw->init internally

Konrad
