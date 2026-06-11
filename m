Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C98363097
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 06:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781160322; cv=none; b=j1HFikctY3+o9b/1V/QtEZoJyZM+ZC3On/xosWeIqAfq+S2YTUDsX/XyY/ndgBAbAKsgv1YwyEvu61cqbUQcMLs/jN3+U8BxJhogLH5KwCIY6nZS3gXbxq5Fs8K2yG4ZKQHPqR5wEH5EJphPThwBZREo5pnFuGUNiAF0lgy0oaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781160322; c=relaxed/simple;
	bh=4CuEGyH6usCybNypKwRhK13ttGGPrjDqfeWseMZaSOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fk+pqqNpAAxQXQbTN/3OMjJu2X/Nz010G/pULjKeq5fp902iV0f3zDxpJo3QTsAyxchK6DSAyMPxg7cIArDLE3zcJhc/0lkqlSaItKhtBBMMmNS7DQsL6wPLPF4lhqPt5PAtgT3xC9fycr1cf6XNdEZtB+wZhPVkCBOjWyUn8O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R+7jG9G8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GxgXw8zu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R+7jG9G8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GxgXw8zu"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GPGh3712057
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 06:45:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4CuEGyH6usCybNypKwRhK13ttGGPrjDqfeWseMZaSOo=; b=R+7jG9G8MoLz6rXG
	fx2X6k90uoPEmMbrcTrpc499l+eZmfc8Wkx8EXlBrNUH7gg6+yGgYkKi572UFzIv
	pa8tE8l/Es5PuZgdMVV/JqGVn1ARBsSFhuVjWVdazTUFbF88xKOUIWadshViqUfr
	o0Bm6GtywRll0ETscvSVXX0yVrukjzAdwprRIPdZhw7/xqv22BrD1rO7f5kTB82+
	PZwThqIYUHPbXMfdHXXQsYwJYkyrmrUkBH0IgMFaaewbTjkODk7BkH355hPRaGTO
	7Uv7GlrL/8hMKR7YSpooVV3HYG3LCbbRxzvu0Lknq6nxwcmcXUHOketuhrvCdAqP
	Kr/hIA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6ua13v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 06:45:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5177b8df670so131834361cf.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 23:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781160320; x=1781765120; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4CuEGyH6usCybNypKwRhK13ttGGPrjDqfeWseMZaSOo=;
        b=GxgXw8zupoXmMtBtpQVovJffKVCGxIudDOwP7BtAkHyqjwLDH+VqfvuY0RyddOSJV6
         O25x2zSMybKu2otCKhIVUeXW+LV6jsfjKEn3jOuAeriZoJ8IPF1EmAqRnVrcO/xsciQY
         m4Ovjm2FWDWPZPDEGRJBJBNVko5w7EnWdYJOW4+uYAVWbXkuU+aRQ8Vi1tNs1E9FIsTK
         6ZzJTvPhF0oIUDhslaPFNQWU5MVP04Zh0D07VJLzU4v9Q85CeXTIkt5JVn28I1HyAnnP
         dqgQsbqT9c000QYiVCQpsX7OCLc3PAhnnh3DVo+792e9CTiZ88YudnrWx74NA0n/uxLc
         2Q0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781160320; x=1781765120;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4CuEGyH6usCybNypKwRhK13ttGGPrjDqfeWseMZaSOo=;
        b=DmwLQub97Dd5UXwT/3Itx91TEWIfgTv2+Mrz3cfigWmqqWgA6pcwv6cFjYn0vgHaY1
         TIRS44uRHHeHk31HW7VFP02UPAFrkvMpCbfvsD3ujC+U3dS978lBI0hIwxdIxARMOka8
         NGpUuofxHwahP2H2lPUG2wn4MACSjF+Sk6iQO2DNyhuUmrNn7fvRvG64asUih5brpP9H
         F9IwNdALlkTXMVqaloIGQLSYTZswPBTbYXYrclYKE9JNjhVr48VjJWNHPnUtcD7lDy4K
         WAWtkJ0NeS/E8juq8EbB7sGduWnXNf/Ibx4tWXrSoPwvcg2zXI61fshbA06oEWFebF+y
         xiiA==
X-Forwarded-Encrypted: i=1; AFNElJ+GBIrQPYlHAwgaIanVLuiQaymU69pJQFUN57NEMGAHHIyofKF1J38qIi5yeAKSxwKNLqAhHgdHsRsk@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjl5fCQbBQoA11x0c9imJh/l5ziN5/zt179JDYQlZW/aJD7NtC
	jJogMgvu7VhA9ZIY9hCoYJdJhnOm2bFPYDdVthER+QIg0yPoE/Ud2Uq/dgbmk02SV1l3U5UYFGp
	1+TtHS8VTU6XFSWKhWYa5qpd9s7CvhfmAfjbJ+H1LHXOKf3kcm01g3DnWmzGw1OSGAf6aCJyP
X-Gm-Gg: Acq92OHSu+ujiZm/Z2aiiczV36Slwb9QX8K4+sruMSRiLYNzGZQQ8BjmOH6saAQnrxq
	eQl4bXdUV3o8rsWfC20oAONt7ZA3TUIudW1Ymn4G/u3vCt04dBw3o/76ebrhXsN8KQ3x8R2hE7l
	/OboSq5sR5O89BuJQGxabGz6ajKWNuDHXX6VGNyBbtrpKnJmDRWVFPN/3etNWY08tNh4sHHRW3H
	p8ogK09LeSmAf7LsekFExkam43kzIuJikO1OF6D+TPYKbly9C5QAfXGyOU5c/sogirvitoN+85a
	zp1B7P1a1ODigBQXpCRBjF5ksh+kXYWWsY/ldTeEpqkHgM7EKgB4+/RyVeB+58i9ONs+IRpRcEO
	X21DZwihzXbB+EPL1+qBnYwcKmkk2Yqf1rMZ03fJ0oXb8n28DhKu43nhM6L3u
X-Received: by 2002:ac8:5853:0:b0:517:89d0:b8d0 with SMTP id d75a77b69052e-517edcd8308mr26977091cf.10.1781160319711;
        Wed, 10 Jun 2026 23:45:19 -0700 (PDT)
X-Received: by 2002:ac8:5853:0:b0:517:89d0:b8d0 with SMTP id d75a77b69052e-517edcd8308mr26976671cf.10.1781160319248;
        Wed, 10 Jun 2026 23:45:19 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm78083201f8f.20.2026.06.10.23.45.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 23:45:18 -0700 (PDT)
Message-ID: <5a838452-5532-4527-a24f-d4869d24953e@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 08:45:17 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom,pmic-gpio: Add Qualcomm
 PMK7750
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260610124048.253162-2-krzysztof.kozlowski@oss.qualcomm.com>
 <20260610125349.55A6D1F00893@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260610125349.55A6D1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA2NCBTYWx0ZWRfX0N7lB3qokeGX
 W75zHs132x6OFj9qmWPwgKt0h4SZ4t6NzvIvEeJK/t9JWRPis2OMblsB2cZR3EVMER9G6fbHq9H
 EiHwY0cbwpcuW+isdeuCuC1Z8huxvZY=
X-Authority-Analysis: v=2.4 cv=atOCzyZV c=1 sm=1 tr=0 ts=6a2a5980 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=jO6dYz2E5lbJ9Xj+xBc9tQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=Gvj4pEdW6wu9SCPdPsoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA2NCBTYWx0ZWRfX49z8zk7/gNoD
 GnBWIOeOOi9OhnlJ528s3cUivgrtCWzLkBqSXjrMrR3IDHEMAUYX2F+dPD1+QfhTpWITAwrgD1B
 dy6OXRgdwuo/TKJnftfwTzQro/yc0y+bV6xSwH9jysVK6rMwW04iIAbvp+ul/qeMrxS6l9TSrO3
 REJ6WG12KXBrbSeblMnST7ilBjhHGe/HKA/rLc/1thbJnWQdoLxh5J4WSqfvsmhYwGjSZo6yadh
 rEf4ehbKMboPOZ/7DUlm8KTIeLSAEDa+FyXjBdDjqrjiCjZI42F6fglxGdQn/nFaITbCpp6qkhQ
 yGiylvap3EGTsINkke24pzdM6829QGKm6rOW+ge3pDZHr9mEplQ/TNWaTJFszvx4RDohiATFuZs
 5GgantutJbr87rjIqhry29VmAdn9jpSRCS5jg0YXivhvH5ZhJeIA/vP+ndQlvJFkqrIF0kZ2BM4
 XSyB+0gzRnZdtJOOBuQ==
X-Proofpoint-GUID: 0i1l8H_0NJTC-P368VGgNAsZAL6kDkVQ
X-Proofpoint-ORIG-GUID: 0i1l8H_0NJTC-P368VGgNAsZAL6kDkVQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110064

On 10/06/2026 14:53, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] The new `qcom,pmk7750-gpio` compatible string is missing from the C driver's OF match table, and the binding schema prevents using a functional fallback, making the hardware impossible to probe.

I will simply add fallback.

Best regards,
Krzysztof
