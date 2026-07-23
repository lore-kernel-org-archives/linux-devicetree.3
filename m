Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A452E62B4
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784810204; cv=none; b=D0WCXGtyy1C7QqNJyD4AZLvXI2aetIdHDLmaMrrM8UvzYUgiuebJbDlDF8RxwbBneU5ETjVNwipANUD4VltLnwIGsqqiw3UQxfiaRqdo23+q011yIRncG4IW3EGveGXqyg11YqN5OrcZr3nn4CQzmKluD8pgjunaBBE7CgXQKlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784810204; c=relaxed/simple;
	bh=ZD+ycYNZR7+dxERdgOdimE2dn8185efkGSlgkCCELqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uL9QyMpV8pYY3pw6yVXwuPBZtMUES9UdWuvUmzRd/EfY0Ne78adgBYovKJrLoO1CdRb2aopFM1vPG5FKY2CvVtfASC4FpUgn4MVQ4RiSSxGFzAYfx2H/zD/PiVdLaFD8HtDssO+OAwRb4IrWwoghNodh1AgRX49XC0l+34VWCpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YuRmb+7r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V7bYBGl6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YuRmb+7r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V7bYBGl6"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qWQU3648552
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:36:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cj2mWj1s6GFHWqMWFLzY4Iirhlp9UN4R3/IzGe53L/s=; b=YuRmb+7rNiLxyDP2
	NCGU8hJGFCy1J11203M43N7zrBJa5mPWSANCoB5oFqji208MjELzgvI9oqpvG7WI
	MRXc0QbYwGOniYHp73KcjKyZfmP7IB9d93/RH0TbV3l6XWZxhuRhzFAzBuoZcV7V
	iLhTCqsvGO5g+v1hDilf2oVL4lPQohf6qNSkUzX/+XWgchOco5ndOSCqoGSeGnhp
	1lRKCkYW5eRqtaZfDGH4CWj6k+pWyasmwzQyFjs4k1j2PyvJfujqAptJuga0lrtc
	Ca0Au7EjBT+eC9qSqwmBKuO36CxXr3dHqZNI4CzL1iG7qN9qMGi4Cii0jbKjaspI
	0kHtTQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk6c7k18k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:36:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccd1958e8fso9408575ad.2
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 05:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784810201; x=1785415001; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cj2mWj1s6GFHWqMWFLzY4Iirhlp9UN4R3/IzGe53L/s=;
        b=V7bYBGl6H70s6Wy1tuPD//V9nP513+Kgtxf0kl/9sHNxW8bgnfg0VW7lpJpfgpG8f2
         ud5uVotYHkH5FvhWdPMktr36Qu2vpFjyokDasu+lKVkLVzBymHXBkiido2jJ5g/cYLUt
         Otz4wVRlRvIytTqjsmK5oJ3ZF6cjuy47o7D60ur676+u951tqOu5TtKCpvE5TY2yb4ym
         cMDh5xA9KH/+i51im3ivZ6iPkeYy3Hb3pzIOOWQbWOIRo8eiDYEny/v5aJxR8TebP05f
         fVpbCLVjlYUkwpjewH2F4ea6fsI0a38MfAzcHes16OJdmMXGD73sa+0mUM8tpo84jQHh
         AQwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784810201; x=1785415001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cj2mWj1s6GFHWqMWFLzY4Iirhlp9UN4R3/IzGe53L/s=;
        b=Bu/xMDqnRGdC3FurRiPZX6509PRYHicaTdRy1TRXpzol9CNbOvQInB8G9QAn9a6K0/
         iLJNXYIcIwwlPX45GGoAkKQURSbq4xjbwWnVpa9D5lOLrt5NkduYkslZumJ8xieznjUQ
         k/YKhu0ICMkAp5yTYYjM6lL644dVx8JnNtLVQ49IHRIWzxVIxfkm0HmRIKX5WWCslZ8/
         D1pukBixOaGNaKOtM6bdfDEyBTgefJirXHO0PKKudADeE5A43kmyhILxIB98tN/ylkH3
         cfKwNfs87oxtfUJFo6lFB3EFR3WJp3nKvnwYrAtHnAsYSZTnG8EEn9WC0Wr5lr1jPf1o
         qkSA==
X-Forwarded-Encrypted: i=1; AHgh+Rr3Qaez46qWLA5pgfn3FR0rZ5jrErhdCijjncHNkStbkz5obwroPVejt5B4+sC7SosfLCpc2MWxjj9Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yz832BJKt70zoG5O7zRe2lYdbaZIRYtojWRjGC8H69iWB1xlUEu
	ds9rj+DGC0nAqHeNmGnnhurbomzoOd3Cin4gXXgblGdIVpKL38fymbJzuIHIrV4g1I3mtMaq1DN
	yYcbwV6JVfJNyG9wm4eiztg84OBhfYnbz+m+Xsa2/Y2PeAKfMRGjNjPA4Nlqk6yrz
X-Gm-Gg: AR+sD13RnrVXmrOCB2rBotxfT7lzLkwbUaDfdTFMwGR7e4z1a6qXW9Ul7N6UPF+qHY6
	akfDGW1s3NReeiKO/0YQSKUFBnW6mUuXL6ZC8E6uIZtyRgbBMKmWl9gnNSSemdbJKTT+knDZTnh
	Ta9zvL1qUtd2NuPClhzgbiTj0lFK3pnrDo9uzr4g3cxGg8I1gjERQRJKZoJy78ZE4EkmAygf9xw
	9DncnjbWVyqYGuN3awNazZ6WduLjjO78iZ4HdkUMMQGwzYfyN5r5tEED1E7Hdf0X3nhZ7hz1xUl
	XKJZiTVatlJY/s+1CH70mztguyEMLjCD28WGWT05VKd4e1YLJYLeDNDCkPuhQ9GxbdVmhPZ+Hwa
	OC36xuNJy1TkuXDcVm22sc5ySNWoMCw==
X-Received: by 2002:a17:903:37c8:b0:2ca:bf8e:35fe with SMTP id d9443c01a7336-2cfa6b75512mr33225005ad.16.1784810200850;
        Thu, 23 Jul 2026 05:36:40 -0700 (PDT)
X-Received: by 2002:a17:903:37c8:b0:2ca:bf8e:35fe with SMTP id d9443c01a7336-2cfa6b75512mr33224415ad.16.1784810200339;
        Thu, 23 Jul 2026 05:36:40 -0700 (PDT)
Received: from hu-samana-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efd76c4sm33851225ad.23.2026.07.23.05.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 05:36:40 -0700 (PDT)
From: Rahul Samana <rahul.samana@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 18:01:07 +0530
Subject: [PATCH 1/3] Bluetooth: qca: add QCC2072 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-rb3-industrial-bt-uart-v1-1-3c8e580c09d1@oss.qualcomm.com>
References: <20260723-rb3-industrial-bt-uart-v1-0-3c8e580c09d1@oss.qualcomm.com>
In-Reply-To: <20260723-rb3-industrial-bt-uart-v1-0-3c8e580c09d1@oss.qualcomm.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rahul Samana <rahul.samana@oss.qualcomm.com>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_hbandi@quicinc.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_anubhavg@quicinc.com,
        quic_mohamull@quicinc.com
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: gzcnPF7BA8e1mc07Emmg7z1fkDulZfDZ
X-Proofpoint-ORIG-GUID: gzcnPF7BA8e1mc07Emmg7z1fkDulZfDZ
X-Authority-Analysis: v=2.4 cv=baZbluPB c=1 sm=1 tr=0 ts=6a620ad9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=bBbZijagYEdtm7BDMOcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyNCBTYWx0ZWRfX3jCqh3IGqndg
 q5l7FXWvHWdaRgp098wPQFhQ4476LxNckPIF7xlie+VKXE9TmruKkfFuR7Pb/IAyxAwGtu4qdmK
 NF0VdnkNY7GknQJTRqk1a4nXtFN1twc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyNCBTYWx0ZWRfX3nFPlVS7R2nA
 QWAjJBNAJFIbinpVzv1cYksObRNhdIC3u6KKCXkD0/THuCHUKV3Y9DZfM8kBpPVTryst+gKXvUD
 0PRifg5X6cgdvVDN1fcxDW3WF4lfF1Wk8ElzRYl38pGJ5NQovFl/k2KQGyyEkW/S03plAccvK9o
 Zn6IexqIhwKTJXRpOHxlmn7N34r1+fBv5MBW8ixtDs9AAWowgWpwcs4KH09hvPFGTB9Fe+7qzWR
 2W4SpSl75db1dVXFNZM/06Wkyk8bwgOsKw4XFLH2fJw8/XfKNFaJRGW9V6pu5a6rUSa+VMUXV2w
 H0RX53L/Vnwo4PDDJyppzHsf4td53w7/QPSZDciDrW1aDEH/Agouk+U8PQKZ2qUfbztnk+NLg1D
 fOX0B/2uM1iYZL2EEOfHLrMKnjtC6KklxSxtYfkMUx2KjehsuDtrLs94eCEyDo4el6K+R6OsOVa
 BGuhfS3Ndz+W/u2CQRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230124

Add QCC2072 as a supported Qualcomm Bluetooth controller.

QCC2072 uses the ORN firmware and NVM naming scheme. Select the NVM file
and BCS calibration file using the controller board ID when available,
with fallback to the default files.

Register the QCC2072 compatible with hci_qca and route it through the
same UART setup, speed switching and power-control paths as recent
Qualcomm Bluetooth controllers.

Signed-off-by: Rahul Samana <rahul.samana@oss.qualcomm.com>
---
 drivers/bluetooth/btqca.c   | 70 ++++++++++++++++++++++++++++++++++++++++++++-
 drivers/bluetooth/btqca.h   |  2 ++
 drivers/bluetooth/hci_qca.c | 24 ++++++++++++++++
 3 files changed, 95 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 10c496eaea2c..69427cc7eb5a 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -569,6 +569,54 @@ static int qca_inject_cmd_complete_event(struct hci_dev *hdev)
 	return hci_recv_frame(hdev, skb);
 }
 
+static void qca_combine_nvm_calib(struct hci_dev *hdev, u8 **data,
+				  int *size, char *calib_name,
+				  size_t max_size)
+{
+	const struct firmware *calib_fw;
+	struct tlv_type_hdr *outer_hdr;
+	size_t inner_len, combined_size;
+	u8 *combined_data;
+	int err;
+
+	err = request_firmware(&calib_fw, calib_name, &hdev->dev);
+	if (err) {
+		if (qca_get_alt_nvm_file(calib_name, max_size))
+			err = request_firmware(&calib_fw, calib_name, &hdev->dev);
+
+		if (err) {
+			bt_dev_err(hdev, "QCA Failed to request file: %s (%d)",
+				   calib_name, err);
+			return;
+		}
+	}
+
+	bt_dev_info(hdev, "QCA Downloading %s", calib_name);
+
+	inner_len = *size + calib_fw->size;
+	combined_size = sizeof(*outer_hdr) + inner_len;
+	combined_data = vmalloc(combined_size);
+	if (!combined_data) {
+		bt_dev_warn(hdev,
+			    "QCA Failed to allocate memory for file: %s",
+			    calib_name);
+		release_firmware(calib_fw);
+		return;
+	}
+
+	outer_hdr = (struct tlv_type_hdr *)combined_data;
+	/* high 24 bits = payload length, low 8 bits = type */
+	outer_hdr->type_len = cpu_to_le32((inner_len << 8) | 4);
+	memcpy(combined_data + sizeof(*outer_hdr), *data, *size);
+	memcpy(combined_data + sizeof(*outer_hdr) + *size,
+	       calib_fw->data, calib_fw->size);
+	release_firmware(calib_fw);
+
+	vfree(*data);
+	*data = combined_data;
+	*size = combined_size;
+}
+
 static int qca_download_firmware(struct hci_dev *hdev,
 				 struct qca_fw_config *config,
 				 enum qca_btsoc_type soc_type,
@@ -614,6 +662,11 @@ static int qca_download_firmware(struct hci_dev *hdev,
 	memcpy(data, fw->data, size);
 	release_firmware(fw);
 
+	if (soc_type == QCA_QCC2072 && config->type == TLV_TYPE_NVM)
+		qca_combine_nvm_calib(hdev, &data, &size,
+				      config->calib_name,
+				      sizeof(config->calib_name));
+
 	ret = qca_tlv_check_data(hdev, config, data, size, soc_type);
 	if (ret)
 		goto out;
@@ -845,6 +898,10 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 			snprintf(config.fwname, sizeof(config.fwname),
 				 "qca/hmtbtfw%02x.tlv", rom_ver);
 			break;
+		case QCA_QCC2072:
+			snprintf(config.fwname, sizeof(config.fwname),
+				 "qca/ornbtfw%02x.tlv", rom_ver);
+			break;
 		default:
 			snprintf(config.fwname, sizeof(config.fwname),
 				 "qca/rampatch_%08x.bin", soc_ver);
@@ -878,7 +935,8 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 	/* Give the controller some time to get ready to receive the NVM */
 	msleep(10);
 
-	if (soc_type == QCA_QCA2066 || soc_type == QCA_WCN7850)
+	if (soc_type == QCA_QCA2066 || soc_type == QCA_WCN7850 ||
+	    soc_type == QCA_QCC2072)
 		qca_read_fw_board_id(hdev, &boardid);
 
 	/* Download NVM configuration */
@@ -939,6 +997,15 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
 				 "hmtnv", soc_type, ver, rom_ver, boardid);
 			break;
+		case QCA_QCC2072:
+			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
+						  "ornnv", soc_type, ver,
+						  rom_ver, boardid);
+			qca_get_nvm_name_by_board(config.calib_name,
+						  sizeof(config.calib_name),
+						  "ornbcscal", soc_type, ver,
+						  rom_ver, boardid);
+			break;
 		default:
 			snprintf(config.fwname, sizeof(config.fwname),
 				 "qca/nvm_%08x.bin", soc_ver);
@@ -1001,6 +1068,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+	case QCA_QCC2072:
 		/* get fw build info */
 		err = qca_read_fw_build_info(hdev);
 		if (err < 0)
diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
index 8f3c1b1c77b3..425133096eda 100644
--- a/drivers/bluetooth/btqca.h
+++ b/drivers/bluetooth/btqca.h
@@ -94,6 +94,7 @@ enum qca_tlv_type {
 struct qca_fw_config {
 	u8 type;
 	char fwname[64];
+	char calib_name[64];
 	uint8_t user_baud_rate;
 	enum qca_tlv_dnld_mode dnld_mode;
 	enum qca_tlv_dnld_mode dnld_type;
@@ -158,6 +159,7 @@ enum qca_btsoc_type {
 	QCA_WCN6750,
 	QCA_WCN6855,
 	QCA_WCN7850,
+	QCA_QCC2072,
 };
 
 #if IS_ENABLED(CONFIG_BT_QCA)
diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 1222f97800f4..6fe3aab688e6 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1375,6 +1375,7 @@ static int qca_set_baudrate(struct hci_dev *hdev, uint8_t baudrate)
 
 	/* Give the controller time to process the request */
 	switch (qca_soc_type(hu)) {
+	case QCA_QCC2072:
 	case QCA_WCN3950:
 	case QCA_WCN3988:
 	case QCA_WCN3990:
@@ -1462,6 +1463,7 @@ static unsigned int qca_get_speed(struct hci_uart *hu,
 static int qca_check_speeds(struct hci_uart *hu)
 {
 	switch (qca_soc_type(hu)) {
+	case QCA_QCC2072:
 	case QCA_WCN3950:
 	case QCA_WCN3988:
 	case QCA_WCN3990:
@@ -1513,6 +1515,7 @@ static int qca_set_speed(struct hci_uart *hu, enum qca_speed_type speed_type)
 		case QCA_WCN6750:
 		case QCA_WCN6855:
 		case QCA_WCN7850:
+		case QCA_QCC2072:
 			hci_uart_set_flow_control(hu, true);
 			break;
 
@@ -1548,6 +1551,7 @@ static int qca_set_speed(struct hci_uart *hu, enum qca_speed_type speed_type)
 		case QCA_WCN6750:
 		case QCA_WCN6855:
 		case QCA_WCN7850:
+		case QCA_QCC2072:
 			hci_uart_set_flow_control(hu, false);
 			break;
 
@@ -1864,6 +1868,7 @@ static int qca_power_on(struct hci_dev *hdev)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+	case QCA_QCC2072:
 		ret = qca_regulator_init(hu);
 		break;
 
@@ -1963,6 +1968,10 @@ static int qca_setup(struct hci_uart *hu)
 		soc_name = "wcn7850";
 		break;
 
+	case QCA_QCC2072:
+		soc_name = "qcc2072";
+		break;
+
 	default:
 		soc_name = "ROME/QCA6390";
 	}
@@ -1986,6 +1995,7 @@ static int qca_setup(struct hci_uart *hu)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+	case QCA_QCC2072:
 		if (qcadev && qcadev->bdaddr_property_broken)
 			hci_set_quirk(hdev, HCI_QUIRK_BDADDR_PROPERTY_BROKEN);
 
@@ -2019,6 +2029,7 @@ static int qca_setup(struct hci_uart *hu)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+	case QCA_QCC2072:
 		break;
 
 	default:
@@ -2172,6 +2183,12 @@ static const struct qca_device_data qca_soc_data_wcn3998 __maybe_unused = {
 	.num_vregs = 4,
 };
 
+static const struct qca_device_data qca_soc_data_qcc2072 __maybe_unused = {
+	.soc_type = QCA_QCC2072,
+	.num_vregs = 0,
+	.capabilities = QCA_CAP_WIDEBAND_SPEECH | QCA_CAP_VALID_LE_STATES,
+};
+
 static const struct qca_device_data qca_soc_data_wcn6750 __maybe_unused = {
 	.soc_type = QCA_WCN6750,
 	.vregs = (struct qca_vreg []) {
@@ -2274,6 +2291,7 @@ static void qca_power_off(struct hci_uart *hu)
 
 	case QCA_WCN6750:
 	case QCA_WCN6855:
+	case QCA_QCC2072:
 		gpiod_set_value_cansleep(qcadev->bt_en, 0);
 		msleep(100);
 		qca_regulator_disable(qcadev);
@@ -2429,6 +2447,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+	case QCA_QCC2072:
 		qcadev->bt_power = devm_kzalloc(&serdev->dev,
 						sizeof(struct qca_power),
 						GFP_KERNEL);
@@ -2448,6 +2467,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+	case QCA_QCC2072:
 		if (!device_property_present(&serdev->dev, "enable-gpios")) {
 			/*
 			 * Backward compatibility with old DT sources. If the
@@ -2490,6 +2510,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		if (!qcadev->bt_en &&
 		    (data->soc_type == QCA_WCN6750 ||
 		     data->soc_type == QCA_WCN6855 ||
+		     data->soc_type == QCA_QCC2072 ||
 		     data->soc_type == QCA_WCN7850))
 			power_ctrl_enabled = false;
 
@@ -2498,6 +2519,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		if (IS_ERR(qcadev->sw_ctrl) &&
 		    (data->soc_type == QCA_WCN6750 ||
 		     data->soc_type == QCA_WCN6855 ||
+		     data->soc_type == QCA_QCC2072 ||
 		     data->soc_type == QCA_WCN7850)) {
 			dev_err(&serdev->dev, "failed to acquire SW_CTRL gpio\n");
 			return PTR_ERR(qcadev->sw_ctrl);
@@ -2576,6 +2598,7 @@ static void qca_serdev_remove(struct serdev_device *serdev)
 	struct qca_power *power = qcadev->bt_power;
 
 	switch (qcadev->btsoc_type) {
+	case QCA_QCC2072:
 	case QCA_WCN3988:
 	case QCA_WCN3990:
 	case QCA_WCN3991:
@@ -2785,6 +2808,7 @@ static const struct of_device_id qca_bluetooth_of_match[] = {
 	{ .compatible = "qcom,wcn6750-bt", .data = &qca_soc_data_wcn6750},
 	{ .compatible = "qcom,wcn6855-bt", .data = &qca_soc_data_wcn6855},
 	{ .compatible = "qcom,wcn7850-bt", .data = &qca_soc_data_wcn7850},
+	{ .compatible = "qcom,qcc2072-bt", .data = &qca_soc_data_qcc2072},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, qca_bluetooth_of_match);

-- 
2.34.1

