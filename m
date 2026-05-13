Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006483EFD0C
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 11:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778670745; cv=none; b=NId272E8EXQqLor2ifSGGs1SgIFCTSLtzWbihS3wzXFeTQdTkagSs1gMJQykmEIWoPoekVHyZLxhNjXjM3o+wlSNs7azkslpqpW8oPlKGUs7ZZNQEcmXf7UZKgvyPd5vOVDj/j9Kk+tdwXmc+uIcdMot6CCHMKTrJ/e0G/JlLxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778670745; c=relaxed/simple;
	bh=tWK7xDoPvOhQLhzmBJZnkfCQqBNyAcRNK0i+J3SwepA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c6jD8Xc4lFgFQVK+okhsEC5+N0GVGMstB8vEiiSMPXTPBE/J3LPkDHl0vvJ+7fhIWzAbYSNmSbh2vXasjvI4OHwX7v4fIxYTTBGH29S5P3RtR4kAYg7bWfK9j6bQc4WP0qTJfvqKYw8/Ff7gn/LsWtjRlxBIFB4TBD9gb9FL2Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HTfh89gI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fy8D/IAO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HTfh89gI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fy8D/IAO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAVTer3430351
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 11:12:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xtBA0g8Neh+NI4xbEt8pys13cxLS7hLngFtKr+aHMN0=; b=HTfh89gInQ0Mxv7E
	NNGAvhIg1DaDVMOT9cq/gSob7kzi4NYQ8Dp4fSqH0mtDSMp6RG83K4OSHjmDLPiL
	z2vjQ8vG1va+zofOmGM2slDGbAtraGQVlX9sEJ9bzZpnKgm0bSI8TM6OTc2ByBIL
	WPqu9tPQcSV1gg0RQhg9WUr5FM7fmU753wrrkwU7YGchBhbYIZubJv/cN2gB5Zmq
	rTHEbntjA7vpoSlc6h7ZBm0I65E/mhF79ziY9CMikaS+w7AcjcK83d4CAmh5Xb3o
	U2bQfTTSIcIuaejRo3aOevb6OZq0BUdm2eZGabXXW674Lk2KylPtZVCOWv3iMNBf
	2kxW1Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4qmcg4ns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 11:12:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fba8d8c40so40899561cf.3
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 04:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778670742; x=1779275542; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xtBA0g8Neh+NI4xbEt8pys13cxLS7hLngFtKr+aHMN0=;
        b=Fy8D/IAOTBXWlgQT4Fei7TI2lioRYUrh3/8wUzfZMdf5ZvPfc+/PeSZQp31sBUVXU3
         P4+3Itdwpa6eUlNS0cPTJ4I0CRSrDpMv95P+OicYCM9PT1bGzh/IOztBzZjOKAJGNFa2
         T0eTYSuVQackxiDGaxtYbc3LHaNSaGaTt+bdf4n2aEIt/k6yavWE9lcRyZ5F0GJPLxCp
         piiu/p/JCBL7lY0B8p7EY1HRFdQWDj2Ppe4RoPsbh+XSccmNJK8LAsOSod7z0yiz3Tht
         Q55AFfEswiW951rlbuKFOs1w/w9XGA+c2CsFvV8cuC7cb2V6c7unM42PEvg8IWDgeDnx
         T9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778670742; x=1779275542;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xtBA0g8Neh+NI4xbEt8pys13cxLS7hLngFtKr+aHMN0=;
        b=N4fLQE+0Myx143aka8qn/H2Q6Z2JSnC/0MNSyM091t+pEo51YnUoxwONcCrAGdy4Dh
         l0xYsKC7oxhfyqEojb9/+eBYf0mBl9XbxCQuqJ1VtwItSJUUotmXOMHRfxKo8y6sIieW
         x//f8OTBBc/Zs3J29iAQYQy3QdkTL3MfD5YxZWJONOXTvcmbiiwnOE9EP7FTflDVB4Uy
         GZBpudk2QSkX3fhEQSUzK4BSltK3Rvom5Ef54wckCA3BA6mtAEcA12d31K4Olc55oFru
         oLyMIRuhpuA1eOYxkdBafoS7+4g083BSrODYoFbKAnrt9b6AOdPt0/zrp9ZAlUJ1OUaG
         twBA==
X-Forwarded-Encrypted: i=1; AFNElJ9oWzuYUoaQ5X0FDwR+jOn01vbDu04qF9i11BtkABR7Vtnl/ad3pWyoxNfhqCX/fVZpiOaBgZIvaDQ/@vger.kernel.org
X-Gm-Message-State: AOJu0YwvcyzMoN76KYh1k4vnLn0ul7026b7UUUob6Ajm1ejtuGubttK8
	y2avIb+efqU8pys5BOov/bxgD0QpWA39n5SekmAOyp8OgqrMOnYONyBFh9NgbpUMS2jzv4n1/ln
	hIVLU6dFcyAiijYjZQZkEGFtF5HG3EjSmo82/SskkBAy9hzUXtGMatFISehpzEy88
X-Gm-Gg: Acq92OH/8JtLIbPf0mxQPNVMfR16v5utDb4P1H/BzQv3j0NkpC6qvUJq2f+6owmoPtE
	4ZbSO5o8L637kgJQ3fvgs2N7NGWVDfKAMrIbX7iQbx0syJM7tf+2bkNFEKG371xyKP3VxGq+K96
	vcuN9aiGp2XuBNbEBcFZHbnXYlFe6q7NJ1JUZ6jcbb6lVsv8v0Pc0V4O59JsM3OrsK+F5cIe7XN
	aRR1gT3FUhsbWpL7q9MNKPIkUr2LJHff/TtoDYd3H6xugtplXYrzevjyX+i/S5GncgObOm/RNqO
	Q6RNf78emQI5tk0hkoYHKU3KXCKISIQcodQFosC5vz4v3Mj2XUOmVExndMAtAM3gMJxreD861/E
	973xTciH06juItnuKgBgzcuc52RW63xLGbTGybq5anJ0ManX/kyonDQZzP2WwWERHCvUw1R5H+u
	nPtSysKD2OgjZcQVAKFzPmTtaU053YHVVFv05m9wwkDzW+Nw==
X-Received: by 2002:ac8:5e51:0:b0:50d:7c44:e144 with SMTP id d75a77b69052e-5162f4405a2mr37648541cf.11.1778670742402;
        Wed, 13 May 2026 04:12:22 -0700 (PDT)
X-Received: by 2002:ac8:5e51:0:b0:50d:7c44:e144 with SMTP id d75a77b69052e-5162f4405a2mr37648121cf.11.1778670741861;
        Wed, 13 May 2026 04:12:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8e3d8b18asm1039853e87.75.2026.05.13.04.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 04:12:20 -0700 (PDT)
Date: Wed, 13 May 2026 14:12:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: qcom: hamoa-iot-evk: add MCP2518FD CAN on
 spi18
Message-ID: <tmltop6rezrqh2swke7v3cyqdq4vwh3rxeppdw53iks43ajqzq@cs7e62hjt3bm>
References: <20260513-hamoa-spi-can-devicetree-v1-1-554a671a3789@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260513-hamoa-spi-can-devicetree-v1-1-554a671a3789@oss.qualcomm.com>
X-Proofpoint-GUID: aRGqVx9Bnepd7Dh8WtJhkygrrzNnvg5h
X-Authority-Analysis: v=2.4 cv=Hu5G3UTS c=1 sm=1 tr=0 ts=6a045c97 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=nO9I6zzPj4eGOE0Wvx0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDExNyBTYWx0ZWRfX3kYmH/uWuui4
 Tm7A3bCIRMDSOR+seUwgurfME1jkYWehCplKQH/mAbXPhplJDuQftGicrv7HoM70xzXLSrkpgg+
 Ziic9RrMhNDRACVkFMUe64CEpuAXp0Fku4xz22ox1TFLWwdRUTku3oUTHbWWjHyPtNGGw8iGO3J
 IwvvjFF5AOIbJDygLjmvbW51KSIgcaMpu0DkzC029Ruw4x+qdfs5v5j5fGcdOw7hrq2H4xLRsM9
 uNwqPo33eNQ0jrWc7zk1/ucizst3LzpG0vTQGtU0kLg7Lfd3kjULedCEHx/iUBpDd2Zc03NeH3j
 gsTFq79fFn2Ttuz6raWjmb9FwDEUCZDYRBUNZPIJuoGDEiQng/MYgeLUPp3dW2G/eQEyRl0sGjQ
 Ees9ISdD23K5r9e8SNplGG4giyPE2+n4s+taVUHlKWIYeoBijH+t3N211VnpKxpTpKpNrdmG6GZ
 RmAwfuI1MnlNUkJb4Sg==
X-Proofpoint-ORIG-GUID: aRGqVx9Bnepd7Dh8WtJhkygrrzNnvg5h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130117

On Wed, May 13, 2026 at 04:25:04PM +0530, Viken Dadhaniya wrote:
> Enable the Microchip MCP2518FD CAN-FD controller on hamoa. The controller
> is connected via SPI18 and uses a 40 MHz oscillator.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
