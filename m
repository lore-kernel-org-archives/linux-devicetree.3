Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E950D37FF6A
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 08:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250015; cv=pass; b=AgyVBMNkuQP0/kltBn7xcioP7raj+zmkeaMbzJMrhSVg0UzhnYCDiMRC+ZT2SFuntXoXxR3Tt7spwMlstxDBtuimslUCh4NTsEE24Y9fwxGVDGXr3Rryo5UpqCdqRZmEznapz7SaFtrQFDDGEjKC6sjprs05zhUDfOGSUWFmKPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250015; c=relaxed/simple;
	bh=3mauDt/3krkR1odRMOOidZDtXzlE4qNU9pWDtPfeHE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TC6MVOtgJLGzAGG8NvMknB+S4yZgHWYpcoIB5zOAxWc0ebeFASXWaDRDEKhYdzJWMQePq0iXV1zY+Dc62KCayYWv2LWPFYTdLOMUCYWyHU+1NjJcwssfcHc6H4RWjloRDqJAiRFhtdf1lXecLKcRSwZsxAnt85srHeqZPibWVD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XgBzkLz3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QvuVra0G; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XgBzkLz3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QvuVra0G"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179CdM2061536
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 08:06:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jDBl9H6dewCwJQNERd8Hsn6H
	z8VwyR9WYLsgYH0ezrA=; b=XgBzkLz3MlJoKyfrHtpS1De9Q4QNV2702ypZzShb
	qfVcVJNJIobk/+aupqNbdMcLvAMN8tZUvWLGHnEhXQonYP/jS4vzv2XEuKIX8Hnp
	cJ2+e1LbfRl94AqjpSAiQwKjt0wG8g8PGcxqJWNweDJpcdCFT6EcrCzVxxdDnaea
	6OevVZgo/OTELdPXyA4SSJ19IoTsj63sUDV10kQ6v/mKVT3/uq8kJTRWSnMnicqW
	FTBRPup5aVE72p6Rx8A10MtY5gl5OtArnFCusfiLWIe/n97WXncebuH3Y+kx99CK
	ee9msLtYQuh2Y9y/BO6NAHZDTt5SRb/1E7TZBpBqrk1MJQ==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdqbh0wn9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 08:06:52 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-66c70f4b830so5774379d50.1
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 01:06:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788250012; cv=none;
        d=google.com; s=arc-20260327;
        b=f8jNlPdF2la9Y8o7v4/AxIzcEKZaO701LCQji12B9e33eze3M5W/S6Clzi9s7vQHvG
         LySuFfjycnq/GBVYcF+FUKA0XgSGghkRVrTZzcWZry6sHRI2qIXtJOU+zqlVODMJpkcV
         z+CitOGWnOkEHjNHs/hGJOsLJ0n4d2AMvnZlzU2GbFoOpi6yfrLpDRHIA62z4ORBqBwx
         NX4WTXTKPcadyDHVabcCiqZP0bHAu/gfwRej9dayZDVY1RTSvMA2CO73GxrCrQKyELQE
         sGUyBEHwzAm9rQud0YwoNgLJoPnOcbCkYmW8lfqBB09qDyiqZhfIedV6UldNW6kLak0R
         mp5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jDBl9H6dewCwJQNERd8Hsn6Hz8VwyR9WYLsgYH0ezrA=;
        fh=d8/1FeEPIOmPwrzgEGvlBpq5IgVi+wRE0AAm5Sjs76c=;
        b=rnxdiXi+I8HrJhcL8b0a68AVmH8bxnS8W3ZwKXbswksJv62DB9tHtrYA3Y+dHYfqet
         3cVFnj4/VqLiuOXnH9Zq8+aLm400f/FyGedbcrd5w0GKhDV1rMiblu9nm7SB+pnW1lfM
         HxN+Hfca0DT3U17CE378z9RPsqdrGdkVL+EfjzeDJI2KvcF+GJmEqPLn51W3Q957izEZ
         JIncGm6BnbDJp0aRZz7R2fRJ80B9pYryH/0PF4RoIsX4jbRuxkGm8pO2O0cAtSihsDfD
         inql/r9MpE+wHcikzCRBwr2/4LTYBIZI6pFzq3bGMiI8RuPp81XUrKqcWrKuCXWLbP+p
         0Whg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788250012; x=1788854812; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jDBl9H6dewCwJQNERd8Hsn6Hz8VwyR9WYLsgYH0ezrA=;
        b=QvuVra0GoXnR1TwUvIJM0O+I1LSe7deVvUNEeyCuswNAINd5yKJkMU6FCi3+PBzMGd
         bxiBUoeyuxqgBJKkGtCdw1h2mTtNM487SjS6H5AVTuuNjmivolSgNpdojbMmbiCBD1RT
         Ec/4hQ3v777XkHEuP+EfEathhHA8eLw38ES+aKP06pI0V21ydvvVAsiOIXX9V3OWSy8q
         4TSLzoXZ/PXkpyCIMd22EbdOMGnCSt5YhGBJNcmmD5shsuRaQguguMiUS1r95EeQsOW1
         m3jxUb3xIEM4YmTESwJ9kBX2Aa3wRMwblEUi6/4r+o0aOG6Vax3A+I7bwRykNJ3htMgN
         h5Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250012; x=1788854812;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jDBl9H6dewCwJQNERd8Hsn6Hz8VwyR9WYLsgYH0ezrA=;
        b=JVcyLJzJWlk+cHmuEaQK8B+29St6hOPlbJTmqYl0E0s8YnfXeiVNBN8ynptpSt+y7V
         UXRYxiI351NgMuxpYJ9aSJnHIea9IPgxr81M0i25tBz6wT/WvTTapXFT0HPgQvPBxF1X
         fJ/v7/Kc1cAIwZqUBPvp515i7qrdpFcSf5TmKYBjW/H3Gs+v+U6efy1HUeWpqxNV9O4o
         3Fnl1LiE93dXG8NKYj4Qk77tPuL1MZnyqZ3At2Q7xQQLADcxN+5aZ728LybF7VAz/tjo
         f1Mcuw6oUWhrVSkZlEZhjtC717uqsKfy1SPOrv561ZBevVVsdi49D1MDSz1E2/5TULCs
         7Vfg==
X-Forwarded-Encrypted: i=1; AKwUvBwbxU1f3QP9z38u9t+/b3lzks7RzHCVUbY7Im2ARYVaIGvBq22H4H7PpDEpOF8XQ2QPEMLKTEmEDFhK@vger.kernel.org
X-Gm-Message-State: AFuF++nrKpyI9EGlU9A0+RSTRyVz+VAht7F1Q+vB1npeYzK7mtZRbl7Z
	i0cRQPwsxMK/Q2gjiF18BeqTqy5Ooen6Jq3plMVEESn4yvleyy952CasuUaYY3xRUapneg5NQVt
	+TAZKajlsiMUuDnxAivo625vnlzs8LX693VT/tga4nxc8M4KlvHdHEAzqUHhmF+crR161gqQj4U
	rrlOe+sq+Z6tjaBGc+Vg3bLqXj9hdZhrml/42JemM=
X-Gm-Gg: AYBFou3DlenorCCzbUt3QNThdkUlQxXpraBgSRy3xXfhBDhTOUZzgNhr6lVyGqUiKLm
	eQ8SHfdS9znCbiHO7RB4fOTlEepABsNFLSpQHK2Sr7X5nIdc0xrEZg68eDpG+t9+Mp6E9Q53Bfm
	mAwN10Oy1akIMm5388+42Oog1RmM5vqSWbS8NUQm+SwKEGMR8DdPD2uyoSzQ==
X-Received: by 2002:a05:690e:b41:b0:66c:c1d7:4c5b with SMTP id 956f58d0204a3-66f87439adbmr2317476d50.16.1788250012401;
        Tue, 01 Sep 2026 01:06:52 -0700 (PDT)
X-Received: by 2002:a05:690e:b41:b0:66c:c1d7:4c5b with SMTP id
 956f58d0204a3-66f87439adbmr2317463d50.16.1788250011999; Tue, 01 Sep 2026
 01:06:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com> <2e998f75-bcf9-48b6-b9ac-52627d52d284@oss.qualcomm.com>
In-Reply-To: <2e998f75-bcf9-48b6-b9ac-52627d52d284@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 13:36:40 +0530
X-Gm-Features: AcwNN1Vrra9J9RcWBYUJJ7qw5Bpw3Tp2UKjVq7_wLN77WCaIz4OfWXHftpcjZXg
Message-ID: <CAC-tS8D1Q+Qq_cuwJbc5jU3UiOEe03zqgrvbQ8VAksmPEiZE1A@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfXzprqDN7HBbRN
 E7ABnoi5m7ZV/CfQZyAhTqdbz6+9LmJnXgQFEBHN0K5ttJ0zNTUFcQxG/UKV51KTyYbfzyT+c3I
 krO1TkF9Iz5CwPpFSSERa4yxt3B3ZMo=
X-Authority-Analysis: v=2.4 cv=R9wz39RX c=1 sm=1 tr=0 ts=6a96879c cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=qe6_PsajVfZEHvrFN0gA:9 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-GUID: rvyHSwzct-SEARjf-mAaPwBB1wFw-sSQ
X-Proofpoint-ORIG-GUID: rvyHSwzct-SEARjf-mAaPwBB1wFw-sSQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX95cfp5JDJftm
 Bp4Xbs/makuchvuHE0GMIq3SwOOky9PFWdnXJM+p4mlLbNYZpw9eHLZbbSJaoMEly9NI8oxs6UP
 jFjTagI0OfCcYRoj3TyngzDnJFeOeN384Yr00HP3Wm1qBczByqhKhc5tK/RXR2/mnR1/yJoltrS
 CxQp81Sr7SEIzQZptC19MVuNM5LBaMj6uf09gg31RmX6pkRMUMt8s0b/t8VDS9tmDQ6ddzO17s0
 VVu58GNnTxxblq9m+EHDsa6knmfl9RYP/fMmInFNiDOKJhii93puZCeKtQeKFizUrjf/S/jdGuG
 a9n4o+Z/j167MqYKKl+QvpEDyxelnW1spy8bm5vHwo1Zy5mfFsKqqEgyxLx5/LaW/B//4nK3bj2
 HmelW7IP+1ZkRoChkq2e8gD0ILYyvniTU6oxatBRZtkQUh62WM0+plHdN9QYuziTeMyT9gKYprY
 hTkNAQDZ1ZUSs006IKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010071

> > +        qaif_cpu: audio-controller@a000000 {
> > +            compatible = "qcom,shikra-qaif-cpu";
>
> The DT binding filename and compatible string do not match (qcom,qaif-cpu.yaml vs qcom,shikra-qaif-cpu).
> Usually DT binding filenames are aligned with the compatible string for clarity.
> Is there a reason for the naming mismatch?
The filename reflects the controller; the compatible is
variant-specific. This follows the same convention as
qcom,lpass-cpu.yaml.
>
> > +            reg = <0x0 0x0a000000 0x0 0x20000>;
> > +            interrupts = <0 331 4>;
>
> Could we use the standard GIC and IRQ type macros instead of raw values here for readability?
> Ex: interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>;
Will update the example to use GIC_SPI and IRQ_TYPE_LEVEL_HIGH.
-Harendra
