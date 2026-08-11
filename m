Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9C04582CC
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 13:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786455483; cv=none; b=Gp1ndJGQeJFQ/yyntdoOPiDZJUdctnP19qL9hsQO000lA1R0EVB4+kRUuk+OwtjPcIlW8P3hhiT/tLVZoM0roE9tHsTeLAxpml+8qeTYz9wLEbH0+Ppj3qtv/tuc9I4+6JQ7cC9/EKRE+hjkrvfflmw1ARt+sSGLzcJU3Zcj6n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786455483; c=relaxed/simple;
	bh=zaBYwdzqKnPLChk0jQdmpN+Gtk81dvYuluYIJGNKYNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WSd0DbnBCcCcSpoh76JkDKSgfSyjqCjjfWg+2rsbtLOz3/N8bgw64Hh2a9ECV63rv8Sr4sCgmu82gCRERX+v0fgqkRF7+fth5gx1+4FwN7fvcSBg2nXeliEYIHNqcpg+d/MM0kIIdMe/ql7v57BxVf48mIuMT2OedJOq2C+sLr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PDczr3y4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OEeBB52K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PDczr3y4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OEeBB52K"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWU7x409824
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 13:37:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I4kViRm3sAJ0GJ6v9v6dra4X1/iqxcX9YHvXUBsWd+A=; b=PDczr3y4UfA6V3mF
	PFx885SU/ZyYi5BkDXvlppu8bxwdcpIIj2sMwbaDr6hf932H6gUKX47rljXynaZy
	QazBr6mWnvLB7KUIBkTH5MFalUFpCfBTIPA+n45GvRd0JhZb8fFL1W6mrgotaQ8w
	t45NZ3x8Oe39x53+cI2LrAEoWD3/6Dsmi0NP447K1F2G9I5CmPvsl5+zmn+D469A
	9ADWL1QZdL+B37znuAySs4iKw5bo/DrJOyFeFQK13z4N0T5JA7+Uc8AOuiDNY9fb
	yCGoW/E2LdaEcTU334w9+4TjZx0LxYA18/1GdmJsuEaW78eGqJGv8nWQffBsSHm3
	iKkB2w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyvcra265-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 13:37:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ce7fabf76so4688311a91.2
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 06:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786455463; x=1787060263; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I4kViRm3sAJ0GJ6v9v6dra4X1/iqxcX9YHvXUBsWd+A=;
        b=OEeBB52KG+l5HFVfhX67guZkfavmFau1XmXLCJFqLXuYa3+Erk1e9KCxJGOn5m5uro
         B2M1iLzcrQJlK402KI+TukNa8w2MCl5o1+WXSLLm2BNfs4aCu0kNFclivKy4Pqyfu4Po
         hFuSvZLL43TeGoBMyOiSp1JsZYI6qJyVPu/8pHoYQO4pmNvdtCOEfaLfUzZBr92eVW0d
         Nv42002bSsR9URlDMN7ToZzV+6UoJxE4GRF9/60f5u4OJtzOrGKanONwnw12494wTSY2
         WOs6SNJAdAyO62QZJ1TDDvM/Pe56RaUljNBo8iBatU1PeIpVaOm4B1wwH7NF/LeW4HbG
         3RXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786455463; x=1787060263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I4kViRm3sAJ0GJ6v9v6dra4X1/iqxcX9YHvXUBsWd+A=;
        b=R7UYqwPE5VW4Q3QY6zCc6KpthPbhxle8ysVbOL6FKdCqAqwANWNguP7Oyyt2jhy+Iu
         9CeoZPvinW5JvbttbqI1pxAVRpy7UsZvfJ/5qXt9AS1WYenyIciPz4UydA9SGN685wl1
         phTBrtSjviwPjJW08y4GPyQuQ5b9PISQQ/J2pKBoBZanIeFIS3VrsoDjjgOuVVE3qrHO
         iCrId1jGCI7nDmWByChkzUM+yzlh+2yOumMM9y28abOnsz3hYq6oTIEcButB7g2Hjs3n
         wyrIqpiC6AmXBewaMydggTTEvAJqZrZv305/U2KMO0ag+RAO8Jao/EoQ0BRFekYB0gps
         q6Kg==
X-Forwarded-Encrypted: i=1; AHgh+Rp1cE4tcJ4fxx9F/Sq6v62rDjWs6cW5SrNdPd8EUkaf+09sc/8TJJHRYPW4t284HL2tgl7ucznd8cfh@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7NPkrtVOKgIajnJokcROeMnU5zq0FzI3rkjW2ZRDbc1Jt4y2N
	eszIDjpqQtAk4AsE/LlDwBFSVH9D+Y/46CeaPWNH5Cp5bE9zHQ3zkasq8piz6A2qzSeI53VxnX4
	o0HopFNBdLmAfJVdBFvM4AT6kf6fjjSAu8+4EJxbGQxSAjmhbIReJnfrCn/GMUO+M
X-Gm-Gg: AR+sD13D+MwODE8gI+YV9aXN61uLmpajg2RW/X5hHwdAFlLwFmBdJZkwksCR4ZPQMTg
	Iwgk4JYNX9cvTtDxX7x1RadmDSocppYPFmGLTbeg3uAYPhJ+r1JVXq0ATgTMh7DO8H7djoicBNL
	x8SFz/zmYK3TY0sabO1spCnijZlDsuev+QOU5X9nYQO6Qb+sgf5tznOTtiuNbZWiySkeZGVcdWN
	X9lY+TVYWpB9lTvzLEb1BSel40bFR40vpFAUF2tSUtwTMLObckRwGnPttkD0YC4vCS+RNXonhwu
	kFbt13od8kXfdaQiFaWO3r9WF0JCjdqjIbWvPPqASSWVNXq/idrabk9dGs0FTc1Wql1RvU8sCfR
	sBMCzULfTUuLR/QbrPnRXJvt0kPGEBsPHH/Eabfz2aH/zOOTs9K9MDBGr
X-Received: by 2002:a17:90a:d44f:b0:37f:ed7e:7e42 with SMTP id 98e67ed59e1d1-392ec56723cmr3832003a91.14.1786455462834;
        Tue, 11 Aug 2026 06:37:42 -0700 (PDT)
X-Received: by 2002:a17:90a:d44f:b0:37f:ed7e:7e42 with SMTP id 98e67ed59e1d1-392ec56723cmr3831909a91.14.1786455462239;
        Tue, 11 Aug 2026 06:37:42 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f4819dsm8360885ad.37.2026.08.11.06.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 06:37:41 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 21:30:43 +0800
Subject: [PATCH RFC 14/15] arm_mpam: Support MSC accessibility derivation
 from RIS nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-mpam-resctrl-dt-knp-support-v1-14-ea6397bead59@oss.qualcomm.com>
References: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
In-Reply-To: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Conor Dooley <conor+dt@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, ganapatrao.kulkarni@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, devicetree@vger.kernel.org,
        driver-core@lists.linux.dev,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786455330; l=6269;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=zaBYwdzqKnPLChk0jQdmpN+Gtk81dvYuluYIJGNKYNY=;
 b=CV39+MeRob0ID7MiE7jf2uDLS4vl9pceQh1lYO3+4YumI0OMEhNB+kgFUsxGLLVZH/eFQ8uUZ
 TwwYwdYH1sRDRup6i6/E7LtiBUJ6IfZkeWEDOEDdh9iGFcT/tsNokle
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfXzSt7Y6P4g36C
 BgCPqQPWMcqBpL9WoQTAFT3kdvQef44prhlsAeZh3jTy9YlQFzjhsOghoZqy4lTokk1MUL5u8CV
 eJzuOawKpg4vOSGBifnEqVK7u6E1S9P7v2j69dKtbheyKe9oTxYZ17oMmG5IMohQPCuterwCWi/
 7qfgi3IEPpb7a06nWjeRO9GhqmE8a/d40jQqbO8svGHtO28wZycMoMNdLA5Phe4XE+EQOIgaq4B
 f2dPaY6jdBHENb/OD/qKG74E1am6EKZACX35vCu045FuemfOjgd+O0nml8PY/crNi6VRyluOH5s
 nxqaCBS6eXdRa1wA8duixDmUH+alPpRodpQjeD4BCYnF8UbWbt4UVp07qSpG8/C22BbJJe++T2+
 txsd8CC92+Aa8JkbW4VZHj3aZqpoQiDd8Fbotiwg4q5svfztIY8tt0behucgkkbA6xCaxBAY4RF
 4vSBcc9trpeU0qrdB/Q==
X-Authority-Analysis: v=2.4 cv=e/A2j6p/ c=1 sm=1 tr=0 ts=6a7b25a7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=DmVZOekaPyhSFRrspXcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: CwUswdv1nK0_vWGphfyKi9xO8RBtE8Mv
X-Proofpoint-ORIG-GUID: CwUswdv1nK0_vWGphfyKi9xO8RBtE8Mv
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfX5MaYVeItmmHU
 vVt6jYlf1iU3mCkpWZk9ksgW3Sl5tTWPlyNjnptU0LKYm+As+mKh8IuHimzWg9K0wV344zQ/5Mi
 kVp/BdhoG12FQBa9Ze4QYDZ0+61BCAs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110114

The DT accessibility derivation only handled MSCs whose parent node is
a cache or memory device. When the MSC is placed under a generic
container (e.g. directly under /soc), the parent gives no affinity hint
and there is no fallback.

Add a per-RIS fallback path for when the parent node is not a
recognised cache or memory device. For each available RIS child node,
affinity is resolved in two steps: first from an explicit 'cpus'
phandle-array on the RIS node, then from the 'arm,mpam-device' phandle.
The final accessibility mask is the union of all RIS masks; if any RIS
fails to resolve, the mask is cleared and the MSC fails to probe rather
than come up with a partial affinity.

Factor the DT-specific logic into mpam_dt_update_msc_accessibility() so
that update_msc_accessibility() dispatches cleanly between ACPI and DT
paths.

Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 146 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 131 insertions(+), 15 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index d8856864e89a..d0462239deeb 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2156,6 +2156,136 @@ static int mpam_msc_setup_error_irq(struct mpam_msc *msc)
 	return 0;
 }
 
+/*
+ * Resolve a RIS to its CPU affinity from its 'cpus' phandle-array.
+ * Returns -ENODEV when 'cpus' is absent (the caller may use another source),
+ * -EINVAL when any phandle is invalid, or 0 on full success.
+ */
+static int get_cpumask_from_ris_cpus(struct device_node *ris_np,
+				     cpumask_t *affinity)
+{
+	int i, cpu_phandle_count;
+
+	cpu_phandle_count = of_count_phandle_with_args(ris_np, "cpus", NULL);
+	if (cpu_phandle_count <= 0)
+		return -ENODEV;
+
+	for (i = 0; i < cpu_phandle_count; i++) {
+		struct device_node *phandle_np __free(device_node) =
+			of_parse_phandle(ris_np, "cpus", i);
+		int cpu, matched = -1;
+
+		if (phandle_np) {
+			for_each_possible_cpu(cpu) {
+				struct device_node *cpu_node __free(device_node) =
+					of_get_cpu_node(cpu, NULL);
+
+				if (phandle_np == cpu_node) {
+					matched = cpu;
+					break;
+				}
+			}
+		}
+
+		if (matched < 0) {
+			pr_warn("MPAM: RIS %pOF cpus[%d] (%pOF) is not a possible CPU\n",
+				ris_np, i, phandle_np);
+			return -EINVAL;
+		}
+
+		cpumask_set_cpu(matched, affinity);
+	}
+
+	return 0;
+}
+
+/*
+ * Resolve a RIS to its CPU affinity from its 'arm,mpam-device' phandle.
+ * Returns -EINVAL when 'arm,mpam-device' is absent or the phandle is invalid.
+ * 0 on full success.
+ */
+static int get_cpumask_from_ris_phandle(struct device_node *ris,
+					cpumask_t *affinity)
+{
+	struct device_node *mpam_device __free(device_node) =
+		of_parse_phandle(ris, "arm,mpam-device", 0);
+
+	if (!mpam_device) {
+		pr_warn("MPAM: RIS %pOF has neither 'cpus' nor 'arm,mpam-device'\n",
+			ris);
+		return -EINVAL;
+	}
+
+	if (of_device_is_compatible(mpam_device, "cache"))
+		return get_cpumask_from_cache(mpam_device, affinity);
+
+	if (of_device_is_compatible(mpam_device, "memory")) {
+		cpumask_or(affinity, affinity, cpu_possible_mask);
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int get_cpumask_from_ris(struct device_node *ris, cpumask_t *affinity)
+{
+	int err;
+
+	err = get_cpumask_from_ris_cpus(ris, affinity);
+	if (err != -ENODEV)
+		return err;
+
+	return get_cpumask_from_ris_phandle(ris, affinity);
+}
+
+/*
+ * Returns -ENODEV when the parent is just a container (not a recognised device),
+ * so the caller falls back to the per-RIS description.
+ */
+static int get_cpumask_from_parent(struct mpam_msc *msc, cpumask_t *affinity)
+{
+	struct device_node *parent __free(device_node) =
+		of_get_parent(msc->pdev->dev.of_node);
+
+	if (parent == of_root) {
+		cpumask_copy(affinity, cpu_possible_mask);
+		return 0;
+	}
+
+	if (of_device_is_compatible(parent, "cache"))
+		return get_cpumask_from_cache(parent, affinity);
+
+	if (of_device_is_compatible(parent, "memory")) {
+		cpumask_copy(affinity, cpu_possible_mask);
+		return 0;
+	}
+
+	return -ENODEV;
+}
+
+/*
+ * An MSC's CPU affinity is described either by its parent node or, when the
+ * parent is just a container, per-RIS inside the MSC. In the per-RIS case the
+ * accessibility is the union of the RIS affinities: every RIS must resolve, so
+ * a single failure clears the mask and stops and the MSC fails to probe rather
+ * than come up with a partial affinity.
+ */
+static void mpam_dt_update_msc_accessibility(struct mpam_msc *msc)
+{
+	cpumask_t *affinity = &msc->accessibility;
+
+	cpumask_clear(affinity);
+
+	if (get_cpumask_from_parent(msc, affinity) == -ENODEV) {
+		for_each_available_child_of_node_scoped(msc->pdev->dev.of_node, ris) {
+			if (get_cpumask_from_ris(ris, affinity)) {
+				cpumask_clear(affinity);
+				break;
+			}
+		}
+	}
+}
+
 /*
  * An MSC can control traffic from a set of CPUs, but may only be accessible
  * from a (hopefully wider) set of CPUs. The common reason for this is power
@@ -2165,8 +2295,6 @@ static int mpam_msc_setup_error_irq(struct mpam_msc *msc)
  */
 static void update_msc_accessibility(struct mpam_msc *msc)
 {
-	struct device *dev = &msc->pdev->dev;
-	struct device_node *parent;
 	u32 affinity_id;
 	int err;
 
@@ -2182,19 +2310,7 @@ static void update_msc_accessibility(struct mpam_msc *msc)
 		return;
 	}
 
-	/* Where an MSC can be accessed from depends on the path to of_node. */
-	parent = of_get_parent(msc->pdev->dev.of_node);
-	if (parent == of_root) {
-		cpumask_copy(&msc->accessibility, cpu_possible_mask);
-	} else {
-		if (of_device_is_compatible(parent, "cache"))
-			get_cpumask_from_cache(parent, &msc->accessibility);
-		else if (of_device_is_compatible(parent, "memory"))
-			cpumask_copy(&msc->accessibility, cpu_possible_mask);
-		else
-			dev_err_once(dev, "Cannot determine accessibility of MSC.\n");
-	}
-	of_node_put(parent);
+	mpam_dt_update_msc_accessibility(msc);
 }
 
 /*

-- 
2.34.1

