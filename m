Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741A0392812
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 11:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780830853; cv=none; b=GwPhp3Dj7HYQX3BnlQP3IbRMVmcT3o8WDToGYFep7p/Zx449GqZ6keVUkFpkp30HA7cht7tXXb4bl3WfMNZ6HTLEKwWT0QsDBPCC5AfKQBr6FkAPanHqJFThyfiPYApUBo4aC08+CHX9FxL1rbXl3sbwUbr3gAERsgnsnPWJkAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780830853; c=relaxed/simple;
	bh=tatUkRj4auylcvYyTVjxHb2Cw6OFRC/tWD5EnSob0tI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LxmvoXM7jGYmlvtgbQgyHJaCx8mnuHT8MVCIdJf8xNdW3ZtoGL/VaS4fENm3YfPZzMZRuCDPa6dTzUmndVUjC5r5xhT83XsWWx9laLQf77d+S3qzLuv3EkxMthnHiqAhnZLccBt7W5MFXgY+iGzFOrzMdhdeFY4XPlNo/6RnkIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iApERzyB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YevOb6kb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iApERzyB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YevOb6kb"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657B223r436981
	for <devicetree@vger.kernel.org>; Sun, 7 Jun 2026 11:14:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aJO9etTBOYC++2dAgDEzVc6s
	yWfJFm9JygEBA7DeP+Q=; b=iApERzyBI8qpzo/eOBW/52yCArqW5aPKvmgjiuWP
	Ez2TZCnyIcNszb6f3UMk455kzmRUoR3yNLS2bCGjHO4ksh8MRmzOWbmQqvk5YYH/
	7mywJ6QL2AEN/t6hOC8sX+nNE9qdaJvxwMEeaG9Nxa+HKJIB1046FLkxbXCeb+jx
	GmSh85BXv7xbhqaeXeqls9s2nae2DTxWWe6rbzb36KmaFGgc/nSDyp8WcKwjcShh
	fL6meb7AzMuT4UpyPqBdJcAlQdwYSs8JSA+dhw1iD3JI2pBzBTt4QIWtuCZqTGo6
	U2yXcjkKUXwiWm6DDrjohcjH0T/QiONexEGPfSTRpHqs2w==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emaj4uy48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 11:14:09 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ab02fb4f39so2231819e0c.1
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 04:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780830848; x=1781435648; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aJO9etTBOYC++2dAgDEzVc6syWfJFm9JygEBA7DeP+Q=;
        b=YevOb6kbDVF3XqaoW3+/PSDp7LVF/K2aOZkuV3Be8HnhSJVEVGWggFTHmuJnaAsdar
         2aeKpFRHwlzivJMNB4SeUDtQp9nJHsCH6pJrwBkGSHGRCMqLjSNzF3e4KihI59Wc1HCq
         iDB20b4OGzPyLY8Oyv/n4jOsp4zfecXNT6/zqbcwImeXTuwXXygp/CTYe3MiUN8hjkuU
         GpvVZQqquK8SCIElGI+9HG/e/DlnJuOeq5bqIuh1LomwROV5a6HVub0X/uYV3sDjs7Fq
         GVlLRY005wgWzhadDuNvQs6xibCSGc9IAAieMMU7/d7vFTEFhARn5/aCErhTn5W3rngS
         Eo1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780830848; x=1781435648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aJO9etTBOYC++2dAgDEzVc6syWfJFm9JygEBA7DeP+Q=;
        b=EOm7O/nahgkWhocaOP4e0eTyNoGRWP9z2g3nsbtyZUip8JPxdT7TfRQernhtExvh4t
         ZZweM/z/WpPMcpuOv5L5GKO43rZ1UiDDMQB3InK+1KpuOlWevxaHM8b1AAMPSHsgClQY
         OXNd7GCHa5s3oyHs/o2PYdKY3Yk2VhxEoJjrrWPjENtZvtfH3jPtSFajIXVppQ6VCUFh
         2cLXCBqxq/DqgrevUqlulV0nBxI6MJNU55ToKSLMziNMcLpenmjRNrbivbEO7Zz5jolF
         d1UWddgRSYEkkxxdfzobNqIodWrJ7eocMs7Z+F3I5Mx/yAWnBM/egMPMzwN2BsPCcTpv
         HcuQ==
X-Forwarded-Encrypted: i=1; AFNElJ9tjkf+lxlOB94MZ1joDS4OH5R3fj6wyllyzW+SAOg5TgRlN7yp5ViSUq60BEVGTGTQXP7OU1o8NXYs@vger.kernel.org
X-Gm-Message-State: AOJu0YxNFrWOcvfgZvviwbF2cPBOnGPegVY2x+MXyb0hloaLqjeaLFRP
	vv9LLo6CGlu6s/iV9nE2wtCAxcwBqQC0ClnJwBXFDuDAEBr26lAg7ITX1f6fGB8I8zfZIkTlxh2
	2K2ySJfUGN4FagSKI2OB/bUIlgZ8BLjgNLvBiSIRIp7N8EZ4LX6nwFX2wU5ZG6Cw4
X-Gm-Gg: Acq92OGFJbGPP3YIWlr6aLG1Y6MCvIPVwYWaGf9fU+L84CT8IYOnmQQLQdwBUdv+xel
	vHjpas8HTqhDMakRUHui7QIQ3fm8lZN4clRB8CkmGu0nl2O6CcJpQ0xBkKXhq/E+5P3V4yYVzlA
	RSJhmA60iYNL9Z/+owMMe/z3ocebntamFEWsDwdFUJr2KKL5tSljJxGL3fwwZVFVTJ/mYw9mIyw
	NSIxCKrNwPZVevjNPT++JhUH4HPq1X6dLnOd8nIRxbhJz+y9u2upwkuNtGJYafXfh9T5x+48kuL
	0veO9XF6XEWdHq6y6VhKVBvR3fhhE53s1R70zTTwyuLLnw4mTFcpd6zWuKYemrn+ijtvcfBw74c
	ymZaE3NC2Ku9tpVqehLt9zFN2iqJtHzHZIv9hcgwto9bv4D4XE9HBLdBu9XYmthRHIKrcrDcgjc
	CxO7QPUyWWEONU3RuHBoMStCtCP8Wg9hgIFf1zrlITPCvtJQ==
X-Received: by 2002:a05:6102:80a4:b0:6ac:c0ab:5dc7 with SMTP id ada2fe7eead31-6ff0294a35dmr4874424137.5.1780830848575;
        Sun, 07 Jun 2026 04:14:08 -0700 (PDT)
X-Received: by 2002:a05:6102:80a4:b0:6ac:c0ab:5dc7 with SMTP id ada2fe7eead31-6ff0294a35dmr4874412137.5.1780830848080;
        Sun, 07 Jun 2026 04:14:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d6282sm37473621fa.30.2026.06.07.04.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 04:14:05 -0700 (PDT)
Date: Sun, 7 Jun 2026 14:14:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: webgeek1234@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Teguh Sobirin <teguh@sobir.in>
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Add UART15
Message-ID: <db5b3fujjjrvrvjlrc7xwxozr6xkpveo6fc6ug2gl4wgugljqa@sfhjj3spy6qm>
References: <20260605-sm8750-uart15-v1-1-93e660722e61@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605-sm8750-uart15-v1-1-93e660722e61@gmail.com>
X-Proofpoint-ORIG-GUID: 1T4t6vV68BsmHB613BBID8tuKIu0zFJj
X-Proofpoint-GUID: 1T4t6vV68BsmHB613BBID8tuKIu0zFJj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDEwOSBTYWx0ZWRfX+ZyyniDLZVCa
 cPvMztUjL88R6khYOZsDUwtgkx46YpG7KgGS97cbR+paC3csvrIY/EJR6B55gxLaGUr5iJ0yYdX
 QixP7W/JoeIT/QSbsZaoGWdKGBAHno/WesnWHI39U9FLBC+pdBx+5PliSNT/UR6uWtCoN0EEKgj
 4O+JtI1c7r7gFRu6FJEnlkU8RiB/9KJFFO67v0h/uP8cK+TBOkdUGCNMI05/kq1vg+LziGZTS4V
 pOFWquburuu86EdD9GPRD4jit0zsl6HjiSq0+h7IANsPhKWGTl708JSl2tAg30mOPWvwCbLRAi2
 i8/bYEgGKkc5OzhiztnrCl69BluQ8+W4atsSjmNdBx72TEkUKl56Wz1MNFmzvT1XTaHCQdlZx7p
 lb2+29+75P3mGE4WUL8thX0/pExqLp1ZAul3O6KvgQBkGR3BGAnzOXrqcJQ9GBmxkcA/AcKdyRO
 SInvf616pNnJvP+c0wA==
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a255281 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=h4QezvlwQ886wjDLtIIA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070109

On Fri, Jun 05, 2026 at 05:49:39PM -0500, Aaron Kling via B4 Relay wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> Add uart15 node for the UART bus present on the sm8750 SoC.
> 
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> arm64: dts: qcom: sm8750: Add UART15
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
