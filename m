Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE163CC9F2
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 10:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776854977; cv=none; b=FpHKsaZGu6IyHhADCE2O6KWPc2HWs2NsP6qzZyG4fXQwoPuQIKlf5aB5M2U8ur5ddI3Y4dC1ddPQD7WlM+XpZdLHdOwz0bU5sHni1R3U5bLbfHL1tTb4ckE5TAGLoA/jhizWh9cTJkQ/V69uqZRKBEmAAnRkNv2CfEnehgv+4WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776854977; c=relaxed/simple;
	bh=zmbqoX3kNwu8LQZmFUUYGM2iqI3PjfKYE6+EnsCnmnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a0AmqLwwfmGzbyxrS0j0EM86bE+aN9C3S5GnU7ywrmr0ZVc4GwwT6Q9TZPox29aTYkRb4lqf7z+cnLBJj3bBvfI7s5A4PAS8PI/4b6EsvTUd0pZRXUV68PlGgTtZjNJwL+utAwCEoG1rhiH1rgqauU7OifzNIF9QIu4hipeBM3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DnmztYFZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gayvXHe8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DnmztYFZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gayvXHe8"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5IXHZ2935424
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 10:49:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fv3D1n/oPjVJoiloVo7navaxX1Q7eAnio4wN6tOyasQ=; b=DnmztYFZeE2tl2TQ
	ZNkidJQfA1l61uGWKxTxYiYqGZt6upe1gmhp9ugIDoz4gnqZkRt/c73XhMTYQuwg
	hwBgzVUAJW3FzFTdLGrUDSgrDvJliYcR5EAytNInePlhHVnsxvYCR8ozGuMsXSn+
	y8UElz90YSBc02LwC0SsjXnzXnIhJqDAOP5YJM8a6RazKrOkA7a0iu47tIQEH/mD
	rLqa5mPx+sGnZPAcpHXV5yHQa7jpp8RjMz5Cc0rPeDrn6+Z7cDsXrmJZebwloggK
	16F9M339HBWW5EAL/rHrfGvA0UuLnO4PbkkEaHz2xLxsRsafUSy5Oe22ciC98w05
	5uaQjw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenkay2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 10:49:35 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-610b3dc3fe8so225274137.3
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 03:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776854975; x=1777459775; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fv3D1n/oPjVJoiloVo7navaxX1Q7eAnio4wN6tOyasQ=;
        b=gayvXHe8RAujEsICCwyReis9mQhg0mmNHfAQPfgDKFx5hxlK8yt7RXwJL7Wd8yWckl
         g6PfCSGYL9ueA6g+vSt0j99KQbjX3StfNy45+vlh6WUOaWZXtqeglSjGCsypgro9AtFy
         hxlBD1v9FGXfMnneMw6vEOtQkWrmM+uDYvVxaAuyCU7ppTNooDxyaxHIq4j63SoBJ8Of
         sT0uyCRm6BmbZJeWrYrPo2ipNz+xf1mlSvoFMstrfx1vc2UZsyjbF/kXCX0zJUmrd7OJ
         V7qzHgoGMRGMrtCTcjld2a7GTj/x1YAKcgDfLQDXFqS4Vco7nGAQy1+bEOdgkvNWp03s
         W5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776854975; x=1777459775;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fv3D1n/oPjVJoiloVo7navaxX1Q7eAnio4wN6tOyasQ=;
        b=IMrAnNmcs3hUrmrIPlM6UscfDadT7M3moEKLZgNBzjQy13i1AD+uodeVy1WtFh9kiN
         PQh2BEb/TUSkG/3Kz8Dxa9lLoAeDdWIr+nRb/4iu/SYsZf0+UihJhKKcTawDS55IuKOJ
         tTLinartbvg2h0Y5EvIMQ9AJyYdPF5zRktMc0qNAax01znETWvKHSM8OJKW03mcAsule
         ZhJptbR7aS1rWInbU5jIRCfZvbyEVA9a7aS8ZzidwLV9ykcnvc7OUZonQvL4gnVzouw4
         WJ7lDgdoaZNtJFdXgbw3SFzi1JN5jwQYnfrssTbQ3WP/1z/GtH0v1fIp/12lIGfyRqaX
         WTzA==
X-Forwarded-Encrypted: i=1; AFNElJ8lTSezwpnmHM9UgtjAANXXfKQNCjPt9M4ib6UmwWVPxS66ToBUsVh4rgwX+Y2yly7xP7WOJYx7OO1l@vger.kernel.org
X-Gm-Message-State: AOJu0YxMD7uhX3aPcmlWM6FQnJCNpVre1ltMlT8UGvkiV0NXctwDFQX+
	Dm1DJqxWbVSBQFONGSspH/D9/RmNLIGRGwCafbkiCppDxGp34wNzJJNBEY7byxw0ff4HSSmb5+e
	wF6Imhq2jaLcspHVpuD8YzOKt/Sy3o3oUrsRfPz59WR6+vBCxO3ctSjU/r0H5Wz+dvwy+1gH0
X-Gm-Gg: AeBDieu4JFquWvX42fLx/fmqLIQQYHhZr4YO3iPUDD2ruR64oF25DWkJaCVSAwrf7h5
	lGS+YNE+2UUbcrKYcuZF04OeQGmv+ZDvGbsX95RQw6TN01Oh974Cjp9SZsg7SnAlCANxkp4jUqd
	nDhsPajwesDlfHs3sA7Nm6agva3wXYjk04OX/vZc553S070cFY29pGKCHjIwYDxdV9okd8JNX2r
	/DaiuBjGrMrDmq8AZTxwHrLOQCu5WVO+aXzrSGPxCdGQPaqWR+rT/uS3YyW7vQx0DFpG6GB/fGC
	M0sOXxXuuOGYrUtnE6fe6gBm2aS2eVK5XnBVvNmxcQ+ylB2PgbRpF0LPSsEwO0LS8pk+XJMvNEU
	WLl/CAQJjJUos+qqmKCG04vdTDVEc1KZNLYDjg+O98oWR8Ph4jaLDdMcRn2NFOmMzOfodsfsCTD
	1Oh5CJXgPHs3LwcQ==
X-Received: by 2002:a05:6102:318c:b0:605:5eec:cf0 with SMTP id ada2fe7eead31-616f69da620mr3079882137.4.1776854974604;
        Wed, 22 Apr 2026 03:49:34 -0700 (PDT)
X-Received: by 2002:a05:6102:318c:b0:605:5eec:cf0 with SMTP id ada2fe7eead31-616f69da620mr3079879137.4.1776854974128;
        Wed, 22 Apr 2026 03:49:34 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb6f0b7bsm36817921fa.23.2026.04.22.03.49.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 03:49:33 -0700 (PDT)
Message-ID: <82a32de4-82c9-4494-838d-48900dca49ad@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 12:49:29 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Enable 4-lane
 DisplayPort Alt Mode
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260420-kodiak_4k-v1-1-83dfc66b8f06@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260420-kodiak_4k-v1-1-83dfc66b8f06@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -UHkzfRjyA5EnNHRkANjrFlZvX4jpUOu
X-Authority-Analysis: v=2.4 cv=SONykuvH c=1 sm=1 tr=0 ts=69e8a7bf cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xz9duOo6BVSrPpx9aFAA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: -UHkzfRjyA5EnNHRkANjrFlZvX4jpUOu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEwMyBTYWx0ZWRfXyZ1XtJffxZSJ
 I1g/lWESEtNDTV9PRQ8LJS3a4dZRYzm9KXikQ/rtYjYn5QRFw+wpkWSzBxrEtghncvHziIaVaIx
 S5Gx+P+kHpon7dpz4riwJAUoLbknd4X7Rgx8rfoXJw0XFHhgvIJfA7zOJNcVYTWKUnv2FMxUNxX
 YhPjzThTdMy3CcNgZiDNqS/aVenNWy6T8CZh3IWTuegmCqs93SIAgcvxjYyeximb8Tk8P0ysHnS
 rscCEEkY78p3L24lzqyBshvG2wRb9OreXRKW9dgJg04vEZq0Nno5OIOnJA4KXPEcRgXXE7iniIg
 gDM/x24Ls8BIyrvmrdIHf4gw8GrVHrCu2axSUNnJ+6rPDLGp9TiMe8RwwVhqwjdJOU01gJnprhA
 Ep4jTp/n+O3EkjTmbs1z1wKAlAJyRWyZqWq0j6y1hXofhPtyhGJgXO9W/RIKlDtOvkWVZ3/zhao
 K/xaIi0g3t7+OCmb3Jw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220103

On 4/20/26 12:00 PM, Mahadevan P wrote:
> Add the mode-switch property to the QMP combo PHY so that mode-switch
> events are routed to it, allowing the PHY to enter DisplayPort Alternate
> Mode. Expand the DP data-lanes assignment from two to four lanes to make
> use of the full link bandwidth available in this configuration.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index e393ccf1884a..0c180e49816f 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -789,7 +789,7 @@ &mdss_dp {
>  };
>  
>  &mdss_dp_out {
> -	data-lanes = <0 1>;
> +	data-lanes = <0 1 2 3>;
>  	remote-endpoint = <&usb_dp_qmpphy_dp_in>;

There was an issue with this on a similar kodiak-iot board:

https://lore.kernel.org/linux-arm-msm/zjmf27y5i6ypba3nvsxxceuxn6yogp46lmtrjua37qa4ibrleq@4qv5s2wirgdh/

Have you confirmed (through debugfs) that 4 lanes are in use when
running this on r3g2?


>  };
>  
> @@ -1391,6 +1391,7 @@ &usb_1_qmpphy {
>  	vdda-phy-supply = <&vreg_l6b_1p2>;
>  	vdda-pll-supply = <&vreg_l1b_0p912>;
>  
> +	mode-switch;

This should be moved to kodiak.dtsi

Konrad
