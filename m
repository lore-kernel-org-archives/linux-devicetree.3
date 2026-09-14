Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621A947124D
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 13:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393713; cv=none; b=gJZC4YHPIlTPQJI15YUgm3w0IyQZV+J7VqFO1h13T9loSlQZ9hoW6jbWkUBYG/yUMGUC9Q/vbyXnxw3o/jF6wngd8imRdUzlFp4l/1vGqaDaqCw0bIxxi3BIQhqBQzHt5eNa7ahY1LDVXqOMV6Z8PFVITQmyOSiWaLflG6KY4dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393713; c=relaxed/simple;
	bh=wTtt26P9/YFB6Zh8WHqX6MNSaxvf4tRs4sEIMdB7qe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b2d1rtVr+PfGrNQqZG/WsdBIeypbFieukXqM3RnmWavExyMEL6JXgY2I3UXao7TnKSjmXEfE2hDxKwwNM/1tLpYn5G4HaFWPhdaSDuCqZkfdTNhDRbZGVFHKhe/+s2BbbhKf9OInoh+t2fnZ8Habzwi6KeRmDph1AhW/pHIUBXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GuqmraSg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FSpd4d+h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GuqmraSg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FSpd4d+h"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0MIG4090499
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 13:48:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mgXTfcLQ0D0zx+3T86XCbLuz
	91+Iob/1aPO996gOmTQ=; b=GuqmraSgFp0wUDk8cSY8HASx0yMj591K1BCA/wio
	EdOmlz2xZ2/t/xZkMZq6z8XmEOSvM7ezVtZYS8J4CBEYReToPD4s3/JjmTZMev7F
	huVxjpX0DmFMS13CohEX/t5Rw2eeEKpqfoUsnwSd+8Ivt1TdI5qtTFnI60+ENaT6
	wUKxZgRnKsyruib2KnwGOpoJq9i1Fs2REmHy30l+dAnNvF47fVdIUtjJQbFsNsFr
	cwac2IgXOUN4oZ73egSUhjm7TvAUNkHpLEpU+G5cG53aw+u6Vg5a1aon7r1IuuRo
	cbiGgYxyL2kM0gi0LuTRsiZO3k1eG1YvsyIExgkvub1WPg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg1d9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 13:48:30 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-980a896f53eso2676166241.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 06:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789393709; x=1789998509; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mgXTfcLQ0D0zx+3T86XCbLuz91+Iob/1aPO996gOmTQ=;
        b=FSpd4d+hS4mUSRORxt1GN1+aMU6upboJgdBaYycTNpb+uEcZT+rPITCNTmdDOW4arq
         Z+mlxp4V0ju85W98HP09pB/UQujOS4BO6otsd0DYZCG7cPj57kc+apLzmd2PMoodt0W+
         DGgHBTnoTmi5DwS/DP5JjhXPOK04vdzREvOGwnPVt861E223Z33c2s9TYtdc9q0/S6fh
         gBfu5Ooe2vusVqaqOQwCAaAYz8kKI6cWpNK7bpHMQFGO+QZftzJQyw/ROi4NnPGIj0fy
         /jscmg7M1ZIP5cXyn/exKCcwgERemhctyEaCghcCZ0pAO3FU6PM0mJwDPNY1bH+XP326
         2xpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789393709; x=1789998509;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mgXTfcLQ0D0zx+3T86XCbLuz91+Iob/1aPO996gOmTQ=;
        b=fzwtv40+k4FG7V4rg1E7PL9arefeIm2SKpT7lG7oGE9zBqj5oMevVRYv56fQzkWXQc
         IofBs6gJTec5zxlZgSZ99ytklpnqUedoefVfz3XYOOLn/r4dkAIEcYhF77FlSYG/0iL1
         /IFrc3+m5ZuRhO6m8j/3YPnBUckrnbxAcEr6vJyQzUUSfs6dutjWjxARjbslREgLe4EX
         6TBNv0FntRcgpMyNb1nCAidDqZo8NHaxz6lDiptdcxvc9ovjEgKjjQ5DM+eiGpGuiIUP
         2EoW+fKNm2Pxo/mUaA6If/lLzwqQtG0nRYwz9Bh2jVtxrQaQIPjnHCd/X648NyE3sqd0
         BcmQ==
X-Forwarded-Encrypted: i=1; AKwUvByFRz7Hj8wrdtGRfKeMr1BlBzT5RYxkBO+im+pATy8dfy8KEO2OJFkfflLdWQIi/5XlE7h7iTzlLE0Q@vger.kernel.org
X-Gm-Message-State: AFuF++lLv879UE1uQqBWAC2QKtTi2fripfa3igkX6pNJDKerObUICR8I
	fQavdI2NDS6WgAxQ3kOSllp9nPXAdcPwjgzoYGcOnMOO2mICIn3J5+WeCirZQ6PSWlMUPoXewIK
	5ZuwACD6gYSuQ+g9wZxslDW+epX6MWuLIolDtv+tp8hDRc3x7Cq3P8NX6m1jkiVC46bgRJRiP
X-Gm-Gg: AYBFou0ifydZAHW/2rSdG9V/glWtfcfDJ8+JvijPq2BgJD9zKCNwbfzGeZkIRRL5gCX
	O5oF9du2xgHqC5TAD2sBSSWmau+WORtHNt4Nmb9lQHONSqDf+8PGvuZrvhn0h5CEz7mG0+bsC0d
	NQIl2fVH32DyKbEdsM5gnoK5H6HskHox+JIHSz811XW3rj7+jSsRbzM++VY8m2N81wyMQ3FQJrc
	pdwDUqjz1ZIu2tkpMbH8QB1B9UXbbglww+InHjR4WTpYdKSaak6pnBHF0IwK9twByyTdTybaJRY
	i90qSZ8QIIFdsz4uYowrwixHoCHBx/R88cloEe6HDdN90k1pMXBrfsO8sEiWCyBuzWPdlSAJQYt
	OqXB6+sHAeFgntA==
X-Received: by 2002:a05:6122:4909:b0:5c8:3a2f:a497 with SMTP id 71dfb90a1353d-5c9818a8132mr2352676e0c.0.1789393709360;
        Mon, 14 Sep 2026 06:48:29 -0700 (PDT)
X-Received: by 2002:a05:6122:4909:b0:5c8:3a2f:a497 with SMTP id 71dfb90a1353d-5c9818a8132mr2352577e0c.0.1789393708749;
        Mon, 14 Sep 2026 06:48:28 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb330bdcsm28037041f8f.13.2026.09.14.06.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:48:27 -0700 (PDT)
Date: Mon, 14 Sep 2026 16:48:26 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] arm64: dts: qcom: nord-rrd: Enable PCIe controllers
 and PHY
Message-ID: <ua54c4qtcxrly2qyae4usdc5f45vrtlpnog65ym2int5jpz2wc@3yxj5jrcwec2>
References: <20260914071944.164217-1-shengchao.guo@oss.qualcomm.com>
 <20260914071944.164217-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914071944.164217-3-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa7fb2e cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=MrLAvLjqEOgBX2ddU8YA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: rwiW_YwqIOkdh4lco8uLJFOzuLOfIrHD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE5NyBTYWx0ZWRfX7XB1LO+5lZXA
 nMye0ffXXx1MkiNvqpCKOAGQ8IJ4VK4RDnFUqL0fw06lSVnp1cNQE/KdbE3Eu8bfX5kKto82oWj
 23uNwsM5ZP2b42OHRIN3cH3Z+r4uelI=
X-Proofpoint-GUID: rwiW_YwqIOkdh4lco8uLJFOzuLOfIrHD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE5NyBTYWx0ZWRfX962UgolWJwij
 IG94gc5OIMzdsUA/ZMenR3nUg30UMrtGQ5IL5/BXmbuc4rm6rEpiMnyyO0YpiXP9rgjWqBRHPIp
 MYx+fZUnsEDzJLiOhNrOf2KzUyZsbGzf5kLRmlTx/zlMKsqlNRN8dsk8H4BQDeovE3m9hRWqfHg
 XoTSgGSTVr0SCTQIt4h0P6Css/MxydSpAU7MNSDp33+Sug0PAp4/xk1Ts7QVcx3ziKlzWwz6Q48
 1/Bqmxs8YhZDD7ueye5iN0TzWYSgJ60Xm470KALSAbta9K8Hg3GTWcbjjML1QCwpEFZ2S31mTlq
 vJ4b/HPusR1zszdIt544eIUWmhEoCiqL1o+opwDWUCgCtcn4KA5rnaFHfamhDG8/H2v3+IZhuFY
 0QXsnLatfmT7wBdOsvpJYoEzxO4cJvKqJzqHpfVyIKCEwqEj9SDiry5DmCnJliDgmjlStDX2OVy
 psAcdkEQaRQqXBiVLhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140197

On 26-09-14 15:19:41, Shawn Guo wrote:
> From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> 
> The Nord Robotics Reference Design board routes all four PCIe links, so
> enable pcie0-pcie3 and the QMP PHY, supply the per-port PHY and PLL
> rails, and describe the PERST# and WAKE# lines of each root port.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
