Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF423C0A1A
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022637; cv=none; b=T7BLimnHxEIgitjKdBtjx4Im1kP/YxtFYMzsXuw4Cf5mFTCAzvOAs6XfuKqCEAlkdA8oPcE5cLzodyDX2TM/kzfoL+cYVHRfROf7Jz510lMHMZn7PoeEGIYVVG+j998D+maUKuMSSEXZB83eAmudi90tFV2ifj0w8IFIKNQmuaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022637; c=relaxed/simple;
	bh=Zivd6gSoAOCwGy45OtKp3BjY9cF07bK/qsFOsRTNLww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qm112x01B+c+gex4/b7o42rfu0gXxcyLjI8P8CLyosl7N4D1xC6W9Y7H32XtxYyonlvIQ6Cr4gcbZ5FaCqJaV6QXDvlbxEvi2UyLmbQ1/Tg1WccPo5nQczj0dtlz1BIwt5vNeMilGk5y0Z7BWL8Qz53zqnzUlJg7ATKgdQJGBYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ACGFonFl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F/0Zv+kr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ACGFonFl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F/0Zv+kr"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5GvlB810424
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qwJFrJ+jnQZB4v4JTITVBb6cPnXSqYDA0xswKuE2WOo=; b=ACGFonFlxqI/UPdG
	2wZz7bmj3uu0wlLTO2g6YQ6moQFZNDur89BThmT1Ja9PwtSPVi1079I8Lk2l29eo
	Nc0iDg5IyChwcwSZiqbCB3pvn6I9ZG2hQYdoh6pfsKZ3O9GQw/lHMmeiPobmnT0r
	9oREWQSMIEk5AWGsVKNk7jmdq4yTSOTFEOXTDVIj8l210931AHbIOyFrtDtucKM/
	++3p6xUUpgOK2xRZ0ET3ztNsewao3ZWdsSF+uYaarbvbp+ZpkLKj8NbXGjn7wiKt
	eBDS7clCFCIlJP4T7XJDCzGYfNVusUcbTI0eW4shwVLsxmPCEAepbhGMtYh2Eg7+
	U/4gRw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydjfab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:43:53 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c89704da8c7so8844124a12.0
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 23:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789022633; x=1789627433; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qwJFrJ+jnQZB4v4JTITVBb6cPnXSqYDA0xswKuE2WOo=;
        b=F/0Zv+krJALh2zdouek2Q2Jwk4cAOG57iMOYlaOb9nMj7wTOBG/tYQOZ7aJ3AXXxXL
         /QnxCDwbKwpgi7CY9hHeKl6fFvQYQbSdksW+KfgqEy7Pmd1rSiT/iBiVm4v3bkrbfcfA
         Lih/fKZi/LCGhsoCR/eaUatjuPx0NzLb+ZBsvKTHSYX/FdGs3CyCIPZRYeQbgRgp4Jm1
         UhlUFumJjUnBUp1GLTQtr708E2uvR9/mBQO3BE+45qTSCtAdCAOd3vpNFSHW1g7FDjze
         Tkm5d1v8peQGzukGfzhk4yJS6f36HI/XoLpQ5Fv2NA5sBjdzjjf4VCzkjU3gm9TbulT8
         9YIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022633; x=1789627433;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qwJFrJ+jnQZB4v4JTITVBb6cPnXSqYDA0xswKuE2WOo=;
        b=JhWlcTmgIFC0WRXT0AveqWMpRgPJuN3udRfFJS4NsQ9khqpUY7JdPaKPxLzz3SRgOt
         h2lgenqqUEO8tF2tOcqV52oIoGMGBbsUZWKvj0sgZ694CVDOC46DKESfbepus+KkmTy+
         Prk9IEQrn20/FtIOgqszCMRUreZwlH+ZN2738bRWiTnOE95IWk+VowZJU59Tm2lECbLP
         ndbc24bLB5fMtCWZVa8fWd2p3WQYfdyaGnwklAUBg2QloL4dyhry8Jt07kDcX5tkfdwa
         ULVeEIaJTNIgGCnL/Ir31Ome2cvwFT51ANUI3mwEmg+HVk2vUlC5gip0c6HgywJBgnTS
         vM2g==
X-Forwarded-Encrypted: i=1; AKwUvBzI6qNMx3LsMVowIsoCw66CVZ4jvv0zl3XG4lC49vOpotWBBJay6wfGozRf4hZY3jswxete2ZnfWJ2v@vger.kernel.org
X-Gm-Message-State: AFuF++k7yEHkfg61kjdvYmWGETX939GXnaId+1gpY36HAUBJ36VWJtY4
	lVnjZE/4OyW4rmrAStq47EyH46NSnifImdxN4dy3n5csn8Eihf8gqa7Z8xoOn2EwvkC8/2Pqox0
	jcJAPHzbaDlIMsmzGVZDxqffkynxIA07Hz2F501vJu65mS5rMi2Kg4uOrG+GHgirF
X-Gm-Gg: AYBFou1/xSUhWLqGRuxFZDD8Ds6MgjGGfU9c3mAJVxX0R9hz1197owdnwOXfZrM4S4N
	dL6ik+M4VPdJB28G6vm8bgx8yWvRVCMJfzu2UzF+SSpDxU5b+wsVlKAGVDN86YA0jYeX8GvAxwE
	tDbKaMqx57qImM5RU4UNBUCFTdsgBwnKyxCGhFF2eCVC1FaUOvKddTaqSeo8bmRincohIAk9EZv
	WyYoM8r7FAxRlIHBw/SGKjYFudEeIq6YhFTt6+JtG1FW0aWBTQm4GKXfbBwN9wBC6Cfsn4PLyq7
	mcYKkCVG0Y0ba1gxe5R0C91KGaZKBgCOLsz+VHrc+AKypq2i+t0LvTlbXICJCDVs+0WRpl3jmDs
	3Sn6uCgmkHBos5lRiT1g3KBbt4hkwF/K5de56tVUgAAw=
X-Received: by 2002:a05:6a20:72a0:b0:3d3:aec2:4dcc with SMTP id adf61e73a8af0-3dacbf28ae3mr8197980637.24.1789022633274;
        Wed, 09 Sep 2026 23:43:53 -0700 (PDT)
X-Received: by 2002:a05:6a20:72a0:b0:3d3:aec2:4dcc with SMTP id adf61e73a8af0-3dacbf28ae3mr8197918637.24.1789022632708;
        Wed, 09 Sep 2026 23:43:52 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339ac24d7esm77752519eec.15.2026.09.09.23.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:43:52 -0700 (PDT)
Date: Thu, 10 Sep 2026 14:43:45 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: phy: qcom: add Nord QMP PCIe PHY
 binding
Message-ID: <aqJRob8DsjOeEiPJ@QCOM-aGQu4IUr3Y>
References: <20260909-nord-v3-0-b0a82721c547@oss.qualcomm.com>
 <20260909-nord-v3-1-b0a82721c547@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260909-nord-v3-1-b0a82721c547@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA3MCBTYWx0ZWRfXxQjbaJ9pfVcd
 ZWtACfdzE3iQWXoQZ6oRLs97cH7+HQbB8jAQ3d5DGe0sel8nQOs49IYA0qrhxETb2ts1wHGHbm8
 DhHbPHH3Y9tl+LepZR+HPImMAlf7cJE=
X-Authority-Analysis: v=2.4 cv=UJNIjyfy c=1 sm=1 tr=0 ts=6aa251a9 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=Tb11Ti1d2fZyuSkRe-0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: gKtQ8LAB0QSm1E3fgerCUNQqzCgxs7wE
X-Proofpoint-ORIG-GUID: gKtQ8LAB0QSm1E3fgerCUNQqzCgxs7wE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA3MCBTYWx0ZWRfX9sgChHs/Qp1Y
 AZN+iVHuBdxMDISaRe7OQcDFZTy3jXIQpzj5+xc7pnhhAQ4WFPO4FW1/Z/EYumZIeuhIOBv8KZz
 3CDhQUj5/htNEyNnDwTYYI68wU0Djndcw1E8pXP1jnqIl4B9L4QPJ5iHa3gTaqMMvKgZTZQg85q
 qtE3h1PFjigmybeY3G9ErORIUgZX503WmfAqAakBXGF3yFaD4vXAdsLFr+u5/hOAAEPNnpl6C7m
 hUOeBMNIyIFZ0upUaVvb8mSSyE+DkWww73bavhO/fTtqnLXc69kWCTOLymkWo3u3xkNHhjRneIs
 /XkwfHdp1Iw1NONga6sbK6KfVM+FxdCoVHN1znFf/2WORHfffjHhhS0EsEMGDh/Yox6ag+pxqB+
 jV80ImfXxBMHrwiKyq/6pY1m1xwLRSqKg75PFqCm0ldPXPgY7axvgihPY8GX00sRt365UL35FTc
 GxoxW0Nl57JSfoZ+VLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100070

On Wed, Sep 09, 2026 at 05:18:16PM +0530, Krishna Chaitanya Chundru wrote:
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
>  .../phy/qcom,nord-qmp-gen5x16-pcie-phy.yaml        | 272 +++++++++++++++++++++
>  1 file changed, 272 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,nord-qmp-gen5x16-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,nord-qmp-gen5x16-pcie-phy.yaml
> new file mode 100644
> index 000000000000..624ad7e7d13e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,nord-qmp-gen5x16-pcie-phy.yaml
> @@ -0,0 +1,272 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/qcom,nord-qmp-gen5x16-pcie-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Nord QMP Quadfurcated PCIe multiple link-mode PHY
> +
> +maintainers:
> +  - Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> +
> +description: |

Can we drop "|" like below?

@@ -9,7 +9,7 @@ title: Qualcomm Nord QMP Quadfurcated PCIe multiple link-mode PHY
 maintainers:
   - Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

-description: |
+description:
   The Qualcomm Nord PCIe PHY is a Gen5-capable QMP PCIe PHY composed
   of four PHY ports (A/B/C/D). The ports can be combined to support
   multiple lane topologies, including x16, x8+x8, x8+x4+x4 and
@@ -101,7 +101,7 @@ properties:
   vdda-pll-d-supply: true

   qcom,link-mode:
-    description: |
+    description:
       Reference to the TCSR syscon and the offset of the
       TCSR_PCIE_LINK_CONFIG_MODE register.
         0 (QMP_PCIE_NORD_MODE_X16)        — all ports ganged as x16
@@ -129,8 +129,8 @@ properties:

   "#phy-cells":
     const: 1
-    description: |
-      Selects the PHY instance by index:
+    description:
+      Selects the PHY instance by index.
         0 — port A (up to Gen5 x8; anchor in x16 mode)
         1 — port B (up to Gen5 x4)
         2 — port C (up to Gen5 x2)

Shawn
