Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D3C3E00BC
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 18:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780944211; cv=none; b=ZyEy2qFMPva3m8vormCPmsiBAwzOgxxYT63FvKxc2lS+OlI5eHUW2OLZkaTOIk0uwsqXHN7i8Qe34LWTGL8oq3CsQdtedjj6DqUgk/OzVD5Fns3SYlaJKdf9FVdEU7uFuoJ2n+b0ZDHD8ij0klfmDIoTqQVTZqOZHtb6WSdm6vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780944211; c=relaxed/simple;
	bh=XrTiGoAfj95ZNVlfxHtjtlmUqJv9XRx7IJtBxarrPnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r5zIZB1ZG4JK5jeYdTyzddChJVQK0osrt2WGPG7+YJIAKtRI/iE4ZbHMlDNEQuZtepgVtPq7P5m21NreCNwcEH7U78NRZpvUZ+lrjvCktttSCnhT+6gG1qDMzZCszfHx9A/W/XwwIfhTEGljEnZV7uYxEuCcWemItAVo1BNBdXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vb+5NiyN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U/ESYooL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vb+5NiyN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U/ESYooL"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFRLk4041643
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 18:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Plr6hTzFD6LbDZNeKPjpGhAAeO93r9oSiZKDt2c59H8=; b=Vb+5NiyNxznEyJtl
	l4PuNB9RZ3Bv0pBTGl8aCbsRL3qwtEfljk5lF4r1QqZ7JPnEZRiNIxs1IPce6/LL
	C8hBPQwEanaLG/qn9mtl0SWguf+ZmtMJDKFlACLCn+6pS+A3mHf3+zDxTqB4gbOO
	b3tlHTLUBJmIxK0g8ZaLf9C2QUJsNkj7e9E+YmEiIeF/Bg3WOstY+kfdSdGv9iwW
	dDGhOAj4MopmEFvnK+qq6SHxKtdeXJ2ImhbVh3PRWvJiR+YFGbVgyvBX0jQNLyHy
	zMg7j7dnVW9gRG14afbcmBNP13Ax551WjN10pve/hMCATRXT1ffrMjeiGu/ksyLK
	F4fBuQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enwsv9w2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 18:43:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0b35fa876so57731475ad.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 11:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780944208; x=1781549008; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Plr6hTzFD6LbDZNeKPjpGhAAeO93r9oSiZKDt2c59H8=;
        b=U/ESYooLWt5YuqqNIv3+iVkXk4HbMOu6MOXhWXAyi+D22RTwyR5cSpWACmRk1qn3FN
         lOYFEF1Vwr+9dFL1gyWpfQwISl/1sWb50bexRI0fGO5td5zH/xc+hGESvO7RvV7cK/GR
         XPlhWJtbc4eSnyNF8ipcA27JY8U8/SIfMbARSvcaa7JEjkFgKgLJbDktI/QxR7vjtl9m
         cgQONgXZJ/0tBoxAtnqM/auvFChRwBL964PgkFF9H6HFkv6tqqiVwRasYWsqsUE3a+DF
         UN3xm+h1gRH29H76rI/+gQhuPsfOQ16jepOeAEQEteYDqPV7W1V8t5kELNgWS4vFg9VC
         lqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780944208; x=1781549008;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Plr6hTzFD6LbDZNeKPjpGhAAeO93r9oSiZKDt2c59H8=;
        b=rCpJtcbrIcKPn3xHs6tEN4Ea9wZJb2POI9A9LgSJKjcYzg5R9ouSBO7cmvxR4rMoJc
         X4NkpFy9rbYY4vNPS0Z0np8dsQ4pT6zth04LTffHT/E+yMC34Ixhk7YAooINRDERhtuc
         cfat1FKyn/ygnlw1zhPYX21ZQej8nOeyDgQatTzhG+nqHuRAsaZiOnK/PvlEsVWreNqZ
         4CSnWAJpY5VRDzvVRtKNY5gKgL36po/eWYEVH5G6P+jK13e/J4M52wm+PyEVCB4JPBol
         thY26NVmBiHSHtQuKjqeA41aGAG9utgl5HPmuCZfN9TPNW61i8woNLVsf013oVD/UhFl
         yBCw==
X-Forwarded-Encrypted: i=1; AFNElJ+nDbS24PzufEE0JA9MgcWpsZH6BGWXxKSy3ZCit0y4DpKbV1+AIjxeBnbmC1WPtZcfnRa/pe1ws/F7@vger.kernel.org
X-Gm-Message-State: AOJu0YxXErbdrFn8WvH+e/1t5/rDc7Oox9pqEypAkCTr1CQlUphUZADH
	dEV9c3y8XjEGkxetdLZZyemcMPr60BM3Mm7LzJRAv0dRzni66rXW0lAdy/pgI5rz/ZWWhcpIiyE
	s+jrTCwmXCiNOaJUxIG4uUeIqCGo2u2GlHK+MhDyRTZPML+Z9ly6B6GaRbdFpMv1H
X-Gm-Gg: Acq92OGkdkZWUTDD3ee16HzUkRx9UWVlq/I9OQ2NHue3Y/KQhoZQ0qxwGvr+Oe5fNxS
	wawkK7ORZV5ArHN0HETJMGz6AxT4lMPbFE81pX5HuzRqpQWHPlKobgVa0+Egdxa45i3aH63YL/8
	siy2Iu20tPolBaHccS50PM3IKK5mGkAa4HZIbSdolHf4d0ATeNW85tgctjKl13idXue9bVOxYRQ
	bRo8zcSjtAClvQxteHS7GtmhgmYVL3KypmsWh4n67EWWw/qEyLTzfpGlW32e5rY/07fdA43PO/G
	lVg/JzQzl0PFsQFbrmg6aKOfzMdJge73NNyKGM+qxuT9b5VtukOObL2G/gTy9LBvEMOCFYVYYRt
	4ug3J84+PIayWGCmLYCVotEyxNceZO+gfoVzjMt7kPosx51VHjyXJAYPun6Pwmw4=
X-Received: by 2002:a17:903:244d:b0:2bf:800:19f8 with SMTP id d9443c01a7336-2c1e7e500eamr172871425ad.17.1780944207827;
        Mon, 08 Jun 2026 11:43:27 -0700 (PDT)
X-Received: by 2002:a17:903:244d:b0:2bf:800:19f8 with SMTP id d9443c01a7336-2c1e7e500eamr172871105ad.17.1780944207411;
        Mon, 08 Jun 2026 11:43:27 -0700 (PDT)
Received: from [192.168.1.10] ([182.65.158.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649fcdfsm245047595ad.78.2026.06.08.11.43.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 11:43:26 -0700 (PDT)
Message-ID: <11c2d639-d2b8-487f-b627-f507bab25d60@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 00:13:01 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] dt-bindings: dma: qcom,bam-dma: Increase iommus
 maxItems to seven
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
References: <20260521-shikra_crypto_changse-v1-0-0154cc9cc0de@oss.qualcomm.com>
 <20260521-shikra_crypto_changse-v1-4-0154cc9cc0de@oss.qualcomm.com>
 <20260530-spiffy-glittering-quail-dff199@quoll>
 <289a5bca-5491-4fc2-92d9-1102aa664021@oss.qualcomm.com>
 <f9a88104-9292-4cef-af48-58a722194b4a@kernel.org>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <f9a88104-9292-4cef-af48-58a722194b4a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kYekcj2wNV1HNx4-g0UO-rMndXnq3Heo
X-Proofpoint-ORIG-GUID: kYekcj2wNV1HNx4-g0UO-rMndXnq3Heo
X-Authority-Analysis: v=2.4 cv=dIaWXuZb c=1 sm=1 tr=0 ts=6a270d50 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=wKfY90lum8W+SP9crs9F8A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=3IJvv1DdaQ7zVQMhPnMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE3NSBTYWx0ZWRfX42kzdRwR0PMJ
 IWf23TSINgYbymlcUXjhz/MqrnPvSgrdn7+tR69yQG8uv5XwCfRPiUWfxKaRzGAnW3HxH2Pfmk1
 QSMWfp45m79A5cIDa66AskxasE5MPqCuX874p7h+uuCm3mdvoBr9sbE/HewSHYdhrc/eQklrSxw
 VWsI8qJnrNNiJY+Oy9dMz4dlCEhrjKSbkip/ISvXBlrL43ksYV6CoQCJUfLJOgeWbsjQ2VPz/2Z
 25VAga+R2u7beUIpnA/8zRYSPFsTyISezdYa+bme1k2sCt/ONATV4ApL8rayXRqUNuDHuKzpq6L
 jhkrCGU/XOeU+o3ZCY4epV+HgUMMOrpPNqYa3xyOjxB3LgqLGw7nE0QTuahN3Uca3+NAPela/Fj
 TaUVWAW4HhKMfGdCkqldUMWF+41tzdgXWQ94iqH992jk3keekIlpfbi8nJFeZ/f5dw3odgveKyS
 PSIGV/zjyfWDQxl1mRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080175

On 07-06-2026 13:43, Krzysztof Kozlowski wrote:
> On 06/06/2026 22:59, Kuldeep Singh wrote:
>> On 30-05-2026 16:09, Krzysztof Kozlowski wrote:
>>> On Thu, May 21, 2026 at 06:47:11PM +0530, Kuldeep Singh wrote:
>>>> Shikra bam dma engine support 7 iommu entries and not 6.
>>>> Increase maxItems property for iommus to pass dtbs_check errors.
>>>
>>> What errors? There is no Shikra in upstream so how could we have errors?
>> dt-bindings updates are prerequisites for the DT changes of ice,rng, qce
>> and hence updated bindings in patch [1-4]/5.
>> Also, the commit message mention about shikra and DT change is also in
>> same series.
>>
>> I hope this clarifies.
> 
> No. Please explain what errors we see now.
I need to improve my commit message a bit.

Since, shikra defines 7 iommus entry and bindings say 6, observe below
error.
dma-controller@1b04000 (qcom,bam-v1.7.4): iommus: [[31, 132, 17], [31,
134, 17], [31, 146, 0], [31, 148, 17], [31, 150, 17], [31, 152, 1], [31,
159, 0]] is too long
	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml

I am attempting to update bindings firstly by increasing iommus maxItems
as a preparatory step so as to introduce qualcomm crypto DT cleanly
later with no errors.

-- 
Regards
Kuldeep

