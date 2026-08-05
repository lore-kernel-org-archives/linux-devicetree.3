Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7948F3EA977
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 09:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785921705; cv=none; b=MLaU07CntzNAE4pF6yFAPUxN15J5jw5I56PTxh84w34rdigiQlolsvpAhmmQMb1yFVXHlbKyNm1aZuzrDOApeuaHLCRVXlldpgqNBDybWVCjXw/axxGBeTSsMhUIFIzwUX8N8WQlCku5FWruNVzZOf04VMARE85SfZqyLRwZfB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785921705; c=relaxed/simple;
	bh=06GM06RMXNj1CMZ/fuLjt/+XEZVnfkbqtv78k0uCzag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TuP876GGibak0Fqy1JRF0Xo7SaCZzz6iruyIxDID6GFwAgsS3UQ78v9SxdvNqVSbjCpQpB9VVlQ4v9et94CnbNrJ2rlHwCJ4v2ezC+nhyNjUZOYvBi1qncjHDcsNw/z12TAMgHOzRPuPSeTxA4wteNlgErau+g+iyPWxI/sFf1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N65bEnVL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BdDEP7wi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N65bEnVL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BdDEP7wi"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6758dHaZ2468138
	for <devicetree@vger.kernel.org>; Wed, 5 Aug 2026 09:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	17gNOg/IJCDj1TVREVlKHTlpRu+kYYeF1zlXTMH9cdM=; b=N65bEnVLCN0IgCtr
	do/8ey41FYb0KPQrPb/cl/uXZPlPSNcXXmeXM4JjtAGv0D3g8qSXCre+zZQ60kUY
	+ivAbGgcMCAdrh1sp29sbh/Z5ulWH8VRfRskvBOsnHA2XN2SSLVdWlmEj4Ut5f2M
	e4qWfK7TXNrgbMayD5N+aiaXrhUJdV/JQg8EKJh5ZLkB/7fjq/pg/ulWopJNOdcU
	2K+ufSwkVBk1xmbGWpIbDCI2Klpknne+HCY/mpCT6t5t7Ibv0gzGU7+yKd909cdi
	P95Fgczv8THNnDvpQIqsz51ujYQdi+mgbIKrjNOeiMRfpYJNr32vG+Dt7b2lUmSD
	EduKPw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum56ktx3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 09:21:43 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8485d853b08so1402119b3a.1
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 02:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785921703; x=1786526503; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=17gNOg/IJCDj1TVREVlKHTlpRu+kYYeF1zlXTMH9cdM=;
        b=BdDEP7wi8lUMGTEefPqXzRsP6cHVN+e+NR8kR9gYHWjkcNx2vP9xS1v3qk75koi/F2
         wsdNzNag22lD1dC4m0moFg7567bIeEINw3ORQ07n7owZhDLLQrEB9afBqvfBQFpBKLKC
         mIzZCFog+hTce8R2XXv2mKR4bEv0Xxhq2dDZYi1BVXkep1xO6qMNl6/LsJHGkNtaOBkM
         3uljsTfjfqcqkrYIk1pg6iLuWVedHnt71blkjRSpONY5HwIUCFLLM0BFTr7ZGMJByeK9
         HTumBMwvnEOMdVHKm7yNDeeztxgOm9Sy98D/oBAbHgxq9LAW2r5RmIhwfAAX2E+A3BU2
         bBZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785921703; x=1786526503;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=17gNOg/IJCDj1TVREVlKHTlpRu+kYYeF1zlXTMH9cdM=;
        b=iAAJcVPSS7Q6ukGnXT8dYH007qekk4T0AxXH4xjkdj3nohIAC9ZMyx+64oMx2IIyA5
         +/94c4AJOZNgyBK67daiJ4lMXG8qgD4120qJH35vTwJrUxdu48el/ZQ/OJjB1u31lFMy
         ARH2Lz801scBXmoeI2P3D3d6ONZjEqRQmWeR8YyCqhGWMzWR9GolC3PmER9k5AO/rzWG
         8Dz5lu9n+9UK4/AnpaqIixFI0IoEGraC693SOzhO9JB1yMx/LIncd++6YwIzxTddSNQO
         EO6jFExvwb0SWR/cGVC2h0nC7kerQiACbBpHo1ody8ghzQ0S+JX7nHQ1oQ7xuBXjIeSM
         R2DA==
X-Forwarded-Encrypted: i=1; AHgh+RqLHxxoOkY/d/q/3emjGMBxEy8bEPAvS0HZrX2SDBZ8uBPOJ8dVpz552qfAr76Y69WJIluk3rk21cVW@vger.kernel.org
X-Gm-Message-State: AOJu0YzasuVJAi0Ny684Z8avkOKrN9WvKA/fB5UIw+qrNasRonIXzi2O
	ydzdVuuaos1cWFB5vzHrCOr1K0OekKinLm4DLrH4Z0LVmYgARetytOJAXao6DP/mXa0Lu/ho4Kw
	yaO3twFieJWQyPGW9bS0LFC3rj/aL7tABqWJiy/itbl0J8tReXARd6sDV+wDKJhti
X-Gm-Gg: AR+sD10rm7oeV9iHyOttILLgq7us6SFzHXL11nfcAhJ4a+dn8wfPro0tn9dgCmSKZLn
	fp32ZI2E7IoJmJtcEdC+9zmik61frJKHZ3UohNjS4XuwRBGhN3wAqjOKY2hD9GnyRXanzmnEic0
	czCeExjYvopt+eMSdbWzdfwj3OGcgRnHgBy8k7FKpbz9rREohBbSZL2GekmWN7Ens3J/WWMveND
	m8U8MKyI8/VFwaP3AqwjvwWZuw2BRquhtpvN80QkFxqhPGBkDlE85tvjZ6vdJA6LjTdrf1+WtIu
	XlTVhF8TmnHblXeDkxI8HB2RK0XV/KY/5FZBlEch68+JaiwZ4wbV2ceAmXNXcdy90ISBTuDorqh
	F9zETVDIct3BgPmnl1Q4MWnxg6UPqWSm7BJ14jt2IgS7P9TQ=
X-Received: by 2002:a05:6a20:a10a:b0:3c4:3ada:384d with SMTP id adf61e73a8af0-3cb85f42d97mr5462052637.30.1785921702787;
        Wed, 05 Aug 2026 02:21:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:a10a:b0:3c4:3ada:384d with SMTP id adf61e73a8af0-3cb85f42d97mr5461999637.30.1785921702278;
        Wed, 05 Aug 2026 02:21:42 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe70928ba2sm1169429a12.29.2026.08.05.02.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 02:21:41 -0700 (PDT)
Date: Wed, 5 Aug 2026 02:21:39 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        conor+dt@kernel.org, olteanv@gmail.com
Subject: Re: [PATCH v8 2/6] phy: qcom: qmp-pcie: Add QMP PCIe Multi-PHY driver
Message-ID: <anMAo+DNmtbAvKyf@hu-qianyu-lv.qualcomm.com>
References: <20260730-glymur_linkmode_0731-v8-0-a455265ad8bf@oss.qualcomm.com>
 <20260730-glymur_linkmode_0731-v8-2-a455265ad8bf@oss.qualcomm.com>
 <20260731052639.81FF61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260731052639.81FF61F000E9@smtp.kernel.org>
X-Proofpoint-ORIG-GUID: 2Ss5AV8KbxBcc-97v8byoG9-4oUErOGh
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=6a7300a7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=seLki_t14JjGgSYVy8sA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA3MyBTYWx0ZWRfX60xQVMfV8TlU
 defm4CAaojR1R5RdeRekGNj6AgEGHasMqdnS9LNPWJ5xGfJ7muX/LdRBvFDiME36EUGYIQqDLNn
 aeC34ikMgm1ajw0jdyFMNTffHZ/ysJQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA3MyBTYWx0ZWRfX0tXQBGiL4KBj
 3s4Vd4mpQluM/eVorX0ToimbUReWiaSAaPuwaQqVSXE3uuONpKw18rczF7mlSpRV4ugbAdgdlRf
 6MTWm0K+HeVKIAXbMf5o5qpzBSad3X0FQBY22+UxS93HtQtAH9R8RFEBGAo6joCX5MEi2RERwXd
 dPVvKiUrJHXsoQR83qURaMpJAReciR4NIGAJtDp0Gh17HPerAbhOmNBA0jx+l9o0WczzuFjjIjp
 LO3j1AaTfVafJnP31hTlUsVSjDLts/b64a3SUprJS1RZCtqdRH3zoMUd7xIA/DViMccbbRE0B7F
 Wj2f9iVnVhQdLEHqONokoYbeFgbtRZCVTyOSECXuRSAQ3NiW0/qNsO7VrO63Mt+DwPPQZjgHfZ1
 lbjX7CSJlEqEPeuTL85YMkldjNvfY9FmIbmR8Tco8aCDaVp3OTYcABDy1e9+jYJ050MzI6teck8
 KxtEoCQVXaGQyx9t45A==
X-Proofpoint-GUID: 2Ss5AV8KbxBcc-97v8byoG9-4oUErOGh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050073

On Fri, Jul 31, 2026 at 05:26:39AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] Asynchronous pm_runtime_put() during PHY power off leaves hardware powered on if device is removed.
> - [Medium] Unchecked return value of of_property_count_strings() leads to massive allocation attempt and incorrect error masking.
> --
> 
> --- Patch [2]: [PATCH v8 2/6] phy: qcom: qmp-pcie: Add QMP PCIe Multi-PHY driver ---
> commit 512c48acf91e02b02ae430362c2348d1ce2fb525
> Author: Qiang Yu <qiang.yu@oss.qualcomm.com>
> 
> phy: qcom: qmp-pcie: Add QMP PCIe Multi-PHY driver
> 
> This patch introduces a dedicated QMP PCIe PHY driver for hardware blocks
> that support multiple link topologies. It reads the current link mode from
> the hardware and instantiates the necessary sub-PHYs, inheriting firmware
> configurations.
> 
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
> > new file mode 100644
> > index 0000000000000..739c7c96aeed6
> > --- /dev/null
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
> [ ... ]
> > +static int qmp_pcie_pd_power_on(struct qmp_pcie *qmp)
> > +{
> > +	const struct qmp_phy_cfg *cfg = qmp->cfg;
> > +	int i, ret;
> > +
> > +	for (i = 0; i < cfg->num_pds; i++) {
> > +		ret = pm_runtime_resume_and_get(qmp->pd_devs[i]);
> > +		if (ret < 0) {
> > +			dev_err(qmp->dev, "failed to power on %s domain: %d\n",
> > +				cfg->pd_names[i], ret);
> > +			goto err_power_off;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +
> > +err_power_off:
> > +	while (--i >= 0)
> > +		pm_runtime_put(qmp->pd_devs[i]);
> 
> [Severity: Medium]
> Will using an asynchronous pm_runtime_put() here (and in 
> qmp_pcie_pd_power_off) race with device unbind?
> 
> If the PHY provider unbinds, device links will cause the consumer to unbind
> first, which calls phy_power_off() and phy_exit(), queuing an asynchronous
> suspend. The PHY provider's devres cleanup then calls dev_pm_domain_detach(),
> which executes pm_runtime_disable() and cancels the pending suspend.
> 
> Does this leave the hardware powered on? Should pm_runtime_put_sync() be used
> instead to ensure the hardware powers down before the domain detaches?

This driver has no .remove callback so there's no unbind path for
qmp_pcie_pd_power_off()'s async put to race with. And even if
dev_pm_domain_detach is somehow called. qmp_pcie_pd_detach()'s
dev_pm_domain_detach(dev, true) handles any still-pending async request
internally (pm_runtime_disable() → __pm_runtime_barrier()).

> 
> > +
> > +	return ret;
> > +}
> > +
> > +static void qmp_pcie_pd_power_off(struct qmp_pcie *qmp)
> > +{
> > +	const struct qmp_phy_cfg *cfg = qmp->cfg;
> > +	int i;
> > +
> > +	for (i = cfg->num_pds - 1; i >= 0; i--)
> > +		pm_runtime_put(qmp->pd_devs[i]);
> 
> [Severity: Medium]
> As mentioned above, can this asynchronous put race with the devres teardown
> during removal?
> 
> > +}
> [ ... ]
> > +static int qmp_pcie_multiphy_register_clocks(struct device *dev,
> > +					      struct device_node *np,
> > +					      struct qmp_pcie_multiphy *qmp_data)
> > +{
> > +	int num_pipe_outputs;
> > +	int i, ret;
> > +
> > +	num_pipe_outputs = of_property_count_strings(np, "clock-output-names");
> > +
> > +	qmp_data->num_pipe_outputs = num_pipe_outputs;
> > +	qmp_data->pipe_out_clks = devm_kcalloc(dev, num_pipe_outputs,
> > +					       sizeof(*qmp_data->pipe_out_clks),
> > +					       GFP_KERNEL);
> 
> [Severity: Medium]
> Does this code properly handle missing or malformed device tree properties?
> 
> If "clock-output-names" is missing, of_property_count_strings() will return
> a negative error code (e.g., -EINVAL). This negative value is passed as the
> count parameter to devm_kcalloc(), underflowing into a massive size_t. 
> 
> While the internal size_mul checks in the allocator safely return NULL, this
> causes the driver to fail probe with -ENOMEM rather than the actual device
> tree parsing error. Should num_pipe_outputs be checked for a negative value
> before attempting the allocation?

As Konrad commented, clock-output-names is required via bindings, so the
check is not required.

- Qiang Yu

> 
> > +	if (!qmp_data->pipe_out_clks)
> > +		return -ENOMEM;
> > +
> > +	for (i = 0; i < num_pipe_outputs; i++) {
> > +		ret = __phy_pipe_clk_register(dev, np, i,
> > +					      &qmp_data->pipe_out_clks[i]);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	return devm_of_clk_add_hw_provider(dev, qmp_pcie_multiphy_clk_hw_get, qmp_data);
> > +}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260730-glymur_linkmode_0731-v8-0-a455265ad8bf@oss.qualcomm.com?part=2
