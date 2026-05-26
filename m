Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D233559C9
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 06:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779775252; cv=none; b=kZmenmPV07XWZ361jmy0GSjJXMIH0xxRhd9WiqQmyqpmNS9PXuKQ7k3bce11uGSxhvS71AuwppEfbXySYlHHjK8DsFXNsXQv+aTvB5QNzkpJz0bOG7h0Vh2K6uBWIME9gnMtigkTpkKgrw4CTbRU/gkp5Xkeoy3xLRfQpWoCmL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779775252; c=relaxed/simple;
	bh=qWKEGMsRAygprv1qNcmSHZbG3rTbI37GY6knmYEGeU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mEZ3n/h2SVN9pLp8TzjxbAdCPzfmFYSBC09Ol0F2XHM+SbyPeOpyQz1wanCyO138mes8XeOMnCHWSbqXZvDEWuasKowrwjazCEDQnXokmtx6APm/qMw//WWcSgxVWDKzZTF+QOG/cqlXBQyP0sNMDATh//aH/8B8eA/T2/ipuN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Meq+sh5/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NLcmYQnQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Meq+sh5/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NLcmYQnQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q49G9M004979
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 06:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+snBfc2EP8BesCpZmCLz6ucu
	mRMXFltIhUtiZuC9Q9Q=; b=Meq+sh5/iF2mzbUpaTFOxLidIsO4eUDGB+mmWx1n
	8JwmMIEaNMW7qm4yWzOulUULcewGt3mJ+5u3Snfq0myDP+LCLCTTYZvJyoihmn58
	Mm5wnj9PPkDJaEGgaaFMrmSM4Ecb6BKLKNMytPGCPbIbe1aCwex4C8p0Z6ggOakR
	prPk5qa0/1h/+QOm9RvI0NQAV9PfPefINRoZFMY3CnnPdX8v+I2l9oZ5rCge4seC
	8wXte4SKJq8XDIMT1XTuUbS6OPN1iNBbBZ0AIJCB8Cm7XXbWNizguZbmITmsiyUH
	h9kCXfGeAk7Qv1ZV9ABkLKkqSX6UqxfYrFCFXJlAwOQw2g==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecsm01wds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 06:00:50 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6313cb80e7eso12628060137.2
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 23:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779775249; x=1780380049; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+snBfc2EP8BesCpZmCLz6ucumRMXFltIhUtiZuC9Q9Q=;
        b=NLcmYQnQBg5LVX08V9/rMVwvmCu1TB/ec/Ak0C1+GB0IKiue5yISEei9EuOhHo5LNo
         /P2gIaBedJEG3Zn0QnZAVVb48HP4U5R5bZCWHtTBmjZFhXVLWvf1uF7L5HEE95n7z1lL
         R4Rz+530odW8jUhJBxFb9uQJ5Vum1D/QQlHsdEzJtNYaWn9DFjDvdZzWEaU4IMDlFvxD
         56nU7XfGlLxrjS+ivQUyKU6BhxJbkIM82dlVhL7IsP0ZWpOt4TqsyTvR5xNdICPcajH2
         LYBLhfIDW7nMmeQBeBY6FV5OiMnHLw8zvOrjUv1nBZ1+82+cbxtAcXym3iis2KS745EO
         o+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779775249; x=1780380049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+snBfc2EP8BesCpZmCLz6ucumRMXFltIhUtiZuC9Q9Q=;
        b=eF42/xbbgVQJ8Ho6w/9h/lNV5xpZIwTZ68rQOGRna/ZKjf+ez760AGK982RGycvmUq
         GS3qxRyKiiBixAvxULvIBftyQnIh1B+9DThHIQg+2aX2qTcB8mcW7XoGS+TXauvrm6eR
         ksM7XNyqIVFaAvqYswioBWc/L1TRcjVgSGyazsOj1Q1TE6ynv9OD9DuLDDQh4K1+QIpK
         9mBbUB2dj21oar/LYoSWTp/JNCt+Kmz7z/mj4MrNyT5XOflWtFsnD9OHkcB6RwPHIDnh
         426yLlXfBJD2sSVJJKIaeqehqCpUp1wsfzY1sN06L3FvAC5cqcPXPuggk9ZJb9WKrpxo
         RQpw==
X-Forwarded-Encrypted: i=1; AFNElJ9Njrcn3bkuceyTXq+4dFPkDHZ8g9KEpwCdRDaDcTB7Tf9mml5YnS4tJInwYTb/ppdHwAlyAHzQChTw@vger.kernel.org
X-Gm-Message-State: AOJu0YxCLGO2xYaBtmVGtcvRgJg3pAWmV/wPOGZs9zWu4IDmrFdcCRD5
	aaR5d0EoZ5bkcy7mmOrK//FxkLz9Akw8RpYsME1pg5yOwQ1vkxylo5ld1dYO2sZSK+ZJ63/S+rx
	AEJVJjFMTx7K0UftPDW0MVaw0SF/mzXW20dNJUNqSW68um4jeL6CwcTk2DBUBbFGU
X-Gm-Gg: Acq92OGB1EfXWwLwDu8Wtk6YyUz3oHw2LZl1FkGdqwgLOIFacLzGxaT4PC98P8fhENy
	T84ZDz1WvB1fAwQLUJ/CRY+rKsRkN7QJLlirCPg9Oa0BdCqHDBUvxB13rBsl23Pw2nIty2SsHyt
	26BPh+ZywFg+w4vxUC2Ecv2Vx+hk/lDVq+Xl0/0cwTk2Y0JnHpeihKEI6CgMZoNStHdG2+1YXL0
	mSQbdI9jO12zJRH46IrUPeR5T/Xyag1vU7jCzm51/PLninsByJnVOMOA6y/y45a7B0EDxUx4XL3
	xFI9uL4Bo8HAKKSO03VI8saFT4jDI/Kj/pSrFl5i8KoblIt4fDCZwJjTS4yEqUJJkgafgn+1xHa
	2DqqFLdjOE3qgzdpom72VyWwnfS6/5BLBtEYiR88CkxY62aNgL2iTTtNkymy+ssHOpb0Jln8k/h
	OnflPuuN/GBYb437+GQ0Hh9E1iQ6nPgoy5xqI=
X-Received: by 2002:a05:6102:508b:b0:607:95f4:53b5 with SMTP id ada2fe7eead31-67c6f741653mr8573243137.4.1779775249067;
        Mon, 25 May 2026 23:00:49 -0700 (PDT)
X-Received: by 2002:a05:6102:508b:b0:607:95f4:53b5 with SMTP id ada2fe7eead31-67c6f741653mr8573225137.4.1779775248578;
        Mon, 25 May 2026 23:00:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa4634d550sm207734e87.81.2026.05.25.23.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 23:00:47 -0700 (PDT)
Date: Tue, 26 May 2026 09:00:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: glymur: Add EVA clock controller
 node
Message-ID: <snnl3y2ekgosvrtwmbjbk6izxpyoeiicw3sffqqmhontaroy5c@rcee4gk3dkux>
References: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
 <20260526-evacc_glymur-v1-4-b61c7755c403@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526-evacc_glymur-v1-4-b61c7755c403@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=CLEamxrD c=1 sm=1 tr=0 ts=6a153712 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=TVveIvzGzKhwGn6Bp88A:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: -AOgrf4fE73YK079WAJ4z0Z5AjlCV0GB
X-Proofpoint-ORIG-GUID: -AOgrf4fE73YK079WAJ4z0Z5AjlCV0GB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA0OSBTYWx0ZWRfXyLpoMvi/TEi1
 fWVnYNdeeou6if3itpEaV0Q6SitO8IhW6K25eqyhK0vmmiv2g0RjOXPpkhVD49DF3mRhA6ysxT6
 kfdn0m6dHFHNEz7wq+0LpXpmIVcNh1NTyRVKcAqyzmBsW0mNmDwE8rg7PQWhCHMY/a926V8IclY
 apfzpyMLJkK6vc7uO1mvu+7Cff0K2LSLijzhd02XSJf49mhKYmD8W2KhE9QnyRfdpPgGPKYDBI3
 OIFKPZtt5Nwx64CCmGLigJjqGlF9T447FQJnvQEFzIj1TF4zFSoRz6YTh64WB8z08EhW7HBpgjm
 fVmsZJbAyBnQs/T6Fq8ye2PwV/7Y4meMsQzP7MG3Sq52mEDA3KSD1xE7z+Qp6kdqL2mbhccD6H2
 rSjd4dG8zw7YZKig6dpyINdNYxxk3A6ld64bQ3KbwYPIaHDbRiaVtePcqWfhT24sOx/QEcENDUp
 yWsV1j1GhzGEsiLSzhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260049

On Tue, May 26, 2026 at 10:59:47AM +0530, Taniya Das wrote:
> Add the device node for the EVA clock controller (evacc) for Qualcomm
> Glymur SoC. The EVACC provides clocks and resets to the EVA hardware block.

Nit: evacc vs EVACC. Maybe it's better to write 'This controller
provides ...'.

> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 

-- 
With best wishes
Dmitry
