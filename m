Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D28329E79
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 01:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775699116; cv=none; b=M3y4cDG1QW0pKz65X5PfQPPKyssNGHm5sPlr4kS9quP3XqZ/uAHxIVbXNhGl6F+tzvMV32a27oQMBjih309TIYmkmYSL8lEUW3aoM98XZlqDBTJpT80Y6tkxfIdA5BGkgtyVbqiESb/zgFYXuGGajPDghyg0Q1Sz7zqcS5grp6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775699116; c=relaxed/simple;
	bh=iLshe6sNjmNrDY38840s3TN4k+QR9N42OuTH32+9BIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QyPZ4i0xvndJejBX8SmyDrmUHQNMinTPxvUs0rlsuON4fzu3RtYRuclCk58TyY7Tb8AY5xepBY9yAcIC73EViilQLX8tDvYDUNAxHwXm+IYbNHcA7ovMWZzUxnBAI106BNpHIbNnpj2Ue1i6Q0q+1WsA42DF/P6UWsQtYhAphkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YtO130Oe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JwV5Ddsm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YtO130Oe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JwV5Ddsm"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638HwC5c061699
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 01:45:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2iM4VNkJFbaIkqyIYDFACCUE
	9r6jVKLavzSuHziEoRI=; b=YtO130Oekkm/I8neifMI7f2XwxeiUjVEAutfZxS6
	xeLXJim8lcje3+PV9OoEO0m212jQ8ABaJ8gE2LEDd8CM2qa9PwZFvPSKMafIzTc9
	JBP29Da4NZ0qUpwu1Tdxfa+1W0M+pUpgaMi/9/S2xu8oWZfsxmFZWuAnVz6i2hzo
	nt8sxsIE5h1XR8NVyB+w752fV5FAfZlvp18RkWrVVTB6hDVDXWI8Z6c83oazDf5G
	IDXYkTNTGyMsgzUtpMLIdppto7CGa+MyaYJlOhXmKIC0zOavqGHlad2R+0GsTsJg
	ORAIJhjA+vCxuLuxwN3jjUOl/OCWQLrJxPwVRQGk4p/xuQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dduvv1eug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 01:45:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d5d1c2289so14975461cf.2
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 18:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775699114; x=1776303914; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2iM4VNkJFbaIkqyIYDFACCUE9r6jVKLavzSuHziEoRI=;
        b=JwV5DdsmSbwiY6Xouz7IQiCyAs3by8uCTpvK+E/abdads/bir0g1EZsthnHdKBhMs3
         8RjxIDd8W+CXe0yIEw58TLdqKtV4HdpM5BlaqqnOxWKr0BWAkkNYwRPqzka9QZ7i+h8E
         4sDSiiTuvwb1UhAuxk1umOPpGNXtEqms/8AOCAued7pn5T23cFIpgxcsoU4hND2HKY8X
         cHGL3HD16auhRH4Vz0cRllE4tteI6YeSyrX30ha/xLASigTrwg4AB1eZlQFE9yaPWBQP
         1Uvd2WPud0mrTvmnB3DJ0w8r0HnM7PV72QbV4F2rdtZ59LaRKcngBLMPVKqDGz0GSepU
         Uh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775699114; x=1776303914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2iM4VNkJFbaIkqyIYDFACCUE9r6jVKLavzSuHziEoRI=;
        b=Dn9PWfNo/lu1d/ORSe8xn7mIHyl2Go+mu1TYtdfF5VTUDl5gNUm1964AVvxvPPVUYp
         7zaFGZHMW2DshjEmapwTJZONqs+qGc/y2urdPTYgz3Scu4i6an7S9Xu3tGC26PWIdh5q
         y+cD+ibhcc3A+3oXYuTe+ciOlrvePUczIha9F06ZeDLro0sbkH5JAL/MAChHNfylSfCU
         uo8oVzNplw2HBCJZ5dRAmFgoIaEtOJvmxOf34bBpj4iWFXBFIcZJj15k8hCwAvboQgXS
         cWuAcxX5VSbgvc5GWl4qZYILRJdl+rzqmY5BXiGwbt8bgRWEeLywpgfASxFPYjhb2+RQ
         7TLw==
X-Forwarded-Encrypted: i=1; AJvYcCV9WQKKQQXtsXdRVno6B4N1qF3vvUKTAbsuq6O/Dryg2iPJ8knDFeqdOeYx7REJMrwwl+0/EudfmkSN@vger.kernel.org
X-Gm-Message-State: AOJu0YytmommeNfq5B8ssJ8FhtmHAHO8chAuCb7tfhYe5aFKgALrmLDx
	SSrtIH3Yi4+/V1IFrBNZX9aD0iaM4YMWO6xk2F/nvsCySIyegxh1xUQQcN20QtVKG9N7Z6tmHL5
	KEqNFV33H6ascry/g/GyobGm5Qrb7JWI3t75KxxJ+KZJUXszecY2kS5PNcXiU7lZ6SJGCiEeb
X-Gm-Gg: AeBDiesZImwV9QoWH5agupmSFgKm292smIJ+T8GL/0hGAVIRpn9H/jR67eg9IVJyDt3
	bEnNbm4JUfYzXpKAR6bJQYO+Yn4IPcaZBNbRxjKarFPLYHhI7xWzaQC02yEA/JgMynYpzG6LiGv
	B3yV+k5QhukKRQVv4SNZN3FJn2wv4hyRkxCTq+xpbR9TbUT9kgwD1oaTWifGuR7rZ3bM5OCrIVa
	z6mo5DZVhzoyt5gbUgUx8L7zGt0UDkvQH2H3khviLfBns8a1Pz7Iy1hfyMPFZHr0f2UEZAwPg5y
	rVMQIaVGBgCE5vLYYD9voFgODJ9TW3vFIHkFU9TtvWxUhL+vE7OJTIMlE3dxi1mUsjTc5s4kKbD
	LKnTkCZJJw8ik69opS5GllW3qxEFfq5ZHQO/U6wyRN+K0EmRPDsJBvOt0vyWCcSSGxLftgMNkTj
	Vaj92yWRjAGUdxR8+WOEtdB5Kled270WgkOco=
X-Received: by 2002:a05:622a:60f:b0:50d:8c24:20f2 with SMTP id d75a77b69052e-50d8c2427bcmr225557391cf.30.1775699113618;
        Wed, 08 Apr 2026 18:45:13 -0700 (PDT)
X-Received: by 2002:a05:622a:60f:b0:50d:8c24:20f2 with SMTP id d75a77b69052e-50d8c2427bcmr225557091cf.30.1775699113178;
        Wed, 08 Apr 2026 18:45:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cd30d6sm5088108e87.70.2026.04.08.18.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 18:45:10 -0700 (PDT)
Date: Thu, 9 Apr 2026 04:45:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Joe Sandom <jsandom@axon.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] arm64: dts: qcom: sm8550: add PCIe port labels
Message-ID: <5bfv4l26qmpnqqa2zinrxkaktyofnbtotylvcmkl4xcess5pct@vsyzqz42ycwi>
References: <20260407-rb5gen2-dts-v2-0-d0c7f447ee73@axon.com>
 <20260407-rb5gen2-dts-v2-2-d0c7f447ee73@axon.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407-rb5gen2-dts-v2-2-d0c7f447ee73@axon.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDAxMyBTYWx0ZWRfXw1DdRC6j8GEH
 qyKl+cSDlo4uvdZtQOZgpQnIQGbyUf+DXQMywjqRfwsA+qxwZ2LbDjJ1tsXYjOOWycKcc+Zf73b
 0RhMERLPC1Kcucz1lpTs7gzJBCIEgWiGeVDjwuJP2dAnKliNp4qe8r5wyrERTXy18wRYeKS2oPW
 2e5rhE/Bx+q/T+Xkqz2+2ZOeeT86qae8RfcHl3ffvBNUHKjMMfUSLusgxhDd1RWf0gd9C6MmHme
 MO+Fug0l4BsAUHb28FhB7XnU2bAlwEVo17l4fWU1fO9oQAL6vblIzCkp//diUniaMf8YVofAug7
 TqTvuGZw154RyXvehxxFFfi/Wou8oeNeEBaTA8I2wC7Ly1rpq00DmFM3dg6rBtxYh6vnwLJaERv
 aJNmuPdADT5QxzhH1zPb9KceNbBS4KEKCtKwLVCz6fr14pxb6+RipUIOfk44sihttbhUYmiQgb0
 qMXItFRpA2cBZ/vU6jg==
X-Authority-Analysis: v=2.4 cv=DrxmPm/+ c=1 sm=1 tr=0 ts=69d704ab cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=h77gEMGJAAAA:8
 a=EUspDBNiAAAA:8 a=HULZ7YFajt4KeWS4dekA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=PYyYjrCoJcZo81GydsRF:22
X-Proofpoint-ORIG-GUID: yhRIi5g9O5-xpTL3sK-EB7C3iH13lAhP
X-Proofpoint-GUID: yhRIi5g9O5-xpTL3sK-EB7C3iH13lAhP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_07,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090013

On Tue, Apr 07, 2026 at 04:46:45PM +0100, Joe Sandom wrote:
> Add labels to the root port nodes (pcie0_port0, pcie1_port0) to
> allow board DTS files to reference them for adding endpoint devices
> to each pcie root port.
> 
> Update the pcieport0 reference to pcie0_port0 in sm8550-hdk.dts and
> sm8550-qrd.dts to match the label rename in sm8550.dtsi.
> 
> Signed-off-by: Joe Sandom <jsandom@axon.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 2 +-
>  arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 2 +-
>  arch/arm64/boot/dts/qcom/sm8550.dtsi    | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
