Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39330374E4C
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 21:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777325241; cv=none; b=G0N5PkrBhScruOtjGRkS2ZW8BbRy49AGQMTqM2DZ2xqavoaRgvLNoHKQQW2KWgOKQNXaz5oT6XhARB64CCtXHHdjJj58aumqhMRIf5ptfWYKrYD4j2fK54JTgwt4NxcuzJ2MbvMlGn0HJ9OeVrXPloumXtIMeSFxkQz6dYNQm6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777325241; c=relaxed/simple;
	bh=2dMK2CeWM50DA/cKroIjF36jz4FWNs0gFTQMNXDpw/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dQRxIqQrRnzrZ3Ea4ubwyjP8lxLfnwdmbdIYOpZH7xMjB16Wse5Y20imEJ8LY+SfijX0xoE8edb04+kW9c4KXj2pfi9f0BP3HnSQXLIkcC31jIROZngVtx7OALLmbVbft0IdQ4UrkeigieNvKZh4dEYylGArDTJtN5ebcczuPNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B4r7U4pu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dZHVVVPQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B4r7U4pu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dZHVVVPQ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RDteVh241140
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 21:27:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0eM6T8roauSQzRuBmRoVn2bg
	U6085UljmY4Iu7OUuRA=; b=B4r7U4puMg2NvvaNTLi/06KcuLeGhcqlfXtBwSvM
	aNzN/rUrNYqn5h2fCmHg2lsaOFYiheaFwtxrPLjSGk1frKXNykvIAkzFQLUKErpb
	ijfcqznKwBem2NziHnaYFViat5FXW6OirNBXw/u48kH+9YQU5IFxr95Y5LDPJGuz
	WzdCXYm1kjhBI2FpJwYJGsevoeid8GV5DJU2Qwl2Y+nDEgkr3DDgQkNpR235XOAz
	if2coBXOPTbUAQuW3jLTtY4uUiNe4/BsNWQYbG6ECflmJgwFremtfzTY/yBrfK/H
	S30M6+5csLFp3DrThA2gKK1W3Pic5PM/RVZw1Lx5NZapBQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt946snfn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 21:27:19 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2da19227bc1so26079132eec.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 14:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777325238; x=1777930038; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0eM6T8roauSQzRuBmRoVn2bgU6085UljmY4Iu7OUuRA=;
        b=dZHVVVPQKlxHCmiwZj250keaz+vzvJLLElWM3Ujy0h3ZywOdng6Ftwe0q08yphZca6
         t7arUpGaMsbQJDtmscfdrTQxPI7c2NhgHA7zKjs1Hlie6xKLpHavuqtdVDiHwfmvCmjv
         aBssNG0/c/HtvXP/Ym14IUlE23JZaSxwDGDozNZsQ2/tRhCkb7KYoW0muZUdNplGDxTM
         wtVQPbiQTt2sc917c7R32EfAKlP2HVV4+gGpaqdmxSxNlbjsBCIvss651bPw5M8BliQ4
         VrNRQ43HLPpS1jRMa+JvnwxwCBGVGYiAgi3QxmWft9ImDAPnTgFUD9SKVh7i8p1ouELg
         HvOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777325238; x=1777930038;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0eM6T8roauSQzRuBmRoVn2bgU6085UljmY4Iu7OUuRA=;
        b=jkGnM1orx91RhRmA8dRuoL9t1Z3golUj9qeXC03iztk/x5rVl4cNJ9mv+oyHsrqYn8
         k8YGXDd5j2eZxzn0/UWVYu20Rud+LSzCD/OPkwFtZL8UWhDBOK4Wc0Ol1QhDwJ9evbma
         5DwU9Irk6Xyv8w4HJ4R7t4LFc/EoBIbINy9yJJyq8ScPXpsuGJ2le3O1427MFYYXkEX1
         NO8AplIFsSg6Iky61SwO7yEHbt7cFwauH6/IGDfNqTIs6MNBdt5vylirNUI8+JeVLVhf
         U2Q5oRtOaURUijVsUtw004JvdEjFMxbS18l0ewN4vWpZXSfnszwKpM+FSN0st000SKzv
         jtEA==
X-Forwarded-Encrypted: i=1; AFNElJ9kWn2T2JUaiHPW5Y99adNNBDGviLxDRb7EI+bhc8JCEyUgyQIUfsF31X9OQkos3X+sW1XJpHEsl+CL@vger.kernel.org
X-Gm-Message-State: AOJu0YzWVwkDMs/Fb465QO2Iol2ii0rKfbWvivjd8tf6zLqT98c9szIM
	L60UPTs9lMO23eME4PfpfKtZRgxpu+GhfS4fZbDUzYVBWXU/FIM7rIx3eYSUTbSW7VhVS1S1qGV
	/clhmX1tWhy3Nzm/q3/ozUwgnXt4VOSJyuM8ydmsL3iVexos5vN81tNZVMAv0WmBG
X-Gm-Gg: AeBDies3dOtehhdbsKP+ZrFp6waKhCh1Z4yF66uLtEruUUP/finB15Bn9MagCW4i9b3
	kRt3nly1AQdTomnXov2Ds0XJnvdhxxJiunsogllfq8NBi1o04WwKvwrSdTm8XQa6S31LGwesfdw
	Weq0ZpnKBJgTX6ebwxRJVSS6X+eBb7NRYGXlyXeizlKR+1HNQOpIpKtRufaPjzRPAMzby4wOUAp
	+xocOM/d/9Xfuf9pC/5+ObiJpizwURb44B+hz0NZ3gSMt1r4jK4wirhyRKisiveU7MMb3pv5UAb
	IJd5bFmXhQ6PH4irmGssPg0+rIhWErBrozqTFe6ByhxUe7w2VG/5hZ85cD/2g0uNJkzdG/LBOBf
	XTc537KckiA5IhMdMAwyurZ7tRkliDTxNFU56bTo2Gc653uamKa7wtYwWrdfXMLtj4me9hHrXUu
	EyayEX3T347g==
X-Received: by 2002:a05:7300:73c7:b0:2e6:e504:5435 with SMTP id 5a478bee46e88-2ed0a015a63mr320153eec.12.1777325238226;
        Mon, 27 Apr 2026 14:27:18 -0700 (PDT)
X-Received: by 2002:a05:7300:73c7:b0:2e6:e504:5435 with SMTP id 5a478bee46e88-2ed0a015a63mr320133eec.12.1777325237697;
        Mon, 27 Apr 2026 14:27:17 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed09f8a909sm690956eec.4.2026.04.27.14.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 14:27:17 -0700 (PDT)
Date: Mon, 27 Apr 2026 14:27:15 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: interconnect: qcom: document the
 RPMh NoC for Hawi SoC
Message-ID: <ae/UsySqVB+UaahQ@hu-mdtipton-lv.qualcomm.com>
References: <20260409-icc-hawi-v3-0-851cac12a81d@oss.qualcomm.com>
 <20260409-icc-hawi-v3-1-851cac12a81d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-icc-hawi-v3-1-851cac12a81d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YcWNIQRf c=1 sm=1 tr=0 ts=69efd4b7 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=leQ04dn23ONfhV9bpxQA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: 1OXY3UX_iIGXzYVRNFfFsGNFrNI4JB16
X-Proofpoint-ORIG-GUID: 1OXY3UX_iIGXzYVRNFfFsGNFrNI4JB16
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDIyNyBTYWx0ZWRfXz3vuUIhYK4hG
 MqICGFIgmqjaTIY8t+eoIVpqIQjzG50nQgtlhexfblRCTnpbfbytbvAjkL1F/pmukIzJh3MKMXw
 uFGCPWYn3uKcoGuEaZVpZ1QNJyzqSck8Sr2g+e/BonaOzHuE8OkX2tjrJ5UVaecOvMX5M+5plIr
 5ElXL3lwj456e/JSaJmqH+UQx3XPgCz5WmXf854znISF+6YoXX6UgvS1h/6Hkfa4+q5GNTZB/WK
 bl3BSOuTANn0x6fbrTrS4zpzuYRGHavQjMoOfaIt+cpZ+FCzjEnE7T3UHXO2kXaXB9R7nm1LHOS
 9hvimBzaCkMl4bsIDZRHYVqjFlmnh4MzdqRx/KuQz4PdaJdq5K30onyJiBnZ+NsP0LmCsm15J3W
 +gtYhGOc39/newND0M39Bple2LZUAI5dlVgZk2Xwka7/GWnGn33Hcs8QfGbq3iYfog7tBrPqG3I
 Ov3+qr3+uw33FWLaLTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270227

On Thu, Apr 09, 2026 at 02:01:37PM -0700, Vivek Aknurwar wrote:
> Document the RPMh Network-On-Chip interconnect for the Qualcomm Hawi SoC.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  .../bindings/interconnect/qcom,hawi-rpmh.yaml      | 131 ++++++++++++++++
>  include/dt-bindings/interconnect/qcom,hawi-rpmh.h  | 164 +++++++++++++++++++++
>  2 files changed, 295 insertions(+)
> 

[..]

> +#define SLAVE_IMEM				9
> +#define SLAVE_PCIE_0				10

We're missing the equivalent for SLAVE_PCIE_1.

Thanks,
Mike
