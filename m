Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC33342524
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 07:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247639; cv=none; b=Tlc33mt2y4Shrzgq4aLbBKPgkz5rsIk5Tiy+aoQAMynAflqb4075cYYLw5RUHzOC32qbFi8wYpwvzDzfRYewpcNkPdviCxN+TkNe8o1ZZYandqDUHZxybonjghusC8DHOwCddxK6blxkcfeJDmV/Nu9hOAYwEc7Npur2vtJsAaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247639; c=relaxed/simple;
	bh=EZuKdIv8VZa2alHRDBtB94I4whj8cxV2Qt8WI0D4W4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pq1+S4cbXbTg3NOjLKnMaAH9yiODCyJ3nZbuH03SACl5M6efR4qfJkxyXhkIiH6W/MVJG0/odKNbyQ4z6nz3Ea6+4IfhV8RyQG3m+A2+zodp78qcb+8SM8/PeMs4WXd3JWqNzkiKH9RBD2XaMxoApibOwXnn65pH6F7pgXtomPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fMTpAOy3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FmqcidnL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fMTpAOy3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FmqcidnL"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179CtR2061563
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 07:27:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RlNTgorqFdWbb9sh7PwevW1a
	EEs2BxXD9JC5uiMMwrY=; b=fMTpAOy3l+hvUMdMiRR9suAv4wTCHf4Eb+roGKsE
	UmaitHSfwawolzy2Y8mY0EwlTKlQbXuWZl2nJy86LT0F+7dt5FX8/m4Uhwor/S1C
	JZB+vwum/d3IlcJue+mdgsEajtWJa6l16jMRBLjdPgDxhpGJDYAOqwFB1qJEuJLk
	dP6/CzcFtc14t+d3f/dDk6VtQcLTj0QQV0mVmCLClyDwOh8x4vhFHwZ0EaPJha0L
	+3Q7yYN8+oU4Mx/82eC2BPEz05jC6iLroY/1tPRRxjKOdzDLKWuFYDaiFFIwPDf9
	I9snk8Z9lyat0FzhRdYW+oqc9jk+vi3S8PkE65vYbZZQ/w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdqbh0rjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 07:27:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so1104782385a.2
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 00:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788247636; x=1788852436; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RlNTgorqFdWbb9sh7PwevW1aEEs2BxXD9JC5uiMMwrY=;
        b=FmqcidnL0WgryklaV/+hpMlLAmCcYE5FKRB/8NcCWoZmo6Npt+xcQ/VFh6HnnmRxDu
         pYufJivMElXWXn52U44ARBgKUMGOQJa3Rgqhti5KZWrYlxXR1C3G3ZlKv4qXK6U1/JwW
         8BNpfDObmFBu1WedVZLTvS5DL+gJ/fNAuIXZ1m9pjXIBm40cK10mw8AOKOiD4Ec25YCe
         uf+qdUmxcgHEw0PzOCpPvIdYU14eRu97vnIBs3gtwr5xUBvdvTMsDBYnJq5PK+u1DN46
         B77QdX84PdcOJLmvanrsFpE4GMSynRUMq/Wr2ODpf0UU8mmnu6RDt9UftbmSjyr4Ekkv
         EACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247636; x=1788852436;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RlNTgorqFdWbb9sh7PwevW1aEEs2BxXD9JC5uiMMwrY=;
        b=TcMfAzs0LNdS3J8Mbiuenos+XRPe/erqpROujlkPrITuaTo3M8MzQ/jtMPUEqJ3c+T
         W08nwfSwKK2m5/k5kLfNGLic3oDfYmactFhuZKViL+Zx8+VculdX+fBL7AdipiF71SXl
         ldqcmh+aEKCsmO0/Vp8qUxgUXlRdAqAtn4HvhjbQvokacmPUoY8jviryh703I6IXag7x
         9ZkM1/iX/6dWflZ/JkQAXf9xVVC6aWiW+ted9CA3XC02V49AH4bVgp3rWGQ6L7G9AONo
         9m6F0vWFPZ+BXVsbgP9uKdcf2YsJ7MSuorROVHSA6Wh+POLGgpAN8cNiTpLnHAT9S9oq
         EgoQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqu5SfPzZ5rq3j8EWmn0wBjau7bkFT+7hpWBnD1avDUzRCINtYcS/1OYWysrM9Sw92vVVjqLL3S/OyX@vger.kernel.org
X-Gm-Message-State: AFuF++lXu3TBa1oM9DKl2br07yZFo8HOywogxmdSGe/SpiOfT8XiSaay
	BlYLCQMJ7CyW9wgWT4nXmRNXosPMJV3WeV2eeUOjN/cFTiPhpOkr/LJrB8nBU/vpWyt2oG2zXqA
	Wv8fDdgvBtuV0jfIpqTbDbGoKJapx1GS3Zfq7o1vbN59L3XB4Pzbf3Pz0G4lO6KmS
X-Gm-Gg: AR+sD13P5HfqpxzMZd0cmcdXQlSzlGgyLfcrXzsc4FB4s6DHN1nsfKjN4vFjMylC/Vh
	543udUDCREftqsGDxxz1In1Og5aaByBNWIzcm2hNPF5nrr33FOb1KlistcBEsXCCXhblUmVrxdk
	/sb/VclNSp+i/4KAliKZszvIVBiIF2YPmAZYAD3aqiYrGju6DQdvEwdrmS8UjLbnwWkAD9TCd6Y
	PvlzUXRaUCyFmlmw/sK9yJ4I2VuKaGaqejmKGCyE0Iz2UD+2CYpXXn4WNLzYa4Xw5893NHLcYil
	gjN/RTQeBMP8BNsSu1S3adGZLUrxSDaPNM3Wqlvmm+UE8fCJRPgyTVBvbqvCEqkh1ptVHUPVVLa
	03279xijtWQIr7/0=
X-Received: by 2002:a05:620a:d41:b0:92b:8a7c:f71e with SMTP id af79cd13be357-939137d2438mr3130844785a.15.1788247635892;
        Tue, 01 Sep 2026 00:27:15 -0700 (PDT)
X-Received: by 2002:a05:620a:d41:b0:92b:8a7c:f71e with SMTP id af79cd13be357-939137d2438mr3130840385a.15.1788247635296;
        Tue, 01 Sep 2026 00:27:15 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442c42492sm3509382f8f.1.2026.09.01.00.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:27:14 -0700 (PDT)
Date: Tue, 1 Sep 2026 10:27:12 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Alex Elder <elder@riscstar.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        krishna.chundru@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        sushrut.trivedi@oss.qualcomm.com, umang.chheda@oss.qualcomm.com,
        rosh@debian.org, jsandom@axon.com, daniel@riscstar.com,
        mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: monaco-evk-ifp-mezzanine: clean
 up PCI function nodes
Message-ID: <4rua6wavrugknrou3zshg2atjo4iyqrtbhztgtk3de7pu233gd@i36uhg7p2snn>
References: <20260901013654.1343537-1-elder@riscstar.com>
 <20260901013654.1343537-5-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901013654.1343537-5-elder@riscstar.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfX3Q2WY2LchYWs
 yRzaDgeN0bBs1Z0I4A41PePLx6s7lFsBirFwP5+oGfIJo+82qToJKdlEGpp5MmQzTFGzxGMWvqZ
 qV2CULLTvaUwsTYaROs3l92NbD7RLWI=
X-Authority-Analysis: v=2.4 cv=R9wz39RX c=1 sm=1 tr=0 ts=6a967e54 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ee_2aqc6AAAA:8 a=lCP5n1hGJ6oGlG14cqkA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-GUID: C5XR9xtvyntnq2xm9vR61HaG2eiJAmt7
X-Proofpoint-ORIG-GUID: C5XR9xtvyntnq2xm9vR61HaG2eiJAmt7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfX4pB9NY5oVgKQ
 UmTgd1OWZBGXwexZGl04lPhLzzuBtcylzxKPLw+zAhdR254fsgL5eTkS9zPM7eoCAOhx9wMS6Hx
 j3nJriCG3bmNbJ+dxtAWrY5yJw4n+FFVPvq+oyn3XkKgqiQwUOlaDP3MsLrrQTZP4ZAfywu0Azc
 AhMTvKjjEtxB7NR6FLreug1+8GtgX7/rxEyHtDyvNS8FPQnD/c+ekxKb235kpiQw46SOyNfKaY+
 P6Ib0eITi/gxsrsrTtFRxwQHFazc6U16b6CKTSsWM++b02E9M3D50yOkedntUsH+tXaApED6Vyw
 rNgaKSWUT2KrFVH1ZIFVhLXHGiixfm5mW0Ab2k90U68dKT3u7idRW1CH8cQ+DZZrKgqGf4gF0d4
 2bKzM2XntRW++05FeFOizEt/EFy4BoefeeCyxP5R8VMEB9QGR5bjIQtJWoe9fP0a1u8GifFPHhV
 OkYFq5ReWxy7rkjc5ew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010066

On 26-08-31 20:36:51, Alex Elder wrote:
> The monaco-evk-ifp-mezzanine overlay defines a node representing a
> TC956x chip which contains a PCIe switch and an embedded endpoint
> that implements two PCIe functions.
> 
> The devicetree nodes erroneously include a "pci" device_type property
> for the two PCIe functions.  That property should only be used for a
> PCI device "that implements a PCI bus".  Remove this property for the
> two function nodes.
> 
> In addition, these nodes define #address-cells, #size-cells, and ranges
> properties, which are not normally defined for PCIe endpoints.  Remove
> properties as well; they can be added back once they are actually
> needed/used.
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Fixes: 5a67924d2fc57 ("arm64: dts: qcom: monaco-evk: Add IFP Mezzanine")
> Signed-off-by: Alex Elder <elder@riscstar.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
