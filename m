Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA37421885
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 12:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783598486; cv=none; b=PF3daxOAre1/GZbwGjZQDaYefbz8CXdvlihVHc23gGdujvz+jAUxQoh65GHesV18dP7PhtFmIhs9BLF1uvVLRBy37ia0Yhbm8LQuLG0K1peoOQAWlSlSvHobXrSxG+Vyxx03uQLOuUc7feeFdRQ7uJtrkGb8kwRJWLs3Dy3wLns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783598486; c=relaxed/simple;
	bh=dSRokIMG5FGCZ4G+yYBu/oIlzG/8dd+9MeEg+3C5DBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jVAPsYLS6GT25mvMmtBsaElAAPq/turjrYEBPsbt74pfWr+zqhZAfzRaqJw/Suzo0q0wMjsPjzDNY0rVNETyQBxlOw9PRGoeZhs/w7fDv0On+YXRdohJ3quTWYBqwwhVeCe+75WndUOTqUa+zE01pe21m8atWny97vwF56+FN64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dk0OYiTT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LbH6dWt9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dk0OYiTT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LbH6dWt9"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNBlZ1715982
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 12:01:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lSRAHUem76Xncoxq5BufxBYy
	3+SviaRcXkZ1QjWiysc=; b=Dk0OYiTTBBpY3gWGfrqEtNt4Xc3PNPcfwugHEUjy
	klD/ypb045J/c1uZs9YUjlVDNfGidVnOs0OQ8oRmRlXcijHfopZ1qSfOyaff2/VM
	WbnrnX+DRZnBb6NdGJxZr4bZ2E/TwKbe5Ma0Od6mCpILXnwEKpa60rarUBEfn9rw
	YGtKrGxujBfFVXLxbSkZtxj1OU45GQv7wrXNUNFexxBC9Dgt7gK7uCbse3W3F0vx
	qzJdRfQi7kIkHK72+CRp56wYgYhxvNfzD9AzyR245mZKEigjLplcGpWp+bOJE5D+
	SkpBw9LOtY/mNQu5JrR63Ey2WIApy2oo46+BO0EuRYVwzw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4vup1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 12:01:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3855a987c0aso2314353a91.3
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 05:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783598484; x=1784203284; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lSRAHUem76Xncoxq5BufxBYy3+SviaRcXkZ1QjWiysc=;
        b=LbH6dWt9+wlR3Acrk02BfqbHdM4yM6OBSZV1AzNPMFjcVKPDxpPwU2BSu1hozsjd0X
         VVGEmuy0RA4sFk2Bccie/+Oe1nOyBbHKZC0s9WreDa3/CCNTArnPSLRlZ3ESUxylAj5i
         WEIV0rA+hmHSALvdypNHts5XmcKsLlRvx63LN7vEHn6Ahq9627Q5HezVRWgfVoa6oKVR
         9WyIp87tgDR+Ydr7kIM2m/HvxgOo3+ZmtKDbFyX4k1Ug6hU+BEkpNQRcurD+RERj/zIr
         2QntrZElHAtWE2VcY+b1Gajd9SKMUC/YRTA8M4kN3CHODGvDG6QDvxNNoGvTJS2Kof/a
         OVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783598484; x=1784203284;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lSRAHUem76Xncoxq5BufxBYy3+SviaRcXkZ1QjWiysc=;
        b=RD3E4uAAv9osaUwndG0Z7/uV1wkOrysA44QWqp25FgEk9PpTA4orv4mQV1ZyiNXWOP
         9GAM40uTLHPk1c+wsL5rUsOl0Fai16Saud4hNPQuFy40UWWvNeASoOtcMdvgu0WIFmEx
         UmJcLF5UWbebjw4CLw10WU9Ptcf6CQmyQ6CONkVSF4R7dDS1GyPmwzQuC5ipaJEWmhEK
         DOvWx3vpY6rO88IAIFWhYklFgnGT4xKAWAeh1KTkxaa1V7ur9pR1KCIbI8GDaAwo8PIQ
         5xD0IqrxOlYahqudnFOOkVKMOtThJdkEwAGiP6qUgBw3uZWSluHPHdb6NEekwas3DVEs
         +l0A==
X-Forwarded-Encrypted: i=1; AHgh+RqFwblMI0Za43BODym5qCxPPJqkPvO4j1QaowTmH6OVXG9MgMLc7uDXO5jnrwjWfqh6OaYk1loxqU1K@vger.kernel.org
X-Gm-Message-State: AOJu0YxeUn2jAb+uz+AQy2ZpXl3kMcUBr18O2jpR+s3bOz4ac5yc5GWP
	WoMJXUSEL8C1+dRFamBD4gTf5PowYntHO8AfmekRrz0/HaeQIEBOrbk/BmkBq707gxL7jjRpNEv
	XlxNuNYFj6u8VvfiAMlQ0VE52uUseCwCov37VNQz9oN81CWdwVb/kjhtnFVIncMRL
X-Gm-Gg: AfdE7cmki2qYG7g39G5ZvvO+HMTNGeAIuaCKiCzYCnHPcFosFsfJmxgdksWdkWTbbzk
	dF1BIwX/NwnX/+aovWyivZml3Gr5yRexmI0YseSaS5UvtLFNfm5g2VWiM0XDC3UgX2q90uup1Nk
	/HiPvs3OxYSHZ3+/2GVUihiAt7n7GR+xzQkCf5hFkZijxKJd/vaT73jSjEboTD5+GhDBsqRKczG
	vN8gNz9rGNQJChYBVDNHUOfXdRNpAHM1HWrLEW7c52FXf9SjHWE3/I1FFSTNDo48l+EG+hB0nuQ
	3kmR2TffzF2xz2Nc6pq4WWJ5KgVLotCV/clIN5UuiMPDt6zkx47SvXPourl0sj5b2BIoBQU7NCj
	OvrX4TBv1Jx0/GFNUUfIvCOLIZfvAz+qZFy+eb2wyRrTzTOB0YJOltd0evmPT
X-Received: by 2002:a17:90b:4cce:b0:37f:9ce0:af32 with SMTP id 98e67ed59e1d1-389421ac479mr7391612a91.29.1783598483676;
        Thu, 09 Jul 2026 05:01:23 -0700 (PDT)
X-Received: by 2002:a17:90b:4cce:b0:37f:9ce0:af32 with SMTP id 98e67ed59e1d1-389421ac479mr7391549a91.29.1783598483101;
        Thu, 09 Jul 2026 05:01:23 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a583bcsm34921181eec.19.2026.07.09.05.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:01:22 -0700 (PDT)
Date: Thu, 9 Jul 2026 05:01:20 -0700
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: fix SoCCP memory mappings for
 Glymur
Message-ID: <ak-NkIoAuiZ_8q9u@hu-anancv-lv.qualcomm.com>
References: <20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com>
 <20260707-glymur-soccp-v5-2-053993f0c6fe@oss.qualcomm.com>
 <20260709071407.hd2etfpud5dq44yd@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709071407.hd2etfpud5dq44yd@hu-mojha-hyd.qualcomm.com>
X-Proofpoint-GUID: vztWt0f5-VnVF2uzseQyBVElskbyLS_f
X-Proofpoint-ORIG-GUID: vztWt0f5-VnVF2uzseQyBVElskbyLS_f
X-Authority-Analysis: v=2.4 cv=GIg41ONK c=1 sm=1 tr=0 ts=6a4f8d94 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=9Iu-izY7Zm1IiM7mkRwA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDExNSBTYWx0ZWRfX2IdtP5Prn8tN
 nVvfxPifB5YU5jUmuOOtKx/kR5sTyvcdf98gw1o0oY1eMyYl9fT/p6/c+7OjjDlJ/2FUgA3gPZH
 l9wIpP7qHOq9OnILYaezpKBT5zdf1QnmM14HHZ+25e92cHNNLPOgkCZLXU9xvxf7DGs40TBEvmI
 RJgVh+XJ4ZHWOFui4ZaLchSGyLcxhVyh6ooR2ZPCQMQJedrQQAN4MvxwnXM3q2yjSN6L8eIr5D5
 WKA6wTu2dZp1o90K1mOFRa3hGice8zQHFWyU4W5NMpcCyaDSJCYHzDtZ4c5cIS0XxZedNvDU8rK
 3hjVN87R4Xe1jmxEx7qCfz3mtIT8sP2okn6idFqEkQtQ9VIzr+dIjp10feHtWKhhu+8OlkbXjcK
 lgAAD/55zHL+AR4f+xqti3MhR9/KSAwvoCGHlkRR/xtc6gsubykXV3I5f3b5UrkUT5jPo/JzghZ
 unIQYDxwJDKBkzWG1nQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDExNSBTYWx0ZWRfXyzY0a0ZNZbuY
 vfYr6m353cNX/8xgiIMr74T2XtDWkc8F3fdAQCuca7WSJRZIOpLvZW449hvhkzsbwbIXT+GnA9g
 1l7KUY5Aq2dqTJzmtHh03nE/xHKnX8Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090115

Hi Mukesh,

On Thu, Jul 09, 2026 at 12:44:07PM +0530, Mukesh Ojha wrote:
> On Tue, Jul 07, 2026 at 03:12:45AM -0700, Ananthu C V wrote:
> > The currently listed SoCCP and SoCCP DTB reserved memory regions
> > don't align with the memory requested by the SoCCP Firmware. Fix
> > this by updating the SoCCP/SoCCP DTB memory regions to reflect the
> > memory region requirements of the SoCCP firmware, as described in
> > the Glymur v21 memory map release.
> > 
> > Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> 
> 
> It should have fixes tag ?

I did consider this, but since neither reserved regions had uesrs, I
thought this might not be applicable.

> > ---
> >  arch/arm64/boot/dts/qcom/glymur.dtsi | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > index 20b49af7298e..9ec7c256b80a 100644
> > --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > @@ -602,13 +602,13 @@ spss_region_mem: spss@88a00000 {
> >  			no-map;
> >  		};
> >  
> > -		soccpdtb_mem: soccpdtb@892e0000 {
> > -			reg = <0x0 0x892e0000 0x0 0x20000>;
> > +		soccp_mem: soccp@88e00000 {
> > +			reg = <0x0 0x88e00000 0x0 0x400000>;
> >  			no-map;
> >  		};
> >  
> > -		soccp_mem: soccp@89300000 {
> > -			reg = <0x0 0x89300000 0x0 0x400000>;
> > +		soccpdtb_mem: soccpdtb@89200000 {
> > +			reg = <0x0 0x89200000 0x0 0x20000>;
> >  			no-map;
> >  		};
> >  
> > 
> > -- 
> > 2.43.0
> > 
> 
> -- 
> -Mukesh Ojha

Best,
Ananthu
