Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2263F5BC3
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 17:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789492281; cv=none; b=tKiTF5s9ufM/ro1QIAkaM2GgrjUUoFLsNBkxXeuVpppOsd+nt7c/r79qEtRcvrWONACU7wDs72ZVKn2NapyS88cfm3cFXJkhlTb8KxrAH/slEpxKdGUQEo1BHUliTL1Jzug0qXgpb1/g3hxOgvm3w4KP6Xp5mCnhkrVIqucpffY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789492281; c=relaxed/simple;
	bh=2i1gHBrrEvwKJCYn0AOUPNRjdhUkkk5FktuWQDyBTsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QzZGyAOLT+JP4gmUf7Iz+infLel+Y7ulF60/0PnvkBuaFnhZe7WBLryslfxRS62QvT6MSWSRckxwsS7Fv8lBWGjjEq5ZIMLkTSx1svSf5ZbochJ+UwuC1OD1d8k8CoSZ8gtNde+uNgx75+WHMMQ9X618jeZOz+geNo2OGX2xHZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZyAI4MaY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YrCC6X7n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZyAI4MaY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YrCC6X7n"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAbEG460718
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 17:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2i1gHBrrEvwKJCYn0AOUPNRjdhUkkk5FktuWQDyBTsQ=; b=ZyAI4MaYtgkMRrHS
	EBVKJVodE7DhKHks+AuyWAv0rnX/WkqonGXkHcCMcmWXp/UsxcMvfQ5u0gU0nKvq
	PGxkm7EOUcemZTG6zmqrUncVRYFRwujRPRuwNMW5qOOny07jQttSyGq3ozPhd8uA
	s1jAhA4Bb3gYF7U2D2ollYUiCjUNDVIX4GIVydOhjItbGf611TZIcYLylGVZgudR
	ztsb1evrE+nY7T91XPQX0di6R8UQ88lO1XAuxSBU4+jn9Oy7cAH9mWP6sVOrGBzs
	IXxFVeE9tr9M6rZrIqeFg5IMKgotdMkuJOF6ajE2MUowIhEKjbja0gRmIOQ+7u5S
	wErGOQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq0jetx54-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 17:11:18 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c96449cc2aso1381716e0c.0
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789492278; x=1790097078; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2i1gHBrrEvwKJCYn0AOUPNRjdhUkkk5FktuWQDyBTsQ=;
        b=YrCC6X7n23cbWpdiUbT7jaAwa0xn8g4j7/TLH1yH4BGbgCP8KJJCAmwdA3ax69lFvb
         Oljli509ibjpBLUM7/30lC6DPWzuGHck8rzr4BOfZqcnjhSEbVaH+eFqDy46eKtHNLAu
         edsNoV/bHIkWEPKSjvlzvmJzbnj5i8ioTiycpeXJBY3R5qMXzVszNwIRsb1GONXtTrn/
         Ulz4IK0evt/Mbf2vJRzY4ZOeBfQMJCbYtEgLBUZaB3amYQbp0xongKfLVMiwung9fzJY
         l5dXdK+oaNnwC+dHoYMebdV34PDY/DJDo7ZOqVL+aquGQESeqrCmwSIjEdqD1sTqfvYO
         B8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789492278; x=1790097078;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2i1gHBrrEvwKJCYn0AOUPNRjdhUkkk5FktuWQDyBTsQ=;
        b=O5bVxwOzj5IBjK2bwLaaUl87vJ0bFahol5od90zyEBNcKk4wIzvfR0GbZ2c399K37l
         b0ILztVClARy9v4y1xH7bdB0ssWu5egx3jXCOT0j0epCha3fbOu5D7NeBPurXDBnm8Hd
         3vhBtXtEw8aGuxsi732HVXbXtHqcU6avu5YlERZgRPuyWz6Swuap0uZIFVNOjDbF00Q/
         +Msk4k/6pCDY2WdSvHnyop0Wagw4dQLViFni5eujfqG8fQsHhwnjruDa5qVjjO6JGb9K
         Zrgg3Bhh8WFDgtMafzfu2A7MgsE1IiTycNpWs6+qU6ZA6gMwHAW/qnzpJIBkp1CkYYEw
         QutQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYs+/S4zohkCoza5KxJK5O/0Zgw5BJBnVJJHJkCbKA7xOEjNnbBf/BzpJEXSzEc/9L5zJgb5bH8ddy@vger.kernel.org
X-Gm-Message-State: AFuF++k/cyXZVzu+JjHB4dw9OpzIkMtxOBjTLQCIxpufCaQqyIyTdXYn
	QVbbiNOIDwL9Kcb/7gmMwgxJmEjW97d+85RqGihJItgR2t9CZZyCEnBh9dbEq3vOoY6T8Q1D3Yo
	C+igHM7ZZ1IwXZtvwK7C9mYQtR2USKIQUDKZaTjTyxF/G7uWF343471lHD3dX59g1
X-Gm-Gg: AYBFou3kHpuNx/CzYGjSyHk0fNtfv9+/Jbn5eg6vA6aVx5Pr6UvCroJfN4v8xmPXoqG
	KOcXErpu85Eaj+uGMEjcXIOvUN3SrqtsDptoCt2eDULgFmEnKeUXzq8zdxLnbYs9EN8j9NdXXyp
	NBufwHWK6LAHJU/7OTUMEs5lkkKaH0OAgm8JzUGllm+tb/z14DoiSJsT0uAR9lP088Miwx2livw
	hZVaob4t1h927MewyCvLog6Fz3SpgtdQm58XIb97h8JBOjTfR9fSWxbMYnloNAoCmQEZ4h5N3rA
	BD4ACK813VY3Osc1yHEL7CtBhITD5z3Gw6Apz2qry70f9XtvnGNo2pJ9PYCkztKIbxK1ZPwFGkG
	gFiWiIiRP4d77Bjmc5+WMacriPHEa
X-Received: by 2002:a05:6122:6202:b0:5c8:38b8:44a0 with SMTP id 71dfb90a1353d-5c98a4ff79bmr3060913e0c.8.1789492278075;
        Tue, 15 Sep 2026 10:11:18 -0700 (PDT)
X-Received: by 2002:a05:6122:6202:b0:5c8:38b8:44a0 with SMTP id 71dfb90a1353d-5c98a4ff79bmr3060884e0c.8.1789492277694;
        Tue, 15 Sep 2026 10:11:17 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf33d93sm388957f8f.22.2026.09.15.10.11.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 10:11:16 -0700 (PDT)
Message-ID: <0649121c-7c11-4264-8caf-c7cab74b3adb@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 19:11:15 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 net-next] dt-bindings: net: Use consistent indentation
 in the example
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
        wsa+renesas@sang-engineering.com
References: <20260914155645.112508-2-krzysztof.kozlowski@oss.qualcomm.com>
 <20260915155703.0DA831F000FF@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260915155703.0DA831F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI1MCBTYWx0ZWRfX1qH0Ny9zraeA
 78gosbVdsD2K8vSKdiFBXO3SCmu0DQw/wdanazuDRHmrUckknIDjY7V3Z9RUvRuqF8LGjYLYfxp
 H1nsIuoE5zNICntwqq2RV9haOHnBwKg=
X-Authority-Analysis: v=2.4 cv=Kr/YSmWN c=1 sm=1 tr=0 ts=6aa97c37 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=jGgFg-Djq2gQTLHCcCEA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: lXDjQu9CZLU357DYwxEgk1h25w84apWu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI1MCBTYWx0ZWRfX0f6C9uftlX/D
 WCrdA/xjTtESD3WK7X+Ltmfbjzt8IH5Ajknl0R/zWA4NGrymDtQQg0AYqu+/0tO8WFuK3fdVO7Q
 ReAeCeBlHRdBcP2tHBqIxicivw56fL6vzG/23p0JQx0H54QEbZO32vnjetB7w79wwjXju1Kaue9
 8j2NzELeSUxrZAlBoiKJomZk60AqkOylm3RwRT2xwplJAiOZwg1i3RhNuW1QJwEJK8uXgmh1jQh
 fuMqdNkhq28I+T2adQr/Zd+ZDkSTE8p8ec1MwbY65d5RNbC9StSV8PTYYYJK9IwegXw8fQi8WaL
 4M0PtnVfr7uZj4k9MIuTVKoyk2SO2OL5+R3QvXvFObObYF2v1NepqFMoTrF5L5WqVv1YwAFoC6W
 f+0kJ+7k/ehJwu2/hYiIMGSL5EuAEmLKP/CNYG2O3JZbOq8vsnOrDieIpOIXblQxOpKm0OiZhmB
 0bKr3/1+rPe7Dpy8i+A==
X-Proofpoint-ORIG-GUID: lXDjQu9CZLU357DYwxEgk1h25w84apWu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150250

On 15/09/2026 17:57, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Removing the mdio node in the cortina,gemini-ethernet.yaml example leaves dangling phandle references to &phy0 and &phy1, which causes a build failure during dt_binding_check.

As usual for other such comments: hallucination.

Best regards,
Krzysztof
