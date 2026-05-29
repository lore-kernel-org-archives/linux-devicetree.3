Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9A03DB333
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 12:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780056623; cv=pass; b=ldNG+3tG7dIzh+Sr6sDqHu8cdjKhNLVtZ32ecPitbKj77D1mO1AXfi65JkoiAhXUWMVPW7/EyLLbcBPPn32OtVY69kgNL7XvUQ2zkDoj1fKMvowa/Wx/k5S/5EoUzRA+DClZ1+Vtf+myUoBzo6CEDCizvugiJTkdYDTpbPOkaog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780056623; c=relaxed/simple;
	bh=4/YiZqa/JG1FUnGUrvFzA0RfBsImCiaHLKL6cwUuyk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jhudAId/fRGctOQDp0UAnC9p+341lkn+NAdhtr59wsFvzz7IJgGlS9YUrUkzu5HKd8QAIsC9VxR39Agia5iF2ShF4LpvBaoNIFBuVND57PrQPhSO64/XJZbfvAdyoOwgZAmroR9rZUKguE2lhUZM2Zpued0p2lDYgDUBHtRcpsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RRzFHM6c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gqEG4QsM; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RRzFHM6c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gqEG4QsM"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T7WSWs1495154
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 12:10:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+QilAcV8cP0/k4O+QEhYsVYC0asG/uWMj8eMgwQ+hcA=; b=RRzFHM6cekQZB+QT
	YsJaly3UU4j8wdtqTG00tu9CqE4XqQSMNOZno4518QluS/gdD5gHi9Or+KS6VZ5g
	l4pG1REEHirObLR1qUet6lJx+uEAS/W2JSvIPuaco0IT1rqoKWJ7MXornqkMeiTf
	2GjJf/uZcBOFpyNWzXOBAchsscEFzBSXhURutW4rfdA/7VFlFKt0IQvvPWhaSyQz
	Cv5kCIrSAhQKVhyz2TQGCinJBB65pk12mdH+e7Aiz07zoDymSrmgATpLY6BEDAgl
	s8RNlWD46DU1jsjjvyNO/IhGjcoXlUuqg2MYo9Dsfy6eg32QP1RJJLQuNh3yxJt1
	YWQQOg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef015ah84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 12:10:20 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8b49260e3d5so82748156d6.2
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 05:10:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780056619; cv=none;
        d=google.com; s=arc-20240605;
        b=S1XxYrFBlqHelKtTSlmAQ5VP69qFamIzxxhlg3uemhTrhnFEKlOasbtagVoBS6fU2i
         52YSBUXffr8MfOo8sdLXnu/FJcDwdaxSoYhPsTmBs5mRgbxUpJU41qtgQSdWmU7yoXYr
         ZPoSK76hLZcnUqnVYfh5BQhV9Bv+PLfjnGc+PQAi7y+HbcWRIA1nsMQpPgsmuT2wBiLi
         av3FCPUOgwHa8f6FkZy07eyq+DEGvO2P6LNQ9Uu3/RGukPhVMvzghvL8PrCJwt0QbFYU
         ZI12OmGjRk5on/mJOHLxN9z+y70exzTvulW1qaux6Ax005WU6h6TpFyXq9E8/Bdzlb64
         pE1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+QilAcV8cP0/k4O+QEhYsVYC0asG/uWMj8eMgwQ+hcA=;
        fh=dod6jHGOII3jjUYvxfNOMnHkQAelsbTXp7ImuOVFatQ=;
        b=GY0mo5g7AN0W/6Ff4UjvnYN6KyyencEF/2BXPW/02fYhIPFPhxH1gqQKSQKhCoj9Yn
         8MF0KMecZWqnuKnXemTOttVg13O2zMDE7gejMFXIIuA88JS2NUAu+l42nut/fY7PaWKc
         7XIXKoeaaYdvXRMlmlYoPpq7JaylWPdEUlp9a3OC6xL4G8pso3eAYnLJxWJrXMGT/+lj
         gIh+75hsQiO9662k52pslCq35a60sya6ecqihU0xO4Vyl3Om1/4SOiXBN+2wXMffum4F
         EeYHZjweSTQZ6OFFHhglYtPmJVzJcFX5z5+1yMwrR5HxeJ/YFr9Y6qes1RPWp4wWYTOd
         eFOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780056619; x=1780661419; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QilAcV8cP0/k4O+QEhYsVYC0asG/uWMj8eMgwQ+hcA=;
        b=gqEG4QsMid54c2AZuImkJYvkHuHSZZntWQwHHoITuMJqN17SLmm7DADeg3SfinVD2B
         50m8pve740UBSFNdW8MCJhyeNu2aXhFWKZ9YxQiac/yKfXSxMZDo999zrhC4trd+ly53
         ivGF9sd3tgeVCnLkBCqygRuCYtD4w0YiBS9iyki5mm5WVOZuubh9q9hzW6XFQjtiG0ur
         /PHPmdexuux8VgKq+l6kW3xIhLJ6ZFf8oRwX6xxVXPh+lmKtacusL1PTUl+tnY4uSp79
         KL5p9a4Wevc1bi4+uJZLwL5N5U4GW8u6Hgnys3+Vh1oDxkYLsiKPvMhYqK8XtFXwp5Oi
         EHyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780056619; x=1780661419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+QilAcV8cP0/k4O+QEhYsVYC0asG/uWMj8eMgwQ+hcA=;
        b=WoCcL8UYiJJKvDuPcKvMkdV4BAODxRBBXlBQSYrV25wejogFPjkf9x6FQ4d99t2pBQ
         qekQ4s/Fcj1HfF9iDyUcYC3eyreWXRq5rRv21FFm55c6Al/lCRBmU0eDz5GnlwQr9ETp
         SFm89SscxyYhv+N9hZ57UCfzE84C1CHCSqash5KMX1f710OVf+c5y+aZb6I+HTtEo8Fx
         Geg5fAJfYFhVwWXiTvIVIyoLiMfKSomggbAYpkZtOxP7DrTAlFFE6IYz3/zGDFfcAVCu
         cwOs1Zp6htFhP3G9Xt96PWQSghBHAHQiVfnCJOp+2sl3KqbvYBtdCx4xI/4xD57YrMpj
         yvxg==
X-Forwarded-Encrypted: i=1; AFNElJ852XPfh/GsIGBY42yRWj68WZvCKoJM7HV6NkzYKEKNEhBW/Wm4Qsl/sAhOX9WEObk8jZ4scx3WzMtE@vger.kernel.org
X-Gm-Message-State: AOJu0YzKD1iKuL0Z0YfhtfR85IfMYEN0J7qaMDrHVEcuORjEBxbx84nZ
	zMGIOyubERoAgs7Kw1x6a2ESW39ViLPlvvkv0TtzhtNkmqZ/ZPa2r5PZWpbvYx+9UuHAhFr5mfK
	q3Rcbo7s0dt1KSDHkM/ferGONNhe/QOs/WfIUkYe0yv7N/xz+44Kbs0iQ1rRQOyzK5IPh1KXxJc
	ltNJd7CkxaSeuJbcpmgAgGmCrmjGA6whuuoER81f4=
X-Gm-Gg: Acq92OE1Xq9bOda2yVu5dJ4N+sBKqQZ4fK1l3Rqy3xb8KRS/13Thj7ZN6L9QgHU7JsP
	VBn6lNmaW+2qw7uYn7KwE+YvJ77J50vHkBTccOqZKyIbj+0hdDUYoxrm1+4plD52j9VylIkv2jp
	pZd9D/5H1Q5cP9xtvTpXuyKgwBM78a80Ofs/X9ktVDkj2H2H0MKunU6nIH077oR14bgMAdolSE3
	NbM3t/FutRhduoH2g==
X-Received: by 2002:a05:6214:e88:b0:8b2:138d:32e8 with SMTP id 6a1803df08f44-8cce7fce689mr30733536d6.21.1780056619473;
        Fri, 29 May 2026 05:10:19 -0700 (PDT)
X-Received: by 2002:a05:6214:e88:b0:8b2:138d:32e8 with SMTP id
 6a1803df08f44-8cce7fce689mr30732946d6.21.1780056619051; Fri, 29 May 2026
 05:10:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508-st-mmc-v3-0-81c329ed28e8@gmail.com>
In-Reply-To: <20260508-st-mmc-v3-0-81c329ed28e8@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 29 May 2026 14:10:07 +0200
X-Gm-Features: AVHnY4LU162OOxc9tFfE3j5ZpvhE4LA4WVgEbnaL_F-Mscjocx7-8n74YjsKkeg
Message-ID: <CAPx+jO9woUB9VGUx+ebWD9oOhqCwzXL9=41MEesnWS15Nyr66g@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] dt-bindings: mmc: st,sdhci: convert
 STMicroelectronics SDHCI-ST MMC/SD Controller controller binding to YAML
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: wAZgGhHg9ELU5xne-YfZlaESleBZWHHi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDEyMSBTYWx0ZWRfX+adkZRMhV54j
 egNhrsO6mTSSEdHqimHjyIfLTgciI0XKpVpimsMI2OW3Ya1ebUv3hIV5foZuGwvzyXSTvan5ON+
 bRwf2oPdkfKmYV+AUNRFX63k9wyG/lyIT3Fn2+PFB+Gmo6CG+WXTv6OtEiv+qxXhDWQidClzt7V
 +pXdpyn6vBzUlLnPAZ+5MOK7nA1qvohR9/vZx8xMSH6oSOfU/2u7xNZZXSbd2fHWt+UZjmEw2c+
 Ai1qHANYvPDjcHfRPgQ3HFDjBBwqYx2/NXABVbjGfx6KKoOGRUVnuZzKuF9Mg4Z0aquLegIclTh
 4PLFwA9hsvSAFoP5ZjoeBjeC46ieR38czeWmP2oxZG1wUR8on8n4qrfoEDq3+h9td9Hw6Q5xUbt
 UncgXa1oTez83uMO9uB930x3ugImnWtxDM3CnqglitAmMXX1IgmWcIZA62VJ06+8VP8TaghGVFd
 qMCgGbSCPgwtoE5py2g==
X-Authority-Analysis: v=2.4 cv=DIG/JSNb c=1 sm=1 tr=0 ts=6a19822c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=bC-a23v3AAAA:8 a=pGLkceISAAAA:8
 a=xZACtGnEiovJ44qPjMEA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: wAZgGhHg9ELU5xne-YfZlaESleBZWHHi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1011 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290121

On Fri, May 8, 2026 at 7:23=E2=80=AFPM Charan Pedumuru
<charan.pedumuru@gmail.com> wrote:
>
> This patch series converts the legacy text-based Device Tree binding for
> STMicroelectronics SDHCI-ST MMC/SD controller to DT schema (YAML) format.
>
> Note:
> The patch "dt-bindings: mmc: st,sdhci: convert to DT schema"
> depends on the patch "arm: dts: st: align node patterns with established
> convention". If the DT schema patch is applied before the DTS
> cleanup patch, `dtbs_check` will fail due to the presence of the removed
> properties in the existing DTS.
>
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>

The series looks good to me, but awaiting and ack from some of the dt
maintainers before applying.

As the change in patch2 for arch/arm/boot/dts/st/stih407-family.dtsi
doesn't seem to cause any conflict from soc maintainer trees point of
view, I can pick this up too when applying.

Kind regards
Uffe


> ---
> Changes in v3:
> - st,sdhci: Edit description of reg property. Modify reg-names. Add
>   "minItems" for clocks and clock-names properties.
> - Modify the commit message to match with the updated changes.
> - Link to v2: https://patch.msgid.link/20260503-st-mmc-v2-0-11ae3216d2ce@=
gmail.com
>
> Changes in v2:
> - Fix node name in DTS for the MMC to match with the estableshed conventi=
on.
> - st,sdhci: drop unnecessary properties, modify "reg", "reg-names" and
>   "clock-names" properties, include an allOf with $ref to mmc-controller.
> - Link to v1: https://patch.msgid.link/20260409-st-mmc-v1-1-4c54321c3535@=
gmail.com
>
> ---
> Charan Pedumuru (2):
>       arm: dts: st: align node patterns with established convention
>       dt-bindings: mmc: st,sdhci: convert to DT schema
>
>  Documentation/devicetree/bindings/mmc/sdhci-st.txt | 110 ---------------=
------
>  .../devicetree/bindings/mmc/st,sdhci.yaml          |  91 +++++++++++++++=
++
>  arch/arm/boot/dts/st/stih407-family.dtsi           |   4 +-
>  3 files changed, 93 insertions(+), 112 deletions(-)
> ---
> base-commit: cf2cd8efd046c561191b8541d32a8bfe845bf06b
> change-id: 20260327-st-mmc-c906ad95ff83
>
> Best regards,
> --
> Charan Pedumuru <charan.pedumuru@gmail.com>
