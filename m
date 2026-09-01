Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A2447F2ED
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 13:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788269034; cv=none; b=bNLgHiR64Jb99fXTiCDJZNeH8HJv2D7XQiHC/r2aPBjYbKc/MVDahMaQeXyLqS7K1C4FTDBbYt42/sWPkHTIaHWnojlUWJBKllzt5VZsHdPbg7zU4VVOFaLqA6jgMxK1sKMMwih/m9AQRCWUH2kHyDMXrPMzZNdyFfGsuY8SklY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788269034; c=relaxed/simple;
	bh=sPLjFmC8Z47JUFnL7nOnU3MnvdoOiJICOFcD98EBaOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K2Jl/xlIw7UHDddIOANsoKl9Xmf+2bMwx4TAkxBtcHZHzJSuz1kHOtuztN1gZH0htoBhdUXaL4qJvWYpvHMSK1FI659wPd16Mfz+lcR8MDv3d28awm5c1seLsd6FQbqDcGTnBYeNrswjHg736OmJGiVRnJdED6k6QdLg+Z9A85Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pwbujzHo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W2LJnQe1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pwbujzHo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W2LJnQe1"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJdW61767329
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 13:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jthUaD5iRZHV9aBRZjn0IKRLvA9r9dfDxMnS52XP7eE=; b=pwbujzHo38NpZi+u
	CgVm7RlOuN7Be2fu/SOtvOkNkhJgx4/Z4yRCLHUPMOWvsdzd22dufX7J9oQbXR0Y
	Et09LjfdF3+JO1rBXFwEhV0nn6e7pfvx2gDneCM7T725KwgYRL76OeuoT1fRZhtC
	gq9NrzknbjMGfQoLiPhw7WgkCRaA7Z8DMUs7YokxKEEyPeiC9vP6tTWme8mnt4NK
	YMxMEkedst5OiJvMWHyBjnuNQd/vJ57xMQdzdTilGU/l1Nxlxxu35UmGNQ6i5nX+
	o0bM+TorUwAGnSdjQhDns04jZaK4y7zOEPnihkkZAjvTlguhcVVUFFNT8s7Zb8sW
	moWCDw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdjtx3djw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 13:23:52 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c673f01b76so132872e0c.2
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 06:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788269031; x=1788873831; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jthUaD5iRZHV9aBRZjn0IKRLvA9r9dfDxMnS52XP7eE=;
        b=W2LJnQe1EAoyzh3gxgSVGw6x0vg+0QGzdohjVDdEJA2TmSF1EdIgIZb3LrkJGmlZDg
         OPHhAo7z1qH3+FIsNIdmxHKMlawyPmxCwHAvGFB5MdIq3NQjjzOFnGpJnmg9mldGwN8y
         0cnLL2a9bCz9qBsV8oIZ9lXiNteaf3uUX3z/y3MGOWFJuToNUxLu7fIbgMVrNoWMGyxR
         9X3SaEYQCxc5DAw3QljLXtii/SDT/Y7ouEPvlpPGtRtEWP4BkZbko5WVIBf6b4khSueH
         51upNDguil/PFC71/7hMHSa1yoidP7YAMH1KemfwQR3GQgV+i847Rf/rF6rEiw21Biqr
         sa7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788269031; x=1788873831;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jthUaD5iRZHV9aBRZjn0IKRLvA9r9dfDxMnS52XP7eE=;
        b=F2UPfWXHewLs/IO17Aw/U4SllrDKFoxE8fkZMwfsJCIznZWY9NA2ethF6/d0XPc5lf
         yAxLAMddPFDQMkp5doCxdK7cd4ToDNT6VQl/thbuWPCIQZJ84DYEfyYU39FL7hREp3PD
         UxIj1TsgMiwchzxFVz3FStCziYdGDd84WicM2dCV2Gcl4sTHITCQw8+RkM2SzxM95QE3
         gAX4pAHEuDZJudfluJwaTvRPFbwpkXmsQe4zeJ/q/r3W7VVAE9yobBUcbE8Q6kuXcXJP
         D/qmjsG/nyjDD8CjplGP2gg5wvQWYx4KpjHHc/cggMG1GdogzJl9u6Bugt7blYAEplxg
         8GuA==
X-Forwarded-Encrypted: i=1; AHgh+Ros5UP4iyZWaAW34goNb6Zh+kTqxoOUn32NZLp2CgZTPyRH8G9M7jCrWlTZH4xM+E1RF9WcpcprGmEM@vger.kernel.org
X-Gm-Message-State: AFuF++lNMQPfXQdhNs2XDYqPNXmBbsdXwWgLvR2FvP2WGOfn3ycLed7N
	Rcf19qhjoKDPh8wPd4nHXsVySZFuffKkDyAhZBa2zUofVY45DzDsjZthW0ua3y4pYkeX8XLV2eM
	LsyOGiVpxssWTy1qzRuJ7boIoSzsqvJk4GnF6qvcT1PwICYd2fAGRdd1amUCPwqCJ
X-Gm-Gg: AR+sD11OxpKcimWROu3Sc04Ykrsj0fejcIJkapVsCP0v06ItBOwhzrn1qLt4Dz56jaF
	aX5ONH8qwAXZXZ0Tu2PwQb3H+F2DtwOREBHRklbDJSz2hsnf9Ppw3VGgJ2F0t205YD1/4Bik5NR
	tcj9ZVlzriPfIJCxP75INKAkAMCJQon9uqRlq5Epy5BJyjJt7rqUBeMZUeGabJ9VDUlXW70F7Sa
	92rEiVelbXk4kDKv3PVAVpyR8RhC9Yz9BlxlzJZvbnqzM6KcQdPSt8eUv1aad/Yp5aUkQNs0vUM
	RVe3XQGnDAFNWs4ohaVCFZV3nGidgExbmCvDpseYM84v2fm1yoU7b3q2H9HaeYRlROQFv3pteBx
	ALo/miD6dG+vuZm1DqEkD/g==
X-Received: by 2002:a05:6102:508c:b0:789:3ef2:1da1 with SMTP id ada2fe7eead31-7893f0161a4mr2830658137.1.1788269031101;
        Tue, 01 Sep 2026 06:23:51 -0700 (PDT)
X-Received: by 2002:a05:6102:508c:b0:789:3ef2:1da1 with SMTP id ada2fe7eead31-7893f0161a4mr2830640137.1.1788269030644;
        Tue, 01 Sep 2026 06:23:50 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e89ce877sm2884326e87.20.2026.09.01.06.23.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 06:23:49 -0700 (PDT)
Message-ID: <28b27377-4fa9-4aa9-9f3b-d7dfecdc21c9@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 15:23:46 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/12] arm64: dts: qcom: ipq5018: Add Super-Speed
 UNIPHY to USB node
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <praveenkumar.i@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
 <20260825-ipq5018-usb3-v3-11-39be0955a6aa@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825-ipq5018-usb3-v3-11-39be0955a6aa@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=K78S2SWI c=1 sm=1 tr=0 ts=6a96d1e8 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfX2FwafAxwS4+G
 pFbt2zmmKemhUQ9FX+aT5Rz9l5BSJj8d6TLtQk+0Mk4pf3fFwLZTNGJkyT/RtUUuqWfoT8UXupJ
 7T9OtwvCKqDoFr9NN3ovxE4cH3MMLTg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfXxJItPJop3REu
 B+r8weOvBkd8zThmdQYKF0H6ZMLBL+W3zEEP5X2plXs+V6YZhEKsLwFaxFQbfXlUaUUIXhXnZnO
 LytYwF9f/eUU/oHRS40UkpocW0m3Ij2mHbCI8UuW0SWxv0oh0nBZvP4CsrFMrL81s55gNkFjft7
 cghEnHqP70A7ClKJPBWEAYrvM3+JWFSRWjqwOXk+MSbZrB6Vm2fSTq9s98VMpKNTMI3R4NgW5R6
 PmDSCkE9V7PlsZu+uHE2dblqVqpDwYmBJ1eLzJSxLrHRqS13PWXaRaaaY3I1LHg0jR9KcSxAaCS
 ySsAZz7xMAo/pxKLhO8YVNFo4ffrmMLgfUDi44UqqPve2n1OnAh2qtlvOp3U1dkhpvIa8o4fMZ4
 GxK8E0x97paThFRjzIrQn0EHvBLu5eTbuZA92DEBGc93SMSIdLbpQ0NV/DfPLfv59AXlhU3ol1h
 CVznoSNa6HxasxOT3Gw==
X-Proofpoint-GUID: JxfjZXOoBjP1BUmnE9ZKuddyuCGIOfTV
X-Proofpoint-ORIG-GUID: JxfjZXOoBjP1BUmnE9ZKuddyuCGIOfTV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010117

On 8/25/26 2:37 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add the USB3 UNIPHY to the USB controller node for USB3 support.
> In addition, switch to the pipe clock supplied by the USB3 UNIPHY
> instead of the UTMI clock.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
