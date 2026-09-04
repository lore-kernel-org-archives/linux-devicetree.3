Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58ED37C11F
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 19:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788551721; cv=pass; b=scHE9lN7q5ELJWOn/zZRa76xOgCyZdrF/bPbmKbW6nizi5yuZh6+NwMVqemONy7HxObjAjOltNsMQQGjPIwh5RAQPkKf+MemiP76fTBmSiekHfsEtZgKix9hnnOCcCIE4dHsmg2lF+QF3PP/YajhnwuJD0X1qHs0gzV2nNeF23c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788551721; c=relaxed/simple;
	bh=Cuy4oNKyaJF2ZdAr5zW3Dz+9GPWKnBVFeBK1jrQaFGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BKOCA2jIFAJHQwMjVnjZPYrToukvD9xfQAGsWsbdlqWZYUxE0ds40HUXpTwLSbZCQGOdR2ga+6ncHAFyh+yMDe3CYhBNuORs+pQGZb8/kYcpXBaMTVr/+byC7ZoluaLNx1xHNLfn5nWlSAWVhUXvfU+NlRMRe3QsWF6legGo9eM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l+UwIbQE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dZGMSVO2; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l+UwIbQE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dZGMSVO2"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684HKHSt3589552
	for <devicetree@vger.kernel.org>; Fri, 4 Sep 2026 19:55:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7+S2fUNcs/9WkA3bU1bHtkI2dA6OSW0Car4DEk+gp/4=; b=l+UwIbQEhpKBzgLY
	uptB0RNGGwdGSX/uUdUjHSMXvRcp1Ny6If/J65idpGn5MtAwUovCWyZpYZQLkNQi
	Of1kwXhfQYcQv3+xfAcVpPlDnxXpuUVzAQ4GOv7MSEQ54bU+BwGDng4gN+QVsHhk
	zF0NLmeLK3go4dxt5klAgacaMsHs0VdBkqvV9I2JGJho8zYMhgVieMpq4iEw9/99
	3FDHiFTn3mehNx/Cr8Z8SP3CpgNYS9VCy83P0WXyerFYScO+33KZTh+8ucyfy+Ct
	FA8RLsBYSxxFjuXTWiROxGwFjF6uZdHlGaz33kAPBfD9HZ39u/gSeJ2fLXTP0elF
	fsR7GQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp1fkxe3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 19:55:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93494cce712so249334285a.3
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 12:55:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788551715; cv=none;
        d=google.com; s=arc-20260327;
        b=SiQ4GmVlQrhTgRN2R/l1jZ6LitRB6IVcaKPDglAGiJ5Wixby78CHbYJLgoc4LDPvRY
         Z5Ac0V9Q1A0bt9JkMFFMiANO0tFzuKiT+hI35Aknf4w58M6GJbDutfrNzQnHHze5+lgG
         g/GkYdWv4yDGO9zjJCGoohfMS6xLzIeCXKL/SfdU32aRM3VlCtX0l5BA7hvbPT5LsLc4
         WRecxoHzUIo5GJHq85IgPHWBG+HbB88M3yevEuUKwS9QdB+vQuUWc9BRBMNAo76fu7dY
         Jot5B7yOK0gXAvlaRdhNBMPpv4kj8k0WDbA0ATV+fT7wHXj/cjgC0l3BzvXarzHPGu/o
         HW3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7+S2fUNcs/9WkA3bU1bHtkI2dA6OSW0Car4DEk+gp/4=;
        fh=xvE41eZZ1v1QxhIUfTeqVYiS1K1nzsWfZ7l4h4ZmFbc=;
        b=C6yHRejpF+pyTVzkpdjSRCMi7BqaFZZf0TLKA+EHgXmcps6OjNxCDGzHKF4ic80igI
         XT13Xq3xkqtkgBa3hJe0SuiuUHZM0zM0mY2YhLVfrD6dt4tkG9juuEQwNYC01w0zFL8k
         aEB1PBdH/LDuPP8TsjyqSbUUf9zmLCogKLC/xD1VLab7CA9gSsaf8EDWjTeUktnXeJ1l
         rW718Ukur0nz1yv2ThaxuTaQt+TO3mr7Agil5M6ucx5uR+Jl8778GLZKBcYmWdgyGUB5
         fOtuQjCfLJ/FQJKvcW7Hc7OXcO87QzwomxR+ISDV987cL13L30kQViQbslQ3s1fuf4qn
         yExA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788551715; x=1789156515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7+S2fUNcs/9WkA3bU1bHtkI2dA6OSW0Car4DEk+gp/4=;
        b=dZGMSVO2HK7zY7/S8dX+pARokyGm12TijPDnyXgoAhU3v17OELXYdLxbpG931mlShy
         HFyxVLc5UG0KZaBMHIaPJDzacEwPrW9w7ivFG9DN7V1Qct3FqlxW6LgkoVv9mUGW5DyB
         poUJLD8DPQcjef926VRMixtl/XXnFKeUtuhZRA3R69ENUrk6+KphIRfkPFyurAT/wPc8
         O4+FreIfrntOBzMPcUkMe7bZVGMC5LusgpOFN7Y1uLFaGNsKu09BIfyKnzrh5GOmHWKv
         O6VLqGHVSCF6s1VMw9wau+E5agst6eDw1N3jwVzkGhjVpKDzH1GADcCaOfagYzfwctyu
         YtEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788551715; x=1789156515;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7+S2fUNcs/9WkA3bU1bHtkI2dA6OSW0Car4DEk+gp/4=;
        b=WyyCoV1WYjJ3cDnN0Im4lN6yBIKcev5rj3tVtMJvPdv6DaJOqckHccKnHe3H+VEAQe
         5gYd7UofpV8mtJ4wlsz3RtA32My6F5fIRa/qgG+jsgD9xVZa/pO+Z+oQWRo4S4e9nFb1
         geRtJBA3LgF3/cou8Xj50QZFYbHUIRy2rw5RsJN4zJKDMXDnHGDlfBqX/sv6WZfr8ckS
         vfH8zDEQRGvpHVB3hC/wmz2xUq/m6jS689ypB3FCR2RNRfCHWm1EOp/B9EOy5ONQPoux
         QBlqVo09Gwz+frApa1UkR1K3QaCI0LO2+dUfehr2acKyvAMs0oHF/lEM84h5Kn126/0E
         qm1w==
X-Forwarded-Encrypted: i=1; AKwUvBwCWmVfni2HnoA8sV/lkxDZr7uKOL/xhgdSRSu+7/vfAHf6DwoVIadqY+YQ0wKp7PNU1SeT46QMv/JM@vger.kernel.org
X-Gm-Message-State: AFuF++nvJBzpHEgJqle1BrunnEnAVMv6r3Pb/FbU7+5uQYSuoxXM5Nm1
	f8LLRQzPgejDQfuopBHpy24wIfRuGQVW+N3PIFgvPV0ztwO0i+ld897C/GR99l0vRRhc+qgx/80
	bqBsdbYeBqVkDzdCo4lgr7ryg6Fu4VDTAi3AeNUaWlsCgn3xYmfLpIEDHBzjDkJ9KoNUGSNpFyY
	naB362gHK8Po5DuKR8kL49dmxqp9EPVEUKpHmGJ2g=
X-Gm-Gg: AYBFou15Q1vNCQ6fj+fiDRVhzWB5f3VIy7QP30PVmy9tglfs5HywU7RO9Wkfs9fEgUe
	vraaYu1yJ7zY6Hd+Be4rROKis8PinJnRz9DQzUTn6II96jggFh44q53yZp1OlDzviyMUj08rUXY
	GfEw/lzcqjYSaSVRPE0cHSD/PZaElkj5Wg7MnjtkXboJI2AcupUB+Fza8yJDV/uzT4agWTijb4u
	93VHWrVWyQL+leUCr/Uzd06bnZeX0FtR+uB5APVyjq2a/g+JpQfSrGTuZoTjTrXglO+YwMFxOs=
X-Received: by 2002:a05:620a:46a1:b0:915:9e84:85d1 with SMTP id af79cd13be357-939803a4a96mr811791385a.23.1788551715362;
        Fri, 04 Sep 2026 12:55:15 -0700 (PDT)
X-Received: by 2002:a05:620a:46a1:b0:915:9e84:85d1 with SMTP id
 af79cd13be357-939803a4a96mr811784085a.23.1788551714708; Fri, 04 Sep 2026
 12:55:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org> <20260904-x1e-camss-csi2-phy-dtsi-v5-2-dc81d85b599d@linaro.org>
In-Reply-To: <20260904-x1e-camss-csi2-phy-dtsi-v5-2-dc81d85b599d@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 21:55:03 +0200
X-Gm-Features: AcwNN1W9wMgd18cVEyYOdj6YVkfohjR1CF5BB3XCNyAGw8QQbTcGw0lxRrgxPso
Message-ID: <CAFEp6-3EqEghkrsUMYtV=1z6n9Y+bPG9YHj6Wf2gOVboDE3hKg@mail.gmail.com>
Subject: Re: [PATCH v5 02/13] dt-bindings: media: qcom,x1e80100-camss: Make
 vdd-csiphy supplies optional
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=F+xnsKhN c=1 sm=1 tr=0 ts=6a9b2224 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=dr_jwI5W_23fGTPCCGYA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 4eRqMLxtYXHRIVfdbW4xZWDfYIdRwSfO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE4MiBTYWx0ZWRfX3+O4uLIoyd1G
 qbqpcbN0SQw2AegH+hABHcvsWXnXfPVYhAmNnpFJ7EaErBKFOI3FbS3LSR+X19jb3kT0UvLw8Tp
 ISOU32lbtFQNfy6SVFCP/rDNwmc4c3w=
X-Proofpoint-GUID: 4eRqMLxtYXHRIVfdbW4xZWDfYIdRwSfO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE4MiBTYWx0ZWRfX1hC+xBRc+iSG
 JH10oXi616nZdDHi0sIzomYRujmlprXmxLoSsVkv7vWOC4EuFiwY+xE4/yNHm6sco8dGxi5YNjj
 V8vq0ZgXscRI0JuKNwwJkUUExEEW/5biTlvn2718duRoMVMYwws0EELtM3n3lnHLhVU24+gVHa6
 wP42jlNfe0HTnJmzHAbp0WNhtJhRyV3o0KGw555lc1QyNQV+qvD8MUsbZp1SyoPgc8Z7X5lAd88
 /Oe6AcrQBvHGwvoVAumBzQ44/sxbdnbUP1qjUBwtdjL2YOi5D/KHrr4SOixaHcweifXjkHbALeV
 4NFSknJYW8v9N08/jbstBA+GmX+5bYIa1rMfTHWKNyrcnSQlp/bfD3QQ0X6b85HThEkEPykzbWP
 GESRQiibOr9jLzT5e8aOI63VYM286qj1yLW5FwSZ8EuIKLMRULOUcAXVOkWutyNDZvbi+rQZczu
 Z5PMDvIzX+V/etK9L9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040182

On Fri, Sep 4, 2026 at 12:56=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> The vdd-csiphy supplies power the CSIPHY blocks. CSIPHYs may be
> described as standalone phy nodes carrying their own supplies, in which
> case the CAMSS node has none. Make the supplies optional; existing DTS
> remain valid.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.=
yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index 126400772d028..57a838fe2d229 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -186,8 +186,6 @@ required:
>    - iommus
>    - power-domains
>    - power-domain-names
> -  - vdd-csiphy-0p8-supply
> -  - vdd-csiphy-1p2-supply
>    - ports
>
>  additionalProperties: false
>
> --
> 2.55.0
>
