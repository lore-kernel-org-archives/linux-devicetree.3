Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FFB4DE712
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658736; cv=none; b=rTV0v4+wl7CItrqTZCYojWj+tGB3WkAHWLNgM2bMf0jLrSvDctK8AiTV3w1ZQ92aD+HzNU0fS/Pj+b1m//8CzW/2ymitD5mAWWO0LVz1uHwSHI6Bhs+cGQ3kSrpp0JIhfMdEQiN4ladGvnpSEWarfzUfGs2bjwShclUEeRzgwc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658736; c=relaxed/simple;
	bh=nAvKHTAAv3bLPDa8RtV69vy9lxOAzsfXW/WIHWa05a0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KzWIC13mQ+c6sPaCEt1OyhVl6uCEJdA21QMsNUsIPB49yzBlSWMAg/y5C4g/hj7wu2aPGxCDSbwhrhnA0ADlBDIwhdWe8eyYeZR5GMczvvsuUPuV5KN51V0WAgbOIlyzmiFmLGD38YzTjQrJx25901t/fU0bwhVEkyslXscyBNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w1llmHBS; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w1llmHBS"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f7dbeso132941766b.0
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 08:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789658719; x=1790263519; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XaaG9kQMPrqSpcZJreTasVAHAtAhXdOZx6qidBNV3Yk=;
        b=w1llmHBS6q6+W4/GGuf/sVFUprjcN5RneYzrTcGmVhAoCS+NCyV33Xl2CutJ7BuvnZ
         zg11Rgh7ZH4xUzgDrhxI5ESOkG3p1v00TlKMt4a8qe/+kDCrGLjn6cQDd7UrscV/TahI
         4CiFbNy/5Db1J+QG0WlZU4LarcipDl+LjOgC4jpLqDVCUUwl0rY9PehVnm/oNhYvu3+2
         6sbvR++P+ogDcWfhSOtghDu2fPGfplepNd++qURpkZ2kh4lBMbkTlmSMsSY8EqbPv/cz
         y9jZqsa026bquoNkQ8U2gxC5Q5xk3bdnPNI6yaEzFcIDpoUCPYuT3SxKo2wxJbQb+m7u
         R8BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658719; x=1790263519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XaaG9kQMPrqSpcZJreTasVAHAtAhXdOZx6qidBNV3Yk=;
        b=MxQRRmJEXdx8kwdVB3FLsKmlk5XSV7AvsXfP6HopDxF6b1DzTEDYKVyd9MRtC6VwNM
         wZjFHAC46oRDLudD7r5i/UCueyh1kwF60nhK7Wqt2z0DbkOri6FHcqDdnEsVbao6R/Se
         7dhvuUzUJp1DvdJsCTyYthrthka4lzU6XOwCHwLgJIKWSQtbzUtGYTAk6+47zvWA8Gic
         La7gDUM1TjIcPg3se+58xPPceeAeIEodBIPhW2DcedxLLokmoqw0a8Nq8F/SCUI2XN4K
         PrGVfdfyEi5MkmkaG74yIr4wG4lG6j8Nlp5aRnWs5BxoyhY2EL3fvtFh6/0MCkAezr8o
         /zlg==
X-Forwarded-Encrypted: i=1; AKwUvBwNlpRnexJT3iIGOsHzoi8+qheifzEshjlmaOyiR6qTOMMQRyqFoCX9gL9T4HcEd9xl9iVlFoUP7KDF@vger.kernel.org
X-Gm-Message-State: AFuF++kHl/jUriSXjrBWe4poByyJuzaFR3sF4eeI96LQPy0kj1iOsrl2
	5yy3QvfuzzzMa9/A+/TAzlrwYsiwiOC5I/yf/Hkmr3e3pg0uVFlXY9rVWF+cqq4iUxg=
X-Gm-Gg: AYBFou2sVHoVU8G9RYlLl+7Z/w++byj8LIBxlacUhNjbEVkZGC4UpgduGciDPn76/Hr
	jWAOcmJLh2I3ssM4/YOLRz6BJyHW+x0BOoODKmZUA8dfAw6MG0X4BiSynxqQAWbhp3SLtRholsT
	HgKUYUtuVMC3DGYgMeXx1tyXmRnub4CBosUyEhs7hiZVyDM0ae41iOCU5yy1dQZMEckl/5uBNj/
	G640wlrfmu2M/o7lBfYVry6ghMQN94FFgbVzNdxpgF5VXI2lxaicrV0DrufD2E20DunMstrjj1B
	4257cshlE3vgahtuqKucdrjw1DHhZMFFBBasAj07dN1Efos+NQKOSs3PDe5VjdhblTzdDkyBMal
	xY0rniIlYOf97wqx6qZm1VBll0v3y73z3Mv0w2gHWJiNRfA1fP2dc/OqTiZwAeiiC/3VB0lAp+S
	FiXDXIAU7jv3+SliiCan7E5HXsNTQ8lEPSMOXHb9ENDLZtK+CGqK4GPtZN05BYdqbRCnHUUECkv
	JcmS/mf9LA=
X-Received: by 2002:a17:907:d642:b0:c25:8c74:71e6 with SMTP id a640c23a62f3a-c29e529041dmr506795166b.10.1789658719047;
        Thu, 17 Sep 2026 08:25:19 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.29.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de48755asm310587366b.24.2026.09.17.08.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:25:18 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 17 Sep 2026 16:25:10 +0100
Subject: [PATCH v19 5/5] media: qcom: camss: Use data-lanes starting at 1
 for new CSIPHY mode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v19-5-21ad8a76e941@linaro.org>
References: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v19-0-21ad8a76e941@linaro.org>
In-Reply-To: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v19-0-21ad8a76e941@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Felipe Balbi <balbi@ti.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3096;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=nAvKHTAAv3bLPDa8RtV69vy9lxOAzsfXW/WIHWa05a0=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqrAZVFsIMW2/vGXd4QQ7KAOZgAqwx0MFGvBcs0
 hrm5SKiqNyJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaqwGVQAKCRAicTuzoY3I
 OuPSD/0TKFuTYyRebGjbH7JeKR3zECbg6HM7ernZRFsj1tVkcH4V/eU3Lv4JMGpoj0aLtJpudEM
 nCbrlMuFKo5mhKevNWiGNTh1GUS4fsz6niVb0xPL5gtjDG/SFD+HYzQ88LIhNWkYd6GCDX05lj9
 XqEPteTHrJeNN0wTa+Ohh9ZKB/ts7OfpbCViNa2/K1R0dVcSeBja9Fc3uw8FSW+UaTFeMKpLSW4
 mQ+c6DvRZYiwzJX4fqenF1o2ccpAgULopn1zlp8iJEvJrtoK7h+4IOCumq3Z6+RV1UIOtcN5LBR
 Ov3vj8BbN4hkfcLYXSbE8d7yznJ4CYH2YxWfz4Zi0Jj35Vkkco8fCypyAmo9upvprKrrCAjoT79
 SEpis1Bl6+0H1vnfBrmA1tssIga62V8L17p5in8BnDyycxGqFU/Bf2Nr60dGjZYFRlbouTffSGw
 l4l3XfiP0tWfOE52jXClgAGguPNPlmczmDKGyfly/D6giSYv0wPgFN64Ek7WAcu8/1Dez1Vyz+l
 Qnmm0O6+GCV+4sxywa4bIUdlRpCy7iBAQisalkJataEzrWhKeiJunIihGNvd6vJJnY3EoRU7EeD
 02xc2kjaUjigbJNUvYvR80UIes2IfgXg8nLsjLJ54rdk47jUcEApzhHcRCvTZ1WoT4vwdF0M0tH
 T8OmLmEVh8mEI6g==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Introducing a dedicated CSIPHY driver community feedback was both to move
to data-lanes starting at index 1 on the PHY side and also to match that
indexing scheme in the CSI decoder - CSID.

CSID consumes the data-lanes property to determine which CSID lanes to
switch on. For indexes starting at 1 we need to amend the logic somewhere.
The PHY side code normalises the input data to register level meanings so,
replicate that logic on the CSID side.

Introduce a simple flag to differentiate between legacy indexing @ 0 and
new indexing @ 1.

Existing bindings are not affected.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csiphy.h |  1 +
 drivers/media/platform/qcom/camss/camss.c        | 15 ++++++++++++---
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 7a357044b9fdb..8c3319f2ca1cf 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -21,6 +21,7 @@
 #define MSM_CSIPHY_PAD_SINK 0
 #define MSM_CSIPHY_PAD_SRC 1
 #define MSM_CSIPHY_PADS_NUM 2
+#define MSM_CSIPHY_MAX_DATA_LANE 4
 
 #define CSIPHY_GRP_ID 1
 
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 84097d82d99c9..6f58e729eaceb 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4742,7 +4742,8 @@ static const struct parent_dev_ops vfe_parent_dev_ops = {
  */
 static int camss_parse_endpoint_node(struct device *dev,
 				     struct fwnode_handle *ep,
-				     struct camss_async_subdev *csd)
+				     struct camss_async_subdev *csd,
+				     u8 lane_base)
 {
 	struct csiphy_lanes_cfg *lncfg = &csd->interface.csi2.lane_cfg;
 	struct v4l2_mbus_config_mipi_csi2 *mipi_csi2;
@@ -4777,7 +4778,14 @@ static int camss_parse_endpoint_node(struct device *dev,
 		return -ENOMEM;
 
 	for (i = 0; i < lncfg->num_data; i++) {
-		lncfg->data[i].pos = mipi_csi2->data_lanes[i];
+		u8 lane = mipi_csi2->data_lanes[i];
+
+		if (lane < lane_base || lane - lane_base >= MSM_CSIPHY_MAX_DATA_LANE) {
+			dev_err(dev, "invalid data-lane %u\n", lane);
+			return -EINVAL;
+		}
+
+		lncfg->data[i].pos = mipi_csi2->data_lanes[i] - lane_base;
 		lncfg->data[i].pol = mipi_csi2->lane_polarities[i + 1];
 	}
 
@@ -4794,6 +4802,7 @@ static int camss_parse_ports(struct camss *camss)
 {
 	struct device *dev = camss->dev;
 	struct fwnode_handle *fwnode = dev_fwnode(dev), *ep;
+	u8 lane_base = camss->legacy_phy ? 0 : 1;
 	int ret;
 
 	fwnode_graph_for_each_endpoint(fwnode, ep) {
@@ -4841,7 +4850,7 @@ static int camss_parse_ports(struct camss *camss)
 			goto err_cleanup;
 		}
 
-		ret = camss_parse_endpoint_node(dev, ep, csd);
+		ret = camss_parse_endpoint_node(dev, ep, csd, lane_base);
 		if (ret < 0)
 			goto err_cleanup;
 	}

-- 
2.55.0

