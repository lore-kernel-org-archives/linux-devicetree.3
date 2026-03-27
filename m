Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C103BD24A
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 13:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774617058; cv=none; b=gBbVm6zb9O9+fk9lQeWMMqqDCXQtFrmcHHa8rmuHvSAUEqGNE9SA23vcD/T9gC9l6uMq/tc6w1yKr5HDdFdu9rRY3vR1H8b3t9wEVUI/e6X+1fdsukRVkiQOpmW/ozTOBWDy8DKcdSmvEzhzvT0HmBrlYSRVFM1Vi5dUZUN1i9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774617058; c=relaxed/simple;
	bh=LigFB/scvWWENXb+KaifkLcfV6EItrzBxx7szDEfxwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WrEAfz6ZzqTKOd8jby44AqLZ8Sv4u2woyO41ctELqCTcKR4/SEFAwZOvxGHjnVWEbcE6hKj0D0CLRZVvIvly+ADhHJY7gjkDpOlD3fBgOcsDj6I3s7qDKgKYnSe1wtETibwEH+sdYCYUELp2h3KOwSV6NCuAThhLPz/PGJW9nNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZzWBbzOT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=alJLEtac; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZzWBbzOT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="alJLEtac"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RCtDSp3713711
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 13:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FoyA/Fbh9rg+dHoluYs9pk0obdjMHMIWnjo6UCQHNr8=; b=ZzWBbzOTYwpsMOyI
	9uFmBs/cWngrz1VX2n10hVXRaVmuTgF8SXJnUrwqWcluDNpkCr5LiKVX4/fe0srM
	UQcabDvHbb1IRCO2u88+eANTSnPtKpGZygEjjxY9SpA//N0fLJKrwdjnKb1/lFBJ
	3GHYLOIqKfK9nmMQ7RhdKiZCXxNMalxrm3lF11/kiF8AyGEAJVMx/cJ30ok3jAyA
	YKXNZ2exmYp+L4zjk5trVUIwGUkdZKcJszul+K9ZBjzfc28qIW4bk7zO2yxRXRGQ
	PoiHOoJHqmzuuSz+Cqdwh6EGdL/gxw2fd8Zp4uF25BU0bnjGotZmN8fKOJSP0hRs
	JwYvJA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5hapt6c0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 13:10:56 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89a01982dc5so7609656d6.3
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 06:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774617055; x=1775221855; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FoyA/Fbh9rg+dHoluYs9pk0obdjMHMIWnjo6UCQHNr8=;
        b=alJLEtacjc2mhh0ZWuCUwViHHUDlQmyVd9BiyDPAM/HXDQ0jNzPqcy3KdJGGAsEzvR
         itLha5e6tzuOmsqqGfsGa7t4B1b3OC9OeaaMkkSCfgfMPApQL1q33ZFSLgVdemFLPhqU
         rlhiB+Y6X6KvqmJ8ntCbc/RkGaZ+bMHNiSvzfktfKTTvX3quYy6ATxw97KmMTJR9Ffsv
         o6zeUC026lAzDHyPxwmyWR2utNq8C1Jgm+LfmfM3BYPwot/aLFYuurExsh6+ZgUBsXiR
         Iue4IDUDm0dNo2fgcYc7AQrygvRwNEbQnRRjLCSB19Mbzs0Eore+mLNg+OMoE0r3x5fS
         x0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774617055; x=1775221855;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FoyA/Fbh9rg+dHoluYs9pk0obdjMHMIWnjo6UCQHNr8=;
        b=De1YFtcf+dlWyUw6J04dvR6TnXHTF92R9LBmeExnJ6bKMcWTP24AEj+fKBAgwFmGO4
         3tgJqTad77twa5nZUtGbiyzKRXjGxWPa09HAnuKbvOXuYsZisTwglNhfupWcfkPlr2MB
         SUFGmJ5p/8Q0dudhWAzLxP+v+lkUp9X4xGp4Ss7LQM7t9zHNMiyjquV+I07F73hBDjal
         ++Y4RK51k1VfmKxBl8ai2Hwiom5KJzxx0WWlfCtTb3E9K+3EaqPG/OcGJNQDRV/H0XTH
         lPKvGwP2pzxM4Kg2B+JkC31L2GUVUwfim5V4rhmtFbqo5l67C+FJNzpdXOvu7/JpgKSi
         j3lQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsnKuOprbR8P/n4Amo1P/MSSRNMVtIaM/SvG2n65c1FgCcYMAf6u4OIMSh0Fh9eBq8t86izBa5yRFn@vger.kernel.org
X-Gm-Message-State: AOJu0YzMensmaE2jMjUllXArriNLpsuqLg2O2rNcHf8UEsfr5jsHYPi4
	oLiJTV5UI2ostXjEnIn8WkozxTS49j77WvtQOyEg2v29edFYhNIS7Wnz2672h5zlNWViAQTl+ow
	+Aj9TJ/5+LM7CJ9iybtMqKixznmkOunt2+8fArQj1kY6YtjPLoVaEi2oHwgUGF80g
X-Gm-Gg: ATEYQzxHdxdSuI+hsIBuHRqGeKnOdaGTHRuaAnDjhp7S3Buertg6G7zMBtfLDCPf2Qk
	gnPTiXjKtzgInODyXPOl1vR9MbiKdTTdFjG4W5XQcjgXLRUQeKZKe8zodPATebOIBhTvBpxoGKE
	o8JmxNvZuu1ZR998ZL5Tsle4z4fwf7DbGnxSsuB8O4LA0qNb72ZpjZhFWrJ/w3N0Rnc3qAlrX+8
	dvLOAC702MoBInd4dmGMH9j743LcEKHHtA55kO56Qp0iMDB3ClJDpK36M6X0reUtYQUdIfGkhNc
	jt4vfjpVMDAdJ2aFA3kzhi3tyccosnLCQi6WbuAhawlYTX1KDUIaq27Pv8xWJk0dQCeaRWn6pAn
	CjaKdA5P4BCPIDOxb6BOx2uO4MGa0RK+7Ddoj93Uh/r1Cn1O7vEE+qNaOTEqIf2IA2cbvove3FS
	2Rxcg=
X-Received: by 2002:a05:6214:501e:b0:89c:51d0:20df with SMTP id 6a1803df08f44-89ce8f10968mr23714936d6.3.1774617055168;
        Fri, 27 Mar 2026 06:10:55 -0700 (PDT)
X-Received: by 2002:a05:6214:501e:b0:89c:51d0:20df with SMTP id 6a1803df08f44-89ce8f10968mr23714486d6.3.1774617054657;
        Fri, 27 Mar 2026 06:10:54 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b203c2225sm243173766b.37.2026.03.27.06.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 06:10:53 -0700 (PDT)
Message-ID: <fe9bba47-13d8-4572-af8f-d4c0657f7195@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 14:10:51 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: monaco: extend fastrpc compute cb
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260326154111.2781802-1-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260326154111.2781802-1-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TqnrRTXh c=1 sm=1 tr=0 ts=69c681e0 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=W7QrHvp7LSfZ9ocHNjUA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA5MCBTYWx0ZWRfX64HnSgRW9EK5
 G/E1nqHr6dzIr0z0Dy/VQC41fLNzyd6GZjnGYXrTMnzHwmXWARfL3fxcL4CdK+Ccr9/lATU5nUb
 bWVDKiUzRs3oIFuBG6QoctWUXlC1aLKePhz9s/GbRan+0G3XHthINUP2i+MErkpkvneZO6Msh92
 F24sgYJTJHdRu/fc93Cg9FrGVXAqbPsTicF3ttkAGVpLj7+ND4NLrKPxNe2e8fFMcD6JnQ5Pub5
 oADR97Ez8JPEe+Fz5ZC652LGxvpxK4SdUHw9zIGOBTnqWAImVpnjJ2Tt004VM86nrw4O2Y82CH7
 BxrGODCnbRQ9I6kpTUT96pp58J8tLuF7yNpj5cq0w6VQ8WKAUTRkOSkzmt03fC72nqrrDJd6fsx
 1D6VP0WttsfZEuo1vtfAkzQ99U0Osqk8WH0UFTCWkHD+oUGZ5b8fNwQX3zRPAfl6oRem2UC0svv
 FAnD+p6WAkhMiLcTUVw==
X-Proofpoint-GUID: w3tXQ5KizcHbIX2HKdVd2nxn0Ruxo8o-
X-Proofpoint-ORIG-GUID: w3tXQ5KizcHbIX2HKdVd2nxn0Ruxo8o-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270090

On 3/26/26 4:41 PM, Srinivas Kandagatla wrote:
> For some reason we ended up adding only 4 out of 11 compute cb's for
> CDSP, add the missing compute cb. This will also improve the end
> user-experience by enabling running multiple AI usecases in parallel.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco.dtsi | 49 ++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
> index 10e799dd4a78..38fbd44c7d8f 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -7739,6 +7739,55 @@ compute-cb@4 {
>  							 <&apps_smmu 0x1964 0x0400>;
>  						dma-coherent;
>  					};
> +
> +					compute-cb@5 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <5>;
> +						iommus = <&apps_smmu 0x19c5 0x0400>;

I see that the other CBs have 2 iommu streams, the other one
having "DMA" in the name - could you shed some light on that?

Konrad
