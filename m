Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE86B3F44C0
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 09:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787651428; cv=none; b=YMLpY/JcBTKjzNq/8GBJkQgBV3JJxC+yD+tIeF1fNkT0wXxFlp41guuyKobFjZY951igs/a7rVdG8nU9uk5K3dXjN0iShwe8+kCfiXEE5NyW0GSp7Y/zugdnpye+edc4eJ3C9pmOUkk6X/xsiUSRI7h3fzOICyMC5I+wpjWzJZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787651428; c=relaxed/simple;
	bh=gNV8XyGRdNQJQv6ANnY/KKnuHFv3nDCb0YIitvKZb9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tQdUN+p7KmiPbJB7tf2FplX0/m3dme6xuSwYONYNeRhCzaw+mvJzt/IUhpSi9RtthtLWNRUR8I5ESQAimB5LQbPwNZaNPAG04WFWIhqz21GfJN1cK5m4J6m2Q1dV3WL0tM3X2nTV1eO5jSs+FfkOp9wzELjGTQHoNin04enzh1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aIOgGW3+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UZODPvRa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aIOgGW3+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UZODPvRa"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P88LCQ870560
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 09:50:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gNV8XyGRdNQJQv6ANnY/KKnuHFv3nDCb0YIitvKZb9o=; b=aIOgGW3+veLJRK0A
	cOCJpAzK8UD2ceM/r1QAGWlqr/glbiizXz/VHD+tZwTxH5aM09LobvUMwwgsir8d
	T82TvJtFInnv/49WtTchBTlzdcf7kqxqsuOhHo/wbf9WXB7ZnewVEuCxt1m6xiou
	8/AzsnZ4FF0cmvjSK5cNmNW7oF/VwehxiJAHAFhMq60gluM0JtvolCSTLyKhFmRR
	uLEmsrNy5/GUa3LnQWcjFxU3HFTK0TuE4XVTABqY+a2n0WBkVHFJklXGPFVMHstI
	seOA8znVtBmbgKE/TNXK+62kmjtIZKLlMtwRHVAAlskMMQAsy5qjhThL94bfRsxw
	2PCOtg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8t3duaht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 09:50:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c07313be5so10790901cf.2
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 02:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787651425; x=1788256225; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gNV8XyGRdNQJQv6ANnY/KKnuHFv3nDCb0YIitvKZb9o=;
        b=UZODPvRafa2FFzHl5lXi5mdNur2Rd07MaaLZimicjEadfFXWnFnX+BrIcWifjqCHsb
         Rbo6G5+QRZ4LEqH0Ijz4sBovKOSgiIB5pJCyH5hQFpXBoteRk9BSEhirHN9I8ufn1f4M
         QuLdM2UYgH8RQFhJ/XjknAil7rbWTJdRXGhn7ouVQZwIzd/lINRzxAC9/fV+RE7XPcCp
         HjwKdpYCClNDX5TLy/FV6I3hXrKlJmYI/YZpcnZ194S3E4FfgWLuy17ixUwdF3HD1E5k
         g2vMfg8px+lxDJnkY6bdhDzfLopLGgctcxgDXWqf/GEqsiOoKJz2KivgV3Ofp9D69J4o
         E8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787651425; x=1788256225;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gNV8XyGRdNQJQv6ANnY/KKnuHFv3nDCb0YIitvKZb9o=;
        b=NMO2HygDeiU1ubm5j1+dcg1Xkj/RVW0SdNqlINgtkOw5JAw5sjEYk0bMHKDbEI1ofj
         qEDZornUG36MPahWaqKC64TeON/je+ktTV4foep9vzaj/xc9Q3YuVf1EdA6XHKFIc0Nr
         3Cx5vvFeI9mGSjGg8kWo1us/vu1/Rk3LTmjpeHK2hU+Ltkw6IeYFnywlFT3bt1+BmI2H
         zAfq6yAwxDMOa0I9MR6aA4siP0B1pfTzGVgh5qXcMsHbaDHdI6CAWau1U1KfxJrFpphS
         VuMUk+CxmvaYKbt6korgMv8NS1DQFLYx249cLFt9PxrcEaH9ANC1YRnOrkySPWYjiES/
         QurA==
X-Forwarded-Encrypted: i=1; AHgh+RqFAsTcfGHIl48F6hMJGJvYKIR8MzxTiJiMIPXM40Ty263w/uDcxRuCPGKdBIkQaodI0d5Rj/Q753/o@vger.kernel.org
X-Gm-Message-State: AFuF++kJGNyFSxIhxG6Q9kdp6dc1Fn1pAcW6B81p9noLiPqvBu0wLjfL
	FLGF+v3F5vEXVq493ZuKjBj03dzNdm5SFidimiuGFcSMOzbXLxA/ZcSGEkyy+kF4Fnv/0XShRVn
	hC6mUznta8lmkQ1AmSHoiXVxZ0kpY+Hq1gG/cC0y6aWI72/zWwOd2R2SUx8t08dhf
X-Gm-Gg: AR+sD10u8z4LOMiTtlHKNksdPudzN483a4ND90MtNnaP1JwMq2iwDlmwJ9B0U03prF/
	UpN7MipYRE5O5LXJgKMX3UVWBK0yT8c8s+auDULPtSY9kQ5UD+0GxHpuHEhU8CgVmok/BIG0Yh6
	bSpMC9DnGQI1t9ydqDe3KsbW0xKBz5LJ40sQDd5EQU77YBSCNQvc78xOlKjdpUZfw7pYOVsb83Q
	3slSrY1YBvBDlva13Y80b+cnxCw7ydskiFK4YEELdokAod5qSX7iQe0/w2cU+M0jage024/ceX/
	MD5YLmTYo76+u999ZFFS5Jy0nklZFAHCFEH46j4YTI2rR1TSe7J7GfOht8Zp9tzg85POGId2ro6
	/N+1kr+EF1uQYzKUZcq+/5acK
X-Received: by 2002:ac8:59d0:0:b0:52d:8270:8e36 with SMTP id d75a77b69052e-52df5a67157mr247827971cf.5.1787651424640;
        Tue, 25 Aug 2026 02:50:24 -0700 (PDT)
X-Received: by 2002:ac8:59d0:0:b0:52d:8270:8e36 with SMTP id d75a77b69052e-52df5a67157mr247827711cf.5.1787651424312;
        Tue, 25 Aug 2026 02:50:24 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606b60asm1572829466b.9.2026.08.25.02.50.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 02:50:23 -0700 (PDT)
Message-ID: <46e5d133-61ce-45c8-b706-d146e654038b@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 11:50:21 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Add missing USB clock, power
 and bandwidth votes
To: Greg Ociepka <greg@ferrisoft.com>, Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260812083522.774711-1-greg@ferrisoft.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260812083522.774711-1-greg@ferrisoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3nFX0bI_ozvR3HFjA8Ejn4u-9id3fqhn
X-Authority-Analysis: v=2.4 cv=OLAXGyaB c=1 sm=1 tr=0 ts=6a8d6561 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=QrEPX_jjF0vNn40jFYEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 3nFX0bI_ozvR3HFjA8Ejn4u-9id3fqhn
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA4MiBTYWx0ZWRfX0H42hpmT1BEo
 gZP9NLLDhtiGCt/+GmRnr64+Evwa19wQlJrTL8CvHH6Z7y1/3C3eWN5plE0wPyvTDa2gsYAM2BC
 2IWIVIf1RhPs5qUGKCikQDoG+lMYHiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA4MiBTYWx0ZWRfX2Nuge1QsHV1Z
 HSiiTohdaU5n3cSk7h1ukbVqRzmduXktrdQ5JTX9t5U90zd9DXHu81Zp8In3Yl8V8YP1ctl5KG0
 wDhV3PIU4MC0v81DcYpreRWJYr5Y6xT2rJJf9wSNnBYo9bopCAt8bq9kCzhHQYm3fK9k4qxv8Ye
 tzf63cAWwc1hxV8I08nLOtY0wIiA7t/iaQa6nsG5fDIUa1eeWTUkzVOECsICHlrShPc+r01WlDw
 DCFW4ZcAI0AyZHhDBIA+yMEsRbI5gcFyrjrfYWJwt1UR8lNKCAQXDNGH1mLJKkfAAHvTatz1YI1
 fI3dHeo7a4/Ow25fG5skptstXKbmFordfU7ZvQukk/G/zBaT+xG10oxjrERZoNEUPCIBcojhOhQ
 ea+YZDmzhlGUax/RwXOG7xUdmLp41RZTjIlLMHvUZg6cFTpuhnfM9r6zOIOKr9ylligLNI/2o3p
 DoPvP1+7OHJRPErVqXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250082

On 8/12/26 10:35 AM, Greg Ociepka wrote:
> The four USB3 controller nodes on Glymur (usb_0, usb_1, usb_2, usb_mp)
> are missing three property groups that Glymur's own usb_hs node at
> a200000 already carries, and that Hamoa (x1e80100) carries on all five
> of its USB controllers:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
