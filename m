Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28A830C172
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 16:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782231783; cv=none; b=JHVcFEn2LJ8ans+WOxKgMZJu0xEd1rejGUUFtoer7T65TKySuMZ2D7X4L5DkTL3WE3WdD6Vse7owrr2VQXHX85fL7HxEfKSA6FCDjKe9MBsMSKDYxv1CE5q0D6vG1jOI7T8/kNMlkDsqdeAZRQQXA7acqZCjR8863gv/Y2I+OCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782231783; c=relaxed/simple;
	bh=JHkYJm2LxbqzqrnkAL1v7BBOe47dtU+7DT/jd8f+7cg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NUQeuMXEVzFbLTm5UUtFsVoy02Q62ZbMqhzjMNuq/VWkgbVVH6z5PmyPpN3nY1YdmE1aRywYwvvT3U/0i9icNKjlyzJPZfFvuL8QLj6pOyZ2K8f1kgRhytcp3g86LqwXKq9+SlLkmELDF2Ls1U+wvkVInRO5o5tQ62CF6PeqV4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dHDXLMeU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XOz+mwFC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dHDXLMeU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XOz+mwFC"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZiS94052828
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 16:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AB74uSf38X6zKKffSeJ2Ws92VBlI34TKRe2pQl6iJ/k=; b=dHDXLMeU++hRSS9Y
	Qq3xKpP/p34OQhMVzl0SM/yVFJmFjv8+ZE62xUE7sM7u/vur4Otlq0YuwFeLua8Y
	Ge6st7+UaAhmCLOuwsc0svn/Ne4I7F7zmqK/iqLz3DetCcmrlkcsWmKvhDpsKEhY
	nu8ckHCCSZ+PZdoABjTacTe28BHrkkIxApeeJlbV5khm2KkV8f1rSOu+CsH6Q1R0
	jmXBcLYz/T0oI36SuyQyAVlvUyiKhqBV+hp1Mozyf6tHaBfOjA4dYa27LmETkPMZ
	Q5PEqLj9aNzTjtdOucjdMUMgjoE6Ix8GaCJcaMr6Abxq2ZKz77GOijaRkdP9+iZr
	aj+HEA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr9ysfxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 16:23:00 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36e09ec696aso168218a91.0
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 09:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782231780; x=1782836580; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AB74uSf38X6zKKffSeJ2Ws92VBlI34TKRe2pQl6iJ/k=;
        b=XOz+mwFCWlZz7pZ0N/zomlNzMEdtnk4kdUacZXa5N8wdi6inIK5hSViAHhZWtVkuae
         UFt+eBRKwIkPTn3p3taC7wES+sKvAVQjLmbjpgN8MSdJdBSjWo7hdkQuHV37Xe7TojGk
         N78o1YOowyKntd5aqFCXvug+BTTsSXQFocqt/44SeFawPDyg+9yjT3yVMe0NvG7sLwpg
         rVm8lpRRuwdacLMJx4wkSOltcf+MYx6Kl+AzZID19JQOgl0NPc+tzWGMUc/XBoT+IsW4
         QwKZrJTuEKN0c/jKzLndCPXWVH6MHpQeezBLZTL1WVrGXtDti7EYAb7pj+3n1AdNuJwT
         htxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782231780; x=1782836580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AB74uSf38X6zKKffSeJ2Ws92VBlI34TKRe2pQl6iJ/k=;
        b=JDHArEygncKg3eifJnsDovqXFum760U71naVwG263WtCjvJWCQIMryFdexRAYNvL5G
         Nt0P6+b0OtlGvojVLV6uxA4XDDKFjrm42lxf5SaHTKlt+KdvSQ+x8mDIrQAwAT6ueL2e
         W1hB1M5/OESJZz9AbkLtF3kKGVU2szgGQcOVPIN6h5Py2t7nt73FyyHNwN+thl9LgSPL
         yuypfq9RoC5/Nh0X1BFJ3kTn633s81r6achQ7jFaoGwNOIidCNQrW+NlEQOYb3sg1N56
         uhgQKO5fpDemjRgn8EDh2QnnJDUUQZsaGn/L5sh44xjSLXvEE9yEN24VGJsUizcRXvsz
         G3FA==
X-Forwarded-Encrypted: i=1; AHgh+RpxJPMRwoeEWiT3Ka9Pl9ic6MuSYiTlrqD1Pye5Yn3tQGxMEA9BOETuyAjK8trIBRB4R/LrenTEMbKp@vger.kernel.org
X-Gm-Message-State: AOJu0YwcUeusak/9zHyhnMPXRYzDB33caArBg5q8AHViYUt00TDMw5Ff
	2QFJL7oLW3X8AxW1YgMfWf4guW06JWKGSxoDFkmuUjct5owsiaEsi4G102xEJDq/On2xDiN+rKl
	aGSV9tzckMh4jywpm1xADUiExyZqy/d6OUHjJmRQVDZva4I+nSVSC9ZTbZjE7WFUX
X-Gm-Gg: AfdE7cn+IiHVWFQUtNsnl/Qdc+YtbPEC3l2G6ZTM2zoD+IomocYSZzjwcbBSOEE0i8O
	YPPIZ7v2M7Oy4LvGo9f3Hdid3g9ilqeeNhk91ZsVjTxZ9uys2PM9P0GQqR7t7+8deOmVduq7p6G
	VUNvSibN0K3mAbFm/T31dye7Bhr8r/IfoR9PsgUOR2fbMuS4WB89rnZ3r2YBcvsgipA/6dyaxwo
	b8EsYN63EV+0Y41DZUt7exCdnrxZXC89t6V9D7+EZDpm5SLVSYdVjmuhIT8viuEP5vMErDkJrle
	XZW++mtBaxhbznEiCluC+0MNAAQvvERZpGZRchMhhSqeSQrA8PJ/ix7XF+pVnYYBsZN3FBT/MEC
	LKwRdlxct8kI+lesKc/kYp32n6vVNWTNUVXoStA==
X-Received: by 2002:a17:90b:3946:b0:368:f0d0:1ce8 with SMTP id 98e67ed59e1d1-37d16006570mr20771713a91.9.1782231779793;
        Tue, 23 Jun 2026 09:22:59 -0700 (PDT)
X-Received: by 2002:a17:90b:3946:b0:368:f0d0:1ce8 with SMTP id 98e67ed59e1d1-37d16006570mr20771684a91.9.1782231779435;
        Tue, 23 Jun 2026 09:22:59 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.30.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d4f2f098dsm10079009a91.13.2026.06.23.09.22.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 09:22:58 -0700 (PDT)
Message-ID: <b78c96dd-7037-40ea-865c-a4720dfd8deb@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 21:52:52 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] dt-bindings: clock: qcom: Add Maili global clock
 controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com>
 <20260618-maili_initial_clock-v1-3-d6ede0352113@oss.qualcomm.com>
 <20260622-complex-dashing-gopher-9f43a3@quoll>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260622-complex-dashing-gopher-9f43a3@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JYSMa0KV c=1 sm=1 tr=0 ts=6a3ab2e4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=q18lXC+Bm01JYF5cPAQq0g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VQuC0S_2QEiWgma_tusA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: -33QRbeS8Ypi9_cxrJbIJTV_JZTXBeMq
X-Proofpoint-ORIG-GUID: -33QRbeS8Ypi9_cxrJbIJTV_JZTXBeMq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEzNCBTYWx0ZWRfX41ypuaiFdXEQ
 wH6DIhba8s3F9fuyc/EpS/kGEpAcoSf8fty5EQE5EXYfVxLZvbbvlD9vMHTJsWCnLSCpcJai0qP
 P9prhA1mSI5ekFCKSgycy0yv7JHGF3Q2iJanSYNZgdkbMkmsV9WolJJ/+uDr/2qKnX0XSV5rtnP
 +hCC0c1lDOja1BLNEUGnaaHkI7KI9SKskeeoykC8L0HjaliseLuP2Z3VWOxe3cGKt18n1Ww03Rn
 wQckfVHzcdJcu5dDzUnvz4jd7EjivmXSPqmpl2DJLMEcJbw2wmElhjLsLJE/P7Ip3w9iZuLeCpz
 bE9XsvVmRLLU5xzGq+fueaCpV0G+G2qXFwqCDU07xIFIR5KJOm+OYDPs3mFQ5T86npxzTEsAMsv
 NOfb6cAwK67tzR1PsrEs9T5xQS0F4obNDAMBlHXj5KTjjqCqF/FEeGZZPl9XKw0rNjidkJyHpk3
 jYRM0NSe+KW7FyShY5A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEzNCBTYWx0ZWRfX/LXPEKEFy6lZ
 mH2tk33hPWmXs692tmSq8P6itOrXh2JL8bbuv/qnYtG5Fgh4NCOCUKw4sUtLN721YZOJrELYGyP
 +GsFIRKOi0nljYRAvcuPSWpQ7KYB1do=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230134



On 6/22/2026 7:28 PM, Krzysztof Kozlowski wrote:

> I think this should be moved to its own header which will include the
> qcom,hawi-gcc.h. We already do it for
> include/dt-bindings/clock/qcom,sm8650-videocc.h.

Sure, Krzysztof let me take a look and update in the next patch.

-- 
Thanks,
Taniya Das

