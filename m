Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBC03603EC
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779353893; cv=none; b=SWFbHCvB06ZO72yZ/FrzbwaHBWaU8C3NxnJn7hoh0gNxgnUfi06QLERi+IIciJkLRtFV1acm2N0U/jBprxnnFXG5+5QgRj2hWx4PTXv+dIn/sI/SUt0r3+2cqS/c5ufCRMjh7VdZNqLd04yvK4Puw0wpk8Eu6KnqaALDK3XOJvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779353893; c=relaxed/simple;
	bh=6XFUb3/twcNZ1CNboKAKsiYfNaaeTtaB26fJ9eMVTos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=smEQdhtaOL8uzFf0Mp4IOondmz/uG7jRO/+ifQ4A3y2GDJe7hJXvKcYSDMmboCwEv9PUQfFWC7rSxWp1hV2KL5E7RZDMC+z1qcPCoPkB0KJdzKkUeeHc4rSz+27KMvyWY06+dODARo3nnJSd2XlPkOV7dJPWUWpmIXeW2x/D3dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W0aSMIMG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GR40Xbpr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W0aSMIMG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GR40Xbpr"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L8sZ2t3816873
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q2ELpQpiGiJmyB1W7gZ91Qyf
	Imdf5eHSJna1tTboEro=; b=W0aSMIMGBzj/Q8Mkn2hZIP881oKHONBLx14IWXwU
	ds4xuRwwqaIAPzjMiMCL/UHunajKCHBV0IthvtZippoJkxnlWY8e7Rd7UdZAl+/W
	te+/iH3Ao8rNihNXTVtzAKi42pJoCkMg4Cnqp1g42qA/qUCTV69tbP6y0EqXUJUz
	PIFj337xHX8p7P8DAlIen58haO+e01eMWZl9twwE2a//C89OZsYwEXl9NDXrXuAy
	y9Ym/aJHk5A7STYHCsyxbGV/9OIJXTgfXCvB3SYq6UzBJt/iCyPAKIOkHgOA0Odm
	C281/CJLihMjzVWvh2jRBPrrlJi9D4wWXB8TWNsY8fhXMw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9saa1cgm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:58:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d9a6a853bso163685211cf.0
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 01:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779353891; x=1779958691; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q2ELpQpiGiJmyB1W7gZ91QyfImdf5eHSJna1tTboEro=;
        b=GR40Xbpr9zVHsL2hkznTbzHccry1Q8AjEYc++/vXjWsdkp9ZKhav0ZJ1FUVsI5Ynos
         vG31Hwo/stuu1kAItCQ4H40oHGE9tiQd6j/24CpOVXREHv/EbihR9Ij0GzJQLz71nLcR
         EMnoKTXz6RMmcvFxZeJeUAOcky7tMH6zE5E5M64Qt/YM3L9cZpM2b3OSVvp5EHQ6otzB
         omfALbtK+2EkLlPUiV7Dmcwb+tdmcNoORK63TBiXM/hc+S7qYQ3LsDsrozp8aVSvXuAh
         fbl/yW+X8vUkKDRz0A8kSE9Lls0rMBrV/c5/VGSuHMn6A+nVQtCyUf8fpZlBCwA0RvbZ
         qaIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779353891; x=1779958691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q2ELpQpiGiJmyB1W7gZ91QyfImdf5eHSJna1tTboEro=;
        b=lTl1M2cDc8VV1O7K1e23Gzz3XjSbdtvzlxTF8g4Ijgfm2JpfVcyofIkBPskp4vfrhX
         6tdV+jwdak8rTVvncCrXH4wE46aNcPdLYtExv06r4Ds6Z52VFpIph9jmJVi5I0rzgn6W
         66fU5/UxcsdklZZJ/0RpQ221MWte4rkieexdr/A/2RpymD38M/ddVeuCnMdIAq0bQ3Q2
         GpgLfe5ZlzmGPpIygr66BmIghZUBtv8MWljHLN7nhoLf0vFR17hTR104je6iFwjwaVfS
         MUpjFpiHdmZTA+HHHab1qmy1K8DK8WXsn5otATkKRRYmSkNIqdywLs7Xdi7uzE7aagQt
         mHpQ==
X-Forwarded-Encrypted: i=1; AFNElJ8z/Evwp8Ews8n5KojmGm1wU87mkHLiGPehLKrjV6C2cU7Z5OpcCHR+XF11gE1ZYaJFkWALDL942eeh@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw9DnPYxYUk/djCXbW1bRTnrhZkW6UaWv8oePYDw4TnrP/xeob
	vjyWYqYaxeOqffjpw7D4veSmp+3BvkCGFWXPdf6no7hSpBX0Fy8V+TjAmGea1q0ZSae3JY65+KD
	rLK0fCofjLY0cPqi4S7TJOBSA9lMTYBLzPwbMWYCx0Eay63gwcDlMf5MLmAAMbSjT
X-Gm-Gg: Acq92OHvE0GFeldCHdJ65ov6UBbdTGnY3qzPmJ4xp7/Rl1pElqlSHrHKPnKva4f8xJe
	tD07G6RbvJDx6TVp0BpDcutScSlogBHSB23ZNaRwf8yLMtK5ySphUvmu22JCwbiUXluDncB4Zhu
	mfbCvhYf6pBgcvcxtT3SaILo8Ro2uLtCSJXPNO/VM27NmcN3SqJvN+aTTFDcBCiJnpr+LLqNd1Z
	G22IolbQsjrVNWv54e6+4FmTtIzS58AveOzp6vhSZXORL8I4gM1NrYH74FCAGa+6V5AofRD3JoE
	UXmcpK41dZsMz+D5DB2wIjLGiFjrTzBGHGscTItZnO+SKIYM57M5U3v+IOO8qCX4cSivWnIvzV+
	8pWr85V8sE9FLNdV4BEOMjHDgsb6q9r8byI8=
X-Received: by 2002:ac8:5e0f:0:b0:50f:b3d2:6ee1 with SMTP id d75a77b69052e-516c555a206mr25643561cf.31.1779353890641;
        Thu, 21 May 2026 01:58:10 -0700 (PDT)
X-Received: by 2002:ac8:5e0f:0:b0:50f:b3d2:6ee1 with SMTP id d75a77b69052e-516c555a206mr25643271cf.31.1779353889971;
        Thu, 21 May 2026 01:58:09 -0700 (PDT)
Received: from oss.qualcomm.com ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa7da46esm1333971f8f.14.2026.05.21.01.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:58:09 -0700 (PDT)
Date: Thu, 21 May 2026 11:58:07 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: eliza: Fix debug UART and add
 more support
Message-ID: <c4lsfgomgq2fia7vigfftx264yqzqfypvc3rvsbqzj3o2727rz@pvf5cbmjjxih>
References: <20260515-eliza-dts-fix-debug-uart-and-more-support-v2-0-5ad3da81b9d3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-eliza-dts-fix-debug-uart-and-more-support-v2-0-5ad3da81b9d3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4NyBTYWx0ZWRfX2E8wLLzoLqGz
 E3aosmJFuzTp3ofyoMC4Gk71SAM00U2aqs8Avk9HEwFVzJif8R/cpJ5x72YMZ7CIfB5A7mbEiGn
 chZG9tiCSEwenk7ofYlwVlaYspFzYd7Dob2YZUJSDSkNhc9a3BCu5KtnKQTfucLAd3JRpDoZPQv
 W1v+XMUgmhNAEwT0NcylOH+PoKdk7ZxrssBtBORVHbWIeguPAF+FNaZN+dax56A4wVGKp3SB2TX
 5DKZsEq8PEQ5Bd3N8XI1gV2hWtzrptLX4dBo0AHwlEtUkloMG/PGYgDCi9DPu/zhAD8Gsfln58J
 mh8BYPaJSAaWh8CF0dEVj76eQa6PSolNcCDH1JISdKA7IA75z8D1Vd951KijYnoKpZrzMbXikCW
 vEqSdzG6zcyX4+Jaf2B/KFVARziKMR8msbw9ZPdpNMnq+E3JVAxfMP7kVxPHMOMTm2lTIWk1vl0
 8FyMKL9xjkYfKsdsdnA==
X-Authority-Analysis: v=2.4 cv=Qe9WeMbv c=1 sm=1 tr=0 ts=6a0ec923 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mi2VHuaznWBw4ReCaL0A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: o3RjbeX677MFebVAnsePIiSgsrvRx2dz
X-Proofpoint-GUID: o3RjbeX677MFebVAnsePIiSgsrvRx2dz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210087

On 26-05-15 16:22:37, Abel Vesa wrote:
> Fix the Eliza MTP debug UART index and then add the missing
> QUPv3 WRAP1/WRAP2 serial engines, the matching GPI DMA controllers,
> SDHCI controllers, their pinconf state and the LLCC system cache
> controller.
> 
> This series depends on the following Eliza binding updates:
> https://lore.kernel.org/all/20260513-eliza-llcc-v2-1-27381ae833d5@oss.qualcomm.com/
> https://lore.kernel.org/all/20260515-eliza-gpi-dma-v2-1-1255b43d5ca9@oss.qualcomm.com/
> https://lore.kernel.org/all/20260513-eliza-bindings-sdhci-v1-1-b2cae44163c1@oss.qualcomm.com/
> https://lore.kernel.org/all/20260318-eliza-bindings-qmp-phy-v1-1-96a0d529ad2d@oss.qualcomm.com/
> https://lore.kernel.org/all/20260504-eliza-bindings-phy-eusb2-v2-1-fa3a1fd65ab1@oss.qualcomm.com/
> https://lore.kernel.org/all/20260515-eliza-tlmm-group-qup1-se4-lanes-v2-1-ebb630de0dcf@oss.qualcomm.com/
> https://lore.kernel.org/all/20260504-eliza-bindings-aoss-v2-1-c3628ca79a25@oss.qualcomm.com/
> https://lore.kernel.org/all/20260504-eliza-bindings-pmic-glink-v2-1-d6b5397b7899@oss.qualcomm.com/
> 
> It also depends on the following patchset in order to build successfully:
> https://lore.kernel.org/all/20260515-eliza-tlmm-group-qup1-se4-lanes-v2-2-ebb630de0dcf@oss.qualcomm.com/

This is the wrong link. It actually depends on:
https://lore.kernel.org/all/20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-1-b1edf81bac3b@oss.qualcomm.com/

But it is already in -next.
