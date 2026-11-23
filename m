Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462935;
	b=eAHU1GuAqHJbkRgeevMtydBdlj5JoqZXoOkAjeSjpODopVN4WkE6bbU006kpoGBxyiXr
	 n5teGwVqdXA/AmgjkuxIeuW46/DUt2SXNAuGQBFDY+6LMqBjN/BLnDFNU9FRqLB1Ys9o2
	 cqmxfIWsYJpvdnooHKC7FJQFpQ0DWvSOIRpndvH2yMc9Jjp+ge5o9Tb4ihLe2xdulWYdl
	 4JGMtYkzNMat9LZnv8G1glrSRVcLw2dXejYlN/chRvKNwiznT87aLQwbsAuw+BEUxFQkm
	 +WH4gYSX322US9CT9EGgcIPkKb/jBA2kvU3laVzwTse/mqSlbLPp3Mk+ClKrRUB6tEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462935;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TiJHHZoWYTxxWc307M21mACD+manX7RHfmlFNEd6ixw=;
	b=lUqFGuyfVYuk62nCbca5qudBkcY2+RkZjER5q8UngZOyEQjRxb4VXm2JChE33yd2tv0U
	 o6/NpzuQ5UpHdNRT/1987o/3S0jAETlAcTqaNrUGSbf7Y+2guBvyOjkF3NyZUZljOF/Cy
	 6ebzMdp+koIJbue0fLwCWIq0Ss+YdW5WpyCtPhjcFXLHBatvdTnCn1LSu7WS8bXiJYFWT
	 BT/0DrvBdodSPfU1zTTc1bPh34X82TxBPQh8Zi4nKRHxwKq44NZsreaygbcIqkZXvnV4M
	 zBRNJv4pugEuVh8/Sd2ZvJOfqZtjF8qj8iNR6QsVGpRvCNY6eQ78h5xid3i717eBpUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ln3J9Mbz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fJledeAD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69B2606A31F
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:42:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D69B2606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ln3J9Mbz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fJledeAD
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGqYN846514
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:42:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TiJHHZoWYTxxWc307M21mACD
	+manX7RHfmlFNEd6ixw=; b=ln3J9Mbz/Ri2MWC4Bqf9PAdfIdkWPONzyUcCiZt4
	FFQbUFaYfbFupBqSQIKQelR+CcKaFRG3ls9jggcGnPr9kLsDb61FoUsEJhChY/Lt
	8A8u/9DA8IM/QYMAu/12GJbsT2s6ojTMmD8HVcVJ1oG6tQioFqYqEO5K4I/cXo3b
	sQMtVbGe/Otl6Fh+4Bd+lS5BsFxnk2AOQzz2Y0KWGLbHOfeZQT4RyzK+mLd3qYRL
	soTv4XwtplyZKWaTyJD6PF/hkYRn9Jz/5m7PQ7sOKMyUEsvo+Drr++uofaBhid4r
	df8Ly4zgMFDsz0ibhPfx/ObtuJAraO7Vs+nJqS9HO+SoWw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g7436jn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:42:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-542fc619afaso44660211cf.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462933; x=1796067733; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TiJHHZoWYTxxWc307M21mACD+manX7RHfmlFNEd6ixw=;
        b=fJledeAD/Q337FhEdpWoMXcQ0rPoA6Ruw87iHoL0Lf3C9voBR+fWVdivt0mA1LvS/r
         OMGmnroslL1fIThUgG68fQwO9AIQMm6XoU/MEAvzkKlYqlAK8PpXe+BvA0K+NXdPWmuf
         H5VriLBey3DPfAJ7PCq9fzGuKCS7zvWpVVDm4XLkncmqduPINzsV7U23DhLnyVFysyct
         DswrQ+yKhZ3qZF+Pm+iQZXhk5Qq7SRxYL5oJ4HEX8pHoQW1wn9gxM2wOrloy6SeKai9W
         +babPGDPewrUCUE1y574zyiTRdrQ1WrbUV2Hsx53dXQMZptJ/QTrGtt+jPrCwPIjtpaY
         8Ong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462933; x=1796067733;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TiJHHZoWYTxxWc307M21mACD+manX7RHfmlFNEd6ixw=;
        b=h76MoPB4B0Z5xRGfnMoGtVRaxGTJEiFg0VlPNVbuQ9RPQNR24Ze1Zap09KJkPKmJyd
         rco25lZLwgDahsExQ60Zh3MGoMhfbXuzNjHPO+jqSL+6EsslF2OTXAU1Q355qtDc6M8u
         hYywRZCxvWRtIICbrz2gCbLqnpHH/V17I7m+ZN3SxzUiSfs++0cVr9DXIpZyIPVUT1ag
         a9enBGTotDZbY2MVu5YDrnWKYegMKFy4FFI/qRq5y0Y9YiMxe9AB66BTkWvfitOIxdHu
         HqsZ1/8EnfHKshRo0EAbj2fowv7QBUn2zoFhQFFEo7kOwIaT/pLlher8bA04y2uE7Nso
         44dA==
X-Forwarded-Encrypted: i=1; AL+hErGtQhkhsqskwa826EwWPZvmKjnisLLKIdIh1El3g9BXyp6BVCppE2IltxAtLl6XIl5jC4rs070fC3no@vger.kernel.org
X-Gm-Message-State: APuU4Z9Otxv2UFqPIkCfVnUpwDt23FQZvpixUwP7VLVUqnGNVKSmx6L2
	nRuG/GXzzJPLrIC3/f5QZzTMizfyQw6LcRVdWZaiEeXtNcYB/VfW1rIjniG6P4rIEAc4gxfGwxl
	VjamZjAx9zU0QIUl1FuR+R6RVNaeX0T8zeyTS+6jY311mFMvKzzzCi96IUvN583BA
X-Gm-Gg: AZFdTZck5SR+HOGx9zxj5GWNZAzCeekI8E7k6ZvVSLwbKMPTFqD/R4rfMe/+SlpziLd
	yLm7JXnwG6Apam+PgcixK5SPts2FtqtRe/HEWuwtCvFo3IGxavubS2AoVuNZ8U5f25BLQ7uSGAN
	k6S/MfbfYjOP/P8RcoOKSeLvgtvOv1NaWTu+QIScaxkfnpjdZwGbLTTXSWHn2EwyCeL/rvZzGED
	Kdsn+GoztmOsOcIWeat0wW6df0qAKyipkg4uS9kbzmb4SByMl9EzwSeD24M6ervFxdMGgOD/NgV
	3b2G7+MfP/0T3yiD/hkjMmiL3qo9Gp8KOP6A18RryV3p681bsAFz/F5t5ZyiLr3zRIxtbUVrU8T
	oEMEmPl6JlfruRqX3Kj8LHbC7YoA0zfgxWJOfV4KgjLPVSj6WAp2MwUnqD3iGIX9u
X-Received: by 2002:a05:622a:4d8a:b0:55d:2e72:1a03 with SMTP id d75a77b69052e-55d769b96c7mr239449651cf.27.1795462933068;
        Mon, 23 Nov 2026 11:42:13 -0800 (PST)
X-Received: by 2002:a05:622a:4d8a:b0:55d:2e72:1a03 with SMTP id d75a77b69052e-55d769b96c7mr239449201cf.27.1795462932439;
        Mon, 23 Nov 2026 11:42:12 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf62f7sm25764593f8f.13.2026.11.23.11.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:42:11 -0800 (PST)
Date: Mon, 23 Nov 2026 21:42:10 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RESEND v4 17/20] arm64: dts: qcom: glymur: Add HSC_NOC
 interconnect for adreno SMMU
Message-ID: <6obybmhvyuxsp3jarjv4z57ojjfprwss3mer4vq5x56yhhl7kk@fk4ysedbakif>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-17-be30526391d9@oss.qualcomm.com>
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
In-Reply-To: <20261120-smmu_interconnect_addition-v4-17-be30526391d9@oss.qualcomm.com>
X-Proofpoint-GUID: K6ln7uyUy72uXvembXBqkH364-qPM_MQ
X-Proofpoint-ORIG-GUID: K6ln7uyUy72uXvembXBqkH364-qPM_MQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX3eaI5saZPk+K
 ZHDYp3W1kEiuHe2oNlpoRPOxIKnsKKqsZ+xPBFhcbqWEi7VpEBn/EiQS8Dkbi3yaOxbA4iyI/jW
 GMh5n4WwcnY5dKo9AZD4huiPWb9TCQE=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b049715 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=P-COMtFXNwbjGjwEE7UA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX0runN0sN4YcD
 IPFJ3Ydi8szBSHg6oqobkFOGtm8oni4uJqTFY1qL2FcBcW4r9ndtYbPtYee4qSW5tqjQEL98frn
 aHcxHA5BqEsVpLLpHBau0xmYqScDxXQP6xvLgb0rx6QWucXgV5uJLAJE61tT/An02P0qdk96FpU
 HtgmnNI3jRL+ujzCHHMNK5ugSrf0zHcVsDNQpt+vTJd2kjhIn182lyeUTcEVk9OOf+Y8G7eyK8X
 37yffrDWbdnqOGHSJeus3UurtMWa0KqfAMM3qQc0GR5Ab0THzUF9ZyRHry2HyzNbgcRkpJNU/eC
 a3+ncLAX1mMaM8s7Y77+gNl/uITHorz+9fXY9qi+QgAcjOOi+QOhsVpp3CA3SQwbU/jcDuxSikI
 mtf0lwNyR6eBUy0dGRVd4lmndEP7p1Q9TRlHcwRNHLQMll05GJpaviXAD3QJYi0fSHt1tQzxROc
 lucfVxrRrOxL7iNq22A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-20 19:11:48, Bibek Kumar Patro wrote:
> On Glymur the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on HSC_NOC. Without an explicit
> interconnect bandwidth vote, the HSC_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
