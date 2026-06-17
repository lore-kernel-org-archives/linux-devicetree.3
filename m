Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542C33EF665
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781691459; cv=none; b=nF1ldSC58yOenJJo4G5+pItQdN53FhILorryUjlHQPCubk0rT+fQJcS19UjCsHzidL31UENs0SIxXI3EfvTZSz7sD3tmwhqDaA+uV/ja9JbB5T2VqQPykh8G/axx+j278L1N6gL6ooW95XvNq7PGSZVuIBFXwLyMSfizNdPrWmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781691459; c=relaxed/simple;
	bh=hh4duBEop7U0dq9PZgU0+rgHBcwdHKXSP9n2Ka7n3Iw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LicofMeEBMuh55bxHNBMRYiobry40uQxGHHbp+YlANNyDdrBlTrFWl/KPlWI+uhHW0hcEOkDjhhYHQnTTOVPuvF8vekAGW/NUrdER+LLKfXjRwA5HvwaUG4OHK0D0cVnUsrwt47VHznpXBUDcs1NA1t/54tHJZfEmLOKtXrj5jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n4iN6t94; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qi8mc0gr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n4iN6t94";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qi8mc0gr"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UEMB1735031
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:17:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	grvGHdCDgWa9nS2neYxUgkMzjZ+xFEoJZ4xYB1NH2Io=; b=n4iN6t94Eo+IuLMc
	lhnqV8n7o+7rzsafmMABIHRywks1kNOu39kFLlA0UKLjpVjCTgWuUw6oVvL3njlr
	wFdFJKAdfLmV9eVWa+jlVG4x1jUXa7fu7BWIs5k535CJLpl+uyp3+BF9peCrCnoy
	TQxNrK/i/3uI/x303bla9XyBteAToak/Fpz4zE56J7vvMbxz6tGVy3EmzcYoS2Wf
	iN70Zm1YseCwU2weeKWv6rkVsMLfIj2G4yuPONDJFSptCuenLzyCiOMWPK0uK27u
	pRX7NhIH1IfOJbNxs50UlvQZLyUZXw33GP03WCu4Tz/6PNqRY7FhDW/RTEqFQCkS
	b0OwjQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueemjmg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:17:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915ccc2d4d2so118864185a.1
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 03:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781691452; x=1782296252; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=grvGHdCDgWa9nS2neYxUgkMzjZ+xFEoJZ4xYB1NH2Io=;
        b=Qi8mc0grqIuylyK4/x2v7qYVHojs+i7KC/CeEygplxsp0UZMqWNlWw2e2IbWvJPAQ7
         iWUYhjOP1Ip/3lyRU8MP9lhkSNYTSdtSnPl45TgiteotGMWzQ79LyItGeedMENu2o4ah
         +tqncQZ0Vxe8mPA4sRm+uoyrLm91wOPjfRUbjPRciNmOeCcfZycimngLIcIpI2h5L6xP
         Q0rkYSUDRmzYJIvGCQNTFTHJ05eKQGr3fWz5IlEdW+hFaY5yYMRgRIcvCjbJPGw9mrS1
         Ry0x9VcHOh0jeMOaeOGCifTSkXbb7mwfX7nmCZDil/fNX9sBkgzvjHSKjjRAa7B9Ux22
         L4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781691452; x=1782296252;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=grvGHdCDgWa9nS2neYxUgkMzjZ+xFEoJZ4xYB1NH2Io=;
        b=g3FdQ+HN3lpBUmX3kdq3TzPHErqks6TgtEyEdWNI12kg/zUbViYwQXD8PLoqgvY5mf
         p8qUz+8aiXcNtYUB2kLvW2RaJDppymEIxf8ebto4MEJQ2cq29ZW2W13u4m9IP1pQgj6i
         aKIIgSWLYR1cQRcTJIX2gasijKwlSZyABIOVFLXvFJxDrJ/MAsFwPPNViD6q+hpD9Vt7
         Fsc2e2WGCvVa84l1sW1riozrZ2YsUTyEYwQRfGzmPXazdTojUjIV0h+UHhzJTyU9Noyj
         Ywk4bQ1AYQP4qncvfLMPi5aLPK9i5pEWpHMlOwEJY19dQLQbKdkPZWYM4LKDvQOYhUvo
         CICg==
X-Forwarded-Encrypted: i=1; AFNElJ/W8F4uGSHN5doFKfisaCjhfx3crpA5pfc1ftCSKlE7y9DH2d6oYmuv3nfk6Wm0m4zYexlOXButXFWq@vger.kernel.org
X-Gm-Message-State: AOJu0YwdNgJy58wewP+azZ7BcvStfKrH6EC+ZqTPg2elarrVn4Ysca1O
	pe6pfPLUvgZkWsRq3aH2GXKgPIBDoqTayIxsRmLV5FiHrFNab6idkfKt2+RZF2Xdt9ZOAjFFtEj
	WpLVku5d5GsFy/T3wBJQJK4o0MvWouY03CrAyyPWEpPHwl2VsFWy4ezpeHoHieQv4
X-Gm-Gg: Acq92OGGsPX1IIAwBQKakVcHYiH3beysHHvZwfIrybpHtt24nBpmppJ5dTg3f0/BhAy
	sQOyLn5i+YaJgAug7128Icq7k7cSK77QfAsJDjiI77zXLfmxAtXDnraVHN8+wJgMIm4FAD/at2K
	Hn2n+KKYhUVFojY97POqZAaPN/dSFr6M+1sGX4QObdjC5bs2aJvDbmcQHjoEMM6pTQdqhHffixg
	TA37RcwMVVMYLwAe5zoT6yHAa9rw2Za6lXzL+R46U3dmqALbv+mqsZmrVAJY1yvpikevDdT4KrR
	pg5Pj17lGFf8I1FQBn/8Iv3nko2fQoAj28Hi9K+lDKfgaPin2Jsh6WlJXD8akmb8NoI7chKgsUT
	Xh2DKIvdZQVFOhuHcvC+iiWhtIDliTE6TxBs=
X-Received: by 2002:a05:620a:2951:b0:911:295d:59a1 with SMTP id af79cd13be357-91d8c2b49edmr324407985a.8.1781691452289;
        Wed, 17 Jun 2026 03:17:32 -0700 (PDT)
X-Received: by 2002:a05:620a:2951:b0:911:295d:59a1 with SMTP id af79cd13be357-91d8c2b49edmr324405285a.8.1781691451845;
        Wed, 17 Jun 2026 03:17:31 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c018eab36c4sm516643566b.50.2026.06.17.03.17.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:17:31 -0700 (PDT)
Message-ID: <e6aa773c-daa2-43d4-ac56-4a26c58a3910@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 12:17:28 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/3] arm64: dts: qcom: monaco: Move eMMC CQE support
 from SoC to board DT
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>
References: <20260616130347.3096034-1-monish.chunara@oss.qualcomm.com>
 <20260616130347.3096034-2-monish.chunara@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616130347.3096034-2-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA5NiBTYWx0ZWRfX0JisvhOI9j/o
 B3gzCFwShu0QB/cYwu1zZnQc4qoofmpIVv6J/utqUlMeZVPV21UlCG/UWY+eQXKKVXeDGu6KhzE
 Fk+tST0GVA8uZDXnoeEntbbfzkK9QRQ=
X-Authority-Analysis: v=2.4 cv=D4d37PRj c=1 sm=1 tr=0 ts=6a32743d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=foJT35fSmds2pDCHF_0A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: _fOyiEGCR8QE3DpvoGhPLF6SVheYT68G
X-Proofpoint-ORIG-GUID: _fOyiEGCR8QE3DpvoGhPLF6SVheYT68G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA5NiBTYWx0ZWRfXzqOFrXYqFKzZ
 z5kgIbARCM04cAyucEtzqHJthWOiFqL6RW5fLHEdhE03+bSGCdJ/9dz/LsiZA62v0kcn86MBVMg
 YhoZA+nAi7d1Bn8XS5jtGC9ZTtCNYdy2GQmVZ/r9ErHfZ45pLGwIOI2qdzd1yI7KTOvBIeSDTtC
 4g7iE+dvnLlAj9xmuSH7izZrgt3QFKjDhG7AsiEH24oCqqcb2/kG98w7F7TflUgss3BgCJbKY68
 tmNtQZiEWA8UIdYf4UYrVk5/VsqyNf66F0baoiLRLjdOCQnS6kws0HnbrVQgQ6oeh1gXiFy5/Xw
 jasdyxdcvP5l+72LuZadynBEVKVWuT0JoRhmhswtKaAvQXWygzDZv3fZVGX9y/kY+UYIhGshi/D
 Pz8i2brE0P1Fg3WlYL+FY08zHDmQtoefs5ZEIBJUnGZlKEDZ+dwF8wd7VYGTVoUjmDPZomSbOg/
 VAIvmWKk73bDrKDdiTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170096

On 6/16/26 3:03 PM, Monish Chunara wrote:
> The Monaco SoC SDHC controller supports both eMMC and SD cards. However,
> the 'supports-cqe' property (Command Queue Engine) is specific to eMMC
> and conflicts with SD card operation.
> 
> Remove 'supports-cqe' from the SoC device tree to ensure compatibility
> with SD cards. Simultaneously, add the property explicitly to the
> qcs8300-ride board device tree, as this board uses the controller in
> eMMC mode.
> 
> This ensures the SoC definition remains generic while enabling features
> correctly at the board level.
> 
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco.dtsi      | 1 -
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 1 +

Please also fix up monaco-monza-som.dtsi

Konrad
