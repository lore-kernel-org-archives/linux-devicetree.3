Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAAA37C113
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784218720; cv=none; b=Z6MCM1stc5F6jtwhpicmBG+ajMMwsUQmq5OQq076Wa2Oj/M1NU4CYTZVHqjYIuXKNNzCKhn6BkPYB7ik7FCWnXFoyQ0uJ1Ix9q2OgE3CmUGgk3+sgAOi8RCSzm4Y2Cs+yVJNx8+C3qdr5Q0pH2CDgnkTC238oXrT3GfMFEH7+bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784218720; c=relaxed/simple;
	bh=OvZGQdRrKQ1cKCtBZ2vJJlctMXShVHIPX/EnnD1FRmQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nNmb1aeByCCZOMlRff1lqTer3JOXjsF4iokS+10TYjkbwmygjRs4PtWvNtB/iaZYVvmira6WTTqkc/+ITnAaqXm4ULxKEX3Ya8i4hUr1E4EHw9h3b21Rb+CAKYhbW/IOL7TgchVcwomfY2KbOdXx9n0AcOyhVXQkT+we8Ekln8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CnSn1BRp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ig/DBlS8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CnSn1BRp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ig/DBlS8"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJtPU3988626
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:18:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rBvoXcE6fyfh67dFVJmu8Fy0oBNY0thH0kUQWM4o/d4=; b=CnSn1BRpTHnJbFGf
	+T/6tewwxH6wTIdT0lXcjtg3atp9yuC5+r1BGMEx/6ME8clCZqHN5QYZY29MyPRV
	vjlbCxinuqm/0qULVrWZt7GEfSOr5TGDUFPLIgPEq3x+wPwJ/vvFoC9s2MTLjTa2
	n7Xkzy4O8QTcG0fYsJGuuxylsYuPutVCSEdlPlRUhHIuAB2DPnTr1GlbTYSaDXI7
	3NfO/kFdk/q7jZTftR/lKDXGmMHcx5UQb0Neym0uUucX3JvFftGrEOaShPJxc5ub
	3vb06u/V/pAEh+j0BF1E7neqB1N6Bre5F7nSOnCYaDFShH5CtThMyq5xm+mu6/Ju
	nJZp8w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feq3pk71t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:18:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1c7f135bso65090291cf.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 09:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784218712; x=1784823512; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rBvoXcE6fyfh67dFVJmu8Fy0oBNY0thH0kUQWM4o/d4=;
        b=ig/DBlS8ULEcuMVHuhJGrlJwTG2SrAMN5l7nlBiPumCkIMJ0HRJtHbtx/Rhj0uDrYA
         TaH5DgJ9OsJqi96pLU8PB6/VqY4jo0M9F51o7f/TxQ6fJHpRfcQWEpmNrBlVhrtVdob8
         A83dVhkHbQe7k5xYUcdizBqQ4YCPuJ80QHYTeW0dGu9o2eo9eC0Ay/qf1SxioYyPmsyE
         B6PYjWKPQdfL+YSLA2W8yBGw2VlnwPb7J0BWnHHHapUwszUzc4dYtyd3gJ2cp9ufJZOI
         /wvAlyHrfFgcCT9CvobQy4/vv5QBp01dQ2wsmeT1lR8EXCAGBFQ7W4MQ5YOKTipsLPqY
         lpLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784218712; x=1784823512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rBvoXcE6fyfh67dFVJmu8Fy0oBNY0thH0kUQWM4o/d4=;
        b=WMkNOSnxPFCKiuEWTP31gDr4rAYpGI8qrLdrSUWQImU0xAE5ALCWzNugr71t3OK+BK
         Pz8jnk6nrMjHlhuq5+qXgDRHDESMNe/yeiLwJI2m5Jr9AQVdWueBf37JnUT/DaY/zbjx
         rrtCWOMnBoQyE6q7hwUl75xqBIUslBd0vBoRWQD4qRbVCW8uLmWq7vVe26xH1pELO7zY
         eOSqzaTJ5D30i6dqfud+Csk2M5zJbmpaTQdpOeVMvtviyQGibAGgg9SiK9fAvv34xjoN
         PmNs34YRzZzj/luftEym6PpWDNdS2Vc4wtm7C6oSbW2Bmx0MY2p/xRMadUJQFJ14SHeS
         j8vA==
X-Forwarded-Encrypted: i=1; AHgh+Rp5jpleyWr8y4cjr/LHDIOMZ8lFpHgzMRB1lSSW3wJTHb3OptAz0o6BU8LwsHnsLu+ecNdMG5gvIG5o@vger.kernel.org
X-Gm-Message-State: AOJu0YwNr40QM65WcBdZ2Ik6XU/DyApUiT7ZEeC5i8Mcpa7M+wgz8OQT
	nX86SvzF/2frqTLsJQqfNLLCM+tFMFoe5XPmtZFbVUiUdbfW5eWhDziNDj1+o0foosojYd5ycm1
	xEuv5wxIEVuK4/r1DjJJpISg2xdu2hbfewP6uOa8hQS5pbTUZ5QJP0qnbq0a7dErU
X-Gm-Gg: AfdE7cm3itRCjA9VWJ5MTx5/8zQ8Fe8o3Qnsa+hlwqV7VR5/gBSeCa0DOV7xTaDOXb3
	sVK4+rCc0/nZakSGVLIcT8xuUJAAaL9F822rugi2F9xlf8uDVt0yDdeQoWrAt5/0R8XWnhFQh0e
	PYq2uOoVL+XGI0S9PeB6Rcl68dc+OPEl/5Uz7AD64zVhOccDFwf3X883IPJT5ffTRGVH+X6LIlv
	r9XN48M5HnncYexaXdAfjRzTRGL5TAup7Az4IThU+XYyuKpAxda8gZmsNNdi+VbGkEqDsu4OlmF
	znTP7nnITfQx6YtG/eOlQI8sat0Iv4sokNFAa2dDXutsDbS/pND3oeAooMKF1vlNSlpW+JcI4kx
	b58f2tMeL+/eMfhjpO9fIqwhFSaREN93M69LC50Ha17Yt/t+EFabnFEORk0kfCe7dpm9OA31OCc
	fFeaxTxF5fC3WR5Yx0xh106BUpegxOHNmkilskgz1uL8BI49BmukQ=
X-Received: by 2002:a05:622a:112:b0:51b:f40b:2fac with SMTP id d75a77b69052e-520be692394mr2842611cf.50.1784218711335;
        Thu, 16 Jul 2026 09:18:31 -0700 (PDT)
X-Received: by 2002:a05:622a:112:b0:51b:f40b:2fac with SMTP id d75a77b69052e-520be692394mr2840331cf.50.1784218708837;
        Thu, 16 Jul 2026 09:18:28 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c168744bdddsm257262866b.48.2026.07.16.09.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:18:27 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 18:18:20 +0200
Subject: [PATCH v4 03/11] power: sequencing: Add pwrseq_is_controllable()
 API
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-monza-wireless-v4-3-9b02e6f549d7@oss.qualcomm.com>
References: <20260716-monza-wireless-v4-0-9b02e6f549d7@oss.qualcomm.com>
In-Reply-To: <20260716-monza-wireless-v4-0-9b02e6f549d7@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: c2XqDrIuGimP0O4q00kp_Oq8xNbEdEol
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE2NyBTYWx0ZWRfXxp3e5NbLNm11
 Jbd8gkm78dSMnd5tpdqTn+WN3NCS4x5Tm2IcM5xNkztAVFnA/lT9LahGS45FT8/IdpfKScvcTfr
 FRnJ/67SdxM2rsiXpngLSCf/RsEKW+w=
X-Proofpoint-GUID: c2XqDrIuGimP0O4q00kp_Oq8xNbEdEol
X-Authority-Analysis: v=2.4 cv=PN8/P/qC c=1 sm=1 tr=0 ts=6a590458 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=4a-8Ivk512-2hps7UIkA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE2NyBTYWx0ZWRfX3EClmB73Y3Ct
 nJrK+KjGWH1H4oVxVSCstEWE7G/CAxbmCx1YV4heex/1ok7Yuqep3NJWou6Ru50NKUlhNooF1hW
 4ZoaIEK06aJ1nSBNd3syHn+SjqbwFZ5FFMGI/s5p85RngHYHV+j57oNPpMWMTuj86jopSLK733l
 SDmI0EMXsG5cX3oA5N20Bl6hBOWsyEVujSgf6Qj90C+8K3aQTzcPce/WuHljc0vMwnQiDT02meI
 O7qTwV6WmFBXJUddooqXY6q9v10EJZz0q76fnuViEx41wI8K7tbgHkdVxm3bsdMVb3FJplppTvN
 9PxtIpPHsD2YaUgSZuXNfBixkc7qXUjD6RoLR+/KjyMDo1WzrVVydV/kYKcJAzsuum4pwTftWOZ
 fTM6AMLsgRdioBwpCFcjiYrFOot/MhddDoX+DOT8evGYdb+8cLRNIzFwrcEA0pEUaY7JxsFkvyP
 CJLXA43zzw27W372tyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160167

On some boards a power sequencing target has no host-controllable enable
for its function, for instance when the enable line is not wired up to a
GPIO and is hardwired to an always-on level. The pcie-m2 "uart" target is
one such example: when the M.2 connector does not route the W_DISABLE2#
signal to a host GPIO, its enable/disable are no-ops and the consumer
cannot gate the Bluetooth function at all or exclusively.

Add a generic pwrseq_is_controllable() helper. It reports whether the
target's final unit provides a host-controllable dedicated power actuator.
The target can implement a new optional is_controllable() callback,
reporting whether that actuator is effective on this target (for example
depending on GPIO presence). If the target does not provide the callback,
it is assumed to be controllable.

Note this only describes the target's own enable actuator. It does not
imply that a power-off reaches an electrical OFF state, since a target may
have multiple consumers. It also does not mean that power is uncontrolled
for the target's dependencies: those may still be gated on their own. And
it does not restrict consumers from calling pwrseq_power_off() either,
which remains valid to drop this consumer's vote on the (possibly shared)
resources and dependencies of the target.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/power/sequencing/core.c | 49 +++++++++++++++++++++++++++++++++++++++++
 include/linux/pwrseq/consumer.h |  7 ++++++
 include/linux/pwrseq/provider.h |  8 +++++++
 3 files changed, 64 insertions(+)

diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing/core.c
index 02f42da915985339d3de507fc36dd158b0035a99..cabb3d0885f94d9d70e0631861ed6905d91ad3bc 100644
--- a/drivers/power/sequencing/core.c
+++ b/drivers/power/sequencing/core.c
@@ -182,12 +182,15 @@ static void pwrseq_unit_release(struct kref *ref)
  *               the state lock has been released. It's useful for implementing
  *               boot-up delays without blocking other users from powering up
  *               using the same power sequencer.
+ * @is_controllable: Optional callback reporting whether enabling/disabling
+ *                   this target actually controls power.
  */
 struct pwrseq_target {
 	struct list_head list;
 	const char *name;
 	struct pwrseq_unit *unit;
 	pwrseq_power_state_func post_enable;
+	pwrseq_is_controllable_func is_controllable;
 };
 
 static struct pwrseq_target *
@@ -206,6 +209,7 @@ pwrseq_target_new(const struct pwrseq_target_data *data)
 	}
 
 	target->post_enable = data->post_enable;
+	target->is_controllable = data->is_controllable;
 
 	return target;
 }
@@ -991,6 +995,51 @@ struct device *pwrseq_to_device(struct pwrseq_desc *desc)
 }
 EXPORT_SYMBOL_GPL(pwrseq_to_device);
 
+/**
+ * pwrseq_is_controllable() - Check whether the target provides a
+ *                            host-controllable power actuator.
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
+bool pwrseq_is_controllable(struct pwrseq_desc *desc)
+{
+	struct pwrseq_device *pwrseq;
+	struct pwrseq_target *target;
+	struct pwrseq_unit *unit;
+
+	might_sleep();
+
+	if (!desc)
+		return false;
+
+	pwrseq = desc->pwrseq;
+	target = desc->target;
+	unit = target->unit;
+
+	guard(rwsem_read)(&pwrseq->rw_lock);
+	if (!device_is_registered(&pwrseq->dev))
+		return false;
+
+	if (!unit->enable && !unit->disable)
+		return false;
+
+	if (!target->is_controllable)
+		return true;
+
+	return target->is_controllable(pwrseq);
+}
+EXPORT_SYMBOL_GPL(pwrseq_is_controllable);
+
 #if IS_ENABLED(CONFIG_DEBUG_FS)
 
 struct pwrseq_debugfs_count_ctx {
diff --git a/include/linux/pwrseq/consumer.h b/include/linux/pwrseq/consumer.h
index 3c907c9e1885dc2958043a9a733fbe20bdf95f6e..f70f694c19ab73f70ccf775aa24902bfcc982a42 100644
--- a/include/linux/pwrseq/consumer.h
+++ b/include/linux/pwrseq/consumer.h
@@ -25,6 +25,8 @@ int pwrseq_power_off(struct pwrseq_desc *desc);
 
 struct device *pwrseq_to_device(struct pwrseq_desc *desc);
 
+bool pwrseq_is_controllable(struct pwrseq_desc *desc);
+
 #else /* CONFIG_POWER_SEQUENCING */
 
 static inline struct pwrseq_desc * __must_check
@@ -58,6 +60,11 @@ static inline struct device *pwrseq_to_device(struct pwrseq_desc *desc)
 	return NULL;
 }
 
+static inline bool pwrseq_is_controllable(struct pwrseq_desc *desc)
+{
+	return false;
+}
+
 #endif /* CONFIG_POWER_SEQUENCING */
 
 #endif /* __POWER_SEQUENCING_CONSUMER_H__ */
diff --git a/include/linux/pwrseq/provider.h b/include/linux/pwrseq/provider.h
index 33b3d2c2e39decafac6c6fca9254ad4329d90e94..7285ad94a2214070a1c27f25c783f51105705b36 100644
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
@@ -43,11 +46,16 @@ struct pwrseq_unit_data {
  *               the state lock has been released. It's useful for implementing
  *               boot-up delays without blocking other users from powering up
  *               using the same power sequencer.
+ * @is_controllable: Optional callback checking whether enabling/disabling this
+ *                   target actually controls power (for example when the
+ *                   controlling GPIO is wired up). If not provided, the
+ *                   target's power is assumed to be always controllable.
  */
 struct pwrseq_target_data {
 	const char *name;
 	const struct pwrseq_unit_data *unit;
 	pwrseq_power_state_func post_enable;
+	pwrseq_is_controllable_func is_controllable;
 };
 
 /**

-- 
2.34.1

