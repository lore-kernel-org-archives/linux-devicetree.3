Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A024749E8
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784809768; cv=none; b=MhMieg7Nt8wMBFFQI+b/qTp52T0npBP/jugcxekphaMELPSl1PZ1Y4cobblL9Ivf2yqD7eOwBRE22ycV6ysxP6UiyN1ibnyuA26wnpPQ1oo7vp+mTkfSQet8tUNRgsor9oLpdtbf6I1N8GSWsEXKiGYsKs0WbOTUA5Ghtv1iKfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784809768; c=relaxed/simple;
	bh=ZloTRdZTDYA4OW5YMeqnbIBxNBbNc8MfyjcSZublLNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a/5kOvxTyaGd40cZHQv6zB0nZzLAxlBq4v6DwQSsdtz/KivfTn+WAqKBEsyhmUF1qrmkAlDm03D//VqYEDhzStNJMfCqLakbAAHbeDfRTUj7o1F87I8L2psZvj/AkLj1lBdEhFp0x2qAxTh9yt5zGKNtFcOy0goFj7vvqgyzYS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O/h+Zu2u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HUuRfnfk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O/h+Zu2u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HUuRfnfk"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qtsR3607919
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vppX2tpexLTFy9CE+ACXrq26uNDXVs/CPaSTjqOEkd8=; b=O/h+Zu2ubcuNJEpc
	DbghOqj6m/1j3g/Y+hm51F94oLl2keuh5fO/37oGw/D4MMVVmJHGY0f0nSzkljR0
	J18MZzRRoE2IOzqbD9n+FmB0mcnAXWII6PJfD+dPQatDOhaKbysKea8d5DgGqK+2
	c2bBjtr1uDLzzldXcn3lLzlIN+rBPdzv+noh3cYptbpqJLtVsqehTdaSefQHHPy9
	UkGjPHTHRNKt/McngDGwjhb0Y5G9P8EwzyFUJtuj/IEwyb4KnLKmAgpM0pQrchvK
	3awemnGDMJVJoZCyL6FhAaDGu44cEXNTd5KVlTARqmoAzPjKXJlMf1NxnaWKsFML
	GkmzTw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fke7qh92t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:29:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1e777a15so1536911cf.2
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 05:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784809765; x=1785414565; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vppX2tpexLTFy9CE+ACXrq26uNDXVs/CPaSTjqOEkd8=;
        b=HUuRfnfkZW22UrUvrsyAKvUXFTAPA0WS2GpFSqeRj3POQZyHLd/OobP/xvl5XO171l
         c0crDxhiHRLNbgkVjFL4q1u4t3EqMEKRGkxEAfBgKMQ4pa7pqetKZNn02+iyeMgyPUvw
         AviInvy4Qmwmsm+dnI0NYr5gXuTRSWdyTY2X1w1Y8hY7gayqWsOo9WkogwQrd0u5suWl
         TX6GzT9pxi3pauNZlzlsVa7cZNOG29DbQtBXiq4nfLdUbctgqZKaRDX/RoE5SNvErZPJ
         WrsoIeoyFy9ls0M4uv9zuxG/vKeanaTQRdM0WaQQDRmP0z27LqGDQ/wbOG5cBvXprHoO
         2V1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784809765; x=1785414565;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vppX2tpexLTFy9CE+ACXrq26uNDXVs/CPaSTjqOEkd8=;
        b=D9wtqWG1ECdbbC1bNZcdEgsglDE6dbFcG5ymIZlByidAdacjHw4IJUhZT8Co9Zz6Ob
         eMdwNpIcYsAt3+i/Bjvr6rJFmdSepKIHpUc6QPQr90fkcxWl2dsHmzv0p7CvJNE/s0iS
         YErYSTkA8qALF5l9d7U7kLEdkg0nBvkca6BuIyfB3LxzElN7ZGVGo36WIyacePFxqSvV
         xm7KK0Ky5ooJy9vUs1cjWzyqJcT2mpysAwJ/5GlsAbhGOzcq3QjUme4uFCFhtINUTFs9
         UECSTik/OuaocC40zOltZOmQIgxxxLeQ4tC3IcsZX38xxK5VoncjORLm9r2U03kw06Qo
         tShw==
X-Forwarded-Encrypted: i=1; AHgh+RoxogcbpOYbslr85Lj6pQsMWhxmeUq3kD9EDtXy/9RTAWEEprgai+u6zrZ1SowxCevttES3jkaOwTxL@vger.kernel.org
X-Gm-Message-State: AOJu0Yyva4xSyqidtyOgsNxY0eCHnp1E9srMbu/gAe8+K4zAfhjWFksn
	KRRuESncbZq2JgR5FPRbKjgNr4k9tM9iz9burZDnHOx4LO6sBqxUw14zzLI2AllZUhGWuXkwanU
	k4WcNUA/2W9GOZKTUkFfH+pkgaG2WgMovOc3w0gRZVev/L5YAZZUXsDtDBtNTS9WR
X-Gm-Gg: AR+sD10GwTyX4pjyHM1eTL/slAZSyh6D32v8ZKAK4hr1A1Ycf6YcSTAuUcV7Cr6q6N8
	o8fXbvbC2ZxIuefGmUiz+zsiX/yGuSq1sNppvqdKk3KAsry2wWhIzy2fztc4XFJuomgU9J8Row7
	cd8420+IJiOUBloUG+i1aEENtpSLw/qWk92YAGvE2EybglgzwGvtwy4zdbJ0czM9EWEBkhTcP4a
	OLZvGaaLcfNT/wA+Id0bSqTZdDeiS2kztuNMNu+CuY82aLqW3g48zYKu+CCqZPiJQJiQsu9aZqH
	wG5+psC4eyNYGyxakOsBipcmWzzMLZ6c3fXRypBdxO4bBh7i9lDkKD4d1IvIY7ErR0s7LqFs5xp
	ckM4cKyBfFQNpwxTAfAGzyKIP
X-Received: by 2002:a05:622a:134c:b0:51c:223:3c57 with SMTP id d75a77b69052e-5283dfdcc9emr21167311cf.10.1784809765224;
        Thu, 23 Jul 2026 05:29:25 -0700 (PDT)
X-Received: by 2002:a05:622a:134c:b0:51c:223:3c57 with SMTP id d75a77b69052e-5283dfdcc9emr21166991cf.10.1784809764729;
        Thu, 23 Jul 2026 05:29:24 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c4db36454sm96785366b.1.2026.07.23.05.29.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 05:29:23 -0700 (PDT)
Message-ID: <4afe6c0f-23e6-4081-84ac-67d43ced6aed@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 14:29:21 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] arm64: dts: qcom: Add Kalambo SoC
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260722-b4-kalambo-crd-v2-0-32d4addc1ac9@oss.qualcomm.com>
 <20260722-b4-kalambo-crd-v2-2-32d4addc1ac9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260722-b4-kalambo-crd-v2-2-32d4addc1ac9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyMyBTYWx0ZWRfX6zO5biXK7887
 E52Xuthwsg5BY43QyI4A7bLm8cx4xF8tw06dv72Pxzyw4PeRrQfCOpkQrp3/yBbiBksib00crPu
 ofvXJn2V7ilB5S7/CPSrRGpcG22hNpY=
X-Authority-Analysis: v=2.4 cv=aYxRWxot c=1 sm=1 tr=0 ts=6a620925 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=-CvMsJUghkc_xpXdUaIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: upRx3h9xQhBPhcbOM9YK5bALifnfSxmW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyMyBTYWx0ZWRfX5WabKzkK8Y5Y
 1E7y8ar76CcPe7oa+vk3UlqfulBGF3SvbG3Shqk/mscYGyc8zSbA5hS7adpS+Kvrrs1pKaL3i/w
 AW+sd5fJ0kpkGV1l/lN5cZCmf9BkvVBC6KUvY5J6GvAuxie1cHKMH8B5INf9cwKfDuzfBIQAcIE
 Vm/dtKTTUMsN+cG5MllDCgnhhXEcoc+ZNQaJvhnwaSMJ6HBZbgb3v+mmPw4BWcBLGa3QrTXn5NF
 tVB5PRKnQtE96X4Cn1DLygwSZ+9ACpSX4Zdc+1onon5GYTsj3n/sKGsnxtcIUFYFWsshfngR2uZ
 cOeOTFI+9kF0e8sILfA7lqjHPN9uBCM+dUYCEzZ+Of517BGkiacUmlXVgHXVDFdZzc3RWyg65jw
 hQTPe8CBaBERuzl66Q1OoMPl7/0oAZgUHhPSOBxKY/Wkn3CoRvpeGf9hqlI0TJHOW0HzIuPtOCp
 UjhIgCru9wCTtTWWzMw==
X-Proofpoint-ORIG-GUID: upRx3h9xQhBPhcbOM9YK5bALifnfSxmW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230123

On 7/22/26 12:55 PM, Gopikrishna Garmidi wrote:
> Introduce support for the Qualcomm Kalambo SoC. It is derived from Mahua
> with CPU cluster 0 removed, leaving it with just cluster 1 (cpu6-cpu11).
> 
>  - The surviving cluster is re-added to the cpu-map as cluster0, since the
>    kernel's cpu-map cluster scan stops at the first missing "clusterN"
>    index.
> 
>  - cpu6-cpu11 are reassigned to SCMI performance domain 0, as domain 1
>    (the former cluster 0) is no longer present.
> 
>  - Point the SCMI transport at the SRAM and mailbox addresses used by
>    the Kalambo SCP firmware, which differ from those inherited from
>    Glymur.
> 
> Add labels to the Glymur cpu-map and its cluster nodes to allow their
> removal and override on derived SoCs.
> 
> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---

[...]

> @@ -274,8 +274,8 @@ cpu17: cpu@20500 {
>  			#cooling-cells = <2>;
>  		};
>  
> -		cpu-map {
> -			cluster0 {
> +		cpu_map: cpu-map {
> +			cpu_map_cluster0: cluster0 {
>  				core0 {
>  					cpu = <&cpu0>;
>  				};
> @@ -301,7 +301,7 @@ core5 {
>  				};
>  			};
>  
> -			cluster1 {
> +			cpu_map_cluster1: cluster1 {

The deletes are recursive, so if you just delete the whole map,
you don't need to delete the children (and can drop the labels)

You can then add a label to /cpus and reference it, redefining the
map in kalambo.dtsi

[...]


> +&imem {
> +	reg = <0x0 0x81e08600 0x0 0x380>;
> +	ranges = <0x0 0x0 0x81e08600 0x380>;

Is the size *actually* different between the SoCs?

> +	cpu_scp_lpri1: scp-sram-section@200 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x200 0x180>;
> +	};

With this shifted, is cpu_scp_lpri0 still at the same base?

> +};
> +
> +&pdp0_mbox {
> +	reg = <0 0x17610000 0 0x8000>, <0 0x1a980000 0 0x8000>;

Please keep one entry per line and use '0x0' instead of '0'

Konrad
