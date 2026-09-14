Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99444455621
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 13:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394215; cv=none; b=LuHhL0Mb1eGrCqcY9fBjBrC4x9Mw2NEMF+diBEq5trWQEgvafvUdH2w7xSPfFQuYSdiggVBtDp8UotDBzu/GGDD3luoIIOivDhcU1ZXxZd5ho3xWY1g7x/OJFeYIQvJasJEPdHWPsHVLUOajz+U6g4QZ4WIo1mAGCsmHqjH8Fbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394215; c=relaxed/simple;
	bh=M+6skgex2LbjIffcqUB493F4H69t33R9/Nvqv1Ylk1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MohQXOERw61xwsRQHlP43hc8xAbnuSs/R3V62MNuhbT7Ui9+UPcdZcS/qY0w8OtKeXGNqzl9BmI3Y0GvZ7LnF5a5hy4mvGkO091KWn+SSO6qjcHm9AB2fecUzAy6RwB1YplyK8kxJD+Ai8JsMkgE3Rep7MEtEFZ7/jQ6J1fZ/bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hMV/ZtK3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hRjBlqhS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hMV/ZtK3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hRjBlqhS"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0UJi510998
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 13:56:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yQZu//0K1s9pcLymof9rDsgR
	75pGuXjqO8YGkCYwTZE=; b=hMV/ZtK3+GXgbYpoksDHzpZSkIsTOaqBgOmBbUzi
	0LSxipFA+Eoo+Pdwx+o1SbgPTx06vSoQDVFAJWamlLrBw+uwNVh75jwX1sRlWS/e
	uK8l2sEy3QhFcg56tJEfx0MGDVtFLZxL/8jfcETogCVm8ADj+1Vvs3ksW3gyim6S
	0IFemGHV+e+aF7+Q/1epZDeiebsM3igtat+K9V3AU2rOG8rjLLDdZ5ooft7q8pW4
	nu0gbnVz8PmkzAwDZnUDTufBQPZlVaWexPSmZEt+x1/26Gd7rDZIV12jSfGQGkg0
	Zj2ZfdJHyOkWEiMcc1+hNqanxWGoY9IVt91ETgnK7NOUCQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpgvtgay6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 13:56:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a05d645acso462742085a.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 06:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789394212; x=1789999012; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yQZu//0K1s9pcLymof9rDsgR75pGuXjqO8YGkCYwTZE=;
        b=hRjBlqhSF9TeN6Wm/MpUM/N/DNXiPPLyEqPx/+P/3WDswDHBJnM6Gh0FMRnLv4cd9i
         cet4VMyxeyPHHrFqeBbnV+BNGc4Nn1IqcGb5GFnWN2aiOVjfGMx/VYZEOmAdYd2Q7UNQ
         tJLimNMnS61VeZpgDTkg4la8n2zgm2+fzbBaqXlx30pccxTWEDkT4/Nvt6HTb8/cj69X
         EJXOfxtCEJOwI4PVTK5wBjmV2bMAQDA+A0kj1oW54VXENAvqdLK2hm2+FRs/az9++MIF
         Bzy6Wo1+ZAqkNWYpTwhgInIFnLUwmUgufffg7lC3es2AJdrOtKFEacXB0YVNzTPjOhfR
         JvVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394212; x=1789999012;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQZu//0K1s9pcLymof9rDsgR75pGuXjqO8YGkCYwTZE=;
        b=fxGq57UzVsUeVEvKHiM5OJ1onCIdOiLZMiEGBbrCRuvHEHSZL9rE0z/9l6E/WNaW3r
         sx+W6fMqoLJKTzsBSFHJ1bWJex52HQmlG2Zagx6Y5AuDxawnTS1LLPtHyoGPB+HpaiBy
         6GHghuUER3UHy07uZrWQLgTWrj+6rUkKYeIxb9+8bJeswqNC2W+NwrL33PKT7FXVqp0m
         Vd+Ri4ZVGjdog2nJPB78vaFk2CkT7Seykg9ecquWypZveyoyrXwBaseW0ZzfRwceNDzE
         RAiMv0aOolxBGTX9biljJpsRt71YiRBXvO5JiCCYxrQcFH1ZmJq/EuI9dOSD0P7dvVK0
         gkxA==
X-Forwarded-Encrypted: i=1; AKwUvBycoeGYaHEfUxdpxjZDuoLovb8OSxYspl28ANdXn9z5YHBWyI3vGyYpySwXpM0/0mF5qRMzfwshvM8S@vger.kernel.org
X-Gm-Message-State: AFuF++nVzKZE6xhKPj4Cnt92m6rlTUeAHoD5zl4jffIgxHZAG+qgnz2P
	rtTyuJ4yShaExPDDoyWCfoIM1AELm/Ntz8ZaJB+q+/lH2pT0T+8urowx57MGmCDK0dFZiGsSn1x
	SNW0OElkUHJOzDf5qz2ea+Uw4qRvOFIHXrIBcn6OnZy+cKopnCFyUBI8NCSXmDMFB
X-Gm-Gg: AYBFou0OBsH1VSNk3lcI+pH5oXH5WM7PnZq2prz4P39QvpfLpnplAE8+OXHK1FQjfsk
	2ulryWUrC5w70kIbWlhHKp1QOc9xPVrVbIqH3z+fkyIuqLuTa/VUOOGOQDbecV2vvl0rsfAcJGA
	AebYOlAhHk8vH3nHnDx5mKz99wg+q4yDkd+EMLCgIsSQBKpCgj6gIi1RzMmsMppOllwazesAuMZ
	vKN0dosyK00XO6l8/QGtztzj3OeOieB2l7z4dIPrqVwr8lznWBKGawSB3xFv+HsWecglJrHbcTQ
	yxMffXKKohEAaVOS3Q8AV3v2VJkIIOFEzQoA+QD8KW/MHzIdrLx7Q8/Ds9VyO7DniGpn7WEPpjO
	13TIl7lWqIP1PHA==
X-Received: by 2002:a05:620a:4089:b0:939:6de6:9516 with SMTP id af79cd13be357-93a29a5a848mr332587085a.45.1789394211633;
        Mon, 14 Sep 2026 06:56:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4089:b0:939:6de6:9516 with SMTP id af79cd13be357-93a29a5a848mr332581185a.45.1789394210989;
        Mon, 14 Sep 2026 06:56:50 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm479951375e9.14.2026.09.14.06.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:56:50 -0700 (PDT)
Date: Mon, 14 Sep 2026 16:56:48 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Correct inconsistent indentation
Message-ID: <czb5ip5ndan7dbp2psu6mzycyv3rrk2sq5ngc7czdpen2czchz@odfmpqm2hhij>
References: <20260913141440.177169-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913141440.177169-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=c/0+0h9l c=1 sm=1 tr=0 ts=6aa7fd24 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=tPLuR_csD6jfBswSsDEA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE5OSBTYWx0ZWRfX9ArrSGYU1l0x
 ReGEbA79oIEzhW11ccactr6G6mKPAkMqEhcprJS85vK608q7hyB6NQHXBJx6UVWs3SPfhCVQ8Ba
 YgE7RhCw2+O3EaFXHA+J/xETDpqJ0ZX9OLl/lodI6GcbrDFWSV8hG/vRzDnWY9K/qP384GxQkRr
 5J556BoOCjV1aIxEyszo1KPC1jiX/hVSx86w+3+Kqtu7wVawmZ3uiug0IGM9OV6I6DPY05RHU+h
 A6lJvNBb6Y9YVTtcoFZEgyLty+/V5kzRHgY96MkV2J+oCOMWFAGGGjHJK/CHjl+2TY+qOcpRaIm
 e4tk8f3rkqAEwE8dfqxFH+BSDyPhR/PuLmhkaJxv8SsgDw8xpT2cUHTT0XYOqQp1s6rp6TW/+G7
 3rzXzLLJ1BKrG8t6t8WfiaKVFYK+7mD3XPKPp7uXbo7qEmpR8RkerR1ok7XQ1WZvmlMV1iuO/Cc
 Cu/cNl+ZuRaRzTwkT0Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE5OSBTYWx0ZWRfX+3MBAwUD97Pp
 +y+JC7TGpZNo/W40/9NWbcBRbDUSqcJHXbcbdzt8EH4GpfEzq3BycUT4Jr6nH8GgSTTNHDz5HGg
 GiLW90nt/NGcyQiMINsBEXoe6NR5z3c=
X-Proofpoint-ORIG-GUID: yeBv8IwodWI51Le4jRNozHgSWbyrgokg
X-Proofpoint-GUID: yeBv8IwodWI51Le4jRNozHgSWbyrgokg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140199

On 26-09-13 16:14:41, Krzysztof Kozlowski wrote:
> Fixup mis-indentation, e.g. spaces or tabs mixed with spaces, to fix
> dt-check-style warnings like:
> 
>   talos-evk.dts:39: [indent-consistent] indent mismatch (expected depth 4 * '\t')
> 
> No functional change.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
