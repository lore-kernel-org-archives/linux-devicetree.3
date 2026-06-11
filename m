Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B4036D9E6
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 07:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781164163; cv=none; b=IfCgYVrZxkt9LhHtdhia17fWIggo0vXRaFGbH3So7ooYpahGJTB6+OYDMiRbekUKq/7Fqk/ECnDYnCNS/rBW6vX4KlikWA4ipgXl7hH2tDWIYutKQ8ruIRSu6DFMDMOOJYs2i6d0gyMBVemld1Ak1oTeRRLXo1uAowNkrkcWrRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781164163; c=relaxed/simple;
	bh=r4u7525wBMTu2CXxDilTPdQiU4seuStXSxr4mhu0jLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hTDy2bRI2fozKn/H7ljdLZ+uRBHCsXnU2/vyo0BfsjI7Nu7wckqcKKbMLIXAHWLF2DO63fle/rUvCzB+8IkaSkZqsM9h3p4DtV6Bzyl8FAPIGWCsbR+KPA9ua7QDTWKWVT6UZPZP0BWAWrRapSadast0SiSpMuk70G/5aYNkMIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aopiqepx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X8QiSpa4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aopiqepx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X8QiSpa4"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GWoS3761557
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 07:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p/tvkY8zr/P0A/+5aGOPJMzczHUrqigU/gDVfyTBh4A=; b=aopiqepxGMr0v6Qz
	5bdcQmuZTbH3BPUe42QZj8F/adRBZX87r0PDDnrVFHZVnDgxqX+UJDkYYO2gTPqL
	+hhqmr/NbxW6EaB8deAOFa68kyGfn+mOGt7eG3L0gbCqwE1BFmyeawY65u5a7J8k
	S4CHxrZuigRepsCLyo5CFPlxv3CuMLWrmss133BptG8nyZQ/da9XixEgivv3jI7j
	8Dte9XGqr3tz12lkCWDQPRKPeDbDdfQfDdL/f8ZYHFGvPjF3wDxwDHrk13Tb/cbv
	7ypU/HzN64nsYhhatDbpIUcO3hzVEOTGZO0BGRDFNHHdNqGx7bPUbNNUYSvxgqaw
	qGso3w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6sjbvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 07:49:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51759082206so22827341cf.3
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 00:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781164161; x=1781768961; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p/tvkY8zr/P0A/+5aGOPJMzczHUrqigU/gDVfyTBh4A=;
        b=X8QiSpa449p3UfkYtoMYeCT6dDXl8hWgE/EcDAoh39T22W+PWRHcNwqTUlXEuN9u/B
         Zn/fytUd0lFq1hh7814TfWiUqPmtnHgdL4OpN2/1pwl7orL1jLzKDm754mrDimN+owiv
         CqQb9fN5PGKSkk7DwV/P43cp3jgUjodTzP38qiRXz37rEBuNELiYjlHppvGuDonorXxo
         hl1pr/BoTlSZKyuapKODXGSXL8mOBBtPSGJKvHI2egUEcxxOSZv30eC924yC2yqDMAI1
         ew30JejfbY/hvBsU8Al/y1km0cGnemXE7jTtUHEG6J65q1Sgh1K9AJckpyjQK7emeJzc
         P5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781164161; x=1781768961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p/tvkY8zr/P0A/+5aGOPJMzczHUrqigU/gDVfyTBh4A=;
        b=WltEYdpDsbAhtRsimnCU64MZYymyiVopSIls1VTQLJ+F4MXwjgQGZBuoxeYCAdPIPY
         /vUB+rjA5A9z/fqT1ZNMM8yQZjTJSvFEqH37f/Hg9XuPMMHV0NXm47MklMC2fNPb9QJc
         LBLlj1hXt26CXJsYe7bKwUO5mgBMwCX5EoPSZjEMb598JWE5Z3SigwXN0iAPTKWaqXEj
         Vf07H3QDKXNUA87wFBKCMPMhcRiwZPoXOKss9Nikthc9KksJ176Rli1e2mvfuIOuU3kZ
         tbcnT7iG01vrBOmouqa9liyYyu4iUyjjtkfUp2ywVEn6z1LAZi5sf6bVEtr2p6CG8HNC
         iWIQ==
X-Forwarded-Encrypted: i=1; AFNElJ9agvhTi/m0oDulgjXYBFBy6nJMxmNO2QEmiwKATsKYtL9XtvYJ+bFPaltlTJABgD6jIiwjbwYWiU6q@vger.kernel.org
X-Gm-Message-State: AOJu0YwAZuJubtYcmnaMlJ8Q+S4KfEKDOBcbIguGBjpsRFolBeakRo76
	3WKs979A3AWHs2lMfs+cKP+o10+SgN1hdDvnF2y21hZ/Gk5w93wHsK44nZbVc6bpnU0WqL2GdKg
	axyaUNtInN+7WzLLsECIzIiAiJcTYmOSSzk8M3yvjsmP4RRzSZMz7LBGGNQzo9hr8
X-Gm-Gg: Acq92OHx++Rg7BvrpIu9Cg9OT48x/yRY2uB1mwdiqEspPwf5j12mZgmJInT73eMh/27
	Dx54j2t3zRF+UxpDaYB3lDUWw2ikPHjNispbJNIFXkkJ9kFs/xVxMh0Gjy6EbtFAorH4gPn8l6G
	mRbDDsqg20s997U876VN9hewGPr/5ZBM7KE35SlzwsTKxxULYgrb85tYYTtJkuoD50gS6L+BMjE
	qgFU7LAaN8bIlGoF9lwHE+gx6NvRdOmrOEVtKb8HS7OkhPpa79dFa6U+eIlzP2PKOw7u1oVAgdU
	zO2Cwth1LwguOs75DQIuT0A4uJJU2eON4lZen5iAZu/dj6R8V4d/kJhv5ohvJhqay1C/2bkg1vA
	7qPqFutmC69R9r3/qHg+zK+cv9B5C56iXb58Clwr/OfQkTkAdxyXRA8ic
X-Received: by 2002:a05:620a:1a09:b0:911:dfb8:37c9 with SMTP id af79cd13be357-9160ad62db3mr134149085a.3.1781164160976;
        Thu, 11 Jun 2026 00:49:20 -0700 (PDT)
X-Received: by 2002:a05:620a:1a09:b0:911:dfb8:37c9 with SMTP id af79cd13be357-9160ad62db3mr134146585a.3.1781164160505;
        Thu, 11 Jun 2026 00:49:20 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb0f1439esm24362666b.1.2026.06.11.00.49.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 00:49:19 -0700 (PDT)
Message-ID: <5a65ea59-b38d-4cc0-901a-01c239381d91@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 09:49:17 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 26/37] arm64: dts: qcom: sc8180x: Move PCIe phy and
 GPIOs to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
 <20260611-wake-v2-26-2744251b1181@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-26-2744251b1181@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a2a6881 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Pp3Y-cPEr_PWQjmyE4QA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 24nuF7SdjdIpEOF3c27Slj_x6CLDOP7w
X-Proofpoint-GUID: 24nuF7SdjdIpEOF3c27Slj_x6CLDOP7w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA3NiBTYWx0ZWRfX/teAcMvMpxWe
 pgYApvVZWaCPegKXt42BrEmsj1jeNKIycFObZiDJjsEt6w9CXqr+jFh4cTLIDHW2V6qgwBKL4sa
 +bPDliG7Eu4vG1t/3R5YuhaDt00jwqkn7dEJvwwcXXHQnPTl8xLOpkhBENrN9rM+IHS923POKd9
 8PX2mcRkno4Xr687WD8WWjOjD1qzZ7K5Uiv6UUN0rGM4UIzQLEBnjrfb5tKvBNVeFpOce4jZo60
 dDCP0qrQLKuP7+FZxQD4e1bQXx722It+JEJnDK9feLA7oW2T/DqHqiHfJfrSM4rTSREn9ZLHz9z
 fPmKVPIXB0hXx+Mp6FmYt1qcIuT7G1D1J9Pb6YHqZu+B/gM7YahgNgTGwdONT6eb5bQ0yWp9QKC
 lQI+1SFm8q/Rdcsa3uLqlWb60ezcnW/YYfQqfyGFlf8va1QrNk7Uw+IzS4NVHPNMF/w5xP4I+vv
 hj567Y3abEfY1m6uquQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA3NiBTYWx0ZWRfX4UFBoNRC7Y0m
 D/aAi3SxW+e1bLPjrJaDUXAZkdQsDNIPReRZ6POkREo4cjC4lUCgHRLaeNzwjZkbPKsZ4rNeghA
 IMkO4dCtkcthS2h1v+oWZnb+yb8NwRk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110076

On 6/11/26 6:59 AM, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> pcie0_port0, pcie1_port0, pcie2_port0, and pcie3_port0, adding
> labels to these nodes to allow board-level overrides. Move
> perst-gpios/wake-gpios from the controller overrides to the
> respective port nodes in the board files, renaming perst-gpios to
> reset-gpios to match the binding used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
> ---

[...]

> @@ -1779,13 +1779,11 @@ pcie0: pcie@1c00000 {
>  					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_PCIE_0 0>;
>  			interconnect-names = "pcie-mem", "cpu-pcie";
>  
> -			phys = <&pcie0_phy>;
> -			phy-names = "pciephy";
>  			dma-coherent;
>  
>  			status = "disabled";
>  
> -			pcie@0 {
> +			pcie0_port0: pcie@0 {
>  				device_type = "pci";
>  				reg = <0x0 0x0 0x0 0x0 0x0>;
>  				bus-range = <0x01 0xff>;
> @@ -1793,6 +1791,8 @@ pcie@0 {
>  				#address-cells = <3>;
>  				#size-cells = <2>;
>  				ranges;
> +
> +				phys = <&pcie0_phy>;

Other DTs put this between bus-range and address-cells, e.g. hamoa:

pcie3_port0: pcie@0 {
	device_type = "pci";
	compatible = "pciclass,0604";
	reg = <0x0 0x0 0x0 0x0 0x0>;
	bus-range = <0x01 0xff>;

	phys = <&pcie3_phy>;

	#address-cells = <3>;
	#size-cells = <2>;
	ranges;
};

Please follow this style

Konrad
