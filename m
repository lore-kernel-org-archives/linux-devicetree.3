Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100203;
	b=gZeJo6zyMe7QCEcJBbjrAYxyxjCu5hyEICXHAYslQjKsbTbf+T28EncRkSRAyITb7Aqy
	 Dv4eYxhcBFU+hGjGtxv8GrZJ20QbYsaSCYMGC0w7nbWuhwKmluZIec4zyseRKLNeuZRxE
	 ZKN76YKG3pWUNWbODxJ0hhdRopLUW6inb8vadvkKIYTg4gxljllf308cOJDzTLUzaUGok
	 0EQQ1h+cJ4uI89XEjWJXISD35YiISlxbKZzgoSzhneUmcGMqwW4/U1bgKGYqVPWo3R74K
	 OoptTHG8TL9CV1N+C+lpafPpoWpVPSREsbeI5wJMii0g+fcWjZq2u1JHCfDIiFWdo4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100203;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LCLGT3dGFbYN1moOX5comzCHld4bgy4ncy8r17Egy90=;
	b=0x4athN1Us2zahKaOmqsRkeMDjD0JslDBeb+GcTJngEPQOdzbJvhkP5oWo52Bp7B9CBk
	 s6O6+F91sNcDdgJXResWaf981W7snZJDFm+wTiUMD04NWlhTeDgr4JS85tmF6fQGJgdWY
	 jUoqoU2wTnK2EsOYqM37K+pAGFwDELR9bKQEdhr0cqY3fXnRpHLMdPaQGY4REP9SswYSc
	 4kZHI1a0NhW4ZghvcFMFju8o2Je+cEheJE9kStGpRmmSpcZO723o4FqGKNrxSvOqSupV7
	 vYbrxKAVKYw4a6b3M7CpRobeMxlX3yCTMtLL9371sqHY2hWAZerEC0PEeYRlDGMDRXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D0SkzBCp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JKM+lQbB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD18606A320
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:23:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBD18606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D0SkzBCp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JKM+lQbB
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe3nU432370
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:23:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LCLGT3dGFbYN1moOX5comzCH
	ld4bgy4ncy8r17Egy90=; b=D0SkzBCpnj/p7gIAvgZJWNa4gx96i7m/IaIl34+6
	nDvIVb8O3g28rqcitQCqrjNmvK59YLW3XT+Ivs5gdufNBdyPjIY5MabwR0Aq6PD6
	holb2bkwxif4Dd9qfkphphkYORji9BV0SqQtgsHLXMWe4Phrva4ojg/8F3ID5ix/
	cBm/7O3asPnPiSK8qlzi8ieX40a8E3hbbePq2dmSqKipyetD626oUAQVZlkDSSqh
	JHTwN/1R5LsSS+KViD//rA4rNxhY2QkuUlVlPiysTD23Ht8X5nGRuXJMXvV684aR
	LsM0yBjh5rQvV8LJCMTky6aUAwMuFiLr07/1CARLgyfXww==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54kh04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:23:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cbf2fd504so769468785a.2
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100201; x=1793705001; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LCLGT3dGFbYN1moOX5comzCHld4bgy4ncy8r17Egy90=;
        b=JKM+lQbBCMimTyITmAUUODC+CuPTHnQv4ze7SP1UbEt0dzJHp6UquHwCaxDeAuI8TE
         VMiIxphUvpTsbfQBXrh4I+xFpKwxgOl4ZniJ4hYQt6AaTqijDIsp142mjbVtwZSYTnEP
         AZyDtDg5Z4YWuhpbnGpxB5okhnoVqvUs/DlQhL8iD1qmJZ+ka5VoJzOUQ1eNEA4b5SMK
         t3sfownP24/dID9mOn73avgDWSsKhMS3aJATmb1vycdO5QCC4/ZMwK29b/BlgOmCbKas
         lmnOdbR1O4rUJsbOSedQSRlnn+0upLOHMzl1tqV8A6tL1+lcfqH/4/6xLGqN5KSuPHX3
         SSZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100201; x=1793705001;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LCLGT3dGFbYN1moOX5comzCHld4bgy4ncy8r17Egy90=;
        b=QPiPon4ZaEi7rLmVAn2gHDMz8bDiTvKjFB++o0JYtPXl3aMwooJk+ed6espkgmf5X5
         hErfNb270RIKCIA+kUEQc8SvZd1cpkfQAGapVTgxN4y0CmJuXghRWF0B2oFoZqhUDDM6
         qhWFWAFzw2Skl+xxJqNRvsJpJg1Z53Xo+XxOUCVtxKep6vn8Lmplf0MGeLg9TnJY6hlt
         qKBBvF9BRpwO4ZI5SkqXDAk0ChCiAqyn1/E3rfdb/7m0mBwj+vSUfDmKDedjB9RZ3l65
         gNLe4ATVagvYqi0/hZ5T7jIC+8uD1zYInMP9S1+niEBtCdlJbhQwBy97E6vc1bUsm+Ud
         Hkyw==
X-Forwarded-Encrypted: i=1; AKwUvBx+vWJq1BJ/M3qz5c8lW8CyWD7JWnTu+lu7nlhKbcgLc+2ybDnnRwLmn376UsA0KEZ2WDixTOWC6jx9@vger.kernel.org
X-Gm-Message-State: AFq9FYILoXej8sN/SNdIGAy6d9mn30VwJlbm/Mb852x/4CuMY7wm77/w
	OxOoE2b9QsTvYOpbIzzCuATKQ4YTquuYyV4yXfVj6pT+tj9bPdr4InQV3OFbF83708qJ9bEnQyI
	GlKq581YG92RgOe559RkSnzWoT7lPlR8pQpu0jeBT/V3hS7CM2GsvQdXFTC6INvW3
X-Gm-Gg: AYBFou2dOb0geummhFcehXFsjDCCjWyg+mQl/0ptMkgmyZQ54OapDkliaTtfV4LUV/S
	5fHFHWLis0q6w0C78LktxxqkN3GjpXKWIV2AwR97bXXSCzL1DHglseZZ1LM0SWHF6+MEigAR1ZS
	0bCwDCZz1mEmprSnSEfwOLoH2Z4JwaNTOhLriMLNEW3U37oSjoDP4iPO+EtQBHVTjtdwkUhmaLn
	ORT/Zte+8FF1WNwg3bDT34qT7BHUAFwCOYsoFTOOCFOh1NeAiu2iztLFor5+OxRs5esR3rLE6Dc
	Cbbp/K79tQ+a9sQtZyeh4JaTP+HfYh2DtmdTQlOgLtQSvJvHKx+s4Rb1vpdaIyLSTlHo/OZwdD1
	tt3qM2ask4v9yPLoNmCcojsX+D9//X7nNk8XaxnhsBPR1vkc6H7gZPlAXanmdAkmBGQ==
X-Received: by 2002:a05:620a:198b:b0:914:afc1:c66d with SMTP id af79cd13be357-940ef7b5363mr1437220085a.11.1793100200663;
        Tue, 27 Oct 2026 04:23:20 -0700 (PDT)
X-Received: by 2002:a05:620a:198b:b0:914:afc1:c66d with SMTP id af79cd13be357-940ef7b5363mr1437216385a.11.1793100200094;
        Tue, 27 Oct 2026 04:23:20 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359f59750sm175048735e9.0.2026.10.27.04.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:23:18 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:23:16 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Robert Marko <robimarko@gmail.com>
Cc: andersson@kernel.org, abelvesa@kernel.org, sboyd@kernel.org,
        bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, ansuelsmth@gmail.com, john@phrozen.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: ipq8074: Add CMN PLL
Message-ID: <xzlcs4jdxvndta2lmbnofb4dvekkbea3gaodqxjomn6o7ibjif@lakwxrxx2is7>
References: <20261026120920.1667982-1-robimarko@gmail.com>
 <20261026120920.1667982-4-robimarko@gmail.com>
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
In-Reply-To: <20261026120920.1667982-4-robimarko@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfXzLy85RbEly20
 3s5GPRTmOEqxg1iQaKTK1SlV3p3FECzGmUt1jrndR6N0NtT+F2uTspGJHi/lnKGSxCjo6eUF13d
 qdB7EUTtbTvtghbvs6mmTGAxVO8UAOc=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae089a9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=w-uRcYzalQcvdjeGYpgA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: I2tEIHZ9_nEnBwJqoyieYELbGLKn77b-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfXzoi7QO7tgz3M
 X/ECinyA7OJaHxkMDbW9+hbVitF4LAjzhrOL7b45cz2IeDgE2XK9e3/EbNnXsfreg1ihLK8YqAM
 3Ep0YU239w35D0A1yPaLzQryrWoGiwg3V5Ag/IrAvriryMzHuwzMZOsZj/LN9lFMcegLsle9Rnb
 Q6fV8LmeWbKRqWbKOEH0UsaC1/0Rsk3obKZIE2afslX+ep+q6UaNKRy/nARlhtZez9wvTe3uSb1
 dMMiTI39Za4bGwlK4xdn5G51T9QqIYUkf3RiiQZUa7ELS/tVCzYfj945MxZs133DYtsDM88ruR9
 emXfUH4I/97lIfIDarkFqOBxIMA36t4G7d4VvBVlDgVk5KEtzIVLBFdSNPbniJpN+HGGOeSi2pV
 fdOyWvM7SFTisyUaazTpv8xlzbfIVzIXObOj2d5vYSNc3DCZrO/9Eg1C5/yX2NmYjE98gYpkE+4
 HcNWfYZTy/YNeW9StNA==
X-Proofpoint-GUID: I2tEIHZ9_nEnBwJqoyieYELbGLKn77b-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270045

On 26-10-26 13:08:15, Robert Marko wrote:
> Add the CMN PLL node, it will be used to feed the required fixed clocks
> to networking subsystem.
> 
> CMN PLL provides bias_pll_cc and bias_pll_nss_noc to GCC.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
