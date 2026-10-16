Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287A53B5820
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792139725; cv=none; b=c5oCDCGPYeWENTvWVFaEwQsWOEfX4wXdsNDqKz+spUto6b1b5QmBZ9WHl3Ptcx2VLSLxnGiOz3wyZHNXRle0qLJxmx003xZNhbzr5zLWagPuQv7RV0v68IAx8OiGUiONkh9XJzoj63brTohAbOsJGGGHZcJZddAPWAjRh/TvO2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792139725; c=relaxed/simple;
	bh=G+jvZB6Mji53Oxuv/iP7a0JCLgGXa8e6zRkHoa1NUhA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=obINrwV+tlhUu4QZaearzsgw6swOQJYbx0pW71Wvw5sHlHfQdhjse5OPbGI0+6rmVhJAQ5TrbYxmiSVzH+GGyDuPHdapnnf2PVYE2GDCF8jy4/nwNBxRvQ2deGMKU2XW5EdskkCOAt+Uv1Da3ihUCjnNV63oS+4OG+Zhs0C+eqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S6TA1gfJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XD83Bo/O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S6TA1gfJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XD83Bo/O"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G44Ikh3875616
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oBG4iqg2NWlURuAH2FetWXYaxhCLT77P4rTe27vpggA=; b=S6TA1gfJST8b8prs
	meZKZi63tbUd8HHJmfS5+6yfjKRzff0m/7kv4rZAIHYRjGt5otfdFy4/aIrsX2DQ
	H1yhJoclugUPlUnO+kT7Ro56A+RxTfMmw6PuQKLlV/c3JCa0c+Q9wWseZZle7jcW
	uswCnyXzCxH14VkbOSOtc15itfecV4Z+L+MWdrZISzk75U1Kdne6BUFjYfL4s3zw
	UlnSsyTdzxQFUiXYX+FcFZCUgCqp4ifNyLw0tWrcTdH6W+BvdP7byrQoUoxY85md
	lj7SFj1p/FAtV+FS01p1gdlQZsCE97ZujDnYy54rqKbhK0ekL8Zxfgvy5wNNIBfU
	42E57g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbcjt8xx7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:35:23 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90520763ceaso22562626d6.2
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 01:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792139722; x=1792744522; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oBG4iqg2NWlURuAH2FetWXYaxhCLT77P4rTe27vpggA=;
        b=XD83Bo/OfyRcasKUb8MkPSCMcb+1Bx3alk4Xjd6rTyTZzrqv3x3RvcKcMpVHgrqV9t
         ETsTaw8JzwHgSNxzO6GANjv9pYvyiRhTHaBRA4UNm1izBXiQkxqorwduqGwc6BRaTvxA
         QXexTEqPwNkl37YkNFi01vIFCjIy+yOB5OJIJvISo3T08n6QGNUhDp/OuaiXjAgVj+jD
         c7+MNfylv2AX4HhbI95WjdL7gi6jKedaM/ZDThYV8g3ClIaqjDgUxDxzNcF8atW/7OHB
         Zvty7y0kKpUiM4lCAhqZWOJiAhFVsRhwObXiQVZN1ot53P9d1SZn2Efl4zhplnmbvRVB
         sfeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792139722; x=1792744522;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oBG4iqg2NWlURuAH2FetWXYaxhCLT77P4rTe27vpggA=;
        b=aWJ5lsdZcWuUzRHRrY93PJ7Z9Kzjv4XPtoYCoVxUSJQcmnKq5tT2O1MMWnY/vMyGJm
         6T4CCSB0R2Sj2INa7AB0UdwzkaB1I8roPDdKp5eqO0uqPeT6/VVtyi6aU+VZlEOutz5c
         PKwvBJMu2VbDUts+8seY2G9NYxSHci0EDZ144ds7ifGqbzBVCCbeHJOqos4o5O9Q03m8
         oZq7F3uSqrQsStRYT7ZixbB4QGzeiAshpLNOSdomuX0nnwbjD4lrdeiA21sPyqayUzid
         I9bazmkKN9XsvsT80aISDV/O7QjmP7ABILyvQvSxWbxCs+fQJchWCAlce1jFLzHnRXil
         QGvg==
X-Forwarded-Encrypted: i=1; AKwUvBz2N1S5CYH2MdajBSM9yzeTWFaWLR7rD+1+i6nw076zQnLjwVH0u9IetBP0m7K70kDlUpB1TEr/iqS1@vger.kernel.org
X-Gm-Message-State: AFq9FYKHw3D/BdFhVf5yoE1UXubDV04Iiu2iBJzDCwICGqPyS5zOOh1H
	aeWnfDVbnsp9cI0wnTewuGFnSJum3msccxEoIh/UDpHPnRGrx4aw+O1h//Lo3APhrtpBASF+2Ip
	siCCIlWEx9zudPGGTP8aq90Ar/cX4fUneoMb0olAehP2rNR8D0Qm03pmWRCLD5SR8p7u78P2c
X-Gm-Gg: AYBFou32gXm4YhSla9T2nGPrzIHqGx3f0HQkZxEkNIuLQVc5xvh3ctfVytSSipEB/HN
	IgBKwpZJGv8cYXxmf/obr51/ymA/Xr5gMpPDyk/q1knuXaklhw4k8mgqqijJGxS5rDm3qo6v7eZ
	+d7tOL0j8k+4OzBSb+l+Sy/thfaVFa31zRGzkpTrAZg4JKi5iBGmxBH13LHK3SxhhOuUp4omT+H
	sHiiKFMb1TS5UGBW7oY8FzFuRWG3WpCMfi7R+OgCcfAgIBorgyCUdylOriAO4wfRstguqrDQTLP
	uC5G/wHJeS3bBAp3RISEEhm41GERZXfM53UPJxAkP8IqbBMDf7LjNi2MK6+yHY0WxIY7ay9652O
	vMyC9n3BJn+A0xqdWADYYrA==
X-Received: by 2002:a05:620a:390c:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f0a34dd2bmr1305256185a.1.1792139722225;
        Fri, 16 Oct 2026 01:35:22 -0700 (PDT)
X-Received: by 2002:a05:620a:390c:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f0a34dd2bmr1305253885a.1.1792139721731;
        Fri, 16 Oct 2026 01:35:21 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ce133sm52324966b.31.2026.10.16.01.35.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 01:35:20 -0700 (PDT)
Message-ID: <72ad4c04-a959-4862-92f5-9e07083eb2ff@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:35:17 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: glymur: Fix fastrpc compute-cb
 reg values for cdsp
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Mahima Bhattaram <mbhattar@qti.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
References: <20261016-glymur-dtfix-v5-0-f56a8b94b4a9@oss.qualcomm.com>
 <20261016-glymur-dtfix-v5-2-f56a8b94b4a9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-glymur-dtfix-v5-2-f56a8b94b4a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNCBTYWx0ZWRfXy/xn8GtWVubc
 m8WcVbtWBAGnJ7Wi/R59dWHJFAzX3lhkLIBFVSwtm/aPy32rmw8lEbsa9VvAxrqNYG7oLNMrhVh
 7HJub2os/jieSC1f0R6ENGZ9PFgx5M6ztP5iJ/QGq5yiG0MtYjSKmPssiMsXg3d6tU33JbIwm9x
 p4BNtdjOEKNsFr4DYWq8QZt0kNaFBghkjJhelfyaKzAIYMsE2DcxEAxn1E/VfPwvsxN/J//uXYs
 nwJ9+5/hlMyXOPPEtuP5rEePidWbULnwR4DsSbpfKai4ud/PeFPYDjEKu3N1mO/3abaOspkJt1T
 1TiwtnWckXC2GGquDpeywHNPZXh5V7XUoznkP5J/RbjjVQq/ebNLqoQhIBTlGox6GsqLGjXGozd
 ye2+wauWPF08D6ZddcHD3Xlsrymds4evP1PRGYagNoKlTsg883MQegBC5kBBbLngLTlm0nd2cLI
 haWR0BKBBzw6Q1BU0NQ==
X-Proofpoint-ORIG-GUID: WsJdMmYYg6FIbKFl73W-CS-qnemmogIl
X-Proofpoint-GUID: WsJdMmYYg6FIbKFl73W-CS-qnemmogIl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNCBTYWx0ZWRfXz4bKwWJPbCWq
 uFLEali+ghwNql5gxE5oxGG90IcPfFnGGIW6o7Ou8sYPWeUGwxrwmOXqKs7DlhZMp0dOroW4cYg
 Ta4Zuke3QwwtIQIUXuNgZ1hkINIXsxs=
X-Authority-Analysis: v=2.4 cv=VpS2kO2n c=1 sm=1 tr=0 ts=6ad1e1cb cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Fnn43W3oJAV-pqR0l1IA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160034

On 10/16/26 8:36 AM, Ekansh Gupta wrote:
> The reg value of a compute-cb node must match the SID (the lower
> nibble of its IOMMU stream ID) it is associated with. In the cdsp
> fastrpc node, compute-cb@10, compute-cb@11 and compute-cb@12 were
> mistakenly given reg values of 10, 11 and 12 instead of 0xc, 0xd and
> 0xe, which don't match their SIDs and leads to SMMU translation errors.
> Fix the reg values, and rename the nodes accordingly.
> 
> Fixes: cd1d174c75f7 ("arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC")
> Co-developed-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
> Signed-off-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
> Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
