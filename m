Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C24315D5D
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 03:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788838112; cv=none; b=G6k2AbNmXacTFYIH2SXupVrsMzJ4A1ZVpMPTHr8FvziHJNwyYEx7gJovsRciXocORuE82m1uzqksIgUjDWpXg2LPOwpjMM9g0SVClD+m/LDzMQY9ltaD0l7O69gj0DKYGXuR7PCHWDuzfCB1U+Ksw3BHXProtzy4j0RrflSlTZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788838112; c=relaxed/simple;
	bh=SyhZKiR68CZ04tzIfEj/DtTdEFdN4/+8mi8sTjIBL/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SixWVUqdXV/FJKBz7hY80wkKkQ0ng/qXfizLUlMv914ABKsh1E6P4c3PQC9MTwRseOcrQAFM9HGCNOzmh9JbDOkAsPlJkbYiCtuQRhM+1WV4F9ho4HHSr6n0XDHVHnuK6SfUbLWWG8brRIqeTBaGBlLsGjLIoNXqi6r25MAxiZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VSZM+V4D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LgXolCey; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VSZM+V4D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LgXolCey"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687NmF2G682012
	for <devicetree@vger.kernel.org>; Tue, 8 Sep 2026 03:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jOFICu+/TxYyTegVJ+ic4nC3wN/lY3Z7pXeHMMmZOvA=; b=VSZM+V4Do+jdXhlN
	2d8azx9IAXqGN+B+Jdai8z71xYN2/OXILt/DaCSL3p0P199h+aw4VxYB5NCbFmaR
	0R7cBAYLyNtkJmoSteNTq//yf7tc14L1wqQfbGLuV0D9PgbrEpgNOF1oTsUqt+3J
	0UHb0n7nb29dA7CKDTmdBu2TLbn5K3e/vVnCndA7OARl/cTzykP9wWAk16dh7tcB
	2sXcKqIzEkOAwuzU6mB+7lwElhWKYSKfpCb2L3shTFMRHrI0Vzs9v3nitoNWpzld
	/xyihy9TvDT8c41fTh2bgupuavgd1II4cvRXGoBJVUcuaN/5fq2ZtRu1N/AXuAxr
	ezbpLQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj077hqr9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 03:28:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2db050d469fso22262435ad.0
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 20:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788838109; x=1789442909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jOFICu+/TxYyTegVJ+ic4nC3wN/lY3Z7pXeHMMmZOvA=;
        b=LgXolCeyHWygeiu5s/eViOTL3nJk4C7w/UECJhH7xO9bzJIzClUWWFTEG49WrtKqqW
         IHVTeJZqKbjkwGZiqRkVKJxoBi0LWRUO6oflPdS7ojiChjQgLa1q7onczmbR0Yrvw8He
         KyY0sCmyQR7miHEslOXK/G+UT5D8/tPJvfAS3aRBZ/FjsSDNIHJOilk2Xh3z1ZmbqxPU
         EPClY/4glL+lK52nUdz/gNimUhcQR8nXxoXmY0Kit/btxlZ+aZAfp/QkNcyBsZ5oeV5u
         qmMNtA1AssUbW2IEG/akXQX7ELwW8EEITjMBKQkst7C+QRr8jcxjaNon1imoBoke+rne
         Q1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788838109; x=1789442909;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jOFICu+/TxYyTegVJ+ic4nC3wN/lY3Z7pXeHMMmZOvA=;
        b=k+uJ4gxicYwNvbEH3T+ZbDblROLYm7rwY+4r8lf2xFDiTf4kldinPV4F4FPERjYbl+
         FH8HsfV3tnvVDqLWZU1DMq1HAmvGNsaKj14sJrVeNscZgDiiuMsoDZgGsdQsgT7HUWHv
         5ovWaKdskpBdKE2MiVzsmITYOvk/PFVJ3nAXKG1KtwAa1LHpROFogAwPfxaRnYc3nswy
         ksAaAbmVvwOJCi2EAKh0OHMLkwWRoisnfZq9/TokjtJDJFUs99YOtH9OPKojK0x1pMK4
         fJ+4wnwgmtaJRryq3LMawQA2M/KUYBOMNM53dC9TBdNkoVlhVCN0eSVB/h2TAoU1lLbF
         YVAg==
X-Gm-Message-State: AFuF++l/AQ95Cf9JhuREkVF9kz2FbCbXNq3itdM833NL8skGfbrxqusy
	aD4E4qsenHbV0EOp5ma1eqhleLRPrPP3r1epCYDVI+ORwPmrBkLYJ2Tx2gtsgTn+4h3/zwzKMjv
	gIFSv2CvVXZVq0ls8rlBSjGmZzG4aXae4rpUueLF39Pt9q1uuc107Qaeb6eUQADAj
X-Gm-Gg: AYBFou28zBy+TZNPTxgfHVA4PTVt65PmuOyq76iLJ1k7BIT3PE4lYzHu3DkFTxGriuM
	0dCj0L1tE1Wl/prljqQv3qbTFGfj4nY4wFuFV+OC65WalYM8WGDPDtTM4B+x/6P02UT2d69rYJz
	4wFbVhI/QzyexjqvvQyVRm3L3SNXqBo4m01IUmIZEzyG2yf1EtQldNyjJe6EIH+7S3bymou3JmB
	zjtXYvUIQQ0vQeeOu1BJwz4g3sXQ4Foo7WV0j59jvPhCJp4ZZM96edFroMrq1jgZTk5VyF1PMWe
	bDqdp150VoT7rmqso2DoxA6Kp0kcECOPCSh9uwqaJ22Ru5HjxR+A8RoaGKN/hJUD1XwURTUughx
	RbBhJY2dkYsX6oe7gnS9BvX8gcBGya/YAJeSUkwEh7TNj2R/C7OAsfd8GXKCvZf45
X-Received: by 2002:a17:90b:4c10:b0:398:9bd3:d6d1 with SMTP id 98e67ed59e1d1-39b8bec869amr3836550a91.11.1788838109310;
        Mon, 07 Sep 2026 20:28:29 -0700 (PDT)
X-Received: by 2002:a17:90b:4c10:b0:398:9bd3:d6d1 with SMTP id 98e67ed59e1d1-39b8bec869amr3836536a91.11.1788838108871;
        Mon, 07 Sep 2026 20:28:28 -0700 (PDT)
Received: from [10.133.33.39] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08bcc090sm29612468a91.4.2026.09.07.20.28.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 20:28:28 -0700 (PDT)
Message-ID: <43a9f5ec-c8c2-4e3c-bc78-b980ead0ed5a@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 11:28:25 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/12] clk: qcom: ipq-cmn-pll: Add PON reference clock
 support
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org
References: <20260906-qcom_ipq5210_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com>
 <20260906-qcom_ipq5210_cmnpll-v4-7-aec5ed642f4f@oss.qualcomm.com>
 <20260906142559.17FE91F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <20260906142559.17FE91F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDAzNCBTYWx0ZWRfXzz4LAkhwqYYr
 1cVpazP0INw+OxoWAtyakYKhqtkpEt9LloUG3uuwcnw/9ouZiwYp9SeYD5+p3g8z3nlX7LECSXZ
 HBJJ8oMeXNnOf8VWWxX7q681LrjyPsZIVrtS5Vn6JTZGp4cg+T728TyVObGzCyxwFxDEM83v0i0
 dJMDMVlG32jT9A4CoKItUf9dKSs6v8JJYmWg70dwpE+lVnxWzYJqna4NdcJDN5m2Xqd7D3F7rS6
 XH6KZs1Ct8ME8qHCSBCjKf+fbE3gyf7nm44S/L7poo9BjuMJtniZXKshdpJUCm+KqTUqY8fW8kl
 SacU2hL1jO7O9ijKB2sbgjyxmyencPEM7pK4DfYzaAHB3vRMupIczBrr4CI5vT+gMg54N2hqUtI
 mPydSch3NhVd9c6kzne2kkVGq/AwMsHm0OGOftN/1aJ+XujP+3alpRv639uwRH5XJYYRepX0Eng
 dyz3JWwpiKQtkiYC3FA==
X-Authority-Analysis: v=2.4 cv=Xbe5Co55 c=1 sm=1 tr=0 ts=6a9f80de cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KbbPYYVOdocP4CsVI9sA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: s9W8mTD1jjMqKENTbhnd52-xantbxRGy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDAzNCBTYWx0ZWRfX2aQ3lVxwjjGe
 5XDXyzDfy+lT2BigNmTGw96t5UQqAcfgRBtdLHuL2QWHGTcGFzGiwQ+0a+DauqvY1rSkd5mgSDL
 o56ypKVZK1aH6Sw03Rvz24ER39mpbLo=
X-Proofpoint-GUID: s9W8mTD1jjMqKENTbhnd52-xantbxRGy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_07,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080034



On 9/6/2026 10:25 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] clk_pon_clk_determine_rate() incorrectly fails valid rate requests due to rounding at bound edges.
> --
> 
> commit 9a9a4823a8ebca7e3c30590799eb2ac41ada876e
> Author: Luo Jie <jie.luo@oss.qualcomm.com>
> 
> clk: qcom: ipq-cmn-pll: Add PON reference clock support
> 
> This commit adds support for the PON reference clock to the IPQ CMN PLL driver.
> It configures the clock to operate in either UNIPHY mode with a fixed 31.25 MHz
> rate, or PON mode using an 8-bit divider derived from the parent rate.
> 
>> diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
>> index 44d035870a89b..f12352a707f7a 100644
>> --- a/drivers/clk/qcom/ipq-cmn-pll.c
>> +++ b/drivers/clk/qcom/ipq-cmn-pll.c
> [ ... ]
>> +static int clk_pon_clk_determine_rate(struct clk_hw *hw,
>> +				      struct clk_rate_request *req)
>> +{
>> +	unsigned long div, pon_rate, uniphy_rate = 31250000UL;
>> +	bool uniphy_rate_valid, pon_rate_valid;
>> +
>> +	if (!req->rate || !req->best_parent_rate)
>> +		return -EINVAL;
>> +
>> +	div = DIV64_U64_ROUND_CLOSEST((u64)req->best_parent_rate, req->rate);
>> +
>> +	/* Clamp to valid range (1-255) */
>> +	div = clamp_t(unsigned long, div, 1, 255);
>> +
>> +	pon_rate = DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate, div);
>> +
>> +	uniphy_rate_valid = uniphy_rate >= req->min_rate &&
>> +			    uniphy_rate <= req->max_rate;
>> +	pon_rate_valid = pon_rate >= req->min_rate &&
>> +			 pon_rate <= req->max_rate;
>> +
>> +	if (!uniphy_rate_valid && !pon_rate_valid)
>> +		return -EINVAL;
> 
> [Severity: High]
> Will this logic incorrectly reject valid rate requests when the closest
> divider falls slightly outside the boundaries due to rounding?
> 
> If a client restricts the bounds (e.g., via clk_set_min_rate), the requested
> rate is clamped to the bounds. If calculating the closest divider for that
> rate yields a frequency that barely misses the min_rate or max_rate bound, 
> pon_rate_valid becomes false and this returns -EINVAL.
> 
> Should this code check adjacent dividers (such as div - 1 or div + 1) to see
> if they yield a rate strictly within the requested bounds before giving up?
> 

It doesn't hold up for this driver, a PON reference clock feeds the
UNIPHY/PON that needs one exact standard frequency (e.g. the 31.25 MHz
UNIPHY rate, or whatever exact PON-mode rate the line rate dictates),
not "anything within a window." A real consumer would call
clk_set_rate(clk, exact_rate) and expect either that exact rate back or
-EINVAL, never clk_set_rate_range().

>> +
>> +	/* Pick whichever mode gets closer to the requested rate */
>> +	if (uniphy_rate_valid && pon_rate_valid) {
> [ ... ]
> 

