Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A9D356755
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 03:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790565745; cv=none; b=CK/1GjolJoCD/castnu37Q8TKkvZ+eJWd5xiB9Kd6fT+iBmttcxdgz2y9g5kfV5Hi4QWQaOacn9DLPyYoirx+rgCjrDQ2GJ/EGYIXq5BQoG3p26nt8rDAWL/0vBu7y3dAX45Vh20URh5/E3YiJu5GLCxWRiRRPdBCXSDnOntqxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790565745; c=relaxed/simple;
	bh=6DfugGeQZU3WMliokpCdHjNrEpJWYiLdOWDMXeeHba8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ilywzh38qEuIhf9RinPAE3lEdD5eT9PAcziwknfGuPZXlnlRms4LGd4MOWKaY7WFltomjlHkQYqpmNTxSO/VLWYmFGx8UGIrW9KzIiYY4h+gBwF/nHi7QA1fW1WjW/8yga+i4q8LiL0f2hv7RZT6c870nqvY6FBjT45QUcFGvnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P5PO77Dq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HKbukNyr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P5PO77Dq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HKbukNyr"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S1XKoL300129
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 03:22:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tk2HxwKJ8qMHnyeP0NsV/+zb
	Od6grNaGyCvG1rUeuJY=; b=P5PO77DqhDHYDlg6CoHcL2jNPHYq2zP1tNANNFaH
	cUpqqD/2vAxhfPEYPfSpvqDMNc2+RVVxQvb68q5XlkJbq9+nKo5m46qAMn/edNuJ
	/yc2gZM+tX4i3as6Bh03L0kqNZHgABzjY15F0/r7cov7KbQGGYAgWhcFvizWyQio
	hypYtS2aZxafqsoRBK/7WaRpX3NBEOlrTX0wz+1KeefTJRFUrRN1bCuMxdBdrIuq
	Bk5FFVWFP7zlFtcASjCClMBtkrtEHwID/F04UyCpmgXO3JBXQCW/PRlfP59hT1Q2
	RW2k9TZ5a92l0lUSHnJsZPkd5FERlABY75zDarTuNrg5wA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx6e847je-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 03:22:23 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so392131eec.1
        for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 20:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790565742; x=1791170542; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tk2HxwKJ8qMHnyeP0NsV/+zbOd6grNaGyCvG1rUeuJY=;
        b=HKbukNyr7nUGjidpV/dwk5DVJy3XLrDaYRNvHyfjz4AwCr0dfc/FhyhJ3QXQdv87Pi
         26HgFxnOtzbDlDGUBdaapSZKb3BXDULOqLq8953m4KFuQ/SE3L3sWxP7mR9HHbey76XT
         G32VHc8il0RPb/ygprqiigMGkurfVgLG5vYUs+UBCcdjNOICNtw/OTxDy0hUO+wjRX+A
         1zlBkOp8Wa2/sKEBCTeM47LY+J9cE4oTiKCd6rbh1XpG3tgNI5Qw8Oqr+2Ov56Wxxaqe
         IqKNjmwNknS99xjbOWHvwAdf8mzdUrkapWbpinzzT1Nxpl/6LySUpSb31Md4cjPHJ/ak
         Omyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790565742; x=1791170542;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tk2HxwKJ8qMHnyeP0NsV/+zbOd6grNaGyCvG1rUeuJY=;
        b=vVwdPff+6wz8TtAfUeX7tuwg8jt0lbY+n0iu8DGTgO6tzqx7XDuGy2iK5ochJs1qFk
         uKD8JxIVguAgNCSHaA3xQ1jdqj1imE9vzjVKTIDefXbMqPHNRoJoF61sIl620iZwE68a
         fFYKAiFIMX3h5UfHxTYEx54Bv9Uz2z54/VdrTCkTFH9mM+HeKNMywdoBkepvFm4anB3g
         5YMPIfb4ftVjGt8adcSRcV73be7px0M4GiOMUui5PGt1/nfYaXrBJHPFCas4UyAYi7Rs
         RphxVyaYluLmprVcCWO7JDqMuqxuC0PzSvUHf/Qu83j+rQC+Q8CE/2FbIzAv7ZpvAVW5
         LeHQ==
X-Forwarded-Encrypted: i=1; AKwUvBwErTNmJBoUWgcPZE2I8aXNZ/oLih+1bTX78jd9ShXqsmWkNG/qqdrvGY3aFiT6wPedzqPTIOqevtVD@vger.kernel.org
X-Gm-Message-State: AFuF++mempy6PlPhlmFGiCiuiclNN5Gr5MWi5/COtJPalYQcs9B9XXWu
	gXvFpfBif/rbQrRTo9HK6GnsjVzMA891y2P0+eP9xESPC3QrYRBYpv5c6hOdEuM2SYAeAEJr2u2
	WK4rI9WFXyGCkH5y60Y8AX+igyj+NUDnll4I29PFaJeXi1/ArH0YVJzJqAAN2LIKd
X-Gm-Gg: AYBFou24krLaGSHnh65368ELT0oWTLcXOD3lPDRu3mUDRKCIXH4YgH8byyxUDi19sbg
	jvzekV0fHSPvtz9IVs+YqYikauNau3zjoYEzokTai/2FIb990XlrI6g3L0WVTqHJH6hFfdOsYmW
	p+DRak7IDJMA12WQHDpmYgm+P2IFZXAQim48ufI2y1yHre2DLhH4y0uteFx1Ex9fZsQE2XiIBYb
	krWs0zat+oY+OZP9N9KSNK0IzB3gn6SIbT1amR4sNLfBM93POzHqiYawqwhxF0UlyuPUYyTeyVt
	ACLuAwTAi1jQ+LcbcZzJcYX6kMcvM2tFXmS217yr2u773xCnFHsC6lr3vj8IUG0mTIbNjz+P10l
	lPVhJLCYDai9HW5MHsy/XJoad/AnatpfP/Df5Z/CjeQ==
X-Received: by 2002:a05:701b:2612:b0:148:4d6c:2016 with SMTP id a92af1059eb24-1484d6c2746mr4899596c88.24.1790565742197;
        Sun, 27 Sep 2026 20:22:22 -0700 (PDT)
X-Received: by 2002:a05:701b:2612:b0:148:4d6c:2016 with SMTP id a92af1059eb24-1484d6c2746mr4899569c88.24.1790565741678;
        Sun, 27 Sep 2026 20:22:21 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad8e43d2sm24943073c88.12.2026.09.27.20.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 20:22:21 -0700 (PDT)
Date: Mon, 28 Sep 2026 11:22:15 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] arm64: dts: qcom: nord: Add remoteproc and PMIC
 support
Message-ID: <arndZzMXODwRxf2c@QCOM-aGQu4IUr3Y>
References: <20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com>
 <arnVNhV3DYnvt8Qu@zenbook>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arnVNhV3DYnvt8Qu@zenbook>
X-Proofpoint-GUID: ASFn9WrFM-bp1Toe736VN1mrYhkT6C_x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAxMyBTYWx0ZWRfX0YgQMyk4s9rj
 ooFa7tzIBDBOYc6oB3tfHFCWxpHyShZ7p3hS/w2wi9gOuCfmfzV22N/vMQ3+IEMV1kyy/EgRX9f
 XBPLlsYW4v+J+iXcKoRZ9QnzhuRNyftS6a7i24ag1clC6/daYNSb290dg7mtE0AEbqXni0nM68j
 sAjEXMKIu/NAwYuG8zTZRoBi7s5ewO/XDFGrUQLD3ByQ1BYlhuBB5opTxLDxrKnzno5NaU+Kshy
 zehlFpPZsd5Pq4W3GUYQRRkYaqXYFTgT069DITzBh7tytjwe8Qy1Et4KT4J0/01wEPj+Kyxv4LO
 v4CEXWngRKDzMUPxSHZi9/jb7c4nRln2lCQFabRKXO+8t05lhPCB3mzuoYQKCvggUTJJLDXRfax
 wMWNn3KDpoR+lmxSmYJGCHPECxrF0amuKvLg0FweFj5f/ywhAtVEag7Dfk8tSbHanE+JR9BeTX7
 /kGsPGQObxdPiwmaezA==
X-Proofpoint-ORIG-GUID: ASFn9WrFM-bp1Toe736VN1mrYhkT6C_x
X-Authority-Analysis: v=2.4 cv=aIFlOr9m c=1 sm=1 tr=0 ts=6ab9dd6f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=SYfeJ31E7edhApbbmCIA:9
 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAxMyBTYWx0ZWRfXzIBMAiC8jyLZ
 /wYMW1USZoQYudHcvM2Q9OzGPmVHQU1XWNzRLCkO3xje0zpwE093O6ovU/QGfMif3rAXrUpUXZR
 s+5lvRJ03hugMaZ/kvkaBBQhEu695ps=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280013

On Sun, Sep 27, 2026 at 10:00:01PM -0500, Bjorn Andersson wrote:
> On Sun, Sep 20, 2026 at 04:49:14PM +0800, Shawn Guo wrote:
> > This series adds ADSP and CDSP remoteproc support, the SPMI PMIC arbiter
> > and the PMIC descriptions for the Qualcomm Nord platform, and adds the
> > initial device tree for the Nord Ride Embedded board.
> > 
> > Tested on next-20260916
> > 
> > Dependencies:
> > - NMXC define: commit e484a765f543 ("dt-bindings: power: qcom,rpmhpd: Add NMXC power domain index")
> >   from git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git dt
> 
> Is there an immutable branch or something? I would need this commit
> merged into my branch to merge any commits that uses the constant.

Yes, Ulf confirmed his "dt" is an immutable branch[1].

> 
> > - Base DTS: https://lore.kernel.org/all/20260903140617.441111-1-shengchao.guo@oss.qualcomm.com/
> 
> This is v14, I merged v15, now we're cooked!

This series works fine on top of v15. But I got your point, this series
was only tested on v14 when being posted. See below ...

> 
> > - PMAU0102 thermal: https://lore.kernel.org/all/20260830101025.191697-1-shengchao.guo@oss.qualcomm.com/
> > - PMM8654AU RTC: https://lore.kernel.org/all/20260904074541.590485-1-shengchao.guo@oss.qualcomm.com/
> 
> Please don't send patches that can't be merged and thereby sign me up
> for the manual work of clicking a bunch of link trying to figure out
> when - sometime in the future - your dependencies has trickled in.

I may have misunderstood our internal discussion. I thought it's fine
to post DTS changes with a "Dependencies" declaration, so that they can
be reviewed while waiting dependencies to be sorted out. And when it's
ready to be applied with all dependencies cleared, I will resend the
series by dropping the "Dependencies" declaration.

Shawn

[1] https://lore.kernel.org/all/CAPx+jO-q3JwY=i6P0K_r4OBie9bnPaR5kUm8+T8uGFq1oK9vFA@mail.gmail.com/
