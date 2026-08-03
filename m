Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315931F4181
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 03:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785726943; cv=none; b=uKP+8qO5w2nB1mw64jDRE/FLPD50CZhn2eCxz037/5DgQ3Hyk4a6xDMHWfr3z0ZP1abOzBnng3g3Ifle2kosi/+y3i2R7sf2JdcOGq0h80GOFTekXCUd50fD0Ln68j5VrOe0qPNQcC0OXKxeSHpY4VmV6Wpl2+Pzw6pj5kL/tEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785726943; c=relaxed/simple;
	bh=t/IOKpp8GUwDRLwyyvCcudNrEhONnWVPtje8/6Ie4I0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q+EHlQiqfz5ZiZFj8Ato2FRSUNBmQp/FUuJMkhCN8rzKQzOFLXIq41pFsKDjakqxD4e8nqCZ/z9oE2q9dkzrORU2OWTTFKrhtdhixqGdqXUAKGMS2lD9pk9qO9Hdfvfp7Zh4dHyBVbW+wCiC+LYhmTo75Qir/yWCGJnJoH+SPPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gl2ElXTb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RDqClefx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gl2ElXTb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RDqClefx"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672LW2FK2210772
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 03:15:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pWnZBTr/2nG
	NSYHs6XfsEPFm8fpS+X1zNeHDN3jDRwE=; b=Gl2ElXTb1rqwr5yVfvLzKuB3qr1
	50BRwGJjDJG9YAdJQGKdfH0aYesuaHj5kLmtOKQ1VRQvGWvjRFjJtynkswXgYBgI
	FF6cLnIjSvSwdkC/H6gyElDMRWdWz38kUT3nxMpVyVliu5WyfIzGKtmNEGE3UiSB
	lkwmOkKojYNKmfwSkpMTgM5gLO7wnlfP2aoppxVxehqgCapharji3KVbZQ/9D+CT
	uDrS/EiR9oFJCcxe/Dfp4CBwG6uGYtBqyr9/PboXMsHEBCQ3CH0l8rI2deJ737Vy
	UZG4ynPw4DA38MUHzZIRaLrIdQImW7qYfxzFKJnx9fEjVz8oNRYb96yhBvA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftdmx8mm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 03:15:39 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb48f41343aso2857067a12.1
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 20:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785726939; x=1786331739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pWnZBTr/2nGNSYHs6XfsEPFm8fpS+X1zNeHDN3jDRwE=;
        b=RDqClefxOEhiTow+hAuF8u+wjtJIHnFqVtD9KR4MznIK6pXzJ6vEoYfQ/y78Wm+acE
         dSoFOmPA+/TJkRzkzLI5UambJtV3P0/2tNoQmyANWpTZueWDCMmFmqqsxa/n1FgsfBRZ
         MNScEjv9nae4rGDQpQDOlBIelMK0fvQloO5RZHNZxeV+NlhI147+GgssO9fc8fI3oLmU
         riHU/+lDDrkwE9sd+Ji1DA+mpjhNEpeil7RtLJjWn6kOzI5gnvY2WktguHkpA1aGcZRT
         F0TDuVp6VZclE4wTuFMZjaQWjP260QUmCxebYdqwNO320nMTzybApP+hNIzf3CVmcL5o
         ckPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785726939; x=1786331739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pWnZBTr/2nGNSYHs6XfsEPFm8fpS+X1zNeHDN3jDRwE=;
        b=rlUIM0cxFoX4LDTolukTSYjv5RGgA0m5XjwPZIrp90bwy94j0PWL7RZYF7CWKkeH9I
         YBOQQTQnDRnb42LmpHFYUtrtsQZtevn0Y73mKREKzvK/PCHmx+H5V11Cbw2qZMQr7UiA
         WQUtBrHgdpR48IGRdDF02gag2gd3a13G0n/PGZGEuFc7LLJn0z8fp+/cqT+w3Iqg3vZX
         g8YvMZ4+MUh7iAgKRkZA+4EuRxnS133NRswI9hEOApWeBDIvdjxmbl7LmtxzAZn8TtaJ
         rz/oOQA1aDEbENpoos/6WYbKW9i9TvyGvpd781TEUD6oPOiMzn/uvJx/O8cuoKo4C7Dx
         W/kA==
X-Forwarded-Encrypted: i=1; AHgh+RpMeZOpEwtKQjK5l1ev/f48kvYYZdCjfyZ7ekKfQZgWKEE5RJvqNbRQVL1/WE7xNS/gYHOxsE/Ra/hq@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl9GteKj1ku/ZaFhkZdp6p4hDfbmvuP+ZcCEvaj7UkjOSFT5W8
	hB3IeBmRTNMJz+ICD0VhsxXkVFk+5l5NTgKHlCLvQSKtho15+GJ8JR31yShymNU2u4mAyF2tyMy
	wyRJ4Br1Pjn3/CdkcaHUsNQo1DjOH1I7Zq61nGZmW/Eoa2WTRkRnzlcwYCer9FWA4
X-Gm-Gg: AR+sD11MouQAgZQGTyw5gI2nbGbiklrrZ148sqQ/7uaRy2Lao0BgZBNQRZCcHLjGSnU
	viwcJRFCfVEBcx7AKDCQUXxMRYu5ILfg6twG+rccNZ45erQkAbMJuMJLypKuaDxbU85bXBCGlRa
	3ZGk2CHIl9r2mNdw5sl5CiGkDUmdC07hjqLnOd7rAvEvg0vy1S1IIaog4nxdeSHb2UrO/dE+crO
	CFt3s2oJx5uheDwPVmMMkuZZe5T7CZ2kOBhqO0zlIiO1K5fALR9nda9TCveRNsryI2BdclC7P4V
	j2B8Pcbmn8OjPkSAVPG0PA/cQHDSrMNMp+fxp3c9Lh0F3+ORKWv7p5oYuea6PcE6EWmfMehQgwS
	zf1I02nT0KHxJNUC3JEwCkRPPhfgaTPtfwCm7H9FevcYuRAfeiSYlhw==
X-Received: by 2002:a05:6a20:7f89:b0:3c4:320a:737 with SMTP id adf61e73a8af0-3c91a7b7fadmr10394229637.16.1785726938659;
        Sun, 02 Aug 2026 20:15:38 -0700 (PDT)
X-Received: by 2002:a05:6a20:7f89:b0:3c4:320a:737 with SMTP id adf61e73a8af0-3c91a7b7fadmr10394195637.16.1785726938219;
        Sun, 02 Aug 2026 20:15:38 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c93dsm32585113eec.8.2026.08.02.20.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 20:15:37 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Peter Chen <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v5 2/9] usb: misc: qcom_eud: add sysfs attribute for port selection
Date: Sun,  2 Aug 2026 20:15:27 -0700
Message-Id: <20260803031534.2942628-3-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
References: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: aZJ0rDB1WfLrDVS0KALmgnt_dpU7kE-4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDAyNCBTYWx0ZWRfXzHGDeWeIiJKv
 n4cq+z0Cp1F8ZUtBVX10B2O6mureuyDSlf2PHSPe9YMFtkQv8+BWnxrrda2jwHz8DzXwHSHt7eM
 kwXGkpjOz5LTqFmdylSxF32XzVvs0VEfKTIdUevPL/rqESjmS4mHw5Rljr3MRyillVxTdHtaLji
 VDSihgc1EmfOLAcgpNQNCxq5xlY9Gv+uWA/M+Khxgie5EdN8FwVa+qoivYa8Gs4CYcOeC2Qr/Nd
 8PGfQmKQmbb3T28k9Vu4J92J4qWDhKSEePIU5DEHPXkIGkGMwfPITOHuhi3djAhNC4Qi1HBNLzT
 NfDDNZstm4kE35qXHcNEHorPnSf6hvhgqdGconlfmD/hyBbKx8GZ5b5YIJ1u41SD9Hpma1LuIg/
 k9bQ69DUJR7k5BulnsTdYJZXYrhM8j48P2OsrlknE5eGzCKedAc85Efw+grAsjvUMbPkIlhPTVV
 kBP5udSV10OdLfx7y4g==
X-Proofpoint-ORIG-GUID: aZJ0rDB1WfLrDVS0KALmgnt_dpU7kE-4
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDAyNCBTYWx0ZWRfX7jBGvh5sN7eQ
 TyRh9e5OEAIOaVDGqbQugO2yvPEQNi43ShN2c4h1PR9fUH+jYWfHputg3ZLYpg/1sDy7C3yrUEX
 fA561WTSU2R2K8OoL1ROh97RjAt1LMA=
X-Authority-Analysis: v=2.4 cv=L7MtheT8 c=1 sm=1 tr=0 ts=6a7007db cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=qXh0dugIJu6lbCvlF8UA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030024

EUD can be mapped to either the primary USB port or the secondary USB port
depending on the value of the EUD_PORT_SEL register. Add a 'port' sysfs
attribute to allow userspace to select which port EUD should operate on
and update the ABI documentation. This is needed for systems with dual
USB ports where EUD needs to be accessible on either port depending on the
system configuration and use case.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
Reviewed-by: Peter Chen <peter.chen@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 Documentation/ABI/testing/sysfs-driver-eud | 18 ++++++++++
 drivers/usb/misc/qcom_eud.c                | 39 ++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-eud b/Documentation/ABI/testing/sysfs-driver-eud
index 2bab0db2d2f0..fb927a003596 100644
--- a/Documentation/ABI/testing/sysfs-driver-eud
+++ b/Documentation/ABI/testing/sysfs-driver-eud
@@ -7,3 +7,21 @@ Description:
 		EUD based on a 1 or a 0 value. By enabling EUD,
 		the user is able to activate the mini-usb hub of
 		EUD for debug and trace capabilities.
+
+What:		/sys/bus/platform/drivers/qcom_eud/.../port
+Date:		January 2026
+Contact:	Elson Serrao <elson.serrao@oss.qualcomm.com>
+Description:
+		Selects which USB port the Embedded USB Debugger (EUD)
+		is mapped to on platforms providing multiple High-Speed
+		USB ports.
+
+		Valid values:
+		  primary   - Primary USB port
+		  secondary - Secondary USB port
+
+		Writing any other value returns -EINVAL.
+
+		The attribute is writable only while EUD is disabled.
+		Writing it while EUD is enabled returns -EBUSY. Reading
+		the attribute returns the currently selected USB port.
diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 926419ca560f..25a6a8f110ec 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -23,14 +23,22 @@
 #define EUD_REG_VBUS_INT_CLR	0x0080
 #define EUD_REG_CSR_EUD_EN	0x1014
 #define EUD_REG_SW_ATTACH_DET	0x1018
+#define EUD_REG_PORT_SEL	0x1028
 #define EUD_REG_EUD_EN2		0x0000
 
+#define EUD_MAX_PORTS		2
+
 #define EUD_ENABLE		BIT(0)
 #define EUD_INT_PET_EUD		BIT(0)
 #define EUD_INT_VBUS		BIT(2)
 #define EUD_INT_SAFE_MODE	BIT(4)
 #define EUD_INT_ALL		(EUD_INT_VBUS | EUD_INT_SAFE_MODE)
 
+static const char * const eud_port_names[] = {
+	"primary",
+	"secondary",
+};
+
 struct eud_chip {
 	struct device			*dev;
 	struct usb_role_switch		*role_sw;
@@ -40,6 +48,7 @@ struct eud_chip {
 	int				irq;
 	bool				enabled;
 	bool				usb_attached;
+	u8				port_idx;
 };
 
 static int enable_eud(struct eud_chip *priv)
@@ -104,8 +113,38 @@ static ssize_t enable_store(struct device *dev,
 
 static DEVICE_ATTR_RW(enable);
 
+static ssize_t port_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct eud_chip *chip = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%s\n", eud_port_names[chip->port_idx]);
+}
+
+static ssize_t port_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count)
+{
+	struct eud_chip *chip = dev_get_drvdata(dev);
+	int port;
+
+	port = sysfs_match_string(eud_port_names, buf);
+	if (port < 0)
+		return port;
+
+	/* Port selection must be done before enabling EUD */
+	if (chip->enabled)
+		return -EBUSY;
+
+	writel(port, chip->base + EUD_REG_PORT_SEL);
+	chip->port_idx = port;
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(port);
+
 static struct attribute *eud_attrs[] = {
 	&dev_attr_enable.attr,
+	&dev_attr_port.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(eud);
-- 
2.34.1

