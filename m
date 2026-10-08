Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05DF3BE646
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 06:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442047; cv=none; b=G2ZKAbYUrJQJuHPDhUoK1HWR0pC9BnR4neszsuADGMPoYA+U1vLqupKAj4hDy+JxQHK60Y226K3Qrp5odDSbEIgbgyUs2LAEWs/6eFv38F2TpYvdDM3SN7bdUx/Col7Ey3uR/FRi7R359393seMXMVhjpBsU2Udq6onugeJsbaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442047; c=relaxed/simple;
	bh=j/XQEZw3nTBBHy2V5OGs1jS7fvptWPEoH7KwUYRkTCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fKkI7ujoN2GfqxZEwk7V9+c0B97ieADemQjEt+wdtnZVhb7HdDwwTnxBhofqgFJoRMC5pYBtazIjLQcDp5yOVggzOsuT5cZhUL1F+Cho/j4+YYuiMjG83AR5xJaI16/S4DY0oHvpirx92U7yxNmbRHqU3mpPzyxDiItCkzPbGs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J3gOwE0U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ROwn9Xut; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J3gOwE0U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ROwn9Xut"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BZGv2774982
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 06:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zQTa5Kkb8XeLSocE2zOp6wk6MhNg7GTY2or4PgZPt2Y=; b=J3gOwE0UxVt5ASCJ
	avXMitw3WNXtFM4PLC3UgIHCLMy4gVBVfgn0X/tin784mXgNi+QH24Xhfj8OJzEo
	YDEIyOJo/qU+mocS6gbCUT3oNo2o3ueIduFJEUhFG1Q7cN8/aJB+hNYYZka/+a8P
	Y774p77QyQvQGQeDVzpSBh3qN/kcTXfL9Z7XKdSedlIADYftOlScDeqzjGrXGQKC
	9NVB3u/Fn8VvoQhukIPISNKgTNazPMv9V8Soi9dfSWShGL85KvhnbRyirAWHIIp+
	WF781xLXhQl89nIm92/Rj4Cero5M6Dw92eZz6cFUgLZDDIupYyPUXtlf74SvtM2i
	1I0KmQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe69hsg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 06:47:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so7435538a91.0
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 23:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791442044; x=1792046844; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zQTa5Kkb8XeLSocE2zOp6wk6MhNg7GTY2or4PgZPt2Y=;
        b=ROwn9XutDgvWByQa4a0qawL0+0mgUIA5pB0RPieXspQTVRrge6W7n2GPHVBvDyrexa
         9VUV51lrUVacV/rja6eIZUk3rdIo7b9TmRWK0IUMs50NSuhyMM9KKF3E0frBmjpsuO9g
         rLfnaYefYxPgz7P74FZ9/MDcEJVfmIFosBAAcMOfmWsTe7B2WegyGyigLPTYX8eDieVy
         30fTlrKT+gw5VC419bhCnDICkTv1gyKvHn3CsDpKNWCjB68miz0IV+AdzSxy1thhrhIE
         g/EEEqNNQRhe7X26BhKlIJHN3KcejPbQv/QrKrfD3+4JQEiRdB61NtioJ6lLxmoOPdpY
         K/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791442044; x=1792046844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zQTa5Kkb8XeLSocE2zOp6wk6MhNg7GTY2or4PgZPt2Y=;
        b=MgeFqXCRrzmMFJ+/8feXhI4RDaNC22bOgu2F30NywTexZ+NwdYJBWd1pG9eHpBVm41
         02ZpAPWmvSCMRFuRa/+2wNKiyLSzaMAQJ+XxMk4jvu+KciPuzqHKZuBajQdoIw6GhJYM
         zZdwmNMjhEve7Pj4oE+/97LZrtgweHpiPYV3+DyqIx3Qi1pq3nBiWaU4G3EHAvV5ymuW
         cZ/6ZOIqqzwfw45OEjEgb3+h8/84XaVbnZ0EYJLlscOn+gPe5DtL1GRE387mKUEla7/+
         EEWWbuERy/2pXYQELEM5byK2p1cxMTyjLIiC/wFv27o8MHj3tyeSUCq9fOXR9npiwRiv
         nxPA==
X-Forwarded-Encrypted: i=1; AKwUvBwBDJIOc1XUdFGG+YTXJDH3aLrrGRqsJsW4bY6c1I1w/BpcWzynJqqEIvasNru2E3T6l/YGXo67quTr@vger.kernel.org
X-Gm-Message-State: AFq9FYJkTCVOjqMMU+C7g2cpSLSD+I7XSCijRQNOSuTIRinBjByaFNBH
	6e+stf32joXIYHkdZoYT9ogHA3JuuO4MiP+YGubKHe2SfRIAZhu6hWg4h3MFnmJwv6oyz1aywmV
	vJP78RikJ6MpB64Q1fIr5zvur3oHqzT8/p8XlrLxYu5RznLIblhZ8XlECX7LyeIB0
X-Gm-Gg: AYBFou31T5K9FCrZJxQZWQVUFNp9UoFj02U+MmuZELPiC4nXHLznxbOVymSGzXpB/fv
	qVrGm+i0WjrzaL3XGIeCevrEaonaDI2J/HdbwhApokGl555cNeKhtkqc2nojdtWnqR9Gsc8jxXq
	mc03jqzs/3epZkKVKC3aN8DUEvhMTKS3VC9AR8makraqTie1jKNWb7Mn50W92nV15MbifWt5bfB
	j5oirt98ETvgvqYTJByfqEnAsAlW7pVFBPhwvaEAxxxroE0O4z7yS3FYU1ujuXOK4AXblxcatrs
	F3FBGrRvHEbQ3DiOeNlK2F12YCaXrbmxrhhKkufABLaSkGnzp6+CAUgiC8JKI9Mo7+WvbqO2fcc
	5evT/yMvfCE2fXKf63zDb9Tu8iKTOVpYSV6DWQwcLiCtPmAVdMSwBr+Q=
X-Received: by 2002:a17:90b:4a8f:b0:39e:6a82:afda with SMTP id 98e67ed59e1d1-3a8a1b3206emr4010049a91.44.1791442044464;
        Wed, 07 Oct 2026 23:47:24 -0700 (PDT)
X-Received: by 2002:a17:90b:4a8f:b0:39e:6a82:afda with SMTP id 98e67ed59e1d1-3a8a1b3206emr4010023a91.44.1791442043924;
        Wed, 07 Oct 2026 23:47:23 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a254b3sm3313925a91.2.2026.10.07.23.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:47:23 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:41:10 +0800
Subject: [PATCH v3 1/8] arm_mpam: Fix the RIS index range check in
 mpam_ris_create_locked
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpam-resctrl-dt-knp-support-v3-1-35196c2b43bf@oss.qualcomm.com>
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
In-Reply-To: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791442020; l=1130;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=j/XQEZw3nTBBHy2V5OGs1jS7fvptWPEoH7KwUYRkTCA=;
 b=X7a/wNFXtXcHebbMyKYDrN8Yycqni6KgyknrSkGsyJg9T0nph6PauXToSrX6n1ceCcY99Tnog
 YgErdd+Gx+vDaDYSZ7/BJDwI+zlMJv4B/SL2IWm+SqL0ZqPRgAJk8S6
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-ORIG-GUID: rEOy4Bv2kQWIqQjLe2IsPFFRrWidRV47
X-Authority-Analysis: v=2.4 cv=HcWB3SE8 c=1 sm=1 tr=0 ts=6ac73c7d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=cxiLKowE09Ysm4E8lmYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: rEOy4Bv2kQWIqQjLe2IsPFFRrWidRV47
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfX+O9lKYhp4To4
 BixxNSWWYc8kK79eNDNqmygllNNDTuhFncpCWRqd4yeIgaOl18Q5zfQIPKrHvwfVYqf8ToFSbx+
 dyyJ32j8gEyhBSaE5ZIc8WUfWBslB2UGCZesaxJ6H8DTdbQWET4hHGKq+iC8nugWNT54KpnXRBV
 Jb4vGxQvmbvCP8aSDdDo6C3Uu8CZPIZ1XSxG1mvQTHfYGB7HjjpPdfeLr9KmyhmQLYwF+PylbL9
 6Ge5b3LwKeiPD50HthBYF/sS9FFrpMdPoDeEtpn+z6eeCD6F4vnPcjcd4JfGnrpR/jFOsLMZZvM
 kus9cEm9z5tyGBjsOvxhUuZ4onhxDD3cFZ7HvNUtFeeP6FGBdcQba8of1PadnwJlzt8+qzYRtSL
 fLc2A7Xn7ES4tethvDXOIsf42XQnAxXntRyygycfo004CQ3wlv83mQCJrxFOCCP1CSTmRyU9WJd
 iXCVBFqPg4I6lSWqZHA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfXzHwz/MCGiYsP
 Rpa6Xgao94UQbKncL4c3JGAq61BELXY3T+/HMhJy43Q7+WM7aOaZZoamfYjEjkyiQX+MZUN1jNR
 osyjqR1doEIpE6ti4rtS5w50I2XnsXE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080026

The RIS selector field is defined as MPAMCFG_PART_SEL_RIS (bits 27:24),
which is 4 bits wide and gives valid indices 0..15. MPAM_MSC_MAX_NUM_RIS
is defined as 16, so the check should use >= to reject index 16 and
above. The previous > check incorrectly accepted index 16 as valid.

Fixes: 01fb4b822472 ("arm_mpam: Add the class and component structures for firmware described ris")
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_devices.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index dd422c56fbb1..6da217abf689 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -552,7 +552,7 @@ static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
 
 	lockdep_assert_held(&mpam_list_lock);
 
-	if (ris_idx > MPAM_MSC_MAX_NUM_RIS)
+	if (ris_idx >= MPAM_MSC_MAX_NUM_RIS)
 		return -EINVAL;
 
 	if (test_and_set_bit(ris_idx, &msc->ris_idxs))

-- 
2.34.1

