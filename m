Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D15434676F
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 16:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784307031; cv=none; b=o5FSQwbDwTabuRP7nFejlnttZhxUGL1LYUVuhafyXP5d2XCmc7byQebKvFif1oJxDWtJSyuNdfFkP8Z1en7IEuVNC7gSaCDrdLjMkxVWXfmcAjrkKoYz00zjU3TXO+UldtaI2e2ywf2bKo3RtVtfUgMvODwE9QOXukw71sFgZ4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784307031; c=relaxed/simple;
	bh=o99jVqFC7wHEBkyBczshlTFgv2NKqku95qjRxUSMFRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r88ZOo4JCBfQmHnvTgngQwPBLGLNXYdJUSTKwwUs0uMbmubgnRODaNO1zszfNXzOqxOaYhHUJqFNSZpwaROo1p7jEi3KLM+1dKCv0JRFlH312aHAg1fsQzLjbllti+6Yp848//gSTteCq0AKbxDOzERzk4jCIscfrlgX4NWujgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cIhDHfER; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bxCTgMZF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cIhDHfER";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bxCTgMZF"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HGo2wX2558712
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 16:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9fk9Wr8mMEviSNk4R/L0xQW2zH3u8LyETjvs5hgvYRQ=; b=cIhDHfERbEOt/8x8
	4l/xF+/nQXw2DHQY4lbUGOhlByvzaL0arXOzWSuM3T5ID89XPaFV0e62Hj8S+x3T
	1WxZVjq7Rnvj5VVCfyS3jvxoA3YN3x/gwthi1seepqdsmlukkqIpSksSMQJmCi6m
	oGLWmTDrQuc18q960HyhjHSpu15jdYyd6rW5QkqDdfEnaVeqSx+d3ekpXLje6QYS
	B7cpvQjzMOH+uibOXJ8yZEw2P/1L6G0wpx814wFLXB/bi8JNV81T/DLzikKttoap
	wq7VsskAZXxiesdFIrhfBcMJwP/EBgKIlWN8Pzd1OPqD62lULaBs/zhAu4mfSRdQ
	ZW6Rjw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffd3atuy0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 16:50:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c21be5bb4so25193451cf.0
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784307028; x=1784911828; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9fk9Wr8mMEviSNk4R/L0xQW2zH3u8LyETjvs5hgvYRQ=;
        b=bxCTgMZFbml7hvUX8o/ge8bEz1ScGdtgVW1QmTzvPHmLA8aH02HnhdIxQxLr5j/dzH
         i8aJ+PAKgnM20rSgsvNcEbp/EEDvN1tLRdYjFLW0u8EeRmExX/F3R4dr9aT99dRxRNbL
         AtPhum5GuNWVOMJ763if9Gr2CTala1pZIT+ORntPLPx8IjLILVJBaTNtc5h/Yex0xzWB
         9sJvYAgPUI4hh7rkNuwpmBmJPKJZJxlmaGBPlyVYCEKzK/RZCzsZMEwG6QuhSw5KR0l0
         ZRi/59yZ3ESCalG0O5c5e9YXPQrkwXjwmgpQT2renII/FZ5UO4I8UXW8MovBjTZH/4xr
         GY7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784307028; x=1784911828;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9fk9Wr8mMEviSNk4R/L0xQW2zH3u8LyETjvs5hgvYRQ=;
        b=fmWtrO5cy2PM8zW+zvajsLmsz4BpfxkucanZMgWh9eIlZTzcJBv2PTywGEZyQXZSna
         kEYVX1VP5FgsG2jlHLFbNQihtEGjUqHlHDIKqkhtbAPIdWWQeAzP4L8gbpANtncuSrHe
         eRY0olYDv479Ltl4C1QUJbGnTkAfWGi+peXEPNtMC6Heu5DJBBDqqnXS6bikZOAHVvsw
         ZBH0CD3D/7Y0Un02jDzDwRb2mvoSmIEZlh5KC8VuLw6ktOM7xR5RwrtgeHy2dWeBFNB8
         4xtq/pQk3Tp4FJm2O1QXapEk4TrUiZU5c1TXtaaapyV5eDp07jwZ7B1NQ6TTA0hponbH
         88fQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq7SDooHv2RqP6a1qcUVeA0xQDtRY2aMZFXaYFOdTR6A5COeUU/6qlSUWkXIgd+L9zChNKeqtUdV6aa@vger.kernel.org
X-Gm-Message-State: AOJu0YzjqfOsmeuuexOaFEJ3K6ivSJ1OfSDYKh/rd3veZQ4IRJPtVE3D
	DBTchTZj9YevPQ/DKBXUjdpz/OPTJUuoU38gyEM8BSPG/rkKZoI3ykTRL3AQn9gSJD+hi2UP7tY
	+BhP3f/ejoXWEx0XDLPmkGr9UwdKOU+R6+rTOyWbmsKdhy+3085iQ+K9QvGKWt5uT
X-Gm-Gg: AfdE7ckuiPSk5IsZtg5JE6afGOs/Uqzana6Dd0WJoKVW9ZSCYpaMnsAYmWB8XLQbis9
	9epWVW1Xt1ytjl8aUo5TUDhozqL5FdlKL80EooRYVdwQOLyV6aai2q3KT2vQ8zqZ5fQkvqoFx6T
	PPeMgEm9rJ9BWk4kIAlEpeT4BnhkwqBW5YBvEF3krmIubg8WLIL4ZqoT1ncXdEEG6p0E8tDyMtC
	DQzjehKW6iS78WEeSSIvmEpVyacrTIJlxC8wenmQITF2VLoeuYaJN/nfyOd7OuKN8MxaYQEyEXw
	b5hRv52IQzOkMVP2BLPN+ap+AX+Pfugvrk6I+bxq9v5lXlWqI+xBKsDCtA3j72RQ3jUlaGm+RMv
	fLAwrzqER/wVUaht8ucgdVxDV
X-Received: by 2002:a05:622a:2596:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-52138dcb2f6mr25143281cf.0.1784307028325;
        Fri, 17 Jul 2026 09:50:28 -0700 (PDT)
X-Received: by 2002:a05:622a:2596:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-52138dcb2f6mr25143101cf.0.1784307027875;
        Fri, 17 Jul 2026 09:50:27 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6fefcf2bsm999595a12.9.2026.07.17.09.50.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 09:50:26 -0700 (PDT)
Message-ID: <5f20426c-d34e-4d68-ad80-d01e2fc4e33d@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 18:50:23 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: glymur: Wire PCIe3a/3b to shared
 Gen5x8 PHY
To: Qiang Yu <qiang.yu@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260717-glymur_linkmode_0717-v5-0-4f9e87a61463@oss.qualcomm.com>
 <20260717-glymur_linkmode_0717-v5-3-4f9e87a61463@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260717-glymur_linkmode_0717-v5-3-4f9e87a61463@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE3MSBTYWx0ZWRfX9/+E0vx8Fsuz
 ht4XP/WgilmGehGYsfChNmu5tBNVeFuGGr1tNlO0s59PNkDsAGJOjenFjrGO/gJCbdd1SgWyvua
 mx7rmGLRJ826Ufjyem8Ev44O/FLOVWk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE3MSBTYWx0ZWRfX4OuKvRDF6kKH
 5Pl7oHeimnFcLQX28hxyiRvhaHRFByXJYb/G6m5dF0F/URayFVXr+hhoJnUCCL4jb1Oj1ANEHm3
 B59e7J+mQxcQaW2pluZR0fNYR4VYzl+J/hJs1e6aUPUE/J4rAauAZY4aVYbNPkAuogWDT6ARLqO
 X+gH832pNl8efne4x7O0xE0NOM8EhV+eBpOAiFkMlN6vbkgYkXWjw0jP8sUibBOcHv082rHpo5K
 5GNL7Dbsf4OlgZMVMX97TVi4a/pAbHCshfQ96Yjhi+sGX2PheRV1Net/2hmKKnfLT4xvbLnVLfe
 K44M2CLZZPDtb7Ys+qAZXfpO38Kb8iWfaeuekW2lbEqL9Pwc6eaXzSVQ2aVh9GXTwie+Q2sNyum
 kX+vEmTUk/AkZ1jGGG0cOQAaShMBAwb86k9xFojkSARuvuzIxGRibupPUsyohk18RUwLo2XIu9a
 X+zVOoJTo4uGzTJ2zfg==
X-Proofpoint-GUID: 6fv2jJzsO_AKO95i0c1eEkuzPuy7WFD4
X-Proofpoint-ORIG-GUID: 6fv2jJzsO_AKO95i0c1eEkuzPuy7WFD4
X-Authority-Analysis: v=2.4 cv=e/M2j6p/ c=1 sm=1 tr=0 ts=6a5a5d55 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=fY-M0D_3ktg6uw_8VIMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_05,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170171

On 7/17/26 11:58 AM, Qiang Yu wrote:
> Glymur's PCIe3a and PCIe3b controllers share a single Gen5x8 QMP PHY block
> that can be bifurcated into two independent x4 links, rather than each
> controller owning its own dedicated PHY.
> 
> Add a pcie3_phy node describing the shared PHY block, add the missing
> PCIe3a controller node, and point both PCIe3a's and PCIe3b's port phys
> at &pcie3_phy (index 0 and 1 respectively) so each controller picks up
> its half of the bifurcated PHY. Update the GCC pipe clock parent array
> to reference the new PHY's clock outputs instead of the placeholders.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi |   8 +
>  arch/arm64/boot/dts/qcom/glymur.dtsi     | 336 ++++++++++++++++++++++++++++++-

These changes really shouldn't be in the same commit

>  2 files changed, 342 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> index c12808abbfe1..e8e81bf9a6a1 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> @@ -750,6 +750,14 @@ &pcie3b {
>  	pinctrl-names = "default";
>  };
>  
> +&pcie3_phy {
> +	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
> +	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
> +
> +	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
> +	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
> +};

This node is disabled

Konrad
