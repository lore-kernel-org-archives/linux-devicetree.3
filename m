Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28559357D10
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 04:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783400400; cv=none; b=abXqopBeXLWlDvU0oTQMhZoc3oL6lBQQ0lH3WnSsUmgD/7g19bSYH+hj/MCFgaLqA1do/nexZG/AbyT4U1vGBpnYQbgHoyMfUvLIFqKEI8NJnB/M3E9Y7sIeyybgnQYeShPJknjpt8t2bYwlk88e0XZ5cezoE8G8UDt4HRI9Cz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783400400; c=relaxed/simple;
	bh=KwX6N+O9LWkDxNeUi08yjZDQWfzQgsZtK1Q4XY3MXu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PzURu900APiF3WJFEW2BrNP9mRHmy3SV5nH8DI3CiIGITCiJkl1/d6sbuY42ffPVmu/53cioe1xA+H1FEgC9AvK8F0Thj77mMq2VNt4pKdUJzbhOGGNXQ4sC9v2z9gayS1NzOpzTzsaA5un79O2h5i5vTpuMzOOAmX0DNzqb8qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lcrxlKGh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eexj49+g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lcrxlKGh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Eexj49+g"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66749Lut2645673
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 04:59:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ju8/Dwzst0NBAMXt4pxpYSRWOuaXdr0l8OpHASFq3xc=; b=lcrxlKGh0t59Lc3E
	Y1r2zmQ7hfM54tmhdKFOo/fQrSDIEta3hZZNR9h8wEp+eZhfnlx/KiZLb5gMNezY
	kMfzoavvIT2Surpyt7AIBOk1CiSuY0bCyWjHXXEn+T9WBCHJ48rXo8sIccJJjVfx
	7lYd4evOX2nuSL2L4GhQmP5mQw7PFSyCwQPe3eoDoXWGau7Whz+jYvc7yookveiM
	KrIMbbC714oJ1dxAmU7HlALKojg8CTAVd4jcUSq5QU6Lyu8eFxfRpOLoNDMxgW5q
	qhsUeNdpSUp/378fIG7dTVkj6xvgmi8bE5F92Pe0NGl57YA9SETgRVQkLwx7aVCI
	76c9Ag==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h9cn0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 04:59:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc88e22f92so44735335ad.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 21:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783400397; x=1784005197; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ju8/Dwzst0NBAMXt4pxpYSRWOuaXdr0l8OpHASFq3xc=;
        b=Eexj49+gjs64UAnpW2vRXC6wnGO5MQOpfp1kHssro45auCNq7/mAbKsrys0BUjQY3f
         B5AAwzbQMn8Sa/ADwjj7646X0/8pCFWDA1Uhs+bevfNsliowfnom16BZszYjKWhsTh4m
         IscE6uTfGyS6Isgptzutn+v+Az6Do/CLb6nnXWVM+aUhPFcUFgS5cuToBcpyua+kR1C0
         uaCmsF8mZi1O5VHQ30JD3OLSvxLQZmqHVipFuECvcbpmqzZ4mZ1tN/BhS0AmEvuUbFdW
         lfMZEj8Bgc2eBMElX1WgsZgZLxaNJoBUhi+MAYcKsEGkN+dWlO7cLT6sLAwJHAn7SkMy
         AgwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783400397; x=1784005197;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ju8/Dwzst0NBAMXt4pxpYSRWOuaXdr0l8OpHASFq3xc=;
        b=d2UUVqF8mx1VebEhHGfB5/zwb/SYqs6s41Bcy11cEP7zqSsbopBQt446TsjghFqMDJ
         DlfPfoXY1L7N3mZRLHy7dL3+HccPE5xiqtZnEgpDHF3OadE7mhfU7BjrP3c8GyTK6fUD
         kG4sZUFQERf6+1FO8YZe8puvdQOLSMJylQ15pU744VyuoAWXLbsxKJxqr/hoVcwU2hws
         VkRlthHhJeNz187a1RukXSIk9L75TuPj9qoXamBAhi01Co7Lp2YDTZsQ6nae/0Ohj0DW
         YGXpwzFtqy5FneYeJlarFJSZx0iDhRFo0rgnRvSTwZSAFYStxTPE3ZftD2av1L8XK3Uy
         PVxw==
X-Forwarded-Encrypted: i=1; AHgh+RqxMR3xarIOG5LpNom+pqNGn2uk4Tw9lkm+9qfowg4RlOt6R67L18tDe1jFGy8Lx4vEf9LTVbCA8fJN@vger.kernel.org
X-Gm-Message-State: AOJu0YzXtZSQgEcFIWjQ/cmDvs7BGon6llKcpU4YBaYEHpNM5J8p+iGc
	p6ioXmnp3o3sSE/G/akRNR7MPYHRnbmzAiaFgeexNex0ZDFPg7Y0z4qHp5wllIpfJ4VqBHSNbE9
	qLBhm2G5zcxKMisFqkfymmPGokSfbPxDvzzuibIo8rYdHPwoyNsKz/hjKAe4N86eX
X-Gm-Gg: AfdE7ckoyQvlmkFhn16F/RbunQaj6bVbDUazRWjSDGMM9mZyJkMf30lDMFeJnZPcIgr
	pFw3vDyZ8hzMs7LK9b+cLnXd2y7NItueBd18WA7zbHC3lGXEtrjG8fQbhPuwKL5fT1K+iqW+3yO
	xm+bVpfhmQZb8TgwDc2HqRRdPRe6/60hLsj4QzWeG69RS2wIwaDBPWhtKu/3HHJp++rqVEqC9aX
	34D8eYzk54+AX6KsnpBd+VGe+/OGGhgRM4qzB5E3rnEdfH2sMCSSGbqByhV+iFrnhZ4F1Ea4tbi
	9dGveSHgJw3s0GB18+EFekZmPuLaeQzJf5nUiPNG93QuSfWyWdys92gV7k+jB0kfkyyQ1QqS0la
	J8FZWClWTAxp/py+AibkrAPOYGhYJ0Cq9zAhTJbE=
X-Received: by 2002:a17:903:3b8f:b0:2be:3850:297e with SMTP id d9443c01a7336-2ccbee24a98mr42439505ad.31.1783400397165;
        Mon, 06 Jul 2026 21:59:57 -0700 (PDT)
X-Received: by 2002:a17:903:3b8f:b0:2be:3850:297e with SMTP id d9443c01a7336-2ccbee24a98mr42439265ad.31.1783400396769;
        Mon, 06 Jul 2026 21:59:56 -0700 (PDT)
Received: from [10.217.216.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb6e2sm4874965ad.3.2026.07.06.21.59.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 21:59:56 -0700 (PDT)
Message-ID: <e64504d6-648a-4cf3-83ff-72b9a7f77979@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 10:29:50 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] clk: qcom: gpucc: Add Nord graphics clock controller
 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
 <20260623-nords_mm_v1-v1-6-860c84539804@oss.qualcomm.com>
 <c462694a-d48e-4e05-99d4-b2ad1036baf3@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <c462694a-d48e-4e05-99d4-b2ad1036baf3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oYHIOjcp6fN_aOqplKtQCyDO0wK59g8i
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA0NCBTYWx0ZWRfXzrQe6fqurFsN
 VpN9wHGpnwyakIJEzAtrwAX9SQ7jKdj+iTK5olEShprdrtlk5Ft2LIFVe5xx+o7+qGL7w1rw3gU
 dlTXGG/jfBbt27iQudogfOUzuHbpnd0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA0NCBTYWx0ZWRfX1G7dwjrpaBo0
 hjXwdo3fie3h04hI1cRiBeDaf0vtq+h0DxN3HHk9GWl9XxbeOzkQ8JjwPBKI8+9AXcbkZ1wHXj+
 2WIP5sriPbKCsPwQWRP+Bs7fMMylSfE385pCXN09ml2yzzkvuPEt9u8DGElsULF/fRFS82XR0Yn
 NEZgoKwrUW2X34nUtZTey5MvXS535rnqKQOBCwZTPwOhLfM3mePPnwGs+EJZhWlHgqRV5J85b3J
 +QfaH+6hJm2NUHnqMQdTUI/qHgqaTASVHoNsruq2SBCUHnsU84lvcw7XvPSA9LqS6WZJlJjQySL
 Fy7ckqKg/P9xcC4ZEJy8I5IJc1FFWsLxOgYcSMFWIOuQrk2iyDfLV/EJte8DMFWiP/nuauHxJNy
 zZWxDURmt20RLUEfLwjpZ3nD2VB5xpKnbMo1sQF36dBeF2pAlAS16pt2YbdHTAyX+MdtSZw1664
 1eFCGUV31oQt4n0SXeQ==
X-Proofpoint-GUID: oYHIOjcp6fN_aOqplKtQCyDO0wK59g8i
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4c87ce cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=CnYZe4LDIn5mUAQqU_MA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070044



On 6/25/2026 5:39 PM, Konrad Dybcio wrote:
>>  drivers/clk/qcom/gpu2cc-nord.c | 546 +++++++++++++++++++++++++++++++++++++
>>  drivers/clk/qcom/gpucc-nord.c  | 593 +++++++++++++++++++++++++++++++++++++++++
> GPU_2_CC and GPU_CC seem to have a different set of clocks and
> resets. If that's not physically the case, please align the
> lists. Otherwise, please use a separate bindings header for each
> one


Sure, will take a look and update separate bindings.

-- 
Thanks,
Taniya Das

