Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638C2495028
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 16:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786637768; cv=none; b=M2To01S97j0pfuG7G4MwUc0mtBpR0xvBA3UOhAqgHxYLb+mBnNYmUcaW4YyFtJjTQlg3HEa9A5oBEAwCmC1D5NwpQgvnKnlpx/2pmHOBGZ4S+4qSUKxaQBFJMBw2xD6t785fERcYCAvRNgIaV4UzjoppMd/2tGCGK0uVrBR8Xnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786637768; c=relaxed/simple;
	bh=3yrbScmpvSxIS3mhWUo9AC7pv+CjxIvuV1adYVeaK9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tQy+8Jo460hHv+eMw/YaOb6zPflWXn8HqYf3j6NWv75U30Z9JjcVabTjlWQd7Q3Bto68C1JZavcH1ra/WLFMRtVn5uzZ61pwILw/JBalUH+h2svkNbd6cbmYxpCMfBJL4rYUQxpkeCAgzGWwthECQXo2JlQFYMBLrfdOSRIuNZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sn+MIkWj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UamFaU32; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sn+MIkWj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UamFaU32"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DFTdrG3706364
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 16:16:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nQigXckDkcyL4OY2GZibJ85XWo/01iQSzsDtvAyCXM4=; b=Sn+MIkWjon6qgcG5
	EKQGAIp/d+SMrI3ZToBkcc6gksApeWNlj6HB+FJvDW/wPEd31WPdq2j5dBWkm5V/
	vOJyBdNOZkpXa7SG1s5GSjFgyRr1RUWRUkZkQRUmJ4o+uAemzTmIzUrisV15Dpcg
	238ELuAcVaaPqsz50tGB5Mhd/S1PknUZXmPItlv7feyHa9vIQDyEQ9M9pNOH2qMX
	+gJaJhSoO+gfPDdK4UF/+jh2mGCOmkFNcv3aZfV6y638pyCKNqMnhmeuRisHHqrW
	9/Zqgme5j9W14zMC1ajs0DmTRwkYw+9YDCYLk2ZQxm5DsbidOFkkDpsPLquPmY1D
	6dowOA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g18c5jnb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 16:16:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1c7f135bso1888721cf.0
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 09:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786637760; x=1787242560; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nQigXckDkcyL4OY2GZibJ85XWo/01iQSzsDtvAyCXM4=;
        b=UamFaU32KAy79FP9vMMsz1WskN8+BuhZOTwS/xK0f/KX6ZiR6hrWLJQXJ6qs0QgFsz
         DlizEVEK31t5I/sr8FxNFWt/A4GoDkTuslMzhaDt1trV8ONNmcQEND6oicxcxpSG3TBp
         be0wjqvX3wdtsbake4EvP53iYsQ8+gjlWkQkg/P6LgUVr0eahnr6PMx68K7FzFtmmSNL
         YR+JPHwopOQbofjo6WCBRaJTTL0fUB332KQB6EmDB2aS6WJCqJh4i7vSDx5+fnZ/xe4T
         U4uth8kH5Ty1ftpfUTegek1l/UZYPqoY+Gw/CVwygYE0YCSjhjj+Oo/3JutmWLNmY4jD
         IxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786637760; x=1787242560;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nQigXckDkcyL4OY2GZibJ85XWo/01iQSzsDtvAyCXM4=;
        b=kNjPh9u9liGByUEf1cSpycpQy071AetxjMZst/V9G/OxTVfuloj7g0TX8qIB4bBB88
         iz437aT3WtjjJ6adzHLj/LlH8BLXiwJ9aInhqPN1WAkUlyp3muoAE8zRgTjVhikgu0k2
         u+LPifB5IIMvPkitM1vmTQTlw2ptTdTmo6CVN2SLYVZ8Q9OmXgwi5JQ5n4mPBiKZe30K
         NXyg3A/DGTFfUq5lDl7UZetLI56QgTgDQI3Oh6woJlYoS5kFIVc5WrrSSqf+baph5jn1
         ezCJd2xx/q5fBf0yxNliUrgiEFyvFeeC1RgCUtedAxv2KDC0zc183M6185FFhaxYttY9
         +l+A==
X-Forwarded-Encrypted: i=1; AHgh+RpeBjRjTXVb0UfacZ28rx/Vk3pDS5+xzeiZhvuoKJGzD/mcYA0U07+ywivqpLSRUjYcGA0PBOjQ4x5F@vger.kernel.org
X-Gm-Message-State: AOJu0YyqytHDg4sqiH+B/SE6xNQ9umM9xLc4/B4QUdQCETj6RpH3F8Qr
	EuLuxpR0R5ikkIAn2tFWQXASDM/i7zQ5atWqVQppLi07YwsAofAmhrM5u6NMvLV4WkJP5+kfdWQ
	5S3pBXkwRTWHrZypwaKx18s3e5hcs6yuLTaxDnN88JQFFxZ5Z3NAJX0Wi2URXmixh
X-Gm-Gg: AR+sD12O3Yzx3mjuEHT3ynhy9GplZ2SQb5jNlMN4ZOhXmYYx00Ky43zDYvihbuoMvt3
	rivmepooaw5cvvonDkkQh8m67Y/fb9hGVcXYqsS6zt+SDHPgBa/R04O5Z3M6Pwup1qC63kcTmnU
	bmru1rA1ILUnS9bfu1pvMf67acLLE+/VKVjju4bWBmHEHJONr/95p4wPKVhLpR/lRTypccCu2HY
	c9rhmohq6gsqlb03WZVjqoyJALURAZk/VGbqd++VNAWvHEdDrpQRe/OTbxBlm1GOD0mQ36QEc+p
	pFL63yoVJUJcJ/bRppbUJ/qrnE/uOTXY7si0alRWsBdrXBpYG+vHHsEJZhDAqbHphrPCSOHEQFm
	unkKPf+zU4X/1kbH//YW05o8lp8843rfiPyeQMkKOtanj591MbQF8YuE58HecvXVamgjO7XMNxk
	NYalsVEu3TUjMZ
X-Received: by 2002:a05:622a:1925:b0:51c:1291:911c with SMTP id d75a77b69052e-52d73c4bfb2mr80778921cf.14.1786637760015;
        Thu, 13 Aug 2026 09:16:00 -0700 (PDT)
X-Received: by 2002:a05:622a:1925:b0:51c:1291:911c with SMTP id d75a77b69052e-52d73c4bfb2mr80777751cf.14.1786637759504;
        Thu, 13 Aug 2026 09:15:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a130872f84sm441111fa.1.2026.08.13.09.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 09:15:56 -0700 (PDT)
Date: Thu, 13 Aug 2026 19:15:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: Re: [PATCH 4/6] arm64: dts: qcom: sm8750: Add GPU cooling
Message-ID: <bnkma57sumxaoqe5ommkmugkwpvqsb2i5drs2g5grzysikltuw@g5vaqnajtanh>
References: <20260809-pakala-gpu-v1-0-207ad1fac1c7@oss.qualcomm.com>
 <20260809-pakala-gpu-v1-4-207ad1fac1c7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260809-pakala-gpu-v1-4-207ad1fac1c7@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDExNiBTYWx0ZWRfX4SPW1BLbTTrB
 r5DGkpDFH187CTmeBjTsxuOE1er7Bic7UASZoRR7XMz2AjQpIreR89+EBIvCth7NG5e5sTzXBdz
 GJkvSWK4Fs3E5T5N9L2DomGCn23QyjE=
X-Proofpoint-GUID: pRLexoi_sDfH_2Uwq3dcUzwQdCgCql14
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDExNiBTYWx0ZWRfXxqD0Gfb/k4WT
 nBJbN52kREqvJP5HMumTWF4XhIM8j4m3+16YObewA6DTgfn1jePmKzmjhAvSEKxznR+E2CP9tT1
 ML3v1gPU+KO1elQ0hvu/FUnzTuIyMs/NgqPEMWFS4JHsiDYHibzcaFNI21wAjKLqrT0/GJuJjrE
 qUXolQgmVEu5DWhbJ/m+rX71HwOfyzpvBuTDmuE60V/q0pWE6O87m/3FFlJ4ZEycLqZSiOGdGUX
 /iojketnCkMHx/4qDpk43Rp/qt2jt1HSWQGCxUxkYK5v6LHqh1pwPa8yBpZf3cUD1Ddl4KaOOFW
 xTYT+y59RPvxm4F4Mpr02ghwvdOsfAZC2T8yGmMPXayyTXrcY9JtvEWc2JNzO9DuLJvmAsNajUP
 m0Zdsbbuo5cLfWF68i2ECYiixQhVPFF5oTLeTm2N0OlHJJfOhrgoFbV8CIVWpQfIo6x3ciXoRYP
 s+jBum8Il+w4XtlWnKA==
X-Proofpoint-ORIG-GUID: pRLexoi_sDfH_2Uwq3dcUzwQdCgCql14
X-Authority-Analysis: v=2.4 cv=VebH+lp9 c=1 sm=1 tr=0 ts=6a7dedc1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=i6UeDzd0F3NWq6oLIEcA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130116

On Sun, Aug 09, 2026 at 01:53:11AM +0530, Akhil P Oommen wrote:
> From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> 
> Unlike the CPU, the GPU does not throttle its speed automatically
> when it reaches high temperatures.
> 
> Set up GPU cooling by throttling the GPU speed
> when reaching 105°C.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 104 +++++++++++++++++++++++++++--------
>  1 file changed, 80 insertions(+), 24 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
