Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D313EB7F1
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065929; cv=pass; b=bT/FuYkqwjQ0zu9thG9HOTdq7hszANQXzyljyBVAh4oBAfn9ZzBW0RMY0nKIsWmJQSyMMS5i0MByZuqgh2NO5q2qngj88JrAG3tduq3+Hr+G+jWldq4bNeBKBnY2DDTe8jq8dhVe/AJ/xnPFP2bQnG21Jm9Q7pTgfWOegG3WuCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065929; c=relaxed/simple;
	bh=T4aZ5nMd2SQdcBlP1Yq87qM0y31KgodulEmLY1IKSns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BK2H8Nzhqaqg0ixfdXdyMhg606+ZLKItdTMbL9pDIEJAAzCQqcMz2GcG+zUTMWLDs/ZM8IPURYLxWYEhFTReP82NRjUhVIDA+03lVTuUpRA3vr2TC7l9hU/qMJdpkDXAfHaqKfCoBNc/I7PeaBOdL5jQhLRZuvySiBdNSZPWzYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A4twjWk2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kipfWpCy; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A4twjWk2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kipfWpCy"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDaLa91279273
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:45:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WkFzsgrdko5whgmD09ahCUh6vRbCMjGnoEBT+p07030=; b=A4twjWk2FYsJfvBE
	fxmHRZOj4tQslO+i6mWmo9eokTff63F74S/xRYeD4LZIHJMGq8LudRWy9b52cA9p
	Gn9h7wO5MFD5pfBxjhdxvLh9YPyRGfXIC5Q2OiT9VsGS73Cl3V89+DoofR8n50HQ
	iARZdslpJJwWjxYkqrkuGbbR7zUsWNaqpPQY+AMt0FoNqxigU60SPECqtL/LVvo6
	t/YBONcxjJb4b1OHeKJRUk4cI/5JJWOEAoAtuhwVFAtpykBCIfwNK8I3jFgmC4qW
	1oOTBQjDiz5s+HLztmSFXADKv8nsZWwxZk8oNl2sXPBEGUR91ST4CgS1Uy+laHOT
	YMwn5g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efbu50a1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:45:27 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8cce42a4e75so20089636d6.3
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:45:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780065926; cv=none;
        d=google.com; s=arc-20240605;
        b=gP+RJtDJu5SaLw8NH1uqYtc8M45bKoXIT7H4kRKQbomhQH96ryX2MgU7OI0i3Co9bX
         tfHYWFzJ5/qOVRyCT98RT5r215hc0iGlN0QbN4MGCr7SXoXOtLmmQh9q8zd2o1EQiiAp
         WpDcBP1pJQhfBoX2qWDz5rz/Cma5cJiDDubMK86kCthbgCJmC7mBB34Av7hU3rGRowJX
         tw3GFqblA6v1u5rtrBqi/CpcmSrLqsjFZiJsHU9+tgA93AbDEz8Drelx+bkAHEiJowvj
         xCMRk8l8qZxBi/S0AvYv/F/yrs+6MkehFd+ui/a+cVNuxCylxAjyMyfv0nczJF0LTEsu
         b/xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WkFzsgrdko5whgmD09ahCUh6vRbCMjGnoEBT+p07030=;
        fh=x3GoyY0ZgmnzipwurOI51R8FtoqlDaMsbo9cxbWrRqk=;
        b=cubD9dgRk3tVkVZtW3LnqqNnAU7csq50rljCB+8d+cCrqlZUFnUbR72PsSJ21K5wnm
         hF6Ah+x0j1DJgOkO+XiGo2ArnANGr7547y6Un01HKTo5WVMBuAevA4wBxz8GQqx8iUv4
         RjQAOs1xTbq0p1FsL75lvdVIlFGTImDVasi2AWrZ2Udd4dYK8zjRPEq2JRpRzE3DwmQL
         w75p0MjxVgmLxyoUgizays5ALlVDwK6gfN3VgfwxQlqkjJdbqP/xs4laGVSSWI4VclXL
         5R8NHZ2abkNj+41cfwriUMjX+rFfV9GQTZ1W+ENoyBqAzOgupg5hPLXawLw4FkH4SpjM
         HTiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780065926; x=1780670726; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WkFzsgrdko5whgmD09ahCUh6vRbCMjGnoEBT+p07030=;
        b=kipfWpCykBm/QevmH4fENuNl4Yk6hEg97Q1n8gUOnIRHhWyk4VCrNMDcD9Ab9+wU9D
         z0BJDVkQbQhgxjK8LuYBjaLMGYUCM6W3KogDkK9uTGogKRSUAQVYwkoqEs8Wuvpjk0jp
         UMAYPDTLX+tU+mJ23SvE+yK2SzX8+ZQixk9Z5NntBJM2KLNKKKYDSksxy2OJRXTvPIxo
         hAvFqQMhZOv/eMNsDpPT8498HJykwMegC1+mcA3vTryLapZ0mGQ7gGWhayg0r0i5Nykt
         4fBt/ICQf/FBf0PiKldv07aOV9Ubtl8x4xkOcX4I/y71lQm/3QDskE7auWesv26jDIkr
         unBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065926; x=1780670726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WkFzsgrdko5whgmD09ahCUh6vRbCMjGnoEBT+p07030=;
        b=VZM5lzjiTxVcAIfA4B2d5TQ2i19N/JTuZrZ4omWwM2DOpoKkeOIuauRbUv7RiHEe8a
         ELZGOySFi0eUAfEemW9NZ+fd9RoXs96522IgawQjq/mRwIPdNqzGxbymsbefTeioAwIo
         q4xas6ScAyzNLHmxWxBBZ2o9SoxOQXMq+djj21xf9+Hhr68LjVuvUe3cjYQkMSZUUMg7
         WfDvsyAUEhov521VSJtOEhM/lEwTN9x6gckxAvwQcHUuAyURH2aB2NhwP/2XvYnApJqP
         PC9z83g3ZFwLMYFeNv9q74kGEI5aL2+aJ6wQs3pcItN7qXrMllU4LfWaaR0+zfa6Y7yW
         0fJQ==
X-Forwarded-Encrypted: i=1; AFNElJ/bekUUHJNNAnURiZc2iAqTC+DkOSASe10ffYOqvRLc7E6elJDDoPOeQLHAM3QTL0P6C5/WA16kpd6R@vger.kernel.org
X-Gm-Message-State: AOJu0YxdxfhKGkTAHkgrxmCxx3HvvrDBscRd/H2bcIygYnxK4UhfbE3e
	EwnqAj2gW7CUCBrudM+svGBr9IwIFX9yPqPhvvXbe+iLjSx02eg/bmqkZfswn8HSLokxVONiDNA
	lEUwXRE2dQoAbacq4ZifFVfw1Un3JHofN38+xi3ttaQvuBHVQRkPmThseFSspiRtu13XmceeMCW
	HYRhyCr1I1+uKkgFliWolWnRWk3GHiYEHJzYYk5jM=
X-Gm-Gg: Acq92OGppY2qfUSfjlYfasKv3sAh6XB9XJXKiXg7oDUOE4c8NC5XYMsKQYDqIy/fVSS
	wILrXqsnOeSKnSIzTM07pVgUE2eCgTx5RuNq4uHc+ryUSJqXhCYG8Heqo1zQJ0cA+4Hnamm3mRU
	TwV/AbWcaFUI9v2xcHEatbdAnOPiVVhzvPaqKsgAvfCpbM4ykP2Ib8wzVQaaPGEgCgpS3dfQuKF
	6A/J/1X2Ron+eJdyQ==
X-Received: by 2002:a05:6214:810b:b0:8cc:ee5b:1657 with SMTP id 6a1803df08f44-8ccee5b247amr13852036d6.30.1780065926347;
        Fri, 29 May 2026 07:45:26 -0700 (PDT)
X-Received: by 2002:a05:6214:810b:b0:8cc:ee5b:1657 with SMTP id
 6a1803df08f44-8ccee5b247amr13850246d6.30.1780065925170; Fri, 29 May 2026
 07:45:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513-eliza-bindings-sdhci-v1-1-b2cae44163c1@oss.qualcomm.com>
In-Reply-To: <20260513-eliza-bindings-sdhci-v1-1-b2cae44163c1@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 29 May 2026 16:45:13 +0200
X-Gm-Features: AVHnY4JsfzpcGAm2kTPsIFuJQe21hwabVEsrUxqMjR2Z9szB1Z4ZhMo6vLeRu3o
Message-ID: <CAPx+jO_i===QbF0=X=wm0QbpkEcqdeSyNeG8J4YzvOeChk7YUA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: sdhci-msm: Add Eliza compatible
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=SMRykuvH c=1 sm=1 tr=0 ts=6a19a687 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=wwCG8UitSJSBhSBbBDAA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: DfMQiBLRxlQP60f-0ENxThbwO2IfBVG_
X-Proofpoint-ORIG-GUID: DfMQiBLRxlQP60f-0ENxThbwO2IfBVG_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0NyBTYWx0ZWRfX2u954NI/Cty9
 KHidy/c1o1zIPEW0W8W//QtMQj++tGIVBX7akaMXIFnltWytOv8MlnZ4WRXuK3CxAp457AXZyKf
 K80bv65EJ+2FDRkQQQ9myROOzbWdCLtH5bQadbVJ2B2L4EfnEV3fFHDScL1CxfGCdJ3HYXttPkW
 9xJd19cXdDKzbgvV6pSByPNqDRg3vUrChgKFen9B/kPn9ioL8arnlkUpkk52rLkGzLxBqAdzCvC
 QYCzllXCyxK1m9tjN0jj1wJ14NSFq0O7ZUp/UAo74S66FfIgSYEYGFFQewMXnIACfNSc3k4Ux22
 9aeMOtokStplPbb6+N+aBO6WGWdXACbO40yza3fLD2kkvGmNnZ42V2qZc61zyJg09P6/Q50/InR
 QVPVGGE5XvdAokULZ4j11tqSImooXJ+75qIPJZTJC0mSx2R4QYFcaO/8YrIb4zXdLF2bmhfet5n
 5EtyXPplsiu6CC3nrMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290147

On Wed, May 13, 2026 at 1:19=E2=80=AFPM Abel Vesa <abel.vesa@oss.qualcomm.c=
om> wrote:
>
> Document the compatible string for the SDHCI controller on the
> Eliza platform.
>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Docum=
entation/devicetree/bindings/mmc/sdhci-msm.yaml
> index 695a95e8f35d..adaed5272016 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> @@ -37,6 +37,7 @@ properties:
>            - const: qcom,sdhci-msm-v4 # for sdcc versions less than 5.0
>        - items:
>            - enum:
> +              - qcom,eliza-sdhci
>                - qcom,ipq5018-sdhci
>                - qcom,ipq5210-sdhci
>                - qcom,ipq5332-sdhci
>
> ---
> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> change-id: 20260513-eliza-bindings-sdhci-d531219a5c87
>
> Best regards,
> --
> Abel Vesa <abel.vesa@oss.qualcomm.com>
