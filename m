Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6930B36495D
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 14:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777992610; cv=none; b=BCU5SVLvTf8fzfDwlrKDfVML2vhkQB1GAEZbUAUSFn4rgrYSYL0xJWPyuodOlb716+DCP0/JhdnyZ7ybzF1DI0swy6962vRIqjhuvGPZ+cV92RqjQBeKq2ENDFjWh50faIAhhXFMMpTjjzvfLDTprTnPQl6z+fwXWO8Skredq3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777992610; c=relaxed/simple;
	bh=/ThHF8hJw+I5T6qQTw/Q1CJUS1knLMz9fJpBGnuPP7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vCFFP5WTLt3QKr29ICk3WfjbWk8+S7Yr3KtGEDmWFBF/RDbux7w2yIRL6fyQm7FWn0XmdfoeSX7tp9R239ommkYY8iQTX/DAQTwiOyLyKchm3JYSKxPn2txknXF2Z90DrhScX/83DSW2f6aW0ORsisw6Wg98676coJG3h/DjlSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l/9FEifz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HYfOPbc8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l/9FEifz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HYfOPbc8"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6459Ufxo3409256
	for <devicetree@vger.kernel.org>; Tue, 5 May 2026 14:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KBSnO8fLfv2V7HIGkj9CawV0Uw7GLfZNqY6E6hFC104=; b=l/9FEifzdbjK9Knf
	VYMr3kcwzNNLhbAzkKvw0GYs2OJ7sGEeOZWHWKf0cK+obbOnyvKMJDrIQJ8lgoHV
	XU/JcwvsxKjYVEKjIGZuOVpxLX4NZmGktmosZokNx+YJqslTQBCiGGl9BCYdMXNE
	crE7L0LpAeXm5vmofh7Uggtr3DCHMeTSJtLFDz6DF2o4nJfDx6jsKCqBo1yrq0Jy
	rqamtvs6nhXmQIdnBDGtNhhFEDzHZ0fsjdc6/iAFVW2wmae8RcSCd8kJi5+jxz5F
	c8fmALkBNzOLw+891xaprdQssFDUYsd3Hx7I5HqJ9STd75ldyI54mKNtTm1wzK9E
	wtw6lQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxx00vmab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 05 May 2026 14:50:08 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1309f4ee96dso2949032c88.1
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 07:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777992607; x=1778597407; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KBSnO8fLfv2V7HIGkj9CawV0Uw7GLfZNqY6E6hFC104=;
        b=HYfOPbc86IkFt32OydKGHNPuFrJhwRBtktawwqQaL7c+EwDKjquwu1Nyfu4zfnyZZ+
         LKuOVbPuGhWk8PkIk4FQLc4XJkqLBiSb/6+oKDCRJO1nUf1rRB3wJRc/v70wBRRgF9DN
         iSVh7qluczutqvfo49cFDgf2Wz1lIfLhGgt7anZasKbS1/LTjTUFjx2jK36v4tmJw6Ez
         37ahNZZYuKLmU1b9fyeb6hZOdAWCo5JJVOTt/emCyUSI1X3RhiKqbN2MymwCQvG1UfTy
         +I0/XzR6GoghJrUAswzo09bzPtargiq16SBaOR8Tm6AIg4rFQc8rullqQrhkI0rRDcDX
         GNhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777992607; x=1778597407;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KBSnO8fLfv2V7HIGkj9CawV0Uw7GLfZNqY6E6hFC104=;
        b=Wa2LTCMJITGdsQVowAZd8a05J/+ecd0p3pzbhgLYu4VFBq+7sRuicm0UP3u9HT5HKD
         mOmXJ1+nL1ZOcD8wQZ6L7vHmXgXdXQwU6coIKZODK8k3dAc0blLayZxMTp41oiqJKL/6
         QTnkKowQxqbTeqcgFygTvGcwuYvKtQ3SHw+y/NxiYOcNg2K675TQdp+TI5i5gyiSTqx2
         LlP1hGCkG1m63zrBE/zDoG0q5hPg7To8en8hHrsJdX52YFkLnI+LY86iWKU2cDmR1nIW
         K4vBS7CJNSxhq8XY1gOeEgdjd7wpoj8tSdlmgqC2JN/9rzRY280sO5uuscG97r8HpDSG
         YRgQ==
X-Forwarded-Encrypted: i=1; AFNElJ+8/0IKiZHUasqRFYRGcUD1KGsTIPElJkecwM+479VwP0/G0G3MsEs09gANlDHZvRSzcYBTUKlJQlWw@vger.kernel.org
X-Gm-Message-State: AOJu0YyqRndp8Dj3xm48oQXcCuFsSWGCav0VelgqqRAYc3s3t8ngustL
	fzcZjOCwaSubkkm5kKCkev4dOotOH0I7OW/gMKlFRYcUmqwIWVkI6SELg6q60ZxaXCUUbLifQDm
	qooVo2bGuNLfiQFWc7ixx3NWLvW4HT/A4kF9LG8e1fXPhiMAWLdvqwxp/DL5uj3bE
X-Gm-Gg: AeBDiesHyCoWh8p5ArxjRG0sqcTQUqwIwZa6qJ8AvtOQZsEyYb5poXzJ9pedjpx8bYm
	VyCqyy41ArvOKnlpPfHY2gLhuarZ3gZclGUJsTdy36O7gLD0uWoC78TIvTcxPkDLu1U/SR6BFyv
	nnTr80i37xtWPOnKQR/SGOC/DFQ+oNXxTQfxi68uEvIfK2sUI9WWraIxlTvSC2NCGU977AxYc13
	Y0X6rHuVGLgE445hVmvrD1IOoxSFkr3QwD8ECNvt4xFMpg33BteOtOcHp/nAfDtIHS6Yxgcwf53
	fsBPUZA17CLYFzwbeeqThF/pP/4UpSohuoO2EJDSp7uOYOAWBBrKBnLBcLAxyG6NplVCzsOyC7C
	OYlVkg71hTw4fiI0wjcyxLUqv4iHhzh4AO5EhAPXg1oqra4qGHpECyrOnRhAtpS+tscjRgI3+fw
	d81pyBpOn32qsmIolG
X-Received: by 2002:a05:7022:6628:b0:122:33e:6d41 with SMTP id a92af1059eb24-12dfd84327fmr6504967c88.23.1777992607375;
        Tue, 05 May 2026 07:50:07 -0700 (PDT)
X-Received: by 2002:a05:7022:6628:b0:122:33e:6d41 with SMTP id a92af1059eb24-12dfd84327fmr6504928c88.23.1777992606769;
        Tue, 05 May 2026 07:50:06 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df8279e57sm19149584c88.3.2026.05.05.07.50.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 07:50:05 -0700 (PDT)
Message-ID: <ae68bdb3-d683-4e7a-a27f-739214656ce2@oss.qualcomm.com>
Date: Tue, 5 May 2026 07:50:03 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/16] wifi: ath12k: Switch to generic PAS TZ APIs
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org,
        konradybcio@kernel.org,
        Sowmiya Sree Elavalagan <sowmiya.elavalagan@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260504130603.1474043-1-sumit.garg@kernel.org>
 <20260504130603.1474043-15-sumit.garg@kernel.org>
 <3bfdc11c-115f-45ab-b0ab-75ad88dc6f31@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3bfdc11c-115f-45ab-b0ab-75ad88dc6f31@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=APflyhIR c=1 sm=1 tr=0 ts=69fa03a0 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VMT16xk1LGalzlQIQqAA:9 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE0MSBTYWx0ZWRfX6F2/BLxDqucV
 SW9uLkpQhtZMFTDiNac7gJmYPLhQZ9oR8bO0KZNlLbODGYLir7AZiclwN7adQqf+JOjS4lR4v1M
 XZ79Eq7Fdv5AAuqpGGC9+WRMfMXCTKgKPsmD0DP1dcIDz9m0gWMPacNHxqPdW3bJ3SBZSWuezI+
 qzWAt365Us5zIbc3EvHZDkPbw4cu9e1QZHI2gX6y3+q2cnc5yDjhXNM4tXAYSB4De+UtrgTzfch
 FYrDsx5pLAT/8kdPA9ZOBeTA9TRw7MZHpbqE7ySBYQZC7frfmeJUjVVCpeqeBhrWICar5Y739v4
 J/9WAiHeGByw4/q7IHr7EC26grqlsYiVcGHdaeibG1vdqaHiIVqn3DLL6+ARXVxck3zv3dk4ICc
 EcpnKdw9LcmuppxkwWqR37Vab2u3Rj1p5HhP098XuipR3ZbBXv0bgwqJX4hc53sUAPX/TzSW9xW
 W2tvZtuKLk4S+CpF7Cw==
X-Proofpoint-GUID: 8gpUR5wrNE4YinqFxQIlreLkbdj8khmY
X-Proofpoint-ORIG-GUID: 8gpUR5wrNE4YinqFxQIlreLkbdj8khmY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050141

On 5/5/2026 7:27 AM, Jeff Johnson wrote:
> On 5/4/2026 6:06 AM, Sumit Garg wrote:
>> @@ -485,9 +485,9 @@ static void ath12k_ahb_power_down(struct ath12k_base *ab, bool is_suspend)
>>  		pasid = (u32_encode_bits(ab_ahb->userpd_id, ATH12K_USERPD_ID_MASK)) |
>>  			 ATH12K_AHB_UPD_SWID;
>>  		/* Release the firmware */
>> -		ret = qcom_scm_pas_shutdown(pasid);
>> +		ret = qcom_pas_shutdown(pasid);
>>  		if (ret)
>> -			ath12k_err(ab, "scm pas shutdown failed for userPD%d\n",
>> +			ath12k_err(ab, "pas shutdown failed for userPD%d: %d\n",
>>  				   ab_ahb->userpd_id);
> 
> at some point the "ret" param was dropped, and this now generates build warnings
The 'ret' param was dropped by:
8fb66931fe31 ("wifi: ath12k: Enable IPQ5424 WiFi device support")

Not sure if that was on purpose or accidental. Sowmiya?

-       if (ret)
-               ath12k_err(ab, "scm pas shutdown failed for userPD%d: %d\n",
-                          ab_ahb->userpd_id, ret);
...
+               if (ret)
+                       ath12k_err(ab, "scm pas shutdown failed for userPD%d\n",
+                                  ab_ahb->userpd_id);




