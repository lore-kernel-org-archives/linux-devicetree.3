Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF60494A19
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 16:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787846931; cv=none; b=b5ZfxXgCNhUomXhtjxPeN3qwH1SnbXVH8lGrApJ4l9CMWEVf/Zg9C3FVyDylylctoIx3mwP9ppy208BOb452j7mpohq+tyOG8NC6dlsSzEkMqKOFb0R5KhBiXprNgJWr/R2F/asah8P5QqkJjeU0z6RAl0fzMkJ5QeBmTTb+icI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787846931; c=relaxed/simple;
	bh=FOQ8uDheGL0RiZyjVAqiRMkhp79Dx5PmAY0sqwohPSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=shrp7m0xm1AFCje8NYgscnRKkMu6qHSo7MDXMlH68LPrTTmQUJ3D2UePpM03C+LHAspe6XBpGLHJdUlHBc9t1OJLizbVnwKE9DUfp5/ZSxpzaiIL5I3gpwFx5wVHQExqkW9eRzGRTiy6QzpsnWAkigH17a+ACYgePxMIQi4hYTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ngeJ6rmb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JsPxNEQs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ngeJ6rmb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JsPxNEQs"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFbnNn058917
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 16:08:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Gw7Hc5+BlXa
	fOfOrerU1qnVYYtDHdeXg75QOvio0igY=; b=ngeJ6rmb3+FSRoyW59SrAQKyeBy
	e0tQQsPJHDCRlxDA2TpQOzKZqQMuSYR0lvNxHQQtzxrhSKYCQUnBMzJI1s7F/cC/
	JSVIjvTjHdA1xdr8jElpBGflgaxLFmO08iyP4Id+Y9HvfRSaASv1UmyzDG6yKuoS
	CHaeGAmrHbXD3csWQXIKMPLkpC2+8fpeovuDbKHudegJBPAkhzLl4sDXj95gcmZp
	ywejjJY4AhokfhCdLAH76cdmz5mijD6wMh1W2UDf26kmKNhN0kIBQQDz/Qo1jr9R
	1t7Q37QVvD7o5Nt/759glFLvhoRc5FmY07a3S44l7cXPRcbsD0Mqb8IGTaw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gak561avq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 16:08:48 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1c18c775eso1338385a12.0
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 09:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787846927; x=1788451727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gw7Hc5+BlXafOfOrerU1qnVYYtDHdeXg75QOvio0igY=;
        b=JsPxNEQsCWB6dBXDFHW/KCK7b2m/fW+Dq3iCc0zJ3/z9vqOzh4QBt7+zw/4PnLgLuK
         BS+beXEKp60u8eKTTeLZ4fFMKDvEo6FverjBCa0xxlIyb/jkHZ5fECeKnrXTz+j/7Ann
         wqy/+FYWJEuuwp9ejEgIszpyTLEvtl7Z8UHIuA3iilK6H3T/GhFGIcp97EJlDv8cQafQ
         otfxp5dpQqOWXX57AnWbxkczxQZFQB17oOMb7BPgppc9u8YmBEAh89BsRp7/P/OX+aAF
         7RhBehI95qSmlz4moJn/TKyHhMlIy0zlVaYxjQgk5ByZh8MnO0tQKEl1XnOtb004VLPR
         YdRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787846927; x=1788451727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gw7Hc5+BlXafOfOrerU1qnVYYtDHdeXg75QOvio0igY=;
        b=Cq1fUgagFn+2FskLaFtc3aH/5bvOuQYrTGimSmBp3xtLa1gLPd9WXHL0CCw9DCOv5G
         J35+zjIQcdJM2kcLtkonczlBh27LW48LeP+wkjYx1D5RyqIlyRM6gC7uAx91RKYfOYg3
         11ZyfGNPPqPSLMCovZnh1VbL9OJ1Jv8JQikuKFJv85BjFZMgZFMNVqNhOpV+g1I2OmVZ
         H73ULoiYq0zsCjwCelSbFYPS5UzfdXqJRzHWAiwwHIP6GBp9ZEJQoxWXmK0D6FJT3k56
         4aZLK2ZtFvBgp2tRS4xTByPTzl3CiKntNWZLL7bU+OV2nUiWiOAuTQnk8ZI+095zElES
         4PwQ==
X-Forwarded-Encrypted: i=1; AHgh+RrNJenkFwmTghv5uJgWlB7JFk3hGyyhmjpTNl24gJG39F6qbUqa12Cn6h2mUEiggHOPmWUpFJ4YmQW9@vger.kernel.org
X-Gm-Message-State: AFuF++lDgTzw3Zp+TZ3oIx3N/05y+L03tOa+d/uiGs3VgihH1a+/EN30
	VocPAF1oiu3fb3mru8dv1dEe9ImrlaJu/15Xik4WGwtpeRDHhqetjXCOlHCGRNcg+f5vvZ17QZP
	G2XFzAsvarLKHbeJ4Y0XcriD+xL3I8rXlCm8/JCfGznXHdGKAliCpbN5LpiuZ6rla
X-Gm-Gg: AR+sD12t7PKD8Jh4JW4/8WNLV6gCserJDCr+Hn3SEVAi6EAOoRKCRusB2vbJO8KS8W0
	ACxJaOCGCmJ1Ur4ZWyfcJMnX1Ua36noihG4Izif3rKRZ9WZgdhjsA4oPoN/4ulxjHiXOP5hLyM8
	B13TY6SZvZNPXDvoDvWbDcFBwXHxG9Ef03gi7lkzhzzBkW8G/Kaxpu2bFTgLoFLNyvCPKF0kU0l
	9i4j2Hl25W9j+BRvltZxMzv0FDR/iPplyMwXOBvolN43q3deQjvqUuKQ3ABzVoHnQJXmusN9cy6
	sj7r0Q60F/+a+GViWGY5XvPxy8Li29RyzmmHnapj9+vnQRF2rrSZhrADaRXQedHUVJcDDInOAPe
	TEAOvY32+eMhWwCFP8MmveerAkxRvvr3DV2B1cs9u9az+/gMQmrU/RgbqHME=
X-Received: by 2002:a17:90b:1dce:b0:38e:9ca8:e99 with SMTP id 98e67ed59e1d1-396d0eba0c5mr359720a91.5.1787846926977;
        Thu, 27 Aug 2026 09:08:46 -0700 (PDT)
X-Received: by 2002:a17:90b:1dce:b0:38e:9ca8:e99 with SMTP id 98e67ed59e1d1-396d0eba0c5mr359631a91.5.1787846926458;
        Thu, 27 Aug 2026 09:08:46 -0700 (PDT)
Received: from u24-san1p10108.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fd9085sm3245892a91.12.2026.08.27.09.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:08:46 -0700 (PDT)
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
To: ebiggers@kernel.org, axboe@kernel.dk, mst@redhat.com, jasowangio@gmail.com,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-block@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-scsi@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: neeraj.soni@oss.qualcomm.com, gaurav.kashyap@oss.qualcomm.com,
        mani@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        bvanassche@acm.org, alim.akhtar@samsung.com, avri.altman@sandisk.com,
        stefanha@redhat.com, pbonzini@redhat.com, eperezma@redhat.com,
        xuanzhuo@linux.alibaba.com, linux-kernel@vger.kernel.org
Subject: [PATCH v1 11/11] scsi: ufs: ufs-qcom: support ICE keyslot partitioning for guest VMs
Date: Thu, 27 Aug 2026 09:07:20 -0700
Message-ID: <20260827160806.1295313-12-linlin.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827160806.1295313-1-linlin.zhang@oss.qualcomm.com>
References: <20260827160806.1295313-1-linlin.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDEzNiBTYWx0ZWRfX0E+fw8zlcmjB
 fgM4o19TX3esuSZPTm0d+LzMwy4vygwhXWNgL4lq3Whz5OKytfq5nSyCfyBZtwoO5xnMRQgjlET
 kVFUyXq2CN7U6sLtPaRQmLLD6DJRHTU=
X-Proofpoint-ORIG-GUID: MW_W8W-9Ns3EF2SXrY6NUNTWhsWALWW8
X-Proofpoint-GUID: MW_W8W-9Ns3EF2SXrY6NUNTWhsWALWW8
X-Authority-Analysis: v=2.4 cv=G+Ms1dk5 c=1 sm=1 tr=0 ts=6a906110 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Ui157SQb00ZPLHfqI5IA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDEzNiBTYWx0ZWRfX+0k3EcahHZje
 9zP4HG5c12eJgBq80Y118Vy8C//rGk8AKC4YGg1xjRy7oWdg21di56KPuMC4fNEikZXBCHUJ3pY
 4LuiOk8VRDGxW5NkAJUCyZX6YhJUHStCYuJwhwPngR03IR6jvPgRK6zOu/3evsJh985QQMjITUG
 Q9ErCn8Sk4J4wGc8kDHT43M01sGOdJDnctd5pGQ3psyGepsztc+jVoNAtbiDAomJllMg6gwOLHj
 HThbRGlU9Jrz0jv2C4jVf8xyNQ+geKWpGxvOJ8EBMXmjJ5vBD+zISLxUw7rDNWdfZqrgtdRgPL7
 j3nnlsIqkWdmeOG8QPw4UJ8U9beH0oOwNWWajlRsOHpqYwWmGGXp/0LIWTneMzkskd8NL98dMSZ
 UwCPCUaelb3JP4hucGsRtAwyxp1gHus84ixKcubiqQ/n7xA9K3IUANtIoUP1Vy2zqhDwFKA/X8Y
 M/zLlH/N6UFmojem3Yg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270136

From: linlzhan <linlin.zhang@oss.qualcomm.com>

On Qualcomm platforms where UFS inline encryption is shared between
the host and guest VMs, the ICE hardware keyslots must be partitioned
so that each VM operates only within its own physical slot range.
Without this, the host's blk_crypto_profile would manage all hardware
slots, conflicting with slots already allocated to guests.

Add ufs_qcom_ice_parse_slot_table() to read the qcom,ice-keyslot-map
device-tree node.  The function parses all child entries and validates
that no entry's slot range or the combined total exceeds the hardware
slot count from REG_UFS_CCAP.  The first child entry is taken as the
host's own reservation; its slot count and offset are returned to the
caller.

In ufs_qcom_ice_init(), use the parsed host reservation to initialize
the blk_crypto_profile with only the host's slot count rather than the
full hardware range.  Set profile->slot_offset so that
blk_crypto_keyslot_index() returns the correct physical ICE slot
number when programming hardware.  If no qcom,ice-keyslot-map node is
present, the existing behaviour (profile manages all slots) is
preserved.

Note: This patch is submitted for visibility. The ufs-qcom driver
gets its max_slots and slot_offset based on the the current
DT-based keyslot mechanis. we are aware this may need to be replaced
by a TZ SCM interface, submit it RFC for design discussion.

Signed-off-by: linlzhan <linlin.zhang@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 91 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 90 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 62396212a0a7..0611ab50f4cc 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -163,6 +163,74 @@ static inline void ufs_qcom_ice_enable(struct ufs_qcom_host *host)
 		qcom_ice_enable(host->ice);
 }
 
+/**
+ * ufs_qcom_ice_parse_slot_table() - parse qcom,ice-keyslot-map DT node
+ * @dev:          UFS controller device
+ * @hw_max_slots: total physical ICE keyslots reported by REG_UFS_CCAP
+ * @num_slots:    receives host max_ice_slots (0 = no partitioning)
+ * @slot_offset:  receives host ice-slot-offset
+ *
+ * Parses the qcom,ice-keyslot-map device-tree node.  The first child entry
+ * is the host's own reservation; subsequent children are guest reservations.
+ * Validates that no entry's range exceeds @hw_max_slots and that the sum of
+ * all entries does not exceed @hw_max_slots.
+ *
+ * If no qcom,ice-keyslot-map phandle is present, sets @num_slots to 0 and
+ * returns 0.  Returns -EINVAL if any entry or the total exceeds @hw_max_slots.
+ */
+static int ufs_qcom_ice_parse_slot_table(struct device *dev,
+					 unsigned int hw_max_slots,
+					 unsigned int *num_slots,
+					 unsigned int *slot_offset)
+{
+	struct device_node *slots_np, *child;
+	unsigned int total_slots = 0;
+	bool first = true;
+	int ret = 0;
+
+	*num_slots   = 0;
+	*slot_offset = 0;
+
+	slots_np = of_parse_phandle(dev->of_node, "qcom,ice-keyslot-map", 0);
+	if (!slots_np)
+		return 0;
+
+	for_each_child_of_node(slots_np, child) {
+		u32 off, max;
+
+		if (of_property_read_u32(child, "qcom,ice-slot-offset", &off) ||
+		    of_property_read_u32(child, "qcom,max-ice-slots", &max))
+			continue;
+
+		if (off + max > hw_max_slots) {
+			dev_err(dev,
+				"ice-keyslot-map: slots [%u..%u) exceed hw max %u\n",
+				off, off + max, hw_max_slots);
+			of_node_put(child);
+			ret = -EINVAL;
+			break;
+		}
+
+		if (first) {
+			*num_slots   = max;
+			*slot_offset = off;
+			first = false;
+		}
+		total_slots += max;
+	}
+
+	of_node_put(slots_np);
+
+	if (!ret && total_slots > hw_max_slots) {
+		dev_err(dev,
+			"ice-keyslot-map: total slots %u exceed hw max %u\n",
+			total_slots, hw_max_slots);
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
 static const struct blk_crypto_ll_ops ufs_qcom_crypto_ops; /* forward decl */
 
 static int ufs_qcom_ice_init(struct ufs_qcom_host *host)
@@ -173,6 +241,8 @@ static int ufs_qcom_ice_init(struct ufs_qcom_host *host)
 	struct qcom_ice *ice;
 	union ufs_crypto_capabilities caps;
 	union ufs_crypto_cap_entry cap;
+	unsigned int num_slots, slot_offset;
+	unsigned int hw_max_slots;
 	int err;
 	int i;
 
@@ -192,7 +262,23 @@ static int ufs_qcom_ice_init(struct ufs_qcom_host *host)
 	caps.reg_val = cpu_to_le32(ufshcd_readl(hba, REG_UFS_CCAP));
 
 	/* The number of keyslots supported is (CFGC+1) */
-	err = devm_blk_crypto_profile_init(dev, profile, caps.config_count + 1);
+	hw_max_slots = caps.config_count + 1;
+
+	/*
+	 * Parse the qcom,ice-keyslot-map DT node: validate all entries against
+	 * the hardware slot count and read the host's own reservation.  If no
+	 * partitioning is configured (num_slots == 0), the profile manages the
+	 * full hardware slot range.
+	 */
+	err = ufs_qcom_ice_parse_slot_table(dev, hw_max_slots,
+					    &num_slots, &slot_offset);
+	if (err) {
+		dev_err(dev, "failed to parse ICE slot table: %d\n", err);
+		return err;
+	}
+
+	err = devm_blk_crypto_profile_init(dev, profile,
+					   num_slots ? num_slots : hw_max_slots);
 	if (err)
 		return err;
 
@@ -201,6 +287,9 @@ static int ufs_qcom_ice_init(struct ufs_qcom_host *host)
 	profile->key_types_supported = qcom_ice_get_supported_key_type(ice);
 	profile->dev = dev;
 
+	if (num_slots)
+		profile->slot_offset = slot_offset;
+
 	/*
 	 * Currently this driver only supports AES-256-XTS.  All known versions
 	 * of ICE support it, but to be safe make sure it is really declared in
-- 
2.34.1

