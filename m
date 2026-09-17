Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3372749738C
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658017; cv=none; b=i9/gTzGrQSqLn1v/CjzbxDIHzOnMKH0btnMuqfW+jCbJ3Du2xUyKuM49MTzOEYJw2Mbna8Mlu6k+9HB/0KxcpE2896KvvkYNsSZerH7T5P3VvL864GvV4Td8kiwYK7PYELEFO0YT/RW0v+YYt5efhagTXy2EDQxkdTEPIJFa8jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658017; c=relaxed/simple;
	bh=paqpoG8A4JciWm0Yi0xCGT0zRCzEjM5jx7MzwRpqNmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JjParwswMyO06z+dQGn93sj7ixAfnK10daHQOT1GNNHE6SKJXGuNGidyYLuPSPf43BbC58M2hLvPZxFl5M1reu0w3Yv4RywQj43wck07CN/UULBorhwrx2dveAThNJfCjgyOqXOd2lrcxYNFFXcF4gu3vI7ekebt8Mw6jj++lQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EkRcriYz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OCbzL0HA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EkRcriYz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OCbzL0HA"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HECkWB2496735
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:13:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zfrc8qw901WP9UYLMClq/rIp
	EzRNbwSdAodDRf5Hpf8=; b=EkRcriYzqIU8TIJZEBKGji2mIDGxuNhVG1o6u1pC
	3FP0pkVbN24cP2mpPIsAZNL9/PwAnxu82TIZ+9fEB+7Zrz0edMKJ1jyreiEfZMLd
	YEaslotYosKisXIARixuLvQ73Akp9Db8R65/dkyr0qHkYy1lqdmn1OQbt161d4w7
	cMAtlS3j2tlyS67GlDnpDVuORK7UQkCtMyWhD8cBDemmdpkZhtiIPH6jZ+yhyWn0
	m1cLMYWVEzrGGKM4AioaALvY1sEJNwAle2/INKCIu0D8cdmPOa9x83mxj2IV2hvA
	OhpJxWrLphAt3b1/8MEjLl1AVIjrdsOJqMmJjtWJvYR2Bg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grhs6g9m7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:13:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a2d361e1aso233562985a.1
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 08:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789657998; x=1790262798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zfrc8qw901WP9UYLMClq/rIpEzRNbwSdAodDRf5Hpf8=;
        b=OCbzL0HAbwtCpESRyzAQODZI1oHmR+zV6z5vWUCh0W+Zgw1sTl41eUSpnkf2pe+DhS
         HxwYVv5VMxgLe7DVWEpLfpAFDanaJFxQlHyw3dERo4x10azPey0+2/D5Il39BnIPOF7M
         zqAxs4+MgftIka/om8QrevDYOpPpEpBr9tp7gHr52E3SQrq4x3fHPPwgMEoRAD/C64b/
         PhfhiHRidtRB58op5e7fZbDBRcfPMko3ArSorFB39F9bGx5UJh5VnQ7Yx/2rXOyXmJBn
         hCxfAevVnResRlgCplgcH7+9rE4GPcLiryKi4akxV7n+AB0Ot6mKru5f0pnZsP10Kqks
         1K0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789657998; x=1790262798;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zfrc8qw901WP9UYLMClq/rIpEzRNbwSdAodDRf5Hpf8=;
        b=jHYZSsP8x5pukK03f1oVyjGSDV12hkF+GudydCT2kRxt4ukqV2OEWP5B3naqdfGRbG
         2YkvWE6tJ00rXt43vKxdR67dynMOjgT1TR2ilYpost85+8qftYGJQv1MA56LmfxYRimM
         DVG9qc4Ya8eOXq4nb0hKZTARytfGtPaX1a08IXNxIgeFMkvjxDJqzD5B/yR8cvuUQ5P7
         7aPm2CKBXQfkhxr3iNUD8zGYXM+E8iPa2rQ2XBJoQkNZAaaisNYV9sDcrNs5EINAOeEl
         w5jmm/+IQKH2c1a6pmxYZQFQ9r5LN/oasW/t+7DQSKV7OA+tnvFdAyoXItT2JVTcNK54
         qD0A==
X-Forwarded-Encrypted: i=1; AKwUvBzRujSgH82sI5fX4swkRGJdoaIyYdbTHlF7Eyb9mkfcxF79PO88Zqp4mM3GeIGfN8pwZoquCitFxyw/@vger.kernel.org
X-Gm-Message-State: AFuF++mETF1WfKn62yfTGIXXKpThsgDI/gcr1NS91NvUyK81QShdkw6G
	aX4ygjQ84E4o0dMBQ+3ZM+qZOycnPQijjB3TOkjBOMplAQdADFSSWo5pOhDnLFG7dwcNA2p4PSw
	8rIPFG2BDMGZStgDFDSYfNdkPMYLqp6Xd2elEOIDwiezySsIkq95V8fBf+Q+jtXFw
X-Gm-Gg: AYBFou3bwGJmM9qHzYbBXpDNce79jipBFmFsZg5Zw6W17eJ6S8kCxQkqMCRIfcnoHbU
	QpvVi89QCuj3AWUQORtO+g7DDvkRJRmsIfJOKN2uYnYb2SNdGkR4BTY3braO9v3pH9SEFmBwiGH
	FO/Lf5mxI8D5otyLDRKR9M9LIrUF2JtvnImFqorIEXrPCM7iAmtUkbl7toA5zd7jJRCUSfzB19+
	eVTk5BaNvoYFh3lRMFJWdiyJAUvI75/w/jSPB89R8wl+6pnXx+zypSv8THbaLkqW/Jgcmu90gR2
	N7ki/7LNjBb3ncSF7/ufrmVqLPJU63a5nernkIcFvPrUNrijqFOpqMAodHe0olZA4C4hl94Ep+t
	XvNB08C0wKtun4i8=
X-Received: by 2002:a05:620a:f10:b0:939:f49c:1b30 with SMTP id af79cd13be357-93bb770f35fmr1139312785a.13.1789657998411;
        Thu, 17 Sep 2026 08:13:18 -0700 (PDT)
X-Received: by 2002:a05:620a:f10:b0:939:f49c:1b30 with SMTP id af79cd13be357-93bb770f35fmr1139305585a.13.1789657997720;
        Thu, 17 Sep 2026 08:13:17 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbfd935cfsm51140265e9.0.2026.09.17.08.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:13:16 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:13:15 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 05/15] arm64: dts: qcom: sc8180x: Move PCIe phy and
 GPIOs to root port node
Message-ID: <ylxhdwgse4nkqqkeybolivgyhqyrcmitno4qm25xpdyicud6as@mtp45cpifc6i>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-5-6272b7caae9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-root_port_v2-v2-5-6272b7caae9a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxNCBTYWx0ZWRfXwZqWMH0ZYWeU
 KXO4N020hxFk7auLHLHMmXqeyolTutjLt/5grhUAF94O1S625ZKqYuHr2bSTXAUtL7LgCjz4K6K
 nxCDIXL7UsCGXIPJoEgnqVYUHtDd1M+AT9EOBiKCl1gjNiMeIo9JAAlUjl3WkEQ0XzRKAO065lQ
 E4LplOggwlfSgjK1GW1n6x+t0yfKpdEuYZ+9aTv4L1KMXdoQiIEjs1wiTWMjgUFXBH43cFv4Nbe
 dIpqo6/PajVXs194ln4unTOUWQjAmDNfvFE49n7z+Ay8bH+rYM+Pt2KAS2Wk6GIxdaMi4aizhWA
 kXbt4fZNCiX+6IkZI6ohQTApsga7cfmZH0WKO/4wFCvxTLn/9VV9myTgyUjl2LP0jhjz7vw9bjA
 ej7rCfKYgUs+YHsh07I7YpydHNXF0vNvyiowxR+i9IN4NwRiztFSg9955zDY4wsp8UowoQ37Km9
 9SeMBRl0SQtY67AAJBg==
X-Proofpoint-GUID: uu7lzPLTm7GMY_sci3PdyoLHOF5hDOrA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxNCBTYWx0ZWRfX3ZQYBuJ1xBGc
 DMM9qGXEDdhjhKR6DDkQezx5QR1CAEf/p5rkiN2r/QJDq6/s40DLwBMA/5MqEitrskdLhg/jU57
 4XVrBKOMr/7xjIfJzhIQwvc3OVxXzkA=
X-Proofpoint-ORIG-GUID: uu7lzPLTm7GMY_sci3PdyoLHOF5hDOrA
X-Authority-Analysis: v=2.4 cv=cvwOAF4i c=1 sm=1 tr=0 ts=6aac038f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=adJbRHicXYsKkr84VsUA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170214

On 26-09-17 17:55:19, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> pcie0_port0, pcie1_port0, pcie2_port0, and pcie3_port0, adding
> labels to these nodes to allow board-level overrides. Move
> perst-gpios/wake-gpios from the controller overrides to the
> respective port nodes in the board files, renaming perst-gpios to
> reset-gpios to match the binding used in the root port context.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
