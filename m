Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71E7436BE1
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 18:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783362134; cv=none; b=GOeqIxcnm6kEDoDPPxk0i+ZR/yg5dKcXDzSuZk/4Ho8xpwHmUz+pqfzYo9b9oOC2BkRPh4IpST2EK+7ZUytk3pHnMDrtKu1SpG/YhLUMYQ9toItJaSb327v1b0MqHEC2Lc5gGkmO7WncctRLD+un8zfV+BqPJS/HuMPZcnPR8is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783362134; c=relaxed/simple;
	bh=G6i4vAHulGxwm6vIPl6snnmm+f+WXIOUfdXb/1OUcY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BmmWly+DY5+rTMXB9LDtL4RfMHzh3e3eMnvgwhdEsisO57gzGnhcRutgGSG1e1RRP4tIPTPccJyR53JBCT7i0O09hUg/kfyw74VKdF8DZjAKc093IJ3MQmQTZl+WjqWrWxrZj34tP2om5lQPzsqC4CsbaiuMElGNXh7YjIBa5NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ICNziEBh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bbVmyIHo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ICNziEBh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bbVmyIHo"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF2lo825763
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 18:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v+oE012GSbNPmRWX2SIsV0+R
	GluI//ijk3Ve8PNTH7A=; b=ICNziEBhOwA3ThKdqAlrIYdxEyCtsuwQxSSe4066
	ghoWAku41y/5nokuhHf+oBQP/RpdRhK9lZZE/3sxGgXIw9LmaEnkyJTuY1jBcJ2S
	7VmAgRXMWxsEBAiJLi89Y3uXwkKh+c+LXabxO7jjUmp37skdEt0IR05a/1+2f+tT
	9NqScHRx77IWj03FrLHvBSe8YbOuQk5WzzHLQD4IrFGYPdcHzDcsGT2FxytZ+fZG
	vskpbEP2/yT6z+OmZt/beWQLRIMSlFcew3PRnKM60tMs3Pdgi8xmIox0820yQHlo
	B9NkXIubsaj2gfPpSc01mCbfRAnHJXR0w6DBjJOCrT55uw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t8anwe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 18:22:12 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-59d595bfd94so1190695e0c.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 11:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783362131; x=1783966931; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v+oE012GSbNPmRWX2SIsV0+RGluI//ijk3Ve8PNTH7A=;
        b=bbVmyIHoZovVb9UyVbPdNf9xqYt00Jz7AD04PJ3NqWqWo1qvh35VGga60/HXHk3wsU
         6rFlfrO5UBjsl8kA5UJ+cIZ4awVyoCVlVj0VniPFfqxfWxCHUb4eUR7JkKzCMzXPdlza
         MGQuTnEwVjsBX6GTUY+KmPQNkE2usRq8yOPHT8nM4yS60fJMe7eH72f2QaDVbHxg+Oe+
         ux3VWZRnSg1ylfDzOhV+lz318KG24m3LavHkWB1m5rPm6rR4H3l3HGJk+6an7ZC+0Lo2
         Hw6fstm1hqbDWhr9Nl/c+6z2xBQelazAR65uo4P9ftr7g31V+uX55a7o5JOqyIuWGkrh
         7/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783362131; x=1783966931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v+oE012GSbNPmRWX2SIsV0+RGluI//ijk3Ve8PNTH7A=;
        b=YNz8j8hsNyRvSrnIs+r2qBY11t5BIHHnO+PBBAYqa6rLEBbAUZEu9p2jxNNAGNDyQr
         iteH/vh29Jr0GoBuelTEZx2D5JST8iXQ+IsMp4iwzmuDwjq41PSwTMe31dQESwfAWPH+
         2qf4gTr+HnLuhEuPmGWUJnwqISVLl7+JHTazmtF2NYgqmqjE+qU/FiZveZDbtPgXJm1c
         aoS4UlSWPvbAQehAnU1AzG+dV5bXDh80NdrjZXSah8hHosvl1dyTfPvv8BJE5C1cSC1x
         cQ69/29m2nHmyEgupXzdDZ0MfX3ylZBmB7DJkWdbiLzlWR4QG1mPyg+KMfQNSXnpqYU4
         JtQg==
X-Forwarded-Encrypted: i=1; AHgh+RrpfHaDje/uqTbVbx/fiOYv9EbycZfCMz3nV5wb8ZIy9jq41h5XkdkRaBNK1ZmVCguZcCFkQKlaoTYy@vger.kernel.org
X-Gm-Message-State: AOJu0YwfWJfBiKxUCC1b0c3qWVAR84JuhiEcDfPZVCzbO70VHZUTS2Sl
	GJ2PFgCCzEV6NthyUUecHPU8bNgXTmRq+KCPK3xhwyawey7KfIRMVyS+938dYokk8zOKbbqS9Uo
	UqS3MNUrqnOQjwSV6/2zeATeXgjiC50NvXk7sGtoT13Wk+WCCZpA3zx37vi7M1p+k
X-Gm-Gg: AfdE7clOrdBbEcFhTxoZSHWHFGifNU5t0aBcIvKqUpUsfr9DwxpYGJ8nlA5zcnpZ3iy
	g1GEerQgbaj8nAe671ldgBpZ7SYiBtIJJ/ikcx++GaAZrea6JD6rU3GyvGjogckUwrFuNiDIKpD
	lOXUTXF11uq34hipLAoS8206S1PCNDb2L1JX5UhuXBY4otD2gFHaE1F25Byxh44L4R+jUes1pDz
	UN4SVIDTDWoO5dXWL8Tkw3UKnQ1o6NA5A55b+SYOpyWpa4JTAQmSq74verHhb+9Ktkke2QMux6+
	yCOItJ0s5Hz6fNaL/zkL7WAclJsGuNN92vntamrWKnG9y2Ycna/dY/jz+HGVS+l8bu0KjyEH3+N
	dlMFXTWKQzaDeZ7uFrBLPTnvYFXY2ZnyUwbJe6Ield7XRtPG8tag6U4Yn5c0Wf+s4L2FpRelvxd
	cjORU4lH8778H6pfhcPjHcOLac
X-Received: by 2002:a05:6122:4d07:b0:5bd:aba5:3830 with SMTP id 71dfb90a1353d-5be89537d9emr895709e0c.0.1783362131244;
        Mon, 06 Jul 2026 11:22:11 -0700 (PDT)
X-Received: by 2002:a05:6122:4d07:b0:5bd:aba5:3830 with SMTP id 71dfb90a1353d-5be89537d9emr895694e0c.0.1783362130681;
        Mon, 06 Jul 2026 11:22:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed136f8b0sm3065981e87.4.2026.07.06.11.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:22:08 -0700 (PDT)
Date: Mon, 6 Jul 2026 21:22:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: esteuwu@proton.me
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH 1/8] clk: qcom: dispcc-sm8450: Fix mdss clocks
Message-ID: <wgaujvwp45q4gfm76py2xbxobz5zc4hotnfxwldeysn7go6t6r@ufcuw7khhadg>
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-1-37e2ee8df9da@proton.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622-sm8450-qol-v1-1-37e2ee8df9da@proton.me>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4NSBTYWx0ZWRfXwmU98QZEARWM
 vifHQt16cDk28RKduihakiUHTg26mqGPzdoeOKvTNL/s6P5qWj6IH9aYIv+2/dWaWxlaCXeGOzz
 euZ3vwuJ4Bbjmr5xTlAWaYYxTqqqm3k=
X-Proofpoint-GUID: LnBnbLYnA3rEv__Bfd-km-GJnn9fHccb
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4bf254 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=Rl_UxCnVGJdxiaxNqnMA:9
 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: LnBnbLYnA3rEv__Bfd-km-GJnn9fHccb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4NSBTYWx0ZWRfXy36v19pabPZm
 pbA1/qBdzncsRCKEOXPXL2l8367mFtahpOUXFUXsk/Y+TIFMuZzrtnGtun7cswemD2RIoZcIE1i
 HSpzbUpSJZ/9pdokCyyq45MCtFr8YNk6p+nm8eGZW/Ui7zAmArFNchVj0GfTsChZBUWkghRD/KI
 oFij6XD073iqWqAvHof0EGQ7X861JKggKKsynqjbc5hZvzVOGcihYSMPv4knke9pF/lWxiNkkwX
 6N+XV4x2tD9jLm7cl9b7M5uT+brb9e6zOKXaBO3YMCxQ2CnX90quiCB2hAXHY/0SaOKjJjVKLIf
 H33oF4QS/hQt+BVcgcH/kW7s2x8Oo7nqEHn2q5ttPb7cfHvY74Asnn/CUi2sKsBSH6PYNR+Ovkk
 9LdbsTGCxnqkGVlYx6dZPwwLNkEXdOJrf+OrpFbF9bpe3gByTsEkwhZkhboq3h3WLeLIHFSEwl/
 rjkMGeaJk6iBR32pnpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060185

On Mon, Jun 22, 2026 at 08:54:22PM -0400, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> Both of these changes allow the framebuffer to show upon boot and let
> the mdss driver take over afterwards.
> Before, none of these actions were possible. Only mdss takeover was
> possible, but screen had to be turned off first.
> 
> OLE configuration may have been a misinterpretation... that's not
> something that's done on the downstream driver.

As far as I can see, SM8475 uses lucid_ole for PLL0 / PLL1.
So, no, this part is correct.

> 
> Changing disp_cc_mdss_mdp_clk_src from clk_rcg2_shared_ops to
> clk_rcg2_shared_no_init_park_ops fixes this warning as well:
> 

-- 
With best wishes
Dmitry
