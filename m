Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12C2199385
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781568937; cv=none; b=tuPcfjEQ8mUU07wv0IRJRuz/Ip8yP0Eb4BW+tthFtuNtDZmKHJpGxPKnOWtJ7yJGe5pPJujXeiUJDb3BvZgZUL71UCY815lAFLrSznWDxLahGbp5CG8yQmMlKkxOggocWdWXxs3/a6PJ1dtqe3135exyAsrSx5xLDvJ3P2/Agog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781568937; c=relaxed/simple;
	bh=4LX4ABWcbUH2m2TdeafXhUCS7wS8XQzjyw9xEZsVYjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=COk3yLmKSmsZ4QazHkVdF854BuF4BJdy5lsdOenhT2Fpr+kORtuDr3K5hPKMjpm7e5UIYcKvSuemFIrGhUGPmkOrid1hvE7buG02F0sP8Djk9/ij9X7HSXm7buFKMds5AF1UpcSxJ/kEC+SMrp2t8tya6HAtmMcaF2eZQS6zrok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bfKiIQV/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hlETygYr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bfKiIQV/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hlETygYr"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FJ1RMo1433431
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lZ+6EGboMaGEvyXaahC9VusD
	si/sDukRozSGEB3PJfw=; b=bfKiIQV/z4nhCy1FLJQMtLjGA4/riUikrR3PAWJn
	OUI9dRs1qmPylnO0CjXfl/GODUKwQX3ztvTb1SqMnAAf+EXQNuvtfZTFvbN/zaud
	VxMe0/55xGeHFuzVn0mXkBf3BN/KfuSu+19a0YbjjEymvZwYLySmoLlIBV98nqWm
	7m3swlKeX/vCOeU2j+zRRMI8ORF9zd0HGNfpKoKsu0PFgt5c5viQReAZUzJ8WpeK
	+Q6QW4kEoaiX0YW1Ajm4Y3zsvidbbBxfTMEJoa5xl4AVKzirQzzh0Fd/sHfV/xM6
	Xhd9VTu/yaaCNSev+/qEsYwRyVFYMlxa5yxi2owpeZyLGw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etgvhk8sv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:15:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9159bc52211so382565985a.2
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781568934; x=1782173734; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lZ+6EGboMaGEvyXaahC9VusDsi/sDukRozSGEB3PJfw=;
        b=hlETygYrob2RdeE5t78eJ43FrhJzSoiCdbbQtGBl91GtrrRZto3STniVBYiPgTxqir
         LOS3pnEsb4Dc7G8thFRDmE/EPBidpCnyaxKoOJ+T9VnPXxhgIv/GBSeh4KPx6GpA8gNI
         w0kGciXsYrd/O4mXJgk2pti8Zi6XxUP5XLBpX2TqGgG2slrJUbU0+1S+yKhXqMiNPgbk
         U6P6DyFOCs1v2neSAq3Hn29wgd3OhGjRdnu4NOn9sg/NNjlZiAdUy+NoyHngyNGgINEQ
         Sf77ZhAsLY+Uy6PnAx+zzeoRvH2hh2ZBp+5ccBrlyVL+MWplTwoW7LUusa7tVsCgB5P9
         Suew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781568934; x=1782173734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lZ+6EGboMaGEvyXaahC9VusDsi/sDukRozSGEB3PJfw=;
        b=e2bvvoay2o4wtRVH7aHn9FI/oGSin4dilIFm/eg4+y/aulZ1vKGvPHdiV9RPpdu/sB
         0g82Ib2Wjd8EIE1QE+D8GF57K2A43AWZrem8aZE0eXCkWYU1am4898rXSoVELTiui+wx
         +u94wRohhj9OQMs8XfpG4mjvrY56efpgg6gi6TxH5sADs5aadkU68fLFJOZTYjdVWV6h
         0RQi+OyIEdu0C1J1H5zmfdqJwKiRwkbxUSMjQDXJ1mDAo3052sNdVyrFQ89iMWzRagiH
         lpsfPmDg/RZ2efCpmufiKsX6E8eN97Oa7AdD+teJ13oMhzPEBPbKnyffp8h4zI9jwsXU
         XaMw==
X-Forwarded-Encrypted: i=1; AFNElJ9RkoyrnEZ73CzhlOjbJN/R+qbOIp39IkOHsXo1v6xwEW3b7BmpaT9xjH1Jw/VJYFY7Z98QuOAFWO3r@vger.kernel.org
X-Gm-Message-State: AOJu0YwPpcPkyJBdI++VjwvY6rPYdnJCfJSYt71i2w9cIlPRRhoNYhnD
	vPsC7TlnogfWJE36dmjMJw6datVKGh16pMlLAHWQy0B8g/h+nBPfxWuOjvxNy1GScITUEfhQUuc
	MEVmboQNgDOstCiQ4nko4sjt6j3h/ZqIs5oc8UBZV7RPZ5l0RCLG6ZH69fpCHbgqd
X-Gm-Gg: Acq92OEYE7+yvYXcFWk1QTAE/dcJ5avUtjHn8WhwXNR/pgSlZ5QF14ffvOeFO1WrxQo
	HVr1i8WGq/CK7Qo4sfZhQ9Xbij1/6cvWa+cyCNv1XMIq72XmSPFRDSQBJmpPleZZE9DQNu0WDYP
	uWomWXmZ1LwVcj8Xw+MFEOE7xuZdH1woMA5nXg5cVfo/zakq4CaEPuB2f0e3Ep1FeF/8OZNDgf2
	HmSmDnMuU9pa3yhtKfiV8WuUoMIMYkoU3GqDWUH3rnKAzZfxrsjRcdX7P4JhLn3NAfYMZ0EQg8+
	Q0q8Tym6rqlGAgGIvQEMFRT8TEmrtnSdWpI2Ga2Jzybl1w3zPHpdv6IuwURY/2UVnyPcK214nZL
	47ogMyQa2UpgHgGFsmEsC+jHCyHiBaKH2x9YwOW8fseNhkKPaIIuSsDD4VK4X5SP4jR2Kdqs63J
	G6CEGlsgXPs4QaVGMUs+8dnBEmFAcDOZnC8nQ=
X-Received: by 2002:a05:620a:8909:b0:8ee:eb50:4f51 with SMTP id af79cd13be357-917f1c50c74mr1984281385a.54.1781568934221;
        Mon, 15 Jun 2026 17:15:34 -0700 (PDT)
X-Received: by 2002:a05:620a:8909:b0:8ee:eb50:4f51 with SMTP id af79cd13be357-917f1c50c74mr1984276985a.54.1781568933700;
        Mon, 15 Jun 2026 17:15:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3995c191772sm2544161fa.21.2026.06.15.17.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:15:31 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:15:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sc8180x-lenovo-flex-5g: Rename
 regulator nodes
Message-ID: <grnrkbu5oer4epkdvml7la3t2vveqlzkhwtkezunseubhq6f6d@og4rbbhoou5m>
References: <20260615-topic-8180_disp_power-v1-0-18d36b548c48@oss.qualcomm.com>
 <20260615-topic-8180_disp_power-v1-3-18d36b548c48@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615-topic-8180_disp_power-v1-3-18d36b548c48@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwMCBTYWx0ZWRfX2QoX47NDab4y
 rylEuoHZduZG36vHVG/lCCm1quio6kMmIJEqHFr3R3sws5xSr5wLqelxCJ5lIE5hYwo0ybel8tz
 b5UncTlLsHhrQVCnIFZeLUF3C2RrpJE=
X-Authority-Analysis: v=2.4 cv=Zqnd7d7G c=1 sm=1 tr=0 ts=6a3095a6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=NKzW1n5FEafzfbm2N1cA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 7W4fjnTa-A90mjn5yIdyNX67fcc4CszO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwMCBTYWx0ZWRfX7saovhGJSO8M
 nonPlL/3bzM3e04sFd1AKvxWqrQrmhX4Pmegnbw6Hd47mZU2aC+dPHdArVWZXCPjB/uricZ6fmC
 NASMCctszASy5O5zY2ByeFeKTWVkPJsHdJZMN2sZfl5gn0nlZNHxZDQtDILccfMu/vNTTnzTYdA
 3RLYYmmK7ut3XKMTlfsQH1Ax8xWCGaZDplsc+s+49hDsCI3KcGf5iQfIW34a2KxrahzcVA27RfL
 68/1jgWhRGVvDLlozeqQFBCD9JpCll0Nrx4FrV0mbGnayjJ6NhHLIjUusOvHzQlDPkz1eB1fsao
 LPEJLTbkt1JgyFPmRsU2rjU3GX7LaaRWR3JzV6agenrNrnxAjzZWIKNEsKi4pW0XBpBk7GubS/1
 JTd7WcVX08hJhgxCorn819eBRIciMhHx8sGW8vLSIQxFqM2gOh0MWb243sjO731nV+GrkP5wPCN
 ipCR9gq4KV+Ogzvd1Wg==
X-Proofpoint-ORIG-GUID: 7W4fjnTa-A90mjn5yIdyNX67fcc4CszO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160000

On Mon, Jun 15, 2026 at 04:22:06PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Align with the contemporary way of naming regulator nodes (regulator-
> prefix) in preparation for adding more of them.
> 
> Reorder the renamed entries to match the expectations of the DT coding
> style doc.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
