Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521385;
	b=YmNxBBBNh5XMFMW4+TJmQv1oXJyRNRXmEgdxtIIWrfkbYA3dKHGiwKLdSd4p9diR/qEw
	 8eGeu7jDcxJ09pB52CLyzTrwDW0T/v8QZmKzuo69QSjOYESEWe+ir5tI9pvgPWH04d9ow
	 wRFbn8Y7adjeJ6DYy9aY/0mpXUElvr3M57CfCICqQd3rKJQsAN32V7M4/vIT7YPuBJKvS
	 Qx4uCfFdOEvNRoNMMPLaju42cIwWHfU7kUhTbz5lGt/I7UN6oW0h+3ypWgDhFlP9Jl6bl
	 mOFKYGXhw2PkU5QX+huXEzr7qcVx2TIMM1j8zIwshu/dM39yXq3ZX/gg1G4NehqGxMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521385;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qiJdwOJzBM6Kd1w598aMZRytqMeSnmHW/XmVJ2AjRfc=;
	b=rD5858u2SSUJKv/5vXwyem9hahrelz8vNrDZM8CfP0vrsBih5YzRk3wFTUAWPhXWq5XP
	 8bBIc6g4a0eqFT9DOTo8ADFqAc41gbj96cSLboFEYtuyuc1JYgCkAxXPFjOiJJuX/8Ak6
	 ZD+pirzG7vNV38tsqNXg+NCICHSuC1fc3VGLGNTHBwZ78Gki61PSYa906KIsQtM/xfp0V
	 AhhFuk2Cx2Hag9ysnUxD3WXX6NCVK5xXolZkjW8VJYE/gh0XA0RxhceVT8uHo5snLd7Kw
	 376WJNo07rtCn1I+Z+zM1wbUEZsFnEt+P5O2KqPkPronia0FgE4e9374ht2Xoz89aXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Nxx//tJE";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jHUiewJC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61ECD606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 11:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61ECD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nxx//tJE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jHUiewJC
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAw35K2683196
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 11:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qiJdwOJzBM6Kd1w598aMZRyt
	qMeSnmHW/XmVJ2AjRfc=; b=Nxx//tJEuRhKaWvnXEsr7ScrUeXod/e92f006Vut
	R2NVMCBIkodXOR2yMuJEPkDFPq2TLnLhFqon+sCO+BQR6PwCPXSbZcWL0b1ANd1d
	J7EkB7at4972z4M8cdKaU6D0Ci5hxBgvVWKcIjEQR2Bt39P8xZUX08SvNdDn/ItF
	r1frv/UOGmmi/J0MNVn7xt/4/ccr3KWbpC+tlnDl8lZn3Y4CDNI13QAjiSXvr34B
	aMDLTcSOJ2OCx54rV/QWSWs3OionBPeT4ihyCddbXKzwNklyLjVUU1wulBePn0oG
	w9KRhA/TWy1Q86pRRZrlnL+rV4hi9rkkJsNrZf/8+7u47w==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqkfx9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 11:56:24 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1383723dfddso4637532c88.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 03:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795521383; x=1796126183; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qiJdwOJzBM6Kd1w598aMZRytqMeSnmHW/XmVJ2AjRfc=;
        b=jHUiewJCLezAMwgz7kRicDKbISqfg1rtZzbj5O7WfMq5pgUtVyzgBIAQd7G4ZZtYe/
         HTdPxnzujwqjNsOr4gh5/SfnoGbKqe9cewmCjHvcVr0P3YNH1NUVDwIEbLwp+u+8TTSM
         Ch5Rhy+Ctr3UqiTRc60JbLozMrUkG47GdsChTBHKuuGj+WmArJK51cQQoznVxRRuX/eR
         +TQp5qRERlQSKxcUCG5VKRPMcDI7MIgtwz441wpiyJBQJ/BTCSTinLRFjyynLVZkaTqJ
         sdHbizXcAnfPaIPGSPVaj47iNPq58HBB5TesJov50OxZe30hbJDBAABLfYb0db7e3+ks
         GgNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795521383; x=1796126183;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qiJdwOJzBM6Kd1w598aMZRytqMeSnmHW/XmVJ2AjRfc=;
        b=yi+v41zP+IN9hDdxv5NOSErcuN7VlPr+kohOhnB8skkf1nHpC2GC55cc2VdS2jKVve
         ywHWUx7IVS3FKTB7oYqRtjPxfyNVCceHeOpl9Po/F44mf36k/DjtjvfrdjYuIKyyJ6GU
         UtRScS3MROqP7qw08ssFsXj+RvP/SISN5XldFnhY9s1gEUdboncvRxySpvEbssl6xHC2
         80YMhFkkiotnwiXfCluputD01sdDV+BWsXIFk3rYEkUSzWe/bwGl6ykODRHvQE7wOi6A
         I1z2M/10wGqcPo7WfdI9J40bh4UBJOu8RzINvQFMGaRq/NZknU8VA+bO5GSAGlcsBTtn
         YTDg==
X-Forwarded-Encrypted: i=1; AL+hErH/jsddAzkr+YIPPOcwq0Fde6liaJaHLLADChP5/AvVl3fpmEtMeJSphwrOz8axgqSp02TZU4iCRkO8@vger.kernel.org
X-Gm-Message-State: APuU4Z9FoXfUBxwViMDx5lMi8tVCeQZkHC97HU43fI7lQoxfJxF53bOV
	igOuliW/W5qjugb2mkFn/H+CsFi4m6pV9GBFkvgET8Y/eqe+avXJLpCTIv/pxeu9vtbyNyWgOCv
	lKlBIP8fy4D38FiNydkClAWyYV0CXKCAEs361UX/wmPmikZhTHhhXHw1Gp7A04SkT
X-Gm-Gg: AZFdTZeKH6PYUGXMPVxzqXJ3MKFNBRd/AXDx7HgWxkLY05Fd/aujkZzfBtyIKPJsG0j
	rTNq8Bdwl5yZfcSvHRv0DWw7gH5yc4tANoiJpPcPAYD1unQRFizZCxzdxkX6KvO0vY2dVRCTBCL
	rZUI/AG5z4Qx0afDhb87ylsB01HRunbDrBJsBptEkZm/nZv2bVKaSYyuca/0JrSaOIeOH8n8jaX
	3oHQUS0a7R3ntgn3e5wY/NwL3iaRNz/zCqZw+CLzs6wavE4COcKno8WuSx0kxOO/XRJipHsCF4U
	tFLXrS39Wvw89HhE0NJaYG7g2XsN+hYvoOt0/l0oZ/7GoNx8jitOk+oXfhuIcmbZNTygmaxckML
	LFA1P1wPY2uhnb0opOf9zHmPf4nqXz5dUOelhZvlgB3NDeMyfVqzF5eLiF5n6sUZmShsNTEKllA
	iW
X-Received: by 2002:a05:701b:4591:10b0:143:297c:276c with SMTP id a92af1059eb24-1b55691aac2mr12967270c88.33.1795521382731;
        Tue, 24 Nov 2026 03:56:22 -0800 (PST)
X-Received: by 2002:a05:701b:4591:10b0:143:297c:276c with SMTP id a92af1059eb24-1b55691aac2mr12967252c88.33.1795521382015;
        Tue, 24 Nov 2026 03:56:22 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm35145257c88.10.2026.11.24.03.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 03:56:21 -0800 (PST)
Date: Tue, 24 Nov 2026 17:26:14 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Yadu M G <yadu.mg@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] pinctrl: qcom: Add Seca TLMM support
Message-ID: <20261124115614.cqzo6ilr2shmzrxa@hu-mojha-hyd.qualcomm.com>
References: <cover.1795517583.git.yadu.mg@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1795517583.git.yadu.mg@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b057b68 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=6J28aJzw-_SWfeiIoy8A:9 a=CjuIK1q_8ugA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0NiBTYWx0ZWRfX+e64hJEZs9Nv
 Y/Nf6wdNft0gN+J/pZOPfguSh6zm1rAsMaigMXNO9MWjAUe6QK5PY4Zl+CCcI/y3K7enKygo5gE
 jhFXbXxc9XcntD6iZff0ErFWxc7DW2zdU3N0woiG2kQjD78dEj6h6onLcQWj3SOkUsvDt/2d8fX
 BO30q/p7VvjeL7ImaenBVQbNKT6hQNdLchd2mV9VgvMVS3aX8JiQFrOFCCrZX/zTQUDmkVl/53o
 jTfhfQTZHzT1kgQPAaVfLTD2PajUxDB3jXIuqxf+GgyBxplFUXYxCNHCyRi4j+T3kOpS9QI/Nh3
 PCrcy7BJhcV6NGj8zlgL+4WFug4YU7CqcVV3URJVE1kLza4dwgln3xawfu6WgqBZVgfKfztdQdt
 RjHJcdtTDLplhTdZLGlxHIdfMAZb8ZkZmHGM082w3NocibdRlzhzqacWhySzpqPtkZGjvvrYHMs
 tyux8yHcUn+arj0fy6A==
X-Proofpoint-GUID: Sua7batXphix7mRPb1Nn6aopHTyYT_Ky
X-Proofpoint-ORIG-GUID: Sua7batXphix7mRPb1Nn6aopHTyYT_Ky
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0NiBTYWx0ZWRfX5zxntl6G+anh
 wAXyTdshQnGWokU8gy8hl2tyuFSvw7Rv0j0/QxoJN5/bU0idY9L8wj1FnVo8NTo4u9kpj84EL2x
 E1X95l+qNjodHQeS4lVqdAIiBfl+T44=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240046

On Tue, Nov 24, 2026 at 04:23:01PM +0530, Yadu M G wrote:
> Add the TLMM pin controller binding and driver for the Qualcomm Seca
> automotive SoC.

Where is the introduction of Seca ? what is  Seca..?

> 
> This series was prepared with help from an AI coding assistant
> (Claude). It assisted with review on the device tree, bindings and
> driver (formatting and alignment fixes), rewording commit messages,
> and running the validation steps (checkpatch, dt_binding_check,
> dtbs_check and W=1 builds). All changes were reviewed and tested on the
> Seca Ride board.
> 
> Yadu M G (2):
>   dt-bindings: pinctrl: qcom: Add Seca TLMM bindings
>   pinctrl: qcom: Add seca pinctrl driver
> 
>  .../bindings/pinctrl/qcom,seca-tlmm.yaml      |  135 ++
>  drivers/pinctrl/qcom/Kconfig.msm              |   11 +
>  drivers/pinctrl/qcom/Makefile                 |    1 +
>  drivers/pinctrl/qcom/pinctrl-seca.c           | 1705 +++++++++++++++++
>  4 files changed, 1852 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,seca-tlmm.yaml
>  create mode 100644 drivers/pinctrl/qcom/pinctrl-seca.c
> 
> 
> base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
> -- 
> 2.43.0
> 

-- 
-Mukesh Ojha
