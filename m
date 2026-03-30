Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714783D34A0
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 13:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774875906; cv=none; b=TGTt3embyfbAvo/U8oPSdcaSOSDiq0XQhyyYzFiN23rCXKJDt9F7VDfdTlOKgixRjKwvOGoUhQo6ilwa0weir2TP4XHnqb4QdCbnAEwTnrHrvo1GZH+ZeSvUz89Nw6zt/bUeiCwhBQAXTArpI88HEfQ8TG6XYm82sE5/mh76DsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774875906; c=relaxed/simple;
	bh=VdhMMkeb0TEAaXsVeFSX8pNiZiJNeyT9wqWROTXJIwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fqGVMbtbOsVh24r1HP/9Toi/XRjJ4xQ+ZLahj2iRtHd8zFeNiza+m3RzJ9ASdW19WGzyEJNUWypdkfEBXXOOeRNsAjC9dCfF8+rln861YgL4ub5keMG7okyb3XK5POqJLM/DGRx9zQd3dHCfwSTA1YXcOE4koAKoZvBWOQPLf1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J3Cqh9+T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mnps25Cf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J3Cqh9+T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mnps25Cf"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U9nAFT3721893
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 13:05:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5F6OiFtnMdTgNDr3//AADnNY
	wPc7rvN5471UHjhkqdQ=; b=J3Cqh9+TdyFAp4SbyNvcYSdoW/mujim2V5h/0FzS
	IBTbhVKBILx/Qtk5Q3NCH0+giBjGZJIZ8GYOkt9habygnsyfHz9bJW+uXVzR/czA
	Z8Q63Pda7Mau9P0wcbkb2CQGjDVQVdyqcHtSRJsbv7oKfI9iHcY2qSKBTKj1usU2
	bm+mO+59JhrcJZu6nOEu9qSAVDxNfnSs3m1/3OvtBKVGXUfvK3Cyx/x0jvHK3p6y
	mfdmOFfwi9MyDn4bQxBtjo1jEFbjP5HsXyPSLxFNrYqnvR/4YDh7Gwx08ASc/lUD
	wu/wNkEI60cBvx0eDuzNSQngeK/FwVwBDniRWlQSPA9g/Q==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7pvmrr7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 13:05:04 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5675cb317e3so3824147e0c.0
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 06:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774875904; x=1775480704; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5F6OiFtnMdTgNDr3//AADnNYwPc7rvN5471UHjhkqdQ=;
        b=Mnps25Cf5e3CRsRvn1TW5IGPOb9cuOGm9yEPnLHrRhvDbhnzaiKrIQ71UzRDj6fQ4C
         6Wn+7ITx2M4iq8c0TJFYU8rAlmmyVTD/z70KepE2YoLOFPzgkvly1wZ8UAgTmFARwkJ8
         josfDHWvSlrH+1uIBkz+zP24Le1Arwjgpy+RerkCoTQs3F9DQHg6y9Tv4N9Yv7EFzx2T
         NHZnvbm5rjCqeOR00Juif95AABAZfdsHztz+aBdJ6MxE4LvDK5OxWv+VS5uYIgONfy8L
         6lLlJoqYCxKgQnO9giYnyCwhkM1bc3T/pP+ondOVCM3yUG7Bp6ckKQQHnyTFCo9FpN8n
         UfqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774875904; x=1775480704;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5F6OiFtnMdTgNDr3//AADnNYwPc7rvN5471UHjhkqdQ=;
        b=dAsSnmN2/sB1tGpeNW3310J5EI0bWIMXAI1KbJtg24m2pDkO6sTtvCouak7TDwK7bq
         P7UNXzjIYn562PeMi5VR5Qz4lzSRbl04E93snsi5fYR2Do7FBGrfJPP2y4RJxXWeJ7zi
         +gCvWjeThHYuEe1G4VCBP3P3Y2IYtGWvqg8fHqgb7P5tC0K0+2ZnUugtT0a1bVitT2XA
         69a7H1Gsp9ma3skzfEq2KpcBn6NDPjTtvdyzmGt0UPnbgLZucd33sDaIrqFXHA0oW4Bt
         s7uV2rTiJ05Qf2Id5YiurW3vbNTg6o4fk1ReCQFuFFhvRgk2XumL7psX+aKEh6G2a0be
         alUw==
X-Forwarded-Encrypted: i=1; AJvYcCXaQD/E4IVuXqBTrc0MX7MSbtJhUQ9V2jZ6a38xZfHVKCidhnXCZk6ECZtRJJwzbkjizrWfm7aaMBNs@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi75mEElc6C+wF3z2B4aybq1n1xwoyMFjB76s22gmikB522INd
	c+4J2jnfTmyccozum39IvEJmubvfgPp2WRbIfxBhyxNowFTYW79lwtcoeUUvGE0SNYG2XMGPOHj
	S/OmdkQa9NKI2fgdpjAIOFl3Q4qw1gqUHEx1jz3Rha11t4wzJgM3p6CWkCDNR++PP
X-Gm-Gg: ATEYQzwT6svNJJRpe70sK/WMnoqRoK/EGCV68uNAAkj3Q4V8cr4NV5fPdsJrboQK4lL
	tbJqrsdEZ1jl6eqf9ktVXZzVX/nWv6jVnlZxaMP77kAjD0hKGrT+1m11jlKj252u/8XBRN+10ZJ
	gBMf9p1peBG5L0CSNN73/vFMBwIIy8TcuuH0brzv1eAL3/d9B1ydIcXkSml+Ria1LUxjEek3cxJ
	yn6pfEPfxhD+S3qu+W/TGO9Qrbm4aNOXzBbOa+WG4fTgcd3PHe1rekeyaBl7IkzkirEyw4Oy6v1
	aUSleO9be1GQxb7Kb9yTttBg9nWK4fidEqfdDEN1GXB+kK+tG3HJrF7j7C+rVwZz8EsmTn2/xxa
	HIqvuZUbopubTbaBVm37aBBhMeB7vMwpgnV1S
X-Received: by 2002:a05:6122:3c44:b0:56b:9784:8a2a with SMTP id 71dfb90a1353d-56d4a6061e5mr4559014e0c.10.1774875903549;
        Mon, 30 Mar 2026 06:05:03 -0700 (PDT)
X-Received: by 2002:a05:6122:3c44:b0:56b:9784:8a2a with SMTP id 71dfb90a1353d-56d4a6061e5mr4558945e0c.10.1774875902866;
        Mon, 30 Mar 2026 06:05:02 -0700 (PDT)
Received: from oss.qualcomm.com ([84.232.191.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e2a7asm20881322f8f.7.2026.03.30.06.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 06:05:01 -0700 (PDT)
Date: Mon, 30 Mar 2026 16:05:00 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add
 Eliza QMP PHY
Message-ID: <2bfl4imfis2ts46fskz5ykoxyxcekz7ieesfqedwvy6tskownv@vuwj2mjswtaa>
References: <20260330-eliza-phy-usb-dp-combo-v1-1-2ec11e793a08@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330-eliza-phy-usb-dp-combo-v1-1-2ec11e793a08@oss.qualcomm.com>
X-Proofpoint-GUID: VlONu-Wt2kc2N7QnKqvDsse5z-nDaEkw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDEwMSBTYWx0ZWRfX4ZAosN1s3PCF
 Rm+RAJLJoVNrFy0KHGCSG6GOpwt7RHWRlbSX5UlduQ6ptfgt4Br16Toyunrq9VVay3rxwvSHrki
 Q38INeQNNpRAnvb/HUieI45zl0thKblATZad75yiwkhkDpwE9SDucnlHWIae9BZqtWLSIQum98o
 ekgfffSafpLYpNdqio7FHtQbgYwrUkuzYSJGKesFLNHbX1Q6ixj04llRGlnLmcpeZSWHNiq+beA
 AxKYAx+lqkeFu2QrdwSXlKYfiZU9V8cmrxhjRHziGwB261j2z9UIQECgQh+AB/aY3R1YLJlS8AO
 hkSVsvOFEMaIaaeOvR9Krc+LJ2MJRxr4OK7IkqwcAO9B8HjFxpidh7EulR4YSFkPoGNGXPAKN7Q
 47Tn0KDlh7jTVkAGXmg4VkdJNKe2vcPmSlFc/+8j8jg+H3DJeNWE/j1+UuK8VEkDlAiop8dEMpX
 QU0TC3k/ucQ+OCEkGHw==
X-Proofpoint-ORIG-GUID: VlONu-Wt2kc2N7QnKqvDsse5z-nDaEkw
X-Authority-Analysis: v=2.4 cv=S9rUAYsP c=1 sm=1 tr=0 ts=69ca7500 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=1UCgTMz9MQc3icybWezSFQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=K7JcDRgPh8oaRkcjYf4A:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300101

On 26-03-30 15:19:12, Abel Vesa wrote:
> The QMP combo PHY found on Eliza SoC is fully compatible with the one
> found on SM8650.
> 
> So document its compatible string and use the SM8650 as fallback.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Please ignore this one.

It has been sent already here:

https://lore.kernel.org/all/20260330-eliza-phy-usb-dp-combo-v1-1-2ec11e793a08@oss.qualcomm.com/
