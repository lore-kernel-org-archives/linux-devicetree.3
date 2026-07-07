Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213FD25CC57
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 08:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783413984; cv=none; b=WO43acAT2hfk0Oxvw8EZXSccCk/9oq4Iaw6ZCyeTBgBkOTmN8HbMFeALYz59QfOOcdaQmod1qkfmP4NyFtMmxCgx5tYSnPXc5aM7aMzjOTBrT20mF1irVPY8n9WWaG1ZXmg6fHK3uLbPK7Vu8GbDs6tSrOI1qxyt6wBbfPAk6gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783413984; c=relaxed/simple;
	bh=bo4/wCTEDBoLszco8H2NWkjSXPYk2AxUnpKUQ1Gp0J4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sC4aXTWE567xzZ9bIL0v+Tn+wrwFcwkdl+hZOFtV8b/E6bCG6hu5Bdcguetam3H5tyLPKETyP+XXM4n4gqDFygfIugvtXKWCBMnebU0Qtd+WhnF7A2ToSsvLn6fSjBIr96QTE8Dr34y2v4LExNo0EslJkmyZLoJ7RK7/5hKEtkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TkJ2Gry9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xyi0n2nh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TkJ2Gry9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xyi0n2nh"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678E5ZA3004604
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 08:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PwC0y/t4PA5BTm75kzF4PtT2
	bwZ/6+nW2XeYw/+I+xc=; b=TkJ2Gry9andR9MXSQ+z+BedC4eDQJUHGEM4cpmXi
	2m0fAkY0dg3SrGDYT95ft9iL3xdoirGK4syJT2FbAICNe7gWMJQB2qH8E+vxle1A
	ijakzvrycnyJlIJV3NPZRl7Ffe8reYtsDLNKDN00JHmg5loEv70UqfAXV+YMucHV
	0K0nT9nUL3/s+U4b8LoOua6APuh3QiBGe+fVFWgr4rnx+7O9NPXIET+n45ZRcfC6
	NaNH8irXcvnthCYPR8ZOaX6z8U0l57VW1WqrEWIHYFcRaHrscHpKC9yoXOnNHp2X
	gBnj37LTGesR7R+kNdc/fsnIYwVFmBkIlxvOcMWprbhOYw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8su71208-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 08:46:22 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3812b0c6f23so4089271a91.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 01:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783413982; x=1784018782; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PwC0y/t4PA5BTm75kzF4PtT2bwZ/6+nW2XeYw/+I+xc=;
        b=Xyi0n2nhOBvhVnsyIgDb5wT2k/2SiPtslT0wFlYbF90woGrqXy7MNG4Y8EjkrfC+nK
         vhPC1nbUoPtJsGlo07B0ZEcojKy+xcOa6sfKVBWm4WVln9U/gqnKwxUIVPpuEZ6ycdx/
         nM5Yaj5XJE9QZSCmXKsxs21H4Oz9arqeDIkeJG+OzoyjqpbSMiO8Gf9gitPv6YdQzjgA
         RoFpGr/SQV8YtIv6L79Q6AUgPWLmikUph77JHh1C2gE+pOUDsCtJG/rr1yyvNRFEamGt
         CFmXmXL6c30zae6Fvkt/agYf8zKF6wVhi58SRzLW+Cycl9dsdKaN42Aie/CKlY65CZ1m
         qNwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783413982; x=1784018782;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PwC0y/t4PA5BTm75kzF4PtT2bwZ/6+nW2XeYw/+I+xc=;
        b=ZOjTEGMyQ+gLxVSrAcJQqWEjSWeXeZ4zkvR14MS5oyGZ4EkoCwT/j5CLTx0m9cH+An
         HN4eR7Pq9iQq2PcossTAZiBm7VOfQiVigKIqjjfgkoCr4Xj53DyqeLY2IHwcRE9RRIEU
         TDQvOGgjOmg+qlhT0afg0zhbtG/kg/m/+n/5agI4iXB/J5REvVi/2Jzh2DLJ3PQRSZ2c
         QH0XMeA53/RSUGBpoKv2aRbx4MyyZs11AIijk+0D1GLLBP3/CgXSfyYslK1eTdnUOlfN
         Ls8wFSAsDm5riCh1c79nlBje0+Q8nhnaQljMi4Bz/s3oalFV2cdHGUbqOvybdqRwo1Xh
         ixJA==
X-Forwarded-Encrypted: i=1; AHgh+RpXm2ya2Q9dSl9LUtx4GYINUo7lhQqRjQ42pv79uwhPvSjJaKQsVMOK4nd51PviBEPnZw7r/3T/VfU3@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv5bLlF4RNq4qZz/HSnXgFO3/c3wgseDn9xD8/xg2iukmjOIp2
	ZxzZF0msA2oUVxLxSVNVYgecg53BWFEgrTPAMszYqb/oiqf3VGvJJCn7naW12Rb3j6YarQrnM9H
	OyEpCTwPDBeT1AHBm7chZfgdQRtPW7H9exBp0eGzcAOKg+3CMBSO/vOPi/CikyiY1q2Viq2b3
X-Gm-Gg: AfdE7cmnOvpH70S9gARVWmGpGROHd4uV6KaY4NZ7JMSnGdAWnK8mwWutN72G5FXtF3B
	HdK1NKqaGJKf76P+kgjSwPwt8kork1e4TAbcbyhRHyJMKl8EeW9sMBisM54pF+NvXrjAIbAeItl
	NqLfeG1o/9EwGKw/lV9gqLFnE2/uLucVRpaPl7srgDnkwqzVY0PZouRxQ9iGsKyMEPoVmglpwGX
	qS2NrlubekKJicFFS4cbGNSbLPCxk8jD7NmjcupRjQMTA8J9aa9aVKMT4LhWyuEeU14ot2mup+8
	2MILhW0Nlz5W4oQoDx18dRLM/vdtQTIvW/9qC0A5L5Zk5DpG/TBhjiSfGWNjKcimga5qkDbHL4m
	+9FlakU2jekvxSZYGd4wbX/9RrTuvE5kbMaknBC+pUiE1ecGRFafULvIJkFo6
X-Received: by 2002:a17:90b:3c01:b0:387:e0db:bc28 with SMTP id 98e67ed59e1d1-387e0dbbda0mr1639646a91.40.1783413981602;
        Tue, 07 Jul 2026 01:46:21 -0700 (PDT)
X-Received: by 2002:a17:90b:3c01:b0:387:e0db:bc28 with SMTP id 98e67ed59e1d1-387e0dbbda0mr1639626a91.40.1783413981095;
        Tue, 07 Jul 2026 01:46:21 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a5b26csm5823228eec.15.2026.07.07.01.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 01:46:20 -0700 (PDT)
Date: Tue, 7 Jul 2026 01:46:18 -0700
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: fix SoCCP memory mappings for
 Glymur
Message-ID: <aky82v5nWhamDRUO@hu-anancv-lv.qualcomm.com>
References: <20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com>
 <20260703-glymur-soccp-v4-2-b706c4c9b3e2@oss.qualcomm.com>
 <akraIZWuQlYvPW8v@baldur>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akraIZWuQlYvPW8v@baldur>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4NCBTYWx0ZWRfXxj2nlLkvURZV
 eB1OoZz1jtAx7MyuVZHSM2TurG5DOWKKNSoQe5CP+Tq2HMdSy2zJxU6VlGEBLDBRofIfQMVORtj
 MhTmMilLpe4fN8p8CBZZZIKuAe5aDAXejkCocmc+hXIiJdjgCk0w+ZLttsPUQOfHsK0H97itYme
 7FWG+Kuz6lidv5C//JP+fLTQFX2Vir5GjLa9UQqwCtpim5ZpHdnsmao7fWlCo2vp+O5Ad71GkLH
 OksTSf5z1UaoGrILaMvjqpzSRn9KYMX9TfwiVxANvcBIMOxGEVSR8vf/QPHgngD81S+VjY9oIbw
 jQBk5XmRMfLJ3C5ljcDjA18RXuPnn1ai7j9WWCvLQX9cjVyp0OhYY1WPyTVRLiYgRFg1tKBkoHo
 QmhLDqcOLHF2+nVf4Ek0ZXZNqQcDw3gyv0xa+Kj2JkRMjXlJg5An2OAH22uFZd6NmwDbAc36JMg
 2wvkKKlmB6vefQcD9jg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4NCBTYWx0ZWRfX+fma+FUpAFx2
 ybBUnAh4TE05YZRcaqQGeis5Y+TrVS1SnKNJ4+XWjl83BCPD7p+/sLbh/fKFKEbMxpzxKjGyN9v
 PL1hnUYXJepC4/jt23/0Vx1BkC5F4VY=
X-Proofpoint-GUID: gAgaeKuv8lKFV5jXjD_cF0tZk8Xx9d9W
X-Proofpoint-ORIG-GUID: gAgaeKuv8lKFV5jXjD_cF0tZk8Xx9d9W
X-Authority-Analysis: v=2.4 cv=HN7z0Itv c=1 sm=1 tr=0 ts=6a4cbcde cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=bfxUIGayu0eRWlMeD5MA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070084

Hi Bjorn,

On Sun, Jul 05, 2026 at 05:27:50PM -0500, Bjorn Andersson wrote:
> On Fri, Jul 03, 2026 at 05:31:12AM -0700, Ananthu C V wrote:
> > Fixup the SoCCP/SoCCP DTB memory regions to reflect the memory
> > region requirements of the SoCCP firmware, as described in the
> > Glymur v21 memory map release.
> 
> Please change your commit message to start with a problem description,
> not the action taken by the patch.

ACK, will update.

> > Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/glymur.dtsi | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > index 20b49af7298e..5f44f68efde2 100644
> > --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > @@ -602,13 +602,13 @@ spss_region_mem: spss@88a00000 {
> >  			no-map;
> >  		};
> >  
> > -		soccpdtb_mem: soccpdtb@892e0000 {
> > -			reg = <0x0 0x892e0000 0x0 0x20000>;
> > +		soccpdtb_mem: soccpdtb@89200000 {
> > +			reg = <0x0 0x89200000 0x0 0x20000>;
> >  			no-map;
> >  		};
> >  
> > -		soccp_mem: soccp@89300000 {
> > -			reg = <0x0 0x89300000 0x0 0x400000>;
> > +		soccp_mem: soccp@88e00000 {
> 
> Now the sort order is wrong.

This also will be fixed in the next revision.

> Regards,
> Bjorn

Once again, thanks for the reviews.

Best,
Ananthu
