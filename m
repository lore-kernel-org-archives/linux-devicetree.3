Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918A736494A
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 15:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776873365; cv=none; b=vFaIDxdYLGEPH0rJZWGzu0M7hxwVA1dOTmWaMN9GPe/tJ1QdjNW2stzTAsVM8OugHU+ibFicFUsAHoBTwcEFjuLoKHISonIgi4hjQlmSCZC1nGwVGlsQq0oys1gI01+TrCZ6EukEtGZ3Iypip8jARQ91n1Bx8jJ3Skhss6fN+PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776873365; c=relaxed/simple;
	bh=0a1b9eeFZMt+GbcDWk5KOnb2FyE8htEnTFk5bhgpdJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=stZh84XWBLR3hr3fciZ6W9DlLUlFY2JQVa9PWgmkous18qbbdhivCYTW6i+kf9XtOnuXFLs6ctHVbRjhBP1l3wKX319fLMLT0Ayusf7PsTITQ0n/tyiXORZEP5UP3UgcvVPXfv2gPRASMR5tlaC84PqJ5NQIymZ6ZwIVR7nNcAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BqiNL9cm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j2wQdzlh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BqiNL9cm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j2wQdzlh"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MFDLXL664127
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 15:56:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8hWW67tRHxFWldnzfNq5SSX7y8QvlrlvBDHEbCEp9aU=; b=BqiNL9cmzJbIV5Uo
	LlDoap9oUKVneQYVXAZ5nlh7bGJNc0rS9/KXj3ev9uSJHFqV90N1mw+tajvWMVdR
	cacIaH4tPrCRNR2BXYFMHym9cwSpOj8VW3Pu5coTj6kIxVttJMU6Lx5n6BbpgfNl
	ih/T1YCPsPKsvX6kqAKBG9oNzlBtf9vekYeFctY6csAGukGr656F9bMZ0NhKl1jP
	8NMY9hmpFjcwRxIBrTV4pa7VEkPIbhlBgi6lDkfomR58eh+pDy2FJqD3yIz/3jUk
	dDWmh9/jeK6j/MyhgjQXCSrwjw+EZqiVIFanY0KGBO3/6lBrN1GCXjnP8SRqulrl
	mk2QeA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpudgsg02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 15:56:03 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-61002acc895so3357602137.1
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 08:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776873362; x=1777478162; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8hWW67tRHxFWldnzfNq5SSX7y8QvlrlvBDHEbCEp9aU=;
        b=j2wQdzlhqawz2gwsahlW/Uem79hzXfOedPwA2vHnCmmz6F+7MIKmJgdbUiqo3jGsWK
         a0C7se+CK3r0NlgA9CQlW2rCMjkYXPWwQnsunMKTa4iqAHHBoVTRkAZGwbEhS0efn1UE
         nmZSkyJVrSKxOFrKWmuJ1/o30DxWumC8q0jxsV+FPGL1BCPW0DBCqSIwR/FZVuInn+1J
         CHgBqsoVss/+Qoxsh+4zDRdyZmsD7MLK7VcoHCUV2f4o+NqyGqkiLDRILxKC5D+VVE21
         IR9YtbWANpsb43p7k3O0JkGN7ubImh7nnhtKo9Lbq5V6FxNS89Y9NK+Ue5XC+jrlFpgp
         DBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776873362; x=1777478162;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8hWW67tRHxFWldnzfNq5SSX7y8QvlrlvBDHEbCEp9aU=;
        b=NaRsIhZ1vcvF8pI4y4akt9WdZGMVfZo3y0hmjxAR049Ju5zkMP4HZXY2xgIxmnzm6O
         85evURiaRxLqJ8siimIs7cwr1N3/MXJ+xsyelwln5a9mUP3goJy+tBTuc01QpVMpatS6
         BoskE2rxFkbo8m4ipyn1z4xDOF0YyJ8gtP3DbtToIav1n/lgN+s+jAn27ae/SxjAT9aG
         KPr1MBjMmVoLMBX7x5j4QVlzjRsQ4zl912uQiuueaTG3GVC3IqvwjWDi9vt8/1i0oQRU
         r1jDT7LII4k2tvRq6MhCu3I4/bNSxSrERIZKPXOoSXpJKzUqSQ65DSzAcFtK6wzmjQsR
         NBeg==
X-Forwarded-Encrypted: i=1; AFNElJ/tmcIHjAn+zWzOJkNKtkxkVgVxSJbTF638DXKHJCPmkSrzGC4288VXARsAMZjUD3Hk5xyawENXCjRi@vger.kernel.org
X-Gm-Message-State: AOJu0YwPJjGmr/Ygsazm55TVcLxmQvbz2Pwo91Qzt0LFWLty8FkpeXv/
	fBXMVee1vFYon64rJUwfmvwEoKPrQPPpCZ05higJkwaAd9QHlgs9EXrXsY7hiH372HhiRpnUelk
	7fm/OiIOIJrUnoSOHGgt1DTdbEXigqPtKn5kaZqEV/kcm3mRAz3kEGFaddtQwtsER
X-Gm-Gg: AeBDievb7p1AnjGWlvShLLXydxzCRdheeRYaZ2YZB5Lojr4a8ebxgTHJhKDioloKbIW
	mYnug+/s3xZdq+0wil6J6cZLcF3SsijmoTrukQUZCyb5yhNW/YLIax/V3Na7q9vj/saznjgsbah
	uoJJmQXyA/334SHW3YnEjLLTzY0ALUj2wF89dtm46n/+pMTIRn3WOPhgVSU2xCgaZQn2FLAJFmQ
	hnbQepFGImfp/ZOysVCjgF46SvvT50dYBMS7P/hKJsOhZAMHKgkKVLKp/B31lMIF8dKVNaxs52G
	Vuhfhu/vGYiiwrnPxRryNHYcez6ZMugKWbBkOvg9JY6rIMu4dcW7vbKaggGV03Xy+r2fm7D8w43
	fdh8KBHsHmOXyMknNcdSHEY33xnjUcY+oNuHGoZaPnPQwEYh+CsXdRbWWV+ICZIRDXphdbvPhfT
	yKx0ExhZXwVUD1kBMZ0mgg7z4SN1OHDOIxSHnN8oJm3Izb6g==
X-Received: by 2002:a05:6102:3e26:b0:608:2acf:cd19 with SMTP id ada2fe7eead31-616f70eb1c9mr10725116137.22.1776873362441;
        Wed, 22 Apr 2026 08:56:02 -0700 (PDT)
X-Received: by 2002:a05:6102:3e26:b0:608:2acf:cd19 with SMTP id ada2fe7eead31-616f70eb1c9mr10725079137.22.1776873361954;
        Wed, 22 Apr 2026 08:56:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a418376d0asm4558989e87.0.2026.04.22.08.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 08:56:00 -0700 (PDT)
Date: Wed, 22 Apr 2026 18:55:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/2] arm64: dts: qcom: lemans-evk: Enable secondary
 USB controller in host mode
Message-ID: <4axoaocjfkok3aktflnzb6tscv654j2b7uc2twvnnaf25i6drc@gomr5g5bcacp>
References: <20260406110113.1709886-1-swati.agarwal@oss.qualcomm.com>
 <20260406110113.1709886-3-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260406110113.1709886-3-swati.agarwal@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: rLfrJGXDYn9IjGReiQW6Hfb3Uf0_8aRV
X-Authority-Analysis: v=2.4 cv=c5ibhx9l c=1 sm=1 tr=0 ts=69e8ef93 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=B4TDdkv_pgXWvdOZbIgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: rLfrJGXDYn9IjGReiQW6Hfb3Uf0_8aRV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE1NSBTYWx0ZWRfX2ZMb4pMFmdNq
 aELHExbxXrMrRLQEJPOO0G8DIkcXH6N8YJzETk4NE4h1vp+8E3XxKU8L8w2lx4KN3VGuU9PnU9Z
 1xnywxEWHpjSZa4rw19lI2uqgZmM5Dgcij/74+ndkNcm6OPfz6+B4ztROzcqp6X4ydpVknbzfpx
 tzJaund+hlls5XcGKLAfvRgUJKChsJIp9EcwO3jtC14coD9zfU6fKKDnYoT5v1KmVc2vNG+hWs7
 d6yM1xtM0X5oryfpHf/MoJtBxfzOdffFm19TWhmwhfHnft9dkgGD36MXZT02DhHJ42El9U3m6Yr
 HtGRThIqf3IqxQC6od+HixJym0TRPuZ8imEgWAzIuYraXgCFV6uKZTt+hWz1aJBZuocVx9jLYp+
 i/gPXP3HD68wNvhOxwjZIll4BXJGJKe5oEiZ7Rio6dJXou5351ejdTXKM/cFMwV1b+i4Bx5N5zg
 GCp8fn7+fWv5tTKUPWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220155

On Mon, Apr 06, 2026 at 04:31:13PM +0530, Swati Agarwal wrote:
> Enable secondary USB controller in host mode on lemans EVK Platform.
> 
> Secondary USB controller is connected to a Genesys Logic USB HUB GL3590
> having 4 ports. The ports of hub that are present on lemans EVK standalone
> board are used as follows:-
> 1) port-1 is connected to HD3SS3220 Type-C port controller.
> 2) port-4 is used for the M.2 E key on corekit. Standard core kit uses UART
> for Bluetooth. This port is to be used only if user optionally replaces the
> WiFi card with the NFA765 chip which uses USB for Bluetooth.
> 
> Remaining 2 ports will become functional when the interface plus mezzanine
> board is stacked on top of corekit:
> 
> 3) port-2 is connected to another hub which is present on the mezz through
> which 4 type-A ports are connected.
> 4) port-3 is used for the M.2 B key for a 5G card when the mezz is
> connected.
> 
> Secondary USB Controller
>           ↓
> GL3590 USB Hub (4 ports)
>     |
>     |-- Port 1 → HD3SS3220 Type‑C Port Controller → USB‑C Connector
>     |
>     |-- Port 2 → Mezzanine USB Hub (when mezz attached)
>     |
>     |-- Port 3 → M.2 B‑Key Slot (when mezz attached)
>     |
>     |-- Port 4 → M.2 E‑Key Slot
>                          (Default: BT via UART;
>                           USB only if NFA765 module is installed)
> 
> Mark the second USB controller as host only capable and add the HD3SS3220
> Type-C port controller along with Type-C connector for controlling vbus
> supply.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 168 ++++++++++++++++++++++++
>  1 file changed, 168 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
