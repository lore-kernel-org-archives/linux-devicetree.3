Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C832624DD15
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 01:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774314777; cv=none; b=KsJwv3zAUiGxCDKUWDuqKhS557GeANIAHkAtpkXSTX5FqRnNy7JnhK0+I0pLmqhl3ghtn6h4hRTANvnHQoI523yHifzGORX0cyomekL5vKW/rjZt3W2uJRKNqJp7t5RvsDCx3OJJo7e3ZnVOQdiIMfv6GWKvqRL9S6hviDW0P2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774314777; c=relaxed/simple;
	bh=EHVTDvCGaf1n3/250js1GMFPx+KIr6aw8SlQF6ZRvAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a0Qycw68gCWNFcVpg7K9wmkVfDRq43dxuQTx+nQcm5T4ZFtqJWwJGS1x8bGOPPq3407yzoUGTQoQVUA2GpMF5dExpHqBM7Y81pCUJY5KA3gyAqTfuJiDr2OVkb78OnXRPNRLAA/jg0Fm2WpgTaHxsUwtBAjSzWXP0zwRcOd7B3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jcaCelv9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b0SdPiJn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jcaCelv9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b0SdPiJn"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqXrQ1761785
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 01:12:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8C5oIC1HEyCh8hz5jfrQ45XY
	Oti0XpQiafqzF/RfHQM=; b=jcaCelv9pClJ+E8aqS43co/zr1z1o5IghiQ63jKH
	mG6g4Xi6MM1PlDPd3+3FJ+64o/5M6EsQY4ERMWH7yquqFqE8her2cl61/4yln9WB
	FFep2hHfBPHii01wR4QYcAYOfCth2/241uRvgA4Qd5G2f5lskBb9515fg2Pn3PIH
	o2uIZ3hqJjlBBsN2j1hAKNkZnzQJeRG5XBokpktOeIxP4WdTOyI17eES91Fyznze
	u8yCD7Zk3mKRPK2cRB2EP4SDelUyrB2HRmaEOYFz2iqNi68fS7nbf6HkNJA5aNUr
	zJj3I5M2sn1Igi/X9ZxVdCfXMNXhAOWUhDil18jSkzd2Cg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d36f0a6ks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 01:12:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5090e08dcfcso47382711cf.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 18:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774314773; x=1774919573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8C5oIC1HEyCh8hz5jfrQ45XYOti0XpQiafqzF/RfHQM=;
        b=b0SdPiJnZ8cT3UbKZLtd6oyW8KrMyEmTXvvxoVptDgtw3K+DQIe0V0kd7+XLtt2ZjW
         2OQ4PRy+zlPlPMjCS7qBp9oDqBSQIX+xcOjzq6NoS7MWphfNuwhm9XuYxxMmpM+aTuET
         LzxmOcoTLTY+ZN77o8yPjAVXXz+X3Cyj1E7iFVDCJp2Fve7fk6ct344zjHD506FAl1Wv
         5yJGCkL7LyyzfSxZSSdJHGlKulftiom5x5HGBs1ZtWDsIfpk7IHp7dp30Oj4oVaQdYWC
         m3IlvIkYPxMkRoiL8Tyv9cBvJeOAtVbFrmTHigG7YNMB1vi4FvkoFz5zI16gsbJ4lqXM
         j4hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774314773; x=1774919573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8C5oIC1HEyCh8hz5jfrQ45XYOti0XpQiafqzF/RfHQM=;
        b=QP9RbXotu8NCFTcBxMzKIy7+3s347Nt7JvcUi9D5R+WmvcNTMjV0rlv3doCZgES6AT
         4RHal21AL/Lq/sFxvc8bp+oipzzgKD68gNzVHwySIo83wekUhA+mmc2BFfxTha9vkgcy
         +Rx6fOVKiSpUtDX0+NsnSVUgAkByJB+L2/bGPxTUC/xNWIATns9ahSP88FJ3RDnuFDpH
         q3PspJJI6QcGFZF0Vxn210YcWfoS5pnVWDVN+jTMLQ1oCO3jRGoe/9J6h1TRm91sFjmf
         Wvgon0Qn577ckmq4oXZh7zFGoLChmKi4IKtuF+5A9jkYoy6VoOiwbUBmjf/N9N/abjVs
         /uAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZE+9NqHi0/v2X6c1MIcXkc3PfpvzVUUHEqP2IHS8+auwizmPL/U8K8nFMqaH6r1tY7r85NpRxFfng@vger.kernel.org
X-Gm-Message-State: AOJu0YwbeqPGJh9AfAsPHdX/VF9ifE0M1MjzCcXp04+RqYqvZGyaL9mp
	YO5I/bnidXuOW5O39gO7cL54BAYukBPHmXHL8nOWhZtFMz+prCpPA5U+VJuWQKHzYAV/wK0ijXX
	qksnEXPlJorAznvDYtKZh+kXdnzr/AW5GdEuIbD0YA+haKYqhsY72tNsH4SrM6nvC
X-Gm-Gg: ATEYQzxKuTP9FvrO0XnodN0/5BKjt92+T/q2ebekpoxl/RumMGMMX0yV3YfSgl4du6T
	EvwXPaHYfkbCz0fMwMklIGfuqqQMgyf/46nH5cZcrabGcK+EBX9XWdjgA+amW8gvwEw1XprDYsQ
	yjWay3OS7bspQki6JEe8fVV3b2yCY8vrlod9CF8N/bumfJBNN5Outg+w8OuZI2csKEn73hBEnsd
	ym5tVzPtWuyqAAC8XuFNdQXVnieU7lSJgSs+Bt5IiKhgKx0HM/eWVaeOgAZtK97+YcX9eVHGnlo
	yx+lOlG8v/PbplydXQUgbrgzOHCihG1n4d/uqdv2fj/mxrl6+cY43QY34I1cYuwbEjXg0x+C5CQ
	+d/Cv6uAv1TpTpIPO1b5ki2IAA7B5soRfVZHDSBWxLwEIVhxFaxWs+ekt9F/kmUfzf71bFBor7y
	5l1+ZZ4qyq82DEdddMF0sPCgjU0DXdF2/N7JA=
X-Received: by 2002:a05:622a:a28b:b0:509:50d:b9c8 with SMTP id d75a77b69052e-50b373a033fmr199684251cf.1.1774314773042;
        Mon, 23 Mar 2026 18:12:53 -0700 (PDT)
X-Received: by 2002:a05:622a:a28b:b0:509:50d:b9c8 with SMTP id d75a77b69052e-50b373a033fmr199684101cf.1.1774314772582;
        Mon, 23 Mar 2026 18:12:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf975e9e3sm28139151fa.16.2026.03.23.18.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 18:12:51 -0700 (PDT)
Date: Tue, 24 Mar 2026 03:12:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH 1/6] arm64: dts: qcom: kaanapali: Add PMIC devices
Message-ID: <3u6yfqqcxrmf52dl6xxvnrg4jtmwekpm6n5t4p4ujead3urxqg@dognueejo7hk>
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
 <20260322-knp-pmic-dt-v1-1-70bc40ea4428@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322-knp-pmic-dt-v1-1-70bc40ea4428@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=b+q/I9Gx c=1 sm=1 tr=0 ts=69c1e515 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=G95pKlZTSomyLyv_dk0A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: wvJnTaxzWmJLoG-L_WL8RiMNETXJk32L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAwOCBTYWx0ZWRfX0z1Wxeo9Gj8T
 2yqQ+D5Qw2rYmSxxSJANc7SjM7RDkV22pSIFLFppEC8eKMyVH+P1Zj5fxxzYSmke/wWZ6KsarSv
 WLsmCkRTa3cdr//MGEBumKIElmz1/tBU+voU+eKVZeKmcX8t0pqg1kWpxRbezwIw/WVaFp+c0sv
 VFXJETo2jB+JkcJddO4qFGygzt7QCJa10ypItftgYesfuimyxaWa+LP8YSvXJ0kRFLqPdPZVZiU
 APGNiH9vhf3qNK61jzyaCGa3G2AlqUfyOaMqbPjzcmqeEgfloZVdJVE+ZoTmy7uRc3X5QjXJSa2
 3OnlTTcrdkUoRHwxe2BxaaFUbKoz5L61DFY1uMEcel03dUh+oU3o8++fmclzuhhxoddHjmF7v6z
 kttU07Nv6oSpc1Vfpkj+OMEPvgu/TRvf+MUyJaqO/Yd53JQhZC11oUTETuIOxg6aBIJgUkojxVp
 KYAzIT2uzIM6+BnJ8fg==
X-Proofpoint-GUID: wvJnTaxzWmJLoG-L_WL8RiMNETXJk32L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_07,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240008

On Sun, Mar 22, 2026 at 11:19:41PM -0700, Jingyi Wang wrote:
> From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> 
> Add a spmi-pmic-arb device for the SPMI PMIC arbiter found on Kaanapali.
> It has two subnodes corresponding to the SPMI0 bus controller and the
> SPMI1 bus controller.
> 
> Also add dtsi files for PMH0104, PMH0110, PMD8028, PMIH0108, PMR735D
> and PM8010 along with temp-alarm and GPIO nodes under them, which are
> needed on Kaanapali.

"Also" usually points out that these should be two separate commits.

> 
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi          |  47 +++++
>  arch/arm64/boot/dts/qcom/pm8010-kaanapali.dtsi   |  93 ++++++++++
>  arch/arm64/boot/dts/qcom/pmd8028-kaanapali.dtsi  |  62 +++++++
>  arch/arm64/boot/dts/qcom/pmh0104-kaanapali.dtsi  |  63 +++++++
>  arch/arm64/boot/dts/qcom/pmh0110-kaanapali.dtsi  | 213 +++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi |  68 ++++++++
>  arch/arm64/boot/dts/qcom/pmr735d-kaanapali.dtsi  |  63 +++++++
>  7 files changed, 609 insertions(+)
> 

-- 
With best wishes
Dmitry
