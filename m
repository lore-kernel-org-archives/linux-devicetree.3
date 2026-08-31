Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EC83C456B
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 07:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788162198; cv=none; b=KdCGf37GFzENZa//sujsD3vTWZ4KbJsIMVv0LaDcXueEn6W3lFdS2FFpSksdq1IczLf9nFr1v23s2xZ2MmCIr52zcBxyQYylLTCjIdq+spOpeklzZuz0uP7HR+c1Bbe2sAYmVSCLEqfUzn1yZZiaq5Yq1D8BEw9gW1xtiVEiQwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788162198; c=relaxed/simple;
	bh=QMKWbxrTUoYOpkYxmeTHb0eNPHq3ygbKhMQAKrB5afE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tI4QRgku1Nluwjai07qUh7hhE1j/Bdt09EIIACUK6DedJIOYRjwBL4acs5+ch4PTLbYCRWqgFv7R7KLYXmjtRC7ZqUn8kkGfr+szckNEOuKQKqtrfuexTkwSXudYPP2MgiDqS7NBAM0lInMjF7kTfIPLU8XfBAUAZS6X3bsuAJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G+KmXK5r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RQkLDUzJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G+KmXK5r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RQkLDUzJ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52bPT2764546
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 07:43:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VjfRna/iOcoNvFhmRzrlrbFVE92Mx+4K9kQUzzanJIA=; b=G+KmXK5r7+EhXV+j
	Lg9lsxxyMjIAtavWoEECAY6aOAxcHgbj5ovZi7OfMDZ1E7NS8PsEHbxNkC/nrLK2
	b66RIm2WzMlHtt2b8vm+QOXe+/8o6iHC1MRbRO4kbxK8ErrrOvEag2EAgZQxJHh6
	sOt1sjtwN/76ocamugD+0/PHPGjAH3AFhjm9teRlmp/kP5iw+ytL4Zg00f+E55Ih
	cPb2HFEct+Ds+CYJw8c4/1RFrR+iOZiqnr9bnzjBuCTP+7/Ze5/sviluk9G6noIr
	TVOtQRNjFjPx4T/NRPJqaW9QyRYlrOA0O7Y08tcS2NZWfUFfe6vdR9cQrJ01AKq7
	ZApx3g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqgyn9ae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 07:43:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52ec554a80aso9356951cf.3
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 00:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788162195; x=1788766995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VjfRna/iOcoNvFhmRzrlrbFVE92Mx+4K9kQUzzanJIA=;
        b=RQkLDUzJ54Xru4/bO+XzQpIohyrLXa7FRmTcWvd8vmVFFD0vRsKOIQRDhrSsXDMDIy
         jJqOV1drwcefWEpUWYBnoj4QB3WqCd3R0lrxblQiiP2L1xssY53J/Lp5mXmeFm07uSvB
         VRPQ1S+matj3Qo3paTtuBhgws5n6wysuleNR+wp6P9nm+KOqXC6cJwH6ZYKqYjFKAmlS
         RrhEL++A7n+y/AEHlLxy+2QhtKOpBJfRUyejwkE+QsUQAHloJUrWNVUZ56nnStsIonKo
         P0dJVlXUBYdLd2mE8ldU+KVuNHoZN3ttNgdjMBZSnK3DXHtauz5EsQDE26Gaan0EfYGo
         PIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788162195; x=1788766995;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VjfRna/iOcoNvFhmRzrlrbFVE92Mx+4K9kQUzzanJIA=;
        b=BRaMqigxl6s4rx/GdgVIzTdsuWPuYNxkLEhKwvOH8fGKwah1xo/WkgSe9eoi+wtG5s
         uENF4XDMXuMOxNajwc7LmkZlxx9xF9FVn7B9sN1GqwOuWJ9+OApJMIFL2goeN2exJrnD
         wiJ7V2OG8Ax3KJY6wRosV1wLIz8IAuRwaX+VWRbh00LD69OVqtUEm23SAcoBOv6o4d6b
         gQjWirEIO03zS/yIhPiRyBcTetmv3ZmwOF3pNnbpW+mWK9oRvgH0tKvwHs2WHA+c6O5B
         SS8yjECvoaUpWLOZqJaFwdBjggk/HRIuV0arb6hUOYdGec1dOsu2DIZYjuq6c8GrZDif
         U3Ag==
X-Forwarded-Encrypted: i=1; AHgh+RoU9NLsnI9EvXakF4Fnz1FoBPEiDNP7WfwdwZVDVTVQ51M9CnZoVZR34GU64R2vfkGc1r3dIy/+Gku2@vger.kernel.org
X-Gm-Message-State: AFuF++mACu1MLABgmk9V4v65aenVLGhYbzPL8zo77zXyAqpvF+8D+8Nz
	6UO92+h/KEJHDUEpzkYznSrbp9AezU0G2KbP36ekaH8zCl7UBXOji+X5dGeJDky33hpZAGF8X+S
	ePAP799eVtTcyMNfh3loVnrNph7+PvZdy+A4XX9vYhyZ2yWR0dzYyP8hGGl7oFjKb
X-Gm-Gg: AR+sD11UctPRctCXyv28wE5O5N2tcIsZq7A5Nh1qLt6JQM/MZAY0Ej2gn6lwlZ0oGM8
	NAf0UCS4oO6hOw+Mefjvt+x1akUPYhH31Kd6Fyd1x8Y5Rkn6u14wBLQAW1qPUTq2iHlEqbfV9mw
	o/rv//DyBSp5W05EVzC1kbAVWoCYdht4xa865FSfirgISX971QYP5HA0sv6lGcwOVVtXo9xoukR
	x7AkMXYd8/zp/HcqBhITaxWhzAnxc8W6jKW1fh1NWJajd/oh29DwAgLFRqahbM8nk1MFCvDlUI0
	VfSUykgijXV2uLTZxJ3ull7YQSWnHwZqOm5JeleBziFGcN81Ztd7xnuwBmUm3+m/iqiymDiRqdp
	mS63pqnyUqMIVkJQShkgl+A==
X-Received: by 2002:ac8:7f15:0:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-52fb91e676emr189847361cf.0.1788162195497;
        Mon, 31 Aug 2026 00:43:15 -0700 (PDT)
X-Received: by 2002:ac8:7f15:0:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-52fb91e676emr189847081cf.0.1788162195105;
        Mon, 31 Aug 2026 00:43:15 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611c69ca0sm3289262a12.29.2026.08.31.00.43.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 00:43:13 -0700 (PDT)
Message-ID: <35eec1c0-783a-46e9-afbe-fbd42376870c@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 09:43:11 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: hamoa: Drop unused #reset-cells
 from TCSR node
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260827-hamoa_tcsr_qref_0826-v4-0-663c9d30468d@oss.qualcomm.com>
 <20260827-hamoa_tcsr_qref_0826-v4-3-663c9d30468d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827-hamoa_tcsr_qref_0826-v4-3-663c9d30468d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA2NSBTYWx0ZWRfX7smiMB/EOnjN
 upYzH4Mg8ML+tqU1dvnM/CmPwNjaZof1covjBlFy6Dhret56odZWuuM+7K6Wm6Y+EtG9V90Hzwg
 ULGtQqr95DdiHnh7ojwhtX++Yfy7UWI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA2NSBTYWx0ZWRfX0xP4JHZxwtUk
 lwP4Qcuu8tIPLaml864DsMQtDgTOiDObEosHHyjnm+IViPS/MHVVJRH8+1R6PbTGdKYsfnHkS4V
 aldN18FcFfBoT5VB+3COfAlHp+Q0C5SOzTrZiV3ZfxdigtMZdQBIpzQEHlO6K/zNRwLXBiIiprK
 nY8Vp/TS+1Arl5XViAs9prOHXkiJ9RZJWN3OXT1mdDmZkvIVf6IvFSwXadcBYtgWQ/hK4raq3lC
 jeW8GcsMPArJf0GmlIqdxp2bA0ouHPLYAYwEO04AyVZaiBU+oIC1cbwdcFjTkquJ/ONxlQrnU3d
 qxP4kph0DW7ETTek8wzKVbURlnHkAJ461lx+UTbLV1M8Jr94J8yVN7XbN7ARtADNfy+1eZF0xnw
 trHLJ3MxStp5zHfwwhDQ48M+io98w+XvY/9pYDAA5VX33QpaOhOnUDRml/GFT15WNuphgWqcW3u
 P8BwSFmbAmHxwg5gHVg==
X-Proofpoint-ORIG-GUID: qsQ6-p223ejLecUx9p2EmhGJSlG4T-sB
X-Authority-Analysis: v=2.4 cv=R5Ez39RX c=1 sm=1 tr=0 ts=6a953094 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=oAhxQwU1FG-qALgQiYoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: qsQ6-p223ejLecUx9p2EmhGJSlG4T-sB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310065

On 8/28/26 8:00 AM, Qiang Yu wrote:
> TCSR does not act as a reset provider on x1e80100: the driver never
> registered a reset controller for it, and no consumer references
> &tcsr as a reset. Drop the stale #reset-cells property to match the
> qcom,x1e80100-tcsr binding, which no longer declares it either.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
