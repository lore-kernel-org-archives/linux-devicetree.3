Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A663C3426
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 11:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775735095; cv=none; b=AOAsxvxqKwWroCaa9XKlqOJottIynrsAflDip+YbgxGBhSN3OIrNAHA898NAfQ4WJZHxFybzkjD43jf+NPSCmQ5yDHXeP3zfL0ghgkQDEWPpg0LHjI9s0wcOqnhWhuJLDPb7wWuWUO2zCxg5/o7CY3erBIlpBrg3j/9KQv6Xd7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775735095; c=relaxed/simple;
	bh=r7qPfewEvL1ex7EIGvFKR1XSzyLGar4cNMBb5ssyzo0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WvvBlWqjuqjnPUbb0mucczs3pdLHa3LlGz3nt1kfmu+uCR1zDX/f+21RL7CKIXYTPmBrEAbhZDDe+M/MZTqiyoXK2K4PtlQT0B6Hspr5bKeOfn75m5pJNI2hf6yq43Vdg2RBXnWZgZ5eGm7ybB23yy6sxNLF4PNrZ1mPtrjsNzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JecxgGzS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CV9X3jH0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JecxgGzS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CV9X3jH0"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639BWc0D4107832
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 11:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	athUgV40rXKWfTnPETsxk5Mmpfz3yAeWPwL1URQCmwI=; b=JecxgGzShz71/oyB
	zByrO/+QjKaF0eAQv8Og2TkDeAzkSasAdAidl4UL4X1w4UHuXxH/yInxhQ42aaDc
	Flts/elyqQDYltA77gP1XoaWOV+hULKL/T5iLDQKauChdjzdGxH0k3ttL8T2DZLz
	6jAjOH4mSDiEt6fxK+2Rs60h569M9HIPRupcCOM1sdHxUH2zuAeIcJOIxUXv8X+g
	LqVpRHFfqfCVmNRVLEsFZdRGIUmvmB4mLjENIQtbW+q1w4QZR13ipgJyaCda+vfj
	yecsp9SWMBLAYSb1AjhOyNAdUxFINdv2wxH1XWP91wqAF4V85n4dcpwOe3iHco4s
	Soh1Mw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddxhajnqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 11:44:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b23c909256so9595635ad.0
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 04:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775735092; x=1776339892; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=athUgV40rXKWfTnPETsxk5Mmpfz3yAeWPwL1URQCmwI=;
        b=CV9X3jH0lY+SEGPvyuLDvonUiCXkfWkqrWDKcOxAKx/pQttcvCBMinDINtMbuP1MhA
         in6wZLzxg1QyHqAXWRaBFj3hz9MKF3g4eYqb5/7/TBuPPEmIbLqubXssKopWLj3CCXjo
         0CLZsdopXHKH3SGwt67nwEBBqJ9/hAWcMJ/Hy7HQ1I3847AMMhmdfJArCyCc5plrJajc
         UiCEg7lQAQ3D9mBjVZ1SqWgvWa9m6hDpAG0DwPl64S0UHNySNe4w8LnnSADZ8aDJ+0rg
         DYJpht2B49NpgiAhNYmNaptjpZwFvHu30P3vNR/9/TpDb8Pbe1pzwwMvrkqL62NMKotf
         lzZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775735092; x=1776339892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=athUgV40rXKWfTnPETsxk5Mmpfz3yAeWPwL1URQCmwI=;
        b=nb32DymomlGcQn58swV6q1wcb2njbexsNvuZTVaJ0hZRzbJO4gEKAFiqGaujNL6R5S
         qFPbfvmBD8T0UY1hTO2NkZealH3EY4bct5fp3/0yzHiZFWMQ5TTKA+xAA0eIuz2fDuIq
         AYe5dqkB8iafuyS1CoCQiIihsk7FBQoNj1rzkGVPlDkVUCZaaVVdzMTaizooAVdfYleG
         7wt5a9fT/YXnMzxIWUiSv3lHq2V/qxs6b8JDP9492yV5XcK9jnoqLh2jaREPrg5hRxVe
         ktse+rf8ln1sqQB8HcHNLIPnpng+sa+PhjWiKtbJnMidyYV5gGUt1o5GrqNxyITfoetM
         L7Lw==
X-Forwarded-Encrypted: i=1; AJvYcCVRj/dWI5d7620MNf/T8+tMmGGL3KKXLC4Gp1ud8kZFsUuHsDbINGQ89uc/DFUTpuw4fmt7gzQshD8f@vger.kernel.org
X-Gm-Message-State: AOJu0YyR9dSpg/pZBWxncfMgjCX07a/TdFwQTsxv8exykq0H+LMCB6Eq
	+R49coJp0m6ywANzjwriIX8Gi9OQOLndso+0WgXUQx8a1DaytfnmkBq0vwPSCY/8X64iFS3f8R7
	0QxaJUZVVAZzSV1UZbOQCC6wJ0Dzzt06wteKqMXw5sZfFQkMjiVnLyTvm6Xb0R3A5AAPEM0X0
X-Gm-Gg: AeBDies9fowzLlbrFtXCODldC/yCZ3PQ74Zmpa2NSt8tiIWoOHdMQ0A9IYkgcvPo7Og
	ZQt9Z9aXZhADdjitJaqPj79BH4WoJrAdM7pxPKNOh2VyuIQWD6Poum4G1nhksJRnmCqX1A+XRKq
	bt0+dmPPlsXknjuCsMFm5qa+/6a2H3afzAToGKfE/S9ZG5sH2G/knna0nrpe5nHJ1uUe7aTey7S
	rquPHQ/EEmpRjhdIdsecWYAIX21g1WmyyeARhO7ojeuuR/CHUBTL7WOhkXdleMT8zz9HYL0KlbR
	3EYt19PjFegLCcNDmU84ANk3B+bQwNMUHgxPxQLdzim0AToR4bmE+ISl+1zSZkQW2HMEeJ6P+kC
	VM7RjkJ5ITqoDoh05wlghe2YVNp4hOPk4nNS8u9Z4n6bCm5idOiDxe7UlkGk=
X-Received: by 2002:a17:903:2f08:b0:2b0:67fa:dbf8 with SMTP id d9443c01a7336-2b2817e97b9mr257906355ad.41.1775735092177;
        Thu, 09 Apr 2026 04:44:52 -0700 (PDT)
X-Received: by 2002:a17:903:2f08:b0:2b0:67fa:dbf8 with SMTP id d9443c01a7336-2b2817e97b9mr257906035ad.41.1775735091639;
        Thu, 09 Apr 2026 04:44:51 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbd9fsm230957355ad.75.2026.04.09.04.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 04:44:51 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 17:14:09 +0530
Subject: [PATCH v8 2/5] ufs: host: Add ICE clock scaling during UFS clock
 changes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-enable-ice-clock-scaling-v8-2-ca1129798606@oss.qualcomm.com>
References: <20260409-enable-ice-clock-scaling-v8-0-ca1129798606@oss.qualcomm.com>
In-Reply-To: <20260409-enable-ice-clock-scaling-v8-0-ca1129798606@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: NuVwl7PZ4_iBXi2e1lw9R3vjnUZwlOIi
X-Proofpoint-GUID: NuVwl7PZ4_iBXi2e1lw9R3vjnUZwlOIi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDEwNSBTYWx0ZWRfXw+iLgIZtWmlT
 Qv110tnKqScfoFN/iZ5Ju/Ad/eKnjqdKKxkIBPUKDkvf5x9RfmWPPzBXA1dNwEZT9EQwHL0Ys2O
 +9LYoVhNWICDrwtX5sfUSgAMFb4cL0xTvDVEwOkzZqNDBrnMfsn4t1+XAixGtOdmqywFa60nmUD
 XGe5585QgPNBdZtCrt29ZgHZWJnQZNnL/WxH0QIkn0sU80gHDGuVXUrGRMqkZNBdPuVDziakpPz
 +Z86Ws447W9m0zEs2synZMXjQFyb/8djUyuef0G49ABlU5UOjkT3CtfQtwFUggbkGeiWeaETRc4
 6V6bHuLLNKPvnqyPGs9qKG6FspfGBXSSu1u2uZXLhJyV5fJ9x1EbvDS8fhh32U973DpnN53jTyp
 Cj0Vv0cJA2PiFfzLn5sC7NKC4EmItn9DZX7vNmEf5N90fJKhIhTDARTPzSYgomQVDJ1X4FFXqpB
 B0C0xU9gFRxF8MEbpRA==
X-Authority-Analysis: v=2.4 cv=BefoFLt2 c=1 sm=1 tr=0 ts=69d79135 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-RVjIYUuWhs3u9hRN0oA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090105

Implement ICE (Inline Crypto Engine) clock scaling in sync with
UFS controller clock scaling. This ensures that the ICE operates at
an appropriate frequency when the UFS clocks are scaled up or down,
improving performance and maintaining stability for crypto operations.

For scale_up operation ensure to pass ~round_ceil (round_floor)
and vice-versa for scale_down operations.

Incase of OPP scaling is not supported by ICE, ensure to not prevent
devfreq for UFS, as ICE OPP-table is optional.

Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 375fd24ba458a7ef65d075ba98e5f99f4aa977c1..aceb2c42969b5d2dcddcddf0167f8824733998ec 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -306,6 +306,15 @@ static int ufs_qcom_ice_prepare_key(struct blk_crypto_profile *profile,
 	return qcom_ice_prepare_key(host->ice, lt_key, lt_key_size, eph_key);
 }
 
+static int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, unsigned long target_freq,
+				  bool round_ceil)
+{
+	if (host->hba->caps & UFSHCD_CAP_CRYPTO)
+		return qcom_ice_scale_clk(host->ice, target_freq, round_ceil);
+
+	return 0;
+}
+
 static const struct blk_crypto_ll_ops ufs_qcom_crypto_ops = {
 	.keyslot_program	= ufs_qcom_ice_keyslot_program,
 	.keyslot_evict		= ufs_qcom_ice_keyslot_evict,
@@ -340,6 +349,12 @@ static void ufs_qcom_config_ice_allocator(struct ufs_qcom_host *host)
 {
 }
 
+static int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, unsigned long target_freq,
+				  bool round_ceil)
+{
+	return 0;
+}
+
 #endif
 
 static void ufs_qcom_disable_lane_clks(struct ufs_qcom_host *host)
@@ -1743,12 +1758,17 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
 		else
 			err = ufs_qcom_clk_scale_down_post_change(hba, target_freq);
 
-
 		if (err) {
 			ufshcd_uic_hibern8_exit(hba);
 			return err;
 		}
 
+		err = ufs_qcom_ice_scale_clk(host, target_freq, !scale_up);
+		if (err && err != -EOPNOTSUPP) {
+			ufshcd_uic_hibern8_exit(hba);
+			return err;
+		}
+
 		ufs_qcom_icc_update_bw(host);
 		ufshcd_uic_hibern8_exit(hba);
 	}

-- 
2.34.1

