Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EEC395ADE
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 08:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856671; cv=none; b=HnbNjz4SgxD4VE8WGqPWZgMTCni+G1janaWxgobEiHZpERJSGLagbLRwbY3QPrf0xO9L76/lvgAqNytl2UyMufNrDSfd6SIigFn7fhf7sszkg+iFaUrhJkcyCNhGr7/HrXDjWSQamqSnhGuk23JJ7Stb23edhpa9My5Z+c3pYY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856671; c=relaxed/simple;
	bh=/Dk+CYpqa1NtS3R5uXh2wNhUk2AZ77m70NoR3pO2zZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=amVQUzTt9+sXFrnz/Nh+ImXUlyExEc3wGJU25yOnlxTBIZeGtAIG9DDcGMqgcdtx7bzbOxK1NXay22w2B6jh4zJKgDaZD+FAsRRtxzzPTm5Sw72obKZ8/hIXbINNLHgSyYiNd1X75EFXt4QzqwYTM5GrG9gf/PT8gHzE962C2Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MaO2e8Eu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B6XLec56; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MaO2e8Eu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B6XLec56"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M93b1521653
	for <devicetree@vger.kernel.org>; Tue, 8 Sep 2026 08:37:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xZTaGxO48p7y5EHqLgyxjGdy5PCz3+Tijey3+jZj03E=; b=MaO2e8Euaz4HQABZ
	XziflilKhZc4V7K/gf1k3DWHnRL0CBpuu3X0xhzr1d4+5Sw5cNvq5jNeuJkLPXc+
	xKI6MWA9yo7ETUl7aUhw9N2pNH1+GHhRBZvtLpSi4uFhzvJj2Ju///ehtNWYtNAy
	A7FFAU59d3lklwK0juKifK/1043S5ggHydiLv2LwRVIeHhsaA3fhKkmIyAHDNpAq
	z5pyensd1StF01VROFMJYF54DLwYYszIaRhOqJ50JnS7icwpa1EyUxIn95QUt8Qw
	p7TdtCMFnTvgwf/XRPMRd5vZxVvffJ85d3/88PZH8cQj7uOxGbknFHJIrObzrRcB
	eNvzww==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj077jtex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 08:37:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9375d92d8cdso839175885a.2
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 01:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788856669; x=1789461469; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xZTaGxO48p7y5EHqLgyxjGdy5PCz3+Tijey3+jZj03E=;
        b=B6XLec56xoGcgQIlsM6HteCL5c7CnPFq5PViiTPF6Tv1kkBJOIVms4QYKFkMwmC0tH
         xeYjOUOhqto8OGilLf2pACD0auVa4YwMdzYwaAASg2X0jBt+3EZ1INepxgFp7DHVpqMH
         lbmL018tDUZeEIbXM1LNk+Y2kF+r4J1llVJWBKSNy3pJcF/GQ78p4d6h7RDvVqJqO9c1
         naGhwku/90kbBzeSpnBdBcAKnVJi/wDNUIRy43scmJ5TRUpUs5HFAOl0+3jRUIL0Bc2c
         OEPjnKmjPXWWtHapKIfUjW6j6ANoHUOpra3A9Nv3FgvZwW8fH8l13yAyueF32Wug6Tvh
         TwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788856669; x=1789461469;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xZTaGxO48p7y5EHqLgyxjGdy5PCz3+Tijey3+jZj03E=;
        b=YYyuE7OXxc5e+oHpOKu3oQbOMoxA4Ezay3//FuiAhOEjU6UqGpy5HAm3IASo4GkO7t
         UIjFDnzvJBOHfyz6ZF+3UwQ00r6fyfrLhFzHl9aACfsQz4uerqxDdTfGH4Vf6RCnH2t0
         sZg3VTAsbuWP7cXzgpGUC0vqnhSYbUJzztGEB3NgKPDOCrZzBHzjm+JBlcwpzbxunBff
         0SDtApK/XU75mbcDIvyxc2+iJp8zOlsvzou7nZ1vs4jIGuBU6a2N7X5ejsugaDXsVsyH
         0Jv7rTGbroFWCRqrP4WnOu+eBy76rY5HCOBVNpNRSEihYOevFdDSdYvfmLCjAPwFEM1O
         G0JA==
X-Forwarded-Encrypted: i=1; AKwUvBwTaa3+yQtbmy9MFjIjMJGzgjUlxQtKjmd8SjL2nuEKdlDYoonZe7mq+XM2Za+AdRj+RcknKGVclped@vger.kernel.org
X-Gm-Message-State: AFuF++mcgnNxSGlGLm7M1GVP1/d8hStwFhDJ67OpkFcXsWUM0Eoz4zJj
	g5gJ4pcz2cTcNGYWBNowZyTD/USUHo0ICru7Anifk9HivhMDs9c4DKtc2Mb9WbUC7SxmcGJH0cK
	uhlELJVNUgM+6ifJvS7oq8wosDZBo/mOWC4KX3Gkj2ys/nBbSuuy1wG6shyNizSg4
X-Gm-Gg: AYBFou28qcLQHOmK7DthmvsWSyDlmcXhTwA3ROzluZSizLBKDNalgdX02/BoGZEBrnn
	wCXOoXbztWY6T4/YWO+a5S+njKS8P/1v6CYK+Hnx5oMeIXFJF/ePilCg1apbQHFWa5g0J9Qglhe
	5q5CQxh37XMbUKuuEWu57c5oqsZuUUVupMPgdCL8LVF8qvztDBglL7w2oQOWtJURbF2B++qtRTF
	SNWqbfw1RwcIV3s1sXu+PwF49xM4AzxEQQ2OzUH5yKRQhtIWeB8qD2Zk8WLQulhDUYdMvoV1CL+
	g70QK/TcsL83AVBzTLxO3i6bdX6WXQPEDht+CWpGNVNAN5pqlEzKt0K3U/LYL48VgF5Xm4YAG+m
	QFtylQyli7OAM2cydo2+IuIf22/kH
X-Received: by 2002:a05:620a:25d4:b0:939:6df9:1996 with SMTP id af79cd13be357-9398077453bmr2891048085a.50.1788856668697;
        Tue, 08 Sep 2026 01:37:48 -0700 (PDT)
X-Received: by 2002:a05:620a:25d4:b0:939:6df9:1996 with SMTP id af79cd13be357-9398077453bmr2891046685a.50.1788856668327;
        Tue, 08 Sep 2026 01:37:48 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d53c37csm563974466b.32.2026.09.08.01.37.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 01:37:47 -0700 (PDT)
Message-ID: <c7d1d6f2-4c47-4259-abf8-fdec33a27f95@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 10:37:45 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] drm/msm/hdmi: Handle msm_hdmi_power_on() errors
 during .atomic_pre_enable()
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-0-dcf8956878ca@oss.qualcomm.com>
 <20260908-drm-msm-hdmi-fixes-before-eliza-v3-2-dcf8956878ca@oss.qualcomm.com>
 <20260908072546.645FF1F00A3A@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260908072546.645FF1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA5MCBTYWx0ZWRfX8uCPNzyQ4GAW
 pAKIfbowOUMmKBehNudV90yws4WSAovU4HBNd3CCSwECbOJphvO5i348iuhQLdxRPFI0PEAUSpQ
 tIkIaGNIXo81xJg2qRY0eSUrgBAEol/BnUNIgwmrEDICeAETqr0AyVgsSuqkgkEr3NWLJPw7N48
 EqaBR90amdOxsTHTbpWYcdN1DKNJml6o1pEidWS3zGyn0O+jAxCP302KPAPebJyQaJMpXp6x6k0
 4KYTYvxd6dORHTA7AVKNfcCLVoBsJWhFH13qCjqkv7cGu417H07n/3yXbF15t47PyWMZH/NJWNj
 gws0mhjNDtE0H8ZKRO7d9/O3UHIJ8IB9QeDzaT94MCMgKdYEBh+nX2WUs3XcXVzq7u4gYO9RaoC
 1BI1h2dr81RVDYONvNtOJgnxu0h7cxHti3gb226sWYrDm17u51wg+Ivk5YWEtwTn9kPW/s+ndVG
 z0/0ew/otS0utmw7dvQ==
X-Authority-Analysis: v=2.4 cv=Xbe5Co55 c=1 sm=1 tr=0 ts=6a9fc95d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=dYODrq4-AUaYJTIoUJAA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 5QI7AGD85hZVO5zruOajWOJjdG_p5ZIC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA5MCBTYWx0ZWRfXzudSr7WbjF6m
 0e+mUWyUfMv01QO5lE0H9uuBuTegXhop9pxJEjmCbGmJtxvm1kaIycuxlIXWvgeMhWlKqAEFJWG
 NJ30J2OHxantK3SItxIzYStNk7x6teg=
X-Proofpoint-GUID: 5QI7AGD85hZVO5zruOajWOJjdG_p5ZIC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080090

On 08/09/2026 09:25, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [High] Aborting `atomic_pre_enable()` on power-on failure guarantees an imprecise abort (system crash) in `atomic_post_disable()` due to unconditional accesses to unpowered PHY and HDMI controller registers.

Pre existing issue really.


> 
> Pre-existing issues:
> - [High] Unclocked MMIO access in `msm_hdmi_set_timings()` before the HDMI PM runtime is resumed.
> --
Best regards,
Krzysztof
