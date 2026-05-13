Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF6F47CC80
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676581; cv=none; b=bN29DOYrjxvO35EOTYQCmGoL2BHjzVll6IBa2h2UDcna/XNAMpy7TqYCcM94IBkUOLnmtlFVt5uDMr5QRtVFBN1IbHhvZDw86ooLOJkhXlNLT5R1nBVyeXOpEagdPfsMAWxjFFTjtJs9LucIiEsjdas4i/ujTq6buyE9RXHSQbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676581; c=relaxed/simple;
	bh=3LZBjFNjSvRhMK03ekSlXkVYlg7os/XFnLwP9MO6T5M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sHyp5rEITRtAMxTzNVVAKrz9loXohEIhRqLbBPnQbHhXiINPsx2u2oP8kDcacUbizU/nG/u4gsZ1X8vOHqMcLNIBVUZf7Fg9RVCW63l6AKj67iumoR9AE7K8Rx7rpeQjrY8ghRqQoiHTAFND1Exp3FntmNEUsQhK2F9dfyOZETI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vm7QQiiX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E1wAjwix; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vm7QQiiX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E1wAjwix"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAeYrG1393072
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:49:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kIs5lUio7E7YMx2NkuaANRPWVQRplvNz2SIkISpJQxI=; b=Vm7QQiiX5N3oSaHs
	dgaGKExjarUjzySPt1XLSJps7LANZvTlOrlqHcB9Zp2hO+A0psunwOh7OC4/XAGS
	wwGSjV7/39828FL+mH98EArXGlH3CA9To33TbdNmyUaH0aQcnITb/jBV01hEKlre
	vbBLIiJ8RzIeJrzP5/aZ3U2td98gyZsIOn3LsnISvbIkV+KHV9IhWIeSljOVAwDL
	AO4SOsjAKwE4/UTmoAMkm3M27yjwXC8Twk03dFopiWNmmxQArpHF4awxnXVKukvE
	HfhNdXNpflpTMxPlAhQVMHYZy6Kh33LiUeJGHGHbCTCqWLdG58Daphjn/PdCLQyi
	HabQ5Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4k261p0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:49:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-514ae0edeb6so94059151cf.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778676575; x=1779281375; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kIs5lUio7E7YMx2NkuaANRPWVQRplvNz2SIkISpJQxI=;
        b=E1wAjwixIdv1cMoTkJJjOEPuOOs6bB1yBUvwIsz0V5Y18FUUKrMoS1QSdIDQ67sYJ8
         88Svp/1SL/g+mdLa5ViWh+EW3/RnJvFuqO0oyCSaRJOA84hI2nYt5S4HSQ8I9OiGYO9/
         YqXTssTkYtk4h0SY+FaAtQal6du/JtMIJoKvu3a8mQV9Kc+haAhwQ8U0Owyq7P0hKCKK
         6UiUTk2fiSEvN5h2N4aTbJAzOjQZfqLlivo9WGS+ZONFhpGYbaZqz+CPLEydBs4IM0sN
         I2fWO76FMqemxiZ5XXbPQrx8x+plp6bz+2yJPoyo/3OGT3woWqqFmQH+MVColIHv3LMN
         Eilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778676575; x=1779281375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kIs5lUio7E7YMx2NkuaANRPWVQRplvNz2SIkISpJQxI=;
        b=Crv8CwCgOU/yh7zDZsbBigYGtgdh8cKEogReALq3Qw8Ro7w8U/v4nlULCi2WUJuxUr
         69omzCObI6rk1KZ+eTBwaxwNNvTmWzetgcdswB/4ppy2MT98lMTNP4sVJ4nwSpl7wsxK
         NH4kw7TPLKWf9PLNsh8WzocCzu3XDwTUC2Sug9v/0U+7UkGcVOvj7Jh9/fYBG/SpNb33
         BO+GMwMaSv5Rfr2C4vUAKKiBOkNN+JzKkW0DRnVajt9Zs5hxd5N4++PC82HEphJ9SNVI
         Fks0YXPqmIpojxNeXiAA/JgPi3yhCbitdgJgQPmFx3640CqAnlF/HSkmtx3DXqfwO3sV
         6F+Q==
X-Forwarded-Encrypted: i=1; AFNElJ8GWGgRGrZW9+g3LQlRha9LeI8zqXQH/Lz0XwkCE5EfGFOwfssEWTET5tOi5Q8GNI1GPut/Pj946az6@vger.kernel.org
X-Gm-Message-State: AOJu0YwaKHjuVI50u3/7/dU2ZwcFbM0AnB917tkn2aFJAgqEoRbLrj8y
	M5m/vmCy224FNGrjMeZUc5qgn+O8WUqSMZiqJeaX6JuIY2psx0aQugBPAnZUJ8GDfXFJNWpvufm
	ruSCzXO/ZH3FXuNWbCgDun78alT+sXt6rc6MTblTwoei5w8hLdByd0nWXq9T4u87G
X-Gm-Gg: Acq92OEsIUkKEpfv4GkhtV3rj1qFpScXLXc8y3a8C4k460qvorbeU7MnijU0kCnDNAh
	Vck0GJy+p4wdYWErxypwTFXX41wiVNJiQ+nrh8czuHqiqZiwFW2LWDSA1cznQU8ApjK79A0GWSG
	SUotGNgxHSsQAIvL16VhLgWgZQ7dm4u3LOKuAFGbNx0ynSUtYODOEZidrGtDiPLhiWlEN13dlBq
	HYVXGCBXKg2ryZRN4qToHCTxKdECyWDsV8sPp4coM1EkIQlCH4QMEIhrvKjwZDFonAGeclMmUAY
	Nz/DRjk6ipYQHeE2g+rQUkGR2jn803XJfnApVjdxboKT/z41epXPQBusUdq5+o/GsRg3T/hLyBJ
	WHDnyiQXmj9zugJAdoTm/y9oVLpj9WJk199g8ZAyaV4dzsxa0NHXnv0mDdsKAfngkddTtRUPt5K
	mm58yXi0ecERiaMvdi6gzzWmPhk53+0KyauFY=
X-Received: by 2002:a05:622a:110:b0:50f:b181:6ae7 with SMTP id d75a77b69052e-514cef74db9mr94040691cf.17.1778676574745;
        Wed, 13 May 2026 05:49:34 -0700 (PDT)
X-Received: by 2002:a05:622a:110:b0:50f:b181:6ae7 with SMTP id d75a77b69052e-514cef74db9mr94037331cf.17.1778676569519;
        Wed, 13 May 2026 05:49:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5f15asm41106841fa.17.2026.05.13.05.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:49:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:45:44 +0300
Subject: [PATCH v2 10/16] media: iris: add minimal GET_PROPERTY
 implementation
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-iris-ar50lt-v2-10-411e5f7bdc4c@oss.qualcomm.com>
References: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
In-Reply-To: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
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
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5660;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=3LZBjFNjSvRhMK03ekSlXkVYlg7os/XFnLwP9MO6T5M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBHNB+REIn+2grh+sTO7eRs3rdPldZghwhL8oz
 7nlhozBvYiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagRzQQAKCRCLPIo+Aiko
 1acyB/9dhAfCYuxvZDe/GtAk/58mH/Cs88dkZ/SRYJNfeYU5tUvNZhsLUEtekh+I4EPqW/2YbiV
 1QHYbVWDPSd4u3gEhocvP3hmULI1D6H6IAGkWGrwvdHoDXu5LXgyEH0BdQfe5V8KEBc6Pl9n69z
 vmy6padNk95g2ACQmFWn3EvPOl5WNmlB2kVqHIvokMI5SZYRhnPzX6swztXTJ8YPyTYcjeyWV2Q
 tsGlGpOHv2WsOzz0YYzoHO69qpCAXAaFLmMg1aVjKSrz8UDviABVAIwJZ7GpaG4saECvz3VHsLB
 6mRpOylwSed5KhwkO1SFlhC0twRbA96ujK8W/KYmb837kwpO
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=M/l97Sws c=1 sm=1 tr=0 ts=6a04735f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=4y4YWC2vBVg0P_IM3hEA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMiBTYWx0ZWRfX0LlhPverSrwy
 1/yDNNrVSOMN8iN4fKJhmi28GFVfYix9KcrsuYdyLVzBRxR1ttIAVWQGfjEsKZuTjdd7W5igFlr
 ewUOdgGHoKCJaZcWMt+NbrUaMlPCIQASssUMhUReZ4iwCt2OmyMTn53Tpfrz/1t/GAyOxZWc3dm
 iuWKzZF59f4U8X/GyQ+u5ZkcdK7Q4KWLOu8JSthkac3PclVJa6pk2qipGXlRm8yI0Kx6sJ/4CgA
 VVw3EYuYOWA7CwweAOY9+vQxBAsvYjDW+BiR2tnrHizFW8EJ9k/7F7VH2b2FUKRZmJG+/RqQ1bL
 4jeekM59ccupM2xmnCkJNMoLYKLhdkC+KWc5bEJL9zQfZ2IGrjZsi39vR109XVvf9DiXsToTNb1
 ZZ3nCcIYLpOjS/jue72KJFq9hfA3YS7eUO3CMYY0wL/zFN0Fn+kcBTd7rDWEqLkLKfHD9p3VYed
 b7eqsIRKKvjj3uKCPnQ==
X-Proofpoint-ORIG-GUID: YivNycs51-ntRfT08qD-3tyryquu-rFV
X-Proofpoint-GUID: YivNycs51-ntRfT08qD-3tyryquu-rFV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130132

AR50Lt with the Gen1 firmware requires host to read
HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS property, otherwie it doesn't
update internal data and fails the HFI_CMD_SESSION_LOAD_RESOURCES
command. Implement minimal support for querying the properties from the
firmware.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_common.h  |  1 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c      | 21 +++++++++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h      | 15 +++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen1_response.c     |  6 ++++++
 4 files changed, 43 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index a27447eb2519..16099f9a25b6 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -121,6 +121,7 @@ struct iris_hfi_session_ops {
 	int (*session_set_property)(struct iris_inst *inst,
 				    u32 packet_type, u32 flag, u32 plane, u32 payload_type,
 				    void *payload, u32 payload_size);
+	int (*session_get_property)(struct iris_inst *inst, u32 packet_type);
 	int (*session_open)(struct iris_inst *inst);
 	int (*session_start)(struct iris_inst *inst, u32 plane);
 	int (*session_queue_buf)(struct iris_inst *inst, struct iris_buffer *buffer);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 83373862655f..4e17fa3c602f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -1063,10 +1063,31 @@ static int iris_hfi_gen1_session_set_config_params(struct iris_inst *inst, u32 p
 	return 0;
 }
 
+static int iris_hfi_gen1_session_get_property(struct iris_inst *inst, u32 packet_type)
+{
+	struct hfi_session_get_property_pkt pkt;
+	int ret;
+
+	pkt.shdr.hdr.size = sizeof(pkt);
+	pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_GET_PROPERTY;
+	pkt.shdr.session_id = inst->session_id;
+	pkt.num_properties = 1;
+	pkt.data = packet_type;
+
+	reinit_completion(&inst->completion);
+
+	ret = iris_hfi_queue_cmd_write(inst->core, &pkt, pkt.shdr.hdr.size);
+	if (ret)
+		return ret;
+
+	return iris_wait_for_session_response(inst, false);
+}
+
 static const struct iris_hfi_session_ops iris_hfi_gen1_session_ops = {
 	.session_open = iris_hfi_gen1_session_open,
 	.session_set_config_params = iris_hfi_gen1_session_set_config_params,
 	.session_set_property = iris_hfi_gen1_session_set_property,
+	.session_get_property = iris_hfi_gen1_session_get_property,
 	.session_start = iris_hfi_gen1_session_start,
 	.session_queue_buf = iris_hfi_gen1_session_queue_buffer,
 	.session_release_buf = iris_hfi_gen1_session_unset_buffers,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 42226ccee3d9..1b770e830c58 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -35,6 +35,7 @@
 #define HFI_CMD_SESSION_EMPTY_BUFFER			0x211004
 #define HFI_CMD_SESSION_FILL_BUFFER			0x211005
 #define HFI_CMD_SESSION_FLUSH				0x211008
+#define HFI_CMD_SESSION_GET_PROPERTY			0x211009
 #define HFI_CMD_SESSION_RELEASE_BUFFERS			0x21100b
 #define HFI_CMD_SESSION_RELEASE_RESOURCES		0x21100c
 #define HFI_CMD_SESSION_CONTINUE			0x21100d
@@ -113,6 +114,7 @@
 #define HFI_MSG_SESSION_FLUSH				0x221006
 #define HFI_MSG_SESSION_EMPTY_BUFFER			0x221007
 #define HFI_MSG_SESSION_FILL_BUFFER			0x221008
+#define HFI_MSG_SESSION_PROPERTY_INFO			0x221009
 #define HFI_MSG_SESSION_RELEASE_RESOURCES		0x22100a
 #define HFI_MSG_SESSION_RELEASE_BUFFERS			0x22100c
 
@@ -186,6 +188,12 @@ struct hfi_session_set_property_pkt {
 	u32 data[];
 };
 
+struct hfi_session_get_property_pkt {
+	struct hfi_session_hdr_pkt shdr;
+	u32 num_properties;
+	u32 data;
+};
+
 struct hfi_sys_pc_prep_pkt {
 	struct hfi_pkt_hdr hdr;
 };
@@ -525,6 +533,13 @@ struct hfi_msg_session_fbd_uncompressed_plane0_pkt {
 	u32 data[];
 };
 
+struct hfi_msg_session_property_info_pkt {
+	struct hfi_session_hdr_pkt shdr;
+	u32 num_properties;
+	u32 property;
+	u8 data[];
+};
+
 struct hfi_msg_session_release_buffers_done_pkt {
 	struct hfi_msg_session_hdr_pkt shdr;
 	u32 num_buffers;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index bfd7495bf44f..23fc7194b1e3 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -591,6 +591,10 @@ static const struct iris_hfi_gen1_response_pkt_info pkt_infos[] = {
 	 .pkt = HFI_MSG_SESSION_RELEASE_BUFFERS,
 	 .pkt_sz = sizeof(struct hfi_msg_session_release_buffers_done_pkt),
 	},
+	{
+	 .pkt = HFI_MSG_SESSION_PROPERTY_INFO,
+	 .pkt_sz = sizeof(struct hfi_msg_session_property_info_pkt),
+	},
 };
 
 static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response)
@@ -652,6 +656,8 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 			iris_hfi_gen1_session_etb_done(inst, hdr);
 		} else if (hdr->pkt_type == HFI_MSG_SESSION_FILL_BUFFER) {
 			iris_hfi_gen1_session_ftb_done(inst, hdr);
+		} else if (hdr->pkt_type == HFI_MSG_SESSION_PROPERTY_INFO) {
+			complete(&inst->completion);
 		} else {
 			struct hfi_msg_session_hdr_pkt *shdr;
 

-- 
2.47.3

