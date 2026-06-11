Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6254A3E7BC3
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177856; cv=none; b=SjlEHtiuC1GxD7SybVYxEKcKSnXabh4/DCWr32j6pCRNq3rcEWubHm+DFTeNZdtHONQiczB7IjMN8+ZMA5Pe1OPfau0MwbTzocVwygxNUXHh6c9N7xVuPciC2Osn1EW4ZtlNnqDAb3vFT8aDGTwiISG+75vKZd6AHkmsXNsRIII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177856; c=relaxed/simple;
	bh=6U2EpQbl70iTBwLkHktdUzi2+kfxjlaFpz2VtqrjLCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f96i2b5kDqHCVppFvYkeWE7HB0piDmt+2hFmwW6gtjkTke7dPydjaix46HcVgvLNlwZbMSrvM0OkXVodnx2zZChYLh3WELzLk1JUVv1gwgauiW8MtR7wzNQHwXke/5ozvb+JDVcAcTkAWvsOWBBr5zEJ4o+hrzVb4CDG24LUa9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lAoW+kxZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ccRWLxlL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lAoW+kxZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ccRWLxlL"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xCGV263635
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:37:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=; b=lAoW+kxZvXt5xy/h
	2DSrQlEb1phY5f6A8ahLX3t1qHW1H77WOqnye4m6zaLb39aRzZ7fyRPTLAJ1mhqr
	am7HdubOzve6gbcZE5SAtj2sTk0JTe/bdEKdxmQ10w683bwz1falnnF+YpuWW2mI
	NTVZ2u55qtDOxCy9yqAP2gzmgFrNagUO0fEsoML0Qvoab8at6BcVpq+17jYhyusS
	+k6xsJH2ZRnic0FpIbWQlDJrPwMmCKLyBZ3QDt38ifL9f/WaK8/gLoaaVrmqdGKc
	SbbByMIrJVh3JCT/Ksha/hxca/Sg7DAw5VxkfKkAL7QeDfrPMV8uZyuxyfnrXtSw
	grIsGw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6uu5vb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:37:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517865e6219so17162511cf.0
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781177854; x=1781782654; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=;
        b=ccRWLxlL5wlxqwpLgaFDr94zottk4Xh+8VsRxvpHT/rlMO1co7LiH+CMZijMu84qH5
         w4kcAnsq8Hp6Sss56O8HMUIDlPlJvFJaculPot/WrArfsUeFe4w3alxM334tuN5ye7y0
         FybpbL6XJ4b2My+OUnmX0oBO+uiTm7dXYXS8R2Kn9Ol9LF1IRmrHKDOoloCZzsIstFwN
         mRRPlXBH4Td4IHDqjuXvUw0FD8Y5evW8PG19DaTInBna3q6rBQVUX2JwVpqkXy/TyA5+
         IhSsFIqPuXc1Q2kA6NwGLJKhZXHQYUcUwdLYbjeFAKH4/903CPFznPBMfQF8W7x33RtV
         QcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177854; x=1781782654;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=;
        b=keiY/wVrdKD44LZgH+BoBcqRGe0pVtKxTDznDDQUs305zcxOa27kfWtJSkwmB3kzXK
         pj14q8+t5BvFseuGRq9FOkkwY1WZP83OezQ/01nPfwryu22Lg904JlkzQaPcvXXlEPzb
         Oc9H450B3HSjnRcZlPMUlkM4wIvqWSTnGFw+j9opCMJEOPGAyIiBz9zvZS4tmeOCN+16
         zkbECbC4bvQlD9mFAjed2wD5h2mg/T809MfuI2/OQ0pcAGYClVGO0/is6ZfucUMRCs68
         MKIatlz4Yx/iXvW12pS4vev0wPatcYUYGPQc7gsUMM/gzu6fSUvVa0HYmmwtGFQYGPYd
         c7fA==
X-Forwarded-Encrypted: i=1; AFNElJ9922hBwIA8WwBvqatMr68W0N0YXOCdharcDkLxCW98xLw2SwWyGJxUlzNhkOysvIN7mzieqFlRTfs+@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+VjLkqwVRHkQRcq55KhT7lboATbRKeB5k8mu1IvOrnxEvdKag
	keYoOeATtpLTyvn0w0Xb/6ktj3X5nkvEllhwrybu0xUNqNMUr84OL2ozU1fF4NYoOV0AW7uRfoC
	Z/hUDYBmXx9HMJPXxVSbi8oQ2zu4HSzSJOVu2uLf+8D5Hr6Irb3+6Pj31MmubTDRI
X-Gm-Gg: Acq92OG2F6eN+pkkI9trHnIjztNhgnlahLfMXuJKUv+GY0lzc/z1KoYAfcZw0rgYew0
	Ki3vh19XylglTy3UQlAdqNBlAE6eYYEC9PkN2aHIo+Uk6EmAqHqzmaLjRYf6HEPd/zAMLX7Inbz
	fboSoMe2AFOxmGGkUQj7+shNjhmFcPTJQhUKnaX7cPTIT7VKnrcbNHAVn32Evy29dtcSanM/j4N
	lIA73Ini1Otg0WA8EFyTl0tRiETtke/y8EIdsuUGmpQqMWoOVegmogZgetoCzn+MmAyhFfp2hxX
	KU05bluXuLBjIX8ubUAIdCygXt/n7sVLH5MFuwPlCn7OEOrN/3UoL7aRrDnBcSkcLYrz2pPZp1q
	p3Ao1gmq47Pgss/S8cD4NtV+sfLboR0gKEgu89R42UZg+qlCB7doV3+ep
X-Received: by 2002:a05:622a:1e8a:b0:517:5cbe:515d with SMTP id d75a77b69052e-517ee23455cmr19317991cf.5.1781177853608;
        Thu, 11 Jun 2026 04:37:33 -0700 (PDT)
X-Received: by 2002:a05:622a:1e8a:b0:517:5cbe:515d with SMTP id d75a77b69052e-517ee23455cmr19317491cf.5.1781177853045;
        Thu, 11 Jun 2026 04:37:33 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb5abe4a9sm53516566b.46.2026.06.11.04.37.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:37:32 -0700 (PDT)
Message-ID: <9fb5cb3e-53a5-4ce7-af3f-e4a483b39db1@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:37:30 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/18] arm64: dts: qcom: qcs615: Add minidump SRAM
 config to SCM node
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
 <20260522195009.2961022-18-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522195009.2961022-18-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FJ8rAeos c=1 sm=1 tr=0 ts=6a2a9dfe cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ZpVAhvDm8T4WZmbhYYoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfX+EX2mM8F4Prv
 53Pdxn1Uu/xuBuOvaYECnFl6nVs+yQ+u+6dHaholQ2+5iM4yynUeAfEB99+HtjAAp4ntkFRcEVT
 XXAP20PhFA+y+Fz8Qk54fNwVglgIYvs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfX9N+6/b7I5xBl
 zl07v6d2yXW8Moq/36MljmD63qsV6o49KHuuwc1QU9eiy3QHBCWY0m+Ysiy4DnxWUNxbIgVMxzf
 +DtBFsGB7Kc3AdgUKB+xfd8sGYGN3H6UXVb2pjKQXtGAojRTSGzwNeD8PlsvEAQfZSWkUSPZLr9
 HmdKykqcfHpLuTasllAxw1UXRUn7/GoY0QuyGBsUL/ATke5H1tJfGaOjgyw9XdwB/bRY4BkdlbW
 X0Ql+8pzvLXkn/29kWkr3A+WUBQu+CpjoYsdJCLnXNcQcPYQaHd/GQTd3oCpuhnyXaSjtPPHC99
 Abu7+UvlQfn0fXA5TZ9bN3Ag+3tAgD/8Q1tdSxk3+9h97L9BIt99iZYTDxvO5qXzr992n7uNDw7
 plfOiwv2sUe1LK4htgq7uHJzkB9TbmlX1K+HBDIuU7josHQFy30Q7ZAdwLURb0sGfxR4y1GGqWX
 UDUsKzh6MCT0yjN/sag==
X-Proofpoint-GUID: oakbgumzDRFAzKlvcLbsl7dtkJNVYZxh
X-Proofpoint-ORIG-GUID: oakbgumzDRFAzKlvcLbsl7dtkJNVYZxh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110116

On 5/22/26 9:50 PM, Mukesh Ojha wrote:
> Point the SCM node at the minidump config slot in the always-on SRAM.
> Boot firmware reads this word before DDR is initialised on a warm reset
> to decide where to deliver the minidump.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

