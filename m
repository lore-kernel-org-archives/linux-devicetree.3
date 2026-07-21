Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD57A45BD4E
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784645052; cv=none; b=Oi9FKNPOt8wnuWtPgPvf6NeTsgIqCAjam9GTIXa1LOutOieWC8Kft1lLBv0Op3/scNPOq/w4sJUWHdVJASe1tmoM1FokByzJla9btJ3/lKSaHvNf46ralTRFlR/U9F+BRUzefjRTUNbJfJxhoYXBcIp5C5zkZKjFIWXQSKgip58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784645052; c=relaxed/simple;
	bh=zN09G9HHNIaRSV0MXtW5wSVQAhRgdo1f/EjlUnrkxZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d1A3OE9xZeQMAgCukQlRDmA76EBynUwSM3MtXzZnolaj96sC6fK2VVWLtaP7cK8BKWyZAgnLgotd42U01O4p5eiKwnyxKO8xVBxs/20t9e3spFTilHiKy9gT6PROM78UCWjbYXPdIFxgf7TGifsMVNCYWqE9mczwBDmwP6Z5tVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bwfxCzy+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CCfev3Ta; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bwfxCzy+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CCfev3Ta"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDgG6X1399781
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:44:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jHoHpI3odSPNmkYnU8vki83ae+Xi9rQiUeDlxvIXaPc=; b=bwfxCzy+xGxQGK7g
	iy4/DGzupHblfzbGjXFYGRHHsDSYgrHxmsYhQ8415kKNH7KNgFHRWSPApKPM9ICZ
	aCXgmwCkjeh5RTE4laIVn0zsbz1oFRKc3+8U+G3Kkq/XQcbF/rJ4LM2ZuN0ioSEE
	OKoXK3p6Y5VD1r4Y/00iHdONi3k/9uQ5pgz+HDiE7pGMZXBK/1JtJWKrDjWmIMhQ
	0f3UkyAk3U3XejUa4Doh4ibU2+o5lSg65B/Cnb0vEg6dZWZc2ctm2uEpfGyly1ZZ
	tGlXAAsSealu7yKvkbcSOx8gJIqWnZBNo4FsbB2FxNaX33vifLJpeztYBPWUtwqz
	lqzSmQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1es2ybq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:44:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930a312222dso73852785a.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784645049; x=1785249849; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jHoHpI3odSPNmkYnU8vki83ae+Xi9rQiUeDlxvIXaPc=;
        b=CCfev3TaG7DRhFU1XmuHv5chgtosA+iGi3tdBHkZT9Ot03n2WUx25+sOACLvUE8PP5
         sH6oF78H2A0TyC+HCMEm09Oz5eaNKZT/fptxtSRhPp8UlQIumguu1DCPLKUqqCyLbVrz
         BVZnwVo1DnlRmTsbeJRpXBZUmytqeml8mZySlN2dLMQUUl3iZzv6YUCpzdtfxvYJRldh
         CVbiOtF3R5Ou+pR8bQgd5ppbMnuYRl1qt2YFuXYU1pvtmtw3LlU3ARWOEEttJre8xdkB
         XB5J6+Er79bl48tLI+QZHl7QrGnB1bUrw37TBAyacwRVYJCthFGwDsekYsEN0r4Epj0Y
         q7uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784645049; x=1785249849;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jHoHpI3odSPNmkYnU8vki83ae+Xi9rQiUeDlxvIXaPc=;
        b=NF6YWJnIRmI6eGrEI2mT/2eeDd5TR4lnya7zsP+vMAPzjqhyemxMfsFtKImbQw/QKI
         yAnKOJtnwNL02GQ+jZVhTi1RnLVhwo6vrdtSUZkRtpV2wvVWS8z01wjatT4CBQvO0Ry0
         BJkgoPS1ieDapF3QqshEwExTslAu7gP+eQYTMMXlC3T8y7Hw3lba0ncrPDgL9IFwWbfp
         cbCHheLO6+w7tx95OZwKeYiMbDUzJsjDOoZ1rOfGfqMkLbgAevaBPsftXsDFpV0K97mN
         OJT3YRhHpYyWj3PvYRnbS90iTZkVdx8dDD8XW3G4FD7pgHXDKQlozp/MKbuV7e/IZeUQ
         SlLw==
X-Forwarded-Encrypted: i=1; AHgh+Rr+d3yq2kLu7NfWI3i5jY4VCh2QupK6bJXwU3UQHyNwOQnsDHb1WqrJxSsrpYxs0urt0L5qi48JIycy@vger.kernel.org
X-Gm-Message-State: AOJu0YwBDtMeLG4BE+E9uGhSZy8zWlU3ov8Hc2XjF/9bq8FL2GylNwA7
	lw5pIEDLv4GpJ9LEfRQXjX+Unkpa7fH/r5FNhZRQsL7yCFPNO5fctIRaynKeCzbQVSm1YGba9Dg
	a7tdk7e80OPXhcXWZwTxtJ36SASJ5/TcOBP2cZ/RilGgdnJ393UqGINOO7+x0IR8P
X-Gm-Gg: AfdE7cnmt9TF23WNaVp0Hy3CQe4ZkJ6JSQjDwAb47vtXEjMMiwWMVCPy6HVsymIBKFn
	FCRN6VuNvKzeOqsqvNb8+38A6kxUGbWV7yXepakmJjAJhcI28Y57PFkC+9GLM7Me6XmkcySEsj/
	3L2FlUtFiMGiusZTXkcKjIqgBSoWA/ry6Eg3s4V3yRQd55TpvIjCcY3taYK422lvm1Xo07UM3Gb
	rcCA83oubtfxIBB3tf3TNptAso+5IcfCivHtXdlPMkk2nYzURTbdXb0a/c4MZ1ZbLADFkfgaRCs
	/OnmBif7XGuJAkztFkvNeDVtEHJa8qaH6b14L9PqYGju7n13gE+1k0Exzq9eVDsdvfVid4yQWsq
	InJLhPFv045WZoFJLd0UxGpgW
X-Received: by 2002:a05:620a:2704:b0:916:1a60:ee05 with SMTP id af79cd13be357-930e6decc1fmr256814385a.0.1784645049018;
        Tue, 21 Jul 2026 07:44:09 -0700 (PDT)
X-Received: by 2002:a05:620a:2704:b0:916:1a60:ee05 with SMTP id af79cd13be357-930e6decc1fmr256811885a.0.1784645048458;
        Tue, 21 Jul 2026 07:44:08 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c17009ae00asm595403966b.7.2026.07.21.07.44.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 07:44:07 -0700 (PDT)
Message-ID: <4cb7cc6c-4363-46a0-99d5-ad352d365662@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 16:44:05 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: qrb2210: fix PM4125 regulator
 supply parent mappings
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        jishnu.prakash@oss.qualcomm.com
References: <20260720-pm2250-fix-supply-parent-v2-0-60ca47031b50@oss.qualcomm.com>
 <20260720-pm2250-fix-supply-parent-v2-2-60ca47031b50@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260720-pm2250-fix-supply-parent-v2-2-60ca47031b50@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SPZykuvH c=1 sm=1 tr=0 ts=6a5f85ba cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Ar_5JxPjAAAA:8 a=EUspDBNiAAAA:8 a=O5Nzd4jY1Dkw4bQrKBkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Tq_4-ha3BDidgNi_ETi_ftz_wffG9hEp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE1NSBTYWx0ZWRfX0MKov28h1k2m
 Obt/BFeHpWn3RySMYDNcGTRlhKay8VMt/unMdvc0ztvOAUIjNsZp736lUIpbxem7DRgVJigu0Zc
 B+Ks1O2MzQj9YiMX7zziWzwBVLmKoDt3uR4M8mWmGm6imHctoBdJcPbUIDMMn1Y4FgPbn1wwlu1
 L8K/ECFj0eBxD0lStjXEzJKs6EwPr1hRnnTy3qbcKJbJ0r9vWOycvClgCr1iO2GKkw1LQULPBLq
 VwnX7kE7pNlLM8B0BrJlSmAPYJM2v4HYisekScT6cwpYrT+WPagWrJaoTzj4ldpbl5s15LIjyep
 nQx6RcazLQW8dHLIj5TB7YlBo6hfkRnnm9nBScpswWaQUuW//JElhzJpk65qexRG9F+g1pg+4v7
 /xRzCfwniR9+hrMbtZsxglJolN05udziAR7gEBZWVNlMLbQaJfXFtdypAg2bLP9vR9NHoniPltj
 n++p5+HeTFGAIX9YwXw==
X-Proofpoint-ORIG-GUID: Tq_4-ha3BDidgNi_ETi_ftz_wffG9hEp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE1NSBTYWx0ZWRfXyqMJM+MeUGGx
 PUgkvC39/MxBRkaYK7/tupscCUUCKO+HyVdXsBOEUQaOHtE/kggcPJkTaS8dOvEWLRhprXEagQp
 oT2pLY+WlcSzVqzFiHhdBINt/V7egsk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210155

On 7/20/26 12:55 PM, Rakesh Kota wrote:
> The qrb2210-arduino-imola and qrb2210-rb1 DTS files used coarsely
> grouped supply parent names that do not reflect the actual physical
> pin connections on the PM4125 PMIC. Since supply rail connections
> to PMIC pins are fixed in hardware, these grouped names were
> inaccurate descriptions of the hardware topology.
> 
> Replace them with the correct per-group supply properties matching
> the actual PM4125 pin connections, and align with the companion
> driver change that sets supply names to NULL in the qcom_smd-regulator
> descriptor so that the correct supply topology is captured in DT.
> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 13 ++++++++++---
>  arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           | 13 ++++++++++---
>  2 files changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> index c472e13fceca..90e6eb284a66 100644
> --- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> @@ -262,9 +262,16 @@ regulators {
>  		compatible = "qcom,rpm-pm2250-regulators";
>  		vdd_s3-supply = <&vph_pwr>;
>  		vdd_s4-supply = <&vph_pwr>;
> -		vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12-supply = <&pm4125_s3>;
> -		vdd_l4_l17_l18_l19_l20_l21_l22-supply = <&vph_pwr>;
> -		vdd_l13_l14_l15_l16-supply = <&pm4125_s4>;
> +		vdd_l1-supply =  <&pm4125_s3>;
> +		vdd_l2_l3-supply =  <&pm4125_s3>;
> +		vdd_l5_l6_l7_l11_l12-supply =  <&pm4125_s3>;
> +		vdd_l8_l9-supply =  <&pm4125_s3>;
> +		vdd_l10-supply =  <&pm4125_s3>;
> +		vdd_l13_l14-supply =  <&pm4125_s4>;
> +		vdd_l15_l16-supply =  <&pm4125_s4>;
> +		vdd_l17_l22-supply = <&vph_pwr>;
> +		vdd_l18_l19-supply = <&vph_pwr>;
> +		vdd_l4_l20_l21-supply = <&vph_pwr>;

This matches Uno Q schematics:

https://docs.arduino.cc/resources/schematics/ABX00162-schematics.pdf

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
