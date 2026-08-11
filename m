Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096AF418357
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 13:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786455444; cv=none; b=k9lUMt0DtlF4pCYP0MXGyzNlnNQkXymMuXdYEcHmhzTMPdPz1bYY/OcCzSIu6T3NKbRFKrVAGY2EvaSwxu8IWUbeLbd83Rp7gIre9rvfE575G4tbURFE8uYhwmGYGarFF6TqYoARNiW9wd7a3BL9evJs5IIgYDzlfLpH4oxbTx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786455444; c=relaxed/simple;
	bh=nk0+lqmwemEwOq/+VNFwqihY6Bh4+dlMQ4KcgiZ0hnE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZKr1uijxs9cH0XADigbpXkrAlpChrD6xRmQ8urDuy4z9i08kT1o8z+GHyjlVzGNHE6wKbI69aSgmiOoO/XeBJuUkeLVaZlqrHa5Y6edfEw+6QBQ8lO/q7Kote+H0DUGjrQjfwKBpUpqSOsrR7b+97pnxmdAjD1f6VzGlJ2VHg9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mCa8nkAa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iazF/b0A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mCa8nkAa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iazF/b0A"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDX0Ql767094
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 13:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EjJWRE5UeUGLYrsBjG/4Kbv4uxBHttAzZHuhxxDCelY=; b=mCa8nkAakfH/D80b
	zyTHpDkqvojSwIXBNnhYZIZI7QdX9dVkgbNXJRUs8vHgsvVN2QROA7gl1btD3r63
	hY2bi0XwNCzLDst6zKZRfwsTkTm+ydZZyIawmQ5OVtsXiksAqQkF5Uud7kP6j28W
	1ZLCjhZ73hiAYtSQEiU9jOngRZxlxFvwaFbZ0sz4q4z2NgSZtDct4FraF+l43oQ/
	OBvorePnQaumb+geYkWDRoaCAvSEUmpH0Nzl1nohK48EnH32MtSxP9L4G9tCejG8
	WAiB2+ovwgMHO46gZ81ZXKzV6l5P0xpmeskp2ZIKOiQcq4vRITbR3u3ZnzPxXDye
	z+gMYQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g01q10q7w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 13:37:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfc52ddc55so46145485ad.3
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 06:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786455422; x=1787060222; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EjJWRE5UeUGLYrsBjG/4Kbv4uxBHttAzZHuhxxDCelY=;
        b=iazF/b0AaNXkET+Q2lwft1VRyN16EsYehAeYIyav9+mKw3r8VD60sT7tivmvwalwBu
         XNNAXjNEY14TWGFOy/a2qompXa3mduR/FWLlomwwA8PMKBtEYxArURqWfniUOitxB1T5
         6OBmcNVJuB5uh80VwpAC4VXd9Vr8OyiLpg8NMqW4IQsFiSgdOvchU3XfOG8FECAiyWGk
         yOLnR4SiB9NRxTVv+qZHoDVR0YketOz73oKDS9B9+Nab+BqXoITH3U+iB49RDEgPh842
         yru21AdV1DY9yBIzFg59LVLptMTHAFND3cKsscNaYTHR7MWe4/UbmP43nQ0Tyxd6T3rW
         9c2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786455422; x=1787060222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EjJWRE5UeUGLYrsBjG/4Kbv4uxBHttAzZHuhxxDCelY=;
        b=DEH+c2ECFKGxyZT+rjxrpGQbOyGpYhH6enNS4PgmFwrcEpIF0dcKxn2wh+sAhAw3fA
         KyAd7+q8lV27zR2SWE/Aeg2APA6CDogiIBhmwKidnJqvwEHHv6zjbS1RKSKpn/0iRzw+
         +Htr3RH2WpcqBWltUaBFOS5HBYdYYpGJOqkeo33c2Q1BTcnivuHRYHSsvtapGuOdPWA9
         MgRDOxANRcmVLpwtQ26zpiunJ/sAjjKEdiLnuUTI53IA9yPHt5G8k1BdDkvwvz5ZoGN/
         nO4n/VAaA3gCc0hO8YDdPJ+5pzmQN7E7tzZcgSK+jrLk+iFUnZYMiTlohxfLcp+tTSX1
         7RFw==
X-Forwarded-Encrypted: i=1; AHgh+Rp7i62UszJ05q6fieKOb9ZfraqPpH4c4qYbIiXNCMAspIoyerMrYEmYazQYYTEE04ToxmJrxVj2yjM4@vger.kernel.org
X-Gm-Message-State: AOJu0YyXebdBUnxGqHH+pAhz08Um9pX5Wh7PZM9WsxK1eaerrZdjeGwG
	sl455M+QcP9pi5uedkFtOmnFyWF6DoxVVt7opyHD2n2egmq1Z7GU5ZEg5u3CqnHNomW7Fz+2WLY
	BQ7LuUSCN7NLDgDz+Xquu8fVCEW0G7RXnZWdt2fQsAptANVeynITEt3KfXb1F77+i
X-Gm-Gg: AR+sD12b/gSWML7K81mBh53vd13YOXdM7rZ/JD+TnE4AVzg0zmBbmvuyCVQjgHeGSYI
	vFy3sn+wgYoZ2yrrvE/SMLwrr6wrWElQmQEtr7xWA55URSfzxpu6pbIL/ZHhfK2+cYO/CQQif7g
	WoS7D2lRrEj+jP7cqW+t1XqQkYByQifsxc50GTq0ikvqDQ69/dm1aZG/ysa0sZA3U1XPRlyE1cj
	L6jitBqNMTi4KP7+xVnMJ8R2mrHRJbNYWXZcwekoz6LJSkhD9s0eHlRhJR0wH8Nh/jb2/WfobBj
	B6452erA47zn1XIdG1UziiK/AjDFmzTz1HUlcSn4fCZ+45tzOyIh0Yy3Js5+Z9jsUrotPT2Ra8b
	+5bc5tFnCrpffvI4OWVj8WA65UpmBli1AryOhqVMH1VSO8tc8ZcNsBxcg
X-Received: by 2002:a17:903:1746:b0:2ca:106c:7122 with SMTP id d9443c01a7336-2d3177b197emr43082235ad.9.1786455421573;
        Tue, 11 Aug 2026 06:37:01 -0700 (PDT)
X-Received: by 2002:a17:903:1746:b0:2ca:106c:7122 with SMTP id d9443c01a7336-2d3177b197emr43081055ad.9.1786455420948;
        Tue, 11 Aug 2026 06:37:00 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f4819dsm8360885ad.37.2026.08.11.06.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 06:37:00 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 21:30:36 +0800
Subject: [PATCH RFC 07/15] arm_mpam: Fix the RIS index range check in
 mpam_ris_create_locked
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-mpam-resctrl-dt-knp-support-v1-7-ea6397bead59@oss.qualcomm.com>
References: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
In-Reply-To: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Conor Dooley <conor+dt@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, ganapatrao.kulkarni@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, devicetree@vger.kernel.org,
        driver-core@lists.linux.dev,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786455323; l=929;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=nk0+lqmwemEwOq/+VNFwqihY6Bh4+dlMQ4KcgiZ0hnE=;
 b=s84p4P01mgVVR1o4H7MeEiKLbGr93oPLw4xXM6u0g3VS553DL2JR22LNajgYTtWXmfoJpDtj5
 xOTAS8ZQOGyD7Jsl8Seq3hYMSptmsxxLVB2XtBcIikPS2DCj/3HFOD0
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-GUID: 2o_zINB8ZIOQyz75emNRCyjxl04cPkgy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfX/D8wjnLODjdn
 3mz3rcXc8QbAGgd5OAvnoRzw0dcm1nf7asfpPwzFG1VRTcwRgQ0tDQENbv9mqo7iEqKxpaXrcG1
 CEFmoVRwpi9brZGLC2YuTRdZcp4VGr/hVwUQVaFhF2NFIXNFIDHQX8JDjrW7IYH8qcjWYPJ3tb4
 lRCdUA0GGjIzMQ0a/7eSrRqRunBK3n/CXZfN7iuKXnNiK0CBlRkO2YdZY7/4nex28ND5A5+pKaI
 N+6vtsR3iSO0GGafne/xANjaI2X6D/LCBgnHU70nNOajp1lUIiIvfbsB9BKWU61XdaOkDi2e2m4
 1jQZm7sgvGMkOYdKSU3sE6rBx+JwLArA5OpxR3XeWMSTx6zdo3UIWryJfG2s7hEww/OzU01gG7d
 TLY0elCoD25Fl18J9OHhdYnIBKNkirpMNMGBWrrZb2biiQAQaI73fMqjncUlXQolBcZDvzHYk+Y
 U5zZwMsa48yS+WGZqvw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfX1OuEhT7P4Ugn
 b5nXz6dZZ57WzuA78V7rL2tjGnQxDGHEStNkF61EP8tvJqXMNmsDIfbS+umfPsQ8e6eZk7zEm9e
 jW9lv2t+ONRthgPB/g7U1yemUa+pw+k=
X-Proofpoint-ORIG-GUID: 2o_zINB8ZIOQyz75emNRCyjxl04cPkgy
X-Authority-Analysis: v=2.4 cv=brt8wkai c=1 sm=1 tr=0 ts=6a7b257e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=tscwNbPNHAv0RIyyFlgA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110114

The RIS selector field is defined as MPAMCFG_PART_SEL_RIS (bits 27:24),
which is 4 bits wide and gives valid indices 0..15. MPAM_MSC_MAX_NUM_RIS
is defined as 16, so the check should use >= to reject index 16 and
above. The previous > check incorrectly accepted index 16 as valid.

Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index ddc15249ec1e..cc9fa1d78925 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -725,7 +725,7 @@ static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
 
 	lockdep_assert_held(&mpam_list_lock);
 
-	if (ris_idx > MPAM_MSC_MAX_NUM_RIS)
+	if (ris_idx >= MPAM_MSC_MAX_NUM_RIS)
 		return -EINVAL;
 
 	if (test_and_set_bit(ris_idx, &msc->ris_idxs))

-- 
2.34.1

