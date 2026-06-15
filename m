Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67DC3793B4
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 06:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781503938; cv=none; b=SHTKdW8KL3vy12aAEiidywOJANSW1YLVuxqPeWEyvgepDa8gHd1TeVmZaaMFRZl1p1kU2t0GqJfHJujWoO9xOdjhMxQ+7E+PO48Cnk4IxdSZ/+1A6UlkTeT3SN8v/deMulopDTHu6Hfu3Gih/5xGSlhIKhc31FtVUvjktcVyV4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781503938; c=relaxed/simple;
	bh=tSmedz+Oh3jsgXRS7vmeVV/V32mqeZtZmMWPq9oxuyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XrmdWmuxH8qMKS4lrf11QBxl76wa1gddfScZmDTk3ZpDeZdjD6nRhM1x4StiD2Zjy/eJ7omvDCA10zzCzmtXWicY78i0/2BSD64ha1pgdQM3vQ9FA2/VDcGriacT/RM45WGx7s0pDndDMIOvtPZmusRhENs57OWbePIWma3yMYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fj/r2Oki; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FQopCJ6t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fj/r2Oki";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FQopCJ6t"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1hwkO1227626
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 06:12:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d7gViC5SQ5ULIBq1coSdam39lZ/15XA8vuP7rC+uGlI=; b=fj/r2Okiyd2UR6wZ
	Y1rcqwZr8omOQmyljZnvOAe9QblheLc0csC6sEcR0R55StY4JVtT+4zisDd3eIGP
	TCkwvQaMYXya84TiaIYNR5AJ0HiL2S+mShZ0OXR3XbB3ogncQd7aBJnxcAAGxFAu
	l1aC3+zuWTQy2p9QTCPMzzlq0ZC/zqsdcxrvyqm+YJHIBbcGXm9LC1/3SwUJ9OMR
	oWLZJPvq37v4B26bDAQBkpsq2LOGZ8qyRCZk8/enVWH9Qx9GZw8vAeZZ8Iirl/sY
	fYbbzbr310w59E01f5VV/RKYJD38nRyAEd5CLrB/Hawb6RTnB6xLoamiHrGTjSGY
	Vc41WQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryffns99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 06:12:17 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8422a0eee68so4207397b3a.0
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 23:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781503936; x=1782108736; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d7gViC5SQ5ULIBq1coSdam39lZ/15XA8vuP7rC+uGlI=;
        b=FQopCJ6tw9sJ45cmpjSgiYXxwTTrEAiSP/62knX1LuPnY34S67+Row7biGS6uwrM4r
         kMq9uGk01yLdrrhGNaLTSoBeTueE3veSBJPcgYxWKc0dDxdmFgLIG7NaIbvo1f5JiaR7
         UAh0ilL63jJ028IvtNH2UsH2enJGSejP4UUmAjaZF21A8EsaGUrcSFEpzaICtIpaC8wx
         5R280g2+DTsUu83U2hbyqcXGcaGXVEJHYlwmNbKPmRtqM5YULN8T5+71121RJAIexE1/
         0N7p6UnEIr28h/8E115ZiLdWPjPJc9iD5RcCaS5sAJNgj9WlNU7zR7r90x0fRKiinyLO
         M5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781503936; x=1782108736;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d7gViC5SQ5ULIBq1coSdam39lZ/15XA8vuP7rC+uGlI=;
        b=WIDjH6QVPHlNxDf/Xo7eCV9SY25L/QgMMdL+ElAzDtJBBMoB8H8lm11tzzVDroVIif
         DgId8WO+/bU4zy29oP9O01PDi+NbmT7Ys41esRBa5+wfW4dxg8X2Fb5kKdXlbEtuAjQE
         rpBp1aJtT6XIOJVAz9vVQJVRKmw9a6xF5VnLNcdc/z+Vnhta116li4PULrakXoZFKC86
         B98NxZGPu/u7v5RN6biyl2CxUpX0Yige1kaWNFvJiI5leAR1RrVMF4pMhlt3twlWZKa2
         qd2ikCEPpqdmmTx3LSf+umgpadljz+8BiNg/q8ySyi8sZgWXiGYxfxd3mW08e8veVtLZ
         iBkA==
X-Forwarded-Encrypted: i=1; AFNElJ9DkuRUPrijvHmx7wW1oOnLvbhtVXtRc0xAeTnzQKDhR9FiqeSYv6Mh4eyzSlzZp4K6Um/OQsI4A9j3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6oHaNOYAHs8qS0qfyJFKevVHNYu93NYrKmFPsR0svLS/JupFA
	FzmORrYnG+IZ5Ibei0LK+/17bMc36KZAuwV2AzlbL0n81tRaCv6hx1uwuPEpa96igJtnHIke+dy
	o6/OD+6/lD83+T2s0Swhd0wttUg+pWLniEyuBu5CpNo2iuSvDK23qJp12lJ0g4AOC
X-Gm-Gg: Acq92OHf64W3B7V45iyv5a/Y/6IoFMZ15spftOKPC8rMN10TXrqyNKsefB+u+MzEao0
	yRykT4LmiNnMEDoY4SVXSmuGdEu4yopusS/+kUo6FN1U9KDjbYK71JSFbNGQ8Vq3IlxS6hN6qcv
	w+iR6y0cAuTV8+Ey+iwjmxiKbq77ztHkC/beQLSoxDZ7kIZn2gixm2DRJ3EQ09g4Hn3Q73YmX/R
	MK5/8DylptxURfravPgTrzjcA9uikTgckuVKi6ypOEeUmWvZa2fykkyj92ERpJ2WITlIaUmhBXs
	+tIlB56Vm8Ol0zmcrSmco5HfofLzBSGIo7Ndhe2UkJhKuAHqGZ8fXkKq46WZqIrjrPYUpYIr//Y
	8gEwTyEj6Q5T1PZbpRr2QmJ7Sx1PZG9hxemrTQPrQtxX1SILqRaYOpaoFVhBxTJbn0unzJyTEjC
	Swlb557i71FDslgwc=
X-Received: by 2002:a05:6a00:b43:b0:83e:e897:a394 with SMTP id d2e1a72fcca58-8434cc16b90mr14124648b3a.7.1781503936454;
        Sun, 14 Jun 2026 23:12:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:b43:b0:83e:e897:a394 with SMTP id d2e1a72fcca58-8434cc16b90mr14124600b3a.7.1781503936008;
        Sun, 14 Jun 2026 23:12:16 -0700 (PDT)
Received: from [10.133.33.21] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434a934a97sm9132161b3a.0.2026.06.14.23.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 23:12:15 -0700 (PDT)
Message-ID: <06529f97-1b41-4fb4-8953-8496a3663ce3@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:12:10 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: crypto: qcom,inline-crypto-engine:
 Document Maili ICE
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260609-maili-crypto-v1-0-0f577df56a61@oss.qualcomm.com>
 <20260609-maili-crypto-v1-2-0f577df56a61@oss.qualcomm.com>
 <20260610-mighty-dalmatian-of-piety-2fa184@quoll>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260610-mighty-dalmatian-of-piety-2fa184@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HuxG3UTS c=1 sm=1 tr=0 ts=6a2f97c1 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1TaJruIST0psWsyvLVoA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: VzPfRLxP9QIxLuEQ2_V7Cs8TBXEWHGwt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA2MSBTYWx0ZWRfX64t+yWSmsp1X
 qiVtG4XA3k2lbMRncWPHnOj/8zaOe/S6UvBZ/vOf4V/cQtwMF9lPVjL0r/E7QmbWTeTXCbL02sy
 NaUPVYo8rjBMmXMpBgzmSb4sXQByE7Q=
X-Proofpoint-GUID: VzPfRLxP9QIxLuEQ2_V7Cs8TBXEWHGwt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA2MSBTYWx0ZWRfXyx/NQo0WlknF
 UOz6YHvYXJViM88RxG/grvPTKX/ugijBiBdaRdsiOGUsG6LUMZz8SOTl5RU8TxBs90avFV1M/b7
 3XaAmZU4W5d9nfBTz7C9n4834cMoYczF3YMIRWr+a7HUm5G2dRwzSfnNtjcw9/SoAtmJ/xK1Av6
 YnO4w1ptCYXEMzfB2Pq5gUc8kXW/viTdAM1ZoWnvfJvfDRxxRoq4e+u7kF87ETXCL1Psr5BnmJ1
 D0WpJ9+1D1VT1vqBQfmjW+6cqo8v0bjX+PumM65InbWeqNwXQoBZUdpuVwq7qGUUsSCbX7RYMyS
 sqgE7a95kSrPVhqgeqB/BCxinNot5zLNAzIg/fvcj5rqnzBBqQNzXO6MvdxdUgMXkxhCYrX38bY
 w4txD3Xz16kMzusrthHPL2EfbBhxu+OLF9xErnapD/db7qe69bsQa4JyiiQTgo6+PYjwDDYPT+u
 MwkvI6xPusyiOjjXVWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150061



On 6/10/2026 4:55 PM, Krzysztof Kozlowski wrote:
> On Tue, Jun 09, 2026 at 02:08:57AM -0700, Jingyi Wang wrote:
>> The Inline Crypto Engine found on Maili SoC is compatible with the common
>> baseline IP 'qcom,inline-crypto-engine'. Hence, document the compatible as
>> such.
>>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>> index db895c50e2d2..c9489f6b8081 100644
>> --- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>> +++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>> @@ -16,6 +16,7 @@ properties:
>>             - qcom,eliza-inline-crypto-engine
>>             - qcom,hawi-inline-crypto-engine
>>             - qcom,kaanapali-inline-crypto-engine
>> +          - qcom,maili-inline-crypto-engine
> 
> Why clocks are flexible?

I have just noticed that this patch has been merged:
https://lore.kernel.org/all/20260416-qcom_ice_power_and_clk_vote-v5-1-5ccf5d7e2846@oss.qualcomm.com/

Will add qcom,maili-inline-crypto-engine to the eliza/milos list in next version.
( Maybe hawi should also be added together? )

Thanks,
Jingyi

> 
> Best regards,
> Krzysztof
> 

