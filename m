Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1528125B0A0
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 13:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782048662; cv=none; b=HPqCnBqJoHanc1LH0kqQujgH6lR+znb+jdy51XMeOfzpgaE6iW8qy0Bjex6DvNrQ2DzqBfgUK8AfMLZRsVhoKpQNYo+dLtNV5GM+MvuMTq9iqpR94iZDFGlAP76ROFN7VxdP3xJtIAQOJL7McdB/UDrBH4G54wYhaf769cTrDPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782048662; c=relaxed/simple;
	bh=N2uIoOfZZ0ySePD8q6EsZbcf1vvpAdfb+cBUcJki7gg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tWj9bAesBglnQ3AzmECjn3f+a+mG6dwz4ad9bWX1OK4AdjxQudlEi8suNDqMFopvYW4l29PDVW5jUcbsXE3llN6a3C51sKt2UX7yfjQM7ewn8DepDjBUIJ+w4kzP25yaH7c31fDuDaCzbsJhbM5h/le08CufcsMn3UEvhmLJdOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GdHrPjjl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CzGL8Ryf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GdHrPjjl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CzGL8Ryf"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65L9tSBt1443434
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 13:31:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PXZmHpXBfcagtWhoU0+9xIezEYYqYhCC9j/IdthMIWs=; b=GdHrPjjlEym2VB6W
	8tqAhEU3KW5oXDhJH/ufQnpyNhRt2YLaMpr5UrU49tYqq/bMzI/67eSK1NyB07A7
	1qFX7unv55e7h9pPFij6HsGO8tJIL01u+4iSrSy7WuPF/wYuyNO8zOWizTcwwsQv
	MR22V2Ll0YeVVQehalLxtfkxo3ppAhwHJqoKYAztfyOcVv25akEhlez1HH4oNeYC
	In32SPyKv2CCiTKnzN1iDLp6ZYygt+zYcTvGIN+IirCXWRTPNsnxfSFRvkWtCBi5
	rcA5dXL3qvL6tDJZmCdmLhr0H5VjjsJXF0R/cGklP+9ADtG84j+QRDlMZW0eBOhQ
	M90qLw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewkmeb0jh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 13:31:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c7403e80b0so22265195ad.1
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 06:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782048660; x=1782653460; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PXZmHpXBfcagtWhoU0+9xIezEYYqYhCC9j/IdthMIWs=;
        b=CzGL8Ryfd6vdmubXqEZOkU28kUJjF/raVnPkDiKSfHYh5NwaYK9d14qteZV8BB/aKz
         ymGcZjwXNKwtd81m8RD2gv/LRNDEYMeuXPOGBjn246hFsUg6TFZasdx4tq5v5jvy+cFm
         NP1UEl4OPtrf6/kCo12BQ+rxcL640L71atdlw7qgxkZP9mP+BBJv9dWzFQOhGf21r9MO
         ZwRVlAumhLLy7OYM7SaP2Hpwdko/u4EcIQX9YbX8qlM2KBliFy6wNefpSW932BD6o+xE
         d8loV6pDqqkdJrHFQ7vySa3ZpWhpXPP5r9rzw4MwXb0t5eS5zesSeC91johjJUusHCVQ
         b2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782048660; x=1782653460;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PXZmHpXBfcagtWhoU0+9xIezEYYqYhCC9j/IdthMIWs=;
        b=s2utpswoK62dvemmM2z+l9V+C7JJtpPYz9yhdcHx6zq7ePwSQxH9GSxgT31MhZiF0F
         A1KlgMzMHB4rlK3JCpFDOcWg2BOoGzx9vzjuXrEKdCE0GRKonb0p18MgHp4VbMlvvoat
         ppa3GP3CZNPiz413R5nsPaWfHvLxin0D2ZjpSl7TwyBlWE7KHtcSEYdW/DkuTo2KEM2F
         GD05P6mCeU6BpdHG5Ov41rPV5ClFUuJFerPdiOImHQTktFJuzOiN+vueNfERmIFdGJsi
         DeDu9XkGTnJ9Bcln6XZSTQRBpknr/JuzSeTlXYw/5a8pJ4oYKR+0OZpjzLag4lJPaahD
         3yCg==
X-Forwarded-Encrypted: i=1; AHgh+RrKgBFgknplQv2swWeifS9RCwyiJO3KsPSjrNq7+6khDAc2tQu6Ji0cyVidleH9OPkc8wefjiH2owuU@vger.kernel.org
X-Gm-Message-State: AOJu0YyJEg0DcvZpllYszoc0+MyCdSDxcnf+n/YFJkF+9e0rwnJ+Whtc
	UxbzwxYc+w/i43C5jEmZaC7sTVp17Gx5maK1CgaCTMVJyfjB8UFvINM6AjLgxED1vh9AWrgLBrW
	FGeA2RJVAQhvx1UfVpTVM1sM4tdM6iGfg7+HwQC/m/F3GJJiwXJYIw97W+1Xy1TNx
X-Gm-Gg: AfdE7cm+Jp/TMLEscWRRgx4RRNq+p+RaQqHpDfMN2/yfZW1nHZIvvr8dp47vOybojV9
	hdCxgw+PZwkQ3zErJyCHYrm/Slb0I8zlXJxy8qVGn/VwrnCL6fc7iUCJR+FEiXI2oOlIIIa5kI8
	Sd0KpLmfWMhAuT1ag26VpUewtanAVMSFomF56qZvvpE+nxRwIMaDQTO70QMz+yn8pEYM46desTn
	2kPo1mawt8mEsKOsSdnDDXdJe4Qta9GmkOLC8eqZ7R9qVWHMF6DIDlPNm+NHiTG9nEnjQ17m8lj
	USBnEOSJkyToDGEBzu09IfpDrQdZg4SuBLLiMhe2UJyMQiAJ2cJTughiCLegXHed59DEJg7TgDo
	2CaIPlRvUFe6sgjjtVtgPg/YkH3h1VFfoFdpM9u2t
X-Received: by 2002:a17:902:e881:b0:2c6:e1f7:b4ce with SMTP id d9443c01a7336-2c718f3f09amr126472955ad.28.1782048659590;
        Sun, 21 Jun 2026 06:30:59 -0700 (PDT)
X-Received: by 2002:a17:902:e881:b0:2c6:e1f7:b4ce with SMTP id d9443c01a7336-2c718f3f09amr126472395ad.28.1782048659143;
        Sun, 21 Jun 2026 06:30:59 -0700 (PDT)
Received: from [192.168.29.32] ([49.43.225.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7439f9026sm48007125ad.53.2026.06.21.06.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 06:30:56 -0700 (PDT)
Message-ID: <9f89a2d4-e29e-4dea-832e-622bed566bc3@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 19:00:49 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/13] clk: qcom: dispcc-qcm2290: Update GDSC *wait_val
 values and flags
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
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey
 <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-7-8204f1029311@oss.qualcomm.com>
 <66iobdkznpqqy7twf4fhu33m7mclnndlrjc4urt2em6tfe6gp4@r7wd2gnzsjoa>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <66iobdkznpqqy7twf4fhu33m7mclnndlrjc4urt2em6tfe6gp4@r7wd2gnzsjoa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIxMDEzNyBTYWx0ZWRfX3ZCyQi1AOY8T
 fXbP3hBwWiRBBfm2coCTTEArT1uFYLsJ+6PE6QF2h9lDop+VihfHWAw6J1HyliMHcLOnEZyEeaG
 0fMJQq4gbCwDMHNpw4HOE00iUpY/lwnVtSqwM+tbdfv+7zLVyu+Jm9zVGy1NNqEQ9FGt08Kv1sE
 3oZfuVnPI/u57m70R9bOh4b2cEHc3qWf1fBhmCcDsmRNKFtS17+LXk1+XzkciFuf//GQP5LbsAe
 U+UtVj3gDUQdLfYtfnN/SawVY+xSX6IPMR0xPThBPmqdmFBHrWx+07VkWTFxEiGTX0XNLf96vNO
 QIXGiWD7OgFgelCyOIoLh/TmfT4ooOgUKHSmzuu0R1fHTfLppqLY0xPdFFRcEwR1T3cIrsVSW9S
 YYHtdtsromILppDgdaiGgyphNacDob6hrDb7fjj52O1Ps9eoAVvYwkOPkbmRAXwHuX4csZdjk4N
 jdzGIWgiYgIjjWQSP+w==
X-Authority-Analysis: v=2.4 cv=MtFiLWae c=1 sm=1 tr=0 ts=6a37e794 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=HwFTmRh04JSsUSWzyQ2edw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=-FpPnIJ-wZmyQQF_TeYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: JjWzF5CCUsFvErdHeLEo3_PNuFGsE231
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIxMDEzNyBTYWx0ZWRfX3M/JzQ6lApg6
 rAlEhFUdZ5+luy5jn/cDF+/5JJyuuJ9iD1GSy9HlbxIN5G2ZlrEcn1q6lVwzYN4wDVqZbg6cTuh
 /g/OdgzPNUt9nOEyYzBe2Y0mP+bijg4=
X-Proofpoint-ORIG-GUID: JjWzF5CCUsFvErdHeLEo3_PNuFGsE231
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-21_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606210137



On 06-06-2026 04:57 pm, Dmitry Baryshkov wrote:
> On Thu, Jun 04, 2026 at 10:56:13AM +0530, Imran Shaik wrote:
>> Update the QCM2290 DISPCC GDSC wait_val fields to match the hardware
>> default values. Incorrect settings can cause the GDSC FSM to stuck,
>> leading to power on/off failures. And update GDSC flags to retain the
>> registers, and poll for the CFG GDSCR, and switch between HW/SW mode
>> dynamically as per the latest convention.
> 
> Too many ands for one patch. Zero explanation (other than 'latest
> convention'. Which convention? The flags describe hardware behaviour,
> not conventions).
> 

Sure, I will split the patches and update the commit text with the 
justification details.

Thanks,
Imran

>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/dispcc-qcm2290.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
>> index f5dbd19d0a0334362a44f91a69229cb0f018f309..4c1eef79f41b6907fe79f2b18bcb5f6160c74a43 100644
>> --- a/drivers/clk/qcom/dispcc-qcm2290.c
>> +++ b/drivers/clk/qcom/dispcc-qcm2290.c
>> @@ -468,11 +468,14 @@ static const struct qcom_reset_map disp_cc_qcm2290_resets[] = {
>>   
>>   static struct gdsc mdss_gdsc = {
>>   	.gdscr = 0x3000,
>> +	.en_rest_wait_val = 0x2,
>> +	.en_few_wait_val = 0x2,
>> +	.clk_dis_wait_val = 0xf,
>>   	.pd = {
>>   		.name = "mdss_gdsc",
>>   	},
>>   	.pwrsts = PWRSTS_OFF_ON,
>> -	.flags = HW_CTRL,
>> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>>   };
>>   
>>   static struct gdsc *disp_cc_qcm2290_gdscs[] = {
>>
>> -- 
>> 2.34.1
>>
> 

