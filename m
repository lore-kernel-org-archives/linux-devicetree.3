Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C1E3F164E
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787742314; cv=none; b=BenNDGmbBeX//SDFQ90rxDN8pBEfGewF28rm4iCrkHZR0zinNMsmY66gI3kIw1CDgXvIvxrgK47Rru8s16X1cguYl+c24cv86kvdQaTiyyKha9V40l6Lo7vvn24wXkn0WZOeS022979dowWids4HZkrkFsLa/VNvhYASyGKj4dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787742314; c=relaxed/simple;
	bh=YyYUUVqBJGI286K5cUmRrDnI792ynvOKG4YEV7L1rJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HX/7ukSGRwOwSsY2E5PFrHn9FbUJNYM37PKLf/ZAiKugKraBCHqScEZGVsAnCJsKOaszkzH5DX0HV5lNF3hhPgZTgJe5C+uUuPCu7ZltWZ8wdtGkTjma9jJJm9VfdLq3eOAZd7TRMkpVK4EBSjCfjhNgyGiLVn/SWdhetgb0+0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oRINjrDx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JsVheKM/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oRINjrDx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JsVheKM/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGplt107571
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EnUK4lzSsA+4H8FJzIU3OLV4
	bLy+1PASPEgPsSBWvBs=; b=oRINjrDxgmZqQjIfpGtUwo0eDBbgp1Y8D7vzVdek
	LLP0kpFXcUyoAf44yoD3tsow7sa/jKRgoZ5onKcGz6gTcRQ3tk7HzUulXmX1UlkS
	HXSTm18zJT3h6jsPxajQ7XuAijAO4nNMSYWaZpj0Yd6ipmsj58deSmBmKnuzsrmc
	F3iZI0wwKUx8UUgtICHJO47G70yfaWl65qbBxVy02x7/JQbyyBKW/lnF7vsb558B
	WceseKuuIGRLKzJ4jQLVY2e7spvVlrGdWuV8qzmSJpRsbzyi9AdOEiuJsnuTW5yx
	u7Tjy4xw+v69OV4J2gyhr/D4WFHnLyjGNjeHOuTxvsoB8Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9s9g9g7r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:05:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52f52ccd459so1086031cf.1
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 04:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787742304; x=1788347104; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EnUK4lzSsA+4H8FJzIU3OLV4bLy+1PASPEgPsSBWvBs=;
        b=JsVheKM/rHLITwg1/j261Lis6usL3OvBgP2rSinXrZPB4La9FwZUAuZf0Gr3Byzs66
         hQPh92ykkHw/Z2O+VOVtKfNtMH4KTqgvKE3Dwn17iMeZpx1M3ZQS5zuP+RbZ4ibWlGsI
         TQ5epCHmeQq60UfQDlCwtjn0BnHd9JliwIndQL4GA2xLIzq36KqzQh+PhQuvkawzns3Z
         +JPp6Bgh/WCh7QCEyEWp8xpxdFYWWmWXAkxO7fnZ9zLzMLxohO4fvFwJYm4pp1ZEobJB
         9WVtIZ4ZgYNA8JqgEOngPe4feyAF2SXGS3juB0rM3kZFNUEcOAXXR08mF/w4q42gJyTF
         2tSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787742304; x=1788347104;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EnUK4lzSsA+4H8FJzIU3OLV4bLy+1PASPEgPsSBWvBs=;
        b=fLH6kIplY/JHDI/kFp4OcnZXCIGxx2LK6D5dFGXkwmFGkWx59NuZuM9iFz0QZMdI9N
         6p8yBA3CkIgiRDjU/yFx+FqFNkgkMAgiU7PsYSBErxOJMc/E2oHNt8B+3Zup4zdJhQh1
         XvOr9NmWVk5BzUTCKLrNuhrO1Kr1jDwGKMA7qaBqlSPECKiA+uy89Ry0sBCULs0eiplv
         rnAwiIBWoO3tgd2SQPFD7eS9ITWgkSnhXe3dhbMf3GHrO06QPwUvhEi7UrNUheLG7pzj
         AOC0dII+RcTUD1h3lr2ygeJ7keeDmA4/yX5EvoAwx1Nwzb+PXRz72CGhDrgWPO65Atyw
         fTrQ==
X-Forwarded-Encrypted: i=1; AHgh+Roo+Msa68E4iXZlkAXS2qgnWP3lQgZG2Jahqzo0p9wv87RZiB4hEeo3jAqJLw3YyicB1gcuUzyVyCbL@vger.kernel.org
X-Gm-Message-State: AFuF++kDpSUgcSSG00qPNFFlNLHfmRtWhIII2cw3vYhREtQOs6Yc6nJf
	VD8I1Q/HP/fg2Xgx86YKU1tf1xfbRo4MJ58hRy6o4mG1ZncHHBGZU2sF8KYDVVgLH37SLAzLu1Q
	NiiV1RrDI2KUJqWD2uu8QwcaR9RvkfujcRotWXoCPVokQ9hHuNrh42qxNgpdGex8P
X-Gm-Gg: AR+sD11w+JnodQ0E4/YjYa68dXOM5k44Zs/BY94zdLeFzX01wAH0AxjIyzhpxTsRsAY
	Za3dnjjynEgmapNu8gNTv58saEWT0dJyrR+83w1iuEX7oW3a8T8Ct2mUqR6PRqBnoHNoqRj3mXA
	MWPquUN+jy0PG6rwpsjXFuyCGSyu5wz8piXA3a/8ZnH0cR2uchYGR2QQ7zQQxz2Wybv187vkr/4
	hN0lf45V+4pFQvKBJ4FoMHT4tVs/3onhelkWt6Fi1cX+ddV7iBg5lxbrJ1whbhZHKq392rsy8OB
	MhulHE/KaWss53ANQ5+Jcq7IGmXOFPLhZCKILdEv3tGdUeQ9rAsKKcOMegkg/SmZPfgdVSxAIC+
	PbjjvsHre7sGH
X-Received: by 2002:a05:622a:1b25:b0:52d:f376:c254 with SMTP id d75a77b69052e-52e422cbe1fmr59964551cf.10.1787742304420;
        Wed, 26 Aug 2026 04:05:04 -0700 (PDT)
X-Received: by 2002:a05:622a:1b25:b0:52d:f376:c254 with SMTP id d75a77b69052e-52e422cbe1fmr59963661cf.10.1787742303900;
        Wed, 26 Aug 2026 04:05:03 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a6fda4fsm496909466b.16.2026.08.26.04.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:05:02 -0700 (PDT)
Date: Wed, 26 Aug 2026 14:05:00 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] pmdomain: qcom: rpmhpd: Add NMXC power domain for
 Nord
Message-ID: <24kdkayk7odpbojcvbhzwupzvhqgtlei7d2bvbrjpi372z7hnh@7fte77gqooaa>
References: <20260826102746.633076-1-shengchao.guo@oss.qualcomm.com>
 <20260826102746.633076-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826102746.633076-3-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: rprxZBbECdQUCkPLveh7mC1fSNXv5wDS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA5MiBTYWx0ZWRfX451JjIta3+Ux
 Xc/wnl9dexhoC5XYJcrOlSCONSSs6ADjEnnjr2xI5pPajD7jqNof2zO7V5o49QB2BFNHOjErvp/
 zI1pTI2eYTy71pSUeV4KmD3wFwtHEF/yAqn2LGWwKqLyldwW5luJfeLZHqhITbqjtqDvmC95F9/
 ko4tP+Md1fSv7qlGTT8AVqTcJRUqgf+3mQ73nid9KyJPgL0JPzh4eZ2O0u3MANLNtokbFMe6/XB
 RfvrWyqyVjH27rnxqhSXhrxFmMF6nmh2VgacfrewIBwK6pH0DU2NoWBuVO+1/GUEfhz26NZNYxC
 trqA1oZiH2i0bfKNdG7R18c5kz0O3erYSd/Gvd8jsMipNz38Rn/ToY8lcBcQH3oZ1QLEdvxAxnQ
 M1s+iUEtCJgrw584+s1eArHzUlyHVLjjqsOFb5Ye0OYoGlBuhf5gAKZHN0sKB/rfep1Tziu4qWA
 i/d/j5Yzirtpu4ObPJA==
X-Authority-Analysis: v=2.4 cv=Xfq5Co55 c=1 sm=1 tr=0 ts=6a8ec861 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=WUwTdx2_Dbflg4nuc2oA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA5MiBTYWx0ZWRfX9O4eam8Er5ty
 8tZG3TP54yoS6z0MhlNxGwuU2e/c2ximRa9L4Mw4swNikQm/NqYWsWZlCf280wmrKcIm4czC5XK
 Fw4pjaTxe0H6WVIgT1JoGGMLIdAT3ak=
X-Proofpoint-ORIG-GUID: rprxZBbECdQUCkPLveh7mC1fSNXv5wDS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260092

On 26-08-26 18:27:44, Shawn Guo wrote:
> From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> 
> Add the nmxc.lvl RPMh resource and register it in the Nord power domain
> table. Nord supplies the NSP memory rail from this dedicated resource
> rather than from the shared MX rail, so consumers need it exposed as its
> own power domain.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
