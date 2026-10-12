Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0B648D86C
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 13:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810210; cv=none; b=k4yV0Z3I6oNv5AyUrBLJVX1cbmCOOuQsnIxOrb8Jkf2aHiZhZ+ugVMUrU4RZinjSR4w92REKEtPaCdUgPKLkG008NKyvhJZk7AmmeeP4HK1694hTKauuhqQsRzyqOR0vs6FeHQZI3ucUC8rreG34iW4MZmgHg4SQhLCy8Q7PxcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810210; c=relaxed/simple;
	bh=GfpGHxUnYZzyUwIu1z1KCFtH5RS06L2Mp71RQg6jZc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q9pwKuuh2OE6HfOzmjGrRXVm9JxapWWig2JxtsI8CGlXlxYdkYYR+4MORwPubh1h3oebfaq5W1zIDuESenl8vkuJi09E6t490CQrD1PNG6oe4DahIu5yJbuXhPV6p0cboiAfBOLGMTW1+6/EtyQcXCdDYS0mTro7oOQarqu4nvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NsuTBb3t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GCKi7h0Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NsuTBb3t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GCKi7h0Q"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CBxufV800720
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 13:03:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6J26DTKLvi2/zw10DXQ2WKfVPDze9T8UmQFrJqlSlLM=; b=NsuTBb3tlEpbtwnm
	i3sAMaRSnVD1YaEWyP06EiT9xdvlyDWWe0HcaFYxt01UUg52DDg6HQh9B+17nl5M
	3B05fe2qvYfz+Ni+l/pNuDixudtdeq0uLn+YHz1u5tt9idmb1UD0o2A8xHVAjxnk
	wQPAMIRhStJdhgR9oiosZKls2oPWLkmOywzqOAl82cpUeGOaV7RZxpU6AfIuULhj
	1SLP+YQ22hqjBBEsCJL9WBKux1YhRRA9dFNOqUp9qYrSw4QmGdjJ4UrVmiDkzLGj
	G390hqsZfHyrtBaNKqvjSc7+a9mpscyN8H6zpmsikEOGxrS4ap8tRWVOFOijRMog
	jyD1Kg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wfcrscf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 13:03:27 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-77f133855b9so29539137.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791810207; x=1792415007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6J26DTKLvi2/zw10DXQ2WKfVPDze9T8UmQFrJqlSlLM=;
        b=GCKi7h0QhgTtl1eRrzG4GzGEoXXNyGKXmIVL93oUkSg9DiuSTwNAJvQ9swCwtolrhF
         FUkQ9xXP1OItfVhG3ybM4pCXZIp8SIjOlOZqHGCK/7fgq0O31tdcUCeVn30VNLE0LStf
         phc6l/AVmT3gFCpgclTG/QCkgHmYL6rtlJWzsPmr+cQVB+eT0SkiKmOgn3mUTtYntwYW
         x+dszYWoZPCM75IhnElGwcL4HhhstPUYd0LuPtTPqD3H4ML5plvoaXfA9NCO492WQ5eN
         pIXZuILlcff4Jo23auzP/feGfaPDsz57KY32bN+S9GobmTllfD/tMYcPj0XqlcK/5dII
         w/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791810207; x=1792415007;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6J26DTKLvi2/zw10DXQ2WKfVPDze9T8UmQFrJqlSlLM=;
        b=Ugmtx5J7MKZYZWegVvfrWF+KZoQ5diUnYvzu8FHQm1HbFgn/2dEQFOcBx1LhWF558m
         D7Q5Aycyp46hpCUndIjyzOD3WM96N/KlbsFj+iw5uMlWW3sEuM9pGq10T/CLqCN7pBBv
         yHRBkjYHzGdXBzRV2fjMLYYc9BMHdJNLGpqYR54FPbP5wc+teWs+fy+/5v9Mv0N3payD
         02JknemDxh+Xy90csnaGiWiPNcrZoyjG2IEFGxZwl5VLB6yyDrrk7gw50ycrWYJByPBd
         oPVPymLQ6f8shbPIqm5L3iWHc/Mn8IHf1QFYuwse08J8MPNuf9HYQPXF0aLPUaYaLvXW
         kzjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpOGJylJGZX3l4m/0JtshqDJUAY+79SYgIag+aSg5ZiLgjiFY3oWHbyCRde68f1+ZgzmyMdimXje9u@vger.kernel.org
X-Gm-Message-State: AFq9FYKx0VRHJ9TRBrZYL0/vS+oMVVuLtJluk5vRtxCFwuLPFyCtOIaN
	2wUFpQXpRwovIbAwnKQEh6xsEl6TGXZSDrpsBh8WAyL67JaxnFe0OD28GUe2GrOsq1Uageev4RO
	bQweVY713zfMAibdmMa3dZ+MefQNoejcqNVXLmbicFex1E2tNzvE0N9Z4K7Lhy+VW
X-Gm-Gg: AYBFou0rX4VaD+W/GkSeUX1nvAkcumvfjdWr6Gf+RCl1ppKzUgiFNY8X7GpDshC2Aon
	uy0szKEUyB38qBeXlDMOTnwteiwx6go+FI14UMWp9fUEMSDWbgHcWYQgf25dBuI6se8RMgZ4els
	Gz+8R9sUwX73YZAkSffpxo6BejrwT2lXJ9rfA1ZwhyG9ZtENU9QN7M/Kq+031kCpxpr2roW7bWo
	wjNOCKMucUJiSo4rMzrcQH3WLsGrT8Oe7t4iYvSFIpxZOp7shs+qCs7Jhq1sJHJW6HsmuQiLaIa
	X6XxJKlYynoPHr80B9+VhkOeo1X9WxQaVOcuK8Di4Bt+36U0hER+8Q+3BoJGySD0FmzMV86Hj58
	CPhtr8wFtKrVZGF08TE7qwg==
X-Received: by 2002:a05:6122:8704:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5e9397db6b5mr1278945e0c.3.1791810206898;
        Mon, 12 Oct 2026 06:03:26 -0700 (PDT)
X-Received: by 2002:a05:6122:8704:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5e9397db6b5mr1278916e0c.3.1791810206283;
        Mon, 12 Oct 2026 06:03:26 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3382b8953asm232387266b.21.2026.10.12.06.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 06:03:25 -0700 (PDT)
Message-ID: <996a5786-6f47-4afd-8dda-68a46b6a0623@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 15:03:23 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64: dts: qcom: add CDSP FastRPC extended context
 bank
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261007-extended-mapping-dts-v1-0-b52eb8c3613d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261007-extended-mapping-dts-v1-0-b52eb8c3613d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sFyYYR-mcroNbEXDaWslKTu4lN-mJZYs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1MSBTYWx0ZWRfX9Hvj+JVBKPBk
 UaWmKkpQ9CyPE+cm8gbdGlQ1NZF+96XEFiqDLhP7GGbAI4Ss+3GeeK/dDEmtb5/S6AOUzNbINFC
 jp3X6tPhCWOGiFaUYlaO1sOoydnGorA=
X-Proofpoint-ORIG-GUID: sFyYYR-mcroNbEXDaWslKTu4lN-mJZYs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1MSBTYWx0ZWRfX5s2QDp86bTOx
 BljtTinlsZYrvLgXB267ucwsMQ9GA/035Atff0HUngSXBMzZTE8rGH05gNXx8D2Aqr8DeMBAnSC
 iG9IMFIAQQpLpSl+W/jGNIcZeRKvlf78hJVRchJoFkHUVQuGq2NB3XYWC7rktbtSQnkgrzRXChG
 BONYdvCldigmYMNCSIAp88sSE5Y1qarQs2bTnfp1LgQQL6R+XNWwy5sLOIXio8Eh9XOd8aZ6sGS
 COdoTJXwdo86qoiUNmCDNxoydRZnboH9MSa3glY6CFGqbY76brCuamkEfyBtKbvYuYTv2/ObfxS
 pOLSJjX2Sq1pqzRPRtmcqVUxyJ15JI8f6wmnQtEYR7mFMxghSpsAKTc3LedqUj3gBoovRALwgj9
 nnEL6wqzgWxDbJYMkymrv8NeIQZz3JngPjm9DY6FvjzMfSZDR1/qt2Ia8MYBQLgGy7mJwb8Vz0n
 Ly4lGbpLK7IhxymbdPQ==
X-Authority-Analysis: v=2.4 cv=PbhqFShd c=1 sm=1 tr=0 ts=6accdaa0 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Q05WB-lhHploSVLRvUAA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120051

On 10/7/26 5:54 PM, Vinayak Katoch wrote:
> Wire up the dedicated CDSP extended context bank on kaanapali and
> glymur, enabling buffer mappings beyond the standard 34-bit IOVA limit.
> 
> The FastRPC driver identifies an extended context bank by the presence
> of iommu-ranges on the compute-cb node. Each patch adds
> iommu-ranges = <0x4 0x0 0xfc 0x0> on the designated compute-cb,
> restricting IOVA allocations to the [16 GiB, ~1 TiB) window. The
> fastrpc and glink ancestor nodes are bumped to #address-cells = <2>
> and #size-cells = <2> to accommodate 64-bit iommu-ranges values, and
> all existing compute-cb reg entries are updated to the four-cell format.
> 
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
> ---
> Vinayak Katoch (2):
>       arm64: dts: qcom: kaanapali: add CDSP FastRPC extended context bank
>       arm64: dts: qcom: glymur: add CDSP FastRPC extended context bank
> 
>  arch/arm64/boot/dts/qcom/glymur.dtsi    | 31 ++++++++++++++++++-------------
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 29 +++++++++++++++++------------
>  2 files changed, 35 insertions(+), 25 deletions(-)
> ---
> base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
> change-id: 20261006-extended-mapping-dts-f60dbc6221aa
> prerequisite-change-id: 20260609-dup-sessions-ea2acaac1994:v5
> prerequisite-patch-id: 425dc9414848bbc3f2a053d067195d849898e2ae
> prerequisite-patch-id: 4fea14b47d11a5a3e18065d8cf3a461841ee2b86
> prerequisite-patch-id: da0a3d55397a522ea4b77769e387df9faea8e024
> prerequisite-change-id: 20260826-extended-mapping-9b08b0c3108d:v2
> prerequisite-patch-id: 7fe093060212472237ebfaf12413fa38d662e5b7
> prerequisite-patch-id: 86acb1e79d10600734d07152dbbc3010977b85f8
> prerequisite-patch-id: 08da00c4dcbf2e77ba217676bf93daee78c20e79
> prerequisite-patch-id: f6a649d7e73501312402b084adee4b5fb3d83a44

When you send a series claiming it has hundreds of prerequisites,
it can not be picked up

Konrad
