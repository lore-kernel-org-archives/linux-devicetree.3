Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575C83AE187
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774607140; cv=none; b=msO1vRCHtyZMUf9UACxbjqMWv/sdoA+bVHcE8u9iwznKnS362mGQStbh+HY1etZ0dagnIN/o4Dnh6ZvnWXdUNzy42FbdyEhVU4/2heJhXmzf8JmmEVEIBpBw7rFzP0TeloUq/hcibLGwW6lnL95m/bk3BaqIPKpKRBfPBxpYqxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774607140; c=relaxed/simple;
	bh=aaLaEVM9z60X4uChumDS5uyeAf1TauE4AArZ0hd1IjA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AN/H21VXkueNic/Y36u0mh5AGr3uwk8PbQbR8Rqf8lq+BUDwl7w7nX7d7gUYPQ4VQawfs5fIVxCt/mM3mRrA4C033Ot5UBaDAojaE5/Gz0V1KUSAfYPKrVjHXm5ldyJMyorGa7FYqvjzmZteXP3mUbU9Y5Gge8/xEeOcA5c3vBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JHeC/Lqz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i17ZbrBA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JHeC/Lqz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i17ZbrBA"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vpq1298512
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:25:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2g2lnBb9Rqivd9Mdp7ZRvaNs3pwUAyNuD+qVPybhMLw=; b=JHeC/LqzxgKZHtFH
	RBmwK7wuQUyDhKtZcevbZ9IqQm0eR4kX6S8QsW9SUmB8lzPFaY65/QDGdIzK2Z9t
	K+KJce24MuXx/etfNbIu8+cW/HEVyKIFuaZQIXhi4yIApoGRJZ5NyvzMH/4r6jha
	fhYOMk5to2O//fJ3n2+6+RaGDzYUTLUwkd7MyCygdF5Qy8k42jzWNesrO1cBuyc6
	IXnhCvEYRYcqwIQzVr5PzAR1YGC9UWMRjtpekdtpLQNX92axexCm1aigkBULcH1Z
	EDmYwb6yxx6X+dyQF9m6aR0R81pFGDJR9AbCxmEXd1PSvj85BIk1Pb97sWzgPgdb
	Y7NQLA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bd8tnxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:25:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4076dc16so32945871cf.2
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 03:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774607138; x=1775211938; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2g2lnBb9Rqivd9Mdp7ZRvaNs3pwUAyNuD+qVPybhMLw=;
        b=i17ZbrBAw1hbSAHb3R4lpGHrFt9gr/67jmKiBkDd7rGCM06NCpRBIUUx7F243lDtFJ
         B4SynNv5snv0x9VU+tDa2bE9BqUCwa8L/R48CiOTxCsBFJ7MqsylnuElPomtrSf9ISiC
         6af0Xt0WKoE/+Arl8gKmblaU735O4up2nad+fILlgUq52HJZG0FA97nyPBJ6ymm0JHVT
         ID8M9vhWoval9i8cbulA00TvXRN6op8+gvjo9RME3RDIF5NktBYsrknJ9xxw22sH2U3D
         XGN7Bd8ul2NX8BztA9QsZqOWBr4krU6bV9VcpLnQtXUMR7O3D1H5A33uTjnZPg8aIc+9
         Ygxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774607138; x=1775211938;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2g2lnBb9Rqivd9Mdp7ZRvaNs3pwUAyNuD+qVPybhMLw=;
        b=ESe6NJ5zJFrFhHGQ50TpBnZZVuj6bfIFUBFzPjfM9us2eRQoDChLU7u0jbTIDuQ/x3
         Egx5MrwCeuJ4GAPURvY2KKJ5LMEL/MRjfZIZjAVVniNKjUwKp9/qcs7Yco6iXyUcJHRU
         PP0ULlANWbn2jZnHL3RJt95MA6mMCE3r3R30CYjrHkOzeht7jxGrOsRVEOJK0KX3fvf1
         iwzRDRtdCP5btbH+qaPz+mOCyl+IjRMJTRb/ATPXazlltXoMZtcVmAnSgJlL4mKCs1v4
         v5jFGQQaZbj9SJ65p5JMyEyhjrGOR/75oYzEPJeSrluL7RxjnQN5IECkYQBDHhwpbwU+
         5KRw==
X-Forwarded-Encrypted: i=1; AJvYcCVxZk3bEFu/5m9DSO1piBzlFfrodZ0+2O8uAe8QHAqu/nsTrDCsxy2KM0J+h3EcbClodtIl+stgTFbz@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8sdclbxuRklURTb8Ui7IMbUE4bP+f7Cug5fuA2k77u8QdIjSt
	g31vea7ent60PVQTvKENSnIeXETz84X1Z3xnaRyn1yEnWZ6wj0gnuDvJPzB4AX7Uksplx95PaiO
	e25DY60DoLNYnUnPFBgJqqCiEGfbiS9DcdXyDsg7dtms3BJL7L9rZaN2t/YDPR2W/
X-Gm-Gg: ATEYQzyaktOxMeShw4T4OGubxAFcld+yXpTZy43iv/6llxm36/gJ+xKYOOGOKQhEQgD
	08U6mqECmfVxIBwCUwOt1PMsq+CbHf/O7189p5zbnLvUGljqZ3vp6moEdfLiorXR4xdxgvzuJmN
	LVpYJB2QSF065HNpc0XmbhFKHvizc14hNVBZMnC2nEX+NuTeZ5QlhvzPpTP5JWJRcASlDDJyIyT
	wlJf5WrPXSZoYiAkcXsL2agaAtqmwiVurNTDC7VAeouu9s/FPqq9XT2NCswDH2i9H564+CNJ7LR
	Ms8h5aXQMThtYXExdYgxdH3oaGGL0DUgvRXLj8mm4hf67zOHIwkTDuB6mSbbWvtDnAgNfNM4zWa
	XcfproOidpQ7PQj+bATN4k6vhJw3nfdf4y1rgm5NuiFfADLRd2aepMDOOhJIOJQQP4vCYTGDB0m
	u184WH1tdR
X-Received: by 2002:ac8:5744:0:b0:509:33b:ed6 with SMTP id d75a77b69052e-50ba38369a9mr24560821cf.23.1774607137695;
        Fri, 27 Mar 2026 03:25:37 -0700 (PDT)
X-Received: by 2002:ac8:5744:0:b0:509:33b:ed6 with SMTP id d75a77b69052e-50ba38369a9mr24560551cf.23.1774607137280;
        Fri, 27 Mar 2026 03:25:37 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:b656:6dd8:ce4d:18d5? ([2a05:6e02:1041:c10:b656:6dd8:ce4d:18d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872717c3dcsm13044735e9.28.2026.03.27.03.25.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 03:25:36 -0700 (PDT)
Message-ID: <8c398cbe-dfcc-4ee7-af98-f2d89597d845@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 11:25:35 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] dt-bindings: thermal: qcom-tsens: Add Eliza SoC
 TSENS
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260327100733.365573-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260327100733.365573-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NSBTYWx0ZWRfX21FJ+4MoH640
 1Jbn0tJ9Y+cyy5QmAUSW9fSPqpJ3jk8UL38XSE0vzVxWeKEKb3oiNc+a6MtJKBulNVL2fB0KU5+
 wofYrF1MR913GunX7JCUWqyHLNAXAfTWnn5yGMlQbZ84X6WBulIWuTmCDotlessnhrcsq4QH9yd
 SaE2+M3T3JyeXCRPuRHPRbU+bboKF7/5Epy4u5z5BrNJQGlq6rwA0IqaK3RA+7YEqE6EHo1Kqff
 o0448jIqO0dUPFrsyqKABmEKPVTL1/qmug4ydFlnAjBkUNrHLC2yLFey1A9hcrtahF6cQvLJQwx
 8tsnJd5dr2AALj6J+VtUH/XWU7QztOX4WFq4ZpycgMJnhllxGpuIsOvmrMA264/MANbn/ySJhiw
 MlqnO92quksR4QHZrMlW3TOsRznBgMmrl/wcvklzFjhMMkVnwJaJYHyIuBz2t29Lkp3WsinvWpU
 X4gIzzJdIQO6b+9LIpg==
X-Proofpoint-ORIG-GUID: G7uQ0QCf__6dUqCu3jok80MZRzNdrBfC
X-Authority-Analysis: v=2.4 cv=BZrVE7t2 c=1 sm=1 tr=0 ts=69c65b22 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=XElCsiNtPgCGOgBlZg0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: G7uQ0QCf__6dUqCu3jok80MZRzNdrBfC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270075

On 3/27/26 11:07, Krzysztof Kozlowski wrote:
> Document the compatible for Qualcomm Eliza SoC TSENS module, fully
> compatible with TSENS v2 generation (e.g. SM8650).
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Applied, thanks

