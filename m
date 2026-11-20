Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795145289;
	b=cm1X4grLGi8ca12sh3XMIEwXmcWoLeDFgjSkJNLHRhz53nPysVZICKETUR+Tpx+FIFuP
	 jHcuIo7FRU+/LjQrxbE98F+kz5BKIOXqH3ObBjWV/F7O11FuMfSTtm5335NC1cKbMz02F
	 YtzABzS2EWMdBbXB73AbvuqXCHtzU1LwqITX46gJmDLOqF0IQzVMik877sLRx/gEXHrGw
	 RhpeW68eU0D1CEGfXHZIvfJBPw83cg5vnO2jXNtEIgWWLhsRLiEGNbs1K2pe72OJp8GCV
	 S2d9pmgyRa26Cn+u+ctoVDlEkQhADRHZ3ZdXnigFzaPcb8RjLMbX/+B33cj7Vw+3p0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795145289;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=34aFfuXVpPcXLci0jSgT8zGdGbVf6e2b53cMgQyCqCQ=;
	b=0lUKRJaRzmkq98DsgFSvK6KN+IXHtvtKnGasKJ3kVR0KilpB8Fes6PpGx9txKiCYZ7oC
	 DtXIlKtwXEXwtJR0c0H7R38ycYaDsFprS52xPXiafeOvNUL7ZtfwfJrMo38/Ks+LhC1Kw
	 urbRWsKyb+dOmnRr3VYvO6susW1S0o6NTEOilOMiCV+C31aYfMzD+MierSn+Jd5/fNKEh
	 088aIrABYKIhALeAqJLF83wUFhOFi8xhTS4AunV3M0Odp0ZjVlLh1HBcHkJQUj+GPiHrs
	 8UjQjwQIskX4RTD5jXa7i8WcAoWFMFEZFfs21TPH8Poss+EdYA1EWIrGGPxAYkXPuUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cTgvRwpe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jC+nmD4I;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC837606A32C
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:28:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC837606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cTgvRwpe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jC+nmD4I
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK0G9To3295202
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:28:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	34aFfuXVpPcXLci0jSgT8zGdGbVf6e2b53cMgQyCqCQ=; b=cTgvRwpeF3+QIV7d
	Pu5QhM11BUSuihKko6tICmFRo/wZZ2eezWsxzoXxCW/WNwQfrlee+JNhfs5QeH5C
	CpDC/jCzH2kUmggOWzJ0vTC+sruCHog0+7miye77mxJ2oISvwc/ohuApQe7E2Vg3
	/EqPqHkuHRVL/ctluzilUi3rJwIfKOrynxxkVTPxdltXbRUe3DCUezTPKEF9r7ek
	6wUT39I2v86+FB5azyBPGNRXX/IQ8XAbe7PZQWrfgxHP3cGkWvKTBkHbG2MavEZo
	zfJBtzuz5o5CGkZjVPY4K7O30YOgP8+fLLnGTCaQS2K30pziAe+YdbMUiUM7YBWz
	xE520A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1yghmk6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:28:08 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b41aa2b9a8so414195a91.3
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 19:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795145287; x=1795750087; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=34aFfuXVpPcXLci0jSgT8zGdGbVf6e2b53cMgQyCqCQ=;
        b=jC+nmD4IpWwdmLWddxCt9lDmjcg/0x0LYCkS72zUoKGEW47vb27trPFOaU89CneBHk
         SMB3Yt7YZGBRF4zcWJyDyRXyWs7Ck5Jylc4+iLtOw6uTpyk9TloRtAoBa8lsx5IttViM
         /1GnIg0/Pm8pWwKwdVm24PnKke+iAZeyWjUa55qwoBpRa3nlCQs83QqtxsWR/kteupHl
         DE7KWLBZ3M7lF7m+KK7rw/Sr5FHIbDsnXwRAAR2oU3JnYzg7akYFMfNFLjLPSSnIKM/Y
         LsWvNhoEOKgng3u/JkA0RZTg2QFI2zCT+4qommF2YPnrho8kn+A3Rl6/bBtrsLM2guOA
         DZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795145288; x=1795750088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=34aFfuXVpPcXLci0jSgT8zGdGbVf6e2b53cMgQyCqCQ=;
        b=Z+oTMYjGxKfhy9zQ8TJQ558fAzDCixbEfYzwwnkFfsm1AYv58gJA9iHlFKQxecgalS
         z1H2GXImWmTU04v1iX08R0QnHuDjb83leWVrPZZ7/+6gfl99UtjgxkaMMJs21Thvann1
         VDlS4SpoAttFsUvVATOjU0Qp0HvpRFP5yTHkmxJXiL4QtP8JL+Qtq9ze4VlPBxSYokI2
         xxtdUFsU3mKgIpnP60mBs05egGeAqwmGf2Q3pS32os1cvZp00nc+ByRhw+/LN3DeH2HX
         4sprms8Nq66HR7Qi52Jr6cN47kbW9bTbV8j9JbwqeUxe6Ve/5WOeCoXNoL/OGvUEZqDL
         s8ow==
X-Forwarded-Encrypted: i=1; AL+hErECC18I8FoXpeYCalWJD/ZacDKjvG4gRkXR5EfHb35DpdwxBqngyIZ6ug41cEkS1khugBVEGYAwIKFI@vger.kernel.org
X-Gm-Message-State: APuU4Z/N+eqnnvzI6GvDX/QXAAe66GFUFva2QDPon6g3IhbnkkhIhGJI
	TlT0vmdktX/aKeIOovNPlISnOcf+65xx6W5Ub/Ft+VD7W2iva4rgcYypFY301GYJUAkR8jw8tOw
	rB/JIz+lea2DQUsX1iGUZWpG7qHMt3lwHv5RL127qPrr21PD3JIt8LNw8UvJ97vw/
X-Gm-Gg: AZFdTZcwG0e8GmBlIS9xcyTqyt48cTmCzG907MZeTx/aUu4qwYyttcozsO4uq/h714T
	BtaKCq9PPIffCjWmV4XuP3bINgPPHzefsM+aHEOxy3gAPJrdvwt9fs1G47pajb/VdpPYB4oKjUg
	6055m6O0eXQ+fchAcbbd57gUH6gzRwSgTsk6QlzGeNgVjw8Lqy80/jRNTM1unctLB3apWgJwvJA
	axE24zgfdoDNpjlmNouVg3iZWGmp1GIABq9MPiuJAOgyhR4holacM0aRhuIiy/DwVXl/ii2hA+s
	b8YrmlZJgWhWKbZq7RBIJ+G1viLXDNLp0G+cmHr2/W9r/zdqvSha4ld3I+Z0Ibk+nQEh6XDPFmx
	Bb8uFpSkktRj98dXzi1nXhUxABxv9AUBfQaFxjOIkH2txCS0C4dAhbbdxHu8kcBS8S11va4FyiW
	WrHDjYVrk+Fne6hhWiLl0BxZQW03noRvwKn9U=
X-Received: by 2002:a17:90b:2f8f:b0:3b0:d070:3c46 with SMTP id 98e67ed59e1d1-3b41c98a389mr1309305a91.12.1795145287538;
        Thu, 19 Nov 2026 19:28:07 -0800 (PST)
X-Received: by 2002:a17:90b:2f8f:b0:3b0:d070:3c46 with SMTP id 98e67ed59e1d1-3b41c98a389mr1309278a91.12.1795145286997;
        Thu, 19 Nov 2026 19:28:06 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578d771sm5278297a91.1.2026.11.19.19.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:28:06 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 11:27:22 +0800
Subject: [PATCH v24 3/8] coresight: tmc: add a function to switch the ETR
 to a free etr_buf
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
Message-Id: <20261120-enable-byte-cntr-for-ctcu-v24-3-2d792c6b4819@oss.qualcomm.com>
References: <20261120-enable-byte-cntr-for-ctcu-v24-0-2d792c6b4819@oss.qualcomm.com>
In-Reply-To: <20261120-enable-byte-cntr-for-ctcu-v24-0-2d792c6b4819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795145262; l=4632;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=/q3hbenfKTr48S8hdFy6BvVzZpTiff3UFj41MW4quZo=;
 b=2snsCrbr5ig562qt2nrm4F1CzkE9z8o+PNcmagxqr39xyOfSXGpqg1f2NCVaTJLHlq/eAWlUL
 tL1paZ1DM7CCpeXMEveFSPZpT8TiCLqVVInmWYXsf/8TP0oZMfTR8LF
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfX7ZX6R4Ep8G0u
 WFWE7joJ/cPj+kxzg45zqXpTFMBQhSy8uSqfX/ZLKp1AvwNrzcO2CaA78l6agotzBwQAtcVoRXC
 DoscJIdJ0Wg55MvjXcHrUEzTsC+pRUU0aTxBdsq4twvNjn0wZHDecFi6edT1TjNjej6n7ddbMAR
 ym5DwN7uN4+8w/YBLrsscwkCQ2o3WsluBZka8lQ4HPOVKJeatQ/n6Itkgq1+KWlXyxEhgylNJzL
 N/fWFCWO3roZ+Yxt0F+VZHSJSqpepD9eQwQA34PsQUI5GE8MuKJ6xmxWrRoz+w/TGiOBNh8AGHO
 C2S3JoW064GDYQcXk+A3KRi7izQfLGsV6gD/FkwuumSKFG1PE/e+2RzujJVeA8DIxAA5Wf/p7EC
 IZ9bPvdaq8akBOR7duEAeIj7T9aorw==
X-Authority-Analysis: v=2.4 cv=Vvi2kO2n c=1 sm=1 tr=0 ts=6affbe48 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=XrOnqjNa2oMXnLqE:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=z-iXM9TJyjA7tvrExkUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: XT11IrRGWvFylWY3D7Pl4VneFoZ0PC4y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfXwDIsqsBMjM9D
 MqYeVsrTy25iBzYiYzNQ7SHm5vMCvVtgzMYDy+75tBjCNuCASNlkwfniMbaTpQgcxrOqUmaqSSc
 ZVRg+vg+ZIADBELeXJjFweNuy87Pz9M=
X-Proofpoint-ORIG-GUID: XT11IrRGWvFylWY3D7Pl4VneFoZ0PC4y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2611040001 definitions=main-2611200013

Add tmc_etr_switch_buf_node() to switch the ETR to a free etr_buf of the
etr_buf_list without disabling the sink. It returns the node of the
switched out etr_buf, so its synced data can be read while the ETR keeps
tracing into the new one.

Stopping the ETR, swapping the etr_buf and restarting the ETR have to be
done in one critical section. Otherwise tmc_disable_etr_sink() can run
in between and leave drvdata->etr_buf out of sync with the hardware.
Provide the sequence as a TMC helper, so callers don't need to know
about the locking of the ETR state.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 65 +++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  4 ++
 2 files changed, 69 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 03eead4176d2..ba6a686828d7 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1224,6 +1224,71 @@ static void __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
 
 }
 
+/**
+ * tmc_etr_switch_buf_node - switch the ETR to a free buffer of the etr_buf_list.
+ * @drvdata:	drvdata of the TMC device.
+ *
+ * Stop the ETR, hand over the current buffer for reading, switch to a free
+ * buffer and restart the ETR. All of this is done with @drvdata->spinlock held,
+ * so it can't race with the sink disable path.
+ *
+ * Return: the node of the switched out buffer, or NULL if the sink isn't in
+ * sysfs mode, there is no free buffer, or the ETR fails to restart. The ETR is
+ * left untouched in the first two cases. If the ETR fails to restart, the
+ * switched out buffer is kept as the current one.
+ */
+struct etr_buf_node *tmc_etr_switch_buf_node(struct tmc_drvdata *drvdata)
+{
+	struct etr_buf_node *nd, *curr_node = NULL, *picked_node = NULL;
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	if (coresight_get_mode(drvdata->csdev) != CS_MODE_SYSFS)
+		goto out;
+
+	list_for_each_entry(nd, &drvdata->etr_buf_list, link) {
+		if (nd->sysfs_buf == drvdata->sysfs_buf)
+			curr_node = nd;
+		else if (!picked_node && nd->free && !nd->reading)
+			picked_node = nd;
+	}
+
+	if (!curr_node || !picked_node) {
+		curr_node = NULL;
+		goto out;
+	}
+
+	__tmc_etr_disable_hw(drvdata);
+
+	/* The switched out buffer is free again once it has been read */
+	curr_node->free = true;
+	curr_node->pos = 0;
+	curr_node->reading = true;
+	picked_node->free = false;
+	drvdata->sysfs_buf = picked_node->sysfs_buf;
+	drvdata->etr_buf = picked_node->sysfs_buf;
+
+	if (__tmc_etr_enable_hw(drvdata)) {
+		dev_err(&drvdata->csdev->dev, "Failed to restart the ETR\n");
+		/*
+		 * The ETR is not programmed with the picked buffer, and it may
+		 * retain the pointers of the switched out one. Keep using the
+		 * switched out buffer, so a later sync matches the hardware.
+		 */
+		picked_node->free = true;
+		curr_node->free = false;
+		curr_node->reading = false;
+		drvdata->sysfs_buf = curr_node->sysfs_buf;
+		drvdata->etr_buf = curr_node->sysfs_buf;
+		curr_node = NULL;
+	}
+out:
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+
+	return curr_node;
+}
+EXPORT_SYMBOL_GPL(tmc_etr_switch_buf_node);
+
 void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
 {
 	__tmc_etr_disable_hw(drvdata);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index ff2dbd85415e..917f88ccc00c 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -212,12 +212,15 @@ struct tmc_resrv_buf {
  * struct etr_buf_node - node of the etr_buf_list
  * @sysfs_buf:	Allocated sysfs_buf.
  * @free:	Indicates whether the buffer is free to choose.
+ * @reading:	Indicates the buffer attached to the node is being read by
+ *		the user.
  * @pos:	Offset to the start of the buffer.
  * @link:	list_head of the node.
  */
 struct etr_buf_node {
 	struct etr_buf		*sysfs_buf;
 	bool			free;
+	bool			reading;
 	loff_t			pos;
 	struct list_head	link;
 };
@@ -467,5 +470,6 @@ struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 extern const struct attribute_group coresight_etr_group;
 void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
 int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
+struct etr_buf_node *tmc_etr_switch_buf_node(struct tmc_drvdata *drvdata);
 
 #endif

-- 
2.34.1

