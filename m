Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4DE330647
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378788; cv=none; b=UIPhGOaxQ2vvt5lzlJYUbElic2hZqQWwdTPa7fdBdf2N6Y+V1IpM33Xa+rEYuasJWjPlwiN2yDOU6VJOAwSImcqaE8t3OdzFd/y9u8Lb7fCT/RBujxFhrFDBn7tHFE/Ctns7bNK9fY01xA8ZQ41z7mXLpME88Ht/uXPAtoae4N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378788; c=relaxed/simple;
	bh=Jy14sVbtBOA4INaXpzyNkK/bT7ygjH1r3zg1u0X4N9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o4KCkHl6BBpo2KZo6kWvIfRL+jdn0MUcKy3YhKGEuoRcPGHuwxLPeOAg7C2jdy8Leq4pt9lwgSbXZA777fzxWzfDTxLuLaYCT+fKWpHGfR1sGV8IZx1dbVbYEU9Q/S5rCZKby23fhLzhksQBIo47M8SDsnZwNpmQ3KfYh1lxTnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KJwc0xs/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QXlHuw/Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KJwc0xs/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QXlHuw/Q"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ileu2627003
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:39:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZR/24VT+nvDX6Pu+vatSh19aprf4T0g8qioM8XND/94=; b=KJwc0xs/gnV/VDUJ
	AbPpWQ3KScrRqB5m+kykYuRtCYi8CH0ADcKxgLqAD3GSjgfkqN/WacHGjllBQ27N
	Lqu7WHocHa/tadb82TF8S9emN6ojTDg252zI0ZOdI4VW8HZMSv0dkFzVD5Pfk9+D
	IybVvRN5jbYo1yae1kYDrQU+MhpTkRi89g1PEL2jwR4FJz1LUCos2LnToBZyVb85
	kk3VYBsZXtmQj2nPlGalwANd6u98BByZdM4Crx/TqsjDqSvX7uZ+bMxbawBrItyo
	rlUH7LZItb5OhqjSksgKJYWS7GlLoL5ml0dcZik0SDdxSh234Ew1aYzlwlEKDTag
	tVcH0w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmywh5u1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:39:46 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6fed0652bso33879075ad.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 02:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789378785; x=1789983585; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZR/24VT+nvDX6Pu+vatSh19aprf4T0g8qioM8XND/94=;
        b=QXlHuw/QNlndKmqmpl7sM8RQk7Jpzg2aWBB4jSrKH8PUPbA12u4t/KnewGkp7Y8F0z
         m1XFISDkf4k6BtSC8YCDqCdVKO367/LWXDribl9+vjVSPCqPqdH8xRMEYC91pGcYw2Nn
         Cx/pCIzfasU1hfOZiqG+lohGf85J04t5SOOQeHiPxReNpb1mMW1l85ht7GCRyDyhmg7X
         1GTdUBkB4Ya6X9IWmMLfNF7ybAFS8cnyJZEnYH9g+SD+0VsDHzFruaczZxYrV8tjwnqy
         AwIiQ8Hn9OnCiM66jXtrEmacC1K2OUazWA+1yDVgmPr4eNehDR4SIvmxWSHSf2/0fyp3
         2yDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378785; x=1789983585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZR/24VT+nvDX6Pu+vatSh19aprf4T0g8qioM8XND/94=;
        b=ErVCsfdhcP6V1gi88ydrilCsxOhZFqE85u6k3SbIzAHermOCFlFYVY8kf5/HiknHXx
         9363hBlQNcRgGEQtDxeFpegaMiKqXteG3RIcdjubP1TjehNVEkPhMgXIOO5MwvORwwJV
         MClGhAaD9x9hPIYc14NKP2ltp+2zYh6wL5ieUSu6QceSKMs6Sko96aKk5WJj4lG4CN1b
         nnNoRQF02C+kMvKNJARE00ofo/PptCrL5aO3A8499PqGdvJyOZzmzRBQMSUnINPnCLTF
         5GV+2gPbOGXcXM8fqVZTvgkJ5EbwttiH2QSDnvUPf0+swD/7uxCWacAQeDjBVkGt606P
         lSQg==
X-Forwarded-Encrypted: i=1; AKwUvBzeD1OkIhjx6F1pFYm9P0YespOcjSG3rgzTtUxIVzYwzjD7NhUXmDJZpP27NeG1dQUG1Qyv9pSfXKhc@vger.kernel.org
X-Gm-Message-State: AFuF++l+IqL20BwIbbGxY00h1y7EmewjIcU3pyOSXpgvxq3kgQehQPQ9
	b3HaGRZv+0unSR13LL0MaRwWv1cZ4i4pKixuPq93EgCJ/f5/qagwc2Zblotm5CIuMWu9NXAs6Cm
	7EgeX99ujZtKn2XHHk5b9AJE4Tq7eqHThGndVKrBZL6Flej6RpwHFD5Q4g2d6oRof
X-Gm-Gg: AYBFou2vwVzpQDtV8OvkCVuAO8GreKrn/6ceFuLf+1nPaAO7lvjVaTs6LdRjss/mVO1
	wJnUPgJVu25geIrbGrdwTuV3dKmxCKgmoR2QUH0ZXq8itW8fjipKoFYQPjb+b9QPV+ZvcnJtlbt
	U7qGCVx/8II0WYVFbBhGVzup7OjEQ+TWdZtbbSeITOYhRGBFIXmrvvyZeYvt2EG1k3PciLYSSIM
	yDH+sZmLIE9cWMPWZsw+tu3hKhmnhT11cAXHxvqsnG2wVQHH/1/tDmTPhIZb3HPLiLbisDZdb3z
	7BdswCCjuLN+krSxNG4q5aS8HZ+XHhW7lYb4VxjzbAANofulvxy8tM2GONRA0hR6cVOUzTGJWVX
	NRxv2ijGOiEvxCLW3yVz1ZiBCzQ23PBy7Wkf8kxMSanMzA2sAgptTtCwU
X-Received: by 2002:a17:90b:35d0:b0:39d:efb1:dccf with SMTP id 98e67ed59e1d1-39defb1ddacmr2679920a91.6.1789378785525;
        Mon, 14 Sep 2026 02:39:45 -0700 (PDT)
X-Received: by 2002:a17:90b:35d0:b0:39d:efb1:dccf with SMTP id 98e67ed59e1d1-39defb1ddacmr2679850a91.6.1789378785086;
        Mon, 14 Sep 2026 02:39:45 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e60484sm19488728a91.4.2026.09.14.02.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:39:44 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:37:49 +0800
Subject: [PATCH RFC v2 01/10] arm_mpam: Fix the RIS index range check in
 mpam_ris_create_locked
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-mpam-resctrl-dt-knp-support-v2-1-bf6645bb2f65@oss.qualcomm.com>
References: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
In-Reply-To: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789378758; l=1084;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=Jy14sVbtBOA4INaXpzyNkK/bT7ygjH1r3zg1u0X4N9o=;
 b=8qVts8kvOfruxq59KFcdjO9xhhSgezIyTV0q1/20EcQF+DfUllQOZoPY0Owrd4E15wWT9eUt0
 Aa/3hS1ds/7BuqTY+P0ocnYLZ9q7OxXK12q95t3cvNkvuz4MnkRAN+f
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-GUID: BB2zBUN4huNI2CT0GbFb6ngQgKP3wgJv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfX7fL004oaNUP5
 1S7t/ptYKmq1dXeHMFA1+COupTMKMyX2+5q+9s705zhHNKZHkaICiizSaD1SsdNUGYMxv8RJoyC
 84nd9DBDnR3B+I4sEVfIHIBmTuFq3NOhZ8TelJKJFcPRLQkrQW8tIkf840iMIrhTLxov4D2CQYB
 abzEXkR8IhtL502IwIzf5d7nd72QsH6mTjuGbn5KPiYd8i2EOaTfd6Ad53arbxGhcC+XWgCrec3
 B4gNbiYX8h7itLxOWLtQeaRzQ6OhZz46C95jDs9/ckyZEU993inHs8O2+Qv05QfT2nKocu8HRCA
 HngE52s2iCekj+rgtvBE/Uj3Qmj84yEkVYNWZ/ioHQWqVXDoqLQIoV2NQWGWEsoFmhb1KMFjSZT
 5rqXaciwAmlLnN34NzMGhX+EK/2KDqZlWb39DuKYZUpIP51TG4SGDHB6pE265RvriOz6F6JnchM
 hI77bShaq5jRPG2IF8g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfX4Wjrvl7ckOhl
 mnSxGXINv7H9PwE7v7opptKsA2uKxU1ZdulglXbOIvlfaAFMDmhc/s/jYQRFFusY+UT2hPcBsTs
 /TzGucBtiDHs3dSJ4IQbIUSuskAQWiA=
X-Proofpoint-ORIG-GUID: BB2zBUN4huNI2CT0GbFb6ngQgKP3wgJv
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6aa7c0e2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=cxiLKowE09Ysm4E8lmYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140137

The RIS selector field is defined as MPAMCFG_PART_SEL_RIS (bits 27:24),
which is 4 bits wide and gives valid indices 0..15. MPAM_MSC_MAX_NUM_RIS
is defined as 16, so the check should use >= to reject index 16 and
above. The previous > check incorrectly accepted index 16 as valid.

Fixes: 01fb4b822472 ("arm_mpam: Add the class and component structures for firmware described ris")
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
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

