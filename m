Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712812;
	b=dtUC0koUjSxn/HlPrV/gLES+o5/xSnzQpa+DQnnbORvAvz0W4NRmUKzHeeUTNcl2CMiN
	 KksSapqWR0QsbIKLyS/vYFH5naeIJ77TYL45C2Uz18CiuqsVInXTckyRplLMrRutD70Bj
	 hQwvu6mR2K/+LHRi6gSOsDvMQzjEJX+yuGpt9TXjzDseOPf8JI6cMWT4MyoCFJG16qhLl
	 /9+q2ATJs18DFSOmDLcMRkD4qcz/9KpjrfvwubhDMxSk8BJcveteUQ1y8FbTgv8l5hFEJ
	 MaOR4DJbRBARKBVZGGfNZcmSAWY5iYw8YVuCPrHaGpWPXiDaZ8GWX7rsQQzHJrJzi7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712812;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=iQP0DffgHZK1//+ou8ZDmPpNoN8WnAJil4ETuCdPbuw=;
	b=j/jeJXn7mFc25PFNUSEKvfo2dsJFrSqU4EkU+0GtT07QDhl+qZ3YO1h4U+PWAbT69seE
	 NjXR5afMYJ4YjDIVsxfFBPpRelW2BhNAtMqwwcatC5Qcdx6nnDnmpMT0SmUl94iGcYjsG
	 APIU04D5wCpNtcBXBrNCcnahFlq0r60DiAHgEb2NkyN1dGeeZ9me/PO+ILQ69/LQuCali
	 Sb29F6xZsXmbEWV3ngn4X32KYU6CAl6BYXfZPZFJi9qOmNj3ILLYiQyWmrK945W1JKguB
	 rkK6cIv/NkHiM598R3uSYsSEaZVGFGVUEglgOOnz8Oaobp6/SIZJrv7e9UX1W9IVOAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="MSO/3svB";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bJeNL43F;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC05960A2630
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 13:33:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC05960A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MSO/3svB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bJeNL43F
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3Cl95c2344360
	for <devicetree@vger.kernel.org>; Tue, 3 Nov 2026 13:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iQP0DffgHZK1//+ou8ZDmPpN
	oN8WnAJil4ETuCdPbuw=; b=MSO/3svBkez6VG0Vv+LeY1+7Kyq5hXZ4kt7PeNjr
	5c1IYcz5yvdrVLTXOKPQZvZ5osMXAPK2tQJ44o9TAyYiApulqHTN+bHa8Zs70oqD
	VDQE+WRZCxOGuqLg+f9cwFP7jpfisAsxDuSZjkYmd7xk+Yn/tv6WZ52cvXZBBGJ7
	RprlSD1WdkS+bEFanAit0B4fgrhT2Y2GRJ2wJlU/13El6CRqEDCxnmMa4G+QlQ+t
	quo0cHqNJ1Xvz0Kax83RdUB6gGAmo/VQ0HnxnGOzCyMAWJMuTg73G5ooTdj4R/PQ
	jMae2YFCv9sChkxcFtCnOugBKFiHtNTqQU1hcyNnXgOvyg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq7yct71g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 13:33:30 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9987bffdecdso14168241.2
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 05:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793712810; x=1794317610; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iQP0DffgHZK1//+ou8ZDmPpNoN8WnAJil4ETuCdPbuw=;
        b=bJeNL43F4VnU4Zxnq5bKyBrvx/xglKTf7aegZNmcRgZbfOxnI1Q9vQYDhnZt8TqJzc
         OqJIep7goochfcc+022aCCJePW0I/I3HgPldxnbGO5wuQHXfjppDK1jymQWSiw6UWpG/
         eaY0sxDeMOQy1xW6W2Cj5o5yhkfOOw2oKU1KhWqXhgnp29uz86hVWDPegE23b9KgRFvw
         uYq9d7KKH171xhhK0igRNeY4fd3H7fj8GDjOJvcC9L9rpnCtHc7rXrx3TkzjrufiOKY7
         dnM0Uox50wnRLwc9uVf2Ow4IdgFIDQy/mtZW1ubg5VrK8ANtCs1AQGYd6Cu7DHX7f5vc
         3jxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712810; x=1794317610;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iQP0DffgHZK1//+ou8ZDmPpNoN8WnAJil4ETuCdPbuw=;
        b=sbUVxjEO+ua14otRsBtzeNh8ZFmvL2r8YoRbm0wtgaiDgOZ8HiV4RRbsx/IBBjQdr3
         JX8Gb+t/fbodFIJSgK4fo0bJciRXotCrPhFCKUIN9P8VHXT0upozpxWZJ/d1/reQfjj/
         ye4hDNqBvfeNagrl549Bc9vHXmvRmIRXhMwyu6CAwhOzUtmx/2DmzkRHqpmle3v74wUt
         QO9wA/HZGDh4eqic/9cMalssB+c0vxGe3I9i23ZQMuO2R8TV39z34Xw7FE6+y59V3K08
         K39w/b1/Eud3kpD24Npo8UbJgafQmYhpp7QPbYhqRExfd9RamVAXMm4Oxk1udq9adRUH
         Qupw==
X-Forwarded-Encrypted: i=1; AKwUvBwtojxiAPytgJQ5naIDEYPfEuG19N5ZlpxyTLVTEBdL1y1jgVg8k7b/LhuqImshR+syI3gE+0Dl0aqR@vger.kernel.org
X-Gm-Message-State: APuU4Z98Czri+DxW+36elryJIZbDhnrWSLofE9hiO8Yt4pMyDTVz9VKi
	/9gHXo4mxyAG1ilWx2haKjmM3/LHhkBk+R4fpYj+uFT3iSIy0zg7HM6z0nGFYGsoOtaT/l8fFqY
	TmGkkMM7fGdI5HiJmA6kGEpf6R6vXXS3oMUCdAhUhTDOz0NZrt/zpVGZnEMEl4lBO
X-Gm-Gg: AYBFou2yw+dEZ8mSlzYmA6Dvy33W1TqoIfAlctvqtjAlnLLCc0+1Uim2bN8j91BjbrR
	rC6F3iOTfsQnX7s8d0L9twKK5JZ5qUm2BdWPYVWpHMxKvvF9o0CYk2q9KKZCqhivqdIb5PYqKma
	iwuA8j5sN/qZZXOyqUe3z1oT/lL8yOKCOKjqOijOKxYuwNDyYto632QWTdjp575/sJcLC8UG2yX
	F/OCdN3FcQ2RV3QIHygd95o6I9zjWCXI8Kd60uZ6OZuqyH5nTfo4e1VtM2O2EHrJztV8/2j3iFQ
	nPiVgI2SuFA1uUoIEo/KCIqF+4+pd2OC1d9ppI7mWq0qflDDbntaJKqDAo4IDKL1ADPhViSxbTj
	uqqGRwLJjx6z+H8BS7LFCpQqQDd9CG5xft5neK71G3xZxnZKGexzxZhdsb3LUbxg=
X-Received: by 2002:a05:6102:292a:b0:7cb:bda3:27ab with SMTP id ada2fe7eead31-7d07262d5f8mr5193758137.13.1793712809616;
        Tue, 03 Nov 2026 05:33:29 -0800 (PST)
X-Received: by 2002:a05:6102:292a:b0:7cb:bda3:27ab with SMTP id ada2fe7eead31-7d07262d5f8mr5193716137.13.1793712807714;
        Tue, 03 Nov 2026 05:33:27 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71bae0f4sm22349359f8f.58.2026.11.03.05.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:33:22 -0800 (PST)
Date: Tue, 3 Nov 2026 15:33:20 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Subject: Re: [PATCH v12 8/9] arm64: dts: qcom: shikra: Add OPE node
Message-ID: <zymjeclhd2ezemd6jeujtsu4y3gb26gi2v4vd3gmi7diuaa23m@aqr4blf32t5b>
References: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
 <20261102-camss-isp-ope-v12-8-702254689feb@oss.qualcomm.com>
 <bac09735-4136-442c-9208-556568d39967@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bac09735-4136-442c-9208-556568d39967@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=V7foQuni c=1 sm=1 tr=0 ts=6ae9e2aa cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=AvtK1wfCeudOeV3Kv5QA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: l0Wm8QS4SxyIE-E3w-TQSM__kn7n8DEW
X-Proofpoint-GUID: l0Wm8QS4SxyIE-E3w-TQSM__kn7n8DEW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfX1H8/82Gq/GNm
 Xxo5fhebQAeUMl9o8okYoS5hG53//apYoLp+1Ej/jrpT7+AR2za3BNiRnzlX/LL44AqWFRKjdGW
 Xe86bcIyrilVY78Y5mge1MRfotJXQy+s8uu/O++xiumv+LzLPj+3j9EGveNa4NEiNFqJdbQv/MX
 StCA2UMaXtFoQA0WRtZgbImtZ8BdxOqoUR6aw1qq5hDVe4nLZEmkpx3t7RRxqu4h9Xu05i3RZFy
 2G5e/5Rl26JaAE0Qbl8oeOOv7nP7o4oPbG8qVpJWOLLzadJiBRNfSDg9LffcO5be3QoHJ4XcJ7H
 dYhWmo/hP7Ryu3VgAoNjnlFVtw+EfC7I4DmWnETFOjbKpPp2SqCkS+SMGOJOXssILMnh7mFMH36
 sA00bLdXQof0psFv2Y/OOilKzoeTv0fLEqLLh5Utryjx++TIgCNm66IHs1oQb8fZZIHhOv3jYmO
 ZHnnLevM8IW4WaOCsfQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfX3JDDZvJvJl2l
 dd1meGIEpIq6DcAMVYcOiMmT2B6cPHBDu4ywy7Kvi+PwPjLAUGGO5Zj+jkQigsf5iEagrK9EmUp
 WjDPuOJNw0guIfS6IDwwWDAUAelvqi8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030053

On 26-11-03 16:59:05, Nihal Kumar Gupta wrote:
> 
> 
> On 02-11-2026 21:17, Loic Poulain wrote:
> > From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> > 
> > Add the Offline Processing Engine (OPE) device tree node for Shikra.
> > The node describes the six register regions (cdm, top, qos, pipeline,
> > bus_read, bus_write), clocks, interrupt, interconnects, IOMMU mappings,
> > and OPP table.
> > 
> > OPE is a memory-to-memory block with no board-level dependencies, so
> > the node is left enabled for all Shikra boards.
> > 
> > Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> > Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> 
> Tested-By: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> #Shikra CQM

This tag will probably not be picked up by b4 and it will probably confuse
some of the scripts maintainers use. It needs to be "Tested-by:".
