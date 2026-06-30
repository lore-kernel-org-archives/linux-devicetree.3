Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC64391E57
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782812701; cv=none; b=t8qH76ylv4KIr3L5RTB4hIdqGyhns5obICeacyWz1NlPKtX8jUQalzZ2LtFJ9beThKQUhHRKD7DlN1RJbiT/xzCkS/I1zqJtH+F9KfdctcdmKBdEKKBa6HeDnTSvDnPSDEhg9nJS/RBm1BWpCiKzJ8s3yivhV115kqwTpZvOAdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782812701; c=relaxed/simple;
	bh=g0bwnkfjqua0BPRSrDs/04aENM72fakz0OA3XwfOguA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tfu1nPqwr/xXa+NY4G2N1MydwinHd69OTN/ueRMCee51llIc36/rKiHsC0hwCrGReM50IKkwmW5FGTZGHrEW5c73A+tDTEYKOpbZgxhBfZlaVV2HqM4s6KUCs3hXbQS9gah2i4wCN5WYUBfPNShjBVxlBXfvcNNAOTpjPDgz7yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QnzdUU0v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KTt5yVJJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QnzdUU0v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KTt5yVJJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CU721030775
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OmHd1gUsOdvVOeUfz+Z8qzj/dKzvA9ZIbLccHseWvGY=; b=QnzdUU0v0bgPlm1y
	TxvCC5Ine/XNo+MjxkoX8zAmyT3R/v6BIAq7bJ7dcwxJtf635Xf+IwWjFSHlHOZO
	WRQ8S86/zweNAmJhE2AtkpuA1XQ75RZ4jpZfNsar0pVxa7iK9rOYCvJVU46TzZdw
	r0Y6qrwb95XgUFBGrk6YaZrPHJDsWrSTtCghekQ61/ydQx61k5iyFc/xWc2g+J70
	gIWmvebyHm6cewy8U8A6tSJyM0GikMim68Rl40YPyl5PNH1DuZ0suw2AL5bZc6kJ
	NheJU3DclE416fEVHlD4SgB/v9QIRdsM2VYv4uJGNK8txh6UMcNvNAnx0tugmCtX
	VTnNng==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f44wp1qfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:44:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ca1f16e391so8846795ad.2
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 02:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782812699; x=1783417499; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OmHd1gUsOdvVOeUfz+Z8qzj/dKzvA9ZIbLccHseWvGY=;
        b=KTt5yVJJF/DJ6UJYTJJHkU0dr/H/txK82pXfqlS9/kapnzSUbTKoOX/YohoHT7JDgj
         pykJMgdVXSM3VuZ1I72H3dSf0USiy/r+zpzMOg95J9TIhstb9Yf8YnE8A5u/WgK5gbmL
         hnwdeWYbr1dAXlTVGtoMQpZoIcf5ATHPgiNKVutBc8rpWfAhYz+YKAD5pV2OoBhaworv
         LOV3CQwyxfYNZeCBtJ+lZQaocJoLJmRQn/Ro93z88jn1QuariGhBABhE8W9ZGUHXQ/FX
         Y8wOamSWCURhqxcOsMcecjmamYLBx1CQbk1akO2EOoEorSngSx8+rqksp0WqJhfoYlk5
         ov4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782812699; x=1783417499;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OmHd1gUsOdvVOeUfz+Z8qzj/dKzvA9ZIbLccHseWvGY=;
        b=Cc+1rwBH24bAOYE/1YOcfOb7ainxcSBeHh5p/1yxvmdFRlIB7OgODYP+WpD9fZyoql
         iBI+aq6iqLlk5u6Kid/P3Pix+Guk8wTuj3mwGBqotLQtkxivHNUx601Fmair9gJ9ByFS
         c4UP3qhywzPbJCsVDksdtbFTg4YR8z/h+vfChetYMqiDB8+lmQhpRTQSS8KSLnT/DSfH
         qR+8lhLx/iY2szOwrLdbRnLnFyBnDNsd1Ce1nh27gwgXYqMV5/jNOr9G0kKq7M1s7skz
         8f2GE8b5xc9WPatAI/ZLY2umPlC71zJe2JVcpAMViUpEKrWqPnFuDZ7Fowk7GGpi/woi
         ExrQ==
X-Forwarded-Encrypted: i=1; AHgh+RoFZPamPYQtmK1KTkcRYETpKGlTyv7dvN7Gku+UKVDzmPPHN89hGgInRgT5P72dyE6oy0VpQms69QHw@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3qNP5WR8fes/zrtfCygoZvZk3E/c9OudpdqAGqVvq/dJHowRb
	38Y6yDy1ff5aRYx8uMUSpaR0GQZ4TCN0GchdcQ/yci6pUmRTvlhD+7bFeGumY4w+Hiwggkns429
	/8cLqTddEoWkZ14+We/sxpBbUujGqQ56xBG2ECHfeHr6poDogWE/HJZFrDKY9+2kczQpH7WBB
X-Gm-Gg: AfdE7cl5R6bKbBsSNaggK20DEEwKqggh+Ad0cchtplzp4bmnY8oD4LDwCiVGEG9Rfwx
	n2E+amar2B3xlgPoyeEHtNuhVUp/gkpbV9Z0rWZ64l9RHP+TntdjEZAsIxtrnnIyAYKBGIIemiR
	X+4Kh3Ez0+cc92Tic+Nqx9SrRAoN13kWQIABzNq/NnKhxePsTf0BWaHFQM4/+7pxK9mIM3ws9YV
	7FMmwuXD6g9XuJEl2NJXpjdlmz3MRt8Cv2E53eHzDeqjk/McUSN4q/cMhRqC2HfDVRHRsq7nywN
	8RnNSoxFr5Mo/5YqZwoXkkcOGG6uy+psH/+dT6skYkl6gIf009asF1Gu9oSnf/+L490KeqDSoI5
	oN0oM75RbezdpeOIpvFSLNdEc0wnREpFsMsI4QjBvtg==
X-Received: by 2002:a17:903:1c1:b0:2ca:6c8:abd8 with SMTP id d9443c01a7336-2ca2d52b171mr21136625ad.12.1782812698891;
        Tue, 30 Jun 2026 02:44:58 -0700 (PDT)
X-Received: by 2002:a17:903:1c1:b0:2ca:6c8:abd8 with SMTP id d9443c01a7336-2ca2d52b171mr21136375ad.12.1782812698353;
        Tue, 30 Jun 2026 02:44:58 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382c275asm9651145ad.76.2026.06.30.02.44.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 02:44:57 -0700 (PDT)
Message-ID: <c23d8b10-8234-49d0-84a9-12bf505a1595@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 15:14:54 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] arm64: dts: qcom: kodiak: enable inline crypto
 engine for SDHC
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260629-ice_emmc_support-v8-0-1a26e1717b85@oss.qualcomm.com>
 <20260629-ice_emmc_support-v8-2-1a26e1717b85@oss.qualcomm.com>
 <20260629075921.77EB31F000E9@smtp.kernel.org>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260629075921.77EB31F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _RxdLOQckoHjDy_M8D_0wjie47NuqK1D
X-Authority-Analysis: v=2.4 cv=AtDeGu9P c=1 sm=1 tr=0 ts=6a43901b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=3fPoCKn5AjDgPW2h3HgA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: _RxdLOQckoHjDy_M8D_0wjie47NuqK1D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA4NyBTYWx0ZWRfX8B1b3+gBW2+7
 9LqZM/M1kduRTEr+l6KIIA60fbzDSp6ZJ5T+3PQOVCjuRJwttWfGBtIIAmvjT3RwV+0j0iVxcc7
 iT9x/pQfrvf8quLbilCHiZVJ1w27N/INN2HOCjhCN/+am2RG79u1sJ9cmM/Xb6N2i8VSMZRGSCQ
 c++LPcOi63TXor9Lo0jWNnF0VIzwvWqMugixzfbL6868xcGQMiDT1O5AREzE2pUHPdSBSPoPJnA
 Yryvj1H6esHwUnDGhiXHMyzJnTFSTh8YK7HU+8C4O+JmN54b4RXKcMqmiKrLJMpVaiB3cKJ+nYC
 bKSOGaAfiC3foYQjDezBe1UNnkvePBsvftNDz1uqilx0IYEu8u/jsVz7CikWiVHAjpZw8Vhoqm3
 BxGwk4q3nZXEa3DeuyL+g6bGWdZOi2n/Hq+HMoKEyb7CZ+ABE4lSxspuxWW7g7uWZjXGSHAYA4x
 mH1Tof/I4QxKd3gkZBA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA4NyBTYWx0ZWRfX43qJngun0fYW
 1xRoLHjD5g7ZeNtP76U/YbQ0u/BvrADK+zPuPAhPP6Zljb8Yu8/G6rpWpU3xdZAielT/hyWYlUP
 nLuyyOh1jkvd2NM0/Uk2jOM3if4/q10=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300087

> [Severity: High]
> This is a pre-existing issue, but does adding the power-domains property here
> permanently prevent the SC7280_CX domain from suspending?
> 
> The genpd framework automatically powers on the SC7280_CX domain during the
> qcom-ice driver's probe sequence. However, the qcom-ice driver in
> drivers/soc/qcom/ice.c lacks pm_runtime support.
> 
> Without a call to pm_runtime_enable(), the device's disable_depth remains 1,
> causing pm_runtime_suspended() to unconditionally return false. When
> genpd_power_off() evaluates the domain's state to determine if it can be
> suspended, it sees the qcom-ice device as active and aborts the power-off
> sequence.
> 
> Could this keep the domain active indefinitely and prevent the SoC from
> entering deep sleep states like CX retention or power collapse?

The error reported seems legit.
Adding power-domains property but not implementing pm_runtime ops will
eventually avoid going to power down.
I cross-checked genpd behavior on pakala and observed erroneous behavior.
root@qcom-armv8a:~# cat /sys/kernel/debug/pm_genpd/pm_genpd_summary |
grep -A 10 "ufs_phy"
gcc_ufs_phy_gdsc                on                              0
    1d88000.crypto             unsupported                      0    SW
    1d84000.ufs                suspended                        0    SW

The fix will be needed in driver and is generic across all platforms
with ufs and sdhc storage.
I will send fix separately for this and not in this series.
-- 
Regards
Kuldeep

