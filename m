Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793367592;
	b=eOkngJ2vKmiDEJChB1W7HPnoGffAuH4rRan+sR16hIwryIMGW1sKGjLNtCi+TBwGmeld
	 jCJF8RjCzuLfj2YboCFtae0qV1MnEqh5bFjnPDFRs/2AP8b4EOfAigWFqANrvnTZ7F+bu
	 Y26+6c1YbgI/9YNnahLxC5dvCOugsdHBwZ5IwLhgUp+Y/qeGO3w9exJuhaLSEwUkm+P7i
	 T9dptmmHemx7EXBvaN5B5b51f2vFzxreiT40xsiBY62LpNe3tzizF4t+643ngX14cgfKs
	 1KVrN4JmvAokctYyXpDREJny0xnYAzXjIlukj5Q9LysB7xQxJXN74KbT+dZWXGxl4Ug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793367592;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VtfpJiozR34O//y13/JVtb6BcsPT/oxxaS9TsgU+HW8=;
	b=Ot+2TTPrS0WWU0z1H3QxI+mD8+bD9AikkNqvQExfaeDJaY5pRg2Gjn63BlSofsRXmqi2
	 Xt2aYuPKIYvx++1HqgNbJaNXI/e7YHKiPWny2upFri0XOsiZzBRMUdetF8aH5Xiin4rZC
	 hS+LytvsbB4V3ZtQF55W2uAYmhmqH7zyEVjlaXkh3INdOodVdmoKVFYaXFKBgdJVA9p/V
	 JJpC22TCf/Ec9xh2CG9EexTYbhw212Cw2p6oW8e3a+Clk+1jEkDaipaQ+LfVEKadkPyY+
	 Oi8UciS3W0lESxi6LEcKlGOUPDUfxyvwOv9WtPPhVvcVO7HEzqMHSE9rvV8nOAtU/5A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WK2Wc76V;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=emZJS60N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6872D606A31C
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 13:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6872D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WK2Wc76V;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=emZJS60N
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBGGfj1527601
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 13:39:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VtfpJiozR34O//y13/JVtb6BcsPT/oxxaS9TsgU+HW8=; b=WK2Wc76VP7GIhWGZ
	iS0jQVIqE9YDvFjfC5i3RWRbFLLzsbef9CAitv7HyptCgvSv4+Cj/FkJUTg6BYa9
	96fLl3U5crvmYEkYDzn8hhK0MXutXJyhIBv6qlSEuh2swAC0RkPkRcN0ASqIs/Rv
	gh2jEVimi0OobdVxuOIeDem426k3mXw8HVayLF2td4uxxxN1JjeXviy8JyNqd/PX
	RMlVlnkVvbxfWf97+t6OcXb5VkHzs2aepp05gHby/uruB97rp6j1kP7f0B+vBgdY
	MRX8+P0787Wp/sCGz3CgiNxBDN5q3sAEOXur/MN51EFXMX6xRhF7yBaRMbVrJyvd
	P1kQdQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pk9b0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 13:39:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb93c874bso341823285a.0
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:39:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793367591; cv=none;
        d=google.com; s=arc-20260327;
        b=hrtZHErn8ZT60HYzsCastrCPjogUuKVksVE/obP/ko7CNCmtzWfUqqPYROW+4WPPy8
         yLw9TwScBCPZDM2uADrPSkACUT6XJQWDdUlxu2FzdFwJUUuVxmyfTw3ONsI1vmHlVjIN
         cqitHeBaJvl9zxqXJyCR8wJPrD/LnjmaUBEyvGbATfN3mDQt0PHs/0/z0VNHtiEWHR7O
         YVBu0niTcwAYERCb6lEhFSeBX6N7JF2BOUmt/TmdvZZzXVnoiXEOPCk6H6yBmRp07OQY
         46cMLkqwRricYpCtMZBH7eIteHV4ySIdtAbceSL1T0cuyOLcJjgZDMr6F/p7QyqxOnOG
         qYAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VtfpJiozR34O//y13/JVtb6BcsPT/oxxaS9TsgU+HW8=;
        fh=93er63xfGSN48zKriszeM0ZJgcQwkOuVArxWxc2Cp8k=;
        b=Er4qCr7a7/4Dl7/V8z1JjgOexFRT9Q4bJsfZwPqt1uqNobkckbffBYLyZnY2ib6lAs
         LVPcFAJzrO6xwhOIxGWrfH/Xi4a+ITLd6CBaXmeEgySgfbGEurdNsVh/QSRVLU+jaWJ/
         exKm6H0XZcg6hCBPfceYeWWl2zNW3H3JP+oXY0miAMG9UR2yE71ryxZGiLt1PJvuYC9R
         lxAL0pA01NKBvFnaV8C+asNqditeVn2mduaiVvp2LqODU64P3ElH1Vc91EL1CP7Rjg+O
         ykwBsTg7Zwc/NtAtHmKrnEo878vn6hvwE/U+orA6bXd0I5b7OKuB8SvYJEBtXUGCCcXZ
         VP/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793367591; x=1793972391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VtfpJiozR34O//y13/JVtb6BcsPT/oxxaS9TsgU+HW8=;
        b=emZJS60N+ELqpZhCh4svuJBjUcF/bGA6SqyocVE79W7LgB/4VSS27JIqS0NoZNbT3+
         bRalHCzK7li+2TPfA5zOIynK80/8i62Giu+A2R7SOa4PmSCXcsef8b/VUKjmctwS+sZ3
         kZ+ZXjq0uwLj+YHlrkWFMjhkVj/jR3u5RcnaEaSbepjl6vzotBfkBSClYDq/VBAgCKwY
         cmiU9lrkdoYAz/l9VEE6Nk0fqhkXruM5hQzbepOOc3KMpr44GVbyPLAjTOAAOth0DEXH
         QPD+9XtEUMVeLgT3/lXLkdyDsDfQLQomteg/T4jAkwuHDTZICvvacRpYInd27dGa5yc0
         rq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793367591; x=1793972391;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VtfpJiozR34O//y13/JVtb6BcsPT/oxxaS9TsgU+HW8=;
        b=eOGYgfv9cCFo52THgIdawVFwPi7+Qp/osHLoXlomqZ1EY8ctOlJdFzSxJ0NeCOzgNk
         bzl9uy+vqxHC4SlRMeqg6uoROmWVnQbzWHvRhJdOWQaOAFFP+cwZ82ytNzzWJ0bxLa2H
         4UDKEGuGY9JBAZfCWTo8itDQZkhr5MlNaLqxGxcLtiVsOx2fIXAP7vFdbm6prz9tCL8z
         niVnTsKeBsX2ltW52BVs3lUu2DT+JRteswmt+5LNMYUtqGyQ2vFYGTfwlxnxa2Yo05JB
         AziaFT2TqURqZxuIF0idDRxaI9AYEOGsGZ0B5rgFUM72ZjZI5jupCrsGj1do7CPfkPYA
         e/Fg==
X-Forwarded-Encrypted: i=1; AKwUvBzyeoL0cr0xEep39Ek/DY+84fdzvK72fX86ScJVQbz3lNMpl7hTkAEX4RKBFDu7MuSqG8gBjDUqNkfk@vger.kernel.org
X-Gm-Message-State: AFq9FYL4uMk17bKfjEUqsAfAY18Ug87FuTXTYM3CuthG6u06esYcGp94
	KxY/9+mSrGYd3zWLIhQxEMvZOd75tIfnuQrOMnvD6nhCtDp9lD8B4U6A5YLoZarp4C1vWKb/jdM
	Hj5xFHcB2L14yPqdjw7ZdgzIsBsOT+i+Q6ZmpmQDh4QtUSBv406w7l/bZy1vuozp5IpSQGQExnh
	PFaJYQFxVsP6eaqS2zKJW9ZRNh8fEfuLg6m3vYMu4=
X-Gm-Gg: AYBFou15Uu3Q4xtbuu3YwHS7/GMRMp8RJgr0zz0x2KCsEZX7fwO9MPCRnrFcNyKMoyn
	Q5LRtZsJSyQQHI2OjPrLRgMQ/4DFOZ+She4ENaQf2Y1edDABsObFW2gHpISFBl0IsGOAmW4oG2C
	DLsNNUAXxbSEAL5aOjnZ2b01mulhzX2/+fJRPMOMKwQdXjSq/cMxBS8kRGmg/mD7MNp1R8rIUUT
	lFoeX9LC2q7t+81FwBVzLbLVCKCF9/w6jBeVDzUky8IusI0NEdyrbu7E0s0hppqG3JUt2XHKCRJ
	yeM52rSN1KfXY4tfU77xidWNM7C8
X-Received: by 2002:a05:620a:4686:b0:93f:717e:412f with SMTP id af79cd13be357-944216bc9bbmr338133385a.23.1793367590459;
        Fri, 30 Oct 2026 06:39:50 -0700 (PDT)
X-Received: by 2002:a05:620a:4686:b0:93f:717e:412f with SMTP id
 af79cd13be357-944216bc9bbmr338129985a.23.1793367589937; Fri, 30 Oct 2026
 06:39:49 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com> <20261030-hawi-maili-camss-v3-4-9742bca8cef2@oss.qualcomm.com>
In-Reply-To: <20261030-hawi-maili-camss-v3-4-9742bca8cef2@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:39:38 +0100
X-Gm-Features: AclHuK_HjvBA3A91XQzKnsDL6zJUl48jHFR9jQAfnh-yPZtylMtDolRCG8Qrtg0
Message-ID: <CAFEp6-2htz4rbyeZHBgCVAfS3qvP8r5J-m1oQq6UMdxoHKssgA@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] phy: qcom-mipi-csi2: Add Hawi support
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfXxKMWx2rU8anp
 yZdrDMuPiikbVljVjMpRZeeS3fM7O+2knc/AFxCF9mnfJ7czZUdh2caMUEZ/Jz8hlSJhKkfMdGE
 tiyRPYZwRYAQ8T/xis2pGFDluRlV0gPc0A4a6akzqX5cSq2Ubje1bWIOeIshzd8W/pSA5grTsmj
 K+skrW6oPgKVrrGZIBZuDigmuhjKS14gu/S0X0hciWxqEu+vlNtIVmau/WBO8SjZx9JGhD5DXsD
 dnAKoAbTVywzrGX42GRKxW4ELsWHG29kv7jkufyud16oCRGsxYbSkItaSh8fthLOKrFlkdx+zr3
 opHrHiOI46zgFEgfG3i6GzLI4n8PZwjronYxsxFMmNY0Qt/X31mwm9HmYHyPEVnvwtz/txwRLCl
 RQR1NVuBR4mHAs4FMGeamNel9TTUpTr9/Dnk9f3l4uPATAvwi5UbF+HAjESwZS/X05H1TnPkvDW
 /udRRobic3yoEXR7Rlw==
X-Proofpoint-ORIG-GUID: mlnP6jxLH6BeEzp3Wo_Vk-D3ZWFvLX57
X-Proofpoint-GUID: mlnP6jxLH6BeEzp3Wo_Vk-D3ZWFvLX57
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae49e27 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=2WJT8NG7GnMvxSP6HGIA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX3q/9o1fezdsy
 kcdIhSFOaVUJDzhJjTs8lopo9Au7ZGpqUXszZqpoMOHTMXilT/LiGcI68J7aCyHK2MwIjMK30wq
 jw98uV7K5tqWHhHGbARzV8NDeFGK5Rs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300054

On Fri, Oct 30, 2026 at 1:43=E2=80=AFPM Nihal Kumar Gupta
<nihal.gupta@oss.qualcomm.com> wrote:
>
> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>
> Add support for the Hawi 2nm CSI-2 D-PHY.
>
> Reuse the Kaanapali lane table and adjust the data-lane CTRL0 value
> from 0x8e to 0x8c for Hawi-specific tuning. This prevents potential
> stream stalls and SMMU faults.
>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 136 +++++++++++++++=
++++++
>  drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |   1 +
>  drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |   1 +
>  3 files changed, 138 insertions(+)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers=
/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> index 658a39463104bedfa31d0ccb81fd9d34017e91a6..1e9bb8b9e50bb15e7fad3c6e3=
d6048bf049e3e64 100644
> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> @@ -162,6 +162,126 @@ mipi_csi2phy_lane_regs lane_regs_x1e80100[] =3D {
>         {.reg_addr =3D 0x0c64, .reg_data =3D 0x7f, .param_type =3D CSIPHY=
_SKEW_CAL},
>  };
>
> +/* 2nm 2PH 2p5Gbps 4 lane DPHY mode, Kaanapali table with data-lane CTRL=
0 0x8c */
> +static const struct mipi_csi2phy_lane_regs lane_regs_hawi[] =3D {
> +       /* Power up lanes in 2ph mode. */
> +       { .reg_addr =3D 0x101c, .reg_data =3D 0x7a, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x1018, .reg_data =3D 0x01, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +
> +       { .reg_addr =3D 0x0094, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x00a0, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0090, .reg_data =3D 0x0f, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0098, .reg_data =3D 0x08, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0094, .reg_data =3D 0x07, .delay_us =3D 1,
> +         .param_type =3D CSIPHY_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0030, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0000, .reg_data =3D 0x8c, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0038, .reg_data =3D 0xfe, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x002c, .reg_data =3D 0x01, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0034, .reg_data =3D 0x0f, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x001c, .reg_data =3D 0x0a, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0014, .reg_data =3D 0x60, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x003c, .reg_data =3D 0xb8, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0004, .reg_data =3D 0x0c, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0020, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0008, .reg_data =3D 0x10, .param_type =3D CSIPH=
Y_SETTLE_CNT_LOWER_BYTE },
> +       { .reg_addr =3D 0x0010, .reg_data =3D 0x52, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0094, .reg_data =3D 0xd7, .param_type =3D CSIPH=
Y_SKEW_CAL },
> +       { .reg_addr =3D 0x005c, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_SKEW_CAL },
> +       { .reg_addr =3D 0x0060, .reg_data =3D 0xbd, .param_type =3D CSIPH=
Y_SKEW_CAL },
> +       { .reg_addr =3D 0x0064, .reg_data =3D 0x7f, .param_type =3D CSIPH=
Y_SKEW_CAL },
> +
> +       { .reg_addr =3D 0x0e94, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0ea0, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0e90, .reg_data =3D 0x0f, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0e98, .reg_data =3D 0x08, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0e94, .reg_data =3D 0x07, .delay_us =3D 1,
> +         .param_type =3D CSIPHY_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0e30, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0e28, .reg_data =3D 0x04, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0e00, .reg_data =3D 0x80, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0e0c, .reg_data =3D 0xff, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0e38, .reg_data =3D 0x1f, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0e2c, .reg_data =3D 0x01, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0e34, .reg_data =3D 0x0f, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0e1c, .reg_data =3D 0x0a, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0e14, .reg_data =3D 0x60, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0e3c, .reg_data =3D 0xb8, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0e04, .reg_data =3D 0x0c, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0e20, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0e08, .reg_data =3D 0x10, .param_type =3D CSIPH=
Y_SETTLE_CNT_LOWER_BYTE },
> +       { .reg_addr =3D 0x0e10, .reg_data =3D 0x52, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +
> +       { .reg_addr =3D 0x0494, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x04a0, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0490, .reg_data =3D 0x0f, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0498, .reg_data =3D 0x08, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0494, .reg_data =3D 0x07, .delay_us =3D 1,
> +         .param_type =3D CSIPHY_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0430, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0400, .reg_data =3D 0x8c, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0438, .reg_data =3D 0xfe, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x042c, .reg_data =3D 0x01, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0434, .reg_data =3D 0x0f, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x041c, .reg_data =3D 0x0a, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0414, .reg_data =3D 0x60, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x043c, .reg_data =3D 0xb8, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0404, .reg_data =3D 0x0c, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0420, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0408, .reg_data =3D 0x10, .param_type =3D CSIPH=
Y_SETTLE_CNT_LOWER_BYTE },
> +       { .reg_addr =3D 0x0410, .reg_data =3D 0x52, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0494, .reg_data =3D 0xd7, .param_type =3D CSIPH=
Y_SKEW_CAL },
> +       { .reg_addr =3D 0x045c, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_SKEW_CAL },
> +       { .reg_addr =3D 0x0460, .reg_data =3D 0xbd, .param_type =3D CSIPH=
Y_SKEW_CAL },
> +       { .reg_addr =3D 0x0464, .reg_data =3D 0x7f, .param_type =3D CSIPH=
Y_SKEW_CAL },
> +
> +       { .reg_addr =3D 0x0894, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x08a0, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0890, .reg_data =3D 0x0f, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0898, .reg_data =3D 0x08, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0894, .reg_data =3D 0x07, .delay_us =3D 1,
> +         .param_type =3D CSIPHY_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0830, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0800, .reg_data =3D 0x8c, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0838, .reg_data =3D 0xfe, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x082c, .reg_data =3D 0x01, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0834, .reg_data =3D 0x0f, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x081c, .reg_data =3D 0x0a, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0814, .reg_data =3D 0x60, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x083c, .reg_data =3D 0xb8, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0804, .reg_data =3D 0x0c, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0820, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0808, .reg_data =3D 0x10, .param_type =3D CSIPH=
Y_SETTLE_CNT_LOWER_BYTE },
> +       { .reg_addr =3D 0x0810, .reg_data =3D 0x52, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0894, .reg_data =3D 0xd7, .param_type =3D CSIPH=
Y_SKEW_CAL },
> +       { .reg_addr =3D 0x085c, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_SKEW_CAL },
> +       { .reg_addr =3D 0x0860, .reg_data =3D 0xbd, .param_type =3D CSIPH=
Y_SKEW_CAL },
> +       { .reg_addr =3D 0x0864, .reg_data =3D 0x7f, .param_type =3D CSIPH=
Y_SKEW_CAL },
> +
> +       { .reg_addr =3D 0x0c94, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0ca0, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0c90, .reg_data =3D 0x0f, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0c98, .reg_data =3D 0x08, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0c94, .reg_data =3D 0x07, .delay_us =3D 1,
> +         .param_type =3D CSIPHY_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0c30, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0c00, .reg_data =3D 0x8c, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0c38, .reg_data =3D 0xfe, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0c2c, .reg_data =3D 0x01, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0c34, .reg_data =3D 0x0f, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0c1c, .reg_data =3D 0x0a, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0c14, .reg_data =3D 0x60, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0c3c, .reg_data =3D 0xb8, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0c04, .reg_data =3D 0x0c, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0c20, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0c08, .reg_data =3D 0x10, .param_type =3D CSIPH=
Y_SETTLE_CNT_LOWER_BYTE },
> +       { .reg_addr =3D 0x0c10, .reg_data =3D 0x52, .param_type =3D CSIPH=
Y_DEFAULT_PARAMS },
> +       { .reg_addr =3D 0x0c94, .reg_data =3D 0xd7, .param_type =3D CSIPH=
Y_SKEW_CAL },
> +       { .reg_addr =3D 0x0c5c, .reg_data =3D 0x00, .param_type =3D CSIPH=
Y_SKEW_CAL },
> +       { .reg_addr =3D 0x0c60, .reg_data =3D 0xbd, .param_type =3D CSIPH=
Y_SKEW_CAL },
> +       { .reg_addr =3D 0x0c64, .reg_data =3D 0x7f, .param_type =3D CSIPH=
Y_SKEW_CAL },
> +};
> +
>  static inline const struct mipi_csi2phy_device_regs *
>  csi2phy_dev_to_regs(struct mipi_csi2phy_device *csi2phy)
>  {
> @@ -405,3 +525,19 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm=
_kaanapali =3D {
>         .genpds =3D x1e_genpds,
>         .num_genpds =3D ARRAY_SIZE(x1e_genpds),
>  };
> +
> +const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_2nm_hawi =3D {
> +       .ops =3D &phy_qcom_mipi_csi2_ops_3ph_1_0,
> +       .reg_info =3D {
> +               .init_seq =3D lane_regs_hawi,
> +               .lane_array_size =3D ARRAY_SIZE(lane_regs_hawi),
> +               .common_regs_offset =3D 0x1000,
> +               .common_status_offset =3D 0x138,
> +       },
> +       .supply_names =3D (const char **)x1e_supplies,
> +       .num_supplies =3D ARRAY_SIZE(x1e_supplies),
> +       .clk_names =3D (const char **)x1e_clks,
> +       .num_clk =3D ARRAY_SIZE(x1e_clks),
> +       .genpds =3D x1e_genpds,
> +       .num_genpds =3D ARRAY_SIZE(x1e_genpds),
> +};
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy=
/qualcomm/phy-qcom-mipi-csi2-core.c
> index aff9e66f0352e1d4d7a07d10d350ea2cba6df233..76c55f8e30b8c629818762d0b=
42a7dc4ddc6716b 100644
> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> @@ -445,6 +445,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_d=
evice *pdev)
>  static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] =3D=
 {
>         { .compatible   =3D "qcom,x1e80100-csi2-phy", .data =3D &mipi_csi=
2_dphy_4nm_x1e },
>         { .compatible   =3D "qcom,kaanapali-csi2-phy", .data =3D &mipi_cs=
i2_dphy_3nm_kaanapali },
> +       { .compatible   =3D "qcom,hawi-csi2-phy", .data =3D &mipi_csi2_dp=
hy_2nm_hawi },
>         { }
>  };
>  MODULE_DEVICE_TABLE(of, phy_qcom_mipi_csi2_of_match_table);
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qual=
comm/phy-qcom-mipi-csi2.h
> index 2355a1db9b941469325646ef81d0f70c6a2badc4..4ad058b916ebba8b319cb297c=
231cba10d3ec602 100644
> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
> @@ -95,5 +95,6 @@ struct mipi_csi2phy_device {
>
>  extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e;
>  extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali;
> +extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_2nm_hawi;
>
>  #endif /* __PHY_QCOM_MIPI_CSI2_H__ */
>
> --
> 2.34.1
>
