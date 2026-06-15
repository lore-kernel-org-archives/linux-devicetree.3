Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BD33F4840
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 14:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781532410; cv=pass; b=Tnam+KaGYJ/U4oSZ/8p2w0iCesBBK22vkXrLWL3wuFHiUKrYrymBKrJG0NQB7akBDewh3Cua0cKunYdCp7FvLx9Rv4k0Kz9DXcejncbyKd8nphw/tTcLHV4DT6fjU2k6csK/CB7FtzCQVBlCdQM4yU1sBRvn1vhdTuwIhG+m8Ck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781532410; c=relaxed/simple;
	bh=8mnu1b//x6MbL4l4Q/DwqLbKuYvGzUIUeTEEC+ZG/+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ViACcSb9HPHOJsxJ4U2rPEuJsz4jCQgtINAjeUQnajbgk2fAzNLOhiNxxcrbJvBgfsugtQKAby6l86zOb9mYaZyZLFRRzta7jjAh2b6fknth83Y1f71SbkNjb1YoaRKarXhDQFuy4NmFOOCej45rK8nbummhTZ9+8G5qYsvN5H8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NAopAMyq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vz1ZedY4; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NAopAMyq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vz1ZedY4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FCZNxA022356
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 14:06:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CtAagYp3jdJuBGRK4I9xSk0WcG3zU047OSNI8ovVPTM=; b=NAopAMyqD6A9UzdC
	jKnHMCHqy+twvcfWx8oGsq80EyBoXVupG+xLD0Th3IUT0QaIXw5LJY1rKpByEj5w
	mHuiw3L/xkiRNkFs/2iz2Ofs76lfdGJodJJZLELTsUDutAQH5mLBTZWZrvivn73z
	nhwndYYHP7S/icyOdLHcifj0q1WfrG6YiztnI0R6062R9SG2ac62D+pinUfsKN4i
	z8buksGqTun1hEmQhY569AyRghIimg9rIYtlQm3klekMUlPmk5P65SpU9Ag04Xmw
	Tc6zGWb54jVpix/uXyhKryFgKac4EAifbLd+q3Qp3BaX7VHH40pbYt7jP3fj9u+b
	VT031g==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etfa70w4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 14:06:48 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-69e412347c1so4313901eaf.3
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 07:06:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781532407; cv=none;
        d=google.com; s=arc-20240605;
        b=IzweXjbTsKOaS9Dr117vDPsTLeZS429irP7CtU4Psc7koeZE57tCSw9iytncuXxTxA
         zaKzrb/e3Feb9z5WOquVqjwwxEy4K8E9cb9jEp9XGFtUVHIW3/08FlH9IYPrBhM3SW8Z
         qAWOnjp1jNfZFzg3NZkw5bFhviBHsesdURCVfP2bM2hBkVyDRPLZnjGevbAKpZ1/ou4M
         +hqwsLteX5tvmzLFuCSBCM59oo9INTlDRnLtcQkCh/B84C3OdtJNxLHpaeqHkNs8iUAj
         1qj4wNHn2xEE9widfYmFshfh+lqOI0fV3LwnWcdti8KG+bbUsAjkyKeJAKIu9f+JkU5S
         zb/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CtAagYp3jdJuBGRK4I9xSk0WcG3zU047OSNI8ovVPTM=;
        fh=BTSFnJPShOEkeLUrX+c6evTGdymgSfne2SjnZXGwUTw=;
        b=Ls2sPV19DrskGKH3+qtNgDYdWlWzVp1ZHf+RF8Z6TL6kDQvXIBhdQO3mb/JRTqFRmL
         0YzPPOD3AtpMDrDb97XCPGlleL96Pu9xicWxG/67GQtyFRNR4+507Pcx0FqDj0q/pN7k
         JKCHFsSeBIdaNqD7qiclTczkaO6d0qxi/pConYmAJdIvIf218JKW+BL+S8I0Bg2Hv5+f
         Hn22MNbTs8CiZeT8t2pl3CER9QCv0u8eFlnBMZ1ft3vTM6C2nsCYkGO5alfJfXOoCL/C
         KAZ3nKgK1SXUUw1IHYxlgFNb7kaoEbvKYucHS6y2+h1Okv4x+M9O5sBP/ygV0NR15T2E
         ikqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781532407; x=1782137207; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CtAagYp3jdJuBGRK4I9xSk0WcG3zU047OSNI8ovVPTM=;
        b=Vz1ZedY43YDIZdseWTMdQWXAkSpXyv41cRBf61cF1iRPuiYbpif5jLtTgDTz8G6/u8
         n5RBkx/lJuFHXR6c332UjV1Dc31U9NlXd2QEbaYA9voPtmED4vCjiv94i6X5FPbDne9o
         qoEeVqem1gBKPQv9LSDj15By/IeyfI5A4yT5WzCd2OYPQcPDOXsnMH8BNGASdi8hV4ca
         Myli4add+XRb5D9qO9GSqmumsctKlKh8FY0IIZp4+eVoYxcav2ahSknd+XkcVoZKp6k4
         Mg9QNVxnKJj1ZfHfRfWZMFPYGUKx/UDlX2nMosRhho2DU9r6BwJ3uNBVURHkbKhhswTq
         wHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781532407; x=1782137207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CtAagYp3jdJuBGRK4I9xSk0WcG3zU047OSNI8ovVPTM=;
        b=DE3EQiQhPzLmEErugHMQY9479MWB5wA9HTxAQnYxjYZZtbPA0LVrAOOT4fqyvXjip7
         ZpHEV+AxSY1Eb91esLtmIPQMijojEep9M2I+7gu/0n5EVO1t65vqXaKsoARFxVVoYBVR
         C24oUCbZhERsGG6IUWbqzhHJ6dwsfgiBtteUvpQBAz+4uaxbyWj+gqsDO+56qerssnBn
         zpZphgwqn6CRQoOUFfKMGipHs2EIm+YhhIiLZ77Y4ZE4CydD6HYa+Q1R8vsWR97gIYn2
         wUAU7yDr4APaAY+/oDCIbVWO8ch7gQiPaQiS+5C6WT7OQGeqkFumj5KXlVf9jdNOLrtp
         OY6w==
X-Forwarded-Encrypted: i=1; AFNElJ8xc1yU+7Ue5HRyN4RUM+frl3YvC8MmthBTMaPiWJBo6acdRVUjlLDceDTsCOg/Z3ZvF4QAZPTkwULa@vger.kernel.org
X-Gm-Message-State: AOJu0YwNsfSfJBinWNzEz6KVJdmL0Eioec2E52AKUu0W6u1+BEbXyYBj
	5+e6MACWB9ZWGUEr7RYaoYXoelbtj52RCB/bgOIAAv9ciI9Jd+vzVa1wWMHmY4HlHUZvEjtE65M
	VBGt6uBft9ciNT7bLG8GariOBnzDtr2LkrDxso62L4AXFOWmCqhC4xu4zXEx8nt5YuP7tT3NpwM
	LMaoZ3fNffZ+JiFeHRfNa0EVtbrne1H2vPcZ872/V7G8G92rA3Xg==
X-Gm-Gg: Acq92OH0ktLk8UGQFH8FYcADOamiIwuamju1rCKwKGQEPR5l3V5/dilZHZ82N2l6135
	myqOEoTpSQQKH9Gxqyuav0w2ltNQ32Ll/smqlZ8lOKz5lJu5+6vzsvWvA9q7CGzsMPLJeyDdRcE
	fPgrcvTBsxUOHL4MWfQ6e4OV8Ukbzf5418Pb3uDoOBz0UzA/t+zsYhDRVtkZ+TM3Qfy2M1+s89w
	U/A+uA42X/9PZjCne207KuEPBBoV15gjG0U5xShQDvlbKJuBG81+OtMH1P/YAAXXC5OYADKm114
	uBN70NwTZFdNWxtM/rQTNYrgfyPTrLSs/cebf00woilDnGtV
X-Received: by 2002:a05:6820:a02:b0:69e:158c:8998 with SMTP id 006d021491bc7-69edc74ba26mr8704354eaf.38.1781532407169;
        Mon, 15 Jun 2026 07:06:47 -0700 (PDT)
X-Received: by 2002:a05:6820:a02:b0:69e:158c:8998 with SMTP id
 006d021491bc7-69edc74ba26mr8704315eaf.38.1781532406716; Mon, 15 Jun 2026
 07:06:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529-psci_sys_reset-dt-changes-for-pakala-v2-0-1964ebf1924c@oss.qualcomm.com>
 <CAFEp6-2-n1L8rLv9zV142D_Q7io1G1ZuFgLHowsf8sObQt6iLw@mail.gmail.com>
 <aivBcGQgeKGW45Is@lpieralisi> <9a2f95e1-f01e-4956-9e84-23f0a5f26298@oss.qualcomm.com>
In-Reply-To: <9a2f95e1-f01e-4956-9e84-23f0a5f26298@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 16:06:35 +0200
X-Gm-Features: AVVi8Cf8pitrTp7zxl57WdsyeqAZVFnmJNxiFVDQF8HHco4mBWZB6R14se962UM
Message-ID: <CAFEp6-3dC3mzYdB6imB9evgdK68fZjDER5uJ4mEC7a1F_SEGsA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add psci_sys_reset2 reboot modes for Qualcomm boards
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xin Liu <xin.liu@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 9RIhv9j8ca46ut-R43yFyKSfmulZpSmz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE0OCBTYWx0ZWRfX68B/Ifr2MWIc
 hIDylrvCL04i05nm759O22UiesxbZ+2FdJ6azGfUK3/ZIgwd2CjCbip1X+Nizxg7QFfVlL3jv9p
 9ej2lxHfEWFT1cQA/Og4BKQC79mmlZo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE0OCBTYWx0ZWRfX9xbpoW5pgFqW
 5LmjHdoMAF1XCitPKg//yoZabv6bnhv9JI4UqS1CsD9QO8RQ3L7daUvy0kDiKw0V0KKnE94CNQI
 MM3BqzOxHqJqEUE+tRAqEgRXzTQfpYpPKhuoG1ftSYmdujuSwwXCZMv8mqGv7bGE5UQW39tccSF
 W9DQ7cnbwMU7AgxArK/wYzkD3qdGykB7/I5colZ82gGnidV/vaD1bpSFn76JjpjtigIda8J3XNo
 E8gbb2XWb0vwaC0n/mihTi/Z/BUu2oAlv8uP7md9d1+e2IVDaMTiIgHjYXgIbsMDMuhncjTaw43
 G3lBfr9gPQC1nnvgx4zpP2EWqVx0FHtvdRWge7ehGYn4MrL2kSKCFuWwv5IIo7I7HsOYpUbKL7s
 WxZ5K756eJ1YfDrRDmqxPLmKiQYaiuh6kNrX6AF6E8yK7Rik7RLtzUz1/bf7ehZ6ijSWjSpAlWF
 HMU10Y+bT8TGspnzFvQ==
X-Proofpoint-GUID: 9RIhv9j8ca46ut-R43yFyKSfmulZpSmz
X-Authority-Analysis: v=2.4 cv=AN2yTM5Z c=1 sm=1 tr=0 ts=6a3006f8 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=8K5-RUECaDmC9v1tkEsA:9 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150148

On Mon, Jun 15, 2026 at 3:09=E2=80=AFPM Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> wrote:
>
>
>
> On 12-06-2026 13:51, Lorenzo Pieralisi wrote:
> > On Wed, Jun 10, 2026 at 02:57:19PM +0200, Loic Poulain wrote:
> >> Hi Anurag,
> >>
> >> On Fri, May 29, 2026 at 4:29=E2=80=AFPM Anurag Pateriya
> >> <anurag.pateriya@oss.qualcomm.com> wrote:
> >>>
> >>> Adding PSCI SYSTEM_RESET2 reboot-modes for sm8750 and
> >>> kaanapali based boards.
> >>
> >> I would like to highlight that when Linux/EFI is enabled, which is a
> >> common config, efi_reboot is used as the primary reboot path (see
> >> machine_restart).
>
> Yes but, only if EFI RESET RUNTIME service is enabled by UEFI.
>
> efi_reboot(...) {
> ..
>           if (!efi_rt_services_supported(EFI_RT_SUPPORTED_RESET_SYSTEM))
>                    return;
> ..
>
> >> As a result, the PSCI reboot hook is not invoked in
> >> this scenario, assuming Qualcomm firmware provides EFI runtime
> >> services.
>
> Currently EFI RUNTIME RESET service is not enabled on these firmware.

Okay, if the EFI/firmware does not expose it or ignores the reset
call, the PSCI hook will still be reached successfully. Thanks for the
clarification.


>
> >> As a follow-up, it would therefore be beneficial to also
> >> improve the EFI path to support such custom mode(s)...
>
> Yes, and potentially linux should also have some control, if it wants to
> go via efi reset path or the PSCI reset path.
>
> thanks,
> Shivendra
>
> >
> > I have not checked but we should probably put in a place a way for user
> > space to check that PSCI is _not_ the reboot method that will be
> > used, lest it would be allowed to send commands to the kernel that
> > would be duly ignored.
> >
> > Need to go through the whole thing again before commenting any further.
> >
> > Thanks,
> > Lorenzo
> >
> >> Regards,
> >> Loic
> >>
> >>
> >>
> >>>
> >>> These DT patches depend on PSCI SYSTEM_RESET2 support introduced in:
> >>> https://lore.kernel.org/all/20260514-arm-psci-system_reset2-vendor-re=
boots-v22-0-28a5bde07483@oss.qualcomm.com/
> >>>
> >>> To: Bjorn Andersson <andersson@kernel.org>
> >>> To: Konrad Dybcio <konradybcio@kernel.org>
> >>> To: Rob Herring <robh@kernel.org>
> >>> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> >>> To: Conor Dooley <conor+dt@kernel.org>
> >>> Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> >>> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> >>> Cc: linux-arm-msm@vger.kernel.org
> >>> Cc: devicetree@vger.kernel.org
> >>> Cc: linux-kernel@vger.kernel.org
> >>>
> >>> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> >>> ---
> >>> Changes in v2:
> >>> - Fixed subject lines.
> >>> - Link to v1: https://lore.kernel.org/r/20260529-psci_sys_reset-dt-ch=
anges-for-pakala-v1-0-7c32161cf50b@oss.qualcomm.com
> >>>
> >>> ---
> >>> Anurag Pateriya (1):
> >>>        arm64: dts: qcom: sm8750: add reboot-mode support
> >>>
> >>> Xin Liu (1):
> >>>        arm64: dts: qcom: kaanapali: add reboot-mode support
> >>>
> >>>   arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 7 +++++++
> >>>   arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 7 +++++++
> >>>   arch/arm64/boot/dts/qcom/kaanapali.dtsi    | 2 +-
> >>>   arch/arm64/boot/dts/qcom/sm8750-mtp.dts    | 7 +++++++
> >>>   arch/arm64/boot/dts/qcom/sm8750-qrd.dts    | 7 +++++++
> >>>   arch/arm64/boot/dts/qcom/sm8750.dtsi       | 2 +-
> >>>   6 files changed, 30 insertions(+), 2 deletions(-)
> >>> ---
> >>> base-commit: 6ee02bbf328be8a8586487e3af73b65a906cce58
> >>> change-id: 20260529-psci_sys_reset-dt-changes-for-pakala-a09fc0e2a8a8
> >>>
> >>> Best regards,
> >>> --
> >>> Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> >>>
> >>>
>
