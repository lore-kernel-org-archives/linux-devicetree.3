Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9DA3CC32B
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 14:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782226367; cv=none; b=nESaK3HmxL86JawWnA6JZe+HE+UR70nOWv2snaDVe/B3mPrqJvisQtnoRagPG2nbW/VzNq44kbadGiA35DwSsaFbOIsanxJGAyiY750UXALfNgb2oT3Rjn7wFBR2Fo8eSfo7eoXEylR+7/s1b+ojQlVdK9AKBeSWkxBdKwoUP7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782226367; c=relaxed/simple;
	bh=w1Tg1h1Bgp5ctFJGKs+G8GxFeRFgC+541niNc4ABUxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VrDDphCl3vg6jt5IhvKxSjXFNidw0VqTM5dFG1LDTQBkqDf9g3WW1nYGGk8Jy71Q9IdNfejPn8vZf57duikjebpowphRMrGeWFo1ZqUw8p3NzGv3hqx45/320exJxcB5jr1yJ8v5GQpM8I5QDUNvcZNCqBB4YMquFXx1BcqWP0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mDG5jzQn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bjgtUzN7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mDG5jzQn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bjgtUzN7"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZZ7d134187
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 14:52:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dXE06i8HxmQ
	Ol06JW6DpL6opd4+mAGICEb5DJaAD4dg=; b=mDG5jzQnapvPqXFTkgcr6HlUups
	W0uACFOPLpgBanmxEKmsM6mrC3TiW3v0ld1UgzvFr4cbXFQbCW/8+N1vdX77QSNr
	MEUsQ+y5vGawwrVExZ/Cd5uOWxCN+irjUIArWnipkBsp00Pse7GSQxERFeBaBwJh
	en+ikyPDgUgQadE+R9pyNJN37KYBRBQUE4k5dwgltx2KZXeiBqUdVaCQUwNCXJ8f
	ixFIrC5zfd867mE7q6BIQYJ44ILCGZtjTJZ+RUnbsUJ+PtwZTjMY8DQX4VwViHKH
	PAET6Q15VRujH/vWVMeimUeJ+hDfsVc/tWmsNON4DzLGaMuDi5O2dXMYd7g==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr3214xu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 14:52:44 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-726ff8540e6so3164914137.3
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 07:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782226364; x=1782831164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dXE06i8HxmQOl06JW6DpL6opd4+mAGICEb5DJaAD4dg=;
        b=bjgtUzN7M2iM7cwjH8snYqBkRhgqJAvMCKVIufWahNCQleBNGwOCDsXMYpKRVp2APv
         QoBdMv5F74BIPBuX3cl/7qYOAE0Pg8mJ6Thlx3T8sAJwoNUsWBZkNV6RpLOykUeVyNeb
         gJPFSbgkmLne8DC4PT/kM1aMOTmb8DL3kK3n0rccmMSXi7lAgRsJBfEKZCSGkN38Xzqd
         hxtGewwBZbqxWvPGM86shN7LzpQAKwY6Velh01cL82j6Ox49hwRuo2jhl+qk/YXhfjfU
         PS9bNcZzeUBAJcDxYOokJYH94W4cjvkUljeGTMCCg/mZ0r5hlF/COqmvU/UUVjgljjIw
         gVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782226364; x=1782831164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dXE06i8HxmQOl06JW6DpL6opd4+mAGICEb5DJaAD4dg=;
        b=WZlZ32nf0GvzAwzzzF4CuZnnqgwJM8VFHKZWhrQqCMcMklPJ72T8jpctbrAdr0dD4J
         Tx22XOUdxzmNgIkrE/9fIY2G5e85pWsanqVvWy4FXxOL6VVNgdjdOoQi6NUnUIyXMPaA
         0O+FgUEAcPJc0XQAUFcTblbIc8q7j6zIlisffVUQHmJkTPV/3GR9p9yVZrxM9wim1qL/
         mqI8iAf0p85A5InG9Nx983wHn1l8bIy5HzOiTAUFs8T6/czZwmox5L2LWIT5OlGLqFiS
         xx0LvBQfj+SmXbVwvg0UvkTBKhpBi6Ywe25SBau3LZznh2Rv1y1ndtIDHoVyh/JR02b7
         v7TA==
X-Forwarded-Encrypted: i=1; AFNElJ8ws9HNgsBpCJV4qwtHR4eXOSS+uCLFnF4f+wjkAdjiTdb2AIXGllq2UQKi6ZD/xRi0wBBRAB/HkOYf@vger.kernel.org
X-Gm-Message-State: AOJu0YzMyGPsL7i66tGgS1KMeBEORczhnIBfpvhWiDhZk55OfXO6k/ID
	75bi3r12KTZV3gQUOIg8yNTrfm+PJ1SxiGU5HtSXQZe9DaU54Lxfdsol+B2U5gURjnfqLVBAFYj
	GwkkKmJcJtBHBvvUhy5+eaOIjj+gVhBwntXh5UsB0PHtgv2+ZHiq7pntq/CP/c5uZ
X-Gm-Gg: AfdE7clbgr2hpvIJXdRvG1ZHYRaf5FDnVRpZnF9gGfdEk+MvoywzbLLO1B3F3t7Jyht
	beSOC2mJed3IHpzpPLVH2c+gVmZIA6Lf4HyRn9HYFb3PxQD2stG0woNVKWkRAFBIDSzakAbJTz0
	d337xEjGwL8p1OTym7VdkiU0dO5xael5dBVtKCM9aX5XwdM+i4vRShGdXqeX95qhOdWaax1T3Vz
	hT3TKevmaWi4vS+VOCboQ8VyJCeCSvYUNH5ZWf0ny3YuocSZc6ooqJymXLnBWBWt76gYR1tT72U
	+72MOZ3r4Mtmb5KzRd35txeD087oisfbnkMutrGFH3cBrOqwE8ZSUEmzTMQ4kMfe6PoNe47KxWG
	DvnGH+3nETBDRWvBz5/5LOaup+Qied9E2yhufoHKXHoRv3NYhzVOhqSuo8s0njFbaUEW4756Lj/
	0PomFHufjJB6pKnoWKpLsUKJAE0A==
X-Received: by 2002:a05:6102:2928:b0:6ef:db57:ed3f with SMTP id ada2fe7eead31-72ff73a4640mr1396807137.29.1782226364099;
        Tue, 23 Jun 2026 07:52:44 -0700 (PDT)
X-Received: by 2002:a05:6102:2928:b0:6ef:db57:ed3f with SMTP id ada2fe7eead31-72ff73a4640mr1396795137.29.1782226363700;
        Tue, 23 Jun 2026 07:52:43 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60aca46csm534042666b.36.2026.06.23.07.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:52:42 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: [RFC 08/12] irqchip/gic-v3: Always call acpi_set_irq_model()
Date: Tue, 23 Jun 2026 16:52:21 +0200
Message-ID: <20260623145225.143218-9-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
References: <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfXzR5k7YKX84O5
 +G5vt76SKpbP7iStrWdlLDFC8D2feMitb06GOOBcD8FnZLS08LoxysVfnjH+r1j7il+ocm4sIch
 18vsvvLqqwAq4avqQtSpLsNrZu3ZZ04=
X-Proofpoint-ORIG-GUID: fJeS0vRPzs27-CPM0G5K4lvi1Q5df-n2
X-Authority-Analysis: v=2.4 cv=HrxG3UTS c=1 sm=1 tr=0 ts=6a3a9dbc cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=L1rKWosBgnsSvNafh98A:9
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfX4eOqLi5cQOTt
 k220SVV/3VESeANwUqYj350NXwW906TJd+KOVLJI17HD+qa5ZSD1Poz1jX2Ph169Av/64PUtFpt
 LhRBk5FVTHvwa1qC00l0sLQP9wmwKT949yLJ9QVNnNCqnf+/0jnRQ0C857LW4LN7guOtGQuK5H6
 FX29cHuBERAcVdbW0qnw4EolDe9hRBup7tlDkEflv2PIrowDIgl3Ed/gMtzJloC6gnapiChQOTv
 x27gmVi0a1hFKglELv4/B2tF/HRFUwaYwoG7P/j56n+DuzHCTCxJMyCJLFeQGFU2GiHlkMPhiwZ
 qlqJE9fVuvDGhGwnl+cZek/1Gfj2yBSWDA0mPW++KN05AcEIGw4/il4cozw+VbfSAoUU70q8OS+
 y4zIF0qf4r0DCg2U4j2aPI+JG8WKi//JVILhyoz1gk6s3Iux9xxDV2J+hKxe97xAxicJwXgFfO4
 ennBxbC70KAmFusJrng==
X-Proofpoint-GUID: fJeS0vRPzs27-CPM0G5K4lvi1Q5df-n2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230122

The gic-v3 code used to only call acpi_set_irq_model() when the GIC is
enumerated through ACPI.

This causes problems for DT-ACPI hybrid mode, where the GIC might be
described in DT but then a driver using info from the ACPI tables might
call acpi_dev_get_irqresource(), which results in a NULL pointer deref
when acpi_set_irq_model() has not been called.

Always call acpi_set_irq_model() when CONFIG_ACPI is enabled to fix this.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/irqchip/irq-gic-v3.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 99444a1b2ffa..2ccd04689a04 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -1974,6 +1974,23 @@ static void gic_enable_nmi_support(void)
 		gic_chip.flags |= IRQCHIP_SUPPORTS_NMI;
 }
 
+#ifdef CONFIG_ACPI
+static struct fwnode_handle *gsi_domain_handle;
+
+static struct fwnode_handle *gic_v3_get_gsi_domain_id(u32 gsi)
+{
+	return gsi_domain_handle;
+}
+
+static void gic_set_acpi_irq_model(struct fwnode_handle *handle)
+{
+	gsi_domain_handle = handle;
+	acpi_set_irq_model(ACPI_IRQ_MODEL_GIC, gic_v3_get_gsi_domain_id);
+}
+#else
+static void gic_set_acpi_irq_model(struct fwnode_handle *handle) { }
+#endif
+
 static int __init gic_init_bases(phys_addr_t dist_phys_base,
 				 void __iomem *dist_base,
 				 struct redist_region *rdist_regs,
@@ -2063,6 +2080,9 @@ static int __init gic_init_bases(phys_addr_t dist_phys_base,
 			gicv2m_init(handle, gic_data.domain);
 	}
 
+	/* Also do this when enumerated through DT for DT-ACPI hybrid mode */
+	gic_set_acpi_irq_model(handle);
+
 	return 0;
 
 out_free:
@@ -2534,13 +2554,6 @@ static void __init gic_acpi_setup_kvm_info(void)
 	vgic_set_kvm_info(&gic_v3_kvm_info);
 }
 
-static struct fwnode_handle *gsi_domain_handle;
-
-static struct fwnode_handle *gic_v3_get_gsi_domain_id(u32 gsi)
-{
-	return gsi_domain_handle;
-}
-
 static int __init
 gic_acpi_init(union acpi_subtable_headers *header, const unsigned long end)
 {
@@ -2588,8 +2601,6 @@ gic_acpi_init(union acpi_subtable_headers *header, const unsigned long end)
 	if (err)
 		goto out_fwhandle_free;
 
-	acpi_set_irq_model(ACPI_IRQ_MODEL_GIC, gic_v3_get_gsi_domain_id);
-
 	if (static_branch_likely(&supports_deactivate_key))
 		gic_acpi_setup_kvm_info();
 
-- 
2.54.0

