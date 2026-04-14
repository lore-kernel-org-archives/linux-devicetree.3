Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B042236F0
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 01:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776129722; cv=none; b=PCRsOHOMSxLnaB4qkEwUTpcnxh+Cv5QWjHiefEcHC0LcQRrL2rYkfEpdTSSZow/OnixP2wcMyWTxX76JqBacRjMc0/AQeFxQ92CZAy4Xb/BUgyPsdgb0sKG3nlrdLzBq1BUAvWfElZO9o6n7zSQ7Rmqp60qMBMBetD+gKts99QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776129722; c=relaxed/simple;
	bh=r3rYPLi70tuJoeiRujhGKOn0b2ylCb68vrqRMODmu2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JhH+u8o4JnwEQGIAH6H3JB+6LX/WlAKNIdSCptGUa7RJmF0joT/6eSmrhVYq5aN9F2h8GfPf9DiOWLQ8xYwnSjaxj0qp3PRY71nUy0xcI+pq/ss/4SOSitIdrkpunb+v+ruutN9InyPxLHJQ7YIdKBieZ69DQKIU7UtOx7DdEp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PyaN0o2R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MBEty+Ly; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PyaN0o2R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MBEty+Ly"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLDevG3681515
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 01:22:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=13j0lIg+3hXQ0BsIWq8S4CZg
	qftpQKo8hNJognO8YVM=; b=PyaN0o2RAxpg1GTVdj/uzS35I2rmsOCCp/08M2kE
	X/MHl+pt5qpz2RI/8e8jObMd01R1A+M5/yyLL+i6LNg3hwBv9zwmtjguO0cOjrQ9
	uQ5QQ3/FRF/qRLLzPKtDY3kkh1M/CK9k7lIYhTqJCO1EudBTXybvW/JDsfzEqNrs
	YRgyAq9Qbrii1cJuUlwsF5/67aWFytW4lBg+3GoDvkhPNxDNpEAnfaPN7TsibPq3
	UVdCz27urSuVVnwEmQyZzlQRgwLyVf1NtBUzztHyI6jsVQcHTdisRqHwmSDlxE8g
	CESQlp82e7T+diarfN3hYsoZmdP1X0XXotRvFLzBn/p/8g==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87d0gfd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 01:22:00 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1273dfdaf5dso4938057c88.0
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 18:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776129719; x=1776734519; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=13j0lIg+3hXQ0BsIWq8S4CZgqftpQKo8hNJognO8YVM=;
        b=MBEty+LygAWjsyActlic5tZw45MUwL6fVp4aOA1SouORS2bW2WSAr07oIUnSUQYV8y
         nuND//ubuBGlGG9FLdFQDy4zBiIoF/pKEHHmjkdskKJSA6ZI/ErIjaDsGASPnmbe11Lt
         0jLJmIMhdK8oTjv9tsKj1ngpGM/gyp3RS5bnZRn87XWz5U5Y8p34KxV+vyY0uUlanDsq
         ZnujxaFzJKFkiIyNKVwIHR2raL9Xj5fKoZZcr1X5fP0AaP09XpaGGDvtlBDyjMjgUcU8
         VYz7FpMzl4WCCJ2Ofd+S1PSjZ1hShEnga7RBAzSFjcpYQ0Ie/m5U1Q1XFHC5EsxOBVgx
         iAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776129719; x=1776734519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=13j0lIg+3hXQ0BsIWq8S4CZgqftpQKo8hNJognO8YVM=;
        b=onPO2cGhqHExzrFnOuGB36OTXJ815fqzXIO7MTY939NgvifUgxEB0LJY4RcCk/jglw
         g+ywDIozJ/L53HFBalLcXssN+0uQcA1Za8J2XfLA1gmMAwZoq7Q5cUMChJ2hEGWmcRTl
         fbVe4IVnl5U54i7fyVVOWfiYzVTF72pHC8s7Yb/+OmsXVib9hzfAjGtuuLfcybqIBuSg
         EFmDSb7Su2ZNYuQTLUwzZ9Vx18iDn3hf67m7atgQqX4FDBVl9npaKMBWxWkV3VZGFU78
         tKPErZAQAFdkkx+Vi9rp0+r9+irPrsipNJ8Uppu1DMPru8wQ5Ry6TqgL2YUggMmNne41
         pPCw==
X-Forwarded-Encrypted: i=1; AFNElJ8TGc6n9eCnn2c4T+3VZJLvLrw0PWXiiwFiLtqYjbX7DBjMI9N2+IZgXd7cird/FjRzW4WVV3ZRxA1j@vger.kernel.org
X-Gm-Message-State: AOJu0YyRUpWsuQKUaQPYAKRFBoxcuf6OIE3ntgFYqCbFqaflgii0AYTs
	J8BfYpK4VA56A2h/NlIudAwN5g07W6sYhBgDWORgky8IrfVPb9gCjaXefpK+6e1zhZg/99dmQ6W
	e0WVWepNDvNkbZh1ghnBDGOinmjQRflYJH7S+woii9FuNoXnlAzhMPgIF+34Kq65D
X-Gm-Gg: AeBDiettaHHvJP25mWPfjI+WT1RefAiQl/gJmsoCS1apd9lyqjCQy1W2OWMsfMapxqp
	g4+Z27T/wf15XQChZiZPjQwWBrLjjCpYKIFiJb2Ep5q6rBRmDoLm9FsfivIzqtR2tjguAXyGwGL
	+oCciKuM1nPVyTvQ1K39r8DPBdADsGN8ewiWFa6u9/IQsOA6PigIpWVMYAzwGQ5sVEHwSOyMkBV
	Lbc1zympgFJ9kQhxGXmbFFKfD0kWy51txCcbGasbZt7A04+8cBXKV2LyAbLmpoUiwZ4YAx4hZcu
	UWRY8wk7FWBtVF0spFnclgSMfRhvA6SRHJWC56rYYXZy3NRaTXEpLXYmy9iYXUvIn/bq+TH0a+J
	dAJ/a4/zsWCiCwfFPYZVVSWkGA+owOpYmmqe8DhWo9I7SY+9RoV+ymYtkpSjhQQMj
X-Received: by 2002:a05:7022:1298:b0:12c:41ec:8303 with SMTP id a92af1059eb24-12c41ec8574mr3122422c88.9.1776129719124;
        Mon, 13 Apr 2026 18:21:59 -0700 (PDT)
X-Received: by 2002:a05:7022:1298:b0:12c:41ec:8303 with SMTP id a92af1059eb24-12c41ec8574mr3122412c88.9.1776129718577;
        Mon, 13 Apr 2026 18:21:58 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c346eb162sm15588660c88.11.2026.04.13.18.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 18:21:58 -0700 (PDT)
Date: Tue, 14 Apr 2026 09:21:52 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: arm: cpus: Add compatible qcom,oryon-1-5
Message-ID: <ad2WsFuUjtcjZ1wU@QCOM-aGQu4IUr3Y>
References: <20260413091625.607976-1-shengchao.guo@oss.qualcomm.com>
 <20260413091625.607976-3-shengchao.guo@oss.qualcomm.com>
 <a1f8cdcb-fddb-43ca-adbd-07e36949eef2@kernel.org>
 <adzjYypJciYFLT6F@QCOM-aGQu4IUr3Y>
 <1c06bd0f-24ce-4ea2-a7a1-4c61827b4763@kernel.org>
 <adzrY4AijnKqXDrh@QCOM-aGQu4IUr3Y>
 <cc08a091-9f2d-48de-9284-2f0c68fd343a@kernel.org>
 <adz--4_2qAs7lkTu@QCOM-aGQu4IUr3Y>
 <d671229f-1c9f-470f-b1d1-7d015c0721e8@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d671229f-1c9f-470f-b1d1-7d015c0721e8@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDAxMCBTYWx0ZWRfX0OlLGsMNGHgF
 IttwYPJrGuQlIOwdl3V9WOcit0lbxd+W3BDQOuHln6yekxp87meTF1Z/+AxcahnqCyQwlfQOJ5k
 7jnYv9ZtoAdAxmHsbkBy+3mr550DpFQjtwFgOvtxFE/CsTgn/E9ZAvAMUCQv+gsm8tHBCZm+6O2
 F40B9RW7ipMsnK3yU9ylkI4z27hysGFDlfUOFY6baD/is6PSm0qXbLbcM8YQ2LJnO/YfH8hsuN7
 c60Q8g6yISdvcHAMcttHOhdIoeYas0manxgsH04M08Wzhjno17ZNKrJgBFOo1G8j8OMEKLjlocr
 L+3r7UX9WStFRhTMEQyZSG6IL5Gw9l1HA/69jn7UH62yTe90Kgd0+rk7xNOKeEPMmr24rx/iR9C
 /Gu732Q+ZHQgoivqDjeLbqxe6mtUTduepdSmfbon6ttixtcwkiBc2o+8Kf28f3huCk25Vi6kb/U
 TJoRT8qFBplpW818+1Q==
X-Authority-Analysis: v=2.4 cv=N+8Z0W9B c=1 sm=1 tr=0 ts=69dd96b8 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Veb1keqY2PKJT9AQ_SgA:9 a=CjuIK1q_8ugA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: CwbsMzsq7kcBB95OXtjAZRNoX0RPDTMT
X-Proofpoint-ORIG-GUID: CwbsMzsq7kcBB95OXtjAZRNoX0RPDTMT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140010

On Mon, Apr 13, 2026 at 06:08:49PM +0200, Krzysztof Kozlowski wrote:
> On 13/04/2026 16:34, Shawn Guo wrote:
> > In short, there will be Nord DTS using the binding coming, and I do not
> 
> Maybe there will, maybe there will not.
> 
> > think posting them at the same time should be a requirement.
> 
> Well, it is a requirement as I explained previously, said that
> *multiple* times on the mailing list, documented expectations in
> mentioned/linked email threads.

To be honest, I can only read the following from mentioned email
threads.

 - Binding and DTS should be organized in separate series per subsystem
 - DTS should reference binding series by a lore link

These are what I'm trying to do, and I'm not just posting DTS
simultaneously.  I do not really read the requirement of posting
binding and DTS using it simultaneously from the email threads.

Taking a step back, even if the requirement is mentioned in an email
thread like this one, I'm not sure it's the correct or well received
way to define a requirement.  And that might be why you had to keep
repeating yourself.

> It's also documented in submitting
> patches in DT (although not with that strong wording).

Either I'm blind or reading the wrong document.  I failed to find
the requirement of posting binding and DTS using it simultaneously
in Documentation/devicetree/bindings/submitting-patches.rst.  Could you
point it out explicitly?

Shawn
