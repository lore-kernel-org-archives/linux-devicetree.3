Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797B237269B
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 13:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783517535; cv=none; b=FsQyIupJQJQP2vmqiWVtZauuERoOavYqPNgLZH3ZHwJ3h5eJxOnbbqabsgVszmu0ZigrezqS3ikygOms/8YJ4e5HOf304karZ0gPfk6L+L98rR0ahp3/iOl1U3i2cm1i2EQ0Rxwdc9cJJZjweeSgXW8Kbg6mHGoHYQOtGh7fK6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783517535; c=relaxed/simple;
	bh=EQ1jIdlcU3NVEUcRZPqdkA52NN9vSTIs6hoMLIWzXdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IVhWUU22gWvV3KBxdsuf7s1Y5O5PomgZnUJl9k5MxchXgAKWemXGAUOjaL51BfUew2wxtT+TyE5J6U2CPwKziA3Sxs+dNxA8Fi/q0G4fxdAVK3XOY1iK/vSuF43MaJpOcmRmxRRbK5Ts2dpE4u/gvmnKBl5jReqO0cqB+ay2WGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kkhy8k6p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VVldvUrd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kkhy8k6p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VVldvUrd"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3iQE2715599
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 13:32:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EQ1jIdlcU3NVEUcRZPqdkA52NN9vSTIs6hoMLIWzXdg=; b=kkhy8k6pjAhocsdq
	wMTDRC1XD2hisJPeyiFuVeZMMEh9UqOUrRYpEq9+3CnlIwyECICCqrlTeGMMgECB
	CVCxH6GnqETyamOUGT8BZcRZXyn4x/TwjgFNB+BstN/X50ngOrG0Snkz3ihWUlBL
	8WFIRz7xJfpbHOP2cd+buAIiUYR92zXXMhbkF9zwiNoHy/Xjos+MSj+djtMavxpa
	Fl3UYqnZB7XxbhZURXYYggaX8L/A0sOsB1y8ywNwZSej5y4gjkz+Qei/wp5qiNQ8
	Ff0WZIWliOQR31wFQoNQtO24Uq4tCeCAoz2oVh6LnthyckBgTIHEvKanmzrSbt3R
	CtUKLQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95fd4nbu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 13:32:13 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-969208e497eso742649241.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 06:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783517533; x=1784122333; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EQ1jIdlcU3NVEUcRZPqdkA52NN9vSTIs6hoMLIWzXdg=;
        b=VVldvUrdZhsRytwiG1avhx4//c0K0B+OwK3K8ys07EhjhulrcepFGFG53rLsIEaCMT
         rOj33gfU7NJwiVScTGhYEis5BAIzD3wMx7DGX7UAsMsgIYjEXEkidn/hGrE/QsaAYnHm
         zZK3hlBYsRZFsgLl+lpfOSX3tPBMsrkkVFg3PI5LXBe+/YSSgr0fbt2yvgFQDXYidIg3
         opaPxDIdwgiJfMbfCbSST3WA80KKFeY0XPV7oa9c6sPkJpO3ySdRObQ5oJJ0HnGr9Uk+
         15YTWZT3plSlJ6VRZNMOrrJwrAiEW6U4yiq8Qe8dFnBigM3X2tYOSEqbuIorxbxWz2se
         Q1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783517533; x=1784122333;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EQ1jIdlcU3NVEUcRZPqdkA52NN9vSTIs6hoMLIWzXdg=;
        b=UISP+a7pMw4UUySsI/vU6udm2yYaJ0Yqxk5TrXJ6VzwftlKKA7pcf1hFFIiN/qV+O/
         QvhR2A91rsipIrL2QIeZ+hoF7usVweB7HAyF61fcLYoq4iJnVua4gCL6X8VaWwNqXN4q
         4CcJDwx/89foUTVcweE4mez9XsPpXDzeWzMVuGLlRLk4PSKsxKaZK/hlkOKBuF8zrklh
         V/Jtgc1tyoTgLZ9jvbm7LdeoV304nEUofD07sXTmvtm1XE44vpoW5ZvIUYgTTzWUEfE/
         VhXXv7rEZLWtMawCXvpc52Ejp83Aa1FjTLoq0otPtn6+oSyvxSN6x3u0+722gwqsELum
         phug==
X-Forwarded-Encrypted: i=1; AHgh+RroHpa0Floc1N3LjAF8rMx6orGFxnoN6+TEvZDjBagNSwlPaBZnwiHrUZzsLKPjKSNJ8Ahfxdmah1wr@vger.kernel.org
X-Gm-Message-State: AOJu0YxZskBRRkOtoFxyNjaWp6ztdnNyVciFuh1PqUeDupDZoNqczpO4
	1evTN0bvo6dyOO0cYQXnRnctp/KyOwV6GRvWZ/pq6jHTcmJ99k+DLkEfF8+toFBA394gR0PLdL9
	daPsuXxwLQfXPg1bY0mOEcg3HCqdtDojLFbYOQUmahszlz8Ja9MZr7/kbrd5e4A7i6r70dYvd
X-Gm-Gg: AfdE7ckwyLHlvSVHN5qlMCymBb2JfGCEBiap2h7S3Tu7Qs+YY1CLuPcZQKcFz/+85hm
	om2JovKqBlztPQbR3KGnyCE3eSwG8Wf+pkdFbi8/gHLxIYc9SOZTq+19xZ8V6L8HVZFoSFHs7GD
	RETC0j3tyz18JN2CpFANGxixk5oyb0jLevqM45Esl4zPDAVIFPUmlQgOrCaLe/S6NzzBHDkyAFZ
	gZlE2zJ8wQMBgP+gbj0p47q96/WX9mz10tZc0PJxspT4neVX7v51+kWC941z9ATrEJ63Uftkz5W
	Ed2Fad49jfgFX62j5KpwLLye2KIhkxf+/tLPyeGHyHEe4sYBM7JwB9j1awepPKekY0isC9lHbJl
	Po1zKznomSmgbJClFfA7yFpwkryWEVOLJRWgU9WFq
X-Received: by 2002:a05:6122:1d42:b0:5bd:b27c:bace with SMTP id 71dfb90a1353d-5bf75f00ecemr1174615e0c.14.1783517532849;
        Wed, 08 Jul 2026 06:32:12 -0700 (PDT)
X-Received: by 2002:a05:6122:1d42:b0:5bd:b27c:bace with SMTP id 71dfb90a1353d-5bf75f00ecemr1174593e0c.14.1783517532429;
        Wed, 08 Jul 2026 06:32:12 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f43912sm160008685e9.7.2026.07.08.06.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 06:32:11 -0700 (PDT)
Message-ID: <02dece0b-a105-42f1-b57b-5cb3b8beeb09@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 15:32:09 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] dtc: dt-check-style: Do not sort top-level nodes
 in DTS by unit address
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260706-dts-style-checker-v3-0-03ffacff9226@oss.qualcomm.com>
 <20260706-dts-style-checker-v3-5-03ffacff9226@oss.qualcomm.com>
 <20260706160540.032001F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260706160540.032001F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEzMiBTYWx0ZWRfX/SSHGO9bpVNv
 kgB8vXih/p1++vqtItc+eBg5AvyTjf6KyCv9cQvMTBcTFmXo+cx2xcUY4Dc8j1Y+TpWdsChj2FH
 zAWUtJfd1aSIQikPdnRJ/ycrVZr9caM1KYVPJXk10hOwdLAxoqfUS8t62RFuFUsNbtJYpdna90Z
 iqC5r11eUw7yIwLVhgVFV6TOXm8iiSt5Ux6W/3Vnw5Jfh2qORIaabb0qM9pIgfIxii+/dOsF/K3
 E9CPBWFxoT2I8Qivb/17TSTHIZva/LE3dGcwM7cA9TKSGmiXKFfdGGUux0xHsK2FDxbAlv7unl9
 DrZ6vjYLfXQCQpBekk2RN6ZS6lEuo6wyiQ9arn/MTTZdp8wAMUXpUSqtKVRlQ6zrNkiaWhP22AT
 bjGKBEqWK/3wXbZfsd5RDZZEK0JG8Bf8cYxJH+TlectNEB+BqBZiN04r1mGnU5MAd7aSi1TdBhO
 aE1G4ZCNSgXqg75/AKA==
X-Authority-Analysis: v=2.4 cv=VZLH+lp9 c=1 sm=1 tr=0 ts=6a4e515d cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=3ryqjR-gYcLxyyiNjjkA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: yh_3CUx7OQQ4bp-WFTPJxp6br7hoJYj7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEzMiBTYWx0ZWRfX6ejv05Ckhmzs
 oyc2P/myRaU4cAIek0tv1FcktNg03sf1aeb9UEK5KrFZrNlgcAMh6eYX5lig+k5xqlzxB2ZGMdB
 D+tHxEgLUCmBDKkLefAkTFDfNQnCuak=
X-Proofpoint-GUID: yh_3CUx7OQQ4bp-WFTPJxp6br7hoJYj7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080132

On 06/07/2026 18:05, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] The checker script inadvertently disables unit address sorting validation for all immediate children of top-level reference nodes.

Ack. Added test case for this.

> - [Medium] Top-level nodes with unit addresses are completely excluded from both address-based and name-based sorting checks.

That's TODO, fine for now.

Best regards,
Krzysztof
