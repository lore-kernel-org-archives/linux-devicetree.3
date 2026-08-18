Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8B53D9DC0
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 11:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787052751; cv=none; b=KGMztDklMgDFkL4m/EShEM1IOiHv5Km0gOA2Inwc6uZlm/HUTleaqI+LAA8vp3SW12yFZaSWAlVo+QIDWA4P3GogorQk90bR0RP0RKPdi9rvp3al5Vg++o0ZxpY6Htyv6DV7yPctdcHbTOItvZ5FMHUVm4K1E63xTgo5ESGe/5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787052751; c=relaxed/simple;
	bh=dTMkw80f1Tv+3rvx0Re1hQ7fMXnuWq60opG2/27MNlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cV9R3szFNhmg3VXkwWe5sTN/Dvzrfb0h3Q7wINlUCYf5uxGJpB1urYxP83uzCILdSKygF48e0RQtU401qUkHeBSymobOnBhQM6Q/W8HtsvOdm+3VE7s2C85YivOGug7swrSBWcL7Luw0fJ3jSOCxja5vBqkDpYJcuAN4VjRJPDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=STh3g4Is; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S9qon6HE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="STh3g4Is";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S9qon6HE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABZ9h3979096
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 11:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1j9tERMxb8x/UilY9s2W+k0K
	iXo8GD+EWlKCA/SvldM=; b=STh3g4Isn6yZtfBha9i/CeCkzH7V3UkCCuU4IaJR
	jjjRE+m4iB0DIx5tLkwDmCaWl6IwFJ7So+E3bZ7xJ3azHsn0SmrW+zRYHusbIrNn
	RtxNZNNwJnq1KNJiwsYpByqIwh7SYQ65Kf7g6TS+D8f5uJ+fvkHjYVkXE7/5VpKv
	g7kogyXB148Pc1VPs4nA7vZQ9tngVtbNM9wQu4DZGmsSH1SahPp1yfi0AOfigax2
	57vY9qvNYXgh5H7TuOZjkqc9saXKRKmmBqSSPwET+lDJzPZIZiOosC4XHxP7afvH
	hm3+6878NVx/P8pdFm8kXeMe/xVpUtPVmfCIjL6y9omK4A==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4ebpt70p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 11:32:28 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81bee860fb7so152261707b3.3
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 04:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787052748; x=1787657548; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1j9tERMxb8x/UilY9s2W+k0KiXo8GD+EWlKCA/SvldM=;
        b=S9qon6HELu8KIarJdbeI8Uy1OcZIvbCrw9fHbbr7AVXZb+l2PT1jku+B8Xk4AN5Xbd
         b65zXkhob9NKzlcu9wgikgRNP1ZikUiNz+/SMEOB+xIBNLm4TaU7R43QafCsiqv9k2rK
         GOonbw95Rf9jfoKf20W1jN9Jqx4n/wOYyvUx0bxe+P/Xsju7DgJIFwy+ssf6a8/7faJA
         WMABHfNpX6337vnMzJDf8cnAQ1mdTcuSJC3LtN80RAzMgWXqEMtDyKCZ1wMfcZ6yKF0l
         8K2CBsRPbLZxKSqnN2JKPslKYivdWBk7gfMFd3RaVNJB7BgPIPWOf1cstNgwgn6/1JzI
         hudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787052748; x=1787657548;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1j9tERMxb8x/UilY9s2W+k0KiXo8GD+EWlKCA/SvldM=;
        b=f/IW/mg2PboycjPEMZggc5A5jg1n7iu3x5yXGjwXy90rdDe9B1Kr0DPvdjHerAvHKP
         fdxGzgH+GgMfDgScDc0XZEtHpP70rkSZKgpBnQwu1dF0HDvpFbH71Prn9ph8zyR/F4b1
         jYRIbMTOV2WBQQVHgEhp1xd3RuRkIWOTzA9MaoQJIGAAkysoJUwmlsvD8v4zmK96evkc
         e4CJEsTdjs55F/1CmjK8cFAnE6LCG0rNo81fSvP3pnelYiLOervUWGKm4rwa3z9b7EES
         VOVzzSpChzwsn5V0X1BC2j9GKjbLNwGCHKTm+hXNpD41WEaVy7vsO/1M+kqI/2fStjNZ
         h2Aw==
X-Forwarded-Encrypted: i=1; AHgh+Rrahf02KwbvUdQQoKlYkQHOOts8ru8SeSi3lmJ3cR4V4gFjLQTZibY4pzmHpZ23J5p07ajbnW+ZhPwj@vger.kernel.org
X-Gm-Message-State: AOJu0YzPJ+RXVl22QLPj4AwhRe1ixst79nj8v6bVMBjNTXW3s5h2V8C+
	1FXjXuOEpZNuhqWceOpgtSG3SkJZA7luF2H13oU0PVELqewVOisWuk7utZEm5g4oHRmcY+AMqVg
	eTNmrCBGbxpN9lfi9LDQK0coBEulLqJagqW37wtPEKPsrVC9KgzmBIY3RaDjUhrmcWTdzSs8+Tz
	kDQQ==
X-Gm-Gg: AR+sD11tWQRpiFes5SVUysuuIkyox6ZFJ7XFvFGV9QMsuUoWN2xf7tGiCd6OicTUzRP
	k4n1NSF3XCKUnjJbdjl2PEur395DOnxDrkqD4bC0VfxMNR17bFZlF3AG/rhGiNfX9Xjed8z3M4F
	tJcFCjH07ZQ1x8cXEyMKkFtNZ0SzDkk4FNr4FzeGO9yHWYB9h7lFqzkmFN7EK1jSRnd/jmXKCcG
	cOffe8KNWex0g4a4XpRn5Q8XDch2GfoFTcew3NjxEySL0rtQ+WF4ODih6vgbROAaj4E+ykZ9ZUw
	2PRaRYeogNvjdOQlCfT0vRmFsmv69LQ0JNGXm4MjUE2NBntbCcORohrO/tP8PhTrEnIGdz3TyGW
	A/JxiNSCjiFgiGtjTlLcpvrLcS1BF6b9MrlBQv8cJraGvhGjCLb5dW8ZnRi/PUpaSVmLt0QGiDw
	53FTYaxyYohV3k
X-Received: by 2002:a05:690c:23c5:b0:81f:64cf:2c58 with SMTP id 00721157ae682-8370cc30b11mr119948557b3.6.1787052748319;
        Tue, 18 Aug 2026 04:32:28 -0700 (PDT)
X-Received: by 2002:a05:620a:6018:b0:936:576e:227b with SMTP id af79cd13be357-936d234d896mr3499939285a.24.1787052350642;
        Tue, 18 Aug 2026 04:25:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a16b1f1852sm11079811fa.38.2026.08.18.04.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 04:25:49 -0700 (PDT)
Date: Tue, 18 Aug 2026 14:25:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        konradybcio@kernel.org, tglx@kernel.org, ulfh@kernel.org,
        bmasney@redhat.com, lpieralisi@kernel.org, quic_tdas@quicinc.com,
        danila@mainlining.org, davidwronek@gmail.com, robimarko@gmail.com,
        linux@gurudas.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.vger.kernel.org
Subject: Re: [PATCH 01/12] dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
Message-ID: <xh445x6lbr73cx4xxn4dkminza4bp2i5dibagq476yidfwy7wm@hjt2edzhkbz7>
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
 <20260818080754.4362-2-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818080754.4362-2-sreeshankar0910@gmail.com>
X-Proofpoint-GUID: umKmwqLEsRISv_5ttBs13Vqg7zysD9Dv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA4NSBTYWx0ZWRfX/F0BUS973GaE
 G3U/xGju9sB/HUrPx1DxgOSiYB8Y3mzLc5UemQT0JQWfe5KksKobDUNY2h0RiQ4qEmpJoWmZm6b
 qcovRYHLhQNKyPMXaIEiiNZD9qHpbSA5+ua9YpNGQCNgLfIdMOw3yCBYDzgvbivzeZhM8KDHbO0
 MUt04naNc18C1NukvojcV3Ywtgzs/COBq9EAgoqWTBX6jxP6cNicw3cALaEzZz6OW291ldr6WMW
 YPye0W9U86xeK9WuaXnFX5pNe5qbpZeGlE4s2GeToehx6CJRsCel7cJPIttfBfpiXllrmSnBgtS
 FL1fvCSd7I6IwQCiVbY8zQspfC5jwirGld9Xe9h8trVD3trXjNCAv46fkmMe2uATiUAskuVQZgg
 e0+KEcCLpXHNpB+ii5yLxCVibmsl4OJFQSx7w05AIiuKcn/ocBvFS8QtuFK+WVaOWqXoJhvFnWU
 ctEpTpr5deMsjvQ2mfQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA4NSBTYWx0ZWRfX0LBUl5rftB6V
 ipzxY/jx1pz5hIwAOW6x8zvrzhmYxSHgzbVRgyfTM8gpC3Ug+c+3MI2aig6zK84lgsod4IsNexs
 Hdrx9EZcDXlB05jAuwPTAKKVEWyoSPI=
X-Authority-Analysis: v=2.4 cv=FsU1OWrq c=1 sm=1 tr=0 ts=6a8442cc cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=PtJjGYLjQKqNYAnhcSgA:9 a=CjuIK1q_8ugA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-ORIG-GUID: umKmwqLEsRISv_5ttBs13Vqg7zysD9Dv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180085

On Tue, Aug 18, 2026 at 08:07:43AM +0000, Sreeshankar K wrote:
> Add the ID for the Qualcomm SM7250 SoC.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> ---
>  include/dt-bindings/arm/qcom,ids.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
