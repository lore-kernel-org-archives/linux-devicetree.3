Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2153E3D9F
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 11:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776943523; cv=none; b=pFaWOXgl51W0QIiXonU7FhxJpUFc6MiuQxFxhGy9pZJYGNLPEAMsi3J5qJ9JAKyv79Lw3zEZUhC2uNG4rFg6i9Ivc3FOvmupCBefECCc5r5GsHV8n+CrDuxszBw2Q11Un8+N/BqzsPL2w3b58jEryyaQvC+465K/cunP73ZB2j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776943523; c=relaxed/simple;
	bh=3e/Bukqld3/AhQcxvSC4Dm1DjhyBv1SR72paHIoNeH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T8688jfq7Kj1kPz6378LUZihY0MIuGYSeTc703GiudzOjllUtlogp59hXCk27Owe1HiF7h/QOFeFX3I+oNTy5N6zvL9RiwEo24edH4Sr57X+d4tVX8AxkQWtdBtJ+5biUPG3It3kVbkLuc+pUusSsM/FCVPlv5v3Yav5gLoAbVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T72AYGGF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cRgtJvp/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T72AYGGF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cRgtJvp/"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uEsP3044048
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 11:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kG3o5KtIoxE/ghJwc3oea4PG
	h8esBtSee1qVGzcAX0I=; b=T72AYGGFpOClFeIfc2rDVXqOeRjVq76g7cGCoAGE
	IGCvjE2ZksdMdeq44l4r6BfOE5lnCJlauAX6CHxNaod3uDiUT/gdGHQwedpyoFF8
	fFkKQnEzSDcCDOWsCRVNQcyhGDjky1v4/rDbG5HaBA0+zyqxhQRcxcChfzvyFclN
	eqkdimN4Ew9/OqjbVexY7G7Z8NhMucQXm/3nCCyZuqOSj98jTIkPjjoDItyjhkyp
	RlN+BPU+ngSjKiL0Byz/938gPI2z35v4LH28b0HBs3JXCtpEuHNZOqb0wZGAIv5N
	bfzRC/KWd/1Fuw31qkGgyaif1OgPWro6Z/H1zJw1c/wpgw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1jh3kjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 11:25:20 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2de07c12745so11276342eec.1
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 04:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776943519; x=1777548319; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kG3o5KtIoxE/ghJwc3oea4PGh8esBtSee1qVGzcAX0I=;
        b=cRgtJvp/PCoxbNK7grmtQLHB8b7fr7tkK4m3mOAxq5Fh/cEzwizC/InEZ+3xXL7Z02
         XBdD9jzn4FSWZFii58QLS/kEDhC73wy77E8DLmCY+sbDX/0r/pXt25quGmAq/jcvSesD
         07FsicFRuZmpasffavpZwUXBgcm7EWID5mPQvngc+QNQfbD7U22/Xk+KLvUwYU91YdCh
         YErvdeRXWDFy6TnTZ0laulpzm7pd3G0DKy8K6Pfv3CDjXkWpCXXkd7NKIimbvGAvNb9Z
         lnKsuGNnfwF6vrbla4ulBQ5KLGtPWzx/Gyy01I2RvBUt+MT/Tjqg5cA/dDFcCHWd4WMZ
         SvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776943519; x=1777548319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kG3o5KtIoxE/ghJwc3oea4PGh8esBtSee1qVGzcAX0I=;
        b=mxmsyUYyPKU4cX35sOxEbfOlfo5wdFGBcvKlVdvADSani0DlF5kU4xar72NGEyD6Zv
         TBsjDk4j1woyPe9ewX7dR68aiPijMpFKkhaWSPU/i/rTKFSTvDgJAZco6YlcgiqE7/Z5
         uILhdxfCCF1VJOBUWoOoDtqpa+vYGkimTtgQRabynuV7pxCZ7gbydtYEnrjBKirqRNIp
         K8oy+om6Sv1shnybmnaby2KIHp2rsZM8JKBbtuA65UH1n1ejX8ucOzkFe6lA3vTtgxUg
         7TUPH51+KkMdgYH4l3SljNfIkAHPVOSCzBnN8s97z1lwMERN2KvLDBCKHMEixSEeiH/C
         s2kw==
X-Forwarded-Encrypted: i=1; AFNElJ9Vqpws6J9A7OPyIwsYVqURsISRIXrYdRvjYo9goWWUYNzzg/hINL8aa3M0GH7zEI92t6GKcvFe79a9@vger.kernel.org
X-Gm-Message-State: AOJu0YyxtWTC7FhE8nuBZc28lRlqnlGkLJCcnBbiQ1omzZUetj1Qm7Va
	MBCmc2Aye+70tc2Qp5rOiOKivDRms/bA51wpXAUrMemSmmmOGfanZiAwWw9k0Qic65/rBNX6VCD
	fYokWKeeDrBjd8geHy89VvYYiYyXPAxPF9BtIZz+z8MIWPJ3hLj+8NHRjQ7oSbLQs
X-Gm-Gg: AeBDietWw7/UpsoGeSRdwGaO2OZNsU17wFv0pLDYZNICN2gOJ/WjpRPc5mC9Fcb96DN
	X1esJxziL2g6TP+sAVuon2NRp8WRLT/MmEiEyB2oT7UrswVigAZnZowX+X6tDdK7cis55/Qe8eC
	gI+xvEZke9dlnAIEvMCYOMQk7hTrkKCxWv+xl3i7Pu9MkxveC5r6EFuGvXbrYJrsV2yyQQeuXB8
	kzdeXBSsyOnr5GhOlGEB3yKCqzeKGWcXAsPnvuUqrHrPNO0lw7wNRxb+pbDkka1qYQV+34iebOg
	FFhZnJjjx/odeXPYPzpNMfDRL0u1nbvg8vZCSfW+3nkgJXl9fBS/bvSlRO1ObPvlzFLquBFyKn5
	dU1EPViODAq5Rq+6MrHUrfwtUfmOxOm8eNxACzX8R1xBgvNC/g5//lu5KLmpmg5lUycIZT3A4ns
	tAEQS5tg==
X-Received: by 2002:a05:7300:d706:b0:2c7:2c0b:f33b with SMTP id 5a478bee46e88-2e479d07dcamr16549651eec.20.1776943518979;
        Thu, 23 Apr 2026 04:25:18 -0700 (PDT)
X-Received: by 2002:a05:7300:d706:b0:2c7:2c0b:f33b with SMTP id 5a478bee46e88-2e479d07dcamr16549631eec.20.1776943518396;
        Thu, 23 Apr 2026 04:25:18 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53dcb487bsm27489855eec.31.2026.04.23.04.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 04:25:18 -0700 (PDT)
Date: Thu, 23 Apr 2026 04:25:16 -0700
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 2/2] arch: arm64: boot: dts: qcom: add IMEM and PIL
 regions for glymur
Message-ID: <aeoBnJ0ddy6dxhw2@hu-anancv-lv.qualcomm.com>
References: <20260327-glymur-imem-v4-0-8fe0f20ad9fd@oss.qualcomm.com>
 <20260327-glymur-imem-v4-2-8fe0f20ad9fd@oss.qualcomm.com>
 <f087dfbc-ec6a-44f9-a119-2255f49d4bc4@oss.qualcomm.com>
 <aedHuu3Ouro5jPcj@hu-anancv-lv.qualcomm.com>
 <77111d7c-4f18-4c6b-a3fd-b5e2981939dd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77111d7c-4f18-4c6b-a3fd-b5e2981939dd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDExMyBTYWx0ZWRfX47sslciqVQoZ
 5ONI/MNy/3qLNomn2IilFyitaYXgrmC9LGeyzrUn5jcW2+xMroTjyH/ARecwY+ysnoT+Xd6SDVa
 I3wPQUtip+CS2xuy9cJnErJZvkFpTfElRma2tjqIwG95JuFM09Ysiym24bOauQoQA8Igz07/pWr
 9D8cFq36UQ0M3LefywN1Cm17hAFkmfKQcB2MqUC5LcwxyB7xfWO1ADXIuxOTOyGU4leXj0ERkF6
 N0tJss553PTPFIDS/ZE5YjOuChJT2BcDoWt77L2cbCmGpMr6JP/hQGfDZNELRkwhON4LPtgHdoa
 G3Vk0tXKqKBKCe+z+UU0qzEvi6QOZe1UIqxpk9RAMm3rjj84vNDyeE1QMXINkiuzKMLRvUxX7qw
 bJrHmsX7Yp7IArHhRdk+zXdprZmDZigze6fd+YQlWAITJxz5ygk9ofyH/NNTRXpaBK/5tb4N9ek
 MpOhaDGGsRMisJs+00w==
X-Authority-Analysis: v=2.4 cv=OeyoyBTY c=1 sm=1 tr=0 ts=69ea01a0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=UrVpMDgfXf5DSJTZeJIA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: XaezPbN_6J0slCvvnXOemcuw8dJLc79l
X-Proofpoint-ORIG-GUID: XaezPbN_6J0slCvvnXOemcuw8dJLc79l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230113

On Wed, Apr 22, 2026 at 01:07:46PM +0200, Konrad Dybcio wrote:
> On 4/21/26 11:47 AM, Ananthu C V wrote:
> > Hi Konrad,
> > 
> > On Wed, Apr 08, 2026 at 11:42:14AM +0200, Konrad Dybcio wrote:
> >> On 3/27/26 11:24 AM, Ananthu C V wrote:
> >>> Add an IMEM on glymur which falls back to mmio-sram and define the
> >>> PIL relocation info region as its child, for post mortem tools to
> >>> locate the loaded remoteprocs.
> >>>
> >>> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 16 ++++++++++++++++
> >>>  1 file changed, 16 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> >>> index 4886e87ebd49..21ae05f0ee17 100644
> >>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> >>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> >>> @@ -6457,6 +6457,22 @@ rx-pins {
> >>>  			};
> >>>  		};
> >>>  
> >>> +		sram@14680000 {
> >>> +			compatible = "qcom,glymur-imem", "mmio-sram";
> >>> +			reg = <0x0 0x14680000 0x0 0x1000>;
> >>> +			ranges = <0 0 0x14680000 0x1000>;
> >>
> >> size=0x2c_000
> > 
> > on glymur the imem region is a 4kb region of size 0x1000.
> 
> No.. that's the "shared" slice of it

Indeed, I missed out on mentioning the "shared" word. The size of the whole
imem region is indeed 0x2c_000. I used kaanapali, which only mentions the
shared imem region, as a reference before. I'll make a revision to reflect
the whole imem region size. Thanks for the review.

Best,
Ananthu
