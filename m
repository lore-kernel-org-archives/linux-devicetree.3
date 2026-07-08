Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E1E28CF5D
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 13:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783516333; cv=none; b=MSMJt+y3Z1/sTnHdxC1fbrfggzpLem/Pbsgiep84SSDt7B9MVbvcDCEkzzA8bH+8tD8U4rC4Pneyx3pf54PHStIird1JJ0ayUfSuGgRBCVGLojfXKzRaaSXoOOhdAwBUwe+hBDj1PNWvOLiY+jHrTMVBdHw64FaGZD6HHAGMwL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783516333; c=relaxed/simple;
	bh=mtNvqTnneUBqZDhi6ibMlCIzwScmNxakOjWUTmtKQ8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QttQa2bS+394Wu2oIcuq7ykhfSxATA5BobWL03vq91rvTyrCmuJ9L1uIOZbI0no/uI8Ml1T3SoQwtH3b6SOnmcVLPZ0UdnvmYNc5wm5q2ma905rAR+MUoVoj+sRRIA7SfTpSNKHjuIz38/JRc10Ztmqg6ALHz+nSBihrSEwL4gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NCL46f7Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aPJiuvXo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NCL46f7Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aPJiuvXo"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3TsZ2667497
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 13:12:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dAwAYHVJl3E4TbI2VVqjdHsn
	zZHTiYD97XQNhoK7O8o=; b=NCL46f7Y/KqtocsWLCLwgUh5LpsDujAWMVfQvpA7
	lACOsYf14U66B9Z24CzPiYj8yYIWdHqeDUZ4ZddLeAduA19SgQqdMQcrqLux3UJG
	IyNY3i11me7h8+Xk7rwMlP+Yp6N/VAM7r+dw1D2N+8+8cCctfwhbS4q70Yjsc/p/
	fwjOqqg0D1h+Bi2Uwi+BrvgBSxebJDlS1e5SAXJTgRZD+cxu6k2CXDB0HydDbIHp
	o3NAxfYgH6RT3gnWpJSePco8kh5T7qDWL9LfNulbbk0f3DK/YssT+bBXxRIXH/wd
	Y7WGWtjlbOGuQ2/cU+uvva9nfDYXSzGaP4kUB5xrHpuGyg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f99hgu9xm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 13:12:11 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9692bdab0c2so1917922241.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 06:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783516331; x=1784121131; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dAwAYHVJl3E4TbI2VVqjdHsnzZHTiYD97XQNhoK7O8o=;
        b=aPJiuvXoJ37+EGjxDwbvRI246wdRVKAGuhymTkO/ifOrn+IJEMTeOCfBDWmFcAY3OQ
         8lwsITLF+qz7pmpwnUjTruIjvO1TjjhPejhxhXBGA1g673SyPjsuBF42oWQ9SgEkDyYA
         OfSFmvFEbUtvMDJwDy5cnJmGx2nfqTXpjU+7u0Djgt6A90MY4gfduDlzznjV+EbS9Q0o
         k6G/FsRf/Hl7vlwJkdeuMCZ+R9wy8f3oMQZts13ov/Qtp/eSKaaCeqhUVGQhr6WiixK6
         NqUjygmobH0Eh1CncmiQ/H1LeU+46BGNubNgrq36HLgb6UzMsoNhdOBOu4Dne6PqvRwo
         Rj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783516331; x=1784121131;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dAwAYHVJl3E4TbI2VVqjdHsnzZHTiYD97XQNhoK7O8o=;
        b=TU1wDtx8+02mr8OvhOOACQpk0WDSVzbK2MFsf0XLunB2ZPqW3V2+jjes6zcqJG9W8l
         xhNLCYCgdSSOjq8w97Vt9lKGjyPuW69h5e+NjOupFPZFy+b+7upVHFiAhGEDtCfb4ThG
         sp4GH1OCaxhML8OGmbSkHgJ4P8h44+iXIC2Lew5toLLtEoXVZI89OLXvdt3TMUCkvZqD
         4zIjrIoGu0Swcoe7lQcBPAxMfZ39f2JMzSfwOH7OzJxMV7xRAheI8ZMsyiKqAj6jM0l4
         Pv/DWPfI4a1qjz1SGMsQN5b9u5ncSPDfUHopCrJVlkKHsLbLxLr5i5pdSSmF+h1QI0e5
         MUJw==
X-Forwarded-Encrypted: i=1; AHgh+Rr55PxJipn/MSlTyO29aUaPzqtee+strS7mGR8rSw8j6bdGtpyc4v9GY7btD5ZQMKdGUDRssikQ3SaY@vger.kernel.org
X-Gm-Message-State: AOJu0YzDyrQ3YNj0AnjbS1nlaWRi0vIwipmJGIBEhd/RaAedYTGfxMIB
	mOA7BMIJbQNGgNsytouil25ZQMKfwsgcg8VJU00kM4FJDaw1HEmwpgi5eNIyEHWosrQ2LJAKKMY
	i11UcoJEYJrWdO4U8j1TTUFwFmIJBSrtNwZja6gHdSpQjfOus2E69Oo+DdmCPb/Ku
X-Gm-Gg: AfdE7ck7a7vAFtesHvm/ZfaE1Wxm48ZRWirB2gMfQRC9VcdJ7tEMgRNV0eKncDKspTG
	QhEmBDReoHclKHEl8zi1Ij+Y5lLUlaz2LrE67NclK4t1wzsmVC8+JVWKZMXoFkNKY7QKzLrT45T
	G63DNhFglQJ8QZpppjUgaTjjqS5JA4V9U5sSlcV8xxrv0mpE5aEKJK4I6/6v66Ufkp6t+y+43Em
	V5ldKvYIAA4jf5mhBuUpFSpLwv5BNNQUdUuMU2vbvMxrLXQdZoz2FPXK0UAsU62Df00ZbPMy9UU
	h6z9nkoOQGED3/PceUyK/op3/rmAZt/3p/g+Z3b7jZaq9ocC3aWK7jvC/yOeIY4dB0rhTg5ptMR
	3OtaG8QwoOoIXOKaUhkiW3IO4RBWk1SAQc2igbAGqpEdT38ksUx18du/Nyu+u9TVurqCdMgo9A5
	G64BS38RPXoUpFeqq6FVxBV1Hd
X-Received: by 2002:a05:6102:8350:20b0:738:f27:43fc with SMTP id ada2fe7eead31-744c214b4ecmr3511540137.2.1783516330903;
        Wed, 08 Jul 2026 06:12:10 -0700 (PDT)
X-Received: by 2002:a05:6102:8350:20b0:738:f27:43fc with SMTP id ada2fe7eead31-744c214b4ecmr3511520137.2.1783516330413;
        Wed, 08 Jul 2026 06:12:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb685sm4472877e87.46.2026.07.08.06.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 06:12:09 -0700 (PDT)
Date: Wed, 8 Jul 2026 16:12:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Matthew Leung <matthew.leung@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] phy: qcom: qmp-pcie: Add QMP PCIe PHY support for
 Hawi
Message-ID: <qfqxgcjau2x4yn7xuviva2cdlvyxn7gel6bcj32pj4mtfw5ngr@g2edc6d5tcu2>
References: <20260707-hawi-phy-pcie-v4-0-8d9cc6324947@oss.qualcomm.com>
 <20260707-hawi-phy-pcie-v4-4-8d9cc6324947@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707-hawi-phy-pcie-v4-4-8d9cc6324947@oss.qualcomm.com>
X-Proofpoint-GUID: s90zfNxrB15VFgHG8pCxq6wgscWU_ZIP
X-Authority-Analysis: v=2.4 cv=CviPtH4D c=1 sm=1 tr=0 ts=6a4e4cab cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=_DP_PzDrpJ8qHd2sDw8A:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: s90zfNxrB15VFgHG8pCxq6wgscWU_ZIP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEyNyBTYWx0ZWRfXy6uumhnXnNxM
 ZXO38iwJfi8FHM7YQk5jebJ9tphzoKEx7lSvM9G9/MSLljAFkCbfJnJOusur+Yw1lOBTvPWByLX
 N36fX0aqFPWynIOg5YAv55O/9PwXrfM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEyNyBTYWx0ZWRfX5sIOsL4KvpSp
 REZ1h0RMXt6ozZaQPg4eIyBI/Lnt1os2Ox0NaNts8QrtZ1hlz5/g8g0Q9UzI85TfsKkj8WkA2wi
 YlDqfFdgFbPx2JqX0Zz5hneTdadXNiljBQjkhnfSSV7OamIpTRVhiLVbn5uBqceyUhMukpvVJFN
 /2vesssZ+yWsGrMLuY2W+SmvSc0Mfl55VSPpKDZETwPWgdnBt3zrAhOSt5ZxbMoLZ35lFaorkJv
 PQ3g4BTUNyHS9Ww4RcGHEmJCcZ9mN8pRJkWnvb7kuzWHwkWDeD8gqJPGcNQlE8aywo0yrSNQOve
 CGE0yrvMJ5RAggVbEz5egBorvUXkK/C977YLsjN/JJKq7b+KZhtNQa0sMCksKk2bSAielBm1kog
 VFrpcojFOo92jSS2lCrVxjSGJ/WTDnvkM2Sb0GZ4/x15Ex0b0P0/sjm088rGJeZLzIfFCgoHZ8y
 H/9PYBVh62L11QI9dvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080127

On Tue, Jul 07, 2026 at 08:32:49PM +0000, Matthew Leung wrote:
> Add the QMP PCIe PHY support for the Gen3 x2 and Gen4 x1 PHY found on
> the Hawi platform.
> 
> Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 373 +++++++++++++++++++++++++++++++
>  1 file changed, 373 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
