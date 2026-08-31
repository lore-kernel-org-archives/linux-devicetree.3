Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4923C2B95
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 07:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788162889; cv=none; b=AwYKT7Bns54rCjOKCHg0cz5zOh2k00x70okuC+4UH8UD+FNCxPUaAm7Y+V8hyXfCBWqw5NcgTLnG/Vg3fE5EazsX45sRN1UF1Lxpd1wM4WL7l+hZMLUviLfDZPmONzhW3+JpY9evReOxRP0OrUjWp3GzzzjAMOlH+9tMSDNldUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788162889; c=relaxed/simple;
	bh=ZXNUMeyA9Kooe1teg7duNPKgU8sYXLIOjB2Mmy38Hk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FaQKluY0JsR2VylPAqwDzu9V2TH9UPBP5U8XZ2Qsd8RMV7wpL3h+KV+Dfyf4v7NwbrMYJ08NcN6rY2hAzpM7k49YR3U3x6qRq/tw1xj6DxijVLxxz3KDQyJdvqokGtouECp6gXA2bRoYPZILCct18UjL0Q+WtVSQR3s/IS73PKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o461NXyC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RHBsH8ex; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o461NXyC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RHBsH8ex"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52Kbw1933570
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 07:54:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SePPvMBxpaGoDJhHrmxh33/I8LF7sPSpOeAAcC2frqc=; b=o461NXyCXoygd1RA
	VCJENKDrt7zYXZp5QGLvjzWYSuesVy4N47reVzWhT6SWKMAn2G/lft7T4a+c+eJZ
	ZwZcIP1OtqnuiIlMzpr/eGOpzrZRX57VMXFVxobK86iDkgurQju3wonsKCRXGk1U
	fQkFaFyDzCQO0hX/3Ro4OTAWS+wu617bwsN1axJ85dQ+Y6id9IGVTmR5X0uxm5Hk
	9fNC/zo+3wNzW4wPlCL2/rFX+vBydf1MhYIST6m8dS35BdCS/o02Lcuq/L0sXQ/0
	3BkOEoFmSb43DSujMVatjP3npG5yVcnbV/vkR+c0FLd2+5b/hAi49b0rsMpicPMZ
	rjLFTA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrq85401-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 07:54:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfd1772d8so8512461cf.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 00:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788162886; x=1788767686; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SePPvMBxpaGoDJhHrmxh33/I8LF7sPSpOeAAcC2frqc=;
        b=RHBsH8exlms/pMbGlWi7zl+MCQQbK9wpNSV8U3js3jpPvQsF44iDv1smY0nTaPW8MZ
         uV79sKwXOdprUGTnlDT+pYYR52gDU8snq59CPbSG1hWqUJ/VbWrVN3ZFMXHgjL3kX5Oy
         QkEDZbIvvY0Es5HAlN1IwgbXdI5JS9unCN8anZUGhOFi+4M6IcFqSuonxCez3MKDtrOM
         /Lw9YIMZcGJ3NDmP+xKLULLaCY48VICGvI6zza38Q5Qt2NjIQ3wS6Xjezec8pnm5M4Wr
         qsVJ+TX13T5lFFdtg53OBLIfzFW4BxBmf1Ly0NvNIwUroaaONJXanSpPdbD9Jw7Zm6fW
         B3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788162886; x=1788767686;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SePPvMBxpaGoDJhHrmxh33/I8LF7sPSpOeAAcC2frqc=;
        b=ms89ZQZJQtOdn10P2TMYP/06Tf+fCKF+evp9dAqulXm3RjQQdI4qJyOpR0aEfwUe5A
         aERUjIq3XqD9QymB06n7MSvEhRzK6QIHH5b/GZrALL31K9WEwHDtEv9CrI02aagRtuxv
         i57eWa2wyl7cePB4P6ffF4OQn1RstPmwiNFuiZOkxIe2GGZEc0N6E45Dks/mwse7XWa4
         UxZ7/eL4BQJpZzZnHT5ymwzILKsYe4959Aajd/rN78rB9nuSRz55ZRxzTkQHqNCGn9Zz
         k6wFDcasEppNKk454pu/0v4ngS/kErLqt/dF/LAwT+K2g0rwAjvD37esYitoCkDyeFlV
         RrdQ==
X-Forwarded-Encrypted: i=1; AHgh+RroO1rDJ30gxiHOMS8aoOtAKvVRx4I6uP7LPJvTUhPX0kNHnnrO6UOGMxQPE6JyMFcq7hri4jPTa6ak@vger.kernel.org
X-Gm-Message-State: AFuF++nkBBClxxR0/oQwVnRyqW5O3EVfIokQ1NXnKIDggNXSA2zGZnr9
	5Dqb8G3u6Zom2+zwU4KnKnyEwKwPYbeJcLDn9mSLR/cjDXvQOxQH0aL/ixBORjaapodaXtukBMK
	HIBaLxRmqdYx+wMCVhaJmqygS/CReo0ERI+a84EGQIKh8UXx1RFq1X5DXDBFEzr0j
X-Gm-Gg: AR+sD10byKlv+dmfJ7Htkdu10Xs6gczPKLrTaenHaXp/bkZtjxpZIq72W5KQM9cMySJ
	pDAx2Q6rSzx4MfLBLp7WG1VkHJQWx9HlBPLhaGyP4ql66RQ/rXGJ3LGWqHfjAHkIAubBdyf4VGt
	o/z//H1xKvFh2E/h31u2oUrFkxSk2avsuB0q7EPmDN7CDVFhPk2aGwE2B79E9Xjm4kIQhaqbMKz
	3sfNwEs89XKkIepneHJO6t3IUOOD1wa4fW+hj7wFjhBAqGEQJlUGgUMVwdUXYANB+Du7k0g3Bua
	gWXw+uNzPnkgDP1jR+DFiFEdRTWb2RY8DKu+dNSLToKUw3sXt3bKqV3b9XtPeg+19PxQ6QE1Ae1
	3znX6bfhKEClighM693WodA==
X-Received: by 2002:ac8:7f4f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52fb95f4e1amr193281961cf.3.1788162885909;
        Mon, 31 Aug 2026 00:54:45 -0700 (PDT)
X-Received: by 2002:ac8:7f4f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52fb95f4e1amr193281791cf.3.1788162885465;
        Mon, 31 Aug 2026 00:54:45 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611b5c3f7sm3232618a12.6.2026.08.31.00.54.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 00:54:43 -0700 (PDT)
Message-ID: <aabdae7c-5294-4789-b123-4fcff8a733e0@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 09:54:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: phy: qcom: add Nord QMP PCIe PHY
 binding
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
 <20260828-nord-v2-1-18bf59d19d6f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260828-nord-v2-1-18bf59d19d6f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -KOTnaxSWjIoW_uOG5nHS0eF0vNHr7-M
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA2NiBTYWx0ZWRfX8aSZreqxGh1F
 btWaXnemLSxJGIXWxl8zAyleQXyJrDuLViYUcZqy3HOh1ToZKcXxCDbtGJ1/jK86gWm9LgyZZJh
 Ysapn3SP8c7n1+Bm6dpfkeit1Plmh9E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA2NiBTYWx0ZWRfX0sPMeQTkDfIc
 UbUREd2Qr1kiK8oPCNRtUBT/37Ivz4Kvdqs30qhGfan0XpiJ4cmc8i427TlaUqSUmOsqXY4vM3j
 SlkCGaT2ca5p/mw037X4dsnd2p6or8Rk5o4sQfWpD+Y2gvMvXf/utthiqpj+lCKjKjUKfAtsiJe
 vdDVLQZlpfxHVt1Qmyck+lCgI1i34WgWYMregq9S5lyAP88QMYzuodGh+n3pblWFpD12/zrAib1
 CAl2diuGv+tyhRcgGYPj2XHBBSvRYQlCFdZCzv0Tc3AIFrrg7wNlDLi/cj8hs3AA2YLTEZhGerf
 AjfeOQAdt/cxWbeWq2UL/1Gxd4zU8k+LmCMzq4RMQslr8bF74DdI+LqlZVga7gfQMiSRn8/0HZD
 PPcnMdKRURLL4LE6Q5YyTES7FaHHWhfDEXB9IJ+R+cM6CrUorkrt7JcTkQ8WLs6i/+VZoAfAH4J
 ntU9/UgO/isCw2KnwsQ==
X-Authority-Analysis: v=2.4 cv=ZOPnX37b c=1 sm=1 tr=0 ts=6a953346 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=96DL8lvnHqRkPdvoplQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: -KOTnaxSWjIoW_uOG5nHS0eF0vNHr7-M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310066

On 8/28/26 10:43 AM, Krishna Chaitanya Chundru wrote:
> Document the PCIe PHY found on the Qualcomm Nord platform.
> 
> Nord has a Gen5-capable QMP PCIe PHY that can operate in multiple
> lane configurations using four PHY segments (A/B/C/D). The active
> topology is selected by firmware through a TCSR configuration
> register and may be configured as x16, x8+x8, x8+x4+x4, or
> x8+x4+x2+x2.
> 
> The binding describes the register regions, clocks, resets, power
> domains, regulators, PHY provider interface, clock provider interface,
> and the qcom,link-mode property used by the driver to discover the
> active lane configuration programmed by firmware.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  .../phy/qcom,nord-qmp-gen5x16-pcie-phy.yaml        | 276 +++++++++++++++++++++
>  1 file changed, 276 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,nord-qmp-gen5x16-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,nord-qmp-gen5x16-pcie-phy.yaml
> new file mode 100644
> index 000000000000..37198f82c611
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,nord-qmp-gen5x16-pcie-phy.yaml
> @@ -0,0 +1,276 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/qcom,nord-qmp-gen5x16-pcie-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Nord QMP Bifurcated PCIe PHY

Quadfurcated, perhaps? Is there a word in the spec that doesn't get too
detailed about the number of effective slots that the PHY is divided into?

[...]

> +  vdda-phy-a-supply: true
> +
> +  vdda-phy-b-supply: true
> +
> +  vdda-phy-c-supply: true
> +
> +  vdda-phy-d-supply: true
> +
> +  vdda-pll-a-supply: true
> +
> +  vdda-pll-b-supply: true
> +
> +  vdda-pll-c-supply: true
> +
> +  vdda-pll-d-supply: true

I'm really surprised they aren't all connected to the same pair but oh well

Konrad
