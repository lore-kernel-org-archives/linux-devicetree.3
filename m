Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41663093CF
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 16:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785860280; cv=none; b=Mhkwiq3IintaTiNatAMOEuVgJinbg++w63Gf04cvLRUUWDIMorjXFgaCS4t2tyuckiCqxnrkfFNVaRAIvtgUAZVK8i5ySUJgzRqvNaDxNxOv+VIWN7gVAK0zP69fuUTmeTyxgc5rLS3YXu7r/CTCTuAOjtVKaEztHYL42OpHNLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785860280; c=relaxed/simple;
	bh=jILPCPgJgqJSeOaNZUyeYrb1i8QOwgqT9AfqPujrudY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nuk0wbYPB8ejjWH7xZEVY/QdzB5pJJ29lmE+1NHEvd9D0ZbRauZfwClGSTcfPxuTZBPMKQuAMpvE1Huqpw0/M10xcX3GNAyQJ75D0L3+dNs70Gv4nX2joRpgahdPxiXktE3etBf2IYcUfB/11Pg26kWI3emsSn9yFIuoNJPFYQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NVZrYf1H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NNZfwxL/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NVZrYf1H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NNZfwxL/"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674Ffb9N622917
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 16:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QtOESMghdT91DMUuW3NU7rVuVXq//+Nrje/ikZKMzp4=; b=NVZrYf1HKBj0dEN3
	e4Qu3KdW4YDTzEC3b/rdUTMjtW1sOwnnrHPeK9oY163Ry1bOsxYi4bojY0lQLut3
	YlzJ9Ki3WlyLhDGA4ZUU2eW9VHsXTsfP+YPr8CWQvqYtOSuxtm0D1EbbCUOtDj3n
	u00OG01TH/YISj2yQJQc4Y9Z65L2kA/0mIBUJlG8bk+ReykNkWe+w2lWyIM4edVd
	YTgzG9XKIBoJNstVezj/pzMYZrElr0CE8W1Ni17kDvh2rqhFdWl1bOEFSo5Ahvl3
	0BOWv1MlYwCDhflCmL4dEArotBfiKJiSXvY7XrYIsuqrAk9FPwSeERrdCxGidrgF
	zOCRnQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu1p4vme6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 16:17:57 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84c4cd31b51so1468393b3a.0
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 09:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785860277; x=1786465077; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QtOESMghdT91DMUuW3NU7rVuVXq//+Nrje/ikZKMzp4=;
        b=NNZfwxL/qjTru7a/ouwF82ajdl1jKH4W1gwhU6cgHxGizyQpjJvIe5pOj0vKQ6gBPO
         /yG2Ah/o9gcdQfslDrc4dND+rp238XXp8zvfWUzIzF/O6nN2Yx52Zwu73a1ccBi9WSUN
         HuVQNEwH0Q+37vGY5EsCmR18NT09SnjxaTK+EpcC/8b2XRR1+Ae1VJbLT4r7JsTq7TjR
         ZWbj7unAPq+dL/3k8XfNkx8fpHJabpkBpafRVnRRaRuj+tPM3yVjulkHE0gO7N3233TO
         0rpRw2+5X3OAWj0RqPfWe2fk2FuwMi49blbYHKZiynvD/IXD1esWf2/3bT41ZhHhDoND
         8K9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785860277; x=1786465077;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QtOESMghdT91DMUuW3NU7rVuVXq//+Nrje/ikZKMzp4=;
        b=PCSLIwxauMoWur3IIjCkSEd8LOlDMiOC/oY9RTw0FuQlAiYJRjocudZ9IKjpmtoyn0
         uFkPlSvPgdsvM/jdbNbMHITHlRNT5T9NYh8qPVfELN6wRYUQKF4FaxnVXQhA3uQIuPrZ
         WPV/jqgYc0ass2Mj4zCUmAXYc66YiOsLYhd3ypcNzrACs+e17llsITcHwJd4mC3uqkFJ
         eMVlHRmOCr6c9T9KKeo3NOVW31d+9gYeoXt0q3Z72uSuQCgWWleB3kHutOyi3L9yUZ6g
         8dKUydkuW3T/bkzA1j88SSyMuowMpnXNZ0KsyYxRW8lWco6xNFpCyeu1dFlGFKrYXrGF
         ZQ4Q==
X-Forwarded-Encrypted: i=1; AHgh+RpMmCSwM2mtpTpoCiRb4LKmGJGRtpH+tL1w7RdI/2l/EHdXvk+wV4p2BV684GTbDvawi9Bi6NruUJRo@vger.kernel.org
X-Gm-Message-State: AOJu0YxpKgkS07dOKTtaiyTDA7hqqT55f0ybLjIQ2TAb8VZJ1M7EODBA
	B1WWerk6MiB2zcbTQDzyU6cv+oCQ8npDl7Sm4j4p9arKCKqJjTiybsrxB9ORj5zWjMU66qG4oww
	bsibP69+X1DZMbLoe7h4s4cDfeSFENTtRVWhDy+4XhDDaqhiJwjk59LpSRPTm4EVv
X-Gm-Gg: AR+sD10iPX/Wxii8v1VanF2jv4fisrpcxfdsw8UWtfYzxAm1b8J///IKsycYTMHxLW0
	criPVqHxZLqvwjFwUqUQ3ZOIY/zAInmCSSHvoOiQuvySl6u5Ft9dXzT23XymPKy/cGtE1jfhm6s
	mdz+18TZ4C7bFK1VQJLxLpjjdhn4TwE63G1lxyF0aWRB06ipMqHJnmM9aprMTM1cA/3PRKsa+Xi
	t06nNJyHRG5yCULsIkQbifXvr6NMShrqgRKd+JvIKPH4J1tty4rqYYKTpXDw7RrlRea6nFf8WwJ
	Rcb/S6jlMY/fCGALS7/PrRT4ambq3UQR8DBufxCWO7GwSPfnbrw6EubYj4RwdFCXIKB5xm8hTaZ
	3xyMe4PztdQOS3TraTO8pO47rbxS1IZhIywsDApxOmuE=
X-Received: by 2002:a05:6a20:1605:b0:3c4:2cd3:f0bb with SMTP id adf61e73a8af0-3cb6c7b8165mr5346982637.10.1785860277204;
        Tue, 04 Aug 2026 09:17:57 -0700 (PDT)
X-Received: by 2002:a05:6a20:1605:b0:3c4:2cd3:f0bb with SMTP id adf61e73a8af0-3cb6c7b8165mr5346920637.10.1785860276707;
        Tue, 04 Aug 2026 09:17:56 -0700 (PDT)
Received: from [192.168.1.15] ([122.164.83.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315867a68fdsm10211411eec.25.2026.08.04.09.17.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 09:17:55 -0700 (PDT)
Message-ID: <3a9e9335-7886-4fd7-932f-e537e7610537@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 21:47:50 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add PCIe support for Qualcomm's IPQ9650 support
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
References: <20260714-ipq9650_pcie-v1-0-4197749d06bd@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260714-ipq9650_pcie-v1-0-4197749d06bd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=auOCzyZV c=1 sm=1 tr=0 ts=6a7210b5 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=B5ZuGdSqHqji0zkKYHIP4g==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=xn3Osltq91GnvOc9J_YA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: CQmRQ0-kP6Jcu2M2iPpAQX6BkEu5IkSS
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDEzMSBTYWx0ZWRfX7pBdU1LhFeJ5
 6X5QBZpk1DH5dNcsHYn+RjviJtegnBgXOaK8Wm/e89uzupJIN7ZaOeT8Tbn7NX22LGss5yvY1mq
 OlBW6KPFRncxXaPkIry6R/t/DjjQeLw=
X-Proofpoint-GUID: CQmRQ0-kP6Jcu2M2iPpAQX6BkEu5IkSS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDEzMSBTYWx0ZWRfX32IV3uoK/NtQ
 yj72Pt/77E1IGQJl+o3zPBdKH0s7RlBjrcJiDrC5KJh5c+u58PLZOfv8a66kxC28rPqNKmryuPO
 YzAmXNuetJAqxI15I/F1/4Y2SCTpPuq/T6jK4gDMTFahPhjGGmSTBd/2JjVu9Mg1komfW6oWOHX
 hQOA7V60vujXnYCGomkN1eKHzVkspLkfvbyuUn76qUFdfECmrK6qaLI7Q+Ag00JCKRMXjc/l3XQ
 YytJTKqE0p70Hfx6xT1AYrgDY3VWZDE8wL5jaYNBj6pIuSUDQq3eG+1WSNaz+zqlRSBKf6TXMnv
 nPqXTjRZgLslAvVevg9hCB1zCErRRRrPt8tFDOE6Do3hSiFsB3W86AYXJv5tQR3vvGttCOvdStx
 A0+mHwFAEKyxP6xSpvqQsRcsp6wIJncoe3kJlmKi6v72js4vxQH1j/N+XKFzJhqRyL9S7uRZs5r
 wUWzh5RGKrdt8FcDG5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040131


On 7/14/2026 9:59 AM, Kathiravan Thirumoorthy wrote:
> The IPQ9650 SoC has three dual-lane PCIe Gen3 controllers
> and two single-lane PCIe Gen3 controllers. Add support for
> these controllers and enable the three dual-lane PCIe Gen3
> controllers used on RDP488.
>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Kathiravan Thirumoorthy (2):
>        arm64: dts: qcom: ipq9650: add the PCIe support
>        arm64: dts: qcom: ipq9650-rdp488: enable PCIe support
>
>   arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts | 119 +++++
>   arch/arm64/boot/dts/qcom/ipq9650.dtsi       | 665 +++++++++++++++++++++++++++-
>   2 files changed, 779 insertions(+), 5 deletions(-)
> ---
> base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
> change-id: 20260701-ipq9650_pcie-8c77a69a6881
> prerequisite-change-id: 20260521-ipq9650_pcie_phy-60d7df32581c:v3
> prerequisite-patch-id: 0e1655d496f2d2f3df84eafd66ddfa6d7e202f3d
> prerequisite-patch-id: 46b42b118c95ec605f763f3f4bb3588c2685166c

Bjorn,

'ipq9650_pcie_phy' series is merged and part of linux-next. So this 
dependency is resolved.

> prerequisite-change-id: 20260519-ipq9650_icc-994280404adf:v1
> prerequisite-patch-id: c601bc5425e90330caf3faf758296ecf364b54a4
> prerequisite-patch-id: 75fe7bbebbac8801823601f17d55ba0aac29eeba
> prerequisite-patch-id: b651a08f6d6933bf8ae06f3e8a7d1580bec5cd64

'ipq9650_icc' series is the only active dependency right now for this 
series to apply. Both the 'ipq9650_icc' and this series applies cleanly 
on *next-20260803. *Please let me know if I need to resend this series 
with active dependency list alone.

Thanks,

Kathiravan T.

> Best regards,
> --
> Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>
