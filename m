Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617F51A0BD0
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787559113; cv=none; b=CW4oE78kdB9NOHeweubNE7HpVRI0CV/GVZS1SFwAkwrCDgfiB7ZVPUoMsFBPq6FxK5CfxbVgC0Ufj+RX6PNUyhRSTzEOyEs7svYE0LJo7tLtpgkC6Weug75iJ2uvNjcX7bpvOVdW++dic5VeX1SD+3PbOC1hnj41lYfKmc166Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787559113; c=relaxed/simple;
	bh=t1Q5l7E2NYA9ruZLWO4AvWE7k4IA7tU8aqEhVm7aL7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MLfw5l7Y0TLb5uSB/6MjJx1nVWhYMa5bx38tYi5f7lNcmDNIP89lwLG4ufDHlMBWe0upTapQs6rBZeNu0G+uxBc9PCVth3AB4tB+l6xtGJfeVRpO/cLAEYf9zxOGwKdf1lZwIaTBJyWBy7IdKC9zUUPN4snMy7DnGQ1imxAjyQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BJ+irut3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gAwfGedp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BJ+irut3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gAwfGedp"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5R7SD1477756
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:11:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HO6pzy8hdqwatnNdzVyG4rmy
	PCjNL3yeag8ExcEKy7g=; b=BJ+irut3ccBgSn9wUrIC8NiLjx7J+5GHz2zCyAfg
	A2OvEI5Q3CevhJ44/P0AC4Jz1rM1QpE6XZjwDbKvDNmxxw9xhTvYbcU8X6gE94Qf
	mWEnUDu5yrN3oKpK9CRiDwIGrUia9s0SZ+vcuw2U6i8w2lvw15RIo6gTG0Tzi+Cr
	+0fb7zkrlJ8tPuedh3pz1nIFcri8F8i8+/2GuiPZ2Vqz+sbqa1jMBNKM1K/Fwn0P
	t9+xZhLQ4K1/iPFGgJwPv0WS2mwX+268KJKgCH15hgXf69o6GlB1U27jAKU8CA5s
	buPRDVD189ykC7yT2EOTNRVO/szpXkxePWJilRKqVFkLog==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g7528nwkx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:11:51 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8485b7e18b4so5315501b3a.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 01:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787559111; x=1788163911; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HO6pzy8hdqwatnNdzVyG4rmyPCjNL3yeag8ExcEKy7g=;
        b=gAwfGedppK5g/5xTw15cDZwBPMuWd1okorZRqv5JPT1SdWs0nWtOSoR/dEm9RYQZ/b
         yxXxWiihAHqSSGd9x0aJc5qnZcslCsSS/CJAV7gdgIVsFHhNIGlM0bPAeYkRXz2JKWjl
         EfU6RjxcNhmioH+1+w8W4i+vb2/+Cj8kUeftLfyr6V2egI+pe7fK0XKt8cEYWbBMxX+q
         dgVYj3/eFKN9oK5iAWXE2RLWH5OdFILyZeHgSp+nVk+cIspWPnSCxwBbaIr0BMxi2md+
         jA8I8fSlEUU0xBQkmuSQjO314JU3JDYjGVoNTKjImaX1ojzAJWqlV2Dgzlsp9vRB5DCX
         ut1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787559111; x=1788163911;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HO6pzy8hdqwatnNdzVyG4rmyPCjNL3yeag8ExcEKy7g=;
        b=mB7+VhpgiYZDlG+erEfe7YWXqrpK2dmnfSpNwLFz7QxoO8UiB33ww0O6gHr8OClc08
         fmR3mzRoeYfywf7SIW4FV1XMkSJA7t3hTlC57g19w7YjDV1+g5OCNy1IrsdIrBEXCLB+
         Hb50I3akLLxQvqH/3aep77H9GMX+9bQM0PmTdB/vGTXH4II1oeQ5U1MWWtij0EKlaEqL
         HLXTQkgcdjGbGVpMeXVh6uDUt5OQk+N07+x+4HMffFJWYWnSjUAQGyN99YpQauC2UMNo
         cADUn0Rzt7INUrctKONRG26pWweaQyLucDrLcf+BtkWm48BYaZevtIcXKD4IknsqTKGY
         JtDw==
X-Forwarded-Encrypted: i=1; AHgh+RotAXD3obAXW+nIZLNueA72M0V2XsN6Tg6jMrrXRy6tPxcwIllGArAPCwtOy7hxkWP2Rnl8KXpNgHnU@vger.kernel.org
X-Gm-Message-State: AFuF++lwXy+Zgu50V2b49JC7V79+yG72dfr8WqSG7pY0y+akGWz1ahGg
	i4b1HiIb1XThXgrF1FYln1/vseKqF7Lg4JtJCBasXY2fkjNeT2idGOvirfSlCg2kox2QigHhV+m
	VWgFx/Oo1ShNfQ0GHPjYkVoOQE9l6RyYesFxgjjP1B5q710QrAQBYgwkRPsWVgON6nlxI0eMF
X-Gm-Gg: AR+sD136vdXKkHL5zXxb4DNXk6hHxqBqEUyV69mkyR7ezFVhBV6QPszby8jhUn5a0W4
	mZTxVhuVYG2P8BxakgU+/fVk6fjZH+ykJEd+yl6vEXiNp36GJVMnEwAU3aqHY860Cgr1ex6llfm
	vRKWG1YEn3AAkVnMUI4A8NQe93wAvC/NsebR6IyWKw/4FqxqgD976TjM0i8X1WI29ty6t+Qb0fg
	lAPDCKIr479R+b9gwPHPqawqV52yIHyOTMBGUTFBMUv8DhjwEiva3wIqbD7jKSQG1D3g7FUslpY
	LuXtOq7zPdgvdktD0tSZ6e2wD5BgQjfEF1WkLoxWGRFh9Qs3Q34e4IFkTcmushFts18fE/FreYW
	vnJ7Twoy/MXvE6v4=
X-Received: by 2002:a05:6a00:1884:b0:852:2ef:c05c with SMTP id d2e1a72fcca58-8520beb3763mr28062257b3a.17.1787559110925;
        Mon, 24 Aug 2026 01:11:50 -0700 (PDT)
X-Received: by 2002:ac8:7e95:0:b0:52d:9a3f:85bc with SMTP id d75a77b69052e-52e09bea1efmr169364541cf.18.1787558736879;
        Mon, 24 Aug 2026 01:05:36 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24962bd8fasm1739877966b.28.2026.08.24.01.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 01:05:35 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:05:33 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v12 5/6] arm64: dts: qcom: monaco: Add OPP-table for ICE
 UFS and ICE SDHC nodes
Message-ID: <snkzt5xwhkm7lueb5vp5bqjr2b7devmh4mnawlbjptl2gcuq6b@khutwr5w2zdn>
References: <20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com>
 <20260824-enable-ice-clock-scaling-v12-5-09271f583dc6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824-enable-ice-clock-scaling-v12-5-09271f583dc6@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=DsJmPm/+ c=1 sm=1 tr=0 ts=6a8bfcc7 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=-W0wxAWcNmATYll7EfoA:9 a=CjuIK1q_8ugA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: pRzU_pQXej9Hk5vhncrP6XLQU8JPEYnL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3MSBTYWx0ZWRfX7GDXG1V0Vk3p
 pEiy37Ut7cz6pWl3U3mw2+xJdulA9l8bTsh2XmYpQhVW2eLv6U5sMgKKdVSCcP1rf0OVbhnW/Yq
 uC1h5lfsSzbVb7Oim7artX1q+G8puBDkgSEg76y9JpA1jw30KmfYXZx0/jrVwmj8EU7MH5/ar4H
 deZJMV1olS7N/UITZq+qDZVkZjKCv4BKRFw99UR32TZtl9ms+b3T2Xh7Qf2p2rQDH0I95gPnhII
 ZLE79iSRygtEm8P54uHlTZxdH5egZ8cY68rTJ8hqPYGIOPLlM5J1M+vYqBq6ytKxLJvQbDdUZpP
 srqllU0K1Pbv+6hr0zfyy3lAwA9d4m0+ltxzX6iSKZQa2jGJz2QZH7etxjDYkFsmynxsLjzYcH6
 Zd3iKbGmhBYInv9gCUr6Nl8MmvuH+BI/Z8BcjFejNanDVl68ym86XtoiPpSrAsEAxvyNqLNvIPs
 5Knh7fBQR4hoEDz4s+A==
X-Proofpoint-ORIG-GUID: pRzU_pQXej9Hk5vhncrP6XLQU8JPEYnL
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3MSBTYWx0ZWRfXwk3wD91y/Kn4
 mz/KPUED8GrCowh/Kb98aLiDrUClGol39HQFU5uQP1AsWyWdlxsACOxIu0LDjO84+Md+MneZoHG
 boJKSo/vzEo6fwU3ALLNVN82ziRP20Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240071

On 26-08-24 01:17:42, Abhinaba Rakshit wrote:
> Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
> an optional OPP-table.
> 
> Add OPP-table for ICE UFS and ICE SDHC device nodes for Monaco
> platform.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
