Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120E73E3DA6
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 08:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780995354; cv=none; b=MJ4suG9uyiIs6sbP+PYPb3s3xaFXphlsgtkCsZhCzovXx7OouVDw4Yi71bWRloWh6DLsjBIk12JAsR7yB3PDHURu+0YMTuShOcrobEer0YpEtPBvr8dGak0P0NqWrRGhbxTIR6Ljwe/IDQg2M73CLu8bWDDHQEjKiVG7Pw8uMKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780995354; c=relaxed/simple;
	bh=Xe1BL6A5lRpPWbazdd4EF6rQ6ZxjXLfPDpAzXm9ZePY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rp24aglV+kCM1DXcHps8mhN46K44tgOCu1G2O8S/8LnHaGIflb2DkVJ5aA7t/2QnN/RFgtrATUc4vlYJ9F3fdpfo5Zzo4QGq6jmbjZng9jqruAFYRjuqWTk2bkOOAgvGKqCgWrngxKzoK2ntVZ9QKFOsH2AGomDQ7TiySBL52Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KPcuKoip; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ol1WwDLa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KPcuKoip";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ol1WwDLa"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rvvv1587729
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 08:55:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OqhRNzlXQzrgamoipiClCQMj6Wo+WVMbjmsBPJ43o80=; b=KPcuKoipBodtdguf
	CX2hoa08zgX8vWNmwsyejdGx/JV+I2HBFfpOHdqEliTCpKFWVkGHQFMoqWWTc7+Q
	xaKeRKM5jn8K6ddYb5YBioAEUlEA/wlYCfxlKdguWW9OX5sYRVZjtMKL/UQjOSPP
	Mc54ITn9nwu7Q4Ce7GpBolUJEWdQCNUpBewA5Oox/YLL/tZVT0H2OuBoaPB/t8uE
	HewA0F6/ToLs5q4yhNTsRXHF6FuCnrISW5N3+DnrwNSyRpGPW7xmwKxMPv1wwrUW
	R2wusIKtwGDPRUcOKWHyhN5/qRby89Jg1+sg4+ggTfHc58vDtBKZIfQ7LoqqZBuG
	cL0ZTA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enw5m4ye8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 08:55:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51780e3ca44so10496351cf.3
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 01:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780995351; x=1781600151; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OqhRNzlXQzrgamoipiClCQMj6Wo+WVMbjmsBPJ43o80=;
        b=Ol1WwDLas9ICws1MmGDrGpHp7WKCF4yUzv/X1gD2vPFj08i6opavJTIPML+HIfHAEd
         cY7DOvxM1fbLUxTLOEL+y87TBvACCBjzftJAdomGPSg3/hFbVIyNfin7GU+Y4Go3VHF5
         78pdLvtERpxfGL6U1Ua3isKY68+npEiQjfZh08NL9KgAvMScfDog63OpmCCVDoujajAb
         9s/OByIwDZO+orE6sToxn8lY2wHotKotIqVsiVsjVSpANH8Ad0E69HLCy8Z/+8OY3GeI
         GEo81+9e6VPT/wRShKMKCvzitgSjZZq+NryX3fGAoCpPzgA4O0WksT93f1B7ZkwUWqem
         Ah2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995351; x=1781600151;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OqhRNzlXQzrgamoipiClCQMj6Wo+WVMbjmsBPJ43o80=;
        b=PhvQQXizutJx0WEXD4DUuXpZNWWjt5D2aiX4TzpOu/QR+3t69hRlz8cPO6kF3ixJhF
         mgMsuPktQlOq7PgaiV9CkoDJfMNbeY8I/mjRVhXhiD9+lk4MdIPff43oFJZnP869Kf9y
         i+aFcIM4bCqdTz9EKXGgXgsZWM172YGGqj1+ZGRnybdD+xrF6JcnJfllhTpquycYFjyZ
         IgiYaYAhsbDi+4QkiTJzdOijQKkpW4Pim2K0hGheY5MDVpBa6b6bNlOpZn6GSvvQsKOi
         VYcJzH3zQB++OHwEf1g+5s0kRx3dnarfr29DcZuvkrGYAFP50FdsG0QAWmHvdOgqQuCp
         b/1A==
X-Forwarded-Encrypted: i=1; AFNElJ+brJ9weKWqt2L1Ujc0eC7sfu/1wwGNb4RDBc3CPFXxjni11uSihZgVbK2tpgjVM/T1qH/Rm9aDpOmT@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjq1Tn5aTSu366epMwwCvcBvL3t4M3wCTCW/TYvJcBifxLPrLK
	Xlm15OhOipMeiU0/MZLmt1vBXPxarfFY/M45PXViYTMmyanwuyQCUh2ou3Rf2TNCu14Qb7Q8Wdk
	iUBVOvDET5t8Hxh1DavC6pDBr7tZK3EdNPFiTl/d6u/6Jn7LxkWrvLXe2Bpr2eTUO
X-Gm-Gg: Acq92OELPgwaqSlgFQCYzTCwIl/NhI3Utby2fz56oSK9lL9VjpIbpBU0bA4GHlqZvrK
	jXpqGoJd28KkpJqPO1KwZ1cUqkSEdB1Thv/OGZ3hRl1XcSBCfwomgcqLE/g1FPDaqsFpSjWUagU
	nYYD4xQwHhE6a6xmHqa7FLorObRX9EiJPfRxIkuyFzi7qExT3XITMdsJM0IT9LLhTOiRFHBVbHT
	CRV13cIQjZVf+8cTG8zGJroTu86vo7QdYF7O1AP7B5drD689IezVh6FjMVDOyg9ewB0Qho762+G
	1vQek3oOlSDX+f27qOyWjOzFoR47sDS52xeDXvu/0euwv16rUCXWxiUk+CKDv4Q6GM1t1Bi+UYI
	eknpz7uIDK3OZCURGK4tsxETWHWCXiAgapMOOX0mieiaTD7VfQCbPkKrQ
X-Received: by 2002:a05:622a:1b1a:b0:517:6b29:348b with SMTP id d75a77b69052e-51795c59f49mr163385741cf.8.1780995351311;
        Tue, 09 Jun 2026 01:55:51 -0700 (PDT)
X-Received: by 2002:a05:622a:1b1a:b0:517:6b29:348b with SMTP id d75a77b69052e-51795c59f49mr163385501cf.8.1780995350725;
        Tue, 09 Jun 2026 01:55:50 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e6585154dsm8180974a12.15.2026.06.09.01.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 01:55:49 -0700 (PDT)
Message-ID: <a6b17b9a-f639-4a7f-adb6-d0c9dbd31e68@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 10:55:47 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: mtd: qcom,nandc: Add MDM9607 QPIC NAND
 controller
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Richard Weinberger
 <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
 <20260608-qcom-nandc-mdm9607-v1-1-4639a0492274@linaro.org>
 <20260609-quirky-rat-of-criticism-aea1fe@quoll> <87mrx4b164.fsf@bootlin.com>
 <aifKejyF7n6QsI9h@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aifKejyF7n6QsI9h@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4MiBTYWx0ZWRfX5Cpgk/9yKjFN
 r6XjQGjWCHg895ANdY70vslZ50bEqRWosuQUzz5T/KozvLyu4JGDMPlO2p754j3Rd6pA/j6BWzA
 frQXObUE7R9YJU4dgWmgKSEm8nEUNd29l1xh8Yu3ksDesM0UzT8znrQ1OdOmCT+1mq1zZNjnOVa
 Fjve1vNjrldmjULNfG6VSm4U1F2CrXNYzbzI0YC5QDRwi9TBjS/H8J38OOBhMahvbhtfZpllyIo
 lX8q2Fj3LlYnIpsUp9K2h1Nnu1vZMT+o4tQPUaYf2XqmnvfNvTNBi5D8fM42ILbdlmFsRF/QDpV
 ylNjX9x33uhugN3WB3+BkGzUtGq13QlyPbHE3u/qViJ/u8C6BV3M8PNlaBV0jnkzqoumvZPNBHC
 aNiHY7VcvNT2h45WH8oyuvZwVpzgu47arpv241+Eypve+jp74onWVErbin2qL/gFuUhSY0edaC8
 sMimNKJ77VTxvD3JV3g==
X-Proofpoint-ORIG-GUID: KPcgh3W7GO8BcWqoow5iMNnuhlE4t3n4
X-Authority-Analysis: v=2.4 cv=UptT8ewB c=1 sm=1 tr=0 ts=6a27d518 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=dZUDpN5UoYg7q-ifSsMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: KPcgh3W7GO8BcWqoow5iMNnuhlE4t3n4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090082

On 6/9/26 10:10 AM, Stephan Gerhold wrote:
> On Tue, Jun 09, 2026 at 09:52:51AM +0200, Miquel Raynal wrote:
>>>> On MDM9607, there is only a single controllable clock for the NAND
>>>> controller (RPM_SMD_QPIC_CLK). The same situation also applies e.g. for
>>>> qcom,sdx55-nand, but the corresponding device tree (qcom-sdx55.dtsi) works
>>>> around that by assigning a dummy clock (&nand_clk_dummy) to the second
>>>> clock ("aon") that is required by the dt-bindings. This is not really
>>>> useful, so avoid doing that for new platforms by excluding the second "aon"
>>>> clock entry in the dt-bindings.
>>>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> What is the problem in giving twice the same clock? If this is what is
>> done in the hardware routing, I do not see the reason for more
>> complexity in the binding?
>>
> 
> I had that in my first draft for this series, but this would be wrong
> IMO. I suspect there is no QPIC/NAND related "aon" (always-on) clock on
> this platform at all. I'm not sure about MDM9607 in particular (maybe
> someone from Qualcomm can confirm), but a similar platform I was looking
> into at some point actually had *3* separate clocks for QPIC in the
> hardware and none of them were called "aon" ...

gcc_qpic_ahb_clk (50/100/133.(3) MHz sourced from PCNoC_bfdcd_clk_src)
gcc_qpic_clk (likewise, sourced from qpic_clk_src which is sourced
from GPLLs)
gcc_qpic_system_clk (32 KHz)

No clock containing the substring 'aon' in its name on this platform

Konrad
