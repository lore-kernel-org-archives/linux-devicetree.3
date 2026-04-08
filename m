Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF911A262D
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 09:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775639806; cv=none; b=ucboUQb29NAFfUb/Ou0OPLewd+qJqZKme+0ZKxyBxGkbUoTbvJVDHGhhmZE0hBs0aIFNu7U8X8uwtil5gHjO2cj7fLuQTo1P146VAFDvB/YVlaGOpQNtNgzg52/fS6vuERiRu3W5Wg2T+mOwfY9fJMvXQGrAYUcl8TnSrCHjdVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775639806; c=relaxed/simple;
	bh=v9tPwsDptEipHOEuADTthgdBRAyA/k6FpoUYTH+e6zw=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VcrxE03er8WsKpefGFNvZxUvxz0x+7bL1iII+ZuJ9jW3pc12DCg7pHe4stTIZkARkEs5BiAnHuTYoy5vpqfrihGQGbwqsB/4s8Xq+bFIb0Thc/dT7h50lY1HyMtL9sVdHS27MHliR8Hh6s6qWRL9Bwk8cfwM3LY1bmpTH3nv750=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eABAAoUx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ffS3aUSE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eABAAoUx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ffS3aUSE"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6385QCJp263342
	for <devicetree@vger.kernel.org>; Wed, 8 Apr 2026 09:16:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vCq3s32lHUaj6k+qmJdVJ5PtOJ3QtlGnO71HELrPaUs=; b=eABAAoUxVYDV2zqc
	5PS3dTNUbdFgy23F9cDC2gUxKerdM+0RD+6zF3TaXxd+D2uwmfGkT4IlM584gdmo
	ypmxUkQKz0TH6R48AFMK6lNDq3EOA3NmIlkg8jHcTCzlcxw9Dlnadd56zDdpxqCP
	jdnqTBPQv8XuHXd7hDzR1DP4U74b4J0yLC7HTkatUCVZi3I3ufyNT9sOCVqCiWtQ
	z+SMTvkS1fetjUGOdvyk2I0LqyiKsqxK5liuxhzhGHHul4FGPtVEcgagiNsaYImD
	ukJ+AjiB4hyciI82LC3UU3pVrSdzxDY0ifWvhuKj8tYDYnSiwgnu6qt4aoxTV182
	x99DZw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7t22jdf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 09:16:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35d9467e85aso5680844a91.0
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 02:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775639804; x=1776244604; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vCq3s32lHUaj6k+qmJdVJ5PtOJ3QtlGnO71HELrPaUs=;
        b=ffS3aUSE3/QpSCX+DXUwzNoXIWzmVkNNdOY9JkT6WKx9CrZRZTf/w4oZf64ZwXix9r
         x3z6FLiXzWrqscZW/z8m/uSY8ZOYRTPvortTdxCpw65ZHd/ZJoSOxLsOVIWg8mCshZg6
         E8Jeq87QZvbz1Zquo2L5v5zBGvCSTs4C0OuN+vMPFNTkR5H9Kv0U+Ls3oM/TMoKi0KpX
         aaviCAv97sI2VMi9AG46cFBF2KOcpQRRNjTI3tz+QnCqNvFeyOueEli0XTTcLBUKbx79
         K7dg4FdwcH5xKA6MJrz0Np5ji8MkRLeXbAU6LEh4ayEcPMY0A2vfXYRIl3aYNpwPydUk
         cBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775639804; x=1776244604;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vCq3s32lHUaj6k+qmJdVJ5PtOJ3QtlGnO71HELrPaUs=;
        b=Y5TPslDMmwhwo+ivpf9EgX5FuF3V0SjglLznVdsvtmoTD6pCEqy9MAic2YaR4sUi7T
         3LNureoesUIpoigYgEsQj7DKiIuRf5jdrJmxdDi+5RNUyqiSaI1hXqCuOe/s6l6Z6WNm
         gXUcAEYnwYxZvYFPmTrcj0NLFMbkhgTIfUbLypGYwNyLrnLnkQye73iq2IFf/oRmpE5g
         GB1vTFWoqau8kE09S8FuY0p32ers/aFF5XOw0YHDFCT2owLMKJfmJeGTljxV/xKgb4Y1
         C9Yva7dfvzz8SAY4+AbXXmW6GZNMbwbtP7XOohnI4T2sWeA4kX9SAMpELD/3g536zFEl
         rdog==
X-Forwarded-Encrypted: i=1; AJvYcCXsWm+CMNqg/OjRZHkoMbGIiRQWLAQz3mcPv1FjNIWO+0NJ2EdZ+sRQUe/TlF9BXQOtHeB+zp64w9bR@vger.kernel.org
X-Gm-Message-State: AOJu0YwzMSGm0cOja3YBCpHvG94WQO5OjguqcyW/D5OfBXAmR/cKRdBJ
	AXFm/2sRQSGA5Qjc7pGXeU3Kud40KUya7kCw5QN2ZzgbqIBRkVU2YPWgmSd73SzSZxaGlaBgKhN
	jg0Q9CUk+t8cvsDuCEEvaQIpqblHbihbB6r9A+e2DQ30MB88N01aFHMtHFWMKkA0Y
X-Gm-Gg: AeBDiesyqV4B23A7h/D7+8ZVQrLeLbsmijmrDeLuzsvrSYBUfZ32YiMNr9KXhzTMiwJ
	zoHjPALVvQwfw20mPXOk2VjJCrjm/DE5gmGWPU9WL6Zx8SHmLZYgzgCFR0qQGsnxwYzHlCfKIwP
	Km/SgSUkyL1THukPn9oh5Tpy1fNUgi0pE+f3bO7GkRE5TPcqCMrf8YPmW+AIdM31LDEPrGsvHyl
	Ft5rxnlX45d7sanc3sgUJnabPNOYkpiunPNeDDRGLxgYe7OSr+QkuJlLwbkV45xw8q3uTS7rpVH
	gyqkptGih0WA/y7UhnbVdVMVNPZfLfcjNqBi6PGUMUQEaQIFmhNNdPcEhoKk1/SVLl9Aa+wbjNH
	HN/GcwSHhKHyhdcuELlKXAHs/rpvU2dChtefAbTsIH+3yxFwh4XWfo64xSTxxwRmc2yWNcIacXr
	Hmo7mz7RyjBRA89NQb
X-Received: by 2002:a05:6a20:4313:b0:39c:c07:144a with SMTP id adf61e73a8af0-39f2f19e2acmr20823873637.36.1775639803881;
        Wed, 08 Apr 2026 02:16:43 -0700 (PDT)
X-Received: by 2002:a05:6a20:4313:b0:39c:c07:144a with SMTP id adf61e73a8af0-39f2f19e2acmr20823831637.36.1775639803378;
        Wed, 08 Apr 2026 02:16:43 -0700 (PDT)
Received: from [10.249.21.102] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c65a3f08sm18248338a12.31.2026.04.08.02.16.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:16:42 -0700 (PDT)
Message-ID: <9bd4e289-9cf1-4502-baa5-d85cf6e07df1@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 17:16:37 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/5] media: iris: Add hardware power on/off ops for
 X1P42100
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
 <20260401-enable_iris_on_purwa-v4-2-ca784552a3e9@oss.qualcomm.com>
 <20260402-lurking-tested-marmoset-f315b4@quoll>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <20260402-lurking-tested-marmoset-f315b4@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=De0nbPtW c=1 sm=1 tr=0 ts=69d61cfc cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=J0sBhcH8U7IMieNuPjwA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4NCBTYWx0ZWRfX1hQge5FED4xD
 Pe/f4boEExcGaTuStvv0vhx1jN0e0PZ2GUubUyaQUx7bf4qrpbDMolrjM1mXMilYqAYsiF4oV/V
 YsWor87JPRHEa+GLppingQrBlRif+xMjDjCzgFBVvzgp6JSulx+xQqRshKzST+Nu+IHmwtkCOMY
 +RduUivXbYEiDE0KTIWE7Brie7vCnajMHOtY9Dg2//tWQHWqt++mpZi7jMuG9cNSDXKggsfKBdG
 +dz7D5Qz68Gy3V2vLRxeMVkge9Yb7x+MpkLc8GvOFr1dXLdIkhqCuM1eHZn5mXZGZUBOTmQqFhI
 ordGilc7KAdEZNaMVJzn+iCiVPo7KAIZdtPi5XtPA6dVK7d1DuI7jN7Wlgv8PzpJbYMcZCkmDmq
 ahAEmv8RxujBsJWRYOq5O8TgFPD13X6bZH8ik7z4QugpLu4XbImo8yXjTWkPq02bjPDuJocEsny
 vBdFg+a2c3KTbyILhrQ==
X-Proofpoint-ORIG-GUID: 1EvCG5JVjeCdqExoARVGywAOa9BZeCyv
X-Proofpoint-GUID: 1EvCG5JVjeCdqExoARVGywAOa9BZeCyv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080084



On 2026/4/2 15:08, Krzysztof Kozlowski wrote:
> 
> Why no IRIS_HW_AHB_CLK in power on sequence?
> 
> So if you rewrite the code that you have list of clocks for hw power on
> (IRIS_HW_CLK + IRIS_HW_AHB_CLK for all variants, +IRIS_BSE_HW_CLK on
> this variant) you could have just one function for all of them and
> devices will be fully compatible.
> 
> No?
> 
The original patch was to add the IRIS_BSE_HW_CLK operation into the 
common API, but Dmitry requested to separate Purwa's implementation out 
independently.

-- 
Best Regards,
Wangao

