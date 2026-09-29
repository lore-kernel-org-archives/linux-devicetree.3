Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E7852BE40
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688870; cv=pass; b=cdbqnii9Vy+KsfGJcfuAEShbKefDQMK3ZLpTdYr+g+RhDk1iQxrGK1ieDDTbopmXJ+C0sQp+MlzEIajjciNEwm2JrSgCry2YhIqjYvqq8cmu/UjXN8D4GpDsLNDjcNAgWl8AWGSHdF8oI9VpqIYHyD887zYqa7K96u1oXitI+pg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688870; c=relaxed/simple;
	bh=aatIQCpb5b6E18tOT607YiK+lREgF4JTQbKPFrO+iVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hbOkNIt7FBGfRbNW8SkHfCyv3XqeBHa0+J+x2nURHupgY9qEWskuOYDcB9v4FbzH0vMpQ1m2SA+vf6FtFvtFiSN5/x+5+qnRjkiwafEL8RNxgu/V7M1UvvToYly9/npbYi47HwRNVzn+SdWknMTbUFdnuJU2U5l2/yt46OCDZAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hk6mvLlV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MnW5UteW; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hk6mvLlV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MnW5UteW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCw0u63300928
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ApZtp9mCDzFhUghEqNRHfpNQRpHQIPz3H5GND00+/Q8=; b=hk6mvLlVWv66MepN
	iXjqUBQgGPOer5qnBJte12x4wjPvxOCEYL7J06CYjn0EHwKp/mQIZhzGf/7PTCrr
	JPVMRa5P31yNjd0syZbjgMb1SqSQl0EhM88wLqYun1EFTHMdFhjcUQaYctLQJvLB
	m8rrLNP8N82Uo9R+rz0dot2NO2Ag+BRrRZy3QHNaATzsOSBlDlmyQoF67xxVYAwr
	6AvhbgJpiztMCqAaEVjfmc1yrAp8Qnex8FnEzTZH2Oi00Q9D6r5JmaAxiFebRClG
	r3l0ApPic+NoNoV0+qGAVh5h3Rn6Nx3BILxnO83SaAFd/J++STdI9TWC1odBWbQy
	41skTw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0dsx068p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:34:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d94a158dc8so59926455ad.2
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:34:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790688867; cv=none;
        d=google.com; s=arc-20260327;
        b=pSpy/znm06kn/ECyT0eS0yWBKO3VUvwaYfFuUyppAZ7jFW+vT0f67yflUtaU3T6uu8
         8XatoYECnrdny8KPtJqRFed00HUNbukt3baJrZSf0kjIwR+7d/4v4rGD5lJy8Yu6Y7zc
         pQUbuv2Z4HFRdYe5GsyHAjfnBSug2rS+q035XowmVCzoftcOXsAnaEC9/4dyBrDGjNo7
         xgjqQDQBIvo/fAmiU6qoNeM+/2bI9ztBIX8sDMf5Q/oFR8IE0Q9VH0/abTuff0a3nKTe
         f2/eMOFV4u01HQlE6YeEaxblX3clLwVreMqCV5UMzbrneaMBEuVP28uIQb0KQtaI5O18
         gBrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ApZtp9mCDzFhUghEqNRHfpNQRpHQIPz3H5GND00+/Q8=;
        fh=a515U5J7UXyiVHnPu76IgjjbdYjdk7xTsH2RXDicR80=;
        b=kY7ZZTJss1qVLeAQU6wgF4OW0HPZknYuySPHt4AynlB2peXdtj7eV1Pwlu9AC5NXCs
         QEiOnOfsLiisB8fs4or2YFQUbfASmEpygKjfSrWRvjlO33d3DQum5kWTBXP07x/uboe9
         ACvI7aPaVT93T2dIlE/2rgLPmXNIUHWBw/l2Zq5HL4clABlLFXKjKrfBZvA6EOiRnp4j
         /OskutYaUmm8VzVCU5G/XXl/5fL6OOw2euPmUl+bI4/o+iNCxF+kHoWn89au9fQzXrYj
         OxYCdPi7NKODN6FzSR57nMXLeEfXZdPptkaiyNBJVmRSaYZE87Tq9zbUaozn2x21mKeF
         SlMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790688867; x=1791293667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ApZtp9mCDzFhUghEqNRHfpNQRpHQIPz3H5GND00+/Q8=;
        b=MnW5UteW5tCkE0domqFe0WMEddVoAo24BrHbfCGicKqHJ7zswfoA07vSpvD8NfqOnE
         fF8ELmym2xBwXyl8/OfGKwGsoqqQxQokZj3gd+Dq32ZPO3DRhsUh73z2LfN2tdHpGy/H
         EPBeds6ekZJPCl8GDtF9YdK/apasEgcCZd5m+U8eKxUnzX94w6I8HytVWl5AvvjGs3zR
         DpK+qksSdODDf/RHW+WZU/BkBWAdIHCAI/QR4tzPiMQzi530jEw/yRRLhlCn3CDzzxlv
         lqWsAjIxiU5+U2yWw0xsJgp1V2E0KCF+z32vgJSxHnU3S1tTCcTS6PAXS2gHKiJQLrhb
         2M1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790688867; x=1791293667;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ApZtp9mCDzFhUghEqNRHfpNQRpHQIPz3H5GND00+/Q8=;
        b=jLOpD0ghzMY7fgUtCYWASWB+76K5+Uu67h0JvdYiOje2gAVs2MZEoWdJc4yMtvjnaa
         AlpEqi5EJeIukmWFtvUgo2hQD2lOdLwmEXuMxkew4NaxjQqUelBdM2k0QM9g1ddkj5Qi
         jOrHGsqqyd1DIoFWeGaVQfsv2smduVDOR4HPhPKRh0pR00/UBv1kXNtx9lV8QqSyYccu
         6UMF4+0FnJt3kIXoMg3siuqWcBYgcwWzAp3VUqpRtLfS4OUtdmNYCMPUA17Vc+CndPzx
         T+eDuJdAQ8bhCXlKzsLG8lXqsLPACeBAH3t03tiI7d3lXANE4qQUR5j62xiJUKPPuGeC
         Hk8w==
X-Forwarded-Encrypted: i=1; AKwUvBwamKMyB8jhIWQUTSAr3WcT6Zuduge2X39u8lymEAJSkS5qRs1kZw0L+/09dnTNO3eP6GqYMcGjshXC@vger.kernel.org
X-Gm-Message-State: AFq9FYKSoh07C+ItHmHpO742wPJUEJUXuIT7KkT5bv2E2fdXiaBbr82L
	oNmjL93yqyi7e6irCx5s3blD6UhmoioVi2JZLDyCrve/WmCJecPm1lNBX4gjuyNNhkOiwRU5awm
	zBkOXN5nvZlbtRt7UwVZwX1BjcGuER60IUdotavCPN9p4KJLwUV/Ew4aAa8oNFjxYSKFKC099L5
	OT7QSLMpc77Gb6QaZLC03Oezs7vi1KXhAyKLdmXo0=
X-Gm-Gg: AYBFou0UwmyOTKNzETaUlQxY5fjQMEMfI43CE3GdvO60cZq2gq7/nh7ZOMP3/NOxG1T
	0mRo25k0yFezUNuAaxkODcJq1wPCexCcY9Sgxu6h10EjYK3mNwgbQoBDeZC5054QgVhDEBDpO4G
	rUWjvF+SpYE+vEW4wvLhJD7CzbspuX5KsCGzy5Igr0/0sW8wvZcWyLjwrPLg==
X-Received: by 2002:a17:90b:2b8c:b0:3a0:574f:5854 with SMTP id 98e67ed59e1d1-3a0bb60e74cmr11071562a91.39.1790688867372;
        Tue, 29 Sep 2026 06:34:27 -0700 (PDT)
X-Received: by 2002:a17:90b:2b8c:b0:3a0:574f:5854 with SMTP id
 98e67ed59e1d1-3a0bb60e74cmr11071507a91.39.1790688866886; Tue, 29 Sep 2026
 06:34:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-msm8952-initial-support-v3-0-b96fd3fe298b@mainlining.org>
 <20260921-msm8952-initial-support-v3-5-b96fd3fe298b@mainlining.org>
In-Reply-To: <20260921-msm8952-initial-support-v3-5-b96fd3fe298b@mainlining.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 15:34:16 +0200
X-Gm-Features: AclHuK_IsoMVZ8jA--KFIskLK5LDOvw3Q0lyiLyhAEn2l6B1awM5w3Hl8Ax8gbg
Message-ID: <CAPx+jO9qPRgae_VqWrGQ8bhDOHBf+zDzw3A-BxCMa25XfPaa7Q@mail.gmail.com>
Subject: Re: [PATCH v3 05/19] dt-bindings: mmc: sdhci-msm: Add MSM8952 compatible
To: muzafferkadir@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Lee Jones <lee@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, iommu@lists.linux.dev, mfd@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1NCBTYWx0ZWRfXzaNsf5ZyQt2a
 ALXSP5u8uxik0UUChuDTkLaSCRm7e70J2ZAQZAeSp103eVwAbMekFf5S1LhmqbRjecKbwZT3d+E
 QYw/KR/yTQReOrqKWJRp2Jlu5pPlqSzmO0dGcvXVNPFR+F2U0q/1oJ55CzYrRdyKLOha1Lzz6DV
 v9EKdIxYn9BRhvLCOaQiUpqFJ+UP4rRtItPd6MTgxMpYabKYGSXlxdf33meleZNKdpgVsJkhMD2
 31XC4GRv9HJ8T0c9VpAMAB99xu61fKQzXoWwxW1TISm68Zqi+6R2FZlU+EnqdsxVbpSeBGmMjHs
 LtVnzurJVI/kRR4CWxed7HrQxF2ihISCCgZtyaKavFhGzm3nBawoebADHp9LT88XuwxoL/Yst+g
 AR2NIeXGPZE0r1pMTC/S0hQE8PNdWkDNpN4BT6Y69NKs1aqK5PxU/4rwoc5tXjNSSQPnHfiZPMZ
 /GOssLzwMPbZpy0cZ+Q==
X-Proofpoint-ORIG-GUID: reGagg5Rd06fFS4NlJAQvMdVdVFhhfYf
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1NCBTYWx0ZWRfX/4kltbRdmHMN
 j9qU8fdf9/OI7zguE4PAQ63F8A0M03+4hRyWyCw4E925f99vH1VI1NMC73huOutzK5h97xcOhhy
 kyCnpDiPyQ6cMLkm0uCvMir5DprUeV8=
X-Proofpoint-GUID: reGagg5Rd06fFS4NlJAQvMdVdVFhhfYf
X-Authority-Analysis: v=2.4 cv=DqvDa2/+ c=1 sm=1 tr=0 ts=6abbbe64 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=OuZLqq7tAAAA:8
 a=wO7LUizMVtHDz2nkp9wA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290054

On Mon, Sep 21, 2026 at 8:19=E2=80=AFPM Muzaffer Kadir via B4 Relay
<devnull+muzafferkadir.mainlining.org@kernel.org> wrote:
>
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
>
> Document the compatible string for the SDHCI controller on the
> MSM8952 platform.
>
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml b/=
Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
> index 69bd44e65ad7..9d4409c958fa 100644
> --- a/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
> @@ -26,6 +26,7 @@ properties:
>                - qcom,ipq4019-sdhci
>                - qcom,ipq8074-sdhci
>                - qcom,msm8226-sdhci
> +              - qcom,msm8952-sdhci
>                - qcom,msm8953-sdhci
>                - qcom,msm8974-sdhci
>                - qcom,msm8976-sdhci
>
> --
> 2.55.0
>
>
