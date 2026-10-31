Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793453316;
	b=wo48W1N5dUs8AmvD7GRSq54I9Sqt03+I1YEvgbbn61wuvLfJlyHg2N3uYrK7Q22GW+ZL
	 YBkMY9OT7Y8Cr7OyPt+wy5sm2WSCPInsHodujSYMKRWJ+0tyAA2jPLdExkpTsOp+3k7gG
	 R8dlHABalpqLw8e84aML2CfoTvrkrlrcNnxgZeP/f/Epw1iSEtPy6+rE//fsfLYmmAq/j
	 j2ZqnHbLsNsWWDIK041PbEbeffiMTZMvDE5vWjE7etObYb5gKtfneQJMLWBFG5FbL6Tu7
	 xmHvRv6rCEnCnh8d88kw7QA7B3H0tmxy9gCBCcUGnLR7W1pgMj/U9X/lWx6fQnW6c/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793453316;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=r5M7MBbW/Suyh8vDkmFGXN3FZTnS5DGduJhU7w+zV68=;
	b=OId3jIhhI0EY9hs6xlQe3lPk5HkGY5qKeUV8ldQuW25RK105LRtsHPo08CaoFdKgFySJ
	 ermkC6+cffVq4zIG2GTOPbGI6ZENE88cokZgek+q6QtkwMtjql8Qh+QL9WcV2jYzAwvGn
	 x/CKFrXhFEuCKLCpdKprB7NQ873yUGt14ABskrCPIbr6DKNDm5xOdL/SBH7rTmaIvJ7zW
	 oJ2POqwfiUUpNcg85PfXWaNuIF9PMvN5NnmenxcQpnZjwcc+PJnhhJWzoULbFfOiMMWma
	 dianUCUAgbMX685j0awmYkcbwQ6dDlwhBruQQ8in+yUxyBNYnKgSk+2F4F8O3E+zWDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eTxcVNZP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f6wRNcY2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB3D606A31F
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 13:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DB3D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eTxcVNZP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f6wRNcY2
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD02O63208602
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 13:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r5M7MBbW/Suyh8vDkmFGXN3FZTnS5DGduJhU7w+zV68=; b=eTxcVNZPJplLzNjo
	NY2tYdtB225XmF4MtDrZR+o/gH69DH9RcSKfCxEmxwXYkgne4rVIZdXKWqNYgVwy
	WrTNpBWBqx79kl7a9uVOXJKg6+aKxJqkpQjJIM2R4Ge7A/7LZu7rZjIr5OtoJs43
	oorLdlXTs96/zn9JXW6+P7BCTkhGnsbvzJsOGbWqtcqOn+EyJW84sEV/NCRyuIrk
	tTKtbzMr/K3a2H5WoT4Cz6OfPHm0o+vZtlkcUuyiYMD/p23A4RSReQ3EWMAQs5iv
	SYct+gH11TTtRfaXNPSNPV752J1ktMQ/oCmg0MrdEuaEeyMgkTuESSZTOv4181zX
	Lyc6JA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn79rsb02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 13:28:34 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35cbea41088so2131314eec.1
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 06:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793453314; x=1794058114; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r5M7MBbW/Suyh8vDkmFGXN3FZTnS5DGduJhU7w+zV68=;
        b=f6wRNcY2J5It1Ti83W8W2ujSf7hPrQenDiD10C8Mw1VRt+ly9ukaOsRsEKY/yT75PT
         5MV/pU8E3Bxn+jhgVgQ7Nm20mGpXe+holhxU468ENhIcFH2svoAg1OYTTSNWDRp28i2n
         sS5hgkGZ1Z7FOu7STSY8yyP59Lda2/MwB8gJ+Z+6pQ5gOfKVa2RGsLmRBFfpdBF9lF7m
         AtD4qUbSc0v1RVBbPYnoAsXRbQsRqb97Z+EPJ18r2whzUvqTvkiCMue38ODBkgjM8K5F
         ybJ+n37ljWfBYCDZWfVdbgn0FnblWG4Z6NK92Dk4DowkM4BxcXA1Lg6njOghbFaAnG2p
         PHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793453314; x=1794058114;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=r5M7MBbW/Suyh8vDkmFGXN3FZTnS5DGduJhU7w+zV68=;
        b=nFvlt2W1Lxe7rrZvRXjbP4o/1pHLQIJj3CEzP6dNkttswGu7ZSrn1y9KH9PomQCMJQ
         MfE3R/e4LFcUrWt9CzCLXWJyrQYQNGwros7zfOwmsFRZD9I41ElqEsX2aGMEv4wnhLr9
         pDPoScl4LU5GuiKdIiNmHbDI0o0dLgonZZ9E7Sz0USCxYJjQW0Vp/fPNgOdoiLVzNXqK
         uASuM6JfT6o8Rxw2T833HYbckWOvX7jb2fukaV95RwbgmJFzGfaJ2igEPXzZZ7Klim1U
         jgpiEhAcgKnQvCpKhWZffJHP3+q5lN9udPVG4pMt5P/egE5CU2hq+bA+uq81xMF4Bg+h
         JiZg==
X-Forwarded-Encrypted: i=1; AKwUvBxGgDsTeGjtc/KaqfE1J3YajfO967MKhKSbR0YKFxSfTwli1lmi4Rqk2BpiSAdaU/ISaf28y0y7nf9z@vger.kernel.org
X-Gm-Message-State: AFq9FYK2hB60l1ZouG7Q7YHIsZjWQzimSyjNScxJ07TYGt1pASIIKj1L
	9xSeCb9jRv31zXSGCYGKOECVg46IjEWGNP0SXkBKWaXTKqvNdeWXXdE9nSafVFS0+0aZn890ko7
	17IZdU90GTRbhxFTncgLjS+jZGuYUBwUIOX8DajA5FgqUP8/Z5/O18H7/6/avv1Oy
X-Gm-Gg: AYBFou16QL4+LecHOEZz65Sar1qMHn9S/Mvk83R6kOvht8xVknf9I+QQf128E1it+2Q
	bNTNYoPWREkaQP/yvhKKa+x//V9FuRorPrPf68aMeR2HUsy0XzsDuI3YJkZdGB0QARmJAybd96i
	RoxylZmwCT8e7gc73uPpB8582J0mSdXJu6pBvK3aaSQbzoErPv3COrLL/FAY0Gq5ZbcWXVYZ8mi
	jWpzwi4AgsP1VmH98wHBIJjf+gQ+Kxck1xmxW+eF6S1W6W3vzv6fCwgfqN+YBsQB7H0dcaHW259
	FroqFYKHUzlxElUWJtETeon1yucpQPYB359w2yeUV21LvjCLLfpyIcxdxI9Qs29iR9uX6QSb9Ol
	U3UMtg1cNJMSx14uXBBt+m26dAj83p6YdYSWPAV2L1KLHInmbI3xoeDvuMZf/WFCdWoi5/19I8R
	wQDHBBqhLw5KJiF+g=
X-Received: by 2002:a05:7022:2097:b0:1a0:b650:5c93 with SMTP id a92af1059eb24-1ac5e8e1e16mr7121591c88.41.1793453313837;
        Sat, 31 Oct 2026 06:28:33 -0700 (PDT)
X-Received: by 2002:a05:7022:2097:b0:1a0:b650:5c93 with SMTP id a92af1059eb24-1ac5e8e1e16mr7121569c88.41.1793453313298;
        Sat, 31 Oct 2026 06:28:33 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4a04esm16412510c88.15.2026.10.31.06.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 06:28:32 -0700 (PDT)
Date: Sat, 31 Oct 2026 21:28:26 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH RFC v3 3/5] arm64: dts: qcom: nord-ride-embedded: Enable
 PCIe controllers and PHY
Message-ID: <auXs-qBMufezjqml@QCOM-aGQu4IUr3Y>
References: <20261021022921.2053957-1-shengchao.guo@oss.qualcomm.com>
 <20261021022921.2053957-4-shengchao.guo@oss.qualcomm.com>
 <cb4e821d-a2e7-4ca7-be1d-f92e20e52260@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb4e821d-a2e7-4ca7-be1d-f92e20e52260@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: IP0pJ4MgNtWecun7zG06_aBjA0CE43Aq
X-Authority-Analysis: v=2.4 cv=Wtq+otfv c=1 sm=1 tr=0 ts=6ae5ed02 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=8nJEP1OIZ-IA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=6Qp4BPjpy_d1hweZHL0A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1MyBTYWx0ZWRfX2MfeEjEdQXWU
 TKCx36OUWAkXulnKFOwUPl4yPIlsuwju8RgX+UBZNd9xdDl3UrE7OpDIP9OQoPBeyiIB1ArRGyd
 lSkcy6K9y9bP2ohwZABEkFGXb6AyDtI=
X-Proofpoint-GUID: IP0pJ4MgNtWecun7zG06_aBjA0CE43Aq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1MyBTYWx0ZWRfX1nNhpQt0AwWV
 tNk8C/5NfqXibJdFIAIRi/fdVOWYg1pfbVFfJ9mmF1LL7GPArHdYEQZ+4ibNJnJn/bUWs+07kK7
 ZybDsryOwtnGdJMliFyQ3DoS6q7tVFoQ4dWGmhdYgvmX0Bc18ioauKZ4NOb7V0xocnOyNZvgNd/
 PXfpMN6vXsYfjhNjwGLI/AG9Dqa4SJ5icsRUohF0+KFoFCLKtTyRYzEMR4RxhwJKNXpB67PQFwC
 TjRMaHglHKcEFvkD2Otar43pGUDMll+N9VnESZUMI2GetUwQvpkWEnMuZnG353KycGe0OM1WC4Z
 s6vDmh1DnO58lvAVkpN7LH7vruYTaT/eHk63MnmND6rxbcyxOsQE63ziMbS3s1KtPKGRQa9iMCP
 9dUDCVui7Fz3sufA4IzJ6xkDVaLG4JY3tA9SyJfAs0v9SApigePgTWztrmaqinPdf2negvmraYv
 FDQAUaptU+zmqOvUCOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310053

On Sat, Oct 31, 2026 at 03:50:09PM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 10/21/2026 7:59 AM, Shawn Guo wrote:
> > From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> >
> > The Nord Ride Embedded board routes all four PCIe links, so enable
> > pcie0-pcie3 and the QMP PHY, supply the per-port PHY and PLL rails, and
> > describe the PERST# and WAKE# lines of each root port.
> >
> > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> >  .../boot/dts/qcom/nord-ride-embedded.dts      | 49 +++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> > index 49635695f832..fcc07226db8b 100644
> > --- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> > +++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> > @@ -366,6 +366,55 @@ vreg_l3l_1p8: ldo3 {
> >  	};
> >  };
> >  
> > +&pcie_phy {
> > +	vdda-phy-a-supply = <&vreg_l6a_1p2>;
> > +	vdda-phy-b-supply = <&vreg_l4a_1p2>;
> > +	vdda-phy-c-supply = <&vreg_l4a_1p2>;
> > +	vdda-phy-d-supply = <&vreg_l4a_1p2>;
> > +	vdda-pll-a-supply = <&vreg_l1e_0p9>;
> Hi Shawn,
> 
> I did a mistake while sharing these changes, pll supply for b, c, d should be
> l2e instead of l1e.
> -    vdda-pll-b-supply = <&vreg_l1e_0p9>;
> -    vdda-pll-c-supply = <&vreg_l1e_0p9>;
> -    vdda-pll-d-supply = <&vreg_l1e_0p9>;
> +    vdda-pll-b-supply = <&vreg_l2e_0p9>;
> +    vdda-pll-c-supply = <&vreg_l2e_0p9>;
> +    vdda-pll-d-supply = <&vreg_l2e_0p9>;
> 
> Can you update them as this patch is not applied yet.

Sure! I checked schematics and RRD board needs the same correction.

Shawn
