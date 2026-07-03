Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C15441229C
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 15:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783091353; cv=none; b=qVGhteLS4dIxbB0zCLsNO2WUqS6nUtBdEg9F3YxJB9TU9FfftU6tuUy6pPyINHxUrf3GLfgP8Z02yYTJuWdsspwM7CzkjLttxPxl+nHdqR/N6hyWFvrDDL4Absx/8q5SEHnsSvilUqJI1+pGJiyJw5cZB7cUZERjEyYM3eDERFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783091353; c=relaxed/simple;
	bh=9AJ9t2zKbz3CM4OW0384dvG2q2y6xZLXbgr5QaSSAbI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F0L7oQLFyoUuomV+b00lZZ++c6XI2FKSkD8izAFELGmK3Y2k+mBI4pD1bAsF7mp+YooQEMI90dLBJH//ggdptpp3rC+jmIZBA1/lBrDoA7xp1CVeY4pd6w3QwcYPjcDHBgmi1yjCojFr2ZVyRozhTMU06pggWVE0MqVzmXJ1sqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kgIK3/LP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DY05/ipb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kgIK3/LP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DY05/ipb"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663BPHS53135212
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 15:09:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fwim1m/o8/vtW6F5/R3W9M3DsGtJx+nlb8SSGEWQJDo=; b=kgIK3/LPHHkmedOb
	wG7Y3GHqjJqq9Z6+xr0WIwEi21MowgiDLDNwxYAbrsqurA3LWf05TumdIREhJ+s6
	l452JLmnBmIMpMqPPH3OFWeXSwSHYEooHfK2Pd8RSEzKRDqrdHBFK/7aSnTPUeIv
	lUu23uet3GvU3O0zD1FXbUf7hdCFOt4n2yndhHJO50eAJjd1FL6BWQRjIF3A44Ff
	2PgMn83RrRO2Vovlo36ca+zTNaOvfHIl9fPxl10j7ZVnLxEcTREUDhXmubCvBOAk
	EC49FWRBIxAVDnwAD36yhPsVtPLI4/PuqK/ZTxRodiwvWLU6ted66BPCdkT8AZoQ
	PgTmOg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f65qcjkjv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 15:09:08 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bd933e15a8so17007e0c.3
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 08:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783091348; x=1783696148; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fwim1m/o8/vtW6F5/R3W9M3DsGtJx+nlb8SSGEWQJDo=;
        b=DY05/ipbVaAV1BWj/5rONCobo8NxUBBMFjt/k+WUrSu6IitTHet6smFmOrQMESqInG
         46qcE1GFFFmIOxj5X3AiMuaydaCQqlYaAWdLGDJI8nHL67sKYj+MoJd2Eaec00kPRPnC
         P297Nvop+oVV4iP9ozZV7xOSlKvKxoKbSpDAPvp+ha+fhnfpjHdveSzcDN8FPGoD4m44
         yd4SEpjaCntHs+lNJ17KFjJS3rPEw0jus9teme6v/VueARCbI3WQAUXvZdgwb7d7ERfA
         k+OU+ik1VYYRWaP7+Ifepkc3JJ4oBhfLniZsjACrKF4/wed1shg7Ih3HcpOOdvEEEloG
         dxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783091348; x=1783696148;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fwim1m/o8/vtW6F5/R3W9M3DsGtJx+nlb8SSGEWQJDo=;
        b=ITGMZoe/AOxW6vGIBgcD9DMk4CQKMT7Sp/Nx/ovA3SQohhulPgjxhLZDPRkO1sJICy
         5PIZ4K4m8w9s3UHfooJ9C54XXD/PYehpS3EbDp8gKtfYIB3cT8pM+GZoReqdZUYTOTS4
         VzJaPLZAa+hgHnXHipV+v5d2rEjm24K1A0NkW9dDuatHraux+kn7AjnogMM889kDpDy0
         uHY/pqgFOw4ZuCfrIMAmt0nPrLxS/Vl3bneYv2s+O/GrhZYcBWDiqitoQ1BNiJLLDweU
         mueRsugnlQhbaXVY290l1pKbbx3wbAH+Wd3y2otbmLZ9R+YVd6Ok4Qzf1uMkDDfg5OCA
         ZIMQ==
X-Forwarded-Encrypted: i=1; AHgh+RpmP32J6B4xrkW0LtU0sspAhkS2F8HEAWnwBRbB+/G6b8nAHNKhNh/uHgI3gYkViGUWHyp8oxBRNPqf@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6a38NsQ1th84aFQSQFIWa59EdFVOeu1bTRyCtFmEvMbh4AWxI
	DD3pUlBAfIqVBbKXkksUhNML9J+/FKbMPny0m2dd3LgQbRi70v03gM1Up1/Tjg8XnCvdkpZHauS
	UZfokthwspNwd5Y6WylpT5uE5ZtSqld+evxjph65qMmJvGW+DNxa/c2OW+174QWWa
X-Gm-Gg: AfdE7cnI576K1mpj9Z84LGbbSJBpSV/gg8Fr67Lq/cLpFoljV5DLoGugbj+u/KmSzJY
	EtSdVXwIH6u5PMhgo9GqrxszMcoPDHrkNNe3/bCp7I3nGJ8SkHpOQca40iuFbhgXB6MdOuV1191
	lXTZknUXw4w/I3SLduWDA73uUAhX5QrwoxBCK1sQHBEwZRN1a8eQcc6B5Jfunpb3qdaLmC8j7d4
	al0/nXujxeFq5llBsFN556pWl/gZbkD3nEmTxl0MpdtZSE/vIzi32Y5PexCrbkZ/ehWmAgq0Gp6
	pkElI/0kfr+szip/fVKGTbSsPuKzSayG9RXLY3LE7Afi2ud2w7ffrZ5Kjad/y3iJAl9JnOULUaX
	FwdkpWpO+4fhfqkwVZbM2kFmge9+y4k7ZvEk=
X-Received: by 2002:a05:6102:6a8a:b0:738:4343:fba9 with SMTP id ada2fe7eead31-741f8ffb110mr55435137.6.1783091347620;
        Fri, 03 Jul 2026 08:09:07 -0700 (PDT)
X-Received: by 2002:a05:6102:6a8a:b0:738:4343:fba9 with SMTP id ada2fe7eead31-741f8ffb110mr55406137.6.1783091346108;
        Fri, 03 Jul 2026 08:09:06 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19cd8904sm2578a12.2.2026.07.03.08.09.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 08:09:05 -0700 (PDT)
Message-ID: <7ce4844c-8025-48e5-a1fc-4d1cf9f7917d@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 17:09:03 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: eliza-evk: Add PCIe1 with TC9563
 PCIe switch
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260703-eliza_evk-v1-0-7624440bd76d@oss.qualcomm.com>
 <20260703-eliza_evk-v1-2-7624440bd76d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-eliza_evk-v1-2-7624440bd76d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -ch8Zvu-3K5u2znsd7Av0gNdEqmC7Scx
X-Authority-Analysis: v=2.4 cv=Bb7oFLt2 c=1 sm=1 tr=0 ts=6a47d094 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=CLDG33loBYVu3UNdBq4A:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: -ch8Zvu-3K5u2znsd7Av0gNdEqmC7Scx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE1MCBTYWx0ZWRfX4pfwOCCEradQ
 2CjGTniS2PRXGSN6JJsOgVk5Mr52FoAVeHyRtSKGiUcVIBfzt+iphhLbg0Z05yXSJTJ+Ve7Q+y+
 aLwsx7N4mcLhihAfB9iNOs9AJZh0w51/xCONO12/wMjegWFg3PCeaSaclw2gM29OUnpQFM4mtFV
 1s0DyGk2Z7SvLG+uTHYWcZUjoKIXr1k1Q22MQyv7E0LQjchvX88NnBjHngMWExiM/VlT2FqeUwF
 JgGAZHM0xA4FwzVQj5F5BONPuSnlvRm9RwzSJBA6Vj3DXlb3Mv8g+L3hNiVCAMy4x2DspFNeVNW
 rRz9tdNhaKRztPFsbHDL54SuFMAe95u5nRA/29lTbq1MXFVQBtUjyv16FVX4u9gITwirbd1DXiw
 K3aqWyJgWbch4HY3GadyuWSqAwPSs0048A3uV9xtD/Y+nxarBFyrPyolPL6s6jbLUaISeOWngcW
 csxynGZO0P+CVh5BZJQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE1MCBTYWx0ZWRfX+j1NB9lmuD2D
 WmVXc4VvsJWXD7EIuKBNucbNVgebmRXJrg4H3COCmHwRFZYEqdDv8LSLwKSnHxV1km56Y5Fo9WJ
 PoooB9/ek7A58uv62LwuHMSVRB+io/8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030150

On 7/3/26 2:38 PM, Krishna Chaitanya Chundru wrote:
> The Eliza EVK board connects PCIe1 (8GT/s x2) to a Toshiba TC9563
> PCIe switch. Enable PCIe1 and its QMP PHY nodes.
> 
> TC9563 uses I2C (at address 0x77 on I2C4) for its management interface.
> 
> Override the base iommu-map with the expanded set covering all the
> switch's downstream ports (0x1400-0x1408 SID range).
> 
> The TC9563 RESX# and PERST# are OR-ed internally to assert reset on the
> switch. Use TC9563 RESX# pin via a TLMM GPIO and skip wiring PERST#
> from the PCIe controller.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

[...]

> +&pcie1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie1_default_state>;

flipped order

[...]

> +&pcie1port0 {

This port should also get the compatible

Konrad
