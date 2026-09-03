Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1742468C04
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 09:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788426277; cv=none; b=WClDxDlrbrsb0WgVXmJLxv1EMUebLCJ4qHx/1Kbk/6e4BMB2nA7/+b8MYkBAeL1GinAFOeJEXxO7GAWyYoDiLqasAPwiy1XLTudaV2V1xyFfGUUV0vJgSBHztxjQBKmMhDPDAb5kBoeNig+uK+om1Ev5ysBWWikTm1mWNno0M74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788426277; c=relaxed/simple;
	bh=migUhAZsouDhOUiUV/KoG3AJtohPe5Z2c43aWv+zZnU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S00QXZHHv5DqKxztIh8jPIgPoUdQRW4PcRt+aD0Xw3dQKI0+yjGSjohq55UeViw2w6ubiiz9N5QCPfAjnMWRQhgGZYQ3F3wmDmtY9krNS2gZ5yM08I1uRhFiwmsrlLTEohZO+ntww22Ag9S82djM79f868Kwmx4UXYqw6Kw0Jcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SmOrivcB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jX8Dw/v9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SmOrivcB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jX8Dw/v9"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683924Vx043829
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 09:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W2KjWKuUqUMzaY3XehItoywYobhH6n8z+eXFz/vFWmw=; b=SmOrivcBh0Q5qH5L
	TAXhESAjCHc9pZ1utPZAc+seTpxnn8WpD2tHG7FhC+Rdcwb4uCackdPjIimoqJah
	6kqikgAe8kxl8KudymAZkuTDZjFd7wPEahTKUeyfrRWFv7sKN4bpcfRaSlBMbu2/
	+Q5aOxXuf3vjy650/zfBlveBTf3TJK25soQU8vztHAuR68vKZKLwAk6ZvwT5q/gZ
	KAgyn3lYE3RN0Qrt4I5Yo1a4WZMwstLOZcqcnVXL7l6QjWWJFVIesY/VNV5eZ65a
	yvn3jR69mAGx7EwcC4BUJ230hODNHhw1AKtq41/aAOGRx9vWXQSob3piojMITYGJ
	BMcVwA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1pyh3jd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 09:04:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52ffd22d2b1so4330701cf.2
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 02:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788426274; x=1789031074; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W2KjWKuUqUMzaY3XehItoywYobhH6n8z+eXFz/vFWmw=;
        b=jX8Dw/v9tvpV9nNgCkCiYqZJaBEpA6yhIo6bZjDB/ibPi9tB+qwAt5ClhIanizESkr
         Rs2WQT7kfqu2eBXqlJaV2amlAGPf3o0iqlOkpdRo+cX9CgR711ah34dYC7AIJDNx9ZqK
         /by1Nuwu3mJ8+s9/Cog0UMubNMmzdRXcS9kRrz1Q7bTnW/Sa7oyBGIqnWHdXhOuI5rYX
         XoKQBCxv3Brot0bDDQKsT+msNKGPXIdFIUrEJjbRuFDAbfoqrRWP9tgN/nF2aHQkSGl7
         sTHkkfn7c0iljA0suYsRl/lnKNG1wQ1QxQtvR5b7L4gPM2XzukeKjr/EFYpxY9/YJbyU
         FOgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788426274; x=1789031074;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W2KjWKuUqUMzaY3XehItoywYobhH6n8z+eXFz/vFWmw=;
        b=RZPeo/AYYPgWIcA2CccIHKHLjftC0/duqAqViKOAaCuRbJBG+S3HzYK0FpIzq6nz9R
         MxWMQ/2SK9PnBCH7dTCq0gqHgUpAz0C1yzgiu4axQoG6IXSHqUJ2i0bjdNlCN1QIb+IP
         RJcorcsL4xLB1BA9kLjDqKbcNRymOI8n6gPvjd/x1q6jqRWcy0tjbFxE7AMFSeOKdr3m
         kefS3cQBlByRF76Xl7NfJFIYi5YEwg5bYnPfPmsMI/dY2BFoaOoFjE1zoE0pKOWpFJW4
         GB/9igdQBloBVbE1SC1RWpnl6LE7mON6Drz40nRIncLIhwVSuu0cBu57w7QOQKAbUw0p
         eXCw==
X-Forwarded-Encrypted: i=1; AKwUvBzGgAPEyCIiCFLVs6l/06idbubAVJrqzitb5fnGs7TLax1ZVvCu3NYbTEQ5YMXG6EdzheGcIgf74Yud@vger.kernel.org
X-Gm-Message-State: AFuF++lBlOCL/EUyntBSDKRg5l0x85pLamfDh8KmhknOwfx2NxhQ6nc/
	obH/S7F9RBOrVyMp0qFDHoqLVkvcsytpnrZyTaw4E6SNRZdMOYfmAppbgss/L2mhmSvytPmC3MJ
	PrZAHWmV8gxorSnWN0/M7UFpbhl+cfN37RtRouYVJ49GirTDLv+KexS8/gM+4Oo2fF2c8ncaA
X-Gm-Gg: AYBFou1yZduewlNwbyBR9tnHOZsB8tb/2cPq/ieT5zqxbtTfxFTOzCtOfYwAO0xBGez
	xy2NOklewfbZ6FUxfyRysDwL9j+ZS1UAhlNgY/sXT/Ia5BDsHI1n7C0D/aIczI8D676Jvq47Idn
	hWlgPWxKgM9VhPtDOIxx9qCt9aFX/ffuCXNCYgYeNjtjPX2kEG5Pgp5lZK1UMmIiAyddst+yx5r
	MgcQ8MYk8dHOZ979Mi2MW7lCC0btdhhpZpWUUg0P3g+xAlNwNknYmL2aPycG3syKUSFXVuUm7Ta
	uKHzJvgHvVYwWrd/Enqa1KbIh2ea0StHHrTKM/apwx+DigUldiBi81IsCSF6GqifUQUe5TjKNQK
	4ZIDDPzDCv0x7ZtESTBQGng==
X-Received: by 2002:a05:622a:2cf:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-53036d6c668mr80397241cf.5.1788426274120;
        Thu, 03 Sep 2026 02:04:34 -0700 (PDT)
X-Received: by 2002:a05:622a:2cf:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-53036d6c668mr80396661cf.5.1788426273525;
        Thu, 03 Sep 2026 02:04:33 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f895d7esm1952191a12.1.2026.09.03.02.04.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 02:04:32 -0700 (PDT)
Message-ID: <00cffd4f-d981-447b-ae97-e8978baa038d@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 11:04:30 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Add PMIC thermal support for Agatti
 QRB2210-RB1 platform
To: Raj Aryan <raj.aryan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260824-pm4125-adc-thermal-v1-1-3b67ef2eccb2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260824-pm4125-adc-thermal-v1-1-3b67ef2eccb2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3NyBTYWx0ZWRfX7ucBUFaOK4xA
 NpZ2Y2c5ZgyAhm6Id1UGYevRmTOUWSfv7+Je31SFM07s38/PCatAQpdc8LtLxGS72AyHUl83hyH
 hNIMQlqoOvFFBqjNOvs4A/QDLs8TwO1bgkYDXNYGsGO+jQmAuN/WCo6oQs8E7Pdh1+eDxQL0tDZ
 lZRfwWYdSNLjeRkJPWkf1ukcAKMcCDwtO54Y9lh80QdFXzh02fVkq3QeadKiMtLq/r1tVmJEem3
 ua6s4Pa+hleKHBlXeQnVKOaZwe2fSHCk3CYhmA3Pgse3KaYI5fqF/fRfAeHYGecR0ODZMt4L+cm
 hPZBUYmr43v1QC1sZWHCiGvy+ZJUwlXtynYK1b796PvWvlbND8/D4tGhB4S0pAMFaQsWs6YdkX+
 OGOs3STMGeC2JAlSy3JV8Vveg9oc3IPSTyveIhIOP7yzMWrk9UigeiAmvAcVDxECp8PKvisAz8x
 NW9Z+694HVQd4Sh3Jrw==
X-Proofpoint-ORIG-GUID: Vi7P_bF_-sdtZv9xZusF9kk39DMy0w7q
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3NyBTYWx0ZWRfX7nZXwVuoElwR
 HWMVKiiC3gK3y/2KqVXD2DDpXhTOTH+qV5WemGfAArculrMLUNfizQjDdVjo62Ytc0nTjtsRxi4
 2KvE1Y4S0Wb+2Fp8hnUGsJAS8JZOu2s=
X-Proofpoint-GUID: Vi7P_bF_-sdtZv9xZusF9kk39DMy0w7q
X-Authority-Analysis: v=2.4 cv=DMO/JSNb c=1 sm=1 tr=0 ts=6a993823 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=qI3sZz0o0dxpMlL5iVwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030077

On 8/24/26 4:49 PM, Raj Aryan wrote:
> Add ADC channels for msm, quiet and xo thermistors along with
> their ADC thermal bridge nodes and thermal zones for PMIC
> thermal mitigation.
> 
> Signed-off-by: Raj Aryan <raj.aryan@oss.qualcomm.com>
> ---

[...]

> ---
> base-commit: 3d08ff75a47a3e7e2ab45a3bcab6723b4d906422
> change-id: 20260812-pm4125-adc-thermal-4c0f713737fa
> prerequisite-message-id: 20260809-shikra_adc_support-v5-0-bf6882d18bad@oss.qualcomm.com
> prerequisite-patch-id: 7c371f4d9b9af04a9765b0b5b084c498e8979fb6
> prerequisite-patch-id: dde0d9ae1d46c16407cfcfa818dd427904748af8
> prerequisite-patch-id: 391360a3fcb2c44648ec62930e3af61d4eb12001
> prerequisite-patch-id: a1c862130f572ca027bc9c482dede8da183e51b1

In this section you say:

"""
I need the 4 patches titled:

      arm64: dts: qcom: pm4125: Add VADC and temp alarm nodes
      arm64: dts: qcom: pm8005: Add temp alarm node
      arm64: dts: qcom: Add PMIC thermal support for Shikra CQ2390M SoM platform
      arm64: dts: qcom: Add PMIC thermal support for Shikra IQ2390S SoM platform

to land before this may be accepted
"""

which is overly broad and you're hurting your work by introducing
unnecessary dependencies (because you don't need the entirety of that
series and you don't know whether it'll all be accepted at once)

Konrad
