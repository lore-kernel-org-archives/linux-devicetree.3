Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182181;
	b=PDQZxDKnO03HcqOTCWBBofiwx+yhNP5xSJo+ZLJ2PC2Q3U/ibWJB2mLJq2niBhdRUFfm
	 bmtX9JowkC2aeTsRo9YoczIjOtkrKU3IzOfWOxSfsyTu3XORcQpFXrcIBOGQ2MLRuT8zX
	 dEBBxh/687mT7IrfTn3wzs1m/X2Ns8avnj+3nC2LZMg31fm5rcHezDtxh2B3rnUGYYEa/
	 FBPT2a64EH0QlSUqrWHj1RcQhdgOzrJ4konPcU7L2E2ZDqfBbLOLsBSL82Q1SocTVlIS7
	 DSF0OVRU9/c+Ayj5M9H/m76pZQGAXdxAHZYsJiaPIyyuUDtHjj593ETlUI7gl0PhVFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182181;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hL3HLP0Pt+BHfyVSk1KqizSGo5qiQYi0LzCy+jMNuKg=;
	b=AoFKLc38qyT4RvW2tbBGQZV5gC9NEe/Ms1bcttZGHnQTx6dVdFl1H5WKAu/FngmNf/My
	 T92jvcYqBsq921zsIuA7byvKENotY1IESzVLA0B2eQeM8QCFO7Q+CWQemeXo3YrePf2c8
	 E1Fmw5D1UU+qdf+5zLmlURHyFwF2N+V00J9wvQPhGDXF7QiJIg3eNFbuRb5VB6DkXW1h5
	 hPKty+cGJBmu+SKZunimfk6QolSGCRPL8fiZ6x86O+2kYwWlwzredHOJ/gbwAzJBnbe8A
	 bwbhVpXurQ9dVoebAkQW9XirUsyvB/rT7EgkrSsen6JB098vIpoMqRgPlDDxWyvG07Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="A6ZiGQf/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MBWNt3C5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77B9606A334
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:42:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D77B9606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A6ZiGQf/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MBWNt3C5
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjomn1462862
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hL3HLP0Pt+BHfyVSk1KqizSGo5qiQYi0LzCy+jMNuKg=; b=A6ZiGQf/QVWHmv7o
	LgLmcMQ6R3knvmGb13jNkA37r0ZEeWaan8DNF+zQ+gJ4rNPLDpE9I+aQxGawgK3V
	f1cd10G1EFFqtepllVHGXB69EQp/bSDCJFG2RyameJ2Zu1vk7wB5uu6Jz6at8vnd
	gE2PATx+RF7oV8PILaO2iDD4TIzdRfbd12OtzGs3JnyexMuOHQsWS2XBqwaiewgN
	FOUCLyf7a+LvaNV60LXsRxt5HW2Ps7uDijnszZqwMYHy6C6XPJhUuX+Hpyjcwg0n
	HrSC2BDo/QU3fNneX+LutL6URlmZoHVKSbiQRUxXZIbiPYypkm+7pUjV2YCDt9ls
	SU1rMw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guahrkd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:42:59 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-384c78aa0dbso1182357eec.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 05:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182178; x=1795786978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hL3HLP0Pt+BHfyVSk1KqizSGo5qiQYi0LzCy+jMNuKg=;
        b=MBWNt3C5k0OiR2r3PKZVIe+YHPUqrS9d9TO4AiQ+Dsd3khiz6hXxnLjukSy8w5Xo/o
         17a4Pj+HOmxO4GT7TDFlqEd7vmlg/+kY5fH0VF9eDvD7gkQSLjotKWNOmmeFDQn2bFKn
         o1j3dwbDqNUjLM9tT+vDLxn9+9dNiVGWGmhLrramK/7i4mTVO+QI3ApA0FPxN7YMxCGB
         AHN1M51GzUw3Oz2ZQf+UXuUeY9fRK37lJUSeKi9eMkK7jLYHDHW4WLcVzhWW6utOtVBw
         Hq+g0yjg0LqztnEHspYmDMO8vVuZmoW/5T8NVlPTVmTo299n220ramN+D6mUrJ56Tpl5
         lpZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182178; x=1795786978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hL3HLP0Pt+BHfyVSk1KqizSGo5qiQYi0LzCy+jMNuKg=;
        b=WhaGalKCECnfos1NhTdDwrLw6zhTpLfp6dR1q9P8ekms4fdra9VAUVcR16ub8Y0MCz
         BCPGcmG21QGW0woQv92Q0cKtdpbuTEt/q9wBgGuKibKnmZbP8nmIDI6bwUWHbXUSCgDA
         XWzkMmv9fAuLriWJrJQ6LC+J7S9K0QB66BwDp+Cc8QCaLngk5uhkMsR48piETtsbIW2e
         HMoWVPsOG2iR70HCcSbtsKse0d/TIdRCGotNjBEKiEJ196ve+4RDDVnOahliw66I/7t1
         jQMHQQkJVMpP0Ce7v7Of/J65zfCWsY6MMI8ghA62J84AfYWOgvow6XD5zJOjJyP5YlG5
         G3hA==
X-Forwarded-Encrypted: i=1; AL+hErFKdebz0lWCKhsJQAfOvHxrvxrUgOlbyglALwirqBKbAqyk2EnBLDjrRItAoy2A4yx+1MD+DF2lyq1M@vger.kernel.org
X-Gm-Message-State: APuU4Z+FHSv1CZFMe11vLrFcQh7NGMt3IIVNLW6CSNscb6d2TSGGrOqv
	58LHsLx1QcHcvXtQdVxvPm0/Qc4TCqwkBT7e6RbbP+M7bRme6blxm2ht3mP9p1DrdJjFWra9Knw
	YHUwhJ26BtO7cf9zttu0fPZGSQHocAT3OU/zu8oFKeAVCcKLjUDPo97lM6JwwpWf3
X-Gm-Gg: AZFdTZfB7/aN5PDVoEoGzBlSY6badcDKxgcb0UgL50y8dEvfayxP+N22Gm4NrLwdOJ/
	r9QILQTOG92bjWkp98p26JOq50oq/d092P8NNARsMNADXSSJgXPdFaJyVMPxxBjglh+gYz5G3BJ
	xEtzLDl7vPaMfFBvf1DZmhdeabdpxGHKzbQ8pNFL9cHmD4npDaikFOH95F3DNCWyjTWOQ1AeZy9
	zvWT/XRY3l7Cket2DpqF7iuY80+epfEJmi0DZshv6LCfg5r3iBXC5xoOre2u33urHwiqJmhhC/v
	VL5BGNgTVtS330ym5xyAPyia0D4zPg/18NQpw0gBsxVPBGEzkvT7rhfMnPBkYgUtojeenJ2hgpg
	n327z+vNUzLst8sTCp7HC8UW3qiIxx6C9CUYMy39dVDAcampd6dGwatdn7wj8O3ekV8oCXfSWaZ
	QIqHc=
X-Received: by 2002:a05:7300:2202:b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-3857170afa1mr4024465eec.38.1795182178172;
        Fri, 20 Nov 2026 05:42:58 -0800 (PST)
X-Received: by 2002:a05:7300:2202:b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-3857170afa1mr4024409eec.38.1795182177476;
        Fri, 20 Nov 2026 05:42:57 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:42:57 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:37 +0530
Subject: [PATCH RESEND v4 06/20] arm64: dts: qcom: talos: Add GEM_NOC
 interconnect for adreno SMMU
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
Message-Id: <20261120-smmu_interconnect_addition-v4-6-be30526391d9@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=992;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=7PKy0XlSNrGfUIky+MIq+A+DSi/A91nh6BKC8dJ00Ww=;
 b=Wadu/4wuZPZ1RMqU647U3aYS4S7L9vnM9xaouvrfnAAIXIZwIt/SZos6s1LhBZwMDeZqVucST
 7xgxfkv7LgTCl7Wr2EN1tW/hAh1HfiYl14p8mUp5extAyIym+swkb5c
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX/c84wAnDcCh0
 TpXf0xKUDIA4/iscXyO3WvK6IoRlUy5iUzQnUf0i/wpuJmWnowCKtgQFam6yOhMT34nkRpMpqE2
 XdIpmKVXkGiZJODgiKP1vv9Ct558AqMGkPgdMjQDvM9NqHl2d2EZT0RngX/PN3jfM37nw4DJb1e
 oKOl4XJb6281D0jXIpSJ9/TMBFJBJ+f2JPWqn6EjBc6rFcz6/QLEdedBymyy9QzF0GzYAnvgeKF
 OymKQ7icDcrIW/fimc5+mnVwdYyf621pOOOmQMDNVQuULlzL2Vwr8QxpFRtIT9cLv0QFhRRUAna
 IxhP7wOQM9akMJp/v82aOCZS54m/M/egtLgDqrBq3154dOH5M0NZ+dlmozGU+Db++6lIGmuoeas
 yOmZyz0L8VPJu/jCgcLJWTRIyc/mqGHdlQW/Oh15YQQOiqJ/SBcBCs5t2PCNi2yuzLn7ksa7FBN
 RlndPGbs0nCaX6PrALA==
X-Proofpoint-ORIG-GUID: CZCLmi4HAJHiTWIaeugClrov6gklz0Lh
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b004e63 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=rfUXoPsZI_F71NZxNB8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: CZCLmi4HAJHiTWIaeugClrov6gklz0Lh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX9I3sNVkAv/3t
 eRV3vlXmJ4O+eLpGRCnnA0fjLz57wsZhIXF/I2XAukHiRTnOYAPnRa+r1ehKq4w4D7tJ716O9WR
 X4U156+XewVz4+meTU7nWHSsUM43LPM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200054

On Talos platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 1d74e459f892..f022a44ae5c8 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -2102,6 +2102,8 @@ adreno_smmu: iommu@50a0000 {
 				      "iface";
 			power-domains = <&gpucc CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		stm@6002000 {

-- 
2.34.1

