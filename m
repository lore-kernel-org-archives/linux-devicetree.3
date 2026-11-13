Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556334;
	b=DTlVhOHlyyNFR/vQszfvFJI/w/17Z4rcB1f0NRcQHArZtEdAHOfyPgHKzrRZYUjBEIvM
	 d8mVtcnlRf55XQLZdm6mxrDlDx3C/28oVcOUyKO92NKhA1j4bfrgkBEYRPw6ZsZ6l79cZ
	 lmZItqEBaXWoIQPHJYgA5DnNSEwAf/xF2xWr9DVuEXWb4NUyOk8bK3rSVaxWbMePBoFCE
	 1Pxbf7jBfiWiCVQ8UhVMjqL3I/FwjypKXf6oRg3rCSMhZtsRNB2TWHNF1MbV8D5sPwFcU
	 AfIvwcZkMMrrbQLiFWWFY9tgAyHQMXYvtNo3fkbLdQ0OmnkPwn1ZgLFWDkDbumIC5jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556334;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rCXtwXCy7tgi467/K9+zFDdWPpcGwppTaUAh+YrEspg=;
	b=bxhY1INFKpp0rS3vNxzM6EMRWRvYpgS4UwZPGYt07Xv9592awFwvwJ0hT+5NOPGmDqbj
	 xznRje9BGMYBRJv1Mw1apuz/7QiNpPWCse81ykVEAh/lHE+TNcCdjAO3Dm6I38OABA+Om
	 jP2XBjl2z8hrZOojI2dqNCaqY0eXIg+7P20IlJF3Has7Ph1ckIgC0PD1YBdirghyhyK/g
	 KSd6T2pqDNSxQAkV2VdYz6I8SU0jCdGv8INoEnQkVqmyjraqbz5BTWohsvmBXKbfrus7s
	 nCHhyaWRog9cbveIw9xVM1xCq+NGbvSE39ngEqhXd0/t3Vjg6P2333I+kc+nSp10uvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MZuOW4sg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZeMbwW9p;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DA7606A330
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 07:52:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3DA7606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MZuOW4sg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZeMbwW9p
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD56vhI3556917
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 07:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rCXtwXCy7tgi467/K9+zFDdWPpcGwppTaUAh+YrEspg=; b=MZuOW4sg5PQHC5L2
	4VDBN9eTZKi8L74ybienDF5TNJYsIHiHGcUYzmDmJ/npqbJLtLd+yWLbWxc9qfE2
	1BnXTMbpxk4+SGrznbWAdDAzTZxA9/EQbO2GjkPP5oMgfXDW66ah6F5t3EcDnL1v
	eY15eOIMffTxDHq4/8sM8L7HrCM2KO9YreYQ1vs6t2YydhbsDYNIiEZdCo81NPeF
	+5tneyhCZWgyz/GpPSJrDyIahyK6n4lfcWwyLcqYRLKLfZI/W99PEBvAVNEVHDof
	06v7fWDexadkbKXZL25ieiexSxIowDHbmg+aNLi5UCeG3AnLGMyqz5tcMQbxwaG1
	VUaf0w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkfdj6nn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 07:52:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-536540909e5so2016131cf.2
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 23:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794556332; x=1795161132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rCXtwXCy7tgi467/K9+zFDdWPpcGwppTaUAh+YrEspg=;
        b=ZeMbwW9pA1nkAHS75gmmJ1IYp6Wu+u7m38yLOoDJ6IbLa2fS2Nj+H1AkBmAavGn852
         VQ0u2H5Gh2e+Y50DbyOQ0fh5bx9jRbyfGkm+seu1vj4VR2Z+MOzwlr6QEGgX4zoKI31X
         hzYv0/596cL63L4I6vQMHy5xe9Oph/BsHIQJz1/4G8AlxGXrWLd2NNbVll5naEIuE/YG
         gtLmdNWlTlkpnI1h+mSfE07g8DjaYHJEjAwa+Ftic8Fh5+kLmfgUUVCtpmbFrT2cYocV
         91HV12TytzsprRLcUYmYth1S/PVSdsC47FBveYUpxZmpd/tjFF67YL80b23nse4XGgIZ
         LhmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556332; x=1795161132;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rCXtwXCy7tgi467/K9+zFDdWPpcGwppTaUAh+YrEspg=;
        b=BLe1RULkfZp5zmeFO7NWs8h6ST1SgbVjN4CywXCp3lQsjBQltvp5ZeG+XINf37xsV9
         BHhpWYWj4zzMIpmaGfwU6gGxkA8F6P84OKgYOU8GV/h0sY1JPgQbIhm2lzwN9J+NGai+
         aUoHTpN3GqdMa5OiLVzS+pAfID8aDtFMR+GhA05Thni09643PVdHyK3kiXMATEUpi/T1
         9lcSVr1PBccFpLcJLEWuBFSFgV3+TH7MMhyYB+Gs2amQyfPdTGfPAMwMm0AcwRnMf0SQ
         XRt6h3y7epIyFIChTjJn/xRMluNZjxzyaecrh9RzZaNeKzvc9e64W4fsTcMOgnNe8vyl
         nXkA==
X-Forwarded-Encrypted: i=1; AL+hErGgx/rfQ1DyDeh1Tywk6ojDwxlPaAzWU4IMfK8LSOy4lJYxrg96l7J993TTnlrI1p3TG935HcppMVSH@vger.kernel.org
X-Gm-Message-State: APuU4Z8vdCn/LiW10drVJ3mMK7mgfFU/8wBN99bO/OMmgqnQ6fXx1TNV
	NHrv0t+SXcqQwbYRlOqVpnWTvp8gAbFkakZKg7Poup3kbZH9FcCeCNsP3cYdnI2UvGXdTgIX0eP
	bx4AFa1dNxUPgqSq5aXx/UuOgKfyoHMWGSvF0EzJzz/DgCJi4Jyl2on53QE/JbXGH
X-Gm-Gg: AYBFou0OncD1QFwP0rBGUghWrImr7uALDtOMPUgt8GtY7POvAY1P08yOL7u6T4Wn2G8
	WH0i08wjHCoWNsKfzEVqb0YWRI6V9QPZpIqgO8fAzk+oatRcoaFunBrupSeNf435VYb4c5iiii9
	peZht8U3peWGIi20uCmJo+l40L4Q7yfEx9kXrJbZWwS7YgKzuYFFQj6OaSFFKLPhznnCRuKdF1n
	8bNxuyj8SK3YC/fSJ4ldsZIBoO8rlt8p4yIEPFd0if7XFsGOASluVhEHzCdFqCvNN+SCL0T0tbz
	SEVzwjy0rodYNz4Ni8B1XQSIW3U7h9sfCuS6FV4sTeDQRARKr/3Ucq8vTd7AaHaiJ3YQSXPV1IH
	7qq91CAcvgbovVJD7WSIY/3V/9WEFr2GyEFWp1Ao+UZcJfqWEDrnKNQSKN9hYa+9XLNUZ++c=
X-Received: by 2002:a05:622b:1d1:10b0:552:896d:89b5 with SMTP id d75a77b69052e-55ac6b6e804mr27539311cf.3.1794556332065;
        Thu, 12 Nov 2026 23:52:12 -0800 (PST)
X-Received: by 2002:a05:622b:1d1:10b0:552:896d:89b5 with SMTP id d75a77b69052e-55ac6b6e804mr27539171cf.3.1794556331625;
        Thu, 12 Nov 2026 23:52:11 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b236a6sm61945566b.28.2026.11.12.23.52.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 23:52:10 -0800 (PST)
Message-ID: <45da00b9-c7f5-4c4a-a310-00c2ba94cf6e@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 08:52:08 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64: dts: qcom: Add MSM8996 SAW3 compatible
To: "Rob Herring (Arm)" <robh@kernel.org>, Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261112-dtbs-qcom-v1-0-1978370c7cad@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261112-dtbs-qcom-v1-0-1978370c7cad@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMSBTYWx0ZWRfX7swtrM6oih6j
 fe/JXtIczalCcxRp21D0gzntB5mDnB/2V/vDWk5OkNDCCOaEiCcjZV19TKXMqxtUC0x2ecKpwDt
 qJSKONcxkn/6IvDPMc+MGBoabUSwRYA=
X-Proofpoint-ORIG-GUID: QZN8tRXFfVsstzspFa2qP_ClB_dAl170
X-Authority-Analysis: v=2.4 cv=DoTDa2/+ c=1 sm=1 tr=0 ts=6af6c1ad cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KM__OpKlO_rSzR-_7FQA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMSBTYWx0ZWRfX2xttATsssVNL
 Yz7O7Ht5CdC6YfyR+egENilP7JWzlPolr9ycM/rfsFTR3vaCnmIQLDlfOrutd57fTW+6yXWyoHp
 ZfeOkGeomcZVMR/y27y6wM1PCKEDcy0Wvp3cZ5OJj5qp34p2R53wRDr1MxYxz5K+KDp7kw3bALi
 HkRXE4cy5865smWc3WvOaHq8XYc+nDnDGdcDYZGJw3lOGnrYiP/MCvICspj7pTDuDqpeUBBrmO3
 JjKhfIwVEs3UcMM5WXBFsNsuzyicYbm8jJy5qjkWNKVu1zLlPt1QHk+By3QnRImJc4S3zQbm2YC
 jdUMAcDorBOnucrMKlOetplajpODxo7Agsjs3GJoamdAEc/yRmmTziVT7vb/pEvdacr+gcIPiDR
 qvIcApbk9r7fsm+fB8xuouRDtlsj46DIb1Zoo+V9Ptrb0qT1MV0E4z3dY54Nv/sOdV9kAu5Yqj5
 cXDS0nB32Ju/eX/+ztg==
X-Proofpoint-GUID: QZN8tRXFfVsstzspFa2qP_ClB_dAl170
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130031

On 11/12/26 9:26 PM, Rob Herring (Arm) wrote:
> 'syscon' nodes are required to have specific compatibles, but the 
> MSM8996 SAW3 nodes are lacking one. This series adds one.
> 
> The binding should be applied with the dts changes to avoid new 
> warnings.
> 
> Rob

I know this has been a thorn in our side for a long long time.

I believe +Dmitry had recently come up with some patches to describe
it "properly" - are they any different from this series, Dmitry?

Konrad
