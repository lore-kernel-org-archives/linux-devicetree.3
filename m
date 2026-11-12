Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794523174;
	b=DiVZElsFuBoCwsYbrOjNXuAgZYQ9GBoegFOBTJcmyQC37H3hWkkxuuShvzK/Fs/xET6t
	 uD7XmDp21iGVk/t2JGkTgoxEpwrUpdlnZ86PWmRpZXPzVOwBxAT5sKSxeRZWgiADNDWfx
	 xbhaOC/bjzuGii2kr5wUJbbatPQTCO8Dib5dFo7lfzXdlryab0gBTOzFfUrwkJfC5hH1j
	 TTHct+sDw4hUjivHFHL66uGj6gev7ckmkb8thoiBh3tcwNDt/cefQLOsdopyvyDU8jMr5
	 aEjVgZaBzSTaHeO8w647gLmXJ07NxzVfzlu4SJlmx4SaP3yInKTwaxYWsF48yCNLDuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794523174;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yc/mt44iiI3JDnoTa+amNxghgBGpPCt5eP48vxd/muE=;
	b=tb4wLJljAsVcPcrXMZTMc1sdcq/hThXJRTEqec9kdu+AV8dbISE2E7h8SE1bILZzGuw4
	 aWGJFZR4+Ui9uiYoiOogldV4Z9YPCn6AlQg7f52IQrGaCi+DexoDXnbB90wq9EhSfNbOB
	 GkGNrIqZue8Z/hNjwaZsysFW3yN5o6rF71TrwyrO5dneUez7+LRRfB0UMa80w/05DXfOB
	 VeZqsCfTB6RGt46FnOsCjccPK3nMhXQofGiAw8zTgBNMLqyjumELh4BMXudnrsmLMp7n5
	 wIrZDjLjQDBH1qOvtjB8BMd9bZJcf68Atf7nJtBpYTsFqwzk8eFBZk2/4lxYj1DlMtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dmOBb8rJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="T/HlP/+a";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9A7606A88E
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 22:39:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C9A7606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dmOBb8rJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T/HlP/+a
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACJZYC82118663
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 22:39:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yc/mt44iiI3JDnoTa+amNxghgBGpPCt5eP48vxd/muE=; b=dmOBb8rJ9DJUSOlN
	31Fzm000FnyJBj+8QH/DajyZ69iDI04r1LceMymteo4RXucWdvGNTTGt6OAeOnU5
	xbfGLc/WQvzimbrDkwOhWfhf9eMedTZb3eGzgYse0EwgmtqgTYG4ONV46Dwt6DB6
	Uuxui7UGB3YIaQt+2YIEpamngOD8oRw+r7aXK3mYHDarFLSYkKX+kWFpTFR0U1p1
	UByb1YQw3yh/H7r6RX+N0vkofYtgihVgHYGjRyv+OKhEuUZ43evtgFnOgetS32Kt
	7nhEq8sZN+lgxKLIpX2CKj8dLct55F+8dQFiWnmkvStwh5k8RzzMHEU2Jlqa+itd
	63uHSA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkfdgkkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 22:39:33 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1a5005fd0f8so748674c88.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 14:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794523173; x=1795127973; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yc/mt44iiI3JDnoTa+amNxghgBGpPCt5eP48vxd/muE=;
        b=T/HlP/+ahzjBAHcmMwdp40+2HfWnVY6Wf5oa2Ecpg5OCTvBNoq2Wp/ppBQ+Cmfu8fy
         +UwoNevhqUJ/oiSUhVKINxiFItj5uEPOdpDckgTROpoPzRmxUeezZ2jm9xZOIbecp69d
         xOF8EcAZSdYcegY7k8M5v4U9ngtTxQAPe/MckIjHWHjdW8PjcyrmcNe1l/C8fWGpYw5U
         X7FLRl70rIWK9RaF7Ep8v340ghgNTEoZl+W+yz7TFljxGNwhJ6S85qprmmxPxvvJTAGY
         FFwfb3bzCTgt67nbOheXvh2OXkS0mjjfAfBL6R2GlOxetv/7uC6cftpjihqmPZwW3lgQ
         QcIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794523173; x=1795127973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yc/mt44iiI3JDnoTa+amNxghgBGpPCt5eP48vxd/muE=;
        b=Tl356xv9+D4eOihsdqtJ/PYwXd7CM7jLzsT/2TlW3Ny9n9Q380JRmeZIoorMF8cY2y
         KDzKrbzj9/NmX5JlaOB/gHp1JVEUFMNItwOYqWDL7/IvoIvqkDiMp5MeUS6PKUpkwnqQ
         tGhyzBG+RlU0mBriYkMYvcxv3DlpTTbfv/pAXfZptIQTZKZSmhugHKj2bYdWGsG8laYy
         gSEc1BfH7FZB9YwItvXFduA2Cs9Cnyy75Hsl8kBxZCpyQzN94FTstwe734EdwvfNs12b
         mqWWIyiM06PuXWqQkUBDRvEj8xzuvrcuXLUK1sAHkb4PgVcfntnP032rKbpbLbo9dqf0
         3FgQ==
X-Forwarded-Encrypted: i=1; AL+hErFxG07qyLLVMft6hMtdsLtB82bwP7+MmlLvh6J/XOi/l5jZ7be1csJms1MtEL7KXbKmhS0bthSCTCXb@vger.kernel.org
X-Gm-Message-State: APuU4Z/QRRuP/QpSIuuMtVUhVjrSnvItyx3WNFciCKR0EUIuJqK4f64r
	b8wKrARRreGbyaFc4MqT2xKgY/3+MTPQmOSPdvuKAprBKmOo6IJGRa4VnFoiM40VHZzZz+cpKjv
	/j72z3adhZ5NboOfgiET/YZp8tKkyPo2TYqpbo9tTwTmrDALLvXiNKJN/EwygCaVu
X-Gm-Gg: AYBFou1sM1rbJBOKctpVzleY2zWnFaf4pj0fS8IlU8VuYLOPdpq0K/bQpLwYKwAxJ3P
	TVwvc6z6fuhP/t6RRRGdmEFF9Vg9I1UHRjaSmx6ckM85NVfWadK+IeoI14nN36JvheKmLhJk6Ey
	0Y+aWE5jdV2P0FetAgS4sxx4aywMFZOFmS5GiPC6QG2jxSG5GI8CwjMiEwcXQjEaIemFq9Uha3V
	1sC5xjG+Gt1KBk1RpTKe3QbKry1EztXQ311/08SmEBZCIDPoC1+dB/bT58PH5wKzArIeV0r20XP
	K3DYI8yveOQUwxzjrQCc2LozijSDlRLMEoU5vK6UdPhMfMStc5225MF5k6PJwcUFl3tYAK7xbzn
	Lv+Uy2cWGSPz/cvs4iNFEBErg6cAT6rEF0PFdLbFwGeK6r71oR5AFv4d9N+r0bKLKnpB4nGBJ34
	q7Z7I4ci23pw==
X-Received: by 2002:a05:7023:904:b0:195:c6c2:c6b with SMTP id a92af1059eb24-1b50319ce0bmr844405c88.35.1794523173083;
        Thu, 12 Nov 2026 14:39:33 -0800 (PST)
X-Received: by 2002:a05:7023:904:b0:195:c6c2:c6b with SMTP id a92af1059eb24-1b50319ce0bmr844351c88.35.1794523171031;
        Thu, 12 Nov 2026 14:39:31 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm2333496c88.5.2026.11.12.14.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 14:39:30 -0800 (PST)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 04:08:29 +0530
Subject: [PATCH v13 3/6] mmc: sdhci-msm: Set ICE clk to TURBO at sdhci ICE
 init
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
Message-Id: <20261113-enable-ice-clock-scaling-v13-3-258dc817bd63@oss.qualcomm.com>
References: <20261113-enable-ice-clock-scaling-v13-0-258dc817bd63@oss.qualcomm.com>
In-Reply-To: <20261113-enable-ice-clock-scaling-v13-0-258dc817bd63@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <mkp@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA5MCBTYWx0ZWRfX+Tgb40NSHVcz
 c1zasxtXlAdYrVscxTHqEVD+0RQvDdrgloyPYIN9d/JjgEjQAbNmCi3qExaoG+py1eM20V+FrwH
 kOok5KsIxAdAScOg407ledtyTempz+Q=
X-Proofpoint-ORIG-GUID: D1AedOK1jc8nSOZzzPjWbNg23c6DQxA2
X-Authority-Analysis: v=2.4 cv=DoTDa2/+ c=1 sm=1 tr=0 ts=6af64025 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=PzEurhthzZq-M9kHIYIA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA5MCBTYWx0ZWRfX24GpuI7WJ+2l
 uaQsWclZHO7Lh6FLAvquymLoUHkIRETH3qDQMrupZ3wPOzMr/qiMFU0xdetVVqdjQYD27cbUfRK
 EkpX1OJnKRSUUKqzho55Ds0tSJaJVCyi6pYJd83nwF+NLHCDgKgVORlU/5HphAR7LCzu8Ypwu/d
 orDti7Abl3RD7f0EfJzpKmDKB9c5YOH7O+PyBiWWZGU7hK5S0Q8FoIOBcYst4TzSPZQa/AFDGBA
 k/+Ge+BDRpaTZ/wdB4zbs6RqT07qFG29+DOO+6e3X6Q5a3oQ3wS2BAo0QmXwbXcLPHiRLlgIbnX
 ADO3ZtdzCVZRH+xhgO1RBuHmHMRcihmE+LSaI7j0F/7Sdu2HLsc+oJ8Sdrh2QsTzwed0Dk5oLk+
 Zxm2AQOxlw1wJb1JFdX5GRrndhGfRKhEgdEkyggHvvyg+GLMo4MaTMiO0byOpmPIu4V3C/CmpuL
 0CPfdADIbwtWoCd9AFg==
X-Proofpoint-GUID: D1AedOK1jc8nSOZzzPjWbNg23c6DQxA2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120090

MMC controller lacks a clock scaling mechanism, unlike the UFS
controller. By default, the MMC controller is set to TURBO mode
during probe, but the ICE clock remains at XO frequency,
leading to read/write performance degradation on eMMC.

To address this, set the ICE clock to TURBO during sdhci_msm_ice_init
to align it with the controller clock. This ensures consistent
performance and avoids mismatches between the controller
and ICE clock frequencies.

For platforms where ICE is represented as a separate device,
use the OPP framework to vote for TURBO mode, maintaining
proper voltage and power domain constraints.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 drivers/mmc/host/sdhci-msm.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 32b1bcba47d6b75578f01d8de6ee9beea3b1e080..652c5cfc87bcc3c59b845b9e2fd785bcba197fa0 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1902,6 +1902,16 @@ static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
 
 static const struct blk_crypto_ll_ops sdhci_msm_crypto_ops; /* forward decl */
 
+static int sdhci_msm_ice_scale_clk(struct sdhci_msm_host *msm_host,
+				   unsigned long target_freq,
+				   bool round_ceil)
+{
+	if (msm_host->mmc->caps2 & MMC_CAP2_CRYPTO)
+		return qcom_ice_scale_clk(msm_host->ice, target_freq, round_ceil);
+
+	return 0;
+}
+
 static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
 			      struct cqhci_host *cq_host)
 {
@@ -1960,6 +1970,11 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
 
 	mmc->caps2 |= MMC_CAP2_CRYPTO;
 	mmc->caps2 |= MMC_CAP2_CRYPTO_NO_REPROG;
+
+	err = sdhci_msm_ice_scale_clk(msm_host, ULONG_MAX, false);
+	if (err && err != -EOPNOTSUPP)
+		dev_warn(dev, "Unable to boost ICE clock to TURBO\n");
+
 	return 0;
 }
 
@@ -2160,6 +2175,13 @@ sdhci_msm_ice_suspend(struct sdhci_msm_host *msm_host)
 static inline void sdhci_msm_ice_restore(struct sdhci_host *host)
 {
 }
+
+static inline int
+sdhci_msm_ice_scale_clk(struct sdhci_msm_host *msm_host, unsigned long target_freq,
+			bool round_ceil)
+{
+	return 0;
+}
 #endif /* !CONFIG_MMC_CRYPTO */
 
 /*****************************************************************************\

-- 
2.34.1

