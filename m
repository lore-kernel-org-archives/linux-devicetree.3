Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66483368D6F
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 23:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781219055; cv=none; b=Mi6L1erRBS0E0xtJtpyHA7+5vuOYPCEqbZdOTiA9KctAUZRdXCjA6IKwpw4fKTSoWiMIXeAo/BklvGAa9whhyOv8V6mvmenD4LB8x1+Wo5kELhctzJ9mtcn0ZWmwHwDMds/ojLOYM+JgbtBxRzW7yu3aaOHMEwtFVgf3HwjNBzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781219055; c=relaxed/simple;
	bh=/QCiXj7xop4Q/ete4xTHRSL0F+zfYpEaq2+k2ehu3FU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mEF+2s3ZWp8O46dssoxurykPjz9FEJU5FnVbDp3e2T77wtVDUYJC7Rufh6PSkycreRGgN4Ebq7WL+f01Vei1yIM9wKsOkhCkJns3hqXJfhjRmoTOpj4D19OfI5XPaU9+5YhMxDLE2X50Bzj6RQglJakMAAWJ+eDpSpkvCEfva4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sv3SWw7q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JuxXS6SK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sv3SWw7q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JuxXS6SK"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BMSXWK1891823
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 23:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XVa75DENJyCmyBmxgHD57kf8
	iiHjAucpu9WYVIB0HPo=; b=Sv3SWw7qOzkvh19xLrsp1uTQqv5ff8ujBiAJLLOb
	hOaF7gSyrpgp0HO2J6Sdb7zYDR44WuqBqDq3n4uNgaBJ0IIQqKfJYEOhn+CBF+Tt
	LQmC955HEGUy+bpEmjS8iLEtFdayPaEvHJfhZY2BTYkqg1K/C6owewi/hq2q37HR
	9rcF1llQb6h4EQbjAt429JdV6FblC2SBuNRDhG2oekwu7byDye1zGidP97qlA+HL
	7bn2qtFhmIFPYjv9g/UJZaJBMBYy7X+fqnkrnvyk1L7x3D92vaCzQIIgNhQlX2qY
	i4NRYVUA8xWCVhRliHkFyFDHzQW+g5KMOLYiHtnX+gGIMA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2r5rv8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 23:04:12 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-963d9b6b92dso112072241.2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 16:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781219051; x=1781823851; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XVa75DENJyCmyBmxgHD57kf8iiHjAucpu9WYVIB0HPo=;
        b=JuxXS6SKAOZD9J7ewW3020aKgkqnbsGMu/UIbMuNhVO7JWtL3ZwxSJlUyzgFxnjPaJ
         GAnkM2FclKsSqJBCl2UnItthfieC0+xQcYIrbVkSxcY/Ig/rDF915wPECgTOGl8RXM7g
         xbz5qRRCy84XhXTJMnvjudmcNJVQxdHJQRQLX3KHRK8pKzgCqhRzdRrRh9sLSQBwHKT7
         lgf5+m/mX/sBjE74Cd3++WK+PhuegmfbbTTmPpH7lMoeKh8kgHP3ZPsoFNy2a02SHEzH
         FlrrpYKsJW+bbW1qO+LDuREO0kmjZVCVM1tAKXggZMo5yZus4lVLPhWpk36sRhmS/j9V
         5PmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781219051; x=1781823851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XVa75DENJyCmyBmxgHD57kf8iiHjAucpu9WYVIB0HPo=;
        b=MOe/yQYFxjRroqnHuqVv52/904SsQPCZr1k84noXwwElyKIc80XLrfAkZmQRcjotyx
         +kv7zHpsLCjlcz8PZUdIT6PSWhtkzL6cnhNXHnzBIrWFXEPxg2xeDmEMSkrk+dgidDgr
         Eicyyocmq772nl0QiooiOy2/k3mOCvOrEEPSlOBtVypHlikwbjlHvGlnhI0LgJS6x3qq
         BKxha0kCkHTaM/6rqcikDjNFHOTGcdzmCVeheEUf+pOHWd7ljE4DrNi/2HqBlDwfgruO
         NJAT+Ti/oX+/v7v5nG6qISokFNiileU2czx1Vixfs4dlGVsa9jDMpFm0blojvRJ0btqP
         dgkg==
X-Forwarded-Encrypted: i=1; AFNElJ9Ts9LK+ZZchCb9InWqOO6SeoEOvH99ZHhdD0oRQ71xLp1tluHImUZEBocRJDP/dATHjTd1AZaVVH7P@vger.kernel.org
X-Gm-Message-State: AOJu0YylYieaz0A0rqqvHpR/ZMjafs/fkz7vNkL+iInrronUUwXMCsXe
	VnekNTvY7eiMHX+rksME04b4O346DL0eY4VnJ5yJKQTw9VRzDY+CPEpuMgoSgG/ct2GX3DIPa5s
	AjbJcMeVMebe4XCcrHAIS1ZwdRikiRIsmObPhupXftIh3m9Pmu46sd4LKJpWQ/p4G
X-Gm-Gg: Acq92OGI0nho8JhnibHPdcSu39R2EFrgR413pB9rkaGxWN8EGqS0i6dE1kryRHQYpje
	VZuBeFEuj/NcQ87Wr0xtMhvkOwHD32OX1eJex1EmDE20omWJcNfTAFnvoijyzDt719kbClRzu3n
	pj6trJtwC5fNAIXDTIAD8vqAj1x3FVezDOhKrcKbdKO/HHB2PZw00z1tuB1FTzkcsrEIpyhRaUs
	Iz45J7Qho7ekBHOm/OWVf51USr/Tuoshu1b7Qtt3gdijDTRijvYPZBel3KrFmNIq1qXNomFrWG/
	OS4KKDrgcIdVBVzgC+IQVkRz9oe58alM5hILZf/w4jEHOAt7YYvd4nQtyKB5sfKZzHGbkaSBDng
	Tsp2RmFZ5BOHUmgNuBlwPl6A9aw3SjWy63hQur2fdJAkX3AjHInVRDiYNMg5NB7QtRgeTD1iLLc
	JNEHxZ3S5Xa9mXl7fMScdznsTZyFmBnEPOP4c=
X-Received: by 2002:a05:6102:509f:b0:6e3:c247:1caf with SMTP id ada2fe7eead31-71e88c57a48mr119143137.17.1781219051348;
        Thu, 11 Jun 2026 16:04:11 -0700 (PDT)
X-Received: by 2002:a05:6102:509f:b0:6e3:c247:1caf with SMTP id ada2fe7eead31-71e88c57a48mr119122137.17.1781219050810;
        Thu, 11 Jun 2026 16:04:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929c29b0bsm1128621fa.2.2026.06.11.16.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 16:04:08 -0700 (PDT)
Date: Fri, 12 Jun 2026 02:04:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur: fix QUP serial engine IRQs
Message-ID: <hdq5iicr3sawlkhxmeut4ms4n2x7zocwva44lhnjqjfneqwtwe@3amlnfuuanie>
References: <20260611-glymur-geni-irqs-v1-1-269428faeb6d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-glymur-geni-irqs-v1-1-269428faeb6d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: vBwWe4AVUF-Lnq7imPR7kDxZv8ltAajR
X-Proofpoint-GUID: vBwWe4AVUF-Lnq7imPR7kDxZv8ltAajR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDIzMSBTYWx0ZWRfX1WK1Un7Qv8zR
 MYJLuQrYuUD5ek/xkHIW4VwXxN/XXLCmLop01ELM1ncQc7ejhrbef7Qw2DqAZndZOhCKljz9XMk
 fgmALvfnZeiImta8xTMPztbMeHoifv8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDIzMSBTYWx0ZWRfX6D5ShzQ3Rsc+
 FBPbRBGxUALkvkk1TgjfwS8d/YS0HAaG7rev2W4lOGvoOaJ1XyOuLLz5GNYhLIUfbl/5hXdTwxU
 A7/zVj3N35oBV465CnZRUQTomgi184q3IDVArMDxq2VJ4JiHbzxjfyjmF+NZr/FIUKCD8KVPKVq
 UWKU3QytIJGd/7TxwYurRmT/7+q6S0Ukg1/LnmEFgjoXLm6TKnP0WsPzvQnvOS8XhMlldPxEPj0
 yhLOy1MoDjhc9bDHc8db27FSFjKdutjuFYw3cXmmm7iR2reCAmB1eM4+avI6rfeVNc1c4x4MFeD
 3Ffixu6qGks8mKzWrcS3vlEManbKs+IZEgo4S9F2gEEYi6RBezoz2LatgVIU0pGlAOv3ZwCFXnR
 Ckxaa+MBS7bI+dpjSv+4/CS9SnSM1pqhzGjGitcIAMQwLdaaXzVy5Oa5miYAJp3nY2+8qFoNTw3
 hK5GpiZWVYaW7HgD4gQ==
X-Authority-Analysis: v=2.4 cv=M6p97Sws c=1 sm=1 tr=0 ts=6a2b3eec cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=VOXDmvlrnw2WqKqSkOMA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_05,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110231

On Thu, Jun 11, 2026 at 05:22:37PM +0000, Bjorn Andersson wrote:
> The Geni serial-engine interrupts from QUP wrapper 0 all fall in ESPI
> INTIDs space. While some of the i2c instances has gotten their
> interrupt specifiers corrected, even the other functions on the same
> serial-engines are wrong.
> 
> Ensure that all the serial engine interrupts for QUP wrapper 0 matches
> the datasheet.
> 
> Assisted-by: Codex:GPT-5.5
> Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)

What about the SPI / I2C controllers which are a part of qupv3_1?


-- 
With best wishes
Dmitry
