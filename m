Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A7A3C6616
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 18:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774289046; cv=none; b=ckYuDwNbULP6Mj5gCy1NwfvuAhn12GWNZG71mPDsoHC4MxISBNqTRjv8hyl0jLn0s7ajZjnp8d+3s8EaunIUeRNzpQ/Ne53ns3Sa/bTCq3AQfbsNwaFxLjUNqa1KzVA8cFncNrcbHQ0ilrC04E6DZAu5MclgAlJ94fRhmaiSirg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774289046; c=relaxed/simple;
	bh=nYnFveECu5ITFAyR2yhAkN363hpP0FYZW3sOF/XvTns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R7PLIrOkDGIqVnSm1BwQcjXA7+OLES/BbjsZmtRoKJE3YWwgmmmlwCKr2VcrjOcBm6s6h4lRDoxiIoYZyPaKONr0NStlwMkye5w+GuAuyKwfqMTKcoiAo3INUgvBIr1fhrB10Fng8B2bPSNlmiA2MCtmsqqga2KB6rzCqAhlhRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NbYWim+U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GgLw4qM+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NbYWim+U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GgLw4qM+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqpY43934889
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 18:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6D6USV7BY5LuRMBJnmmvmDBp
	FpnRg1a11Ks57MhK4GM=; b=NbYWim+UWz+1Hzk91j8t2X9fcfUuoMfMLtiBvknV
	UQUELYLkdwbXEkhMglvUaKXJy2fxcZVVSMwkD8fCVt9hS896y8J1yQo79UsxeUAG
	6p9pLTqOXELD0qJxQfiKxv2cUaec7BO02wApAqNqbA0ocjNTNCuVEO6dhNiQz71a
	vTF5UCWER1DEc15qkF12eWgBdU9mwqEV4wWZSg3RMojPPZ1UZjs/zGyKucEnrx8r
	5w7B/YOQwzKo1mtrOlFzMlRHANKkG4HodXmjfk9DvBY8WbTmVgBJxg4WE9VLbPad
	JtPHggPGVQosIth/fzqrKthOlzx10ws5UoX8ZJrs2m4vAg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d37a0gs6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 18:04:04 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-951649dae81so1237134241.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 11:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774289043; x=1774893843; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6D6USV7BY5LuRMBJnmmvmDBpFpnRg1a11Ks57MhK4GM=;
        b=GgLw4qM+jKd6GtB2q+CQtiQjZlha6b+dWcaiL/utZWhMsa/7yC2hQd5xRQIqjS/ecO
         SIgjEJbEtWTKl83hfBphbxQrqOqnIo5TXxgGypwhX1jfuKjv1GxXvU5eDc6U5Qrdnpvg
         pHJwx+TwKQNvztzOkIpllBXtx/+NjJQTcxTkI13+AcZZr+VoTiwkkUSVQbBiCuGQe8yy
         RTVoBBoB9O93UvBPg4vj1TMLkQE0rWkRJ+REdnH8FV3K3795XCZR61px3vwaadiwO4pV
         UGK65i6gVsIuecIwg/caGpvofFj7mTMJjWRyLn+0C1h3w+v3pVGwDwZ5tUBpFRtZVIPF
         SoZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774289043; x=1774893843;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6D6USV7BY5LuRMBJnmmvmDBpFpnRg1a11Ks57MhK4GM=;
        b=M10Ei0mP+oaX64uhIh3873WoEpYeZ8APBX1iKmanSzzZctbNy6KFFc70Wr7FZASm5s
         NqNci+IoJTD8LEFi7DiTyd77fBfEjO2KuDZ7rHM3YXYGTFfOQiNTT2uSfulNoYHd6w+f
         eFTn5uRWV/2QjA8bi87+RlJnSzSkWyGrjquwsqAYtyX4xFUeidegM6km0zKDBhbAym6v
         GJipnp6hIA+is8o2X5MM0hoe/H4+HCKZnukF2cgVRTFjqkPlK/GFAwwdtzkKWMIie14X
         SteWFBwcUXFtabScgzFCCUT7FsPGQIcgqWHUhT8b7hlxRAjNV4WoZhdOrCY91/l4CYCL
         +J3Q==
X-Forwarded-Encrypted: i=1; AJvYcCU7aX9dQ+42OmuoLcFv3xof6mTtrkB/m4YuBgj45D2qlhFfQDJp/I8D94beIOTprWFnMfEaXfyUQWvL@vger.kernel.org
X-Gm-Message-State: AOJu0YyvbpQmrg5zJJCgPrdwE+JX6VsuI+Kh2Dv6iF5Ws2RFB+5BaPTp
	o+OLXBIz5A162jBltHDe5K+YCTPQK69vz35dQwPsfT0WfIZ5/UMNOV8+j9b5rzSskJ0IzsvoqI3
	HAslf2cLKZpXtVtyZeVkyRIGefju3lhpnr9j6aC6P6jK/rvColdut9czAWYt6CY+0
X-Gm-Gg: ATEYQzxVtv3rce3VMMbGVoMoH2H2LH4aoGFM7wz3zwcdoBf4bAji8tWJNiwnKR/OV5V
	WwUcBw7wpHi+rRH4vKLf3u0WNoihoJscb5UPZXRxfKeGMd1fgVrug7B0dDwoPe8vMeBjLe3vva6
	pVXjNN9YN0A4n29PtUleknCjJ+eRmpPDJUVUzWDO/E2iBYrhH4eYlQoh+FPCTvaAQM4Lr62tRkF
	s83oYmNF1A98DG+E+X1g3watstUo40jIGP3tJ2N9lvlwZW83dYVJSMuEW/bmccwg2bJr5e62uaq
	GyEXKTHe3G30J23xwjzJ6YupOsor6ynpLes6oEN+kDaTwnnqUZvGE0NTIR3w0L+ic4jt42Zr/Vf
	f8fmtEtZS5CJzMbUbqYgaqMPbR5Iurj7vvg==
X-Received: by 2002:a05:6122:208c:b0:56c:db8b:504e with SMTP id 71dfb90a1353d-56cde447f2emr5977622e0c.13.1774289043062;
        Mon, 23 Mar 2026 11:04:03 -0700 (PDT)
X-Received: by 2002:a05:6122:208c:b0:56c:db8b:504e with SMTP id 71dfb90a1353d-56cde447f2emr5977538e0c.13.1774289039892;
        Mon, 23 Mar 2026 11:03:59 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470b243sm31857646f8f.26.2026.03.23.11.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 11:03:58 -0700 (PDT)
Date: Mon, 23 Mar 2026 20:03:57 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: eliza: Disable UFS MCQ mode
Message-ID: <7bpvzg5zkytzgorbuxyo77aj6egcyll4qbzxqknearhxmttzl6@bbrcbxlowtvm>
References: <20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com>
 <20260322-eliza-base-dt-fixes-v1-3-c633a6064a24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322-eliza-base-dt-fixes-v1-3-c633a6064a24@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=GIIF0+NK c=1 sm=1 tr=0 ts=69c18094 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=42MeAh9OZE-JqNhjVH8A:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEzMyBTYWx0ZWRfX5DLByE9JOxnr
 KfIrKg61++H8SCOQ2qcHLqC4lxrP1pOukPt4xAi26l04WSWznhFlNWJFsF8OeZjPvbDMd5G5vaZ
 5HZq6S/LgJkyyjUWOZos2wVwhIYe+MOGHJFQfGdy8z0k42orc54AY+G9yizxxubVoWi3pwyAXyI
 rykCNOF4G532EsWkXZK3u51qUGmZvNHV7w9vkzQLz4cILUbox7U9o6AWpvBfKjvnqnf3oTjB0bA
 4GG35YV4yg8mNR6Tdb7S4ukDKRjuRMmBV4a2k/19ns/yFSSdj8tV9mfzSLM0xj3iUpoWfiqPRP9
 7INnkVamdTOw7sAQtEW7A69zFeUKdY1cvNL+GT7Ub6QPYEvXqdXBH7vKFe90T1g7O2ojah6O++q
 baF806Y1niKq39WwQ2YhXPi4ehABW5HyCKLoo+82V6fb32Ek8k9LxYhzcN9yE3fk/JVC1Y0Ct17
 lCMrDtOt7SV0tBUhIRQ==
X-Proofpoint-GUID: 3ENVUQ70ef2urtS_nAbYXAl7FvB-fs1y
X-Proofpoint-ORIG-GUID: 3ENVUQ70ef2urtS_nAbYXAl7FvB-fs1y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230133

On 26-03-22 18:08:21, Abel Vesa wrote:
> The UFS MCQ mode is currently not functional in the driver. Eliza is
> the first platform enabling it, which results in UFS failures at runtime
> with errors such as:
> 
>   ufshcd-qcom 1d84000.ufshc: ufshcd_abort: Device abort task at tag 4
>   ufs_device_wlun 0:0:0:49488: tag#4 CDB: opcode=0x1b 1b 00 00 00 10 00
> 
> The failures occur when accessing the UFS device, while the controller
> and PHY initialize correctly.
> 
> Disable MCQ mode by removing the corresponding register range. This can
> be reverted once MCQ support is fixed in the driver.

Nitin, care to comment?
