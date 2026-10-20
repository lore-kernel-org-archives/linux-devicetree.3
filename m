Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501744;
	b=dSqTaMuLsYS2N61/piKtMo6BLNiwvthdJTwF68RXu8eobAjQvnwoKqEqtnhLiaBM0Csu
	 MOleIDlGHV2RvGkxo2bjetsAsfqC6XDXkLCGFpOLsq/NOl+cOjH/nrG7sPDs78MegI8qu
	 qK8oC4CIBmYlyivhiZHQo3DkoYNLeo7g2XugMc1L63g4Wrq5YF5Ai3A4Rxx56gcY11vm8
	 10azE7NOT1dEwEtwCLSjPqqPrAM8gUkc+ScEvDmR4+4BVNFKNkdcTQ91BzFXuEVfCGQqY
	 7dtBQGPptYCkKi8i/NwjmcfsAZqiKgPtg65FfQG1vN9no5vjiUAniamKOrE7Vo60Qtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501744;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZfBTcbdAkrP1xzVcqe/uJFylfzEHBiLVgkItAH8nG28=;
	b=OXIKpTuWv4m3d6WJfkm/L56vShK8umS/jqL42yRP6a8MCIZaPz2eyRifpzlAntX0xTeY
	 B5ie3iFs7cULnd9NCv2hTElI031cE2KEPvlbv9jdxarL5cNsGaNa5Z82rS67TUNmavNr3
	 XkPrO1MxrUs5isXpZVyI79+thJ9CHH1znUHiqpLQBt2/LPM1WthWcRCynqDHoKNOv+MMQ
	 /nJn/KgiqRlFC01lkm6yA6t+GmkNXYNbdnQ38MdD8lt0BXzVWYh+L8MmXgHPhzpV3F13y
	 rxcLnjs+ZVPMDLunZ2rO2ykg0PAxs9cW+nttWJNzQ1eQabOq3Kgg3DDAWzAcqg2641A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JpYbHdDJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fVw5AKiW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9904606A325
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9904606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JpYbHdDJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fVw5AKiW
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KBWSGc1571650
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:09:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZfBTcbdAkrP1xzVcqe/uJFyl
	fzEHBiLVgkItAH8nG28=; b=JpYbHdDJnpRTP7B/DjzodEWy9htv7j4R5kEmOEpp
	CiZHY6xCZ8Wl9pK/v6Hc+sZPiRoha4LDaK/E+4EKAh7GlT/iOxkByexHHlIAJ/Yh
	CA7zcscx9RiD5c7ZtHUBwvOo+Fex2gvxA9ZtIOaffZIpellgMT/xdEDNqkFpvVJD
	2xd7PMounMSuMg6mmZMvI7ON6NpkafZuETvnlnT3lYn2JqDMZVo03e41lO50M9lS
	m58PxkWQQiHa38OZWcMeudkaKQh9FkwO3ePP1RW5aKO92lNTK+I8lfMxs0zgvfi0
	/ImtzfZ5uoPLlWAXRYV9ZBuMx66kxHTzUifdn9V7BM63mA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h28aad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:09:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caa0ce0cdso372195085a.2
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501742; x=1793106542; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZfBTcbdAkrP1xzVcqe/uJFylfzEHBiLVgkItAH8nG28=;
        b=fVw5AKiWR19iQP0592SRa3uOA89awpFnFrKPcfeFJ62pj1QqGelIOspCOX7ODdFEOf
         bUfRzmoYjliWkgX64SkxjEioc0Rcobw/r5ALjEOq8JxhgP5vu2fQ6E62q8b2cruErhko
         zGVWECytA4Q+2pq8ZOHnck13S1DyDedgCbApJJBRkDI/zWy9qzFcw+t3cx20BnX9Ykms
         Ns7nRVxUJ2Twtkl/3BXgHU2DiiAkstpTBSSWmAlcNB6wjVMBoiPO5mfHb48D2UpS1F6a
         PWQ+F8qIKKMvYTJkKVQMIjOx99IwFtyw+MzCPHz+PCXB5ptUQQchvjBGi4dJwSgMWsSW
         P1Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501742; x=1793106542;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZfBTcbdAkrP1xzVcqe/uJFylfzEHBiLVgkItAH8nG28=;
        b=sURMGAgT9VLE6Mki/cKvprS3uU8LG0rnuv58hXBqzMWnBhkom9fuiscQKe2HVl+EIM
         kGq1j2ogp5n5S7Idxet5JQxH8EDZ4HnJ8wOSrZJGclOyLd7RTsIgLQ4P8CcALth9zyD1
         4xRpUEU6pvG0SUV7oSBx+IoIIX0/2OyT1kD1zRJSAUhVGzEsZWNvaYkLIfwMphB1g/qa
         eeyWllnbENkGdRjP221onFS7bOUcxiagRCGKvCOZGMmmC+tpdqQfDkQy6ImcKwsXr8v2
         ysRNkSn7jLOWiqbmPpxDL+70EipnYgviMBRaFmhqOn6F/L5WsOwEj/AMwIBUZprYCW4U
         3J1Q==
X-Forwarded-Encrypted: i=1; AKwUvBz49Rsyzo4Yt771J9wgIAYORmWQdqj73lEcHeNKpxDMWMOOoxwGzBbe4vTofM4oyiU3Dkmo/CgaYJdc@vger.kernel.org
X-Gm-Message-State: AFq9FYKM12YZN7moEiPVbVdfQ7u4ZNcCf0nX+BpeFjRXLWIcEloR4BNP
	7yj0eHbVQNPCBC7VlTKZ/cEI5dZ6L9i92LZSNtmmPup6EGgXmbxuOjZ661WSEG8xLRze+ZO7L1s
	I+eGOTUmY9L0Vd5ywgVIaW02O55n255A5DbN2TLoRYisSLl3klZmQz2hB/NcWAgI/
X-Gm-Gg: AYBFou2wQkhjo1f7Ei/SB2iUUGYqHKrFOr62uGQwnZ20awxMvS5GhSA3llxBUWg4QJ5
	4izo0i+akkkN4qLGcTbljaZpzwltkN5PSFjnWuV7gc2SsLy0udhMML0+j7slJyJOMoVj3cCp59a
	Ntj5u2Ubll/ySXKHUy4ABfLFBWFwQgtTRlwfGcoxMWWAC2/ZmNehKh3C4/P/cdnhNz5GzGq0rpv
	4esbLbytNk7ZuFbAKJon4Oe+uJruSVz028EhQf9OUTDWB/n/0nmTWVvAebRTZl9D29ww3gnL+L/
	ElnkuR6EUcruwbjq2deD4nYPu8kE3WXMg+/W6U5Cuau7z4sRv7xBGaLpyiri50Rvg8bmB7XmUL6
	qloCyYnn0VRqRu2r8
X-Received: by 2002:a05:620a:4689:b0:93f:3646:7a5e with SMTP id af79cd13be357-93f3646a313mr1452576985a.64.1792501741820;
        Tue, 20 Oct 2026 06:09:01 -0700 (PDT)
X-Received: by 2002:a05:620a:4689:b0:93f:3646:7a5e with SMTP id af79cd13be357-93f3646a313mr1452566785a.64.1792501741030;
        Tue, 20 Oct 2026 06:09:01 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d810035sm6446413f8f.13.2026.10.20.06.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:09:00 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:08:59 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Liviu Nicoara <lnicoara@thinkoid.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Aleksandrs Vinarskis <alex@vinarskis.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-dell-xps13-9345: Add thermal
 zones
Message-ID: <nayh3uva2fbvb4cnycwphfqgkdotnzcnyuhbbcw3ug3augpek4@hop3qvnxr4ko>
References: <20261006185557.23016-1-lnicoara@thinkoid.org>
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
In-Reply-To: <20261006185557.23016-1-lnicoara@thinkoid.org>
X-Proofpoint-GUID: pwrn5Xu4IFi9YCVrVIPIKS3HXov46OHA
X-Proofpoint-ORIG-GUID: pwrn5Xu4IFi9YCVrVIPIKS3HXov46OHA
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad767ef cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KOsBq0R2AAAA:8 a=EUspDBNiAAAA:8 a=G_HJgEvyynBOfEdg6UMA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=p7IlednmDx7li90OXeev:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX/dHW4NWEcjrL
 AV6zLSBfxU6yeMOuo2L2VwcCu4s9xxhR/6YUc1uZVyZvaqE6QrBY8aJ05CYnOLEgwzckQW9oXGG
 sYMkmK7oox26VXGXPaFBXyJo65s//P0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX0C4Kv6QO5uEX
 xcsArSA1oVLWz/S4jl7GLdQJ+FeH6Jn/fsn4PgSBODtqz3s6hfMRf66Nq5iGCA7BsZrr5WueEHY
 4+OLmgQG0sJlLQa6PT9dnhsXOcKpARAOqMjUFch79+NUQrJaIZyJR/+iFSElLprwkK7/SU76dEm
 hv64cfpGNsLEwLPjhNlAqz948ZnE1NlRzVbDUuBhHL8kPPdHfgN9fJeu1M0XDeWXKWUJ7K/kQii
 PaUoj6h79gn7nT8DoSCUUVJqgQ0X1AHlHWy67GoGCi9lK01W/czbDeUm8Cz9ZYhaWj6FCbP+9LH
 baVgWiP6Erc3LLFAt3I9n3M/IbPRel6yrZx4IEsDNYwMOUvvYmDUnB6Jfp2qlGdhn87U84TEfWt
 gLh8NQAF6IGJRywSH37W7eSroQ9sc1fd4xk4IVOfvBOtFtWedjVWu+8h3W2vd2JluYFMAwYZIwV
 BFY7jWJsdAwyVFCbi3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200052

On 26-10-06 14:55:57, Liviu Nicoara wrote:
> The XPS 13 9345 has seven board thermistors on the PMK8550 VADC: AMUX1
> to AMUX5 THM and AMUX1 and AMUX2 GPIO, each with a 100k pull-up. The
> ADC configuration in Dell's Windows driver package lists the same seven
> channels, SYS_THERM1 to SYS_THERM7.
> 
> The ACPI tables define seven ADC thermal zones, TZ31 to TZ37. Three
> of them, TZ32 to TZ34, carry passive trips that throttle all CPUs and
> the GPU; the other four sit at 100 C. The tables do not name a zone's
> channel. Taken in SYS_THERM order, TZ32 to TZ34 are AMUX2 GPIO, AMUX1
> THM and AMUX2 THM. Heating the board confirms two of the three: a
> charger on the left port warms AMUX2 GPIO, one on the right port warms
> AMUX2 THM. Sustained SSD reads, compared against a CPU-only load, warm
> AMUX3 THM and AMUX2 GPIO beyond the other channels; the second is the
> left charger's, so the first is named for the SSD.
> 
> The passive trips follow the thermal mode chosen in the BIOS setup
> (Thermal Management: Optimized, Cool, Quiet or Ultra Performance),
> which the EC reports and which cannot be read without an EC driver.
> Use the values of Optimized, the default: 53.8 C on the left charger,
> 62.8 C on AMUX1 THM, 61.8 C on the right charger. The critical trips
> are the tables' 114.8 C. The other four channels get report-only
> zones, as on the CRD, and all seven are put in thermal-monitor mode.
> 
> Assisted-by: LLM
> Signed-off-by: Liviu Nicoara <lnicoara@thinkoid.org>

Tested-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
