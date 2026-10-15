Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F0F5111B2
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059737; cv=none; b=Yvsv81rREwU61mdpWdVAP7lCGwEEhMvnv9a86yW3KPNXGsYa91CMSS3T174Ia1wTUE4yXxbGm5i9ccVKnSVEeR0iqjhTFrKaub0uqesEVDKI9zdKjTFmmqqLGNxiquT6d+NW3iqX9i/3D/f5s768Y7ScYbegtR9oPO+Pm6iuQsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059737; c=relaxed/simple;
	bh=6MSznKxRApuG2ixvbDRUNzwOtA4rFjejFEE9H6ua5No=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iStoxtXAVcNFCpOBkrC0F4PFZ2Jp7CtMYp0JBecYot3xaUeh0G/lCM1f9uwjQjxq5YrYT76PNCc1mXQc35Eu8YrBCsG73AGBz9lIe2RcHoXLeF2W1rfwejXcBMHSYBNp02Y0J9AVJWyCCQV4aI+TARpuC+P3YOtUlwlx7VqulrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fzKH2kfb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O0O4lhRc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fzKH2kfb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O0O4lhRc"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jZ7a2966449
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:22:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JopzeCmDtFG7rTNhDtqqbxuosBWl5EYBn3SGelryCIA=; b=fzKH2kfbD4D2ODkP
	v+Gv9KSXLkrg7BU5fht1etcbhzl3sZ1RahV7tNY5ayu7toHL2/QSwcNUytXKE4Us
	gXjdmEuXoYZwgbNCfRPBKrQNm9D7ISlvum8n3m2NkGKPYe5oPiLAHMVbTjset6lK
	+PyiRhD2YtsYpbbbNdDUx1PaoDVoQFKrJZAwEK5hrQA36im9EbynPxxES/GHI85H
	vN7bOWtgrz/yoUswbYtMxBKR53hfAGI5qc3Aq1E+Xe7gMNAkRXOxqt4QjePKy0k4
	7Ykr41PMd73atPCook9wCIJhHN+2FG7RjheRYFVUTyORV0FBCXY3Hy2XtWN44i26
	cCUWuw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hae4wuhvc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:22:13 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91795e52969so13107746d6.3
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 03:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792059733; x=1792664533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JopzeCmDtFG7rTNhDtqqbxuosBWl5EYBn3SGelryCIA=;
        b=O0O4lhRcFRZ/1vZ4E3lcTUolgQx5t3Q0QMVy9BDC7DeYuByEFHae5snzYmN5eZGWbT
         /Rms08L3wEdglPq1T7cB0n98a7bzYDjntH4mHavijyIpLvvHDXH576A9p4l/zPFA4hym
         CDWq/8e2smb37VBhJQxuM4bbbvpi1N1TbMvBUBy5dcKFExCTwsxLuwfbhXQ+PmtniQPS
         lMFojTWJO0S8ZYeTgjSttZfa27nINOL06CoRcl49BVpQQ3D9sblUficEa6ldStZZdIip
         EvjgM8YkK+qDC5rEjtoJW0dPUlIkuHYzBqHGrL1qhvKtytfVixz5QHZ/TzWFYOtkgTV3
         jWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792059733; x=1792664533;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JopzeCmDtFG7rTNhDtqqbxuosBWl5EYBn3SGelryCIA=;
        b=tE4362sDDkuDnDdLENnaOBDNvM+rPUzZ8elNGH4W5INECBMmlDATYj7cPh63lY+yGZ
         11yb3TmEnLm567sW/t9EsOlYjs5KNddPa6WSBOWqi/X9r8PrpxWWK5o+yhIBty5TcDHO
         kDna0/yOsIvALhRW4eSjqV7kncbwNMgfNh2xaffbsxn+eJOvYRc9W5i9U0S8j6sK9/AD
         O0IDnOtJxG0PO8R9c/wkat2Yf1pUjD5CqO3T1t/7Jp/hqXdqCaxMYnC+N/EoEWNCCYDg
         QgklzgiPUX8rUEQt3rNNj7sDqw0WVEB14gyYMJYTbuqG2XlxUyU6IepoXnwJBC3yHolW
         +87g==
X-Forwarded-Encrypted: i=1; AKwUvBw1YVz5sVM9Z2OlSnDqOjqRn+T81i9bk456tSlt6LXBItbIdU0etqUyEKMN118vDX64QgXUS+H37/XT@vger.kernel.org
X-Gm-Message-State: AFq9FYIHtGvXfbAWigVLqdYcDWyMbH4KvK7tUtdUyIotJ8bO4scJ1HMP
	LLNY7mUHU7cTqH7AJN4HSGAI308KkwozNeeRp54Z1I/N2ocM8nVw9WgahGBwQV1A9l3LJsH16zj
	LnqGYOI7UQUUN9bpRA7w8hMZjo/8vl5yzw6hwSIc255vtxQhu+SIW7gEFF6FZpNn0
X-Gm-Gg: AYBFou3kAU1yHnCINg2prUshetg2lvzlMUvkDtHgLQ4ZWtVDU1sutzcPlVyBBhUgmmj
	874AXEdy9K3yPnxNqgjDaU4PihhphPSxZOKDomxsP/qBKCRzBbqf6Fc/kFuC2lUuL7Sv2MXrJef
	fWYjzFlPvpRMywP+LiS20BavRhhsJTnC1BnFrXRnYOrUPx94FErh7GBxC+fK7Y/biHUzksjJtFW
	op/jaQnEeAogRhjfdK76Oeh3S6xfr0wkBVVOHNMnUokk/am90j/OwDagg29UlnNm90IF5axJFOg
	T4aiQj6PZgGl0lmf1Zni8R6JajSeKGAOlYTEXG+l7lSHgUmvodzWkDBCOZMQSXj88xY1NU5sicR
	td1ExxicwBWdx0HR9TUJ8+g==
X-Received: by 2002:a05:620a:2855:b0:939:8148:1e3d with SMTP id af79cd13be357-93ebd0d7987mr3110394085a.2.1792059733243;
        Thu, 15 Oct 2026 03:22:13 -0700 (PDT)
X-Received: by 2002:a05:620a:2855:b0:939:8148:1e3d with SMTP id af79cd13be357-93ebd0d7987mr3110391385a.2.1792059732804;
        Thu, 15 Oct 2026 03:22:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed6be6f15sm107592266b.10.2026.10.15.03.22.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:22:11 -0700 (PDT)
Message-ID: <456820f5-a5d5-4d7d-9cd2-5ebd67129b62@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:22:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: nord: Fix videocc clock inputs
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261008081036.3492003-1-shengchao.guo@oss.qualcomm.com>
 <20261008081036.3492003-5-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261008081036.3492003-5-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfXyQ/cwsERyDLX
 rqLAMXMwG6/Q1YMj7kcpQaRruS38zORfsi8l2BPN8tD8X+rvBp16YB13V8N4VHpSsOgExARlx4T
 X2ZL9gQ7ksD7P03CVG/QFFubLCidcQI=
X-Proofpoint-ORIG-GUID: Xlog41TVVCD7hdpHOKOcXwe-z5NKy0ju
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfX1rtuxQgh0a8V
 rfCvQg/gWc09D6ksC+6VHdgJ1XX9NutpZMeTQGrKFvVRtLCVSKYWzJWjbuXBvgzR2w7+WpzBmys
 +LFDued6MXoSIrz07k8U8cMfUwzuu7gohtTUme0rqGMK4RCcBK18MhkTm81fZXwje0nnusNT6Pg
 NIdL568y5bgjERWE8obJU/IHZGll8GOdotRBa7C6pdnyVsDXMAdB53vGVjeHf4qMBCyZMxmReK9
 qcfG9p3pFxlz7U3f11Ff3jCps+nrdv14VR4vcHX7oNpVQHqDFpg2naL9i2McL8jSiV65YsRo6Lc
 j3DkHIVmW7rQwPgm8PR6DPhw892zHJS8puNKv777/VD5Dkp9pAnaeLsc9t+e/o3RDmg6mzTKSli
 Aj4/qscT39oPXMZBj4Lzo6Ql0weKrTuTte6vXBl3UofMFWcUhgqW9MmY4nXbI6KoJedjcYvqLRt
 VeriZ13m5SimZoOuCVg==
X-Authority-Analysis: v=2.4 cv=E8BYNqdl c=1 sm=1 tr=0 ts=6ad0a955 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Z62H7OANAOBda0uacUIA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: Xlog41TVVCD7hdpHOKOcXwe-z5NKy0ju
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150041

On 10/8/26 10:10 AM, Shawn Guo wrote:
> The video clock controller binding describes three clock inputs for
> Nord: the board XO, the always-on board XO and the 32 kHz sleep clock.
> The videocc node instead passes the board XO and NW_GCC_VIDEO_AHB_CLK,
> which is not an input of the controller.
> 
> Pass bi_tcxo_ao_div2 and the board sleep clock in place of the AHB
> clock. No functional change, NW_GCC_VIDEO_AHB_CLK is kept always on by
> the NW GCC driver.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

again, with the commit message fixed:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
