Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A2E44E021
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388721; cv=none; b=RJPHvT2h/Y/2ZzQR1IhFBpn95RmUUNfqN2V+7ELO6c9zVEdFWjpmHQMR8Sa+m9huMFKVQrDEUZPb92+G0N2+DwIM5zLI+cOfdqdx0YglemEc9LxF7h+QeVV5vQmwD7I1FUoSXdaYfqfPfM9gjrcoxd2Lcyc+EswQnUFAY+1Lp34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388721; c=relaxed/simple;
	bh=V7li5Dw9nmkHeY7iCABC8exOwEM/gxkTUPUJ2FR2iOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RERG4x5qHxFIlJuHpkj9vaQf7QBwU7S1Wk0zlQeG8PPKuWE1GX3wBP/gLN4nB0Qw6kmCNOxzLUtnwUGlVBqoSzguChJJH1d8mQk+izgpxFU90QTB2eojX2V62I4Z6WvDFctDTvJRaoQ1A/NETjHg6WV1ySL8Oa5KtM0KXCKfLzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JKBxH83T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jyqYPg25; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JKBxH83T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jyqYPg25"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAlwgJ3860378
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:25:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=; b=JKBxH83TjqRwSHXM
	Zte67Hw1iWwcYYHyXDYH4xhk+RPxPWXK3HBiOYk0WqpT9pF3oY7PjsVVDd8Iy97Y
	FY3HHiTU8EqynGWKt/1bkuThd0z3CbVm3FLqp1pxojjeytkl6Pm+Xkp9zLNQMGhU
	FV7zHKNWUUhH5wathlRMzX3IP3iJ3cSf4t4AY7h50VSe+I0zVEO+ztWqm2/YXoT0
	qrTTddIdEIzLVyBILQEL0vRtH6rZHd6cdiVkNznHR3F6N6SH9/5y7aAeadNb3dBx
	cduwB4USFMDkoWz3hnV81s6aer/Ybv1zGZgc5YoMfZWdrUPnwJ3YQCsNeg8Ai2uO
	3muDSQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f0xs6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:25:18 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c8383e6a13so56657e0c.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388718; x=1789993518; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=jyqYPg25Hz6IxpYmog0xn/B0SybO5Jm+D8u4DfHOaYmbmfAct92icBLPH7WvbkjIfa
         K3/+RYklX7GVOuynMElEMwZYWXo/RmrJQFge/NJP4Cq6MCJjvCQIh3FhtNYP2hIZ2/PC
         AuLrMu2ghJ6yhC+mJSg5RyEa61CgTuocVzmsKToLwmJ3OFH9A2r71lDRD3TcQpqrwPhv
         9Z/qjIrIiyMY07tLud+bhRDZYo9Bj7vPSdI0333B2YU01rAdBwK9Xle8f1kye7/PlDg5
         XoVHa6XDQ852OCkk/tcU4RTilVnFW0uVfSCRd3AmSJUjvbkqo3+BqpdS/7CVAhMeLbyW
         duRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388718; x=1789993518;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=VGJhmO25xn9dCXwmpBX0/vh2Qslq6fHU3EJJAa7/Gf3nKTIKfZf/W786gSvb0d5vS4
         6HA5oUqZL8Q2UuNKpTiGYkKjoKSn6PQGsvTr+ItI/l/kRes/G5VLV0DH11C0bdaHwd5E
         NLUI/WJSedsS4B959M+0jkMXLdl9nyAy9OjWOfhk40YaDBvQJgUWBNg1IV1a46h3t5lv
         Xnv4Whf5Dj2nq+FDtqFJ6Jb92gkBx3D7xbs+BhfUq0x7CT0ZGXUN7+HL2k485jgheMD3
         Hde7s39g0ILOhaP/va3Uv3n4nUIqSXoYTPnS1bfklVqETfkk2kyAXWGBgk21e4Dy4Cql
         004w==
X-Forwarded-Encrypted: i=1; AKwUvBx65CFuHzSBCJP34JM9a+UVeEs7hsRuVeyW/K8Iev24kOkNWS2D8/ERoAHWPiJLLKEK+5u1I+gDWuao@vger.kernel.org
X-Gm-Message-State: AFuF++m3FW9Mu1lFKz1aFNyG8n+xnJ7M+Ar5/c60bsMBKHNCxEeCbHPY
	kHwuLafJJjapRsL9Ao3RXoa3GH1P3uRJb/pl/AdFnK//eI/COl2YNwPbJ6q1h/qJBFnP+84vetH
	IFclLMf/HwSYaz1WAwuWDPimPsFkzzWvIm7arGVl/suoI3aGE+AmX+L4cChe5lxiE
X-Gm-Gg: AYBFou023vDhUMHWdYE2oWNuH+AcXsrFden5bcrXMeqA3iOSYuulLzeDuYyq6nibi+8
	C60ae833LiejC2cVeaA2GfTVa4MJmUtVD15Y+q5WtLCTMJswKWr4nPwTv2pSfyRCxLvnD0ELDMB
	s7QkeOOG+XcDbJWoe6MD558Bezr/0okTaljKtIbo+6vIhLAnQ/Nj1oBKFln9Lk16E3DByBNkmei
	zcxu8reao/93kUeqjp4ms8678zUbhKyTkaUUr8M7VgqkxlSAcVTWRpD8hTz5Y1B8bqFfUHNKd6v
	wowngNjojP4wHHQP/sxT8IwXZ63m2RzdWGRl2bHI0QMEXyn8Y63l+1xdXXl8d1wcIrMlRz1YmXi
	1QSUL9zjaNWY1NB0V0m/edw==
X-Received: by 2002:ac5:c8a4:0:b0:5c8:369e:a493 with SMTP id 71dfb90a1353d-5c981a821aemr379457e0c.1.1789388718457;
        Mon, 14 Sep 2026 05:25:18 -0700 (PDT)
X-Received: by 2002:ac5:c8a4:0:b0:5c8:369e:a493 with SMTP id 71dfb90a1353d-5c981a821aemr379164e0c.1.1789388712971;
        Mon, 14 Sep 2026 05:25:12 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0464430sm2440450e87.42.2026.09.14.05.25.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:25:12 -0700 (PDT)
Message-ID: <ccaad097-6bb9-4905-93e1-acd22aba0aa9@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:25:08 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/31] arm64: dts: qcom: talos: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-13-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-13-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MnpeOFC8E_IhlhROwHBuuy24JmZJcW3L
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX4Pxyi6rVff99
 +iN4lrSOXLTgMbWGkB6A4vT2QJLw0bae8xCQjoVryLNoSgTzkFADc5hFlc/iA8H6xvOMHnmxTnX
 GJ7/ieGaU18nD1EzrI8KQ8ijoNhujB0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX9624QlPn5NUu
 V8vJJA/LnUr2e54Fd6zrI5ojcEp3gWZjTW57WJdfZtuctC4cNq7SFeApLZAPdAiX8H9tvlx/wHT
 5yfRENOxSuqqOb3cykv/z57JAeo+WbkZlInMKCsM+UnN2W1Iy8si2wxj7IlM6rNiwaCeAF3xzy5
 xhgN95fDmnLG3lfmCpgkG6/ESz4FR48d+JA5gwKvfbK+8qeGhZgMJUCpsSBCCFYGunUaiPMG2rt
 rKY1+5b+NxlFc0L/OPXavpaXzvPP92ITQ4r4oyfzQ8yITzQ35WlEe8azpq+zqNdfqJDPjKBAQtd
 FNjbFyR/Txi75Y7jPQQdDbec3z4AwMg8N/80PrYBVGP4MDdaGYP9m8vQmuLbhhNLg6Khs4qnLMs
 e5ncXaAHWfzfDD+B31fdXY+P72iP7vDFlPnYlNP5Rm53sez+m8Mz88NzaUX4ocKVCau803i/jv/
 dBcBhJUL6Yll76GfU5Q==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa7e7ae cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: MnpeOFC8E_IhlhROwHBuuy24JmZJcW3L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140177

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
