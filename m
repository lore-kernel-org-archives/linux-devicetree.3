Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795784391;
	b=kb1iCe2PAHcIuFwnkThcKxlfqxiWpBqux5ohrJzUnOo3XtSn0gkFxofh2Xh9Gdf768ro
	 6iMquCY2lg6sk3ffHaPI7vdGxFHqPT2Be8skeQQ0LMlZatC8aDHxBhsnpa+qL4HNQWWvK
	 EAkuAM6nLazcD7FODb+x1MhUwHuANUVYwzMwnprU+fglRtdiFR+cBHJrVf+vAIUKxsn/L
	 mk1L6/zaf5HYgdi0h7ZMiz9Fw34AJG7IqH6aXy7gf71YOb2d0/nXE2ngw7Aj960c6dcSL
	 uXxg1HOFWhTlvk5Y4EpT3zEYxZS/I27iCVbp7PSeBx03MY3gic898Wh9TwSBlx6mz3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795784391;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vSNCzaWcLz5enfpu2X2uFBb6JUJJ015TishI/f0GKpA=;
	b=s0DtdHqXS77eHqKbSFb0TRtj1QoFqAhf7v5TFtyKIr+mYxkxZM58JEVsm37DrEmJWK4O
	 qRsFrpg1R0TSEaG9z+kB3fhGm7e5zeZu26WXP3W+Ex1A9ZDNgv+NkHtO3LvCRBa8c/jZn
	 Bo+gJWo6BOqlmdrpAHa7kLxVwiuc4meznkkjflY4X6hGQTnOa2lWoEOYwzgOiK5k2UXaV
	 d+z7DGrJNgYx2gOTIAt9ic3AmbDkJ4YLeoVFLJW3soBFSGIsNyS8D4kZWAPIcSUcpQQpm
	 MFAGwA5/AiXk6n4FbDPOLDX2AXX2oq310QCXbq8GTwvyDfv2BnDXKSBGa6foNzXzPUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="K37b8/KY";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IYHHRRhw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA167606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:59:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA167606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K37b8/KY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IYHHRRhw
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARChAtf2205041
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vSNCzaWcLz5enfpu2X2uFBb6JUJJ015TishI/f0GKpA=; b=K37b8/KYM3/9P0lE
	T7rJfRvafX5SWfow3CeunNBrcy5sKIQ7Ch3b3UkT05+EftZblwKlisndkhJkuFsl
	6cvfLRmlN88CKklEaqcf1noPuqHB6JgclSK6dvs78vUj4oXC0J55siAzRfliSEkp
	U7KUk1ZzsrtJQFwXRMlSk4JUATfSyEro8FHL0vomdX78eGP0jnyWvRAlXh2QxLGN
	ItGb62cQDeBppz6FsqpA81OD8PIQq3ZYT724ebg/OFp4Dyj2iBdLAoo4g06MjUii
	OatYS9ZgineytS2cMOBp88g7GAlqDNCsmZE2XwHgdIApwryqnk47z9HIpk31TCFL
	d5sP3Q==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4hu3h1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:59:49 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ecba171914so376683e0c.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795784389; x=1796389189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vSNCzaWcLz5enfpu2X2uFBb6JUJJ015TishI/f0GKpA=;
        b=IYHHRRhwnFfzZw+pCqpvgYYdNC/+Fa1cz2yZnRU9O1I8o57h4IV9a4N8PJXmLKQWx3
         iNbUaY6CIZ1Fm6bXctXvL2N6fNZOsFnVii7pvaeMVHJQs/JAXQ9ZkcAK5vzfqSrqXxAZ
         JmN4QehEhP2bjktQaJMF1dlpbTM9t0Xl7yryNpA7S245YQrC0WK71s9UHuWVdPRwAzuC
         iFTillYDv7XjSmobigSZG3R/p42CBRmPSgZzWXNYUiy7uTMo/dEsfWd6cDgasRFBXvvJ
         RACBly79CamAJW63pJ9uUlaoERRfqCTyjKHq2pzM6P3a1kdWkCX9CBAjoXq8uOrcRaRG
         nF5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795784389; x=1796389189;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vSNCzaWcLz5enfpu2X2uFBb6JUJJ015TishI/f0GKpA=;
        b=1WdC3pxVBV2A2nDH6CE/iPBY08puySLNnk38B+N3gnh8J/0jEFEhMY3pmupAFnxGwe
         7zvDEq8OjJt9Etglbae8yBLrgot+zXWlbfu2QJaSu3wd0M9Ot70SEEfQtRAynbom6/+H
         XYceQI2cGxXkpSVsD7LnzTfBESVfDhP0IptJ4IERHCUSU0xmryrgTOX728toblT0NNkM
         hG3HDwivwKkBgbjNgiXWIC0FWWdaNzPLjX1nnlBT/MngeA5OmlGtGUxt17aRPKlyFPj1
         QUFgvVhNaUMGgFnKkpCAkv3NnUjDVbP7nWNqeJA9vDxyhkuceMlVHikqEpDGsC6MoleK
         Q7QQ==
X-Forwarded-Encrypted: i=1; AL+hErHEA4aE7kTET1Chdo8BbW5hSpis7f2aSTqm41Uy3u/ejmAk1JqGVL4yE1LulEnIzdrNFrNR9NYYICSf@vger.kernel.org
X-Gm-Message-State: APuU4Z82CRXg1d3b1lPHdXZ07vlnzhRcQAiPppP9oHyS4qfd2yX/vTdb
	EWMUonFfOozGSJkeHzw7koTI69A0qhp2I85hR1J9dzK5AEoDfumv8qRgzr72hn1qzT88qOBtylj
	QG0zjJWEOFr+bFVLXb8AkacVTxpizNR5eLMp8GNb8aLwxO7ijC05m2b2xGfneWyCW/7Fovx5D
X-Gm-Gg: AZFdTZe0C+1pzp/LTp7ARUwDyotwyGhbr5GgveEPDEi8wg+SEm3sHIlLtCQa48ap3D+
	LhwICjwkrB5O1zzCbvHvEqbM2Zq6dwpzY05nlVicXO73oXf4+k6yzfdMcu25NZwo9hPKNqSZvRh
	UXx6hrZvfDKd1z9DFjjqWanqUcGmQhKr6OzzFhnoybw7j3PxxTYSNe9L5gSuCTbdOIo8YhbGQvB
	JwweLuLjZgP8iXUq4CgSZnZibzyH9kLMwdYfegXRi7GJXYXhOxqn40YRo2CLMC2uSLZGXnODU5L
	G8+2F6+sIRxCwxSyYzRjPpYuXCTWveh3EgZHxy91ugBRwawLPjKxE5B4oxK3nb0Sfo8Px+v/sY4
	C8IkL1tfISEMmGc9LbT39TaHrivi9ufVJh5s00fICfSZ9i1bu0L1np/c39cN0oK/d0DJm7Lo=
X-Received: by 2002:a05:6122:6846:20b0:5ec:b437:e670 with SMTP id 71dfb90a1353d-5ee8aeb50e2mr17023542e0c.3.1795784388928;
        Fri, 27 Nov 2026 04:59:48 -0800 (PST)
X-Received: by 2002:a05:6122:6846:20b0:5ec:b437:e670 with SMTP id 71dfb90a1353d-5ee8aeb50e2mr17023510e0c.3.1795784388390;
        Fri, 27 Nov 2026 04:59:48 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8db37sm859734566b.35.2026.11.27.04.59.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:59:47 -0800 (PST)
Message-ID: <7c1d9d6e-91f1-465d-832b-d521caaca734@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 13:59:45 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: fix GPU peak bandwidth votes
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dragon@radxa.com
References: <20261116-sc8280xp-gpu-bw-v1-1-cfffc13f2fbe@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261116-sc8280xp-gpu-bw-v1-1-cfffc13f2fbe@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1MSBTYWx0ZWRfXy+ze88oS2/i9
 ya4xwmzKZHwd7fFau7mgGh9TfBRAYyU5uxrtboYtdLMp0AEnZMWiiYGAWgc6uxOaML18Ay/KZGP
 ZmpEKqldPGwXA5emNTq6PE+l/1qfu6w=
X-Proofpoint-GUID: OCXKGO2wVZBXG8kUzTV1Kb07rDMGvZ4O
X-Proofpoint-ORIG-GUID: OCXKGO2wVZBXG8kUzTV1Kb07rDMGvZ4O
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b097ec5 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=67GPwzqqGCJse-r6Am8A:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1MSBTYWx0ZWRfXyaVMeYy8OXj9
 4AQUngkgeNgS7EIB4X40M4hWtOgppqVBy028FqWdJd//lalIfjuovuc29OJMRvo2b9xyjos1ZMV
 ue5v78CcFqJRdFLP2BUTpQDNrCejc1afGlSJV0B2AEVy+Fqht6Kl0quKzCkQ91kFh2Y01utd/9w
 8jU7dzswOL2E247J89nSX6aKptncrk+fvtiIF7ltlIWWX2PietgEl8h0L/JemsKCbpc1GymwbJq
 HO51MDyEOyw+42gKl1AGles20JVhkMz2tSLYk8LSx6vvSXmKDNANl2lidUnzkcKcX9VYiM5SJnQ
 Ire942Z5VrXiGuugfCp8m4I7fSDS+T94cZCCNbQ85gGFC4xgZ9fN2Hayw+6zvIUdwKPlc5uWz+8
 TTeqdvRPgqdnLtasSpayMtqTpac018BkXW3peXEp4MnQBAh43eQQ5UI/XWlG4Xzk0iN9BgOAfhj
 SVrTKMl/bNK0Xf5HuqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270051

On 11/16/26 3:43 PM, Xilin Wu wrote:
> The GPU OPP peak bandwidths omit the four-byte DDR interface width.
> As a result, the interconnect receives a quarter of the intended peak
> bandwidth, which can limit performance under memory-intensive loads.
> 
> Include the interface width when converting the existing DDR frequency
> levels to decimal kB/s.
> 
> With this change, clpeak --opencl --bandwidth reports an increase in
> bandwidth from 23.3 GB/s to 60.5 GB/s.
> 
> Fixes: eec51ab2fd6f ("arm64: dts: qcom: sc8280xp: Add GPU related nodes")
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
