Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793628259;
	b=4Oa31zu0Hzi2UOPCBqMvpbw8sK8djdrRSec81k+9MpyhnzBTTGV5tq03IGYGmt4Fg0Fc
	 Vj2HV5yrW4fHHGjMv6VHPFWezik+bbjIO0d87xtfdGh92ZM+yafu3yxlgm3AaJz6tXbeT
	 BwEDGldCV1GdpFrS3x4G1p+dOnAGdEcIifKJfoIg9RYp7KlzynI4Atwyxibghqq4VuNip
	 nKEWJbIH1t/CPzIwQpGw9boQVi7I4u+n3gGTMH9vMqfa/0bb5fbqqkR7wLc8/LKuuhUgg
	 2lUHiZH4nSc8irhE5kJyMMS33/Prd/BDonCkLQzPVBsc0kocgMpI0SWtMgG80/74bmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628259;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MM6WPQvZHCORWNa5gBSC182WytjG7gpmpHokMfwajXg=;
	b=ixd7HDvL2MrlnpcjrR0CP+E+A34S38A8PD0seCFrxXf8CyWZwY+13Rrc6HL81T49r5Ok
	 zkL7Wb/GmKHy8GZBtpbL7Tg6AajJPuIpH1wXd6w/nI5ZfxmIF4A7HR7w/FR/btkCODseS
	 B/qlnDdvYP9djIUPnqIlptc0+5NEolQ0HueQP7FHniknd3GdZVx+79Hg+XNtwktEE9v6E
	 dZbSMlqCURIGV9fjbDMxhn479KFQ7M8vWGKu/P82yD3FO3XO/ACS1hHMBcrh8Aw2KSe/b
	 4eBQ6KiqkebniTwKSv/1iEBohGZXjAdxHh44/Og/y/0ZlAz9LolqzjkDe8DUEruaxng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PMHsexhf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bqtWHwid;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89393606A337
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 14:04:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89393606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PMHsexhf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bqtWHwid
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpQH8846145
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 14:04:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MM6WPQvZHCORWNa5gBSC182WytjG7gpmpHokMfwajXg=; b=PMHsexhfRoZiw1Jp
	hOovDHYjxEUFNn9NPgdNHGpNAiORq/2dwJiC+9wV70VCWP3fAc0MRmV8jSetIhUB
	hI/epuixlKhl+2gw23566HJ6rsomcZJVkgfY9eNeJzmxuN3DgQXqTJOkhjBwH2Fn
	mF1XuoaoesAmrSiYKSQ+e1DI7jOJZ4ym6osZCKcQYuROXtemf01nav2SP3XUlt3s
	3E7SKsdgHJZaJP23jAXdznL4Xx34lxrIuDroTg2lzngDCeQtl2XGblpR/8uMegRy
	Bt8fXx7qLg4edSYaRw66CAEu8Cv4DfznRhZU988SQmfHtXmHtfzqDTSXNkwH5iYm
	FQJz0A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1sx3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 14:04:17 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a065d0e9deso2894900b3a.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 06:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793628257; x=1794233057; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MM6WPQvZHCORWNa5gBSC182WytjG7gpmpHokMfwajXg=;
        b=bqtWHwideMN7zz0WtMHedmiJWRLPLUHF6pmZX5qEHu3P8F9YvJWnpzMwvt0JEdTV/U
         zuxZqXrNuIoP6DvO5azSE6re+bhzz5Sp4H4hk1CJOk7RzgLQfZP/cDwiPbSZFTuDObCQ
         m+ghtkfJZC7XtYCVXu5ialhrIcqJG6rqfrmGdLS3ggRk/WnW0zs4xjTNPi8gGk9n21CS
         zqxm1teD44V7eQ++bzqiUU0uRvrXsVlUAJsCe0VbDOQMgt8di7ytEX7qlL80FLYZG6rY
         rOf3r9aGRoeJr033TbACvzqcvGUIN9ZxX4Fwxc9AzMPjqgdRXTGKjsYIOKae0+rXMru5
         Q0dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793628257; x=1794233057;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MM6WPQvZHCORWNa5gBSC182WytjG7gpmpHokMfwajXg=;
        b=FHXzDWxTjsBDlXM7lSiLbMfC2ous6AIH66GmyYwbfm+hWwOFrmR8in6/P4RnOMJmwD
         blKfi46uY7UOCmGVq7jiq96vXnmH/LD/RWsJ2juodXF84HCe07MnBOvMHjnnRe4u1Feb
         XW2QafAEKah95sqePB6/tOzpZl54FvcV+0rmXwIox4FXKwB72h8iCRcqHE820a//u3KW
         6UWlA/DQfiUnHxtasPj+3IpJP5CXweE0DIvE7xA+0MF3kkdGFjW9zVWnMohA3HAS75l/
         O6izG0iFIXyj5+PRXEIjUy4lbsd0B2iH1nD5nj9srkPn7CEEkXaHprmUkTun8YpGFfz9
         HRpg==
X-Forwarded-Encrypted: i=1; AKwUvBzIH6sajuUVAkMHqz6mKHHxvrBRPPJlLbu6n1VixOCOnQ5fjgPNMp1Lb3ZZEttUD4g8n8BGWftK/AZV@vger.kernel.org
X-Gm-Message-State: APuU4Z/BVfC8ziuB2oBQDuY0SENAyN0HqWKEPfMQ7HzqkGiVGWOJrvKP
	4gYBOWgHUiuHVKmheM+172CJ//r5joDKHpSaVG6JK46sCj6XC48ix+Sei5dOZeBdD6HN21a2vog
	0Q/LZWdiFIJE2VwqJVCldtINkWnp9s6auIAe347iJihy2k2bGI6X4rQBC6wBOC3AQ
X-Gm-Gg: AYBFou2eaQexwvwGXyOGAlyCw64rcs57O8dVm8YtA+tMpL1wykXwSBrh98M1BCJn2xZ
	0acjdSEvyL/qe6J+msep1Nv1qkBx6XHQWG0eyeOtoae/sKy1gwjphjnMo00tJ2DLTbGzYynmbi6
	fL2QxjjhLvyty4kBdgCw17sM7ma6AJzJBRjuQtshrXWsl7AroY2/dNrhPSfVy7W3Ssze8pSjp+e
	y2yUSmOfY7tNly60fi4WXJPd+xp2qqjcExocPXyMkoGGJgQ8CxD1uakmmP57CpNKVtUVxle7OBl
	Yh8SwEw2YUabVsnG3HOieRXW/y5QjN5m31TzircbsqQTUEDTAQUoYWrfnwMmjblLdM2UfNCP/i1
	JmSIHx9LZwJpwiFBvQgperKaUxr7QLxAjSJ2DF8G+TfcMC8BSPAzfUT9+oOAyJkhCEOu+6LxYQi
	E=
X-Received: by 2002:a05:6a00:bd02:b0:8a0:3617:b53a with SMTP id d2e1a72fcca58-8a9bea6af02mr5307508b3a.18.1793628256825;
        Mon, 02 Nov 2026 06:04:16 -0800 (PST)
X-Received: by 2002:a05:6a00:bd02:b0:8a0:3617:b53a with SMTP id d2e1a72fcca58-8a9bea6af02mr5307477b3a.18.1793628256260;
        Mon, 02 Nov 2026 06:04:16 -0800 (PST)
Received: from hu-ahari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad77fd956sm2286942b3a.3.2026.11.02.06.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:04:15 -0800 (PST)
From: Anjana Hari <anjana.hari@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 19:33:42 +0530
Subject: [PATCH 2/2] mmc: sdhci-msm: Add support for firmware-managed
 resource platforms
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
Message-Id: <20261102-sdcc_scmi-v1-2-244dbd893051@oss.qualcomm.com>
References: <20261102-sdcc_scmi-v1-0-244dbd893051@oss.qualcomm.com>
In-Reply-To: <20261102-sdcc_scmi-v1-0-244dbd893051@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Anjana Hari <anjana.hari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Ram Gupta <ram.gupta@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: Sj21NXCGR29cLe2dfCWwpEIol8wr4A74
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae89861 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=tGE8Z9jcIeqfSwNaEeYA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NSBTYWx0ZWRfX26tmJuxmtgRc
 exwkxeQ46Cva3KDdFBwAD+QYNbSWWYFbLgdy6uKinuvdqOEMpemUA8m+aL8HM2vHGEqobMEdtow
 zY3NhHQAXzezN1B4w9NmlsSp3Pk9I3i2oER+wZ2MV054b1zZKkhADc5w+W+R3EZ2CKPAANDXArI
 dTYhXyHhKh4moP79bkX+tjMiEg8pPPpA0V7eZHF+Or9EWCgqZOKmjL3t+k7eGi0Kyv4wkOMc/mt
 WpPbnVf6L/8CJXeqHknxXf2Czw0Ket4X8somteQOSIXc1x9/66rWwvG6Hx5/3q3IrDhV02ys1+Z
 f4pmQ/umlv7CfVXYFonVgeMW/QZlTwfqHOxnWz1xR6weIOTTNUunJ7Vt/6K+hCrAJ9PK3njC7Vo
 jxXJbW05DzK0AV2XRX3sN95xnwz4D49tA4SkmCNQIRiF/JVVq8N/uAz/2ezrZDMGGJlH6mKXpRC
 cCG+mOtZl3lh2zOWZkQ==
X-Proofpoint-GUID: Sj21NXCGR29cLe2dfCWwpEIol8wr4A74
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NSBTYWx0ZWRfX9fo7SWhaQMcm
 +RzGwJeT0kMTSyfsOIW0s56hrCnS9ZpZfSnat2RPyIyfL9OzJFnECzmkpl1eV9/1sJ7K0/X6DVq
 z9866reskh8RXl1ZibF5f2AYeoaBKck=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020055

On certain Qualcomm automotive SoCs such as Nord, platform resources
including clocks, interconnect bandwidth, resets, and regulators are
owned and managed by firmware rather than directly by Linux. The
firmware abstracts these resources behind logical power domains and
exposes control through the SCMI power protocol.

Introduce a firmware-managed variant of the sdhci-msm driver that
operates through this abstraction instead of directly programming GCC
clocks and PMIC regulators.

The firmware-managed model uses two logical power domains, attached at
probe time via dev_pm_domain_attach_list():

  - "power" domain: governs SDCC rail power state. It is activated at
    probe and released at remove via pm_runtime_resume_and_get() and
    pm_runtime_put_sync() on the domain device. These calls are
    translated by the SCMI power protocol into firmware power-state
    requests.

  - "perf" domain: the SCMI perf domain driver populates OPPs at probe
    time by querying the firmware-reported performance levels via
    perf_ops->device_opps_add(). Clock rate selection uses
    dev_pm_opp_find_freq_floor() to locate the nearest OPP at or below
    the requested frequency, then dev_pm_opp_set_opp() to apply it,
    rather than directly programming the GCC clock tree.

A new variant sdhci_msm_fw_v5_var is introduced with the compatible
string "qcom,nord-sdhci". Detection is automatic at probe: a non-NULL
pd_data.pd_names in the variant descriptor marks the platform as
firmware-managed, causing probe to select firmware-specific platform
data (sdhci_msm_fw_pdata) and ops (sdhci_msm_fw_ops).

The firmware-managed ops provide:
  - sdhci_msm_fw_get_max_clock: queries the perf domain OPP table
    using dev_pm_opp_find_freq_floor() at ULONG_MAX to discover the
    maximum supported frequency, replacing the direct GCC readout.
  - sdhci_msm_fw_set_clock: routes clock rate programming through the
    perf domain OPP path, reusing the existing bus-mode multiplier
    logic to derive the target rate.

Suspend and resume sequences bypass local clock and regulator management
for firmware-managed platforms, as firmware handles those transitions
autonomously in response to SCMI power-state transitions from the
runtime PM framework.

Co-developed by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Signed-off-by: Anjana Hari <anjana.hari@oss.qualcomm.com>
---
 drivers/mmc/host/sdhci-msm.c | 213 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 208 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index aecd425bf095..da52a45203a5 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -8,8 +8,9 @@
 #include <linux/module.h>
 #include <linux/delay.h>
 #include <linux/mmc/mmc.h>
-#include <linux/pm_runtime.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/iopoll.h>
 #include <linux/regulator/consumer.h>
@@ -168,6 +169,9 @@
 #define ICE_HCI_PARAM_CCI	GENMASK(7, 0)
 #define ICE_HCI_PARAM_CE	GENMASK(8, 8)
 
+#define DOMAIN_IDX_POWER	0
+#define DOMAIN_IDX_PERF		1
+
 struct sdhci_msm_offset {
 	u32 core_hc_mode;
 	u32 core_mci_data_cnt;
@@ -275,6 +279,11 @@ struct sdhci_msm_variant_info {
 	bool restore_dll_config;
 	const struct sdhci_msm_variant_ops *var_ops;
 	const struct sdhci_msm_offset *offset;
+	/*
+	 * pd_names != NULL marks this variant as firmware managed;
+	 * see fw_managed detection in sdhci_msm_probe().
+	 */
+	const struct dev_pm_domain_attach_data pd_data;
 };
 
 struct sdhci_msm_host {
@@ -285,6 +294,7 @@ struct sdhci_msm_host {
 	struct clk *xo_clk;	/* TCXO clk needed for FLL feature of cm_dll*/
 	/* core, iface, cal and sleep clocks */
 	struct clk_bulk_data bulk_clks[4];
+	struct dev_pm_domain_list *pd_list;
 #ifdef CONFIG_MMC_CRYPTO
 	struct qcom_ice *ice;
 #endif
@@ -302,6 +312,7 @@ struct sdhci_msm_host {
 	u32 caps_0;
 	bool mci_removed;
 	bool restore_dll_config;
+	bool fw_managed;
 	const struct sdhci_msm_variant_ops *var_ops;
 	const struct sdhci_msm_offset *offset;
 	bool use_cdr;
@@ -414,6 +425,45 @@ static void msm_set_clock_rate_for_bus_mode(struct sdhci_host *host,
 		 mmc_hostname(host->mmc), achieved_rate, timing);
 }
 
+static int msm_fw_set_clock_rate_for_bus_mode(struct sdhci_host *host,
+					      unsigned int clock)
+{
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+	struct device *dev = mmc_dev(host->mmc);
+	struct dev_pm_opp *opp;
+	struct device *perf_dev;
+	struct mmc_ios ios = host->mmc->ios;
+	unsigned long clock_long = (unsigned long)clock;
+	unsigned long desired_rate;
+	unsigned int mult;
+	int ret;
+
+	perf_dev = msm_host->pd_list->pd_devs[DOMAIN_IDX_PERF];
+
+	mult = msm_get_clock_mult_for_bus_mode(host, clock, ios.timing);
+	desired_rate = clock_long * mult;
+
+	/* Find the nearest OPP at or below the requested frequency. */
+	opp = dev_pm_opp_find_freq_floor(perf_dev, &desired_rate);
+	if (IS_ERR(opp)) {
+		dev_err(dev, "Failed to find OPP for freq %lu: %pe\n", clock_long, opp);
+		return PTR_ERR(opp);
+	}
+
+	ret = dev_pm_opp_set_opp(perf_dev, opp);
+	dev_pm_opp_put(opp);
+	if (ret) {
+		dev_err(dev, "Failed to set OPP for freq %lu: %d\n", clock_long, ret);
+		return ret;
+	}
+
+	/* desired_rate was rounded down by find_freq_floor to the actual OPP rate. */
+	host->mmc->actual_clock = mult ? desired_rate / mult : desired_rate;
+	msm_host->clk_rate = desired_rate;
+	return 0;
+}
+
 /* Platform specific tuning */
 static inline int msm_dll_poll_ck_out_en(struct sdhci_host *host, u8 poll)
 {
@@ -1253,7 +1303,10 @@ static int sdhci_msm_execute_tuning(struct mmc_host *mmc, u32 opcode)
 	 */
 	if (host->flags & SDHCI_HS400_TUNING) {
 		sdhci_msm_hc_select_mode(host);
-		msm_set_clock_rate_for_bus_mode(host, ios.clock, ios.timing);
+		if (msm_host->fw_managed)
+			msm_fw_set_clock_rate_for_bus_mode(host, ios.clock);
+		else
+			msm_set_clock_rate_for_bus_mode(host, ios.clock, ios.timing);
 		host->flags &= ~SDHCI_HS400_TUNING;
 	}
 
@@ -1847,6 +1900,28 @@ static unsigned int sdhci_msm_get_min_clock(struct sdhci_host *host)
 	return SDHCI_MSM_MIN_CLOCK;
 }
 
+static unsigned int sdhci_msm_fw_get_max_clock(struct sdhci_host *host)
+{
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+	unsigned long max_freq = ULONG_MAX;
+	struct dev_pm_opp *opp;
+	struct device *perf_dev;
+	struct device *dev = mmc_dev(host->mmc);
+
+	perf_dev = msm_host->pd_list->pd_devs[DOMAIN_IDX_PERF];
+
+	opp = dev_pm_opp_find_freq_floor(perf_dev, &max_freq);
+	if (IS_ERR(opp)) {
+		dev_err(dev, "Failed to find opp for freq %lu\n", max_freq);
+		return SDHCI_MSM_MIN_CLOCK;
+	}
+
+	dev_pm_opp_put(opp);
+
+	return max_freq;
+}
+
 /*
  * __sdhci_msm_set_clock - sdhci_msm clock control.
  *
@@ -1892,6 +1967,40 @@ static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
 	__sdhci_msm_set_clock(host, clock);
 }
 
+static void sdhci_msm_fw_set_clock(struct sdhci_host *host, unsigned int clock)
+{
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+
+	if (!clock) {
+		host->mmc->actual_clock = 0;
+		msm_host->clk_rate = 0;
+		goto out;
+	}
+
+	sdhci_msm_hc_select_mode(host);
+
+	if (msm_fw_set_clock_rate_for_bus_mode(host, clock))
+		return;
+out:
+	__sdhci_msm_set_clock(host, clock);
+}
+
+static int sdhci_msm_fw_power_state(struct device *dev, bool power_on)
+{
+	struct sdhci_host *host = dev_get_drvdata(dev);
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+	struct device *pwr_dev;
+
+	pwr_dev = msm_host->pd_list->pd_devs[DOMAIN_IDX_POWER];
+
+	if (power_on)
+		return pm_runtime_resume_and_get(pwr_dev);
+	else
+		return pm_runtime_put_sync(pwr_dev);
+}
+
 /*****************************************************************************\
  *                                                                           *
  * Inline Crypto Engine (ICE) support                                        *
@@ -2550,6 +2659,17 @@ static const struct sdhci_msm_variant_info sdhci_msm_v5_var = {
 	.offset = &sdhci_msm_v5_offset,
 };
 
+static const struct sdhci_msm_variant_info sdhci_msm_fw_v5_var = {
+	.mci_removed = true,
+	.var_ops = &v5_var_ops,
+	.offset = &sdhci_msm_v5_offset,
+	.pd_data = {
+		.pd_flags = PD_FLAG_DEV_LINK_ON,
+		.pd_names = (const char * []) { "power", "perf" },
+		.num_pd_names = 2,
+	},
+};
+
 static const struct sdhci_msm_variant_info sdm845_sdhci_var = {
 	.mci_removed = true,
 	.restore_dll_config = true,
@@ -2566,6 +2686,7 @@ static const struct of_device_id sdhci_msm_dt_match[] = {
 	{.compatible = "qcom,sdhci-msm-v5", .data = &sdhci_msm_v5_var},
 	{.compatible = "qcom,sdm670-sdhci", .data = &sdm845_sdhci_var},
 	{.compatible = "qcom,sdm845-sdhci", .data = &sdm845_sdhci_var},
+	{.compatible = "qcom,nord-sdhci", .data = &sdhci_msm_fw_v5_var},
 	{.compatible = "qcom,sc7180-sdhci", .data = &sdm845_sdhci_var},
 	{},
 };
@@ -2587,6 +2708,21 @@ static const struct sdhci_ops sdhci_msm_ops = {
 	.set_timeout = sdhci_msm_set_timeout,
 };
 
+static const struct sdhci_ops sdhci_msm_fw_ops = {
+	.reset = sdhci_and_cqhci_reset,
+	.set_clock = sdhci_msm_fw_set_clock,
+	.get_min_clock = sdhci_msm_get_min_clock,
+	.get_max_clock = sdhci_msm_fw_get_max_clock,
+	.set_bus_width = sdhci_set_bus_width,
+	.set_uhs_signaling = sdhci_msm_set_uhs_signaling,
+	.write_w = sdhci_msm_writew,
+	.write_b = sdhci_msm_writeb,
+	.irq	= sdhci_msm_cqe_irq,
+	.dump_vendor_regs = sdhci_msm_dump_vendor_regs,
+	.set_power = sdhci_set_power_noreg,
+	.set_timeout = sdhci_msm_set_timeout,
+};
+
 static const struct sdhci_pltfm_data sdhci_msm_pdata = {
 	.quirks = SDHCI_QUIRK_BROKEN_CARD_DETECTION |
 		  SDHCI_QUIRK_SINGLE_POWER_WRITE |
@@ -2597,6 +2733,16 @@ static const struct sdhci_pltfm_data sdhci_msm_pdata = {
 	.ops = &sdhci_msm_ops,
 };
 
+static const struct sdhci_pltfm_data sdhci_msm_fw_pdata = {
+	.quirks = SDHCI_QUIRK_BROKEN_CARD_DETECTION |
+		  SDHCI_QUIRK_SINGLE_POWER_WRITE |
+		  SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN |
+		  SDHCI_QUIRK_MULTIBLOCK_READ_ACMD12,
+
+	.quirks2 = SDHCI_QUIRK2_PRESET_VALUE_BROKEN,
+	.ops = &sdhci_msm_fw_ops,
+};
+
 static inline void sdhci_msm_get_of_property(struct platform_device *pdev,
 		struct sdhci_host *host)
 {
@@ -2665,8 +2811,21 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	const struct sdhci_msm_offset *msm_offset;
 	const struct sdhci_msm_variant_info *var_info;
 	struct device_node *node = pdev->dev.of_node;
+	bool fw_managed;
 
-	host = sdhci_pltfm_init(pdev, &sdhci_msm_pdata, sizeof(*msm_host));
+	var_info = of_device_get_match_data(&pdev->dev);
+	if (!var_info)
+		return -ENODEV;
+	fw_managed = !!var_info->pd_data.pd_names;
+
+	/*
+	 * Based on variant info, differentiate platform initialization
+	 * for local and remote managed resource platforms.
+	 */
+	if (fw_managed)
+		host = sdhci_pltfm_init(pdev, &sdhci_msm_fw_pdata, sizeof(*msm_host));
+	else
+		host = sdhci_pltfm_init(pdev, &sdhci_msm_pdata, sizeof(*msm_host));
 	if (IS_ERR(host))
 		return PTR_ERR(host);
 
@@ -2684,12 +2843,11 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	 * Based on the compatible string, load the required msm host info from
 	 * the data associated with the version info.
 	 */
-	var_info = of_device_get_match_data(&pdev->dev);
-
 	msm_host->mci_removed = var_info->mci_removed;
 	msm_host->restore_dll_config = var_info->restore_dll_config;
 	msm_host->var_ops = var_info->var_ops;
 	msm_host->offset = var_info->offset;
+	msm_host->fw_managed = fw_managed;
 
 	msm_offset = msm_host->offset;
 
@@ -2698,6 +2856,32 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 
 	msm_host->saved_tuning_phase = INVALID_TUNING_PHASE;
 
+	if (msm_host->fw_managed) {
+		ret = dev_pm_domain_attach_list(&pdev->dev, &var_info->pd_data,
+						&msm_host->pd_list);
+		if (ret < 0)
+			return dev_err_probe(&pdev->dev, ret,
+					     "Failed to attach power domains\n");
+
+		if (ret != var_info->pd_data.num_pd_names)
+			return dev_err_probe(&pdev->dev, -ENODEV,
+					     "Expected %d power domains, got %d\n",
+					     var_info->pd_data.num_pd_names, ret);
+
+		ret = sdhci_msm_fw_power_state(&pdev->dev, true);
+		if (ret) {
+			dev_pm_domain_detach_list(msm_host->pd_list);
+			return dev_err_probe(&pdev->dev, ret,
+					     "Failed to power on domain\n");
+		}
+
+		/*
+		 * Skip initializing clocks, regulators and reset in kernel
+		 * for firmware managed platforms.
+		 */
+		goto skip_resource_init;
+	}
+
 	ret = sdhci_msm_gcc_reset(&pdev->dev, host);
 	if (ret)
 		return ret;
@@ -2786,6 +2970,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 		}
 	}
 
+skip_resource_init:
 	/* Reset the vendor spec register to power on reset state */
 	writel_relaxed(CORE_VENDOR_SPEC_POR_VAL,
 			host->ioaddr + msm_offset->core_vendor_spec);
@@ -2917,6 +3102,12 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 bus_clk_disable:
 	if (!IS_ERR(msm_host->bus_clk))
 		clk_disable_unprepare(msm_host->bus_clk);
+fw_detach:
+	if (msm_host->fw_managed) {
+		sdhci_msm_fw_power_state(&pdev->dev, false);
+		dev_pm_domain_detach_list(msm_host->pd_list);
+		msm_host->pd_list = NULL;
+	}
 	return ret;
 }
 
@@ -2930,6 +3121,12 @@ static void sdhci_msm_remove(struct platform_device *pdev)
 
 	sdhci_remove_host(host, dead);
 
+	if (msm_host->fw_managed) {
+		sdhci_msm_fw_power_state(&pdev->dev, false);
+		dev_pm_domain_detach_list(msm_host->pd_list);
+		msm_host->pd_list = NULL;
+	}
+
 	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
@@ -2947,6 +3144,9 @@ static int sdhci_msm_runtime_suspend(struct device *dev)
 	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
 	unsigned long flags;
 
+	if (msm_host->fw_managed)
+		return sdhci_msm_fw_power_state(dev, false);
+
 	spin_lock_irqsave(&host->lock, flags);
 	host->runtime_suspended = true;
 	spin_unlock_irqrestore(&host->lock, flags);
@@ -2967,6 +3167,9 @@ static int sdhci_msm_runtime_resume(struct device *dev)
 	unsigned long flags;
 	int ret;
 
+	if (msm_host->fw_managed)
+		return sdhci_msm_fw_power_state(dev, true);
+
 	ret = clk_bulk_prepare_enable(ARRAY_SIZE(msm_host->bulk_clks),
 				       msm_host->bulk_clks);
 	if (ret)

-- 
2.34.1

