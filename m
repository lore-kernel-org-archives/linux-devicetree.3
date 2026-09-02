Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D72430CE5
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 10:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788343902; cv=none; b=mdjiOMm6cF8Sf5masF7WpvpjoDnF5V6YnfzNWUARaPqb7G6W21X712w9b8cu1GrXyBi5X98z5Kp653fQwuDQrqAmLlYBR6bESOhrRmXI57V43TPyfz7MkfkYxhk/IIt3+HifXYG6CfTgkg4LbBDMFKf9+HjYm4FohsbeJOv/64w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788343902; c=relaxed/simple;
	bh=MqnEivMcGljRZrK7sqB9AWRPTMEpI3mNs3vN5Kxlhko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AKWVKfXSDVfw2CIb+HN+WAokbw5gtBU5LWGQhoSS8mfIoUdbBAZM51uwgIaVRTNM9hEYCaWdCqD7TKNgUvIOvsf5D2OQ44WLoVpdldh94xcb5jf2wZ0cqOSDO+fZJgjOnBg9jniiEiYLsQ+iT0Kt67RqhgR8MeV5JMbHHNik2gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UeK5KfgL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZF7AMhzK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UeK5KfgL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZF7AMhzK"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829NDeB463868
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 10:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hGLV8ocmkLX6cUaKfIwRziMPYkvvnBHHmbRn7IWjrAk=; b=UeK5KfgL7e9oD8Tz
	75rNoo3ECYfgWQ+mPypX+A7CArwBHs5szY51yvE9FgFobhIG/n+2GPczqYA4VsN0
	5A4tDVM4LXQeO9L0FOakPDUsk6rGpplqZZee+VKQnVYW0ai5C9Ijyi4mk7YH7oDn
	VpwRo4SZA3n+BkXwrmQFr7k3iSDF/fMtMy7LbpYfojxRuGiL+w440uDaGCGe7SZM
	8V9WH6NPROUqd/poOoEwHu48LnMS+ZxTn8AwbNzqC/5a4QExKZB02NKfnM/zLOBM
	IZFlo7S5WWnYmv6DOzdZogTaT9Yrt1s1d7bpkBben7SViIxusEwwwMog5yngzMPB
	D/9CYQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge35k3ckk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 10:11:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93821883e26so26392185a.2
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 03:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788343897; x=1788948697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hGLV8ocmkLX6cUaKfIwRziMPYkvvnBHHmbRn7IWjrAk=;
        b=ZF7AMhzKuZTy4nNXW9BE4HBlcyeQzU2RC/VsuR7uxr9sTDx+9oMNwCEa18dFgw5tIr
         WLgY7FQ4YJQuQftrH4SZIe63ErNp2WM75lJJky/rEIzwUToJov8KSZhBAqe0clwNAJDw
         p+8/Bad6eS9tCSRDZ4L/LX6Yb/xcduD0A+2SAIcM7As4mQncqKR/pwLk69q/79t82tk1
         3kUHCivhHCn8DcmriSJgKq4VUsyxUpEy67T6aajYmnXR/7h/7S5alvDo0RoSu0zXEKOO
         mA/g9R3d6G+d8NRpQQp6uacjl7ILsSZ5a5QJlHXiDDuOqqZq9z0lcDRtLugfCZvDx9p0
         Zuvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788343897; x=1788948697;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hGLV8ocmkLX6cUaKfIwRziMPYkvvnBHHmbRn7IWjrAk=;
        b=mC6jmu9wTqVHqi/GcxkzlBjNMMCijsdfEISMJAK4M0BC5DAWOqcJV8/OovD8nihBD/
         PzbSu2/T8LLx4XQmLi9VVrxwmC8yC83WwAvm4uQfAtLQRXIXWp0eeXSeUrtsaUt8UjYK
         dxc028+hjKqj0R9383o7g9oZrFzQZ5+cZoxPkQjXlmp22V796T1duRklP6xRdXmfUNCZ
         1LwykWLFDzGBf3dtpUQ9l2yCVAVMJ0PR8Kq2p+fs7ZuCYdqXI75QyjXwF0v+r2eoD7NS
         8kInshRc/mXD5ZcsE2c6kIr4ZB5MmRWp7rQ1vm+0TPIH6PuRGCvNPkxg0okOedc99Hdz
         OCfQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro8JtmkC2MiROmdtlVgBjBvLddrrnTkSLxRRdTD4GNkLEkeHcI20dzvgCqHCf6wFdWu/o7RSXB9WD41@vger.kernel.org
X-Gm-Message-State: AFuF++lbOCXR8CFAqJM/hBqE3K+ZBBz3GQCb6/rq+MERqzJGxavcjP3B
	fFZGVIQs8i6W63Ohb4g/GVg/Xfzp7Sb6bpJt+jJVshxKaRZ6tH/9rfUJUruP40ouwyDRrKIuyii
	piTP/xqo96IL+P4ZrSo/UTbE3aGY2cxAAORLok/mCNebV0wb4kJzXG2nqOl6wvfhj
X-Gm-Gg: AR+sD11HKwaSkTYjmT4V+9MSXxmmAqP9OUnEf1FjIaj99WN2BC9Uh6RH/NI6idDd5Da
	oK4lHvNmPgTSN3djR7rUtAh0XJ94boBWnjI0hsQosL3FWo1ErCWROHyTkJw7IVuHbzjyHcSgx2c
	pJJtbou8kxTjkLQKrMKUisxUqLSD+K2cj3IFgNRwxtwcT7qxgFYJGJPZCYv4PS6wxFhP/Hi16VU
	oFptXZu0+E1YdN0Bu3bTXaqB4ofwStYBf1sJPMhsU+yG7mpYr0KJP0RVp9luV5DGytNJu2L+LlK
	032/dYnXxNZ7N35vcuBeUauAlLOUSjNrZc0KorafpNJRPKo/l3QXYVG6iXOkQTbWGX+6H4H6RVL
	RI2hiP9rM/4LbQgiSbxFHiQ==
X-Received: by 2002:a05:620a:1729:b0:939:48c8:656 with SMTP id af79cd13be357-93960cc57ecmr241731685a.1.1788343897376;
        Wed, 02 Sep 2026 03:11:37 -0700 (PDT)
X-Received: by 2002:a05:620a:1729:b0:939:48c8:656 with SMTP id af79cd13be357-93960cc57ecmr241723585a.1.1788343896176;
        Wed, 02 Sep 2026 03:11:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d039c9fasm105678066b.31.2026.09.02.03.11.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 03:11:35 -0700 (PDT)
Message-ID: <18a73f51-a535-4cf2-a4da-d7cd4fd2a801@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 12:11:33 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] phy: qcom: qmp-pcie: Add Nord Gen5x16 PCIe
 multi-PHY support
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20260828-nord-v2-0-18bf59d19d6f@oss.qualcomm.com>
 <20260828-nord-v2-4-18bf59d19d6f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260828-nord-v2-4-18bf59d19d6f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5MCBTYWx0ZWRfX4Bffk40kzyTw
 a2qddeLTtRkSA4f0ChM5IfXq1L29MNeNWpLcktUZH5i0gTJWjIBH7YprB7AyJvHmUMaeOt3zFi4
 VmzfsodkS/J84BC/FACS6d31nij1GBIw++MwF8mYH44/B7wNlVqcGBdzqIQrBueEQqefuUgG4Ri
 TxU7yUJhDi8osGyB3AS/R7rBkeIEbscYxKmXkrCcLkArFs/2iteYxJOQQ69G3CLzVUdvrDTrZJs
 5B23CuKCIVJxRHaaKJFxgQODZNRHbICuI3UqDRoOTqoG7DdZ6WmpneIhgNc/HbT2CaHGk+LywGl
 IjtenM7e2ccINZE6MPAkBuriOd+2u+RGDOUZIWN0J+927TCuu3Xa3dgibLK9OfzqK+CoTrRxaCM
 8OkPouOpVs/57cZHU6s/OWbO7MSRiL+yOohKOWRl4mgQQnScBc3GbrXlRtTKeFU+LKyfYPWE54z
 rGNzYK9NZlvkGaOMXMg==
X-Proofpoint-GUID: 6CXvLy-72obFWA5PKLLIIjLjGsSTSx89
X-Proofpoint-ORIG-GUID: 6CXvLy-72obFWA5PKLLIIjLjGsSTSx89
X-Authority-Analysis: v=2.4 cv=VLrtWdPX c=1 sm=1 tr=0 ts=6a97f65a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=uUvTuc4oTmGzQ4V00ZcA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5MCBTYWx0ZWRfX8KFL2Wl9C+DA
 V47bBbL/Eh22+MI6Sl5yInb6wPdDlTHrvwS1hHLAYiVMh6oU+/KAtZvXQOtDkV16MAEWQS2Xak6
 Dh2/oX9dsAoBYd6z30TMT3Fbzl9/ZaU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020090

On 8/28/26 10:43 AM, Krishna Chaitanya Chundru wrote:
> Add support for the Nord Gen5x16 bifurcated QMP PCIe PHY.
> 
> Nord has a single PCIe PHY block split into four ports which can be
> used in multiple lane configurations: x16, x8+x8, x8+x4+x4 and
> x8+x4+x2+x2. The active topology is selected through the link mode
> configuration register, and the driver exposes the corresponding PHY
> instances based on that mode.

[...]

> +static const char * const nord_pciephy_port_a_vreg_l[] = {
> +	"vdda-phy-a", "vdda-pll-a",
> +};
> +
> +static const char * const nord_pciephy_port_b_vreg_l[] = {
> +	"vdda-phy-b", "vdda-pll-b",
> +};
> +
> +static const char * const nord_pciephy_port_c_vreg_l[] = {
> +	"vdda-phy-c", "vdda-pll-c",
> +};
> +
> +static const char * const nord_pciephy_port_d_vreg_l[] = {
> +	"vdda-phy-d", "vdda-pll-d",
> +};
> +
> +static const char * const nord_pciephy_port_cd_vreg_l[] = {
> +	"vdda-phy-c", "vdda-phy-d", "vdda-pll-c", "vdda-pll-d",
> +};
> +
> +static const char * const nord_pciephy_port_bcd_vreg_l[] = {
> +	"vdda-phy-b", "vdda-phy-c", "vdda-phy-d",
> +	"vdda-pll-b", "vdda-pll-c", "vdda-pll-d",
> +};

Can we only list a/b/c/d resources and then take a union of them
as necessary for combined modes?


> +static struct qmp_phy_init_tbl nord_qmp_pcie_pll_a_tbl[] = {

The abcd tables are identical except for the last 2 writes. Factor
out the common config and create overlays.

[...]

> +static const char * const nord_pciephy_port_a_reg_l[] = { "port_a" };

We already have some of these symbols in this file that shouldn't
carry any SoC prefix

Konrad
