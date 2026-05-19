Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991E9399036
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 17:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779210952; cv=none; b=W54/0y49OP6PNjP5Wu1buptMy3EkC+57CjUJhoqqX3DYxSy9DKqY9TWmvnF1IaHfTtl+uehj5nTgM1odLcKr2RY7gYMpBbRNlTlHRkcS8+xPDo2anFfi0VsPGdbA6rs/ZHwQt/SRUnsNRDp2K3YBVa3u/AUkFeuTCUzqmXydILw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779210952; c=relaxed/simple;
	bh=k7XS6g+yACWsz+lIJOxbyvEHuQON0JBUh1Zalmxh+qU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mBtAArK21vK0UQfL3AvQorh7rhm2k6I2boytm0bn+lQNQrrfJ2tGPcTEWNA9fAUBF2UEprIZzjR4/gDU94c11Tq+O4daMNCtohH/7JnNUZi39bujsEgsUY68Sd4kD/tKMagj7/QnPiSFr+fHdVstqqw3HfUc9kOuj8tlPb3g1CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YCbvO47G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jK60jVPj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YCbvO47G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jK60jVPj"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JEwpfT1637044
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 17:15:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=b0ycF5Fq5Oe
	oqByK3KqvktQxaoXUN5vjDwDOf+0yGu8=; b=YCbvO47GgEpfdToboN6JOusS/3V
	qNWgbNwVzdUHvhdsYvUqYqTAHrxQaIxblwUkm4wfkhI1BIabsMS5sc74/4SpRU/2
	fM1DdRsc7mcrLjtTT4ERqi9EfE4wvNAqpCeApnJ5IY5dxBqOUcC2V08IGQeGtj9k
	kbgwFqMSmmw9pZC9LJdCo0oa0jhNLx84wNdEasiMdWRBA7yJhuDGEF5AgBhEPns4
	OFUZ7DG0356f4pzw4S6Sb2For79r1VEB2ODeGRoWKrnfK04gpXBy5iBbrtWQaTuT
	0mKEPdYQKXUlBOj96IeYFUVp4num/dsHhoM5qvGqbneoOA5gYz2/Rzl5/Jw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3s8ntd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 17:15:46 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82fa2165c3eso2417512b3a.0
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779210946; x=1779815746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b0ycF5Fq5OeoqByK3KqvktQxaoXUN5vjDwDOf+0yGu8=;
        b=jK60jVPjBLLSrXfzRp3sWEMPeq8SNcMVnXskL7Y8OdwLoCIxYjQG25bYBGDWfZ7Lvz
         tcN5IJ7obBaW290qWaFIaeD2RvCES2gm/9BDagidPSr2I/0BGKt6YzVXzWNXJ/O1em/y
         EOS6yeX7VZBbpHi5VDDXugjgVAa6ybDi9HjPkng+bW0Kob9pG7jh49MjEYNcXEL9/+BI
         wirNTtoo0GC7qlA9JHwSo/YU23h2QSGSiSUTGpGqrFTT1FbRr3LVsctxrNIrRrVw1yb1
         ibj9Xnt+5m3VIKdHooKB/T7VRhqQFShe20dm7bCD9nUMuH3jhNikRE+vKfq5XvcB96d8
         0Pnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779210946; x=1779815746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b0ycF5Fq5OeoqByK3KqvktQxaoXUN5vjDwDOf+0yGu8=;
        b=KCmh9GFOBT15lyK4ZbbPPGHaJK1lv9voCEvOqV+2e/+NEmuNFnfsJZMSlzfYZGbIGM
         01kAvdfL5wm73yzaZKJV4/8UBG8OBBXNAFrXLtyFJCnLkwTF9xv124HUN8qcpUWv8jmk
         xjulY85mK3ASe6Xv6p+w+3lFfjs/NS+wd9sEJVXqYlkzZzlYuVML2scyF7yPXRMLICNo
         B+P/ZoLcxh5JZr8KstzROpTObw6VutfYzPWIafquRaUbRvDj2z5SXOm9q6BVe+llwt2R
         GDYvTgN1oRrLcixPAHYxXHDp6A3pR6HEX3fx7/CJfFeyW0sFpCtWh849zkMA0+nBiAYf
         HQmw==
X-Forwarded-Encrypted: i=1; AFNElJ+oxX0vor2W1rcnddZHpN5CRnQC4VcMlzf8YqokJz00cOxYrKPdW0KZQLE9/hJ5RYnerjrRNCCRwwBz@vger.kernel.org
X-Gm-Message-State: AOJu0YxxlZP8055on+sXSibhip2RmRJFox9+I+prxlzKxd2YZtMa2g2X
	lplZzuzsmgoMIUonMs8camMLPabpfUNsxVmAchSFar4yAMMWHJ/rGS4bqftHpTRspuWKHmlOLwQ
	5IFkUWoOhNBFjv//L2rObt/4T3Dd7wx0lt3QsoHlfct127/taFGdJiAYd4sJjvnT+
X-Gm-Gg: Acq92OERo15Z0F5O9os31Hy3ymgTjnhMBmbtb1nAPf2GY50H7uBqsQwhTwOEABPk3OS
	LsIZ70f3d47/urb4AW5GUBfYOl9FzQontyvHYUaPW6WYr1XOo17vOvVFd9qwg0x2OUSvq5xAuyV
	4RexyYIDCeBu4j9TFyGgA6c6rllmsNn04NIPsVajVbfHHZbXShtnQ6MoL9EXIW2Me2ZRAZ9CMdV
	EjVlM0vc0rpe4BqKGY8ShJDy9gP7BlzXKw5Z0QRF3XuGMYNx5/8frnm9S6PJfsiuoh6KoF6Ljx+
	82tUglRxN8Q0tgcU0Cp/jcKRg4HQbkHy6l6RNXkrDltV5MkZ8zHkShLpMN1RRJqfeAu9sblA9hV
	Lm0TbmmFGVW74ErAvetcaajQHInQVekzI+GqX45nkEc+n2jmX
X-Received: by 2002:a05:6a00:a203:b0:837:7e7d:3d9 with SMTP id d2e1a72fcca58-83f33dc529amr21144310b3a.44.1779210945372;
        Tue, 19 May 2026 10:15:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:a203:b0:837:7e7d:3d9 with SMTP id d2e1a72fcca58-83f33dc529amr21144248b3a.44.1779210944514;
        Tue, 19 May 2026 10:15:44 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c77822sm18634720b3a.41.2026.05.19.10.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 10:15:44 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 3/4] firmware: qcom: scm: Add minidump SRAM support
Date: Tue, 19 May 2026 22:44:41 +0530
Message-ID: <20260519171442.1582987-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519171442.1582987-1-mukesh.ojha@oss.qualcomm.com>
References: <20260519171442.1582987-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE3MiBTYWx0ZWRfX/Nkaj8YBs37v
 LIdwFKbQiXbRHqsePP4vsJrPV1SYD/bz+zJ045qSdm1KqI5Z9jNIqIKzKNgh5G88q8RF4CDj0hD
 8BBiFVJ0EpwbUpu0nwAbzr+ko/MKKOkqAiqMcf0BvgbmpygBpsfZADg18RPuhlmuOUl1p4Dq8lk
 tZtobYa7CWQXfE7ARuRAuyYWM9z3tl0eOm4rDkP3CKViAV+S9iyBXtROO3ad8AdYoIqdGh0xQe5
 Pf1Gf0nSkfQD2xlRqwycCkUknrkdUL6gSXrqlaLbF3awXQ4Nm2KfcIXmKhXRJiKfrXaBPAT4Kq+
 2IqmN5qUOFqCj4P259tgPk8uELgbRjoNIqOCeg1J4BHmxtutqCIPInX1lRi/5/ZewDNBd22gKzU
 trnVPErN2h+Ve7N88qDkmvnW2kaYYkhuKPHK/E1VaNi+w9g8SOk3LNvs2jY9b8yEeIpDl1+bqFX
 BazAofTPSenU8dpDnhw==
X-Authority-Analysis: v=2.4 cv=Oc6oyBTY c=1 sm=1 tr=0 ts=6a0c9ac2 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=rvpxAYJ4qTt-cjm6DxwA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: g_RYuBvxBDapnEUtXq1BSA4UP3rg65ZY
X-Proofpoint-ORIG-GUID: g_RYuBvxBDapnEUtXq1BSA4UP3rg65ZY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190172

On most Qualcomm SoCs where minidump is supported, a word in always-on
SRAM is shared between the kernel and boot firmware. Before DDR is
initialised on the warm reset following a crash, firmware reads this
word to decide if minidump is enabled and collect a minidump and where
to deliver it (USB upload to a host, or save to local storage).

The SRAM region is described by a 'sram' phandle on the SCM DT node.
If the property is absent the feature is silently disabled, keeping
existing SoCs unaffected.

Expose a 'minidump_dest' module parameter (default: usb) so the user can
select the destination. Only the string names "usb" or "storage" are
accepted; an invalid value is rejected with -EINVAL. Changing the
destination while minidump mode is already active updates SRAM immediately.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 91 ++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 52432469badc..e3d5973bf567 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -57,6 +57,7 @@ struct qcom_scm {
 	int scm_vote_count;
 
 	u64 dload_mode_addr;
+	void __iomem *minidump_sram;
 
 	struct qcom_tzmem_pool *mempool;
 	unsigned int wq_cnt;
@@ -141,6 +142,18 @@ static const u8 qcom_scm_cpu_warm_bits[QCOM_SCM_BOOT_MAX_CPUS] = {
 #define QCOM_DLOAD_MINIDUMP	2
 #define QCOM_DLOAD_BOTHDUMP	3
 
+/* Minidump destination values written to always-on SRAM for boot firmware */
+#define QCOM_MINIDUMP_DEST_USB		0x0
+#define QCOM_MINIDUMP_DEST_STORAGE	0x2
+
+static u32 minidump_dest = QCOM_MINIDUMP_DEST_USB;
+
+static const char * const minidump_dest_name[] = { "usb", "storage" };
+static const u32 minidump_dest_val[] = {
+	QCOM_MINIDUMP_DEST_USB,
+	QCOM_MINIDUMP_DEST_STORAGE,
+};
+
 #define QCOM_SCM_DEFAULT_WAITQ_COUNT 1
 
 static const char * const qcom_scm_convention_names[] = {
@@ -568,6 +581,14 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
 
 	if (ret)
 		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
+
+	/*
+	 * Write the destination into the always-on SRAM so boot firmware
+	 * can read it before DDR is initialised on the next warm reset.
+	 * Only written when minidump is active;
+	 */
+	if (__scm->minidump_sram && (dload_mode & QCOM_DLOAD_MINIDUMP))
+		writel_relaxed(minidump_dest, __scm->minidump_sram);
 }
 
 /**
@@ -2040,6 +2061,37 @@ int qcom_scm_gpu_init_regs(u32 gpu_req)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_gpu_init_regs);
 
+static int qcom_scm_map_minidump_sram(struct device *dev, void __iomem **out)
+{
+	struct device_node *np = dev->of_node;
+	struct device_node *sram_np;
+	struct resource res;
+	int ret;
+
+	if (!of_property_present(np, "sram"))
+		return 0;
+
+	sram_np = of_parse_phandle(np, "sram", 0);
+	if (!sram_np)
+		return -EINVAL;
+
+	ret = of_address_to_resource(sram_np, 0, &res);
+	of_node_put(sram_np);
+	if (ret)
+		return ret;
+
+	if (resource_size(&res) < sizeof(u32)) {
+		dev_err(dev, "minidump SRAM region too small\n");
+		return -EINVAL;
+	}
+
+	*out = devm_ioremap(dev, res.start, resource_size(&res));
+	if (!*out)
+		return -ENOMEM;
+
+	return 0;
+}
+
 static int qcom_scm_find_dload_address(struct device *dev, u64 *addr)
 {
 	struct device_node *tcsr;
@@ -2733,6 +2785,40 @@ static const struct kernel_param_ops download_mode_param_ops = {
 module_param_cb(download_mode, &download_mode_param_ops, NULL, 0644);
 MODULE_PARM_DESC(download_mode, "download mode: off/0/N for no dump mode, full/on/1/Y for full dump mode, mini for minidump mode and full,mini for both full and minidump mode together are acceptable values");
 
+static int get_minidump_dest(char *buffer, const struct kernel_param *kp)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(minidump_dest_val); i++)
+		if (minidump_dest == minidump_dest_val[i])
+			return sysfs_emit(buffer, "%s\n", minidump_dest_name[i]);
+
+	return sysfs_emit(buffer, "unknown\n");
+}
+
+static int set_minidump_dest(const char *val, const struct kernel_param *kp)
+{
+	int i;
+
+	i = sysfs_match_string(minidump_dest_name, val);
+	if (i < 0)
+		return -EINVAL;
+
+	minidump_dest = minidump_dest_val[i];
+	if (__scm && __scm->minidump_sram && (download_mode & QCOM_DLOAD_MINIDUMP))
+		writel_relaxed(minidump_dest, __scm->minidump_sram);
+
+	return 0;
+}
+
+static const struct kernel_param_ops minidump_dest_param_ops = {
+	.get = get_minidump_dest,
+	.set = set_minidump_dest,
+};
+
+module_param_cb(minidump_dest, &minidump_dest_param_ops, NULL, 0644);
+MODULE_PARM_DESC(minidump_dest, "Minidump SRAM destination: usb (default) or storage");
+
 static int qcom_scm_probe(struct platform_device *pdev)
 {
 	struct qcom_tzmem_pool_config pool_config;
@@ -2750,6 +2836,11 @@ static int qcom_scm_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, ret,
 				     "Failed to get download mode address\n");
 
+	ret = qcom_scm_map_minidump_sram(&pdev->dev, &scm->minidump_sram);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to map minidump SRAM\n");
+
 	mutex_init(&scm->scm_bw_lock);
 
 	scm->path = devm_of_icc_get(&pdev->dev, NULL);
-- 
2.53.0

