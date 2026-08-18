Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE66F43FD26
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 11:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787052708; cv=none; b=DXUoIKam/6b2w29dLkH6RDf2GBN+ELTf1YlJSgMdJVQXJPXgrDolKg4oCA7lCcRRe0jhxa6luCXPU2LiRowvGCdG3DbhT+EfKwogF8QMyOHAU+WkzLyBlQ6IbnFnE9b88Nb19ttDJS+M+yJr5126nZFeLvzhKEPeqmNsbY++U6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787052708; c=relaxed/simple;
	bh=NY86+UtTeN18brVKhHbm/eqdMY5zVtKQJb4K6zcHeRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N1UPU7kX/dU53tpado3uisqx2w16roi5alj7/kdFFa0vYXvZ934hy0clinb3finNnqMn0IK5NUfjktz6xN7M+3/7hhX2BsPvy7ng52HkXzDvQWZ5Fbd/rahAk4js07Wx2xc1Bdca30EKYwVae8+ubcE82mtsDcJ6w6XzIhMq6aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aDaYJE67; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gT6fn8WP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aDaYJE67";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gT6fn8WP"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABbK41336416
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 11:31:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mY/6T9BzpgCW5+CBVXCrMzv9
	tYsak1ues+rkztrNeAY=; b=aDaYJE67/YJaLsP5MU26olE2o/gnHt3LF2RU69y8
	1IqTUHUJl/2OsJr1+y73hzZhoKOKhGMMnLG8SwQFX9aAWvHgGSbNdmAQScj5JlZb
	48XUUcylx2IAAp7VjYWw0JAYmH5Gz5OuPnQ1I8mouO+ftuW013CqQKRw98KV9zMn
	17TjJyOIMoo/3GuYLJLAaGLCpJjSK9i8vI7oSDOJoSqLwyf2w4udVE7U14KqsoWm
	wwj5WGgSEShk/Awvgl4JMyob1kPBdonG/4++uRubgGe+Z83pFuK7xJyXJbCVDyQ9
	oTYnOx1ugBcUmLpJ8qLkWD+HDjSdvXWLKSdzulIXwh9Ptg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4fvp1su0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 11:31:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e52306621so441220485a.1
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 04:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787052705; x=1787657505; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mY/6T9BzpgCW5+CBVXCrMzv9tYsak1ues+rkztrNeAY=;
        b=gT6fn8WPiFwPoEee+yKy4B3yMMHDSzpFBURuLGCAGibnN8Z7fstcaVK+FSumiIhSpU
         xUg96daFGf0mJFEY37C6ZFrIMpN+r12R0MyDAa/RgekEWfpIYoplEt6DtxDLWJiG2aPd
         UHs4Q9NaMI7B0686xVmGYBhGqQZnvHQm3PCqdmnyitkfEUVjwRTnnNLZlFSXjUkWT8Ux
         shNffN3iqxyw1fHCLlyb1tJLsdkjBosUJoXc7HM3rSJ3C3y4m8GVNN+0R5N54YmeFxAG
         oqo7gTB8yoK4GW9AGEC0TXfBFCFLuu0emnKFFDL3ZzCAH4CFtyHMuRqOLxAiI4aGzNYo
         eNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787052705; x=1787657505;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mY/6T9BzpgCW5+CBVXCrMzv9tYsak1ues+rkztrNeAY=;
        b=elsaJt0vftTu5JSdGMbFx7rYnDg9DtsBNRoXgIG/EXZbqNsNZtWk+mI85bWrzONvH1
         QXdQdTco3ADO8K+6lFWL5Iq4Al/JzNdhRT/vS4O9Up+EeWLe8gZQWkOp2ztqr1ogwALC
         U/cEQqRjjitflAdoMOhoDoUuA5OkdXklTTEwJv4BM1wVtJEisHv+9bKSRvf1ZP/y2sNw
         CwkBZmkzfXHG8jY6ss4rc9MyhBkbgB5WLe0q5GFoVNJBCjzvnETeHFaEX8VfkJx76Wuq
         ep2WsXKVRQMeNUYxsked71/g+JDzS43w/cEWPq6oDFpqqMksxV5f/izEggxImZKpulDK
         DEpw==
X-Forwarded-Encrypted: i=1; AHgh+RoDRZVhyn2IceOS3I3SBPbRq+YuqvLYEyfBYuiCVv50PqB3UsehEe1T+9w0LFHNIwAmCBghUEsqrlRV@vger.kernel.org
X-Gm-Message-State: AOJu0YyS20eTDj1MofiAgfpgF3M6OrJ8NuHFZeRa5XQWHYI+Fo6/OmzO
	pjXX1pKY4m51sn4RiIAP0MpMJdyae4W3TWopVTHDWIoU60aJavSc14q7WvKyktAtlcDtk7pwQEn
	9fgHy6VTm6gHzDquuEZZF52CVoP2dgi6sUD9GIlpdCUR0zHdup8gVsNjMW9dGp9KT
X-Gm-Gg: AR+sD12fe23MoqSpSC7oCYG9jkJmQzGLi643sRB2VoWDcVi2S0hPrL7G43NnHCgVjaG
	LGyzLkbpES3ZEm2BCusXD52Ww8ejD/yZ5zmO1dI1/2int2D1di38+O/VAG2NYyCjpNowEuTkOqm
	ebEvaOlAqcipujOeJS7GbaxusnTRaMZMlnlmYxzEIvH/yyClnexG5putelWmvOYU2ag7NNmBZHn
	hxsxjydZ8bS5jNavWN544qedQAr1vNI5RjCkH/LU7xxJQZuHdamEAo1s//YZpr1UNlkFgRhRcR0
	DQ2pahdn1aofofHBadMoXUUAGr0T39pQECKVNgogGdeC6f//a17NcGyrwm46++f6UEorzd1AaG9
	HOAR/7wpVEgVcYNkVthKyuVjj1vjlyHO9yv2vZ+7YX2EDFEu3C1W16E9VPTTzNCoH5WZdzg+JGc
	ekc/kDBAta1NNI
X-Received: by 2002:a05:620a:454b:b0:92e:bbd0:260c with SMTP id af79cd13be357-93704baf1a1mr666051585a.36.1787052705002;
        Tue, 18 Aug 2026 04:31:45 -0700 (PDT)
X-Received: by 2002:a05:620a:454b:b0:92e:bbd0:260c with SMTP id af79cd13be357-93704baf1a1mr666044885a.36.1787052704548;
        Tue, 18 Aug 2026 04:31:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a16b1bcc39sm10808521fa.29.2026.08.18.04.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 04:31:43 -0700 (PDT)
Date: Tue, 18 Aug 2026 14:31:41 +0300
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
Subject: Re: [PATCH 06/12] clk: qcom: rpmh: Add SM7250 rpmh clocks
Message-ID: <54w3hlnu5ta5v6coj74o34nt4idolyaabecsse54sebpnyawyc@gbkvunxqdxj5>
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
 <20260818080754.4362-7-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818080754.4362-7-sreeshankar0910@gmail.com>
X-Proofpoint-ORIG-GUID: r6HpGKvCEf7S4GJqgC0Zyq7lgvvvNlAz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA4NCBTYWx0ZWRfX0/vTsIRS/MLi
 qB/qBtbX1KzEVI9wU+n9vqsj4P06D3er4rewffRhJtej/5ObWgAR7iHnr9wS/4GkkRcW3rciBsl
 HAchXHdsg18/9IOSwzwTwK3rx+cWjp4DRYkLrDCFr0Chihbl6gC7cmV/uFS5RDoewJnr8gF0zsO
 p7kQ2c4MqQXsaAPWGyZ46nLt5YjfKbvDlbQFnlKI+WsDUDqgTRgImd0UV/rmIqV9ToFASZtwNJ+
 vpXTV6uSjvsbGvDBwpl4wN8R/0Fou5YuZcdpOJDoLw2gjbXQlYDvKGb7OTAdd6A8ZgTkMJHYC9X
 dci5icWlA1RvdXZiiFNKjFNWMY4IR9ai73rWk+yFjbrznein8FlEQe3L24aqDvIQqiII3ZkOSHw
 1Ymyw4HTWIYhnayiEcAXQcOav08TrD/7TGktG1EbpCed0CDymt8HkY+0SNF/mKl5EKajwY45vPJ
 rSCs0EeRopFOfyei3Dw==
X-Authority-Analysis: v=2.4 cv=K/IS2SWI c=1 sm=1 tr=0 ts=6a8442a1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=ZfTvDAhhgTXKM-HDKzAA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA4NCBTYWx0ZWRfX09d+VKdAmF1P
 3Xji8Fq0ZnzKnH4ZhNZcmiNFQJdrNA1cPexZnTGuvLPesN+JB6rby0yYHQdgJiILoPkH7e9w0BB
 nYoFBtYXppcqJ8b273ONdmvGUquWeBA=
X-Proofpoint-GUID: r6HpGKvCEf7S4GJqgC0Zyq7lgvvvNlAz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180084

On Tue, Aug 18, 2026 at 08:07:48AM +0000, Sreeshankar K wrote:
> Add the RPMH clocks present in SM7250 SoC.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry
