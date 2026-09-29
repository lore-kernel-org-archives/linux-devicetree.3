Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20F03D3D00
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790665079; cv=none; b=DR+j8j/QzgbtmJ+mH3s19HBF8g4AcXxpRrnlkH1G/9zKV5GZeGIhOkrA4PlMcvEYKqb9FVIHSnN12yjW8cfVzF/BuHKYm4M63a/xiIXLH4vzVWqCC9Z+ZpF1+IUTFgxFx4JIfpXS171cqKkYd6LIOYV60ePDSCDfXNtQTd6UfT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790665079; c=relaxed/simple;
	bh=xhwVxfB07XPEgYR21geJ9/caheAwF8RaNX/1vDisvgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qkbmqDmlbPh67lUXx5r8oXvGgTZcPSZJ65wq23QmnyEYeHiCKgoUYKn2r0iCvhcHM5BIh2h+ZDh7i/CEXOeRbgrLIQS86hsRT6zrMkeOTK10nE4pXQHqcutkHbVsd2a4dxgMJ9Yj96NfRr0/OL0VxsAZAnnFHmHJzjy+h7oWHK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wy+hE6+I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R60XoDCZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wy+hE6+I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R60XoDCZ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T6oxD8054295
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:57:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KdlFhgFOCr2Hd9m/lrgDib1GI4AIWOWUGzDTlerfKzc=; b=Wy+hE6+IAuyX4sHz
	LutrJ9cjK+RRoSM+xlNKi+JALg1EGkmDrAmgvjmNl9vxdrLAjnXfXCUk67Buu6hM
	eY2aBTbGZ2uU2AVCpL7hp7cNIjPmUtlUHLpqfNLh5RhknjoOtC6RjHdztgEWi/rW
	HIN+fI3U2ZMD2Livgbc5NmXhQEVIgg44PZ5ZiQ0dvHfZGtMW/XBsLgWZ//SSaA7V
	ygeVhbskcMYw9cChNajyEcCXCEf5d3p57tSYcf9d9NzQ9D+XUDaoaLoJH799Zu+j
	vZBdq+sD3C4FORHASs43+XX3/gflYoMtd3BCRTCjId/8ZT8QA5gppmuPjE4a1FMH
	rAxUyA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h08e0g10b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:57:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2df5a65671eso6801025ad.1
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 23:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790665077; x=1791269877; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KdlFhgFOCr2Hd9m/lrgDib1GI4AIWOWUGzDTlerfKzc=;
        b=R60XoDCZMbFTAiJ9t/HlxOKHQTseYJzgKl5YPp9sjInGDOwLGKruSiIpAW0X9024Tt
         2LRfUU4weZOQC+NUFDzu1/P5cIr9khUHR7MWlqUtHMQy4KOsCJ4ioH/owYdg337hOfD3
         QIDxOBUJeYt67b+TglnUtoW3KWe51Qsd9RfUgPKT0XJGi4Vi1m5rm2C72xJhIuo24eBl
         NUJ2Gdo0F1iNMYHRmc8N2fyuDJeuvIZOTvUQOe+CSc7Pj/qPqdWaOyO7hVohygnc3KHT
         NbzmJ4RJKw4kizmoMoWStngDXnI2TJHy6BaBDi99KAoydZFFA1N7denEahdy+SvMbZR9
         cOQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790665077; x=1791269877;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KdlFhgFOCr2Hd9m/lrgDib1GI4AIWOWUGzDTlerfKzc=;
        b=DZkgWoHqs/fAZJ2IQIrx5fiRcXamvoQrw6EPzG442W3yWvll0BryjnsqOlaH0s4jLK
         cHDkLdidcCaoQj7m1rzGYwrqVZAjQUXD7M2XbmS+sRPE+EKcfJkyG/cw/RiaYcdYbGbN
         8bv2cohqVAZNos44gQkddTCASugNTohPQ/UL6V/KftAqvNolG58nrxi1gbB5+IaaXiZt
         k23WdmipjaVRzBffj16gF45oo0BHlD/RCCKHIJc5vRxdoml7osmVPoSUkE4jOF+pcF7e
         Xfedn0Ssmn0mg89MsTvfjZDlWgEWjS231nJOOUIQvj5txTcbfBa1JCyOrtAcs6rEsqgo
         qIhg==
X-Forwarded-Encrypted: i=1; AKwUvBwSogLYLXgldlF+nGh/XW4h8tT7Bb1I2rAqSxu569eCYtyQffSyXojS8ZMclaQaYF3M/sC2ETur9lwQ@vger.kernel.org
X-Gm-Message-State: AFq9FYIF2qRXb+/fjfpYT8puRZfPcchXEqBtl9TEiNUzURLRYhkYmvpr
	leftYU10KDUlRb0lzOHAo4LaCFat9U0lw9+TrtFK9CczLqvNDzQnb/Ad3ExgCaKnAL56iRAlmlD
	2bWxW+/v36WlGPyGFAKiw1qFCHy5dOhM7Rk23uOkV5/ctNbDUx+hbeG5+OGTa0K85rX6mbJpg
X-Gm-Gg: AYBFou1ujcJbSQo2B/DT/+0mq5KnRbpBaMoSVtX/eJ0/pjBFO0b4VfJMGobDAcRPTrl
	Mquzt3+HGtHXlTBE71fEQeSAwofmuWeeVqH01LkGpXn7wAS2eq8HFEQLXL7fmzRx4wcaq4ILS3a
	kHt8rIoAXrAmLAp8rhyd1hSu7hvLYvCoT65Y8aQO1XQfupk4NzRGVtCBJBycPyGDaxGk98REyER
	E1eZSmkgisnDbQ6A1tZAfYXDpcXhtGWhD26HX2be84RiBDbGh2mPBHKR4bl3R6bE/3V6Ke5IJCl
	v98Sm/op9YNA18a6EvOMYgT3X14HYLuA+20NLh0ydwzQvhJe3noEAYoQByywipFwc5XIJYZiAdn
	FqVyKgUI90QYLtJup9dXYaZb8seYMiI30zmzoEI6zDh9UE8BcGkD+bbS1TwRLJ8fYRBCLPCfpS0
	ZzG6auPSESmQ5r
X-Received: by 2002:a17:903:b06:b0:2df:8ad8:dc5d with SMTP id d9443c01a7336-2e2c534ff3cmr9677135ad.12.1790665076635;
        Mon, 28 Sep 2026 23:57:56 -0700 (PDT)
X-Received: by 2002:a17:903:b06:b0:2df:8ad8:dc5d with SMTP id d9443c01a7336-2e2c534ff3cmr9677025ad.12.1790665076175;
        Mon, 28 Sep 2026 23:57:56 -0700 (PDT)
Received: from [10.79.116.124] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9141a58dsm50918405ad.42.2026.09.28.23.57.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 23:57:55 -0700 (PDT)
Message-ID: <3b6a8f8e-b014-4165-bfa2-92126bb2f7bc@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:27:50 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH 0/2] arm64: dts: qcom: Add EC support for Purwa
 IOT EVK
To: Bjorn Andersson <andersson@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260629-ec_support_for_purwa_evk-v1-0-e082b70138d6@oss.qualcomm.com>
 <179020199814.520949.2112926853306939366.b4-ty@kernel.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <179020199814.520949.2112926853306939366.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyNyBTYWx0ZWRfX2GV53W2GMJyk
 7+jEdQOJvy2G/X9xK3tX/3PLfGbHwR0D4R9cuc3wgMcwmaU6+pTWZ5rH7+wYXV3MchYTqa484Kj
 nApbOZmmjquz54KBZMw5trVqDuJdX54=
X-Proofpoint-ORIG-GUID: uT0OWHwsM9x66Cj27kljS8DLAP8jaLRc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyNyBTYWx0ZWRfX7PnaTvNrmoD8
 k0YNR6ayq1l/U0MOpzSaoy7ll9pHqG8YKTw4kDuW4VROuuSLoLYqiYgEVN9MAkqJqPmXENHOYev
 l6HaApnGlEL+H+4/RcaQW5wmp3kfjo77TmoHVB/Xl7yHzfR01zl7NYtW2hRLgT+gtIL2GJQWsfL
 k89R8WqKmkezXcC28BXCqUIwT6GhitUASvV0NOchssRPIFLL7k3joRhIT0Iq62geL48nvWe5+2I
 x20pSBviZYavH8wFID88p81hDI60LDVRjORyUzfhePHhTVIqZyw5/nxNZTi6w7qOcJjCifgnib5
 14LpXFBFmmYHg19nUipBNrXKmetb6jS/z9BzAH1s1Bwp5nayXJ2PtSlun/YxWwe97q6sFak6IcS
 TYcr2XNOnc5oasJejVY5hRgPRWkiEpCKTJFN5trNcxjVAYRx6yf4ekAZysvP77lnQBtcFE68x4o
 9ljOKWjsr1E3xbEDL6A==
X-Authority-Analysis: v=2.4 cv=WJ7qzXsR c=1 sm=1 tr=0 ts=6abb6175 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=hSG9Uez6MuwPyxXb6SAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: uT0OWHwsM9x66Cj27kljS8DLAP8jaLRc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290027



On 9/24/2026 3:49 AM, Bjorn Andersson wrote:
> Applied, thanks!
> 
> [1/2] dt-bindings: embedded-controller: qcom,hamoa-crd-ec: Add Purwa IOT EVK
>       commit: 9d1a720973d0f16e0f93b658f82c45033b61a02a
> 
> Best regards,
> -- Bjorn Andersson <andersson@kernel.org>

Thanks. Could you also merge the corresponding DTS changes for the Purwa
IOT EVK?

-- 
Best Regards,
Anvesh

