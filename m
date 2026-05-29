Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF2042DFE8
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065975; cv=pass; b=C6gC9M/tE6UTZPE9w0WOOWSPyMZ6BeYXwGcvdzYz2Pc6ae5bMVr/d5DWcgQ+GZNq7z0WC+879Hm1qFoP+uLicODodr53YIyOOz+xX/U71urQlT1QfskTAFIFgkMAU2BW1CFfctCttEtwQQqMdBFcJUu75BRFeVLPwfUNmJF2UzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065975; c=relaxed/simple;
	bh=ujCYn817iX6wlBEWzpPBEDe4rtEevi5+ZUNJsLLv2oo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Luqx/c/dR3HakIEn0nAnAPinHLK/Mcvi00lUT7TzgCAypWP/fIsInf4H0DoyolXwEesaHCUq3d5d6BNOjVlkff3JWO6/V9qVgtwOOGe54F/GsbJs8rzQNZq52sLLNyKcQ5heZK2GgJSqCKCBLJznkJPi2JE92KUBWNoyDrFV/rQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gvjaNbGy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ORKLabf1; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gvjaNbGy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ORKLabf1"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDKwWq3845395
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:46:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	voUJObYcKin1raCObqToYyhbjwo0Gb69o1ZFsTElHNc=; b=gvjaNbGy9OG7lgC+
	1XjNFFrJei/xE63AvWA+ms4OiSYfmg0+FVGVDmKiL6kAE7ix5pBZoNcRwaFFsJDa
	+HGGvn9bvwfKm4rNUf/W1V4cGMH0hnHQz/XSMW/tTCi4j4Jx2lHpeBhBWh09nICg
	1z+rKmsEaL37efwt8dBlePbMZMjvjXgGkRxf9xv6Y+eXBK9XugZrXkx4xS+WK5Q1
	2AgQXcm7VC1sbvA/MLZvKgErte5FY143Tijk+3+xo3YZm5Pyh/6L3W1twxbrpq7S
	RwqzLltfBHsgBkMjoYrVgHooE8qatMoRKKwck6DHGM3Pi2UAIAZDgr6OKaj2D0k0
	FagbyQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eex6m3sqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:46:12 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8cce230de8bso25701306d6.3
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:46:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780065972; cv=none;
        d=google.com; s=arc-20240605;
        b=AAJfU5fDYvg+1uf2DBX69lNDFMbDuaLBqPi3fqZLsZJs2P0XhESTFZFP5pXwV+OA5F
         J6pLJBensN1sEMXuzC//xlu5eBDO3WW3pxvImypgQYTRhLtpJs94PwlGKzdYCUVGZQNr
         ujMJ8j6R7oWRneL3T2SgOpUif1lszx1LfifMNCUh/KMFerhQWIw1+fiKmj6GZ5lhI1+o
         lv4OoTwV/U2K/Bk25lVAIYwTqPt25ZjPcaBRLb7jGPzhOg0I+WurtwPxiJ0zDdb7enAK
         /Nr5RKWYfApOY3upBHBr6JSAjWM0/zN+0r+XQ4hcyrtOB8vFvwKIFs9NC7QAibENbc9Y
         hzQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=voUJObYcKin1raCObqToYyhbjwo0Gb69o1ZFsTElHNc=;
        fh=m25/IAPShiY8AvO2jKzGChC9ehijp2TVZmBMQ6lO0SM=;
        b=NkGuezBtge+PJThBF1PO4/N1mdcDv2h6YY5lV57xcNed2ZTdNk3dq7VU/aHncyxili
         lR5URNbJgKHT5KaqlwjegEfJytlVqAvslocbGsQput3QGFMKU5Q0FmsyhB1ExSnmJ040
         qeI2XXqaBYjUqe7ceP4PQW3UhVuzTzh+JODtPPK8s6b8MGvGGkRdfvn7bLUeHXdvorkz
         WYPF+Pbg69evKTEOJg/MZ0nf6TqdQi6EfNSele6PiuyVcc60JcXRQjSHOai1dB11dvQV
         dEC1n6iW5uNjlinYFyfwwTPqPOD+wdKNAd6ZlgkU4YJ9WJXNeM2Ap+42XJOPPDPfbP5N
         4YnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780065972; x=1780670772; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=voUJObYcKin1raCObqToYyhbjwo0Gb69o1ZFsTElHNc=;
        b=ORKLabf13w0nLLMi61UNZhfsVr1x6cJvN91UjoihyIYUS1ETmYcv/jC1s5wRWoRlRQ
         9/ydpo2pC/5InDalQl+nB737UAsoTBHuw7mUe4fjp6xFmWxUdzFeszi1+biBZBaPaHnu
         1n0JFw6MRsYgBKH/YDOhzLwY3Z9roCdA5YDQWJXx8GNRo1H78TdalUqSXb0cmfwBAX4m
         Kly0HECWM/tMWoVwSW8GpJB2x5KPLNIyewNG7SjHOkvUUQhTZdfvqxPsBiyEtjbFmqH4
         5ng5iMTdrnnsoNxR4Cwm2CCI+yPAD52+0jeXG1kWds4fEdOjVKIfZsplv4XD1Ybf0Czw
         btnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065972; x=1780670772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=voUJObYcKin1raCObqToYyhbjwo0Gb69o1ZFsTElHNc=;
        b=VYWMy1+rrlEVmKlvcyQ2FmFRAYNM49cjuSln305k+SX8MNVPRFq56KURDnkx7iuN95
         dk1SPmVuLy7r9ZmY2VHVemNO0PX5Kn3NB2+uJLNMdCq5YP4Fg1UxvYDWOuA3n6bjnagX
         MOVtCT8pkHRymxi7Owv0c7vTceRv4RtAauQTQT8YFBbKGOKq2UDuKPwkWtAUXW+PXyyC
         oVSLreJXx7mZ2nXkiM0BWX6REVOUTU/LIWI5K6ftASb8I5sbXqc9xvFih8h/mPyIeaH2
         HZZ6pN0k9YSPNLavkfmQIwNoUiQz17GBom+to8L+B1KP5ZRwKU9dLVx669u9mkzjx1rG
         ieBQ==
X-Forwarded-Encrypted: i=1; AFNElJ839Cw/8h5vg4gg+Ob2v/T/svfktTB4jdFpJ3bTESw9BaCpMW8HGjiYFXYGrLk5SVAC1zmmp+S5HwoL@vger.kernel.org
X-Gm-Message-State: AOJu0YzgUt/dqKvdPpllnhx26ijYrkJcxvPvnjMehMxbpGgcPtljI0dl
	RasvRAMzTNAkE37uDd8TTdTLDMawvFenEZGpBFVvyLKOO19oF201r/M5XHCVyfN3SMFBf5Kc4DM
	bbUzSsPw7hotsFHF82WsiZRkzrapI71AJXW2DptcZuWz0wfHgW4nWRyWn7TeT3Q6Q1zLnmQpJWH
	69TCnqfZCFJeE/SAqTL1xqg9PFYjGnrrPnY8Nu1fA=
X-Gm-Gg: Acq92OHAaiB2W54S0Ji9PIPA4KZwbKTl42Eh3iil3yXuEs6Z0sFgw7rHcnsx59LC5Lb
	VDHR/m+tVQkaMdpS2NUSies2iPy4iGFJ5Ddcsqg/vM+uqy75Kb8L/yA1ZzQFlCcGjWho1BS8NTd
	g/2oFrHFbjjZXhki6yEX1oMzCJaEN83Za4MCQryeixYFfvD6k5Z78JXeeFlv2E5hAPx4KxZK4+B
	brie0TONYJ6YsKBfA==
X-Received: by 2002:a05:6214:2129:b0:8cc:611f:197f with SMTP id 6a1803df08f44-8cce8273b9amr40425616d6.44.1780065972147;
        Fri, 29 May 2026 07:46:12 -0700 (PDT)
X-Received: by 2002:a05:6214:2129:b0:8cc:611f:197f with SMTP id
 6a1803df08f44-8cce8273b9amr40420966d6.44.1780065966941; Fri, 29 May 2026
 07:46:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528135342.11678-1-manivannan.sadhasivam@oss.qualcomm.com>
In-Reply-To: <20260528135342.11678-1-manivannan.sadhasivam@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 29 May 2026 16:45:56 +0200
X-Gm-Features: AVHnY4L6MWNB9ipo3mmpNNI-uKAIfhPINhRgf_XrDuSat0AGf5o159oc_oNQjTg
Message-ID: <CAPx+jO9782bBRuMAsJBgRc7y=THa_+48hY8xPieZAB_3dWeaHA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: sdhci-msm: Rename the binding to
 include 'qcom' prefix
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: ulfh@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0NyBTYWx0ZWRfXxfY6GmbWUuXT
 Y1fL06t4R1mWT1bVIrX8BCQS/Z+zRAmBwgP8HZ2k+zUM/F2EkbCupLOS2kQha/RiZ/RnkFgLn2j
 +zaKIJvck0HHExJq/ZSY4GEfquK1PtfW0FHlXaSftHsA0zzbMUDIVfaaIU0Bss0mJX2BmqK1MlQ
 pS9d9eNqZYI+CS3XhsACHkj6+FKXw1iRxYYBQo43ys2jYEIcgzkbt5sNq8NdcPo5EpPZJR8j+ju
 nH2HF0MQW98RUFO6ipFaUjaRIbMS4Bf7YYbVQoXeF0gjMwTCTeHGryUCmLNmOiMdFtARs6jOcpX
 k2STr9gCYqrzE229EVTkdqpMT/v16KHNFFX62amac26jlAWDyMS7zQJiCAgYsEUrp5ngOJZ8BMR
 2HdIUK5fRSmeiLgb4Rl09gEEWtJ9v6PWPLqzuyWOcHotF8f1Q2mA0x4+pKWBGA3Ze4oXSjlkEyG
 DXIHmLmUIcYfltUqiug==
X-Authority-Analysis: v=2.4 cv=frnsol4f c=1 sm=1 tr=0 ts=6a19a6b4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gEfo2CItAAAA:8
 a=5jWyPAnK0HxrPH3f6sQA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: sCXWxc-2enao2x_czPCGoND_SbBwAgyb
X-Proofpoint-ORIG-GUID: sCXWxc-2enao2x_czPCGoND_SbBwAgyb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290147

On Thu, May 28, 2026 at 3:53=E2=80=AFPM Manivannan Sadhasivam
<manivannan.sadhasivam@oss.qualcomm.com> wrote:
>
> This is the only Qcom binding that doesn't have 'qcom' prefix in the
> bindings name. This doesn't match with the regex in MAINTAINERS file and
> the 'get_maintainer.pl' script fails to list the 'linux-arm-msm' list:
>
> Ulf Hansson <ulfh@kernel.org> (maintainer:MULTIMEDIA CARD (MMC), SECURE D=
IGITAL (SD) AND...)
> Rob Herring <robh@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEV=
ICE TREE BINDINGS)
> Krzysztof Kozlowski <krzk+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FL=
ATTENED DEVICE TREE BINDINGS)
> Conor Dooley <conor+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENE=
D DEVICE TREE BINDINGS)
> Bjorn Andersson <andersson@kernel.org> (in file)
> Konrad Dybcio <konradybcio@kernel.org> (in file)
> linux-mmc@vger.kernel.org (open list:MULTIMEDIA CARD (MMC), SECURE DIGITA=
L (SD) AND...)
> devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE =
TREE BINDINGS)
> linux-kernel@vger.kernel.org (open list)
>
> Hence, rename the binding to include 'qcom' prefix so that the regex
> matches correctly.
>
> Reported-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Closes: https://lore.kernel.org/all/20260526151003.p4kn2vek3hpv4gzv@hu-mo=
jha-hyd.qualcomm.com
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.=
com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  .../bindings/mmc/{sdhci-msm.yaml =3D> qcom,sdhci-msm.yaml}        | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename Documentation/devicetree/bindings/mmc/{sdhci-msm.yaml =3D> qcom,s=
dhci-msm.yaml} (99%)
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Docum=
entation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
> similarity index 99%
> rename from Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> rename to Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
> index 695a95e8f35d..cb16c08d22cc 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/mmc/sdhci-msm.yaml#
> +$id: http://devicetree.org/schemas/mmc/qcom,sdhci-msm.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>
>  title: Qualcomm SDHCI controller (sdhci-msm)
> --
> 2.51.0
