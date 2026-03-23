Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D44369204
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 18:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774289775; cv=none; b=oJbL30LLplAXsux0E+aL2roVPkhjJBcii0QSKR7VIQskhalswukYuE5yxKHoMxhMx6Ywd9sZ05XEWzNNI6k+k9sWvWo/HF9Rbihnjtkd6n6eMd02wo/IOUx05aObZRl5XOSzXsFTtJ/xVmaz2DfoqgVKGmAm0t8YXDV61OQ5iwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774289775; c=relaxed/simple;
	bh=AHkrab8FjMIfXIuCvFU94YWqLrlh7O7+AliofJ8LF+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HMOAhupZB6fqvLSatb8eNxrK+mT4GRwzXfzNtm9AysypG3tHTmM2NjVCSExkNELycNND5pLT7uZ72MXd5jobivltxcNvJyvLGbt2MpDyoV+4lduaBoxN36Cm3VTEcjCJ0AeissyTxYkSf2IOrnaVTkTsAP2eg2B4yE3Gie+4HpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N5FwOEIB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YFND4ec0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N5FwOEIB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YFND4ec0"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqlUW3634578
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 18:16:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7zsKsvNSnViCNaJ8WrMUKsZlsQS+pODM3b6G7MOgNvM=; b=N5FwOEIBYHwiK/ME
	7Xx2OWz92Qga6MM2uyuO537Pv2jpCKtIeTP9cBs8GwYsk2tJL8u2CIQl2jLIMViE
	U1IvRhWKvVwb+S23QSyzbMtnd9OtCPZAGFIBGyJRCjZ9IlrSAMbGbSg2qFMUzPSy
	z8s980PcIUHy6jTsIjaxqMqZZCyyonKkiMYKE6VywFoBvHh4oB7xzMhC//LgOXTY
	T/dRbBz7fAyIt7VBN8pr5x8ULulD58GLZ7puBwhRoteNz1Z5xO71fJRKu4eTvLwy
	gCc7KwrsCenXO23j7onVZkDBfpioEWHHeRqvQs62bg9jV9INKH6veiPDyGWUr6D9
	QMq6iQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34k4hhgp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 18:16:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aec8d85199so48033445ad.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 11:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774289771; x=1774894571; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7zsKsvNSnViCNaJ8WrMUKsZlsQS+pODM3b6G7MOgNvM=;
        b=YFND4ec0IvOnLC0zSePwS0s0FSgjvsGaGzyfKhLp1haOqSpka6RbSm993WAEeYjrS6
         +BEmLSGv1HuKOTMig8aCXuUnEIo7sO17bgX37Q4756OXzbutHALtn1L4Db4acSdyQdtV
         KY3OXys/pbfsJXpJ96ZFfIrJHnWhlegOxqvZmO6R97zWb/FxrRoAAUIdDQr89JpyiC8a
         ch+6G2I18h2ueO6vmkt0xdA/BOWueLVFQJjgPKoKQj2atIDHaFr3RHbag6I+DZiTtRsc
         IgJXk6p2T9tMOFLqFmziohdvtpRth4ngfQi9mqvlUE+zazRl0r8gwq0IgCEv4PX7O+bi
         KZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774289771; x=1774894571;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7zsKsvNSnViCNaJ8WrMUKsZlsQS+pODM3b6G7MOgNvM=;
        b=kvTDh5LKjI20D/iYOiT5uEOS8wrv5RNe/UV3kyJO88c/f3vL6RjCJW+wHf0q5R5Cao
         PL0W9Gv2jT/ZQlhPfguWkUB54rbIQAIqA6c/KAjEkfHeoDOTZ8/YmeTchI6NSHNyoyHm
         VTU5H7cBdrORYVR3LHaYDn+EaMdkCDfRKv2A3G0ObypF4ZLNObMOr1r55aecppf0E/VF
         9IfTcUmJam+gZ10jyamQh1Swv/6sAjsu+j+XBZXTPMBLMrKvGedsKKwSlYpYoLMk5DXf
         yy34l05chVaIZADgvkMOwCgaPKuLZ89uDPbkZZFAmcpeYdWsQafE4jpYKAj7HCY+6i5W
         4lZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIAwpL07LAQRmx57wWF9FuUHMVwr0tELJXFkdIO9fDBI8+TqH7uEvGdtZwjdZ3l4Tr4OaMJkWzZCVK@vger.kernel.org
X-Gm-Message-State: AOJu0Yxls+ZNtRPZnh1VK5uZLjEqE4lPxfHh56PM3bf2KQJe5e7No0pR
	6nljKaOCNw8CSu0NPwdKijwBqzci2lPOqj2KTAbxA6pjMJX08/FRYOkRVIrX1surCyX9CkqXU0L
	/mUMqLtbHaBMCN9otPHMMMJcTUPpJp9lgg87CJw/rOn8FECaDIOQs9/MpEZNkZmBj
X-Gm-Gg: ATEYQzwDRxeaqW3zc/at85Cocr+9mj9HnOB634BYBtvDruEMBn6y2dFlHy8KzM8gkCy
	EN58Y/ZMM9iiYI9KiIXgH1fOCtzsSP9EfM53Y4SeUm04Yhxprq7KgXzDFSFuIFi8QAVzUDTAFru
	vgPgzrP9MRpM1nALGyMw0DEJMJGKOqmiOrwiy6rhYaa0LXwFBB4GJRnfn95CAX6OuYlFGZhWNAP
	gDmGEGVvBxg7+tBTkVJAuzA6Fg5BWpr+7eWWnXd5wVOFyfImlG9lAFL21gpVg3NG6s89JEUMvQw
	vb4MZ45vsaho42lHWbGPeSEO25hZ1pO+hTfLuWIrrj7YHSKmAP4K+xAJ7yHftCSsC30PR1Fn3ML
	SemXT9a+GmplJKKP4TqH/lTpH7+ZlE+05/Bcc37CeSvzn8g+Y
X-Received: by 2002:a17:903:2c10:b0:2ae:ced7:465f with SMTP id d9443c01a7336-2b0a4db3af2mr3954185ad.7.1774289771188;
        Mon, 23 Mar 2026 11:16:11 -0700 (PDT)
X-Received: by 2002:a17:903:2c10:b0:2ae:ced7:465f with SMTP id d9443c01a7336-2b0a4db3af2mr3953945ad.7.1774289770636;
        Mon, 23 Mar 2026 11:16:10 -0700 (PDT)
Received: from [10.218.7.247] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836a3430sm112302905ad.79.2026.03.23.11.16.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 11:16:10 -0700 (PDT)
Message-ID: <2bd1e03a-7da4-412b-8b90-4f449942211f@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 23:46:04 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: eliza: Disable UFS MCQ mode
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com>
 <20260322-eliza-base-dt-fixes-v1-3-c633a6064a24@oss.qualcomm.com>
 <7bpvzg5zkytzgorbuxyo77aj6egcyll4qbzxqknearhxmttzl6@bbrcbxlowtvm>
Content-Language: en-US
From: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
In-Reply-To: <7bpvzg5zkytzgorbuxyo77aj6egcyll4qbzxqknearhxmttzl6@bbrcbxlowtvm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CpC-MraEZsIqyp9s4UpewO_fgRgGU47D
X-Proofpoint-ORIG-GUID: CpC-MraEZsIqyp9s4UpewO_fgRgGU47D
X-Authority-Analysis: v=2.4 cv=c+imgB9l c=1 sm=1 tr=0 ts=69c1836b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=htRBAqg6l9hWmXmz9CoA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEzNSBTYWx0ZWRfX+ZIMdJumf2QE
 n2GIp+0JC9/6ZxJwccYqCPGLgni0e8mxX4hDuzPvajovH/MoFblo+UfGYlgzMCJnYpHXYm/Ld6o
 fRhNJnoaJ9loSAAGR7xr8eLMFJp6myu1wy9ZOK3wfDiEnnLOGzwfszkqg64xJH4/5KRbJ1ne4fU
 gQSs4ur9/S9EhEquu0194Sn4jBuovuSyt4xdu85uMWuks2bSjWIoHPc7tZgm2H3MIHUHeaIaUC0
 /ibOTEsdejnU2bROFidWfHlghD+5sNGVrNdOCvOaHbIJwp8qJbiw2tXdAIxmOn5rJrYioispBdh
 ZmpZWHbtz+7NI3aTVuf7NRWF4z43du2szlAMdf/Sr28lGxToUuPve0Az6Pep8QlhDWK/ZN2DKSr
 /0py8/y8xK9EZFAsk2uRwZkFg7CSyX7039WbH7DN+EV+VaIUzuVrzBMglKWlQPUquoTZww+bPer
 /eBheGXZATXItyH/4WQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230135



On 3/23/2026 11:33 PM, Abel Vesa wrote:
> On 26-03-22 18:08:21, Abel Vesa wrote:
>> The UFS MCQ mode is currently not functional in the driver. Eliza is
>> the first platform enabling it, which results in UFS failures at runtime
>> with errors such as:
>>
>>    ufshcd-qcom 1d84000.ufshc: ufshcd_abort: Device abort task at tag 4
>>    ufs_device_wlun 0:0:0:49488: tag#4 CDB: opcode=0x1b 1b 00 00 00 10 00
>>
>> The failures occur when accessing the UFS device, while the controller
>> and PHY initialize correctly.
>>
>> Disable MCQ mode by removing the corresponding register range. This can
>> be reverted once MCQ support is fixed in the driver.
> 
> Nitin, care to comment?

Hi Abel,

Validated MCQ on SM8750 and SM8650 now with ESI both enabled and 
disabled, and it is working as expected with no errors observed. 
Mounting, read/write operations, and runtime suspend/resume were 
validated successfully. will post the MCQ enablement device tree changes 
for these targets tomorrow.

It appears that some changes may be missing on Eliza, which will need to 
be debugged separately.

Regards,
Nitin
