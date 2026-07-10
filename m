Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758DC3FD12A
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677468; cv=none; b=dI6ZQ5uIy9cFHAgdKKB+9VnSjfxciIa5/b64MW3WfKTT0BNsj9HIkHvalOEt1qPXyUaN0NWmE1IaA8n2eF9kkYVJGQGdSUMf2IlQcMz5c5Qh4dXP4SoyCvq2ezR3HrMFKnQu7ACLUlTwI0Z1QdxlCD1iozcGIIG4e+QScc2u9ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677468; c=relaxed/simple;
	bh=HIfcVmMHkZYIs7rqqG+zSzsIPysCUE8pCb2J0Z5fZPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=It2J1RIkg0wN741c/BYgih15Nm09MGSehQCCbFe8WQ5hrSS1KyaU+epjkH3MHiAQPI0ki0PDOp63fZl8T0Ot7VDP1sQPqcS9TEOzc8Yf2HVFyzWJY5j0kDV7FctmyjY1zNgMYcAkwtTfoeuu1jejXt5vQlpwoD/Aon9d11YphzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PWK+AAdh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WLruW8xL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PWK+AAdh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WLruW8xL"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dWY3235407
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:57:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d1jQM4rScAUCNNkiH/SDd2OxhVyLL17zgo+FryLS9+k=; b=PWK+AAdhRO8WNsJl
	+58Ui5SCYYwGCsWUPZdeolK9sAAbT3CvK7SxyzbiK/tekjFjMRfwopNJRhdRWwCa
	NDsddLf+Cy2/RuRrK7hV3xPLBRziwyPrjwUTFiK3fjcKyI6swElWlO7XYczabsY1
	13v1s5z+/j3BUMJfO4anJxXHHGIlm2/wFpog128+3q2C7DRIqPzVOYqu8EkhNjWR
	ugjDK1fvuD+E+RsmHekPuxWcq5PUHmiROSRnYrJ1E7s1Kjsliss2nB6O6JiIzGhI
	AdRurlocsE5EKcFEpZTp8MlKgN87rsGy4yz5sbNGyk41XV+9zxvZ7eKCaQ2k2zQk
	42eSFw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeg3kwrb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:57:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c12e43b98so8654511cf.1
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783677458; x=1784282258; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d1jQM4rScAUCNNkiH/SDd2OxhVyLL17zgo+FryLS9+k=;
        b=WLruW8xL9VnHnzOKLzqlURMz32ulNtYH3v+ITS5asgAqGw3pbskq3LrMT74Okw6o7j
         ItgmxpmX79r9PLY3BpoorCqNNyqCjLJ4a3uAchSz1Xb60ymst2YbSzMX/c2Bopn05kfP
         cAl6IqppDMBmEwoQU480ep3N8VzRNut013s65pg/Wt3uj2Q3cmydP9yQNWCk6/oVy615
         SLMN4B3Tu/YUSlQqZNt1UHMSzC7IDrj7bSM7bV2OXXhRJF/0HgxiLQ9BdOf7ZnhYZD2W
         C5QQDAj8Zujj8jyJ1xaHFOlVnrOYT/VcSlP87ztwON8d6EISXYvj6PGlh+e7lkNC+eHI
         0Oig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783677458; x=1784282258;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d1jQM4rScAUCNNkiH/SDd2OxhVyLL17zgo+FryLS9+k=;
        b=RB2RGc3EtLaUiyp62+T9R7VQQgRh+E8CziNAnrKQkcT2t3OYP1PsLNA/XViJX4Ms/c
         aAnqOBltAsC6GQ4s3xBb47eoX3mxdiHsoVCrmUvRgk4FHRBq8073G9rHvLwJaCKvyIGL
         l2BgxcWZtZOOomjHVUv6I6XRR0p5WNctum4NGQNyS7geYh2Ct9cr9x6kAFlF2q41cSUk
         dbVP3Xirlv81aHBEIp8pQ3upxAIw/WhnGPoLje4mdk9pFYtHgUDQYWy+WRqY6Dq9G5Ud
         bdSLnnxVCNxfS+dUATrrIjTlNMYC0OunbPKJXCYEINgNz1XBvQGajT8DngS9+jgJ+Mgl
         ygpA==
X-Forwarded-Encrypted: i=1; AHgh+Rpv1SEb5pFv+qEKbDgqlfEaXMU6IvlienFVNV4gnHGNuqDKvegdp2n8dtyQKBnbOa4cVH65CasmPXeQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyUVXvGFxoDsbt2oGbZsRAXVo5Xf8e7okiMPAX74cVUpQsbuuRg
	e2+LjGurNCpwa0N/iZ4oc0OzmCc2hqaA01JdyroIa805SXtj178ny3XEe7Ug5niKZsotSCH+qKd
	ka69PoXSEhBX8ih4XQgdS7yN5uWZDhfwa2Z9NiNw4UPfxG7RHFHu2+UC4uiv4FzWY
X-Gm-Gg: AfdE7cnpHFE8Lh2pJ9mQT5jXskVaZqcU3V8fnfe6OXBJghChp0gvTGg88SEok3kJx+t
	Sgeo4X6yuJ9KODZQ2OXCEqRIgr6Z7/n81/4jUbXcAlSBNvGVTcE669MEULQLtdqT8/TwZimJpzl
	tkCNrIoKXwuvBltOIv7wUHObz2CNktJ3eCqtgpw6FDMJL9WYzYVgTl5I4V7NaDB+1yGFG/jNnL4
	K5NUUdHup44fNvZe5FuzbUM6AI3gWde6sOjyBIDfrcUZTvKdun51g5I+qKCFNrmYCna1rJ82Uqp
	okSC/iRAJS6pABNQ4N0O9MG8RBq1dbsX/bavcE5bdcGOx4AKsLYRPoQ7W1u1Zf4+GBEiiJ7Jiwm
	Xr0Son1qIw0w5aT7CaJTmvKKwGkVSkpMFk8o6/Ph6oQZzNxbiUKg/MGep0JTGnNYu6R/vpJLTJz
	/R/vrcrxc5NMJwSH13OFUxkRM7B8FQbgSI0fmLtm3JDEBzCQeUnWI2dam38CM6aJ4daZFHX54pS
	kUXBsb7cYBJbyAuK29g
X-Received: by 2002:ac8:57cc:0:b0:51c:7b13:62ff with SMTP id d75a77b69052e-51c8b43ca0dmr115561421cf.85.1783677457588;
        Fri, 10 Jul 2026 02:57:37 -0700 (PDT)
X-Received: by 2002:ac8:57cc:0:b0:51c:7b13:62ff with SMTP id d75a77b69052e-51c8b43ca0dmr115561211cf.85.1783677457141;
        Fri, 10 Jul 2026 02:57:37 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15dfda815dsm265357966b.36.2026.07.10.02.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:57:36 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:57:29 +0200
Subject: [PATCH v3 03/11] power: sequencing: Add
 pwrseq_power_is_controllable() API
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-monza-wireless-v3-3-46253587af64@oss.qualcomm.com>
References: <20260710-monza-wireless-v3-0-46253587af64@oss.qualcomm.com>
In-Reply-To: <20260710-monza-wireless-v3-0-46253587af64@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA5NyBTYWx0ZWRfX5XDwqOEIThPU
 u+DwfE3/dGrNcDyCxuXRKcxFdmAfGIsdbTFV0PJvvAjGMHWX9cIoSW7OZb5QRZTx/8eZ1HIYwoV
 O1YOc7T6yOTXUA/uAtVUP3KPS/ppOe08/aRFjC/NEQt6P4E0Nmbk4N9ZsjmHyxWEXnA3tBLhtRv
 M86TjRe7VqilGoU1G5j1OqKsVYTYCjmiiMfUAHZnSWDBG97NNOmdfVGtJPnJ+IW2Yh86NjngaNl
 dkfNJpryyes8W8n51tsboEPyLSjc1FwaDT+JtdX77D3aLM1MioX+20DnL670/7GmOjA6DWWyQtx
 uoVkOQSEyJxIkYpeRfpPke1jF8zbPcpAcjC7o19tCmAVhyRv5q8mhOG41iIRAc7pNITHUowkGdS
 LyrjrT6CylMADwAEnHRkm3VuuI+N5nnpxkJEL8f+G4x+9pEKgCeAVzFHYqeJ7JxdEW3iIQtcQp5
 BVfb68lJiNfrZR77fiA==
X-Authority-Analysis: v=2.4 cv=ZcMt8MVA c=1 sm=1 tr=0 ts=6a50c212 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=k8ejnUnrBbYq8YfVMWQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA5NyBTYWx0ZWRfX4G2dt21Z/jFH
 ErEqhPYz2aOhFUWfAcr0C4xhbdDic3/AM81CNOOVAxtvUiqxGrBrxRlXnkeQV6pKmX7N8CofkZn
 3AE6YhvMs0Wcoqka8Y/3fpyQEiXk2V4=
X-Proofpoint-GUID: d0kualL4b82JoVOI4kQjG3PTRO_WJeb3
X-Proofpoint-ORIG-GUID: d0kualL4b82JoVOI4kQjG3PTRO_WJeb3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100097

On some boards a power sequencing target has no host-controllable enable
for its function, for instance when the enable line is not wired up to a
GPIO and is hardwired to an always-on level. The pcie-m2 "uart" target is
one such example: when the M.2 connector does not route the W_DISABLE2#
signal to a host GPIO, its enable/disable are no-ops and the host cannot
gate the Bluetooth function at all or exclusively.

Add a generic pwrseq_power_is_controllable() helper. It reports whether the
target's final unit provides a host-controllable dedicated power actuator.
The unit can implement a new optional per-unit is_controllable() callback,
reporting whether that actuator is effective on this instance (for example
depending on GPIO presence). If the unit does not provide the callback, it
is assumed to be controllable.

Note this only describes the target's own enable actuator. It does not
imply that a power-off reaches an electrical OFF state as a target may
have multiple consumers. Also, this does not restrict consumers from
calling pwrseq_power_off() either, which remains valid to drop a vote
on shared unit resources/dependencies.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/power/sequencing/core.c | 39 +++++++++++++++++++++++++++++++++++++++
 include/linux/pwrseq/consumer.h |  7 +++++++
 include/linux/pwrseq/provider.h |  9 +++++++++
 3 files changed, 55 insertions(+)

diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing/core.c
index 02f42da915985339d3de507fc36dd158b0035a99..35df55312a71e9dfd3f24a8199b539746466af36 100644
--- a/drivers/power/sequencing/core.c
+++ b/drivers/power/sequencing/core.c
@@ -72,6 +72,8 @@ static DECLARE_RWSEM(pwrseq_sem);
  *          this unit.
  * @disable: Callback running the part of the power-off sequence provided
  *           by this unit.
+ * @is_controllable: Optional callback reporting whether this unit's
+ *                   enable/disable actually control power.
  * @enable_count: Current number of users that enabled this unit. May be the
  *                consumer of the power sequencer or other units that depend
  *                on this one.
@@ -83,6 +85,7 @@ struct pwrseq_unit {
 	struct list_head deps;
 	pwrseq_power_state_func enable;
 	pwrseq_power_state_func disable;
+	pwrseq_is_controllable_func is_controllable;
 	unsigned int enable_count;
 };
 
@@ -104,6 +107,7 @@ static struct pwrseq_unit *pwrseq_unit_new(const struct pwrseq_unit_data *data)
 	INIT_LIST_HEAD(&unit->deps);
 	unit->enable = data->enable;
 	unit->disable = data->disable;
+	unit->is_controllable = data->is_controllable;
 
 	return unit;
 }
@@ -991,6 +995,41 @@ struct device *pwrseq_to_device(struct pwrseq_desc *desc)
 }
 EXPORT_SYMBOL_GPL(pwrseq_to_device);
 
+/**
+ * pwrseq_power_is_controllable() - Check whether the target provides a
+ *                                  host-controllable power actuator.
+ * @desc: Descriptor referencing the power sequencer.
+ *
+ * Some power sequencing targets provide no host-controllable enable for their
+ * function on a given board, for instance when the enable line is not wired up
+ * and is instead hardwired to an always-on level. For such targets a call to
+ * pwrseq_power_off() is still allowed, so that the consumer can drop its vote
+ * on the (possibly shared) resources, but the host cannot gate the function
+ * on its own.
+ *
+ * Returns:
+ * True if the target provides a host-controllable power actuator, false
+ * otherwise. Also returns false if @desc is NULL.
+ */
+bool pwrseq_power_is_controllable(struct pwrseq_desc *desc)
+{
+	struct pwrseq_unit *unit;
+
+	if (!desc)
+		return false;
+
+	unit = desc->target->unit;
+
+	if (!unit->enable && !unit->disable)
+		return false;
+
+	if (!unit->is_controllable)
+		return true;
+
+	return unit->is_controllable(desc->pwrseq);
+}
+EXPORT_SYMBOL_GPL(pwrseq_power_is_controllable);
+
 #if IS_ENABLED(CONFIG_DEBUG_FS)
 
 struct pwrseq_debugfs_count_ctx {
diff --git a/include/linux/pwrseq/consumer.h b/include/linux/pwrseq/consumer.h
index 3c907c9e1885dc2958043a9a733fbe20bdf95f6e..ea2b87a521bceb7fb51e79c3b03fdb50f38bf94f 100644
--- a/include/linux/pwrseq/consumer.h
+++ b/include/linux/pwrseq/consumer.h
@@ -25,6 +25,8 @@ int pwrseq_power_off(struct pwrseq_desc *desc);
 
 struct device *pwrseq_to_device(struct pwrseq_desc *desc);
 
+bool pwrseq_power_is_controllable(struct pwrseq_desc *desc);
+
 #else /* CONFIG_POWER_SEQUENCING */
 
 static inline struct pwrseq_desc * __must_check
@@ -58,6 +60,11 @@ static inline struct device *pwrseq_to_device(struct pwrseq_desc *desc)
 	return NULL;
 }
 
+static inline bool pwrseq_power_is_controllable(struct pwrseq_desc *desc)
+{
+	return false;
+}
+
 #endif /* CONFIG_POWER_SEQUENCING */
 
 #endif /* __POWER_SEQUENCING_CONSUMER_H__ */
diff --git a/include/linux/pwrseq/provider.h b/include/linux/pwrseq/provider.h
index 33b3d2c2e39decafac6c6fca9254ad4329d90e94..42c7a37355869ecd0ae8e59b3a8c8716c7ff9ce8 100644
--- a/include/linux/pwrseq/provider.h
+++ b/include/linux/pwrseq/provider.h
@@ -6,12 +6,15 @@
 #ifndef __POWER_SEQUENCING_PROVIDER_H__
 #define __POWER_SEQUENCING_PROVIDER_H__
 
+#include <linux/types.h>
+
 struct device;
 struct module;
 struct pwrseq_device;
 
 typedef int (*pwrseq_power_state_func)(struct pwrseq_device *);
 typedef int (*pwrseq_match_func)(struct pwrseq_device *, struct device *);
+typedef bool (*pwrseq_is_controllable_func)(struct pwrseq_device *);
 
 #define PWRSEQ_NO_MATCH 0
 #define PWRSEQ_MATCH_OK 1
@@ -26,12 +29,18 @@ typedef int (*pwrseq_match_func)(struct pwrseq_device *, struct device *);
  *          this unit.
  * @disable: Callback running the part of the power-off sequence provided
  *           by this unit.
+ * @is_controllable: Optional callback returning whether this unit's
+ *                   enable/disable callbacks actually control power on this
+ *                   instance (for example when the controlling GPIO is wired
+ *                   up). If not provided, the unit's power is assumed to be
+ *                   always controllable.
  */
 struct pwrseq_unit_data {
 	const char *name;
 	const struct pwrseq_unit_data **deps;
 	pwrseq_power_state_func enable;
 	pwrseq_power_state_func disable;
+	pwrseq_is_controllable_func is_controllable;
 };
 
 /**

-- 
2.34.1

