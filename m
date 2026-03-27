Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504B23A7599
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 12:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774615628; cv=none; b=SEjLMR0DvdFA5ohqlnm8+0I/IVb8V+sk+mx++FwSplMv0OvBSryjvwlVd5LuycfKg9k0SsG+8t1XsQTIjdcEOx8qqx6hTE504YD5oh1VInGA5aNzn4u3Nkwyn0HpV/fnzEnFhScvJw9/gtXoFlONyvcZy29p3/MsA51GX5VCRQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774615628; c=relaxed/simple;
	bh=Ff3Wmv6XXMb16+Xtd/2/paFt/lcgzURA1BAnQOWiwbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hXhfFmOxYsVfAWZiqT99XDSTmT8ip4TlDSkc49o8VSLE0VryHCTLnYOCs2CNn9DEMqoedXMTBCZF7G8NKpvEuTqBsbrj6IHPihD8iZlxzMy4NEs1n7aC8V839cOJ3rFoylQJABPzox5mGyS0cqU9tICaeXv9iuwGh7AB8nDRtuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eFoDBMjv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gdXjaLIo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eFoDBMjv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gdXjaLIo"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RCGP6h1710545
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 12:47:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nCIGzi+5s/o3gSzzW0QXd+QQn6T7YpEi/M96VxnQ7BI=; b=eFoDBMjvr8fXhR0t
	MbUQL6GYONS+yRqDmTg53Ju9H4iE74APOZod2l2BQoWGMvYi+4eCeNUwxPITpPru
	8biUBw9RBem11D/0JOxMRFaDgk8/OL/8rYp0V/cWjtLaxJv+BJPee450YQzrKGWA
	x2RB4OuRES+ZW5qEp66RSCCbljP9gXKmpyCxPM0+uMrEit/VDu691PStPblpynR6
	ltwRbz9Z/05nZJnMhrhrgciV493wTMhjt27gwpmeVYzGBK9jng0OsOGxUBP/PGt9
	bqpZg9WuDR/CjAoMjiis6mMHhsYnn7c/MI0/amvnNUirWfDz2MczfyDAGoMXx0t1
	Z1MzAg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bxvk0cx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 12:47:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2adc527eaf5so18027975ad.0
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 05:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774615626; x=1775220426; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nCIGzi+5s/o3gSzzW0QXd+QQn6T7YpEi/M96VxnQ7BI=;
        b=gdXjaLIoUbRCtjuE7apYd6sNdELZj+VtcHU4UIW3Po7E+PYL+m/Bq7Db8IK3IAgQKV
         XCZ8ljfq512cFJAbRusKtedZWO0gXSCdwiEsyLSQ7VRmJ3CkrXShs1xuUVgiSxvR8brS
         1jm2V2yhOrJAfKQgKrcnAJ6Vs7JR+lM1wCuC7iTSfuOUntSMdj76OWVL1NbP1UFLJ0iF
         6ksbh7Odsm4dxNup1p18+BiPBKzKfWOBQEu+OtR8czh5EiD8x+8PE8+Gu70lx2T1kKvH
         3E7jF4C9itBtOiEu7504vEUNhzc7vznN6m+bCkurRQkNjjZCMfRYXi3wPwlccIC8V00t
         6YNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774615626; x=1775220426;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nCIGzi+5s/o3gSzzW0QXd+QQn6T7YpEi/M96VxnQ7BI=;
        b=j1femwoeo3WrexlPJuHcJBHEGRa6BBEQKJaKmv8S86IsmXhvXbNx7gNLJIfDRdfvEY
         hFI5yYoB5lCVCEm0ukZRVUoMXFhSNlut0LgdZb5R217C3B0iHgS52Z4m75N/cu0uWMx1
         4oRArrxrV93hDPmrZdBu2iU6b5QDqPIm2ExAa0XqmCYTbZNQmXKUCxPaFrWi9DDFJlSg
         cCCnlTRY/rvYmigJ5OlDFKio1Mi+Lc0+ngvkVK1QzSH9n7zVTCvciNsSH1R7btFzjkFp
         elI12Vc7j4KC6WhcGhExt9M7BZb5nGT8AbkFCbsYYsg//WacJP3vxrjcVl1q3usVoGph
         KVuw==
X-Forwarded-Encrypted: i=1; AJvYcCVeBKT2bzu/PaM7c3sX0QGcrk+5/NAC6Rz+aiDv7fKs4E6ZnWKHGJTSRF6XztdUHXZ8zUSF/dUymgC1@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp1HcFvURE80rIYmrEZj2VvZLJGrD/3yMGh/Kxlgj6YuzBBf1l
	+fSwD++PkrDFtM3VJETR29CISZuk8H81Vog1DVa6QaEWfCl3Wwby2dw0PKzBp/HVFRFcqQy/rVF
	OegOeh/W6PWKNrJZkZVSP6uZosSKJ493elyIkZTLVS3O4FhFKbLb+gjC9k5Ed5kDs
X-Gm-Gg: ATEYQzwQo3DREoGScvq9Y5wFmG+dd2pvnpSPrQq8J+Wed/aXWr4bdlq3+9ErHVN1fc9
	JtWY0uvqMgaC/z1RmxS2jB9tPS4hOMkhIcTmHQKd9K0yi3lsnZni3v4yzVc9RGFUnD0Z/a3bPU3
	7tmSEFnNu3plH8vtB2xvk7xTjtAEfYN3LFH/HKPHcaZvE8yQglKCDuz05cv72j6IkPnhRrRm/wE
	6kYmf5ZNyRNcxo8MBubnAq/d/1b4hMaIOJPC30OwxgCyxOKrUHBax6bdeKTotzw14BwP14QNO0T
	HK0qfkdKLnNchtZPY1bTK2oqA/qUdliYXT5q0bsMJ1n9aI7OuUjWvRQ6IX19INL02kD6+9jKmDI
	9OrzEij87Nr+2pVmHLYBb7nxQQIDDnu3G0/LwJnUIjvyyS6rvheb+B4enSJVPrbPZxRCmYkS/yc
	aNXASZo3PZgjYT9iIVLoarK6UzDW0p3PZUpIXJqb//FAmrwXo=
X-Received: by 2002:a17:903:3508:b0:2b0:669d:3a68 with SMTP id d9443c01a7336-2b0cdcb5c2bmr29017255ad.19.1774615626039;
        Fri, 27 Mar 2026 05:47:06 -0700 (PDT)
X-Received: by 2002:a17:903:3508:b0:2b0:669d:3a68 with SMTP id d9443c01a7336-2b0cdcb5c2bmr29017035ad.19.1774615625579;
        Fri, 27 Mar 2026 05:47:05 -0700 (PDT)
Received: from [10.79.138.73] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc883c0asm63833515ad.45.2026.03.27.05.47.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 05:47:05 -0700 (PDT)
Message-ID: <83c78333-4db9-4943-b90f-164981bb68d8@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 18:16:59 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Move board nodes to common DTSI
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibi.sankar@oss.qualcomm.com,
        rajendra.nayak@oss.qualcomm.com
References: <20260326-glymur-mahua-common-nodes-v1-1-12bb26920ea4@oss.qualcomm.com>
 <03996c07-f9f3-4586-96ae-075927da2577@kernel.org>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <03996c07-f9f3-4586-96ae-075927da2577@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nhHkXK-tSrngkJcfy7HvJFks_UYMUrjR
X-Proofpoint-ORIG-GUID: nhHkXK-tSrngkJcfy7HvJFks_UYMUrjR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA4NyBTYWx0ZWRfXx8WuFNu++vIj
 GCARBExWPK9bHye9U9UBWyQyGqfkAd75nvxG6tmGp0OSnh7Ood2Jf744h2PeDmbPrO6Ff7cp9C0
 Ur/wJLQG6RzqxnbwYjXbcmott5SDZPrjl13Yb0zkcOZb++jw9WT6mlBJvR/4KufHYI7hXRu8caQ
 84C8JnL+3GSsOF5MuSLAXfeqQcoZud2foNWZhPzIx4FOfWjY3Cv4Qfyi111KNaqQl8WyD2oS2FJ
 YFBJxmYq7JqLligWIHFR+j88cG4CwaFANVjnI/4wVsQKClUcft8RokSdGiKeSqXFxCmopP+UQKw
 wLd5Nni8MyHkkar3uR9e2ZgzlGkP04ZqjUGRZruYFNZGTPFR88q80Z8P9/zPSw4x4eA0aY4wTHR
 KCycuCIwHNC1+mj1xw+jS7sg4I0FpYU/2s/YVE/qma5Nscbiqb5DgbZDpUIEBPyeEPkZ2REKgey
 QpXJSiCN3jnF319xqiA==
X-Authority-Analysis: v=2.4 cv=ToXrRTXh c=1 sm=1 tr=0 ts=69c67c4a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=5Hq0NmiOkHtrQQVgowUA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270087



On 3/26/2026 7:55 PM, Krzysztof Kozlowski wrote:
> On 26/03/2026 15:21, Gopikrishna Garmidi wrote:
>> The display, peripherals (touchpad/touchscreen/keypad), usb and their
>> dependent device nodes are common to both Glymur and Mahua CRDs,
>> so move them from glymur-crd.dts to glymur-crd.dtsi to enable code
>> reuse.
>>
> 
> Same questions as for earlier tries (why this has to be repeated?), e.g.
> x1-crd: Please describe here what is the actual common hardware. In
> terms of physical hardware, not what you want to share.
>

Hi krzysztof,

Thanks for the review,

Will update the commit message in the next re-spin.

Best regards,
Gopikrishna Garmidi
