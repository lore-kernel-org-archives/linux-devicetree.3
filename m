Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4148B2BE043
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 16:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786120923; cv=none; b=Rzc+2Puwuz4ZUt7gxkUiJ8wNv/pqghpG+/An7WYK9oXd+7PuYzSsH+/fQZTWaAyFlae8HWUwY+xo0i2Pm/7PWIYpQe07x6vVWfyTyAQD51exBqQD7ggEeMF7ZkCPQrddIHxLyGdhs9pkItLKIRgGIsSXGvV+zBVtsXZJNZaTYJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786120923; c=relaxed/simple;
	bh=SF1w5WcANIRqkbDRAasm2Bv2/FCeVEU5P4n+Cp0zn68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WgTlkc2JPCPqeyjW+R6txlaUa2rwpzrUSOi4pp/cYzh/49dyMqH23413sS5dx2DA2DyAvgo3GRBQ31ABCnd4U7rKYoiY05+nzp8ktykUEUtYvFRtBsro6MFzweLRhqdibQCwLpSUtia9p+3cQ5t65NWtvP+kckL8JEaizqB5+Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cjhTf6uJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ctTExG6V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cjhTf6uJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ctTExG6V"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677GbVi41825861
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 16:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=S+xtwtaBD2E5itUbYoIJ09lq
	mLbBFlcb3Q2IZhH3Huk=; b=cjhTf6uJB9TykRgDf/2Ud0LYQ65xrr5dF0+wmReA
	D+P4dijgmOUCHMlQJMVqix0JCrBn5+EqzGMk9jyQHNJjr4P3rSTkxhPxoKmQ2KSY
	5IObzXx3h94uKeIGddYY6AX3QJjrx8iC9sgoNI4bZOwZbLRrE5L7VkSaj5bm1CQX
	w6wdBBprzXgOhQIiOlDV/wnQ42eVwSoC0OKWSPP9oX2YpQ4E/ou+dHW2ciaWnEnL
	5GAMOV2qnL4Osv2A3TOFnUFF0nbeXM4O9gupMbr4pf4NNhWGXQCN2TvJOtM5zUFS
	kFBT4bq5RAIkpQdpLeCBxzerKvag94lu7enfaN6iW8uM3w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwk21g0nd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 16:41:59 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c9c26587e67so2185738a12.0
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 09:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786120919; x=1786725719; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S+xtwtaBD2E5itUbYoIJ09lqmLbBFlcb3Q2IZhH3Huk=;
        b=ctTExG6VQDTuZP0OXezKi2/FHDQS98eAhkX8/g977eEf9vTp6hVniFvJTmfd61TH8j
         9Qp9Vjn6sUlEZE7pn6pai3waJcfmVfU1ONiiNl8fELVzgpaE3aDzSrQfvO2sU0idsO3w
         TZR8XmaJCCOeWP1P4u8iJoMciEjQjRew68J+LiUbiz3u4tbkKE8x9yDdae5JlyZeokZo
         pZIzA9CePZ3E9u/qDkcvc1eHNnd5h5KMxRo7dE0yWmziY5jr/X/TsoXBvPqlavtXNnml
         pgmULDbNyg+vrplq3PHtJFhNbV8Sxl/Ks1UuvXzBhxkBltvj5bVaGXkngF8JJkTOEkas
         pf/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786120919; x=1786725719;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S+xtwtaBD2E5itUbYoIJ09lqmLbBFlcb3Q2IZhH3Huk=;
        b=I0LUybm20lln9ExRprwSvbUfX8Ed47VLuT8w96q7vsiPwFeWwbsgQdXIeU2Nx9Rgfz
         i+pKHKOgpRKZWQT5pT3EXwZOjytnbhelZodtC7zSXhUN5A+wEYf4Kxj+Fhvkq9+jmmqB
         ItPk7tHgebUOv5TQ+xdZCkjJIr0n0prNuQbCJJVE161x1H7xI36/MOKBf4s/fQn5IZqw
         1zwT7p5YOtrDuZhhhLTfIAZmv1zcu06dKPXI9Ow1cyIxcVB92w0gLaLLi1BigAa/ArFZ
         hKP1i4kEiTKrVJQ5ljSA7zG6S8/XaQcP9nGSot5k9FmziBq9QBZWB7bFZO92t0hXExXQ
         GMlg==
X-Forwarded-Encrypted: i=1; AHgh+RpyjAMZnJjzADLfoRL/nzlPr0Qixo3rVDqFsOaqoaf0RH/sEpRpQUvnxM2FVcRfFpRP+iL2GbjXxc6C@vger.kernel.org
X-Gm-Message-State: AOJu0YwA78LT3pa+iVfXRjvYtuKJKBC9lKzkIpKm1W1Qziyvkvwe6jDj
	DdYFB1LDsBni9BNvR1HCw+WhDz/KVRphDD1oo2J+tRSoOlZq09C1hph0ODp4p03ljoZbuZOyV6Y
	A8aktTsv0+tjc9q5bP8X8MhBo4uhLLui22aMg8b7KRX+n49DalmBsieDwoQu5vS3J8W+JVuNQ
X-Gm-Gg: AR+sD11ajIP5YIiyX/DwfuUyxsa2vlafSoTzmOfo+1QnKE0+whS7Q7VpuDjUqFR5gp2
	OF7LKKBjt/qiSB3zm7tiaeJq0LKKs7Moh8iCx7dEaSH0OAlqkxu1Y+aiVX+z8NuUwtbQTuSG9w6
	OzSuLJHbah7G9Awao0PEsJ70k38C5L3ycfE8G1tnd/n0BZBWWakiwmpriN33rUVl1SliD6Jy8fl
	B/42pBOZOkzbCnbfKkTC37ox5SwJvs3QOnmEtn1e8GgCp/2o41ZcWIIuzq9YBJIte9LTVLdYVkq
	A/AiZvE5QznvPNpysstMSXNaoTvN4ros6uNGGoVFuKU3DVAHsl0xfik7Sy7Bp8/Kn4j8FKwBYoo
	QQ4ONbA/fp0vWObiLpVbZkJtcXz8768wc8/2puSvFnrav0tNMzrFavmnXIDyJksJu5Q3W7xowoc
	6vL+myZxjq4HI=
X-Received: by 2002:a05:6a21:32a1:b0:3a2:c9a1:2c26 with SMTP id adf61e73a8af0-3cb9c0a2b20mr17870776637.7.1786120918956;
        Fri, 07 Aug 2026 09:41:58 -0700 (PDT)
X-Received: by 2002:a05:6a21:32a1:b0:3a2:c9a1:2c26 with SMTP id adf61e73a8af0-3cb9c0a2b20mr17870701637.7.1786120918485;
        Fri, 07 Aug 2026 09:41:58 -0700 (PDT)
Received: from hu-mdalam-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14101b7a772sm8323372c88.12.2026.08.07.09.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 09:41:57 -0700 (PDT)
Date: Fri, 7 Aug 2026 22:11:51 +0530
From: Md Sadre Alam <md.alam@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Enable quad SPI mode for SPI-NAND on IPQ RDP boards
Message-ID: <anYKz46HeHF6t1EF@hu-mdalam-blr.qualcomm.com>
References: <20260716-quad_dts-v1-0-74d86792944a@oss.qualcomm.com>
 <20260716064733.3nzgioduu7kruglv@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716064733.3nzgioduu7kruglv@hu-mojha-hyd.qualcomm.com>
X-Proofpoint-ORIG-GUID: GRTbVO_lsB5uPyZ2x3bZ5EKyVtBPYek-
X-Proofpoint-GUID: GRTbVO_lsB5uPyZ2x3bZ5EKyVtBPYek-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDEzMCBTYWx0ZWRfX9TRyfGSRLhjA
 hhC/fYqyYETrH3YxGIh9PHjS3vlSrn7OZnReOhnJNOa1rv5hV+FGHWS5GT4tM6IWDlyMoj9Qj2v
 GS9cjsI6UqFtFSWt+eyfOb8Eot7TKk4pC7iLu4KmM513Kv/2WMyiQKc2j5uqiCUt4gEvvFV1pna
 5qvKI9Gbdl6axnl24Ag/Q8kDGd9cc2pxIBRazbGMJjbcMHafDy3DaX3gEeEvi7uPuefdU9OUruL
 yjy4QnAc5eu4ilOPTE6WvI3JovnODFs7a110hGC+OIeHdM9Ome7n+yl8XHQIdIGpdUJh+Taz0S0
 xAKpNfscrkMgN2gLel0rVKDlrTacmASd4p8H4cw/9KbwRnLCaPegv+RD/yb6jAlvlLcPh9t9WU/
 /LumNVUMHbnvbLs3OOr/N67fvP2JNWrmBXh9v1W4xZ9YvxiQkj1EsCSn1Te7jAwbLB+BXNyTV/X
 abuFRUhdptkAhEmj0vA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDEzMCBTYWx0ZWRfX0Wa+xZv+a2f6
 MwaGgADcqqlUtuxY96PjYkmv+9MX4GoIDr2i0XTgGuBxkv+dG18SPrhZ0owFDw3Fkj67zhSuviP
 Y88XFyxOoCcwRwNKUKhscu2ja97kHvE=
X-Authority-Analysis: v=2.4 cv=YJevDxGx c=1 sm=1 tr=0 ts=6a760ad7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ESF4Oa33ePULE1iGifwA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070130

On Thu, Jul 16, 2026 at 12:17:33PM +0530, Mukesh Ojha wrote:
> On Thu, Jul 16, 2026 at 11:25:11AM +0530, Md Sadre Alam wrote:
> > Several Qualcomm IPQ RDP platforms support quad (x4) SPI transfers
> > between the QPIC SPI-NAND controller and the attached SPI-NAND device.
> > However, the corresponding device trees do not currently describe the
> > bus width capabilities of the flash device, causing transfers to fall
> > back to the default single-bit (x1) mode.
> > 
> > This series enables quad SPI operation on supported IPQ reference
> > design platforms by adding spi-rx-bus-width and spi-tx-bus-width
> > properties to the SPI-NAND device nodes.
> > 
> > The series updates the IPQ9574, IPQ5424 and IPQ5332 based RDPs.
> > 
> > Signed-off-by: Md Sadre Alam <md.alam@oss.qualcomm.com>
> > ---
> > Md Sadre Alam (3):
> >       arm64: dts: qcom: ipq9574-rdp-common: Enable quad SPI mode for SPI-NAND
> >       arm64: dts: qcom: ipq5424-rdp466: Enable quad SPI mode for SPI-NAND
> >       arm64: dts: qcom: ipq5332-rdp-common: Enable quad SPI mode for SPI-NAND
> > 
> >  arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi | 2 ++
> >  arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts      | 2 ++
> >  arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi | 2 ++
> >  3 files changed, 6 insertions(+)
> > ---
> > base-commit: 19827e7930a5511c68e12aac6e4522f3661a1709
> > change-id: 20260716-quad_dts-6bac0484c08c
> > prerequisite-change-id: 20260716-quad-ec2765317214:v1
> 
> Above does not help.  Be explicit here in the cover letter by
> providing the dependency link directly.

Updated in revision 2 [1]. Please review

Thanks,
Alam.

1 - https://lore.kernel.org/linux-arm-msm/20260807-quad_dts-v2-0-6f578d4152b7@oss.qualcomm.com/
