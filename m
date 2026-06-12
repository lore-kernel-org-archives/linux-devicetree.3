Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F83437E301
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256373; cv=none; b=hW8lKD0atyktdMMNtC4XVEmCS4ZHwVtn5ZoC8rFqnyZgH1MRKmNOnRfA2aKz7fmaez8gcK/aJdzpkJQqM6UwQa5wv4wb59GfTa4WfHohwrKn3BudkrhE1s8le+0xrFUqmekg/q5TRNqZxQQs/OTUSo+SaOgbmc82/VZA99OW0e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256373; c=relaxed/simple;
	bh=51abVJLmqPXnrz/IkKiqyklTNSZTZj3V8WGdms5cxdg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G8HL4Zyo6q6BZMZuiKGPRhsCIQHvlhqQ5erE0mS+ZDlnbrIAYaBHc5W5EpN9y7JqaaVGI6iu+AwQr0DsfKKeB6BnDtYiPFvvCOu/sShVRAmD66iUYscMEb8fNqkpIkPXFRv8rSstpzmHyUc6eyUS10Fcwq3Sg0ILnpAsumch3H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kNiN4b75; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=it8wvq/2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kNiN4b75";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="it8wvq/2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3BbJc2534118
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yVW7PJDNqNGBBo4tUTiap+vPu+AjRGuVR1+5KXJSqK0=; b=kNiN4b75biUAXK0c
	Eu3Yn2Zcl8Cx/ySg2Ch4DBrmcGx8LbgSaFQnK4c4pUe48asPb9IDkV9QsYNMUYpG
	1bgqA+Q+7DeGcMrKdY8WEy1JQ3L7MGZRRXCbSNi0yySGV1OhRam4wC92PtikehtK
	OIGsNS+qJzZ/zY2N62ZehqDfKWQqKRZWq/Vh+8MBKeOCq0lvANXDFWT+F3wfCRtj
	kGv99/y76lhslNcXGjQ10sZElBRrIex+WnFH4Cq6wGZXnJrKU4zXgQ3+MLLmwh5V
	Wosns8whHlttTOGn63rxaG3UpSgGvHOilDZcEVSmfQ1oFQcbKNWkHoKysF8PGI9v
	8XoIag==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er76ehd9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:26:10 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9638fe9399dso302592241.3
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 02:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781256370; x=1781861170; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yVW7PJDNqNGBBo4tUTiap+vPu+AjRGuVR1+5KXJSqK0=;
        b=it8wvq/24WWoiHYdNGcKvzS7lA/hAj17VtPBiaVqGMAnkz4kgzql2I3TRdsi9MCqBc
         /Ku0m2xpHPDv7S4byEAN15/WHxebXM/P/OeFk6T6q1n+IeMxJDM024i1JAMkSVwJNyLF
         WY4ZB00ltaXEz4Z5PJXl0Ra5MbRRxkvlU9N0diXmwpFBfCZacEtoX4XG4KLzmV/Pfu0Y
         ua9UN2IFdG7cIOdhnLuzaWR7zZwdTEwDOHBeII733jD36YwT73nRiDCoaemOpnfnw2qv
         fXHZSQkgxci1Et07RuAEk6h7/blIFxcStVPzBBl4bERUAcpSnnUPnoP+AmwHs2o9k2Ko
         sqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781256370; x=1781861170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yVW7PJDNqNGBBo4tUTiap+vPu+AjRGuVR1+5KXJSqK0=;
        b=EU96QThqiZqP9V/hkKe4z8vgqv4uqxdpaDQAR0iYaNcSn9feHaRUhxE99uHfjTbfzW
         UtRx98BG9sf/ARb9INzBTXX6dw6fVPxQe1dRhaoSM5lnouBRI3Yk7Aj5x8pv6gcrsJTV
         CQMIbPVTS1Vlq8z4gWNe1ksiK+9SnpopvEzsDCzlvu2xoZQ0yGMBN0xmgx3XqQ5Z/ZWp
         ecKDjPx531wpO/325FjUnyyWuInUPqT7fI92iGQMO3lyRDT/101Vt0v5/5H+aup2F3WG
         7P+I61i/vZZzR04/AN8FoFMOAIUPZeJYoA7qzbeTJfBtTuPPIudeFWl0TvRGkl9wm4D4
         QydQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/rG/kTCh6vyrRBd+kDHXIBbYHS6YSAGAvpH2kRUlOVyKYiCs6B5+Be9WwXsIVjq7cuclFaO0+W9F4@vger.kernel.org
X-Gm-Message-State: AOJu0YwSBtMvptKkvzbMhjtS9P6qDENdqL1LEGSurxQIvowEKZXwY7d7
	LZkib6a7LVhYIJWLG63SfgDCHIqt4iK971ockzAG8Zk4yK4Cg3GiW85RYNagL8N3gaLoTPtzkMU
	XufU3SgWdXKpXV1n/Bdaf69znX/4gRYu9hBCEptu0AZhW0sYF0wg+6nubca3QGZrv
X-Gm-Gg: Acq92OHYBf1JmL4gRBdPFdl95fLhwyrdKlFXPI33rGqoiAD8OOgCoAC8TyKlNkjZNzh
	iaEhOOo1JwrThtSrIIo4T3Gl616Gp0Gd9kW7BKdbRAxWiLxo29znRUVi06K+bQz4u21+ZP4sUd0
	THEubH1wHq64dtkzCIxDpZ/Ml96+OGgjF7f0UPr5VQ8MJTkJzaY91aKTD2bb4hbiZRuo1EccHtK
	tBc47F+j7yBmbMrDg/YaBsNoJgj2WHyN3Cg0Epw5Bmb6P4XXCQBMqTeJ0EMXjk+piiBrRGouCNt
	pu3lp53TiTUQMC8v2WOGHIz1Eg+8MFMPx0U2S6rY4btaKUURSIMJ3Uux8OIM4HVx5H5maRKkIIN
	I/EKJVWiIstLMzuXqEWjJr5eZf6afI7T+SyzguAIX0T8ppeVqSNb+6+C5U0s4OdUYD2AtFa+6pt
	A/3c9sDQB5uze/z7kSsHyg8DZ5Fa64rmNJUF8=
X-Received: by 2002:a05:6102:5a99:b0:633:2389:3a82 with SMTP id ada2fe7eead31-71e88e147bemr665057137.28.1781256369620;
        Fri, 12 Jun 2026 02:26:09 -0700 (PDT)
X-Received: by 2002:a05:6102:5a99:b0:633:2389:3a82 with SMTP id ada2fe7eead31-71e88e147bemr665039137.28.1781256369151;
        Fri, 12 Jun 2026 02:26:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f190ddsm4560191fa.19.2026.06.12.02.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:26:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 12:25:43 +0300
Subject: [PATCH v4 11/16] media: iris: update buffer requirements based on
 received info
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-iris-ar50lt-v4-11-0abfb74d5b3c@oss.qualcomm.com>
References: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
In-Reply-To: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3369;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=51abVJLmqPXnrz/IkKiqyklTNSZTZj3V8WGdms5cxdg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqK9CQZYXf60MyfOxVb9wTv93rBVEZgDui1mD/a
 fawi7ariQKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaivQkAAKCRCLPIo+Aiko
 1XVLB/4i0tIX6WVscClZzJsjFQLZy/dNSBvDrLQ7a1P0BZy1NOLLc/Pff7sUFu9DNstHukCxltc
 iuinYPA8JRzEUh+bxodD/M6s0/ulGYlxvElUA9A/+m7yOx5AzcgQjiKlGiBhtUeJGzPetvX3oux
 Yqxrq+LVOW3hRX7NpD3AXxF9YWFCHC67nL6gpXi4J983y29WIkUKLCbx5ylFhdPfDgg2pe99RKn
 KC1zzJDYFnnG4dmx6QG45qe2Funajbk+PFjEKeSV8TKdr0Nx8OoXCwpCaBQouq+Nya8FivxP3qo
 YeqkO40JFJU6wSc0z1+zt8C3GHt43MmRA6VcNrtVO2JTQk5A
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=O94Jeh9W c=1 sm=1 tr=0 ts=6a2bd0b2 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=_TRJU0tGboi39qq34nEA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: BOFgHz1RaQ2BRwGFMNKuxcYkgG-gfQxP
X-Proofpoint-GUID: BOFgHz1RaQ2BRwGFMNKuxcYkgG-gfQxP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfXyf34zAuxuG4j
 gv3Qs30xDhxE11mbpyAV94ngJXMm7EeyezWaqgaNMQpRWQcYeHOHsTuoOZbOEtJ579azA8d2V8m
 JFqCoBldC9gPji2ZJ30jl27gP8VC3rjdxwwkFvTaLF6bjFfIrtG9ak8w5UIMqBnT2NAhz4tE1nL
 Dd0MWgu4sXl6axBi/y1d6QpmHxTcHMH5KQguEUwT9M2UB5mzqPIEFgkqHoI2D3orQnbZWKPBT1+
 jRcbcO3542OS4vGdr+FuBYBIW3SqV4LaNJce+uDUOQYbGRleTbphL1AeM3+y2n4m6Kgurhmg8wd
 42asomDEiS7okl+JAIaEm7culKunTEF2EJvqbDcmTBxK/konBnNdO3zLK388FoKkBlN725vixye
 FZqBpG5DRVtBrbDA9B2csE2mjJq84mz5E8F8XqNPOgy6RUdrSf5ePhRQseqtVculzd1rScuOqeD
 InfSyFwUP8ZwtYhgkKw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX4/RJ9uPZu0Hg
 r0qF72GcUyr9Jc1ohqNinHtK1ZlYLKwjQrkPJVlvBwBmJJGduSQT8MHz87QktTcpjdyJ4g2p6bG
 JEqyQPlp9f4Ejc0fyD6Gko9+wferOdE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120084

Upon receiving data for HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS the
driver should update buffer sizes and counts from the received data.
Implement corresponding functionality updating buffers data. This will
be used for upcoming support of AR50Lt platforms with Gen1 firmware.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_hfi_gen1_response.c    | 74 +++++++++++++++++++++-
 1 file changed, 73 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index 23fc7194b1e3..ee996eb1f41f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -533,6 +533,78 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
 	dev_err(core->dev, "error in ftb done\n");
 }
 
+static enum iris_buffer_type iris_hfi_gen1_buf_type(struct iris_inst *inst, u32 type)
+{
+	switch (type) {
+	case HFI_BUFFER_INPUT:
+		return BUF_INPUT;
+	case HFI_BUFFER_OUTPUT:
+		if (iris_split_mode_enabled(inst))
+			return BUF_DPB;
+		return BUF_OUTPUT;
+	case HFI_BUFFER_OUTPUT2:
+		if (iris_split_mode_enabled(inst))
+			return BUF_OUTPUT;
+		return BUF_DPB;
+	case HFI_BUFFER_INTERNAL_PERSIST_1:
+		return BUF_PERSIST;
+	case HFI_BUFFER_INTERNAL_SCRATCH:
+		return BUF_BIN;
+	case HFI_BUFFER_INTERNAL_SCRATCH_1:
+		return BUF_SCRATCH_1;
+	case HFI_BUFFER_INTERNAL_SCRATCH_2:
+		return BUF_SCRATCH_2;
+	case HFI_BUFFER_INTERNAL_PERSIST:
+		return BUF_ARP;
+	default:
+		return -EINVAL;
+	}
+}
+
+static void iris_hfi_gen1_session_buffer_requirements(struct iris_inst *inst,
+						      void *data, size_t size)
+{
+	struct hfi_buffer_requirements *req;
+
+	if (!size || size % sizeof(*req))
+		return;
+
+	for (req = data; size; size -= sizeof(*req), req++) {
+		enum iris_buffer_type type = iris_hfi_gen1_buf_type(inst, req->type);
+
+		if (type == -EINVAL)
+			continue;
+
+		inst->buffers[type].min_count = req->hold_count;
+		inst->buffers[type].size = req->size;
+
+		if (type == BUF_OUTPUT)
+			inst->fw_min_count = req->count_actual;
+	}
+}
+
+static void iris_hfi_gen1_session_property_info(struct iris_inst *inst, void *packet)
+{
+	struct hfi_msg_session_property_info_pkt *pkt = packet;
+
+	if (!pkt->num_properties) {
+		dev_err(inst->core->dev, "error, no properties\n");
+		goto out;
+	}
+
+	switch (pkt->property) {
+	case HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS:
+		iris_hfi_gen1_session_buffer_requirements(inst, pkt->data,
+							  pkt->shdr.hdr.size - sizeof(*pkt));
+		break;
+	default:
+		dev_warn(inst->core->dev, "unknown property id: %x\n", pkt->property);
+	}
+
+out:
+	complete(&inst->completion);
+}
+
 struct iris_hfi_gen1_response_pkt_info {
 	u32 pkt;
 	u32 pkt_sz;
@@ -657,7 +729,7 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 		} else if (hdr->pkt_type == HFI_MSG_SESSION_FILL_BUFFER) {
 			iris_hfi_gen1_session_ftb_done(inst, hdr);
 		} else if (hdr->pkt_type == HFI_MSG_SESSION_PROPERTY_INFO) {
-			complete(&inst->completion);
+			iris_hfi_gen1_session_property_info(inst, hdr);
 		} else {
 			struct hfi_msg_session_hdr_pkt *shdr;
 

-- 
2.47.3

