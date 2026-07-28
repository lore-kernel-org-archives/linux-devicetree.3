Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F3A421F18
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 10:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785235724; cv=none; b=S7/RiK/sCWMYo30joQAyAf+jwB0WXnKw0D0lP5cE2QmMp+O8++AIIjLR3pdmYd6R3tgLslM+L3/oL+vwnTw79pNUNdrevOz8GoOliYn4NWBg7lSC7pL5qx0az4GvAj3LV8eqwT0tCg+tEqWmxhnP3PEg5wcJD0A2NDJ8GK2P0Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785235724; c=relaxed/simple;
	bh=+2VXiGMIOCH2pmyuRHa2hoo5DBgV4E80jSEKqltfTVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rMBWOZSRtN+vqFmn20ilt7nsNIbE1XiVKDEwslRjjLRLlSmIJQEsr+14OnS7YwzfTrURK6xuCTZfNI2XjP25ZcL/1zTsjOryVs2pRDzUj3HwxPsD4U8+xMbA0IAhjyAg5jfwiWtbq6pjYSNBW9mrvVih16etO0fPOK6SrBK3Nr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rb3RRpvN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LSqeYByi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rb3RRpvN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LSqeYByi"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SAgLTa2449300
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 10:48:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mYrJRtpE/M58oknn6w6g6s4C
	5iZ5GXjvqTFr0fKnh8g=; b=Rb3RRpvNDCVmZgKAWDSILLWRAEltX43yQo8Ftzdh
	F4DPobVjgY/XhDNK9SmMEpx2id0sctqiUSNakZV8T0ptJO5SrHGhg4LJn5mJLxM0
	GvhQVSo6EOoIiHzB0cV9zf7M098wGYb2w/l6b6ZAMWT2zsgyxyYmUi+NtZOQ9T9E
	tSADJ9gP0qALRepBxvRL5unRcZcv7aVSZvtwHdp1j/E8J3GWWqONVqgUBsmyuAZN
	92ftSV6Uvl7WwSoXx5nibWv0/H/32z38G+tQjCwwA7H400BAA21UZ8Qr8w0ToNxr
	WyheF9UfznuzcRxnrsFFhEzTzJ2xIcawzreNt11gf/dH5w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpqxjgtn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 10:48:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1a9764f0so47477721cf.1
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 03:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785235721; x=1785840521; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mYrJRtpE/M58oknn6w6g6s4C5iZ5GXjvqTFr0fKnh8g=;
        b=LSqeYByiBT0jMiLEZhP4I+725Dk0U4/ftaDJTDJs4vLldyE+C5CRvEn+xLzVbJ3bDb
         IPxLSAK5ZvgbNevo5FQpcSsMABD60uwSYoLVg3/nGrlb+LX1TaxdKPZEcw5L1AQGs9wG
         noTdVKS17scI317SAzCUnxbCK6DfBb4X589T0RrfKM/RmaYJVsdlmuUHdbiFUjSSi93d
         Wmy9tH9cypzQGqmL4B9eUaBWNMENRQomTetlvE5E72aFMzDf3Uw5eJ3Y6j3WmE2SglwM
         6nzLUqZa8kqwlBfG6jarYJRx1mzB7EeH4GQfVSTSuSmsPoZ4VXLQmQAyx+63p3e5H2NM
         nwJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785235721; x=1785840521;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mYrJRtpE/M58oknn6w6g6s4C5iZ5GXjvqTFr0fKnh8g=;
        b=iC9gqNVOizcSFwplKroJjPv1EkooORRJs3l1/d/A8sX/ErCnElN/4AxJThLRueDfZn
         IKGnLRxqWf7EU1md1h1wx93USTwddzR7JAeJ270U0Qu7pLZjpNkSSWoOJJ8JGk/eCrWe
         f9T/aaJauUr+pupBMiNN/2+s5WMpb7qeyuwPNhybLU9WGYMlGtNhQ06cKVYGg4VmXNE+
         L+d1wMPQssXLN8pj9EqIEE4Nev66nKPUtfrMiHTap5/qx5Mispo+Cj2Io4lcxduaCN9m
         38CnHl3gl8u2aK5lh0uc0LBKm/EbHNLC+/csTTxYhpfnhb1v3dnIvc7FKV2w+mLjW3Ok
         2o7w==
X-Forwarded-Encrypted: i=1; AHgh+RpJvRoyst4LkQDZFEhB9xApO+Y434khfYwoWJ8Yl2qcAvLW9P+rgdXv19dYtJqwB8g6zHNLSJ0Efu0t@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8k1F71R+z37/DlkhYW+1EYZYtTo+g8uKR5AipEbQwpLAHcqRG
	MDPYSce2cYpCvuPaGOZGgJiFQYIUZNomUZCLzlI/n+E+XP413lALl8zbQfqrSrJwBl4yWlCoyD3
	paP20J35zrGHU7HkBfBAshe0YePAnrn5SLhE16fdwiRqGqutSGAiqpd+9JsDyfAwM
X-Gm-Gg: AR+sD12qb2HwSvak4h4eVydaql3ICrleuaUm+E6u1IrBTzXsARhRQJ2x3njX5RFAQuU
	+UiTRuxnR78gniURtCTBN4vZ58eyPWOSnL1BQSsSsUTw1J5sfJNAveRZ2Jjv52XBcQ5ZOHBvB/+
	LI7yc2nhjwxd5oNvGxhx06nplo1OI9KUR/TGEs++J60HzsTQLm7ZnfBzirggesHPoZr8s8xMK+5
	XkUix7h1Z9SRjuI65//53rJPxlboq4rRcqTkinmX5QU+TS7MkWhpf7j9FLvaVrd8VrPL5/F+ehw
	fFjWS2bK+QmcdHONZHyCSv+E+iXjzRMffqf8jlBKv5SGt1fPCR7gWlrW1X3KG+xR0sGsFty5ny9
	eTeIBMbbF5FCXoZuh2Z4GT9slfTgYTwatnOi3JYDXP3QFaD05js63RK30Ru9G8EBWqG6undxaZA
	OiCN2ITnYFWmNqhA==
X-Received: by 2002:a05:622a:412:b0:51a:8c9b:64a1 with SMTP id d75a77b69052e-529d7169f3amr14420051cf.69.1785235721547;
        Tue, 28 Jul 2026 03:48:41 -0700 (PDT)
X-Received: by 2002:a05:622a:412:b0:51a:8c9b:64a1 with SMTP id d75a77b69052e-529d7169f3amr14419721cf.69.1785235721070;
        Tue, 28 Jul 2026 03:48:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be1f9721sm1917162e87.76.2026.07.28.03.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 03:48:40 -0700 (PDT)
Date: Tue, 28 Jul 2026 13:48:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v13 3/5] media: qcom: camss: Add support for PHY API
 devices
Message-ID: <jy2gc6ojh3sh2araz67vdk4jo6wsmx4xamgl6hjfuqpdphxxjr@aykdzj6ewhm6>
References: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
 <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-3-ae811e2f0799@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-3-ae811e2f0799@linaro.org>
X-Proofpoint-GUID: LKWvhQCs1OSWm0iqA-ewLzIPb9hfJS37
X-Authority-Analysis: v=2.4 cv=MORQXsZl c=1 sm=1 tr=0 ts=6a68890a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=SmOWCKbkXSXCNfC1NdcA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA5NCBTYWx0ZWRfX6jzMHHeXVYRb
 5DfDVElPSKCFo4Lr7w7jgdhqPNIaO92WehyYWRtfClv8BR3dBTzbJZb7WexAlhArcqrs39InWcw
 4ucl/ZpMEQokV7H+trmZl1BNoIUi0Ic=
X-Proofpoint-ORIG-GUID: LKWvhQCs1OSWm0iqA-ewLzIPb9hfJS37
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA5NCBTYWx0ZWRfX0q4Zav0M7MTX
 vrSbZtexbLx2+6jUhG+mSYvr0RHzZnAlASsnEURrjPEygD/BZwz/DBySxp3f90JKUchpJAtCMB+
 +oKoaF8Ww3QGChQfwYFr8PUa4McN/P7ZKPZjOjRL6DCicwjoAI0vQBQlNQFIwhrGwwi9dB1JPMU
 RAzLL6WLSphQBBZsanotC5RSSdm+yvzj3QbgymG4SqVk/Vd4TLYaxt5SLQs77UN3jHpNfPlRI6a
 RVx2UG6nE72A6djwqVYSR83fqlMDvpWfX58cLhuIkm+uzTX/hJRkY7Z4mKL5G/v8xG0RgJthX3L
 otdctmKios8QHIyPHcLv5yhHd3V5lWun/AK+K8IIwdPqAGO7v322SEE/ICmBIworSxOY0xdl+D9
 zyyDcZLjwbpUJW5D1JbkNtKwDC3DfprhM+3G5d4yVEH0/gDV0yLdV7QqWux4C0m3y/KAAnG/NNE
 pqtewt80XNS1L3lsnlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280094

On Tue, Jul 28, 2026 at 10:35:34AM +0100, Bryan O'Donoghue wrote:
> Add the ability to use a PHY pointer which interacts with the standard PHY
> API.
> 
> In the first instance the code will try to use the new PHY interface. If no
> PHYs are present in the DT then the legacy method will be attempted.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/Kconfig        |   1 +
>  drivers/media/platform/qcom/camss/camss-csiphy.c | 177 +++++++++++++++++++++--
>  drivers/media/platform/qcom/camss/camss-csiphy.h |  11 +-
>  drivers/media/platform/qcom/camss/camss.c        | 104 +++++++++++--
>  drivers/media/platform/qcom/camss/camss.h        |   1 +
>  5 files changed, 263 insertions(+), 31 deletions(-)
> 

This is nice
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

.

-- 
With best wishes
Dmitry
