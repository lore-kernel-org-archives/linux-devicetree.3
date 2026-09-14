Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F0E3F65EF
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373169; cv=none; b=R/i7J/ecT0QYr1VBOwRkg6XNcij98zEvDW7hc/vU6c1Z5HdGVaoy8zNDe6zdXQIIK80Lj2fRKoYum+c0gvTTDTlNgisIZVxKpl6j6q4KwcqmqxWvzZHiI9pm5VT1lCi5V9rsbW29NP621mkPHwxkCwyslr3LhiHh0yRFD9qUyEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373169; c=relaxed/simple;
	bh=b2FqTnEw1/hRFQRqvUOt4/hmdqysDshXRiF5dS67NOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eRKFwlbpFGLjRfc3WfhPC1pucvBzTygWFKxTbB1Hqk2TmAXHijXjerbH523sAH8X3KOi4mvCwKMwGL1jjaMueaQjgzUe0vWjuIU2MKs5dOBh5BjkJMzaUw9jeyiEYBJ8H8W3xXcZDzEtJtcJMvIcHeWRt1omSZ+poqusS7kqzWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SAqur3NJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QeXUmkyV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SAqur3NJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QeXUmkyV"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ifU13900798
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:06:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W0XjNnKxrhdkJEO1lOyERnjUwOJSfzdDQ+y6uKaxrfQ=; b=SAqur3NJjAHajSPz
	p71yL37AMtj7uRBHbsiM4yYkQgW26WJdrDHYpDLv/j7qZ20ul5WIE3ANCKxg5bl2
	pPSN0Bqdgo8Kyrk8uMEFIhqdPgAIT4uIYBLgnrvmo9cjmjO0fgR68gEj9d6IxRHj
	LH1AkNcOH3X3UygpIymjPAbl1DbsW2GwepQFj5hWY00HOIJCa1d3imAPPt5VnfHC
	c3JDmJE18TwZkMlPeXpmxHE/wZxsfSQzXbR1OMlitglBKBvW3of1qeGqjbHgYWlr
	wLHsPLoEJlUSMtu7AFwX9pYgF/gI78hLk9lpUxGfvDOYZ6BVn4Ig5CKrA6fHmQsa
	liGQEQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d5mv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:06:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-938fd633df7so45862185a.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 01:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789373166; x=1789977966; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W0XjNnKxrhdkJEO1lOyERnjUwOJSfzdDQ+y6uKaxrfQ=;
        b=QeXUmkyVV6FqUSr7vUT9mvLcf1VoXfqorX0o8K0f1iuQJI3ACz/O3fGSlQ0h78Suty
         xAaf9tiIzGzG+VEGe97DefDx2yxY6koWEb/8jyVDRkBTFl3CkTWObTT7rPLIDH1W6+qQ
         MZqk78ffwwnVNgnNRZq9GqDqO4RfQxvBRRigYTO0KQGE1dyw/mUD6fqtqjRM3n4dM/rA
         oZhGiNtQyWqUfTqqBBslzPq1YPrWDsBnAoVA/3fZgxLwY8aEJSCf1zsw07jKW/8bpV0K
         vUt8WmIrh6NBNCxvbZ5Pw8+eioFwDB23DxDV9hwpLp7dasVHuZlSIWtBsG42W+4No34T
         OUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789373166; x=1789977966;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W0XjNnKxrhdkJEO1lOyERnjUwOJSfzdDQ+y6uKaxrfQ=;
        b=KfeTB3Rj1lUTV19/+OIBAs/e66dkqIq8vpgGOnChAhSYBKn+F5j6ebk0WbHkJdrWaY
         IXmZJWHAe6qTY0jnaCXPLtKNxamYw+7+3vg6gQdO2IRvp2D8cxY7LOpoJaGX1XUZheb0
         iHdGK74qv4o39jLigZXzpYzpSTB3IdyTj9zOadNupdsoqOEiUiAb5T7JrpP4tUb41P7V
         BFcnLwznSwDewIiak2Hcmb6QxOojJE7n1e1jq9maoZAvXzIIgrVHHs/feMCd5mCaopHH
         Niz9RhPWOLkd1suaK2IkCL8IG8gQvpL0uWszBypkb642JvVwBhmJyL6gCbJ4bDB5XSk0
         PTbA==
X-Forwarded-Encrypted: i=1; AKwUvByLhsLoQ+kH4xe/KUkubNA91Gjd40Jp5oV+eClBExRQFBl6UKrL+BsfgOd5E02N2cpqJDe1bdIIy1re@vger.kernel.org
X-Gm-Message-State: AFuF++me3nfhruu8vqGrtk6+ZfEI6S6c5EC6TURkpWR+OXxUhhLifHZ9
	MQrzyguTAEMo5TnMf4ToK9irbiQ+K7WPZdNm1ONntWOnPOrasNWu2I7MR0qv+1PxbnK/OngBa/H
	P39JUbMwk2vmISW+PPcWCN+s2tu/2bIjIFFmTV8wBdfFeHCya2Al1JdNy7zaiubac
X-Gm-Gg: AYBFou2KXv5orjeBgc0jX7jiaA1aruRGFJurMMd3vH/7gtXYL67Egc16XOsCb38yt5q
	m/Exxxe+5WI2E5k+rsqY6CpJG84MT7s7cvuaDC1xhKjsPbJJvIWg92GKiKtODeuYqrEe5Qet3Zp
	Cain9OS+zAJOdGoofi6Xo/i4QFngUBvtOJ5UkCxyX1QYZzak6ML/O1T6PtOEhNVZSZGvApAa/nI
	3QiSFwvCSFkKvolkxGuHZzJIkUqkkUB4FH6MoTic9glWw9dmRlpyh62psvpB8cGKUF8b3wJqy/N
	TitnZho2cQfy7ceKzcyhzvDLqh8YZp51/diQyq0KjE4UOpiNgKuGznAMLRGNsB2FLN7Vb29v8Xh
	gpMdX7/jvULQeWSrnemTiuQ==
X-Received: by 2002:a05:6214:4307:b0:912:1333:e04f with SMTP id 6a1803df08f44-9122e149532mr19326086d6.0.1789373165638;
        Mon, 14 Sep 2026 01:06:05 -0700 (PDT)
X-Received: by 2002:a05:6214:4307:b0:912:1333:e04f with SMTP id 6a1803df08f44-9122e149532mr19325476d6.0.1789373165021;
        Mon, 14 Sep 2026 01:06:05 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b5831187sm3844483a12.1.2026.09.14.01.06.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 01:06:04 -0700 (PDT)
Message-ID: <126833f7-236a-4338-ba24-e4c56155c71d@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 10:06:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/17] drm/msm/dpu: Add support for DPU 12.1 on Nord
To: Nabige Aala <nabige.aala@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-4-e25c073cf1b6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911-nord-drv-dt-v1-4-e25c073cf1b6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDExNCBTYWx0ZWRfXw/ONiTkd4hiR
 tItPrNxscFqS27bJaYX1hraIYFrVOGY5mfLiKJHBPLrdOFUsSNskh6a5M8ucc5htIDy5sJsjfn1
 0DSQTq4Gqgv21QVQPRvoJDUJPjGKb9I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDExNCBTYWx0ZWRfXzr+68GqT9ZJV
 NM7sjp8YlCSJFYVICZJGls3DCVLf1r9vXfRm9PYv44fmzMYNgbaGYdrH3PmiHPjyI+gQIkjNxtQ
 d0AoxTMWW9YJjMXKYJpfKu7lfwcWO+XvRpRMEYjDgsELRrx9zPT4RYP/aIqUirULgdLoCqpbZbb
 z+aPKNOrn29jLogD5TK1jjBU+KFN2ElY8G5Uwh22zwwnR+yvHG4jv7ToN+jF5JqnRI29Wjswde8
 +CkCcVAv9IvROLY1qRH6sIbrl+d42uIhKM9qjbXUf5DpNdf6l/E2r+oznohdyL2Xn6aN4p3GpYR
 jFk1Kpz1ZrHvWFDlL/sQDckQLGbUnQyrBVHPcCM1/fsPYe5aP06zcWR9ccY6lV2NoDl9hp24mse
 SmA56LoHf8LX/d4zM9KlkzUew8CyoPaetoxiyA/Xn8NvUXr1c0YuKRrC3mSwGxbE6AxSWsvN9Tr
 lnKqnAUpCopy8Yf5FhA==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa7aaee cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=tJERSlHITJMJguJ_9RQA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: cjZ_5gObt6AV3OQDFpnJd1uiwQXKMR1Q
X-Proofpoint-GUID: cjZ_5gObt6AV3OQDFpnJd1uiwQXKMR1Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140114

On 9/11/26 5:36 PM, Nabige Aala wrote:
> From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> 
> Add the DPU catalog entry for the Qualcomm Nord SoC (MDSS 12.1, DPU
> 1499A). Nord is DP-only with no DSI, and provides 8 DSPP blocks, 2
> writeback blocks, 8 interfaces and 2 DP controllers.
> 
> Extend enum dpu_intf with INTF_9 and INTF_10, which Nord is the first
> platform to use.
> 
> Note: register addresses and xin_id values in the catalog are borrowed
> from sm8750 and precedent platforms and are marked with FIXME(REG_ADDR)
> and FIXME(XIU_MAP); they need verification against a real Nord register
> map before production use.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---

Please remember to mark AI-assisted contributions as such, if
that was the case..

Documentation/process/coding-assistants.rst
Documentation/process/submitting-patches.rst

Konrad
