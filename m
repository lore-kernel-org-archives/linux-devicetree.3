Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BC832ED21
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 23:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783121028; cv=none; b=g2NVMHuIRTbtGbwc1w4+bM2F0Tf0Q/pZ/M7kNTQsZIt96ZXx4V04anudubJVexAbLluEsIvzx8EJIresookzbhM46BPxSUlYnYKBaeQqCPlQY+ZuZzOn6jzhqlySZqo4aIAd5OWTJEBT/C3zyGKjih9ZoLxpYZtNapvK+0a01vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783121028; c=relaxed/simple;
	bh=Q6MpStlpatEJkDy1dODKrw+pHg/8lsoWpNmaJPV+J+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZB1EhwN3x3iaJ6ddQd+EqCibo3rKuamaLmqXdZkqzn5A4+ArlvPIU7PPde3f+6H5X/kEJiJUP5xarXQs3+zRdOiuNmY2T7p0z8qjryfuDW+NYz1XN7bhNZyHfUSu69HWdYNGHglwFKCtseOzszhjaL7suPRva+1U20jK0rs/35I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VYD6IJD/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aQV1FoMO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VYD6IJD/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aQV1FoMO"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPYLa871844
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 23:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WcTSMA6ScX6zdWc2oJ6SMCFD
	q/6WkQB0iYOmZRp568g=; b=VYD6IJD/pYPHVAFazsqV0p5CfCOmIR2/XXiuz2YO
	Z0h/XjKzvXGSHvxn2NPl9lBZNMg4FY5F972rC7A2NDN+5gF6v6PmJ0oBaGXvzOUw
	Y/kTGvoddBw2llUHfgHqsmIPHN13K7Wh/TTLUSUCSpHlDnkL3akvT+HlapPVCw+t
	hCShGGNSNsWNRY6zNd9tlT6G1gD/lWvJGBg1trbGsmfIAp45G9MYect1UqbAIJzW
	QwTvuwZ3fgcR2YWWKOO9BNPy0UIn1sPExRNZijiJj7lwJvUUl4gyDmBK4tazgU9/
	giWEiOXn3BzJm6ottFEFmC+NdtcNjnYk9RZ/ZEUrM1fWAQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n48s2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 23:23:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-91ed0e140c5so177142185a.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 16:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783121025; x=1783725825; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WcTSMA6ScX6zdWc2oJ6SMCFDq/6WkQB0iYOmZRp568g=;
        b=aQV1FoMOGQxSZv5lmx/U2RslFPssjyvV0qsyYoxDBt0kGbN7EmDLim2rLFpttqZS1D
         Fyh0k5cFBCtaMPfDZhLikWx1fGBMURMY3IJ6eaKvakWR0k4JGLnxmGh0Vg531uiyhXd/
         VOz5nVEsZzQKzDS6X4XJSsuSSkLIW2H80q/RoMrVdPvv47RUFT0FXDHY9N3t1G5XMkQP
         w/uxpvHoDWcNDf2ZSpOnDbFxEK4T9uoaVlFLCLX4X4mmwBlJUES6J5cJGqPDSc+hY3y8
         DS4HjHzmgLVzQg4jUy0sQoQXSr7jhdq6XyfNJryZCAeHuxcZ/ChmPt+OTSJpGgHSZw5R
         OH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783121025; x=1783725825;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WcTSMA6ScX6zdWc2oJ6SMCFDq/6WkQB0iYOmZRp568g=;
        b=KoPzstwx7pjdSmwmbiWJW4pdb17xVjH4l55cjPSpJxV1VXRNkgWeobizGM5KAIpoX3
         6pQ1EXFw6Qnb/Ch0iWITyQx5OdpifvBmYh3F6WPXC4maXWWsjc6wCXfRUyX4CWPtS6xN
         hRIcIBCBKa8Wb6BHq64iOq/HXHRVrusCi2ISrNXLidhzL7cFMLzEmUIe/KTCFtlMoMFa
         HHrhzg2xqGZwQyZ5ZwZEMlr+pbA14N+qTr9VDFtszaqIP00OTzmw1paGNtblOuQ7UllV
         j1qhr1TptiKGL475Tn2GrF8u2oQT+0Ez8fe7XH6jt9PkelOglmMQ0p88KioOdWXxoaHf
         VCzg==
X-Forwarded-Encrypted: i=1; AFNElJ+6jG0vt3CHYhPtqb9blG4catn7vHSXmI07P/vHDFh6N6eUoE0287EpCnrIANWMVrIXKArwC7w19yxv@vger.kernel.org
X-Gm-Message-State: AOJu0YyKbwcaYiwCdBTrDRjViX5Ifl3P8U3ckQYGUFmCYqUTGzMsEdIc
	M24yhtaulAzAmwpM03DLjEZQA/p9jbvCZDTigiw3uRIbPivJGOxufBCGtkoTzsjrZLe39Ld4djl
	j4MZlXGAitXP9gRPUc66DxbMgV3cjhLJK7UTZxbDnXhEOpT61eg27OyGlslgVTC17
X-Gm-Gg: AfdE7cmSUeIvFR8C3tyFcRJd9Bctca6DiSqWG1jE37FDsIwrv6Hb2vPMt16Nd7Z7U+R
	zGkiGZUnI1lXU36Zuv7MMFNMUhthBVbwYCBB1RbuVJa5f8zJTUCJr5At9bDTgf+WXOsoCSifnER
	YJk3+s6O9Ra90pTLDXHzzqtKDNE4CFoOcURhHFJZHJNye5T4I9j9dRpYX7721HjL9H/K3b40Q1/
	ehSrIvkTXi/0H1dJIEJ+WTbPCJ+4072zdFech6fXlZ6wv+hzD6OUOeDuVeUS+U7YLZH4KmtHbRZ
	IjI/UQZLQ8SwPtGitGSxFzHxIK71jq+DousDEizjvBLq9j3VWdP475BC67sAiy+X1GprK9m2Xdf
	AlrJ/x4Z4hXVPnGoyACEHdHV949xmEjt1twxzE7Z9ck6DMXqG1DNbkLSkgilPkQPVGof0nN/qlw
	KDOZOZpjGiJm8KtzCjZkGZ4wRr
X-Received: by 2002:a05:620a:4398:b0:915:de68:1802 with SMTP id af79cd13be357-92e9a48b911mr200515385a.41.1783121024793;
        Fri, 03 Jul 2026 16:23:44 -0700 (PDT)
X-Received: by 2002:a05:620a:4398:b0:915:de68:1802 with SMTP id af79cd13be357-92e9a48b911mr200512685a.41.1783121024441;
        Fri, 03 Jul 2026 16:23:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4ae36f16sm5168201fa.31.2026.07.03.16.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 16:23:42 -0700 (PDT)
Date: Sat, 4 Jul 2026 02:23:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Erikas Bitovtas <xerikasxx@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stefan Hansson <newbyte@postmarketos.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Vitalii Skorkin <nikroksm@mail.ru>
Subject: Re: [PATCH 2/3] firmware: qcom: tzmem: disable SHM bridge for SM7125
 platform
Message-ID: <mv66rmk4ckke62zpz7wjbbzrxfumsjmvf5bpfr4al6zy35tg4f@45iknynh6rcd>
References: <20260703-sm7125-samsung-v1-0-3e5f752048c1@gmail.com>
 <20260703-sm7125-samsung-v1-2-3e5f752048c1@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-sm7125-samsung-v1-2-3e5f752048c1@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIzNyBTYWx0ZWRfX89fUbuKwo/qc
 baKc2kzxRKH1cf0InjC9Iuong+y5TwbGIOvVjhtoiN+JAJBb6M9LK4fOLlwI5JBa/7Aq4QL+cEW
 8zIWR/o8+HGi5NKOZhGqqWdki4zihHo=
X-Proofpoint-ORIG-GUID: nmGpl-efybNMLzBpaEgGF1ZIemA4fspI
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a484481 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=RgBw9RmQAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=xxd52h_9Px5NHeBr2ZkA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: nmGpl-efybNMLzBpaEgGF1ZIemA4fspI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIzNyBTYWx0ZWRfX3MgFupQ/6glz
 AKCyPSy1vLkmPec+Hp7YZJkwhZdx5BdCQW6aoCSoBm79Rmg9TjPw/CFZw6GaRBjO8oaDmB6EUZl
 H2giT+6+9NDdpZ7aYkNY8gKtleVSGo3h8rDbwyTDNTojZ8BthCIz9BxJOPXnASbpct782ZaLpl0
 ZRl8jMpuFkrgOOJmzgxPpfMm96yAsgfS5t34TX4IycLIE5BW3ZZS/y2CY+WW+DcypAfrpqIKW3S
 ixhIw8s7XSs71fOmdywopddH9JYCi/2LLOnViAO3dBu6ADtv+1vR43TBBnLxfh7zbC4oPK1g9f+
 PiPokTqv72pezAtHfN1Ez3sJWToNXwA2jB+1VsP5tTOquO4GFwI9j4aZ7VrRyzV/h5nt5aEcgz8
 4Rofth8bRPs254OmSdoahkdo/QmXY+pTD5sqAXnxb2DNypJdjKaPkFJsrENgJv9Jtbnx4qmls4O
 HE9deRQ62cC2rVFFNvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030237

On Fri, Jul 03, 2026 at 10:59:39AM +0300, Erikas Bitovtas wrote:
> From: Vitalii Skorkin <nikroksm@mail.ru>
> 
> Currently SHM bridge causes RCU stalls when booting. Disable it for
> SM7125 until a fix is available.
> 
> Signed-off-by: Vitalii Skorkin <nikroksm@mail.ru>
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>  drivers/firmware/qcom/qcom_tzmem.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
