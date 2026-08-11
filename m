Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDB642C511
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 13:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786455473; cv=none; b=eCavT6T2TUbrIjZ6oWqOefu0ymH45C1mRyLhjRvVJ6qDagJLA0u0ShBj1NBexQZ6J6Ah8q6SEgxMcgTJ69nvUg0Vr+xSmvyid71gTk7l2dZ1UU7O8v/tfOpTqO0NBEUqRrr6UsY4b4VDzj5l5ipc4s7iYaUC94Sbvp9UALNXVo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786455473; c=relaxed/simple;
	bh=BqtVh29iA/EPyooGaO2p0jd75Kq96yWmIc16Fu8hTJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uaNp5JmSFIBKmmhPghzVnxwGDjB9F/H2EfBXUw84VxBFp2uXSRxaBQAw8SUm5Zu7DI6fVoJAfCwLlF6/1AA/nf2oevRFdkSBOIPmhwq3cqdP5GmLUWHlH7CfscO2DprML8oP891vy4EEbmbzZBCkUIF5rvv6lYeKQ76i90Maiag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aPHwx4TN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MG+BQsho; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aPHwx4TN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MG+BQsho"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDX608767030
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 13:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D/utWiq2ARW+ai2bHcmXpD8j3glUx9uY48Adn0v5qM4=; b=aPHwx4TN/9Ocqb9p
	wUvxUinIJWSnN6LTqjbovhGfIremLbEOj+Jcf8X5JZwBgvsFy51O5FZwvfJo6jXo
	bwTCd7DpcxVRJO2i9xEtJlyOh5UPeDoUfRHOSaV4pdNYc2zh3B7dtmLxH4K3QPb2
	8W/w9JHjpMxPT+Lms+tAmsJL1/jxaCQI45fI/NsR9j6gfrygq62wJwfNRAEt+eNC
	0p8gy1pPzmFU1vu86u2WksPwa+JygP2fJ06/HVNSFRfrg8YLDIDklMNYNp6ubrNp
	M07QADMAlaUPNKGW0QcYLqQ1PmqQVCk6JrYKPnT8nShaO0Wvq0rwKr4Uq3Q0XPGC
	ozWM0A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g01nc0r87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 13:37:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ce7dff6253so9188065ad.1
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 06:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786455451; x=1787060251; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D/utWiq2ARW+ai2bHcmXpD8j3glUx9uY48Adn0v5qM4=;
        b=MG+BQshon0Cof20gV5uLpASr1ZBu5l6VhbgEBbb/YqxkGTgpIAVTA2Yidgd5dmUrVa
         1hH1lCRp/oCJZijTnmXhRduYPIriT3Wjd5+XGlXm3rMcXCPM8wi/caK8/2U42rb3mKVv
         s23pMr7d3eHw0prG96F3aYvWBCfp+l08N5Ge94ywaqYHeVVm56JXmn0vj9yYsn98gpbo
         ocxSpwJWOayWN26SjeSkKXMk+QGHwDLkpaIlLs9vp3WO0OpATQmgwJnS8uQh/wQuzCtc
         b+9djOX9/TfNMGCV74nWETrWQ8vo5Q2UEyAULsm4tINJwDLpJ4dSPD18VU/1Q69jWB7Y
         mmpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786455451; x=1787060251;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D/utWiq2ARW+ai2bHcmXpD8j3glUx9uY48Adn0v5qM4=;
        b=fDGV47xitM1E/uVmOJfu7eaesPY75MG4MasHScU4qF34pxV8JhjFF/s2voY1/NmCAX
         JB9Fb0rmwXnz+Srgou1PO7upAV4PoFWENTvganF7BTcZKAOAa5ltiZwUBvszmrSkjxbD
         xdFoDsa12eWH2GEIRAQRwt9ItVuuItrwIkmWxjC9lXmLhqSaWo63Bs9EtHitJ/szRju7
         SW97SQ13M6Dr9BeSpQQfQIl6hWi3aL6ENPIrFLK244dAUpRijkTWt3t3Qz3IW8d/DUX3
         jX1e74at6gAOqUYkxfeRXXX/beYFPSmWlsa7KLb0+Xckd2UVUD3fUHna8sHTKYRVtSz3
         QDDQ==
X-Forwarded-Encrypted: i=1; AHgh+RqY5wTnMX9Lwbv0AUMCFGoLRgMhNPTZFenhYDql8P1JEEtml/cbKsvlvHC/t03vVZpkIS6oKQBoPvH2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7ss4dZ2A0WGO8lO4QmNbL2Hm4AR2j0rmlY+hHnjyxyPafSpyF
	t+DsoRmmVwR3oFWlpqJlt+rtjPsl/URqubCjEWbxDkLG9rzJXEI+QA+qyCnxyHk7AkJuJgVLe4L
	dcJ+griuhNo9TEhzb7IUCQy128e1BnwoBzGawAzALMdNv0EJTtCQPHzs4WetHgeNx
X-Gm-Gg: AR+sD10aC4HOkgpn8t5XB0KdGfzk26aTZzLEVdGvOPSxxj1H8OY25zuXbF2yrNPzJ+o
	W0t1SMqJuW4nIwxWefjyp+M4EVsu3T9eC+5T+Zh2COf3ivHyCsLBQ/jBDT71jUIk98BSo6XMZJj
	3DuXyvTeN3coMVKQyiI6ss02mY1duvspuEZ/wYpeGTK8f4mGyfUqoJiT86uJPvUkRw2MOhcg9Qh
	dgOWXKE9vzotbum7BA2x+zsXSyq5gEQYaSsWpruYcngiku/awHssI1l4zwd6FCZhSZl5Kw38h5s
	JvTzArqtHl2JjvCcvwUFYlX8U6ZHZ7rH3dKKCpVDp4fhg040PZp4svxJLsPZn08//H09HczP5hO
	IE1yS0uEBaOwqzZc/W/3P6ARrsFz6BAtApWRxTcF19ShglMxjHX+l9TkG
X-Received: by 2002:a17:902:ccc9:b0:2c9:e846:a589 with SMTP id d9443c01a7336-2d32da94a37mr908575ad.13.1786455450894;
        Tue, 11 Aug 2026 06:37:30 -0700 (PDT)
X-Received: by 2002:a17:902:ccc9:b0:2c9:e846:a589 with SMTP id d9443c01a7336-2d32da94a37mr908075ad.13.1786455450356;
        Tue, 11 Aug 2026 06:37:30 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f4819dsm8360885ad.37.2026.08.11.06.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 06:37:30 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 21:30:41 +0800
Subject: [PATCH RFC 12/15] arm_mpam: Fix get_cpumask_from_cache() to clear
 mask on error
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-mpam-resctrl-dt-knp-support-v1-12-ea6397bead59@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786455328; l=1277;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=BqtVh29iA/EPyooGaO2p0jd75Kq96yWmIc16Fu8hTJc=;
 b=nCUjHi/w+wyvmUPfAJxF7oK5CzUc/Ibx4DR6Smu7voNpfIckaSazwIbHZe1dexxBOsrONZqg8
 462WF/100brCxPIzrTaFHv2GKdyzfFPcc0Azu5wbBLoI6nobQPkOm5L
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfX3/5BjTAuKHXV
 0EDb8DqRDpGU6Q/C2w0RlmNxtlg5JrijJ4VqUfKOjESqin7BZFxoz+eeIYFvFRgPoNoT1UcRAbb
 mAa3O8vPG7/KnYIFySa/K0KyC4mAPt8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfX/j2RumdzuOgE
 pwbRe6ft3/8jBSbAnHV2+/ISzmJT6+PWVgxBJ/W0uMDMrxlp0eXuYVk+1pUJLeSHxIXSdceLjQy
 NtJq5RSjgAIBmqENGPueKz9M3zlTvr+FcyEQIA1cuWNuF+HJLGndHogwqMo+4Zd7twH9vV8pZJV
 NT2XGTsIod5GBDkeSkPOHDsOK+OKRAM30iIw+85iB9yrSBHDG1eEdQLjULhUVKmu45xRq2btjto
 ikOpN1xLe95Pw76YVxilj6pXTM0xSSp5TC2YUODoAp1Vl/2iIZ/IiANE48bzw8GreVLpo6F3pcH
 wUxmTYP5UjRTtC3jIzo/ruQSCDqhzLOpTSaWgKWW+AUZ1MdxpAEfnHWdB1idSjTQo/H7menQsjK
 84HolV/5zDIoQcBAAaxN/ww/Y0QmIW3mCusyctdvSrOSijhGqZBgHodZSGmPyyux1xAO2BrO0AJ
 4vi8yFfij7UljB8CN1w==
X-Authority-Analysis: v=2.4 cv=RY6gzVtv c=1 sm=1 tr=0 ts=6a7b259b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=rjHAeU6eiAh5UonRzJYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: XQ8_O-T4VYIAq2eQpANTxCqS_CHZwFwX
X-Proofpoint-GUID: XQ8_O-T4VYIAq2eQpANTxCqS_CHZwFwX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110114

If mpam_get_cpumask_from_cache_id() fails, the affinity mask may have
been partially filled before the error occurred. The caller has no way
to distinguish a partial mask from a valid one, so it may misuse the
incomplete result.

Clear the affinity mask before returning the error so the caller always
receives either a fully valid mask or an empty one.

Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index eac3bc695fd1..d8856864e89a 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -243,7 +243,12 @@ static int get_cpumask_from_cache(struct device_node *cache,
 		return -ENOENT;
 	}
 
-	return mpam_get_cpumask_from_cache_id(cache_id, cache_level, affinity);
+	err = mpam_get_cpumask_from_cache_id(cache_id, cache_level, affinity);
+	if (err)
+		/* Don't leave a partially-filled mask for the caller to misuse */
+		cpumask_clear(affinity);
+
+	return err;
 }
 
 static int mpam_dt_count_msc(void)

-- 
2.34.1

