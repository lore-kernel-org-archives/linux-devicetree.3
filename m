Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF8B2F8E85
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 10:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100371; cv=none; b=pNcj17hc+/rNJ00d2/aIklbCJHgqKlF1f0ySPCnMLbOEhj7ChXKqwhnekv36sOcIloC2eibHzRjy1FPce5vgMMZbL0ydavOo7DJCMg5UfcF42VEyn4SiLX9seO4imG+j/kS4Fcmfnnj6IoMyGuNaEpZwqvbNxKUFHXUUK4M7II8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100371; c=relaxed/simple;
	bh=G2Suns5VJleYMRm6J0IcnGJCb8Kgzf9eDglIQGSVjYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BrK3cjOnqeqbzmtR3oFvfQGHcO9j1VZ9sGUCn/gvud0EO8yYFx9pnSuLXCZNmx3Iq5ZC3v3YBkXT7zFnNTStLxu8lKEzo5K0dUDDxYTI1TfvnR8/Li6VXUwr7Wrjic6kz2++8JEfL+zHt5syeGEGp6blxa4Sniy8wAWjQwzxqfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Azwb2TmF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YmC8M2lD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Azwb2TmF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YmC8M2lD"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IA8ehr2091147
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 10:32:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JKBw9AR404EF4NUzLzs/nNnx
	H064LGvJW1ef6d0/ijc=; b=Azwb2TmFOtPQepUDtP77ta/2KX3x9vQP6D3FtGW3
	D9CxjPxaeh/Wd5H6a5J+aLXX+6JK8kSSv0kzfVNtaB0rrip9dJKCdYRvwIjtNXTl
	/2Am7yLBGe3E9zarizH6L1LGG5JJhPdPQfJ7sJMYrfObrWwbSaeRImfb20tlA+1L
	Cd2DDxcQAZlwjR3uWQx6wwpYjnxibciZ96E5eSDHJ84UpoJwK4H8Kf5UNMDVpoHJ
	xxTwpQsyoEd4H76CYAlCfvbrGCq5b3y+HRK+P01U5ngqofiIE9++Lm34IwSYExOX
	ja894zCO+lSEDQZ3JP6AjWv3NifoQaQ3/e9Lk0GffzKeHw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e80rpg36s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 10:32:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51605cf3c60so26863371cf.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 03:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779100354; x=1779705154; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JKBw9AR404EF4NUzLzs/nNnxH064LGvJW1ef6d0/ijc=;
        b=YmC8M2lD3wl9psptFCoH0M3nJyMjvrYZ7+SU9khUnaHMdVfr93alMbGVWe8ioqvyCN
         r0ArIv2buOrqkRSm0Bxt/jbA1PCsENTEz62rICc6cWGCHlQJN+BuPo4v1mc0vLMJXag9
         h8Oz4gvsQht7b7KXBe2+fKURSHCzmJ9JFWIPyhS23eRSdzU8uijFV9Gr3BhpaYdXjNcC
         UBDNLG1OZjQxUH79AhJaIk9FkRNcdadPQo4bCkHOd5oyYbQB8yzP/hSYJz48VxJMH/oS
         gAR05ATDUQCbHCqGK2UiNlaP4FIO2d/WXWkvuzxCkk8q3hnmu3E32OTKhBpp1cohF2qE
         nNeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779100354; x=1779705154;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JKBw9AR404EF4NUzLzs/nNnxH064LGvJW1ef6d0/ijc=;
        b=ZWVcG2yHBtYRgz2R9Gb91RIRNqLqG9+uIUf924QQRFVvf9Gzb+rT4orsauNvHWABjh
         YqzOoku8AV1TRSceftK245fJI7mrbCAbQHxTDp1/+IenrJ9xmoz1R0FpNrqX2Ay3uvYO
         z0S4H32V24QA5lmihQeEQCSytPI/jave/EL9UoAmEKL1KO4/z77GjgmzqtS0j959qEun
         tqSMrCb7+AFhKTABN+Mj1Ez4t1xBztVdfCnfJ0UrftFLJNPCGpmjHnox8SzzKaE1k3vf
         fvxQ+tkUCqtrwsUoBeLPRPcIvWWfkqgkeUD6ItqNL+kvWYtDqkkTBuc7DtSMWkc+T98X
         ml2g==
X-Forwarded-Encrypted: i=1; AFNElJ+UCQmqX3anOsWWR2nLJ/Oqf/NpjQ9y0ZfJph/OkrB1MEvQ6lmie2PxpMXcLKYLOI4FU3ghgBMBkGab@vger.kernel.org
X-Gm-Message-State: AOJu0Yy04HgnNXYU5sQEaQ5zx8EGIPj4xvZdFjIRM69qvf9GnsDjbnSY
	PB9xYSe2W7pW6zvKEHNcT8ct4tF/KWCfluarkf9WSHnZ4BKS8JuNC/OJWFRtUhDwr3qFWZtulaZ
	p5b8JC3LaidO+hrbmV5N2WHWGGiQGYdUT5L1oVpZXquDOkVgT6Vb/vsTt6fPa3n+i
X-Gm-Gg: Acq92OGilN84x8vA1SDR/7nWiGOssdBGU5cJfqFGs4Dg1x6yyMlpHH2p5NGMOYlSMpB
	nNQT1M9yO7kfU8/Qi2I8e7OxS/71co+8ENXXg4H/sRhtLqkPfXuDsqreUz0sy38U8x16dqkDrI9
	Y/8m3r+UDnaQQF8/c88lmvrQRqJb5GsxJw6WopnBDsSbp6Vb6iCNpzYFU29FKQK1SFUzgktxD4X
	IGRU/5ZrToW9vWv5Pl/UeiasW8a+uXA4Grbj2x4it4HyN3wA+YSNp79vSgGQzAssLV3tfYHTojy
	GvrnETJBPnwtbKkAxHvf5RcNQrhvWvNqw+7COSgmEczhlUet0iFt6uvK+IRPWTeBhMMULes1ugg
	M4tsbkN3oIzZ/kDjjeQrSZoCIRZEloq/nEL8=
X-Received: by 2002:a05:622a:1313:b0:50d:9b2e:7ee3 with SMTP id d75a77b69052e-5165a0ccdd9mr204777741cf.38.1779100352688;
        Mon, 18 May 2026 03:32:32 -0700 (PDT)
X-Received: by 2002:a05:622a:1313:b0:50d:9b2e:7ee3 with SMTP id d75a77b69052e-5165a0ccdd9mr204777111cf.38.1779100351558;
        Mon, 18 May 2026 03:32:31 -0700 (PDT)
Received: from oss.qualcomm.com ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe53ab671sm245653735e9.1.2026.05.18.03.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 03:32:30 -0700 (PDT)
Date: Mon, 18 May 2026 13:32:29 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Fix wrong interrupt number for
 i2c19
Message-ID: <sy6sl3tdfep6umhfk63jar3ibcufnayqteyrmvdqpn5krralzt@jonkgiphbagf>
References: <20260518-glymur-fix-i2c19-irq-v1-1-7d5968bd9b2b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518-glymur-fix-i2c19-irq-v1-1-7d5968bd9b2b@oss.qualcomm.com>
X-Proofpoint-GUID: WB21nxL2xYnZk3bHs9hjd2tV5RXTg_Z2
X-Proofpoint-ORIG-GUID: WB21nxL2xYnZk3bHs9hjd2tV5RXTg_Z2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEwMSBTYWx0ZWRfX8f2/RrUlCz5q
 1M803aLfpPXA3KErfZyHkXxfx6C09s24hV+yHVaJEjWRIVjzP56jECUQgAtnNRnWzEXIk4wgMbI
 Q0H5Iwu45m8JLIQlzOat6gLPMdRBglIqw8EU0r+wZ9EvMNPTlLmWP0g4gaZDfF9JJsaMES3tsVn
 Uq2VPkR8MX0NAqSF7Jmz17ilRV2tTr4v54sOkEoeVT9Ze5snraGxzuPt/a5jTQ6avv2IFIkZZdn
 G+Xwr9yS5cPr1x8TE7qX1vWP3UzVgyvpfl45JvXdkWGE+eH2rHsAd6bgFthK/jgCeEfzZ330Ige
 E6VNAwI4lVQ+mYu3G5biLaf4jH+mf+83oI3cL5WN9avwyKQuBBu/XqlIfHGPcT9tni/wl2fmG+W
 c1ZZmnnQQ9grJV02Ww56Z8TUOzAg/IoM3oSHThx8TIqRWfazk9hVOUDiIqmmW2/fmKVz67unthn
 j/1PrCddbGx3U7Cpl+w==
X-Authority-Analysis: v=2.4 cv=ecMNubEH c=1 sm=1 tr=0 ts=6a0aeac2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=YFrQUJdA0-VyeVoQsyUA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180101

On 26-05-18 02:52:53, Gopikrishna Garmidi wrote:
> The i2c19 node at 0x88c000 uses GIC SPI 584, but that interrupt
> belongs to the neighboring i2c18/spi18 node at 0x888000. The correct
> interrupt for i2c19 is GIC SPI 585, as used by its sibling nodes
> spi19 and uart19 which share the same register base and clock.
> 
> Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
