Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794472901;
	b=PZSb6PG7qBO/UhMk+rgKFkmj3WGKdg7sJ+LhKIu8TrdZ8oqYnz1f1UmUM+gRhwhjziIo
	 rd4106iak7i1th+8AaGDKCfSaH6InVp6hD533G3kQ6JB1d7gvigWrwtfqI+ZGS9T4G3Jd
	 6nJt4ltqfnRMHExMOnuxe0sGdVuhW6ktYd3qrooAWKLM1uAzLOb+FEX8LTMN7sKWGhrK5
	 TI3DlBCaz54fCl84Z+jP68LjztyozoYN1VbH8YuqiN82h8tWc99xA3AtqAD/QJVrzZ6zm
	 +1rZkBAGdTQhwiVmzreyr2fk/NoSgVMny3IjYkggQvIqirPs4zYR0y3s3x9fk3MMTaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472901;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/MOVCx9PdrviQB3rgdWVaSwH94I9OOZbBeSGMzFF5Ik=;
	b=eqv/WwO2oF24qB9Av9sAAVm/zpvhL9DsjEgxuxH115xkQ9ptA1epJYmaINtVrZoqDRhj
	 UY+mzs+vlWhwJS+uaxJhXRX+j2EdzneyjUfZdEjpDYuCcyJZkT/RRbBSB0KWRmlpdShWV
	 RYB+rtpxnj1CqihVM5aD2bELrPQUVhHbAyQhXg6GS76/P+XDxa4omFwSddCJFSiCFxXH3
	 c9qFjIRI3F1i89d9gTXYjNrQd5Ih8057nAQoeXho6gRIVSyiiYpri/ZY1f+4UBitme4kq
	 89DkVkcUqICIFFH+EPYaRJ2r4RgrEtOf5c4B3CAi3AWCoOkOjC/Wh7Fkvslj1ktVvUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z1EyHatP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QSbfauUd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A912B606A89E
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A912B606A89E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z1EyHatP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QSbfauUd
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC53joc3476753
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:41:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/MOVCx9PdrviQB3rgdWVaSwH94I9OOZbBeSGMzFF5Ik=; b=Z1EyHatPMaX6ot4M
	5BaelCJrRQBd+u2LVmN2dGGoww9GhSfxC4pxfVKHyIPiGpGwcf56oTe0MoOYljFd
	9wjeyMWjJl5zFsS3liVBRb88lub0WzOQO9pJ6IeQudSufKu+s2GkLStWKWG47JPx
	nxwW6BBEhyBWjQmURWa6VZLhM+9N+JHTP6RJhMinRXLST8AkykzcqyqtNsOrbWgn
	3TYJCMob73hywpYSs8OxcR6c3J3YaaKvnsMWhwb6pqocPZltWtz1/L9JQzup69S3
	rz3HqftfJ96lyRFyt4QE0C4aSmFJAwip11ItdLAT1yADCQwzhmP7aJkeUfkwCOsj
	hkHJyw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6yugqyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:41:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f568dee56so632230485a.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 00:41:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794472899; cv=none;
        d=google.com; s=arc-20260327;
        b=XfN11LfDwRWeHxKN8dMK7ry6/0AQ2G58FNEeqLU0yrCZ/XLMCYxlGDvRiksafzcUnb
         YbqeI8IEtRWWP4nmEFgZ5Q3HP6+B2meWjiiVNpc17ti9DWnwLQljpoA3EEuVg/kTo6iy
         D2V9ZhuRfi+JZ0BgA0v6qKNz24/ISo/Rzebc91bJ9XZjAxFBW4QsirQhWyBWpfn4+4rZ
         E+aJnIX0sFrjrhbIwGHTfd2UL53Ok2p+yyxmeQPUj+/SRgK6IWTqH6ZbECyUPeO+TOwa
         nY4+4+5YOD19Xa/rth+CE10Q545P+l8wXpfI5CmXSEL66xl43FpDliYxbcpv9U7Pfurd
         XQaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/MOVCx9PdrviQB3rgdWVaSwH94I9OOZbBeSGMzFF5Ik=;
        fh=ap+wphHlx3mtQvzAQrGrujD8k8+1gRYBX4G949Kvjn4=;
        b=X0CdIdk2MTSB3FDZe93DR2jXCzz5Y5RVD3woMIr4ptQQQvcAhRD6tSKwR0W7TSei5S
         R4Tq4Tp95rlyu4+3SE9axOukGv2+5qNEhU5SyL3b447keHEJmAt+G0p+BfSidlmX2i5k
         AiMDDgRa6Mh1xE+1XJw9mv5rAUm06/+yVgpLFMEUMt52j2/3j2FGR1lH7cKrbk2k2c+e
         +4g0p7fnH4HV1u3Xsa/xgngF0BnKa3X0g+YJumS2A9yIjHqLqUNZ08S9ofX6InU5a1Ew
         r4aKk41ZaLSldwq5FG29F3MPBbZ7fSJYn775h/pP1Xj8iVAac3qxDCXPQMEfHGnI+nVJ
         o32w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472899; x=1795077699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/MOVCx9PdrviQB3rgdWVaSwH94I9OOZbBeSGMzFF5Ik=;
        b=QSbfauUdtCbpBF2jI65s5xT7yk1VP9ijV/S86M6erAL2zONUDbkXm4+GtE+PhvCKwA
         IukOFMcWT2PyA3TRr6LJ3WRBqp2frNL1gfO7PHGNHRvjjtV6EVnus5qMdhGZtcYb9jzT
         udorb6Zihc7Q6sQRYJyMy7uu2eIO2Wa02l4kUgQeg45MN3GsS/TEZT8LHAcQstQaXq30
         vJ0f+zorzW2TwRncZVrFE8jZEbY7bkDJWgM8yfaiUjQjNJU/JNRlFD/3OLyGFCsmN3/v
         8tqvzD2IxPcr+onC3ZCwFA5WioPe1hcWy9FeeYsYqhaSzOnI35HYEtxYXXUVKZuWqXI0
         4Aag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472899; x=1795077699;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/MOVCx9PdrviQB3rgdWVaSwH94I9OOZbBeSGMzFF5Ik=;
        b=BjHGl9aEi85eC2als/VMhzLurJPzZ3imKxdcb/UkbXNF/SHCYKlEpozRYaft3cWPHE
         nPIJIKw9vCwaALV8YOG2eO+Ri2Qw98IheGwMR1VkrqSYSq99TmUoPublqv1Ph5An6gEy
         GU/FA/Mj69WVbV5GIDoAIpF1kHMSffdETmAkaPiHVv+2Yw6HBooG/45Fpv+p1/YImY5w
         iH8bmh/4a30ZRRB/reNxwrb0YbwN9dxZVTxvR+UfrPf5vIzlOY/zo+9p3gSixQoWUHIm
         8RpcIOv6qfU+pqGKehOWgOuc4gtkaIeQ5SM6+BuJHLXtF/JLcDJgKsRGSeiL1S+e8V4Y
         xXJA==
X-Forwarded-Encrypted: i=1; AL+hErF5gHS29iSKOeVnRWct5cP60PxrSxv8Zqyp/pDtcgFcIa3EtyAsip/j/EVXKEgMMF07hWeQstnQ3Tip@vger.kernel.org
X-Gm-Message-State: APuU4Z8a1Qnf0pSQxzSkhz/82i6lybU8w9sc5BGMUr46+Wkhs2ZmUfPG
	WC7KrD7jr8Y6EIOnxuEGP08b6Fr19JZVV4IkoTIDR6R32s+mZlh1+mnNVhG39Ir/HY+JPTOFai/
	Y4J/U0Z+uSp4oE91eB+JLVoqWthfFldh4xCVzvW1ABUzlKoLKkzOp4IEuS3mTRREgPeUAd5XM7X
	dJzbeetJ3urzqY8wbfrWOg6hr8CAzEnONSUHyIo7c=
X-Gm-Gg: AYBFou3kWCVifoqu02IbgONMKLwpIv1Iu40xuCCqyRq+23E0JJa6k0Y4W0HrWDJi0+t
	RWmcHBuqDW0mEboiVee2n1hqC7RY5VAoU0DT2pwWp+ShajR/h1KkOS4+AHNGg3x8rS4UskFBBxM
	JAWd1/MwA+CXDgp/WV5Trndp8nNDkm5moTNHrWvc2hqQnQO/YZQnQZVoDNhboXyYwYcIz8X0XwC
	lD1iy0vWulQGTDbVVCKGwTnHsklX14NrUTTQCYQ00/uY0ucU9Dgrblu+rrWKhLw5FtKQi98mCY=
X-Received: by 2002:a05:620a:29c9:b0:93e:7dfa:2f3f with SMTP id af79cd13be357-947b00201a2mr849200185a.62.1794472898742;
        Thu, 12 Nov 2026 00:41:38 -0800 (PST)
X-Received: by 2002:a05:620a:29c9:b0:93e:7dfa:2f3f with SMTP id
 af79cd13be357-947b00201a2mr849197285a.62.1794472898061; Thu, 12 Nov 2026
 00:41:38 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com> <20261110163909.78085-2-atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20261110163909.78085-2-atanas.filipov@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 09:41:27 +0100
X-Gm-Features: AclHuK_y_fjpiV6obT_WtVqv7QGfmoWmqqnBvzPuhgwLPzV3bZAbPmW-Fiags_M
Message-ID: <CAFEp6-1dryYHtVme6M7opGHUen3vC+DyLJM8J1WKqVp6zwMWWQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/8] dt-bindings: media: qcom: Add JPEG encoder binding
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: nQCMpUUt6gs2yrEaV3CSuUsGRTE1ANIz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNCBTYWx0ZWRfXw3U7wdt0asF+
 Aoy1X0NCGS2VKJlohcT6Uu7bkxSLyPd9besTMKpK9xCdND0H1Qqa4mDdXOglO526LXKIevDghs8
 QPCAuuoYHngU9CqGCaO9xNGl9Muzrcc=
X-Proofpoint-ORIG-GUID: nQCMpUUt6gs2yrEaV3CSuUsGRTE1ANIz
X-Authority-Analysis: v=2.4 cv=d49gWhjE c=1 sm=1 tr=0 ts=6af57bc3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=C43g6bSQiVhdG0YezvUA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNCBTYWx0ZWRfX6MDjYRsrBe12
 m46n4swpkSAxkcNNbL9SZo0gCPgZL+mVCPZYJAXOWRO8tSHB5lGOgcqgja1b9XFJS6RFyIYnpia
 u2M+uTyzP/tHwE/yoFk5NHZCghlK/LV7UCqLNAxmtI2vJWqyAq7Naq2pHCBo0tqMmNiaWf8ipfZ
 fnXAR1Kg69FN7dV3yMxKQ2y4vKOhXFWYozyPPgMXgZdBPeACSaccDGYaQ3Ec8n/nRbTxxHZl0zK
 MW0UcPmjy/RfBFiqmsPsO1MqL34MtviTIQpSu8VhpUnvdrb69XMLnRw4XEMLrsVXPvFcKSn3lHL
 CpwiXOvr4cdQKzw2mYGnpd4xyfZqHXAzJSsqBcz5YEp4mpqL7NcLjnOJWXtqnREFAyrXwJzuE+u
 Y1v3PEA7uNJebjwNLAAacm7505mZ0bGlhYm8vNIzxTbu2SNFIc624MFmzf6zCOsIULOIMiCxCZs
 RBXETFC0l7K/xv1XlVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120034

Hi Atanas,

On Tue, Nov 10, 2026 at 6:16=E2=80=AFPM Atanas Filipov
<atanas.filipov@oss.qualcomm.com> wrote:
>
> Add device-tree binding for the Qualcomm JPEG encoder hardware block
> present in SM8250 (Kona) and SC7280 (Kodiak) SoCs.
>
> The JPEG encoder is a standalone hardware IP within the camera subsystem
> that performs JPEG compression in memory-to-memory fashion.  It is
> separate from the CAMSS ISP pipeline and has its own register space,
> interrupt, clocks, power domains, IOMMU stream, and interconnect path.
>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,sm8250-jpeg-enc.yaml  | 190 ++++++++++++++++++
>  1 file changed, 190 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-j=
peg-enc.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc=
.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
> new file mode 100644
> index 0000000000000..112580f3df10b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
> @@ -0,0 +1,190 @@
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
> +      - qcom,sc7280-jpeg-enc
> +      - qcom,sm8250-jpeg-enc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 5
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: bus
> +      - const: config
> +      - const: cpas
> +      - const: camnoc_axi
> +
> +  power-domains:
> +    minItems: 2
> +    maxItems: 3
> +
> +  power-domain-names:
> +    minItems: 2
> +    maxItems: 3
> +
> +  interconnects:
> +    maxItems: 1
> +
> +  interconnect-names:
> +    items:
> +      - const: camnoc
> +
> +  iommus:
> +    description:
> +      SMMU stream ID for the JPEG hardware.
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
> +  - power-domain-names
> +  - interconnects
> +  - interconnect-names
> +  - iommus
> +  - operating-points-v2
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,sc7280-jpeg-enc
> +    then:
> +      properties:
> +        power-domains:
> +          items:
> +            - description: Titan top GDSC
> +            - description: CX power domain
> +        power-domain-names:
> +          items:
> +            - const: titan_top
> +            - const: cx
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,sm8250-jpeg-enc
> +    then:
> +      properties:
> +        power-domains:
> +          items:
> +            - description: Titan top GDSC
> +            - description: MX power domain
> +            - description: MMCX power domain
> +        power-domain-names:
> +          items:
> +            - const: titan_top
> +            - const: mx
> +            - const: mmcx
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,camcc-sm8250.h>
> +    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
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
> +        power-domains =3D <&camcc TITAN_TOP_GDSC>,
> +                        <&rpmhpd RPMHPD_MX>,
> +                        <&rpmhpd RPMHPD_MMCX>;
> +        power-domain-names =3D "titan_top", "mx", "mmcx";
> +
> +        clocks =3D <&camcc CAM_CC_JPEG_CLK>,
> +                 <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +                 <&camcc CAM_CC_CORE_AHB_CLK>,
> +                 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +                 <&camcc CAM_CC_CAMNOC_AXI_CLK>;
> +        clock-names =3D "core",
> +                      "bus",
> +                      "config",
> +                      "cpas",
> +                      "camnoc_axi";

I find the clock names a bit inconsistent. For example, camnoc_axi
explicitly refers to an AXI clock, whereas bus is much more generic
and does not follow the same naming convention.

I don't have a strong preference, but perhaps 'bus' could be renamed
to 'data' or 'nrt_data' (SF path is associated with non-real-time
resources).

Similarly, for camnoc_axi, maybe something like 'camnoc' or 'camnoc_data'.

> +
> +        interconnects =3D <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_E=
BI_CH0 0>;
> +        interconnect-names =3D "camnoc";
> +
> +        iommus =3D <&apps_smmu 0x2040 0x400>;
> +
> +        operating-points-v2 =3D <&jpeg_opp_table>;
> +
> +        jpeg_opp_table: opp-table {
> +            compatible =3D "operating-points-v2";
> +
> +            opp-100000000 {
> +                opp-hz =3D /bits/ 64 <100000000>;
> +                opp-peak-kBps =3D <262560>;
> +                required-opps =3D <&rpmhpd_opp_svs_l1>,
> +                                <&rpmhpd_opp_low_svs>;
> +            };
> +
> +            opp-200000000 {
> +                opp-hz =3D /bits/ 64 <200000000>;
> +                opp-peak-kBps =3D <524760>;
> +                required-opps =3D <&rpmhpd_opp_svs_l1>,
> +                                <&rpmhpd_opp_svs>;
> +            };
> +
> +            opp-400000000 {
> +                opp-hz =3D /bits/ 64 <400000000>;
> +                opp-peak-kBps =3D <978600>;
> +                required-opps =3D <&rpmhpd_opp_svs_l1>,
> +                                <&rpmhpd_opp_svs_l1>;
> +            };
> +
> +            opp-480000000 {
> +                opp-hz =3D /bits/ 64 <480000000>;
> +                opp-peak-kBps =3D <1095600>;
> +                required-opps =3D <&rpmhpd_opp_svs_l1>,
> +                                <&rpmhpd_opp_nom>;
> +            };
> +
> +            opp-600000000 {
> +                opp-hz =3D /bits/ 64 <600000000>;
> +                opp-peak-kBps =3D <1095600>;
> +                required-opps =3D <&rpmhpd_opp_svs_l1>,
> +                                <&rpmhpd_opp_turbo>;
> +            };
> +        };
> +    };
> --
> 2.34.1
>
>
