Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2403EC807
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785408411; cv=none; b=gZ87J5m8hk5r3eZlBe6skvYWgYfspQ2fK+RgwsONYxTYsF48MO/QC6EgDVfb99P+bRNWMJc9QVoJIeh5XlRxJat0iUfpKKZTWg7PZcG7B1v5xKcwH0w8jSX7ms0hVrSDHbMjlUNenaGC8+Butv4pFEeR8gGAHASZZC0zF/QvkB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785408411; c=relaxed/simple;
	bh=M8DyOH7AQyBpFuz7JQr+SfJ0fGXkgHG6bUmY9Swp2Gk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NKTWKkSjC9dIxKlHpqgGY991/ycYJerCoaJrf5roMZDQvqhMwoA2o4bH2g9Wd0IKMm3hCmlMa/xV5nuKpIaZD6kS7YllrEFR5McWpNtswZtUcWmIHkQ+e/+a/GucUJ7Q1Gg8AncuKn/90rLFqsyVHTYK5Lk20+FJJu9lSWRjgFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hzaiUgFU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iS6m0qvo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hzaiUgFU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iS6m0qvo"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UA2STr941516
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nSX+ZACKEIx+v1ryGz1A6GcLZ1JO93xC+CPtHZGOTfE=; b=hzaiUgFU0MKjUWQE
	LmIBAzypuDjH2VnfLnPssFZREOYsS4xkrekCgrQg00gyWv1VukJYB5hoeP4UJAWi
	z/VjEezFWqU4uS8sQr/V4Dho+vxe1PHlyNp+bUnTmHTPb1rtRSU/MpDC5+eW3oCE
	N1Mnj/gRPvNKRx+xo+uuFPf0Z0r0gktA3yZNFSQpc7Zq0vwQ0rleaFkiDnK0qdZZ
	Oo88Bd4jnp6qBe3bgVSeplOdAPP+QTIq6Qm51CYfGBzLIfHlwS1HDPsCAQRmRapk
	KBOQfU/L/aYmCOBil8ww3jocHHtDw6FCXQre7rIsefjxowF6WF4FHHPGCtBC7LVI
	7Q4B7g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3uqrcm7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:46:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cce870a060so45572755ad.2
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 03:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785408409; x=1786013209; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nSX+ZACKEIx+v1ryGz1A6GcLZ1JO93xC+CPtHZGOTfE=;
        b=iS6m0qvo1hZl399FNRUle9GObBd7i3eGKzRmA51hnV75c6q91n5hEulMz3XJR/AF7Y
         292eyzW2bRK/I88ACcl4sBktQOSq+kyyE4L2n+bjV8A0MMdyIIzoLmdaKxVDqUcmVHGl
         +nbZZtCf2SKtyfbpMDsMboxLYvA64mZxDEXUdLPpWGhrLc56CzKRVxsjCe1HujnDMxyq
         s9XYHG1do36qt79D8YyVPPVECPCXcYhALWfqf6RO7wQZccJUIjxzJimQgMadteXb1Wma
         IRSkp2E5A2R6OO6eaMV9i3ihZidqR0zTyJx38cPB83M9zSAFrkFC48AKqdaB/IHIDI9Y
         V36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785408409; x=1786013209;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nSX+ZACKEIx+v1ryGz1A6GcLZ1JO93xC+CPtHZGOTfE=;
        b=HHMddH5DQncaukb/Jv2Tl/HNzUPA66tqMNsjAmuKBnCdBxfxkqAa/W/gvgQvPAQ3FH
         dMWXF3NSZHMuFKn02o3P6+OERcrPqXN5jVG7lI3MGxWFtrNecruL8yIF/KiK/ya1iL+t
         vHaxIFDlNhfWBdrMiF8HFLesp+XZXlq8hrOPF+0Qhg86Xhkq60U+fUw9RQoyqzhdIcfC
         wAW/Z6Ftk7PmSGj38C62miWEBaq2KtrO+QvV/LQxE3TuehehvskUSz9T6RTF5DlILcvL
         SWOSIKqLBu4a3KwC9dKFc3KUBi64kZs7wmsiyIxtbpHZF48alRSOPeUl793uI/pMh85b
         wzNw==
X-Forwarded-Encrypted: i=1; AHgh+Rq/J3xaeuZFP7xr2yFX3MZ89wDcS09B3YA1v6F1r4U8sugOhclasgYPP7DYTEU3KedPxthXAvg6AeCz@vger.kernel.org
X-Gm-Message-State: AOJu0YxIbAJ0OJF0XY91xwORqnFm1yK0uRyFYFvjrQnfVP/3drRd2ARF
	AdzYLDyOGdNYfnfPeNPVdC55hxwc6kZ78bISBpulR2nNIicsgv5lZPNPzJyO+7sf0TGAK02oK41
	rO/9sLUqVmRYCiv7kswuFumA4s0tmycm7D5AB8/j+JP3BL2MSgWEHe7dxywRnsvsH
X-Gm-Gg: AR+sD13gRASEIF1OxIvvZox09hsKnsANOxH16iOqcur1npDZl4rt8JIoH19putD1wbd
	IWJ5mDOl/NuZcj1svnnO+cGKF/w4ibXTe7wEdjgQZd1yrMhHlJf+Dig5NpCniaKOOVW3hN5n9/n
	eYqifBK/7W8f77kCBFdv/UnkZLib6ICHuS/gWPSF9AonYA3V4LzmAqnTWwmjGYOx1aSiaIToV5h
	tia0eAZUVe/pMRttq0yhjH5FvT5EHLQ6aHshJJchdpsGQy6Fku9/ttxt0ZJ5aIeDJ8Pp5CSJp6O
	H5/gSR9rGMBiekz03iJHdIJ8wwv2PsYoZ1jVhhXjVpKP6A8Dh/tQK8ggF0R9tp893/qTctRzFI9
	2xNNO6BUxL3BRFk5Av8n6ppg7qpD/D+LdLhZ3cy8jaFh5R77FK5dPWeB8lp5wppi5cVSPSD9Sfg
	Z5V9Qg+/IJbUICr03162wd03xGOTo=
X-Received: by 2002:a17:903:238a:b0:2ca:feb:303b with SMTP id d9443c01a7336-2d035cb542fmr22568855ad.25.1785408408813;
        Thu, 30 Jul 2026 03:46:48 -0700 (PDT)
X-Received: by 2002:a17:903:238a:b0:2ca:feb:303b with SMTP id d9443c01a7336-2d035cb542fmr22568475ad.25.1785408408304;
        Thu, 30 Jul 2026 03:46:48 -0700 (PDT)
Received: from [10.149.81.110] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a1531dsm24892435ad.13.2026.07.30.03.46.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 03:46:47 -0700 (PDT)
Message-ID: <f2f877e4-8bc5-41de-b988-a8b2fedf5c99@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 16:16:42 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Fix PDC IRQ mapping
To: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260729-topic-glymur_pdc-v1-1-8747789e35aa@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20260729-topic-glymur_pdc-v1-1-8747789e35aa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA4MCBTYWx0ZWRfX9uEor+cggwhA
 T1WX80CjcAgcZJyEZbxUYuDdP/JEOoS6WOPqqNMMkADbXmsl2xds4WNVOycekkTDp4dufjIrcL6
 MSQGyshBcx8PH6xcuYXIRz7ImSZj1Ow=
X-Proofpoint-GUID: oqhh1Uv5xBSv5SA4NNzYTWmjDdrUaW_v
X-Authority-Analysis: v=2.4 cv=Do9mPm/+ c=1 sm=1 tr=0 ts=6a6b2b99 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=bFcAZ-Q01SOJ_WAJ4kQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: oqhh1Uv5xBSv5SA4NNzYTWmjDdrUaW_v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA4MCBTYWx0ZWRfXyRi5TA64jMlZ
 cD0B+LzFRq5GLZ/yTxzayZop0Jd7qYzwyHSbCJUWm5tbQe7+yEaGa8Kks8qfoepKlG+4iu8Qujn
 4sTLay6NZIB1bfBMCwPHYdpxUVjYcc06DwBAHycc2sYjyskMUZwUAMO0neyRnzpT4PDj2DjYksP
 cusafIeWcY/uCEMevxol2VeXTG4hGSjdo2owyFYP4ecdcTCPyvpWqIiRIDGect1rVLC9CUB8Uai
 VcQBSLviye14IyZzPZnkBLoEu2p19HPzEHQ7dGafU2yaaxQmAkZUQOcaRO0aOzkpKRt2Msj6wYU
 YZs2FMUuNc9NmPBYSCDIQlrjvPWFFgYcWzb0uO7zblM62OU+yX/g9JS948avBuie7Pfhn+rE6iJ
 xhs7DQTugPtil6QrEbmv8N6UIqwsm51M911yluHxrGFgiVA9cNg4o1iecof2aa5XDtS1gq6wCjK
 fjdxWmWfEv1iBOQznig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300080



On 7/29/2026 7:38 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Some of the sub-ranges are inconsistent with HW docs. Fix them.
> They are valid for both Glymur and Mahua.
> 
> Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
