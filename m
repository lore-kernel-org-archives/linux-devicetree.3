Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421602;
	b=QEA+CYUNdwZMSOdV5+sqJIBfiaE4dRKaaZZWjxoKqzMXgm4RLUMuZUdGJeWzmdjqJpx8
	 1X+59T08AMzwSXsnc5g53bQVSmVuP+DAmnUiglXPUkLlnn0vnxbfnH5JNc5KRJ2QZKE4S
	 FqbmNjjLmCWQicECUviQZgavKwRHSkzCe+h2Rfa0t7NesOiCSjeXAZouaHf3ckGNPo/Zg
	 AadIfa/AjmITQCk3Ma+ELCsgbdg5bQzLCb55Rcjlq39On3+86Xg+SBI4cMY6eRpWZOwYY
	 VFEcxnAIL03lzCSFULYfjlp7bA44smtFR8/YJhZHk5qnOlxCMCsLl07x80y/sjqWJHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421602;
	h=Received:Received:DKIM-Signature:Received:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hFMMKNRMDSpzNpvy3+kJ1EyZ7wJpKMIzqJUYG/JxNwg=;
	b=NSZngHIE4DsKE26qVm8RI/H47JD2EiDfy9SDx1BwF97nXiZB9Cl4o65fLTswJBX2jyca
	 XbFY7IPHSOlreh2SO63l+2Ui1pJU0ftLRYwQw4eswLLZZVgPlM6i2mhobax1BY5tTJqtB
	 CTWIJYZV5uwAISeVfwyX36/E+EKu3/z0nnhFMI8nfvHv00NzeRA2YwOi7edguI/zenjOY
	 /yMcON5IHqss1hK+EhL3Uq4WWrDYrSi/z15VGFyjKZXRCkGYwRtiyjPjNW7dAe6VQq66v
	 eH8eTcfQmCjL9+O+7FMrQolYmY+BT8EbLrLPgm4Cy//0nXXrE45o/PO5b8UOCUXfD2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="cXYZb/nZ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gmOih3o2;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BF32606AAE9
	for <devicetree.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 14:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cXYZb/nZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gmOih3o2
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE394C8473
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421602; cv=none; b=Jmihnshg3agl5HOpbRG1OKIsXjQmp57kGtZfK0z9rwkHVCGaGurYdLqAxu2mNe5NhQJT1A/jdkOo55vJo0Pt3AyhER6E8qf4Fr/OrSFVXyOAEu7ZST+VpaICnfF0aCVcBiN55MVdZ6J+si3WEMaoAQ352Ee2bHWH4JvRAq8OdSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421602; c=relaxed/simple;
	bh=VUJcuiGWrc/VTOU1ddPCEZGdzHccyfbVYcukszE+EZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S9480tZxR66ofjIEMA/H5t2joNyM2e3pAapWQsom2Xi/lxgdOr1gWHP8AxR0XkypqK/SPrtzTsHHg7Fz6kRDWwf4k460q3XRpKSWUiHbWSF+NJRNMZ7b7jKR7NHmvR1DoWmE/X/2W+Bzj/EtOIdHrB6DKnmH9f5yvAwyI0IXB5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cXYZb/nZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gmOih3o2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0Q2n2925839
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:53:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hFMMKNRMDSpzNpvy3+kJ1EyZ7wJpKMIzqJUYG/JxNwg=; b=cXYZb/nZKZ0bU1h6
	1XNLExxGiATo/yC39BDOred/ABS9YYZHO1ffkSyZ+l6NBFihi0Iyqpfjrd/o4ukv
	l9NZGKcGfgemARpS0sBG0RSt/fiH93EBBbHgu0i5HTF1k+4zhEIh823EfZvSL98r
	vEHbp3rpO+JIyykJ7xNI94k1tfmDCV6THP9EqkzNR1KWiwN6VBNuc/AiAtjLy4gJ
	2VXpD5PI+f2pD0JcUR3mCHACkmj6y5if5C0AccwZAQjpYUsQ+c75QjP98ex+2059
	ylZoB4Lg214OTqW0gsodXtUQ/dQOBcAYcJ9LaO/8sX5TKMp0bzo7hPRj4wlgqexv
	ZjzYEg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5w1bbcq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:53:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2bdebfc5so77839485a.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 07:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421598; x=1793026398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hFMMKNRMDSpzNpvy3+kJ1EyZ7wJpKMIzqJUYG/JxNwg=;
        b=gmOih3o2PLdm/Uq+N7qG5bWkoV6Vs9V0M5Uuo8jqwAYAUglDOH8A2E53ZcBua/Joaq
         TKgd74IeGWH7s8+tPZCaSc85m9M45RtCcuOFZoprDblGeIw/tWp7SJ67uoUDjAG9lUxb
         sWecb/snIon9tikOEY3vBXL691Xlgy8q0FCIzvDS2HVYX++ksRj9W2myxJNIlH4vdv14
         UrJk8RAiHr1C7k2bA/4wgXG+Xv1jTfgV4NNLwm/4gK5lbzNQCvtbpR9W9NZCB/jElV9A
         PPiqAmT89uZBQJRjgXV/f56B+rtrlTPWD3oPM9GKS1H1sl0eutJSftcYMEfvROScQSSw
         +wuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421598; x=1793026398;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hFMMKNRMDSpzNpvy3+kJ1EyZ7wJpKMIzqJUYG/JxNwg=;
        b=QRqy7Fwuj5zGgAGpge1m6MaMNU75J9KNYZVJwOezPm3jn7cfU1jslqbjAuZrbB3naf
         vD0lVkD9olnLk3a79ha6ePJjFJVNAb7ug81I6hKSmD0rIudMhej0PabEQrZnHCPJ0t2Y
         w3hF+2MBJDkLtcBnx3vULvS75/EvQKQ75QMO7ECwPWzTSJsZA1OBdimNZ3uYvJ8kIEa5
         2NoOVUd5Fc+kjzQKq/sw8edI3mRKQDnbSDknwEJvphAl+VdmU4FFfw8zQY2zX8Ec2lxx
         AWqpdr+HjTuBdhONdP5K6IqyP6iK/Mb9KziETYjBHutM3dB+wx+ZhofquZBkuLLN1yel
         b7vA==
X-Forwarded-Encrypted: i=1; AKwUvByY6hkldSKUFyLRu41QCp78okuStH8cfvR+lHA6ZyksHQXK3TGSdcnwDV8oVmo8Tbusgr8A4YAikU+n@vger.kernel.org
X-Gm-Message-State: AFq9FYITsB/nxiCWcUZOXkvrWRZx+GbVl5oaH2uoiLX4qW5bP7sP/thR
	dN4axHcqKhsK3cWVwW9wZodN7q7l+CVZ3+o1wZp3Dmtv/OdUBbu+ZcGoIKOEZ+jSAP3LP2d8QEu
	3T5GUUpPoDWS20AYIT1vL+HZ4p44zQ/fh+8EXOkTkdgXxfjP8o33F6UNQBft7jUc8
X-Gm-Gg: AYBFou2OWDqzXR1kA0S8XEQC4r6p4RurMUxjAvxaNcR/B3tPPy2oBHD43y5zW/YQwCA
	ROp8Y5imKJoQ6Z7RdlsitZtv7Em9mlg57MT3Bz1sgZUS7KYtSerMnu7sCoWe0PhGYIdYnPrSQoh
	NNUIgR3kWsIPcy2i7oVeG9xMMkf+EiFx8oSvQqVSJtbF95DsrYPUoL2Z0oXYrhIxdHPYM6F9pks
	YSgzef4mUyeWMH5gApqQ+Sztu9brAZERWEKNFUnN/DrpbvAHCTHeQ+mifybYu5HFF2iC1dUm3+g
	kNi7c8ipE48If6mZ0rDDa6DxtaOazb7f+DKCITGcZhPSHr4ehZfV1PFf0+OenyZV8RgWXNvWo1D
	Y2d5F/GlmBsUHocYZVZk6Bg==
X-Received: by 2002:a05:620a:2602:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-93f29d3b758mr1480029985a.4.1792421597809;
        Mon, 19 Oct 2026 07:53:17 -0700 (PDT)
X-Received: by 2002:a05:620a:2602:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-93f29d3b758mr1480025385a.4.1792421597304;
        Mon, 19 Oct 2026 07:53:17 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb2f64sm365653366b.77.2026.10.19.07.53.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:53:16 -0700 (PDT)
Message-ID: <78fcb970-250a-4852-b514-8d3eabe535c0@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:53:14 +0200
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
Subject: Re: [PATCH v4 08/12] arm64: dts: qcom: pm8550: Enable BCL sensor node
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-8-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-8-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX0eERsnR16J8A
 DhWI1c7oZr6t+9RO90LKEjEcaub4MaEyzenzwdGgGrsuZFqkzcCOXqXvGqMh4Pf83QFQlcpSsSP
 cxP5tMxUr2jKCV7Y83MZyc5PI/pKOV4=
X-Authority-Analysis: v=2.4 cv=KuPYSmWN c=1 sm=1 tr=0 ts=6ad62ede cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=X6Y4kDKz15hUnpVYhMEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX4qQd0iuAehUi
 LibjpM67VMS5uqu5V+gz+Xii7UtbOpDtlb/lZwUM95F9sgln6jafK1+toaami6FAk97zOkuJLVB
 4Ujvm5t4Ju/FHDWaowATzAKr3YlaS6g6IufXqmmNg2ktZC2+kXQ1Q+wPnUVETKwSBwgt/UyHlPo
 otTezt6vUvOm9Mf2OeOFRFFtnJI1k8BcDYAQHm9j2qruObNyKOX0isD4jhx9UYdofoCY+1GNLKm
 coEfcK4PVBNm/uN7Vz+pgvvmiBUUkQieG/dvrzKtmUFl02hzPrykUdylxUYAdn36UJNoZQMg91M
 mxkPI27sJ1cil3i1o0Tjxpq+LwSeU4295CYDc5v4i9Chqt9IM57Ar2j4/uLcUNurTCBRq/0nrCp
 gOTcidIxetX2f3EpeC+r+RlN8dhabNHLc8kpRVfGePx1t4nSfYCvulu1e4tq33XjSCP7tJCTUKt
 RVdG450QjnAQWTGcJjA==
X-Proofpoint-ORIG-GUID: GoCIiEtK9GNYZlpvV-lWCWt-uXVLXfhI
X-Proofpoint-GUID: GoCIiEtK9GNYZlpvV-lWCWt-uXVLXfhI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190059

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pm8550
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
