Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218887;
	b=L5lHzeUwl1KW1ioy28TI+KyXvQYcsQjduo3teJjIiqwTjxLlqjMXMYuKTD8Z9DzoTuHS
	 qwsIxEsijPToDu36VQRcLXWdt29FRqJBmwYgnOFU71qV31x1N47/GmP2yirZN6nA1cjTJ
	 HYQCy4bUnIwc4fN25DYZbV8LYiVBUaHQY+TznPP0bdc3INaNn4zhzqEtnXK15GORGc6w6
	 xhf6Hyd/aj7oDMFJnc+HBeIgW09C8lsQ6ZipilV43JRUN9qK0l9yUmOb7vFqzXPtQdEIN
	 cX7XRwf0D+Iyrg8C4lIjnvriZ1S9tc5IYnuD4BJmkxtrn8AjHAESxFHXM8aoQwkhrHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218887;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ee9HFL3sXLWOGy9+2wILhca1yG8CtTePaf5ROxRYkv0=;
	b=hITzczGaYlZ7Sx+io5olRWN9HYM8urEMEiuL7xum9ecI0arwWnWqPrvjhSsAuhqPpBhO
	 qQZhvOnHTWNsxaIW7i7pyPDH6hLk6cASgchhg4tcaI3IR8KKMGRbS0Jjz+z/lL1MnJ093
	 9pRbH6dZAPuQ4Xd//91vEVpCwUmvQIQ2g+YJ4jRG4z6EXFpzwNw9YtB0At5fn0f1sakxH
	 g/9ZWsMRH0+w1Ezdvp7wkOSRAuLSo8kscLoNF1dYg0TnNKXu3fx4rLxWwvdLRC0aKWthk
	 6wO4UTadc598A18e28zK8Pz8TzSAy1Y8PibpWC9Mz+ka9X9ZDaB2S4/aTYrYrgQTq+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GKXgB7yE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W7aJJPnH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5470D6082BD8
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 10:08:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5470D6082BD8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GKXgB7yE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W7aJJPnH
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99v80C3035595
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 10:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ee9HFL3sXLWOGy9+2wILhca1yG8CtTePaf5ROxRYkv0=; b=GKXgB7yE4Mv1oFqh
	ygUrAW9IFXSMTPxl6YO+3eOOH0fhJAjY2hxHMaWH2FRvPjt8nsMCa84XY9v4WXaZ
	9EYp/3/XAsDP9/0RVEYAv0+Hs+rcTiM9eOouFGiH+VUUSPGh3prb7aZTwxOWNFd6
	AlGpj8YGcp2FJ7uEPL3Upt6vwpa0obnzZ0dOISjdmvvAapVDIVn/aRv5UinkfnB/
	u218ecYj2GtQCrJWBayTNGT/3bri9VotkQE3/hfV8UadgJM9DJMX2HHPSfc98zYw
	3RoCav7d40LsJJq3L7eXccu/7K2GYC7eaXtq9Snh/n1zKo0Ray9aOwHvUs/o1eF1
	1Zsv5A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsvc6nrgm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 10:08:05 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b09b223c70so533325a91.2
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 02:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794218884; x=1794823684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ee9HFL3sXLWOGy9+2wILhca1yG8CtTePaf5ROxRYkv0=;
        b=W7aJJPnHIa524oYBq4xdgV5W723GiSX5uJXjA1psSNUjYRbe/oJentu0Hh1BfXWJFW
         649OwWyW5/60CMuZQFMle8ulbvAxB5YTPcmhwaE/vDnFX9EGolVkEXPyn9EFvO0a1VjI
         3Ka4nafCPxvd+M1HUPg8U3vqEJjpJuubzRFgKrbq6RZ9CN/Lo+qZ5J0p5Vtrw7RSiSXY
         SpRRxXqXIB5JK5AaISFkKPR93Hqn7GNu+GomYw1PNd1mQ3B53cVrquaJE5iRIp5asm4h
         Hwpj0Y7nji5hTxDzSkzOvVna/6Vv4/V7N3ptDqwQis6xLG7N3W2rpe0nlX5/tWUXHBj6
         /eXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218884; x=1794823684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ee9HFL3sXLWOGy9+2wILhca1yG8CtTePaf5ROxRYkv0=;
        b=sn9e3e+j7US/1kvgw728safVcnPVS8Qq0ewiBLQDS3yAZuIv+XNhA2QuK0uLLvyIep
         J2EhMN4tUvtA6H/Yz6L5YRo9OgxXLzuCeyyNKEegYiIAvwzMm1iYpalkf9v01rD0RCBu
         LsH5W2Vn9dYAyxsucI2V2xCUsDYsvr/NPYubfFGp/kj9hddyD3PtRyRhCkz8gPx1ObUD
         GJdQV7LhBvPRwfj2PK2xpnhilqtPq4wU6V0ZDdOvILIs9MLCJupQDGEIO6lQC6p2wTvO
         Bw7XZ2iTaCk34E8H243oYNCemRz1KaTBDoNELMSeq3sLX1dn1rE8cFhB6cfmbIPfnThM
         fizg==
X-Forwarded-Encrypted: i=1; AL+hErGjy/3+8slNHe7zQMtDVgrKgXEtcSDrSwDDIAYmQOG0sta+4RxpxhIZw4qCtCZpcQ6Yq/AXSBcEeCm1@vger.kernel.org
X-Gm-Message-State: APuU4Z+R/IGmrUr9N+0epFlWioUiJicwATIzpiBsmuqrJf6ZgcHCjxJy
	1S9yhg9YIuqhZaN3XE3/sKAHcOMbYeXd1Ozwho20oLQw2pxq9ZnPMGMY2k+t5K/mvh22HpSxNxl
	q1oY6TzNVd4e2M8coTiNqaOOEKoSzT40DKmMfB4p6jy7dgGn1j07ZUOn9VufgkhpM
X-Gm-Gg: AYBFou2FXPzPAoqnKIkik99TvjBX5G9miki/I0fPnkCamTYzd2aWG9tGMz5yQ7XNSqm
	pcTEWd8ZkjJVx8u5Wh8ewzTuzUG+9NQ9cBkkr9XU8gqPm/M1T8OESSrSyeF0C+f6UeKU3CPRwfE
	a3xtJ3jhyxCwehdP7SHcl1C9gbhOdhN76pI50i1rWWDs+FGpTJmxojgMthBW56UUjB7wdXUvTmk
	pdQmzyEdKG4ebNrVlLPbWb/hYl6pJtnZYQT7N0e7fe1ojLlm3SFC6vyEqRsh2do8SjABj2D7zg+
	kNliU707R3wUkjxU6CIRqQeZcGey8ukvQJFYPAH55/6LoCs/Nte5Bi30jR7QehTeQrk+FVRDSMw
	aUIod1a10Jdy5Sm69VyWmVZupOAeikxdA/GDnPeUecDw78c63Jg5X8imT4iVyp7sSPqqsg9njPA
	QZD4GVWhSMJJO6ZPoxpfoMPPglMMtz
X-Received: by 2002:a17:90b:54ce:b0:3ac:7556:8eed with SMTP id 98e67ed59e1d1-3b12d57c488mr3115031a91.44.1794218884187;
        Mon, 09 Nov 2026 02:08:04 -0800 (PST)
X-Received: by 2002:a17:90b:54ce:b0:3ac:7556:8eed with SMTP id 98e67ed59e1d1-3b12d57c488mr3114999a91.44.1794218883733;
        Mon, 09 Nov 2026 02:08:03 -0800 (PST)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1054a53e4sm10034531a91.0.2026.11.09.02.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:08:02 -0800 (PST)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 18:05:38 +0800
Subject: [PATCH v5 6/7] arm_mpam: Add support for memory controller MSC on
 DT platforms
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
Message-Id: <20261109-mpam-resctrl-dt-knp-support-v5-6-150335a79381@oss.qualcomm.com>
References: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com>
In-Reply-To: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org, Ping Li <leeonion.muyu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794218819; l=4036;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=SVcR+hwi7W8WiyGR/9ZEtnITz44WeNpESQ+Zf8I0XbE=;
 b=JjDWgv0VXlw0PJfE0V93nb8oTc37DPPbjQTjoe3GHNpeRdv9e8sfXmLcZGGjGPiF9B66D54dx
 GKk8AyJt6vPAL351yRRkOtyss73IJPxqfW8q0RujnUA70L6H2N0pH+l
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfXzQGHU2oLSXA8
 fX8KrkDb1m34SQqw4EXW9rLacP7tvrjJqf9qfzCrT7reGyKA2RlrTxZw/VYTwDDZDsswfjUdOok
 wBW/m3VjO4mielLXcUX/4mOXsQuwIEbmhgznfTr5bophvK4MTYIzQdKrsFtoMsanZNTcXmkNOt8
 39+ybDG7YUemeRILFCWgKRyj6Gnvpr+2uU1NGTl/ZCYSOHMEjnSKIfF7QtW7YbJqQFfvmMUCom/
 jwjxWaBrsPgEq+Z0M7BwQA396uKe1pkh7sZHS3pwBKUv4mRBy7+Qagh+7voZRY1FS5vO0LEQ/w2
 VlOdaKJG+yFsMzk5kxX1tE5OF6LC1YWkK/lq0n1b3vryBNBI3xCplWHF5C+A1NCA9Cf1zHSkwVR
 YSGj5lGV28TIaCG4SeYN2Xj36qo3psKJsK/GQ0tjBxM0RQmXVNkD6Kg0BanPSSDdODjmvvVYkLk
 quXTDSZHrG746AgyjkQ==
X-Authority-Analysis: v=2.4 cv=WOjqzXsR c=1 sm=1 tr=0 ts=6af19b85 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Ikd4Dj_1AAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=YM9RNYZJZtWq5EK5GGEA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfXyByqLf3z3Gox
 vFYt4HrYE9Gq4r2+XqrpP4ztnlWAhQXX4K3MIdC1AAZWiP4Q6aQhYxv2BzD79DLIrXkJ0Cm5AT6
 Is2jDPSuBRlFCEy4S0PAfyiu8cSkBro=
X-Proofpoint-ORIG-GUID: wz4jRO-JGNFWXPmQcBAUmxCg-1mnkEcE
X-Proofpoint-GUID: wz4jRO-JGNFWXPmQcBAUmxCg-1mnkEcE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090040

From: Shanker Donthineni <sdonthineni@nvidia.com>

The MPAM DT path only handles cache MSCs. Memory-controller MSCs
cannot be probed yet.

Add support to discover memory-controller MSCs from the device tree:
derive the component id from the NUMA node and create a 'memory' class
RIS, and treat a memory parent as accessible from all CPUs.

Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
[ morse: split out of a bigger patch, added affinity piece ]
Signed-off-by: James Morse <james.morse@arm.com>
[ Yin Li: fix context offset conflicts; use u32 instead of unsigned long
  for component_id and compare against ~0U; remove the unused memory
  node reference in the arm,mpam-memory-controller-msc path ]
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 54 ++++++++++++++++++++++++++++++------------
 1 file changed, 39 insertions(+), 15 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 78caa8ae1349..e0ac6ef83d6e 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -365,10 +365,12 @@ static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
 				  u8 ris_idx)
 {
 	int err = 0;
-	u32 level = 0;
-	u32 cache_id;
+	u32 class_id = 0;
+	u32 component_id = 0;
 	struct device *dev = &msc->pdev->dev;
+	enum mpam_class_types type = MPAM_CLASS_UNKNOWN;
 	struct device_node *cache __free(device_node) = NULL;
+	struct device_node *memory __free(device_node) = NULL;
 	struct device_node *parent __free(device_node) = of_get_parent(np);
 
 	if (of_device_is_compatible(np, "arm,mpam-cache")) {
@@ -377,27 +379,47 @@ static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
 			dev_err_once(dev, "Failed to read phandle\n");
 			return -EINVAL;
 		}
+		type = MPAM_CLASS_CACHE;
+
 	} else if (of_device_is_compatible(parent, "cache")) {
 		cache = of_node_get(parent);
+		type = MPAM_CLASS_CACHE;
+	} else if (of_device_is_compatible(np, "arm,mpam-memory")) {
+		memory = of_parse_phandle(np, "arm,mpam-device", 0);
+		if (!memory) {
+			dev_err_once(dev, "Failed to read phandle\n");
+			return -EINVAL;
+		}
+		type = MPAM_CLASS_MEMORY;
+	} else if (of_device_is_compatible(np, "arm,mpam-memory-controller-msc")) {
+		type = MPAM_CLASS_MEMORY;
 	} else {
-		/* For now, only caches are supported */
-		cache = NULL;
-		return err;
-	}
-
-	err = of_property_read_u32(cache, "cache-level", &level);
-	if (err) {
-		dev_err_once(dev, "Failed to read cache-level\n");
+		/*
+		 * For now, only caches and memory controllers are
+		 * supported.
+		 */
 		return err;
 	}
 
-	cache_id = cache_of_calculate_id(cache);
-	if (cache_id == ~0U) {
-		dev_err_once(dev, "Failed to calculate cache-id\n");
-		return -ENOENT;
+	/* Determine the class and component ids, based on type. */
+	if (type == MPAM_CLASS_CACHE) {
+		err = of_property_read_u32(cache, "cache-level", &class_id);
+		if (err) {
+			dev_err_once(dev, "Failed to read cache-level\n");
+			return err;
+		}
+		component_id = cache_of_calculate_id(cache);
+		if (component_id == ~0U) {
+			dev_err_once(dev, "Failed to calculate cache-id\n");
+			return -ENOENT;
+		}
+	} else if (type == MPAM_CLASS_MEMORY) {
+		err = of_node_to_nid(np);
+		component_id = (err == NUMA_NO_NODE) ? 0 : err;
+		class_id = MPAM_CLASS_ID_DEFAULT;
 	}
 
-	return mpam_ris_create(msc, ris_idx, MPAM_CLASS_CACHE, level, cache_id);
+	return mpam_ris_create(msc, ris_idx, type, class_id, component_id);
 }
 
 static int mpam_dt_parse_resources(struct mpam_msc *msc, void *ignored)
@@ -2574,6 +2596,8 @@ static void update_msc_accessibility(struct mpam_msc *msc)
 	} else {
 		if (of_device_is_compatible(parent, "cache"))
 			get_cpumask_from_cache(parent, &msc->accessibility);
+		else if (of_device_is_compatible(parent, "memory"))
+			cpumask_copy(&msc->accessibility, cpu_possible_mask);
 		else
 			dev_err_once(dev, "Cannot determine accessibility of MSC.\n");
 	}

-- 
2.34.1

