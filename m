Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D3E36F902
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 13:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784641314; cv=none; b=RbqhnbEkX+l+TYbx18NHhfQORSe57/3p0wQGXKoskT9yX79QV9QEjWy+emTXsChaAcHYlPUAPrSwafZgsUcC40z3SUW2ZcxrptG7UeUuZzAlsJ/K7ZVXZncQqkzfxGFO7e/JH84DEZaYs3DHWa0Z4nMhTZ9PRtuBlHLRVWi3aoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784641314; c=relaxed/simple;
	bh=ds41uiC7oRBQ5NVCa4hz2bePlchziR7UFKhgrYUIkw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uXa1P+pVAWDK08sUNGL1f+IFT/YZ7rkywN54n4Bt3knUZoozkxe1hr7GAhGq/mfweFQWa/EbYTxcPm2F+ibcpiWiJQXy4HQTC2xa9roZOmZD4rlxj1M9FiqCzGwnlJYIBXsJs87eFosMQ4iA7CGl/1prvknlWQB6nY8Viwih1Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FPBpUMMn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YqgJLFij; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FPBpUMMn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YqgJLFij"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDMSUF1864676
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 13:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Jn+bU5PH+vGIOjjifUsUR+qv
	nZnsXNeOzfoYsc6YQUU=; b=FPBpUMMnEp8FmAWETiiMDKk+OxLIHO7oV30zY/V5
	imM+Wg4L7XZgKh5ojwWUJ+l+MS17Iw2La+IPiKKlBOibOuUBZ+tTxByWw0ZFtjPT
	Qrx4yh5hIM/JiG154Y9NRJYtbWzVgqo4BSlydjjSUjOr+dk/qwY0awUewMxtyya7
	a7HTgPdikjfIJ+Mwye/PzkwRQKC0z/U15anMpjjvbFkCMr8eSUGIsjkSrfe8NEyo
	waUb2HmjhUR+Hua8Gcyu+l+i3YbBFSXZW57X2omfCYMEIVg0ll9LQWN4OE+f7RRx
	X+ANxB2QjAOnDN9UUn2rsUUHBlM9uG03e+YOcBsIt5IWoQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1dujmjj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 13:41:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5174a23afcbso99305741cf.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 06:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784641311; x=1785246111; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jn+bU5PH+vGIOjjifUsUR+qvnZnsXNeOzfoYsc6YQUU=;
        b=YqgJLFijU6ATHAFXnXuI6gIsvHFpHg+5RIUhT178WPmumN7FYq9DfI5nCcZx73nQcM
         cZzX11gga39EOQVS4H2yTWFNXhFJ62sBqZfQ8tJc3g/atLbLQ2sEBJGQB/4gKUPFftl3
         eorzUH5W2fkOohz9DBgbr2iGHZA/HqS54BEF1s0RoqgSsl3sAXra3WwIR6PWsY6QBJVg
         gUHyrELpT3HkJ2sPx0YzzQA+m0SKqPJlMd0gAdtqShaTp2AENqwp9TwCMfMbDtegowjt
         WNdclhUNlhioXmPJVVtV1J1lG0xo0xx6xtpUZe26kVyGBLGYjf9L9daGiQ5623iWfFto
         DqTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784641311; x=1785246111;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jn+bU5PH+vGIOjjifUsUR+qvnZnsXNeOzfoYsc6YQUU=;
        b=tKusrKu1R6jXC4ZncKXN4Bh8byixpJrNGMLS6IqSXEYmpsBk2xIvxbAAj+oPiG6zBi
         JOPSRvcNdZirJv91UTX7CpUcQ0hIq22X/OebjLworTuj+lJpKEalfRIqgWBJqqMFkF8P
         fKqDigi+xU+R5dLQXCEhYdLEszlvj6x3oW9zkf41IgxBy6irHH3bQEgutWQ64KB9pWyg
         zEsLZt+GH6SaWGhj66VlAR45PKC1aWNQvus+HEb7SssiWRa8VZKUiuck2MgHGuOt05bY
         0rPIF+X2UjQcyKZFqoiqb6nk0uPcm20NkyjAsNfEcSwsqFWORVZtUnwFrq76EI1ciNGe
         vblg==
X-Forwarded-Encrypted: i=1; AHgh+RpL7QQ7WqR1KpKAmXSk6JeO1Ag/LQRVnh+2XrD928DUdAqpdh7gebGqMq34tuXTBiAopbyZJb8hPb7n@vger.kernel.org
X-Gm-Message-State: AOJu0YxTFd69xsiPMG4Xj9m3mHb/kfHdfttKN0Nn3cjCOdeNhbeO1M6W
	ydaQmKJGqWhKAHf4+xRfmYjoErfBZxVpGOMoHr1vw7239Yj+UzJRsLHc17Hr0xBESXf3X8P2Kmc
	Fp1S7/TMwX9aWK5dW3+zK2J09Kp2WVWLB8aLQCHfXaqWzHsFO9eUC4QZIdfyM99HD
X-Gm-Gg: AfdE7clZZmaWsBixuo4xWDD0L96lq1Lge9SYh8anffUK7v2iuVR8r8uGKhaa/YE5RgU
	JBeHxzojBBU+a+mXRnvN7KAtJoMFCy6/FVstFCN/hhv75ysjAgepPi/vmM6CwhwYczXLYHZ2zpQ
	vNyYE2toiGLCJ5F7I2qZkunWN6ZDINFN/FBXLqwJVy6JWJx/TWwRR1hNjmZ4tffWs7tkidE8Unf
	ayPaUCYJaUfjGxAMq3eTRzU4ae+GbDIno2Mon8Z/hsxkWja8nrmNmvorNg/k7GVExCblZloAK0s
	LqCDb79uqf56k65xpWB6eu0zCGg63Y7xF2tqrvtM1f3NOHpsipyMePliOlVi1Q5C438XNTANcIb
	k2/k6x938otwHZgmeTbN4FHRYF3bMRo9IQJqtQCd0O21ddlrp1B0DUX6Cu9VDBerMgkoyeTzr3e
	wNJLmMo1XCjDfDhw==
X-Received: by 2002:a05:622a:480f:b0:51c:439c:babd with SMTP id d75a77b69052e-5213c10a2efmr201273421cf.9.1784641311304;
        Tue, 21 Jul 2026 06:41:51 -0700 (PDT)
X-Received: by 2002:a05:622a:480f:b0:51c:439c:babd with SMTP id d75a77b69052e-5213c10a2efmr201273001cf.9.1784641310855;
        Tue, 21 Jul 2026 06:41:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a5a3475fsm413974e87.58.2026.07.21.06.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:41:49 -0700 (PDT)
Date: Tue, 21 Jul 2026 16:41:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: eliza: Add fallback compatible for
 ADSP remoteproc
Message-ID: <oxiv4b72vh53bmibs5jol5klkpx7zokn4r2l5o4az775nm52lx@pcz4s2w2wxqb>
References: <20260721-dts-qcom-eliza-fix-adsp-binding-v1-0-3a0b03af2ec7@oss.qualcomm.com>
 <20260721-dts-qcom-eliza-fix-adsp-binding-v1-2-3a0b03af2ec7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-dts-qcom-eliza-fix-adsp-binding-v1-2-3a0b03af2ec7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: mDnfNPSlunrzVXZ9jq8usujryc-x1gvC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX+o+oVvrqBjQf
 QCN0wbx5VnmW4RSBt3UIUtnlumt9/ljubVJQ2hHS0ZC38s9ousvZ2rYIPQ+sHT/bGfrT6VJrjc/
 HoDMXAs3lMiuzmqfDgoKF5LOMFBZSc2QlLynlbg46yNsu3mTMAtk216iczQH2Bu3KTnJ+JZM8eq
 s3AlQ5dIkK0ylzwhRo1j7I+Cjqqyr0r2gxXTh0xAt6mzkyptge3imc9uU0X3ylRY8OtU0QMgPUG
 WCLwdxpuhE6pMDSxSOOG3jPv8Ea9zxZDOsJ90LPZM6l4hcZcbQA7HErui2lzm/NM98R112QqqFA
 l1qDP6ECFj+QYb1u0hFgA9JJi3W2ymDPl7xF9sVKkth8ELjl/29qEfk3dSobQpKFbPQxzt+B6MU
 zcdNaqslGKW4Q5HoFDVSTC2hVVi9cuSbuwW/RBOCRhzoZDFOVFZIsTDWOoLR6oZlLx20egyq1ru
 pOWUoeQZQ3OzMZl1wnQ==
X-Authority-Analysis: v=2.4 cv=I9JVgtgg c=1 sm=1 tr=0 ts=6a5f771f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=pKSKXMcIEd6FydBdNeAA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: mDnfNPSlunrzVXZ9jq8usujryc-x1gvC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX6fcPwaBrxZXr
 HIKpGrN/o098M/hZNM+q/4GXBHEBZcLK6+7DDNUw/V+Jnj3PpvnNfllEEYc/68xe3DtMd2aSiHU
 9bsS4F8dJ6RFM2S7NxSEDoJU8cFPpQY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_02,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210144

On Tue, Jul 21, 2026 at 02:35:08PM +0300, Abel Vesa wrote:
> The ADSP found on Eliza SoC is actually fully compatible with the ones
> from SM8750 class. So add the SM8550 compatible as fallback, just like
> the rest from the SM8750 class SoCs.
> 
> Fixes: 88ddafb01ec0 ("arm64: dts: qcom: eliza: Describe the ADSP and USB related nodes")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
