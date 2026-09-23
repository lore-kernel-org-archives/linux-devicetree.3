Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8B6528421
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790171272; cv=none; b=Yg0BlT9LDMPyot8B0uDdBWvxsQ8gSFFWgx2A/HpEbj39HxDfpYUSqfJ5qqDHyss56YgWeP1gh/5m21ujrsfJavg25FoDd2k+PFDXppJZnOx8IVlZvz7s3eeeH1APSIziigsyrvYIEKzNeT+GB7Gy3hlKD5iNuci7FLtOj8xJHM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790171272; c=relaxed/simple;
	bh=6TDPy8HiYvIK8BLqW2Do+y5gjPAR8+4NGldT85qKbrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z7iqNHMA+DGT1htq20MaLyvLDBNbaefP66Vcw8PN4a7Te4rh9zaiXJmZazRoFfMKTpi/3lB5lCmMTCnX7tz9lBmpLBKJ2WkI9giW29j/VISe8lZJraUkZwZctnEsC9OUXq4pAjgR6z8dp7AjOjX/nIUqtsCFklK5fGQryYQPs04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ouz0sEQ5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g+ryjQtN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ouz0sEQ5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g+ryjQtN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDKwHX2056502
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f6RI1UfnbG6hFkuz5mrr0mPm
	fiG6vQKcsGj0ghcQRnw=; b=Ouz0sEQ5Z1EzgpA+sBFnsAqN+AmCuuWpBraGa0ZX
	Zq3FTOOluaUz2Vgun9HijmHwHaFW4q9TIAwiRhOCAoxv7ymtmOTC1D2O+J4uqT36
	WzkpTDUWY0JY4npF/lv2+lz/B8W6NJRCVf04y4OLypidoYWTijt5+iDJ3rAujRLh
	MfixR9i0FMFNf2qHCo4XEhORisXX/oWv34j+OmDLk9Nfdaxvn2s6mwltomwpRo0q
	cp3uFv2ue8vwYWPyVdcQKUElkDT+N4EyvtXv7RQLB7d8p5RetSLnhLpFqMrMvwp3
	1bTGZZTKJXfpF1NMfH5NQ8Ymc4kEsChlUGGwDR+kkASZsQ==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjv03u8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:47:50 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-46f9dbad956so725895fac.2
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 06:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790171270; x=1790776070; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f6RI1UfnbG6hFkuz5mrr0mPmfiG6vQKcsGj0ghcQRnw=;
        b=g+ryjQtNlJ5nE9s3BO/VFAQsAu3/mQs7/Xvbq/6SshI8fJdPw+s7FXw5mnbf6cN50C
         46mn+xiOgSZu/7qIvg5hT9neAa0KbqqIxIGi9+nTdQGMuKs+vMxPw1mJmwBjNGi7Hexk
         jZWqY72ohofytAh8yl3GEx13ceS9KR3T0VY0IR++6mcZymU6rKkm9ettUOFVOYlysDYO
         hA8xZx5YbF3GSqRALrXb+Pwp9Nz/qF9vxdfroHCY9R+Ttl5FQgpdTHUkUx3KZ7xLq/zK
         bGlggAaDOGqyhK53mWFJS+yJBZGu9y0r6Bz9vbsT76ve74SKXtwhWwAJt+9edG6IkaW+
         hKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790171270; x=1790776070;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f6RI1UfnbG6hFkuz5mrr0mPmfiG6vQKcsGj0ghcQRnw=;
        b=OSpdVHJiLegY43QhDpm+J3Q1gNYayT/EZ57WhNa6///z7JvNq8OKG/CMovtMXnY5oA
         0p5QSFEcEsnKc6tm5BGDBF5cGGkNz9Mcl3gCpLfkMKnLFtm8UPS9S64BINOKWAu7qocl
         svZ6nOox107WSO1avh13uEaM5JaKrmUuU0C1OsJ8Q5awnB+LhDzQZyeM5kbykLEucees
         L8AnhyB7P9USy/W5Wgwhfcl0ArEPX6+MrpIYsbLpqHQqNLx+fcWsOOSPUVlEUnc9YE2e
         mb+wCAQm3FykTzfbLeVUWYq4KC+2yCbaGTEjBB4BvEHkYLoFE9HruNKJQytXIHBQ7ox2
         7n5Q==
X-Forwarded-Encrypted: i=1; AKwUvByyBOPwuHHQFQxICPCUpcGDDDdWySnEsrqowCisVklX6BTnT6dscSEe6S9C0a4wsvoCQgKronBrgaKi@vger.kernel.org
X-Gm-Message-State: AFuF++l0iS4I5xA8Zg7y/7zIF+MCQvETYyWl1xIBU5i07rxkgUvGrWpQ
	FbOHzG/PFKBcScbvwHvZYJIg5Bfz+u1/PbIeFFaWX72RgxOxRQ9VPDHkcWnvahrsbGPAzBVQVDl
	3uKNhk89DI01fZsF34AzED2uEQkQLXHEoWr4FbA64j3+hTK2dUx1/0Fll5JH7Fmcra/w84d1aFU
	M=
X-Gm-Gg: AYBFou1PWC7KOBznhj+7Mn+mM+72MldyEz925YVUqkSl2g4QHf2xVdkkzqZPiKvnZAh
	G4QcWxgLkSWqZF/7DGb6tc6C7vdLaHw5JuoAKmxdIeyXetZuqq4sNt5oDVUlmXymzpv9CybTSvc
	iTCBrpoe0xTXTDtrHd4zDNvm3DfXkT/WVubPglPUQAceN4uPS2skCvPBs7MtbBqDBhegiCnWP8r
	XUzoU4jKETXF5cYiISpJ6tsUQaJUNbjgrXDvu4skta9bfjcrogn6Zxxn0ii9A4SS4TdDoqbA7Gn
	gbjR9kudRw4xV0Pq9oFGyPVRVh5cdGyRIbo9vRvCjwOly/K2Ysw+Oi3NgCnuqqME54CkeU/tS6S
	K0qndq/jvMTimOfBVQQ3bu6m5ObE6CqebyORpTNbSpw==
X-Received: by 2002:a05:6870:3806:b0:483:67d7:e03a with SMTP id 586e51a60fabf-49089d5da63mr2560979fac.11.1790171269660;
        Wed, 23 Sep 2026 06:47:49 -0700 (PDT)
X-Received: by 2002:a05:6870:3806:b0:483:67d7:e03a with SMTP id 586e51a60fabf-49089d5da63mr2560957fac.11.1790171269214;
        Wed, 23 Sep 2026 06:47:49 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4908eba2f0csm1710925fac.14.2026.09.23.06.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 06:47:48 -0700 (PDT)
Date: Wed, 23 Sep 2026 21:47:41 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] media: iris: Add support for nord platform
Message-ID: <arPYfVPIWblIayxl@QCOM-aGQu4IUr3Y>
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1NCBTYWx0ZWRfX/mCztoo7MOBv
 c9bCbkWqk7EMLCorRNtMjgN+0XcUABUn83m2KetJV3sxdy8UU/LafG8bMO1GNF0z7Rlh6sq6pPA
 qQJMasiO+dpn8h1KkN9mrLBCX2Oamikn47rh/a2TAUFYt8vOMaI9twOBHKSS81IrZH734IOMtaa
 CflFe2IcyAR8emby2y/NfZzon0rnxo14YkD4e6W7z0xDjIIfTgiiCISaGF4hdc1ubAZNnAc+nOW
 CFjl69Hy5PkRQWEzQC2Xr7jfuDS1XzAtFkcXlv+GDd4EOMoKLbzaYA7p3q2rkxEUtyt8Vmb4njq
 SlIYfUBhnOUEeycnE8k3eEZnR8Bi0FsQUuUAxz/RilesWbwQcrPfeQAxeszMX+JjEwybpVETEbx
 xkflU9YbxW41ojqwV1kTMM2IFJ1zKPud0dJNRVCYCpugCuB096TqgFEqbN+rW8VKDfqttNMWOkt
 xtJ6y/yXtZkqKb1g02A==
X-Authority-Analysis: v=2.4 cv=aIxlOr9m c=1 sm=1 tr=0 ts=6ab3d886 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=2wm1sE6lh8PoynkbDlcA:9 a=CjuIK1q_8ugA:10 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-GUID: 4nBGvWRK6ZQ9FZX1pxCHLEqMCOSPcwTt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1NCBTYWx0ZWRfX3+Ai1sFbxsfV
 vFmb7aa/Wn7FD8MCaDgJ/sVKphh/r4dqu/m1bYJmehIsgj5dMqUPCVtSnCvImP1GgdNfksf1rPZ
 v96KqQ4Zd0vQ01/LIbiaWMBwAQybuWQ=
X-Proofpoint-ORIG-GUID: 4nBGvWRK6ZQ9FZX1pxCHLEqMCOSPcwTt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230054

On Sat, Sep 19, 2026 at 10:14:54AM +0530, Vishnu Reddy wrote:
> The nord platform integrates the Qualcomm iris video codec hardware,
> which is compatible with the glymur based iris implementation.
> 
> This series reuses the glymur DT schema to accommodate nord iris
> support and adds the required iris device tree node to the relevant
> nord device tree.

[...]

> Vishnu Reddy (4):
>       dt-bindings: media: qcom,nord-iris: Add nord video codec

The binding should go through media subsystem. That said, this series
should be named with "arm64: dts: qcom: ..." and only contain the 3 DTS
patches.

Shawn

>       arm64: dts: qcom: nord: Add iris video node
>       arm64: dts: qcom: nord-ride-embedded: Enable iris video codec node
>       arm64: dts: qcom: nord-rrd: Enable iris video codec node
> 
>  .../bindings/media/qcom,glymur-iris.yaml           |   6 +-
>  arch/arm64/boot/dts/qcom/nord-embedded.dtsi        | 114 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/nord-ride-embedded.dts    |   6 ++
>  arch/arm64/boot/dts/qcom/nord-rrd.dts              |   6 ++
>  4 files changed, 131 insertions(+), 1 deletion(-)
