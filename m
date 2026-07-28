Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93C5424644
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785230321; cv=pass; b=hXyODdDlHlR4jjEbIeVZpd+5DKytRPwgeVuCJ/fToZrbZ0Ha2gfExdloc/g49mcmTnWmbO1Ur62SefArnwfKOPrMqF/nDXGpOkT/PLqYGqgREwOPWa3+w26I5CD0DAv31+QtI379nVd3e1dHWhE66wqReDtJP2lUNkq9kIL4SnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785230321; c=relaxed/simple;
	bh=XR1FChwM4ZOFz+4JHw+XDyagB+TIvP8IDqOk9CzMqdI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q9YjHO+BmdY28YFtPWhh1HFUWnsLNxDJ6jTlekUVGUKIj9iBa0eOVQVm7AiFURzBboDRvzXQpJJrYTb777XIVEi7O51bnURuiIWLR4kDXH8+uwYDTsurBG/oe3tFc8Y9tUTjxC/at0IPON+Ixem/z4je1sULi2wmuTpJcX/ErD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e60NFy6Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xf8xNHqe; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e60NFy6Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xf8xNHqe"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82KdO2144972
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vLA9m/fSPfwlI/OacwG/q4Oex7qAyLSMc5Ky0H8tInM=; b=e60NFy6QGXuHb3gB
	tvIrVrjSpMLXIKMPRKCbi3SrcuyYPeP7C8it+rCdiFe17dMRjuFSu0alLPGpBEBD
	CUeu6o8rDBUvai/HM1sMF7gYjD8/p6iZ3iGykQjjm8uxeaVu9xa4pf3yAPY3G0VV
	0RLP7lrtVQ1bvIf6K2HOsc2vngCBS4ekn9K2DuceftSuCv7XXyTBANOwW2A20UkV
	LkuCOfLww+47XPx0Fb2TW6CHAIT9C+vMizWRw4hc8+Tp+gxl9rspmn6W7SIA2Kgz
	VdTf9zBCQTJvH1UuxcRs6Y2yGU+5qLVaG1CD3Ga1lqzEcWBLisMIu7IqCh6HQ8Vl
	hB64LA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpn19h6q3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:18:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e53b8a302so413060985a.1
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 02:18:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785230317; cv=none;
        d=google.com; s=arc-20260327;
        b=Jo+IdhCwpQJnuvk7Osl9NEI/KNjGzjP0a6GJMwWnW0/6lUt6NktTBfqN8HbSw+Nfog
         ajG9DTq2fsw/YvNY9emFxxOGebUMyxKal49gJ2kCkRJU7xqBfyoduOmyE7BWU48Zu3Gy
         T91Z24VbVeNorywZi0YBDrRx+AA9MBxKP0n8HHpy/x2ff469j0NqrYhxHMvTo3Movg7O
         o6HsI1WyeksS/zXa01pClkNx4dbUDu94GKMFAvrlQKLzljn6iT2bcdYhPnVcLEsxMLRL
         gPmyf+TDIVWWzNWmJIh4QnMEjSfet45XDY2mU1FHYjEfuldK2TJOZ5dHMK0w+vn7Nygr
         SqZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vLA9m/fSPfwlI/OacwG/q4Oex7qAyLSMc5Ky0H8tInM=;
        fh=7zX803BDONqrdRuZYpu679vZ7o3JUPSZm0V4CHMcnAU=;
        b=N6yO+5FI7NtY3f/Qd4OxdpHpJol/RK73AA4Edb0uxoAQ2PfRUDdH6To6dJAHT3zzd6
         eS16O5i8vDBIfMJviGeZT/wz2lXbKZzrvd5qf8FiW8Q+V0UigxSKb1RU4rDVnRChDr7c
         uDall1rlpKWC9uDKkupHUYy9qGuXltbCDawDrxY3u0XJR0lN3tkc+0NfShzDpuQXZWTN
         nx7nXQ5KB/7nmEzmI7kd73VkPM3vDo+MtokE4HRniIQsAToMaEGjIWWGh2uq/QcNoDOR
         BYLzrDWeU8ovJPW9xOp/ci3QFnyO9we81AAbyiRIDSnba1pYqstseWgm+uD239uSOOUP
         aP8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785230317; x=1785835117; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vLA9m/fSPfwlI/OacwG/q4Oex7qAyLSMc5Ky0H8tInM=;
        b=Xf8xNHqeozqjO0ajVWcZjdrazpFOiPw03cg289WedWZ4UkKO74gHuITMr6f7q8Ya1U
         mu+T+uR7oOIWJafUGwsrNnke/zH64IeK0uvgZCTuBaZRJ6kCUFu5/TOaJ/41ztnML0fV
         mX2K8kBjPuFH8T49Ve7Xsn9kKR8rv4bg9+IQf+wQo1xNcT8KIy+vqJSntG/IAIBkE+P8
         8YewKkt5pUtudJDB5C+xGTnPobejxLc4ceamKKhJPXZZH3D9S8dvl6hTNs+pmHJG6tn/
         BXpnvhA+vnvvDXGjNVWt/dPJZuS2e1/XXilmru6QRUgQAJOYfPB9cixS1hbBJojtZSSY
         sUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785230317; x=1785835117;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vLA9m/fSPfwlI/OacwG/q4Oex7qAyLSMc5Ky0H8tInM=;
        b=gsAch7XoWMjqVO8JKsZvbikhzyk3UILGD9dTZoV79q8qlAj5RXVHPUtimg1whDDTB1
         HgmUdDFNi8G1AFr+YVLpvUTqkBFT8L4tsLy8YQUD9DZifTvhkt7DAaOC6YlGqW0NRvqv
         MhJ1AcDkeE+nRtOJovmlKYIUHpyWWdNPx0kOAkJ4WEs81Lfyz4xLrF/Gy7D49G5oYVNX
         UMxvcQVWV6WV+eB5RLFFU0e337EAkaoxTnd1KB5uSVE7mmunpZQEWglzwBjWEpfGltCW
         d4yPa8Nb+T8QFo+2K9ML8zVaXj9+69jyvdn6KDLfmZ1/TJDDLssSDXOVGzXfKAoB0wW1
         H8gA==
X-Forwarded-Encrypted: i=1; AHgh+Rq4Seqdku5kucMNDjExe0f5EqAHhkALpy8QT3pellOVO1cnf1XEWSbM/3IjFni23aGj0TtBMvRqQyxu@vger.kernel.org
X-Gm-Message-State: AOJu0YyHvjKBwrFMf/oafx7HQTlLzQYHmznGu8glegoVyJtlB7er/BJi
	5oFEd4K4wHxfnkf2Z34svUnSUh2joY4gzJQoFRWHklLLuNpqHpFcECcWC3FY4ebpyop338Ms2jk
	6mnwaewZzplRd4gcKQPjJOMrvDo2kNFxiDRjauGGDMnhzq9X+Sjiz5JnjAJrBUVbKeVXDzPaCSi
	7WbKhdFiQlaPg0rifjfx409hHWzJRobwYmHBrlU/Q=
X-Gm-Gg: AR+sD11p9gsFjoacZlWB1l9TwBdWn3fPu1np5gkQU5u23wS7rnKu1yKKh+CPrT/ws79
	w3fWJr9qyBnliqIK0Y5UgrlujeVrjcUU/MQgKOIDti4WsJ6a+KGmN8dqXQBKFb/ur8+9zcwOQO+
	ZOTsaO4kdqMY87JYtit7H2WoQY7P71DRzMg958Qu6kbTYD20hGDUXpgQuzh8TyG6uCnDf9MfPXZ
	TqmLZR/S2gd8PiClId/2QgKoFDzY0AW8omkSWtLL2x2zgJZoC0URefpEAgfxMK9lEr+YiWPWTLZ
	huyNspZiHV9h3828nTtCKlWu92Es
X-Received: by 2002:a05:620a:394b:b0:915:9125:e652 with SMTP id af79cd13be357-9330277364cmr133019485a.48.1785230316809;
        Tue, 28 Jul 2026 02:18:36 -0700 (PDT)
X-Received: by 2002:a05:620a:394b:b0:915:9125:e652 with SMTP id
 af79cd13be357-9330277364cmr133017085a.48.1785230316312; Tue, 28 Jul 2026
 02:18:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728082548.2511694-1-atanas.filipov@oss.qualcomm.com> <20260728082548.2511694-2-atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20260728082548.2511694-2-atanas.filipov@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 11:18:24 +0200
X-Gm-Features: AUfX_mxVFTXpTlKt2oSdD9NtNkOzWaKQHcgbH-eTXM2rJKQmFn1y8VrplOf4xK8
Message-ID: <CAFEp6-0mjXJhk+n29COc19zUgC-a_ZRT=9Kt9DBaexYcff1Vjg@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: media: qcom: Add JPEG encoder binding
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org,
        bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=TJV1jVla c=1 sm=1 tr=0 ts=6a6873ed cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=chD5afejWsUDTP9WW8EA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA4MCBTYWx0ZWRfX3wngprt+/C56
 fNpyK2tTK83K2Vi7cv0zmbK6Uzejbcz03oJURPuTNNgFgc/rkrM6gObpVuHK5qQ+qZaHOfP6TzE
 uHoof/b/BKx+IOztEKa3xVvBIxwuUp2LCjlEvsjvDycRoPTb0+jSJPqJwuDbJGvjyWapzn5h4MC
 y2N8as0YSjSsodJJ5d6ElaZIFscI0Arhgb88XVVBLdwYeoFEW3HPBQObEOnwXtzH9ABETltC/YJ
 eM0dU0fZvsZrqNcm+4+4ISGX8b1wcUtGPhCBY/G2CX/DYqJS6J3Twv2gfuir8ZcmUuKAcf6e23j
 gE0xOWXoKVsk0oQX+K6yz9PFxRojVX4TXgzoCVH7DOZzsEEgLytittAyHd4HvBD7HU2ol1h8DCG
 M7C+rGaJAHJ1azwTvitS4VzWJlfB+AiSq/TtI6TbulrCSpK5SUk3TOkvYm0HAtoVrPcCBnmyDYP
 /l/1581At/8JgKulUJg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA4MCBTYWx0ZWRfX+cg17t8MBb/K
 wlsddFsHlnqdLcTTicTg8EK9TMksH6dquzNWk459PD8Oq2FFttnkBdHvkkdHtmw7GrfPEGTkoua
 gUqfkpXVO6oHEbEO4p5Q97XQjwJuiyM=
X-Proofpoint-GUID: CEyc5-7LZKb9ltHyJBLjxGZa11QbRtPr
X-Proofpoint-ORIG-GUID: CEyc5-7LZKb9ltHyJBLjxGZa11QbRtPr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280080

On Tue, Jul 28, 2026 at 10:25=E2=80=AFAM Atanas Filipov
<atanas.filipov@oss.qualcomm.com> wrote:
>
> Add device-tree binding for the Qualcomm JPEG encoder hardware block
> present in SM8250 (Kona) SoCs.
>
> The JPEG encoder is a standalone hardware IP within the camera subsystem
> that performs JPEG compression in memory-to-memory fashion.  It is
> separate from the CAMSS ISP pipeline and has its own register space,
> interrupt, clocks, power domain, IOMMU streams, and interconnect paths.
>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,sm8250-jpeg-enc.yaml  | 154 ++++++++++++++++++
>  1 file changed, 154 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-j=
peg-enc.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc=
.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
> new file mode 100644
> index 000000000000..6aa2613bbf3b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
> @@ -0,0 +1,154 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,sm8250-jpeg-enc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm JPEG Encoder
> +
> +maintainers:
> +  - Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> +  - Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
> +
> +description:
> +  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm =
SoCs.
> +  The encoder is a standalone hardware IP within the camera subsystem th=
at
> +  performs JPEG compression in memory-to-memory fashion.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sm8250-jpeg-enc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 6
> +
> +  clock-names:
> +    items:
> +      - const: hf_axi
> +      - const: sf_axi
> +      - const: core_ahb
> +      - const: cpas_ahb
> +      - const: cnoc_axi
> +      - const: jpeg
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  interconnects:
> +    maxItems: 3
> +
> +  interconnect-names:
> +    items:
> +      - const: cpu-cfg
> +      - const: hf-mnoc
> +      - const: sf-mnoc
> +
> +  iommus:
> +    description:
> +      SMMU stream ID for the JPEG hardware. The stream ID 0x2040 is used
> +      for the JPEG core engine on SM8250.
> +    maxItems: 1
> +
> +  operating-points-v2: true
> +
> +  opp-table:
> +    type: object
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - power-domains
> +  - interconnects
> +  - interconnect-names
> +  - iommus
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,camcc-sm8250.h>
> +    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
> +    #include <dt-bindings/interconnect/qcom,icc.h>
> +    #include <dt-bindings/interconnect/qcom,sm8250.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    jpeg-encoder@ac53000 {
> +        compatible =3D "qcom,sm8250-jpeg-enc";
> +        reg =3D <0x0ac53000 0x1000>;
> +
> +        interrupts =3D <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
> +
> +        power-domains =3D <&camcc TITAN_TOP_GDSC>;
> +
> +        clocks =3D <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +                 <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +                 <&camcc CAM_CC_CORE_AHB_CLK>,
> +                 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +                 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +                 <&camcc CAM_CC_JPEG_CLK>;
> +        clock-names =3D "hf_axi",
> +                      "sf_axi",
> +                      "core_ahb",
> +                      "cpas_ahb",
> +                      "cnoc_axi",
> +                      "jpeg";
> +
> +        interconnects =3D <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_=
ONLY
> +                         &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIV=
E_ONLY>,
> +                        <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
> +                         &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
> +                        <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
> +                         &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;

Do you really need both SF and HF? HF is usually for the real-time
hardware macros (capture).
 (same questions for axi clocks).


> +        interconnect-names =3D "cpu-cfg",
> +                             "hf-mnoc",
> +                             "sf-mnoc";
> +
> +        iommus =3D <&apps_smmu 0x2040 0x400>;
> +
> +        operating-points-v2 =3D <&jpeg_opp_table>;
> +
> +        jpeg_opp_table: opp-table {
> +            compatible =3D "operating-points-v2";
> +
> +            opp-100000000 {
> +                opp-hz =3D /bits/ 64 <400000000>,
> +                         /bits/ 64 <100000000>;
> +                required-opps =3D <&rpmhpd_opp_min_svs>;
> +            };
> +
> +            opp-200000000 {
> +                opp-hz =3D /bits/ 64 <400000000>,
> +                         /bits/ 64 <200000000>;
> +                required-opps =3D <&rpmhpd_opp_low_svs>;
> +            };
> +
> +            opp-400000000 {
> +                opp-hz =3D /bits/ 64 <400000000>,
> +                         /bits/ 64 <400000000>;
> +                required-opps =3D <&rpmhpd_opp_svs>;
> +            };
> +
> +            opp-480000000 {
> +                opp-hz =3D /bits/ 64 <400000000>,
> +                         /bits/ 64 <480000000>;
> +                required-opps =3D <&rpmhpd_opp_svs_l1>;
> +            };
> +
> +            opp-600000000 {
> +                opp-hz =3D /bits/ 64 <400000000>,
> +                         /bits/ 64 <600000000>;
> +                required-opps =3D <&rpmhpd_opp_nom>;
> +            };
> +        };
> +    };
> --
> 2.34.1
>
