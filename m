Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F465415F27
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 10:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786530834; cv=none; b=fcCcOoWXgVI8kgegldvNKrKC/mmJFttlQ9wlcU/KaZcBCoszszJA6sJGolkpXHWm1UtLChFeTVOFFuJX7PR2Lrln+ob4ODIQfXMNf+Rcw8xwvJilldG8XEKRmYSbS3SXUUYE0LJZgKzEvsfacZ5GzfrDa0u/S1Czpi3KnoGlWcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786530834; c=relaxed/simple;
	bh=zaPE4v5lPUrbrKgE62eStOTezy2zgSNaHmYvRA+hIpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h48Vx3opVUCoI/ybT5Yj87vH53xaIiF1aLbQufljIj1JK7wZl9YsS/J89nH1/ffiGpC1WJsw1EP46Ash15f6bO2KxMgf7Un63e0zsKuQxkVEQyeiyYfnM6FbNLPmDhN0KA3vlgQaUtqm0MFqgRsux2lFx06tBYAVoT+DxsXxZXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UK6hS/n/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hTLEvcSs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UK6hS/n/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hTLEvcSs"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C9fnB23357707
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 10:33:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LakF9ljacz8iBIC1/XYVNOPv
	NZM9z4zYUu3bVZapFdA=; b=UK6hS/n/FLy7r4GslWq9XVKVWPbF1ruc5YTQp4Ld
	WejcnK1KNCP6SQKsY37A2arZEfF3WWTiQyNVetgQbEhk54njvP8731u5m6V3TxyC
	UxPFxzvpFOPsEjHILGT5rkbpZsxvdCOjd3+KXP11+vtl2CDWylmBnHHBBm7qssRE
	VVDcKAgDIEzoRjinO9Bed5qUdo/6d+7Z1di9vwfwZ8l2Rf2CF/ADwWXb+ReBZyG4
	gnGVySx1sEmTVHi97EHmQqgoHZ/kk7nQEBQaLLpcIRPWxM/2snneK/KEtf9DAk4u
	KYsTols8poxxcBlI8G+ngxMXtWDtE9pmJoub17XBpee+Mg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0hj1hcxj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 10:33:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bf321d786so13159451cf.1
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 03:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786530831; x=1787135631; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LakF9ljacz8iBIC1/XYVNOPvNZM9z4zYUu3bVZapFdA=;
        b=hTLEvcSsU9khyGcu4Co+Kcxdkj8dilqgHJre3JPAL/X+J+onbhosqeMpbMTlm0P2I2
         31gSZkzqDDArahWLRFEB4e6HGaxb7zNA46PyuloyQVOV8K8tvX854xMlPf6aSAlknavo
         qVE66UI+9AmKKbB4C1bOpKE1stHZ7+UXRUwNmHDpu7H+w8gOStf3ggy3ckK0l1fI4QiS
         MUoM5V8Apk+1pON5UDtl73JVHgOXywEp47XWbVtrKgDrTpNhwF6BRvi4Mu2VF/ykFKkN
         Q6XpNupT04Q+RWmP28720fEueLXctKfNqijQdVyPAVM3LU/EqbUO4GWAmX6pCdMYZRkr
         QpHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786530831; x=1787135631;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LakF9ljacz8iBIC1/XYVNOPvNZM9z4zYUu3bVZapFdA=;
        b=aXn1ynOkgXixW3prlBhpMZreE/S2HXSHs62Ed8aRKJ3/UcBRnarT7hqM87sKcnU8T4
         uSlGsnOMCggkbhRpscZ+dKjKR5SGggpLgiUq9NIt2JkH5mPipD68xL679joaX9r3cwxq
         ++kUrdQ9fsdB0IsNLxExY3UrkHSRk/5u0ZSaJm7wmhzaO4NrQDcfZeGSzItjHZsbfi9j
         4CzxnPNY6SoEZfq/9+YVxh1DKY5Z2rje556i8Tw4VsI+SdB4eK3BQ2MXSNLegGhBqgGg
         XFga/nAH4Z4OpOxQapxIptBKmBEBW0YHbHj/HwYJo12wCSD2E6zSTaMjmDKdVcGERWV8
         51SQ==
X-Forwarded-Encrypted: i=1; AHgh+Roi7+dcS/KCPof7yodlZJpL/QFr9VhhdVF3MY9azZIZz6k+blyqhtxgcMLFbkTmLRRZPjYAtHa0k1SB@vger.kernel.org
X-Gm-Message-State: AOJu0YxHeD5YT0Qg+DCHoBv57md61WDs7h/AXVcwqUUQtE6WhhNqPLU5
	tTwyk1DOO1NPZ1w2PMfrzXUeMYesK2ZCzOM3XCVTL7BTvcND01qUs5gUlDPYSD6XkIveM/tqq80
	gTSGBcVjk702aXuOtfm4Z237AxiFyW5gb4O/YE8HbSxOoz+QdgmBR8bH/MAOHPFyT
X-Gm-Gg: AR+sD11rQ3T1iE19kIsj2PkB3A9I2QrZKOLbNe6/3r6yMlskt8L1VGeFuP12KXPdFb/
	xCeK1Q7DyUMiJjD3WbLTqTl3Jh73jArd1DzOzI0DNmAVsACg6O57FtdGjQPyUSX3FfMiQEc0tww
	ueo1chjGAz9ZEQBOxUGNuOg3/5qRQ5L7hPN4prbcrQRC93ouoOzWPcEPhd36YlhJwTNt4ZG3m4s
	fynIwaZob8rQAxGKOmpNxq+qPe4/uG4FObYFB5uPA+oil8vF2Ld+PPDrxssv0bTgGITxBihWHb2
	HORwGpjpwPaA7sFeKdv3OWsxkuGBVRcLWGtOhXmJSNM+OtR9MvjmvH5pf/0BFX26ILgQllZOCCp
	1S2rn+/u5/BWzdbo=
X-Received: by 2002:a05:622a:408d:b0:52b:581e:1274 with SMTP id d75a77b69052e-52d646fe6d6mr33905541cf.19.1786530831145;
        Wed, 12 Aug 2026 03:33:51 -0700 (PDT)
X-Received: by 2002:a05:622a:408d:b0:52b:581e:1274 with SMTP id d75a77b69052e-52d646fe6d6mr33905091cf.19.1786530830613;
        Wed, 12 Aug 2026 03:33:50 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.149])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150d4e3f5sm6178951f8f.22.2026.08.12.03.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:33:49 -0700 (PDT)
Date: Wed, 12 Aug 2026 13:33:48 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Radu Rendec <radu@rendec.net>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/3] irqchip/qcom-pdc: Add purwa compatible for PDC
 secondary mode
Message-ID: <6kjlkbghaqodad5j4erolqexkipby3eukexmpqilo7inyqw3hd@hqgtwxz2mtwh>
References: <20260806-purwa-pdc-v4-0-62467f4b4ddc@oss.qualcomm.com>
 <20260806-purwa-pdc-v4-2-62467f4b4ddc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806-purwa-pdc-v4-2-62467f4b4ddc@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: fx-cvyWTWvD9eCN4PezlT8RDV0gFfGpU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA4NCBTYWx0ZWRfX5VFHjcWy8mTh
 deKAIuqfGgg1K2kWeu9xX/oegb2Ml4q2F1BOINVaetuYsFewU1qK2blWcpSdabPqCjS+hDcu2i3
 dTsWnHNjGVi8lw70Zpa6rjsKV1lGrdcrEsP5Rz1WZXJ3nqE4OLgAFi+A/gTuOKADLKewbi1QX5Q
 GKvHaYNg0As3kTVkLMOWQ06bQ8srrkpBTBaWt8lOPFKQcm2cY11bOFHQK1iSKBYE2zFxx0ziHMA
 MYEAo2PApMB65rnziUMz8zuXGdLrH6tfMR8fyp4YUlxILyLw25L6qCfmFoLjGIxjAmTBov29QDT
 DCsYo5to6K1EwZBi11RXNyMqthd5h511OvJxBRkhFagGr2Bd74UpNLx4MxZVoIZYKMPPfPzpcO5
 F7htkDTh0l9UJyZvQzW9BoxWnXOIKSqA4bPmJ0CRy+vNio2RIoOaBEVugl03C2NldMDWhdcXQOv
 VsUWGegZiizPfnMUx1g==
X-Authority-Analysis: v=2.4 cv=K6ES2SWI c=1 sm=1 tr=0 ts=6a7c4c0f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=o07dIpAjZdj6OISZKn0kaw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=b8JVUCK1TJT_bdoyVbAA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: fx-cvyWTWvD9eCN4PezlT8RDV0gFfGpU
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA4NCBTYWx0ZWRfXwODlX5yDlv6c
 tHf4DnqnWdyB6tvX4P7++HN/jCbW59lG0rFWtAvfny3MmJMB7lnK3GjkKZEOb7e3/r/yqmX3/dA
 9VAT/lSjS0TKhi6yz2N3LPbqRVn70I4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120084

On 26-08-06 14:26:28, Maulik Shah wrote:
> X1P42100 (Purwa) and X1E80100 (Hamoa) shares the same PDC and windows
> firmware sets the PDC to secondary mode for X1P42100 too. Add support
> to reset the PDC to pass through mode using qcom_scm_io_writel() similar
> to X1E80100.
> 
> Make sure x1e_quirk to workaround a hardware bug is set only for X1E80100
> as X1P42100 have this fixed in silicon.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
