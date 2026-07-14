Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378573112C1
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035530; cv=pass; b=ZQGIJK3YuU7FDm/qgpubQTp6IgIJb4xMr8bNI+uRiKBvIfiQRO1QY0gIQYxUVmJ3YpNCG+c2EB9+JqHTSk6e4tGutqRST7bLLQS5Z24XugFk9Gngb4nkT7aRgh4m4qKlydwHWf7tEBWCz7gNUJ8p9DndaKjmlZTd2Ikb2T9pF8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035530; c=relaxed/simple;
	bh=rLSggp2eUkqKcIaTvCONJutqZHOTM3brSlJWBuU6ap0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EDWjajkYG/2pYFydKFtIesgkqa8W1gNEq6UWFPz2d/yBL9v6RtveOpdFq9JqVHH4QYVsHyeX2bYdkHSjcu/nQRo2IFO2zekco600BIfmaWJhhlc9es3U6QTcKkuxYo7oTiO4ZMQt11PKh/FvWH9nFwegT3kV0J5TYhnTjXdxcoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AVdTzuh1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZT+wU6x5; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AVdTzuh1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZT+wU6x5"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBodHT263204
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:25:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VbTxOFxRmNPXWOgdzXkJ0cWq/pvxJY6EaAsakMhM4E0=; b=AVdTzuh1ViIoC+wp
	2YSaTJ2eh5i0sSinI9G6G1X+8RQ+EMEJbhFSv3E9vcOpr2I1idWb6q/2L+5jZdvL
	efOgii/XEEXLhDcQPV2JzXc+46CgevtIovPOc8EIktXSpwiHpTa0rEIYVVE1/0iF
	FgnpHiQl42+0R0x5WvaFluSJEANuFaBeV8rPjsKYmSsy7wsGL9rBjCaEXHD2KtQF
	/0rQ2aE0ZVd7hJPoZgnWmoMznNzejxMdKqCEZxZj42Uxbm5ABPsNtaoWDjeLgv5O
	EG/fQH01O3RoJZHlP84f9CLV1jFCdTYecp+CUyFVdYIgQinI65hm89f2WROma/nb
	bTw/qQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdmkk0dmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:25:28 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-904dac0f77fso60263216d6.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:25:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784035527; cv=none;
        d=google.com; s=arc-20260327;
        b=SvP3dWH1ASvNkmaQ6cnt9CPkgg4fZx+UkgL307iw4n1WEx8WumFk3t517Ya2lA+wBT
         2WxYVZrMI2LvQt2FGvLqW+O7RWfCqVW5VFIIVc7D1bR6FZFd+OnCOsF3S+G3e6ypsbmi
         uVj34iNN2x3unFVl2R3xdTVCp2PKFEAzwp0rnD+Jho4ZqGArJlSjOM1RvK6zkxlgn5IY
         3eSvSsRviyRlfo/N+tpVpDH95Qzz52Pqv7VBslU1GVG2yXoKnkI9W+N87RtAPTnVECyK
         rLVrg2BwbTCn9A215YlzdXkGnXEFIcr1hnV8t1pjzK19AL1JzfakpcdMXbCIpOiAeaUk
         IXxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VbTxOFxRmNPXWOgdzXkJ0cWq/pvxJY6EaAsakMhM4E0=;
        fh=WOhNZ+w6JGQ4BTadCyWmePbXpdTuytN3ZJQENFHZD7U=;
        b=e6iHqFr5sIFQej0IUA/rg4YVHTQkjTYvcW8PV7Goj9+NY4wq5cqjv3BJG2QawUE/M6
         dyuqjXRX4gMRBekFK20YaqskCDR3AxrQKmYQXfHcIrGUkPWe0zWUoZK9juSUH9Wx8JT+
         73uTNxXZSQwa0jqO40EcypEGx3XFFMEFMf2VVZW1ORMamCAann5pPgLCLP7HjjCihv9T
         TtOCJ9JF9Y2lIE9i8uhEKViQgyRdgVMiXryxXZdTmiMyqg/HYAq2LgRJ6u24/GX5yCm5
         qqTfNzdEq/uzNQuMKFROrgC+JwkmFsViPIYJnK/1jCaeWrcjIeOxOL0R37ZC+UFH0Dya
         VxdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784035527; x=1784640327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VbTxOFxRmNPXWOgdzXkJ0cWq/pvxJY6EaAsakMhM4E0=;
        b=ZT+wU6x5N//e0U24MuE3u7KN9OtuBvA1JJh9GdAun1xJkavYGKI4YH+pMjzhbFNZY4
         YdvZlcEufFX52AO3IXfKfI9yRhFc+jiPw+cryYjH2YttoxrHY/1yP2tiLjeDBTiwzFeX
         YRXlBPbO/h22JK9alawgFmoan6b11r/dX6PHCkKerz6eX+sWCC1pcHM+vZBJc3Cx3DYX
         riRCV4sqC8MrcktR/yADcG1gM1DrN/XZba/GXfiBBxWjaGpS1fYLeWzD4UjElUijCdGp
         8/fg+6cGLG2Xns3MmmjnE735UfJ2LNGdPodD4Zk9ga8YJGmmibofWeZ02zOvLlRfMn3v
         /0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784035527; x=1784640327;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VbTxOFxRmNPXWOgdzXkJ0cWq/pvxJY6EaAsakMhM4E0=;
        b=Cm9jqueRr8Bf4RyG9u7DzPadPr9BRzyn9yJ1lSdN2ZXHPVPlkpLGyBYUYCAyJBwXzd
         h2GjdNDEysuDeq8FaPJiZ9+aKoh9kGgjhMSzQegIibGExRIYmlsmbRdzdCsNSGzy3jFQ
         4/IxxUcMLnqqX5V4S8nzzuFx6w0zbFPBSHOyeuLIAliE4SYGVlik6nmFom8RRiZeUn2a
         +Mrq0xrIYfNKLSGighWaq4pSwY6UDVwkKKeF3R0ZxB0CBy9GdCmtyQpGvZFEr4ot8cC9
         H1yjqXsyEB31WuCEPZWS4REm9spMUyqxfipYpdaqBVWW4eiSiEIBfDfexXhWxMy3n3gU
         O29g==
X-Forwarded-Encrypted: i=1; AHgh+RqzIbjmqK8GQ3YpGvsGP0l0fm0cGb/HEDUXvovWt/o1X+jmqJCkuKkkCBO0S9ly/nPbhPasHgzvxEpp@vger.kernel.org
X-Gm-Message-State: AOJu0Yx84hMLXoLFL9JspptKVLGj/fEvJONtNGxHEkoC+zOw+8elXMfk
	eneb7X/hBLF2Q4NokEaXTdGPdtv+vrGlTDGtwZAwNNCreph7574qaDPV9c3iNrIUdv0thV9gnZ+
	RW2tEaRhUN6WyfhDc1WO4Acaf/1ayeED/q9ZoLvjlwOZOVCrRApLbrnWN1A7mqJz2upC7sWSwtH
	NosgCVrmy1BoC29dLFu2067KS+8gF/quVkO+MOYmc=
X-Gm-Gg: AfdE7ckEiUyGdsHlewCN3gVuvA5zOL+zXJUMmpxoJeh7WOZB5Z72lYB3NgO/UsBJ8/D
	Vfgxd1kYQsNBUNa90NpDCFuIpuwZVHA/wPndLOkmmxVpSukH59kA2fw+df/FBd81GDD2rCLFk6O
	M6rF2abt2OGa0cqZB4HU77lD5AoES07Vbe4NTAnQHgflt/kLzunJTjsozm+uwELbl38khz
X-Received: by 2002:a05:6214:568c:b0:8ff:6bbc:2a98 with SMTP id 6a1803df08f44-9074c8750c9mr24791706d6.46.1784035527462;
        Tue, 14 Jul 2026 06:25:27 -0700 (PDT)
X-Received: by 2002:a05:6214:568c:b0:8ff:6bbc:2a98 with SMTP id
 6a1803df08f44-9074c8750c9mr24790506d6.46.1784035526278; Tue, 14 Jul 2026
 06:25:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609-maili-rpmhpd-v1-1-c8f976377726@oss.qualcomm.com>
In-Reply-To: <20260609-maili-rpmhpd-v1-1-c8f976377726@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 15:25:14 +0200
X-Gm-Features: AUfX_mwsngLHPC3uNhTR1Jz46GGi6nXVr1OBeKflq1cTrdVsPhj8ExhimAtbCLA
Message-ID: <CAPx+jO9xy1MO3dygybG9Z6benAC83rah4XbL1QHDDEtgGFYYaQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: power: qcom,rpmpd: document RPMh power
 domain for Maili
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: rJdEceNVvatsPrHC-MEnFf_YGDb6zSrL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzOSBTYWx0ZWRfX/dJzvKl50Om4
 E1KPvkAyO9Wak+VtdsdsV4Q6tTDxTfRAQlLq7ngIbiKxbh1CG2Nbn3gkNwKABVUR9xc5b+K2sE2
 /LbaiNT8uFwrGGM5l5FlWFr1I5DKEFfCi/oPgKog4zlvLglIYVIUXbwRR20WJsFMgJRfqGiQG+C
 5vkddSXbHPYGA2Oyt8mNZrtdPw8K0gHv1wBWu6JQVAvmYwYbU2qLFknR7sixlVQxoPLLQm7PQdb
 viAyNeagGbJsZ+Zj7ibu95Yq4LUATx3Q3S9kZVoZmNRxJdQG5UtN1ypWClJ9Q6T+3d3FviZnwVW
 lM6LsqJlQhX2mysT/BZxm+Wz8gOpjBKLuV0FLO4g1+lOuj7npw8fGiaSIfb/Cqt1tgCZ4S+R45t
 5AXe7Ax9fnzb8EqivPwMCFZ/5mC23ZBTegC6ND19lAtOLxuzyrR9KgnI7Emaub+QsRyPjMjvHsy
 rrm8hHq0HfOqLB3jPKA==
X-Authority-Analysis: v=2.4 cv=NszhtcdJ c=1 sm=1 tr=0 ts=6a5638c8 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=cK4A6gYifi5ys9ctsdcA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: rJdEceNVvatsPrHC-MEnFf_YGDb6zSrL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzOSBTYWx0ZWRfX7fKQnhnNNhWZ
 9kLNOKPw6LEpqN4v6q40LrZVxXnDzTpYN4Fl54Eq/ZUnT/ipPJ9pNMasjpH7VQtmhR08KDNbNb2
 c/WAwGvDMepJ2Y6tQqdzAuetS/kAlNA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140139

On Wed, Jun 10, 2026 at 7:43=E2=80=AFAM Fenglin Wu <fenglin.wu@oss.qualcomm=
.com> wrote:
>
> Qualcomm Maili SoC has exactly the same RPMh power domains as Qualcomm
> Hawi SoC. Add "qcom,maili-rpmhpd" string as a compatible entry for
> "qcom,hawi-rpmhpd".
>
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Do=
cumentation/devicetree/bindings/power/qcom,rpmpd.yaml
> index 0bf1e13a9964..9f3c8cbe9d72 100644
> --- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> @@ -73,6 +73,10 @@ properties:
>            - enum:
>                - qcom,msm8937-rpmpd
>            - const: qcom,msm8917-rpmpd
> +      - items:
> +          - enum:
> +              - qcom,maili-rpmhpd
> +          - const: qcom,hawi-rpmhpd
>
>    '#power-domain-cells':
>      const: 1
>
> ---
> base-commit: 3b7a18a34e8d3b14c7c926f033488a0350de9759
> change-id: 20260605-maili-rpmhpd-2079035fc51b
>
> Best regards,
> --
> Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>
