Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814900;
	b=N9+mKmwK4waNcCztL4NT8nqi1qxly+Kcctt3AtNdPYPhrEBGXjCo/XCrsLGxcxXvQJMO
	 wlVxmqjlubK6IzQV0K1fVfLgrPLanvnBsFQLlerhpdngsQQMVBBU4LX4OoOeIIu2jeXpM
	 HwHBReoFe7WFbicKrW5mRFbLfC1vHCp1Yb47bnH/yIn2MYXVkLhTyE7ir3PfVQYJAyhnR
	 0LE/zKScblieip9esEB8YFIlno1wZvUUX4qrDt8lJgDrxOiUdRF6ZnDD90rN0bF06yGvW
	 IYLwG1ot4MbYaYkg9jsi6COq5FaYKwtkYqyj+Qglw/AK1oWteJ9FOqQmjl8EabAmePg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814900;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gG+nqVaWG3Uc8lKpMqhODfiAaBo0/gdCFWDts4D4Jyc=;
	b=kAQqkiR+HnMw6bMDiJuFF7Tv6S37M47nXg4NtmvWR145KJUhTMCR+r9sGywsf7aYxDFZ
	 bt5xr9QAyOtFDZ8VMQrfkNSE1hBQlPvz3vFWw6r3ok4A7TrwCtZ7UADmY4hR2n0gU6WH3
	 FJbOXwuWG9OT5CvlRSrRHhIy2nSQcW3Nhgl5zFiQ5yXJra8TXFYN4pKK2iqlyR0hEcL4C
	 Gk0LpZVw7AsJ1slIjZSxy83nEXcwxoXAZ6+QRl1SmPvNSxdjlJW/L/agbR+ujq3BAne/3
	 tmhasLqBJUF68vcntpDZJnpnmKKOeN1tLL9YEIi5xWi2IXgDahiAwy4QbkdT0rVqHxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fiD7pAi5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VGgsOagW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF21606A31C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FF21606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fiD7pAi5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VGgsOagW
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7et5O524918
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:41:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gG+nqVaWG3U
	c8lKpMqhODfiAaBo0/gdCFWDts4D4Jyc=; b=fiD7pAi5zEstA8r2Vs44yFkqR4X
	YvvFq4o52bSRYK48HE3aQquJlX6w70anF31TAXrQ1eJdQ0xX84w7A3lTBMyh4uf8
	GDH9NSWhY7V5P44oAiF2I/pzBGcs7KiTkHiZmNyLcuqnqQokHS8jAJflVfG5tAhX
	9Pgejhz7no8XiyEPWmu6DxmFuJ4ezoGWC9bjIkaQoCCo4vL7zLycSIyEovbWPoER
	CWXAsaadk2p/vpIu8+mV3ai1DSR2P6GiQobPkbwPR0WWj+wvLIC5eSd4FSt77ilS
	ixsJdNilDpEsS0dK9FVYg7fPnLisGW/dbJU0MxZ5EdiGe8S238tw+Y3ZNhg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqnga9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:41:39 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a3451ea93so3254614eec.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 23:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794814898; x=1795419698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gG+nqVaWG3Uc8lKpMqhODfiAaBo0/gdCFWDts4D4Jyc=;
        b=VGgsOagWNNsOA3nfb5HWNgKKp/k2uhs412HNm96pKHoCrjfnJc0hTNhCqeN8ul7wNv
         8r8YZ6Sr+qhOopKYFJtM58b6YRMJP+FuAckzYitTC08TPQldNV6cFhcLTfS6vuwVzkP/
         ctQt73DiM47ZYv0kXxBuOwrQ5xe+8K6/SUovnYF7t/QrG3qFfSWlsgCtAR7j9GpkxNaO
         o2CI6rxPt5Qha5WIdA61tgrsTU+xfuST142c32aVdKZplSZpkAU7aosHDBPXGZGjpVqu
         vgwW1iO4URU74xqzkJ86FCYWlF9ER7UhuG0i2VBkdv+mJ0GB/xIrwoLSWaiCVBzDHXXp
         zhpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814898; x=1795419698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gG+nqVaWG3Uc8lKpMqhODfiAaBo0/gdCFWDts4D4Jyc=;
        b=w2E6I6J6DDkgvsmF7s7hoc39Cb8EadI0JcDNEJk1WL+cl4vPJBU9fS+kKq3eOAPECh
         ve8TlORVAm8zJO/09DayjDs6cxe0sZAVtn9J2q47EHWJEVMPLlomi8T+ofn65+LrbTsy
         EptIbyu7pZfn+oSjWY1vqVieZKZrkt/hns1m6+8Yy1AF1fXm1HjjAWx/g8g2qbkAFNx2
         ac6gVQGa+QJofMgprczIR6MYLpxzfHEok/KHaK5yrBMdkXke3f3OYIHC+MSXPTb599FA
         7SQ4RnPK3xtLYM3fbzkePTjOGcxvO13eo40FvShXALsSc63Rl6Z2fQq50T/QpauxMRKY
         EE4Q==
X-Forwarded-Encrypted: i=1; AL+hErFWT2DnRczmg1Fm+BTq1s8Zj4N3qZU4ShnLH2tTempo6vQdnVCkgizTBgy7sFBgczOdkEQjgMttAGez@vger.kernel.org
X-Gm-Message-State: APuU4Z8QUPmbykX/6ZnQgxyORENKmASnVcPC0kBMWe6A/f7sYisjhnPo
	Hu7cYfjImwBXI8syeK7WaJzFNY/B5v7Z91ZyvTelgomT19mxMyJ2e/PY1FY4ZgK4579VQSKW2K4
	Uz2SsV4vW58mp14rA9zqscXnWfRqFkOI6CBMbw11kS8rBlyz7wnV3HFrnKyiwSf7t
X-Gm-Gg: AYBFou1F6AmHgh5YYUsjoPI/RBXiQ44Vg0yAcaNX+y1HG3bs3ZfexfzioAqGi+EhibU
	xZXQ18PlB59JgOSYWhnbJ8ylLVJCT3AcJQan7RyrK947gswa71T/8+n0yY9JP7RnDyIp0lj7Mkw
	P46jlD06ke4Edm+17oKKY2f/xDsFhEX3ZiFRv/aj1hGqozo5a/BYF3HitSH0YXh9EDfWRcf9CuG
	I2SCrppRxaokIAuJPOQVQ5SSiTDDNdUyczLtvzBR7EnoRsMEGvxre6Vi4GepLYsODRLgxsOthjx
	DHWmU4R41LRk/pYMmBwwjrUdFAJ+hq3CoRXPdm5uYbVQKk/GxuvB95QWhWNnDpKbMUAhyOD2Ozv
	Oqt5Ic+JtvSqpeaNVhbAhLh44po1ItZO0MwRQfWXpZqkji6nxWYxOw0XJyGjJuVPR6I6SHjtIEK
	64pBIygA8ykvmcYnElMOZtS1JJ/yBu6P+wnA==
X-Received: by 2002:a05:7300:8284:b0:36a:1f8:a589 with SMTP id 5a478bee46e88-37966e3b0dfmr10492313eec.27.1794814897990;
        Sun, 15 Nov 2026 23:41:37 -0800 (PST)
X-Received: by 2002:a05:7300:8284:b0:36a:1f8:a589 with SMTP id 5a478bee46e88-37966e3b0dfmr10492283eec.27.1794814897499;
        Sun, 15 Nov 2026 23:41:37 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm52137536eec.25.2026.11.15.23.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:41:37 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, songchai@qti.qualcomm.com
Subject: [PATCH v18 2/8] coresight: Move CoreSight management register defs to linux/coresight.h
Date: Mon, 16 Nov 2026 15:41:12 +0800
Message-Id: <20261116074118.822731-3-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116074118.822731-1-songwei.chai@oss.qualcomm.com>
References: <20261116074118.822731-1-songwei.chai@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=KelHIgYD c=1 sm=1 tr=0 ts=6afab3b3 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=37ODTpUNugoFd_DpGuUA:9 a=PxkB5W3o20Ba91AHUih5:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzMCBTYWx0ZWRfX58dUncjZhXEz
 OGCaJ5+/eykFbDXi6BPDh52hzTZK0BnCsFpxxUGLVSNVXI6fmHB6l+AOwg8T41cC4B5oOfRrW7A
 9zguWIDMqS25wMCu9fUzckdLTmdNL0E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzMCBTYWx0ZWRfX4LugNvG03hWf
 4iRGqJqzUsIMv0brTkdWTt0K7SIZZqK4i5MTFma/xRModdN43PGReGAwPXzRqVvwiqABu4AcIQR
 yOgB8Mn5Ixr8cS/AoDsJcAOnJstCKFBXw5JaNL3Wq4dq3ieOVXUDKXKYr6FXDJyemktLaoKfCKH
 2fYaApuhsVi+n/VtLxQinuSHiFSgr51n1nWuM0ppwoZN1qZLUgYw2N0EiRIxZZJHA9NGIwD65hE
 sSa1rEU821SF1OIutQo6nYoy8jpzJGn+F4OqkhGaiqxHXI/Fk2ppqIh9TtRF1fFL7q8S7Wyiur7
 JaXPYlT8I0UNNl6RSEKLsy0dmPc2un126nZhBEPEOrE8AbFAk01hf4VW2AN/z1BSfYzjzZUviLl
 jekEyMqQobHfhWo+53srN89WECnYUJRf3iwMG+RjzQYUU9xP7YzeBozwjUgNU9npLc7ZhLFHAVt
 feGJ8VpF7XXN7QPVo9Q==
X-Proofpoint-GUID: XtbFQE6EqaPa6x5NninXudpuBuhUjqjN
X-Proofpoint-ORIG-GUID: XtbFQE6EqaPa6x5NninXudpuBuhUjqjN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160030

CORESIGHT_LAR and the CS_LOCK()/CS_UNLOCK() helpers implement the
generic ARM CoreSight Software Lock Access Register sequence, which
is also present on non-CoreSight-labelled components that follow the
same architecture (e.g. the Qualcomm TGU). Keeping them private to
coresight-priv.h forces such drivers to duplicate the exact same
definitions instead of reusing them.

Move CORESIGHT_LAR, CS_LOCK() and CS_UNLOCK() into the public
include/linux/coresight.h so they can be shared outside of
drivers/hwtracing/coresight/ as well.

The remaining CoreSight management register offsets (CORESIGHT_ITCTRL,
CORESIGHT_CLAIMSET, CORESIGHT_CLAIMCLR, CORESIGHT_LSR,
CORESIGHT_DEVARCH, CORESIGHT_AUTHSTATUS, CORESIGHT_DEVID and
CORESIGHT_DEVTYPE) were still defined in coresight-priv.h, splitting
the 0xf00-0xfcc management register block across two headers for no
good reason. Move them into linux/coresight.h too, next to
CORESIGHT_LAR, so all of them live in one central place.

Also add CORESIGHT_DEVID2 (0xfc0), which is part of the same register
block but was missing; it will be used by the upcoming Qualcomm TGU
driver to discover the number of implemented timers/counters.

Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-priv.h | 34 --------------------
 include/linux/coresight.h                    | 34 ++++++++++++++++++++
 2 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index dddac946659f..c365cd881e4f 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -15,22 +15,6 @@
 extern struct mutex coresight_mutex;
 extern const struct device_type coresight_dev_type[];
 
-/*
- * Coresight management registers (0xf00-0xfcc)
- * 0xfa0 - 0xfa4: Management	registers in PFTv1.0
- *		  Trace		registers in PFTv1.1
- */
-#define CORESIGHT_ITCTRL	0xf00
-#define CORESIGHT_CLAIMSET	0xfa0
-#define CORESIGHT_CLAIMCLR	0xfa4
-#define CORESIGHT_LAR		0xfb0
-#define CORESIGHT_LSR		0xfb4
-#define CORESIGHT_DEVARCH	0xfbc
-#define CORESIGHT_AUTHSTATUS	0xfb8
-#define CORESIGHT_DEVID		0xfc8
-#define CORESIGHT_DEVTYPE	0xfcc
-
-
 /*
  * Coresight device CLAIM protocol.
  * See PSCI - ARM DEN 0022D, Section: 6.8.1 Debug and Trace save and restore.
@@ -116,24 +100,6 @@ static inline void coresight_insert_barrier_packet(void *buf)
 		memcpy(buf, coresight_barrier_pkt, CORESIGHT_BARRIER_PKT_SIZE);
 }
 
-static inline void CS_LOCK(void __iomem *addr)
-{
-	do {
-		/* Wait for things to settle */
-		mb();
-		writel_relaxed(0x0, addr + CORESIGHT_LAR);
-	} while (0);
-}
-
-static inline void CS_UNLOCK(void __iomem *addr)
-{
-	do {
-		writel_relaxed(CORESIGHT_UNLOCK, addr + CORESIGHT_LAR);
-		/* Make sure everyone has seen this */
-		mb();
-	} while (0);
-}
-
 void coresight_disable_path(struct coresight_path *path);
 int coresight_enable_path(struct coresight_path *path, enum cs_mode mode);
 struct coresight_device *coresight_get_sink(struct coresight_path *path);
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index edf2a2fc697c..1e2ce7861ce0 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -14,6 +14,22 @@
 #include <linux/sched.h>
 #include <linux/platform_device.h>
 
+/*
+ * Coresight management registers (0xf00-0xfcc)
+ * 0xfa0 - 0xfa4: Management	registers in PFTv1.0
+ *		  Trace		registers in PFTv1.1
+ */
+#define CORESIGHT_ITCTRL	0xf00
+#define CORESIGHT_CLAIMSET	0xfa0
+#define CORESIGHT_CLAIMCLR	0xfa4
+#define CORESIGHT_LAR		0xfb0
+#define CORESIGHT_LSR		0xfb4
+#define CORESIGHT_DEVARCH	0xfbc
+#define CORESIGHT_AUTHSTATUS	0xfb8
+#define CORESIGHT_DEVID		0xfc8
+#define CORESIGHT_DEVTYPE	0xfcc
+#define CORESIGHT_DEVID2	0xfc0
+
 /* Peripheral id registers (0xFD0-0xFEC) */
 #define CORESIGHT_PERIPHIDR4	0xfd0
 #define CORESIGHT_PERIPHIDR5	0xfd4
@@ -36,6 +52,24 @@
 
 #define CORESIGHT_UNLOCK	0xc5acce55
 
+static inline void CS_LOCK(void __iomem *addr)
+{
+	do {
+		/* Wait for things to settle */
+		mb();
+		writel_relaxed(0x0, addr + CORESIGHT_LAR);
+	} while (0);
+}
+
+static inline void CS_UNLOCK(void __iomem *addr)
+{
+	do {
+		writel_relaxed(CORESIGHT_UNLOCK, addr + CORESIGHT_LAR);
+		/* Make sure everyone has seen this */
+		mb();
+	} while (0);
+}
+
 extern const struct bus_type coresight_bustype;
 
 enum coresight_dev_type {
-- 
2.34.1

