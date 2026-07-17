Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E750311958
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 03:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784260118; cv=none; b=kKXkkldupMmlFScY5eiUm19+ARQa7Iaclh9K8/fTSPxcilRoSgYusG84oKYdvX94PNfeqget6OvVWn8RhKVvJEOLC0PbWkFdf1VO+npShMZQEmgvYk8b0zqeiZ8jyQzmdS/VbiM2nUmzninG8szaH/deLH/7fMf00TBay575o+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784260118; c=relaxed/simple;
	bh=Sa3wk56MV2g/ndnDgfSJgHE84Rp9SbiopO4rIgP3Ijc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P/y8+hY9HMLqpsSW3MLB4/W7oE9SSLcldqCntztFSieM1bdGBBerBfz9Y811TBKJe4zH4awpe1ecVmu4om6EXjox8vPCwWSnM8XOibHB7SXZhw+By0PoLrkdhXXV3tEVAbdap2LNh6pZZjmMpPPRUkaLG+dTtxy7uKj0iXSB4Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jqmxyi0B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g6eDH9QD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jqmxyi0B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g6eDH9QD"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H34K7r369378
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 03:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sa3wk56MV2g/ndnDgfSJgHE84Rp9SbiopO4rIgP3Ijc=; b=Jqmxyi0BoBIbO7SH
	m4Ze+Co4+zLo2mX7ah0CABGEPhAjxVMyzc71vmcub7tF7atTvUJkSB44okuHQQcP
	awn8Iz15DQw4Sj9zMck6wwsJ/Gek6PjVqht7DBltNUJgKWUVQsgDIba344ThT8db
	eu54JqhePGGKoamLY+e8C3vKaEfleJx2mbpS0+vxcmxDGPTqLtRxYgSOSz7C7RH7
	30SGP307HrIG7NGIEcwgV5LKq3apqmMKpcG9lse66cO4HO++QSeAGKUrKo8qb1ms
	arGsRtJvB1OEUvCm7Oz2SbzSxhP8uAm+myA6oV+RBwNrxoY1eA9iaR6m7gh3ojY1
	1BWKCg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fevkv43uj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 03:48:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dd87656d3so6340104a91.2
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 20:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784260114; x=1784864914; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sa3wk56MV2g/ndnDgfSJgHE84Rp9SbiopO4rIgP3Ijc=;
        b=g6eDH9QDP1QGbOadxYNxryuYZKcaMd7QR3/VccOyX5cLUT8WuVNJ72vCPFz6uIwkoE
         abOEBNZ5iHT6UtwZVqIIJ2qGiay6B+ThbBDtXadbRRxU8+AAV9cyT70JkMbPvHvcMM9/
         ynJArGapXbLd6++wBTAhBjk6vh2CyAtAr1zGQ9vGmZQOLv/38BIy6T33JGYmpBckeySw
         ew0TXCjgS6jsGpPk/pxInA7XdfL5bQAUrVA5yJXP4pCOYc3iQkynlVq+XTU6SO4KRCjQ
         B3MNCqK/ztZdjKxzj+r1j/ewfYGF+VvpDZGWittBxZd13q9d8ft5AfaXKm9idlSGlQre
         ordA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784260114; x=1784864914;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sa3wk56MV2g/ndnDgfSJgHE84Rp9SbiopO4rIgP3Ijc=;
        b=YFOIjhRRUeRceR+mj50BNtDz1v/VAayXXJn3iXPEvjInKsJUiCEEostYBG1IBR0QMX
         DWQOhv9NRslgS9n38wb2+h3PbKHUaUDh431BsT8Gbief3NeODgCTzqp367KgFOeFbutB
         pCTn3z1eYCULFMOlffQitGh70qCBCVXn1vnGhArKCVpdcQ5fLld00nGI4lC4HIWqM8Me
         LEsX5bMwO+ko4W/hjja8imgk3+Hys/pzFzXoKnATzS6DFpxmzJGY4f1k/ToADpc3HrQz
         KsxW4v23m77oWcFO1fxEWMAD1wGvPD4Kq26COL7J7Kstv4LFFep+r6D0HXMCgtOVBQGP
         ybbg==
X-Forwarded-Encrypted: i=1; AHgh+RqImX9AlzJT9KcZpi+gEx7BPzueDv7Gqv93/RK5ZrVnLdRyzGblAFktnbS2d5sT27JCmB2CCDI6knpT@vger.kernel.org
X-Gm-Message-State: AOJu0Yz84e0tLGUhPmMPZcGlLv/Ah8RrQ22+3y/Wx192erQ3AsGyCzEh
	SvCIRG77Xy5WvwYDZiIoRL8vk67CKU+DucuaRPq42n09A9LCM7iNg8XxNt/F9FYsTmXg6uFYs3N
	8YL2NGMU8N6CvcBzW3NLLimoUTgijCQgE9R5aVQd9+YJHHG+M+roevVSiEeKqrk7Z
X-Gm-Gg: AfdE7ckvopom9vfYAgm3THy86gsYrjOCSRnAfL4I35hwXHg4QKlnuKHGuUCG7Zepy09
	i6VsnsaJYupu6NTZ2BMB5NzSSctrlRIGrI/3Y/1Ywy7QohvVCR2niSaiqfQEd7wJuaECj+TIDY4
	GgnKIIol+qoKWoOfrg5cxgv5fhDva5vygZEymdMy5IZAJzRlu7Yvy29PBBgX0w7al+hT4j1kNs3
	PswggPBo0cohbRwH1C9C7ba55UrFcJh+BDgUGDVfoacM7QMd3hrUv8pAubbR3aHNVDgI/qOA2PM
	GXExEs8o314zApPRDMn1Zf450x2iaBM26tt0GJenuKSdAA09OGgPAHRc5wHtDJWV6ZYBo1YHRd2
	Rll/7Ds8uFYmRpLVvyW/jW5paLBqFjQgF
X-Received: by 2002:a17:90b:4c48:b0:387:df8f:1402 with SMTP id 98e67ed59e1d1-38e4b57e9aamr785456a91.35.1784260114114;
        Thu, 16 Jul 2026 20:48:34 -0700 (PDT)
X-Received: by 2002:a17:90b:4c48:b0:387:df8f:1402 with SMTP id 98e67ed59e1d1-38e4b57e9aamr785438a91.35.1784260113651;
        Thu, 16 Jul 2026 20:48:33 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe4677sm1547122eec.11.2026.07.16.20.48.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 20:48:32 -0700 (PDT)
Message-ID: <8ebd304d-b03d-a8cd-2bf5-a45763780098@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 09:18:24 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v9 01/14] dt-bindings: media: qcom,glymur-iris: Add glymur
 video codec
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
 <20260715-glymur-v9-1-8cf2cbe12a07@oss.qualcomm.com>
 <20260716-soft-dexterous-adder-badb49@quoll>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260716-soft-dexterous-adder-badb49@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAzMiBTYWx0ZWRfX84PwtYjI8avQ
 IM+uDUZ3g7TiGNOaTQzx7dofGrzisM31dKiryo+g9AB2bpNPGOFfubiS3GR0Njc1uhBGd4EXqEP
 iOMYGBNVXzMPEfQFrV4eiRpWxUCREqFIgHA97+/0b/7CjbE0oYXvV9fewrWmBAs2iDTi+9EyYF8
 Ndkbq7hEAz0lLQTo2ckoz+B5Fj299r12wT/E3dlAZHSHcApKFQhUmFVBAhq7nuwDItlMqKw5KKX
 Wh2fRhjP1bNbn+vZF/l48acjy/2DmQ6ThAlh6zbFQXS4gKdIObxzuzeRfeCesKaBh3vn6FL2ftT
 K74lJky/w3nkqNdlbx4e/FYQCT8MdvTju34n+osJwfT4IJ63cWiF85RsqZT3UDXcolTBqalf/fM
 ITALk25wZN9v75bvl1hyp5uoYaZMWRhMt6k+HD3PqFYkqovR+DE2QvAKG7rF72lfAjJTj1XncNK
 Ca3o6ULCk+yU1u+jQNA==
X-Authority-Analysis: v=2.4 cv=WrEb99fv c=1 sm=1 tr=0 ts=6a59a613 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Mf6ET5Z485SzACLcFDwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 0IpjLPXGAoSU3_dKi7hGubOYfgH5YZc1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAzMiBTYWx0ZWRfX8pIdTZdmvA7g
 qEogKVDf9aB48rT121/IXnbJpk0LCTGgW4tf1y61N/+V+556cKhpyhcuwTAbvFlLi4ECDJZZHO0
 Nrnkcf6YyOk6fKSuAGAW2uFsKIeL17o=
X-Proofpoint-ORIG-GUID: 0IpjLPXGAoSU3_dKi7hGubOYfgH5YZc1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170032


On 7/16/2026 1:10 PM, Krzysztof Kozlowski wrote:
> On Wed, Jul 15, 2026 at 07:39:55PM +0530, Vishnu Reddy wrote:
>> Add device tree binding for the Qualcomm Glymur Iris video codec. Glymur
>> is a new generation of video IP that introduces a dual-core architecture.
>> The second core brings its own power domain, clocks, and reset lines,
>> requiring additional power domains and clocks in the power sequence.
>> The current maxItems constraints for clocks and power-domains in the
>> common venus schema were sized for platforms available at the time of
>> authoring. The glymur platform introduces a dual core architecture
>> that requires more clocks and power domains, exceeding these limits.
>> Raise maxItems for clocks, clock-names, power-domains and
>> power-domain-names to accommodate the glymur platform.
>> The glymur platform-specific schema have fixed constraints for these
>> properties, so the common schema only acts as an upper bound.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> You must drop the tag, you changed the binding significantly without any
> doubts.

Ack

> Best regards,
> Krzysztof
>
