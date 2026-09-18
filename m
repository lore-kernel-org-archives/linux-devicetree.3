Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D8C456E0B
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 11:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789731095; cv=none; b=F+dJF3bLFp0nQ0oyy3Yjh3ypWnLS7GG0ybafLcKo32yxqYlmvhobiijhCo0Z0qwcSEIqkjFK3/lnyb2wsar+6dpJk+3el2n/8VxM5wB/wmWVnM3Z4laSkyExmM7BtlNeZVLvY/kfOs3Ehx2Dwp2/5yAp7ZmGpU19pNqeaOMRw9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789731095; c=relaxed/simple;
	bh=nSJiNBakj4emOsSacF3nvZXhxu4+N+4Jm9sSlg+AafI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=olkPoQmMNWBKh9FKFWPvfbfS6DXZjXgCFlN4U4vthFmrweCMh14T8Lu5FGFKuwv/7EMiuu98YibA1fV2oJgQFN8VAOOL0eeDqT1JyYGrsE/kv46WZf7Yv4YqopDFRLM/sCfhiE1zEhXbEACKMhhmH0E8z6daLOpMNp4JHfA48Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n7VF9xQM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SFAMh6qG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n7VF9xQM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SFAMh6qG"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dgVb1213653
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 11:31:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2DmYpDpaC3qX+0xz3L8WQVvo5LxyvhDx4KZp32Me5qY=; b=n7VF9xQM70RRj+t8
	ENq2TnfEwl75DANZo2i6Fo+CSCDZjO+nhrCARSZ/IfO0Z+yqgV7k4aenR3OedW5r
	VrvL67T9eTu6BAIwz3nuAToaaSXzKHxoHlKsHlF+j836AZdrkfHpRyuGqlphXcb2
	U8awAxEWg5T5nXsW4OLxLJU6XCetwbRCGvfGMT8u+795CSBYkz0wD4B1EwTQ6Ffu
	r6GlloMdsSGhut2HopRLW5k1+QVESgJaU7+LtTsqqLNXjkvebBP9HS3aZfHB7lPd
	mMszHiWOMJuoLx4eSWFQ+WRtTuqAAFaFOZ/DPvs/v5criSr35F6f6NVRsB3SvY+Q
	Rq2L/Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrg42wuq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 11:31:33 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb48f41343aso1657937a12.1
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 04:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789731093; x=1790335893; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2DmYpDpaC3qX+0xz3L8WQVvo5LxyvhDx4KZp32Me5qY=;
        b=SFAMh6qG71wzZOKBabWyCCVC1EIRjEy0mxZV1jrqtgkdWYV7HcetJ7FrgDYQA8gsxY
         wGdSpid/sOWepC2Y8uzcrKf7u25hexNc/WsuHujT7KQZ9KsTMS6diwlKa3wNomg6CSgX
         oXCnxW8HMR4+27dRjS37NwL3uKbzi7AxKIyavhuqIAaXsTyfHa9B6Gzg380NLn/RBUZD
         0wsPSD1vxl1jhoIQVUQNW8gx6TiumbxHWMTg4Q6hRxITHjMXNz7qLZczesnqL71dKsZw
         kbZZfvzjQwFzgXXZataNA32p1UgOTN4ZDE0/deFeiztFTImiTNcyMOazcErpNBivgs0O
         ZpOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789731093; x=1790335893;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2DmYpDpaC3qX+0xz3L8WQVvo5LxyvhDx4KZp32Me5qY=;
        b=XnFgNUWs+up3LPq5sOKx7M3dOT8gg6A9ny6SSroFRATMCQSwdXPKAFSlVsQGQxEH4P
         ArCMwdlp9DpEa4oM8Llkf8q6rdukTp8y26JsjWEnzTygZ2O4HlmoCeTxzhnhbLCbDOVx
         3HDwKtj1pSwo28bEx7vT+Y5KYOesuK4988VOpry16PQtDszLOSivRVCsllHiB0Roaldz
         NgmBiJNV5Fzp9O6O97VaikXu0yNLBPiL6Rhq+FrTMs6NJqXUBvg/40AQ00BvnRMYFuaY
         MYJdniJ1BFOIVVoFRJ2CqDh57ShbjfpS8qVzNDoQ5FxO6MyyhY4cLQrKlxT615U8w1cJ
         4o9w==
X-Forwarded-Encrypted: i=1; AKwUvBzDHzIW7cXj1JNAARZ2Gz9jvAMRnOM/FXNwo/q6pbnqQfw3GbIrqnLCJ5yLGLK6BfZQtu+gFUH+Kqz0@vger.kernel.org
X-Gm-Message-State: AFuF++kVsxrZpUXImvz4dplOGsWW60dFQ43o+tdT1cYLhkq0nDU9ulhc
	jtixF/IFbT/iTVRguHQ4VNoNjsbeaWKDrQn0cO7rrsfSKZe3ga0Ie2vT99fwfI5yg9e3vC+lmHf
	94n+ucAE2nDCHLm/0fV9m2LzagVaLVVqPANHJa5ohYQbT2zX4v93LtHj9HeKa2ZDg
X-Gm-Gg: AYBFou2x+uXyC4Tq455iRhJefKQIvq9nXvSKbpm/dJNra1AoSzPbA50BlG2BEARXb4V
	/wRe4BmmuTm9v1+CjlHWnrgsfE2cuOsaJq+0ufKPxoeRjiDroOewpPwslex86Ri9Q8tOg7+8G1b
	aJ94kP8jGMArlZLobk4YBtiM9xamygxmrOGnbDFJkOteb7TpFgnEAjvU1LN2vtI/RDBStNGJn2/
	hhaDYO3wPPFdbTD3oBwPKOTnbvSHI4AWfEnvYXLTQJ8aHDwEfrGew7lHCsa1y7u8TdN1BFh/YvT
	/pSLPvr6qtIVZKcAnZFCCTqK6IDkbytpJLG9lwBmBMcwE1ZljXKL5UCKz8bohdlaEiLWbxy0LqU
	hinxq5xibUETOZgdCY7GvXhIp
X-Received: by 2002:a17:90b:4acc:b0:398:9beb:a2b4 with SMTP id 98e67ed59e1d1-39e36157fe8mr10059775a91.22.1789731092712;
        Fri, 18 Sep 2026 04:31:32 -0700 (PDT)
X-Received: by 2002:a17:90b:4acc:b0:398:9beb:a2b4 with SMTP id 98e67ed59e1d1-39e36157fe8mr10059729a91.22.1789731092255;
        Fri, 18 Sep 2026 04:31:32 -0700 (PDT)
Received: from [10.218.25.214] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c2876965dsm5375819eec.19.2026.09.18.04.31.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 04:31:31 -0700 (PDT)
Message-ID: <cf538030-63be-46e0-8800-10dfb941a388@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 17:01:26 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] pinctrl: qcom: Add qcs615 lpass lpi pinctrl driver
From: Karthik S <karthik.s@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260908075854.3015560-1-karthik.s@oss.qualcomm.com>
 <20260908075854.3015560-3-karthik.s@oss.qualcomm.com>
 <83509feb-8776-4f61-9bc8-aca27d7c234b@oss.qualcomm.com>
 <ed2cba23-5511-4787-8cb7-7c8207c21f25@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ed2cba23-5511-4787-8cb7-7c8207c21f25@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nAPzdUNiA40bYm8D-4EcgMjif65wsUSi
X-Authority-Analysis: v=2.4 cv=ZO9CCn7b c=1 sm=1 tr=0 ts=6aad2115 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=iMoLkvK7-tmY2ETxFN8A:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: nAPzdUNiA40bYm8D-4EcgMjif65wsUSi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE2MSBTYWx0ZWRfX1MpmjPm6gUBw
 KUkqq4G/1N4tFXjdtTu1XgVcAkEZUejGFCbkzP/t3XVDxcms5C2bT1+tFedubiCv/JQKWEfDeJl
 cy6zWWYWktE2hE+2hwUkvjXfWiuDotsK5lNWafqOee/LOEhL/N1LKdGOaDDjgHm9cHOQ5xQ7z4W
 MJlhbmoek89I6OuBT5AAgMkxXmVMo86EqJV6Q2NWzKyXpfdmxEpd9Fyh3+3JylZMOj9F+XBVSC2
 TRlzshMFRRtbe+cWAX0PCt2NPvonHXkReSxxx+zsAEEYTiSdisiZ0vSC/JjyHKjjWrNkdr2bBw8
 eBKxVJPvRETW6x0ol8o34ZAf+XGMdGKJRM98Y3lZPgeZ00Gl5rMa788dJEeiLE7xcWyzXR/5tEL
 2QYrfZENo+aaqsO7/enyntfT+beCqZfCvK/JmLtytkWzhgM0KxJ5t14/UvdkV6h9p3iYVg067Vq
 ikfFD6mRu7JxGas5SrA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE2MSBTYWx0ZWRfXzsWPFlDcgsOH
 RvESzMCp1QcRGQy55RZxripjnUI3+5lqC/HRa3D+wGFAAez2egO0GitZ+2t51tP2hd8d2OtrVCH
 M1692a/x6bUcPTeQtMi10T4XNEHz6o4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180161



On 9/17/2026 5:35 PM, Karthik S wrote:
> As you suggested we tried pinctrl-sdm670-lpass-lpi.c on QCS615 and it 
> works fine, the alternate functions seem to be similar between sdm670 
> and QCS615, we will use the existing pinctrl driver and post the dts and 
> machine driver changes for the same.

hi Konrad,

but we will have to add pm_ops support for enablement of clocks, similar 
to sc8280xp lpi to scdm670 lpass lpi pinctrl driver.

Thanks and regards,
karthik S
