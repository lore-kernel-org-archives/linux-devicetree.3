Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825DB2116F4
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 00:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783123310; cv=none; b=Ymbsc2t+Wvu3/Y035TWNg7vNpNkrljKkRFRVZfQ8Aq9XJEyEIqFijlO2v94mH7iBZE9h//a0luw5K8d/bczyFWLosiCaaykL5+I2PSoEZCGJvp0MHoO6jHM0Aq5GpLL7TJK4tHDgFeFNlwO+ts/6iWlft2C+6i/AdAseJv4L2K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783123310; c=relaxed/simple;
	bh=1hgoD/IDOXH1vzUGVqFb9ZBGpf0yUjB+5Uh0JCZ+/8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWJdKDf+DnIiI+HWCZEi4on8yEJWyDDSbSkQZqKyd69VdK8tETvoHLG+GLl2YrKhD0pvsSyPuA4grjlrE8ThGBp0DOXsx6TljYxKoyw3J8NINYmAAWdRadXcvGup4hKURcguV5pjwDknHg+A1Eaqgi9GOZsF5Uq2QypwY5TgoS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aj6tkJ+C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MhWs8x7c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aj6tkJ+C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MhWs8x7c"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPabN972994
	for <devicetree@vger.kernel.org>; Sat, 4 Jul 2026 00:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QQ1NaaNFJ8PFY1ShSI3u30+m
	GGXt3cQTpsIVBKABYcI=; b=aj6tkJ+CnAjtbiEG0jLWSCJIEr4rGF/Ci31o3vUn
	Uofvyifup3YZQRvJrqne9nmT808Rflu7GZNkXZrQvlJ2eOTtcBQrpUB3oicCeW1k
	oDGoM5gFRrbipWzQZKzGJlQAcrtPA3HLTcII1ltpH9f8CUMJUxlmzqW/TjupySfo
	toiYOkAqvwQv0XQN6H/uz5hs1Qqq9BgKl9wtGXMkv4sJOfoaGwZ157lsKvGjQ3Ok
	k9JezHXtJC7TXQAmDE0fgNiNlCnb0sPXKR7tj52NeDExI7FamL/nYWXcEzbRSHe6
	iGhSZSpVlhgim9AL5d8EJWhcFIUQ1Oo73j/EMDJp3/NEYA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6b03ah6s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 00:01:43 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5bbd3241499so643055e0c.3
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 17:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783123303; x=1783728103; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QQ1NaaNFJ8PFY1ShSI3u30+mGGXt3cQTpsIVBKABYcI=;
        b=MhWs8x7cLODN6ulr3fy/WAzHGdPJU9KSPxMSlYoX7RKlMcLseSrcgqUtaw+KN5R7He
         bPenfWkzO1TUkmKNNCQM/rlkXHYE2S8CgtGQCbXPxdH5038ChWKhkOr26kWwzpthtv4Y
         CMnFugMe1+WDK0T4A8fGSU3dwTZApaFXauM4rbnXu9ZtdTAHoncXDUGwJD0CugFqetEB
         Utgx41LI33Co+EjcJsp/3FdiEv4ZfyNdNryfuN0EPlGIJfbqyRq0KUo3wCFcohVPY1cQ
         AHguyQkMJl8/uY23wUDMU00Nvq8PsdMUR0SylsBi04H1Yf+5PpIna9GYOAgsf0EQqKyX
         zrSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783123303; x=1783728103;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QQ1NaaNFJ8PFY1ShSI3u30+mGGXt3cQTpsIVBKABYcI=;
        b=EW/r+Qo9gfjinVVTBmFicCZ6eQfJSBqBoIiD4TX6xWhF/QNio+hUFIsiHu59GtTu3U
         E8xcylyMATy0tnERE32CDVHPdfk+cU4jpcdjfEcjNeh0wmmI4weW/sfmwJ9zHZd70TqD
         F4TeoRbMqvHOu6TpcTWdg5vR9ypcRRuYajH0Dv/WkpXWpFWDOk19enRlJHP4L8vC+xjO
         AxjYx/gm/So8KgE8luZx5A+FLcW0G1J9o3oDWZTeyhXJIZgjozPdvLeU9Uk+bArqWSw6
         HpiBsm5GI6Hkw/7RJw5exovyeD7+WvvNvRztayddhtxPHyh3n5Y0HCt7w72ipLtKlJmp
         nMRg==
X-Forwarded-Encrypted: i=1; AHgh+RqO+bevA1U9geus9cnkCrCdvOcOxEVLp2VTW/v9W0o400vG4VcbwMRLP6p44Z3PJcFLGziRlsNByaWQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5i4//r1UmBv2OmRWvx6PbQBKdq1w7+p/18b04HUKKAocJ3brb
	GaKUW2eRY8I9W8iCjGqMu+ZwD88Sw9FjA2c8C0rcOWPYlbmFm/sHinGWnqKYPKI7DmEe40L/bLt
	PKlSj8S7iQKvmtGzMWH+8t5v/p/vAsS/2zkSHCK9wrDVeqiot17DJNuWhUp6UMrJd
X-Gm-Gg: AfdE7cm8GKMVS5ROkU6pSZGw0S1+q5vaNwrMQueF4+wafXCCwhGx7vjBgKlGSEsAWRN
	r1Y2LLYRPtC6+hEEDKgQnJFZgpmNbAkCDaYAV/0bVC87op2mjNpr0eal/e5BxnqgoGNoq5zaOeK
	oJw+DuduXbU5jirvj9iNTbpNDoAIYvJX5zb9oiE8J5gN5eKn5QtmhSvsjXG/uYqZpsluyx+WSfp
	wiKxIyjFaER8oPSFJSs6gUJnphJAVvbLvvm/elS5c+3bjQ2F0vxFwUSmH8SE1yGzdw2DYTRiaUD
	EGKRR5w7M3wstmoX65Eo3HuPmjImo+wgM2MXpwpkzHk8Ia8HVkzHvyparI3GXli8GLFkP4rrewf
	0/s6gnFAq5nV4mAtGFMA2umZcD+T8DLlYoXcgTAv2H+izNFqVUFFsHBrhVNoI1ij1Ch9H8iWwHJ
	2bD4u4x3v3d5YLillgqgQfjFZL
X-Received: by 2002:a05:6122:d15:b0:5bd:fc20:1fc3 with SMTP id 71dfb90a1353d-5be101c9647mr651881e0c.4.1783123302825;
        Fri, 03 Jul 2026 17:01:42 -0700 (PDT)
X-Received: by 2002:a05:6122:d15:b0:5bd:fc20:1fc3 with SMTP id 71dfb90a1353d-5be101c9647mr651766e0c.4.1783123302203;
        Fri, 03 Jul 2026 17:01:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb7dbsm854661e87.45.2026.07.03.17.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 17:01:39 -0700 (PDT)
Date: Sat, 4 Jul 2026 03:01:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/9] dt-bindings: soc: qcom: eud: Add per-path child
 nodes for UTMI routing
Message-ID: <ur3haudwnsvg2vpdwrsea5ik665xxafsuz3iznvjctw6algz2i@amy37zfoumoe>
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
 <20260501170635.2641748-2-elson.serrao@oss.qualcomm.com>
 <20260703-manipulative-mauve-centipede-f8c95e@quoll>
 <2105eecd-b2e1-48b0-9795-ddffa8e43937@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2105eecd-b2e1-48b0-9795-ddffa8e43937@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDI0MyBTYWx0ZWRfXzabOIgIKuzBy
 nINXLzt0NHFNl9dcrtWPqJK8/nWjY+2j/D5q3TWojXnvdr0cGTwZzeju2fTwwDD3HTEzjSgl9UT
 y6C1TKemjHUVGxRsulmrStPbY8iygSw=
X-Proofpoint-GUID: iMpBxos3lK50uNxCEcKyans0-CaqFAqC
X-Authority-Analysis: v=2.4 cv=FoY1OWrq c=1 sm=1 tr=0 ts=6a484d67 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=mYtunGRVIO_ZSpXlA2wA:9
 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDI0MyBTYWx0ZWRfX8SYovc50atMu
 8kftN68o7L7AAI5KD9+RzozyPzkBzma7xGjCWtpgjvHh8tvi0VK9+aNNOnh/X7WlJi7Ry4h6Qil
 c6l7ytIETDSJp8gNPSDSk3vqNpGv8Jglj9ELMQD4VeHdrJUM3I1K03M8r+So5yUz/FbPvZnyQIW
 xnb8dwMeqr+CAOXithXXKrejXQS6iG7DILpUd1IEYg9bEFpvpvH8fTeLQNpwlzP+DxsT9I2r6Td
 pgjR4K5FZebwY+JitcEASWAa1TycgijMNiYglR0eulvkHgCcq2Kwym6YDJ/7vGHsPeO8G0M538Y
 ARYvQXPsQEgjRxcqkI7WdV/y9kRLoNc+Gzxx7F/RB+MIOM5r5nROLlK0fQu+DxTnV3q/h1JKlYR
 qQ7JkzMq6y0L2fBefg7q2TWJb6fzTcjw2ucv4RjOXhuREM+C6g3tX3u/6LYGcChiPkX7IAaUSU5
 PLtXdR75W2mlrYBiAQg==
X-Proofpoint-ORIG-GUID: iMpBxos3lK50uNxCEcKyans0-CaqFAqC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030243

On Fri, Jul 03, 2026 at 10:56:19AM +0200, Konrad Dybcio wrote:
> On 7/3/26 9:45 AM, Krzysztof Kozlowski wrote:
> > On Fri, May 01, 2026 at 10:06:27AM -0700, Elson Serrao wrote:
> >> The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
> >> independent High-Speed UTMI paths, depending on the SoC configuration.
> >> Each path is distinct, with its own connector/controller connection
> >> and role-dependent UTMI routing.
> > 
> > You miss SoC specific compatibles in the patch. Binding describes ONLY
> > SC7280 but you claim here it depends on SoC (not sure what is a
> > "configuration" of a SoC).
> 
> The hardware configuration - some (older) SoCs don't support muxing
> to another port. The binding only says 7280 today, but after some
> version of this series lands, we'll wire it up on basically
> everything that came out in the past 10 years

Yes, but I'd also prefer to see exact words / platforms / references
rather than vague "depending on the SoC configuration".

-- 
With best wishes
Dmitry
