Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA4E3C4174
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 02:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790649716; cv=none; b=UcDoavBZ0U1UKICGPqAvxp7su5paYoc+qdufcfHZvYvEjD3wLeDQkw92h1O4V3ec3Ht0fDMDGT3r1b3fgsI9nnUbsvrahqyU2HqeZAMNt5QwayuJj3lbO5wmNi7G+404QK2pw3eAArk/LtXbNZ4Y45LlBqVKurio6gJil3wCfmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790649716; c=relaxed/simple;
	bh=Y1are3mbL4HzFRhcH1XRj3+Ni3ZLwFWBk8+QKOYxCfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jNsJWFqUj9MzU+C3RD8U62KL7BeYSMUrPpJDeDCxIEGOlwqBqANuYMiAsX64hCK2It+DOUdGXgsqmyrYopWosISOfv0s05l9q8eHeCmA3CLhUViyOr74RXyITlsdQhBIA3kZQUlNulEyngS+zEbYodY/c05WJKIjcpYGQC7Kbu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jeexUya7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kbXFF1+y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jeexUya7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kbXFF1+y"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T0jNrd2342781
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 02:41:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vMa7lZEgnMKaLOBLwN1t1ZalV4fkwKb3cQVdCSP4IgI=; b=jeexUya7nf3GsHgg
	wh96u81TTJHAVvJ/3eZRDBQD1c3+kH80N7vJzga6h9FWIit7Bwh2YtfSUzZFJWH6
	5h9U9RwQsGHPRSgIjk+PTSq5gchnJnf/jzb0SD13Y4gYKjQohxxB8TytFqace5EF
	Zvb1bZxo24RXMj3to/R7M2XzEWkN3MWKLrPcsxi1sZBA9cFUlJ/qDGq+RXgYGkRc
	J80JY6MkfKZNyQx9XrPWHbADJkhdSpqKgHwQCk7QKp+KYEON6z14bNnHWI+2rZHU
	MxyZZpl0LinvNf15wfqLgA080ZbJr68BrAKK6vk6UczpNspBcbAJiEclUPO1TnWG
	8gTd8A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvw21se7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 02:41:54 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc764579e50so499600a12.0
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 19:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790649714; x=1791254514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vMa7lZEgnMKaLOBLwN1t1ZalV4fkwKb3cQVdCSP4IgI=;
        b=kbXFF1+yGi2o7zt4FOLtcwQSXV7S00JPAPNe3gJ1iIOL2TnCCE4U8aGiWtnCRczDRl
         DvzK/XaOIVszJ4TRnawWVy8Xdo6yg/NiJnUQOxuXfWE4/XYUe8dyZCUPS6uQx2BWmpdO
         DxmuY8H9dFQFFgAHbmhazP+9zlmZqUXiNvTTFFz3utytjk2/PmcNUuhRvaznW8pms10l
         iWBijrVrZVLYg/yHPTVZHJmd/xd6LYrv/KF8HN/6hNCl4JcKCHbp1Vvac/onMbxirFem
         YBjOv1wwpMJKQAdxlt6hPBph5pdTNYGHoOi+OP3sFfmgDfktF64gy4Mj8LD5vX+Ktor8
         dtiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790649714; x=1791254514;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vMa7lZEgnMKaLOBLwN1t1ZalV4fkwKb3cQVdCSP4IgI=;
        b=vqnHtruxvHMpth35/d8mjKZfPvbb44ZJ87jrDY3iIby61VuVOBzx67+c5bbCxjTyJf
         hTUNfksZITwtJw0CUUjeJzy2rVykmKnPbtsijH/sx+/jRtMn3AlNi0xtGpdSbR0QGUCW
         bR9MpZKI1GTt4+ZRwJ4RhgIxUOH7/f9DSOUVvUgOYLCl/PdpW/dSJBGAXFoG6kkKh79R
         GAANgUR/OtrP/qy+SPoD0OIEC9FVSqnTVjY0DbhZL9PsVmG54Of/FuVRAnJedObJPJ1P
         DJJOvScBx15N85qnLXMSchRI6TZHYNnJM3NI1uOOwNywfUF+wJNia13ub2LqiZMNAXpz
         HD+g==
X-Forwarded-Encrypted: i=1; AKwUvBxnKK/SjQYjHwZo8nU1a+85DyXqgCUnXnJStVDXBPtma04n+WP4YDJXOEWm5NNempLNiiQvhKe9gNsO@vger.kernel.org
X-Gm-Message-State: AFq9FYKw/EOvSHIwE+TXl9gAj45BHjxIR3EhqgiHQOgScDSsC+6j5D4D
	IHZAPe1zfUW+DLWmEisMXO+MlGJCHcV3Okfsa56oaRTVrDwZHIgfyHbcZz7gcXwmOKmbjUkcqTg
	F6mbHBrOIa2LRaaDAwLyYeFvd8Xr0Pt0XAQ4nFuK1K8kVwc6yxlUrwB6+GZ4nXXCQ
X-Gm-Gg: AYBFou32dMbHBZ/OxocosmIEUuWjJQ3C8hZwBF0yxmmaNBfnyiVwGaxWAi4Ma7Dl3lF
	fckshGJ+1WzhG9U7buXgEXivaimnlJbgTKsTRw58d3y/tEtgP8kGG0ydzCtbuiSbzTAcAw07imu
	pRetkQEzmMUybKGoKhgA3g8zDVkAxXU/ZuKZdiby+kc9/rQUdVFg/X7xeWKjiaSxsWYxE6sldUq
	Ocz5TA+aPBD8M7NHDqlGbkUogci93HdMWkqv3wrYrsluPYckXYYTINyzWrJ5uncdOuxFt908srV
	9N3Uj7QkMLd3Z9yqnK6nw38kc04+5FvtLBWEXIjwhTDkUOZ6XbH3X3PZsgLUGRzttE7TnrlFr6G
	x8t/FkYOLX036+M8ChOjgeeQF
X-Received: by 2002:a17:90b:278f:b0:3a0:c162:51af with SMTP id 98e67ed59e1d1-3a0c162528dmr14743038a91.0.1790649713922;
        Mon, 28 Sep 2026 19:41:53 -0700 (PDT)
X-Received: by 2002:a17:90b:278f:b0:3a0:c162:51af with SMTP id 98e67ed59e1d1-3a0c162528dmr14743005a91.0.1790649713354;
        Mon, 28 Sep 2026 19:41:53 -0700 (PDT)
Received: from [10.239.132.150] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498596aefsm2611251a91.6.2026.09.28.19.41.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 19:41:53 -0700 (PDT)
Message-ID: <c951ab85-eab7-4783-a3ef-0b299b64f641@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 10:41:47 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] dt-bindings: mailbox: qcom: Document Maili CPUCP
 mailbox controller
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260907-maili_initial_clock-v5-1-e79bb6b93a49@oss.qualcomm.com>
From: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260907-maili_initial_clock-v5-1-e79bb6b93a49@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=N6i8hG9B c=1 sm=1 tr=0 ts=6abb2572 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NJCT-5Zc7viJPmw2IsQA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 312ic4ft7K_FzDJXHaT45RWNbJ8ZE8eK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxMCBTYWx0ZWRfXzdk7GIvThOv3
 lwIJ+DDr6t2L2qD4fHEgnR3cXl/VjvBAHyWs1GI7a8wczrUlEZVziJsUWQiTkWr4YvpzZQR4QSN
 eQdP1njk964FQfynIMtKQPaYZp9Jes0rPUEc7wtEZVXMWaDHHqKmArTu3SUdVuMvt7/0HTFkf0H
 pndGYyfyOJKhUm68JBlq4sXy41SohPk8sDXgXkSxnQd1QCsdyrE2WtlZaSY+LwtHoRiL4Nu5u8u
 aFf1OjN9EVEFF2FvWEAANWiWZAg5tiW+kSJj+D+4y8wjd7rZa4WVtpiee7y8/60R3eNtcw/b+75
 DqLMqCcRPchcHXPwgsV/TAciyjHcdVMtBknt0kurqDWNPKaxPTnsLcSmSpxoKXmIvdbv7kzW3BK
 MNaUEv+RY2FH+ZqiSzbhh/Zybq3qxJe4DpXAqwTXVDE9/MmixMfMaTO8oT0nRPQM0R/VYCC35+M
 mxu4c6PHxZg44sw99Bw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxMCBTYWx0ZWRfX/VNEdeI2uDH/
 kRh32WEpIWjrzqbHvNjmH9RMl0XKaLK9vMw5e/ap3emNzLbNtB9YsbagXml0ThEk/XuPFj8HNnR
 pFiCRwhm/tSGyVqEI6pP3GfGww9IK0Y=
X-Proofpoint-GUID: 312ic4ft7K_FzDJXHaT45RWNbJ8ZE8eK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290010

On 9/7/2026 4:37 PM, Taniya Das wrote:
> Document the CPU Control Processor (CPUCP) mailbox controller for the
> Qualcomm Maili SoC. It is software compatible with the X1E80100 CPUCP
> mailbox controller and uses it as a fallback compatible string.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
...

Trying to be a polite ping here to request apply since our device tree
series [1] is waiting for apply of this patch.
Feel free to let us know if anything is needed here.

Jingyi is posting the Maili device tree from [1] and get dtb checking
using this binding. And with a newer linux-next tag like 0916.


[1]https://lore.kernel.org/lkml/20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com/

Reviewed-by: Maria Yu <aiqun.yu@oss.qualcomm.com>
-- 
Thx and BRs,
Aiqun(Maria) Yu
