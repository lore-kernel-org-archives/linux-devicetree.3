Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22E921B192
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 19:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775503872; cv=none; b=fXlJ+WHudQw6DPxuon0/JAGsaUX97iyUW2SF/tjDmHp7qN9NWrMOBe+5VQvCg0aB+2Y9K2bY7SRP3ALK44dtjSXeGb/t88tgWFbmMc0Nu038TRnNXAPCcPAOev9H+vqmEar/hWjGH1GCG+xVJ3lSSKr9G4yLOsYYmeRUB7LXpbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775503872; c=relaxed/simple;
	bh=+K1I0gLk9D4lY4MWqXbRs/6gCZue4rSPha+hNOGkjCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RbH8RRSolwwhT2Zprzn0etIHI52Y6AZgc4F+zGHlz0mDBMIfTFHNN4BN84o53nixG0ijH0//tuhM0RDq/yZWrXVN1SYwEzs2pBwJbwfz8eMZH4cxUrgscvgwRVTIxCTjrLO7dW7DuiLjmkNg88GIHcwRvwxuel4n9riDJVtJd0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OlnFJ70t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QbxG7CDU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OlnFJ70t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QbxG7CDU"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636Iflht143968
	for <devicetree@vger.kernel.org>; Mon, 6 Apr 2026 19:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OUAuVjw6jEh5pPAasMROYRXs
	e/6RfPXa/nkfNBAA0nk=; b=OlnFJ70t71mGdOYa/puFjkdf8qip+O5zcH7ThoSg
	gJXAd4yXbzlxdjC6qKBnvhAcOdiW+wGv13YL6AXISmlMq+KYcpr/Fk7ZgghmPAYZ
	xKDXAbK/sMJR6R+nHCCi2047ceZWcMUnKVOyEjZHyULB9TE/PotJ25bk1Myk/Dlk
	dOUuZLeHNOduqPM/3u6eYXF9bT2mUGWSZ/J4T3D38hgdCWp8aZl83IyYkqrA5LHj
	J84pxhAx5vpoVPsp1EMebALJALXR8lY+zDpf3yK2Y/i2AmiD2SYee3j2/pEep41n
	eb5pXWyv1Ktt6aJ3UovGI8UIrFtZhReLfoaY8SxtsWW3zg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcer891cy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 19:31:11 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-60521f54387so1851449137.1
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 12:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775503870; x=1776108670; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OUAuVjw6jEh5pPAasMROYRXse/6RfPXa/nkfNBAA0nk=;
        b=QbxG7CDUbbx2EtxUR8G9+Sjv/4RH4f8oNsfZshpm+wsrhw8pZrKxDvYk4UYmbtcw6m
         Y8C/G30nSbKUIYR692hLqXCCXe31WLvVv7dXX60S0obL1lINazEir3Arv0e8VQAH+8hA
         9IVHHulNWPILY4lgdsbCa/Cf7kgbWymvuCmcQmzPqrrgqGVdmgH9jYB37ZGEOpy8bwvk
         P+yyNZOTJMsxR5Ul0wZE9ZgZZTd51LVfCfIdofEXfIPVIADRzHNhrpEZXD0teRiYEMJh
         ev7s/Bafd+EQSrfafdb2bzadhNtHFILEXKdDOkkkovEg4UgElhW706bNImEE8aBva0VM
         buKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775503870; x=1776108670;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OUAuVjw6jEh5pPAasMROYRXse/6RfPXa/nkfNBAA0nk=;
        b=JwYVGXShjbpgb01U2h9L+g8habgp9qfPZ+7zN/wjeh8pCJt8aKcAc32Tw6wAmNSZRo
         C0Vf/LGKfpYjhbeiwbG3kRDKq4xeoqJVxNbT9JVcJ4aUmBEdSfXg9mQitqrHVgGHI57c
         1iMNZ7wrFWK5ngBAFYAnhsc0bPdRI8yhaGOqj3dHPWAvDLpFVoap2lXCyA6zVQ25+nqt
         a1LRcP/5UmXnanpuHkuvsHEjA5fp6gAIrGE563aOyTohIcXo6KMtG5QlOsWcUrhfpaDS
         ioB2aU2A+qpVWGAOJ3lIW6rbSgXTKvpo7UFmEcsT5srqjE8NQjHNdw+0MPh3bwAdW7Z4
         o8Hw==
X-Forwarded-Encrypted: i=1; AJvYcCUQA/77B88qNWLnPazN672h+dvf/82PpMIqDOJW+uzBDvHNzDLd1IA6ZsYGx3BtooAEsLMH/ldmbqwS@vger.kernel.org
X-Gm-Message-State: AOJu0YyXY+b/WFcvLtskiReA7dmeqGFsKpWVRYo2AxIVyl8y+nJQoUQM
	XYxreEHSZkTkgWkLtP/NH3WM7e4oyFJhRIxgVaat970TWnDdQgbochqgKkbHuuMz7CehwMawk/B
	SqzSmOItw3vv2OtsLrjFQt8rY4Y6EVfrIkdOHnitZF7IUL8tdz9aNXbv4UuFfZU54
X-Gm-Gg: AeBDieukpE98qz7fCrAUXKRWVKgT+8HCqEPAZfe6nHwNL9pway9eYq71M7O2KWa33FB
	jB6PdK6I8edz5+zHgxrdTb4gpunemoE9y/ltDBXRdnAQWz9ch2nzZf1A5HjiKZCGJUOJfgvEnh/
	0QNABQtu2fA21qrOU6GGSAMtTHgYtJ+bEPl7E0y8lek+zT0G87+INniFqqOJwzWZU5LKv6B08Fp
	VvFu39Ha/l+5J4T086sSWoFfAXy8E8wm9JISZpHJXd90IqakWrCCQFZyB/J6gwMzeqBXwmQYmWN
	agB92JZUv9H4fC+Setfy44H6T0l5HQlsm90twECAbbfV0RC+kGmUV/eCj/ESwX2bZl4mAc4bsWy
	bHCzrliZHI0mOa7nwNI7j2BKi3jdYM4ABqJk74SaTKbIjTM+gGue6Pg9aF+00Jda3qRQU/IjTlT
	jtkLIGxif6WGEsxeqsgEfHaj3STET8wKG9/HQ=
X-Received: by 2002:a67:e718:0:b0:605:2df4:c5f7 with SMTP id ada2fe7eead31-605a4ed577emr5141692137.11.1775503870021;
        Mon, 06 Apr 2026 12:31:10 -0700 (PDT)
X-Received: by 2002:a67:e718:0:b0:605:2df4:c5f7 with SMTP id ada2fe7eead31-605a4ed577emr5141671137.11.1775503869582;
        Mon, 06 Apr 2026 12:31:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd217c96asm32724171fa.40.2026.04.06.12.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 12:31:08 -0700 (PDT)
Date: Mon, 6 Apr 2026 22:31:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: fix temp-alarm probe failure for
 PMH0104 on Glymur
Message-ID: <3n7grsucqh3k7cxfikytjatx7r6s3cxg4wpanm3wp6zn5ohamm@kuzz3xih6u7e>
References: <20260406-glymur-pmh0104-temp-alarm-fix-v1-1-4441b7b01f85@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406-glymur-pmh0104-temp-alarm-fix-v1-1-4441b7b01f85@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE5MSBTYWx0ZWRfXyjYfEP43/H4q
 3zzNEUuv96zbB+j+KJx6AbEd/252Z5AiBYUFmXh6vYxEgCJCjmEQW8ra2qWymLPOWSfL8tP4WJ7
 15sE5WBXfM5DFmBnxxtcdch66tA0gQFe8+bhZFDkr93PG7whk9oV8ZPuhZunCNUxAyO9Rh8XuFc
 W9LQIYuuKvyj0mA+/KEw/v1HXKfqDHSdH399CPGLmJ6n4DpTpvpKXvrxC5uJYwXgbXlGkKU2P/S
 SDbHfaOpvzyl7S+Gxaoe/ItKD6teaHXRL+k0DGF1MrI7DVcNTxPNvVGvvjxgq39oPEgTTc28qaM
 7L7ImVPLvlXf+/L0R3cSo4nPdasSWe/t+t2z2+n+HXSOdF1/0I58i0t1OYuM7xZ4813DYIqYPRV
 g9nO+G8ajBzLJpX+KoU74cNYnTWYYeW9EoAXdvFIRJwgbFy6uREQsTJ/BBl7rULfOKHnuy3qUZs
 sjq+XbDfqjK6FvHps4w==
X-Proofpoint-ORIG-GUID: Z8JsN_1uka1qhbUR1TObVo2MeFWraWo-
X-Authority-Analysis: v=2.4 cv=EPwLElZC c=1 sm=1 tr=0 ts=69d409ff cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=QfO9YVjIzUkd18xYenoA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: Z8JsN_1uka1qhbUR1TObVo2MeFWraWo-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060191

On Mon, Apr 06, 2026 at 07:05:55PM +0530, Kamal Wadhwa wrote:
> The temp-alarm driver probe is failing for the pmh0104 PMICs on glymur.
> 
> [    3.999713] spmi-temp-alarm c426000.spmi:pmic@8:temp-alarm@a00: error -ENODEV: failed to register sensor
> [    4.015066] spmi-temp-alarm c426000.spmi:pmic@9:temp-alarm@a00: error -ENODEV: failed to register sensor
> [    4.033908] spmi-temp-alarm c437000.spmi:pmic@b:temp-alarm@a00: error -ENODEV: failed to register sensor
> 
> This happens because thermal zone associated with the temp alarm was
> defined under the thermal zones parent node which had a typo (used `_` in
> place of `-`). Correct the typo to fix probe failure.
> 
> Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
