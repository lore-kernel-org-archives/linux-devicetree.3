Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9E84266B9
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691078; cv=none; b=dkV9Vw3KX6R5Imi7IvuUgHvaqWN6l9O77Jaxci2Lv3WSHdXZPZQl5AJ2GsBcoUSNpaTqRfyfU5R2OgOUFddPIG/qjouFO+1EwQfAMe0D0DBeI1D4qf65MUIb7Vka5Z8uQhKqkEBJ6MbOOsy4S85pLNsDsJQiT4xwo3xNnaPpKn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691078; c=relaxed/simple;
	bh=0mz3qJv0BDahOMHl4Qms0ZQnz0C2OdkzNWbTMJy9x1s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KdebjbEK8Bn2PFfPVxi8pH9xOPml9fWDP/yXC04EMAgIYj638TPWsAOfvYOsLWlEsJqriFbl5uKTINP4fW0HmHIkmsL2kb1lAcDFLfcFBymsaNnrFbpzk8GBhsARtD47zKOxNeTIwJHt2I/nZaClMCgYCpQ0fg8OkkNlumZBomQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bo2UR+/H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iC7oRyNS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bo2UR+/H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iC7oRyNS"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD6pC1919362
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BajnQZ9UnlDgGNW46b/qmQ3nKKqo2dqOPhzq4QZBTBo=; b=bo2UR+/HPVjPOrD/
	fSVhw+Lz0XugpoOGYKugMdE89cXqjG49tK76ooDKuCz+kHyV7g18+NJdeHDGzP6d
	PTLTVKe4+vbIaTyzNbfISQsX3wrHehOlnxqMoMwCvETKwr8GgAn5J0c2Shj291Mx
	AnZ9H2dDDeUF8saWiDNqay/vCdZrPV2ioZEPN1v2q7RrUj8G7QNG2bkmStpL9la0
	Ft2PjJdPSSF2FgGSqqyyojeCLvKDC1VdAZDuQnc0Yp1JT8b+AxIs+VAunY5lKkgz
	6I59jdEsrRCnVl3cWBhOuW7zjbt/+ZnlvPu1Da0FJvKNgy1Zyk3wKYYXevd22vJJ
	xnop8w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fas6n23e2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:44:36 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ee7cd05e18so2454456d6.0
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783691075; x=1784295875; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BajnQZ9UnlDgGNW46b/qmQ3nKKqo2dqOPhzq4QZBTBo=;
        b=iC7oRyNSB04xyN2lusIc1uSxgNo07FlvQhOCChvl6gB624r4xGb84vq0i0zA64ZIeD
         Si66Vidg5zmBB4mCcwqwvbcGKTiRNOOX08/PW4zdLpPux6YXseXwsLTdN93Jm4kDaX1M
         LKtpuToulJZqC2k2SBybZRoEGwvIzFc/BHraeKrE2Il1UtPBamNND487YH3bIPaTWpx0
         tHXEOAqYUVEi/lQ+kYhQtMmlI99JAyZzWJALI1+Auem8qMco1IsjXFQYDy7F5RxRhFPA
         EF+imCMolEuK5xBouDn8oHER2ywBf3SsyigH8+ezH446UCp3M7HUt5fOZKN6h23b0I5I
         liaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691075; x=1784295875;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BajnQZ9UnlDgGNW46b/qmQ3nKKqo2dqOPhzq4QZBTBo=;
        b=i23o7BSGOrbz9ftscTlW3qP2YqJjYCYjIIWGuHesbfnz925sO/fOTV6Vji2NZBRR3u
         8SdnvHSAgfwChFaB1Lgm00rx/OD/t/ISk2z3Ovkl4m+kJKIBJXTVcLxfcs939CV/BE27
         5VTPhm0wqbBFUK1DhWYDBSgBwt+GXglMG+7umf2CoU0rT5OaJVTm7rPXPOqlndR1plly
         NiKkhJrO2yGDVd0ptaJG7j2Y8AoF5DF5Y3h6dbTKnFE4NyFgdUtj+SKLG+cI5bXEfChq
         WprxXE9zWH/Lkt03NMnz3BCjBEOZTiuJLcF1375lff9HqMAz0whagDVKPQs5jOKrSJpC
         3l+w==
X-Forwarded-Encrypted: i=1; AHgh+RogijkS4/1memATDrVn+Optlaf7sjemTKPOIMEghuSyqOxDw5uGRhG0EWmdIlfBRLAq/BASubHWVDyw@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1cXWz7QAkq46lZt16Mkts5n693oXHMh/fJMVzfPfQc7PM9tTJ
	cZC2NYIXH9o2RN177qONNXcxEGV+XeflKQ2EyOHaj8gPf/LX2Ndkq08cX4pqYmUlyLEei3AYGMs
	a8adf20pyhq+9RORNxGpWYiqCre/1BNtjixP8lL2UdLrbPEzd6wrrOkACBPj1f/tI
X-Gm-Gg: AfdE7cl+etEteJFyDruyvcBPI+p4v2JGAnCycnbS9W1cGbLtMuDSpby3us3Sxx4RA1j
	ejnO01H3Pw44J4+AfuJ1uR+BsrWPz5+EeQTTMkjINgbPgO7Grsr6m0j82/dftwXL10JjDnHy2np
	b+OxsukWm7T4srgC65ux2Ouq8Mt8sIw6YnsNRaXPOHctG7RC9eRPEQmLtsG34kQeW6hou/pzFaq
	gON9F0a7A6m3ibuGNu8sZ5jRLTY4zpnC3vxqggAlifcOw2SZBu3jdFCkE60v0LaGWDrbTnb1lMh
	1M/YEkaY9ecrLaKVDqCLD8qxtUOmQz6ErGWhgJoCBSH4S0UoXIvKkaDIGg1MeLWohc/bvXEFVIx
	pZzq1OgtLWaKrT4STSwPx2Zkiqy8cqPtEoQM=
X-Received: by 2002:a05:6214:1d0c:b0:8fd:80cc:e9ad with SMTP id 6a1803df08f44-8fec7355228mr108739686d6.6.1783691075641;
        Fri, 10 Jul 2026 06:44:35 -0700 (PDT)
X-Received: by 2002:a05:6214:1d0c:b0:8fd:80cc:e9ad with SMTP id 6a1803df08f44-8fec7355228mr108739326d6.6.1783691074996;
        Fri, 10 Jul 2026 06:44:34 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69acd3e06d6sm3254661a12.26.2026.07.10.06.44.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 06:44:33 -0700 (PDT)
Message-ID: <bf766035-54fa-4e98-8abe-22cf0a229ffa@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:44:29 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: milos: add OSM L3 node
To: Luca Weiss <luca.weiss@fairphone.com>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260710-milos-cpu-opp-v1-0-ae7f4b09bc77@fairphone.com>
 <20260710-milos-cpu-opp-v1-2-ae7f4b09bc77@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260710-milos-cpu-opp-v1-2-ae7f4b09bc77@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNiBTYWx0ZWRfX8xUmsaYixmAK
 OA23RcAUsAUG0ytdtbBHWH12Oi9QoZJS3maRgMilC3iIoJ9oxr6FMVTNK0GU9QKSsGBuiYyK5ln
 0Rgyr/ThhiwUqY1n0TDQuYDEn/tjwzI=
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a50f744 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=6H0WHjuAAAAA:8 a=75QiWgRGdHY30H_rKSEA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: AE2C-DBKmciAI_57zwOmGSAHpQXY26Mv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNiBTYWx0ZWRfX+wRZMAgJ16HR
 sas7QQJK1cFMcj5KBgXC97W4SNyfzZKQa5PLpyihdW8vftRiw273HbV9iffI+RheCt54jspL4R6
 +71eEsd9Gv0PF6ohQeelk5ubG1LK0HKWcxraYsYMGkGA4W1wCRH0CW4+9vJLO2gwo9NNuK6jDEM
 T3tztRGgaxLp63+CfRo6Tc2pmWOjsSKjX8Cew1S/858Ezv51S15S/9HzA+lypDiEaZV3PZOaBp+
 DuKqVQjrx9HZwXs7kxgvVc9R/C7dUvW/gNs16KuqhnMcgfZe/t8Mm/bMQ8kk3XTWqQrcStx39Bn
 8zDtNCsg1SbhgVt25+qlSBaOyct0pg/++ZcNZvF1yvUdZ6ygqwP3lCfDDeKEC/CQqr5cfiHc2V9
 D3XCH8AhnkjaDEagwDNdtQblWP/COl7mx3MN93B/hncmrTgQ3xPyUjM+M5SSS3Wu7PBtjAoA+qH
 bFVVsjwgNOYw70gCJ0w==
X-Proofpoint-GUID: AE2C-DBKmciAI_57zwOmGSAHpQXY26Mv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100136

On 7/10/26 11:22 AM, Luca Weiss wrote:
> Add the OSC L3 Cache controller node.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

I'd suggest to squash this series into 1 big patch, without patch
3 applied the OSM driver will engage and perform sync_state (with
0 requests, so it will vote for 0/lowest) and the system
performance will be tragic

Konrad
