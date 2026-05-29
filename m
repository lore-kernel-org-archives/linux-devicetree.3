Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A5F3BE162
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 09:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780046611; cv=none; b=rAsyvHvHZMEfxe764Jn72J2Ev0Nf2z4IkLNZijmUdnYB+5tEDcbsyR7lTN8XtVPiW7Cc6QvcwzQ3Av7COPeBKZRUzxKTh5pe3xHb9l4pYdqUlc09cij1UUrC4fdqMB1/8X1gs6TGUwGIgZhNtcPMnK1aOhC2+3X4bTFbvM5Mvh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780046611; c=relaxed/simple;
	bh=yt9kofHtXymnCD3EaxDm9NSlVafZFb9BX3Ubc3k6d+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AZiyhwJXlN0YbRIEr1eTqh6bJPGLPQ7x5SM23KbLbXYpUrgVin/i6a/3gX6JAUkg9WDdhwPb42IBO8YwSueMQNPnnQPdS1z9sD53vqxd+sZh5KwdXnWt3t3E+4Pe9ndhx4i4hHf/FKMcfi3gMapOpqmJGwmpYstQLi9RfILRMQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=niPMPmoR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aE0ht9vv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="niPMPmoR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aE0ht9vv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T4THFD4193434
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 09:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3zDoPS3x/Gc4pwXs4/RNUn0CZZ7DW6X64Lr58N9+UAc=; b=niPMPmoRauZBlTrv
	m8RfLSNlAgt7KOmoLDjYPPcT/w25mTt/xuN1Dfbvgj3lDJ8ayDRUpiwYU1BWjTxG
	vun7H9ateoEQNeJaxeiV5DR6SCKyr5HYUm2eZPLsfjFI6KCb1y0E8xJ0OMCxtreJ
	HhNbivdpJnvDNauPolteq+AzjNqDsC8jzD2CdOBDmByx2JrjH/zLprmfm10rLNqB
	ICbVDqr+9z0ptyQar8RZYs8+Psspol4CgU2ayJa3tylZ9ZhDFvGvbnKwnOQ/pf4Z
	NSa+CvenNiQqyfu3Jcn1U9DEttYgLpqe6amn4+khYDo9XxnGWDpZVUJb0Ecb430a
	lG9DOw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef3te15m6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 09:23:27 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82fa860e71eso7076691b3a.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 02:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780046606; x=1780651406; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3zDoPS3x/Gc4pwXs4/RNUn0CZZ7DW6X64Lr58N9+UAc=;
        b=aE0ht9vvLWztZ8y0axGMIiyf+BR78iwR3CLv8tseCJ3f5Ma2jJwo4DzDcagNz1Wpap
         b6RoJBeZLH4sOY68rSvFftnXXlJwYfR7vk3JqR+lBjcV8T/5hqdl+5SlIpCaR6EsBb45
         mEYjVTjLeXG0r51TasJgJv0UIv1RxdpUDqtW3ONIZFHoVrYbKledbD+XiIDnSxFA4yM9
         AmdpbPZt1BS+DrE79O1ZR6pi55ZuoAFrgy13ees/ULxXYA+g+XSCAzPiYde6TLB7SRNA
         TRqk7vu/9+WwIbAuCKchRzFud4WEPzsPFfLyu3q0ekSV+3IgtUL80xFPkiqG245cLq0e
         x17A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780046606; x=1780651406;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3zDoPS3x/Gc4pwXs4/RNUn0CZZ7DW6X64Lr58N9+UAc=;
        b=oibRDbj3/ZpZWk6uyOMh5Sl2v0LjHTn6X7awn1hQgw55eOVNpOWIy5wtREPNX1nM05
         GA62Gr8HxRmRMVPvXOiRtdV2uMko/FSJ/sbPh1JT2r7+s+gMZxuQ7Jcn4+OEp2tbTQgC
         Uo0u2OK2Uuk3QKH5nDasHHgqC6brxTGv817vduiIYyHOVXY+3KNr4GQCTqQO5S3LQoR/
         MXZirAyUXrA4RhDShU0Rl2DQGriHlOtwwPf5ixgkT28PiM3GAKlNV8ZHjY+O9mx0wwlE
         djVHxoG4nQukDSpD7DmP+JNdcXyGg/OohUIGIDFGGJTshg+/zdjmB1BOl9m1Hklp0Fpv
         /Lag==
X-Forwarded-Encrypted: i=1; AFNElJ+Dq5f+GRx8nY7Fkl3WnViXYI75WjOl/Fc2JRAzb5d+LyQ0gWWQ3D9iR181045myAy28UOKvo8fTrta@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5+Ops8IeXcgEH2ueh6VVE4B7+8h0lFY6/du36LPpisnUPlPQL
	Wv13yj0V63j5sz6ojBn10WaiT8dWBLZ1FQkRPVRTDeASQ1ycM2ThumBBeRLxpy6oEflvtHJrxlP
	4l+DNmiA9B4eJepdZ1DUYVx/WSMW73UDk2NRC1S1W2lYSIuTlOLNK29yLfvAirz3p
X-Gm-Gg: Acq92OEadN+YBAXfKzK/b2IG7O5uEELY3BpT6DJzImKoM3RVn4qGoV9bqC+xNr0OCzw
	FkfPLVOeDCCWGhxS+3AF9Tms1Y6LWQ1poq2OmdWUZ7Q7mKVuXpCBRKmSti32/kPPxws6kBDpPbZ
	Yl9TE5K1E81rmXC1I/H3dOhr+/FPsBhCZ3rC9ukbTvcmYoj2UMVRRsQ5D8UULENad+PD2tpYRsV
	JkrXxfYQvrS0xz7dfod60sDjZS0Qtqr+fy/MsVpBI/3LdFojlEET2WfwPSDTbRGkqm0GbQTp76t
	5kparwzQwJj3oe4sXL3RA2iY8kCZmgEpmaMhrhAqd2H9ucCaKWrPvB+Kew9bbJoDYDGyCCaNc8A
	SzXjekyceYpgC2XJQj/bZ5dBJnYxwHoWVPbh4odtHwf8IpvmoQoOGwOHjMsukFg==
X-Received: by 2002:a05:6a00:1742:b0:81f:9b4c:81c0 with SMTP id d2e1a72fcca58-84212d2ca6cmr2156396b3a.41.1780046606406;
        Fri, 29 May 2026 02:23:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:1742:b0:81f:9b4c:81c0 with SMTP id d2e1a72fcca58-84212d2ca6cmr2156359b3a.41.1780046605769;
        Fri, 29 May 2026 02:23:25 -0700 (PDT)
Received: from [192.168.1.2] ([117.192.250.176])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214affe29sm1240298b3a.3.2026.05.29.02.23.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 02:23:25 -0700 (PDT)
Message-ID: <8b911846-1001-4c20-908d-1384cc81e30b@oss.qualcomm.com>
Date: Fri, 29 May 2026 14:52:39 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] clk: qcom: gcc-qcm2290: Drop modelling of critical
 clocks
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
 <20260528-shikra-dispcc-gpucc-v2-1-953f246a0fbb@oss.qualcomm.com>
 <ro6xcalsh5vwsyxi4jyyk4iebmg2p626aqw5zobbfjj5noui6r@hsjyhdko2aca>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <ro6xcalsh5vwsyxi4jyyk4iebmg2p626aqw5zobbfjj5noui6r@hsjyhdko2aca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 78xAKvd_yL72xQkb1T66DkxJFhLPFddQ
X-Proofpoint-GUID: 78xAKvd_yL72xQkb1T66DkxJFhLPFddQ
X-Authority-Analysis: v=2.4 cv=daSwG3Xe c=1 sm=1 tr=0 ts=6a195b0f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=MYhr4v4WboA43l5+MyccHQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=RHQwGL2yU_3FcdO5I0oA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA5MiBTYWx0ZWRfXxgDiTCXf1Hbm
 L9Bzp5cR5LfVFfoH46s1go3WVnt4/rO4ib8S0fVzR75g2q4qHyyIRxa+a1WHP2P4mhYVPQZbjbj
 7F4DX6WlN3c7KScmSvuyB7AlEujUe4YnLzqZNA0ZDEbOvzPasVU+nREHPazEB8/4EOlEDuBt9xG
 gQ1ijjykM/qfkFSYSqe0MExy/1nXYu5roWa3NQoBYR/WGFbJ7cLif+JdlvD1r9QYTDPwdA7iNSD
 i5WGtDXdLN6f0p6CUSnwCRAX1EQEzIY6AU8q54U9ZfTtPLhplPP1CpG8g8NkYNOGmwWddVnUNZf
 CReVC9zjPdRNtZF4okIdqpSmQa/uQpiZEmPLvdAp6/ienKiBD086WdfZUaOIhQhOtiVPhL94ue1
 e83SFUJG7yTzn2A3b4xIkPKw6LlqMCKpSqYZDJC5wzzXxbKtjntzHRz8kZaWmhdESQVgyqxb5uZ
 TZhA28g/1VhOGDhAVzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290092



On 28-05-2026 06:52 pm, Dmitry Baryshkov wrote:
> On Thu, May 28, 2026 at 03:37:02PM +0530, Imran Shaik wrote:
>> Drop the modelling of critical GCC clocks on QCM2290 SoC, and keep them
>> enabled from probe as per the latest convention. This helps to drop the
>> pm_clk handling in QCM2290 GPUCC driver, and the same can be re-used for
>> Shikra SoC.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/gcc-qcm2290.c | 153 +++--------------------------------------
>>   1 file changed, 11 insertions(+), 142 deletions(-)
>>
>> @@ -2012,19 +1936,6 @@ static struct clk_branch gcc_gpu_gpll0_div_clk_src = {
>>   	},
>>   };
>>   
>> -static struct clk_branch gcc_gpu_iref_clk = {
>> -	.halt_reg = 0x36100,
>> -	.halt_check = BRANCH_HALT_DELAY,
>> -	.clkr = {
>> -		.enable_reg = 0x36100,
>> -		.enable_mask = BIT(0),
>> -		.hw.init = &(struct clk_init_data){
>> -			.name = "gcc_gpu_iref_clk",
>> -			.ops = &clk_branch2_ops,
>> -		},
>> -	},
>> -};
> 
> This clock is not critical. Why is it being dropped?
> 
>> -
>>   static struct clk_branch gcc_gpu_memnoc_gfx_clk = {
>>   	.halt_reg = 0x3600c,
>>   	.halt_check = BRANCH_VOTED,
>> @@ -2605,21 +2500,6 @@ static struct clk_branch gcc_venus_ctl_axi_clk = {
>>   	},
>>   };
>>   
>> -static struct clk_branch gcc_video_ahb_clk = {
>> -	.halt_reg = 0x17004,
>> -	.halt_check = BRANCH_HALT,
>> -	.hwcg_reg = 0x17004,
>> -	.hwcg_bit = 1,
>> -	.clkr = {
>> -		.enable_reg = 0x17004,
>> -		.enable_mask = BIT(0),
>> -		.hw.init = &(struct clk_init_data){
>> -			.name = "gcc_video_ahb_clk",
>> -			.ops = &clk_branch2_ops,
> 
> This clock isn't marked as CRITICAL, why is it being dropped?
> 
>> -		},
>> -	},
>> -};
>> -
>>   static struct clk_branch gcc_video_axi0_clk = {
>>   	.halt_reg = 0x1701c,
>>   	.halt_check = BRANCH_HALT,
>> @@ -2686,19 +2566,6 @@ static struct clk_branch gcc_video_venus_ctl_clk = {
>>   	},
>>   };
>>   
>> -static struct clk_branch gcc_video_xo_clk = {
>> -	.halt_reg = 0x17024,
>> -	.halt_check = BRANCH_HALT,
>> -	.clkr = {
>> -		.enable_reg = 0x17024,
>> -		.enable_mask = BIT(0),
>> -		.hw.init = &(struct clk_init_data){
>> -			.name = "gcc_video_xo_clk",
>> -			.ops = &clk_branch2_ops,
> 
> This clock isn't marked as CRITICAL, why is it being dropped?
> 

The above clocks also should have been marked as CRITICAL. Not sure why 
those are not marked in the QCM2290. Since we are updating the critical 
clock set, moving all the required clocks to the critical list in line 
with the latest conventions.

>> -		},
>> -	},
>> -};
>> -
>>   static struct gdsc gcc_camss_top_gdsc = {
>>   	.gdscr = 0x58004,
>>   	.pd = {
>> @@ -2990,6 +2848,17 @@ static int gcc_qcm2290_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		return ret;
>>   
>> +	/* Keep some clocks always-on */
>> +	qcom_branch_set_clk_en(regmap, 0x17008); /* GCC_CAMERA_AHB_CLK */
>> +	qcom_branch_set_clk_en(regmap, 0x17028); /* GCC_CAMERA_XO_CLK */
>> +	qcom_branch_set_clk_en(regmap, 0x1700c); /* GCC_DISP_AHB_CLK */
>> +	qcom_branch_set_clk_en(regmap, 0x1702c); /* GCC_DISP_XO_CLK */
>> +	qcom_branch_set_clk_en(regmap, 0x36004); /* GCC_GPU_CFG_AHB_CLK */
>> +	qcom_branch_set_clk_en(regmap, 0x36100); /* GCC_GPU_IREF_CLK */
>> +	qcom_branch_set_clk_en(regmap, 0x79004); /* GCC_SYS_NOC_CPUSS_AHB_CLK */
>> +	qcom_branch_set_clk_en(regmap, 0x17004); /* GCC_VIDEO_AHB_CLK */
>> +	qcom_branch_set_clk_en(regmap, 0x17024); /* GCC_VIDEO_XO_CLK */
> 
> If you are chancing the driver, why are you not using .clk_cbcrs?
> 

Sure, will add these to .clk_cbcrs in next series.

Thanks,
Imran

>> +
>>   	clk_alpha_pll_configure(&gpll10, regmap, &gpll10_config);
>>   	clk_alpha_pll_configure(&gpll11, regmap, &gpll11_config);
>>   	clk_alpha_pll_configure(&gpll8, regmap, &gpll8_config);
>>
>> -- 
>> 2.34.1
>>
> 

