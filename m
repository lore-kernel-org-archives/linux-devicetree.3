Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789568;
	b=SMgEMYcKEZzgmhiTWjHSqfrl4GhX2qeylyztzo8d3IoLYUYowCTtMSi4bEx+P+w5K23i
	 oC0V/+WaW8b5NInxGfb61GfDHt4kE95AIHrouKdtNb1+hAVRTrr6EcORHo9KydEYcC7X7
	 Vxe2LDprZ7Nsl9fhSJgiONa64Y5RdoyGx2ko7QyOn65LAzpZpc61zCfZbCealcULR3GD7
	 Ppgv5EWDijJFJgINAW3qVCfxASIeMWK6Q3u1GLP6tP/WtG75rXurOm59MqTPu7QO26n51
	 9bizgUB11XkPOS5DvXSSuQMq/zld3f0EXVIADxp5TbrOcKtYAnp/WouWidCRuSMfhhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789568;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HzYuLhRqqKaW9hEOxxw+GIHo1wvo7VBlYnFTmaywNh8=;
	b=FAfj1Abpo+0v9OSXOaBb7GlhetZ81ecYdkjq939uMK84Idg1xgKFHIWOuFMDfQoIlocb
	 fgTZqp4f9bx5HGp2pfnaBERF8t6YGMKdM3uulvlvwNBFb/O2bZHMVQwO/gZrIcvrmmpQE
	 GHzSiHWFkwOhaSFm7jZBSmbvP1nHIHnDCjQz6lFVMGXwIRfR46FiZs2a7+69DPeiXDE65
	 Lins8O8+m9FhGLWEaP2xOZRUIhTFlhuL8xShzya2KOMYfYR60meDbKpkkGDIZdP6e2bbP
	 Rrq4t3nlplCEpW5580LOoGFifVY6Zmhii79sRXiR8BvjrWBDvW9H8j8BrTL74cqVjfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A9OyCWOh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QXGQtXxR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F84606B431
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43F84606B431
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A9OyCWOh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QXGQtXxR
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1SOo3089753
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HzYuLhRqqKaW9hEOxxw+GIHo1wvo7VBlYnFTmaywNh8=; b=A9OyCWOhxbNrnNBj
	j9QsIzGlTvvelZiXk7G6sfyIvotoJBnaRafsAYfleP3VDnfNZGyaBLOxdBoosuqo
	DhQYJN3Rm+ndD4lKkmMPEBqJpR7TQJUHfNFuRk8MChz3U9QSbjZFqVXYLKXsI0iP
	3M8YDl3OgBdR88C2wpHB528xoNGuET5iDhh4XwJKqq/IlR4vX5ALLSv+AD4NtElz
	nSVJgU+Sp6iZD46sA6ee7Y+XdGgIkO625Bd18WByUVcX+LY+n8yIG+XuXx62PUtu
	F0ANFbsQ1MFTO25zz27EWezgHKYj3t0gw+pRCSEFGgu90ePH/pVXy41gwfaBikUJ
	u+wOLw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gh9rx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:26:07 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ece1a3bf7fso357855e0c.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 06:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795789566; x=1796394366; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HzYuLhRqqKaW9hEOxxw+GIHo1wvo7VBlYnFTmaywNh8=;
        b=QXGQtXxRgRfUPqPPaSa5v4NhJuVXnfedKc9zW2WBcM8D7MBIObheXgTzU1nVB5/3o4
         y0EVDV+juXL349kJMuzcipVHtgZ7hvowNlbolPdMrrh3tIKH7oXtamvVvxZQQ31QJFbT
         wO0lbyoUzJf+zeAaekHcSqqflPTOzeHB2Arn19Dh0gOCBF0TBmLFHpmAfUjnl9yJkRKd
         Hftc1tgroYfLbzp0vApqPX2f+hA+F7UlKKnW2EhQz/p/MZF+YMSJ/mWQWyCr8hiT35qR
         x16m67yddyt3gSeqNojp7cDRW0pE6mo0fH4yX8/RpyTEQ7fCQHumIDsJ8eFyV4WgzrEt
         mJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789566; x=1796394366;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HzYuLhRqqKaW9hEOxxw+GIHo1wvo7VBlYnFTmaywNh8=;
        b=0oMmYF5tuXlPKpnNzXtzFu/TCt2py+Shc5grOAuT5wa4BND2M2qIQpyrsk2yBGKr1d
         dZOCJPa3tyZW/GmDUB/JYwSPPDZ3yMi8q0F0Bo9OBiOuk4G7gNehs/MUDxHCUitH7kAv
         1PoSk+/x99pgO/0i/hzwU9X6b7TRO7Mm/azW+JBQgWTCT48isNKK8ChYOKaBBfhxGrF3
         ciBO8LAl/Xdg4ygGZnfIOQgwqnZ/CTFBBEmErw6xag0DTFGPx2OOB5QAnmgsufShzxMk
         K/UQD0qlc2gsi+cALDc3sZpmx3wSZPWnzTZP5kHoHXfFLjmd3fxUV79QKxcxOQ6OFARD
         07pQ==
X-Forwarded-Encrypted: i=1; AL+hErHYoxoP5jGMTd6DaEppUp6ttZ6+siZ7g46PpWc5/EPkRy8btdfahRYBsYC+DHeyW1Yhj1j8bduPs4jI@vger.kernel.org
X-Gm-Message-State: APuU4Z/lAY/DP4ZAUAoFj4b0GnaVK1Mt4n7pJxxIjf1ho9MK7JYga1hF
	Qu3l8jWmGpcR4ApsPoVk1hmHHpV/0WDJGEYTkfEiTTk3fJNs8rzVf+Uekr/b6C24Br0o2r1ddb/
	Q/hFdNhNs/KJ0zQ9jckNXVpF9rwRuzZlHhBCd8rZ/rJR2QObyPV+QJ+FhC9CqxhwITv2HcYfw
X-Gm-Gg: AZFdTZe/hT7/okExBxgwycukk9+PbXjTzrILp/A/83pm4OxKzGRlHGB6Ptd5d58rBmq
	scY5vc6k46XVz4RUOx4pyqsFFiZX2SPvx6x7zv3QLUsQ8U+/4ue5Mg+gwQHtLNPtIUQoU/9ICep
	KJPKCg2EjBTM5SgzWzSVlUMUOaZ1AnpYFiitrDDhIwQbAHCnk3DYxAON+EWEzIwpNyB4qRY6rRj
	RS4PCa2o55M3QoEYKAiA1MXhjemGPisyWqUMg22a1GTLwxeUqqK4al4Ob2JeiWFpZwQlgq8kFDf
	OksFkIXh4YMshCIK/PoMj49uNfa62T8CM1ytNsyXmTThe+cfA4ZE2UlREyo1YnNBqMyWn4TqMmj
	+r1h//uluvlqWVKafTJA+1qRpu9jrn1uZENj2YoZctYQQ0TQFdjHcsoj+3uymTQf5cVHQHVA=
X-Received: by 2002:a05:6122:4805:b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ee8af179f3mr17109601e0c.3.1795789566367;
        Fri, 27 Nov 2026 06:26:06 -0800 (PST)
X-Received: by 2002:a05:6122:4805:b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ee8af179f3mr17109554e0c.3.1795789565824;
        Fri, 27 Nov 2026 06:26:05 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae66053sm871434566b.19.2026.11.27.06.26.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 06:26:05 -0800 (PST)
Message-ID: <2b589a52-de75-40c3-b4ae-3960b9068cfd@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:26:03 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-lg-judyln: Drop qcom,te-source
 property
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Amir Dahan <system64fumo@tuta.io>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20261111-judyln-panel-glitch-fix-v1-1-ecee1f0a1b30@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261111-judyln-panel-glitch-fix-v1-1-ecee1f0a1b30@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX11Mk7L3Zd/eR
 YP5vaR56fOfRMaSo5Qhax9YdjG/kMOFr66ElmiM7Jk+nBoOJ89nKMZJ/jlq9Fsg+zHJ4biFnt1l
 icAm9kNwpb6LoZLHwl3tRke6S38Vadw=
X-Proofpoint-GUID: 74xR4PkMlK_69fou182VFD3TIgFHHx2z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfXwaZ4L/uy5NzD
 D4krFRt3QgXNBEGAv5JThKh5rjabE16TK9f3dEH6iQ4Box6C8WT0qTQeuClRgykqc2Ot5R+lIb4
 5iWLhukj7bdt0bSQ/Y+bDD7CI39nehQDoVPNkcIdn7c8XCih8Zog4grYOwN842BMSmTOe3wK+d5
 5GTxnilQD/7/eFPGIbTonrjv7SJiN3G2OejnrD50K5KotP7JOnsy2O9TKHD44NWcOH4uRtZdIYh
 FYXIEAP4HgEOWRCQ65/joubnbtcs4ar2tNn6NFTGhnn3mmD9qFSjqFQAB/a662F95blHjscTtSC
 9GQZpIdo45yji4MFGZxKAX+Iqz8szEjgnwnVOd7KHQmIxD7clqhYYFox94HtvyaORlg6mkZuH00
 c8LlL55UAxEmoJiHS8cW58u2lNJWUZFRSQWMVAbgLvcVH2523nw6Di7zdZl9c3JeClD+RiAEdhD
 R49rixjx/UIR/GH1vWQ==
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b0992ff cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=bCXaPUmJWq0JbFlovXgA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=tNoRWFLymzeba-QzToBc:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: 74xR4PkMlK_69fou182VFD3TIgFHHx2z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270057

On 11/12/26 12:53 AM, Paul Sajna wrote:
> It was introduced without proper verification, and causes
> graphical glitches on the display. Discovered by bisecting.
> 
> Fixes: c6c66aa3ef33 ("arm64: dts: qcom: sdm845-lg-judyln: Add display panel")
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
