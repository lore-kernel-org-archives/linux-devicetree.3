Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FC53876A7
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 06:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785999541; cv=none; b=RDc4R8Yja87bp7a45JV4+9WqXgvBu3otHV39mJSG92e1TS7s+r0KoAXwRTu8n6Q2AuSnfho6lLrdYbz9Hx4Q/UpnyeHLTHv4IA7YnAackIzOdPMSwl2mtN+Y1jKkG9iuVnglDBCy+RRloCzuCGpVI9Otyu/ZPfpLbOA5KiUnpDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785999541; c=relaxed/simple;
	bh=pHQwSKjpLEAMdLzZ9o3QSbfFDCwexHOfFq0kxCpbjr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pR9gjrehwiaesscoSfeX+QXcI/Wr7dem1enQA8gESbqv/3C5VOBfriPwQJsxaSi5qRdDqDd91qM0t7RAaQXirkapNZbvceW2BRHUVuFGynReSFC01xvzxqGMyVo4+r2OmifB1rKCeIhmX0fzRHaol5QeIBAxsq/530koprGscsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nFJqv8+M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YTmPzBHC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nFJqv8+M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YTmPzBHC"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6766hgRh1101591
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 06:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oqtjzKqO0s4vfwuzjcjCXGjqdGQzIEGEvjz+ew4ipDE=; b=nFJqv8+MFJQf5za8
	P3gql0ZRWVn2m+LClM/2MQ/N4/m7+mlxIcnGIN7vjTrGcw2PrakoL9T4Or2cSOxW
	WvZClbxSMwro8dDuhJbdQaGwdCKzCeMqsfaUtZu3zxKO4jgMPoaK5wjsNpgY1WTm
	/Xb5M7C0GMw5Zksgx0JVQOrHupcMpH5cw84Rkn6vzkDevLFs8bzoaT9s949owxKq
	tHhCry5HATmJiU53av3WtYbZzRh/aGaklzVF7vvcgdcliQiP27nPa1SF4GG73OcC
	blgtMjjuRMu/MJkoJuufkPQ4uuCXa++VSZ+ZNHq+wOgog+9uShT9KQc/UWusooa3
	Nc640A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvn8pr2fd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 06:58:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0199faafso20099991cf.3
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 23:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785999539; x=1786604339; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oqtjzKqO0s4vfwuzjcjCXGjqdGQzIEGEvjz+ew4ipDE=;
        b=YTmPzBHCrl6OO2PGkrJEu0lH5SvpHuxRbYAPFW6CcE5fAMHXUZW8fLeBjXYu0iXZ2N
         lv4IERRueUpkxLiVT0A0Zfk7MszDeICUoAHDmJC7AuiVR+AGv9sRnAlDkfbtiu79DVu2
         5GX2E/rE9vlwh0WIs51QTuNZVeanehb8nK4traTxLpQJabMk/QIjsf7p0wb8ojMCcd16
         xjKePgzg4P5Zm1kMhb56GW8+J9Ddd5KVMPynVSz1528IsHP6BkWp+/ykndHp1pwHz3iX
         fK1pPcclN5u1XYY2ZbSmgBfAwDamM9VZBQB1b+34MTcdSUQmCo8tYmqZY+vefi1MGXzP
         k1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785999539; x=1786604339;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oqtjzKqO0s4vfwuzjcjCXGjqdGQzIEGEvjz+ew4ipDE=;
        b=iqMJOyXGZltEP0b0UCHk/0evwUE8QI+FPHoCiYY9PcIdpNPH4vy1K9DDtXJCZyj4nZ
         /lFlnTkqWqCZR0Uk4xVIPygzMC62Ar1HwSlYaiflwHOhxEXOCc+Q/ft9V6g6X2HHXnbd
         w7N1PNYjrlY0N5FDyawnRFbd0bE54WdX9pe1oquaM54KrFbgYrKHA8X9v+X0G7Beh/Qr
         0BMMwJWB1VgISlYPnSjctsPMHI+DZZiTRc3KLx9C2l7zzMA67prBf7+WSBslE6Cda446
         qpq+QbGq704jh6Gvv4/Vf+6aVraHIk4SmuqoAkq4OXtAqNP91hsrnCzCm0UDr0X8jrkb
         tofA==
X-Forwarded-Encrypted: i=1; AHgh+RqwynWWJA8InMWXIckFa8CuE/WWJHbORQZpq+8NV1hqIhX2p01w9T2/3LjbyVkyHJ9wcnPMOzBw6QER@vger.kernel.org
X-Gm-Message-State: AOJu0YzgBUxeX9TFspLac+NVES72wsDTu9eAocHDUgC3aDP7070A1URP
	9WC5CUeNxIy88ViZn399aLKfozZVRhYXJS1jKbEoTR1oztoT+YmD8RVHKjWIzg+0owsC9Uey66i
	O9qdP4o0NSNJOZCN8Qhjz38SHlzgZN8OOj9wwEP+r3CyfvEd63LstsmnvFCOmLRZgHH3zX5ZY
X-Gm-Gg: AR+sD101/JPZelbce7vlhuOPLLG+EzYrS0QXhwV7wk/QsqsnkDXECq8mLsRLZJqqv+8
	ILAysNkJtryR0ABAmPVXA6WnvK4DgiRnatQB7pHUQGYDt5EV55Xqz38Kgb3WFnpn4noXOzLJJxa
	8QXp3Vt392EqxLLdb7Gba880LM2++A1yOMJvk3UJkwA6xK5m3ZeVRt834v9yG+1KVLGtQx8/fVh
	0ptyQLBSYTH2UewT0ndDjVRs1/amfwMM2otiPF0rA04UmEM4LXHA8XQ59C1XD1rUBcrxB+bx/Kr
	sHvH49I9HaOZqZUuwgjgwucAt1QQbayarQzldc33/qvGrR5A9qn7cPYlLgJW06sdp3UPbuKdy2Z
	1hFYyCrbshDR/g5Jc+KuZmucWwqIAxQ==
X-Received: by 2002:a05:622a:614:b0:528:3b9b:4f55 with SMTP id d75a77b69052e-52ce5f619f8mr121059471cf.6.1785999538780;
        Wed, 05 Aug 2026 23:58:58 -0700 (PDT)
X-Received: by 2002:a05:622a:614:b0:528:3b9b:4f55 with SMTP id d75a77b69052e-52ce5f619f8mr121058941cf.6.1785999538214;
        Wed, 05 Aug 2026 23:58:58 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff79a718bsm4195513f8f.5.2026.08.05.23.58.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 23:58:56 -0700 (PDT)
Message-ID: <dd1ed327-d7ac-472d-8dd5-6c2b8d892326@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 08:58:54 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] ARM: dts: ti: Correct white-space style
To: Nishanth Menon <nm@ti.com>
Cc: Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
References: <20260803061910.13973-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260805143315.cophjbfukfjlnbpz@hesitant>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260805143315.cophjbfukfjlnbpz@hesitant>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA1MiBTYWx0ZWRfX1Sc1VkgVB6zg
 iR/0f0aG/SGPPCCeUL9U9CQASs1rWj1Xk5ylbfV19gRFWaon3v6xFwbnm0/4KOziTcUywbXZCkw
 6CsSDamN+mrqUoRB4F4JXk7zNF0Hkjs=
X-Authority-Analysis: v=2.4 cv=RPeD2Yi+ c=1 sm=1 tr=0 ts=6a7430b3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ePTH1f0eZLyOlSlLpuUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: pUq8NLu0OZMOV2-FNRrcj_3-dvSNOokN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA1MiBTYWx0ZWRfX5UgPNTb1OXLv
 7siTl5exAAltoQXt36iAkN8+YIPF6sSRGiNXXFXBxMRSFQHtKc92snVRVkde4cilckAVpMzR7Jj
 +OkzZLQNZgE+/1SMg7/QcXEaEHe25KW9SLK5J7Y1zEcOo4/+C9YxQ4Q/5Kh79jw6XnuQRjtxXK3
 UbpNXPYieO+jnz6iJ2tiBKqoY3m1UXIDBPAG2AaF6tOsIT2DbMddbIB3Rxr6f5stgWhgQAa0d/d
 Ut82Zld6WgnEA35o7XzgQZnH9+S6+DfpfSJDedeDWZnx8thNR7KKlOVc2vFGRxvdVlB2XjGpzc6
 2GjrTjlvw2FpkSH/sS5vY5P+tHwPk9IAUO3K9BN8LWSN0Yddg0d+RPiD9ElQsjsJq0tBEi/xM/2
 STnseC9cpblrXWKUDEEAx+O4cgYzLG0/llVetJoK3wPC+J7PEwiXLQpxBlGmk5IEkZ7mt5tRaun
 Zsdh1XZQwNRgeBI8Yag==
X-Proofpoint-ORIG-GUID: pUq8NLu0OZMOV2-FNRrcj_3-dvSNOokN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060052

On 05/08/2026 16:33, Nishanth Menon wrote:
> On 08:19-20260803, Krzysztof Kozlowski wrote:
>> Correct a few white-space issues, like missing space before bracket '{'
>> character or spurious space, which will be flagged by dt-check-style
>> ("redundant-whitespace" warning).  No functional changes.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> ---
>>
>> Changes in v2:
>> 1. Missing space for serial@2531000 in keystone.dtsi
>> ---
>>  arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi             | 2 +-
>>  arch/arm/boot/dts/ti/keystone/keystone.dtsi                 | 2 +-
>>  arch/arm/boot/dts/ti/omap/am335x-boneblack-hdmi.dtsi        | 2 +-
>>  arch/arm/boot/dts/ti/omap/am437x-l4.dtsi                    | 2 +-
>>  .../arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi | 6 +++---
>>  arch/arm/boot/dts/ti/omap/omap4.dtsi                        | 2 +-
>>  arch/arm/boot/dts/ti/omap/omap5.dtsi                        | 2 +-
> 
> Goes to Kevin and me - Do you mind to split the keystone part out probably
> for the next window since kevin seems to have send his PR and I just
> finished my tags?

Sure, I'll split it.

Best regards,
Krzysztof
