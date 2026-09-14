Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A363B71A4
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371585; cv=none; b=kYo7rlfVmf82Xkmfm+Z90EjokVwizOIobOy89M3RxvmRdwNOxXvwjADasMfkEb0ESQFdFqxcQUFY6N44798PMyW3zRUiHnC+73YWn9KB18Avt8qkrmbzbMFMT4mmJi03QTVK/GFb+Dmo6KpGWQavw51P1MejA4WKffiFr80ctbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371585; c=relaxed/simple;
	bh=d9Vt4dMcdh3Bu0UXJeuPxUvHEGg0x7JCETPcRfr/3cE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SWnlf2mG6K/M0NFvG9VyVO+YIrRBeLCRw11ezghw4SA0jpv+ng/xVZSMIXkzwbeaD7w9gyyTVMfiIgg7R9nnfTqZmihC78RaxJsQsEzqpLAmHkWec6SZho+LDIBd/xNEtr6IFWZkuFkWflSlnI/nTQRxbUJYJ9l95IrGwzlN2t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l3AYNJjB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xgjuzfn8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l3AYNJjB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xgjuzfn8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5is6H3196659
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:39:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=o4YUYbLCdwb5dvgKREja2hbc
	wMVPztKBPHs0R7HUkU0=; b=l3AYNJjBjxe9EAwvgDb9YusYyrPLu6drm8Llr5x0
	Sh3OuyPJU3GWc+mARnItdnxAnOfADBZ6IEySO/kc95ZI4aWYFX6t6AgS+CZIa2DG
	Z3eafv9qHhpc4Iu5/nLysjIHyS2bnqUSrcZ3JrWt3JlqvpIq032Tuqz2aMDiYDOx
	5A3ZdN/Yl+WMsGFdiBRGImTEaULflNMVl/RHz1QjuWaFcHPr32xFakdyUhIU7yQF
	Ue3R7NQ0GxVu/NnmX/Ykil1B9b+4ODBb1avO1OhNbO7j9sSlvuzY8tUVwyAl04zo
	1QkXDRTVotVvcj3X0o/CxO3B3LvfD6IFs4xAC/mYqZiEoQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cdhms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:39:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93909014c85so570327685a.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371582; x=1789976382; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o4YUYbLCdwb5dvgKREja2hbcwMVPztKBPHs0R7HUkU0=;
        b=Xgjuzfn8TDvKQ8arItUNipo+y0vD0hGVQMAqNK1zxKP5SqQDkLpYMwocds8p4iQgar
         uZecoZyYyJQG7hmzG/JmI3ckW8Up0e6edUDYHZD8KR2MOGlWp96bQAo6kTG4rIOmO8Ry
         GbP+Rbj2VpjAh0kVRIQpn4vFCgRD+wGWfBj0QSc0r5C1hU4RB0nhp609bX7T22xplgya
         2BZeB+ZJGpmatboOwvkN/BlECNCatJqCO+Jh+sufN0mKLTZ76PWtfRD4NXxy0oY6VLI9
         tgV1CI/a1RNPwjNrfKSFoXmeLT8RC1rk7yj8rq6irRec+8v6s0BI4KcArcICEm9Wims6
         iocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371582; x=1789976382;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o4YUYbLCdwb5dvgKREja2hbcwMVPztKBPHs0R7HUkU0=;
        b=YK4g6QINsyrxTtzoCZEnLZ8givDF/m86iTuJMN1IHuEUVk7GDklwHGac7DYgINDcgK
         WxoAORJhAm1Ukeylgb96eTEk1dDuEwJFc4VUr4nqXbF8Yot/lTNKIHAmKzKqcfAIGEX/
         CNNWTRXLbK5pOsNFt7b1oiasrSEfV5h1t58pPmEjhGhcxaQA+h1x6KGbsp/JVpV4gSIP
         nWZUXGb/6HXounY/YJ1c5pKnOxbnGtWifXkSJ56YjYquUQmXPajaZW+HWqCq/V1i8OSz
         LPD1ziCtFxCKri0HtnKyekwlQMK6WqcrSmqNP6znFhd1Z4CRvkVCR3jOyatO9DfmLkPL
         G9jA==
X-Forwarded-Encrypted: i=1; AKwUvBymj+fIrbgCKu9lEx+NQbiMWKorMISjQdjjfPxVvU3+VVJBf9xTJODE0uSwDnqwui8PUCPd9//JEIN+@vger.kernel.org
X-Gm-Message-State: AFuF++m2auAFNT6Ab84+LBN9uBWNjiuhGOccSrvbHF4R82zM13Z68U53
	U1Y2Pu7I8OXk0HQn/ziX3jsMlJHEu1mTp4XzyDHLVU79bT2rGaPXZKBFvamCv8Rg/ZS5DY8TY6x
	IuCtuXUIe85QLYIvLnXNqkdqnUQS4rr7Bfo/fCNU3Q71BUMwt8QkQcn4tQYc0+WNo
X-Gm-Gg: AYBFou3adelDZpyosazk81g1jA53IQW8/8X8cuOaRZvuVnYAC38plmogqQCxRrPt4ML
	cC4b07C+xLgn3Mh2BFQ6lKBT5ZcmsKuDmu0tXJRplVAxxFzdu8ipI5rS96TEMk2+JMbiIrSiS3K
	Y0M1lGVGkfcJ4VLwqDBa/aoKNNEHRa/q04IxCrUEoieVvTCgtKN8dSqr3XuQpYrwyhAI2WFckux
	6cTjI+gzlttF8bWabFZlbcksHHe7rp0vYCfIQFEGxAFPdTZ0llbvde4TjmDOhyr3AQUzmZgSTh3
	Xt9gUVqGNacidbsqpEdzsDd2dpxAu7gmUOHKuDVU19hZhKZzQFRG3zViKAA1YI/IXkNWDn2vZaV
	c4kYEDsJQ9rNeuQ==
X-Received: by 2002:a05:620a:1b93:b0:939:cb1a:2c5a with SMTP id af79cd13be357-93a299f539emr185963585a.31.1789371581997;
        Mon, 14 Sep 2026 00:39:41 -0700 (PDT)
X-Received: by 2002:a05:620a:1b93:b0:939:cb1a:2c5a with SMTP id af79cd13be357-93a299f539emr185960385a.31.1789371581363;
        Mon, 14 Sep 2026 00:39:41 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7548d99bsm130251565e9.1.2026.09.14.00.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:39:40 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:39:38 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 15/31] arm64: dts: qcom: sm8350: Add domain idle state
 names
Message-ID: <impp454jesz6unwipj25pg3i4nmtfftrm6f5ikavxfdfz2gyue@f4yqvtcy7333>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-15-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-15-660c31187819@oss.qualcomm.com>
X-Proofpoint-GUID: 5RccrIFOvAQmMhfDMhzUgA--JRZ-wCCo
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa7a4be cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfXxS79ryOAbAcr
 +CmlvfA+xtkHYPj5KiqFJbwr9T6iN78BesLWXq90Pr5Ml6MpT0/g4R91Bf0N9+vJgXSoP4A6lUi
 h/+/3MqgZOZYIrNUvsaO8X+De/ZEGKY=
X-Proofpoint-ORIG-GUID: 5RccrIFOvAQmMhfDMhzUgA--JRZ-wCCo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX4RtVNEjWIz1f
 IXUlBEXxpauWeVsPjDi/xTcNs4YBNAsj0rN5q/C9G099IEF9lRJC6m6MOlypQCIJSMiqknmAVR7
 eneOvHoeb8/F6qr2HImQbJDi2jj++Tlr/9G3hY9wQjsw+e6u0Zhfa2oJdXY4OFlVIk+GNzW77qs
 /edvqm7C4+hApfuzCKLNAbRkAadQ57g3Fy8fnSNdWgaWwCIks+GGWHP1WzbtliDI+MQ1cNjXZUw
 /6YwwKZ8jDiDp37n5fxn3Udj1tL9XUuDekwfraKy8YTvN+lSEdPx6390nmUzk+umTcv8QsrFoYB
 73AB4WAlincRijZltrcieeaRFd4BbhBaLeMu2G0rzI0QjDZdEH3/2CXmSxm1fIqpc7bl1eoTJXS
 BUCw5jQypu6CodD68WpXT/bGC7RqIUAMqU5hQaLsK9QyAgEoSl2YaXUXA/TMiTPLttqOlWIIY4X
 lN0xo/UML5lr6dgx7/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140108

On 26-09-14 12:29:47, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
