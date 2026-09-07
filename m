Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A013745FFAC
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 10:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788777846; cv=none; b=U5QYJm3T3nJlfXtAKo55WqNh2J92dLMUsYeQQhYRnFi64TCa4/KXbQDoS1ouRJ5lZuZAvb1WbPZNFI+gwTcKYzyL0iFb32ZaOmzVnQYWLKj5kX/fFu4MqisahKME7qFSD6/DA1XtNoT7MVfO7r1mmkPdKpEd2Y4ko90IAC4w8Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788777846; c=relaxed/simple;
	bh=aHyQT7885+Ubcx9vuZlaQP4s+nOfTsfJSjKYZBHLk0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QLTnhFQZBE7BAqTiPsLJCamm0Vml1qjcwmiqcA7WSUtv+3edumD0VDjDvrRsxz179hdcxf3wTuMmtyLjPpORf3oi8DCRP93HAbazqR7eepW13qN4EqqbzJYQswWVoW6Vk9eO964Alre+uTK8TeaPjcqEXeLTZMQb+lH44RV/Plo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jyEDiM2n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BDu3KivE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jyEDiM2n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BDu3KivE"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879bXD6057365
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 10:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=r66zeNZE0qmZ3omHwDj+6n3Q
	SfEmIbTPv0IAPejLvkU=; b=jyEDiM2nm3hXYBcePtO4wBjfgDVYCwLLGmjJMP8U
	NK4BYcuNVfYoNtEdPlRAWVf4nGhDS/KzUHsvb49XlhnbkBtCPQLghkWzT3LhdV0T
	RM3nfwUJOKR2HsmguvQ4YgqsDnDiUMVBNUj6JHIMyKVARCOfLEUn5k3S+QM5EnyR
	HGij/cMCPYSRC+Tohauo7xPZgM8LIw3lHtp1H8nT5qzpqJ0+jZL/9cw6O7BxA7H0
	+mXNCkcb8PRqNburm5UucGpETqiTAub/71wzIWy5/Qzx24Y60B1zCsbjRDGeAN9p
	CGUCxv7xNSlqgFBb6fz5a1glOPR34Zeu7qm9EY2bp0xcNA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtdqgdv4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 10:44:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9393ac4961fso312258485a.2
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 03:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788777843; x=1789382643; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r66zeNZE0qmZ3omHwDj+6n3QSfEmIbTPv0IAPejLvkU=;
        b=BDu3KivEZ3AcasDXQ8WNjo2CMbd/x8GUfklszTYyoegDpK1z5fLzouR9YoD8xuxsHM
         mvOAUHTcV+sETbi5YL+73nIVxja7yf0PF52pZWbIJDu7dJM0a/TF9E5X+fkaK4UAdLdd
         R4k550fiitj3pJdZNBQg/NQJAn2mldL0tpculkW9jWVleegfuZEmyWCUasaUigw28PJU
         c6b3bM8zcRNrIvZIKHgGMbajCHmBc7RNyh9nj6+8wxH9eFmGqTs/n0MlGzqeRnTGcQMF
         DS9SS3Vd13FVS0o10DBW2kZgJzsk8YUkCqNiScxDM4S4AYShVaymO1HfEJdUmVZBzJDM
         JO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788777843; x=1789382643;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r66zeNZE0qmZ3omHwDj+6n3QSfEmIbTPv0IAPejLvkU=;
        b=NFchLLbrXFefDfaFTJZoxaZUZKvJpUS4zRA9WxLLAFwRjwPMg3pT4IyH0JttYkKx+g
         tW0ntLgeNuBIJVInyfJ/QvMO/PnuqGHxb9F8kYXAJJpx6BhiWj/rBuZu6FZjY3cW9B9Y
         LJeHHctDqq82weKx51tNXPogPG9aZ//V2NhVz/PuPsRstPPyL8woESD6SyOQC5yNAAqc
         QWEy0cWkZRebdiaDrq9iSvrUa5hqguMpOcTQoqYsgE+R8Epm0g+ftbovG+PyR0iddnqm
         9ViG0OKmCxpdn3Q3//SjSEwpHc6iyqV9ccSWbyM3Q2w2gKyQDpRrXa/F1BgDs1fpqZ6x
         nRHA==
X-Forwarded-Encrypted: i=1; AKwUvBxSAJnGDCKfoASXTGQIxhwXKynRaeJlLc89CR+so9HkpOSBQemUgdRMUuEzMAVYb4tH0kIFoA7+psig@vger.kernel.org
X-Gm-Message-State: AFuF++kdYOtZ1hh7giHo1yZmwbMOp6iRSJOeGpudgJIbfrIunaaEnN9y
	12y2Hk/7RfAkzHSs2y3cGlL0t35fJwdRdEkQ1bISCQLMDoMnO6uZOcCT1I1IYGltDh+c1E6LLOU
	zhg3NlGOQf5NZwh5Clcz0zzvT9VkJ4ZE90DBGXRmFelPiTnsXsLDh5iIoFZ8/B5xL
X-Gm-Gg: AYBFou3R0H6CXR9yZa5gbjH9rIYYAJk1Y2JhprSbXhZUxLGOophv0xMH9brtBe5CopE
	9H2kmEwh7N9EQO/eUpxoomA33gFiT/cH81QILjklv+sqS2rO00NGxvW+gqibm57DFCGCdpQV52h
	zBK37aX9UEC65JYzvCmgnEFT/w0unp+lTR0nKQK0Mi+KUq7euNFhScGDXSmIvoCFcB72yUPHCoN
	RV9QkkcRprbG6bx3cJYkxiy4hTxQXXgxxcdsZ1BNkySZHd5mXVd6bhiDolItc+y1+pjxPpy7xVc
	HWdp9/MAyM+vD8mqSLJXPUgM/NVsaP9kSD7QjTPIydDCyH6T4Vx+wFVkrrusOZHyjgu0Bb4QMTz
	hHyrT98FvePws1g==
X-Received: by 2002:a05:620a:370a:b0:939:15e:1a5 with SMTP id af79cd13be357-93980528e01mr2383689185a.35.1788777842610;
        Mon, 07 Sep 2026 03:44:02 -0700 (PDT)
X-Received: by 2002:a05:620a:370a:b0:939:15e:1a5 with SMTP id af79cd13be357-93980528e01mr2383685485a.35.1788777842080;
        Mon, 07 Sep 2026 03:44:02 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d0656e7bbsm199282865e9.10.2026.09.07.03.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:44:01 -0700 (PDT)
Date: Mon, 7 Sep 2026 13:43:59 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] clk: qcom: dprxcc: Add Nord DPRX clock controller
 support
Message-ID: <kg7vrzt5ucpooujgovl7je2riiry64u3hfl4l3y5qs5rw4ggoa@nwagyecpv7ca>
References: <20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com>
 <20260907-nords_dprx-v1-3-d472af3f01b1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-nords_dprx-v1-3-d472af3f01b1@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExNyBTYWx0ZWRfX6QxNhgWo3+US
 soMuazuhYtKfszv5fl/uZV3YlttqAuYexFKhGMS/tsBpKpM2/o7fxbRDTG/r8CrHTNvckz+oOEi
 378lKlJLpCrr4PkduFjCgjYSXC+xNGUSkidJcGF//aKUFzH1KkRcDkyNmmBXan/RmwRFROZzMn+
 gdks/UkbGWl2EASCC943FeACJTi0sB2AVqbl2Z8vlvo5x6KavzNvyqpF78H+7hGZ32z0MDf68IV
 wN6OC3y4px9QPSbtV5NaqL/taLKRTQTb4co6V/t4w2l4He0WujMki/3N9Fp4XoAmYybe4Lfm/51
 qEI+ZVittnpCEJ6qvtiGUksV7Fv5Qaj9B5opR+h71gzbZG01QBrLZ2ZVmT5wsmhrpUVfvic7kK1
 U1XReqjBzFjkSVUPWO2g56zhXE/JuRhAH68Gs22KwMnG5bXYIzZ0PkKi+yoVYNplhQ46SJ0d3X5
 3MeJimgkyLwLvxPKQxg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExNyBTYWx0ZWRfXxGX1wNWg4nH3
 8dpuMJqrLKzsuuk8IIkr/cEtayc9nOX1J5voFS2/He+3psrxOSWnjYyCtMpSBjxTuiWSer6mUBh
 MZ/vfQSeAwR/pzl6EUTYvGeW1JY+ovk=
X-Proofpoint-ORIG-GUID: dauw4S-ggAf-S7hyQGawOc1EMz7-EKnE
X-Authority-Analysis: v=2.4 cv=U6aiy+ru c=1 sm=1 tr=0 ts=6a9e9573 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=2d2XUzBh9Lae0zXQoI4A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: dauw4S-ggAf-S7hyQGawOc1EMz7-EKnE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070117

On 26-09-07 13:56:15, Taniya Das wrote:
> Add support for the DisplayPort Receiver (DPRX) clock controllers on
> Nord devices. There are two identical DPRX clock controller
> instances (DPRX0 and DPRX1), each providing clocks for the DPRX core,
> audio, AHB and video memory paths, along with core PLLs.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
