Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F483F12C7
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 15:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783526372; cv=pass; b=iGJor9iP8Atj1ErYHLYPAvkk0MnyZTaLei9A0po0BCaALDk6LpO2xK3nnXlN3qz51moHhKONliXuuBFjRMLeE67oNs+lqQFzzHmAHqgWIID+aUykdrJFnrdCo74DYsll9yQYoWSVqc9ha2rkR3MRfFrxR05eezY1E0tSOI58NvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783526372; c=relaxed/simple;
	bh=HIVEgcuKsvKP9oTptdmuFPNK/sIQQFxDjbmix66hFW8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GTeWuUempKr9CLG3tAQMB74wuj15eY+y4xUeGg1OepX7lW50QmMClYj3IJ8dD6XXri1oj8fbQJWUXDOoo/esozoJ3GMvVi6b4Hfmv6bbKsVP23vCkW65+tUiN521nO49yr4LNKqlgglqJ+w7hWCqK7PGyZ1AFwkA2iIT/DOVQuo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XyA045nB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NpWBtQ04; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XyA045nB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NpWBtQ04"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3TLF2667497
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 15:59:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k6RDR7xs+vqWJV5AWHV0iQasXN7uaTYZIuIDBIYGDn4=; b=XyA045nBOM5EH5Ke
	LNkFrfA9nQDJlcveGj2IHyeLt/bwfZVepg2Lvu1e8orRvbvsxiIi7z8zdI274WG1
	boey+aCihWfvPW4e5Nw6dcPx4Vj8dz8y3KDI3BfCIOP9AKlfSYhb48poQ21W5n6j
	gzaStDxvYVKkgOiRbEePjq89MlTbXpRjCEYHnTemwLl3whXN7lv60jJO3ClGjege
	h92FRnTFNsKKDVA9IbE/vq1trLW3UwOxTMH+GILaJxgi77uiIykYMQLx+zAiEJ5B
	tp8+/n+37p6V0FGEd4wpGQ5aC+xKz2KHp7F59PUEvOgGcn+nQivIx0OiMkAUKtu7
	8jOAOg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f99hgv2xc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 15:59:29 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ee593a5a2fso15590526d6.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 08:59:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783526369; cv=none;
        d=google.com; s=arc-20260327;
        b=OEgc035qRcN6vWm1kRwQM8Id0oujUf/PPGMbSYgE7pSbWLYxPFyCNy2DOE6+oIq0D/
         qjPE382C90KhFlfrxAybTI1hpRpVT0qmnm/Zk2to/qiwwwB54lc5p32hzBOlh2ZfjdqM
         PqKsrnqf3hCvRwSbzqPMs0FKQUTlbzs10oJUV3WGKTRoymO77MIDT+w3E3exkK+5QIs3
         dm7oPPcE2vTEInkEFs3jwpnUtXsek8K0WmwnjwRnluyaMoBGcb0UyxAoXRfVoKnj+pYf
         2Ysq+ZLadNzDzG71EymeB62ykFSviBCysZwLxcbBnGA7ckZJ/z7E0PqyWD8CNu5AC1qh
         cjcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k6RDR7xs+vqWJV5AWHV0iQasXN7uaTYZIuIDBIYGDn4=;
        fh=DfuKJmJH/40rAKA25goQyPOZyBk6O/Jgus+vReba9DU=;
        b=ZB/ViVTH6dJ6U1rmSr+hNyDuUHApWy/EYAoV9aOtwLf+kVGLhbTkWc9d+yVFEAe8n9
         2UBT+F2gBV0uYvhiPhThdImokBOEnySkaVHCkARXmzIoiQpS+XZ4QbYV9XiduH1tY4Dr
         8O/mw4bYkpZ8FeFYpzD3KYlWW+taBQBNA+v2egyvoSulIjmVMaJhePzlv+HcDd0zNrDH
         /K0wzCOW6XgTmhZU4s2ofLVVWCthmw+W4zMtMyEc7Xbue5oLE8Wh1WUv42y6nvWgnNLG
         tlJemrh4gDHg9GgiKbkWyEhPCnsQ3Jt/ZVCzf+BQr+Z5GXEJeTnH8wv3JwXAzSNMH3MO
         mCyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783526369; x=1784131169; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k6RDR7xs+vqWJV5AWHV0iQasXN7uaTYZIuIDBIYGDn4=;
        b=NpWBtQ04amdXupl7spST7zeTGHQ9nvmPtcMLhaoY06nvmjtOHE2uXbhUAUl/IMzLxl
         sfH9e4XagAgk/Fdn2vSpjjywHLC9RXbGCieh/qAjyNpPfKpAIv8+xkki/Sp9M4Ck9XyM
         H0Qn6vZOJ3wQHW95ohZH6gV5/FXC4So3bSKQddp8T0NHMHdEy2Xzds3UGLYgdukQQ5YO
         9Paf/8wtSDwmB77OGbqvf66TyYGIDT36V/btmClpavqR2naGKTrCP+rRKddxJmVuGcKd
         a5hUDM7GG4/UwmfSD/1Bw1KauFcmE376mhci7sKniDFA+GHzmOZ4NYxPHpTErXEjg6fu
         SXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783526369; x=1784131169;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k6RDR7xs+vqWJV5AWHV0iQasXN7uaTYZIuIDBIYGDn4=;
        b=lJ//xFveeVTrWjVaopvAWSyBy/ts/IK5a1JpFL4HkoBWtq8xiet8so7CvkEuXaMVr6
         3dnGc+yf2a11u2lD+SCvyukof2YgcrD1R0mvbm6bM7xxx/y++Ww3f+TYyggCNX6Xl0gH
         mSCdQ61B/hIcElOydGlZAlZA9bXVCoqpviPN4kFsNzi2Hqdtr7HzNphrYzuqYfU1eokV
         HIzJaB7cfl8dmJCP4OQUcU2zGsjCEM4ZTGONCo/GjLdqphunN2GCtciYGEfSST5jmZMF
         D1G37N2NAdmHSvVQCLN6eUsHyaJsWVbR1UfRRmrRZ8qGO+nUWR0ea9tWeJyzxRE9+6cN
         SgSg==
X-Forwarded-Encrypted: i=1; AHgh+RrsbSXbwJq6nkrfbRWRVhFMcwFKDhnAl6SCwzh6UVJzfMaD+IU9AhbAC6zlvfNvnM9+0JqloKFasy5X@vger.kernel.org
X-Gm-Message-State: AOJu0YzEe6JKICIAp86xyA4G8BGRspd9/PC4jSCgMApYKQJXiz++/ZsO
	HRWs9ZAPP0SkpVgaGWykOC9UAvsSFreK2LXMq7sFfGo6YBBOEeIgsdvTqzLoq/ADDCeGTYOEnQM
	C/BYoyuppGUqxdCcyUi2X59Ofq6ud4oMTM+JUTJ1tLWvaTShZdJMtFgOAVPYiLnodFbN3pN/raw
	Oqv55OuomlPF3fK848byjBBj1eIm5S4LNgf3ULpgA=
X-Gm-Gg: AfdE7cmQqIeyjkw5cYEdRYQlqEr3xvfoqpBnRynCl0ODEthY4QOUsbs8nCfPXwXt73V
	E1A6ZCKTWT4fr5fNb0nE2Cz4MK0MejK9fbP4uKIu3jLexw241Y0QCI7+CN5gQEAq0eK4LpnUrgB
	wWpWNzfeIxcDfGJ1UmfRIDz1vOGEbbF24AXylNX1iFrMb79G+ZQtOWXtToxr4G4JmApFU8
X-Received: by 2002:a05:6214:20eb:b0:8f6:9379:ecb with SMTP id 6a1803df08f44-8fd3b9b13b5mr81855036d6.26.1783526368978;
        Wed, 08 Jul 2026 08:59:28 -0700 (PDT)
X-Received: by 2002:a05:6214:20eb:b0:8f6:9379:ecb with SMTP id
 6a1803df08f44-8fd3b9b13b5mr81854656d6.26.1783526368570; Wed, 08 Jul 2026
 08:59:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609-pm_imx93-v1-0-d06c004b0f51@oss.nxp.com>
In-Reply-To: <20260609-pm_imx93-v1-0-d06c004b0f51@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 17:59:17 +0200
X-Gm-Features: AVVi8CeC7wqwD-02BFpq0hOApFiP2f8o6VkvQcjct29H4Ae_roSruiCfTUPVGNA
Message-ID: <CAPx+jO-BkzRPcuxkC4rCwGvXg8io_yD0Cx7zrwC6Sw6t5ff3SQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] pmdomain: imx93: Fix shared MIPI PHY resource management
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulfh@kernel.org>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 34SUaVGjfsQLm5k1an6gNfQejG113ceq
X-Authority-Analysis: v=2.4 cv=CviPtH4D c=1 sm=1 tr=0 ts=6a4e73e1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=8AirrxEcAAAA:8 a=v9JiyUteCMCEH8Pa4FgA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: 34SUaVGjfsQLm5k1an6gNfQejG113ceq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1NyBTYWx0ZWRfX4tSkr5LxxgXh
 ved+i7w6doQBLdfIEkXz1iOft/ScubBBMpj7HeI3dqYoDD0sg6cN1iQvXrtsjm02RuTzzd7odUo
 dCYvzip66oTUJa8U+MxylOQ/px5s/LA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1NyBTYWx0ZWRfX0KkXktfWVGxc
 2LA76wlgFog1P09/oLt2Rkfv5uKavDyiiVgH/OwLA1t71jGyglY7xDMPAb+e4VHn76sdhliQUgU
 RX8aTtCoHigeAT3Cx5gMnymybYTp1qr4R/eDXp/3CZ3aGbHcOzsozbM4JvvgxX76fXxF5rWebgB
 PRGKdkyJZghq8QNlCwNVoQirSoKkf4KSsXseAeJ2r/LhRtP46YV4pawOOYd1jGKcMyh8JaHmd2L
 t4HbWO1pqloObltwrGnc1XkTBXimOxy+TQVzS1kvUguZPs3tnU6HqbX8FYTEVjuIH8XeqRw2/Zf
 o5kmBLkdYewRc6S5JzItLS7KtPEXaPw6Qr3kVzGoUzyIdiQXRAx12dZRCnRBjX9MBXcPIM+HLfX
 gIf0ud3AWaO6UL/MYqUHF+BTFePvoNK+6CRI1gEoakP1h1zLmjaSwzW6hm8Nk0ylefLHjo4LpCr
 locWFl4VRHeFpj2cKFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080157

On Tue, Jun 9, 2026 at 8:24=E2=80=AFAM Guoniu Zhou <guoniu.zhou@oss.nxp.com=
> wrote:
>
> The i.MX93 MIPI DSI and CSI domains share control bits for clock and
> reset in the media block controller. This creates a resource conflict
> where one domain can inadvertently disable shared resources while the
> other domain is still active, leading to system instability.
>
> This series fixes the issue by introducing a dedicated MIPI PHY power
> domain that owns the shared clock and reset control bits. The DSI and
> CSI domains are then made subdomains of this PHY domain, ensuring proper
> reference counting and preventing premature resource shutdown.
>
> Tested on i.MX93 EVK with concurrent DSI and CSI operations.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

Both patches applied for fixes and by adding fixes/stable tag to
patch1 as well, thanks!

Kind regards
Uffe


> ---
> Guoniu Zhou (2):
>       dt-bindings: power: imx93: Add MIPI PHY power domain
>       pmdomain: imx93-blk-ctrl: Extract PHY as shared domain for DSI/CSI
>
>  drivers/pmdomain/imx/imx93-blk-ctrl.c       | 60 +++++++++++++++++++++++=
+++++-
>  include/dt-bindings/power/fsl,imx93-power.h |  1 +
>  2 files changed, 59 insertions(+), 2 deletions(-)
> ---
> base-commit: 3b7a18a34e8d3b14c7c926f033488a0350de9759
> change-id: 20260608-pm_imx93-6ccc1aa11932
>
> Best regards,
> --
> Guoniu Zhou <guoniu.zhou@oss.nxp.com>
>
