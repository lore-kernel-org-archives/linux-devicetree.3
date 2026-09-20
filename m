Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14103D891B
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 07:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789888680; cv=none; b=EsgWoIcq5KR8jD8+PxdPgHIHoVDRC5kN+FkQfp4aQu+lCCXOL6AhgfTuPIPn5qnpZ4dsADH1zJl2yfu2eTOSLBgBdpa+8GodqpvFSbYspfFBYUF8wZ7KJ+Lxng34cwawM/diz+kQ6wzD1E0R1we6GCgPaFHjZbbIoYBEAytdUxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789888680; c=relaxed/simple;
	bh=s7eAoytgHL78rL5A8ihXjUoEHb//2G369+9k9wxCR7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BVkVPOKE0VWHihkwbjLOd/RVxgp+eFsfDZlgW7YgGb6jfoF5NKy+tkb8KWmG4a5VArNGR9vkDUk8qob2XguixKc4AGW8JFAZLdk93mJnjlRgbSKsoCDlSLC2/E+rdS6ojgvKrTmckNKI9n+/NrHZafPpFmhwNICGa179D8AAdoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WU9P4tMb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SGixPr78; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WU9P4tMb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SGixPr78"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K55LRK1375946
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 07:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tE12glMtnWbg3wZF5tpLsoGg
	lLX7WuJZscPmbfDKmso=; b=WU9P4tMbZtsjPwBqnTtYg/gEyRwOWM4ovuhTKM5C
	hYE7nPTDT2YSc3TN24gfOoP/6fPhHOIQwcnLIPelMRtW33CBpatctqVBLgdNnSEG
	1p2kS9QDBB6ZvGdD4ihmPr2KUhBeoeHW+rYMo+cV6miUH9E1REKMtKQyTzkKz37q
	7wXJWsnyzcBRDxE9OirUVfnnLYZ6GF7i0P0g2QqRnv4VCVMFwtOgPwRnEVETBe07
	lbdsYFQqLv1IXnLJYEw2DZ6HRt4YtsdtI9d1mjy86oX07aXVjSExegWjVi7oQdH5
	dAfaf4qFGre8SiLceL2B1lq490cxARolFO7w+2mpHYuSqg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshqftjh1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 07:17:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381250979d5so2576595a91.0
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 00:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789888676; x=1790493476; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tE12glMtnWbg3wZF5tpLsoGglLX7WuJZscPmbfDKmso=;
        b=SGixPr78MHpV4Sc6KmGS4eQNicvRumiO+rVPY21dFPHQYvlOyse934KZI7kCdDtGrq
         tpR57IIUUr7/Dyw+dHtU0tva71fEmx1QdCjNCbdHotawwIbvglea+X0qqK9AbOr+yf7B
         tmpX1JMhTyLltiZG6Wl9TjJ5nXeTOdeG5YqqAWZMTDT5xDTevb3KeQ/2sCiu49LfSdZ5
         WVDrOl1Loqp3rC7b1vEN/XC6DiMoQ7Ec1M+OmjrzCzdPx1D5YbGBoVXG9mn+Pf+rafjQ
         cn+KKSeCxCMz9JKtv0L974tsTMpCFnuW3WEDDP/eM2nfvbqcyLOdRFx0Ua5DHrZJ9jub
         FDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789888676; x=1790493476;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tE12glMtnWbg3wZF5tpLsoGglLX7WuJZscPmbfDKmso=;
        b=rlVHlXgb6kStSJ4YvtydOfrXuNFzbCCNahFJg7EnxqSm7A2xN7SJn9F8O5245PoCit
         839Bu5Z5GLTf4hpApL9a9ETcsvMVIuSGwauxcVFBMbSH5aygIS0nqL+z6BS1YtM0RlTd
         nouMtomVXbyLmLfjCrl+3Iac+khrrpxvWN2nENyDVT4Z+gy8CoYVI1BVIeAGTMRNHVgH
         aU/Gtcm5gPwRvSpZYljQDMrN/BYt/FBAvNIEg2Wq3aL/0XO/D19tw8vmzeu1TWFcRAEI
         Pu3tSOzOG/8rTdtKD6N2BOUz4yyR+85JQJ8HhuwloYorcVB6QvZUgNy+Hppa4UdFxlcF
         iPPQ==
X-Forwarded-Encrypted: i=1; AKwUvByg67DwnHnlud9HPq2jgx7+VsIvNC0FmxBBwrvusL0O/0hmJFc18/UovxSAXNuZ1RQ+AN+dkvlWRpKP@vger.kernel.org
X-Gm-Message-State: AFuF++ngWUMEB/7m+GmipF5tGV3UHcQOfE1evxJu1cUOpmNVK/rWsW0W
	JXmqaKPXIx6XWKSZiQVHqqqfUQqyEhfXS5TO7oAKLDpQDss6czL5YHMmSE786/ozQXeR1ulWnwh
	RZ3v4+9cQHzUjYPV0EGsEiIkhYrTyq2cX0jvvzmyrpHUTc1CGQ/XA7Vd4huo0FaYW
X-Gm-Gg: AYBFou2/nz6Cto7JmY4+3R/G5cTnYpipn5VgXW4lGXebnVHznY+W9AuaOhgvD29huZA
	mysoaUuDP2U6GEmUgZ6Epp6oOGVm+ZKKlx8Pq0Jssia3bzP7DlHFn3ac2Bigd/Uq5mB30bGvgh8
	4ldgQCkXOamX78gHZZ4yOngpRWR3rMYGSaH4/n6nBMcO9JvC3OGq9ApZw0znkTzmNapwTHa5BDT
	mskFNN9iktbFAruLxXpXK0C+TgcDmTX5O0VFbLVJvwZWod6Dl26aC3Nqgxb+tiGixnFXqF+7amL
	R7Bow6YLXPcHuGh51G2bHrbi8UhjbLWDGmgR6DU0/ZFZNG4ddLo6L+k2WGQZcvbokwtLMtKgb9m
	D/o4gHSG9NT2NNa+6Ja0GB//t2O+fJwKT3FoPqDRWrA==
X-Received: by 2002:a17:90b:1e51:b0:39e:35a0:9c0f with SMTP id 98e67ed59e1d1-39e54d18291mr11928726a91.14.1789888675762;
        Sun, 20 Sep 2026 00:17:55 -0700 (PDT)
X-Received: by 2002:a17:90b:1e51:b0:39e:35a0:9c0f with SMTP id 98e67ed59e1d1-39e54d18291mr11928706a91.14.1789888675373;
        Sun, 20 Sep 2026 00:17:55 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144da432647sm14226451c88.5.2026.09.20.00.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:17:55 -0700 (PDT)
Date: Sun, 20 Sep 2026 15:17:49 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] media: qcom: camss: vfe: Add support for VFE 900
Message-ID: <aq-Ina0nVQTBTL0-@QCOM-aGQu4IUr3Y>
References: <20260915-nord-v1-0-20db41a7f1ff@oss.qualcomm.com>
 <20260915-nord-v1-4-20db41a7f1ff@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-nord-v1-4-20db41a7f1ff@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEwMyBTYWx0ZWRfX3LURXdmoEKp5
 NNH0aGI4Fm1pB1TdFqESx5NjxRJSapyReVPe39YKaqtnnPZgQd3dvaxd/36tCwh34puTjyfHmvm
 6s1dDV5mxavEs0YhIrQxFP7s0kSPqeXZ5mWzAkcxelQNz3Ob/LN07qd7H7d9U3+3ra6ernleICV
 SJXiPnoNV9Fzm3nuYfuZ13mMWLjydzOtkve20vH2EHjYxUC2tdmP2xm6msT3GKJkO4qhjOaLHP/
 x2hvGkAGZc3hgGPzRP/WA2DAx1GULQsrO8NBOPvMTW29QWGXkQfsSdGGV2WeiyyZ5vIzdjTY6cC
 y5JjBDkvJWwC2N6XKCMazMvX6kP63VfM3J/BsNSVVn8wa2dI18hWh2wvaS4gQ+KK9mBR5Vn71yA
 +B8OYUU+KRsq1ShVfqR6F7BE+W1MQ2eO1Mnnwfcuz/tqbNY7nox5Qpw2wllHNlgAmpp6ygFVAR+
 TBgDzYnlwpMql5VlX1w==
X-Proofpoint-GUID: yT8IjpsgZkboa1nhGetcecuN5xF0RtDS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEwMyBTYWx0ZWRfX8bXAlRlS7avh
 +Bbv9rmIYhdPfE39dWx1O/WC9uOjydsr+qGuvyouA7K1EbcrKNGzW5KV/dtywYPDb+U2Sj9PxcB
 eW71Yi33MDT7seuEEvBLTn4njH+X4+Q=
X-Proofpoint-ORIG-GUID: yT8IjpsgZkboa1nhGetcecuN5xF0RtDS
X-Authority-Analysis: v=2.4 cv=XegcX455 c=1 sm=1 tr=0 ts=6aaf88a4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Uj4jyQ9UG6jGA3GiD8kA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200103

On Tue, Sep 15, 2026 at 05:34:14PM +0800, Wenmeng Liu wrote:
> The VFE on the Nord platform reuses the gen4 VFE driver but places its
> bus registers at a different base and does not implement the write
> master CGC override register. Add a VFE 900 variant to the gen4 driver
> to handle the different bus register base, the separate location of the
> test bus control register, and to skip the missing CGC override
> register.

Are you saying VFE 900 has no CGC override register? Hardware document
seems suggest there is TITAN_A_RT_0_IFE_0_CLC_BUS_WR_INPUT_IF_CGC_OVERRIDE
at bus-module + 0x08.

Shawn

> 
> In addition, the v900 ADDR_IMAGE register takes a full byte address
> rather than the 256-byte-unit encoding used by the gen4 baseline, and
> the full IFE write master client map places the RDI clients at index 28
> (the lite instances keep RDI0 at client 0).
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

