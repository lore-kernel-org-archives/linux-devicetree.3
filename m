Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794988982;
	b=kzcAn2MTMAMTnWxhAsHlmG3DXgCQ9CsDnWwri9OCYefAiyUTGEhxDfBQIjZTpTlQDxzo
	 0OzsGGhJLcE+5ExA5EHCAuGWtMcmKEKEDe53pB2NMfoSvETDR9LvlpdEGdpi/k8Xzq8OF
	 X5e8s6dZcXD/frG33tq3OMkpt9H72M7IeGSzBHZ3x1RVm5B8LrIBXUelANjjfUWDxpkTk
	 F7/yJnH3zbObz1Bh6VrusWJIoUfNGpDO+rgwxmdL6ZKeO5iWI7PXWx9su93yZw86CHrdl
	 48h0pncq+0wmka6X6uZSbFL4HkjC073kohEECMyzDCScWKnzIOliWEYrVVkCUD96QNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794988982;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=S4L8juF1z9XwoWM3LNMHZaOpPuOzfNRL0E69hLI/YFA=;
	b=FhvZCBDkmfnTECZ7IBnw7VEJfuucV9dIqO6TUIogNbSJpGeNGnSSG+NhopypuuvzhpkZ
	 SmNxH7Up5/SlQsB/Z0kNEF3AIdB6L6DtwE2f3CWJ8LA2BP/52PbOboIz81JRhld2rzGoD
	 /L5axbZ86GuzjKYk0J91eaC/D3kj5rnewMGsw607/1a5toS3XEGd2Weum/dZ24Lya6xY+
	 w861aexvJb5NA8F7aIAYa26/amnwiWn6DZUdD/iAetVJ2r41BjzGBXkJji4rpEyiIsU0M
	 asHR+SZ4cSODlylKV/71qgMVF89/7rQLAyKCmGoNgQgtqf52g6ptVt4R+v7U71EdZQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kCgGI24c;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="hnT/TWak";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DFB606A332
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:03:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82DFB606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kCgGI24c;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hnT/TWak
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UwpQ1959723
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:03:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S4L8juF1z9XwoWM3LNMHZaOpPuOzfNRL0E69hLI/YFA=; b=kCgGI24cfeZTN3Q5
	6mRfeTPMpvPKpgYaih4ydKkbYbLqep1LbjnRArdwMc5Qbrk4bPnw/V5OwG7JYMS7
	tali6VQgNGEGk4KFCKkRwT3nNI7hUkpOD2JKaA921x201gUahV6LJTvM2k6mQHci
	Sd+MeIB5ijFl9gI4Ghir1QMCFQxVMSDpANspXn5kRTzLz1alxAkFhUL8Mz3TJ56T
	z4ZsVtYjVd30+JopQQXvL1Hhh5pqCd5x8QxqC4/aFICyWlyy07DVMW0T4kHfoa9C
	AYGd4bY9+UqAO21Ghm8QPufsxMnRyH6j0feZc+uEgVDkIJIbfSgXHPgVqfXZGTwE
	uKDBXA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9hwqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:03:00 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b175a69ab8so763976a91.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 00:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794988980; x=1795593780; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S4L8juF1z9XwoWM3LNMHZaOpPuOzfNRL0E69hLI/YFA=;
        b=hnT/TWakmGbLbpy6Tn45D8L83yltiT/acwSQB1iqxKgpYowcs6LAj1EJTiVFJIdgko
         RuYk1X0hlcEKy51jjeBf6z67RiIHSzueYtX2T17NcDxf4x3qi1Q01yoz2PALS72lWOpx
         YE/e1CngnTQ60ueKf/zqx8YcMRFxK1j+lLu20/rJuin0A5AD63mu5yjGbAeqppQSUZ7B
         iX6yhKBH8YHTgBZQl6rNeRKBkQerR0f2tHTXdiiN1yxraiKDjdGSwRh8nEI7Chn5Oy9X
         Fj7cV45GhGhUlnOK9ON2Je+gWVLGwaGvq22aZ9ZkPTK3oPALVuMirVhx+KP9CZ2BGCl+
         PCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794988980; x=1795593780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S4L8juF1z9XwoWM3LNMHZaOpPuOzfNRL0E69hLI/YFA=;
        b=LICJ2TCa+miHIZI9PfBEAHcKui0HpMC0oV3tbBT9lkkyCaC8RltbCAz8AI47v5qfQc
         X/4ytHBzmWaxEPv+AHbqGWBHrfJn0zyOSr7Vw8YVRoSKzc4c5tYpC7JNauegfGxGY5uC
         6jArlYl5Urb2L8ZlNW4QMSuOc95kcTF7BM82uBIhb3jW8JhcPNXukwT6YwjVwy6vzQuZ
         WEFmkQFpEWdJI0jcMH0OZ0OXvGNrC3bEOkyKvZ+SfTP6ozbrTJDnRQ3HJbsNcPf4t84q
         NRj/otsED1KC/eEj4EQdmga0TFR78cYux1FjAHwOGoVc08lwKzlnwUPWLLN2p+2RmXZK
         34XA==
X-Forwarded-Encrypted: i=1; AL+hErGdzSjRPrvmu1NnnSIBtpjRMhF3JVjRyNIl1RIeJI8O2HWXmrOiDoddhAEXRQj/bFH3bE4sncV65APH@vger.kernel.org
X-Gm-Message-State: APuU4Z/3MQCMgOt3XcXCKNBBpH9taem0BFTxrGgWkZjIB4QsHsa+p5vb
	UwrH5dCkMvjEqsI+i/ntMmnLbJT5C/sbodNjWpo4c2mOzdsQsX0Fmio9Mn8x82EyzNgROQ17fCb
	iCmjZqByvildXtuMq8OexzZzpC11JS3DDQ9ZA+LTYB1OoBeAKIjPUJfPLVPvjtXAd
X-Gm-Gg: AZFdTZfhFX5TRy7vQAyk4Nqy8ya7gjC8/uYjI5C8N4S43hq/0t9darDVTL7jF4RE37G
	70ibosWh4wZq0ZXw5YeKrneUZ+cHv/zkPzW+37Jm2I84f6maO6yxzHMT4bzNteRU47iGoCt6Y5h
	NjsQfm872CFZ+/R1j8cuTGQVDy10CiLvtk220svf03oaIbtnppmgERQc3hyLz4ISBen9179NxxC
	eT2zcrd4IhybBQsojuIQTdnvXdPW/TnlCEuZy5yCJtp/N9Lq5bUX+PVWme9cjC5dXR2o0zhR2oa
	ywSEyoiQijpjK1VNuEyiCjpRmuTAwk2KB55VCFGSRmFXRlBXaDea/8cwEY1wIx0JkDjV6PFQRKG
	f5IEio2gRyYALjRXye0yIInfuKAkpGJYogBYuYmzVuP9h1NJLdu4hDWHJ2vC/ByUx1J+doMExtE
	TslPZ/2ncc1IkNIjxltvBO5BCJZv8cLEwdqT0C
X-Received: by 2002:a17:90b:1fcd:b0:3b3:bf8f:9cce with SMTP id 98e67ed59e1d1-3b3d0764684mr1914917a91.35.1794988979535;
        Wed, 18 Nov 2026 00:02:59 -0800 (PST)
X-Received: by 2002:a17:90b:1fcd:b0:3b3:bf8f:9cce with SMTP id 98e67ed59e1d1-3b3d0764684mr1914877a91.35.1794988978949;
        Wed, 18 Nov 2026 00:02:58 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b6adasm3004072a91.9.2026.11.18.00.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:02:58 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 16:02:23 +0800
Subject: [PATCH v23 2/8] coresight: tmc: add create/clean functions for
 etr_buf_list
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-enable-byte-cntr-for-ctcu-v23-2-67fd9db6bc0e@oss.qualcomm.com>
References: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
In-Reply-To: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794988960; l=11149;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=U4HskpX6PrOSAOAyyWQLKaU/4nxuObv+lgNTkac5H9E=;
 b=AlFA8xGS0xSOwDSjdvtM292gB3+fVKc/IpP2wfdp8EyoAFMV25ZvDMbY1qLSjh+ZfFFRfayCu
 //BhxpOxR8TBXmu9/cwnOA85hOHsJeX/FcSL4ZowooLWZG+d48ORDJq
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=QenzLcbv c=1 sm=1 tr=0 ts=6afd5bb4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=1SojUABPoRlnvLJ90t8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 0TjWPslsYFjZhkTYr887QGQj-UnUxoJ9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfX2BfqwXELB06r
 wU3e3ZNDfK+VH4g61DFeZCs4JtKahZqrCWdpXgEDYrX/JMqChMoMzXxzEYbMxZoLYOxh7o9Zi2j
 M3jxvlZemWymNUAqUH5RU9cbL4KOig3Q7fb+DhEjUsF9fL4Zf5lJDTX3EFltr7g9+52DvbehsN6
 z+B9rjJgzi5LiSYL6NmVpXAaLjXuVOZdFy/yLX4yzwP8S8nTGUkBQuQfbdhCKp0EL41yt0spc0E
 rPchF7vpJxUTJQjGUGWZLDGvu85ltAb7+nOPw4S8DkMnqWQAmCwohUpDg3zJi3hS5A8EdKASP8r
 WarAXZN0saN66vu8zKJKnCFES5mpojHyo8hZqf2TDdzw6GQM+IksEC7r/Yd8vPI+pe8QLhIdKHl
 BOQ6QmnnEBwNghbQfF5lqjaMwSLRXk7NK8RmzR0hOim2NgczIbXlCpMq7eRss9RCtpHCz0Ypsh0
 zhSii0ksqoV3hILA+4w==
X-Proofpoint-GUID: 0TjWPslsYFjZhkTYr887QGQj-UnUxoJ9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfX3QiRgWB3+v+2
 CdLY0JNitzWJ1zSbk0ohZg3nlNec6jbeV+dlyKYVQrKAtUgNBRgRJIT3hCwDThe7xBz3/87gBzh
 F2FIj4F01/ddv20+ggWA+bdVd55rsUk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180031

Introduce functions for creating and inserting or removing the
etr_buf_node to/from the etr_buf_list.

The byte-cntr functionality requires two etr_buf to receive trace data.
The active etr_buf collects the trace data from source device, while the
byte-cntr reading function accesses the deactivated etr_buf after is
has been filled and synced, transferring data to the userspace.

Reviewed-by: Mike Leach <mike.leach@arm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c |   1 +
 drivers/hwtracing/coresight/coresight-tmc-etr.c  | 205 ++++++++++++++++++++++-
 drivers/hwtracing/coresight/coresight-tmc.h      |  18 ++
 3 files changed, 222 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index bc5a133ada3e..bc7dd676da47 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -835,6 +835,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		idr_init(&drvdata->idr);
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = "tmc_etr";
+		INIT_LIST_HEAD(&drvdata->etr_buf_list);
 		break;
 	case TMC_CONFIG_TYPE_ETF:
 		desc.groups = coresight_etf_groups;
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 361a433e6f0c..e9213f456834 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1268,7 +1268,9 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
 		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 	}
 
-	if (drvdata->reading || coresight_get_mode(csdev) == CS_MODE_PERF) {
+	/* The sysfs_buf is owned by the etr_buf_list, don't replace it */
+	if (drvdata->reading || coresight_get_mode(csdev) == CS_MODE_PERF ||
+	    !list_empty(&drvdata->etr_buf_list)) {
 		ret = -EBUSY;
 		goto out;
 	}
@@ -1918,6 +1920,204 @@ const struct coresight_ops tmc_etr_cs_ops = {
 	.panic_ops	= &tmc_etr_sync_ops,
 };
 
+/* Remove the nodes of the list, the buffer @keep is never freed. */
+static void __tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata,
+				     struct etr_buf *keep)
+{
+	struct etr_buf_node *nd, *next;
+	unsigned long flags;
+
+	list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, link) {
+		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+		if (keep && nd->sysfs_buf == keep) {
+			/*
+			 * The buffer is owned by drvdata->sysfs_buf and may hold
+			 * the captured trace data, whatever the mode of the sink
+			 * is now. Only drop the list's reference to it.
+			 */
+			nd->sysfs_buf = NULL;
+		} else if (nd->sysfs_buf == drvdata->sysfs_buf) {
+			if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS)
+				/*
+				 * The sink is still enabled in sysfs mode. Keep
+				 * the live buffer owned by drvdata->sysfs_buf
+				 * and only drop the list's reference to it.
+				 */
+				nd->sysfs_buf = NULL;
+			else
+				/* Free the buffer below through nd->sysfs_buf */
+				drvdata->sysfs_buf = NULL;
+		}
+		list_del(&nd->link);
+		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+
+		/* Free the buffer (NULL is ignored) and the node out of the lock */
+		tmc_etr_free_sysfs_buf(nd->sysfs_buf);
+		kfree(nd);
+	}
+}
+
+/**
+ * tmc_clean_etr_buf_list - clean the etr_buf_list.
+ * @drvdata:	driver data of the TMC device.
+ *
+ * Remove all nodes from @drvdata->etr_buf_list and free their buffers.
+ * If a node holds the live sysfs_buf and the sink is enabled in sysfs mode, the
+ * node is removed but the buffer is not freed; ownership stays with
+ * drvdata->sysfs_buf.
+ *
+ * Locking: must not be called with @drvdata->spinlock held. The spinlock is
+ * taken internally to serialise the @drvdata->sysfs_buf accesses and the
+ * removal of the nodes against the ETR sink enable/disable paths and the
+ * generic sysfs read. There must be only one owner of the list at a time.
+ * Must be called from process context: buffers are freed with the lock
+ * released.
+ */
+void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata)
+{
+	__tmc_clean_etr_buf_list(drvdata, NULL);
+}
+EXPORT_SYMBOL_GPL(tmc_clean_etr_buf_list);
+
+/**
+ * tmc_create_etr_buf_list - create a list to manage the etr_buf_node.
+ * @drvdata:	driver data of the TMC device.
+ * @num_nodes:	number of nodes want to create with the list.
+ *
+ * Locking: must not be called with @drvdata->spinlock held. The spinlock is
+ * taken internally to serialise the @drvdata->sysfs_buf accesses and every
+ * update of @drvdata->etr_buf_list against the ETR sink enable/disable paths
+ * and the generic sysfs read. There must be only one owner of the list at a
+ * time. Must be called from process context: buffers and nodes are allocated
+ * with the lock released.
+ *
+ * Return: 0 upon success, else the error number: -EBUSY if a generic sysfs
+ * read is in progress, -EINVAL if the sink is not enabled in sysfs mode or
+ * a buffer is of the reserved buffer mode, or the error of the allocation.
+ * The live sysfs_buf is never freed on failure.
+ */
+int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes)
+{
+	struct etr_buf_node *new_node;
+	struct etr_buf *sysfs_buf, *live_buf = NULL;
+	unsigned long flags;
+	size_t size = drvdata->size;
+	int i = 0, ret = 0;
+
+	/* We don't need a list if there is only one node */
+	if (num_nodes < 2)
+		return -EINVAL;
+
+	/*
+	 * All the etr_buf of the reserved mode are mapped to the same reserved
+	 * region, so they can't be used as separate buffers of the list.
+	 */
+	if (drvdata->etr_mode == ETR_MODE_RESRV)
+		return -EINVAL;
+
+	/*
+	 * We expect that sysfs_buf in drvdata has already been allocated.
+	 * Wrap the live sysfs_buf into the first node so the captured trace
+	 * data is preserved. Take the sysfs_buf and add the node under the
+	 * lock, so that the ETR sink enable path sees a non-empty list and
+	 * doesn't replace the buffer.
+	 */
+	new_node = kzalloc_obj(*new_node, GFP_KERNEL);
+	if (!new_node)
+		return -ENOMEM;
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	/* The sysfs_buf is in use by a sysfs read session */
+	if (drvdata->reading) {
+		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+		kfree(new_node);
+		return -EBUSY;
+	}
+
+	/*
+	 * The sink enable path reuses or frees the sysfs_buf of a sink which
+	 * isn't enabled, so only wrap it while the sink is enabled in sysfs mode.
+	 */
+	if (coresight_get_mode(drvdata->csdev) != CS_MODE_SYSFS) {
+		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+		kfree(new_node);
+		return -EINVAL;
+	}
+
+	if (drvdata->sysfs_buf) {
+		/* The mode may have been changed since the sink was enabled */
+		if (drvdata->sysfs_buf->mode == ETR_MODE_RESRV) {
+			raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+			kfree(new_node);
+			return -EINVAL;
+		}
+
+		live_buf = drvdata->sysfs_buf;
+		/* Keep the buffers of the list in the size of the live one */
+		size = live_buf->size;
+		new_node->sysfs_buf = live_buf;
+		new_node->is_free = false;
+		list_add(&new_node->link, &drvdata->etr_buf_list);
+		new_node = NULL;
+		i++;
+	}
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+	/* Free the node if there is no live sysfs_buf to wrap */
+	kfree(new_node);
+
+	while (i < num_nodes) {
+		new_node = kzalloc_obj(*new_node, GFP_KERNEL);
+		if (!new_node) {
+			ret = -ENOMEM;
+			break;
+		}
+
+		/* Allocate the buffer with the lock released */
+		sysfs_buf = tmc_alloc_etr_buf(drvdata, size, 0, cpu_to_node(0), NULL);
+		if (IS_ERR(sysfs_buf)) {
+			kfree(new_node);
+			ret = PTR_ERR(sysfs_buf);
+			break;
+		}
+
+		/* The buffer mode may have been changed to the reserved mode */
+		if (sysfs_buf->mode == ETR_MODE_RESRV) {
+			tmc_etr_free_sysfs_buf(sysfs_buf);
+			kfree(new_node);
+			ret = -EINVAL;
+			break;
+		}
+
+		new_node->sysfs_buf = sysfs_buf;
+		/*
+		 * The drvdata->sysfs_buf write and the list update need the
+		 * spinlock, to serialise against the ETR sink enable/disable
+		 * paths.
+		 */
+		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+		/* We don't have an available sysfs_buf in drvdata, set one up */
+		if (!drvdata->sysfs_buf) {
+			drvdata->sysfs_buf = sysfs_buf;
+			new_node->is_free = false;
+		} else {
+			new_node->is_free = true;
+		}
+		list_add_tail(&new_node->link, &drvdata->etr_buf_list);
+		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+		i++;
+	}
+
+	/*
+	 * Clean the list if there is an error, but keep the live sysfs_buf even
+	 * if the sink was disabled meanwhile, as it holds the captured trace data.
+	 */
+	if (ret)
+		__tmc_clean_etr_buf_list(drvdata, live_buf);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(tmc_create_etr_buf_list);
+
 int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
@@ -1928,7 +2128,8 @@ int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
 		return -EINVAL;
 
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
-	if (drvdata->reading) {
+	/* The sysfs_buf is owned by the etr_buf_list */
+	if (drvdata->reading || !list_empty(&drvdata->etr_buf_list)) {
 		ret = -EBUSY;
 		goto out;
 	}
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 319a354ede9f..7c604b9f92e5 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -208,6 +208,20 @@ struct tmc_resrv_buf {
 	s64		len;
 };
 
+/**
+ * struct etr_buf_node - node of the etr_buf_list
+ * @sysfs_buf:	Allocated sysfs_buf.
+ * @is_free:	Indicates whether the buffer is free to choose.
+ * @pos:	Offset to the start of the buffer.
+ * @link:	list_head of the node.
+ */
+struct etr_buf_node {
+	struct etr_buf		*sysfs_buf;
+	bool			is_free;
+	loff_t			pos;
+	struct list_head	link;
+};
+
 /**
  * struct tmc_drvdata - specifics associated to an TMC component
  * @atclk:	optional clock for the core parts of the TMC.
@@ -245,6 +259,7 @@ struct tmc_resrv_buf {
  *		(after crash) by default.
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
+ * @etr_buf_list: List that is used to manage allocated etr_buf.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -275,6 +290,7 @@ struct tmc_drvdata {
 	struct etr_buf		*perf_buf;
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
+	struct list_head        etr_buf_list;
 };
 
 struct etr_buf_operations {
@@ -447,5 +463,7 @@ struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 				   enum cs_mode mode,
 				   struct coresight_path *path);
 extern const struct attribute_group coresight_etr_group;
+void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
+int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
 
 #endif

-- 
2.34.1

