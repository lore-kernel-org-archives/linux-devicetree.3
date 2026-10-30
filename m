Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793353242;
	b=zL3q0ED8y0cU6bq7Ikq5tUFNGHla5OFU1wfLKooQveS+3WLcDlsvEHkEcC56UJk3negi
	 uihWudiGb7QP5nq+iBM2LenRFOZyc1Y7PI+IqDQWfkyBG5ZG7Da8qGNt8RQKubLkvjcTH
	 MUj3OKID3gEDOx5WGv7sAi+Oz8gvuWfWJSyehDA1Veg21fZMe/F0svLprrieTyMHi/CuN
	 3bfnLr2B2YLHix6H48ilmowHhL7nWtywtLKsN8SKUn4MxL1SxGdikZPoQfg/2vyWguVUc
	 QMLv3DgD36PDF4pKWs/kZZSDTR6U0ttFVtq6IdUtVVIaHqdqTSWWsD+Jv+G2C7Rmlmg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353242;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HnBsAY4MVBUXy+Gzz/dg1R+0l+ciR1bE5ZQ6+70Deqo=;
	b=uv/Nekc2J+uISK1P+iqOh4d3tcOPDUQkMGrvR9WXWwA9oSkzfWtbkTQGLfd3re77YQQI
	 ubQDAEMZ/TM1Id7ks0kcqD24WISRAgsQSfGHXszUVeGQRpL6JZwz15D/hxDNWg7hc7bap
	 7zop+Z2cZrFjUCOttqKjm9AQERwlrxbegFYaF0wy37JeBwu/BSYLSc1PjW7TYiSf1pJB1
	 xWbH+hBtLROnHC7mk0Kf9Yhs54affssuFYPiF91LgfGP9lp/ep986gCN+aQQQ4ku4Abmu
	 PJn+24x8Ndi9o2cWdmTgojLbo0eLhcmsd+uT28nw0MWXwh1iHVVhF+t1KAS015Dagdw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WDUyCTsk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FN5uMiVu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C5F606A31A
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 09:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2C5F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WDUyCTsk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FN5uMiVu
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8FHhb3709622
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 09:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HnBsAY4MVBUXy+Gzz/dg1R+0l+ciR1bE5ZQ6+70Deqo=; b=WDUyCTskAnFWcD6H
	yNvcJUWE4F/A/qbRutoL34bToGe02+HXlmv1F1CRPWAAQri30zm+jlTctGK7kGTv
	u6UEvMbQICt/EWnVZJhpuUaHwfuIxyvTe9DE5wywkRwG4F+uFn4tR2QusUenlij4
	rQjcLRRR9TsDXlTmBusCR9j67p4eDNcEaLbDt4mp6lSsLHTRdVIz97u3Y3/XK7y8
	AH4ok8+XLI+ZPOXlbyLCTXg57B93rOJaAdlRS3GPPZN4nqVasr8R1OpP8l7waXbu
	1nlf846OjVYCsdMMzttrjRfyL4wj1/3t8s2mWwf90IECJfKpT2fx5BNpmMJ+ssTc
	LN1YBg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6rjb93-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 09:40:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93909014c85so89044985a.0
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 02:40:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793353240; cv=none;
        d=google.com; s=arc-20260327;
        b=EAT130oCEcrMjJA1TRkl+thfhPWi5/AWBnACCYgyCL2ckUls3DMPB9Zx0K+o7aoQ/C
         Uhg20zzQsP7j1Oh27mRwd2kSxfYVJ0pNrTUQWqrJ0+0UbpRQfbgb6S+jzISIXKM68vnN
         GLvcPjjgm1B93Gu9tqZd9nBaC6DEtiWcjbOthf8L4mtduschEfCkxtVp31v3gc0uR9kG
         w6rtrr/clE1/3HgN9rZpuQ6FoxZrZOboH21kKWyzhIObwvMqyvMveEKMZ+ABvJBe07XJ
         dnm1ZLUtHHzpOG6N1QhwQyXz5q6uIce08erTBUzyUDtoHZqq1m/xveBZUI+mqvEo7/A+
         8Fxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HnBsAY4MVBUXy+Gzz/dg1R+0l+ciR1bE5ZQ6+70Deqo=;
        fh=9xE+FVuZM2kG1QwTqfX7MR6p5DGA+vhSd2iFrLNweNE=;
        b=aChkf5EryBg4tCSEN5gFnNqqyJ0WQSwpI8uZn0Ih5V63MpYdYHGnUZl6tAD0S2DGvh
         QlmgLluTfmntFVyUiZ0kh0jdq8JTTY+IjH/1vVmlxja3v1mzqr6tRGgoNFWj3JJLtvN5
         pvv5R2zXx7n4cJCnwpi+DMxo81FtWwK8MO9e5ZiUA3yNDkvgIj1uAB9xCWv56ZdDMIc0
         56vsMJ6e5QcPIup8F3Ih0Uf10HZa3cv0RROAfawK5LjADMGHlvifx8TnZU6CpHAnVD4y
         JDkuxVV+4OrVzwiCvKelh+qaCiRHlr+I36sdXIUFhpc5skrrwBJlQi9XGkU29CY7MQAB
         tTZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793353240; x=1793958040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HnBsAY4MVBUXy+Gzz/dg1R+0l+ciR1bE5ZQ6+70Deqo=;
        b=FN5uMiVu57T1CAppK/bMjDbtJUI2ISEL+MqXc40uaLLJ8uvqHOiz6sH5V+dEUoRkrE
         mvHzYusljoz8/9kU2QXAjDm7r3KmuOv4ZUyY+HhDWPxwOJSzWg+s0RazS1Ch4HUXazps
         HUv/Mu8dj/iM3/bHVb0k8KErqNIkQqY98HH3ObovURd3MO8DViUFJbDubbHkeQUxzbet
         tUfj6yhKqzPc+ch1b984Hq5mKQAV35akLWYNCNko4KGTp6bPcRVZw9qAYGrUYH7UOiyU
         pmK9oaRN2Dg/OYxT+45nOkb+/T54ZFKP9Fq6x24OfGTMNmLltG5W/8Pvlyt44x0eYlnC
         AipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353240; x=1793958040;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HnBsAY4MVBUXy+Gzz/dg1R+0l+ciR1bE5ZQ6+70Deqo=;
        b=M1JJUsH01h7Bhgm+myJPFj6TbIa+zb6ZKXuacMF1GvZcYhYwHyOZY43B23RA2zbGif
         pmuGutEyEry6pLosApCppk98Hs/cuW+N4k6u5ZUAcu3XkC2pdS8Yi6LfSSZTuZBjEeN4
         6QaaAP9uAwTO+cdWdDNADDwVzRbSpf7dCNPB8CDBodrg6ufJbdLRWKJ99CQLs8/+ZU+F
         i9KUzHookmKL9XfkPzMLS4pCq3WSDTtM5LZe5tMTdDP3nCaAeEiOdRRy4nkt2KGeN9ef
         vZW3jyT7muyaq0LQz9L8/TBL7onZ8scv3Fd/6e8lrWMt9S2uCkrYLGhjgFcVX6oRTGOh
         Lrkw==
X-Forwarded-Encrypted: i=1; AKwUvBxvptZWywUIffcgCSS0B1rv5zSZZ7jDiF8/LHze8O9t0wfvo+epp9fFXy/acx1kq2ItcOmd4KgethSZ@vger.kernel.org
X-Gm-Message-State: AFq9FYKtTjaowU6Imhf4lxTAu1vFXYVzd9MUwRIO8Rk1lY4uT6bk6E2q
	dH1YD4LHXYRlMPlmRzueYOnGFv6Vz9voykJJavNnTKOkYrG07T48Xs0DbMKiDgvunoKhdrag9Tv
	gG9YL3izxVkO0NqserDOlRAPG1nD1qIFIZK/09MWzGPRd5fpKKJKTrEDIZBTNj9Rq3lNo5mIBgL
	V/WnAwo0tWjX8uPb1D+Z9WVgyW7CLpwNtirVu5lqw=
X-Gm-Gg: AYBFou0BV7YBc4ACUkcFZW0AAY5mi/6yPFeiiUC+NpMx/3FaOni2WBkgQxjYxmZxihW
	TnLc+8AnljuPS/RCRP4j2ZMR58bXOh0+nwtkcAy1jxcvvdJ0Ze7py7V5zDAz+BQ5ojhD9cMjCrL
	3X8cOd5Z3j/DOxdL2xwKUUNDqvEHwW3gLbL8P4Q0McGHXc6Zb9oFhidy0SXBHSyWx66I/3tAFGU
	74UYvizNhxw43GwerUcqv+6ASGpNpU1NznTl+sLMG51HXpz0xjU5o0y413F7yGZBMOGXDMIayIb
X-Received: by 2002:a05:620a:444f:b0:93f:5717:e7b9 with SMTP id af79cd13be357-9442177e372mr252812785a.30.1793353239916;
        Fri, 30 Oct 2026 02:40:39 -0700 (PDT)
X-Received: by 2002:a05:620a:444f:b0:93f:5717:e7b9 with SMTP id
 af79cd13be357-9442177e372mr252808785a.30.1793353239275; Fri, 30 Oct 2026
 02:40:39 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-camss-fix-v1-1-ecc170342d0d@oss.qualcomm.com>
In-Reply-To: <20261030-camss-fix-v1-1-ecc170342d0d@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 10:40:28 +0100
X-Gm-Features: AclHuK_Nb7z64_X16sSt8eZ5KfEgiXwPK7nYj7Hkj0Nd7L6xMjrKtPUseHaWH2s
Message-ID: <CAFEp6-2b8M48sxvV-bux_cxBJ-jzpputHdJrBORJ4d1w51nzSw@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: camss: vfe: Clear active buffer pointers
 after flushing
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Todor Tomov <todor.too@gmail.com>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: LhI4mZnkqU_DuT-0DXYywHQkBaXqYo7A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfXzs4Sb7/jXhU+
 V+QeVUNfG5a/w37b+GnB/hkJBeucutRvkaU6lbSrPuvuQo1jUNZ63byXtTjhdIGPaXc6NrWujo6
 nPzfFirs9mv96iv8zIgSKM1MDZSy0YE=
X-Authority-Analysis: v=2.4 cv=PIqaavqC c=1 sm=1 tr=0 ts=6ae46619 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=7MKz-gpKVdlp02d5jGsA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX5KGUm7+aTm2X
 1kt0pO52+CzYKxr/n6wGySEL7C8uLjg/WKokoGNoujfIPLHrqjCLo5Z9qz6z8ET4jmEfaUoTKOp
 4lZNLL3GFoPDkpovlMQnoa7mukNqbuzp0ow/x8PjZuquvV9SJjwoSq7jlyK6vQtkEFkUnCsOSVB
 E4uV/JBFJ1Gq11gjc9T3NJd5XQ8p5O6VRpZyB4T0YiZuKZXuBIl49md5Dbr5gX6nKeJqtwxsrVm
 u7T/FZomwVx67oob91n0CtJ0tS8tM38HvY21knYcKhDM/qAwAtXABJEg3QTzaCjB1mfnstxeNUA
 n8JXlyz/g8nxPBblY/UF83nfKZeVn0PrZ0nxaz3vcG0S6sdatlK9YzxIwvYcEFqXbkciy3IGeho
 P73xYftaQMt2ggJ149Qlj3xdggvpOfJF9RWIXPnv1lr4en/HHCPcQZywL+2sTQoLi5mpEvRDxKp
 b6lffiy+V/1uVoPWLpQ==
X-Proofpoint-GUID: LhI4mZnkqU_DuT-0DXYywHQkBaXqYo7A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300038

On Fri, Oct 30, 2026 at 10:39=E2=80=AFAM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> vfe_flush_buffers() returns all active buffers to vb2 but it leaves
> output->buf[0] and output->buf[1] pointing to the completed buffers
> despite the lost of ownership.
>
> This can lead to subsequent flush or completion paths operating on
> stale state and potentially completing the same buffer more than once.
>
> Clear the buffer pointers explicitly.
>
> Note: vfe_enable_output_v2 is supposed to overwrite those pointers with
> pending buffers when streaming is restarted, but nothing guarantees that
> enough pending buffers will be available to overwrite all entries.
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-e617a776-3d96-47cb-8d60-a769340c2=
5a7
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Fixes: 4c98a5f57f90 ("media: camss: Add VFE files")

Please ignore this patch, wrong commit command....

> ---
>  arch/arm64/boot/dts/qcom/monaco-pmics.dtsi    | 2 ++
>  drivers/media/platform/qcom/camss/camss-vfe.c | 8 ++++++--
>  2 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi b/arch/arm64/boot=
/dts/qcom/monaco-pmics.dtsi
> index 361f5163b6d91eef794d3bf86b374d4dcbc6d60f..1ed4de00b1a3e23e1ef0f1c41=
2a2e29bf840c870 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
> @@ -58,6 +58,7 @@ pmm8620au_0_adc: adc@8000 {
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>                         #io-channel-cells =3D <1>;
> +                       #thermal-sensor-cells =3D <1>;
>
>                         channel@3 {
>                                 reg =3D <ADC5_GEN3_DIE_TEMP(0)>;
> @@ -112,6 +113,7 @@ pmm8650au_1_adc: adc@8000 {
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>                         #io-channel-cells =3D <1>;
> +                       #thermal-sensor-cells =3D <1>;
>
>                         channel@203 {
>                                 reg =3D <ADC5_GEN3_DIE_TEMP(2)>;
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 2680a9914765fa2c8f3c2b38a5f4f0e0bcf4d873..8e297e2bcafcbf30b09fc2ad6=
e57f484a4e41898 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -1187,11 +1187,15 @@ int vfe_flush_buffers(struct camss_video *vid,
>
>         vfe_buf_flush_pending(output, state);
>
> -       if (output->buf[0])
> +       if (output->buf[0]) {
>                 vb2_buffer_done(&output->buf[0]->vb.vb2_buf, state);
> +               output->buf[0] =3D NULL;
> +       }
>
> -       if (output->buf[1])
> +       if (output->buf[1]) {
>                 vb2_buffer_done(&output->buf[1]->vb.vb2_buf, state);
> +               output->buf[1] =3D NULL;
> +       }
>
>         if (output->last_buffer) {
>                 vb2_buffer_done(&output->last_buffer->vb.vb2_buf, state);
>
> ---
> base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
> change-id: 20261030-camss-fix-4972697ef90e
>
> Best regards,
> --
> Loic Poulain <loic.poulain@oss.qualcomm.com>
>
