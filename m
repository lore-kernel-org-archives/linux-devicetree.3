Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE96320CB1
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177807; cv=none; b=s5YvJzud3ErRyGXmxlKxcF8T/Wx88Xk00iYdQrx3vAP2nc0hHJEvAuxKCsoH5/dyw2INBEvCcBsLY7dfi9Gr3bbHPB5uoy1dSncIBP5t097M8RaKS3NXh4M3bEdGySka1VajhaKbPwPFD64TwQ7C5U36XK+jSFuohCGQJ6sGTSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177807; c=relaxed/simple;
	bh=6U2EpQbl70iTBwLkHktdUzi2+kfxjlaFpz2VtqrjLCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N7DtEKTaGMFCZfh6oR+rwmVnYcTxd3Fd9H7gj+DX2Qs3nxVg1c+ktJq8Hw+JTlDL/mR+FI3aD7DKeM6G2H+eT4tAVx1Uf8Z/tj3Nidh8qIpo9TeXnPiKASYXxV3Av717pZttqJrJchDm0mE1b/AxuHFCNI4dSmvY9A7YYTDoENw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M/ReORxb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cE1eKx81; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M/ReORxb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cE1eKx81"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA1gHq169237
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:36:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=; b=M/ReORxbC+uJNdAr
	ue6w04RQy9ZsKUuwsU5y4oTNEz32OcfOZmzBjqijMk3DpBEjhK2srKWEo7I/TyW2
	H6qhd7/3z2q5qevvqsj7hF5mmtrSV/kJuHz684Auk/GBOInUGwy0bpbq8xw42G7t
	oHeUsRqTbt+6i4BGpdRbbj85RLT3dEtgYpksBAFfcSq4O5w5tYISPyi3OgS8jSz7
	0YOecCquKlyIz6F3J4H/fYmPwdfFvNVtv1IFpT5+Mleu+DAjaIydglQGa+roHA7S
	QxPQcQomoCF9AHHMI2ls0aFXblLbguwgf1KYOSJcM459gvp+1Ty00EG4hutte4Bn
	ZNw6+A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6ub66t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:36:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517796be724so16380701cf.3
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781177804; x=1781782604; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=;
        b=cE1eKx81Ysgfih4BXz4Z5US59kluy7xHOEzmkag9UImi9FzFWjcGj1gB0v7S9sVH2P
         s9EFE7+m4nflFLe2hrXMmzcvSjcmr6RKsLOCOrJ7yquWjjk4v+hLiGBAfYFPWzLsKTFg
         W21jVjAymJei8A6tHbHDz2dYFdIVGrdRSFwj6qy2iQFnk0Nhvzy5CYJOzXFK2gGlzivm
         8Swdg9snP7Hv0CIaEgjkPCiSHZ2nsXQpK2eiru3SlPfLwZH1GxPH/nbrIRUa8/I2g8fP
         YBNfDoQgZfwOe4MHxO6K66yb/heYbhqz+Wygn/y8CCixojcGYiLsZxVIWVruaPJdhJVk
         1U9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177804; x=1781782604;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=;
        b=g5tYxpXznqaRbAiyNVBCbbbseC/3j/4WVScLD9nDsFXINTI5qseSDri+mP3GarJRAC
         puJcYEToQidcvU9Ge1bUXgoSyO3ehqhLIc9Lsi9CGp2NS5gEyAIdwFN0LqIkXrFWgyeP
         N9XTDeUIR9xwBipQtIF7E6oZhzGk3GwjFz5zJrkqKnoSeSAse5l5Xi/crOA+Fu8NSipr
         RDLLpuwew3/+LZbiQOsRCIdNL7Uwfg0VFFcfPodev13f2IsTyYc697+5OwOJdjh02RVh
         mnRz4leb4j/f8PSXwWc1dVayniSSuxMWpVPxVoebaXl0J9CywH0F70Llly5i7c6PNmu9
         lwZQ==
X-Forwarded-Encrypted: i=1; AFNElJ/B/HWp7/6xrabe7dGwmoFN6pCr0yFS6P8NG216w7jM3XYs+UqhYx0J5vYwmqjpvQItA/27kEzG6vxg@vger.kernel.org
X-Gm-Message-State: AOJu0Yykb5IJNLaGCp/pIRXBTeDb5q7wH17ZuAYqqIyX/QsPi5oy6FHn
	lXTRl3D/QWtaC+NzVP1ySX/Adz2NgfZQURTM0Eja2P/JW7bKjYnXFfpIbikV5Lpw24v01wYzu6g
	SgsPMNkhO0JICqEpkC0EfMc1m+0dMUnaOpMvawjtv0/PEvqwt8OHR4+hGkGg5PdxB
X-Gm-Gg: Acq92OENn/yNOvGVLZIdCL9MEEOC2aJKoJd6uhjmrl/Dt07R2mB7xCopbuM857QFhWm
	qy/Kk36wJEfauhT3x4OqoS+/insIZQpV4KgBqdhBeqelQBG2Gr4f9YCtC21kTvzs8aDQXucVuVA
	lIEWEaZ2qlRaQO6cc0P0+SDvKWPL+ZUJOOpID68O+5k1D52gynoTbeWxiYI5Vqb3w52zdyJN7yJ
	In4rL2yKUUd2N18Zv9oMhICMgB/plsfoLRtksXGz3HAwdA9kcHXGUNV6/N/8HIaaDyVeZkU2pGi
	BJc4Z/RRbAUE6RCWWbEKfCwrydlxTtuilk9QtBjLhytioMvxC98t1Wqw/TC0npBBpDFjI6ijMLY
	q4isQVJXB9/WGexa3rMzs2y+fy/C4MLlSnxqLaW3Jut5toDfym07k4kbr
X-Received: by 2002:a05:622a:1dc4:b0:517:6162:daf5 with SMTP id d75a77b69052e-517ee1d6c66mr23523631cf.3.1781177804557;
        Thu, 11 Jun 2026 04:36:44 -0700 (PDT)
X-Received: by 2002:a05:622a:1dc4:b0:517:6162:daf5 with SMTP id d75a77b69052e-517ee1d6c66mr23523271cf.3.1781177804169;
        Thu, 11 Jun 2026 04:36:44 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb0f14759sm53797766b.6.2026.06.11.04.36.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:36:43 -0700 (PDT)
Message-ID: <ec710ff1-703d-4688-9db1-54ee11b2035f@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:36:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/18] arm64: dts: qcom: sc7180: Add minidump SRAM
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
 <20260522195009.2961022-15-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522195009.2961022-15-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfX3jIXX82RuhxL
 XStYdTz/RP3PGGbZVN0bGze3nq2ga3wv2029MmjfRIaIanq6LjIqXHKVbCi+F/diILt8SAhdiSr
 4SVGDCkLnt/q+kLe/1pCvYP+FVjSaIE=
X-Authority-Analysis: v=2.4 cv=atOCzyZV c=1 sm=1 tr=0 ts=6a2a9dcd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ZpVAhvDm8T4WZmbhYYoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfXyMBGer2zsbQc
 6sRTkbhCqw9yX4I5937XVSpHgg8VxrnRTEDBoU7gVuBiy7ueH4HwCgXGeQ5jS27k4uicJz2uS2X
 r0L/x8sdMs+HbxZxBY7aMh/QfepE5LAjXYQD1RaBoY9D1/nQs3aX1F07lk8URJryIQy+pFvZx3V
 vj/7jynmwFtjznZe7lr55y2hGu1Xnd1Gu/WpafGof2U4YZpbXomY89Lz8EZn3tXwEmBgT4CHPgR
 t2fHXTyryEtnnvUPZRsrW9/bYaC40C7knlYTHqxnYZAbraw7HBSWHTjQWywKi63s/rY+apBU7e4
 g0syDdeqMCnqqH4PPo0SRuf+N6K9zCbnEXXkEFHn7LPPtpHrmCJeAjsYhgxTzxBRjZjSo/WYZ80
 qq+Te6u01MWV+11hk73JPBzgHQC/PWaV35dNcMZw/cVDhoL3tK/PvMY8+RrKka8HixkaekTgzBH
 xsM/7pBqYdpgYbV4fUQ==
X-Proofpoint-GUID: YVK5ByvCGnH1NtMGpd-XuvqA9Unrzth1
X-Proofpoint-ORIG-GUID: YVK5ByvCGnH1NtMGpd-XuvqA9Unrzth1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110116

On 5/22/26 9:50 PM, Mukesh Ojha wrote:
> Point the SCM node at the minidump config slot in the always-on SRAM.
> Boot firmware reads this word before DDR is initialised on a warm reset
> to decide where to deliver the minidump.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
