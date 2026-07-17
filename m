Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A23B3AEF57
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 10:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784283802; cv=none; b=FvQYerI6Rae9Q+RD94+IKE2U38+3G5khfdRDbE4yELpHTgmWysT1Qnl3dkICRt0aQA7fIavgQIaCxUPRGH0tGRqIRgZ6QMMCgVTfdp225DAqvRDYa7AQNqn3s18oPu/etd/grVKUSeXUP1mFWFq/WZl++Ayr5a5QVH6OQI3Hcco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784283802; c=relaxed/simple;
	bh=wjtwCOjjTvgQ+HrIg2iU3Xvguk/orqpRv48VaOoSMPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZiYyBbgxk9VBDtkdUi5bPlbbxasvoVnh7gjiu8vJCdnAMFePWxD0uJO7nR2bl4170Jpe4EaW01LdNT46cY5zNWekNJu9kOKX8biXoVnzPWQWeurkCUf475tT2xnl3lUNe22MwVCTQkPk0J0RehX8mbgh2WqzSUPea1INZnRnPGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pVfDZ4eT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HtvtN0mK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pVfDZ4eT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HtvtN0mK"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cQpv951330
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 10:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wdu3irNj+KTWgR7xMpoE4z/EjpwdFaLI83sqipED4Cw=; b=pVfDZ4eTmry4ifXN
	VrHS9uy7rZzw8mLnI6y52YAEcj+4VijRB4AqALjD2RNnILal4i04nrEU8sVJmc28
	8EEikTkvYNqTsB4MA0mZ3TNKm5Rvi1tp9D4sBtH5vEmKGr1UipjJLF2i1I9WhcX8
	Y8Z1wCesgPK0c64WGegfBS10oeL9WpnDgtR5Vw0cAMc9ZUVTtqd4XCAyOz5bjNrR
	+pu/YC2zTd3jJvtwo2KJUvzkP5xy+Wv72A49Xm9PNTv3US5EfGkXT5Ow4MxuT4nU
	8FkGczeIlFrWt2NNUNvmMcpHQlVIaXJtwNPELOGG4dJU6d+Z4P09AGJvICScINIe
	JaBRfQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff2f2uqsw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 10:23:20 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca7c1e22995so11132885a12.3
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 03:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784283799; x=1784888599; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wdu3irNj+KTWgR7xMpoE4z/EjpwdFaLI83sqipED4Cw=;
        b=HtvtN0mKgVTArZcInAXpr5Yg5fuehmTJ4TNQxcMZWOooWxvnQr52h1vXHYtfnqoWLf
         avuT7MmnfdHRoUC29hUZ9j8m5gbBy/AXFh78mQ7cqW9fV0MVtjPz33C4aW6ceJJu02Un
         4dmS5EBBgsHz9oYLswHUiQ+sdVPuTmGwlEiX4mTi8xcHdXuVb/6cb/0MMkjHuCIBiF/6
         ix2wjyDGUKu1wGdfaMHtbXDiM92GYt+gY0uYZiFbIsapbRzVOb38ETqqlZhSSpKn4/i6
         HUTNuwjDv27lz0RroYTtFn0cBzBKUHUM8b/ryF/75g8PwoK+VtL3+bLIToMqTPHkMdei
         mwQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784283799; x=1784888599;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wdu3irNj+KTWgR7xMpoE4z/EjpwdFaLI83sqipED4Cw=;
        b=Bdaj7QbNzFtNSvDUEJSNFBe+NayV7j0L0lQFng2BNjlhkWUIuwMpOyq5GTbz54aums
         x6/8C1QT9pVkIHI0jqqOGiNN3rkT5RIwTxkDnRbd3lNkiq8Ss4xRkFBd+sZ/5sS65r94
         DEPkVyDpJYaso7RT1fav66VRpETK8o/y2YLSOIMhk1hl/F17C3n+q5O+c8vmFi9T8hNv
         If/KgDthNNYpLD7yarnrexP5QIDBYdyYixqsqcrn49B9bJPITyXlaxXT+gle/1xJw7T3
         OUzUru5OPVD/mmWIx75a/wPNwhilYMo6a5Vx8NOs0U5V8nLfDxOUz9g7dgV4fYRaF9Gd
         09sQ==
X-Forwarded-Encrypted: i=1; AHgh+RoyKtIsKDih76nT5YmpJn5mg8B/RPB+DbAWW+ddrQNIrobHaGmKEfbl8LwQNRjr1y5gzcaFzWfrn+T6@vger.kernel.org
X-Gm-Message-State: AOJu0YwTS6HaH5Z1sCufJF14ecZ2fBMGSSPEKovTBsolHNGR4y+aOTVl
	WDNkSHyCYJF8iq/ASGeAwTMBK7tb29aRw6lSH6MALzff4qNCJoefeV1wBjWmbIyM7AJgZ3XQVvv
	bUhG/UrAHBeCm9FpcLDOps/UOSggKGmcYxbeKwmVnZdpLhz8Ri/qreWDz856vDvgm
X-Gm-Gg: AfdE7clZZ6jdHe+gKiQZiuVwV2+TTiHZ3nQ0hDTDiX9ThxxvwQmPiBTpPBJZVjXVJXf
	EW64iA6uQhl9wLJBo+fvIFyFYHsGx7QPNjpGjHIOT0UzbT/YryHuVThTI1UBwcQXgf9tKks4Pmo
	OCCCQePq+35hpTq5RQDgr4vGbiRo7RCKwP3pEi3Q9c6/yY6vyiKboFfXaEpjZhyGTjS2AB15FN3
	T5SrdgvPxSAXhgiLPSHsYxzzhvn3Es5owTrPPd+UnScEL+a18xDaVzGPBfl19K8xDhRBaOfpY0R
	t88GVaPrf4drMvpZYASc5h7/kEzVSZHeh4Dd7pcaZ2wlr9+k/JTWnIcMGLcx8KUzlyqykamwh1x
	7SxtW5aVYXpNc5pic09oy5qyyUKlRRAc9F1eo7dc2Q8UFvD4=
X-Received: by 2002:a17:902:fdae:b0:2ca:ecf6:910e with SMTP id d9443c01a7336-2cf3466a93fmr21891085ad.0.1784283799072;
        Fri, 17 Jul 2026 03:23:19 -0700 (PDT)
X-Received: by 2002:a17:902:fdae:b0:2ca:ecf6:910e with SMTP id d9443c01a7336-2cf3466a93fmr21890895ad.0.1784283798587;
        Fri, 17 Jul 2026 03:23:18 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf346db2d9sm8079975ad.43.2026.07.17.03.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 03:23:18 -0700 (PDT)
Date: Fri, 17 Jul 2026 03:23:16 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v9 1/7] dt-bindings: clock: qcom: Move glymur TCSR to own
 binding
Message-ID: <aloClFTsTpiszExR@hu-qianyu-lv.qualcomm.com>
References: <20260713-tcsr_qref_0714-v9-0-373670ab15f9@oss.qualcomm.com>
 <20260713-tcsr_qref_0714-v9-1-373670ab15f9@oss.qualcomm.com>
 <20260714050953.BACC51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260714050953.BACC51F000E9@smtp.kernel.org>
X-Proofpoint-ORIG-GUID: WB0WJFdU4E1MPL8OHb7Vp1Wr12mpBFEY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDEwNCBTYWx0ZWRfXw7y66ud2aeNI
 vzSiY8h36peEsQt4Z9rf8LMj7mXF/magmJGwd07P6qnbmTFWil+eEMCu7Caq6kavofNVvI/eGzC
 9PbA1C/RAnP/GyTTFp3AIlL1btsp+NI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDEwNCBTYWx0ZWRfX0C+eS9IeKrSv
 tKhXMMSjKV9zu7a3ZnPbERCYMzoGvLTKtqmFV+IX1DeF6nxnNF5/fOJ8udKj7DIFMuf9FNqd897
 N9T3wXaOFObG0052/GrHZ2PnMLETK25faeFpYXNUNvMz90e1BS1fPxDmEbqrUTh7XZqlzKEJiMR
 oIhpCDAdFXEZ4GhTc9u6AIM+FeHb3Gee8Rv1IB82sxwfkj3tes+Kzr6dDNVJrBp/z7R2VX33FOM
 3DV3JL1i+7AzXSrr3DgXR6yxcIzaydrWDtuyyb/g1T2G/QBqC9cGGHHD80P2Em/yG2kUAzbgSlN
 QQIm4BZMAQFQtov4OvUpMojU+GUw0CkqLZEz7rqvaaoDAWKsP0uTt1UE8oh9MJpXJIGBF7Jj38c
 i/tmOoHUNF4dZJZhI1krWSeGDAd3qnka9NSb2PM8OVMN9J0/8psgnmKJPWPkMnz3ddoQqgVP2jb
 mo0v6fvYm1uOOIkmfEw==
X-Authority-Analysis: v=2.4 cv=NcTWEWD4 c=1 sm=1 tr=0 ts=6a5a0298 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=s8IvIF-zRrWUOPtcMVsA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: WB0WJFdU4E1MPL8OHb7Vp1Wr12mpBFEY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170104

On Tue, Jul 14, 2026 at 05:09:53AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The newly added qcom,glymur-tcsr.yaml binding marks 17 `vdda-qref*` supply properties as unconditionally required, but existing device trees do not provide them, causing a `dtbs_check` validation regression.
> --
> 
> --- Patch [1]: [PATCH v9 1/7] dt-bindings: clock: qcom: Move glymur TCSR to own binding ---
> commit 6bffb0197809346112dba264dc91035d8e1ed982
> Author: Qiang Yu <qiang.yu@oss.qualcomm.com>
> 
> dt-bindings: clock: qcom: Move glymur TCSR to own binding
> 
> This commit extracts the Glymur TCSR block into its own dedicated YAML binding
> file and documents the supply properties required by the QREF block. It uses
> an allOf conditional block to enforce these supplies for the qcom,glymur-tcsr
> compatible string.
> 
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
> > new file mode 100644
> > index 0000000000000..ec89feff89e4e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
> [ ... ]
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: qcom,glymur-tcsr
> > +    then:
> > +      required:
> > +        - vdda-qrefrpt0-0p9-supply
> > +        - vdda-qrefrpt1-0p9-supply
> 
> [Severity: Medium]
> Does this cause a dtbs_check validation regression for existing platforms?
> 
> By marking these 17 vdda-qref* supply properties as unconditionally required
> in the allOf block, validation will fail for existing device trees (such as
> arch/arm64/boot/dts/qcom/glymur.dtsi) that use the qcom,glymur-tcsr
> compatible string but do not yet provide these supplies.
> 
> Would it be better to introduce these properties as optional first, or ensure
> the corresponding device tree updates are included in the same patch series
> to prevent breaking schema validation?
>
This yaml only is used by glymur and mahua so these properties only affect
them. I have provided all qref/refgen LDOs they require and did the dtb
check, no warnings or errors.

- Qiang Yu
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260713-tcsr_qref_0714-v9-0-373670ab15f9@oss.qualcomm.com?part=1
