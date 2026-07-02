Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6AA480948
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 09:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985272; cv=none; b=McnuZ/7bhIDOrfiDgAi1aqBqPHUkGS4cZS1grS/LAzmwt2RKhubN5cpMej1+6EdNoc91KUUpyPG7buzwEuWUYQ9f1iVs8KhwWLXIdx8w+Ff/1tPAxY4NIsWIiW53qm4uCP6x2C4gu6jbKNP3rzhwZx6unwtV//B3NqLMzCx22fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985272; c=relaxed/simple;
	bh=x7+Fsm5Jk2Yz0bMc4s75zpL4JuFOmFGRBBISbD+XDQ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=siEDq9F/JpGwcPEFMh4KeQZcWNJoAr7g/FiHOtE66FfZ/a0G4z9wJnL1+prgKoogOkhuAhQLmI5Phi3cSCHUjRHP0vEethSeI+F1G+7ifN53faW4h5HizW2uq9lYz7kOVZ1IdFgaEhH9zCjom8ycwzWTkiNp8UeUvadEgew05dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K1F9/nKw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RATJxZU0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K1F9/nKw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RATJxZU0"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628sJPX4172117
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 09:41:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YB44qVUGLtg
	M3HmQQf/FZNIA7iQnBZopEsXlNXuQCUA=; b=K1F9/nKwWP/zmKDureaxoU3xhq4
	j3XplbNjcgJ8X5CxVO+qPNAXxkVqbDOiHUE+l6wUS4UV3z4znEw+BOmA5vh+4x92
	r6+Ao+DETqKutNabrOQHHo2MoTWz28fnL1GBVwW4GzyGeKaVW/Vw7soU6fxFGcpe
	gmo5YTz6xPuxLO5L1JXCeyfIRcmSNeC+033gKFVOIWOVpU9Fykgd6bvK1UtSf1B/
	A8Okj6mJ1Wm35rIH7qjn6SaLuFaOWLu2/gP8xareMNEO980mv96KEqdGrmWffOqZ
	jrllmHhQE+TfMcM8FmTPElP+bKmBSGiIInG7TbQRg9NNX3Jvt8eVoMMpE8Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5mvwr69f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 09:41:10 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c890bac374eso2218948a12.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 02:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782985270; x=1783590070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YB44qVUGLtgM3HmQQf/FZNIA7iQnBZopEsXlNXuQCUA=;
        b=RATJxZU0sGV/8b6hvLYzpSdb2I5HKj0ruwLpzyL7IMfOTliMqgcQN5CQUwmY2r3yxc
         kjsMlwbGxMoqjblyOCh+nfg4k04Pwyorhq6uY7WjzuDMRyXqLsbvhivj5FKHw5iKTYRf
         6+RU8L4BNujfx+wb5XRRSe6p2poG/mr/6nCzXsJPDeHajHMDvL9qte+CLi5Bh89TeJUw
         kRhNm2CUqryqsSqF4/fIz+ZlIQqHz7Kn1phhs31MRw/ERKlDYWQqDuOnxhwubOm2K9z5
         o8DRqc2i2rEZJOePmYHncOjNBWtNq7EJQvQZ/W5xqiT8sM282KvRqtuu8B5EJnAtKCga
         8BQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985270; x=1783590070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YB44qVUGLtgM3HmQQf/FZNIA7iQnBZopEsXlNXuQCUA=;
        b=AScCVl9W8wQ1W3h4KVi/zRkHYbl2qGznCysjR6H3rqf+llJeID5fMSHN/oRXc8lY1f
         dmAajYvYR6sSXX94wsC8SQ2knw010IFetQM04QvJ2dDMh5GceUzELKg3tneu5x4KV29W
         jpaYT0B/gsCotmY51/PyIT2Si8X83DsmbQEv6du4OgSh9Yc+UPfpiIHEO4WK8sfI+qsC
         n9H3oUd9BmeCwzHEMtYzNxaG7qos0Er5ghCgSTOEGqjHhMbBCuPmOm1nc8tte3EO+nHd
         +qjVrvtSqqeBFuPlku2J9HcFBwDlDdPqABZNXtIdQVlUCC9Up2sparrfQE9g/sr5hPzm
         pg3A==
X-Forwarded-Encrypted: i=1; AHgh+RpiXHS54qS7cKziw6nxOAebdobjWbwbJRutVVyiFHfXFuSdhThvlsJMggKbQ7syzQ3hgawfQcgCYePV@vger.kernel.org
X-Gm-Message-State: AOJu0YwQin8qTI0kVj93vWUvxuDw8KeRL+D2scLfPUfd75cQkZ0wstgE
	4yyYR/WL+QbMpMlPsfvp3l7N75FLWrsZVl8btcxO+DS5ZEwsTC/yrWX4Y8zWIJAUE7OwdGNNoj4
	hEkIqTjbJAX2c4EP28ufkuqPiSKFT2zUvF9sVcDKXuuEZddzXa3LACFZ9NQNwA16V
X-Gm-Gg: AfdE7cku8k5e3ipPy/ws0boqxJ7RKfjBonEVcRERSCCGHqoareV+s17X/Iyp6kM2tyK
	4jy97JakgHNPVtsDAujRDWYuwu5EED9EYNDfzQEvdpk3joAyj5zoyvMCnlVOFSDdg92PjzZWojG
	WTXgJyjfNk+EfVQ3x3HNu08ApBcgBijoNHsyLA7G5fDAFObMB2Y0S9yWmnnxs2SL9lAS0RbksC3
	RqdQLDmviIFQPTiCdoiEMbHwg50p00v+9hiOtpEKVbRHvEH9FS3y+jMUrGuO5sThCpYrcvmULdj
	H+oTqN9TLWUwTaO82WNuRT3CKzXVlhvJOpDgfJQT3SOVXvojdRGkhonf0dTXoPvulrZbNIx4yhQ
	oK+LZkMmnskkU+wjrrfTMih4CxlPC+fy0oclNQg==
X-Received: by 2002:a05:6a00:13a6:b0:847:8b1d:230d with SMTP id d2e1a72fcca58-847c0753fc0mr5388144b3a.3.1782985269924;
        Thu, 02 Jul 2026 02:41:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:13a6:b0:847:8b1d:230d with SMTP id d2e1a72fcca58-847c0753fc0mr5388103b3a.3.1782985269420;
        Thu, 02 Jul 2026 02:41:09 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb75d850sm1141595b3a.19.2026.07.02.02.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:41:09 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
X-Google-Original-From: Monish Chunara <mchunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: [PATCH V2 1/4] arm64: dts: qcom: glymur-crd: Update VREG l2b_e0 and l9b_e0 voltage for SD-card
Date: Thu,  2 Jul 2026 15:10:53 +0530
Message-Id: <20260702094056.3755467-2-mchunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260702094056.3755467-1-mchunara@oss.qualcomm.com>
References: <20260702094056.3755467-1-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: K5WsePQD_TPqTKD919mpychtnPppsvi1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX4FImKwvmqYn5
 pKEXIHsNfM0EeGyflIG6YI55+EcfRbDM/isemBoWr1H4qlkH5Hmiw8pDlqegokgdL9OGyDmvJ1m
 VY4nTr2N1YxhDX6JzjZQvEAMn3HFR0HP57mDOZFem7Q35xrLQQ6b30i2nLQu8LkemiPpZVEluW5
 CUhGtHtJhQpx6CIhHdyzxhnrbWqFmZr9ujbOU6qlC8tCRdeDe7GPRwEiM7+qmcJfjXVw7tZy5MQ
 1xefC56CfVIomBafEaNSng7FGmh4ygAYBffEEzK/KWzXa7vixMXoYAznW1HRB4Ado5nmfBuOQvS
 f8SaHjoeJzbOvtZVvb5Uekjt5GZD4ie32up+7plaTntc+EYiULzP71ydJbGisHOGfhLWt3uuvgR
 2H5Mi4lHKqZPvswtxEXkkN68WcKoSZviG0LT7lb3xyvZazxU6dxKLDqpMr/hHcN+CkNG4b8OT8n
 lDsxO+vhZFUzQRp405g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX2YNsxUu0lD5P
 vD4YMeHufSPRddUg2Cdjag3gsVnb1kkL2BeRRCcsBXN+FCB/4XyPe66HLsndxtJaw0XyikAYf6G
 37kFbPknMKvaUD+iv+E7yzb0ZqL4jSo=
X-Authority-Analysis: v=2.4 cv=N+UZ0W9B c=1 sm=1 tr=0 ts=6a463236 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=RbnQZSTpM6gPS1NYG1gA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: K5WsePQD_TPqTKD919mpychtnPppsvi1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020098

From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

SD cards may need 1.8v VDDIO also to be supported, to accommodate this
requirement reduce the min voltage to 1.8v for `vreg_l2b_e0` which
supplies to VDDIO pin of SD card.

NOTE - Since this SD card is the only client on this regulator, this
change should not have any side effect on any other clients.
moreover, SD card driver takes care to explicitly vote for the
regulator voltage based on the SD card detection sequence.

Also for stable operation of the SD card increase VDD voltage
supplied by `vreg_l9b_e0` to 2.96v.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index e784b538f42e..af6f42cdd39a 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -228,7 +228,7 @@ vreg_l1b_e0_1p8: ldo1 {
 
 		vreg_l2b_e0_2p9: ldo2 {
 			regulator-name = "vreg_l2b_e0_2p9";
-			regulator-min-microvolt = <2904000>;
+			regulator-min-microvolt = <1804000>;
 			regulator-max-microvolt = <2904000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
@@ -247,10 +247,10 @@ vreg_l8b_e0_1p50: ldo8 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l9b_e0_2p7: ldo9 {
-			regulator-name = "vreg_l9b_e0_2p7";
-			regulator-min-microvolt = <2704000>;
-			regulator-max-microvolt = <2704000>;
+		vreg_l9b_e0_2p9: ldo9 {
+			regulator-name = "vreg_l9b_e0_2p9";
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <2960000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-- 
2.34.1

