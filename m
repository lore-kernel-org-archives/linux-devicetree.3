Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3D5493643
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 11:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791372823; cv=none; b=AVRL8Gj1+VJQkay7nka+D1AtNYogzLtDQGep8U+NdHPaqumF0aqovvndQIHymTaRYwUIgFeCYujM6Gwr/dXkSKHH4aa6LXIry5zoxb5cgl/oyEfG71MYrbVUq26E1WM48FLaueBn1Cn7XhvAUgNV3c5/Pom5jZPqSOAIznjW420=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791372823; c=relaxed/simple;
	bh=dJRew0RCqMZrsYX/336mtM66FOjge+oEkiH4dzIm7gY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QPA+nOuD1YtT2Xo1q2SaSzzm3QfilBEhINisHLT07tpOJZ8fZu6ynbCv78sEQSX3E7IxdlX4ZRsXjIZFoL/FNSAIPKn+j7hfqVaRgTJNWhMvIaGHMSUwx2GyzQQqVctIN6A/3NnXX8Whdg00WNcQKSJnPpPYLFqc94DoM0DA0tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bIPME/+y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J4QBIZQ+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bIPME/+y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J4QBIZQ+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BV7Oc2969910
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 11:33:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rnRfrie7kW8dU2T1uAcEvLq8NNMvKQJZG3o5AFfDelU=; b=bIPME/+yaFa5Wgzk
	TUcNEiMvX+kYVG1Ym02c7L5TxxWdyXt6yXweG3dSfvGbt360GtTNOoFu6Y1UJc5B
	co4tADcrkp6gJAf0d2Yo7u6nVm0uXNGYeE1rn22g9IGpq3rUD/aDAJhnQuIoDU4G
	s6dJDANvoLDtJBJtx2eSmCWQDl1onJlMlCkN7IKhzP+t6g9osbAAhB3/a0O2og4b
	2bdgXQkd09fsLdlhHkP1b+9YT7Jecqxk/s3oiE/24jzh6zNs4gvk2bNznFd0u/qj
	uiKvVDXciTyJ4BcjJMCZG6QFDUYD28MktAf/VNWvtUGrJOyGvGy/uUt2kCKW2lOr
	FrGptw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c6u1uvk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 11:33:14 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-868db1b2c64so3363847b3a.3
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 04:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791372794; x=1791977594; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rnRfrie7kW8dU2T1uAcEvLq8NNMvKQJZG3o5AFfDelU=;
        b=J4QBIZQ+2Lt4hRxL05gK0bsu9/XFTaDz0ofeY6t/0u0EeI57xUPwYT0SmZMN5OOYMx
         /8gcTZFPRqUOep8HnxeTzA+VjxyuGSdxm7Gtv3pTpomJHJACyA70YHfx/Tcgu+hCUXW+
         b1Q86qigjCUeBRDzX8XiOYLYgcFhTZ1t9vi+lL2m1p8LISopOC+adCpcrMMPkfTzjesL
         gDTg1yyTDOR9cg5RCLfQ+nKSgrELxHCoPdL+afd0Oq8FcT/6BIQPk9SGJ2LAWPizAY/k
         9doJ3C3V9mXSOBcuWvxaQuDdrH3z6pimbzqIA4JmsEqPxX/HVQQo6TTfdNKvRTbKLeSf
         0eGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791372794; x=1791977594;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rnRfrie7kW8dU2T1uAcEvLq8NNMvKQJZG3o5AFfDelU=;
        b=KcU9zQszluncbAOF5eFEpw0Ib4vgb3kLfKerBe5VkJrxpWMcp4mnybaC47torpumQD
         PZDK239FWcLFQEqz3wpAAyiAfmzrl7NjRrhc0qj8IfEVJRPAwwTsXBu7bhzncNLp8aQO
         0RhIBJf5+zCC+6z7ZfdRXNCEp4KvXfsLaCQOkJRSz72NGDBo656cbnQPKnLiZn9+pMly
         L65AmYXc4q3TxQbor+m3fbeh/YK8fvJ04RPvNXC+Ex1HQqugDpyAqDB/Y8aORbJiUzdP
         +qJp90J0+IA4AeVnYD3aabHhjHMpxx+RotMo492MCZ+AwcIQ7wQZJ2+ivWDOQLT96Mmk
         RYDg==
X-Forwarded-Encrypted: i=1; AKwUvBy2xD0GopWUy2c9usAO4qLtqNVgVLKyXDKV/26aFzDGgVZprK5YsXl2HOw42x6Eez5Zf18VwHDRVqtG@vger.kernel.org
X-Gm-Message-State: AFuF++lkRqUuFxmQ8hCZWMLRcAdsb8hrfCyJl3jn4XI4waHWUa0KI+yS
	tATyZ/vjkkpmSfiFRxbcUvoIjpKntdGwFf1PSU+anS0rhDCJhm4stGTPvx8yaNXIoHSvXzfFg7j
	NxJiUHiCtPeJ4jLTGDZ+RbJtXVuzSwt6me03F0r+o7oKc2a2G9JOUv9iBD1t8iyJ4
X-Gm-Gg: AYBFou2oVCffDX2zmA6JYSmqWPqlPnFYwMOCzMvw3u8CVj+7IBPb8hwlspWVmMbobQ8
	ZsO1vaulRflCUYt68IEUJmZigja5QzNiC7syz01sZ2EMxkiJhBALCplb8hkEacDBVldYddonMGA
	1xEfhO5V57nQ3Mco5nlh5j0Ek1rZ5F9K+y9N48F8uF3x57TFQkE3Hos+WsDsfHO2Cl2zE2ZlRjH
	eKnwCF8JOAtpvNuLK1li0+lrikoJIC7fcsA3LDbVwXp+e1hSwgbX0HehPWsePejFKk5gRVaGb+G
	wrVNjS/TG4lXO00ZFfXTTS0pYud8hXZZoixOoMPlW3ZKrujfF+7w4OubKGsPg1r7nGYDjr5/Hvy
	AO+UzX+uN+x5OcDEfBeStfqoHIwHlcXIeCr45OQ==
X-Received: by 2002:a05:6a00:2188:b0:882:6d80:e5ad with SMTP id d2e1a72fcca58-891b0c83960mr1586055b3a.9.1791372793140;
        Wed, 07 Oct 2026 04:33:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:2188:b0:882:6d80:e5ad with SMTP id d2e1a72fcca58-891b0c83960mr1586011b3a.9.1791372792597;
        Wed, 07 Oct 2026 04:33:12 -0700 (PDT)
Received: from [10.218.41.37] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89188914299sm1203497b3a.15.2026.10.07.04.33.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 04:33:12 -0700 (PDT)
Message-ID: <f9c7bd4a-2e97-43e1-a9bf-295b841ef0a3@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 17:03:02 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] phy: qcom-qmp-ufs: Add Glymur support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        nitin.rawat@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20261007-glymur_ufs_qcb_enablement-v3-0-84cf4f861415@oss.qualcomm.com>
 <20261007-glymur_ufs_qcb_enablement-v3-5-84cf4f861415@oss.qualcomm.com>
 <zovl7lrhlleflaewk32o4wofr4bzm2bmkdnakev47peijrnkfe@p3ixrxltdpcm>
Content-Language: en-US
From: Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>
In-Reply-To: <zovl7lrhlleflaewk32o4wofr4bzm2bmkdnakev47peijrnkfe@p3ixrxltdpcm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0NSBTYWx0ZWRfXx3WmnBxUjB76
 XBm5KER+5cIjz1M4VM5WVnYt4qutiwSPS4/aTsKskYjYo4RmByXL+mLp36has61TZSaJsoJnihA
 It5nPCUbGNbq6oGbtot4P8DOWsq1Ah8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0NSBTYWx0ZWRfX9Kogxr2w5jwu
 IRLzmr1D6j8JfD6wEiGvwJu7l/TXr43Iw30UrQEN3NyLgikKbZRvpiuekN8m7bty5b+X4MpSFAv
 wDb0o/5GDQtJzFxZO61d2NFWNSiOx65F4HDBYge7SdZLg7rzkE/tZBkRBdU1FXXAl2KhZZrRuTf
 K83J+5VsIKFCW4LaM8GPGnfzmt/806Sm5LazqmJfJVo/yJaqwXXkeE+kVQWZQsb77GVu4b3HRXS
 bP52fwL6F8dGYQ9q8u60ife4mF9u+1uCZwVdMTCth6Bunhy++qnjBP/ycaf7RLKsJ4uUXp74DDf
 L9pCVQpYLwVkHq+XQMKSNGehZCP6L6VfZ7EbCVC1uIkHl3jrbZUIBxZIVx4gpDq2TBJidMBwROq
 1KJ+MfUPze5Jbcw7UuxIvHID7R4CYz31ZQlBwuJl9lWWb6s3tKIWIyKsHHFiM8vfERFboX9eu02
 keSD5CKN/T3FCaCvzyg==
X-Proofpoint-ORIG-GUID: O2Su9NoDI7DpEnqD8pmbtHXyzZeQfeFw
X-Authority-Analysis: v=2.4 cv=T5EZ3PKQ c=1 sm=1 tr=0 ts=6ac62dfa cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=FIX8ga0CBHvb0ZQaSzQA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: O2Su9NoDI7DpEnqD8pmbtHXyzZeQfeFw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070045



On 10/7/2026 1:18 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 07, 2026 at 11:59:38AM +0530, Pradeep P V K wrote:
>> Add the init sequence tables and config for the UFS QMP phy found in
>> the Glymur SoC.
>>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 99 +++++++++++++++++++++++++++++++++
>>  1 file changed, 99 insertions(+)
>>
>> +	.offsets		= &qmp_ufs_offsets_v6,
> 
> So, is it a PHY using v6 offsets, but v7 registers inside?
> 
The QSERDES RX0 register offsets on Glymur SoC are aligned with the v7 register layout offsets.
Therefore, the v7 QSERDES RX0 register offsets are used for Glymur (similar to SM8750).

>> +	.max_supported_gear	= UFS_HS_G5,
>> +
>> +	.vreg_list		= glymur_ufsphy_vreg_l,
>> +	.num_vregs		= ARRAY_SIZE(glymur_ufsphy_vreg_l),
>> +	.regs			= ufsphy_v6_regs_layout,
> 
> v7
> 
>> +};
>> +
>>  static const struct qmp_phy_cfg milos_ufsphy_cfg = {
>>  	.lanes			= 2,
>>  
> 

