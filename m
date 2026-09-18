Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69684B827C
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789725885; cv=none; b=lZkLfG8al/H4U49eqGG1EhutcEDRN9jiPsoXVQCr4nzXUpHV55qfP1VQGE+M2Q6VXC9KKLmdtcQb5Xh9k9atPJPAOvG8ca4FLdLCgKLaEspSDiRoinQaxDE3YtPsTlGQI9G7Ya9a6Qpu5xJVE5Y5oE4vCajx3GNnuwQ91qoJDvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789725885; c=relaxed/simple;
	bh=yU0XvgwFhmxEqdBCP5BExwMxGrmilL6xdhhks9FDJ3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p2OZ93whsWUpeyuwFYsCan6rPEikMc+mRAYHet80Dfjv5KK0s3upABWYydC24E75CXsEh95D9edUIRF7vXMbsuw/zJ1M+UKe7UUkO1HQHOyksRg6QpbaRleCfHlniP5m5u+hy9u4N68eY+JKsQHjA6KLRsZopuvUWB8sZIJCTJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A5FHRnfz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FLh2Qfwr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A5FHRnfz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FLh2Qfwr"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dSTR860427
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:04:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UwL28xD/iIpbgrkPh+lIjoEQBoMne+PZ9nAWGlXztqA=; b=A5FHRnfzpsm4MLFi
	/12A3razuwm4VtxAUQFMwCxuGY8vYaK+iv/ZHUu5ICCRMMX8J2Ribl7A1rE64of+
	T8AxG01PWTLlzjsrLbg9n+PrHtaHMYxWqEOn5nsU24qtpYHMt2aSinVNorN1LPHy
	C2rmUel/vNBSJhn/dJxMzA4jz6hiYc0vVUGVSJ4PVVUvBsnZ4F959K8fkfR4dhDR
	3qKv4EG/e4ONVlusjzOtCO8VdEKvL0mWukgddcPuQepLel6fhCF9bbzVHm6HVjpT
	SRoXN8+AlsG6VbV8De2uGGn4PrRATGLGpAwkzOBBb+YXDvcjaQgd5f5ZJLs6eqNg
	ZYPIdQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs2hv85xn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:04:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9375d92d0caso12801285a.0
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 03:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789725880; x=1790330680; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UwL28xD/iIpbgrkPh+lIjoEQBoMne+PZ9nAWGlXztqA=;
        b=FLh2QfwrlA4iCUKLZNlGkqrADQrA59vFFc1NDWIBBWAN9tW8LSnZgCN8WEWolK1JWQ
         sAmMSvnEr29yIlWw8BARMB394bOB2Dk2hS3DT0rB7uLDsef2fDogQk4wAwNglT0HbzhC
         59iOM6oXGHgB4qhqC1AQfCpWa+nWtCG68xNqYoMRq3Mxd97GhMEcd+Ei2Vx66NapU+bN
         fBUsYBff7fhkWB/sTPMrPY5MNU4OrsceHopOfaEepAlhN9x+//bu6tG/AAUMkoOv3hZ9
         r2YNd5bEthj5lQ+MUcSgNgp3PjH7kQ/+UCtW3Z8wExYkNuVxJkwJ+wdCJtSfA7FqQ8WE
         LiPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789725880; x=1790330680;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UwL28xD/iIpbgrkPh+lIjoEQBoMne+PZ9nAWGlXztqA=;
        b=C8xFNjuFz72lKV6i5Lac/QPKlvojrzn8rSJqkJsxgPY7/VqCsBA5AHUpJP6E0mhckq
         V6NVHgddieyAWQkSKHR11K1YQJDzB95DijwRjlRYisHpWnKpRSEachfv9vYnUHmyIb7O
         TffQEQfmkqT1nd14WF8vJdmLtpps5n9slxnBWAZfHqJurVvkrgHTpWszmnPN3jozS0xw
         hvU9DEghoOCwN5dBzA6QNX7elxZvR2SUykxjNJz7tqFIr5n6geLpDs27PE2vc5q2KI8e
         jq3kabeHoSc1hdk+HnbW3eSjvCvJffm8PkJQtqDocnq9aO7Q9+vYjT6LC3ZmkQT3reAO
         yz+g==
X-Forwarded-Encrypted: i=1; AKwUvBwuubCgskrqlMpooNj/MAVz30eYM+xxEipcBXuAAQswekzKHqcwCtLTonphGkEeSx+VMzF3mGlYxiQR@vger.kernel.org
X-Gm-Message-State: AFuF++n7aeoOggA3rWGomxFi9FDRpw+8RxfxLK6/HRxPl92z8/I7Ceg+
	DTm7bvYv9jdUA/NE8uyQH3smBe1dM90xBX/hQiy/Nrku4rV8wDeqNfnnL+YScUNk9JHzvu3k2hI
	89UhtnS7gqULWvy21cvM99A6sSGFhtzSMDEwAmpAK9Mf0k6j4TQpZg86kfbMNgHqy
X-Gm-Gg: AYBFou3wYgEgec6UiS/acnOyL8XDj6TYNF4DseyyJ/n4mqELBbo+Sr+o6rOeopN6jC3
	n/S3v7JzkUVxNBNNT8p/TIJ/PoyclFtgeUPJ3xMuvcfoZDvwUzEya+jX2hMr6w9iVPHlkUDUBxF
	IZ+WzbVY8kefKLjU3NAJxegqJf9deZuUYXN0fBO1Xk04hE7pUqrD83YBrtllAIoUOg0VqcuWV+C
	+ptGyyDflIdMP+bI74hAKmC3YBeUG3j0fR+2VraYZa+26DpC/pq3Pddy4JqBmtpw6QS2HKLQ8zs
	uQZJ5RUZqHfB1Ko4yxrqLuVPxmu1C4tnjeFSAzkaTzvU4OpIpN4A0x5ro8oWn2UeN+H0iDyyjrf
	PLHOO7PHhdYF25H2YPPMnpw==
X-Received: by 2002:a05:620a:4408:b0:934:95d9:85fe with SMTP id af79cd13be357-93be055f2fbmr184227785a.3.1789725880393;
        Fri, 18 Sep 2026 03:04:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4408:b0:934:95d9:85fe with SMTP id af79cd13be357-93be055f2fbmr184221985a.3.1789725879785;
        Fri, 18 Sep 2026 03:04:39 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1b7a241bsm40094766b.6.2026.09.18.03.04.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:04:39 -0700 (PDT)
Message-ID: <c0095a4c-0f53-48f1-a81a-b411b8756ae7@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:04:37 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/15] arm64: dts: qcom: sdm845: Move PCIe phy and
 GPIOs to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-6-6272b7caae9a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-6-6272b7caae9a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0MCBTYWx0ZWRfX/BarDpOmddz3
 Epx7OWYzGdcqJAeGk3heyeGRw35VUboc1tjLqsk0XzcunkTU1fGViLRKa20QEmwDH7e1QfmpciT
 moEno0foQXexDUhDu53CrOLDzc2cBf8=
X-Authority-Analysis: v=2.4 cv=IOWXmQvG c=1 sm=1 tr=0 ts=6aad0cb9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=6pHcnep46kEejBPVP2gA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0MCBTYWx0ZWRfX4oP82lu0StGq
 B5deTiAZeQ7gqTL2n+5jhcVycyRK+B/y6tRkoxRtzkQOtu3CSTXKksPV2d8NIlEPpVrK588re7u
 94bx3OBZd+xD4qrm854VwEPzeuhr+6pNaTpzx2Wz7XbibRSgVJYrMj6aAk4/IVS+LlzQnwr0nvR
 OnSSIoQD8ZwyQ1tjqsFOIYjQKnxJnRwIxDhTcPjkZM5C3HaF/e3QqXz8kgBGLHXhjheLXqD5Ro0
 leA7lFQjAMmKtAa9rVyoveZB6XsMX0PG/gBWdUfb/hoPm8bqOvlrErRve/ghEpSQPflT/Yp+c3I
 JIE1zz0x4dZhYMCCKMMnrk+mhoiXNboN2OrCBIVmwts1EmVtqwy2WJYLZbaeZIL42f8nF8g0OfQ
 jieFqZFtCpCMUTxAy/LF6w158Qohz6ajKGvKJUIXje+k5U8lrw8ulP6Ulj6G25a3l5rRsX6Ufc8
 2q/7Ebyd89qm+DIKQkQ==
X-Proofpoint-ORIG-GUID: -BCbmjsL9f8cP3HJryjI8TZlqj585NUu
X-Proofpoint-GUID: -BCbmjsL9f8cP3HJryjI8TZlqj585NUu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180140

On 9/17/26 2:25 PM, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> pcie0_port0 and pcie1_port0, adding labels to these nodes to allow
> board-level overrides. Move perst-gpios/wake-gpios from the
> controller overrides to the respective port nodes in the board files,
> renaming perst-gpios to reset-gpios to match the binding used in the
> root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
