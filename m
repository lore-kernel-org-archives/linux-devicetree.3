Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896F63112B2
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 08:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787734604; cv=none; b=TmEiKBkUns+wswDLlG+a8hT7912+x4X6yJq/kwyKMcpKs61x6UFdGkS1apksAzBgBx5so6XE5fcmhMjoxJDYaEOQdXCpI+pqhq2TCgen1cMxVarmkU3Wzs3Ah6DA3SLJvNR3FXPSey+m6kSaPEIS+16Okc//DuRZmvSa+tMvuI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787734604; c=relaxed/simple;
	bh=zBA9Ln32tKtaVls6yBym2OtPbvtMi6jfHvO/OWumf3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JYUqz2YeOFTkujxHmWaGm+LQzIof83mJHrI489hg4wesalKiialbcUTrpCSe+GZCvGkWsE/pCn+92p2QEve4HMs8XOw5gJ6ds4j8NIuObfN2BWLlZTEU0tUboeIBb29EmSJxAGJRYyLXu6iHINgnSFa5ki4m/U0JasNtKjOlYXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jBpek1qe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JEI1VdDf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jBpek1qe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JEI1VdDf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q7MqLJ1261184
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 08:56:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zBA9Ln32tKtaVls6yBym2OtPbvtMi6jfHvO/OWumf3M=; b=jBpek1qeAZWdCa53
	aIujl7BvpeMGoLdiuM2HcTYSKGiLw+nAhMrYS0oHyG9BvbJY9rrTgxrP0ChznGd2
	2hFg576X02oUKPHm0+WgjW/8PIzBFYDt7+Jq+b3qZawhNsaosuGrXXt7o3s4mdW+
	DPg9SsPsnm49Ha9kxg+YTrv3GJRVi13aWROwyERwHcnKhfCVavQ0Gl+pxEpDo0KY
	nvTkoHycx48KnuOw8k6dXfuFcUuhUsCnwIP5nWw4IzBZHqTv5OVw9lmagKxWthwS
	4HCVVnMlMKFCxwovTZhzKXuiG7SNMylApuhiJCBarzhPybDUO/Q4KMDFl1Mjv9O2
	saGLNA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uq1rcc9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 08:56:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52ee59064d2so582001cf.1
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 01:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787734602; x=1788339402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zBA9Ln32tKtaVls6yBym2OtPbvtMi6jfHvO/OWumf3M=;
        b=JEI1VdDfWDaDa8+GcJyiB47QLsqW3c1+tzlL9zfDTyddnCMkPwVQbQzDwJNqQlTvx1
         7/uMwsOIjLRYGfPJR7xPMam0m4WvHTdPdShbX+jFAKOY/9j2HlSaZjRtT/62WV2YSZKR
         sDJfRFFOGcSINYHk5YvqLM63ieFg4bt0Ccs3Z37beP/iKTEzfs8vPCXAnqp3FI5w3uWU
         8gPBsCnhDDJdhK3+tum5maoeLGwEM5YesknNXGLQAQKJZb3iy2L7QyEhO6X39eNUm39c
         smvKKk+vgl5tA8HfOQ92nHoQ06RWdsf9caPnrKlQ1HVkxWDKvffRP4rYSeeTDL1A9YXR
         rLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787734602; x=1788339402;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zBA9Ln32tKtaVls6yBym2OtPbvtMi6jfHvO/OWumf3M=;
        b=pzupZ5lC0ZvgP6vPj7307+uKv/hvesXA1mPDSv5qo2hjs3VrzCo3H1Gy+MJUo7rroP
         KmNwtVp7/HdEtMm6p4e86MvTed/7bHuV62uu8M3oNDGqzXUERKKoTPJuhw7N1xkXoqtU
         ZDl6lNaAf0gQoOhrzGdOHC5A9VD/DefkB35lBJzCCsFRX7d55hx0xQ+NoEueNXcwsrvk
         brUY/n8aQkD8U0M4XSKakL4zpRKYH+ZEngwt9RCuG1RWCyPSBPAwlfxg+u7WXjOAV0tb
         ftj0OX6goBlhbPk6iE0IoMMIQSqDuDFku2zyGN5GBwTyxKk43mOOQ/hR+4CAkeUYYipc
         RnZQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq//AYyS+jbg/5tZusVEp79p3822CYbLO+o9bOXqDwhJM2FBBIDdUR6Q0cSuaZhe/AgjdcnHmddpqOi@vger.kernel.org
X-Gm-Message-State: AFuF++mh/uxn8ugRJbieTDfhMJ9OhradbuxsfTNQLlFNnyNqLi2p45D/
	4QhZ3Bdl7djDn0dmswuGwVxLtK/3SKiWSgwT7TFj6eue1b7MfwPAYyCZdTS3AhozocdHhK0/QhA
	hf9DD6J7kQJ834LsTlbBPDUhofhjJz4oFuYfY/C/Or445EIJEniiZCiqcqydEQsuHl632Y3kh
X-Gm-Gg: AR+sD12H0vLZ4NCXGiozHY7T/1S8I907EafygWJJpQCIl4Ody4hKr5UayMT6i5urxJ7
	wm015IO27xtasQMQAznJCaDQRNc9OEP6RTgIRJwDmubjaDmrvyq3bcQo2ecSAMAhVbGR1P1YddO
	+Kjdok10baX7pqQs/jXnffikXSgxs+AJuYvzMyPRPSw1u/SxFajzg+PZTHYNAi42DBbEc7zTWn5
	+hZs0L9jZ4RNZmb6nxEHTBPK4ZSavpnJzLHpJ3philQlo3GfAVmeCouefLbkwxWIXn6/4E38B3r
	ErxP+TC1v7qP0bRmq/5vfZc9e+qTxJHhVMS37H7UGUNNdLH3x97JSUIVGFidV8il36vd4+v1lzj
	AmkEGulruY89xhn128bf/niLn1XgK
X-Received: by 2002:a05:622a:4d43:b0:52e:1e5:45d6 with SMTP id d75a77b69052e-52e2ec3ef5cmr141617821cf.6.1787734601733;
        Wed, 26 Aug 2026 01:56:41 -0700 (PDT)
X-Received: by 2002:a05:622a:4d43:b0:52e:1e5:45d6 with SMTP id d75a77b69052e-52e2ec3ef5cmr141617641cf.6.1787734601351;
        Wed, 26 Aug 2026 01:56:41 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5deae5064sm3859894a12.27.2026.08.26.01.56.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 01:56:40 -0700 (PDT)
Message-ID: <bce242d1-de57-444a-a1b6-93a941372f01@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 10:56:39 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/10] dtc: dt-check-style: Add warning for redundant
 white-spaces
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260826-n-dts-style-checker-continued-v4-0-022e60091965@oss.qualcomm.com>
 <20260826-n-dts-style-checker-continued-v4-9-022e60091965@oss.qualcomm.com>
 <20260826071827.867DF1F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260826071827.867DF1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: D56x2e5rZaMGQXHA5IYopbBaWZX9R70F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA3MyBTYWx0ZWRfX+zTP5CdhnbYD
 B79DpVDCwu0AvPNmZ8H+PjJnmpoci3horEdb+6MHMocDkOqr30dBZWwa2BC5fmVN/rCisvF06qe
 KcaCXBEraR2tn/hpQPegtXjlcOahSyKFSV5vqcn5KTY5K3Tc21IK2VkqRXa28TBu5igUi6/W+WA
 Xjl5Bp0MiJTGOAA64CQ+y4AiEU8YQDmzNCwbV2OVAhzSfOz5SYk58EQDGLTYCZflbwHQKtJpHWn
 MFtJv+JCFoOqIdjJoRWVDb0UUVi2XrvMPZGlz1G2KWh3kQi5p6d3TglHwaDYsjcFQs3Q9udpDMs
 Y7z+HJQZOUjb2KHtBXjTUIE8Kvp68S5LHBQCbnURRKsHSBlcZhcPpT202DJhjl5Te5qsoQUAlUg
 Q2IwOKskaG/dpIO3rj/Dby+/p+8+B1Gctlg9IP1SQYt8B9uBB2GBql8Sdp+O7ODYvEBZGy0oOOx
 J/agQawx32ngsF7m0UA==
X-Authority-Analysis: v=2.4 cv=Y77IdBeN c=1 sm=1 tr=0 ts=6a8eaa4a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=6GxiE0gnHNR00cM43ywA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: D56x2e5rZaMGQXHA5IYopbBaWZX9R70F
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA3MyBTYWx0ZWRfXwl6Su7DD5tb5
 LMDc50zFWAK1FlOv/KQGLMV0Di+UTppn4gbu+T4jnp9aWASLCEQ/Qboafn4zjKozdOKxnaUhBM4
 PmaT+oV41AKt77wPgnrVtWFM0vdT+NA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260073

On 26/08/2026 09:18, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The regular expression `r'(\s\s+|\t){'` uses an unescaped `{` character immediately after a capturing group. In Python 3.11+, the `re` module enforces strict parsing and treats this as a malformed repetition operator, raising `re.error`. This unconditionally crashes the `dt-check-style` script upon execution.

Ack

> - [Low] The redundant whitespace checks do not validate continuation lines of multi-line properties, causing them to silently miss styling violations.

Ack


Best regards,
Krzysztof
