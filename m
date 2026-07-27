Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7113541A90B
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 13:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785160620; cv=none; b=qmc7LVP7/3hHw+jqP0Vsh8s19CeJjMjLyx5AwnwCZrS91vrkZtRD1aoTH11ONtAjAdbLGFE6oPmPd+O1DBryQXhE+yRXEmh7GHdRuAROd86RFhH5jJu4gTck/24KFJFexlcMl7AUvJcSSYfOtpVLfGSc2zY+gW6H/ZX0lJS8KLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785160620; c=relaxed/simple;
	bh=xzXkFRDFuYfIzShYV5bmDpRoDjvVcGLQ/TWibmFcswk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r0bZ4TXshjYjE1oY8mNSE3/sbcu/dMlTErOhf0F3ebK9wHv4ekl0wtJAJjeMPdFoAX8lqICz9XoddRwq8Ny8WeIMBVZDNNl7ghVrXkB4MziHYFqnWDqfjTkNflVzbKg5SgIXh/Wgwk2RcDbwcfSFMmKmIa3+pupjVvgLzNuGLt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TIsR+fhk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hzEvlSvg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TIsR+fhk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hzEvlSvg"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlckh3414087
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 13:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a2ecVVAzl7ah2+cxH73covTRhLHYFzycBQkVNDKcsK8=; b=TIsR+fhkLAqn97fF
	3IecO4D/HO3BvQd3p5sWczqTPYJ0GyVe+92uT6DGlSZFywt498eYslrWKqaJ9XNw
	UF1UVEjOPO3sDeAo0Viy8gXN847l1k6IRL6k+UNvBcO52KOHNK520w6PxM4bLaGZ
	rlSQYjo5uvOa7s4aB/+g0Hn/ufgqm8DFFwxGLD4hiu68PYpHzVWoI4Pqa0VP0GOA
	t17ZMFdNWnqwaygULCK2n6sPWNZXeEOl/qRggYUVlbcu4D/HK+clXMNlcNUGR9b9
	Gt6EDyICndO2DivW14Lg9oinuy4h8u0f3G3jqaBaR3BtZyKU0G/W5V83fG8h4LCG
	lrf0jQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4v68xf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 13:56:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfa45b280so3032291cf.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 06:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785160617; x=1785765417; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a2ecVVAzl7ah2+cxH73covTRhLHYFzycBQkVNDKcsK8=;
        b=hzEvlSvgmsE9YCe2JqsT4WY4ruIQHLbdGsFCV0MxPBitJM0iowt66vODshz0k6Muq/
         5KXMic35g/Z6QlLhJ3iPDZikQZELqgtyK+NesxAuJJnZXSjPbuXbvfGM3KLattVi7IwY
         gAFGVSCn6dPXsY8V5EAXTVpeZi3dIdhaatv8N3/hyC3sQDqcIQDDghPBx+Zkf/ZwmERh
         wBND9aZUhFu9fdbV1GiDrbjfqsVrYXTNZ4kVqCf7DaRM4E8/k2/ZcBtR+ev0Nt9s9MNu
         WAI+HrYdzPA/zmnlGqDgMug04czb57KO3uqJcCgV1Kah16E6S4gUhVFvXPfAnGMZUmNC
         EMzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785160617; x=1785765417;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a2ecVVAzl7ah2+cxH73covTRhLHYFzycBQkVNDKcsK8=;
        b=srQI7ZNhDcFsBR+g4v+c/JOUyZg+L7EqN4G54soCeFl9MCs3i84nDY2PS9Bx+YRW6n
         GNJwMiO1OUmAqepJkyfOPVaAQdIlMlVjIvpstYVcTEn5+qfrKVarWgb+jpQrLyvjCQ+u
         zLI7ihoPypC6iOz7RUCBAtZRGCoTqcLiynGlm7WYKTq8TAi7B/JsR8PC+9ooen7Wfkl8
         Gpcqd2b3I12PJktf9MNx4DXG+VZLKdA3ShsglgAoL3KIUzOq9niBFzkIzzAGenEvhSO4
         IMYHznC6CUUj9Er1ADuZRoG58UQzvTZWhXHTMF/s41DM2lEjBKVyR8wpQ2uiRmjP4Ocs
         3Crw==
X-Forwarded-Encrypted: i=1; AHgh+Rq+0rW8DRGSF3h2FwDjFVgsVT/1Lc3uq5T56NRN7qmklTWJd5LlBjb/nUBZ55mkpQXchbok3HkzeHN/@vger.kernel.org
X-Gm-Message-State: AOJu0YxfVaBuUtyblPI7+QPVlVZWalTa+9PkqkqgrorQxuaaHd8Fm6pO
	gT1EHTmLmv8KiHXKnFzsJ2jL+fkS7n8qljWhYMniKFiZYJ6LHx8fo3Xhe73lQIgP1RizGdWNKj1
	ZsM2837591DqcMiEAO60gmkI7n7F4YRS2bk+fWKGyaKZsadc2d2XLkXyUNtXT94ho
X-Gm-Gg: AR+sD10jxpWb1WdSIUt2jsPh/e2oMm6AaUWjCYnRCa6bR6nr6wgJE79mAK8ueKU+gu9
	4qk5cZbFR1YYNa90Jd6O+w/L7KNfOIL584uGbaN6uPGZIRyiWOCxSWfvemRYKzH1cxjebYA2b6O
	iruXmRI7TrsmJWzBmeKNLsYqV5Uufql2BUJM80vNnskJH+yepv8JbfAiOO419AkR+Q3OfOHi8Pw
	CLuJOG61eIABXa9CTNtatouv8DNFo0O2VVPobbU5n/4gMOBFKjD9fJ0lWTbyRVp1EdtQqr/nEMZ
	Rk9iJ75PE+iS1EWPbvSjKF58XmeKYdkpRwrCFtaWP7McNnkSz5N2V3WWwn9BvaEvKu5AmNK71Cd
	PyjsfCo0A0kVWqU/PIB6wySSw
X-Received: by 2002:ac8:5981:0:b0:517:5d21:9899 with SMTP id d75a77b69052e-529a85f9b2emr122121661cf.5.1785160617506;
        Mon, 27 Jul 2026 06:56:57 -0700 (PDT)
X-Received: by 2002:ac8:5981:0:b0:517:5d21:9899 with SMTP id d75a77b69052e-529a85f9b2emr122120981cf.5.1785160616824;
        Mon, 27 Jul 2026 06:56:56 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb50bcfdcsm2876913a12.3.2026.07.27.06.56.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 06:56:56 -0700 (PDT)
Message-ID: <3b0166c0-e1e7-4746-bcb9-ef78b9a86c8c@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 15:56:53 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/6] phy: qcom: qmp-pcie: Add QMP PCIe Multi-PHY driver
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>
References: <20260724-glymur_linkmode_0724-v7-0-65c8469c6b65@oss.qualcomm.com>
 <20260724-glymur_linkmode_0724-v7-2-65c8469c6b65@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260724-glymur_linkmode_0724-v7-2-65c8469c6b65@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzMyBTYWx0ZWRfX7EOFyQEHyUGL
 sLDRN2U7EuYMKMGAi0Q/eJowa1oi5lV1h+kC5OqXjoW4rlERqsiR3Dm/JVdxr8DZ8K9WLSz/mEw
 AiNylixNjgIW8exty60/fzRntECnnZo=
X-Proofpoint-GUID: M7ig27mLVMGgjwafkSpaWm3VL11Ubcin
X-Authority-Analysis: v=2.4 cv=ev3vCIpX c=1 sm=1 tr=0 ts=6a6763aa cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fUhyWj0mt7oSvnhCvGYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: M7ig27mLVMGgjwafkSpaWm3VL11Ubcin
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzMyBTYWx0ZWRfX5YPjkGjgksuH
 DU3kkHYWMU/G97HZQe/q5DvnP4pYZTpKWeUG9s+AvWjWRMkHmMoUrsw+iNRykipWOUo9+ucCVgY
 0s+rVz7j+giXcsGWIKeGU9lLmzkdiIQ5Q9PFkdpJeEMTxrpH7AE5AqMtCML4oB0LVknLRxrUxEW
 fmpquXPXuQWg/XKAdWDtKAWxrq3a0rBWlFn38OctwGAtjDM5xP13HZj9wl5O3J3xWj6GPm4QGkI
 dml5I0NHsBM+hMoH6tYW1R/ZwtRt4ndjaJqdV6vYREqMEh5V0xHGeV9d+jLZ1NKGXP3F3Fz5+Cw
 TykoWqZQDkYQODF7MyBJb08hszsAt3S5u460fKMpc2dPh2opAAqcT0XCFjemiij5jzIKiQJHfp6
 h3d6Jb1oD3tDXo+XzUVs5CwCTpaDVy3ff26dyjmvOl3B6JjQRIwLHnWPUKyuR5d8sQ38hDoUzr0
 yTszt44GHNTCN1z4flg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270133

On 7/24/26 12:01 PM, Qiang Yu wrote:
> Some QMP PCIe PHY hardware blocks support multiple link topologies (e.g.
> x8 or x4+x4) selected via a TCSR register. The existing single-instance
> QMP PCIe PHY driver has no way to model this: it assumes a single cfg per
> DT node and instantiates exactly one PHY.
> 
> Add a dedicated driver for this class of PHY. Match data carries a
> per-mode cfg table; qmp_pcie_multiphy_probe() reads the current link
> mode from the TCSR register pointed to by "qcom,link-mode", looks up the
> corresponding cfg array, and instantiates one qmp_pcie per sub-PHY
> required by that link mode, registering the clock and #phy-cells = <1> phy
> providers so consumers can address individual sub-PHYs by index.
> 
> The driver inherits the phy setting and link-mode programmed by firmware,
> so only the no_csr reset is used and no phy setting tables are provided.
> 
> Add the first match data and compatible, qcom,glymur-qmp-gen5x8-pcie-phy,
> for the Glymur Gen5 PCIe PHY that can bifurcate into two x4 links or
> operate as a single x8 link.
> 
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

This looks really good, couple of follow-up improvement suggestions

[...]

> +static const char * const glymur_pciephy_a_reg_l[] = {
> +	"port_a",
> +};
> +
> +static const char * const glymur_pciephy_b_reg_l[] = {
> +	"port_b",
> +};
> +
> +static const char * const glymur_pciephy_reg_l[] = {
> +	"port_a", "port_b",
> +};

I think we could construct these names at the call sites, with
essentially something like

for (i = 0; i < qmp->num_ports; i++) {
	sprintf(buf, "port_%c\n", 'a' + i);
}

(is that too cheesy?)

[...]

> +err_power_off:
> +	while (--i >= 0)
> +		pm_runtime_put(qmp->pd_devs[i]);

This probably can stay non-sync

> +
> +	return ret;
> +}
> +
> +static void qmp_pcie_pd_power_off(struct qmp_pcie *qmp)
> +{
> +	const struct qmp_phy_cfg *cfg = qmp->cfg;
> +	int i;
> +
> +	for (i = cfg->num_pds - 1; i >= 0; i--)
> +		pm_runtime_put(qmp->pd_devs[i]);

This should probably be _sync() as phy init/exit may be called in
quick succession

[...]

> +static int __phy_pipe_clk_register(struct device *dev, struct device_node *np,
> +				   int idx, struct clk_fixed_rate *fixed)
> +{
> +	struct clk_init_data init = { };
> +	int ret;
> +
> +	ret = of_property_read_string_index(np, "clock-output-names", idx,
> +					    &init.name);
> +	if (ret) {
> +		dev_err(dev, "%pOFn: No clock-output-names\n", np);
> +		return ret;
> +	}
> +
> +	init.ops = &clk_fixed_rate_ops;
> +
> +	if (!fixed->fixed_rate)
> +		fixed->fixed_rate = 125000000;

I think this always happens to be true in this driver

[...]

> +	num_pipe_outputs = of_property_count_strings(np, "clock-output-names");
> +	if (num_pipe_outputs < 0)
> +		num_pipe_outputs = 1;

This can't happen (clock-output-names is required via bindings)

[...]

> +static int qmp_pcie_read_link_mode(struct device *dev, unsigned int *link_mode)
> +{
> +	struct regmap *map;
> +	unsigned int args[1];
> +	int ret;
> +
> +	map = syscon_regmap_lookup_by_phandle_args(dev->of_node, "qcom,link-mode",
> +						   ARRAY_SIZE(args), args);
> +	if (IS_ERR(map))
> +		return PTR_ERR(map);
> +
> +	ret = regmap_read(map, args[0], link_mode);
> +	if (ret)
> +		return ret;
> +
> +	return 0;

ret = xxx()
if (ret)
	return ret;

return 0;

can be collapsed to simply return regmap_read()

with or without all that,

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

