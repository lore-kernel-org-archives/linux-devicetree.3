Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497708;
	b=Xu8MIyG3lg5MNrvkNWCZjdUPdAMOjwYzLosevAMdqnzIskmdlrGko7IMaJ1UhmujxD3w
	 BRahw/y08eTxF01rpI/rUb8ukV7Ew+OtXTMdoAOrLh2eLVeAs6gJv+Skl1/gzQfK8q7gc
	 eyKnqyja8il8TJ2Y6zCe7FY9/k8g1TVae6PGGWRsEFCHW7KEUsT5x6zYDOVXAELNMyjIO
	 CUYxiHrVeG8KnrUmP/8dmWLblajTiBc9hjyuBJTVuNv2k1KQ1BXrXHanrtZgV5vLcU8Gj
	 cYK00kB5aRJbCcurE3EX8eRAqvC2FLf9gr4HbvPlGYfZKYbuMIUy5lzET98jjc9oN9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497708;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=21bLR2JmXTDddOKLW1hcjZrQEwDB8KnFMAgwcI186gA=;
	b=RjhT8Z0pu0m66YiU/w6TrKtV3bMlj85Og2XteohYfCe8+ku839d34pgBK2pIGL4uMbDE
	 RM8ir6slFLpIGSYpUEY9xgR5EGcx2LENObr+pxS5OFDm8d2BCXDObjTIL/SR6nPoh1rFK
	 OvEVWNq92YxMm6Ci/ZjKh2QJYl72AfazUAY1yqFNb6FZ54SYmGHTHtExzpz5IZmoiVY3A
	 zw3b6j5riyZ4TfZdYgLbYV3u/bZcPQ4ePyuaFmXLA4ThqyWxrv7BODCT4Y6Y1lBg3qG5l
	 qDuRlGu6ccY1jNPYBpwUl8jjCgQWOmLK5+mVZqpzhQPSy57+qfv2S0fb9/viWL6BQew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dKxBXOIN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j9xhNuMh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4744606A32A
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:01:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4744606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dKxBXOIN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j9xhNuMh
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KBWWb31571795
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	21bLR2JmXTDddOKLW1hcjZrQEwDB8KnFMAgwcI186gA=; b=dKxBXOIN03woNdVS
	thwtuYdNCsc4hn3wnVlabqxaHdpgaqK7nE08iVjEja9F7EEAuMrEMiKLOzAo6G9u
	XSi8pdplwkzQQH9nTvfuSPpmdxJTGVX5Lwm6t0rs9hOGaP8eTExB0XFDrbjREgqU
	9D+pBdA/bw6Urk4adotjR78tUp0jbKuGlKxcbg4aNu9UxeH3q0kjhj6UUuB9mjlt
	DMyvtYDKd1EbIBhYr4cdzuvubU9Xb2dMf7/+PLjFMn//VX31oh0ecTLs5uZQSStx
	Y5cVU1VXznvA55Pmesj2GDI0X4HQzNlB9ORilDFEJrXP5RUPPh6vS+9x7566/KfV
	c01KyA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h2830c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:01:46 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eacd73e83bso71299e0c.3
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 05:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792497706; x=1793102506; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=21bLR2JmXTDddOKLW1hcjZrQEwDB8KnFMAgwcI186gA=;
        b=j9xhNuMh6BIXbgfAF5DCDA+DrgFTexEkXKhGqS8/HpCZQC3Ie2nLHgfAFuzHKSUV8n
         ZbKRWNsF/Fu0Wwy1gkJ7Syhh1bLhxhIpfHYOiIKH0cfhNviIUKuvQGHC9clxn4Ih5Efq
         WmvC035GaEccgYxIu30kHLn36FDjAkjeV4FTLg59vBKWcMV4CC5tu6gfnpft27wn+q+q
         VqlJ0hmU+kcq4i0VhfEGG/ghUYZQM6iPXPjEd/f7iu+y5t4BDhC9qPfPrCGlN06M8dSH
         tAn/w1LDvj1CCK4g2i7L+jshnCjqkWR7rCNj0rF+GRbGtMvE67EQZYAUPLFSrrjZIRZj
         1tmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792497706; x=1793102506;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=21bLR2JmXTDddOKLW1hcjZrQEwDB8KnFMAgwcI186gA=;
        b=0fUv9VvG8vVBOAcKTQ5Bih04KrxbMMGG7yBKaY/r0wJcRlYjx17y/nTDEg2ZIJClKC
         k9kuz6pW3CZ4ozY2B1PIPlM1GZKAItmSE7Io6rOvf9UIeeYcGGcWeKo6jZuRI78vNPcz
         Nyj26RnL81Xcv/5E79NFIXiSRRD6Q4H0G3OMbg9YzJDmQCmQj1ty3qPt10xB2E+uuGcN
         gbZN9XNiRjyP61je6VSMgjKwTdkVgRESJlaW/uUaS3PAMjuNK/97XtEcxw5VC/tOctvs
         fugh7X1ubnO/ENDGCXxmEeMxbfcY+LFryxjopCjvxtUBRZmXx1M/3bhdw1MvuN16Almz
         R5Tg==
X-Forwarded-Encrypted: i=1; AKwUvBybAqO7AmjI6NWrpviHkYx9BIUIm5FnJL0kbh4T4UKIFapERpUEc2nar3FRiNVDQae7KNDYdykbxkC8@vger.kernel.org
X-Gm-Message-State: AFq9FYLa/S0nm6MztnAAUE2j9tMh1Xa3+n0YworQ7V86v4kOE/WVhdBh
	L7Mrx+wvbq5pDgNOVxj11O8w3QIOm4mhrp1oVRd/QlKth9SLWnNFAAk3AK+NRETzFgtsK4wufGl
	1o7qzC+BENdRqbUjiu2BWaHw/lviAYe2wvW//NO2uYlkz8EDGh4hc5XWjpmQYZjjr
X-Gm-Gg: AYBFou38yZhpgiz5iV/jc1UmTGxXnF1pOvy6ZRAMW4YJuEoiO2SCuPB7C5iMPuCTtM8
	cz4YzkUrOwrNJSqmrGrjyLM4gyZmoV4nmZlU0zUOJPT68sPXJD+Rdm7k2pzOeruFvR3f51+LUXR
	qxxM8w2fj+N21kpnWRcGnVVWvd65vxNUPN7QNZ/CivfohwZk/iYHzLxT+pEJq9hM4b4jife5JZB
	Yr1C9Dt29Qxu8Flfq8eT1m6GkU+MMCSwjHVlokvJGS5IMKrgP25V8+s41rgxUpOvp36IPg4nf1K
	zTnwQY46hDvapeV1hVmAmTc3k0FVLkwL/Gmtv3+GbyerhWd7b3ZBYPKGJyzEs9iTPMO7XUnLcvM
	m7wYxPd4DKMiTfJDwLnhyCA==
X-Received: by 2002:a05:6122:4989:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5eaaa107d54mr1758165e0c.2.1792497705843;
        Tue, 20 Oct 2026 05:01:45 -0700 (PDT)
X-Received: by 2002:a05:6122:4989:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5eaaa107d54mr1758133e0c.2.1792497705320;
        Tue, 20 Oct 2026 05:01:45 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32876asm481579566b.10.2026.10.20.05.01.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 05:01:44 -0700 (PDT)
Message-ID: <268aff60-c78f-4804-8125-c8a6aa10ed6f@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 14:01:42 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] arm64: dts: qcom: Introduce lemans-embedded.dtsi
 as a placeholder
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-2-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015023711.721837-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BPd9A_2J81BGWbEk_KtYxcSzcGa2EQ2B
X-Proofpoint-ORIG-GUID: BPd9A_2J81BGWbEk_KtYxcSzcGa2EQ2B
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad7582a cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=uVEy52KOV2DfC4Ai_b8A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0NyBTYWx0ZWRfXy/bwOLZgA/Vv
 1qg+raLLNV7RQyeHsKbKhpHW8br1LRXpOSkeMYPn15onCOdu0rG/uDa1dBiq+zuhvpd3E/RB3ZD
 0raHg8qvxe00eobZbK4kph2t8wte/rA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0NyBTYWx0ZWRfXzt1VDaPMaJ2F
 UwMI5wam2bv227vn3qNyj5+pCdPr+fWD0NnVOIrUV873cDEVLuG3WicbbXBViXBHHQXLYLfCmLM
 spJ1rcMzEmn4CAAyuD7n2Td1rN9tny6un0Fe1vWGxe9srgzftcz8jeKlROKvWadRgyUtgOQmnNj
 IAN1/31ksQUae11v6HZq7+PXK1mXzVOWcHSzp3bidr9qmqrHfVBcqkj1ckr4uIJ9ycG74lq+W+o
 xn2bunVrA+LYK9dyAyAtuCCNukceJyvEejLt+bvrBcUnu2Hs8SfTtxc0FTZRaHgOofrI/0f97dy
 IUitShm9Y5BVEMMPSZ/nu3iF1ooUPu24ZF7QRAWcmRL2O+EzYtEFSYxRe6Lbf28ml4TLGjm7uhm
 kwVGzP7BY4GzwzNDonS/uBIeQWLR/cfZNiMXbRWwyJroa2DCLpYZDorcPk+BJ/+UkTcdDcxc63A
 +hW7mugboYprY7x+sPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200047

On 10/15/26 4:37 AM, Shawn Guo wrote:
> Lemans is a Qualcomm SoC family that includes not only the Embedded
> variant (IQ9/SA8775P) where platform resources are managed by HLOS, but
> also the GearVM variant (SA8255P) where resources are managed by a VM
> as SCMI server. The current lemans.dtsi covers the former variant only.
> Introduce lemans-embedded.dtsi as a placeholder for now, while later
> changes will move Embedded variant settings in there and introduce
> GearVM variant support.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
