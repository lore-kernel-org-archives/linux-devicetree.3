Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7824E322D
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 12:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791979797; cv=none; b=QD+cforeEPHCuRaKojUQTuFJaBu6WrNuVramr3WV5q9a9M6M/48dSSAHcbvb3zFYPV399nYMYxsoSiXqRs/FRAMJcj77dsehkLiiOHTi8gktM4W0R0HPziQpZtQ/r8FMyDhOcntAGuO14TJUAQO4iI5GZvZsXamrFOQ7dR93xu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791979797; c=relaxed/simple;
	bh=XqXYi6i5weM3CECcTlhKwAMVjyjTUzcxZkU/xTOwNdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mut2vlbAJsctpwK2gicz9BOuDieUe4mDjpBsJRMZehI28IwG4f59pr4PkR4pW/YLz4s+/B5TXa4AhhswBnpcs/T4J6unh9zRg8d9dTMm6uFRq+h2aowQmT/DarV9ipMbujhG9SRQiFJ8DyEvNAYCajNJz4boSedU4N2cAezkOJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KrZIx90i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NRcnBAwU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KrZIx90i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NRcnBAwU"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBG4Jx3366064
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 12:09:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cKe/cXeBwiU+47rxyqBvKFaQLQS2FC5SS1uRMC3gpUA=; b=KrZIx90is89wzscO
	37l80+9vWDnpqO29ftNSCGN4L3wg3L1iIQn9kjlwfhYSbK4zh9SUW9+bHLaN/9qN
	YQB77GhruIq5Z3+4OHxuA7VHQjArdhHAXYe3UcX6wQEdaFntzEEtU+UsUqFstAfr
	XbZrkM0fYcyUuswfU1YBBlEGFWMEvQk9YaMCfvlMs2XY5CFQRBnzMoyApNjj9Vq2
	c0HZ3gTwTuzdqxJjLsAQRG+F1V2rDRL9nlu/2v4jv7nSU3jvun+DRrbyvWiYRzki
	ppJOFYtPSu9MJ+XZXZdhJ/v7bYJxFC9Su+7GtwREdZYVh+Ey0EAqz+a4FidPESZE
	Z3KGbQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4621fd2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 12:09:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e8ba4757baso9491485ad.0
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 05:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791979794; x=1792584594; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cKe/cXeBwiU+47rxyqBvKFaQLQS2FC5SS1uRMC3gpUA=;
        b=NRcnBAwUOit5VZu6RQMYjX82uA+ouINbVB+Qv7TSZwGqbw9W9hDUcszgklvtk+eFOT
         0lKXV5yYzpskx6LYSqiJPSidv8h6W/pTQFyjnUk2cj4HkTv/N7EQGZbyNfBnU9TgFs0A
         zwUmZ/xqfg4D2N7WrAuygFVw0IyO4DfxsyDhKcnxPcekHm6/Xkw7Pmx1Gq/iJ2JRQRcX
         9rZ5DYsgxZHJuu5ADL1LVKgd6KiD1WUwDCezq+EAAyPa5BDgnNNvagjDY8W8Hhkd7PPO
         UV/fS1vvRcwR5Ig/x6bNIVp2FVs43UjX8HNrdkbHr52Di3bNJw8EicPPRP3h53yXp1SL
         jkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791979794; x=1792584594;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cKe/cXeBwiU+47rxyqBvKFaQLQS2FC5SS1uRMC3gpUA=;
        b=g7b7FwSqOzJz3JrPNSM2el3noYbDVlLrdjlqrTqYYxUtqMcNOhnDiwwj5DzZGKZfpG
         LJjxa9nM4ywo9dz31FYVfUmHM4w4Z0AGJAgV4C8hBtTRJF7ABA8+iuzLQhCAkV/XPlkb
         LBNB9Soo0l4NmfWNyzWpEB4Bbb+0XC1vIIfptvIDiG1XDlpXVFlPr0FrKa1GoCSalBki
         FL9dGHQmkEEZobjvwPpXIySPxy3iuB5J7bpaxBKXzsEeVq4dOoX5NYch43A33WrRT8sX
         1bSmLW7UR5afJd9gKPh28gHaBrjaJyyp85564cIAuJYZ0IpxLM+OhtsPhcSQ8Gl7ooab
         4wEw==
X-Forwarded-Encrypted: i=1; AKwUvBzIGYrGEaPMzjHbM/qkwz4LFp2QB1c1tFmq/zQDtLnpmRE5PcJ5j6bsQcZA4d4wsKdzap2rDj6gO8EL@vger.kernel.org
X-Gm-Message-State: AFq9FYLIjUS8gwsAno2xz3KsYihbG55hjXjDyczkP2FSP8dvD+VUvc6z
	g1gokvRhg3016AWIGZPTasY45WMgfdqV9CrgjHn/jK+GQlCT8McO57cZNkHlkKpFfkF6ihKudsl
	es8Xo19Rqnieh/qWOE8UZO4kBdRtyIUAVd5rRqW64K3Mkv45fkJiesnocHeCLO+O9K1NQYhkz
X-Gm-Gg: AYBFou35h6hlq0yfBshqqGlyfoNxE5xf0mnKWTZPX6MJu08QX5xYKEeukL3K0R5Q9gu
	C/c+6Q9NKzBUHzOL3dCoS2Tcdu+DD+GtnffuUt2qNnRbTjBZ5fVu6cmvqFwnOgh8d3b8fGQW9rh
	aiNSRkFkGTP4LreqXtcKIcQmnObzf9YSeG9Nx56WtfuKP6IsVEkO6x0Qud549XwNFsiXveiiXe7
	oSYIZaTvzuYgbpqfbYLeQWbw+/WBvDROdNzjF01ubA6YfiRZdnwz2bgrtzfJrHs2o9Ga5NGKwRc
	Twfgf6nhbiyE6917M+UdffXm6rcmotX+wxqo0VQk/nZaEqKVvxBj3qJrtqdq2ONHyK/IFx4dmAy
	qtEBDTQNawyMua4Lzqnr1tbsSq9Bwx00ylM9W
X-Received: by 2002:a17:903:b0d:b0:2e8:9820:80cf with SMTP id d9443c01a7336-2e898208342mr98953255ad.58.1791979794074;
        Wed, 14 Oct 2026 05:09:54 -0700 (PDT)
X-Received: by 2002:a17:903:b0d:b0:2e8:9820:80cf with SMTP id d9443c01a7336-2e898208342mr98952775ad.58.1791979793537;
        Wed, 14 Oct 2026 05:09:53 -0700 (PDT)
Received: from [10.217.240.130] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e841a02f85sm68385425ad.10.2026.10.14.05.09.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 05:09:53 -0700 (PDT)
Message-ID: <a121c425-7046-4a08-b746-908d5a3ef3d7@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 17:39:47 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: qcom: Add Talos Lyra EVK board
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
References: <20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com>
 <20261012-talos-lyra-evk-v2-v2-1-dcc9316ebb59@oss.qualcomm.com>
 <1cb252eb-a7d9-4eac-8d28-8d7781ea430d@kernel.org>
 <2c93f85d-a6f0-420a-9b7d-cd72a7963ab8@oss.qualcomm.com>
 <ca132d7b-a0d5-44f2-8b98-24570a88c9ce@kernel.org>
Content-Language: en-US
From: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
In-Reply-To: <ca132d7b-a0d5-44f2-8b98-24570a88c9ce@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vynQUxFe2DvJGZwh69_cgdslVTkhvwSk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0OCBTYWx0ZWRfX7cnPMMPG2D/U
 huY+nt7WMsGWAfP38HivCELrlcSKUNFdx3Jn263wMmXN+8Kk9uEhh5qSlMv9vLiP6WgQmcm52MF
 LPakts0P5fEzifjCjzeA834Orif10whwnKcIflao5fIPBKCWEkWhgZw89+bdnf4pT6Qz1AJ2K0R
 nEkjcu0x9D+GUAiD3jWYnC+w+1XnVrzphmPTS58Airb7bu+nTNMneISn2F3YIYcJKuWATmeYz8N
 Y+d3gUyKL+Sp150UlnWLWFGBlpkHnoShRy/4cl64GzH1kwc08ieXQhwJFsTasPRs8eHh3v4u2PK
 eartH3v+3+VG8rg4FdMhkYOzJsz4M8Hb2AfvvKUrMW1QTVNwxXan0v0XSAFzf3d8l9RR0wYIfzp
 xzab1u7NEZZErXILTQQ4bRO0i1xQ94LpworfNu7vR+qqcbmoFkyY+0SFthlsV5UybT39s4gSQVm
 AnOmlpaRPLxjxrnJQ8A==
X-Authority-Analysis: v=2.4 cv=ErZHPicA c=1 sm=1 tr=0 ts=6acf7113 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=-yIWcSpDq7JthD1KhtsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0OCBTYWx0ZWRfX/+tJq8O4vGFn
 E75+gnuPEOYYLHFLlfddM97vwttpI9lSb3fWM/U40UPF4KfJ275a80WVi5OWOB7zclqaFn04Sfy
 TNx9ZcqBkvUSVxPo9wCjnGWhf35ZVsU=
X-Proofpoint-GUID: vynQUxFe2DvJGZwh69_cgdslVTkhvwSk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140048

Hi Krzysztof,

On 13-10-2026 15:04, Krzysztof Kozlowski wrote:
> On 13/10/2026 11:32, Ruchira Revdekar wrote:
>> Hi Krzysztof,
>>
>> On 12-10-2026 16:54, Krzysztof Kozlowski wrote:
>>> On 12/10/2026 08:16, Ruchira Revdekar wrote:
>>>> From: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
>>>>
>>>> Add the qcom,talos-lyra-evk compatible string for the Talos Lyra EVK
>>>> board, which pairs the Talos Lyra EVK SoM with a common carrier board.
>>>>
>>>> Tested-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
>>>
>>> No, this did not happen.
>>>
>>> Please do not add inapplicable/fake tags.
>>>
>>>
>>> Best regards,
>>> Krzysztof
>>
>> Apologies. The tag was added based on internal validation but Nirmesh
>> had not yet formally posted it to the mailing list at the time of
>> submission. That was a mistake on our part.
>>
>> Nirmesh has since replied to this thread with his formal Tested-by:
>>
>> Tested-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
>>
>> will include it correctly in v3. The same applies to the identical
>> tag in patch 2.
> 
> Again, this did not happen, otherwise explain me how did you execute
> this code on the device during your "formal validation".
> 

You are right — a YAML schema change cannot be executed on hardware. I will
 drop the Tested-by from the dt-bindings patch in v3.

Thanks for the review.

Best regards,
Ruchira
