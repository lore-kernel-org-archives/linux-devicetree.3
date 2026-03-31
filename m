Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E6D44CAE2
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 18:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774980170; cv=none; b=FUNO9bKv/4vQ69gan/93+spPXFJh6xypyc5Kho5ErprDeFG+l4EG2Qtzq4oYUr2cZzq/uJ/amY2yHXYVorbBX8isZcvkcJ+HyUKrqbXcmuC3DHBnlKZ+oEBeKWTiBPUf5D7JnCVnX50kAcevF3itPG/J8FUFJEpao02EgbrNM58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774980170; c=relaxed/simple;
	bh=kIInkhogl/9wzYo8dZxkZhYWKYdhxVy+w7gomLAghpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eMuQOn02tBnB3ucvr/4s8YsU9d7nWK470+RNMVjCrive1NtRvcFS6yEZTdA4FbOnzg1B+xNj943noon7YacflDqThM5p9u26uN4Z0x0bUvjCtox0pSg/kdym/Nc6TQF1bDVlja3uq6LR5/dEHxWe5MN1Yf1CkGkwi4pRt85RImE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bq80lq1q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e6FmNjGO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bq80lq1q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e6FmNjGO"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VGdN40639229
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 18:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LYXeANNp46O1Wvc2Yi4Z6Cnt
	sJP9GZeKSl3LmHEd+g4=; b=Bq80lq1qXm4jm4w3ZSiGiGf1Hwr9wCOzc5Wlf36I
	mQf5Lf/ILp68saPNi3SvLQDOxUGMwr916/tsYMVQ0gVgEf/toRmZD3ZToHxT73K5
	GsbbYE34staRCZ+rEcCAK1ayaU2ZAKZx+ByCLRwggdKzLQS6ocoRMKnhOjMPPT8o
	N66kkfdK6G7dkg9PQsaMa2VGIPOvLf9Wv+cz8K9MS78kWBs7J5PKnJn0zpNNBBrV
	2tmf7lB7/Hf4xvX9zEdjGWk4/QAusxPUJlsE1wpXWZvie9NRZ8ck2oWAZH/Ufiis
	tNleTOTbYXCZjPR+/wXK13+t2lhkimVwlHZa/zYI7R+1DQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8g2as1yx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 18:02:47 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56cc7b6730cso470761e0c.0
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 11:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774980167; x=1775584967; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LYXeANNp46O1Wvc2Yi4Z6CntsJP9GZeKSl3LmHEd+g4=;
        b=e6FmNjGO43R1MIbhkJdjihCT9RcZLSxwheppGHQ/r1wWZOhO0fLzpbrxN39Oam61vT
         NTeb2iInZCzkRaofFwZfJSCm02B/lqzBWfiZ9QxbFuR6ujsv6HJJSXABDXZYPowHKlAp
         57JeT1J2UsCAI5KxJ+Hi+tyIkHv2h8IR2bLVJhW4jeZ4N8LtLUoDNd11O6uUQiM5f1rt
         iTAQvuRv/wpmuxvthOAcxbSmttoB5EmZfbzpO+k0YfdkH5UoExhRF8c/0ZTFRHejDuTt
         gIDgbtvEtHlQfVyjxQSEEC9nIURi+8jcEvszaRX1znIwhK2ClM4SlgrwU2CSRFBBGdp6
         xhxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774980167; x=1775584967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LYXeANNp46O1Wvc2Yi4Z6CntsJP9GZeKSl3LmHEd+g4=;
        b=iiI256iNrqYa9wHstQrO5HLtICrBV8fw/2JeNb8WzVGqoMqjIZOed+M/e8VjoQmes6
         tQRElMGRT+XeAUG64WC+UxHWSjSBCAPFk10L6A5u14bV9EA4p/bIL14mYNKmrIEI72VQ
         iOQ/Yk420Og9y6fdwwww868BVOdzqqFoyvqsKLM5BlT3nS3eGRwEYY2ykshaT3TxwxqN
         tPpeMI1Ttv2Q+NDiLJr31l/gyw/uhw6c1s6M+InFAKqJO9GoxebAPgrBiJiQWSbqfZ2t
         GMK0pW3EJ9OMN/J7UIR+39X6uy72+7XPVZ+QWdT3w+GM22BrJZMKpJ3y8XTgEYBLzaSa
         2eqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVv0/w8obsC5OZ26RojeEyM6qncxr+Rh/EGSYpnfu3PqbMT4M8sEOPlntmekiJKNIxjGqo2TUBagkqp@vger.kernel.org
X-Gm-Message-State: AOJu0YyUMRmYn1wW7Cqfb3sFdBF9gMHHut6zaIICsh8JbDoGFvrSeGKy
	eiwuUXfelmnerF8SLSlpgWY3KLsOYvDMHHa3P2d8nSp8EyAumIxyUEG1ci5PSkgK1BIFTy6QuGE
	QIicQ4ILlvO8No+odK2KOoD61KS38wIy6Ua8ttFmi0wY7sWOsCbGL5yhsCPgTbeDd
X-Gm-Gg: ATEYQzy5W7aFIj/xPRzUUiwjfmkmxqlEJo0rUkfDElFmJgABpRPCC/FKw1Og8UFD+oP
	ex9lFr+6pFt/s7mQIFWl5Lh3l37WKmPHb/Y+f+8OftlJ8armYbbkfjoBpVoyAOgX7IEKK1It5dU
	1ucOBKKerik9A6/MSCYXLR/BdSzhMau8nOI1dG/+GjG1mgjGW5qs0Z2zDqZ6aQ1Jm8sU3E8pCA+
	lR7KgP5p55xy4JPs706W2CgLsh/YlzSgsIx3u3Wi8ufEQcNhVP3t/znpxUatFHWWhm4h4NQXw17
	RqRnYGG5kt5gU+V+3twI+Q0BS3/fFjhPOpqelv7L5FWUCQqlyTWZr/FE4W8R7uB+U2JRwQ8/XRM
	XkTDYAulGCAELRfRX5q3wOEUcBWA69+/ZU2UPyWeuhAvJvEv/Vl4eNsvhSdrycYn5qrpg9OL9W5
	ydZAwcG6rhLlCFILmruVrOpAtuA3cdstrLM5s=
X-Received: by 2002:a05:6122:c20f:b0:56d:892e:e291 with SMTP id 71dfb90a1353d-56d892ef3ebmr468954e0c.9.1774980166704;
        Tue, 31 Mar 2026 11:02:46 -0700 (PDT)
X-Received: by 2002:a05:6122:c20f:b0:56d:892e:e291 with SMTP id 71dfb90a1353d-56d892ef3ebmr468913e0c.9.1774980166224;
        Tue, 31 Mar 2026 11:02:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13fd008sm2656909e87.19.2026.03.31.11.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 11:02:44 -0700 (PDT)
Date: Tue, 31 Mar 2026 21:02:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: glymur: Add qfprom efuse node
Message-ID: <e4ehmqufnyfwqyedxc7ibu5jnjvfm7ghlxbai2usy45zbt33n7@qkfbhvnx5i3f>
References: <20260331-glymur-qfprom-v1-0-5b4284d23c80@oss.qualcomm.com>
 <20260331-glymur-qfprom-v1-2-5b4284d23c80@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331-glymur-qfprom-v1-2-5b4284d23c80@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE3MyBTYWx0ZWRfX1PC4aFXDOivL
 DCN1dIW5A7P8Punj3s/JkEqr1g5+Yiz+QhnBxulKKhwslyn09a4oQtMH0xmS4VqzD/zSo9H1TbB
 u/JS5oBvkFNm2T+Fvzce4YgNT4WlSaUF6kbDz2lBN4pw38dwBM66sR2f4Ggqbx33hFtBX4dSo35
 ztprqDdoyvh2N9z0ZIH6xnl/YufSQzbaeycLxFqnflsB8Jc5d4ii344pVW+YfIFN3J9t1/BHTzr
 xhkFHbYZftx9ztk9KEFJSr30knI2asluM60jt43TEzPGdK/3Xasw++PHRN4FnxbvK6ZEqb6Vcs5
 JdM2W0zQnGHHveCsRYn84s9vLqMfzl7EJBj02NNcjsutQKbT+Kd9g36ZR9K5zSZFSV43+o6tnke
 G28KMC/Jp5yKcZYXIH3TeQceyk9vJwL45LtDD5ynLXSuPVU0uJ80U8d7lUrKz0vLU0wDx8o7SVx
 Uzjf+6e1tdlMBDwzxBg==
X-Authority-Analysis: v=2.4 cv=G4ER0tk5 c=1 sm=1 tr=0 ts=69cc0c47 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=6WES_QNn75EKstuLRTMA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: rXBLTx7dhQjlk0wQnFYsH50bxjW1azWS
X-Proofpoint-ORIG-GUID: rXBLTx7dhQjlk0wQnFYsH50bxjW1azWS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310173

On Tue, Mar 31, 2026 at 07:24:21PM +0530, Pankaj Patil wrote:
> Add the qfprom (Qualcomm Fuse ROM) efuse node and gpu speed bin child
> node for Glymur SoC
> 
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
