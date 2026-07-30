Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BFF3B0588
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785453847; cv=none; b=TBzNh1YxwpJWC0qPBJrzjRT3jDt6EsTCVqWSl2gPhhVluxqwCa2JmPNQVEw1bpMDz5RIkQF2rIZPdEcpxN8xKw8ex+Ts1Yf1l87zb7U5gj5gzYzNhJG3/2KAx4cmONLWZjD35ksKyYYtUyA4LpBW1odBkQriR+guJ/r4UuM76YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785453847; c=relaxed/simple;
	bh=fA5ZuEivaj3K5Rum+AF/pxqLAH4XMn9DI+2PxXkybeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=euFIgzA+cNI0/I+4dbbxL+dRebTMOmD3D3aiNdHXo0pu0RANWrSgJqrBYiAFCmycPlSPqwML84AbkSWAz/swV4IAhjPgz253/X3EA2xLlGGIM+wburEa9SgldO499aXUKHHMX3ZVX1eLV/ZkWVG5Gkquy0am2+NW8Hl1IFFafsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KKqMSQBR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tbucdisr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KKqMSQBR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tbucdisr"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UMqv9D2453712
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:24:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/DpREDsoQc4H9dZ6Af9qMzVe
	qSt8mdr4OUynNzksey4=; b=KKqMSQBRFmhgTw5Nmbo2gIaUIdt+tHGYMYX40vQ1
	zq7RGP8PkTKkjxYMSZaDF+v0b/OwFYTnJ/3cGzrJJYjzE5IbNUoB/udohPyHZH+T
	gwxgJPpMQBzVMbAiKWfJxD7XxgOWKoHGmjNCEwSQYLT5pDvLJvtxDYLyvmooqX+Q
	I6prNmrFX/CZ360wQZOVGo9wws/ZQgCwWIDkWCV9lwAc5ah0K3FuP5FaBlnBI8nm
	6KcmF6lwrCEBrqipi5H3av9+q+EtMgdmmwWVd7XSCopQotuu7juA/cLZ4i8OLxK1
	02L/Lld5uAww72okpK1BSb/7v/tOuIzDFdbKLKJLxIdQUg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frf0wg6uy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:24:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c12e43b98so3234861cf.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785453844; x=1786058644; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/DpREDsoQc4H9dZ6Af9qMzVeqSt8mdr4OUynNzksey4=;
        b=TbucdisrVfdtylW0N1Wo3tytxGXv8Bn6r2eRfsq5yuIOycJnsS2Uxr2U/mzbVsZH9n
         XGm69L+ZO6Z/tBABCN4ZPunIqi76yTAaVGHFDan+F0DWzpu+5OQwbGauaOMlfVmI6cCB
         WPu89/VBiIbsk0yx2a/mSSjb0udbUy/FR7CAKL9GhCoQvxT0RgjWeciMYEkqaZRDFiuL
         Nth2nQWtbuROej0oG6eXBYdvigFH7sA42iiJP5SEoBRQVfzuz5OZWRBIQKc+ztPTVUQh
         UpBgow2BruLRlPeBGLdqEG4VKJezCP/eTYbi1GhdQif5PaLjVnjowcknXP/xrC1K9XAP
         ylww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785453844; x=1786058644;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/DpREDsoQc4H9dZ6Af9qMzVeqSt8mdr4OUynNzksey4=;
        b=F/FBzyVjCeDYzT3Y+YwJ/PHAZwrpayKOgqUq9FaVh3eKkoQVtojmAXAQ7EOZoMKsQB
         PsOhb69KLjMxiF5yEDeoKuLh3tX/ZDtZgNxwlI5RkzouWxKiX4VTWWRIqMWSqVExC1u1
         /mOs/517+wteaKXPccm9UG1xq4hwyY+/TQvhS5cIH5Y6wzJlwjY5qRMGD1tNIhlqzZPv
         t0Jds0MLtO1SxhfXf3U9isq+XrOmf4iK3nVaNRB3FQqIj/GKtKn0UaWsbE2RwcBgBWvE
         zZ2e5hyhPnvGW0t+hIRjS2Bhvb+zJFOQ8Qnp96Kkzt//lmvwWc/aJ3srtC1kp/UWB41u
         W/Zg==
X-Forwarded-Encrypted: i=1; AHgh+Rox6tI6X123roJhNqnbjtGxwZWNkmq4vU4pdRKVBNDl18nR4Tl3U3bfjaRny2LbSogIxNefQ+7eD2Ef@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5J/g7vxWK38cmCjB93GtJEvhSLQDxcXtI8srMByBo4qIDO+h0
	G1HkA2JfqMb8onG+XMGnMeSjOTL/YpnoyUvjnlOKOQ//QTc15v/gJTBvibBDRYnBB/R4Xt82XBI
	yPbt8oY4ejP/zg6V0RUOxgspN7Od0CDsOZgwz6gjVlo9tYZrrjZGzO04TGWrj82V+pZhPZhVH
X-Gm-Gg: AR+sD11bMQcX3iov4SmQRuOBA9tQWJqXjhmgR7+F29yLoeCLeD86hwcAzGTgfCl1an5
	Ad5VWo0pOnpvQN5MBkQPWxeMowDsGO4t1Pmdm4ZG/g9k2bM7Mpdi5+AI3aDLPb1xosViIJNS/w4
	NhlV9ZxbuPNFGCFpnjXcEwhA9LAvKIMNHQenebR68SDqXSqVD40sQjTUl+/fSduF2X9y4Hg6uil
	RPP5jKd5RBhH9BwiJHkGv9AtTZqXjWrwRnTGpgUc8MqUcBu9lsS1fO8Q9rYgNztD6vjgpOiBQiH
	uHTrrIELGEKdBFY6ISE8o+2ey8bmEpT5kLHeAvdFXGqYtTvMTzratFAP8cm3zMcZbMEH8RASDMv
	EzZelIjk2QeCaybp+k2UXzrkjFG8k8R2PtoBTz1vbs5/+aBwFU5tZzGpMpyeaJLkVw8vi3oK9U/
	tr4wI6egDBgKDHLQ==
X-Received: by 2002:a05:622a:c8:b0:527:7891:1713 with SMTP id d75a77b69052e-52b42ba2eb3mr25000071cf.39.1785453844250;
        Thu, 30 Jul 2026 16:24:04 -0700 (PDT)
X-Received: by 2002:a05:622a:c8:b0:527:7891:1713 with SMTP id d75a77b69052e-52b42ba2eb3mr24999841cf.39.1785453843699;
        Thu, 30 Jul 2026 16:24:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9baa0dsm635149e87.54.2026.07.30.16.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:24:02 -0700 (PDT)
Date: Fri, 31 Jul 2026 02:24:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org,
        conor+dt@kernel.org
Subject: Re: [PATCH v8 02/18] media: iris: Skip UBWC configuration when not
 supported
Message-ID: <d6wuqm4e2gxldrrloqxfxxmfggexxsjvltl25mgorrvhqfnheg@4cx5u5f6sxut>
References: <20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com>
 <20260730-iris-ar50lt-v8-2-6597c08cea6f@oss.qualcomm.com>
 <20260730153236.773A01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730153236.773A01F000E9@smtp.kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDE2NiBTYWx0ZWRfX/wYZw+S8QtoT
 aIqXTm7Rm8KQMu4uAzuB5YpMTgeeP93AunrQ0Gn0Q6Bu974qKtsMqagOB2pFL2Yx9uKCyTWV0pH
 zjYahaBumN2U+YaJxQxYIUaJKYzqwRI=
X-Authority-Analysis: v=2.4 cv=T928ifKQ c=1 sm=1 tr=0 ts=6a6bdd14 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=0WTZDXMykMspNyP2LdkA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 5j-CA1snhDR7dMxXv0pqx-Jd4LcEh-5d
X-Proofpoint-ORIG-GUID: 5j-CA1snhDR7dMxXv0pqx-Jd4LcEh-5d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDE2NiBTYWx0ZWRfX9PsYgqOzNltu
 YhZeM2qLyoVurgNuQRcpwlsqqqHBwjHJgCXw2ihQPRwxZKvhdO6iccl9gkLc6XbX9POAqvlcrxa
 ed/f5xVWAVKH2ATL3s/KyRtjJ1TUMdo8hg77gL4V31JvFXc2ZoSspLgeRHwhfhakfJqJ4GXzblI
 fhgie3k+E2OIPoPcDKODaX1PZm0X/Rf/5xkB6na6qFpQ15Ngx/RPzuFt+/bCTk3K1resDLNWgt+
 rgL19STJ9rpSFlfKd5rZ/oTrDDvtj0Ws+GH1Myt31PWYUWkv7Qla9NNj3vf9DGN0kI1J17Syb1g
 ZGS9PWZrpUFHlUzcayFMrNS/Wg78KTXitbtUMKvUfMr73c1eZPVuLxxNpd1zPCSJO87YkHmzJMZ
 IAder7uxYjcHfkbAI7ibOyuMntiuO8F0L92eRlP1O78S3A0eFD8pIs9A+w9OF23Kf/9DeVTtNWc
 mjkKjYJS/i3CG7OxX2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300166

On Thu, Jul 30, 2026 at 03:32:36PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] UBWC system initialization is skipped on unsupported platforms, but UBWC V4L2 pixel formats are still unconditionally exposed and accepted, leading to invalid session configurations.
> --

NO, it doesn't. vdec.c and venc.c filter out UBWC formats.


-- 
With best wishes
Dmitry
