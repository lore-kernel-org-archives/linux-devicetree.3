Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141893AE1AF
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 15:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775836599; cv=none; b=dM7fKm1FTMkmvFd5Ymz9YcIxs13664O6wbsvkfb3GP5Ld5xKAeQ9H8EkcY5r7ebr2oB5Df2424/6OISgeWjrSjySEBwYCeVEbrN+5exVrhET2FW0KIBIKdsZ9Qlkj+G1GJ5O9/+L51YLnBOSdvkUDV6AwkiVBksgQ9nBjzASkmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775836599; c=relaxed/simple;
	bh=mj5HSvzKwu773ANUeuPZBe6aniUvoWWSP6E0fNeBdI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BfAooZTKAu0kiuzwQAjuV3XnWnJyGKdVNGEfBvoOKo5xGTnP7f7CW3L+smI8sg/dySxFWfDjmwkrsBEnN/kpB8PjUd3yqdxc9cnRD7Pj1zgFlwLF/1b34L3qIeM7ZGUxwgGS8Z6/gZXsDeIAOF2g1bqADoM2MwTGvfdp/YhyJSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NpGZgy5o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hxwQ0o1l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NpGZgy5o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hxwQ0o1l"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AB0Qfw1925120
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 15:56:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k8QL0W9coEdW5TOsLL/sYcM2
	Lbjzn2rZrwMC8N0oE6g=; b=NpGZgy5olwpR3ToGAH9tR7QTuDD5bHXgMB22rXlv
	wnUF9zNZKF8PGdE4KZqZ9B8CL4jv2Gd+ZD1cnmA1Lr9OEQbLkjEx+aiDL5mIGEQn
	NZU2M2+ZWMEp6W2kGDjWipi/8dyl+IOmeFhT/1HzWEPXpEIb+VVvwwqChsDhEHyq
	S7zKbJwlWKZNqc4yrskzF64q8Rx4oEdptPiMG4CTOmfpjW6IfWxYqH3BBjeKPlYM
	aXkAdCiS44S3uUPHQVShuE0LEyQuS+ptEhCmAUXuRPHTdski88En1e3hD/3kl0We
	d5xYIBtArflt47BavcA3614E/9x4qw1eZx2cp4NjgfM2CQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudjt0g5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 15:56:37 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2c895e7de52so6162278eec.0
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 08:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775836597; x=1776441397; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k8QL0W9coEdW5TOsLL/sYcM2Lbjzn2rZrwMC8N0oE6g=;
        b=hxwQ0o1l5hIJ6dJCPG39DnwAOQpnFzDhuDIs2HO0WEw4G3x6YldajUVbXuoXgFAqPJ
         SKpz/NWbTBHBNaqUc0pzoNd8Fy3CMZ6XXoyglaoWOi84nqMqr/fs38pzP3k4Bg3wM+W7
         jIYFvMvNx64TwmP7PRy/QNooRmHWoUitXyArRI/udrJ2eO2v1eSKLWL+YaQvASs0EGjM
         g+xst/us7Pl83TzdFx3NrUFoOu+7KdwvoWC5Ld6Kh0kVqbATRdJ/aJGjrbk8UJek1wbe
         jb5+ZqGr5VdiUR7+q/1441xhFAx5NYkwmU3/mgwIyPsWeKvG30Y1+8J8OiQgCZNpBLJu
         XSsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775836597; x=1776441397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k8QL0W9coEdW5TOsLL/sYcM2Lbjzn2rZrwMC8N0oE6g=;
        b=RDdiT73UvKwpSJdlLdSDuGyIptoLGnOCd5O6V4/mE/1YPXkad5WCMAPisGPOlr0p3h
         zD6dPuNExzdxZH17gPg/uq0fz7xp439WN9nEwdlnwyYEnaxcrpUoZVKtSCpE1OKFKjjR
         sIs7DH0fZgIsNfNWI4H2DzN30ew7TEX2lFM//PgqbSfEYowTWekStuLtOH/YLvMQKSTf
         p8TxiD6AfDv7kDuFeVl8IGFOcmmTHkckcGmcg84CInTZUJSavnh9OIZ/FGvQbgSSxkB/
         ENy8XJtI9F4IorOli6WwhUqgTx1YO40SsCE5RGHBAdbUDlrl6QjdlkHiRC9+PuxCDWZE
         jRUQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8jq8gGwq3CBusPBnbiopMUzhfRmJ5x5fy2XWY9FMdX38mKMiEukObjV1EzfYdOL9M6vMLDzeCzqWs@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7Go1sC7raxsXkCHMLwH0VrsAwhHbzCNIa6b6kHuknabvO//bd
	TxcHWtRLoEG0eAJCqNDUmhWar4/NPRBvbmfMsPGfunU6dH2GN+W+Eu8hn5ekKlL7bURDgenHcxW
	PpEd1qhAs9rK6HnSMJz+VfwytahbBeoTnjFWaX5m+b+c1s3JWy4zkwEEDN+ETrfIp
X-Gm-Gg: AeBDieuFx52F8sGfY7rx6tpJzqRDflJapGuCPAGDr2yWMr8vFcKG6rkzehl28jXgZ4n
	gtkgaAsbIa04b1GKeWP9GXTujIfID7xywxbc1q8gEPmq2L2QZfPwEKlXy0ROvsz5/YtzCvxcNgf
	qo0ekB8Rmixp8OA+k/9G5DQvlkf7eMNOmAQfbHwTi2lui4LdVc43o3iWBzPCFzlOKp1850ILmGu
	G4rkDU7BukvXoESrP6xWRDPmG6vq7qV+NZg16EjmOqa6QnFqiKSSFVsverFqC1Tj7XUc+qZMH3V
	6sQdYHJFdMDIFP+iZAkrY/x7x0vG4s1A1sf2FERa4aVJRBheiOk0xYgpZ023mDUEy7fLCT+5WpV
	QF9uQxy9kf+jbfdk6y0hhVVJaP4zBs699McJt6iVrLSZGWATIkkDV39OyHeJRUBgeY85Xj3YEc2
	U=
X-Received: by 2002:a05:7300:a194:b0:2d1:491f:41ee with SMTP id 5a478bee46e88-2d5877a7fafmr2198861eec.9.1775836596835;
        Fri, 10 Apr 2026 08:56:36 -0700 (PDT)
X-Received: by 2002:a05:7300:a194:b0:2d1:491f:41ee with SMTP id 5a478bee46e88-2d5877a7fafmr2198825eec.9.1775836596203;
        Fri, 10 Apr 2026 08:56:36 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d561bde68bsm4817855eec.17.2026.04.10.08.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 08:56:35 -0700 (PDT)
Date: Fri, 10 Apr 2026 08:56:34 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/7] clk: qcom: rpmh: Add support for Hawi RPMH clocks
Message-ID: <adkdso29+7ecTsL+@hu-mdtipton-lv.qualcomm.com>
References: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
 <20260409-clk-hawi-v2-4-c7a185389d9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-clk-hawi-v2-4-c7a185389d9a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=X+hi7mTe c=1 sm=1 tr=0 ts=69d91db5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=JDKdR2D3zIFFAMo1GYoA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: krwAWr5kvttIr10pJBGCg7mYkW7X6kZO
X-Proofpoint-ORIG-GUID: krwAWr5kvttIr10pJBGCg7mYkW7X6kZO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE0OSBTYWx0ZWRfX4uJQWjHuFyL/
 U/6a4yQbqSU/gaCw+lQknlNGjWXnDhZWFthx1232ZMglYKZWqBw2OPvhr4ZJ3avxhrPkdWlmCN+
 Tev3lt0LnwqVSzPBonUiyL83nuDtwTntizzk70+XcTq7y8OUbOKgFElzyS4eqfJzmF+pcRQ0sJk
 19HXXOW2CkVHPFLcDmTzeNT+Gs0X00atluNDCGJUu5K67hO89EIYPv2IklCtYGcttmZqjLpDaMQ
 g2jA/xhy95DnVx0Jl9KTVLkWQ6dQoNEs3oTpcPKcLSS0zKgzehiQiqVqTpOw56wwqP3tkZ7aG/n
 CA2UUO459++S00dOnmz5E62G+m2DIuMjozyaKDR+gnYx3cQJWr0XX9qFxSizyMLHBqcTAy8Nw8V
 vhyVsW5K2wv1lL0OVyiopBqq/qtWJppqYHOQjEzkEFnPE2rAzFnCH9w+L1w0pn7n1uBDa6mmo8G
 bzUlkKo+xqdk9km4Rfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100149

On Thu, Apr 09, 2026 at 01:51:38PM -0700, Vivek Aknurwar wrote:
> Add RPMH clocks present in Qualcomm Hawi SoC.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)

Reviewed-by: Mike Tipton <mike.tipton@oss.qualcomm.com>

Thanks,
Mike
