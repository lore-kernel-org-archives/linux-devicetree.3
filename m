Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794667892;
	b=pDFo9Wi7sNmD4vaCDEPrfPLFZEIugntspka8kDMA6W7AWRbM8MC6GhUN2Op3vDbz89Hv
	 DuAefGCqpXdzuYyBUCzc6rDJIhZ6d/3o0YlBBg3mi9wlo+vNUcp6N3FLV5fcFAUzuicdy
	 O104rJZnHFtySI0h4hGgSWxwC1+ACBkUpWo2LScae3PwbnH9fWiqiFJJYZhYV2suQ7qRp
	 kqpdxoHTrSbRyaeTT97pfdIdH0w6piKMEEXzHA9GDBW9uVN3o7t9/vu5UibdYwvpw0e4/
	 JaGxoON54B3bFYRSz66F7KGgBxjYF5lnHrbyFZLoa+0Yv4FCYME2La279PVJ/r7WigQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794667892;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=q9ZNYCxlssK4yR8eH0wNLKCFUZea4SJuw0eYLqnOMy8=;
	b=fqovOsb7yAL9FAvvWgZ+lTk+W6s7ICO3uWYHVf4vQ0PIu+64mCuoIphfE+LqlYgA+QYv
	 KDvzyLZxm4gedkdS3UGtvssIWsDDeaz6cubUdzExYKeFgz7UrBzvNnqFOOrdQDScS8VpJ
	 y7fIwhkA0M+IKV6JJVC4LlJ3SIzTRBt69gI11QDQRIFiVFR/gxiXUpDd8i0icPfjoYmrF
	 oM34fMEZ3uAw64T1TxEQpDYscyOWPcAsvKBeStrMLpXQLHO7EXyAwqyemdcpw/zkYUt5/
	 VR6nXbeAGW3xM24GuK8oRiZUFJK1uawT+LPRIv2NMtKppZjE9p0rcMkoz1UmMWAkrNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gIPPTd2u;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xqb+Tsxq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66163606A327
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 14:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66163606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gIPPTd2u;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xqb+Tsxq
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDkSWg2214084
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 14:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q9ZNYCxlssK4yR8eH0wNLKCF
	UZea4SJuw0eYLqnOMy8=; b=gIPPTd2uAPZpDL2kwsF3Hkp0tGPE8zpM2Uh9P1vt
	UPocFTdDIP5bZFfQvDxmMv66BnsrkMrxIhgBeVkPTaYyhgXkyWpikSS6dP2sT2ez
	5jzrGlpkqOmCniu+ywA6MBtkasXtcDEhSvF5PHED9hZzq2RV5CQeNXLVm3tZPSbn
	A34fOwM8RydN97g/WT03xRD8lyHDSVgKqXMy20v0ydaEUGtCSYuHl+WSzZJVEpiF
	65bec7k/07AKR+PbSvgdfQe2KBOcnEZm81sHIlfXouCtI0RgUDZI8eh3VGBFJ/ui
	KwIG4/KRqEH+2rf1BvhLaSP9Oldt+hruoTIVYfxtgu1j9A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhj410x4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 14:51:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844e383so371929385a.1
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 06:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794667890; x=1795272690; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q9ZNYCxlssK4yR8eH0wNLKCFUZea4SJuw0eYLqnOMy8=;
        b=Xqb+Tsxqj+cVOPDli5Yd4SN7aLQCbqKHkekW7jKosq5Pm2T082GSvVwrDjtz4o2OPi
         BdphgqITJteyhukQQeMVX+fqJ9sUQmbwk0wbLPr39hjgRGC0T7edT25bs4TXHNoM6bCX
         46Bp5wfBrJ/4/Zx51OOIIvz5A66y8K2i7E31bjaJKy21up8FvJhcu0uRdGuX422xVLWN
         +Pbjur8UVxdhdF7n/fg20g2ZDjYUkCoMeZXjtrhGl4VpNn5vPXdmf/pJd0H6nvC8GM2K
         Oe8GcSYgI9BL36sqJOGcOnMttQetXFwSCjLm5IUG8olTX8KE1nzTviw7JtCLprH0PbwO
         12tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794667890; x=1795272690;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q9ZNYCxlssK4yR8eH0wNLKCFUZea4SJuw0eYLqnOMy8=;
        b=Wgj7vlQTOx8BDa+m6QHPvY///J87WBObPlfZRPXfH8pvDuy3umD/cP1pcUPa2dTa1g
         8tkcT7hzI6J1oS/KC0PVFcJQevPVjFNX7pHUpKHu8AtZdSHslwwPvpwXzZgdgyrFhpvB
         253BHP0bNTHmIWI4052tl16L9xSUSpGy2qa/2OAB0HJlgt470x7MPModjz1Kp9k9Ouha
         j2D7AIcky/W0Igs02T3jdlqQdHajai7fOrf2SdmHQeukO11NkVUxOy6mgyVHPB+UryL2
         FmOat5NM43wwU9jqU0Te248wgP9Yb+4U6qHhm38lj0axbXmX+WCPgyMsU92Dn7oaY++Y
         hFxA==
X-Forwarded-Encrypted: i=1; AL+hErGDNEAjcSxNlgOdmz8K8PQ//i3X489xotBeyj5MYoRCdODNao8B16mRWMStmTrNMiYDjXUyX0tUOZNW@vger.kernel.org
X-Gm-Message-State: APuU4Z8ST4K06qLfxyLTQ6eXyiWlWVTtBrK+ESI0793AmrEwTXOf0aXP
	GUXkPHg9KcndG0x1IDTs3ZTcizKTzMjEM1mVIgrzp2yDwm7Tk24A3vHP6VbRCs8H8qu2QqHrMMG
	NitJ+u9L9C4sVv81E0am4FbMpKNI9Pyo3Dr6a6OfyuzCkKzT8Sr++5qeQMP+rjaea
X-Gm-Gg: AYBFou3FzFioCKoV4DdVVi1i4GJh3DznSBAFDJuPXVFR94Ilncw9VfxGTn3JXW3ufkq
	uuJWTINF/ylrdD7I+xWyB4HG9rtY03qPyKmiGu+22d940VEUddY+nzKQ1jNBdM9x4igojnZqcEc
	b5vbf2n26ZQ4h4CQ3jjtbkGAv1OnY5UoCHnhokBRqG1JWZY96NpgZ29wXlPL6ISc+0JpJ+l0Tg0
	TsQHFvXWSSUQynF5uSy5LnBMMapNMaG0p0/+BB/2GBu3H6udv/BSjHdAogYVcpjtZccdQK8I9RK
	nhmu//S1xfsiXlpVk7SsQTJ853xqMLZBDtF3WwwA7BW7aWIb87+uf96HgPr4xv1bJOmEG3vsYWX
	OZ/UMkrOAqpHgDtkFAjTKEO6KaGxfvaVaZvutqJ2igdidczsKpysz7IGhmQCA+NV1
X-Received: by 2002:a05:620a:801c:b0:93e:e2a4:b0fe with SMTP id af79cd13be357-9494bc7f596mr915054285a.66.1794667889606;
        Sat, 14 Nov 2026 06:51:29 -0800 (PST)
X-Received: by 2002:a05:620a:801c:b0:93e:e2a4:b0fe with SMTP id af79cd13be357-9494bc7f596mr915050685a.66.1794667888920;
        Sat, 14 Nov 2026 06:51:28 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm11678492f8f.8.2026.11.14.06.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 06:51:28 -0800 (PST)
Date: Sat, 14 Nov 2026 16:51:26 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: Correct white-space style
Message-ID: <hssvanq6jmddyd2zwp6s56dvj5chk47oiirlmougvhmc44qgkx@jsqitc6ybjal>
References: <20261113185426.183501-3-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20261113185426.183501-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA1OSBTYWx0ZWRfXyE4CFo26sy57
 +5SIp+frNdUdSwQFe2IoYC8z8X72Dhji/b9y6e3gvQiGXYrm9sU2fqqHr8NtcbKf6wZRuXUWSYh
 wrfXAjkpcEzm6XynUNwzybWQ0MfiqN4PPiAijG/+CnCYEktIDCHHNMZhWX7OIDaezbEH0fehTBm
 EQuRba7XS0BQxqWc2OEvcM9wlK9aAhy9YvabhXZld8rfoMOOSYG2fEy5eSfODgJaRlPPkgEh5B2
 1IuL0NlyhtXCh1r3DnPHd+gbUOW46Iuf5xIiAWLKmo8uGnByxSJLM5BoMtDJXlieNt2ZtTReq8y
 Tj9AYHJP1LLFb42Z//RR/B2nYBj0/F2dhRmiLZIf3bvksNeDFtaZJTq1rtO7t0H87l5rGQbkWh8
 uHaMTHchRoAH9p8X2Qd/ovUtD2rXue/hSUN6jZiUeTkkhUeyFAaI60pe8yRwKkm/gc32zRfdmsX
 XRxo50Y7GkKVgzvr1kw==
X-Authority-Analysis: v=2.4 cv=av0nmiZV c=1 sm=1 tr=0 ts=6af87572 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=YbccLBt-SqBNLZOCNAYA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: VBNUQNJ4niaz0m4RZWY0jl-StmJDuBG8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA1OSBTYWx0ZWRfXxNh8kdiSdD5G
 tW6VYoPZElhK2LnHs3wTi9PccchxchqyODNhgApSJ+cm7KKwIMBLgE0S/NwM7Mdb2n3VapZB2ka
 qvmhxorwziPRrUoGLRUOrGKRqh+2b/I=
X-Proofpoint-ORIG-GUID: VBNUQNJ4niaz0m4RZWY0jl-StmJDuBG8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140059

On 26-11-13 19:54:27, Krzysztof Kozlowski wrote:
> Correct minor style issues around white-spaces (e.g. double space before
> '=', missing space before bracket, spaces used for indentation) to fix
> dt-style-check warnings like:
> 
>   monaco-ac-evk.dts:825: [redundant-whitespace] extra whitespace after :
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
