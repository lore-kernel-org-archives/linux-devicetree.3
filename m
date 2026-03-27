Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74242374738
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 23:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774653299; cv=none; b=nYzZyfpuR4m2jE1CdS0ZOfvCEP38ITmTcVjpYj/WYCZbvkBloYPsLFgXbEm9m2h7i9wp/GBl8NkP7ar8b0x7r9+dcoMjI2zF+QvWO5Ugr9S44WQyDI8D2Rdpd2mK3ZDX88GAPULuPUQ62GLIQCZ0amFPobbJRXAoFzfZAv2lARY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774653299; c=relaxed/simple;
	bh=iHe8v475xr7luc+LXQVFWOWrtD7HGtTXZEZ7q2PA78g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jxWLDXLWzXrj5Vw/kH+Ki+Cumqtcq1APmKjHqmK3o3AoxmcX6+9wlTdzXbyJlcdjXL7+5eMAOCGFtrx/Bl8YWV859qmZvBYfp/VkMzTX9DigahQmg+X8PxE1CT5qzekmUB3S6jwkQu8yDJJT4G1CiFdR3GNjtyqe6ezshXvqN6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CcTmmcRL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=grH314li; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CcTmmcRL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="grH314li"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RN3ntZ3772153
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 23:14:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fHD5ujHWESj6xyF9/eDmdlBf
	LsYSouT6WT2WwKD2714=; b=CcTmmcRLBwl0hnT7cAwxB3mBe/HOaNrnYRG2Hs97
	/BR2pTBGmSNPnbX15eUoLVxVO76aqfXGDroIsUjaZgkt5t4Tjx1RftDSvvwQPIMd
	JWaygR5ABjl8F/Wd0B2B0DpU4LWXijx2GCBEIoQqb/6z9YA8XXI3ZAS67MrUCbGi
	emnb7ShT8sm7vDIngIoALWLB7i3323k2k+TX6XvUsoZskYfh6LHHCFilPZ7Eyu9b
	fBouxeRDGcJKmvHCsgTZLe6pkH6OArSg5F8tX/+FZiJ+/EHXGP6Zm5uhBVIFWF+O
	kqZCEr5lK4NbMp4yw3qYbHrKZDv+nZkA8872nHC3KCYiDg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d60fkrep1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 23:14:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50939597b85so61011621cf.2
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 16:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774653297; x=1775258097; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fHD5ujHWESj6xyF9/eDmdlBfLsYSouT6WT2WwKD2714=;
        b=grH314liBCB6M+PxgZglXkLOnVau05TVhaWoFrT2wrWo3lcsopTEE0nmztYFXdVPr2
         vHNmDf/xGuvYKjbLlTdPIOwpvYIFCJm6em6b1TyvWSUFo4saqzgIhRxkMCEQ1KhxBME9
         toQG+Z2IbcE3ju7WHTytOE+dWnkCagiDD4K9Wg0x48jjeItWXu19hqmj8700SBGknrD+
         c8COvJMunf1dY/Xo7AEndjS78cniHwqu7VMBDGc6rEq3dRUsKngKA6aAcGZp/npQ/FIE
         6lsQgw2vINwIiccE0wKDW2JeZP3ObhOeSO1uVZcuD8yZrP1UJadA6NYEWBd2f1u8uPP9
         c/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774653297; x=1775258097;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fHD5ujHWESj6xyF9/eDmdlBfLsYSouT6WT2WwKD2714=;
        b=RxgsdOZwI02HA8KFKYJtkVmOQBq3eWhOtLBf0Dnc/y+KM/2nhyN90uYw56F+pzZFY0
         ceAe25VsbBpUcMasNAH6dDvfqTCO9sNshBVIatvvux97yk4Ca5eQ2A5AGbM99S1OB8eL
         h7ShNgxRHXKcmnJqYuWosTqVCG5F89ITVH2WTB6T2Rrbs2YreQqlvue5tt5R2sSjEIFc
         Q2iLm2Cgq9CyYnk3HZ44B4Hj4L79cbS/tPSnM9F7EBQz1Fb44bw7LtzsjVrsZII2EJN+
         0RAnlxVjERP/6JkqJ5uYZ/4Fv5MXC4U+653njVmOxOYf7+8iVb1E7y1/gVcxWigExglY
         EuSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQg1St/ND95eh0Do0Y9HK0/uPiqFjwVvGLjjKUi62lCNiqePAVpXh0Ymow3o7OQMW/OIOhZWw5HylL@vger.kernel.org
X-Gm-Message-State: AOJu0YzgieRqeLppzhr6uuGxRLjHRNXzUAMulnpJg7Ss2SVvgrsscI5Q
	CkDzEzpKp18IpxKCol+UK7IG6oXfdp0TkIGdYJEwIH8tL7iWsaBCpHm8SYrBJzb0eD9cZ08DL1V
	hNnaq49M8mqqo91jDN4fAQDRVv4wiWUf6QRuIffwSWYlO6PGtAWWkn7VYmd8H3hlX
X-Gm-Gg: ATEYQzyxJyhQOSSlloAC2JOixNoYOxaF7KfVy470iAAs++HKec8IMfe7MnSJKFJSgxl
	5eWyq9xC56W1ZNrjB1nLd3cn+XIn8q3Ehga8NgTaP0kfDX0mTImC+8V6NzE/Zxmk5Sk6bRCM35L
	92DFWVTaO4vmn0zpej8iTzXr92xdlwdeXNUkR66m4CMyXiqcBuaBFH0kw8q/9Je49UE7F303M0z
	4UGl7gGHAefR1ev4u/iQXCp0sLarDUuWbtB0efBhS8zABp07xnykcrUD1hGeMMMens4tHhAjw0U
	qbs9CoQToFdvjX2xyjDKcu1pFF+1Cmt97e8B3Qi4OPpW1BiMQfG1yiwQgAGA/HPrwQaH/wyDBvB
	yrtXdW0yowtPzYshfSK7J7KypjnYQxamH8Hb/EbmFQTMSvllzFWapp5ZWE1IOUa3Qv5t/5UqWdK
	0QQFgJileKgHaXbnk5XvwM8W9LBzz0LgaS7Vk=
X-Received: by 2002:ac8:7d8f:0:b0:509:1ee2:69e4 with SMTP id d75a77b69052e-50ba380a5e9mr61183161cf.11.1774653296755;
        Fri, 27 Mar 2026 16:14:56 -0700 (PDT)
X-Received: by 2002:ac8:7d8f:0:b0:509:1ee2:69e4 with SMTP id d75a77b69052e-50ba380a5e9mr61182911cf.11.1774653296305;
        Fri, 27 Mar 2026 16:14:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c838931b9sm1321751fa.23.2026.03.27.16.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 16:14:55 -0700 (PDT)
Date: Sat, 28 Mar 2026 01:14:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: milos: Add missing CX power domain
 to GCC
Message-ID: <k5ny6nlsv7anpphujat4yypd56tgm2afz4wvonwpbtdn6fn7yw@u43opve6auny>
References: <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-0-f14a22c73fe9@oss.qualcomm.com>
 <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-2-f14a22c73fe9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-2-f14a22c73fe9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=U8CfzOru c=1 sm=1 tr=0 ts=69c70f71 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=hvCAL5AnRklPZhNa95gA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: lYnN9FELXYSqpRetoD04dFkxqdgk_sYK
X-Proofpoint-ORIG-GUID: lYnN9FELXYSqpRetoD04dFkxqdgk_sYK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE2MyBTYWx0ZWRfX6nhnk0jUtgVI
 Qo8SUPwgGUxldQh3n4JUHG0Yry+gtnyiB8P2VzJtTAYfbVopX1jcMfGe/oDZ8+CgRT3NTGZVYDJ
 HxNEmwkflEoiQs7SjhJ9TYivUz7+S8GahmNx65dvhbi1ysupm52eqi0EC11+ltEkC0XJI8OwqGS
 1e2IxF9qNauizcpq4t2NwTadcp6YJBL/Rh8MqhWXfkel0Phim0/9GEPHYYuQtLFKxdiZ7EX4sUk
 iXGJx2xwvDk4SD6gAuSnEh4wYd+ICcGQXK4+wtisqOw7CNV5kbq2MznvM5elKRZUpY3UnALbR3c
 MsX8uJh1+r551WjZGS2DBdVlibGvtrPynO+ICRDI0OUj04jHW41HxhcAsy3CogkhszOAfY7aDUZ
 wK7bgzbPHz29u/Ar3HFZkEzDCaBeVWTD0ul1F3aBeOj4iEnwHskxjw5bMPtR8bvDnSQHhUzniep
 6znIxnE7QSMROfnu7lQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270163

On Fri, Mar 27, 2026 at 02:13:41PM +0200, Abel Vesa wrote:
> Unless CX is declared as the power-domain of GCC, votes (power and
> performance) on the GDSCs it provides will not propagate to the CX,
> which might result in under-voltage conditions.
> 
> Add the missing power-domains property to associate GCC with RPMHPD_CX.
> 
> Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
