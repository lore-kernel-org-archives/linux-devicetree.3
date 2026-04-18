Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1FD2D7817
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 15:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776525278; cv=none; b=cArDyKB1srXLsqFhP5qQY7g+eycsDvpI4wMZdtbBvtbwzXnet6ZGQAQ77e0YYl6Jfw5PmNHOOeQJLxasgG/bGMnOP8w9llWGvDTTQUY+Y2cR5C9NsuchFQ2980cmosMcON0brfjDY3samdhcFMyPfHlZmbpmNVju03GVj8kjYZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776525278; c=relaxed/simple;
	bh=ccKJ5Wlot9t2jmuVxq+3O7dZPG8038XlN9RYAZJSGpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iyDy8zQ5NeHvyZCs0dbfzJMrKu8xjfnsb31PDJ5IZCXGXKfh5OjbvD27pZejukp1Iwp7zyW2YykKqNPKe+YuzP87h/yvxzIL+vNDbwlp2OVN0Bw7mHc8d3hkBoIJDw6kFZSvs6C4TtGL6/ibnxeyWUbKNKPzZzRUqsfzIB+GfXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hfu/CNcG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WLbNhG+l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hfu/CNcG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WLbNhG+l"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63I4UUjP032253
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 15:14:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sUHaxeF/EoZBdTjX6SV9pvQD
	/6uOcuvrjspwrrjEhLQ=; b=hfu/CNcG8qMSPvXDdLCq7+9ZYylx/XHQsf3t80gZ
	5cqyUDBShto4STCwIgr3zB9dOZ+Yc+qSfnps9NOSdQpnIHaq7Q72ShNe9pCJC8GG
	FFyCkezrxhOgJRO2B4Q+uXD5zG//k3VkRBK8EfBKNBSRtGzPmxL9JWsTIFpCCUBe
	ySzC27Hkx84F5eucX/zEzVJsa7sgGJiagUKkxry6ONvQ8gUA39EvzA7WsEcl0srQ
	3nYnUCLLN7KmykKU7gUzeulwJwuUgBe2yMwETpE2sb3zXvGQD/ih4N5kSa0TPhJl
	Z/xC6eReHnT2LYd05+PcnSNeZ+lN+s67PfBifP6z6xCFZQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm1hx12um-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 15:14:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e423a05c8so18858891cf.0
        for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 08:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776525274; x=1777130074; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sUHaxeF/EoZBdTjX6SV9pvQD/6uOcuvrjspwrrjEhLQ=;
        b=WLbNhG+lrl/AzVQBA8/PkoYceHJjDrxK8TzOxfYpondolXvOrV39DHcShcYcdO+IS5
         GZEi4TEkZAsBIm3JmkHuq0Ho77gzcukKMLl/MW3+xKu8uY9YUeouND9wGlD8CZ0OX1Ga
         /nAtqF6FjN0kDlHjrBD6benCNmEHf6/D7u8RS3+zVYpXKbKBxoBvstqYhzIVF6NoLD/h
         TTLpTD0ZW/X0xsgU72ru/qoGjIgX2pzdjywNp7W0IWp8zNpsR497sAlZoIHJgAPpMX8S
         X9cX9oxWLPwPfCF9WBgpi5I+JN8rV0WCsFmSn/ujP5mytHk2PPWdQoOszpjBx9jaMMpq
         VTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776525274; x=1777130074;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sUHaxeF/EoZBdTjX6SV9pvQD/6uOcuvrjspwrrjEhLQ=;
        b=BYn0+f/4IswTRa0S5gSZmTBW3y1j/QlW2Ehx3TtIi80Ev3SQK2tWXWHWNG80F+dYg8
         TUu/Mt7XPIchDSCNn/r76u5rL+Ne55ZXrrd33EPxzAeQZn1pa7m+ddgVFrh482XZ4DAh
         jANKV3XQEPs1dQBDDOgBuqYmT+htIww7P9YHqTq0d2ABJms0ueWpQYFlgltQu/g1zhq+
         BfEP5LP3lSltCCdX87psiZxdhsceI54kMjOrx50jyQYqgXFCAvkmCkI0G6XvYS6IKod/
         BgtHqvTN7XO+A5K04whp/DK4etQOiQmSSm/czItrmkss4Y/6gxsVzY7xnwXmkk0wv+Mh
         MY9g==
X-Forwarded-Encrypted: i=1; AFNElJ+lzyE7W9BKXzpfqu9ve07vlaTx7KI4xzJMvEhJdtpiVirpV+VNT+V/aE+ebTXsGcH+ymO/WVVzndl0@vger.kernel.org
X-Gm-Message-State: AOJu0YyocRAAOfSZ0n9A7onigyc2vdPoN0UBwkJEJEqKftr4Pz8XGOxM
	HYNeNU4YpWpNH7LBRetSgoYefMOW+uQic2Lb7qFn+2I7ryIK8vyDlf7H/WjUZOwdVwccfE8EHIZ
	vck7LYCTZEWnlvrVWHzaMHhPepyMcc/z5xZRyjJ7gLxqoOqGgOjIauZYVWD1QJu6I
X-Gm-Gg: AeBDietk5291349XQSYScgkEjK5AsezeS9jV7ehcmklZtWCB00GlElc1gI7JWTsZF+r
	cLIP8DFcpfCIekHKEo/wemNmnRavVkQSxIMhMsdcXgK9wZSUTg5CmbMj9ync/axDvQxXpvuLgTb
	kfBDs4yz+xIlRozyjFydasBEqS3OIbqShbeG1cpPg/Wh9CpO7S7iUoeSpGPNjkxBAFZ0JxZAOZ6
	Urfts7b99tQ+6ZYoUuZbfQveUlYpHs/pD2MGbqaFuMrlRT8AX8tOcF2UauFw7bLktqM9NSf48di
	n0vikdoT3LtY8c/zWyIfOqO35bTlufYmzxactDRP0Jg8iqQIqc6kxlmJ3gHNHeInXqZehfpqqG5
	3S1QWCyqhTn7U6vPSiE9AiFcV5EgqsvUO99voNmACMyyak5rdKegTe7+pBx3KjdcCF9UlSTGetF
	asdBBKYO+Vz6HRui7ABMRZuUPkxCK2CgRpMPRQyLgtqcOmlQ==
X-Received: by 2002:ac8:7f55:0:b0:50d:7632:ddb2 with SMTP id d75a77b69052e-50e3664b47amr91940681cf.12.1776525274152;
        Sat, 18 Apr 2026 08:14:34 -0700 (PDT)
X-Received: by 2002:ac8:7f55:0:b0:50d:7632:ddb2 with SMTP id d75a77b69052e-50e3664b47amr91940301cf.12.1776525273749;
        Sat, 18 Apr 2026 08:14:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e10f9sm1414116e87.46.2026.04.18.08.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 08:14:31 -0700 (PDT)
Date: Sat, 18 Apr 2026 18:14:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: ekansh.gupta@oss.qualcomm.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: add audio PD remote heap region
Message-ID: <oqms2nkplvvowefxqw63payl4ti5qffn4koop3ihpniqqk43zv@kkvzw6o3djhb>
References: <20260418-hamoaaudio-v1-1-a92866f744a6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260418-hamoaaudio-v1-1-a92866f744a6@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: alXv1zmO87hWiTaWjCEcQZaUoef_5Tb0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDE1MSBTYWx0ZWRfXwgr+eYDmYDvf
 WjFsytcUogmN+sj2vv0z5WpDE41gVfgGfDgXOsS3c0gTiLyF42STsLW45kwBw3ktpoUEUnMWqeW
 idYMP7O3PtB92vbsRY3Kx8znIiSVH8j9IwQbcepx6A2zrj3cLZQLq8DyQrw/FM6cN6f3wSpG8VN
 qLJJRVbE93+HJVFHiM/1qnsfX2Cn+OR4pdr9HZIvbJhpf36nl/2Hzcs5ntiZ4xbSwTrw9n45FF9
 8fYRRnaxcsS6yzrFTWw6u2f50MhOXwpyJNm4B1i42MR1T/A1PQTt54iheIaYPrDSIoOYCVSiE7o
 BnqTH1+I622XUwjAmXQhXM0JEZ5sT3xRgyQLbHLzG4kAoU2Jvju+/OJIlU4Mn6kRdEh21UPB4sV
 ZFN3L6VvrS8jQYYPYqGdJdoZE8qZ1Wruj2EYoQTpvgJrQ7ua6AgY7DnAYz7+R6ynMvn+U0C2feP
 9nrNgVzwNQ02IeBCrqg==
X-Proofpoint-GUID: alXv1zmO87hWiTaWjCEcQZaUoef_5Tb0
X-Authority-Analysis: v=2.4 cv=RoX16imK c=1 sm=1 tr=0 ts=69e39fda cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=tm-kgbyTeofr2Hl3MgoA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_04,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604180151

On Sat, Apr 18, 2026 at 11:38:15AM +0530, Ekansh Gupta via B4 Relay wrote:
> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> Reference the reserved memory region for audio PD dynamic loading
> and remote heap requirements. Add the required VMID list for memory
> ownership transfers.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry
