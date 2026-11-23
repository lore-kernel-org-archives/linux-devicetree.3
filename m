Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458533;
	b=VdTRkaZEKjelMJ8/JhWLRHzTaZ7Pp8FuCbx33CPLAYKbBT7rdbwOk/WFxJf0PLpd7fb1
	 1CXNPFKjr1S58Y61vPKRrmmW7w5jAryYrv1XTfT+eBei6UcTvoIc+hWKaMVY4N47TXacn
	 fWHTCb0QMUI6meLq+UPrR0jIFOgfn528iTRNanNeHGvSzZKN9HLYp6g60+caifOZTIokS
	 9GfBNasTdtMvsv+sIlaFP9Hy7kZHvBXJVOWdZFCgoEgeqZ4t+ZuzkZDjzuoqKpbTkOPqt
	 2isMucGQwpA7CLDyMVJF0EWIp3d8KsvWtyffimxBIliZdQHoZKpvM4d/aDGS0O2RoPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458533;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Lq2ckgeFeyG4ruGkCS4DwzZ4m7ssUVEezBWNCadpNus=;
	b=abmv/VpzlizP/oesVvslbm3APV5IhjDTWie5up1naUM/tIef7/Tto0benKXI0AL6H95Y
	 vuX5AShERhYawt4zK65MKpj2qmanesTOjlh/ctNmm2UFbqUvvxB2kwgE64IMsX+SYgZmX
	 JzVSE48fQZFQ3hsPN9ePUv6mxRKNnJ9zNbxUVELoR0PPas9jT1aC/N0d8RtkCCUS+c9YJ
	 bjN1q+QfK6NE0TdHh1oVT4LOtqjaUxmaha2Es6Uajs12QKQ/HX2G/BW5izhjbkbcd0lgI
	 YDY6SaiacpIZdlL/k8FWZbqDJ5XmO6de986bJd3RmWEds74Sqpl6K2O/SdbHlAxtw0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QgmcNHRw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PVfKytR7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783E5606A68B
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 18:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 783E5606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QgmcNHRw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PVfKytR7
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGjZ83025208
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 18:28:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Lq2ckgeFeyG
	4ruGkCS4DwzZ4m7ssUVEezBWNCadpNus=; b=QgmcNHRwOTYFltbEnU8CT6eWZm4
	WXkbo1fYHF5B6WuTtNV2ePmUKqi/DuCVN3/pVec9kVHtH65Mc+wbqHnDno2lAZmz
	hoYYCMciPSTtJ2ZV44G+YejYZKwrGjjc/0rPGuDm9MlAF+Xmfe+CdG7mkSMresh+
	1YHX5ztPz6VE8AMXQU7/G7JXDePrPCDcUe+0UD4Ajd62YKiPFuswrEC53TSj1W6T
	zBSyB/dF7BO88Ucssq62fXRYMNeRNSafS/CrAFcdBtyyqu6OtoMW2Z4Ztddvd+x/
	sg8dcebxjggFGd1GnTBiDla8MUhhRinwCf4bGrNoC0EANF5WXcRmqAmnIkA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pauy5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 18:28:52 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-382af5cfc58so1498467eec.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795458532; x=1796063332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lq2ckgeFeyG4ruGkCS4DwzZ4m7ssUVEezBWNCadpNus=;
        b=PVfKytR7uyik7EOhP3PMKvv2wSoWbchKb7P5srh9XzqXBy+D4JROiV7AP/Eaf6zJXk
         d+ac3+FpunoRRZ+FYoRUEvDqQTTbe+/4NeWVNbMNpSGUq+xTtQvLBhmd4b4iT/ssPRHa
         LUeGqC0NKd7OmsbhunKBDGznH3+3Jzi8pAy9lkyDC/qyf93ZcRAq80q28fvlHNIwf22L
         C0qTc6RkUVoWuHIal+Inm+yS4CaElGhhnFSDrjX4VCPvFduVdfk5qk43kb9Ytr0FkVik
         QbkJVcjLJJ7d/LQUnqNGzPvejSF4txn6besl++DXs+Is6yz7OgzjSAiGWLBINy9RYJQg
         1TEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795458532; x=1796063332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lq2ckgeFeyG4ruGkCS4DwzZ4m7ssUVEezBWNCadpNus=;
        b=R3GPPRwHqu+ZrDwT1jlS2n6dzOpzL+2Cr86Ot7CgIFAT5/WXDGKExu1ZHxEqX+ZRpi
         HcmIqtPWIc/YGjO1vVUrg2n1cOZi0dPMkMQsKcOKtl0Pq9sB/ZMNv15eWyH5wYWuKDY7
         UqBkOC6slNOKm5uzvSnGm4nlCNhwAr1GhSuRgDu0IzNb8viYf169Q0ohxygvHAxGxuw+
         PmHW02PnKvZzjhqPvpi64eX4ai0cBofIxmii+tC21iK2jABnmXsaV4fY9YGkWvlsEHSx
         vFkzKj3/4b7ya/rk53s19HH2S6hEyworz3XrdYMRWVMyQyzGyskV77L+T1bWIGm8dBKi
         w73A==
X-Forwarded-Encrypted: i=1; AL+hErEz3TieD6ZtZJMS51TBwLh1GIzliG5tRZ8mPi8l4w6THqNGP/ykUgQ3D6RAU2QYo0J9EGPrD+gjQGlw@vger.kernel.org
X-Gm-Message-State: APuU4Z9Lh+91xEw94UKNM2Sv5v33E0zB1WIdRnN5L/mNmiI1iEShXVGJ
	wvl0Amb3spmv/QUVbj0LXgEhMNcLIX/FEyjJcUW0EKRiM/aRvhFYh2Or4pVZbzd27fzQWak+0w9
	a55Ey3w1AE7VyMXT5eQojUWvF/ky6fNfKJZHxaxzPwB93rLz6DQjDVC0xOSlBENLY/26fYT7r
X-Gm-Gg: AZFdTZfwegr3oeesFdXAI5BJUdU7pHj8rWfs4bYuaKjBKicg23Zo5TRFqUultROcq8q
	3kD0mczOIyMu1x9Z41hB7tUL1L3EWez7G1lVYD4PDDgFg8sUZSvSuEeTaI41815WYYo81mRwKSF
	L5x+fYykD1n2y1N0hcNQ0jLfj0hVjvF1oiol3ZICwpVbU6SLD29uy8vNXhgExaLtK98QWJb0UFK
	btuuJNMi0Ynq73twCOLbZqJEWY1QyRgtBGTP3bjBdbMHPYdN+hK6vZg3GVq8WYaquuZ9We9X8BC
	qrDdE9J2nfxjXNBluETkuSi2x7idltKIErxLVz7cMsCPgXDbl08ZESFw4XJYf/j9rIiJ4Zuy6E2
	CJpw9/Wenl0b/hO61yODdoogcOJG0MaEeoyPxY/Lkt80L6GaGCSCoht0dgXLEIWLQzJjy20bcvy
	lrCjeze5vgmQ8fuKiK8B1iAq0yEQ==
X-Received: by 2002:a05:7300:2209:b0:386:8d2:929b with SMTP id 5a478bee46e88-38608d2945emr17643553eec.23.1795458532082;
        Mon, 23 Nov 2026 10:28:52 -0800 (PST)
X-Received: by 2002:a05:7300:2209:b0:386:8d2:929b with SMTP id 5a478bee46e88-38608d2945emr17643507eec.23.1795458531488;
        Mon, 23 Nov 2026 10:28:51 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm47697986eec.5.2026.11.23.10.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:28:50 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH v10 2/7] usb: misc: qcom_eud: add sysfs attribute for port selection
Date: Mon, 23 Nov 2026 10:28:42 -0800
Message-Id: <20261123182847.143892-3-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123182847.143892-1-elson.serrao@oss.qualcomm.com>
References: <20261123182847.143892-1-elson.serrao@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: V1ydZbddfyRdNDq1Sq3qFXmIMpJ5Zj39
X-Authority-Analysis: v=2.4 cv=K+O3jCWI c=1 sm=1 tr=0 ts=6b0485e4 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=qXh0dugIJu6lbCvlF8UA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfXxY/AsakBRdRv
 l4y41PvK5DdJo8rQyroANor6xZ7G4GySnDK/z3ltS2D5TiRXBS0+iZ9xvJXTrRZR/aOJ4/4bPFr
 FqYlufTOwZa0Ffef6MHlfxROvr3UFlk=
X-Proofpoint-ORIG-GUID: V1ydZbddfyRdNDq1Sq3qFXmIMpJ5Zj39
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfXzmxBZyFvJypg
 MPHR0lCRzHqELRLWbJRNZbnCRuEzySLLsOhgd2LNT9qzIwoMiiKoMqZnWMqBdwdmUDeKbbzUAap
 rpJhMC9vqkQKzv2EjJPDPwQPDEeiww7PvlI9I6lZCOOLF7/LoPwu+T9PhMO+datbifg0ncsUHxw
 gTJdx7hOIrGExKiN5ohALf4nP1q3RgvL7j2/p2CfeNzb1v3oP6k4HvrC7yn3xRlpSujdfv6XpEA
 y6Kco3BBFvSec3ty1viDCRXt3wmHJu20Pua3hjXLHbf+Dbn73sxCorONCNMcxUyRF9jGU/kBdXI
 EuuavGXNHGiDro5t+f07hO1g3oAAS3B/c4I/jefbSGozD4NYCjNdusW1LoYXu/1e1y+Zwuleeja
 Z32LpFLvSbPDTlgcadK3t+BK9xxK/H6XCUMdAfKNn/64U6bNn3tMKAGLY/jhzz7CasmX6GsACQT
 l3CN1DPdPdPunIHeHqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230073

EUD can be mapped to either the primary USB port or the secondary USB port
depending on the value of the EUD_PORT_SEL register. Add a 'port' sysfs
attribute to allow userspace to select which port EUD should operate on
and update the ABI documentation. This is needed for systems with dual
USB ports where EUD needs to be accessible on either port depending on the
system configuration and use case.

Reviewed-by: Peter Chen <peter.chen@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 Documentation/ABI/testing/sysfs-driver-eud | 18 ++++++++++
 drivers/usb/misc/qcom_eud.c                | 42 ++++++++++++++++++++++
 2 files changed, 60 insertions(+)

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
index 73f9fac22e19..3e4647acd5aa 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -23,13 +23,22 @@
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
+#define EUD_PORT_SEL_MASK	BIT(0)
+
+static const char * const eud_port_names[] = {
+	"primary",
+	"secondary",
+};
 
 struct eud_chip {
 	struct device			*dev;
@@ -40,6 +49,7 @@ struct eud_chip {
 	int				irq;
 	bool				enabled;
 	bool				usb_attached;
+	u8				port_idx;
 };
 
 static int enable_eud(struct eud_chip *priv)
@@ -104,8 +114,38 @@ static ssize_t enable_store(struct device *dev,
 
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
@@ -218,6 +258,8 @@ static int eud_probe(struct platform_device *pdev)
 		return -ENODEV;
 	chip->mode_mgr = res->start;
 
+	chip->port_idx = readl(chip->base + EUD_REG_PORT_SEL) & EUD_PORT_SEL_MASK;
+
 	chip->irq = platform_get_irq(pdev, 0);
 	if (chip->irq < 0)
 		return chip->irq;
-- 
2.34.1

