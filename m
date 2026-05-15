Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C884E3F58DE
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 15:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778859695; cv=none; b=BhwceE7pZDLL05HkiAm6XVffZ9JkO9aVs+3xZyZBbfXKeShwiFRmcnlcmqiUZP93PGKts2HF97r6zHojwsDjy8pAk9bhyUJZ/pb8j8lm/Wh+Cg/jRADhKjxjauaj/vbQKHbqR0iIiXKC1szOBAecjx91Qa/OnrjHDWgpfqXxISM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778859695; c=relaxed/simple;
	bh=Pc3MpCtVK8p6OudMDqnhjwapWxM0T8CO+YFnhbV1T6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DiTix10GRHGCMyJGZtrVNnG7dKvmnJHL2wGWokONqr6Q52e3H6BmfGNsHdThwhgEhy5xTHQrbSBadT4BaQ+F0rfLX8Ye79N9y3EjuMaoQJdg9Cw5uXaryAhdCe/zrXlD8jsWWl3D+69pCf4NAztyH7UerHsXBJxpnJS4oWlys7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VIadg89s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XI/ZNVF8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VIadg89s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XI/ZNVF8"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FB5cCx3219705
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 15:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=48QgJCSDGrxZEEMu60fAJNCo
	YBZQJr3kDDsz/0EEYCc=; b=VIadg89sDaZvWClueo52v1sDS1B/qTeTPu3I8+xq
	+s/bqhRXAb5w1C4wkhNEn34mfKed25guHcntxkeO0pduG/MoaWA9I9x/7l8jDC0k
	vU5XBfJI9CZPjB1EuDsWhcNxP/XQI7IYGiKe/QaqhVmcFBJ7aqtWAhrfmoPV0Hl3
	5HDE9Z8kdazyRMV11Ifumjyr9HYYY90gm9y/jdFI97gDG8QA8HW2x04tityde85h
	CYqSpRrNz8qWSf4aV7MO2MXW+mQrKQwW/Pt9/0xU5DNzh3MZFKm25+2atgUNyev/
	HnQB3ojb0tOelxpO5NgTLLoksTYR42yIGmqxkFK3CcZnyw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s3uap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 15:41:28 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f9429f49cso11929298b3a.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 08:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778859688; x=1779464488; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=48QgJCSDGrxZEEMu60fAJNCoYBZQJr3kDDsz/0EEYCc=;
        b=XI/ZNVF84nrZAKcRgX8L0pw/ZhBrb9nZQW2EQJb9/YeXNbu1asTxQ+W0m/ZWOow+tX
         hj1bCTApP7OWJ8iAEmUNs+4sPeFug9/98ORqW9d56sK8FM0Nmm8GeccSHhIW+LpzsCM5
         EjTlLG/HwLGFUQCpQ/8/gcFGdYLzPNVQm3QkBzpWgtBI7C0QTah6DJoCFiQ6/+yRb/p6
         OK2qfIMvYk414Gb6sUwVKOAsKrQ8d6GpjORw/qofvkL5m7k0c7WzFoc1IWbdYnlHxsTv
         S5xpjtnW8Kzhe/DBTni+8MWwtkOQ/9F405Ob8jpniZIVs80ywcij9mKTkmzirDWWyjY9
         jUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778859688; x=1779464488;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=48QgJCSDGrxZEEMu60fAJNCoYBZQJr3kDDsz/0EEYCc=;
        b=KLVZVOhThKu5qKuJA5qqBPTSpLdFXowq7enWmaKpdKgXnf22wByDQtZo+fJQORmG2y
         pmSPUc8bo2yUILfZVAAMtYvZeymBybK2TgMN3cNCedLLCE6XdIcxbvwidJQlgY35xiJW
         yUzfx1KO+lp6rhIPGKMVSdYRxGby2YH6H8HnPwXob+1C0ISJMc1EOeewjiR5KIKVKzEJ
         CF7ZyZJU3DJx+AOhVgUSarDhYsKZh2tHApW4wfllDtup2XdQtPfqsTmZOa64qtab3s5v
         Dda7YZShdNV3vh1YEVuzR64TZB1W7d0JCw/teDxzSPwDMT+IS5ksrN5jVeXgCfX02mvv
         AN0w==
X-Forwarded-Encrypted: i=1; AFNElJ/8TrGohHs4hRYlGmmqRjFIpSuGlXTKMhKfqUieP6lotyPFkm7whfHmOQ38UfD0xUmNE2UKeORRloWR@vger.kernel.org
X-Gm-Message-State: AOJu0YxfL1eIITaF5/Jh50DY5uY/+UmQYhLEQugBI4p+WHHDHPfc7RVz
	TJN5SWLqcfO20REumLPIyMRU7+0Qf6aapgotmt6GdlOlXkk4rX5xM/Eu1WiYahYE9QyjxlpT1n2
	9dxVNCepf0d0YcHgYvxR0BE3tvSoaHDC2p7oNQMH6SOFcmvmiPxW+ZwSK0UX2HgHe
X-Gm-Gg: Acq92OGRaLnvh1YE6KGSoNbaC8zDHSsZ1ldpVj44l4DTDtY9pznXf2Rk3WIFnpvMdgI
	Rm31sW1IrBx+O+Tctf2H1bL9Y4UL463HXy+JqZ6AbKl5/DkJ8ONkKPlhNnjIOH2gQlwxWSI6UuU
	syzeiEcOLba0yqJ8o6QdMPI1Iat1AUotJKvwgj60K2sA6oyEAo0ZH04iGfcnDj17mWYRB4M5+2t
	nXfwppUkjDbq8LLW9J1cO+IV1OYENsE4MJ99PLSTsJySScy9MVJzbQXksZsTFEq12k6i0Jbmd1M
	bF9epGv7ywcSKBlflz30yz6jSmlU+NUrlyngrCkpfJrrwH9EiXYve5vdxHxY+yaX9shiHXeajYD
	9I/lzpToWLMpHHnOQNfGYYw5SHFZBQ/8r76MT2aNWwqZ/yUamyP41DnSdmATmEn0QYDtaSP+4B9
	ILK/lrQ+iYZnt3efJGzFxHyuLFjkfEOA+vJtvjD1NEUbh5ebEJf14=
X-Received: by 2002:a05:6a00:3e22:b0:839:dd77:3501 with SMTP id d2e1a72fcca58-83f33c33546mr4982591b3a.1.1778859687689;
        Fri, 15 May 2026 08:41:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e22:b0:839:dd77:3501 with SMTP id d2e1a72fcca58-83f33c33546mr4982557b3a.1.1778859687257;
        Fri, 15 May 2026 08:41:27 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5c39esm7532977b3a.36.2026.05.15.08.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 08:41:26 -0700 (PDT)
Date: Fri, 15 May 2026 21:11:19 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: qcom: ipq5210: Use icc-clk for enabling NoC
 related clocks
Message-ID: <agc+n28PfkrxwpuJ@hu-varada-blr.qualcomm.com>
References: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
 <20260514-icc-ipq5210-v1-2-b5070dfbe460@oss.qualcomm.com>
 <5zdmbj56ndi7nrvdqadinrf3sneywft3uaplnoxugp5zetsfbj@5hazmuzyfz7u>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5zdmbj56ndi7nrvdqadinrf3sneywft3uaplnoxugp5zetsfbj@5hazmuzyfz7u>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDE2MCBTYWx0ZWRfXzw+/01rMuu6m
 JiJ+OobmhdkDEODRo9Ka3aDQpfBObAOEGucAXOxjUOPlPbYkTlaFYi0wlKAEi0QGCLDxvh8bXE5
 IQaUfHloPdAL4SSKbiJSbNtvYKxvNfahYz1O0uGT/lcJ1Fijxht2t501JkqVot59t6ytemy/1YC
 +sPyM9AeJMo/GFGYZmBm2Gt3McajjFqpArn+PX5n6h6IwW2bi4YCYecZ9TzyHtSJtrKzwiHR+LS
 SMXpkkBuBkQV5LfpS3OlsPo0GE1NiuUyp+GuRvX4QBt7Qo7O0J9CrD0KM8HjseZj/pt/kJLcT3A
 oDTfGleeI9w7c918joWIevGAs9oEKO496WhlL1jwzTCtJh5pKlULw+x23afO20OTQ4A7fDlJ3ZW
 qnC4le5FQIt5IYvenJCNeM47hMCOwO4lrAXuFIYqW1bA49RJdBRDJ5EV1DaPkz8kNE2MA9VzC3p
 dbeij8qhroGSRxYlsow==
X-Proofpoint-GUID: LRH52XkS-FDz3-UsGO67a2N93mRo6IWi
X-Proofpoint-ORIG-GUID: LRH52XkS-FDz3-UsGO67a2N93mRo6IWi
X-Authority-Analysis: v=2.4 cv=HJ7z0Itv c=1 sm=1 tr=0 ts=6a073ea8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=jBAFZfc0v9Tf_D0DgaEA:9 a=CjuIK1q_8ugA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150160

On Fri, May 15, 2026 at 04:31:42PM +0300, Dmitry Baryshkov wrote:
> On Thu, May 14, 2026 at 09:35:36AM +0530, Varadarajan Narayanan wrote:
> > Use the icc-clk framework to enable few clocks to be able to
> > create paths and use the peripherals connected on those NoCs.
> >
> > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > ---
> >  drivers/clk/qcom/gcc-ipq5210.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > @@ -2642,6 +2657,7 @@ static struct platform_driver gcc_ipq5210_driver = {
> >  	.driver = {
> >  		.name   = "qcom,gcc-ipq5210",
> >  		.of_match_table = gcc_ipq5210_match_table,
> > +		.sync_state = icc_sync_state,
>
> in Kconfig:
>
> select INTERCONNECT
>
> OR
>
> depends on INTERCONNECT

In drivers/clk/qcom/Kconfig, IPQ_GCC_5210 can be selected only if
COMMON_CLK_QCOM is enabled. COMMON_CLK_QCOM selects both
INTERCONNECT and INTERCONNECT_CLK.

Is select (or) depends INTERCONNECT still needed for IPQ_GCC_5210.
Please let me know.

Thanks
Varada
