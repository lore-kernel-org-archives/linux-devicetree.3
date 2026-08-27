Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F4F43B3D5
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 11:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787830751; cv=none; b=RIu5UnlWZfuvyNnVNMDA99tvMs20nzsr/16TtK5XBlPexV/61lbRzwSYkHvCxQTpuMWFUbBjqDRDVpiFD40bePN2zqodXWPiaPh1PQq+0I1xZJuUTTa4iqijCQrHIJv8wUMK7EbeA6MDYQRszR4YSFuJ/jwggPzrbqTBiLemR7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787830751; c=relaxed/simple;
	bh=jwoWm3TgRVzSKcFItDvh5nfmhHbHsJv+vWqf+nJirq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B9mAGYF5JdD/yeAeCa4M9d3/eLgie0diLdex1JfpUyu9/cu0ipnX7GUIoee+gIJT1nNlEXfk8NAVu0+L6XTN4/mTyQlHmQ8gDYJodIXmDEYZ6BDn3/sgRXsRtV8wFlYFVUqUOg5AfUyREj7vUWvKV8wfslS7KDXdherM++ysWn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XOzfhQtv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IMNz773j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XOzfhQtv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IMNz773j"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R9I4Vv2462384
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 11:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dN6Da+AraTnD64BnmuT/kJB2
	ZjkAMZ09+7U+VzYVeuU=; b=XOzfhQtvRY6O0X+UrQGVSQ98Rng4l1+kP2ldRhmZ
	txMIOjClRV6nnfBZBoofmQytUiMiUcEBAP+eBvZ473S+cbooh4NEgX/tpkd23f+m
	DfX28P23Jw2oI6Pw8FI3PC4GEK6DQCdpfUrYCHqfjQo0MTZWQMKeZN2Rl41Qsqf8
	4B2IIfhGmBKXGYZwVrASYSPA5zkdA0hnZkO0D0s7TkJDpi87ZX6CNXm/bVJ4HxBK
	p9VBRX2XAy9EHFRWjFFajQSdqR7hWyCMbm3LPG20amuemh242sa/4npEinaLu0TA
	hFw4r/gGd4euFY4Z6nyQXw+TgH2S5i6uDWLmHgNkLdRe4w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gaa3bjave-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 11:39:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51a8b0a08d2so288691cf.0
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 04:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787830748; x=1788435548; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dN6Da+AraTnD64BnmuT/kJB2ZjkAMZ09+7U+VzYVeuU=;
        b=IMNz773jpZJOaVtUHxNTV+VhHn4WhXNbWOuTo6bVPn9gYY8kExf2nXQVcAKHhO4YJD
         +nuQFuJzR5ZBI9sa6zqxIqW2ooEXa0QdQgk1DOJqk2NAc6QFA/NKvuPgiNhAnzxTkVCk
         /wGV5TZYO5iJd2QdgTb66RI94p5rSRCSCN/ZwU7W41UyGtW37bKKruvdST7s68WGQEYx
         tAL+xSaV6Nuwv6bUllBx9YhgOQsoLZxmBdPAsxVzRAjGQ4NSam80lYGy+Qhj2msK9P6x
         4GqeM3iOKxjpXt3Zml3P8a4Uc6EzaFkHaHsHybCtQazuyunMMvQhgFQpU8jL1CR4p9oV
         j+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787830748; x=1788435548;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dN6Da+AraTnD64BnmuT/kJB2ZjkAMZ09+7U+VzYVeuU=;
        b=ZbdboYNkfYecYOuEjZaybLTkEBWrNXAoBugZJggDuerQmdFtOBsRUNCP8irYRNk7RH
         wyPXajpAcHEHRpzsPGoaDXMxhh5XTi7L9fyG3NX+eZyXQ4mw5fjoz3TLBKLU6uExs9WY
         rcyQVHsAiJrvgMADs98SN4v4E0R1+fe+o9e0AbCNG4Ka2BW6nOJX/EgULH2T0xD1R1Yz
         nV88vG46WO9BZwt9w600Gw5REB20tBIe3PFhopYDnJYl+pe7PE8ZHWnzaaz6NWYNdcSk
         gj46d0EKX9/wvYxRtY+eHJVweCVoYapx6cd7ppv5smGX6M4ySUNIo5S0q5qvW6dWI9Bq
         bDvw==
X-Forwarded-Encrypted: i=1; AHgh+RoxUX0qloWiXy14Pr91f3iaKmXw78Sc/J3lf5poe/lkDK517oCUVpMWf0wxOOjp+wK+AGxXRyOHgGji@vger.kernel.org
X-Gm-Message-State: AFuF++mQ3UC4Vb4mgNzrXzrbA3XB5+nFKrW6PgwlU5C9QW5i/D9TXxb7
	HOIGZdnGeBX8NiZAfkVn3iTnF6ua679CJh5nc8MsLJyj3p99lS8XrDWGXeoaNNxjKNuK7zRpjGP
	+Joc3waWzQfgGEXNFjnp6Jlx3xVg/Y26IsGvS4e3Qv4zsJ58dWO7A5vt5rrh7LNlN
X-Gm-Gg: AR+sD13dcfwYKdJAU/R1GMghxLt5NvGWsw5bsnt4idPGVQ8myrG0r5fShJFDeiTQ86W
	w0t/WtI7mxyJh1YZwP5scvCD53Owf3wCc/53fpPmuJxbHBDmqyTf/b05yh8JuVAqb1XO8FfXOPZ
	nXWb4+PauAVQkk1fdQlJY/5jD7i0VTLy+aOMUYORsqdB5WvZjaJKWj3K8I5q8juXdaAXm9oOhq2
	jUAICiiSxJkb3uvUUIw729XWdb6WnwWGIuE5KmBw4v5x4ltihjA2WsupZoUNtczLlfi6wUmOwTV
	gPtw4inTMlkFlCiKpXIdqjAGioqtYM1TOGoCNS/hINK92+Jkknmh7q1Z5T0kqtoz1uJ2SNlUrGW
	BoWg2dN06uFPW
X-Received: by 2002:a05:622a:1108:b0:52d:f12c:59ba with SMTP id d75a77b69052e-52e4235cbe2mr147377241cf.33.1787830748288;
        Thu, 27 Aug 2026 04:39:08 -0700 (PDT)
X-Received: by 2002:a05:622a:1108:b0:52d:f12c:59ba with SMTP id d75a77b69052e-52e4235cbe2mr147376601cf.33.1787830747714;
        Thu, 27 Aug 2026 04:39:07 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dd5616f7sm69152135e9.2.2026.08.27.04.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 04:39:06 -0700 (PDT)
Date: Thu, 27 Aug 2026 14:39:05 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sc8280xp-x13s: Add DP0/DP1 audio
 playback support
Message-ID: <vkspzqyss22gyus37upq6hd73tfotjpdrgmhstcvexi4bgfswk@mndm24aug54n>
References: <20260827-x13s-dpaudio-v1-0-da73414c6ab5@oldschoolsolutions.biz>
 <20260827-x13s-dpaudio-v1-2-da73414c6ab5@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827-x13s-dpaudio-v1-2-da73414c6ab5@oldschoolsolutions.biz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA5NiBTYWx0ZWRfX3GsobZPC1MyX
 YacV42gwRIyC2N0yqoQhtdKQ3jDXh6ekFmv2ymh4bDTuKqb2dqXEgZwFzZ4ziDdeB9rkf8u8iRI
 fT0gxZpLyoFzD60tQraqMtLOmbND5gPs3JC090zmungAK3VvSjfD8FqhIGEszaGlr90c4Wkl5Uz
 zwlrCp92ZAAoWZHWGVZ6E+8q+PuvHkIrARggodd/VgxM/UFrinKZ4E4eWfYZfphp24NhvbqqZtm
 mBay0eL5+fx1mVvO/wiVXOKdZ7RuKo6N5aluRbVpWGREb9mRkEGTYloZbAODvns0VpAnO4pkOmA
 TDqeUx1FDLth3dB2IItUBCX+mgz15bWS6XUEZ7j3mgatCP39oTHnRG72BCz+1QEU9akfzQQI4fa
 3+YiKNok21rFehc6DmL5qM4gOVHLpEysdtLffAhj+hXVJYZFUhayiCokvm0N3dxG5k1rG+JRQxi
 TNE+r600jwgX/tsM2SA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA5NiBTYWx0ZWRfX09ejmvr2Yb1J
 ROkXF7+NExSN0dKPaNvUtiyiTA3n9dphLiimPjTTehoxV3x7amCibFrcI7jr4RHT85TvDsu5RH9
 YBHN/Q6FkAF+2ThMFYJiPvfhFTn//1o=
X-Proofpoint-ORIG-GUID: D8dT1E_Aa8G-9cf_O9dqyCARl6GACHR2
X-Proofpoint-GUID: D8dT1E_Aa8G-9cf_O9dqyCARl6GACHR2
X-Authority-Analysis: v=2.4 cv=KbfidwYD c=1 sm=1 tr=0 ts=6a9021dd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=EAEWhcUvtLHaY9PztCYA:9 a=CjuIK1q_8ugA:10
 a=zgiPjhLxNE0A:10 a=dawVfQjAaf238kedN5IG:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608270096

On 26-08-27 09:52:49, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> The X13s sound card has no DAI links for the Type-C DisplayPort
> controllers, so those playback paths never show up. Add DP0 and DP1
> links using the existing mdss0_dp DAIs and DISPLAY_PORT_RX_{0,1}.
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
