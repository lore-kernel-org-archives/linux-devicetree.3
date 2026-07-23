Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D1A4D90D7
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 13:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784813390; cv=none; b=POpS4Skor8Mfa+5e6HCUsuskFrCv7hhrFoxAYiXstjv3ovc4mdbbCLpXAPhG4yUioSGgV5Ga8Y0DpXM6nqVJA6gqN2Ho39nAYWB4QHFNmbKndnqbnE0CimFMGYrbbar2uAN59UwvpfkbgyRh9f1ITInarIBPIi/KxleKRe7IFNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784813390; c=relaxed/simple;
	bh=DaWsVkJ3awyrZrnhrEFVQNR4yn47hfNiP48v2HHghoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hN8VkVI/6MtBqJn2GIu4lLRdUoMQhk4giphl4bb0laTA+z8L9d+f4MdkKdpNFfOOQITQ7d/IrNaLiYuYRMUde+yyWtaRIk0p+BZXep31yu9RdfwkLEf+7u1Ur9q7Lt5Gf6NV1K5lmeNuIUwqLfXdcVIGHSNBbPSK0Cm2m1lVx34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PLonQaDP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KD5wNLol; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PLonQaDP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KD5wNLol"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvpjX1031498
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 13:29:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3DKkULAqfE9sv2cn1EdH2BQHdzTkgHrOTIebJ0Fk7uU=; b=PLonQaDPZDbsnZro
	0Yz7WifPpB2a5rx33qT8Cf29bClM+hCt8aILodORo+/hxyXfbgUyftMPWQgFkpNa
	jLgX3Jrrq0kvL1IsFgrT9OXj9PFwQgizUUUG478GGFt2ubO22ZdpKizr9C2K8LkS
	nzfdF6M9nRy9vDrM+0CHw09vqULKaRMw27kgKXJ3r1y8pHdYfcCC5gBARaBiseyM
	qS+fcijSSLqDYjGqp493K3QyL1WcDCckLei2EvkSrn8zuI6K3jgVXW9/yErLLV4k
	RtKo8J8q13o1jxqr4jDBDU3FrS8fNDsRbCdw4cthrCOx+D/eYR1+qDtaLjrpCnFU
	t3nYYQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk28xv9u6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 13:29:47 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e0234967aso595775b3a.3
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 06:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784813386; x=1785418186; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3DKkULAqfE9sv2cn1EdH2BQHdzTkgHrOTIebJ0Fk7uU=;
        b=KD5wNLolOhNfd5B/Xy+XsxDIe2DkBv3hPv4YiCPuRmU41aP2S4xaVpmh30RHVh9dLY
         smDY6suyaB4P3VGwwE4KFqzZO4iCF12SweI9jP1duj2Ej4rQvJDIjFPyvsAVWmGKG14H
         xG7Ccsvc2LumNA/PIi4NyookmSY6LSsObsFwJor5oHmCnNgnlqdVzwgHoME3Br5deZh+
         3bTm5XbbOzt2a3uTE22DhVMM34N5HShzj++4sFjtgU8Sui4DmtWbjONjKhk91cKIkQ0J
         vQ8lK9CcowvENq9BXAr+VW9EwOdEVjeRiFJNH914XqZ5yd/Lz7Hh/TifSnQ/Gi4goPty
         5PEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784813386; x=1785418186;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3DKkULAqfE9sv2cn1EdH2BQHdzTkgHrOTIebJ0Fk7uU=;
        b=OnVmSwQq/j8xzp7KgGquVbTEivgg5prRjdXyr5Q0GOi/QWcmODAR1GBTpkpaIQEJ9b
         aBdiPlqC7PmmiYWkJ0JZrfgOVTK2vyDvJ+zEDAXDmhY4M1wke51BABkovK00+cdh59UY
         9rech0UAo8qALLOr0rW+AEOJX5Mk6l2U5NZYWfaIsUZKAdkozyV+Hm9P5/tdWkJXxCBX
         XrkwwX+ATRdROnmF8muhNV0C1l+/IQbmP8ORCAtWcXVHW4YeLQnJqcWFA1zIPZPBUH8V
         j8P1ay1q+1wuJU5YOdAiXifCVEiZUhSMzOuXI3LsvI1gK8TLTsKXqTejbCdENjsrj1Bn
         QXTA==
X-Forwarded-Encrypted: i=1; AHgh+RoB2SrQKYgoowy1oUaligmf0e3r07pyIgZg/x1ha/GAKTOV8CcTckya4JtJyDNQYc+Yw7hTlv2f+Jaq@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2DU9L68gYFARWeQjZFi/eEHeDCV9QQSdGexaTY9ceHYpLArEC
	KlPfktbQkNEZPAOT0JYTruY8CxZnZ7egFmdLx5qcTFhUOEC++2Ep1kVp5vxeurB3L7Dj4uV1/uA
	4OKJLuz7/YV9tg3A8lI4WSqLSSNKUAcT0jwOU11dvTAWaltOX7nNJP/USiVEq/pxI
X-Gm-Gg: AR+sD12dE3RA5YauRfWGh5L8cq1fwiu8XlFzprz08UfzEctdaq17ohefd4UsxZi/Vkn
	6ki7Ow25GdnBK5V85Eu3OkubkC96eSitqYaGEdRXzIvqZOOOgkTWLJlyF7yIjufDLiGQWCft+Ww
	nu1yK3I/g6vFkeEpu0x80K4fnIYKsXk1+vcPNE1Gii6Jf1npIJ8ep/1gCJufQkOtDrrXsanzejS
	d29lMlZ7EAFKhWDjN14ltuqldvhtZET6YM12WAUtUcNr/zpaXHf5R1YV0EYTrBq9c+8PyQnOpdn
	9X+JRJSr+Lxyeu3HCO5/0CrBblZxFuFTrgNTy38JEIJ5Dyc4u0M5GZXIUQiEDMbkXzYSsFeJ1hZ
	1LD/uSL0m7QGlQwWFpkcE7QadMB4Y6P+/WLxDDvbtznv3XYprdQw=
X-Received: by 2002:a05:6a00:951b:b0:848:2f74:d8da with SMTP id d2e1a72fcca58-84e2bc54262mr3396929b3a.75.1784813386215;
        Thu, 23 Jul 2026 06:29:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:951b:b0:848:2f74:d8da with SMTP id d2e1a72fcca58-84e2bc54262mr3396893b3a.75.1784813385612;
        Thu, 23 Jul 2026 06:29:45 -0700 (PDT)
Received: from QCOM-IvKeorbwK5.na.qualcomm.com ([120.56.203.212])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17602046sm3048985b3a.59.2026.07.23.06.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 06:29:44 -0700 (PDT)
Date: Thu, 23 Jul 2026 15:29:38 +0200
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/6] arm64: dts: qcom: glymur: Wire PCIe3a/3b to
 shared Gen5x8 PHY
Message-ID: <brvx4kljlynbhr5xajubjy7prndcb6dii2ucrtxgmwkh6igjgs@yel4qrtfcu5w>
References: <20260722-glymur_linkmode_0722-v6-0-bba8156b8cbb@oss.qualcomm.com>
 <20260722-glymur_linkmode_0722-v6-3-bba8156b8cbb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260722-glymur_linkmode_0722-v6-3-bba8156b8cbb@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: A50ole9E6BtaNQ4ac18jHlvKc708sXJI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEzMiBTYWx0ZWRfX+K1ycZpNRoFw
 G98P9YUfT0IB/UaSaFxZhUNYYiKGiWudEUjuzSYzyLBeuQfP9fX1cfSpg8iXbUp2H2UbZ8VzdtL
 bZisIwMKpqCIEtP7FkS8NBRlWPeaYhM=
X-Proofpoint-GUID: A50ole9E6BtaNQ4ac18jHlvKc708sXJI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEzMiBTYWx0ZWRfX/lQAoZF//N31
 ilzTpknEZMlOGOAnoOvt+XjIThZcqvB6pfv+sCAvfjU/NxFpUl3jxDwaZf7gb+qAluPmxu8Fe8c
 H/+lmrkgJS14q0msyj7vCF+Z0zKalizuFOO6lWNIWucXOPovPJ8TozynY5vRlUeBvy/TV+1YZ2l
 aLhh5P8875SvbojDi9vTO4lecw8uhOSq6MaBTBIJD/g2G3Zc8jzAh2JwiZgWlBUif894jrfKdbv
 U2ZGfx78WclVCUG6J9j5+KpOou+yTODDYqdPXrtbqzE6iCOCDWOZV4CXr28+JEXjXgSmy7ZSpDW
 Q21C4M/iKCtF6+fCA1sWkNGr7B31a1N3WQ26+olaxkrGkZkxnfbXyWpwv1FLNIxG1SWqnziATrG
 vzgEHJ/HQOiKCDv1Ea/zMh/icp4xesCmcApBbxS3avwHDcE+FFmPrJ43i9BzdWpFQBqnp4UXGYa
 OnwaF4RDoLEGxBJNi8w==
X-Authority-Analysis: v=2.4 cv=WNxPmHsR c=1 sm=1 tr=0 ts=6a62174b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=vzTbXj32ivxf3WCeigViBw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=lUaueBADnf__lXNn8_8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230132

On Wed, Jul 22, 2026 at 07:30:20PM -0700, Qiang Yu wrote:
> Glymur's PCIe3a and PCIe3b controllers share a single Gen5x8 QMP PHY block
> that can be bifurcated into two independent x4 links, rather than each
> controller owning its own dedicated PHY.
> 

Both subject and description doesn't give an impression that this commit
basically adds PCIe PHY and Controller nodes. It goes deeply on the details of
the PHY wiring though...

> Add a pcie3_phy node describing the shared PHY block, add the missing
> PCIe3a controller node, and point both PCIe3a's and PCIe3b's port phys
> at &pcie3_phy (index 0 and 1 respectively) so each controller picks up
> its half of the bifurcated PHY. Update the GCC pipe clock parent array
> to reference the new PHY's clock outputs instead of the placeholders.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 336 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 334 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index f32af66a3f1c..6355499ee5e5 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -801,8 +801,8 @@ gcc: clock-controller@100000 {
>  				 <0>,				/* USB 2 Phy PCIE PIPEGMUX */
>  				 <0>,				/* USB 2 Phy PIPEGMUX */
>  				 <0>,				/* USB 2 Phy SYS PCIE PIPEGMUX */
> -				 <0>,				/* PCIe 3a */
> -				 <0>,				/* PCIe 3b */
> +				 <&pcie3_phy 0>,		/* PCIe 3a pipe */
> +				 <&pcie3_phy 1>,		/* PCIe 3b pipe */
>  				 <&pcie4_phy>,			/* PCIe 4 */
>  				 <&pcie5_phy>,			/* PCIe 5 */
>  				 <&pcie6_phy>,			/* PCIe 6 */
> @@ -2330,6 +2330,62 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
>  			};
>  		};
>  
> +		pcie3_phy: phy@f00000 {
> +			compatible = "qcom,glymur-qmp-gen5x8-pcie-phy";
> +			reg = <0x0 0x00f00000 0x0 0x10000>,
> +			      <0x0 0x00f10000 0x0 0x10000>;
> +			reg-names = "port_a",
> +				    "port_b";
> +
> +			clocks = <&gcc GCC_PCIE_PHY_3A_AUX_CLK>,
> +				 <&gcc GCC_PCIE_3A_CFG_AHB_CLK>,
> +				 <&tcsr TCSR_PCIE_3_CLKREF_EN>,
> +				 <&gcc GCC_PCIE_3A_PHY_RCHNG_CLK>,
> +				 <&gcc GCC_PCIE_3A_PIPE_CLK>,
> +				 <&gcc GCC_PCIE_PHY_3B_AUX_CLK>,
> +				 <&gcc GCC_PCIE_3B_CFG_AHB_CLK>,
> +				 <&gcc GCC_PCIE_3B_PHY_RCHNG_CLK>,
> +				 <&gcc GCC_PCIE_3B_PIPE_CLK>,
> +				 <&gcc GCC_PCIE_3B_PIPE_DIV2_CLK>;
> +			clock-names = "aux",
> +				      "cfg_ahb",
> +				      "ref",
> +				      "rchng",
> +				      "pipe",
> +				      "phy_b_aux",
> +				      "cfg_ahb_b",
> +				      "rchng_b",
> +				      "pipe_b",
> +				      "pipediv2_b";
> +
> +			resets = <&gcc GCC_PCIE_3A_PHY_BCR>,
> +				 <&gcc GCC_PCIE_3A_NOCSR_COM_PHY_BCR>,
> +				 <&gcc GCC_PCIE_3B_PHY_BCR>,
> +				 <&gcc GCC_PCIE_3B_NOCSR_COM_PHY_BCR>;
> +			reset-names = "port_a",
> +				      "port_a_nocsr",
> +				      "port_b",
> +				      "port_b_nocsr";
> +
> +			assigned-clocks = <&gcc GCC_PCIE_3A_PHY_RCHNG_CLK>,
> +					  <&gcc GCC_PCIE_3B_PHY_RCHNG_CLK>;
> +			assigned-clock-rates = <100000000>, <100000000>;
> +
> +			power-domains = <&gcc GCC_PCIE_3A_PHY_GDSC>,
> +					<&gcc GCC_PCIE_3B_PHY_GDSC>;
> +			power-domain-names = "port_a", "port_b";
> +
> +			qcom,link-mode = <&tcsr 0x5000>;
> +
> +			#clock-cells = <1>;
> +			clock-output-names = "pcie3a_pipe_clk",
> +					     "pcie3b_pipe_clk";
> +
> +			#phy-cells = <1>;
> +
> +			status = "disabled";
> +		};
> +
>  		usb_hs_phy: phy@fa0000 {
>  			compatible = "qcom,glymur-m31-eusb2-phy",
>  				     "qcom,sm8750-m31-eusb2-phy";
> @@ -3711,6 +3767,8 @@ pcie3b_port0: pcie@0 {
>  				reg = <0x0 0x0 0x0 0x0 0x0>;
>  				bus-range = <0x01 0xff>;
>  
> +				phys = <&pcie3_phy 1>;
> +
>  				#address-cells = <3>;
>  				#size-cells = <2>;
>  				ranges;
> @@ -3722,6 +3780,280 @@ pcie3b_port0_ep: endpoint {
>  			};
>  		};
>  
> +		pcie3a: pci@1c10000 {

pcie@

> +			device_type = "pci";
> +			compatible = "qcom,glymur-pcie", "qcom,pcie-x1e80100";
> +			reg = <0x0 0x01c10000 0x0 0x3000>,
> +			      <0x0 0x70000000 0x0 0xf20>,
> +			      <0x0 0x70000f40 0x0 0xa8>,
> +			      <0x0 0x70001000 0x0 0x4000>,
> +			      <0x0 0x70100000 0x0 0x100000>,
> +			      <0x0 0x01c13000 0x0 0x1000>;
> +			reg-names = "parf",
> +				    "dbi",
> +				    "elbi",
> +				    "atu",
> +				    "config",
> +				    "mhi";
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			ranges = <0x01000000 0x0 0x00000000 0x0 0x70200000 0x0 0x100000>,
> +				 <0x02000000 0x0 0x70000000 0x0 0x70300000 0x0 0x3d00000>,
> +				 <0x03000000 0x7 0x00000000 0x7 0x00000000 0x0 0x40000000>,
> +				 <0x43000000 0x70 0x00000000 0x70 0x00000000 0x10 0x00000000>;
> +
> +			bus-range = <0 0xff>;

0x00

> +
> +			dma-coherent;
> +
> +			linux,pci-domain = <3>;
> +			num-lanes = <8>;

Drop this property.

> +
> +			operating-points-v2 = <&pcie3a_opp_table>;
> +
> +			msi-map = <0x0 &gic_its 0xb0000 0x10000>;
> +			iommu-map = <0x0 &pcie_smmu 0x30000 0x10000>;
> +
> +			interrupts = <GIC_SPI 948 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 949 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 844 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 845 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 846 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 847 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 942 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "msi0",
> +					  "msi1",
> +					  "msi2",
> +					  "msi3",
> +					  "msi4",
> +					  "msi5",
> +					  "msi6",
> +					  "msi7",
> +					  "global";
> +
> +			#interrupt-cells = <1>;
> +			interrupt-map-mask = <0 0 0 0x7>;
> +			interrupt-map = <0 0 0 1 &intc 0 0 0 848 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 2 &intc 0 0 0 849 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 3 &intc 0 0 0 850 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 4 &intc 0 0 0 851 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			clocks = <&gcc GCC_PCIE_3A_AUX_CLK>,
> +				 <&gcc GCC_PCIE_3A_CFG_AHB_CLK>,
> +				 <&gcc GCC_PCIE_3A_MSTR_AXI_CLK>,
> +				 <&gcc GCC_PCIE_3A_SLV_AXI_CLK>,
> +				 <&gcc GCC_PCIE_3A_SLV_Q2A_AXI_CLK>,
> +				 <&gcc GCC_AGGRE_NOC_PCIE_3A_WEST_SF_AXI_CLK>;
> +			clock-names = "aux",
> +				      "cfg",
> +				      "bus_master",
> +				      "bus_slave",
> +				      "slave_q2a",
> +				      "noc_aggr";
> +
> +			assigned-clocks = <&gcc GCC_PCIE_3A_AUX_CLK>;
> +			assigned-clock-rates = <19200000>;
> +
> +			interconnects = <&pcie_west_anoc MASTER_PCIE_3A QCOM_ICC_TAG_ALWAYS
> +					&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +					&pcie_west_slv_noc SLAVE_PCIE_3A QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "pcie-mem",
> +					     "cpu-pcie";
> +
> +			resets = <&gcc GCC_PCIE_3A_BCR>,
> +				 <&gcc GCC_PCIE_3A_LINK_DOWN_BCR>;
> +			reset-names = "pci",
> +				      "link_down";
> +
> +			power-domains = <&gcc GCC_PCIE_3A_GDSC>;
> +
> +			eq-presets-8gts = /bits/ 16 <0x5555 0x5555 0x5555 0x5555
> +						     0x5555 0x5555 0x5555 0x5555>;
> +			eq-presets-16gts = /bits/ 8 <0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55>;
> +			eq-presets-32gts = /bits/ 8 <0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55>;
> +
> +			status = "disabled";
> +
> +			pcie3a_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				/* GEN 1 x1 */
> +				opp-2500000-1 {
> +					opp-hz = /bits/ 64 <2500000>;
> +					required-opps = <&rpmhpd_opp_low_svs>;
> +					opp-peak-kBps = <250000 1>;
> +					opp-level = <1>;
> +				};
> +
> +				/* GEN 1 x2 */
> +				opp-5000000-1 {
> +					opp-hz = /bits/ 64 <5000000>;
> +					required-opps = <&rpmhpd_opp_low_svs>;
> +					opp-peak-kBps = <500000 1>;
> +					opp-level = <1>;
> +				};
> +
> +				/* GEN 1 x4 */
> +				opp-10000000-1 {
> +					opp-hz = /bits/ 64 <10000000>;
> +					required-opps = <&rpmhpd_opp_low_svs>;
> +					opp-peak-kBps = <1000000 1>;
> +					opp-level = <1>;
> +				};
> +
> +				/* GEN 1 x8 */
> +				opp-20000000-1 {
> +					opp-hz = /bits/ 64 <20000000>;
> +					required-opps = <&rpmhpd_opp_low_svs>;
> +					opp-peak-kBps = <2000000 1>;
> +					opp-level = <1>;
> +				};
> +
> +				/* GEN 2 x1 */
> +				opp-5000000-2 {
> +					opp-hz = /bits/ 64 <5000000>;
> +					required-opps = <&rpmhpd_opp_low_svs>;
> +					opp-peak-kBps = <500000 1>;
> +					opp-level = <2>;
> +				};
> +
> +				/* GEN 2 x2 */
> +				opp-10000000-2 {
> +					opp-hz = /bits/ 64 <10000000>;
> +					required-opps = <&rpmhpd_opp_low_svs>;
> +					opp-peak-kBps = <1000000 1>;
> +					opp-level = <2>;
> +				};
> +
> +				/* GEN 2 x4 */
> +				opp-20000000-2 {
> +					opp-hz = /bits/ 64 <20000000>;
> +					required-opps = <&rpmhpd_opp_low_svs>;
> +					opp-peak-kBps = <2000000 1>;
> +					opp-level = <2>;
> +				};
> +
> +				/* GEN 2 x8 */
> +				opp-40000000-2 {
> +					opp-hz = /bits/ 64 <40000000>;
> +					required-opps = <&rpmhpd_opp_low_svs>;
> +					opp-peak-kBps = <4000000 1>;
> +					opp-level = <2>;
> +				};
> +
> +				/* GEN 3 x1 */
> +				opp-8000000-3 {
> +					opp-hz = /bits/ 64 <8000000>;
> +					required-opps = <&rpmhpd_opp_low_svs>;
> +					opp-peak-kBps = <984500 1>;
> +					opp-level = <3>;
> +				};
> +
> +				/* GEN 3 x2 */
> +				opp-16000000-3 {
> +					opp-hz = /bits/ 64 <16000000>;
> +					required-opps = <&rpmhpd_opp_low_svs>;
> +					opp-peak-kBps = <1969000 1>;
> +					opp-level = <3>;
> +				};
> +
> +				/* GEN 3 x4 */
> +				opp-32000000-3 {
> +					opp-hz = /bits/ 64 <32000000>;
> +					required-opps = <&rpmhpd_opp_low_svs>;
> +					opp-peak-kBps = <3938000 1>;
> +					opp-level = <3>;
> +				};
> +
> +				/* GEN 3 x8 */
> +				opp-64000000-3 {
> +					opp-hz = /bits/ 64 <64000000>;
> +					required-opps = <&rpmhpd_opp_low_svs>;
> +					opp-peak-kBps = <7876000 1>;
> +					opp-level = <3>;
> +				};
> +
> +				/* GEN 4 x1 */
> +				opp-16000000-4 {
> +					opp-hz = /bits/ 64 <16000000>;
> +					required-opps = <&rpmhpd_opp_svs>;
> +					opp-peak-kBps = <1969000 1>;
> +					opp-level = <4>;
> +				};
> +
> +				/* GEN 4 x2 */
> +				opp-32000000-4 {
> +					opp-hz = /bits/ 64 <32000000>;
> +					required-opps = <&rpmhpd_opp_svs>;
> +					opp-peak-kBps = <3938000 1>;
> +					opp-level = <4>;
> +				};
> +
> +				/* GEN 4 x4 */
> +				opp-64000000-4 {
> +					opp-hz = /bits/ 64 <64000000>;
> +					required-opps = <&rpmhpd_opp_svs>;
> +					opp-peak-kBps = <7876000 1>;
> +					opp-level = <4>;
> +				};
> +
> +				/* GEN 4 x8 */
> +				opp-128000000-4 {
> +					opp-hz = /bits/ 64 <128000000>;
> +					required-opps = <&rpmhpd_opp_svs>;
> +					opp-peak-kBps = <15753000 1>;
> +					opp-level = <4>;
> +				};
> +
> +				/* GEN 5 x1 */
> +				opp-32000000-5 {
> +					opp-hz = /bits/ 64 <32000000>;
> +					required-opps = <&rpmhpd_opp_nom>;
> +					opp-peak-kBps = <3938000 1>;
> +					opp-level = <5>;
> +				};
> +
> +				/* GEN 5 x2 */
> +				opp-64000000-5 {
> +					opp-hz = /bits/ 64 <64000000>;
> +					required-opps = <&rpmhpd_opp_nom>;
> +					opp-peak-kBps = <7876000 1>;
> +					opp-level = <5>;
> +				};
> +
> +				/* GEN 5 x4 */
> +				opp-128000000-5 {
> +					opp-hz = /bits/ 64 <128000000>;
> +					required-opps = <&rpmhpd_opp_nom>;
> +					opp-peak-kBps = <15753000 1>;
> +					opp-level = <5>;
> +				};
> +
> +				/* GEN 5 x8 */
> +				opp-256000000-5 {
> +					opp-hz = /bits/ 64 <256000000>;
> +					required-opps = <&rpmhpd_opp_nom>;
> +					opp-peak-kBps = <31506000 1>;
> +					opp-level = <5>;
> +				};
> +			};
> +
> +			pcie3a_port0: pcie@0 {

Add pciclass compatible.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
