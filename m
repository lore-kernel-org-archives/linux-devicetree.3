Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25223E1232
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 06:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783492503; cv=pass; b=LEESRwtjWFXRO8QfSn5yaGCW3DlUi9LsAz8gGTP3wkXTicMqlC37sz8T2YoFBZhrV6bWlnt3fXvC67SAkyG0OvznPns/hVZPMl3uE9Yuq+s/uAeF/RxuUo2Hf3ez9byEnSXhV+sovguOpFkjpbxTe7Mm9MGl1K2e5vivg8QyNaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783492503; c=relaxed/simple;
	bh=HQHMQxIaZk9tRRN5pVDUIzC8+5ADYKVLzXTnJo29n7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g6/TWsc8oCNHiFqvdYvfD3NJNgVJCBo+2QhVQrB4Mus6iRaRynIjFuxuogYfIkU6OcYmeroh4e4ohMqyMSDCnt19FLQ2erTb0ktjAwLxsyEcSrKrSqbaoCl83Zi3y0SeL3RN36PF2Um370RymR2zppyRUN1AFYZg3Rkki5bYSGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XbiYhGYJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OnQGj7Zs; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XbiYhGYJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OnQGj7Zs"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668428eZ1656386
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 06:35:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MhvJfiEOR/29UPGbqenV96kQ3jHY05K73WPO5qYby4E=; b=XbiYhGYJyV5Z/l4L
	wCToyc7Vq4D0l26EOhKjn5Zc1soAb9yKqfmcFlboMrDj7w9eJJR1+ilY9MnF7GYG
	VbOqGqu7YKaSsSBa87Pzlbkl0QlNThXZwsuGIb10yGOBB+zRy/UYrKQ+x0/LcNM4
	t+TWEAAvlAu+67aJVYDDhlpPMz+ZD0LVa3zcQYR4SCwwRZU3GuoW6Vl5S3Lx7kXp
	nRVC9DgZ2nJMYDIqyRx5Q95do2VuXr9S0xFuPxdDyZrc32adaCXNjnEhQ9I1tOcW
	eOpOq4e85UVuOCMAudnqEGnIaP7yXoAmMhTIHhl92lR5i4npRGGpdJb/uUTAeVAW
	iDIQag==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9csss1ya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 06:35:00 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ee40bceb55so4917546d6.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 23:35:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783492500; cv=none;
        d=google.com; s=arc-20260327;
        b=HUNMzGyFxLOQrv/MNrnatcavrS8I7jx1IydEm6jIZAnmQfbgH9S84oE1JnPjCOPqEh
         tokgKHSxP4xb/Pe5VhE9VkEvL4cmDoey0wa/o+6GbYZpZBLcM2Aobl6HWTLTkQyHH1SV
         L1n1/eenpiaBPy6bu/IaRKMVV3JdhXlumInGbvsRF/FLpfAqkIl2HqP/CK7lC2t3vDsb
         YvNBiywhZtVO8P6c1sr5+d7dCSvOE8rgebrNzeDdEGRTWqFunZUyoT8f5oy2oqpGQnmT
         cuNLEnSCKR98BkHQU9I7hVRmaRRTo1f+UT6ZMjRnssGkiN/0IB/hcmDeR2ivcuNklk5v
         paTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MhvJfiEOR/29UPGbqenV96kQ3jHY05K73WPO5qYby4E=;
        fh=F6NI6OM0bzHkUbdXEHTfOYn+fYhBNYHmvfK3D6KOP2A=;
        b=hTLnt+4xLNhX9w1yAj2mjPmzpIuOiCIuomksUt61Vy4FyCX5pSa1+HyquP2K3fIzrm
         VfjZ8b4PWIHo0B6Nxh6hNtfFS5b9oBn2BVSNsfP+ukuAxq4ryXzLcDbI69uJdpf9L0bD
         99kGebQ6Uzjnefwj2aUJD5H93QgbEzEXtIOyrRs46DY3SbJd3pPgIKkjQ1OuUt/r7tBm
         xcnIg4sazIL1bz1H5eP/pmdVA3mL2GO2+WvoXG0Bk1APdLLot5t8sAAKHSkj+x8Y0pIg
         gWl/fNOlhHZPd89RauVIayy48+KbGCkOcqZKAX1k3J6s74GEcfigaLsc/Urj7qBSEp2p
         /25g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783492500; x=1784097300; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MhvJfiEOR/29UPGbqenV96kQ3jHY05K73WPO5qYby4E=;
        b=OnQGj7Zspk/pqLz3paOkP5qfSGBQI6N1nM0h01YpA1/BJmPH2//hZzFPLa061YdwJl
         g+GXHw7ctYfcNyp4l44vwlFStyow+X/+1ZRH1sinmhN3E0fSV6PkaVZVaClMSxP0lEe1
         07vwIxIQAjH1L7bX/i6xbcvN9CP9m0MaeyIcszm3ycTAZ93lTgIcJgvZ4UXHg9nNavEf
         N4f6+K5Jv+RhqVGzlUfghtlFFyaNPbxttuz5dHTg/AyIVHGKIOqIHGrW8lq1/OFLQ/FK
         sTDVvU1F9cAHyXrY6rfnsAQr2AHqIK+fdOv2FxpYScW5y8m7bNJ8om7HF6+MiQkCiINw
         pSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783492500; x=1784097300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MhvJfiEOR/29UPGbqenV96kQ3jHY05K73WPO5qYby4E=;
        b=ggakHEHk+87YwwmSBj+0XDT3aWWap8TqztL/Pc3HakDX85kxuoJW4qvQhxbjeMdpxe
         N61geYmuN75Oe7Gyl2pwolZ7dLbKMgGWeY/hy1WIxHQkSPTJfNaeoouNN1eUJcJm7aI+
         iwAoyqL22J6wfxQr4h3PbcccGFevSSOJ40nFaC4yYgNRjU/PnjUe1O1FBaK6HwaDyf+i
         J5xJldakAAdGB93Am0M5hjhxZhT7J3YJt2BA0UmP54AILBZ/PO7NJ4UIlIFJtlLpYjzN
         e0W7nYH4pYeS8988TaJWGcNou3YSlvSaISTgGGl1T3P2mbjWSaEiEOfb/6VI5fp+FlBY
         BW6A==
X-Forwarded-Encrypted: i=1; AHgh+RoY7+m8qDpf8zryPzsEgXAPtJMyfe3SuOJP1KUVavWfe4FACMWyH82v2PTRUQREFdiN3UWH5FXLvSuq@vger.kernel.org
X-Gm-Message-State: AOJu0YyG20u5E2pcmnBnfJFQLuOMK76NnZVA2jEf1wdp0ZCuNMbAuC4T
	Ee55Qet1ZIkxiL5sXw66x9isa49yc/g8EjGe2taY51OfoduvjxVRBVq73UBR0TjO1wm5YTAsjwf
	pKk5jdaonjv+bePuKsMnyL35zv140yNMEQdfnxLSAoMC34n3r1N2ZgKCeLRBImaGr9YwWmDBvWQ
	RnRMVGq6/hNUrL+gVFDvxBdgZL1AbeqZMJB+Wn7LY=
X-Gm-Gg: AfdE7ckZP5qNeq8AfGdes8hBzyxcoMwNXBbX+bvy6Ms+7kA+uiRWmucS/nu2TKGxlUu
	X4VgNlIGb2CHl7rwmgyhGHnzAVZTOTJLZ+haB38MWR+j8pePFC6QrXQ1j1jEVyq425iOHSsFHmT
	qxSrdLVjwtTH4n7JJrgWHFi8zp2UEQmSTMljOKBf1OKuxf0UsxvSaDwQuJUFZ7sgVKIe3VV3WVe
	YMMujnIteB+fHPZQwq3mFj1Fg6K2J9cFiIeIJOUlu+ncYhJe3lb7C1q41j5gsRcMzWN3s8AY6jM
	N3aprRjMoA==
X-Received: by 2002:a05:6214:1244:b0:8f4:8950:37ce with SMTP id 6a1803df08f44-8febd9e83femr10137606d6.0.1783492499749;
        Tue, 07 Jul 2026 23:34:59 -0700 (PDT)
X-Received: by 2002:a05:6214:1244:b0:8f4:8950:37ce with SMTP id
 6a1803df08f44-8febd9e83femr10137356d6.0.1783492499274; Tue, 07 Jul 2026
 23:34:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707163703.233405-1-srinivas.kandagatla@oss.qualcomm.com> <20260707163703.233405-2-srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260707163703.233405-2-srinivas.kandagatla@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 08:34:48 +0200
X-Gm-Features: AVVi8Ce3aT296uzyiYfMjfTF9OSvMfQFA6MzJcEjE5PtwBSndKXXLK4YSiFG-1k
Message-ID: <CAFEp6-2kjPxaw92c32NyWT4HQ+a0APh1ghYnGAprVRi3TsjRyA@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: monaco-arduino-monza: Enable I2C0
 and SPI3 for 40-pin JHAT connector
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4def94 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=M_ErV1Mzh6uRu9SFwtgA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA2MSBTYWx0ZWRfX2RdoqKf4RAGn
 c5ENbs0TsFXLtXCcZDfjHZylCn3Oa0ODgld1W8uNNv3ISVh/UKBqR55q1lvSSDsWfUpN3QKERv8
 lUxbnEavUi0SEBWa16ykzNMvTLP+F8qyYOBlbvopZrm4Bde64Y5x3y44UQrjvvBX7jPh2Gz0iBI
 6yIaeDsf8/f/P07sOJHjS59pRlLVMfKeKOXITfqtb038FHPkhY+ks3PESNbJhLPfnZUu7LlHq3G
 jdDGLRJs3fjhBPFe0dHCeHQwdkSotglS0eigWaUCo/RDRJO9vhzho+NqaC8TS+4HDmkM0Sz9fjl
 IRIFiMPb3YCSz7GpNE2nNsluLbBTkIQyPrCWdilfMj6UsbZPCzSSc8+QwYYM+XhER2AluLppGEi
 4ujmelm3rfaGVMiVgHaXnaG0eM0sQ+lThwE08r6KYYH2lDCQs1oM4SGcd0xgA5zEMFur8YKV+qf
 tkBAWgsMa3S8Q+IcHJg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA2MSBTYWx0ZWRfX+bI8aAEIGdJX
 4WpIaaBE8/334+SLvuZ8CRJy1xEx6pXPjrE0xGyAw56EdoyK2GwVlANKqDA1W0j8DPFyGaXEpUG
 +IK9nnT8H9xPTKnctGrdIyrXFakkv6s=
X-Proofpoint-GUID: ulT7pGFv1hqce8EH8FWt0EuIu3AHWDGn
X-Proofpoint-ORIG-GUID: ulT7pGFv1hqce8EH8FWt0EuIu3AHWDGn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080061

On Tue, Jul 7, 2026 at 6:37=E2=80=AFPM Srinivas Kandagatla
<srinivas.kandagatla@oss.qualcomm.com> wrote:
>
> Enable i2c0 and spi3 interfaces that are exposed on the 40-pin JHAT
> connector and add the corresponding i2c0 and spi0 aliases for them.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm=
64/boot/dts/qcom/monaco-arduino-monza.dts
> index 8b3ed73feb6e..4b1975dff885 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> @@ -19,9 +19,11 @@ / {
>
>         aliases {
>                 ethernet0 =3D &ethernet0;
> +               i2c0 =3D &i2c0;
>                 i2c1 =3D &i2c1;
>                 serial0 =3D &uart7;
>                 serial1 =3D &uart10;
> +               spi0 =3D &spi3;
>         };
>
>         chosen {
> @@ -257,6 +259,11 @@ queue3 {
>         };
>  };
>
> +/* JHAT 40-pin I2C0 */
> +&i2c0 {
> +       status =3D "okay";
> +};
> +
>  &i2c12 {
>         clock-frequency =3D <400000>;
>
> @@ -425,6 +432,11 @@ &pcieport1 {
>         reset-gpios =3D <&tlmm 23 GPIO_ACTIVE_LOW>;
>  };
>
> +/* JHAT 40-pin SPI */
> +&spi3 {
> +       status =3D "okay";
> +};
> +
>  &tlmm {
>         pcie0_default_state: pcie0-default-state {
>                 wake-pins {
> --
> 2.53.0
>
