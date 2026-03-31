Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E7144BC94
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 18:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774980105; cv=none; b=bQdb1inldX46gHEUCNr/Z31xwxuHPpYNNassLh11L1SuFWCBGdTjDJMPTR4aY0C5uUHALCh2FKbL+Q22mFh8q1ajlg5Mtxwq2/E0K/rsk8Wqaxp7Sx1VK5qAWBFKr3SCxf/XNXUz9ujPPGJKw5Gu73kQhNTu4wOapS8ztsmxJOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774980105; c=relaxed/simple;
	bh=gKMKtEDMLOdhHXc4oHFpAxXH5SpuDkeTy/QWnFLjC3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lf6CXSBnF0MiA3zGX9AC7Vfccdl8F/sbN/HsNI+73MIwVvlQoL+2AxQE7PC4QoBFa77LbhHQ7D4eeJU65GtyhKmCBWB2hewarLake2dgsQuYjIdxCtXa9IEYcSxKvbrj46MEvdN+LM0znKy28TiBp12mW8foqCvqI4VQL+08lPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d1ytJ6ER; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jiIKh5Nz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d1ytJ6ER";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jiIKh5Nz"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VGdMkf1831968
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 18:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0Kg745/1Ujz367/buEG7LsN9
	XQefJdYXPIpCEhaVjmU=; b=d1ytJ6ER7UvX1i9Xzwy/6IVC5zXheG8q9i6yon+g
	9cbIRRKAHlui0ss/KjcUCzyjuRmx7NFmHxIWox5WDfhi0g9xttZD0sm41aKaOP3f
	e7fTgQjvKWvW6gggvFAjZDffvNfw8eVhnX/JyZ2RuASSwBVbr7bXu1VJ9L/UW0gD
	8wS86wHdQlq1NunYmeqLJhYQIQm8K/TW9/WMCbsj6GBK4eRhsX3+8oLiewzrY1qc
	XME0/BlvmJp9Q/+1kaqDb54vr6vJPHqNcK/k6/TJjthWL/u0/dql7Z90TQZXYQhh
	qsrvHYgbvDEOfqNW2PhbOuSdl5xjg4giwWQyRKLpiU9i1g==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8equ9ky6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 18:01:41 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-953cd6f6ebaso772723241.1
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 11:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774980100; x=1775584900; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Kg745/1Ujz367/buEG7LsN9XQefJdYXPIpCEhaVjmU=;
        b=jiIKh5Nz4Umwdu7Soyaf3NlmdYo+xkcnMHUiMhpC0gZkrgtyBr9KCaS6YyWe1PuKcA
         I8E1EYCgoR6ATkbd2LcG+aCZo0I0EYoiWBFt2VA2OsGVsY1zyp0iD7b4nWpAo/SJDeK3
         X0SQTikULRw9EWZ/w7a3lEXWdVBhiW27dGnxZeNolL02kX8z1XjR8YrjlfYtKpZ6G4e0
         5A6QtSyM+NobrxMjhHNOsdzMylmp/7OIRV8myjf90ghPI12voZk2getXlpYxxRvqZ1PU
         iH/NaxNOEse3wPSisQC+U7lWdTDFDw4rX4GmDWpM/C9OdhXNpcYQlEWvQNNLplS3tq4H
         9/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774980100; x=1775584900;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Kg745/1Ujz367/buEG7LsN9XQefJdYXPIpCEhaVjmU=;
        b=aERwK1SiMsJukt0kI8ZrnsSeiNWbCpyXnLhDUfa94aT/GHDw8cR5br8RKSOH8HWdtD
         mo+Gi7gQ133fN+ISmBnWpVSYWZOOHtYoYklQ3KKC7kX2aKfpD2n3xOcr+/36Zt8mB89+
         CxuBBvtlJA7n+Nhn757fuEFBD32GQ6vfLPn3hRAS4wGIoeSsBB1ObrbDADK3Qah4r1Cs
         a+bycM4nxGO3r2uHssehqR6SEGQMIxkf7K10+RcXDsdN1cv2PyAA5fIZXS7DYy8yWufG
         cU7xuHkvLWc/mI/DUD0ZUz/XIuzSBQZJt71XDxIQmpBeBXd9HbLKvaPPdeoZov+TLJR6
         Ghwg==
X-Forwarded-Encrypted: i=1; AJvYcCXz7xXy34O3NFaWS1PRT/kGWuedjA1p/iHQ10kItpq/iue+E6ENcalf3v80ThXwwepT88hI2cweqvds@vger.kernel.org
X-Gm-Message-State: AOJu0YxLXJ8j2McAJQE/wkzESsnnXO886/yo+/jVWCJngdgkEMFWI5/M
	rYx/w8d1ecEFJarhylXRUqdEHxYqhZ0VepHaVGMqyDTNfAj7JVWrR3Kkx16hvnLTdeqMPc6Wkt4
	2ASR2SjLUkVOVe2XipzJMQVcN1xOAkquoxx2r47hgeqkYObCgzMbreRDPyaPLQKrm
X-Gm-Gg: ATEYQzxVQgLGUNwLatKKEsKhKycnUg6qG49m2Ov+XxLZR7A0PELNupayEeMfJEFGwaD
	EQ0cZz3LYcUV/jbMAtVf10w/SPt8eE0qTDXvH+2Zn1seQV4U0cfpNP6kLGZotLNXz/+sTkppa5H
	dhI4cyinqp4l8tOq02SraR3JF4CtV+ZVLJ5idxJjD7NatBSEEZOosfSM3Tt2iTHfHOl6s8rK5pr
	D+vzS6VYgy0o6oaxQRj4X2cQ/MMpUfYDccf0YTXfXrInaCM+Sxdb07usqA2x0S4LfBvDsB9Hx4e
	QZmlgs6IKYniNDRMDL1bKSRKM39D7fwIA4Brq9yMMn6CqfmPo3vq81KQzLx3T1PsrKRx6eyxsyG
	eOS0EvFOz/Akzno9xYFNhl/rUNb1l0NtLh5ZKRBvB7dLysnHIpNJYms8sBogM8noBcdx5eUvBXi
	gHKrLkxd44TndaC9WzdhTrKevWL3lirIu+q+8=
X-Received: by 2002:a05:6122:4d85:b0:56c:d757:a045 with SMTP id 71dfb90a1353d-56d8a8e7b14mr285107e0c.9.1774980100571;
        Tue, 31 Mar 2026 11:01:40 -0700 (PDT)
X-Received: by 2002:a05:6122:4d85:b0:56c:d757:a045 with SMTP id 71dfb90a1353d-56d8a8e7b14mr285038e0c.9.1774980100072;
        Tue, 31 Mar 2026 11:01:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c2233101sm52532e87.49.2026.03.31.11.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 11:01:38 -0700 (PDT)
Date: Tue, 31 Mar 2026 21:01:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH RFC 1/2] arm64: dts: qcom: eliza: Add display (MDSS) with
 Display CC
Message-ID: <24trlgjbu5vyd25afdtaxmih6cjara5yxzg2ya22lkk6w6bmhy@njfigpznndr5>
References: <20260331-dts-qcom-eliza-display-v1-0-856f0b66b282@oss.qualcomm.com>
 <20260331-dts-qcom-eliza-display-v1-1-856f0b66b282@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331-dts-qcom-eliza-display-v1-1-856f0b66b282@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE3MyBTYWx0ZWRfX+/U7gomRisqv
 lDpLDNowOHTBD7RSr57m3QdzMCPtWWfG72v2jRDFMTq8pOtNt1gcEKf+gGSTqKQoVjSU4mOi5np
 /0Fs7065KhtfqCdZ0uLXJ/asiMYlLJB3XwFIQQGpIqjEOss3bO67rtMrNF2S9Myq5Fr2Vx4b4y/
 GB1RJ/pHYDSfCXSGKNefu91LSHBOT9jok33jD54GWvYdNS8xgK6xuv2V8wjy6N7wJUTrQFj2wCd
 be+DnBSqVoKXRHunSWGMdpepUbyi9V/NzkMzbo7ZEJ0ghHboumoQAeYFRWZa50FZgfv9R6Qp7qg
 4SyhACiybA6EDzMJFIAGHzCBB6BpxrktHhbR8SR8GWfTYdId/i0fUwL8APr4OBZrPq9BrNxOlyM
 4dr7ZnkcL2h8amfR8wRAI+98UCnCAksJ2dqfmJtKwdzu5saFxTyr6eGZHQNvfLpeKv0AAuQP42a
 4Jrckp9m0y81aHBqyTA==
X-Proofpoint-GUID: SDQtd6l_bgkxKbHju0u1jcSQVl-YJPu5
X-Proofpoint-ORIG-GUID: SDQtd6l_bgkxKbHju0u1jcSQVl-YJPu5
X-Authority-Analysis: v=2.4 cv=YMOSCBGx c=1 sm=1 tr=0 ts=69cc0c05 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=jGNyBtTtLFTNQ0AnaLkA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310173

On Tue, Mar 31, 2026 at 04:02:49PM +0200, Krzysztof Kozlowski wrote:
> Add device nodes for almost entire display: MDSS, DPU, DSI, DSI PHYs,
> DisplayPort and Display Clock Controller.
> 
> Missing pieces are HDMI PHY and HDMI controller.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
