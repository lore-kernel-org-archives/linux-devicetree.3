Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2C13C5526
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 15:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775836532; cv=none; b=GydqHBgtv7BESSuwXuXYZM9xzbPrWH5Do831MrVj/Q67V1luA3qhBBQrb37i/F0zrwlfjmqFd8CTLpUdySr877ND66XyIW92+6jz8wBpnzaqUyp4VRWZWr6zB8NVltkeQyRpFUu8RrzTQXLOvlUSIo5TMIFxzy5cywquvbLVPCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775836532; c=relaxed/simple;
	bh=CxybIaQH7MFOHyBvFKSmsTpkPwl8WGXSWFMtatyLJos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NbtRe3s91fi2tlP36zEZdAbsaucrPg1yeX0sr0mD2riMIKZfRKeV7HprQITOVpQyvk8hMQ2w9YKstA73JGcPTqzafGrZoWX633ykadjU0TjuOqVc6ARyP1pzkK1q1ILqs9PBXt3NB1lfpdnJO4kRBcApQtw476Y/AJ2Jm68r2Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p76lyKcK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S7XKEGmH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p76lyKcK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S7XKEGmH"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AB136f438888
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 15:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PmZzFPxdGek+nVk0XuXvnYbQ
	TpPE/KFBaQPEfM9RE7w=; b=p76lyKcKs1kTi6Qfc5kHlM4nx2zxVjd0Zk/AQyvd
	Mtd2pChBrntA/j05nQ0bA33QSISozVBV5m20cuXxJBNELZ68VOpDFRLQu+o6nLCi
	EjIqAvpd34HTe3h6BaJcsWSCG0B4kJTk/LAt1scb6y157/vcb1MMtNh21sHEHrQB
	3ULN6KIhpimIsQG8finKjMDYCRG0k/eoryCGJKlThojMjFZsHRqgBNrD5MVNf+Ue
	KSZsPcmYVDzZKocRHOuYyrx+m3MauXA5+F4+lSb5X8Z2Itr2M2PrR6RuVd2/DIjc
	XtNps5RCPSBYm2UFWHxuNXjlWvX6csGK48yXVxeftA5D6A==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deyy9rwd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 15:55:31 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1276e71652fso3132168c88.0
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 08:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775836530; x=1776441330; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PmZzFPxdGek+nVk0XuXvnYbQTpPE/KFBaQPEfM9RE7w=;
        b=S7XKEGmH5TTF/MOX56F7oDhYOUSh3d+kqeCbyOrFq+mEP98QV9SXuOTbKj+VupxN+k
         Fy169tpKXk9Lsn544Q8TTRr6/dBAnAjIWpZ9/mlMehGBdfd7rAIIV8OSDrH420VKA2QJ
         Pqit/P7vzT6QgdXBYfPkuBllDChVbGtO8yJZMXHPrpuKRdF72FXJoCeF1+UAKua49Ce6
         Eiz94GbbJImHGscWwWw7PCw0+nSvmJgwH8Ky3hJANX+9BtcvLTeEwFoRdr/URwtgW0C6
         E3ZA5Y20vVI+AYzimCD/2xKGLk7r9ifyR5y3FzQ1/P18yi0/XQWIKCwVfmk+/FNZoUr2
         +ykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775836530; x=1776441330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PmZzFPxdGek+nVk0XuXvnYbQTpPE/KFBaQPEfM9RE7w=;
        b=mnwlD3GCjtMsLwSJ5f1I1VsIDKUSo4cCTE9DRxMXd9iSi67tgTvfW7S3Sppm9CGSTy
         uqM8crvdp4xMlzJuKLIl9+KdRANhwOk2yy2d/uO5zGWcrQOKFTDUSpmNahiGVpB8rbIq
         Z/wgZOf6gqDltkqPF7jEyEVTtWO9zJrnLqVjZVS3bR4t/kXHA075uFvwzsVF3dfZ1Tlp
         KNyjKijcKOoUXxW6zR6GRH63tsNXYwN6hVvdZ8Mef2VI0WG24Hn5mjXSUQPOH7rulQRY
         FMLa6GLAoPnw4drKWTnaO1c9rrpDmmJsDKeeS5RDQU+kJQSAHdUdvclXaVqunoq6CeJN
         ghEA==
X-Forwarded-Encrypted: i=1; AJvYcCUDPoaXdVQ8ZRB3dfsPLxgYbABPJclsZdd2sBIbgv7aC7opulF2oh4zD0pw4LOvuB3Lr5ToAziVVlgd@vger.kernel.org
X-Gm-Message-State: AOJu0YywhwemVZAn86sbtNBxRQwat85EDAJtHgJq9CVdFZCfeVk5oqrU
	nLFODqFHzRsIzaUN4QqyH54zYcYNuO93Sy1cYCSvAcn7r+yTXI7WUVL4FXT/DYHABmhW45k/JSP
	FMvvvqBEKzoZSbfw62XgsgOZ0o8lk6olVIsr6LtEhz9eSk1jn605rCJtyOXlRNN0L
X-Gm-Gg: AeBDiesLvn8SAy69T3L2mwY+2OqQxcXZS9qCokBXXbyz5MJz5bljgr+FAWMWwyOVZRX
	JeX+t2JrrmUPCIUn82FVxjDxCLrQhsZj7aZ8P8+Rsi5uEEAwuJV3y8TULL3PwwsGfspBe31WjOs
	PviqYTj31263HlnBaQyQMvI8TEV8PT3RV/WRXqeYUxXYp9S4rW/bs1DmVEhbEW3jeVgvSJPz82E
	FsS7AVgg+Ca8KVqkRCYRhZX+ncLzX26Wj9sk/kpbIVr9KToFzhi+Dszr9FhITPRaxWZg+zIR9ku
	P8rlnfr0rVq1g/bQlKYKUpxrkTqdAEGEWK7Rr4VfxnESv57nchTnkvVwlfAArUQMJ+nH5+cvSOI
	oAantib4bEc7xa97BUen6I/CWfMUwBNKjvHZ7VzREl7Pz10wf3vf99DQ4uXfU7auK8aKm1SAWq/
	E=
X-Received: by 2002:a05:7022:4a2:b0:127:9ece:c47a with SMTP id a92af1059eb24-12c34f160e8mr1898533c88.36.1775836530281;
        Fri, 10 Apr 2026 08:55:30 -0700 (PDT)
X-Received: by 2002:a05:7022:4a2:b0:127:9ece:c47a with SMTP id a92af1059eb24-12c34f160e8mr1898513c88.36.1775836529688;
        Fri, 10 Apr 2026 08:55:29 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c346eb228sm4328082c88.9.2026.04.10.08.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 08:55:29 -0700 (PDT)
Date: Fri, 10 Apr 2026 08:55:27 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] dt-bindings: clock: qcom: Add Hawi TCSR clock
 controller
Message-ID: <adkdb5NFp8gec0A1@hu-mdtipton-lv.qualcomm.com>
References: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
 <20260409-clk-hawi-v2-2-c7a185389d9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-clk-hawi-v2-2-c7a185389d9a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE0OSBTYWx0ZWRfX59jdSLdA077y
 3hBINOCOCYSoc0HsFg+9uALjHLA8GjxUltdNlR4DC7t6q7dB9EKFLnItX5gkNilTwzL2KNjtsHZ
 0e6YAZu/iDhc75TYM/Bm4OIvzOFbNW2Jxk/AHnZg0kMkdhrQcIf/4/AkM3BqJTh3xUnjNFPcGzl
 xomKWnm/Qr8Fxx9l8Rj0GBhVkt/y6jqaCtb57vGlG/6uDZP1ZG2IqdZLs6GF2btrg0ZD3iFpxdj
 35vm3Zs+3gh+tgICS+Mbi0/s9riFa7T0gd9sbdPDH/82/OAZ5eP5j1JZ13Jzh7AG9Gp4TV2uUIO
 rZ8Rac/4PReMpLRMmVjV0PvQ4opA3K/HtUhpYvofUEHnMuMaj6nh9o68xTSvqimHep8VBopapH0
 gilsG4YLhv9wbl2zPRj9fNICATp1ZJWqklKjNnPEew3evOYcYEiq+uLi7YYZkamMZ+2xdUOrWWo
 FpaUv5e2eWQr27VqfSg==
X-Proofpoint-GUID: FPk31KQv_mXfWMC8Gb28kiuRbiYSBUV6
X-Authority-Analysis: v=2.4 cv=d6fFDxjE c=1 sm=1 tr=0 ts=69d91d73 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=L_GWj2w26O6mB9MJDZMA:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: FPk31KQv_mXfWMC8Gb28kiuRbiYSBUV6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100149

On Thu, Apr 09, 2026 at 01:51:36PM -0700, Vivek Aknurwar wrote:
> Add bindings documentation for TCSR clock controller on the
> Qualcomm Hawi SoC.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/clock/qcom,sm8550-tcsr.yaml      |  2 ++
>  include/dt-bindings/clock/qcom,hawi-tcsrcc.h             | 16 ++++++++++++++++
>  2 files changed, 18 insertions(+)

Reviewed-by: Mike Tipton <mike.tipton@oss.qualcomm.com>

Thanks,
Mike
