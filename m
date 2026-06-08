Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326892EBBA1
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 04:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780893192; cv=none; b=b5CsBpI5TARWFamIJ9nRrein3ZKk1fH0GgmBNdJ1xU/TFdkzJfQrZg36gPCHotYCYdDWolf4WgU+/CAv2riHKhsAeufle8RJ2jTKV4jwRnfjYi92umjQWGBdFBOu5azsmAq+jqWk/FCuQHB31pqA10h4yM/td5kEm32rcHFS2vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780893192; c=relaxed/simple;
	bh=Qg987VOi0figFES5kOeFOQWN8LtqPBmVnc6ae66gcZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sGaUYUjB/e1ENNOVqR3CwO/jzOwTjBTWh95TrgCpGII8bxBsI0p66RmPQ4GC1LlA+Fe3pTsmsRaZdnxdktkqdq6GUg77Ahrp11O3VMpakJrDE7+di344bLX3Hnss1k26giiP2Us2juCdm3jy8VqDsoYKZ5syZuf+4xrMj4fXObA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZzDDMjgz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jxIlsR/2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZzDDMjgz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jxIlsR/2"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580E9QX1572112
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 04:33:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NaJITyHv9S/d+drDLgvU4Z+GSyOoUsVk5p/NMfCm5YE=; b=ZzDDMjgzI/oBj4+u
	vn5igPSFmnLIOBt//k110hYmNhb0prPuqOnKcTyB2wj+Mb91bJfCIjcqv6Zlao9V
	tG7lN6uQQMW+kS4TWe3L5jRUzNTJc8ZZ0E9JIkFiyTGJTK36yEi8pL99gm+nx8hT
	f3xpDyiT5Mqahyrb59n6zE1OeiMaNrH7Ehuit5c5jJA3Z3weZI0S9Q49iww0eGSM
	CETX/zsaSUiGD7eE10ONpHBKi2GUXtJC3WINu8ui/gOl6zZ4kQuIGNFIcYK8n6R2
	YiqR13R2VxGPkqhV4pdEV5J66vEICNG5p3CEbsfBX/XHLIBbhyi7Do52gQhKgB+a
	/dK6Qw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcu8wjj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 04:33:10 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8423f544944so2899658b3a.3
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 21:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780893190; x=1781497990; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NaJITyHv9S/d+drDLgvU4Z+GSyOoUsVk5p/NMfCm5YE=;
        b=jxIlsR/2SLeiSG1L5foT5nnKH3sT8zcuFQ5EurO2b15zUXcN+8agc68rbyV7E+aePg
         sG33KSIWpPQ9pFG/deb9ARtNW0eJtC++SD+nnsZWkslx7eXcEYDVtcBVtZg0iB1UCvJ+
         pBVaxIIgUsm/ggvgbuCKIABNfWMwhMR+nUq7+9XyKlcuslyz1TECmO0fhF6DbrDzGnVu
         ystqQ9mQJQyFB80R6B/fkaMQzd+NGK4YPiawZPWW/lCVhCr3n8cWNdYRSCcU8aAMk6rG
         eikMKqnNY3ZeJeRBMlVtoQL2+3xSiNzEtkYfMBUH6TwOGim2qfwrLBKBK9O0Dpy/RSHg
         zXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780893190; x=1781497990;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NaJITyHv9S/d+drDLgvU4Z+GSyOoUsVk5p/NMfCm5YE=;
        b=d5/LnlwHUq/XjZgQCNTBK9Ib4SrowdEjR7YVQ10n9/s3L2hndlfGFEqruQ2Fvel7g2
         tA4g3MrFebz/puNhxz5wLRMk/7mMGYc060aQhE5mErJrP8tqy8yotOAo91szByvqQTgR
         4AE51z4dVoAy2+W4K1IEK/x374znfkTR6JFDu5zALocVZd4JFzTUPO38oJVcSNRvzAWz
         da+xp1hdX5ZgNDGFJxVbeWVTYTv/bbHnKrHNJqxXxWb+aY4OF1RjkBrnbBQTBX54or9u
         MmDzxHbJGOMEBnp/6E9swC0WQ67DWinIvTGfHOFmqvRJUevvzsyNKvmgHh3/Q5hsAQh1
         f+JQ==
X-Forwarded-Encrypted: i=1; AFNElJ9HfqaJPDgbBXEGhSbpXg5KnqMF38lqPPeY1aeZcSo8rSgBXRmqEDqgJgzAEgFwZmubKppaIw11rXxN@vger.kernel.org
X-Gm-Message-State: AOJu0Yz//vIXI3GzdOiT0UhfhzIEMXPng6S+1iTaTOeXgioVxH8X4NWs
	Bbqcg5bBMJhZC2Va0eUwIHkOUaP4ZXSDGZ/8u1AdMoGowbA9Of+WawboAlVAFFuktNrGzPhkGmA
	xGP6sXPebRq9Uvar/bsmZXYfDR9X0APr+zA2EwRAjirKH2Bc++W+2fc/nxA79+vvo
X-Gm-Gg: Acq92OFSnp4ZwCvw/WOIUp6O1wJVv1n7XjR0BJBBOFgKab7eXFfcedXb0EfXHfWXzqw
	TFvVpc8b5MhqPVBZVH5XHEoUD3VPZTo4jEGv5/Oy4e3lq+pCFCcSJrkfVjH14yYpomC85PP+mXT
	8pwcHwdVkps3q0uKp+z6Znwpju2iW9BNgexgSQC+XnSeeMLkVxBdp4gN0taeiV154gcfYidetP6
	Fq6yOFC+5VRHTyhOO3KPa+XScX99c33h+Eg66zp8dNy3iboV16EDdX4HdEpIloPuPHMYpHCVrTm
	CJjg2sPHLTdW/h5vU3K1qqeTVG1k4cy1dKqHmyCMKKCYXyTgXf+fdKzQwhp/aTDG2ZB1LdOCHp8
	ScLCSDC89ByfMuEyOREHJYGMIvNcnV+SID4Y5MiLHQr95j8Ya2d2a2liWhoE=
X-Received: by 2002:a05:6a00:2351:b0:835:3949:3c22 with SMTP id d2e1a72fcca58-842b0f52eefmr15287532b3a.27.1780893189749;
        Sun, 07 Jun 2026 21:33:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:2351:b0:835:3949:3c22 with SMTP id d2e1a72fcca58-842b0f52eefmr15287493b3a.27.1780893189303;
        Sun, 07 Jun 2026 21:33:09 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428221a7e9sm20631405b3a.11.2026.06.07.21.33.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 21:33:08 -0700 (PDT)
Message-ID: <a3d34087-528f-4543-81ba-8e7ee5d85aa3@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 10:02:59 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] clk: qcom: smd-rpm: Add support for RPM clocks on
 Qualcomm Shikra SoC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey
 <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260605-shikra-gcc-rpmcc-clks-v4-0-a0a7bfb44455@oss.qualcomm.com>
 <20260605-shikra-gcc-rpmcc-clks-v4-3-a0a7bfb44455@oss.qualcomm.com>
 <2c4insgmqmpk6zothe54ktcdrzkjbbaiql5m3csagq74znnprj@4p4liju4xcii>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <2c4insgmqmpk6zothe54ktcdrzkjbbaiql5m3csagq74znnprj@4p4liju4xcii>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ac6lpLu9KIMQteMI0WkfZkb5Ho4Rh_Yl
X-Authority-Analysis: v=2.4 cv=deGwG3Xe c=1 sm=1 tr=0 ts=6a264606 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=XXr5AoNkCxhS8z1Gjs4A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDAzOCBTYWx0ZWRfX5n0LA7sI2gIK
 qkxEvU3FieI1XSAHipfCx7GSJYQYwf8xKA+clxVAKfqDzK6d25rgch9YgxcWiGyvSR2OSjw0cKG
 cNuOAusuGeAukW2w6ElHx1S5k0K0MwmPGvHJQnEqmZJBxrbIapf7MknvxzMx8dhgVhe3veJSAza
 Ar+Fz6ql0tOlgsXCvNf1GKlGIRsiqGYcJv72RYf/ocVSv0PIm9JZ6knNv9FYQGbwDevtABTEJQ8
 Tqm8x1oys+09Kh+fVJzZ9LK/O1Al35FV+ZUPG1fBp480kfJcLFwOLbi3WGSFHKJUCEFzsuH4Xj1
 jE6sefhstWpy533Cqxs52xspS7Q7/soiY3T0mzmI8en2EIj3uSZ8n72XCDiyCpIbeFrifSvH2NW
 K5+TTnlf/UXQQjQRSH40PJ7kYgjTI9xYnjRKd1np0J5C1/uWLYa91IG48OqetLhUa4lcGmIC9lg
 GdpIrVvWtnLd/jaYPRQ==
X-Proofpoint-GUID: ac6lpLu9KIMQteMI0WkfZkb5Ho4Rh_Yl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080038



On 06-06-2026 05:05 pm, Dmitry Baryshkov wrote:
> On Fri, Jun 05, 2026 at 04:49:13PM +0530, Imran Shaik wrote:
>> Add support for RPM-managed clocks on Qualcomm Shikra SoC. The icc_clks
>> list is same as QCM2290, hence reuse the same for Shikra.
>>
>> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/clk-smd-rpm.c | 39 +++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 39 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
>> index 103db984a40b950bd33fba668a292be46af6326e..d0d19bf0616efd5f1bc2caa037ff36d830a3495c 100644
>> --- a/drivers/clk/qcom/clk-smd-rpm.c
>> +++ b/drivers/clk/qcom/clk-smd-rpm.c
>> @@ -1289,6 +1289,44 @@ static const struct rpm_smd_clk_desc rpm_clk_qcm2290 = {
>>   	.num_icc_clks = ARRAY_SIZE(qcm2290_icc_clks)
>>   };
>>   
>> +static struct clk_smd_rpm *shikra_clks[] = {
>> +	[RPM_SMD_XO_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo,
>> +	[RPM_SMD_XO_A_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo_a,
>> +	[RPM_SMD_QDSS_CLK] = &clk_smd_rpm_branch_qdss_clk,
>> +	[RPM_SMD_QDSS_A_CLK] = &clk_smd_rpm_branch_qdss_a_clk,
>> +	[RPM_SMD_LN_BB_CLK2] = &clk_smd_rpm_ln_bb_clk2,
>> +	[RPM_SMD_LN_BB_CLK2_A] = &clk_smd_rpm_ln_bb_clk2_a,
>> +	[RPM_SMD_RF_CLK1] = &clk_smd_rpm_rf_clk1,
>> +	[RPM_SMD_RF_CLK1_A] = &clk_smd_rpm_rf_clk1_a,
>> +	[RPM_SMD_RF_CLK2] = &clk_smd_rpm_rf_clk2,
>> +	[RPM_SMD_RF_CLK2_A] = &clk_smd_rpm_rf_clk2_a,
> 
> Are there no RF_CLK1 / RF_CLK2 on Agatti? Or is that another omission
> during porting?
> 

The RF_CLK1 / RF_CLK2 are there on Agatti as well. I can add those 
clocks to Agatti clocks list, and update the rpmcc bindings for Shikra 
to use the Agatti compatible as fallback.

Thanks
Imran

>> +	[RPM_SMD_RF_CLK3] = &clk_smd_rpm_38m4_rf_clk3,
>> +	[RPM_SMD_RF_CLK3_A] = &clk_smd_rpm_38m4_rf_clk3_a,
> 

