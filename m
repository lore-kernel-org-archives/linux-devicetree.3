Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45241EF39E
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939543; cv=none; b=FjcW8NGDoWQ5vZd9Kn91SkOeb0nf/yyreaia1DUAICVn6tevj+Ijipu7i3aMGq5JQTd2/xgeoVSKbqoP6q4fkM82YKKOmh/pDUhaigCcyBmdCe0qYc99gXrtTDif9kklDS4dnxJk6CubR6WT+zqXBLf93tSeiL3yxpftnZ6Pdwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939543; c=relaxed/simple;
	bh=B6CAr3kqwiv7Vin0aJHCZqvOevu96eWIoRh+oQbeZks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TcvW/myCzIcn8WNi14BRq6Ya1lOtjEn7UMdepyc5tpDN57goUU8xuo4tbRqC23i6pIbAu+hkZieYWX1yWQDh3fkhAmBSZ11+bMfG3FKyUb1Z9C55+IQSFJM2Yhs5pucBbobTQif/HguGOPiKYBn6Xxo6P7vX9G/SPuKpAO9Bbb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HpV3OLRV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EKDq+Lmd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HpV3OLRV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EKDq+Lmd"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D994YQ793548
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:45:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LAo2B55+i0G+fZI2Hzc/8SyDCblIT6yT67FGpn4lZ+g=; b=HpV3OLRVikEMzm+L
	UK1KHoxsY71TapmYY18HEoY1RFvp5Z5t/knOcbgByrTEBTlTMbZwoAcv4ySlSbAp
	I2bmQKBLH9j47QKWtz3RQfmAUqeGZJI6VMvxN6LTOaraM6xe/Wk8qAHRBTrZDDr3
	yDJQr6byuNsHsdHnZCyQ93MiaxoTSMGvDYGfEv+9MF1MP64WtC2yld5Dw6qllOGV
	Z9TpBhOHbPpuVDzHhHVLs0EL6jfuo9Rune604NPGr4JuUtVgN/yc6JWQuKcu0sCj
	HLRskT6g5/bdGeET/o5TB3thmAmYUytN1f4p89p1+7OLUo2GoMhUxG5EZLpUGs4X
	AVIFAQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcw4qratd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:45:41 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-901fdbfc3abso18229306d6.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 03:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783939540; x=1784544340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LAo2B55+i0G+fZI2Hzc/8SyDCblIT6yT67FGpn4lZ+g=;
        b=EKDq+LmdhCGKCe0XmMD6dmDpGWtHQ2mNVi6F9CQ8XJaVl7XwGy2GN1zUvkl1GBTjTf
         PexBbekBfo/g994VKPbeO8VCEF6QdwB/J9bGHsMX54JY0nc7yz+Bwtnb1VJINRg19PE7
         claN2vGUmDa4i4qA8dlSucT4a9niRJPv62icJwjwKIG5ViGfZ5MateGNF067h5gwdAde
         HgsC/3cl7KX7LV31jY4+bFkuSGC06vuySsu5Qx+J7ur8DpzJFcSnomTSJ05s/MYChNGp
         lY1KHIehi1iF/HjqQgsvdXorp5LxdfLZOdc5dfPtxG2PaVw2WGqYSLW94WTbg02jvNxT
         m4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783939540; x=1784544340;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LAo2B55+i0G+fZI2Hzc/8SyDCblIT6yT67FGpn4lZ+g=;
        b=Y14nQEVdVZCrMUNNOU3Y4e8ZxwVGmm3itkBaQaEWn22E3llQMjxGsxNJyxgHZwYa5u
         DO/aUkFENwxz2Gb/E6t0QMo2jppE4Lf6qAwsLqUnjh1CUxBy5yPGHWBlIx/sxVyghIae
         T/2sKo7BA7y96oTTI404LDpf5YcB0ghggdzt1X2iFZhylbi8iEkm2lcD4BqIbZyN2nVT
         vhqQ6HxF9FRuhrz49NIBJjfHjQDN2ny60S30JovRwiCrZHdNSwjgs0UukkMdLa+YS5zt
         qTOEaIK/10HAWrFhQyOj0ltElnMkvDzLuUoOKQBg/OcwTFXLS65Ykf/N/HsbNDifqCfW
         eEJg==
X-Forwarded-Encrypted: i=1; AHgh+RrhcWy/eYioYuY3DIMEPy+uldXZ8pgv414hrjbP5gQjs94ML5mF8Zpf5+6l+B9wWYQQZXoMBywAgzpC@vger.kernel.org
X-Gm-Message-State: AOJu0YyXNbWp/UeohF8LpkDFwe/XYxqNQ+9zG+YxrBVt19xOoiH+WHxS
	JGNoTRByLQrEywwNIkXAHXN4vVBmIFqFjFipIQAHpMI0u0aPOWCA9BRGGuns77W2iH9yQ+p3BQf
	vj75UwMriXvobT/T88pujLWy/w0O0MXQAP5oJONt/+GI3/TUB30Xh0Qq1Zde6hP0q
X-Gm-Gg: AfdE7cnpRf5MFNu1fPxOFzSLVGgPwg4GqvFTaS/tht5bfEsGsgZGlYe6c225UXz5NGR
	nODib2CQO7QT4peXuV6d/ISY67lnXGoi32BldWEDuN2IKeWMq/c0a669UzQS6F0r5R+TXDzAyVw
	SyO2zEmCwkwyL1McYJ3lwfzCCJwyScwNwsJrU0H9aNfKJg/gSdodrtqKImFUTCphteWuDd3RCg7
	9P0KIg9BeP+d+gNhmuJL9n2Uuy6IIjE+TXsPTl82lStD30tQ0+F92tG4ayoBU8zVDLd3BY7kpI4
	hh1ro4Hbj32sNp3M5ZgV0srwSCaq+wHa56WTIBpwLSH7t2PTkJo+6Y5lt+bcNxtKH1pm5FMOLML
	TuUsYun+P19Xncl/hKS8DQVa22r7Ua22xDNY=
X-Received: by 2002:a05:6214:448e:b0:8ea:6c75:7381 with SMTP id 6a1803df08f44-9040018799fmr75217106d6.1.1783939540294;
        Mon, 13 Jul 2026 03:45:40 -0700 (PDT)
X-Received: by 2002:a05:6214:448e:b0:8ea:6c75:7381 with SMTP id 6a1803df08f44-9040018799fmr75216966d6.1.1783939539931;
        Mon, 13 Jul 2026 03:45:39 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19cd88aesm14502495a12.3.2026.07.13.03.45.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 03:45:38 -0700 (PDT)
Message-ID: <ee232d67-de45-4b99-9076-a04ed5842489@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:45:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sm8450: Remove unneeded reserved
 memory nodes
To: esteuwu@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260711-sm8450-qol-dts-v2-0-5eb2e86468c5@proton.me>
 <20260711-sm8450-qol-dts-v2-1-5eb2e86468c5@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260711-sm8450-qol-dts-v2-1-5eb2e86468c5@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExMSBTYWx0ZWRfX1WBq9DHlvnos
 CS7aRsa1nhwmwnd1sC2cikpxTkMWS/iHFHgKCbeZ89RD2lvX8iY/Osjz1fLxWIfddl3StJwQEEP
 OxTMjJUI7Sr6szzmEkjXQOzn9XEORuOJysuRxuYoM7ZRlCn6+qFsS1vWPFHmiwDvATVPiGqbiK5
 ptaZhj1r13kCdvQnOcjBJglxv+5gHN16Obt/V9MlaIQcMHI3KGzmgbRag+6dHnBfthAUI6UADJ6
 PGD3UKaAYqnLa+a2WbE+MjTLdP5mPiZncS9NrqT6+W54oSU3pJ392VuSlNPDfoZ+OHMaoteEBN+
 R6dVFqKLNaoUQsjCHcTw6wzRncrWjkP/s7xC07Qc6Sx/drwgXcxOFpWRjCIfPpbi2TVVH3WwO1b
 Uuof0NfRqudEaGLvLnNw95oeQmxP/q1BRTTnEr39GzqgZ1QGhse8l88bZdQsHZC5O6IATme5I9D
 OekrRrZz7FYnjBGU8MQ==
X-Authority-Analysis: v=2.4 cv=HJrz0Itv c=1 sm=1 tr=0 ts=6a54c1d5 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=WSKRrXozI-YAt06nlCsA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: Hjh7XVsBD2ehZFUsKT6p10d4T8QTvjV0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExMSBTYWx0ZWRfX+HbM2Gy9v2A8
 iuyv/+R5zinweEb6HgNnZiFD4TJz+joJEqHR0RUBBmfEHiHjiTB0RS65soWT72LkFDd5C5CoDJD
 QTzMmqjahtywWD7Ik9RTcyvgHSPnulI=
X-Proofpoint-ORIG-GUID: Hjh7XVsBD2ehZFUsKT6p10d4T8QTvjV0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130111

On 7/12/26 5:12 AM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> These nodes are not present on downstream device trees and only take memory
> away from the AP.
> No crashes occur without these nodes, so remove them.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
