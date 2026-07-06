Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BEC3A168B
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 14:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783347474; cv=none; b=NFawfoW5NSJo37mZaeG3lC6kKFYIORqmPpJpz0bsixBHbh/BFIXlB41WPzC08hDGcWyJjOCBdgtYoN4610HbMpuu0PeQqI/k3Zzjolk23TxWwNl/rs2UQgi1pett0f5nfZKYCWQk4CrMWCjAJQVGnLn8zccUsaJXQy99jfXKdbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783347474; c=relaxed/simple;
	bh=/zUH/jpDDNZ5fLxngC5Jn/a2YZL9l+1abNh1pzi3D/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C4pqf3fVJT2sEEomKHstjSV+0mMKXxmcfrY2s5tAD5tLR1NkMVQmsbeL2pOS322nDVqWEfT9Q0R9Ath3h/YaOuQ6/jovvKvf1ch16xc2se6rEce/s7Iexq8oinHmyvPBXcA6/31eBR/us9p+cbXmhR6VsFnPgL0M/epF2zZ6adk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=enTKzA36; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GtoCMJ98; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="enTKzA36";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GtoCMJ98"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666EE4I2837647
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 14:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6lguh6kwdApu9mviovP424lJBRMyjPoNgyKby0fvP8c=; b=enTKzA36S2pPgvvR
	9Nje0Ce8WpGcbwfagojt4dqI1aNOXELm629WH260ZXTpz6wwKQg9SnjBulj4PpgP
	IGQpgQ/CrKaveDY+kyUB/jOKA3uVzUtMW1XOdeadgZadE/1+sQkelv9z+j754ov+
	Sm8JZTTwrnY+qiAjl7YHtYs9KgXipbq8u+lSJXSvjZ9ztZjqwIQZPCNR7ghNgZO9
	hIQ7d7EWTrwyBPAyT5rGpxb2SHYm6JhiztQbr/8eoN5S+met+H8T8ydNhW+/4lB5
	SEe+iCKxOglEiIG+tJnk+w3qevtOZVzhcnwjuAyPFCTLKWeDrMO0Mqpejw7TgFdy
	/PWcKg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89qph67n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 14:17:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c6bbd0afffso64192715ad.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 07:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783347471; x=1783952271; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6lguh6kwdApu9mviovP424lJBRMyjPoNgyKby0fvP8c=;
        b=GtoCMJ98cCdTkjfsySLR2804o2oFCJtEXfjvhxdluMKe9k+nGSj/+dyA3QNw4IrB8N
         iwauVJ3tR7eACYdOD5mB3Hwe/14tdIepdeeNkaC3y4TNaf+r1hx5YTK+9X+Z3IT2TT78
         sQsTG/XXwKN2D3ND/a8wXXv3HPbbBhPTH5EumHR7FSx4U9mWC9jrU/C4VXLA0G6xbMyO
         +N5ThoAyJh/3NipAq+8ebqaRbrrdW5y1kiH2tTu0Kmlip4LwcG8xHGh2ByF8ix2E1QVH
         E/1YKvpzAyhal6eM9UgWWGm8CuWU4uNNbx2thWTaw6rdD/3mck1lrBxWW/Iixxq7km3P
         XnQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783347471; x=1783952271;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6lguh6kwdApu9mviovP424lJBRMyjPoNgyKby0fvP8c=;
        b=FUjkvhQrzReWh9RHbJQlmh5EmY6+w1dZBbXpuAhpB2dYnFnqgfnwQ5QiklfgVEvBbJ
         5aUMb9656EvVnf0Xk9AN/Su1yvgCsj4+3NFqVfO9HA2TKCmr3nySbd3ESWzhFv8aeHTZ
         0kF5o5OFfwE/Sl41UzVADkHVMe+JiJ8OBKM5zXux7Ij5dL6hU4AdNDPnQmaita88anRj
         D+NX0slPZ0KbQSVHC3OqEdWFMUDJUSpnZwsukted+QHGnsVwjoMUvYgyUjRhtiiLVrny
         IEJ58Vsrno0FGkbpBGNG4Eb/uQiD+pL8V6hS62Lmp7xUfsWqge/WuzrAnguhzXQC60OJ
         AYNQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp9UqC0UnAKX9+mxUkHw173QwsmHSew2EPXP3wrlQPX5DRQ7blfuSJ11qTt0taeyVHi6qZp11fVlrUI@vger.kernel.org
X-Gm-Message-State: AOJu0YzYZWtHtnBoxJ/2wPiyDDI8fS7s+JSL3ReQqB9jBSLH1JzgD7oP
	5wT5oruOj4CcwmhjMXcH7gO2ND/fGTmzXUrtfs1cAt3oWqwAbiukbyyt7TxG/6B25KxJ97sz/DD
	/Fu/oWXbqJbaZA/djYxYcAVZl6CD8zTYZEZfBNA/9+2+XISv27RVms08Et4AUTCHi
X-Gm-Gg: AfdE7clwQgpKMNoIr4FfTQcLLsseAQedL/iplRpd4tKG25WVjcWyjysasBFNLIHubAG
	FVJrGc52WbaQ7WwrFmRktnvxIby90hAPGCu0aU40uM+xTPHwNr2B2fwOCkJ38F7RX3HO8gXQMOx
	Wx/wGbWQ0GI4r0KTUsaZlbtHSHnnf1z4LhAZRjqgwIJbSI54PprbHLJbgZWw9G7DTi4dAqOIag5
	DcN6nzTltu4cyltqc6SrNEngrX8N58VZHUBboaTuitBwbgmFx7L9mmfGG6YNyZ0AFOIy6Rj837F
	1M8gOMWYjtrinJnGFYtWpY+2lYMRth1dkVB/qXh3vfCvjSb82d9Il8KuJhb+40SqyVSA56pfodw
	riXPejrFI5V/eoQCEhogxGaqg2+NnHN5BpjkQWZEPmxhl
X-Received: by 2002:a17:903:390c:b0:2ca:bb7e:29a7 with SMTP id d9443c01a7336-2ccbf072df0mr8580995ad.41.1783347470950;
        Mon, 06 Jul 2026 07:17:50 -0700 (PDT)
X-Received: by 2002:a17:903:390c:b0:2ca:bb7e:29a7 with SMTP id d9443c01a7336-2ccbf072df0mr8579135ad.41.1783347469032;
        Mon, 06 Jul 2026 07:17:49 -0700 (PDT)
Received: from [10.217.217.176] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7872542sm51500625ad.68.2026.07.06.07.17.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 07:17:48 -0700 (PDT)
Message-ID: <66aa42a7-4412-4366-b2f4-eff1c58e7454@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 19:47:43 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/4] dt-bindings: mmc: sdhci-msm: Document the Glymur
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260702094056.3755467-1-mchunara@oss.qualcomm.com>
 <20260702094056.3755467-3-mchunara@oss.qualcomm.com>
 <20260703-loutish-stimulating-hummingbird-aada5e@quoll>
Content-Language: en-US
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
In-Reply-To: <20260703-loutish-stimulating-hummingbird-aada5e@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c6qbhx9l c=1 sm=1 tr=0 ts=6a4bb910 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BLcM3S37_I9DteG-41AA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: XXF914FW2rNY1tH9RLrbbSojcyAcSozz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0NiBTYWx0ZWRfX/wM1phvPQd9h
 5RZm4aeRn9VQZt0XVLbWDDbvDJ+sCuM456g5/b15M5d7zjFgJGVP66FYDwCVDpGV4tZItccil+8
 2i+JTqs+jKXW5U7jaEP/c7L6e5EgAHW1Fyhdzj4zHNyRQuU7kqHkx2zA10OeEhnI84gKKwFo4h0
 bWsG+O7O7SdhhYq1vMtPQqSkxBKu0+pz+cQTthHKtNNdWVLHJiR6s1xKNny/MbpXF9lDDzn+mG8
 kfSHeupbS53pJGtlnB4ALPz4RBbWTDbBOqTCEeKg7OIzsbLonzBtpI8sy/8ZT38DcAqP0b24oz0
 a4X6CLAQ2gtSw7QSFvV37S7Zzx8iZh9U8okf9CPjIsHLvUBb2eiAHz+Ajo5e5AG3IAXaEhJ5xHq
 5OwL+khXdDS81AZQE3OkiWXrywoVIIzLzvgjksKUyBI2plK68pvSe9hGnHg8dccmiSGfcnck3hE
 1S9GjnO4u0QyAJEhgvA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0NiBTYWx0ZWRfX+aEMBczs1o+q
 WSnsRX+XGfloxx8Kr02oNrzc2B85gdyQllKOx/8iJPFpIyI0Y6EETYIw8uDOeCSMLoCF7yW+AJk
 ntOXyxC8zM1mq0bDpeeZQLdnGaGeoRM=
X-Proofpoint-GUID: XXF914FW2rNY1tH9RLrbbSojcyAcSozz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060146



On 7/3/2026 12:40 PM, Krzysztof Kozlowski wrote:
> On Thu, Jul 02, 2026 at 03:10:54PM +0530, Monish Chunara wrote:
>> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
>>
>> Document the Glymur-specific SDHCI compatible in the sdhci-msm binding.
>> Use "qcom,sdhci-msm-v5" as the fallback compatible for the MSM SDHCI v5
>> controller used on Glymur.
> 
> I do not see improvements.
> 
> Best regards,
> Krzysztof
> 

Updated commit message in v3: 
https://lore.kernel.org/all/20260706141346.4180348-1-mchunara@oss.qualcomm.com

Regards,
Monish
