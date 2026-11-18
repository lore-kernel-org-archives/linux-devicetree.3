Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016276;
	b=Y+C7QFWZRhYZG6C02KXvc+i23HJhaKa6DAsa834zPoEWKr1b0EEK+S8IC5wiYqL86ewz
	 y+1wJttlN+lbJ+81agmVA/mB6G7Iaos34uTtXLa5gvTKQ70LAlkZxSJT1m01slZ4sw66e
	 yN2MB3pyMLY5cHDdCrzUgjzEjRVaW2IUPSJyvu3D7OKNwvbuYSNuRsPwSkLSZPapfk6fh
	 EgYn7VF9HMkILwS2fBzdlG2CtUDwfYNqVmB0Tw9q1bsYUjR/xtKr+rrhYcd63QyiYCBAq
	 JkrkE5N7IMFKd9AH6PyU3Y0SdWnE/a2TTCS9w3sfKgw9WHI0rysMfneNXVL/iQOdwew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016276;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BaMEnEGWN9tyrQN7WvHqNpg/qVu1ssxg9ENoEbzB81g=;
	b=PJ03K/Q5slLqypAOJ9KM/EUW9UHdZ0xzPshhFdJswMwJcY7FFZ87XQpvTLbRK1GTdrgs
	 15Yedo93shNCoaho43eFL9Z8KXexARnF2pxLJIEEYrsAxYiY4Hs1DVWBhcCqvbhRpd3Qv
	 ltcn7RtDW+iaTYXOO7vYfdP+IK7QOO6bWfyfWkStHw2wkkyfVExxOlW01hwp6+t+ATGJF
	 p4nkWI+1JBzdETXJ/AqrIvglJaVYp0bYIRJ14FLV5q7eA5+KKrlKqwb0rYox3FmJTv8ux
	 s6MCMOQHqlHjQDUL7e4U5Nt+l9gvYUQ41ryQdyv3IVheH11c8eVnYDOK0YFh6ImeNsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nsgyjhGt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CB2anaPO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8FE60A261E
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 15:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C8FE60A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nsgyjhGt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CB2anaPO
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIDQLeV2226371
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 15:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BaMEnEGWN9tyrQN7WvHqNpg/qVu1ssxg9ENoEbzB81g=; b=nsgyjhGtawXQfqSQ
	uRW3wApuuD+4jPLNC5PmxvPAbkA1HEcQT362Aul+2pAnK+gtANEH+p34LuxvxHL+
	6y2zOGEO2dd8M3itwIUm2mKhyyEBiYz5OkVMpHoY2HseWxNzIckEfgxoO62LOb2V
	Fdra3Ifjwn0J7f2F8F7a6Jbqi8OLb2nDg0D2b7KzWOTlQiesNRRuyJCfOpzz9vH8
	3HPhLIdHGrYuK+YJJ8g8ffCYJOW6TXQc2ZKRuUwxr4llENlzqhK/mY4ZLeHcrCUI
	YAxOho+GDxXwFAoTw63dh5tfctfk/2ui5AUZEc7o79nlVzd9fp8Z693mBcJqSS9F
	onnreQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvbbr1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 15:37:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9211f05706bso6067036d6.2
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795016274; x=1795621074; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BaMEnEGWN9tyrQN7WvHqNpg/qVu1ssxg9ENoEbzB81g=;
        b=CB2anaPOl7mK/Uxx/NyAKF2ubX79GrVEM25AGkSto2ugNCvviLRU7cWEcrFa2AvyWq
         ylRxo2wAzqGQ1QKm3RxK/gcbsqtkRYHQ/PU77lVDh0mm63+fzxOefwPa8aruw9u/sAL9
         VCByh/SRZ1EXizO3ftQr9kBj5c4XZhenx9NyfSu35ajjx85Drya07Tnlzfue1xI2bYVh
         OEJt/hnktuL7ntvDsl9jTFwA0KWgulKGVzbZmWbio7Bdwk76mMH6o25nlxX3xy2zoPVv
         kPGZOPvVyihRkWmUEdcBHT3mkCrLraBS8yxc8TGVqUlVAf/jf2eUFYCBa/lLUfEogfez
         3ywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795016274; x=1795621074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BaMEnEGWN9tyrQN7WvHqNpg/qVu1ssxg9ENoEbzB81g=;
        b=VFkAiUxgGDsiu0LYtey6QXtsFDLM4Zbq5cjKl4PR1TQ0XX+rqjH8OdiLm/Roscd3Sw
         rFWiOZ55towFUIbUHn/JbTrIsVTp59+HqBWFzUvcXEMxymVBRlvs+3T0EIcYL3T4ZOVc
         EtLYKQ05hqhfacd1T3X9iXmYEpcBBNNeyGJwoGVoWVlzgR4E4qf16KdOLCeuQoY4or4O
         kvz3c0z3miUSJRElwjCSX2M+bfCV1P2xHkarmXYA8pYf1Tx041lXjkUV6DmZDXsnUE8T
         p45JgBRmzt7XREJs7+4xzLrQmstHAyu4TZIdJO1D3L+NA0eaUep6SYwv2a9LprwNcPWT
         EzKQ==
X-Forwarded-Encrypted: i=1; AL+hErHNwRgmByRhJAE/O8bnsfA0roNUdB0XSRy84svnI23cV+cF12XylrFcP7FkKhfHzHy3bXIYelWiwxkj@vger.kernel.org
X-Gm-Message-State: APuU4Z8SFmefqhD2qy3kSZBgF6BfKw1E1ANeGQJ0B6xX3G5sj8woE/L3
	OQoqnLCKFYCH0xDSaiZpk1wijvyGBnNeB5au8jWSRZ82OphEmBqzGlF/Ez1LmpRwcHYRsmnxpbU
	fvui1WKtJso68Wu7l9rUNLQEY5MggEni6oEne4qsL0GyL+rgk5cOoA6qqVNv7omu7
X-Gm-Gg: AZFdTZeM04bZiPiSDEE19OjrrK1OdmweekZGvITVGazdNmghl5QhDPZ8xkyAwvyS/cj
	bjk/LYAEdRs55al6s+UynN4V1q+ZPS+UT8QhvEkg+VtgcMSqLINJjtgGDIc+nX6cwMb61bJtDel
	QhByjsDpPLfFUGZEZ9pQ1fuAJwZfTGmEsNxe+vxn3yQs4eAL9ouVfXfV4Xz1bikeBz4h0DA+jte
	FXWKKXIcOG2IfvsQ91XCAoyz8kFG/zqplO8sx7hbwxQMaPrjxxbN9J2vwpti7ZE4scjUAUmo/8o
	TnrgBLWKlj0TKsakobMalFf9LjLGQcGgBVj9AzTxpiGTaH4ZJ64Pbud8eu36XHcDRJ8pU6cobHN
	MytTkEvFUx96zR5Vd1OlmM4rQFbrrz6l84A9gmx+YYgxQy+RZQ60gKWct7DY8HDEXUYED81K8Zh
	g2UoP409scXF1ITYj5yLTERCRqofgCktUvtF/IQkLXQ7LADxMwuJX5K3wDAKFO
X-Received: by 2002:a05:6214:478f:b0:921:1cc7:809 with SMTP id 6a1803df08f44-9211cc71d61mr19714896d6.33.1795016274415;
        Wed, 18 Nov 2026 07:37:54 -0800 (PST)
X-Received: by 2002:a05:6214:478f:b0:921:1cc7:809 with SMTP id 6a1803df08f44-9211cc71d61mr19714526d6.33.1795016273763;
        Wed, 18 Nov 2026 07:37:53 -0800 (PST)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d0d879sm24569676d6.12.2026.11.18.07.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:37:53 -0800 (PST)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 21:06:45 +0530
Subject: [PATCH v3 4/4] remoteproc: qcom: pas: Add Glymur OOBMSS PAS
 parameters
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
Message-Id: <20261118-oob-support-glymur-v3-4-2cbdfe208d56@oss.qualcomm.com>
References: <20261118-oob-support-glymur-v3-0-2cbdfe208d56@oss.qualcomm.com>
In-Reply-To: <20261118-oob-support-glymur-v3-0-2cbdfe208d56@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jain P <anvesh.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795016249; l=2115;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=h1HpQR5ft0SmfNIj7EEF/Ykdj6Ugo2udF2gXOOZSwLE=;
 b=4LJ4JoCJ5vF0dlcaZOh6pc1mBEyyFDEK3gN1kjiaE9mFiz2etIWuN4fPCr3ld2PwU1GUj7X+j
 Q3BLr42J80CCUnuDE0UQZ4rdnIO4g0RZFFdRUxx+lNDdrgKDFmD1+CA
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-GUID: MlkH3oRZ4wldSMXSp5eCEnzXHXfzsBCq
X-Proofpoint-ORIG-GUID: MlkH3oRZ4wldSMXSp5eCEnzXHXfzsBCq
X-Authority-Analysis: v=2.4 cv=YfgodARf c=1 sm=1 tr=0 ts=6afdc653 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=PB0afdDVj_GKkQGSUhQA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2MiBTYWx0ZWRfX7outr7EYfAPT
 rB1SpS6or+P6azmPH4hDgOV+IA2gUa9JAfRFiOPGXIJ6toTZmmEzRu2fgcHEZStrwORsHM1rqEZ
 W6JaQEZgY5snAFSAJn0f7j3Cl+pOwKI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2MiBTYWx0ZWRfX7+QN9pxdFsdd
 zXeEfs7qLzMsrReRBPPOL1LDZneopvUvhmBdhfS0jfdPvClln9h5yRrFYF+oc45ou5NvikBP8K4
 Nuw34gd4MX8PYc6P6ifpcD0+Wbofr7sHBv6pIifRkRus4n/wLejuRyYfgTcIkBRsIAO18ZGyuee
 ttMlxrbZKwPj1Dp7KGJ2VUhlQ3DMLJfZZsn9X4VHC9p1l6QQTApj3H0zg7XCkMRNpF60F8HZiTm
 qDWpy5KXFiiSNkmkkwKRPui7Htu8jHIpkAK0EIJWUOm9O/aR2fdvDQFu9T6us64DQnRXf7TmGew
 FdiXStn5wqdZ4kPidCvWq94CE38NyroaHHxo8w3Esb0f2q/+VaohvYTCyEr9X1iX5/ZQbFBfNfW
 ozH/6QLumsRU3S5lhzIjY1UqNrTBeEQg+4e/o91iWFRBxiiez0XGCYQUONJ/qVlKNQunYPUCp7P
 ICH1sDqRGgc+K0GyVqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180062

The OOBMSS consists of separate OOB-TEE and OOB-NS Zephyr subsystems,
each with its own firmware, DTB, and dedicated PAS ID. Add support for
the OOBMSS PAS loader on Glymur platforms.

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index a167bd6072c9..5cc529e2923c 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -2182,6 +2182,30 @@ static const struct qcom_pas_data kaanapali_soccp_resource = {
 	.early_boot = true,
 };
 
+static const struct qcom_pas_data glymur_oobmss_resource = {
+	.crash_reason_smem = 669,
+	.firmware_name = "oobmss_tee.mbn",
+	.dtb_firmware_name = "oobmss_qc_dtb.mbn",
+	.secondary_firmware_name = "oobmss_ns.mbn",
+	.secondary_dtb_firmware_name = "oobmss_oem_dtb.mbn",
+	.pas_id = 0x42,
+	.dtb_pas_id = 0x43,
+	.secondary_pas_id = 0x44,
+	.secondary_dtb_pas_id = 0x45,
+	.proxy_pd_names = (char *[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.ssr_name = "oobmss",
+	.sysmon_name = "oobmss",
+	.ssctl_id = 0x21,
+	.auto_boot = true,
+	.early_boot = true,
+	.needs_tzmem = true,
+	.decrypt_shutdown = true,
+};
+
 static const struct qcom_pas_data glymur_soccp_resource = {
 	.crash_reason_smem = 656,
 	.firmware_name = "soccp.mbn",
@@ -2255,6 +2279,7 @@ static const struct qcom_pas_data eliza_cdsp_resource = {
 static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
 	{ .compatible = "qcom,eliza-cdsp-pas", .data = &eliza_cdsp_resource },
+	{ .compatible = "qcom,glymur-oobmss-pas", .data = &glymur_oobmss_resource },
 	{ .compatible = "qcom,glymur-soccp-pas", .data = &glymur_soccp_resource },
 	{ .compatible = "qcom,hawi-cdsp-pas", .data = &hawi_cdsp_resource },
 	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },

-- 
2.34.1

