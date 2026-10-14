Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3B95625EA
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 18:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792002466; cv=none; b=CbtAXU75A8sRHcx6BJUr7i6VgJ+a6KqTAVZMusGtYSTOdfliFj0QurFukrKEfoyl9oO2srJouSSxbS+LZoMK9pMtikAd/oDtmnUsp5n0szQ/K7Y4WWTynN1dcC+OvJWeTjqMN3Gpo/N8yJ7e0KpeoXPfAPBJdfs60oJAJo87wyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792002466; c=relaxed/simple;
	bh=U/Vkfvw4hnItpjnozIJs+gajkX/CA0gS8JJ2x/F0i/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SgW+jDBe6Eb2aXJj9Tp4TmYQHttwBVOTWQ+I2uLyDHygEgSvTbDRvCTaQ/4SAe806txOcGMvaT4b54jv66Q3/5wm0aQKIxNpAbdZkylNN4v+hCVs98awcoBE9sKWHAopTNv03J1gserdxlLiMpaM9lG3Opc/DKYbcwlr1Mfiscg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P5G2o/ou; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fg3pyaqz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P5G2o/ou";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fg3pyaqz"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EFpdko1672284
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 18:27:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XCRXy6jRcZHOHEg2EMNJm5Fu8QWLy5d9vUyJpE6AgZI=; b=P5G2o/ouR6X6YCn6
	8Tzjl5CMhTTYzO5hYCJiyE2kEVfWYEJlBkLKJlCZxmJQfMXaE5wOEkj51EU5kRw+
	MMb3GwlYPXRhvih5hiZQbuG7wnj0gr3Ti5PIg1r8NOYyU5Oea7QEMHT53IYZgZtc
	srlkguPgvRpvu/+5L2QLlCLo3U1S4iMI0wngWOrjUmvKOdQAhQafq8tleH+eG10P
	piJjcvX1Z4ME2P33F02AjaB2ZwTKE5Tn2g8Jaq7oWO0lw+z5WdLTHaKyz7QlVzTP
	pHjUt26WEvT2QPHU1h343W6t7EUtrXGPPCYpOJ/6sbXaoADjmayb2vhyoz1DG+q0
	+HB/Pg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacrh8m99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 18:27:43 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-17dc865c94cso685193c88.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 11:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792002463; x=1792607263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XCRXy6jRcZHOHEg2EMNJm5Fu8QWLy5d9vUyJpE6AgZI=;
        b=fg3pyaqzbZxBwOCkTA9T4auGw5a7Iwai3B4qv/5Dhnc+ZJdnp5bh85jLIDal0lGjd4
         IoBiNObtV4LUo8XkbETftr6fm+d8xQSdCCOmXDwx1F62nHCf9oshRWSnqR61t6vG3dAi
         Y3e2PtJ57vaey6D16AfAFDByRD4dA1mIT15tWBZKm5xDt2pEMcVxu1l1XqJuGI2QTiQA
         bgXQgOJLu/XgBHj51coNA9/AaLxEF1oqrIhiRKil5bsdMIy5Wu1IgaauGwsFcd5YTbhL
         eTla3LpRMxi/PtPWsZa9CiXvaGon5lS+Vci98FC5jdbuDiMjDpg2GQ0HFy7D4sdqPRkr
         77Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792002463; x=1792607263;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XCRXy6jRcZHOHEg2EMNJm5Fu8QWLy5d9vUyJpE6AgZI=;
        b=LQfYlY8AjD9usQZz6NifOBF8Btn/3+9S6mOdex+hMRx+vAtaccVPdq5mO08SpdeB/Y
         NpPVsTDIEvOVkp/2er6S3afDeSsagZr3FUTtVVO64a2C65WtB0DQ7hmtgupKmscRcz0K
         5KnBukQkfOziTY3/3QmKvm3G95xzAe0KcOKFl6T0Hxtt7VEmIKHN+eJKGpYeuCVYdwgT
         7tn+BZG73+VyWTvguh/nP42KVNgooQhDh50IpCHE2il50A/I85Bb8Qii4uyNeii2fUz6
         VVct+2TThw6ggnKgBM/oIZ/uGYiDlyUc92ALP4aGvJA0o0HgebgVTaxls7xqgAvjc7Ls
         oWnA==
X-Forwarded-Encrypted: i=1; AKwUvBxDiYE73PKUUH+i3cL4xYh6H1Y32Y9I8jFPsNymhEik785axeCjrH6iv9jdDJC89UYBLxY3813efPLm@vger.kernel.org
X-Gm-Message-State: AFq9FYL/RuFOcf8xp8MqAl6wb+K8WgITRV9nCTW9VhZ/6zfR6sZkvpPy
	eJMm18IF9Ie6Y5cqmacdaTirYzwrb3CB2F6drIbKlKSwyv5Zlpvlw7av3FXlIJFkerdYwrWgtVg
	piRsMgS4a9eDuL6Rxy+j/23UN4pk1iMMP5knOPy3KO03jfN8bZL5DQK/4KJlAmlhD
X-Gm-Gg: AYBFou2jMhEnI5x7v46GuYy9+ar96/4zoMFcDPpO3ZMks1O9brTjWHRQAAiy6KiIbHb
	HFpnO5ArnqTTSDelcD/XVS3E4cGDvV6JQO1NW3JO95n4DZpYR1hurZG01zozbTkSIKnZlNemUzj
	ybzDvoRC53MJSCZiC1f54Jkkgf2fwMOKLstAwrjT93M5/MKi7aHtMvMRoPa00evand1tnuq2DwM
	0OAqedgoX69K2bSRINXlviLF+cnWHQ3kTKRPSqEhci1f9mmDFJn+kt3eqdQlyzFMGn9zWb5sbTu
	W2b3CCZKc3CnhdZI6FLfkqQ8W0qzlZ3DPcH9lretZFTfvjzprLuiiBpnW5QMK9Hgp7ByaoVo3H/
	fsueFoSQf7LLxCAyOGtdW7Kqx/ZvDLuhZ
X-Received: by 2002:a05:701b:2084:10b0:143:8188:fafe with SMTP id a92af1059eb24-16a63099ec2mr24162441c88.41.1792002462815;
        Wed, 14 Oct 2026 11:27:42 -0700 (PDT)
X-Received: by 2002:a05:701b:2084:10b0:143:8188:fafe with SMTP id a92af1059eb24-16a63099ec2mr24162381c88.41.1792002461889;
        Wed, 14 Oct 2026 11:27:41 -0700 (PDT)
Received: from [192.168.1.2] ([106.222.235.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442956asm62360686c88.16.2026.10.14.11.27.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 11:27:41 -0700 (PDT)
Message-ID: <02a7367f-ea7f-4c20-91c4-03b751562ea0@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 23:57:36 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] i2c: qcom-target: Add driver for Qualcomm I2C
 target controller
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261005-i2c-qcom-slave-v5-0-6254cc7c08d3@oss.qualcomm.com>
 <20261005-i2c-qcom-slave-v5-2-6254cc7c08d3@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261005-i2c-qcom-slave-v5-2-6254cc7c08d3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eK9md520UaRmUmamlt5Ei4LDbQmRHyO7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA3MyBTYWx0ZWRfX711GcZw5mx6q
 mcCe/saI1PhHqJ7NVSOy9TA/BgKJ+XjF+rKe46TRfnTAAeHp7FYL4T+7XVq7XcZU3IHVvQSteaQ
 9L7FJFmAm+M0qaYWmtl3Roi6M7BFUVk=
X-Proofpoint-GUID: eK9md520UaRmUmamlt5Ei4LDbQmRHyO7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA3MyBTYWx0ZWRfX/1MplW70lp88
 3yr7OlcdmUXN8Xwl7Fkyw8ILl8Jhie7Ulgfv/8Oc0s1MRei6EwwoigT5FuCa9X8RLSqHAQefFIj
 u0hirFW2tjauc/lKyqRYOt5fpTeLSxLzeapHREZsnTp/A9pa6aA2gZEV0+GV8f5m0Qt1eu8VCbm
 RGmAVb30t4Wfjwe2G6xSQX0HmxOE9McGMF0+J+LGKgrwKC7GfdOC/ucItOgfIhkJhrfbkmlG9Rc
 AGtZy0q5582YTDbgOHFvzkxdP4wRIslhCjUWIDw9uyeYfpx71I4cMIjz86wbvQ8fDZRX2tm76uK
 PPTyS9OfdD+4Yl5KXgDWlwIbuSPlX7Jpp7pBL5vslCTQSN5RRfZxJ2q4OitERNXgJx8N1jZCwAv
 v9cm8NK5Q3KyDq96cV2GYIiqZpVBBu/DcfruyoxHgrRVmuMLhT43OVq1DpvUcvWE7W2XG7HEKK+
 gC6q+sVsMH/WqAWDl4Q==
X-Authority-Analysis: v=2.4 cv=SYZi5fRu c=1 sm=1 tr=0 ts=6acfc99f cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=N5Y/PXOiYxOVLBGg3HvMCg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=b46tEugvMB0N3bD9OT0A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140073



On 10/5/2026 10:15 PM, Viken Dadhaniya wrote:
> QDU1000 and related Qualcomm SoCs include a dedicated I2C target
> controller that operates exclusively in target mode. The existing
> Qualcomm I2C controller drivers, GENI and QUP, are master-only and
> cannot serve systems where the SoC must respond as an I2C target on
> the bus.
> 
> Register the controller with the Linux I2C slave framework through
> i2c_algorithm.reg_slave and i2c_algorithm.unreg_slave. This allows
> standard slave backends, such as slave-24c02, to be attached at
> runtime through i2c_slave_register().
> 
> Handle IRQ events for RX FIFO service, clock stretching during read
> and write phases, STOP and repeated-start conditions, and error
> recovery through a software reset.
> 
> Enable the required AHB and XO clocks and vote for interconnect
> bandwidth. Restore the hardware state across system suspend and
> resume using regular system-sleep PM callbacks.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---

Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>

