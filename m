Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114761;
	b=rF0WwqguSKoBeuD98EMu5td36VGWMt51BY76Tej97oNjH0Z/TdP3FC91QU53+N0VZzio
	 Uno35TGIOwgQf4Wydi4JT23+77y/z38hXobNBaHlSYsGi58zSnRwWvAyAS3kCNaEtbwH5
	 EmFlh6lXhq7fLTsF49PvJAwAP7sLg7vgPmYLavW1xn1ruoOns0ApcUOS8fBoyY412o6fq
	 qr1EBsRzEAs+Bf0qvF7Vbu39UqxwHarjj70kdvJMGSwGuQ2r89uPEqa5T58sz+mABNd4F
	 P9jzTmEqX15mKmgCIofdqQNMrLqh+MSxciTxAqXQ3Ul87FAgzrvDM/EJnivx5QFr9QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114761;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3rkZRJrRIMFJtHN7Q3UeT/+V0Hg/1Tzp+aXrMpL9biQ=;
	b=Gyq+29Pi/wNOauLDEt26/DLFBlDuyUB1pfmM6N6oQLelGOYliZQGrOh8XpzV9MUYOaCv
	 7iwfLrEmyNaMqGoHU8+qsyWG8Omy5w0thq+NYXPB4bmhPVkPU/w8pAvCa0CPvqt4426Uk
	 nB9vZfYA3dRSfWJ2dedDKiygLrgNYFdR6GiMOf4HN1UB7VfQaP8DS72sOPqfEzUuQ6LzK
	 83xdRXS0C4WGFdkgJVk4U50O+yrMTZj7cpYCaxP2HGfgsS0T2FdvzBm4ScivW4qiUtCSZ
	 olNMy2/T9ydUTBPLBAlC4njJwLTCyzEZQ0rZUjp3vxZwfyedo/MUC66HxmNmQN3OHAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IAaIK2LQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fkp4aW73;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60804606A31B
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 15:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60804606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IAaIK2LQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fkp4aW73
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFL0o62054892
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 15:26:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3rkZRJrRIMFJtHN7Q3UeT/+V
	0Hg/1Tzp+aXrMpL9biQ=; b=IAaIK2LQuupkR0d59j2dTJm+872fnmF8tN5tK2Xr
	BfG2WDrLVt7h1AjTVsw1xQVvprY9JX1RxBF3ElYN468tPBgRK6zcxYQtFj5lgMl8
	3dUrOhOiTkDdlkQpmwQh/b5iS0cxC04dBp+MBy58ne3n4e3P6IowIa0KYdh6A8oc
	d7zvM3+ZDM7ogysqSNgiTc3CLjQ2gat742hsLgCBVZHzZnFJmcgcCiZvTX8BbRg/
	WEj1P+vtl/uUWzjxmSK15CujJS0IOXjMkmxdT8C2zHmyTrCv++PfL9nM2jXFoguG
	fdvbAekl7osBdnbF5Y/0x5OvwUVCpV97D+1zIBxMN4puXw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmmcbwe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 15:26:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb71b1443so947847285a.2
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793114759; x=1793719559; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3rkZRJrRIMFJtHN7Q3UeT/+V0Hg/1Tzp+aXrMpL9biQ=;
        b=Fkp4aW73Ic93TMynKTPrKZOWzU7Ez5GK/sQazFdXjao7jUGQR40JtbfiyZKrrh2Q1u
         rlnTVyIb8zHJFPCbOZguIaXGBaZKoY6Mhy3UuAzKC02LZAj73/fGIQnskVvPkcpQI4Ot
         hvi+hBK9QsPODoIBEwXK75rBjCpKvKPww69mJ0j+VgoDiToSYUEg5pybZgsmKg3+nT6E
         boWfP63Yf6Ow2GGnpI9k8fbkRxWU4UuElMDVK43M8XdoxUHbZndvZJvgw/fuiPyAxfqP
         1wj7JenIjl814XkGx+FS/RiPNDOq92R9/wZJphVOecoejXrtS2QMSQn6X4Sb3/XUPxKz
         /xVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114759; x=1793719559;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3rkZRJrRIMFJtHN7Q3UeT/+V0Hg/1Tzp+aXrMpL9biQ=;
        b=1JYEq1xtZjJm8QUopPMa9Tm9ISHCK6ulx3OFh6oQjO5rw+MKpzBdTNBQ3hERCppKNN
         xTfbGD8p9HI3AORQFBVvRH/wkDUTqSmuO9cDrjzta/QlIHR4BoDBdzB2BUJsgD9Hb66K
         1V51P+/x4kwYCd9/pFSWYmbRgwGUC6vLveOMrnP7yB7agDVxUFhoiovKjot3zD8fUsAM
         uWpa8HGZZJD9KTGKVPqrAsE82vvUrUbeRbhe0YpiCueqtmDCNSCw16263KLFjE/YXHYJ
         G+qJYnG5xkcu97G/HFyXctf1nZVg3ouITtlRBTtIZX/6XKhhWX+04jh8K22qBonS5wLq
         38Sw==
X-Forwarded-Encrypted: i=1; AKwUvByisbKJG+l0NGkMRPBgSUK3W4yGKvuw4pjqCMECeh7I/NvLSX8Nv8hGYfStefu+XTivSiUzeG+v1qT+@vger.kernel.org
X-Gm-Message-State: AFq9FYIM8LPKP1IUwOKLC/iEXUWch8EWE79sYVzoAF9lswHwKoWT7js1
	LWZ1MqZP/0VkU7gBdnTtN4AKNkSYfUBoczz4nzhofmVcnO/Uor+OwPo+2GFaSNmIUFvL7/w1CnF
	2LBZBd38yCe1QV8mT5oTkzs9BshwD4XgLJcPct/cPN5J3/G0Podg5bMd5RlRMg7Ji
X-Gm-Gg: AYBFou0AyEbCUpBxkqUF3hwZ4V31JMHCTKsenKhUbbykqTpFrBR0mffmlThkQinTdGw
	+TCiLJkv9w/0H/bwQ8M/Gij8180LFude7YFvXxzi7kMI54tyiQT8Q7vOWeLU78l/McPKkAB5JqC
	LRix8/041fxZas7KHqz7Axcgbz//UUdbHN99BsEpIM6DkJm8t1wLdWF9lFornDdtU1xkjHY0XuO
	P58ZFt/AEYA/+ABlm9El2RVdR/50vjt7+PTjM1K+UR31Q/zeqowQnCLki+NF1NJGIgShiNlB55d
	clYEW+tk4bbwLjci3gc8ESvTF2Zs5QynUZ0Pn8gxeEYjDKfZ/ZqNfazqQsHjK8wi/ZqlqCUJLzp
	LrGmV4VQBexhO+Rth
X-Received: by 2002:a05:620a:29c8:b0:93a:17c8:a1e7 with SMTP id af79cd13be357-940ef8f0f5bmr1573173185a.44.1793114759005;
        Tue, 27 Oct 2026 08:25:59 -0700 (PDT)
X-Received: by 2002:a05:620a:29c8:b0:93a:17c8:a1e7 with SMTP id af79cd13be357-940ef8f0f5bmr1573167785a.44.1793114758351;
        Tue, 27 Oct 2026 08:25:58 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2ed5a2sm288934095e9.15.2026.10.27.08.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:25:57 -0700 (PDT)
Date: Tue, 27 Oct 2026 17:25:56 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mani@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: glymur-crd: Move the PCIe slot
 supplies to the Port nodes
Message-ID: <w5wuuxf7pkjp3lvlmxh2mek7k427pod2ldirs4fwcsivigngtk@aorbeshgymwg>
References: <20261027122410.62219-1-manivannan.sadhasivam@oss.qualcomm.com>
 <20261027122410.62219-2-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027122410.62219-2-manivannan.sadhasivam@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2MSBTYWx0ZWRfX8MHAgs/kGvOc
 CohJND0BOsree0kammYeVEx/HhcbVX7RmjN2TF0I865xK3s06gH4BkzYC9midygJIfXM/hTINgc
 ac8aMKp7eHDEpMmiYmat2iHYEcK5DqI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MSBTYWx0ZWRfX5L4Os/y2qcRl
 sJyQC2D2gyi6Te/LF1fiqeLWZKrLwilaPCzZe5O2OaEGo/aaIRAN2FsEwc4oywYxdwuda2Lt01I
 9SwCA+giloG/iCJir0WZTW04KFAuWUjsXNOEZCjuFotefNiHopLOLaeynoEq1PrSSEkIvfVB9P+
 R8uzljTW9HnkDLaP2CA5IV6tDVbCeU2qgvlJ17w3kkw2XRgsUDAnCAq1GwSLHG8WIMmcISdkQVF
 y1vf5U5ihd5QOxgR8DMl+cH6Tl1LLld6TJDw4uoySIb8P6Ccxl6lANccTze4uFRZBETNqsIxgUd
 h7DWaVE7TKs4W8dOYw4K6WJsEZN0SnbH/gEMZKly53jTLCuuIteflmKNoiZhivpzJbIRITEDr5L
 t047APTWFk0AbO2b9v7+FfbBtvPnoB+jlc7umL4FwrJpT02pUJ61/OFtCTxGfqIFhiTJg5X+jL9
 TyVWsDiem5aqTmmF8tQ==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae0c288 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Ibfqn94CS5QR_ObWptoA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: S5K0l_Iy7DIP8rAtCCFGocW5ciePYaDE
X-Proofpoint-GUID: S5K0l_Iy7DIP8rAtCCFGocW5ciePYaDE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270061

On 26-10-27 13:24:10, Manivannan Sadhasivam wrote:
> Since all controller nodes have Root Port nodes, move the slot supplies to
> the port nodes where they should belong to.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
