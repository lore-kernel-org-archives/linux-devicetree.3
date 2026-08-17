Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C94F238166
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 01:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786930512; cv=none; b=pOY7HAOaVDP1SZgSyuPPnooK+P9pEqIYbBS3VNLDGLM0v56jNZwmr5CayPzTGGda0j0VNC31uCSkaKCh4cqk9IrH4MUxG3YP+bEXV5CmUNKOVWsLPKkOy54a+4LBGwaRYlGDkRaq2E9/QuoyRWKj5LOa11YUmGs1V9NneI3TcpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786930512; c=relaxed/simple;
	bh=ebkW9UfUH9F07rXyIwu31HzNjXAR+Y1CE6VkFciW4r4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fpe66qgGYsxQJgberRj4Lqr+4fcdxNOuf2aqzKx6MrlA6HPMMUDwRxJVBf8Oot+MwaZrIbhb51a4IwPKB9O8Jn08KUiX5+dZAUyTocCHquiXrfOheQJKaWuYWopeNR/9zYj3KC5T7NAK6jVCrcb2V3YC/fMwIH8ZL81HgsKtyfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JE6uf7PK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XZSaq8ri; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JE6uf7PK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XZSaq8ri"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GLCmj4343840
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 01:35:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=N8sTXhZEGzAhuFBbJOsyVHbi
	Ug2T+wfCrbiWH5+ncZk=; b=JE6uf7PKLHla+DnaSl+zAmTXSKdQyfm6zwtn1fBh
	8nDyN4WI6OBNguQ8zdeqvCpHIKb3TDdN03E31v4MYLnLqCybdRl831lVytJoVls8
	JY8zSFH77HSWbpZow5nM2Y7hsVoSaeRm/ve4EWmp4e8434ZeBw+1uh12GXovQAle
	qk3vOVfM7cwaUkJ/wzV9yZEH43xhierLGtqJjOj4HwUy1vplbWkNfeOQoTzUg8fH
	KFhbx5LZYCtKX6c5E764zkN8Tdm+WZN0KDuXP3xsNYRPPQp85zhbfaztM6r4oSCa
	/x6ryBR/N4A4+86TEiBqvQRxyJOEn65ME/KhLpvgNzdc0A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghemtww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 01:35:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930b571432fso274527185a.0
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 18:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786930510; x=1787535310; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N8sTXhZEGzAhuFBbJOsyVHbiUg2T+wfCrbiWH5+ncZk=;
        b=XZSaq8riqK/bC5Xl/KeQ3nRKIKbdG1HbR+/QhP1+AM0r//2QBaTy+NtytqgKOlgW2K
         Y6FAGVlTnu8WsZ5Lw28LxyEnjcUwI4wX0fK+Brosh6bep8GIn0QOa8lnuoBCLZ1iIRt2
         yJu7Ka7hp73eZx4KkJt57jt8UBEE0YyWRNPlD1axCXKOuFqE9haj29ePZLPjA9jGelYQ
         UHDeDLyTtkWzcPBJRPoykv1GWrLQmPv4RdYsEPepvYFGWMjkTY3dn2qz1b+OV/jlxobz
         Knnl5xLcyrd8ykBYD4XVJmj1pzE9nbLOIg5ON6tN/RGwD9k3wTZicvHkvX6bDhgRrnUy
         AcNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786930510; x=1787535310;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N8sTXhZEGzAhuFBbJOsyVHbiUg2T+wfCrbiWH5+ncZk=;
        b=W4h8RJzyyrow3tIpGHS92JTs/UilcXyglsvCaCOM1Ky4sgTEeiHAtyhPDFWaHZCcGl
         NaOUv0/hAvTb8o4Wc28FHqCa6+iA/LNEV88ssQRJhgkteQ14RprlPOD1JbcjCk1o/edc
         2okOQFVHnVg5dPq8+koGXltp1y0+JSB8r+vFNVZvTlkYP+5rx2enOE67eSdESFsTTsLM
         IZA9ywscBRrx7t/rdPSIc0bK30MpT4WgGVIxrlOwbkZ/vSpRlp+vIVTSFxRlCFZflJdR
         IVXd7WOfCg1T+OoX2ecHaOuetQTjIyXXJr7LZgVBmi4ah7kxxMpJDnqVk1v7f07et+81
         eKOg==
X-Forwarded-Encrypted: i=1; AHgh+RrLVDSkl+rsCJgqkUk+YVdDEcloyhtXp4tOFNr6+1xTiw15JyGhI2I4UCArZsPVKmK2EtGljUUVx5H/@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl+mvXUTddeYa4dnJqdBB624xnvoUANFhUYJ7Jde61pVwFOWxH
	GDkuIyfLs/5u5DbYUh450DwyO872HD/EXzAbNSXs943JNPG/KQ38tjBPqktMhYkQVSyXrzxkIaz
	Lu6W0JpYDVaHoh/LTJJtaFGGcWXaryRVHxqW7uElWeb3QEubwypbCVByv/8m+Z+W5
X-Gm-Gg: AR+sD10exL3In819PxXXHkjYrJzpWn7qn6YdHnuw3vz6gddGZPXeULp4BTdEI0aX5jC
	tUa+XnDrqALVaBhmMFJpMgT1zFAPA1aRXuWAibj1NP9o1Y9Zf2eHnRx/lB0uLS4+897tNsdniyC
	A+4SfTlJv88Vir8wfZ5hPaXkkDwgt44dbDWn1z9zoOse8sVp4I/sJMDU4mIx0L3W6LY/VlvdvXy
	RYJtv1BzTrf/6rTo667M8+f0zbSHt4ztGNWkWtnyYYbauz6b9EFzAoeikvBuZ2YuWs114oDK32u
	KpeWa0KZsGpQUzRPAutOaS2EzsaOPZRMQv7u3ukalwERh1YFLF2PmGGASZkPDJxK0xlatasWi30
	9lWMAA48n1xomIOTbcjU56YWg7vC9wJwu05s9KIqazg23OrhCZH41sN/eMnIP0bUUvkNrzahwUt
	hajggLKt0gOKED
X-Received: by 2002:a05:620a:372b:b0:934:ac0a:8bb1 with SMTP id af79cd13be357-936cfd6823emr1951787085a.8.1786930509742;
        Sun, 16 Aug 2026 18:35:09 -0700 (PDT)
X-Received: by 2002:a05:620a:372b:b0:934:ac0a:8bb1 with SMTP id af79cd13be357-936cfd6823emr1951783085a.8.1786930509356;
        Sun, 16 Aug 2026 18:35:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a16b0e1f18sm177241fa.12.2026.08.16.18.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 18:35:06 -0700 (PDT)
Date: Mon, 17 Aug 2026 04:35:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        quic_tdas@quicinc.com, bmasney@redhat.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add SM7250 rpmh clocks
Message-ID: <am4d5oar3c5fqnahzdxck2qdvubrragah7s32gcqhcp667fr5z@wxhkekuarsl6>
References: <20260816131646.10551-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260816131646.10551-1-sreeshankar0910@gmail.com>
X-Authority-Analysis: v=2.4 cv=EKc2FVZC c=1 sm=1 tr=0 ts=6a82654e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=RPy-Y7ChLrGBGpb54VYA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDAxMCBTYWx0ZWRfXwaLTqmYMVq+y
 XS9QxQUymXqOt5ZyBWm02+LKDkSu03tdPNn7S3S1n6i96ERS+AkiPXazRl3nwpgVSwf1B8oDLmZ
 Z8boRo/3ShT+MtTfdnHbFCx2nwEVImo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDAxMCBTYWx0ZWRfXzB/CRE7BRYJw
 uIetj7wKiVxfqshDASuPFOT0ycGSl+OygzViY2vvDdwMgEFKgBqR9+yjFBNS3NVaWeCWJPalkVA
 7C13plNBIfF4kllVKpmYvXGLcsnTBwADo+ZBL9xocytZpCHA+pLpVX+X5dxcW7ILHVk2WuN3IDs
 mw+xvx6/uJq6KAExwJVTTQO5qZfYrhyMqVqQQEMjJHjJ6IpKHwBRQP5RHpWdLJ9LfWSHwKUuf47
 d8v6pP0kFkGq4EgHstKboewwe5ruzeyS/Rj6V9BftJ1Oxtwdeg7WIICRXJ4loy7OJkI7mBTPyYX
 Bx5ELUttfdFFNs2mBmyeUz2kvQ2Nhiyvn9Erw8bghJg1F79kb9wNkwD0BDzS7S/BRqazkC3uaD/
 O0yY9VrakV24PijPv6pJCPu+9nxWNddGC5FU4OGQt4zlJjuFUkHdhAtEx54o5VeRf1Y6sYLXNK/
 Dl82lFtBQt+pfcY96cw==
X-Proofpoint-GUID: QrF50JPSk1-uk4NY-nhb7GpmWIjlVqS5
X-Proofpoint-ORIG-GUID: QrF50JPSk1-uk4NY-nhb7GpmWIjlVqS5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170010

On Sun, Aug 16, 2026 at 01:16:43PM +0000, Sreeshankar K wrote:
> Qualcomm SM7250 is known as lito.
> Add the RPMH clocks present in SM7250 SoC.
> 
> Sreeshankar K (2):
>   clk: qcom: rpmh: Add SM7250 rpmh clocks
>   dt-bindings: clock: qcom,rpmhcc: Document RPMHCC bindings for SM7250

For the future reference: first the bindings, then the driver, not the
other way around.

> 
>  .../bindings/clock/qcom,rpmhcc.yaml           |  1 +
>  drivers/clk/qcom/clk-rpmh.c                   | 24 +++++++++++++++++++
>  2 files changed, 25 insertions(+)
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
