Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE09725F7A5
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 01:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778550355; cv=none; b=fxx6IXtj2hG046C2e+ZWHBe50NYAsmr79NMnUf31ao542UxFGDgb+F5OkTLUpsDT55i360/5+0fI8O3ugf+sSgYb+9J8vYykaDJGhRR/+9CGQhn5NWySsnY4UmmPgrbuTBuomA/P+duWQuKGn/dyMPD3RAQYoBow1/FcAA6r19I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778550355; c=relaxed/simple;
	bh=EGwYs3uxWmiuX2P9hc3JzoakE+4VNaxiFov98bezDWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YZFlbjfxqJlwOqw4jio5gUYPAPEK2wkR6wNgTQxdI9dbvacE/kLU/dFkXzQWi6Nsgl9gaPWFQJsCGG1DRQJY8Jh3qvaoJ1Ksk+Tu+6UrukwVEIJ5rgQJsKKAj2lgKFjAsW5TQ77JKaw7uKDdsZdSNzqhJ2hec5hdp1g3afTT87I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hbZH52Ol; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZHUa9HgZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hbZH52Ol";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZHUa9HgZ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6Tw82186405
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 01:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=86CLsY4gsC4LyAhbA+uNVsUq
	sZIwxx30YjSMLBlvqCs=; b=hbZH52Ol8D1g5FUsxLbw+rXfPV8p9gFHn4/8W1iL
	IjSJKWtNw2Z7FMc2UJgIgCz8e3RSbl4FvlIbZOP6sADL/u7gUp4DuckgOuos5jL9
	PbgHhGfxY24Wg0EmpDVd4O85Mf1Vd9vmcpWco7mr/HeJtntSUnhGhDfSsVDNzScS
	kP5+qzpFJekTcVb3O8ZbrMbfcxEOQjiSr8SyFuOURab6LNy/kwHNsNsOpvE89owN
	D+PRGKR/afaOTzDunUZzGo22BqFYzUzP+L1hhAtbIUahxCpu1QPAHxhZexwYBNoN
	qt40RmhUvmYNYHkfYwMgk5d8teV79+4Dz9GKDzqtvW5I/A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0rx5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 01:45:53 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ba8013a9e3so8024641eec.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 18:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778550352; x=1779155152; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=86CLsY4gsC4LyAhbA+uNVsUqsZIwxx30YjSMLBlvqCs=;
        b=ZHUa9HgZLgvicMGYjlCY6cRC3XtIIAFZAEpc1e6LXpFgJJZ6wf9de3bH25+VK6rcgp
         7r68/xOHEGDYtWo05ldwkUbRIvjbz8XetB92ROe/oWPmmv5CFwxGbaw+6uozkeKAayeB
         nb8+nUkADJYYbKLOAmaN+qWzkCoHVRH7Q9e/tQirCGLvjbM1ymUF07wRyBBpGNm0fBd3
         OrEGlSuYXFTcGoOI7Xd9EFV/syZ9RlMhscFC8HnsZVNb9H8iwQCX0egPpao2bt9yKgpg
         3jnyy04Y0VrLJ17B3Pr/5lX6/WOXBWPdgEH8odVsRoEKPkKjfgv/aJkPFcqgRwsMDVAk
         v54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778550352; x=1779155152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=86CLsY4gsC4LyAhbA+uNVsUqsZIwxx30YjSMLBlvqCs=;
        b=EaoFd+qiywbFPj/u7YI1sS0mOwz1fCFcTrlluZCOw1FTP+h2WlZaL6jbj++/qZO77g
         vUcXcn0/IMiDDB/9LSMQ4Y0wq2ykZ0Bhs0ZrgAvpqHq+O07/ipqHirKBqKdo87parN4M
         /hknqy77hZhnlv86soSHgEpz2o5prnbHw/tSsCWpswm9XejBf61Khy7RoL1OR4GOCRcA
         C+nOUxM2b2+N2Ii7BypQ6zK5ysnkrnw7fVKpbcSSoJ6Ho4QwYvuTap/k9PqOErtuFC9+
         1LwISHp1Y4vcT2OWtbXkYDeL9+4SXXg+kcln8ZJir/jkMqv00I/x+EdQsccXmSPOIOvS
         4RHg==
X-Forwarded-Encrypted: i=1; AFNElJ9slkDPDH3SzudpZFl8GgTPqSwrl4cntOytu/PUsvCr853n8kx44BX4neNf4JojkL2QoUetSFfJYADy@vger.kernel.org
X-Gm-Message-State: AOJu0YwJkoqLuso0g6+lnADHKSIo0ESo26fXTlmmyUwlGy46wcH6+YHZ
	A2xil2G5Z1n0AZw1AU0I98tnSKt3BYgv6zRRc/9R1bobpIUBO+/QSx1MQ9jjMlCpbuntoudVGpk
	VETRqKTQ9CmjYlGWPr3XuHaXW3oE9EWpsBEoDHGa9BuT6XqiBxGeRqA3ohr+vmFnd
X-Gm-Gg: Acq92OG0E7G9sVNcSrqnmeLq6DcOUsvetQffk8welWB2hwequKXYcIEF1B17mVBaF7l
	MBY8/5/zYhUUQxVwn5tzXhtKfaFhTYF3rcWa1kpEdzYjgGzcnQ/dhhPqcozcc1H0SwnAn+3FIX+
	xvYwM+tlW8CbjhaKhZHwXiNVnLrpTPQW2GWpTcJWq8DwisPbKXk0hBWhAzItnEI++QTmszE7cUx
	Fe/vfabSwOofFEto/TAjzodOmRqwJEqD60IaEVwQVNaKsyXoNZnj2PoIxl9gwHlKv/T1dOTFUwe
	QgCHqZEeR6eooK5fiVKqGuaLXkZPyL7s0s1JiTLcL2aspVEgTUQY3U9szgDNUg07ApX0oY1QK3m
	wGKgjDJo0nE4pInMQvO5ZrwSPv214+znG6NMh1KOxRTouRL0YI1AHVL3pjnD8QVPg
X-Received: by 2002:a05:7301:3f16:b0:2d9:a799:3c4f with SMTP id 5a478bee46e88-2f54de847bdmr11298700eec.24.1778550352431;
        Mon, 11 May 2026 18:45:52 -0700 (PDT)
X-Received: by 2002:a05:7301:3f16:b0:2d9:a799:3c4f with SMTP id 5a478bee46e88-2f54de847bdmr11298673eec.24.1778550351792;
        Mon, 11 May 2026 18:45:51 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e4016asm15818678eec.28.2026.05.11.18.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 18:45:51 -0700 (PDT)
Date: Tue, 12 May 2026 09:45:45 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] arm64: dts: qcom: Add device tree for Nord SoC series
Message-ID: <agKGSaODUsI2Vj0A@QCOM-aGQu4IUr3Y>
References: <20260427023455.236410-1-shengchao.guo@oss.qualcomm.com>
 <20260427023455.236410-2-shengchao.guo@oss.qualcomm.com>
 <20260428-dangerous-garnet-collie-dacccf@quoll>
 <e1a84d37-04a1-4c36-b6c3-f8830df9a744@kernel.org>
 <afCxhUaxLEcbosvV@QCOM-aGQu4IUr3Y>
 <agJ-Qc71PloUM1pI@baldur>
 <agKBQ2rRtapoFlCE@QCOM-aGQu4IUr3Y>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agKBQ2rRtapoFlCE@QCOM-aGQu4IUr3Y>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDAxNSBTYWx0ZWRfX5tuj86x01GeG
 GrVOnf9ZjSKaltgjcx7RTrTXuHVRc0Jpzs7yVn20fAAD6fP0+TumIfi/DjIYj2xhKjiimD6rK9Q
 4Mv+X9arYXbAMeXhSwLPx6HhLhl1KiZikI14jhXP6NPTkld+syqsn4uOzTLhDc8W6N/P/N7FH/0
 oQvl+Po9MLFxA+Z/IHkKZeIdKBsY22QjqRNAEZe/La9gFFxIthlyHwSIwsLZEd9235W6TjOweMa
 fZdccTh8l2CKc9eChDIF96frXi91rgehHyJxJv3EjAdUISuNdczRGKROrsNAUZbOSR5UhIQKrF/
 z73PI35sbOWTEo4lvQrZGlw8zddG/7B/anXsP4yFhey2+vHDQZCmBCvwnD12AaNWx6THItb+IJz
 jxM21wmRUv9DijwvJ9cwoXXc6DfQ65DX9+Hz0c5S4kybX/Db1MTubqeJmNJIq9a940T0d1+Mc/A
 AvBjOotCk7Us8HazCjA==
X-Authority-Analysis: v=2.4 cv=bpB8wkai c=1 sm=1 tr=0 ts=6a028651 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_hPhRlXgVbPNB2WBm9QA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: F2ZzUsKjAtS86h1detFlhzlZ-C1BfxHY
X-Proofpoint-ORIG-GUID: F2ZzUsKjAtS86h1detFlhzlZ-C1BfxHY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120015

On Tue, May 12, 2026 at 09:24:19AM +0800, Shawn Guo wrote:
> On Mon, May 11, 2026 at 08:12:01PM -0500, Bjorn Andersson wrote:
> > On Tue, Apr 28, 2026 at 09:09:25PM +0800, Shawn Guo wrote:
> > > On Tue, Apr 28, 2026 at 09:28:47AM +0200, Krzysztof Kozlowski wrote:
> > > > On 28/04/2026 09:24, Krzysztof Kozlowski wrote:
> > > > > On Mon, Apr 27, 2026 at 10:34:52AM +0800, Shawn Guo wrote:
> > > ...
> > > > >> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
> > [..]
> > > > >> +			compatible = "qcom,oryon-1-5";
> > > > > 
> > > > > I asked you to send this binding WITH the user, because they go via
> > > > > the same tree. I see the user, but no binding for it in the patchset.
> > > > 
> > > > And few others like SCM are also missing. I am talking about this many
> > > > times already, to multiple vendors, and I am still surprised why people
> > > > on purpose give more work to the maintainer. Well, not my tree, so not
> > > > my work, but if you ever wonder why your patches are not applied for
> > > > longer time, that could be one of the reasons.
> > > 
> > > Yes, I should have sent all those bindings targeting Bjorn as part of
> > > this series to make it easier for Bjorn.  But I'm not sure cpus.yaml
> > > change is one of them, as I'm sending it to Rob.
> > > 
> > 
> > Not sure if you have settled this by now, but I can merge such binding
> > change together with the dts change.
> 
> Thank you for the offering, Bjorn!
> 
> I will include it into dts series if Rob hasn't picked it up when v2
> of dts is ready for posting.

I'm currently targeting PDC binding to Rob. Is that something you can
merge together with dts as well?

Shawn

[1] https://lore.kernel.org/all/20260504080703.825328-1-shengchao.guo@oss.qualcomm.com/
