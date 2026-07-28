Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202D83D9535
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 07:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785224983; cv=none; b=kYo955jz0NbksIDFZ3IQ/LZbJDpbPkQAnN1mVgNytyH5G/rUENkfZw9WpMnyTy0Kli+3y07WJ5Uj3+raUghd/KZNSaf9tQUP6qWRx5uK7URaYNU1rBxfN3WtTsC4u8zoULyc+wXVF7eIG+ePpgbsPYDeL07yLJHdWeGXHI3r3sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785224983; c=relaxed/simple;
	bh=BXsR1PsroGmjU22Kfo1R3WWVQ8SfW8ospEk7LYL1kzg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L4n02g4AsZ9Yyvbh+n6b18nHttYTNUTgACtb396QOI2bP95QWmjhukv0S1HE9DHo4IHZgnsmBAvL4Xt7qL18w1ws9IWMP6T3p6TyGudA3YGUbpda2vW3l8Ji8cSY4zkkYhCNngUsqtFFikh0KeoJ1cbOSwrFHUgUUG3m3AEbn0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f7yr0L7T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N5CMbSUv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f7yr0L7T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N5CMbSUv"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S6YmP51824276
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 07:49:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xACYJf8+xxMrhsOL+JreK/GAqAzmxdkE6g+EW6DuSng=; b=f7yr0L7TtfyrzM/u
	FgsyFcijfBvJ0vRzgfCbzCtomAyQJBU+D2FbnTacOwUS5B0fuqsv9jhuOfAodMRV
	gzre8wU+eA2LPrZcTc484gkujuM/s/cqvQ58iZLbzCCezqReu6YPX9DKXhUKlYrq
	d5DK627VwSXMRIAxNPG54+WM86jERXCJCTAXSDiFn6cgKsiY3vo+Do2B/mzqeoOM
	UbjxY5nfrKNDN7WCOvhY4y5T/6PmP1e8nc5Nk/VUOPntBgm989lRbeJLtaOcKUa5
	bkKDPsnKcbs7hoUML8urjkVCcRQ2QrM9ORqBeq0hkMxe3YGEU17mLkHRLNpac4ko
	w40DUg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpq9hg9r3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 07:49:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cce14a21faso11548215ad.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 00:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785224980; x=1785829780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xACYJf8+xxMrhsOL+JreK/GAqAzmxdkE6g+EW6DuSng=;
        b=N5CMbSUv/qxf+VPJ4hUwnAbxvQ0wWt3/k2B6IT69peJUJCbe5ZXUK1JYswjpAeAxU4
         vV9ohSDyY10IB38NmB/f5yCVKxLYeBBaF2K5YJscjcjn9ox5wfoXlWcuPG2lWV2AEb4i
         uzbH27gKAp5cIao/ATCasuOY6Q3wNsL9DmjghOhIsfhb08NmwBEY1cXq+JVssxbUCvKk
         qePfr31JgMUsecRoiyKPNKUb3naHYPHXpCaNbpXLLML9le4bM0ihcOJsx6dkQDYikFm8
         xoNlG1bbScQNz1Ieb42zVboe7lwV7LyNI1ogSx0zLnvIa6KfM2acUIaOvKsqkExJR4AF
         A9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785224980; x=1785829780;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xACYJf8+xxMrhsOL+JreK/GAqAzmxdkE6g+EW6DuSng=;
        b=tTQTRJPqC9xJFXIAUfLZJi5VMjGT3XAPUxFT+i8d/0mBaWMctIvLofHP0FTcG+QhyD
         Lv9Dx/f6NGjH9C7p9idLCC65+Jzmj+cylUiT7jKik6YFvJnoftTVIz9c0olB/Cr2tK3t
         58edDtWkl111I63izMf1bKm70Mkug0G/OGk86lO8VxHj1abPgAwV80MiLAtFKw1LS+1S
         xFVZkM88jFPOMSnZiimsIj1WPfu9HCqT+fU+o1DvxM5LUt/8NtHednNQXVcvnJgVfe+F
         QIKM8kgpqJ82JUbJw1ke8j4AA4EcGZOOoYixJS7sDkFBoRTNBq+v1tltKPcKTRF4XRGF
         D5yA==
X-Forwarded-Encrypted: i=1; AHgh+RpkiIZ+3JWyLyj0qFZbutqlOxbZJKX3hKJR/LOPP5FuNq73pOnV5tpzSud+c4QsksA93eiqUOAmhhsb@vger.kernel.org
X-Gm-Message-State: AOJu0YyFib3TY6hp2BJ3IqqTC2RW+TWgwTPiuq+SchIDCCgqM401a/4U
	99G/npdT6u0A+VbIaOpTfQ2fcsG3hPW49FQyPTnd31WYqcebeHUqcIsbl5QM22Ci/Bc38v3kbld
	IMAfaYmWxJJQ7DSHxJ4d669Gn1Cd/IVAmCKu+v2eKjtQ/674mTYvmEqY+dqhskczz
X-Gm-Gg: AR+sD10FVEiivCA3qzmskgTO32dLTzPoJYgZKJm1n8x4FBYg8SyiyywV3wCnW6CVtSu
	5CvOqMSnqA/v6ZlyAwgVxCjGbiNb+tuEXc1wtxJmlQYeGjQZsAMXAKKqnG5P+fXOdMZCtZFsm4I
	Mqwpsu47FKiJeospiHp0TlrkdXobd8MB/O/DLWwYU25rKbgTdGoDEKSnAiPPiv1n20/ft4mrx9J
	aboU+CKiw2rxL4jpFzvpTGjVxtllu4H2Y/PW9G6PuhAZZeAYvs/cJSA4ERZRzoVn+F+B4RMYkEG
	CouqrecGG2gOGu4SioMtlfTvJRcIpNKwNnv4AVSy5+ARLL1uSK82yrR0ezrFOKHi6EXbMgpejwx
	lU4ZdF51kSKH6PxqKzMFCLcjMfj4/RYHICEf0hY1L97FNbCSQAbEcF8wG1mEfCxQIJLrfyg==
X-Received: by 2002:a17:903:38c8:b0:2ca:2390:ff13 with SMTP id d9443c01a7336-2d015af49e5mr15436355ad.5.1785224979967;
        Tue, 28 Jul 2026 00:49:39 -0700 (PDT)
X-Received: by 2002:a17:903:38c8:b0:2ca:2390:ff13 with SMTP id d9443c01a7336-2d015af49e5mr15436195ad.5.1785224979558;
        Tue, 28 Jul 2026 00:49:39 -0700 (PDT)
Received: from [10.133.33.39] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5e8a44sm48598425ad.35.2026.07.28.00.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 00:49:39 -0700 (PDT)
Message-ID: <ee48d1db-2fa3-469a-a89c-8aada3375dd1@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 15:49:34 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: thermal: qcom-tsens: Document the Maili
 Temperature Sensor
To: Haritha S K <haritha.k@oss.qualcomm.com>, dipa.mantre@oss.qualcomm.com,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com, gaurav.kohli@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260619-b4-maili-upstream-3-v2-1-e54516c37022@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260619-b4-maili-upstream-3-v2-1-e54516c37022@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2NiBTYWx0ZWRfX4YHQTIZurPQJ
 TsIC6lmzXKg/4x2+WxjNmWMJY9rnJ3by6rlmTe/hqzx2eU8iXm3w4REFR5649senYaJbG9yOdK2
 6b2N+OE/se3vrXQ8XKjdPb2MaZQBcL8=
X-Proofpoint-GUID: EdQPf9LiIbiwXnl4ywB-BMPYzKX03kND
X-Proofpoint-ORIG-GUID: EdQPf9LiIbiwXnl4ywB-BMPYzKX03kND
X-Authority-Analysis: v=2.4 cv=Aa6B2XXG c=1 sm=1 tr=0 ts=6a685f15 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=Wp413ln0MjA_3K6qQysA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2NiBTYWx0ZWRfX0yNsmQz0nWOP
 ie+xXpgD4DzIWqHSQ8n5EsMibeVqHOiEdke/VSVSsD2gYLd5wm/tijK5yYxo+C+Q+Hx6UQWIC8p
 WQmOVou5OYCbWWY4QgpeihKW7qxWJ4QiKp2zm/42k3vGqdBAx7pTklsZrdYa98foQAfzWpIG0BC
 1+WcgBB7rVJc7BKOZt2MSRIrmSuk0fxhRjh5SjHXhFAkx31EZK/Z5Rw1MxjvSVtih/TvCxmrWaT
 03BEt0ZG5ssC+TokjqjRyezHUE8cr44RCCiZ1bdb/4MApoDa0S9w1ge71csDxsAdAotOfqhGV3K
 8nGpGqABJ4SOu73iBw48YS+d/Oug+MEdL6Zi79Rsb25PVVsMwwsIUw1EuHJWC0ClKxCml77KC4d
 H3c+hh/3Kb3iG/5Aw1XqQQwOiApxwbECO+kUOIqQyrOKIOFIxzwYq+IuBt3MgH4538JEv77fnjp
 YWYqquK0wXgtBmjLy9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280066

Hi Daniel,

Gentle remind the pickup the patch.
just checked that it can apply cleanly on the latest linux-next tag.

Thanks,
Jingyi

On 6/19/2026 6:20 PM, Haritha S K wrote:
> Document the Temperature Sensor (TSENS) on the Qualcomm Maili SoC.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Haritha S K <haritha.k@oss.qualcomm.com>
> ---
> Changes in v2:
> - Updated commit message.
> - Link to v1: https://patch.msgid.link/20260617-b4-maili-upstream-3-v1-1-1b8cb7e425d8@oss.qualcomm.com
> ---
>   Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> index f0efaa8349ee..5a8f7673e730 100644
> --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> @@ -58,6 +58,7 @@ properties:
>                 - qcom,glymur-tsens
>                 - qcom,hawi-tsens
>                 - qcom,kaanapali-tsens
> +              - qcom,maili-tsens
>                 - qcom,milos-tsens
>                 - qcom,nord-tsens
>                 - qcom,msm8953-tsens
> 
> ---
> base-commit: a76326dca329a7a738ba367529868dfbafb4a403
> change-id: 20260616-b4-maili-upstream-3-b198aaa8969f
> 
> Best regards,
> --
> Haritha S K <haritha.k@oss.qualcomm.com>
> 
> 

