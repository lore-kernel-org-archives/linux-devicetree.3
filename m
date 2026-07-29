Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD634218845
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 13:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785332722; cv=none; b=QQhL145cZc0+GsZIEPhndk9fsCdbWzPFLtgBPXE5FPziTtKPYN2Il27HrvI9hsLoiuodju51JByv1+BWY49WcNm+orl96Z8nYEsHbpqIoqB/LJK8MOt/pcFTx+v2QS2nXPIFazZPyLcxKwc+48+ZWfE0DJD2hBOHDzLdK5dy41s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785332722; c=relaxed/simple;
	bh=aLlpV6t1zUrIJXq93n7TQwUvzIKqfBHfaGiWiea1PHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=doHFRrvyJ3SZ018580+Ei3GT//yw1IAW+vh+qFrKbdF1USoFvEmIDNhb9/19gsbIPdsQCjPlJ1sT/YFszSoIkXbUPLkTK9jVJoGR1ACtTPMYgPWjbd/Np2bUWdaBIZnCoFjkV6NE07b9h7W06Dm5vAdyOxdo0Lqn9J2J6mvuSgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SkMjFX7Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z27HU7ax; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SkMjFX7Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z27HU7ax"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TD7xVC1429979
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 13:45:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ydcBBOmJWDiikEfEAdfgcfIh4T+Y3DWrvF1t3+oEgx0=; b=SkMjFX7QSmh3eR9a
	cVUz9S2hdrPG/3kUpnSySfrAjRvzB7vxvI5i52QEJ6wrM4I9hJ3sUesSsJF/qyPU
	t2vEWPFcO95GERsx1RipFiAqO+yIiSue94r12WhcdmSSYlKrZ0vm5rsMDW//Z2ek
	78ZV5qQyvDc7Ft5FoaJ1XK2w1nT2+BPixiDwFpnWf7vicKwl/5tTxZ/mrhiBK707
	Z3iuORni3bZti4S/r4A9nnciL4KZXH04BjprvOFrnWQOluEFCNP1Cis3wDROX2Fs
	UToQJgqC4K+bJafEXsjX8x4iNBePsEdLFBL0ikOlwv8CfkZOWStKCtPK7EecUzce
	LYdVlA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgrj0h1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 13:45:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c21c01cf3so17039251cf.2
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 06:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785332719; x=1785937519; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ydcBBOmJWDiikEfEAdfgcfIh4T+Y3DWrvF1t3+oEgx0=;
        b=Z27HU7ax1fEhsUxnDIVr4vN7dYoNcMnRTuwgHZWpNiE8zKm9e1pSXhARyF+Le0liER
         eaY3RR7mlVeSNM1af6W7nxHlwOZHLwrIhZeAotkiU740CLv9+WVHkL/2cvbwHD35fhNu
         Xbrru/s+Ss4y3xOyzk3sWiRTngGqTI3SXXZGHUJBnOp3sehENYzcdiSsLOr5vK9hStQj
         1hQjWU7LpkDwE7HJ3sZl/jXARlH2AU6+oKaNXOaO/sQOmu10jTWTFvY9FV83M+kZ7dpi
         E7YqwKJ9/ekpXdLXrjAEI+Vos9S9KUKsDouOVRL65W0+LdfDhpqqIDxhnJxcnxRFu4yA
         gICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785332719; x=1785937519;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ydcBBOmJWDiikEfEAdfgcfIh4T+Y3DWrvF1t3+oEgx0=;
        b=N69mPlPKVwckWRo/2N+Kq0oiO/ViO/002Jj7xQOZPWo6PGN6tpG+GJTYGXVrwgrx2j
         c+0OA0/1rDVEL5JyjB0obH7KEVXiYjhFFqCgaU9hWhUdCInWTZokooDyLxAqDhSQvuNt
         +haBfEEqSWk1VYj3PvJ/A46EGgcC06IUa3ksaZxkIssNgGgsQm2Bg8UkWMc90ho7QFVM
         rJq3i5OhzmVjmZrrfGsREoIBSFtYplvZ+ixe629MgBc9tXyxUq06eQ6KDpKOKv6kvgWV
         4CMd6gzNFI7M06jwixoMhM4h220HNNZfJhSP+nu4CjCQrAsk1yJ9PcHxhrhlcAYYJ7IO
         E7Kg==
X-Forwarded-Encrypted: i=1; AHgh+RpkpCgu+4Gins0FmeMWaZtQ28FJB4ynKk8izO0bYqY2jN+2YfYWkakhirwrVenhfnIbDnJz15/jzrmR@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+VapdkcfEZqvhR3t2zn+GeeUaVd76riw6U9LyGZXndXpDffVy
	o3gAokbogNR9O/4zkTIPKY2ZhyJLsUHndXpCT1mACGYQ5Ztc6obaz5q+ZCN9CnTYgmYsDDkYlit
	mHoH011TVXU5t5Hn05kpIqOXf+yj8mRm4+n0EHegkCOqtJ8RW/XjC7WkJRK9/I+Xw
X-Gm-Gg: AR+sD12hUOVUftiE5kAVgNdyUzPEHD9XvxJ3gTUnY2vace3Up0xmOgwsKFpIBx0Wj5u
	hKnaohUTNv9iVRI1KoAR0VaXtSzuF8uqctJuVQdO9pRPIYTZ02oNCEmmjKMtknLja7QbtC2Bhzq
	4wRCkQs4K2jLv/VwOdsb74kn28+irvT7Np405VAtCNQn6mRNKMhMd3L8v132mUK2Baz4xBiItgE
	3W/RSp++6vxV78Ny4qZRGMZUPxh1wnaxF1dmc61H7wEJrW4sJZP9ZBBsOvG7zHv7ngI+AoxH2qc
	yw/mkSDDCv+jXa/wBBPGIoFep3FRgiOiCisQC7uQLKKzPCDr6o3MQdS8pG4ZrK9xri27RXY+qkV
	zQGG2iArX2Oz7uq7BxSQ75KqklIqL/A==
X-Received: by 2002:a05:622a:4d0b:b0:51c:2190:3b47 with SMTP id d75a77b69052e-529d7055631mr56220891cf.2.1785332718720;
        Wed, 29 Jul 2026 06:45:18 -0700 (PDT)
X-Received: by 2002:a05:622a:4d0b:b0:51c:2190:3b47 with SMTP id d75a77b69052e-529d7055631mr56219441cf.2.1785332717485;
        Wed, 29 Jul 2026 06:45:17 -0700 (PDT)
Received: from [10.206.103.106] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529e2b649b9sm19150541cf.11.2026.07.29.06.45.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 06:45:17 -0700 (PDT)
Message-ID: <8210513c-288b-4d02-9688-1de10e40d9f9@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 19:15:07 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/5] media: qcom: camss: Add support for PHY API
 devices
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
 <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-3-ae811e2f0799@linaro.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-3-ae811e2f0799@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RJOD2Yi+ c=1 sm=1 tr=0 ts=6a6a03ef cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=tXry0uEw4R1vPupgq-sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: NigiJhQpi_XBjfU3UDbWKmvwtJ9HowqC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDExMyBTYWx0ZWRfX7K3tJk95u4Qk
 /9L3az3w34osAeb+wKyrvdHaKqTP9wTIkSgUhv1pwddvJFt544ydZAXuwXndVDdXdiLV8EVRAcp
 n1rhFNA9IggxnxtI5YHp4AYwGV3KwGL4vqisOAfdPjmcCO4LzlTGVpjqQ0TPAD+80zo79NSrkyK
 qFFNnv+Ow1RO2sNgmGG3Dgiz07wPm5W94USAFjGDrpbR4dBXC+NNB+/zgCngvmykw5ZYYk8yX/Q
 fm7AzFc7cqE7OmlKWTjPvXBCzhl70xMP94mXYYr1yNIipfguHGI3e+rOHxjc+8u1R9FHMMkV6uw
 dyzby9cwrCnbrypCjAnoLONbuiy1nxplMF2lO1tKP/iyry/MHnOWldyeHdKu4UKhkyB8MM7Dc8q
 OJ+5DA4/cUwzMarCGGmazbjHmjx/c4JK8n4UrzdxeHh0zdfwZ0X3HmMbQg/01pO1hipwiuLJtnq
 3cPJ+8qTUkG3UQJdW1Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDExMyBTYWx0ZWRfX9AHL446YOlEA
 rkZu+dGBxiF1H+WWihV3610lrN5Zlm2rOmR4u+48+VmsLjt6tVQhBoVLwHrn8WBQ4j7UnaedTDW
 9etUxUpj6PfDXJkfcjhodpIhmj09C/c=
X-Proofpoint-GUID: NigiJhQpi_XBjfU3UDbWKmvwtJ9HowqC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_05,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290113



On 28-07-2026 15:05, Bryan O'Donoghue wrote:
> +				ret = PTR_ERR(csd);
> +				goto err_cleanup;
> +			}
> +		}
> +
>  		if (IS_ERR(csd)) {
>  			ret = PTR_ERR(csd);
>  			goto err_cleanup;
> @@ -4819,6 +4854,29 @@ static int camss_parse_ports(struct camss *camss)
>  	return ret;
>  }
Hi Bryan,

While rebasing Glymur on the following series I found an issue —
Could you please review the changes below.

Tested on 
1. Glymur CRD with OV08X40, working as expected.
2. Monaco EVK with IMX577(legacy path) — working as expected.

Picked up following for testing:
- PHY driver:     Add a CSI2 MIPI DPHY driver [v14]
- CAMSS PHY API:  Add dt-bindings and PHY updates for CAMSS on x1e80100 silicon [v13]
- Below patchset
- Glymur DT binding/DTS: locally

Holding off formal submission until the above stabilise.

----------------------------------------------------------------------
From b86af6812bb655e885dbcd23ffd28c92177017cd Mon Sep 17 00:00:00 2001
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 18:18:54 +0530
Subject: [PATCH] media: qcom: camss: Read lane config from PHY endpoint for
 PHY API path

In the new PHY API topology the CAMSS endpoint carries only port/ID
information. The bus-type and data-lane configuration are described on
the PHY node's sensor-side endpoint (port@0), not on the CAMSS endpoint.

Add a phy_in parameter to camss_parse_endpoint_node(). Extract csiphy_id
from the CAMSS endpoint port number and read bus-type and lane properties
from phy_in. Check fwnode_device_is_available() on the PHY node and skip
disabled PHYs. Fix missing fwnode_handle_put() on the disabled-PHY early
exit path. For legacy DTS phy_in is the CAMSS endpoint itself so existing
behaviour is preserved.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 49 +++++++++++++++++------
 1 file changed, 36 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 84097d82d99c..7254f2b28eb0 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4742,11 +4742,13 @@ static const struct parent_dev_ops vfe_parent_dev_ops = {
  */
 static int camss_parse_endpoint_node(struct device *dev,
 				     struct fwnode_handle *ep,
+				     struct fwnode_handle *phy_in,
 				     struct camss_async_subdev *csd)
 {
 	struct csiphy_lanes_cfg *lncfg = &csd->interface.csi2.lane_cfg;
 	struct v4l2_mbus_config_mipi_csi2 *mipi_csi2;
 	struct v4l2_fwnode_endpoint vep = { { 0 } };
+	struct v4l2_fwnode_endpoint phy_vep = { { 0 } };
 	unsigned int i;
 	int ret;
 
@@ -4754,18 +4756,26 @@ static int camss_parse_endpoint_node(struct device *dev,
 	if (ret)
 		return ret;
 
+	csd->interface.csiphy_id = vep.base.port;
+
+	/* bus-type and lane config from csiphy endpoint (phy_in) */
+	ret = v4l2_fwnode_endpoint_parse(phy_in, &phy_vep);
+	if (ret) {
+		dev_err(dev, "parse_endpoint: failed to parse phy_in ep (%pfw): %d\n",
+			phy_in, ret);
+		return ret;
+	}
+
 	/*
 	 * Most SoCs support both D-PHY and C-PHY standards, but currently only
 	 * D-PHY is supported in the driver.
 	 */
-	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY) {
-		dev_err(dev, "Unsupported bus type %d\n", vep.bus_type);
+	if (phy_vep.bus_type != V4L2_MBUS_CSI2_DPHY) {
+		dev_err(dev, "Unsupported bus type %d\n", phy_vep.bus_type);
 		return -EINVAL;
 	}
 
-	csd->interface.csiphy_id = vep.base.port;
-
-	mipi_csi2 = &vep.bus.mipi_csi2;
+	mipi_csi2 = &phy_vep.bus.mipi_csi2;
 	lncfg->clk.pos = mipi_csi2->clock_lane;
 	lncfg->clk.pol = mipi_csi2->lane_polarities[0];
 	lncfg->num_data = mipi_csi2->num_data_lanes;
@@ -4798,15 +4808,15 @@ static int camss_parse_ports(struct camss *camss)
 
 	fwnode_graph_for_each_endpoint(fwnode, ep) {
 		struct camss_async_subdev *csd;
-
-		if (!fwnode_device_is_available(ep))
-			continue;
+		struct fwnode_handle *phy_in;
 
 		if (camss->legacy_phy) {
 			csd = v4l2_async_nf_add_fwnode_remote(&camss->notifier, ep,
 							      typeof(*csd));
+			/* legacy DTS has bus-type/data-lanes on the camss endpoint */
+			phy_in = fwnode_handle_get(ep);
 		} else {
-			struct fwnode_handle *phy_out, *phy_node, *phy_in, *sensor_ep;
+			struct fwnode_handle *phy_out, *phy_node, *sensor_ep;
 
 			phy_out = fwnode_graph_get_remote_endpoint(ep);
 			if (!phy_out)
@@ -4817,31 +4827,44 @@ static int camss_parse_ports(struct camss *camss)
 			if (!phy_node)
 				continue;
 
+			if (!fwnode_device_is_available(phy_node)) {
+				dev_info(dev, "parse_ports: phy_node=%s disabled\n",
+				 of_node_full_name(to_of_node(phy_node)));
+				continue;
+			};
+
+			/* port@0 of the phy node is the sensor-side input port */
 			phy_in = fwnode_graph_get_endpoint_by_id(phy_node, 0, 0, 0);
 			fwnode_handle_put(phy_node);
-			if (!phy_in)
+			if (!phy_in) {
+				dev_info(dev, "parse_ports: csiphy port@0 has no endpoint, skip\n");
 				continue;
+			};
 
 			sensor_ep = fwnode_graph_get_remote_endpoint(phy_in);
-			fwnode_handle_put(phy_in);
-			if (!sensor_ep)
+			if (!sensor_ep) {
+				fwnode_handle_put(phy_in);
 				continue;
+			};
 
 			csd = v4l2_async_nf_add_fwnode(&camss->notifier, sensor_ep,
 						struct camss_async_subdev);
 			fwnode_handle_put(sensor_ep);
 			if (IS_ERR(csd)) {
+				fwnode_handle_put(phy_in);
 				ret = PTR_ERR(csd);
 				goto err_cleanup;
 			}
 		}
 
 		if (IS_ERR(csd)) {
+			fwnode_handle_put(phy_in);
 			ret = PTR_ERR(csd);
 			goto err_cleanup;
 		}
 
-		ret = camss_parse_endpoint_node(dev, ep, csd);
+		ret = camss_parse_endpoint_node(dev, ep, phy_in, csd);
+		fwnode_handle_put(phy_in);
 		if (ret < 0)
 			goto err_cleanup;
 	}
-- 
2.34.1
