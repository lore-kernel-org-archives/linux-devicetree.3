Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CAA38F65A
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 11:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777461370; cv=none; b=GpOax8IYVOFASneN6ZhNHRTdvGadZIfB6/8yYmTk8z7iL3VZ+idJM3oI21C5a4m3lrmoWKTH869RYP35ttg6P1Zo5qUF0QYvIQPgk/ikQ/WjdJwdiPsz3rbuDX0EHfMpVBlgOh5w3EmTwH3cOGcZPMska1ubOQcGAGHPfctnb2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777461370; c=relaxed/simple;
	bh=r7g7Tm20OlslBUQU3g/4Mkg6hUWZfO2i7ABor2hIzoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kDQymsaFdZGUUABvqZeVYMJM989j0LSvx1ksv1lwDiY3M0yKoYpib2DsnsodXTuu30lTRiXitrjOzeuZD6Q9Y+j+SAJ3cQOcWj6drvoETTvizHJWw50ia1qQKHW4Jt299Vt1AIUKLUVEwajbvxAjKimTT6Vuim3kxz1yqH6cB64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X5rB5OFm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TpIUi8GU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X5rB5OFm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TpIUi8GU"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qEPs3066969
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 11:16:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DnnyIl7TvFweDB2FQ98uRWoiR/6/z2AgxM6DCJdfXXg=; b=X5rB5OFm1ATf9N2k
	gsp4otHkHwPssJEQPg84pB5T9XUhNfTcnv/7LFbt+nZ4MiNsINpMA2qYCDp0iVVh
	QgaUmW+wtEtpWmKHjzh0h54E6HbYNTS96h1QfnaojPM+bRxKQZ8ybT2hDZcBVUB5
	+o7cA+132KZkoIDB8w1n3jj/nOE3ePJRTkczHziV9vYGIYnBX5adY0B7aBig8dQT
	GdU/vUgwgehDIkkTokVefUI/AJ8blEwGqwwqEZHWHmobfAlJTIhC8Vu6OtH6b+OQ
	tD7MFdKGGIv7ruSnAuSC2vLAin6w2YS5XnLEBHKuENdz0QmMP1qZIB+h4RrLUcUt
	+BtXIA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du7sxa7wt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 11:16:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35da4795b3cso24022643a91.2
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 04:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777461367; x=1778066167; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DnnyIl7TvFweDB2FQ98uRWoiR/6/z2AgxM6DCJdfXXg=;
        b=TpIUi8GUghqOGhnjPLUDdkKEnk+AHTroL+UIz5p/Fr2EAECMsa0W0QCqvelimOHtD1
         b1DVcpEeNOn2nNF4+iKiXN70oSHjuDlwY3ZP6nM0yxk9zOVEdRk8W4Kqyur7hLQi44sl
         f+hp4fXz5KY8w9qimSguT1iZeQwiwFZLIQybv2c3VrGPITIkFaubtCdb0VG8RfmZyj1b
         gkKwvutUio4G1PxZhOv9tQMS9c8IZU6bZXHgvY29/0LBQTp4nlYyBMA4gYXHNzDfsDrS
         i8Kt3HXo7ZDt+f+aqbx33m8HXWdjqeIdJn5tJiAIqbi8f8LZi8VCwv+OZFxFpjbHVb5/
         GEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777461367; x=1778066167;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DnnyIl7TvFweDB2FQ98uRWoiR/6/z2AgxM6DCJdfXXg=;
        b=TXtDdYpc/l4Ri7h4V8DZA9BvXRrg6aLGkJVhHtAuYgRtxcwlnstoA55QgdjgkJT90u
         1kUX+iyRiAjDwIfX0bmvAlIAAyn5gNiomq5OCrrqR5xW4zTk4wAhrr+Al8UtAo4z/s+0
         TvsHxFxTOzIzdM3sIJlg1UH1MTYuzkHGMUZwoZm/ZYooGjv9m5MHAqh40zLxNYx+btoZ
         C4Pauyto7Huu9HQsKZFNMj1CdzfMl8suPgVgwyT7ZU6HJOleC+gI/1hSyqqdScFH7cIy
         bRDvFOIkHlBP+ILr6gZAxZkplW/0TDw45bBun7TqeSuWtC9LUsGg7tS5ZKuoLYQHKY5M
         ARXg==
X-Forwarded-Encrypted: i=1; AFNElJ9ACAucWcXaCeDSs/l1fS6qTRU8/A/kTvT838crWk9DR78RKX64pc/P3W2my0i8+j/RjpFh6uARuf/p@vger.kernel.org
X-Gm-Message-State: AOJu0YwS2IibYdMpr5714sIGmV4B+qq+USYZn7PUotmFNOhZH3YZM7IH
	FON45imU9mhbkFc1YCoWGXbGDhMj07DUtD/UfBSbse092o1DtF9492z4z1Ef9GN3F2RFltQGWjS
	8tqzVMA066oPGUyK7NrwoKfad7vvjR2wq4IctLNtt+GWmFnDUp8rYj587fKbw3kX6
X-Gm-Gg: AeBDievo/Ot/FP7wK9jYu2XZLCWk/br2xOGhnPROzqKZQVcoXvIQwMm1LJBwNC/Z2Eh
	x/t9QEGUSycIslWgwqub0OpgEKlMM0rBy0gGtGyNZzCA2LZXXgva1tThGYzwe/EAwH5BsvTqjyG
	8VuOkgzuMbBgaIelYsRyptsS2dVESeVXjnRky4Up2JrE64HdjKw8KmdraT3OhqZHlNSuygqzsYF
	qVp3go3+dEqk3CE6YmGqjocUg9OoqnTKfFDYItYVQ6g7hJI1MHvq1wMHwFpMJAX3D4PWurh4t46
	3FmSFT6Hgsp3uUnvshuQQkxZJEmK1AKcb3ScVisPL8Ctp0vTU2TiAdcBgJxULRIWGuaMZaHkRsi
	DQ0V82G7hsJ8C7bNF4GewLpjEecEKqI1e4aSF3d51MN10xVahMKipTxx8XLGQ
X-Received: by 2002:a17:90b:4a10:b0:35e:58d3:329f with SMTP id 98e67ed59e1d1-364920a5a75mr7888714a91.13.1777461367014;
        Wed, 29 Apr 2026 04:16:07 -0700 (PDT)
X-Received: by 2002:a17:90b:4a10:b0:35e:58d3:329f with SMTP id 98e67ed59e1d1-364920a5a75mr7888676a91.13.1777461366535;
        Wed, 29 Apr 2026 04:16:06 -0700 (PDT)
Received: from [10.217.216.225] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a0303f52sm3481185a91.16.2026.04.29.04.16.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 04:16:06 -0700 (PDT)
Message-ID: <6213ff0f-b904-4d52-890d-69d453c3db18@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 16:46:00 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] clk: qcom: Add Global clock controller support on
 Qualcomm Shikra SoC
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260429-shikra-gcc-rpmcc-clks-v1-0-c3cd77558b7a@oss.qualcomm.com>
 <20260429-shikra-gcc-rpmcc-clks-v1-4-c3cd77558b7a@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260429-shikra-gcc-rpmcc-clks-v1-4-c3cd77558b7a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CkOXhyq8QF5_h4DUupvim2uUfBliKEUa
X-Authority-Analysis: v=2.4 cv=eeANubEH c=1 sm=1 tr=0 ts=69f1e878 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=qXpo7wsCot1G_wR8kq4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDExNCBTYWx0ZWRfX3jZ5xicYj2js
 npJiHBnUlnGUP9JmJKUx3q+glGwZ0aQxYb8JmgOWmsGd+ME/foF4bpHT5APl9uTrhcZld4VWE5B
 wFmE5icypabheVvFOtBCb9SZDN9WLxkiKuL8qxnBKLhI0r/Fq0dqNz4ZYSSYp+D1ir25oMBol5i
 KVMi2yQvO0EGLFif040/1ha7I0MWIRZeFku9UuN1rVZl3dDWYOBelnU+RUnMEIfCUGnXkvxZFfP
 ew7aMR9PpEdevE+lG5KlQq4THRA06xJdN9G77wZgyNBJfdNYxy1raiRPToU6sdoW+Ht09Mhcouc
 FzkZw1OXpDzy3gnoHgpTHqz55r1w1liuEohy4IYLB+V9hv6D/vSN9Kk/aXwcX4fMdgAiasxyZzc
 vH6KjLPCq4kTLNF4jUHXmchm2LL22Dj4/+WPKne5BwqjV1Y3/l5CDZADrjYrWlNjGgJWK/Ep+eK
 h9OzPV3EHsBgXe1rrxw==
X-Proofpoint-ORIG-GUID: CkOXhyq8QF5_h4DUupvim2uUfBliKEUa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290114



On 4/29/2026 4:21 PM, Imran Shaik wrote:
> Add support for Global clock controller (GCC) on Qualcomm Shikra SoC.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig      |    9 +
>  drivers/clk/qcom/Makefile     |    1 +
>  drivers/clk/qcom/gcc-shikra.c | 4428 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 4438 insertions(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index df21ef5ffd6862bec26e3a77ace62ad935ef44fb..a2c7751b091a482f22baa633d658cad0e52139fa 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -155,6 +155,15 @@ config CLK_NORD_GCC
>  	  SPI, I2C, USB, SD/UFS, PCIe etc. The clock controller is a combination
>  	  of GCC, SE_GCC, NE_GCC and NW_GCC.


Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
-- 
Thanks,
Taniya Das

