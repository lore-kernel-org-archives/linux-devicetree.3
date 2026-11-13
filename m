Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794575412;
	b=wTuZs+6NDeWYEn9VpbguhNpCIZ4ll7NzKJRgukn58E0Wslm8oPwrYE0BnmVoR0y7a33A
	 vYs9rdBoO2ucl9MkanAg0aBj0xZROLR4j92M5gOUBbR90RH65L6xpPOsTbcrJ7O3jBJS6
	 s2JTcaHIge7tsldMhRjzraA/zvnBAGDIeScqIzSF6JDKva5QMUabX3oLXdZHz1eLORxDo
	 3bBalvGvrl449ODLtYl5PfoY/O/inuTgrfZU/wKHoUsZ9iFKqTVCzf2C2qafaalsdriVS
	 Euctuz0fxrlo/0eEBqzZ8oF3numJ0cfPH+tjScZf1vM/5y0Y/IXFbkHaAQkI+ojDX7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794575412;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=j8L2acpwy+A3uiHYtid26iwQmvXr9vBuqO0OxDxRSPQ=;
	b=fyhZ1cSc3iPFLLbLGIuPkUiAlbsZKf6xFy3e5VJY5U4588Ba2I2acWQ+hPvBkmo/C+CL
	 hZbausEAtd9YxdleEMhSp0GojwDdy5FvrdErTW7qtnZX/Gf48++YtGQCXdvghAPmQRDLI
	 QGt3weIxbmg8cVwHwQdHdLsLXcMlRuw1YcPLmVOXsFzgtpwWi1CTv41dnItGtl3+TdUk5
	 nYw6wPmn+9PC//mpBwC3ld4ZFcXPd+9MULNtR2UboSR8+8Epf1nJ/Ft6u0YAp4Seq3AeZ
	 nR6lKr4vKsiO50f/l7yXFMeCtAnFKeFOcqegPqwWvRtJWKlU3QWJo8HReGkhVKtYz0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SQZEuSZ7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FHGCVubF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E7F606A334
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 13:10:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48E7F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SQZEuSZ7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FHGCVubF
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCKRPE3126311
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 13:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j8L2acpwy+A3uiHYtid26iwQmvXr9vBuqO0OxDxRSPQ=; b=SQZEuSZ7/wGLKUxh
	SZQafe4FKG169IlGo5w2z5LX2QhGIOIambc41mKtHex1LIldaOimJFyoDqEMriAd
	1fwZQnuIc8aTSa740MiCIvO9X0N5M0wCHPjDupl/80QPEMSOrkkzhosQHAviy5dc
	mFxZB8cYlzWfDg43f9HAaM8JWZnI5CppA1JmvN7rlCuwOj6x22NK0Hzysox6dfgN
	igJ45io14zaZwgQDWfPaxpRT5XbkhekdxvdvNJYSa8DLQKlZs8C3jAbNqhnLVTLQ
	R1kO3B/Sj7jr686oS1akO7kAS2ji0+1fMGEgtaYJyKc15Z91AdJgwyzHe3hGZe9p
	wv5euA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwg1bc4v3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 13:10:10 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so689278a91.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:10:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794575410; cv=none;
        d=google.com; s=arc-20260327;
        b=aVqrXT3/R+UvD/FfOLLrpQhUXRaAnxAr6pEyClfAOVm7XxbJ80CW79IWC4cNfT+Sxt
         SCoKzpU2Fljv4zP2l8+q4AoqQ2+fJ+nRAZawPf8ewH59tIFeB/N7V85TNVBBUoLys3pV
         JZI8S68+ygox2kNCFWKSsrtx8pgfJjLGg2yRmOAdkjGQyDzPDJzB3lRdgV7HxERVWfwG
         d6LcutqdemoGoRQqD0mGRNKynajJPryHdC1Y4icGg37TF8yxZmNhoL3NH6GWZdua4WUU
         J0Kn44ABfGl5mZIf1qWrSNYzWTMUxzP92cca9pcMvS8+8dcDsXK7RgZGqtSb6vsSVP+v
         o6qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j8L2acpwy+A3uiHYtid26iwQmvXr9vBuqO0OxDxRSPQ=;
        fh=Dhr+WAzdhvi4u3JzQzhw2XyutV7Eu2Wut760riFDc7I=;
        b=IRO0O+q2ceZ6WAqGiCMGy6hpiscNPdqFPbNYogj6vYzQoFLOTg/xyBMTUVb9oF7at3
         /z+vtc6XSY/JM7yUPrIWekKUmbF1GO8+5pi7S62lK7GG20Gqo0AzHP02m/lr656U06po
         N3sjkaKAsUyi+NEXeEPwydvJKOsivqHGorBkPByMtYC2Zr+/ki2plRNdsxlSPie5vxjw
         tdYqaZihOw1bZ5qjTrb2ZPCCe3GUMOiXjJx2ykmexcBykrrCFTXQ1JToCfIJKdSKU0+y
         Zso/ZfaExp+UckhfopKJz+bM7FsxrJgptWgaSfFkXedLFeJx0usGla9o1r7JEukInqdg
         M7Lw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794575410; x=1795180210; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j8L2acpwy+A3uiHYtid26iwQmvXr9vBuqO0OxDxRSPQ=;
        b=FHGCVubFmUzYHITtw/8v/jAj1vRj8VZZ7EFvT47bna43R8aeFAuUDykqPRR0lBo8ZN
         rAukflUV6vljEk10jmN4oQm6GdC2lYSW6cn1iCkKchMrS0+cm/xkNmx1kD7SoyCriMMt
         O8c3fl82wUS0BYwxQIq/06aQwFo1u+pvsGInk9VaDalb80yvuuB2GhOWYxWeIA0hHClB
         4zZLYyaF+UQXCIUx+H4qAFKYs/qfwOsz2gAJq6qEAiw4AVQJuwkSqnWs0c8o8HqLa8UA
         cPFIasqyb9vAPfFLZZm48xjmo7a9lUJ2MYF2RY6Kf1/4F8C2XEzfnfwe0nbzN9AXml3y
         iS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794575410; x=1795180210;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j8L2acpwy+A3uiHYtid26iwQmvXr9vBuqO0OxDxRSPQ=;
        b=scFDY+oYXZKrfXmnXqjdbFkFjlAdKC3STiXwzumnDlcQHUx2XY63xo7Lu66UXwP7JG
         Uo1To3bNazXqrbz0xwQZ0ogUYj0FKFgk6RRUzW3+DwIgrPeHp9JGPCxRwzVLqjOAkcC8
         PGDGEUBc/kzC9Sl+76wup625YiuIpz/c6D9d9g+7SMNDvIJtoM4sT7QBWUKjpoO9LrON
         dNiIvg/KIY9vnTzYd/4R2+dc+5OqxKYR7fJRaz1T1KACooBOEpjAqqC4KoYNWRDROZCl
         27s2I353xCAgvd1OSWdTCzgI2gRbofIWucPs5abd5698/OR1qUxQVY1PFC2RHX4oJL6G
         pwyw==
X-Forwarded-Encrypted: i=1; AL+hErGj5O869e9YTRtpkRyg5+Te3nekedEhn1yFJ7mP1KAlO1oongmcna5jZnaUMxymVZpoWzFHkBv6vHsm@vger.kernel.org
X-Gm-Message-State: APuU4Z8qdvUwbFxPUxDPWF9Tj11ZQrGtPQnjJrflSIKihyIrGMgPIYRY
	ob66izTdLqe4jazD7YSAPw2kr3zw9WFqjzYPg91kv52mCafOfBcbDLQvd36jHptQIfemqTtMLWk
	xSZZVSHbEFkO+JQS4NiJNcU4OVx40CAoTSoGIddfX4yfPCZH+eNwX8V+mseiG9An1QnQWEWVeae
	XocP/wl8PBhKEAJoQTWMrgGVUhSHEOkdCXCH5tbeY=
X-Gm-Gg: AYBFou17E791+Ir1CPsn44DYlLeZFvkYZicbTKr0sxIl2mQy51WrhyxFxv3G6E4064z
	FqIoRtlj1npMQ4EeUcLAv8+V2LjviYmhkAtglRgSob0tBplcUrIcAVVZ7EUVGU/fIPnyngO9qOL
	gniXaRzYmMMGMlGeWIO5GUhb+3nvb2W5VSzEYkzGcqw1ZEC03lZKYZAj485w==
X-Received: by 2002:a17:90b:2f0c:b0:3ac:6e91:3f22 with SMTP id 98e67ed59e1d1-3b1b0b85d23mr1919431a91.52.1794575409665;
        Fri, 13 Nov 2026 05:10:09 -0800 (PST)
X-Received: by 2002:a17:90b:2f0c:b0:3ac:6e91:3f22 with SMTP id
 98e67ed59e1d1-3b1b0b85d23mr1919378a91.52.1794575409140; Fri, 13 Nov 2026
 05:10:09 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com> <20261022-psci-fix-v3-1-9ce2133c5659@gmail.com>
In-Reply-To: <20261022-psci-fix-v3-1-9ce2133c5659@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 14:09:57 +0100
X-Gm-Features: AclHuK-XrooPPikBTcYU6ieoCi2hLf5EMDtx-gXhYpRfrFw3mVoiL0ydev7kJnM
Message-ID: <CAPx+jO-rMeg8BvemcMUcC10enjt0dkqWvsK+uRwc75rWpLXhMg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: arm: psci: Add skip-suspend-mode-switch
 property
To: Reza Kurniawan <imkyufie@gmail.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Val Packett <val@packett.cool>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Alejandro Tafalla <atafalla@dnyon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=c6Q+0h9l c=1 sm=1 tr=0 ts=6af70c32 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8 a=UY4Qpe7uAAAA:8
 a=E9o5ywDmFEx5B8TChakA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=Dz9CbhmWzz49oM4s8yQO:22
X-Proofpoint-GUID: wWzW2jFQaEuI7vfWHEqkJsdOlTwBl4Ga
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1MiBTYWx0ZWRfXxZjiS3Wbe5nZ
 G+0Xa91KXLgWhXO7oiXb2um7Qdtl/kdKQeXwQcF9+7Lsg9MV6tdUXKLWHSz1upqP0ZvcP6INL3F
 wd61hxwABZFZM8FerQLiVFxh6y+1YcYjbCN/Y2I0uKI0WVJXPSvpD6hrHjfeAPSWZcLa62Vza57
 l0GPTPAI4PRFxfuuCEknmW670xm5bkqeKLAGNsnT5CGqTG9qBO5dReTmsa5Nwze9/zwTtEIG0+n
 q2RxaM5+/l+4wtBmn9VOZcHe1lIhJ/yFWRT178q9Bfr7jBN5K+pGOenLa5LDUoOQRxj1AvSyRB4
 CvHaLPTyKKS8RFmhpzQcqBWBjdgnBA0DpTRBtvh96e5BJ7MfzffaPtX+gsGfcWOYXX54jO3jQ5S
 uFFxjd8co3cgKuuFzxR5YTG+OzDQdcj9TbUZkPYHetqiKCfg2RgZ7BthwiWII78R+za0pZXTgGr
 ABnoQEz/AFYVJ0B2jhg==
X-Proofpoint-ORIG-GUID: wWzW2jFQaEuI7vfWHEqkJsdOlTwBl4Ga
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1MiBTYWx0ZWRfX3gkVmWTTZplT
 7xELPoSUCNQ3j2iZ7wIoqv2LHVJxcNcP8y8IMaqMgistXuwF3fThgksrlTW/ejAuKHN6M5OWwrx
 2rWyoUZRNDgVwd8wDXJNkeIDUM7xR1E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130052

+ Sudeep

On Thu, Oct 22, 2026 at 11:41=E2=80=AFAM Reza Kurniawan <imkyufie@gmail.com=
> wrote:
>
> From: Alejandro Tafalla <atafalla@dnyon.com>
>
> On some SoCs (e.g. Qualcomm MSM8917 and MSM8937), PSCI_FEATURES reports
> that OS-initiated mode is supported, but every PSCI_SET_SUSPEND_MODE
> call is rejected with NOT_SUPPORTED.
>
> PSCI provides no call to read back the current suspend mode, so the OS
> cannot tell which mode the firmware is operating in or why the switch
> is rejected.
>
> Add an optional flag that tells the OS not to issue
> PSCI_SET_SUSPEND_MODE on such firmware.

I think it would be nice to further clarify what's going on in the
PSCI FW. If I understand correctly, the only supported mode is the
PSCI OS-initiated mode, hence it's always running in this mode, right?

This is clearly a violation of the PSCI spec - and I guess updating
the FW isn't possible at this late state, or is it?

>
> Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
> [Reza Kurniawan: split out the patch, rewrote the property description,
>  renamed the property]
> Co-developed-by: Reza Kurniawan <imkyufie@gmail.com>
> Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/psci.yaml | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentat=
ion/devicetree/bindings/arm/psci.yaml
> index 0d04389c81..2eee38d155 100644
> --- a/Documentation/devicetree/bindings/arm/psci.yaml
> +++ b/Documentation/devicetree/bindings/arm/psci.yaml
> @@ -98,6 +98,19 @@ properties:
>        [1] Kernel documentation - ARM idle states bindings
>          Documentation/devicetree/bindings/cpu/idle-states.yaml
>
> +  skip-suspend-mode-switch:

Maybe a more descriptive name can be found?

osi-mode-only or broken-suspend-mode-osi-only?

> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      Do not issue PSCI_SET_SUSPEND_MODE.
> +
> +      Some firmware advertises support for OS-initiated mode but rejects
> +      every suspend mode switch with NOT_SUPPORTED. Since PSCI cannot re=
port
> +      the current mode, the OS cannot verify the state the firmware is i=
n.
> +
> +      This property is an assertion that the firmware works correctly wi=
thout
> +      a mode switch. This is a workaround for non-compliant firmware, on=
ly set
> +      it for devices that ship with firmware known to behave this way.
> +
>  patternProperties:
>    "^power-domain-":
>      $ref: /schemas/power/power-domain.yaml#
>
> --
> 2.56.0
>

Kind regards
Uffe
