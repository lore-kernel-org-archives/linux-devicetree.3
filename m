Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703665;
	b=a29f3n87Mnghr75YKlsh1SZKCla/nxgVsxotRCZSfJrzolqT6cWXYnLU4AFK3f/8YoZH
	 KtZNS78u9oZ1qC1pB0tSlqnBWGmuel/RbsAu3bO3vF04Dz53o51TEIAiNHb0nertEFjGU
	 TL82+iDlr+NwcwuzTj2jQZlF4BcuFCiPiLEzfuvesBZ3H/kux32M1Zc5iRwwd+o+a4w0p
	 F7mZfPwpjm5kuUDi0ojdvkySzOUPmRh1u0D4jyEDP8/EAEPMvbwidKnX72dS51UtBg2Uf
	 M3tx7y2uwZijWl/DtnNLgCuNY/FXigt32t46vof/BE8jsFTZFj64sCF5WmzqcAPyOcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703665;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=quu9PMR9UDySxr/IqPO0z01rsJ1Q0S+Kq7Ac8gw6hUY=;
	b=CqoTvXQl4uNJIkBoGkB2zPOwRZIMNrtPCtl6wUJ//aA96erzOHOd3k2p8LD2Eum4rUcx
	 kmxD5JtlU+gXwjz0q+mjCmaZ3cRPDtimADfk4VbzU0WA0Gd3zDOlFvKkgyPKZ85A7kqyB
	 pUGTY34MKMtTmQWpRiw9BCL8It45y0gtLDXXoSisdaAfL9t+28SaBdB3erVasNrDfF9mr
	 /hVlgV/yj7VnDfuZvdASQMmJasCBXiqGvtG6HOot2eLNTfhN1PFvv9PRnZERYYrIWeuLh
	 ZcZS0x3nNa0eCi6RFUeTNtOxpBRXREyvkvzaWxVaSBgpy3V32PQc+xxLGllcGUVBaRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yb5T9A2L;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CGKohUQT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67647606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:34:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67647606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yb5T9A2L;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CGKohUQT
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEVw2J1022143
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	quu9PMR9UDySxr/IqPO0z01rsJ1Q0S+Kq7Ac8gw6hUY=; b=Yb5T9A2LDhvYcSMF
	YYJSgn2/hTEgM+/24HXeLjJ8Gdr2skk9kv5BJYrd4f2Cs6reOTAAl/+mQOrx3zp/
	XBfeVDE5k2ZiUEkjSQp/n4ukxZAK4lPPspKCVKHwz2bR7+sR3QTQ8RVZwMvk90bO
	dS1T2rd5oU/EgmAv5eM33zcUswixcBLHfFvC+vnuqVFvc+KlFjCNbuCVFVxEC1H8
	XKKX2nsasBWmWvF6kaeo0ATj2QlIJSQ1flp2PhLsRUD9vp8xNhX+K5/2senat2Wd
	UTtjLaUzamdkfRJglLqXDJ9+3ogo9N2T/eVVbZr30QC9T/AtEhPXze2sVlWI75jb
	YoNC7Q==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6gne1ecn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:34:23 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99e12db7450so141343241.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795703662; x=1796308462; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=quu9PMR9UDySxr/IqPO0z01rsJ1Q0S+Kq7Ac8gw6hUY=;
        b=CGKohUQTHrApPtjLxhI9GkbEf0AnJuVURw/f4fgkxMiY0cppkKUa0mUWAVxuC1CNF4
         Z6LD0E7CutpBLKsFMXW1l1bPAIRBZfTl9umm7YV3wCerRThwbjfoNwxUs9Ak2B0/F8K3
         rMIwXT3UJbH1mw3kTlV67MUooQjoBL31K9UPDQL7iRGUz63iDRh4DFoq7MbrorceCKfn
         ShRAl8nxJdo9vwRD8XmqNrO0oyVAGdWx7693jP1Q9zEgNtfSzzL/PWqVYS8hGhaRdNb/
         PQm9QiPpzdr5+/ajtCz1SguszJa6Xq/ccHGrftc+PHeis4PhTvm2KE20BU18Cbk/rYFX
         6WmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703662; x=1796308462;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=quu9PMR9UDySxr/IqPO0z01rsJ1Q0S+Kq7Ac8gw6hUY=;
        b=aLEweg4nhV7h3+DJdtB4OERWPyL30MzaRXlaSzxZvdmS5rqnAA64H1iaDDU+UtciNm
         aHgQ7RR4uG3oz0KBERLT5caIMoSTx+KIqWgVKNpbIYZYYN2PSAoxhu0Jiibfms7mQIYE
         L+ogWS4mf7Pqj5RGlbCwV2O8NDpR0fHhx3jCqwPRGO706WvwWf5dqqMbbnTAI1P5nKHQ
         ScNLEmQcueYPu2JnEACxBaaxOczfDXFlVwuLfuZtXcCMqxEH+nI3+Vgi05DiRmZaHYv2
         /7Vzk+45oJEVveeW5dVrUoA0lW8uSlfhbDWBazTIhdoxpV0RzyrOy6OAufRfIa92ZPfJ
         ieTg==
X-Forwarded-Encrypted: i=1; AL+hErHU8UPD5pbu4X80x6Bt99Ae1MLoaE/UpuyUH20EbuGYGesXLvPIsQXSEewo9GLfjq8+Pvq0XHyz8XLn@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ub/kZyBf753+5tFAJ6K/9C2ofolXJKZd8BxNFZZDeSsxKUJdZ
	1/w8MhqZESGpxSUvneCQrgBETXZjorQHBpBs8BXi3aODqyE+T46TTc1LnImHmgumPKQKpj+bncA
	p7ooRrCMCIstqHbnjwBB1ak3dVYnPRcJo+PjqGYodkmbUEhUI61HNcCgfsLBTzsWM
X-Gm-Gg: AZFdTZdAP79VZEnXewYRAtB1rVGUK1zKjTB4pgIQ3taWnhMUVSKXyehuk4JSg543NtY
	b3TE4nPceNjBAC6zJwXr69dCHURuRMGw4bl19RgbaRA6fAYMQ5853GXspALrzF1XEwpI0Khz01e
	iVxXAKO/4ndGRzCRkcsFICjo9iJkkEFwoMCQJOZsyVCy/Wc3vta3YT3+4iagZIXBEMwkL+jMaf3
	1hJ6aJGwFuvViKulwQoY6v4wCVjY/fg2+HPfQTYy3ggspGBSmQmEMutUWdsnj3DKyG3/AnLpJvh
	VZG/P0FWvjSi9fykM0aoz7j++hNeMONJk5xjCmi1NXve3E0nc017JeV6DevI0YCyhfbRJ1w+/cQ
	uwTAf8nMx5VZuNPiNIJTsBKn2d0fF8/W9tmWEVvBTNgmZJ4htFjLt3/hP57bKw0yqp5I0Vd0=
X-Received: by 2002:a05:6122:6107:b0:5ec:e6be:d626 with SMTP id 71dfb90a1353d-5ee8ae0f76bmr14516169e0c.2.1795703662502;
        Thu, 26 Nov 2026 06:34:22 -0800 (PST)
X-Received: by 2002:a05:6122:6107:b0:5ec:e6be:d626 with SMTP id 71dfb90a1353d-5ee8ae0f76bmr14516124e0c.2.1795703662041;
        Thu, 26 Nov 2026 06:34:22 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc5396sm754027366b.58.2026.11.26.06.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:34:21 -0800 (PST)
Message-ID: <06744cd3-e8e9-41aa-be89-c70f352faaea@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:34:19 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: shikra: Correct QCE node
 configuration
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
References: <20261120-shikra_qce_fix-v4-0-5249e31394ce@oss.qualcomm.com>
 <20261120-shikra_qce_fix-v4-2-5249e31394ce@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261120-shikra_qce_fix-v4-2-5249e31394ce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XpVvqlF9 c=1 sm=1 tr=0 ts=6b08436f cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=4q88LKyOuv55sd6UrHYA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NiBTYWx0ZWRfX2gluW32CHsIs
 HbnLiHVWjLVNBzw7L5Adrm8Gs0vQtcsePQXaN1AGly5+oZEFH0Hklmap7KI+RGhgNmBALFY2LGu
 Oh0oD4sDQsfnwEo8YLPZwJ+oiaLxH4o2xsGf/ODe9oC332qUsV6h3jjmvnYAZ4nMsAd2m+/BAex
 hBQjpnuvPiyVNEwQARmfo8lMICH1VPJZJUHB7b0cmmzedhKDVq473NQeNaQW1vkIyqKqy9hB/B5
 ll1Zwc0eEwuqs2VJONXJYh1egqvRgHjMiE+6riCWTJ4dIuafsXCO9My22K8kE0lU0QLefzSyfMu
 DvYhp+a0sVGR2BN/bO8jP91gMyQWR32epBes/5RShb03ZQLpiTkyDO3fg7Eys/IsrsqU6+E/xql
 kRD+WuO6ccQytWDU05IwOWEoCQlL7vspR5tJfDm7emVWVj7Yvk/wvn9uIIedijQ5VZY1jwXIg5A
 mJPsfml29IMWH+pGwCw==
X-Proofpoint-GUID: eX2o7zEj3Ffr63dsKlkoayt_4h2F2o5V
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NiBTYWx0ZWRfX4YjiduxxqXW3
 dWxt4RSp7MGVm8BPvc9eduYniL2iPXIEJlBhPIBcLRBh+a+b9pykBnYMuuDbmIVd6PiPiOC+AS3
 cO3IL3g+Mdc7SX+65coZOBrLv0opBaY=
X-Proofpoint-ORIG-GUID: eX2o7zEj3Ffr63dsKlkoayt_4h2F2o5V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260056

On 11/20/26 12:29 PM, Kuldeep Singh wrote:
> Shikra QCE requires an explicit core clock, which is missing from the
> current configuration. Adjust fallback compatible to "qcom,ipq4019-qce"
> and specify core clock to match updated binding description.
> 
> Cryptobam is controlled remotely and its clocks are therefore managed by
> remote crypto subsystem.
> 
> Fixes: 099cd05d200b ("arm64: dts: qcom: shikra: Add ICE, TRNG and QCE nodes")
> Tested-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com> #on shikra device
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
