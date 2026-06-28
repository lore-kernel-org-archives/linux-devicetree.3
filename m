Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AF3346AE1
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 22:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782687247; cv=none; b=mYaZVBH8UEsZBcQJ75dXKdvEPgXIaL3fx6ABqIYgfnXtvyMM9zIECohUJCI9RCvL3xkRApWP/o5VSYEndCSw5F2ynuMkCGeNCgDXX5UZgZu32yjCDGGCGq/NKJiH90Kfj/hKj1cooXQiWlKUic2F46l4NEJYVnir+YRQxLXDkmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782687247; c=relaxed/simple;
	bh=FHM9I7MAjyy1mXqIUPgsWC9RtHIBPLm8K4VhaRELGzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dk9tKdtxB+nI7aE8xOF6MrDxrBMM6gmePDEue32Sdu3ytoC1vpVzHFigkgd9+f6T0tMhbra+hV0y5MA4Z2dA1zt4sssH8tViuAgwAQd86dRujhzpn10ehOgRdsS+UpzP7Ze7+NgKXSaHpJKjmWr+QbISlaV1zYKK4EAsbTRZvjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IVTj4Z6w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H/5NAo19; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IVTj4Z6w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H/5NAo19"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SM9MH8937606
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 22:54:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qaaIg3gvt+W7J5Dpnsp8EdV5
	SRcVyaxwovZUztMqYmM=; b=IVTj4Z6w48vDnABsrjEnb363TqfizJ+SNkX0KG6E
	XLKlk2hyKGozaj8SZ3OT0/Nenbli2kQMw7PIRzIyG2Wybv3CEC3TpRtig0023lvM
	wvTCfKvokAjF8rIxyx1ULFNUmunw2mDYeZuYqP/hNDXkoEV/LvkpJddGPGzWn5wS
	U+LAqFEgwMks/TqoY/12WvTSGaXSJGUiN8HMyMzqllue4V37eDb4BeHCdasWgyyi
	zxdvWOuW/HN1RbGkOm2maJ83M38RCA+66D7NTZ3NUPrQymz70Ue6BVw/4b3TnYuv
	9qPGRYUNyXM5WfZT/I0R50loFRbaf6sk6PGWZxxDyGYnTQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27pf3kuu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 22:54:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92d1cae5740so104429885a.0
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 15:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782687244; x=1783292044; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qaaIg3gvt+W7J5Dpnsp8EdV5SRcVyaxwovZUztMqYmM=;
        b=H/5NAo19PCh+YIAsK/vxsm3MVURdnYziUFSLd5hONDwBVTf/cK7WrLcOTbj387lEhY
         qHyr4qQZJ7h60omvgYmJ49go/v+9dnrScxAKBxL03ZuPS5Px4E1PdHz+v5ZMKuih+Fy5
         LwL62qj1VxK5NTHKBPi98Y8uGlXK05e0A0edLO1fA97O+wiMmNe91XgG5wBr0/fp3prV
         TYXAwf1QPYJeN+1AiNdzfJ7uiheiQfufOn6O4RfIFuW+GXVwgomyJjpa90rfVl7W8HCc
         m+Ma8yaJdKSlBkg2Y8wyVJZ9ZlZy4q9C43LBwue4AavEnPrI6pc8AdjDpwkhhEpVhSHs
         YBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782687244; x=1783292044;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qaaIg3gvt+W7J5Dpnsp8EdV5SRcVyaxwovZUztMqYmM=;
        b=bPPlRIrEbbbMlxoSU7eQsV7VMQvYS8SioProb37um2/uFyFdOv73ejdBkgmLpX27pq
         5PGt0qUJCUoJZaPXR9zChmzu3npGHJ6hihkraL9ZXmXsa2LZCq25DPR4kzFpah5k+Sre
         nO254U5OSoHpB6Q7zPDd4GKESIPgmjEA4du74a90DVS721/WyyacQg/nHsZDKjS+Y84S
         7VeO41lO+WWC/KTnKrU6TqwI5ju4cogU5MoXYBAvwI0I/fAXla51tm8SzU4pjqF4WwKM
         vKD7cECc1jSKl5sbDSwM9jC8SflMf/xHtg/VxdfHvxLPSP1CWymqne5KBANZ637Ww6Hd
         2gow==
X-Forwarded-Encrypted: i=1; AFNElJ8/KQYZXByCbk4wTUnZfLRxkIqg7dxthK8gvdQUv1csYwSG0T965NWOeojJe7YaLVrQOIMBWN0sgMzV@vger.kernel.org
X-Gm-Message-State: AOJu0YzBOvsdEBJM7xS+Hv1KFCvSjpDFunFRZpH6Xv0HMxXUNNgBqwdi
	ZHAoMkhqKMRit9+ByM+FyKui+nlv8Kyz1g8Fn+yg965EpxiMxSs2aFtkgrYlFQtzBv6ZQui3J54
	+hoevCesy7c9mUruqCnYlSmPZKkDAPKLLx17Luhv8aGFm8ng/R3L0bOaOnASmXoQZ
X-Gm-Gg: AfdE7cmhF36g4Z+wbAvLxA8c4yQLgxAXSsdFeTFe6w8spk90xScxFurwUN3T7FEfwCc
	gOJoisCqktcXyV1vkov563RIsswCzNefa5DEyxDG63O1pW0IJL4c2Q0UmCkBAadtF7E3fZhC7BI
	YLypVfrKIatK2x/FOKrwLMpE9i/QZBj8nROkXhcf8pr0Ucs2T36lt+1MC+y1UayvtoqYN8GFYsv
	zT0Ev8rYsD4R1xYSHaV1Sz58B9suRag/uA4SVX+YuUH+WbzSxRZB31hGwifv2D7JU9ZSHm4iUHb
	UCsSZGIN1OUx2SV2tKWHJ9SxfKF+J23aMeZb7bo0cICUnv+xhcoUIntkbu8RiNGJPpz11d8CWiY
	lyVzAEuoh9WZdE6Sh+8cI5IYRZWjEg68tQzkNLhCgdcQ664Ita5l0zy3Gz8ZiJABhZs6I3vxZA0
	y4mbibQB7NAjNwYPDZt+ybw1Nq
X-Received: by 2002:a05:620a:414c:b0:92e:51ee:7945 with SMTP id af79cd13be357-92e51ee8ae6mr177012685a.30.1782687244478;
        Sun, 28 Jun 2026 15:54:04 -0700 (PDT)
X-Received: by 2002:a05:620a:414c:b0:92e:51ee:7945 with SMTP id af79cd13be357-92e51ee8ae6mr177010785a.30.1782687243961;
        Sun, 28 Jun 2026 15:54:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad69585b6bsm5327111e87.80.2026.06.28.15.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 15:54:01 -0700 (PDT)
Date: Mon, 29 Jun 2026 01:53:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Aditya Sherawat <asherawa@qti.qualcomm.com>
Subject: Re: [PATCH v3 8/8] arm64: dts: qcom: shikra-iqs-evk: Enable A704 GPU
Message-ID: <kz5fw4hqblmumabhooyupyxqmfwadkas57brxs2qxvnbn37v6r@jjrmk5ckqbc7>
References: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
 <20260628-shikra-gpu-v3-8-9b28a3b167e1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628-shikra-gpu-v3-8-9b28a3b167e1@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDIwNyBTYWx0ZWRfXzKwf3l39Tedw
 EF6pHkA4NccEWDg14+1BFbfBErzkyHJBnmWRdRM+kScnfb/lM8Kbqntsss2gd1hLWS1zYTS420y
 1U4LIwUl5OUvKDJbiAIcRXH8cXQGUJ4=
X-Proofpoint-GUID: VUqyd65T3dggtwbn_uz1wiPmizHXXZv6
X-Proofpoint-ORIG-GUID: VUqyd65T3dggtwbn_uz1wiPmizHXXZv6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDIwNyBTYWx0ZWRfX7aKNAYuKVDVS
 mQfs4AaFTCQAza/W5HFf/x3tPqF52JDDiLbBCvki2Ie80OD06vakyBkUHdPQCtApZ9yQXSWVvvj
 x5f9St7Guk70pwV9eBWO+dkG5M9VpkSB9N36IGu6uI9aH1ikOcTxQHda0zN9IXRg8HJqUDpt/AT
 nvIfwckRLSkzBKfFCNiYGPhsfiR0tATBwaRaqeSywD8YfISlvs1dD9u237gBqM0LTTpGLagJdoU
 27jdakJLn1TdbXV8zu/JKLd56a7z8xnj9McbfEej/PgfqRg7qitbfx1s/Xg/dGS9KYXwdTuSyGm
 BLEr4eTg12ipUvhuy2KdBvuvoWtOI1JMOpInD6cnLZE75qWlo4Q+8Typ7KSkcAg30rlzRD6r2t+
 rLec9615/yMusOZwh1pbDn4EkNf3KFeIA2hZQPK1hf/So+sNfPv2IlBVWpm1zNrjzYSFFSVQ6Q3
 J3+QeRpgByvQ3RZ5wHw==
X-Authority-Analysis: v=2.4 cv=R7Mz39RX c=1 sm=1 tr=0 ts=6a41a60d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=UQAiW8fk4jwks4S4FoYA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280207

On Sun, Jun 28, 2026 at 11:54:01PM +0530, Akhil P Oommen wrote:
> From: Aditya Sherawat <asherawa@qti.qualcomm.com>
> 
> Enable the A704 GPU and configure its zap-shader firmware on the
> Shikra IQS EVK board.
> 
> Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
