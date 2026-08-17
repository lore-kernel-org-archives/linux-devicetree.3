Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163D13019BA
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 04:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786940335; cv=none; b=Q1DeqBbsT35fpUEdywFov7PSAiZqM771X1zfmI8jmMiw8p5E2l41DGzhwcPFxx8/6Ku6IYwcb7YwK4S3YrwdmtpxVgzXFQyBafK6qJuT4DdKpBJgf5NLD39zsoy4xo0XZ2D48M2rYSfM4YCD99pw1s5IppgvR6bcDa8+707BcnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786940335; c=relaxed/simple;
	bh=6L2iqZCBsYzqj/HAUudwFvBppLuKS76byrKmvQqpUY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z25HDAuxrLtjQNhty+za+HhWsxRMJPRcxtesmTcE88uuYWQTlw8WGdMXaTg7ncyFBUS3O+KpeMV9kLxa4k0vngjh5pnH94SBBvYkYO3kyHaxdtPWp6Vioz+jMwK5rWr0nNnCFVLX59WHDape1rIWxrjJGK2nYitew8+6lz/VSQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SiM8wgjt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Asht65eD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SiM8wgjt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Asht65eD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GLCwwe3304846
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 04:18:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9k1AN/bNkgGI52BUQrkgfw0H
	gLaOSJlWZr7YU9FaXkk=; b=SiM8wgjtNX80XaBjN4h6Wibt/MlKRiicbG9yWzcz
	CL6U14OHvkEIFpyOGOoPWecMgLXz43JkyQbxD2n52NoswMV5Vu9LFuCloboxSyB1
	gyQweTquQf3k/+X4G+ypFDHW1FqtrNGyx0xXF2b5o/4P/MlfPwEBSSblxqscsDN3
	qiIkXdYlNIueKTxN9jve7yGHOiEHA+8L0YSi4q+AIWlUcLYfGFrSk0Y+eJrRwfvw
	4/ACfQOrwk0H3iIhxFQEYDSLzIqRASOhvoLU7AAEmqbCg5zOZ+RphXzNpcAg6W/D
	DMAkGndsY/CwZVRzDkihOl2TmpdQwkuHKtpQNmr6Ml76BQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghq550f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 04:18:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92efd2ca21aso513388585a.0
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 21:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786940331; x=1787545131; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9k1AN/bNkgGI52BUQrkgfw0HgLaOSJlWZr7YU9FaXkk=;
        b=Asht65eD7u0+zRqmzJ3W5RsYyMLfXe98U4ZrWsWWyBC863fnYkyHmuFfi13SThRwxO
         yClQwUcLdXyGp02cAy0hkM2BPp852IrdpBJaWi4jIfAsVcOU3CN/rrKcs44HYTkPAI/d
         YZs9w4fIxAnyI5xg2y25YKVkBWLaQmd+9naBC+h+xRGDUWKaN7j10r8Z1jyMhGXtcFUU
         /rjPNQ6LxRk3Zv3dgbGJ/wextUEuH/uohW/niC9cWBuaznw99P7/XXVa8FuA68bFYYgg
         04q1YETdshga8ki8H+n9kLyUKF25noctuWyqkBMWjxnNfdb2PT/+sDCkVlJJx5AIobxp
         H65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786940331; x=1787545131;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9k1AN/bNkgGI52BUQrkgfw0HgLaOSJlWZr7YU9FaXkk=;
        b=EXsLBdjat/5mQemGZBpc/SJ7zyaP18y7lM58hyPpFbrSY4XKEodcIlxauqzaWDsRzH
         o0559NXvQfDlub5Sy7iZrodANdpMywIxxQtQkamS4zd1pgutxOizFQmNFNVtCeZQHuXL
         9xq8ijIhTSrC5B4N83W+QDSR1LeuqockfaP3TZCxJsnF9fucIfzD8Kwm79Kt6sRNLsXq
         nk9AjB/CcmiRpxR+ComSg7uceWc+xPisC54JTYlrlHktcQElIxFWU5pV2MZrz1Gprrsj
         Rs4rqIOEvUYi15ZHWrmTZV3ok6Q/Bxsvhj22sWgHnXIXZHdk2T/8j7Qi8q0k0pARE7ES
         nytg==
X-Forwarded-Encrypted: i=1; AHgh+Rqlfny0Sv2haBf+RZsFiQrgp02XEdPuln2PClKWSUf0hpzX+7+94aHr/rmNamBh2IBIvJpspSRj0DGK@vger.kernel.org
X-Gm-Message-State: AOJu0YwFkb1tJbbaEPmuPFK8kHd/b4mms6p2ASwTxXc6w+xWKjkUvbhh
	MPrwy0Q2xIPazmBPwhW1LSfvngjIbArByKrcUXQObhy4hC6XIRQAU/f3jvHSVy+53WvsJ01zEZP
	wYCTw23CJXA6e5/2jB0xjXPSReR8N0g1/s+nVPUSi1cFnit8Qe/VsKkzAqZvce+QrsJFsg59yW5
	BJVA==
X-Gm-Gg: AR+sD13pmiO5AmUncGlOztlgWvwqSVQGPpCrL6Lfh7FFxEjLPbCEf4V8TwS7/1TqDmR
	I7uB+clZJXGLZaI8QC+6CVCZ7TXDGrpYLOYeRZD6OOO/OVsejAIJJNlO5MuYeys+FQ/+KCKLKCt
	3/RsLYjcKkURmrmR+fxyQWpxsL57wovDEPEfrvy5OsBHsdhivJd8f9Mc0itq6JM72xxN5jj4Eiz
	EjYffP0fafbdgWFN6aFoi8kNvaMBh0oV1iaRpBamHSkl77Vrnmq/n23u1UNvcp3aesvjvp3VUup
	jfCuF9/7eabFdbZ+Z9gOYJqqMck1X9aBQWjleoX0QvC3LSAbkiiqxiTivGQWtBqJidPmfsSs9FN
	ET2bSaUIzS02dO90JahoK9hkDT0qAh7jxsG4YmFnbrJg4q0FZRgfwYRUjCQFcFV2FVT0JTnqNsO
	8K2l4MW0iejmnO
X-Received: by 2002:a05:620a:6609:b0:92f:362:80a0 with SMTP id af79cd13be357-936d1fd6997mr2559609985a.6.1786940330857;
        Sun, 16 Aug 2026 21:18:50 -0700 (PDT)
X-Received: by 2002:a05:620a:6609:b0:92f:362:80a0 with SMTP id af79cd13be357-936d1fd6997mr2559562785a.6.1786940319565;
        Sun, 16 Aug 2026 21:18:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cfa1227sm39261e87.22.2026.08.16.21.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 21:18:37 -0700 (PDT)
Date: Mon, 17 Aug 2026 07:18:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: lemans: Use hyphen in rpmhpd OPP
 node names
Message-ID: <qqyfk2coesczcgkv2a6pqr33mjv4j55qzzoqqtsuue7skwgveu@u4ytyrzohnoo>
References: <20260816123648.1632681-1-shengchao.guo@oss.qualcomm.com>
 <20260816123648.1632681-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260816123648.1632681-3-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDAzMCBTYWx0ZWRfX6U6eC/nPN9TD
 EpcuN/I4nTX4b4xbTXnZCJ6JQZVJwSLsJxe1ZgE5l09iS3Ij75eHUfRW1N6g8utRSwIWSO4gy4+
 VkFhGle2gDv/tva/WWMkVoxXwceYOQysIJldHNLVCPKtuKiwM3xgoUAjPTYhP4keaxhP2Xlw98H
 tQh7msn0+29EW2VDuGg5wPN/2B5bIMVDG9y2WFXk3ros0YzAml0aVk2t6aGJvY5106O2rwsi7x5
 4HSQhyk+tn7mRQ8B0EYt5A3qPaHR9e+wkN2gM0hrlYWZNzT8v/ST3ylq57Dy7B2xxjTx34zZtZZ
 IxdUkrlJXtovHUtsEUaNntun8ugSt1ltDCWx2pSjO8Qg2rwbfZEShV3Zf/3ivQiJqmIBBYteLn9
 hKfUuCBUK3R4xshe/OvRPxySzBJi83r83d//DqNYC2pG2dRfkMk0v3SwIPWUPc/b8YBqewlKMfa
 YhYjgOJ1mWo/stB6pZA==
X-Proofpoint-ORIG-GUID: kTf8jbpa4g8wWqirp6rq58zLTt87KEcI
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDAzMCBTYWx0ZWRfX7KrSSvOxnHdf
 joET1i85lBqeazkUNp4G6WDxtAEDck9r/bTap32SjH7Ury8mKQ6ENMmgla4JvxILCoZHtXiIVIT
 0+tWCOkCRdViajrrT4Zh5PTammMClW8=
X-Proofpoint-GUID: kTf8jbpa4g8wWqirp6rq58zLTt87KEcI
X-Authority-Analysis: v=2.4 cv=dvHrzVg4 c=1 sm=1 tr=0 ts=6a828bac cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=zuKYxuzwKyNl2D12Vk4A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170030

On Sun, Aug 16, 2026 at 08:36:48PM +0800, Shawn Guo wrote:
> Two OPP nodes in the rpmhpd OPP table are named opp2 and opp3, while the
> surrounding nodes in the same table use the opp-N form.  Rename them for
> consistency.  Change should be safe, because node names are not
> considered an ABI, and all references go through labels.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
