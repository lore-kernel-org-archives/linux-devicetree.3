Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EBD369D41
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779353651; cv=none; b=RUAsVz01EKs56evOSFlvk+Rq9G8oO5ByPghAFGIs1aYaKCqAKbaXUf1DG14Rnbuim/IzAwwQjcYSB+uHuaY9/47aPfwzYmCJQjBlBcNVMiillotUgRk4DSUUv962T8brbY2l8pQcT0D4egh2hZDwiGgfJLd51rwQi3mB8mSrfNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779353651; c=relaxed/simple;
	bh=B5qsYpbh9omGjcvhHLQGohxpwuyFWi1vSGi2dc96Cic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eUAlpQT9SmM9IHN1/y1/HM8frKQ8+5yYiISzT8526hM3EKlEHQmaIyVcKU7PlB9wYaKZisdmFwJ3z4MhrBczJlygtYGILbx0vv6P1dN32etajbaqRd8g7KDqLDJlOJKPZwm4zR+UBbzHkOJ67eaZBu3T2t/I8aVj3X71A9H+OEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lrFQNDOq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hgx799Qv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lrFQNDOq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hgx799Qv"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L6AAwt1797936
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:54:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v692eTKlDFQGKi6VPiSwojmbe3259bYPJucXnvxV50c=; b=lrFQNDOqLigfATeo
	ILD7zYr6EFuZEWZVySCOi9T3giU0ZrG9Y0erUE97iE5nuSVv+LO0pZmpClnlYs2I
	OHeLZ5OgpeQS76AcVh0D664APkYyNbUAjz2mp1c4XuxMJFLT0Hx2UFIU3H+oa+Qs
	+0gyVH8cWCyb7zY/cbjC2N+HUtTlMO+UJswOqoE4H+1zURNyG9pKynPr7hy3PHT9
	uvMTtbtMmvhyFxzkSufWG6phWotWwNpqmdEuIliQRC1j7x+VN9uJgqZZYQz3Hyl8
	/2hVOt3P3n0j7e792BC7Gb0L6dSRV9Fo/01kPo2nMAenog4dynjwKxKR/MYeJaQ6
	kKc5XA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9dxu446m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:54:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e576143baso16594911cf.2
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 01:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779353649; x=1779958449; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v692eTKlDFQGKi6VPiSwojmbe3259bYPJucXnvxV50c=;
        b=hgx799QvgZqBHHVMYWwCboaQx1odYfWcrYulxEoKSUiNSHPiR5SaNGkpTNM9lV3aQ2
         BuQu8Tta+3td2Ejwk7ZopZpkf7MNXucr6q1E27NYSEK+i9DtpyCztT0rPVZPAfo/HIb3
         WEkXzSkV7lZFMhkF0xbk4OtrWxnmlDPAvyPluOeS6EBLEUtjPnPToGJaVFzz6ATUpHBv
         VLZF08dG1P7J6YdTWoPeXnxpXgMeaVKw/IiSC7x30NhzwI5rNeQzsBFh5kU/hxvC6faJ
         qywEJeeaHp2PGtfFneLzZAyO1fSDXISZcdjQ78j+JgnXiqsoae4HgiA67gpfFHrOQvKB
         LceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779353649; x=1779958449;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v692eTKlDFQGKi6VPiSwojmbe3259bYPJucXnvxV50c=;
        b=SrxXNvt2dfnVsMYeXhr7jpus7HWsdIry4JlDGFxyeifWaoAfmxxRoWF8Ck0JDODh6p
         KlfCcrepkwL564cyYvrIxWXkS2aQpBfg2nEvre10ELmX2J0DeB9L6Gor6ase3Tqz++pg
         LOqaPmSw9wa/EEwVNc0X9Q1VFZNuoWQplYAJqJpG9qE2IMkDuGawfXEuFZPXn5Whq+Df
         6lZgTNufu/RWq80nKmy5CyukOBQBsJOij4SDQvT6CdT10IJA9+LPJMsVt0a8vLn7YmFb
         rga7OwoEoTGC6BB+3lc1J6lhsXSGvb8Cc0a4G0dYYNPf8GQqRzI2pE+0fEgz+O1USxwX
         1pJg==
X-Forwarded-Encrypted: i=1; AFNElJ+5gogfCcDVO7r1luMHkz7CVEDxkHzgv6dpsAh24X4pCM8rtT3QkDGut4Wr8aUswGOza/h4iMHnRVAk@vger.kernel.org
X-Gm-Message-State: AOJu0YyNW3HoarLEJUH5IuA81CTTjhZpodNtgXN5cVN8JcA6S+I0AGGT
	GXX/oyhrJk/6IT2egdeG6zCUn9lSSGMbLWQMXqyuCv7+8EzYkxlfUbb+JjWxL7J0kWNmA1Hwqjo
	AAXfRO6o4xtS0MNqIypzM6sk5MpSPL40bAHZAMK7wyBju9IExLIslA6dMNxT/r3xe
X-Gm-Gg: Acq92OF/THbo/box6O8Gah1diz3zDu2BOadlR5lFjL712V6OyT7EnNL298fnbNVA+M7
	Tq5xsQ6QbcZ8EHjTbgNKTzHd6j5XTujSq/l3QdJBxHqVAppTYYy/fT6irZgBGibJrtvpsPG/W19
	hEFL27pQh/5vYiu/G420Rreh+SMZn3UZHbFNgz7RjQWyWegkEXTEYzIzkkwZsbYBT5A139YdSSK
	5W0pRF0NHiqoGBrkPxHVbEXV4ieotthIp6mD945LV3b7NfXrq8jtiXFmSgEZcbWVS9TJgYins1Z
	oGJadveCVkKvR28i27L379pJJzj84O23JJ8ccyxkaTkCVXZeAJ12SZS209pIM3baFoEXtsax/Kl
	qGpl3E8NF1Oa9DHn6DE21npm6waQ3tfETszkBm3GjBD8GaL4TeHvqmMdmD36lZZ4a9kBUHak48l
	0Yafs=
X-Received: by 2002:a05:622a:182a:b0:509:2a92:8088 with SMTP id d75a77b69052e-516c54c365amr17392881cf.1.1779353648819;
        Thu, 21 May 2026 01:54:08 -0700 (PDT)
X-Received: by 2002:a05:622a:182a:b0:509:2a92:8088 with SMTP id d75a77b69052e-516c54c365amr17392711cf.1.1779353648434;
        Thu, 21 May 2026 01:54:08 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc87891207sm18449566b.7.2026.05.21.01.54.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 01:54:07 -0700 (PDT)
Message-ID: <4c89121d-9502-4cf2-b5a3-cb789284643b@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:54:04 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] arm64: dts: qcom: sc8280xp-arcata: Add volume
 up/down GPIO keys
To: jerome.debretagne@gmail.com, Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com>
 <20260520-surface-sp9-5g-for-next-v1-7-9df52552bf87@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260520-surface-sp9-5g-for-next-v1-7-9df52552bf87@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4NiBTYWx0ZWRfX6kVrsBJAP4eo
 AYRKSzhxahC48cVOF7jMksbrvydAamTXVzw11sAJPXnmPcPCN5jUVw7OpiX95JB2GcujWVVbJr0
 GNhz2eJ5RvewnFiaSy6ONd0uAc0Z5yOwtNM7XrNEObs6EHDrsmgw0cOxnMQtt5NaOAA/ZWiG71W
 7l1aFaB+L4pCgOP1U05s4Mefrc/ZqiSzJS595WC/nqFWYFdG+oUJOtxLTOL6MHFbuTezAlKwKeF
 uBNAH3lGX4Ggr0+NHa7BmLlkEEyO32uhz5ds2y7mJSQ1cDj7WH2SVeCduH+3JrEByajTNepc2D4
 OZjjdQWtmmiikJTbP+9cBz5z5cfXtxsjKEWUq0y8AGOWB+8DuCZQ2mFjEazeCMtkcmkdh2BOHGn
 sUkxZYjRasrEqf0w9iW7MLgI7FcxWLhRvxk81PetjYaBeEUevuvoYZqAjq3ZbpO6BmNnwJQiRY5
 RJ0G33zd/SQAGS+ZPPA==
X-Authority-Analysis: v=2.4 cv=Zckt8MVA c=1 sm=1 tr=0 ts=6a0ec831 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=S3QPRrZGCkirkA1mjOoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: DR_3MHqfCPwFbR3T4MHMEP-gJAZrquOf
X-Proofpoint-ORIG-GUID: DR_3MHqfCPwFbR3T4MHMEP-gJAZrquOf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210086

On 5/20/26 6:40 PM, Jérôme de Bretagne via B4 Relay wrote:
> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> 
> Configure gpio6 to serve as volume down and gpio9 as volume up to enable
> the volume up/down keys located at the top of the screen.
> 
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
