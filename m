Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DF13BD62C
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 13:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802784; cv=none; b=YFMKFcz5wNPtZdDnSeCLHAY/T6kYt+uNAuxF5nNXWLPri6YRPotk3KN8rH0mRUZQMM4SGr/s9uPsNSFDTbS0AMphLrB/GjQxMg4wU6fOXBYTuNUv609nbZyFyr9D5RTB5ReMEMKcmO7dvE1SWiGZiQpMfyFaYGJDuxWpy7rsCcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802784; c=relaxed/simple;
	bh=LKc7E4xyh/YipMFv9PN7qqgfG5S7nb//eEcppSYthyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=beAK8NI9vwhCw1PLSpMwqp4PswCYin1nS6shqdiZriaNAIu/Vn3Qv8JcJJrjPi4dJZFGNhl4GKYFjW/YaiXhjjStxidH5kfxhQLTLOInJL5uZjjSyPIxel/HwjzVpYz/BpkdF5ZXMNsaSNRxLB8T/IyGbQZMo7GkotvAX5Kb99c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CX67yvdg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=St1MLkVM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CX67yvdg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="St1MLkVM"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsZCs2496687
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 13:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HYokdGbi02H97EDVnPIo/4aG
	E6yDYmZQWikQTVVIxw4=; b=CX67yvdgBUDc3Y/9wVk5s2x9pcn2DJWoMO8MjsUb
	DNWtkyFvdmRVVrj6hKtEXsRCvR/U91g5gsw7uLkhsLNPOx1jQP9r8FocYh5K/1UE
	QMQ2u8W02Iip9JaZ5qDLqJrE5XhEO1dhQJmdaXSr3u5Y7rTPBOx+Akjo2w0AmEjX
	4GKLuJEP/eSdKWGNiwPlARIayE7euznBQIZ9m4JZvVCg038K+ZnU4PAFoQB0TLog
	Q3cBTQNmGoDTPKofS3WOlMWYgvqw7/p2p3ul/Zyv5pds53j0GccR1DcCO0EcpbfB
	3s7/K7jdX3jrvQETdnZYdmqtqvalPBRl1XlYmDbsqAbLDg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpyqmkhy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 13:39:18 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95fc8572552so15190135241.1
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 06:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779802757; x=1780407557; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HYokdGbi02H97EDVnPIo/4aGE6yDYmZQWikQTVVIxw4=;
        b=St1MLkVMfScLVtctRO/lWQWhSd3cfNUegXLFlmyE2mN1IvFMjoG/nioccz8aKqGg0y
         n+DGzC0MS0kvv9XE+AZ1zl7wN7aQPo+Hb8rxVnXKpORNyKZ//wjqhkq5WuhC1uFALYBs
         Mm5+hQn6q6kBpEJZk2xyaxbe50A+MQtWfGLcmJmWKyIawcsh/tTFrxwqRU4DjkE8PA1T
         8dk7b3y5n90uuKgvZuYNeTQKbQvQowFJfLkajlttJPqjZ1BCNpl2PEsUNW7DOHcoKA9E
         kgpN4fQXj7Zbjcbmp1YzjgvgZ729xkm+tgoNhMa3pLK83k5wilEX8qEqCSvf/3g+aPwK
         bHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779802757; x=1780407557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HYokdGbi02H97EDVnPIo/4aGE6yDYmZQWikQTVVIxw4=;
        b=SEa2ljbT05S7JB8tL8Dykbr8TPUp4jccIa5fu5Z1BkkXYSTV1WTatV6Ou1ZgxPnu7u
         3iBqXYDd8ZlKNi2G1xdukJwFvjaiPialQXdmJnJ7xg/CnUonDiVs8UdceCqOD3GKYp3B
         njbu2jhMazmi54sKwc8fRqqJbyQ+zEDJdupKOn4PG9RGEVWXc9BVaddc1J2Umgpjlkri
         dxTkjXqQsw/KuXsb6H3WHqT8LjA4RBZCTJIsH9rbnhn0jhhmrv24fJiGpsiFDIA1t9uy
         jMYZ2+OaMx01iRitH5TXzf4kp42Wg+uyLEMhOz4ccmZeGIVG1S3zSEdDf7sqRGux3XSG
         I9Qw==
X-Forwarded-Encrypted: i=1; AFNElJ/UMLAg1D5gvK+kHIflLzIt9d0KdN5JkIcF15ZRaXPJ6u7oyeBMvaSiLOTMP0Jtbd+WBBSN8cytnFW+@vger.kernel.org
X-Gm-Message-State: AOJu0Yw69xZp3vqilWIA4lWCFoOysmp2ZLXz1QmF7x4rr4tZKNb7MjXP
	J2EjfoBsZXImsHHjWoch6bFO39z9LlxwRNNld9YgDshi7/y/vYtV3B4A8TnezJevnjcOn6DXg53
	BKDyfINe6z5Mj4TlOU9aM/4vIrcJ+VKRWtGY3Bqv1wGHbOqO8HE8y7DsKwe62AfWn
X-Gm-Gg: Acq92OGaAGv5y5xCjjWcaYI1k+5052ZedFK16Mlz6fGdXmX5ix14CtVI5Vl/6NuCZnK
	LbKnNUTOS1q6PqRSX4Up2ls9SNEeqGCM3ztkaVUuLhN1EJ52NFH1Jx9oybosAaBO1OW3uX9GW6u
	j0hRFpX/MdvGS19Hg/fxPg0VRg3dS9pM9hf1JnnLIecLNO+r1y4atFizEu0Q80KpmkZWjogLhpC
	hKfDtNpeuDrFHWGiO9nW3CSWyxeAFEgLn1KB5SKg7NSsDNiUpEVReVnVTj+4mO3knFvNHcGaQpc
	RU6//OuDFEGZtLsbEIC3z88CNtpb55yH2eNo3UuRF9RFrA/5dmOunSWiu7DQ4F/MznwkfErLqjM
	xjielu595ZHExbfR57z6+kSMbfb9+rP51DKhrNKv5kocPMrSzqy9jLSqv1jPV5O2gFEjBvJCExT
	BBVxJQZBYoBT4EmfSlSCx9VQLTIH7v8gCcZQA=
X-Received: by 2002:a05:6102:b0c:b0:635:420c:9b00 with SMTP id ada2fe7eead31-67c7300c912mr9734160137.10.1779802757123;
        Tue, 26 May 2026 06:39:17 -0700 (PDT)
X-Received: by 2002:a05:6102:b0c:b0:635:420c:9b00 with SMTP id ada2fe7eead31-67c7300c912mr9734129137.10.1779802756554;
        Tue, 26 May 2026 06:39:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dca7bcddsm28672771fa.16.2026.05.26.06.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:39:15 -0700 (PDT)
Date: Tue, 26 May 2026 16:39:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: gcc-shikra: Add support for the USB3 DP
 PHY reset
Message-ID: <hxrwzxhsp7j325m4eqslcgprfzcake52kr7kbae25u2oxucfpe@urnoctzbiwos>
References: <20260526-shikra-gcc-usb-resets-v1-0-6d9e7fee2998@oss.qualcomm.com>
 <20260526-shikra-gcc-usb-resets-v1-2-6d9e7fee2998@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526-shikra-gcc-usb-resets-v1-2-6d9e7fee2998@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dtfrzVg4 c=1 sm=1 tr=0 ts=6a15a286 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=5L6ES0iTLAyjbOlHcnEA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: Pa0ph9eT_hKZsCmWqM1AwphUYJbS6qnw
X-Proofpoint-ORIG-GUID: Pa0ph9eT_hKZsCmWqM1AwphUYJbS6qnw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExOCBTYWx0ZWRfX5+34cAn1X1jL
 SqMYgICXookSW8Ydz25iDGdq/65IZ8yUHzKe1ndWQrVW+l5nBQcZtfEGT47hhQgdoljiGVhEdj/
 W7wwvA8eeP19XbCH3E/BaeVPnzniQscBJb1UKO8wgAVcZgDL0hvl4B2zgpHSOa4YEAclEomPSBf
 NMIpE5QFuV1n3fJq9yX3H3L98rl35Rnf29/+m3hcO1CxlmphGrFEGsRl8okgmxtb9S3zYnNqqcp
 uFZ0uyo5ig2OlYcsltfSlJTNxqAK5OBC4Z83nfTa8xMtN6dZUV7yWhBhC+fJsGzkENa5YF3n7cI
 CiV9ccL5AnPnyUw/B1P9BKqIIOvhm8Y0bqxfRF9amcQMCflRDz+/pDSooyMlPP9nbPqmDTB2fWa
 0OxYnA1gPa5aheIKEBgD0BkvsYdJpQvXkklAALg+dwMBe1u9hVf5T/rFB7Os/QN1EI6hq1oHBem
 4k9kJVuauKYqOqqzhHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260118

On Tue, May 26, 2026 at 06:24:45PM +0530, Imran Shaik wrote:
> Add GCC USB3 DP PHY reset support for Qualcomm Shikra SoC.

Why was it not a part of the original submission?

For the change itself:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-shikra.c | 1 +
>  1 file changed, 1 insertion(+)

-- 
With best wishes
Dmitry
