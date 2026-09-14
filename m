Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6976242048E
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378860; cv=none; b=XxCsVV/wMPXRk3lRyjGmeWyG+8wmNxcEf5JYQKi5oNdBt25UNyCCiXkFnchVVyO9djbWM2Lc2+gqWSStP/ZycBdlB5zN6vpVP1i1OMa8G5ipHxGQjIG7SSYrtIIEH+VSIKxxOxmz7HfBQaLt+gV2yvd4LLwvvtyjWskAR7VGQCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378860; c=relaxed/simple;
	bh=6aXcuNFRRTDlvGN+TsA+86KnLS6uQ6WRYT0BfzhuKws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ocdo+z027GgKuReu1RM2dT6iBGKbkWHnf5E/EI22bo6zb3AQRD2KobrHWyDir96NdrjZG3XKFIOCP/SBwu1jUvnPYw1F2K2KIwYIANPbTS6kHvL5u9JPq3YRqWfSF8PeNOKoFiJcJcEEF+7ke9M7zNt7mit7IharufGcvd4BRp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q/um7+Cn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KremHy8i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q/um7+Cn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KremHy8i"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5j4wb3369833
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:40:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P6YrFJjqPcO/aWvqnjXKz6CibEiLizP2yppK2VCHVxw=; b=Q/um7+Cn+R1ao+ga
	7xi4L/qfLJvSpiT+pss0RfnECg1rYEFA9gwNL4wRsblqWUDaVfSUJ4kah1P4ig1S
	a9j0quqyK/Exma9NccFGCZYAfyjiShQvi6Sbfi7KRdLm+QprEb+MZDtxpaQp9nU9
	KWl6Sr5dCByVkxAMkVvBmsj4oGnmlUolMT6hNoMfYHazBiOPzzoAUc1cd0AGyozD
	pJTxKZGeInnzCuJGFscKXzv0HdCK8YLHAxvcNg89gXkp+k3JAsE175IjbGUJTm9g
	VdhjJ/Wcrf1iOZvq7LFvUP6JuSZpyIW9EgCak/K1JFFmj6ya7T3HEQwiQ9aPCbwt
	s8whZg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd603b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:40:50 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39dc5d85a9cso1886904a91.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 02:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789378850; x=1789983650; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P6YrFJjqPcO/aWvqnjXKz6CibEiLizP2yppK2VCHVxw=;
        b=KremHy8i9j8TgINTSpcGLa17dhzbm8oWriKj3tb4CjsQiIakIsRMFO/gNHwVB5mWke
         FrjTdf3osgx3PqqUjy93sGqncPp4a/kcyPu4Hajw8SCrXZZ+eEm6CJ0J6OTwIysfhed1
         wvY4dD72g5EIW8zXSpeBCP5m/qlvq+TCTaY02c91KLvvSAIyH9dBjJnKJJ7z02FO6vAJ
         yYd9udNPd5Qm0O43HpqT8dJ3Tk4REi7s4DfM1gH5ONcVmXiAy4k9XsGw3HeMLkeXaWcC
         T6mbFW/YFPC6IXAapmurYodnaIgD3CNhZnIReKNpz9nhY6gCbGnxsupTOaFeKXYlnxqo
         6pWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378850; x=1789983650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P6YrFJjqPcO/aWvqnjXKz6CibEiLizP2yppK2VCHVxw=;
        b=HoPtniQWBy1UU7GFYwa/OC11KDE7hVvcE98SBIZ4+lWx/Avcdx4ad2aiXABa6oN5Xr
         0bTdTEp2UatNx/qrhrJixKgb7ft2NdBmABlOyxwo8ImCvjN3TB8KilMWjeDybelYjhR2
         2m6U+TpM1fDKvG50O1oNoYeCgAxSX+ghDvqFm7T3b3g6pK0HyfLeTkV0KcZG/TMbSmiz
         GfZDVaYfQqOGNwWUpB8oo7v3vdc+Ler1TwAJ9OcWNA1Ki510MLCW8fvwvLJBISiqx3A9
         8LfghTEv59k0lIYGqzacaVHlA/avdGHnxvWXGz5dKkLVvI0ILj+/uDwAslDX6D0jiZY6
         jZwA==
X-Forwarded-Encrypted: i=1; AKwUvBxgQByE5aBuCZLNeHLExFnbKrfpUOSKG9EePTeqm7VFKTC9lbswULkP/dotsxYRL3d1sJojawWvNxZa@vger.kernel.org
X-Gm-Message-State: AFuF++lhAwRiadjCSbC3JEbcit3fDAvl7IaU72Y2RKxY+nkZBV5KOFEQ
	kifEBuKbI3Wbzd1HlH0wqef+RE6S97ZoUEVIwrckSoIzd48OZpcGfBn7p27CBg/4Y1PFUkbAXPG
	PsN4gbat14iBjvMb/mr7aSQGVIUBGWRmKdsU4B9kcnWnJh4qU7C8Rbx+XFoFILmtl
X-Gm-Gg: AYBFou1g8aKcOgCuLG8amCn+Cg+f+FeRy3UfwXbb0CDPoPITdrpRGhN4HvFR1lHGnoY
	aem5NKIFbkyQo351MLACFj4kqekrld6yxljoQ3g0w92Viw3q8qFxkwA3UZeIl/uFEUcyqlaC1et
	BiFw6L3kbv7PGl+v1OCXvcQPjpXNO7Abb87mFas3zdS/Kd5I65BGgTtJbyXb6GKsieRnYUgskf8
	iO/CcZLAL/lg1t4dp4jgtwk//Qr4RyFdWoIAqYM5w1+oQmx1tRviriikzdLMgTRkiJDXTbqHloS
	KoxXsC2hgZ/NOYbu2kROOlWmkVyYpw2nci5OJ7UF2MfdGfwwfSzY4Dd0sKlx0amjueW/1mpnbBx
	FMJT8wrAtmzhsWdWuSxE/XkwC4gJeiFicXi6rlnFxQwR4rFbHGe9nbsTc
X-Received: by 2002:a17:90b:2e0e:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-39dec056382mr4254868a91.16.1789378850254;
        Mon, 14 Sep 2026 02:40:50 -0700 (PDT)
X-Received: by 2002:a17:90b:2e0e:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-39dec056382mr4254813a91.16.1789378849795;
        Mon, 14 Sep 2026 02:40:49 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e60484sm19488728a91.4.2026.09.14.02.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:40:49 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:37:57 +0800
Subject: [PATCH RFC v2 09/10] arm_mpam: Support MSC accessibility
 derivation from RIS nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-mpam-resctrl-dt-knp-support-v2-9-bf6645bb2f65@oss.qualcomm.com>
References: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
In-Reply-To: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
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
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789378767; l=6269;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=6aXcuNFRRTDlvGN+TsA+86KnLS6uQ6WRYT0BfzhuKws=;
 b=bBQpLcPvbQkOwg42mxykFwgzeNMrLYkvmlHOl2AGfilHAAgu7ACzGrPmI6ia6F5ZPYIR2VX4z
 GvQ3J7nPV2uDZDl8IQxmBFkTY+MyPGCT0D/Ot5op5knchONGKHD6MT7
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa7c123 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=DmVZOekaPyhSFRrspXcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfX+ig8aBwSIrPB
 EvBJPHMUQnAcHg1X4G+z/eXpI6EVSq9vneZDnHMHthEAkIJjf8Ifm5GAtzSNh4R5KQx+NOI2fk/
 scdYwHM64O8+k3dZCycMyckpB2+JkyysMr36kwOj/nGp/O/wqzXMIplq3VcTN/tY8uyBTmIJWI4
 KgtqkiUxF/xcU7vXH28Ihfv24kMIVxrmAd5e2wDx+YazLaL5tnRLYs6zh6ZuGCesgtxSv1IhJfP
 HClAMKATPy30yKqBPJw5G0r/4NFpRtME3BNxAHKUjYIlpEW2FXhUy6xILhMajfyZ4BgSEKwg6SG
 el9HeZ+vswWWGWx+4vFvKCyaYqf54unkZEiPq73F5Unpm7OLnf/qRYm91IZXMEVyke39qzeea+l
 pmqHV7Xxahh7cV9cuoAAhxxnqihSGTis+ty3UyQd4xSaTBcPycXMEM8mL4UGPOwM2bTKuY4sxOm
 J1qvFtZxHxX/7VPddrw==
X-Proofpoint-ORIG-GUID: NxmJAupMeb71lOTIWoMGhdUtY5BYhJC4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfX9NeRA1bdq1+K
 1wsVjTCJV7N1HoCmPVYummfUTTJaSyAR+6o5HXK3GTudEFlJ0MUfHtLzCYOLnfqla7ldoPbhy/8
 2VakA2HZNDRUfTkqVtkKLMsJDG0UFvM=
X-Proofpoint-GUID: NxmJAupMeb71lOTIWoMGhdUtY5BYhJC4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140137

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
index 7ef3ed55b066..ede1b157ab57 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2159,6 +2159,136 @@ static int mpam_msc_setup_error_irq(struct mpam_msc *msc)
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
@@ -2168,8 +2298,6 @@ static int mpam_msc_setup_error_irq(struct mpam_msc *msc)
  */
 static void update_msc_accessibility(struct mpam_msc *msc)
 {
-	struct device *dev = &msc->pdev->dev;
-	struct device_node *parent;
 	u32 affinity_id;
 	int err;
 
@@ -2185,19 +2313,7 @@ static void update_msc_accessibility(struct mpam_msc *msc)
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

