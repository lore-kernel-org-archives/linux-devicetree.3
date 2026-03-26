Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317AC37F73C
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 02:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774492656; cv=none; b=sjoWb8vDm9sPyefnlgS9ysbM9aVWc/wmq/BSSK79DQg+RN5hSoItqTVMYVcdxapLwlNIMe7PzQurd7zu1J+Tn71WVMhNJVvpPEhA388C+9zEvoQvO2m0/Rltoksm5F6HdszYxtR9HhTiQ0ax5S6TClek+Bi7Gkmnww+iDSfe5Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774492656; c=relaxed/simple;
	bh=CO1Xl56yA5yxPK2Rf16ztEEe9RkQZ6sk559VWf3vJs8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mzz5EdYa5qVI4LNqETBIcPOvNw3TaAJ4xEXEZRtCokXIYctbmXYsETZihgSmDbaHPuUcTZF+4cfsrLa6r1MAbo/1tJpSXOUomJhrNcgu50LYrkaJfyFmEziakvzwYtgs5ylKC28wela+HmOtn5e0uojs9XEr0rZJ/V+d/tE1CBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X+LOh+dF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a1d2s6gN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X+LOh+dF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a1d2s6gN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PKhKr2141404
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 02:37:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CwMbSu6i+zGZS+U5lR/PyrPE
	FdnGy+7Mp+i4QCz/JXc=; b=X+LOh+dFyy8by8iTQRT9qBXkrBh0RMeqsY4GDZ36
	WO6LjrIU2iOfA2gVZPigWH9uX6kNOU2q5zD2QN2LRnKKeQsv6kkSVMENRXxhuqBF
	/mDjdWsROti5ukqIiqWneDCUVYbjuxuLwx79oJL+MT6o3wR9iVTZ50iil5ADvxYD
	4ZwLjKEo2bij/tDRpw5hmEWtI0xYUgOkpsCaZmx+eKM9uvtO2i3fKKRpGMiX2V8f
	RodI2vy7T3l1SZJtTAwXsoCqKkdmIEWwBXYISsPaewaIB+Y9NWSy/f67DG//gDUd
	B41xxYa3lCPTZoSu9sbB64M3dFW2j5pqJCmuVaRKujsN3g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q090wec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 02:37:34 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89c4a339b6bso16622766d6.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 19:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774492653; x=1775097453; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CwMbSu6i+zGZS+U5lR/PyrPEFdnGy+7Mp+i4QCz/JXc=;
        b=a1d2s6gNg3jk62GwrH4IRZ3UsApVZq0vTU7LUuRXsDPld8aYvTw0g4mJ7/I1evDcFL
         jfBesTzXLTNzRqr8h6Opo0wqOjmDYlt25+Tt/TEIRJKbF6qg0dcg9gP3Eu3PfIXcAGlp
         ji8JC/e9pRu+vHOhrMFFJ5k6GFZxG3VRxF8k6YKIT3MCfe+71hIeu33sAX6ZZAk0mtyA
         slkSF5UuxpYxeRhu/FEeT1ZTQqF0MujuKhbrLI89BdHTLMl4mAlXpegS2NAGNOZcYBlW
         hf3Q2tYQ1yeJBHYbrn6JkohedLu8mvYgfs6k+Z0L+g5f/Vta3UmGv2/S2Q/8on57x2sI
         i87Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774492653; x=1775097453;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CwMbSu6i+zGZS+U5lR/PyrPEFdnGy+7Mp+i4QCz/JXc=;
        b=DFOIiz1TXFkpELawEi9s5M3+22jl8suzR3PYe9g5UgOA2igguZRhnA47z+W/6e6c+M
         2OP8mBphRV1V42PV5JEWJEnelKqxoK62ViFNzaCFxtVuoR+DnM0af6d1AmH6SwOAxdSL
         1QJGfJxGTeLHFQAqlU4RqqieGJoVmrBzu5IapG7DprOhRlJSW21WvlJIvknvC3G6Sqig
         M6z6D1DAPmdQfkogRXqZ/8nh+qck/fnty5HZnZn4Nw9pWJftYkAoPjuPqpD1v4CEHoLP
         pxBL1z4JRa0mMapMyhP9LgDXLDZYBSHN3tqJgM5Qo5CZhO1jR809YqNz5FEZzkuFNqxK
         9r5g==
X-Forwarded-Encrypted: i=1; AJvYcCUrAZnJadZoh+k2v7otzQA3wmngXqtOfjwDTqUdhf0cIKHuedsZQ9nHnR6XQ/rmxC9fw1F5NFfVCGFe@vger.kernel.org
X-Gm-Message-State: AOJu0YyHnlgWup0KcvAW+KayqhTYL3QnfFbnDOxUD6nu/trHB1UCIrc+
	PjYEzE2Mh52PZs7knYTSbTW9ZJh8FVKMSOwTxsxA772bojjpSqadehRMOSRxU+hAD/crkvUBCti
	MESWrx1wPFqvWMbllzRu+iinbH5p2hcV4zIpIazrtJTwVew1qi/2z6pMMdRaxy2fl
X-Gm-Gg: ATEYQzxezka+3g5LMaTc3xYVeG3B42fkknfzgJaW27ngPZMF+nyj5kz8xQisQutt+H5
	zLLJVr1yk+PXI+T+cED5M9po8FVwWakqfhjMIL4rD6n2uNV2ceCrJS+M4g+fQCXCWY+fKivP5+8
	SnrwQRduVZtfXJWyfQUabazru65BfdwOE0rUD9blkOfPJ9DmF6mOk/D8fiDARCwSp2P+Q1g3tEg
	EG2Cst4/CDxXvqjuBqHH59mcnbWhsHeDkAz9aA13TFDYVl0gUQgQ0hxAGhD0fgWsB1jXiM/vER1
	zlGY/nbWb9M0cJssBOEDZ0DIhyAcXvPbDFCdsddpy0aEKIe7DTjSUOqhpNwoIQlebM3Xqs/hUuU
	a4mL/Z14T3HPnAcXhkC334W8EKcQSxCvFmONStgl1zmo78B+vAxmkGPxeAilDlCZ2d1bIIgfBj7
	rmZVP9Bwo=
X-Received: by 2002:a05:6214:1d03:b0:89a:593:fb30 with SMTP id 6a1803df08f44-89cc42b20e5mr92905636d6.20.1774492653529;
        Wed, 25 Mar 2026 19:37:33 -0700 (PDT)
X-Received: by 2002:a05:6214:1d03:b0:89a:593:fb30 with SMTP id 6a1803df08f44-89cc42b20e5mr92905176d6.20.1774492653023;
        Wed, 25 Mar 2026 19:37:33 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89cd5a6a840sm12899956d6.36.2026.03.25.19.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 19:37:32 -0700 (PDT)
Date: Thu, 26 Mar 2026 10:37:24 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com
Subject: Re: [PATCH 5/6] arm64: dts: qcom: kaanapali: add display hardware
 devices
Message-ID: <acSb5F9gZAVg76V9@yuanjiey.ap.qualcomm.com>
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
 <20260322-knp-pmic-dt-v1-5-70bc40ea4428@oss.qualcomm.com>
 <vqj2pvtjs7dgkr65e4mzt6ezoxgq5gl5kyxbbol3tbtvw6bltx@yhf2x7oix2ss>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vqj2pvtjs7dgkr65e4mzt6ezoxgq5gl5kyxbbol3tbtvw6bltx@yhf2x7oix2ss>
X-Authority-Analysis: v=2.4 cv=fufRpV4f c=1 sm=1 tr=0 ts=69c49bee cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VCkt8IDonr1v1M0M5vYA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: RwzGLXRIDPSVGIDqApwrw-dfTGHd7foC
X-Proofpoint-ORIG-GUID: RwzGLXRIDPSVGIDqApwrw-dfTGHd7foC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAxNyBTYWx0ZWRfX4OXZ5EMIw2+Y
 HbLKJF9DLrjWemOwyLjWFGoeXBb9DYWHEDjDEpsnnP5d7oeKEjTL6iNY20eLx8wheE1Z2gt70fn
 jVEaaRM7vaizWZ7tTCPXykdTx6/h+h3G9EMHrv18t3o7Fk55ibUEchxmc9ng+N6dal58UYbf8O9
 75cMgGwA+YS5MgWejOkRU8GfZAXdTe3fIVr2mFIhzenGy/ublKy+4ZEAX8YDjGdNLBdn5Xa00vZ
 ij2mexzDNqht3vUHhLny+LanDtTlrt3T0gw7HNmAhUaWgaaEuBb4xwfrGJrK+Y1Fm92FW2B1twD
 8417ADma1NDfFKSpwaGF+8ngYV521zM7iAisYQE89Yeq/U4DbGdflBfs+pb9qvV0/PPkgqi3J7f
 n4lj4vQDQGEjzNNWfljkXUp6Qq9ZWPL9DZemTC/ZtRR3vbQI+duUX60YcexxP7oFy+DEagdZZt2
 8xwpBuutJjgkuC7PmyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260017

On Tue, Mar 24, 2026 at 03:20:15AM +0200, Dmitry Baryshkov wrote:
> On Sun, Mar 22, 2026 at 11:19:45PM -0700, Jingyi Wang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > Add MDSS/MDP/DSI controllers and DSI PHYs for Kaanapali. DP controllers
> > are not included.
> 
> Why?

DP driver is not ready.

 
> > 
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 242 +++++++++++++++++++++++++++++++-
> >  1 file changed, 240 insertions(+), 2 deletions(-)
> > 
> > +
> > +				ports {
> > +					#address-cells = <1>;
> > +					#size-cells = <0>;
> > +
> > +					port@0 {
> > +						reg = <0>;
> > +
> > +						dpu_intf1_out: endpoint {
> > +							remote-endpoint = <&mdss_dsi0_in>;
> > +						};
> > +					};
> > +
> > +					port@1 {
> > +						reg = <1>;
> > +
> > +						dpu_intf2_out: endpoint {
> 
> Missing DSI1. Please add it back.
OK, will add it.

Thanks,
Yuanjie

> > +						};
> > +					};
> > +
> > +					port@2 {
> > +						reg = <2>;
> > +
> > +						dpu_intf0_out: endpoint {
> > +						};
> > +					};
> > +				};
> > +
> 
> -- 
> With best wishes
> Dmitry
