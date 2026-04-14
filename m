Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E43D3C1414
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 09:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776160764; cv=none; b=PpXWDUg+IGrC0VFTNQZS2N4xeh8MMPOMVYzd4i3o/Y3hrHS5dT53cM2t0T6BpOpTgqjmTWgcxjx+rCXumvcs1pi/tmNbG7BtbcFzWB9TMviXs0/4v0ORAYEiUWENpPKWMmeOpYWUg7GCp6Qk7uHNU4AXm+JshnKsRrcqijc+4PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776160764; c=relaxed/simple;
	bh=klFXDLbVbYYCmoz9dD3m8IzQK2WxOCLICjQ6S8ajWSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VrY3dC7zuhrdlfaxNGWH20iCshzaQA+B0Sg0co1FK1HPWoQ5w2bNk63aUGSCk37vudfkcuM43C2Dd1gqW8XVWFWTxjuywHCZb5xKPND/Q/AXFb8RDpUbPFUVYtB7gGNW+ATv6oeaIwZzmPhPRclOGO96p31Yli/IJSHZQYWGJng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JLZzccXK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WhR/4fAA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JLZzccXK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WhR/4fAA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6Qi4I3505300
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 09:59:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V2Vn5yshvoyWknHL8GQ5Y06VZ/WdI9bSyJ3LPPoTQkI=; b=JLZzccXKfC1Km5Iy
	mpI4h1TjkD6vmG43NXuGE3HYB/8ODx1LD/MZPDfz2q2PGzQi5/qeupWkbNBlhjYq
	tUhb3k7JLbYKbB9a9Oq/E6YOekEm2aELQutW1aj4q1pp45fSZEB60NwKU70CoLUJ
	y2FIyprPzNtXdSlfs8BkuUyCp+Xfyph945B3b62M8yqMBfeSrQ+AeknoNx6dIOPV
	ncM5RBw6LQHpSSVw038/qUnWKwUmW9iVk7qDe7y3u2I3Re/B24YyNGRunI+1gX1m
	L+qdCCCzZCXvZ+kW7H45/u0V+LwmWFv64Iwjzdx/NKpg9l3FX4p2QbP7a3QGz7M1
	iEWHvA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870j82x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 09:59:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b9074bd42so14796231cf.0
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 02:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776160761; x=1776765561; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V2Vn5yshvoyWknHL8GQ5Y06VZ/WdI9bSyJ3LPPoTQkI=;
        b=WhR/4fAAKj9eEHEdqpvlhBGa9jPjF0+Nj7tRq8+VGF67eG5YxCjWC8JNM35rtqIK2O
         STIzSXmVSjm9x5F5Y0ltqsx0WFndEsOopLOLJLU3x2L0e0WDfY/ko/L+4uYFfPzwRK6y
         6EpDIYodGrTm4eniDjJHzpDIq/fbCms3fFaI/sOT75VIqgXoAOD9V5M5SCAiso5VxfKV
         nxw4vhnBOS+IcygvBivh3EDGLKMIwt9XLWjvGggVdT12/9VwMBWAt8Wz7GQDMvIv7tXW
         ai8knD5QFzr3j4Lfl6nG6YAEC1dhZxUvGEsqgSafrhTMwgF+KsadBAidgUbBaB6H5czP
         Iong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776160761; x=1776765561;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V2Vn5yshvoyWknHL8GQ5Y06VZ/WdI9bSyJ3LPPoTQkI=;
        b=cjtmx2Xz+4DqYYfKxiojLg5UdBzcKi798NW9B0fmhx5TDG5/0bqZrtJa3StWndXKZy
         nCl4QcHOQa3a0tnyaEic9zq+1+ntej90IJt7kWhV64VxTMWnNOrddpt4JbaXKdacleEA
         BAfqOMJR+aQiM2DT4i/c4nVYXatZmHLVmaCU+PHvLZjZquYXHNQyWHBXXr7yDko/LwDD
         eVm0A1h17q7OEpCNHWfyvPuOQZvDFC++6P0FkBziM5T43iBpjuYC2wVs5ERNuwf7acJ5
         k7ISOjm+cU3nak6edgQBRMH2Z9B2bOLAnPb2xjbUmaIbwSjXFqkGyIhXyIU/DKny7LS5
         WSFw==
X-Forwarded-Encrypted: i=1; AFNElJ+qAaFWr/bZ4nIzDiRHyCxNsyng0YFpJ4YQ4m38wgzgK85Z5VbVt+oJ/XG6xpnQOt5Oq6H8xVEpV+ea@vger.kernel.org
X-Gm-Message-State: AOJu0YyY9J/ni2z6yE5S6lqIh0mQVjR+2X8dNDLy7MxnuTptQOqhqWEW
	lRqQmYJRwtoTQNWEZqsLvQwyoHMePLn+ahONA1SGSnStgH7Pm4Mcuox8cjEp9uFBnRYox3vURX4
	YEUtcv07XQWsZw3q0oJxlydSFpgduVt+sVRqDkUT7FZS6PJHhFhd4DzWPCJLuzFbh
X-Gm-Gg: AeBDietYQyDGqGSmBgCaCGSkzBj31kuYk4QNhBmqpCTPbOUEYoyvHgt7GQsi5qXzIy3
	Eo9LCSXtPr3zody8N3EPe2VpRdDV2FB79wcW/Xa4to/fNGt5h80zBHMpT+fPcaCfiC+16pC1j0N
	0U7JDqggoISgJkmR1q659sTR3VXtirMHcfgOBIoVVBBVX4KdZh3sty0SzPOsKJvzRt6xw63/zjU
	bfh4vc2u088xmxPdGh7bYqhQE3KDijw6oOQLM/9Bwd+XTUlmogsFFrsyD6g7PrkTpLhfHL5EvUt
	dGZ61XkYzNnT1uOO1G8bN/aXBuVX42MpfFDImjgTqCmgMWuxdE/QRe1QMLeZyZxil/wzwdpHxmO
	9DUqy8ZG9OhBGAzFdVnKRErbU3V1uiqXLL7Ry2McsOOJcfUxbohZAtMf9QB8d8g7rRlLXBn7Bf5
	98lNRBqNu0rMUajg==
X-Received: by 2002:a05:622a:5595:b0:509:1b76:e9ba with SMTP id d75a77b69052e-50dd5c8b23amr179814271cf.8.1776160761638;
        Tue, 14 Apr 2026 02:59:21 -0700 (PDT)
X-Received: by 2002:a05:622a:5595:b0:509:1b76:e9ba with SMTP id d75a77b69052e-50dd5c8b23amr179814061cf.8.1776160761163;
        Tue, 14 Apr 2026 02:59:21 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6dfd51bcsm390292966b.17.2026.04.14.02.59.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:59:20 -0700 (PDT)
Message-ID: <893e5d51-61d7-465b-9ba2-78a0927a4bf6@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 11:59:17 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] arm64: dts: qcom: lemans: Add label properties to
 CoreSight devices
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260410-add-label-to-coresight-device-v1-0-d71a6759dbc2@oss.qualcomm.com>
 <20260410-add-label-to-coresight-device-v1-1-d71a6759dbc2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260410-add-label-to-coresight-device-v1-1-d71a6759dbc2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5MiBTYWx0ZWRfX9XtpuwxcQa41
 Gy9M2n79FBJIgaOrQC5s7JVbstGcdjHPeLPfB7qUaq+LvqsFkEo79Lx4KDYHqpy89UyPzcZmi7X
 49fSR7320Z8+YV5E5Ow4wBicvUmCq3bHt2QcaohI/9SVj2C+bUe9rqDDdtUpYrCwCZ5erlh2iR5
 fA/5g0WU5pn+KDI/MZAmdNx3Z+yrRfNVl8AoM2Cyy7pUMnjguHIx2eEYkCDT0bNVbAXbh+KAE3a
 4rGvEB7nsfmgn5AGN5CddbPaY2yEDFlmXoUn0Pp52BQO03WZn2e6meyuliC41BAHp7E+p0z+O7J
 oJYkVO+c9gYZdso05nJQ9k8FvH0TruekmB54l1lTqZUhnhx951IB+oNQ9LS+iaFGhZZP23sIfnL
 JLCLbkC4ZxmiojIqmuOJhu6RRXQ0pr6RVwCSZOKWDHx50xO6NBkrjG+4ZAlkTkXSZ3JumcEe+Nz
 qhumaBQNzT9I1yppEIw==
X-Proofpoint-ORIG-GUID: JcIYtUv6BNQwp8iB4Rd6rWqwgpMuPl0T
X-Proofpoint-GUID: JcIYtUv6BNQwp8iB4Rd6rWqwgpMuPl0T
X-Authority-Analysis: v=2.4 cv=btZ8wkai c=1 sm=1 tr=0 ts=69de0ffa cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=uGyuuOI-cJ-b_BVNecgA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140092

On 4/10/26 5:08 AM, Jie Gan wrote:
> Add label properties to TPDM and CTI nodes in the lemans device tree to
> provide human-readable identifiers for each CoreSight device. These
> labels allow userspace tools and the CoreSight framework to identify
> devices by name rather than by base address.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
