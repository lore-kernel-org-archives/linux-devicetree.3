Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974373D9DD7
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 15:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782314672; cv=none; b=MhkkqUfXERfuzIvVXVFpHNjLQpImO14ooa/nHCEQfvgA/Myc/akP5bIxYmGPm5nbbCNURUAfxxNeJk3yhzBnUwU5JT0g+0SYlY7yBJQwL57A6Y/IjcwR7UiXjCMhNdlJd1dyT3YJn/5cD98hk8OSw62cBVlK4t4kBe5Hu6YpqCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782314672; c=relaxed/simple;
	bh=NIFqQ5VLQEybFPbf8kx/MQ9a3MhIR+vN3+q09x1MJnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uFumokU+CiBnB5AEqGzHj9OjMegnRPJpaRlKP9utAbbeTcYhQh5l7XE8XIYSQkkzYLEqMgQRO/GO4lH0JkRvqvOKGEVNj/F7FKlPdfRhaRRc7Ifv+cSzkbK2rKrrKUCXf/hC7omiO5J6pOmd3Pmi4BNZj9ET5joPc8kitdnPouk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fTBfZGje; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aEB/TlsP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fTBfZGje";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aEB/TlsP"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OEfD99564572
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 15:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hjwRC0IlwgSgiL2c9VHAX/AhDHtnXxRe7151xT3/ODw=; b=fTBfZGjeHvyz8W4j
	WDD6AK+h7jOGUQOaAAdxWSgm5Bfo2somcrA5WOUtzVa4BGUsInTmQtn5NrLivw6w
	QMZbGX6p+DuqZxOtOQ0XdeJLSlk/cKC2xZOojkZMvKMBihmMG/vCFnQvZqxiD3bt
	YobFQ0qvkqMddb2cykgo8ZnxoPFJcxI7UCITEd2EdFT2Kez0avO0yX7du2gDRurf
	uUCPRVUNrIHUq7ZddeHJCIL80zQP48STnmRoG9pl32GMEo+3rEDZcrv1qS/bOajV
	9a/bCKIouG6/JLOeu/HsJvYpmvfYpXLkMUA5o/aJrdd+l2dSdtg6mK108Lu5jj7n
	ekeVug==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0aqp9x2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 15:24:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c7645ac9b1so10798475ad.3
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 08:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782314669; x=1782919469; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hjwRC0IlwgSgiL2c9VHAX/AhDHtnXxRe7151xT3/ODw=;
        b=aEB/TlsPdhPPsAH2yUCcI/I8DoOL/BQT31h32bYTMop/ikgpbG71IApi+VrSC+QyQd
         1Mci5JlvIx2/OBbfAHsyn08RlbF4juuYh+toY7mW1gtvhFofuz1kR1jXEzE5YRuv11n7
         mCNYmuHaX6BzuvMApxAjRSsVSaex2abljFX3MLP3cZ+I5xfZO80fEOeMKLNNcKBDe9Wq
         vq9OjiGBqPbL7SATBDZo6cCQW3XoUsZ5LmH3dI5q48uoTrpv4OT23rToZIBDSDH2KaTM
         c4X6CoQ1f+o5bh0gSKRB2TtuwAt1pikyGzEZyaNeAWUv4HVDfXou4bBwKrAwF5QpF/2E
         i3WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782314669; x=1782919469;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hjwRC0IlwgSgiL2c9VHAX/AhDHtnXxRe7151xT3/ODw=;
        b=KHq9TJ1RzwvkdgfyifbcMY3QaDFf0iDcM4YOsHMhr5SgcsYU8fgYO7+rhJBHwr9iuo
         i+euzLSyqSif/ape7Uo6Sx1oZI2N6T37TYHlhb+uqZwYCvL8sfkqGQ4Y0P60U4jlyfMW
         E7nM4ZW0OiDaBnIs+YPzziVN4cT1xXyQkXZX5/IzJrZdEX8rzSb2MuaX6YiOomM8k5ay
         2/oQr9ZRkfQKWbM7IoflGfupVZYfxeRaxrKzhIjC3vTeyKwO+jKjkgeWG2y48AU6pWij
         YBjqpbV52XAWPdIagmHYyL3HDRjKrOuUiOq9N/fq89MtIzkgy0h/yhBsLPe4mErgTK5Q
         zoUQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqstd3eqK+wlFXGc7fYpIaKw3G1Eqcu2hI4VKALVUZnmGW21LpO8mBuzbdp/t0IYBKOg6f9XjYrs8Ev@vger.kernel.org
X-Gm-Message-State: AOJu0YwRkSQx10HoBvawCDxXOmsfn/fwCpGOvzvo2mlcAawrOgil42zT
	sYeLZ7knGVp9PlECVNZDpEAv8wxd3AG1dvev4ayUz0+yGkfL+U8el2nzw8nmiZh9mhgGjeuRMMp
	0R8yYHcSlQYt8n375/m37c27oHVuD1fRAMiOB9gGdF5v5283aYRxNink55WXUbDIN
X-Gm-Gg: AfdE7ckiOn5zZGW0QhKtvyCB7azmsSah+78sFgXGVoDdnKPacL7DSZS6wZ9cskWchbb
	7YtOOy2lM/bVMGW7VJr0Uas61YatZGDeKXHuns/jiRkkMDthIP1LL3NWRm6HH6q7OPODYTnRLa1
	jlx5+GU3hbxYq/clyWPli0Q8Iqdt7nN2lkXvJyr7oI3pgqT2yaZjuxtmLl8080Osp6fHnX+ENe7
	e3wmK54DNf5qOg+o7wUrZ3elaM0+15prmRFu/7zmXUeU42ncLyFA46iObGu8BtDm99ar7xkQaiH
	29mZmnuEPgHzmQGKSrLqNGd8nG0Gyw60I/Q3svcNLW8Vg1jXf9f0eW6UO8vVOO13ztSGOKZWCZv
	rU4/pO8/Ilp2NJRhhXb700w06/NmPSAspxoVtcI55BP9t
X-Received: by 2002:a17:902:f68f:b0:2c0:c3ac:4ae6 with SMTP id d9443c01a7336-2c7c769409amr78275105ad.19.1782314669401;
        Wed, 24 Jun 2026 08:24:29 -0700 (PDT)
X-Received: by 2002:a17:902:f68f:b0:2c0:c3ac:4ae6 with SMTP id d9443c01a7336-2c7c769409amr78274685ad.19.1782314668780;
        Wed, 24 Jun 2026 08:24:28 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5ac9285sm774625ad.11.2026.06.24.08.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 08:24:28 -0700 (PDT)
Message-ID: <8e49dffc-f525-494b-9489-8451aea6c7dd@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 20:54:22 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/16] media: iris: add Gen2 firmware support on the
 Agatti platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
 <20260616-iris-ar50lt-v5-14-583b42770b6a@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260616-iris-ar50lt-v5-14-583b42770b6a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GbaohFW7yDr19WuSVzC_z3F4qzC48U0P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDEyOSBTYWx0ZWRfX9+B6EXf2wphG
 uwNlNCDMGxwFAgCi4NfY1t0D+i0po/KMBCxONgTgTGu1VLwOMB+Txuwv6V5JVbycccQymy4nhf3
 UzZWdhSPAg5anwgX4O4SSKxqrOnFy3OVtCG8hEUL39Te8okAtlOZvNH1ansPX7P6M/KBTmYf30m
 0nPEYL7lC5ZMyutRY+69Rz4q5bapKfXsU6U6hBkI59XOjdzn+vskrBQ16cYdJY6UZs13fJ/6M8x
 Rq99vyi+lu/LmQdf9izZIsAjUthhN5b/TPNc6HdaboIEOl7ovOVE7TSmO/pTUHS0FvfwYfSq+24
 Gx8J0PdI7qsfFnZJVjjdGwHzbqQTO+F781cN4bIUj605ufnnju2gTmoJVSojD+AL5TPUUWSjktH
 43wkslvFheNY1s7W50fZ5ezhG798JA==
X-Authority-Analysis: v=2.4 cv=QLhYgALL c=1 sm=1 tr=0 ts=6a3bf6ae cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=PGH3J_xsYvR7KH8m7zgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDEyOSBTYWx0ZWRfX+6Q081v0oPyP
 ozIbkjTD/ZxiwGkrRza4TiluYMLCzOzE+2wBcB1hnLoSbWOK2kgm8kjJSGRYqTLXM5UmHJtXXEm
 gx0BddNGMR90qIVb0a0sSB7dbfJTopg=
X-Proofpoint-GUID: GbaohFW7yDr19WuSVzC_z3F4qzC48U0P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240129


On 6/16/2026 5:34 AM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> 
> Agatti platform is using HFI Gen1 firmware, which is considered to be
> legacy firmware branch. Follow the example of the SC7280 platform and
> extend the driver with supporting both HFI Gen1 and Gen2 firmwares for
> this platform. Like HFI Gen1 this firmware doesn't have PIPE property
> (but unlike Gen1 buffer sizes are calculated on the driver side).
> 
> Signed-off-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 613 +++++++++++++++++++++
>   .../platform/qcom/iris/iris_platform_common.h      |   1 +
>   .../platform/qcom/iris/iris_platform_vpu_ar50lt.c  |  11 +-
>   3 files changed, 623 insertions(+), 2 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
