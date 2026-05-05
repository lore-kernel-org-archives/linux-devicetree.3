Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8231E429810
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 12:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777983909; cv=none; b=m0JOm9LUMyhPC/3g2SATvLZRce5rVTsz4SrXLqWhkGasVg2rhcc6b8x5BM/c4V0G7PQVSCVqWsC8vnDPNX86lMFbOBsq4PQRWgFOggIbwlXOorZr83/5eCRedn6Yqu63tfiFq+7Y+9pjY8rCpoUDEyKaHNL2c5y254FBghi03FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777983909; c=relaxed/simple;
	bh=K7/WGQ524x+e2ze3I8r02DnkbU84gUgAARamEEr7Lg4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o+pbWdQmAlb8F1AcnkSwpkv54WB2qdEwGVQuIfXQ/lqayNL4MDSfMaHpNAmOzSdRF2tk3BJBeia/OAgvcFFvPCWJ3+I0M4TSnBCZdKphlnJI/T+Fel+BVmmr8VuapqvrMujK9O83CYxTe1i9UxWBupiC0k5uESCNfxwTfZdfbt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JOddLap0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iV0tTTBc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JOddLap0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iV0tTTBc"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6458hx8Y1346303
	for <devicetree@vger.kernel.org>; Tue, 5 May 2026 12:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pmyq3Jn3jS95x5qGd6vMxoixGm9Dq9F0RVe09Iz/Q7E=; b=JOddLap0jB/q49ce
	ysA9hU1v8gpGvceX4so5na3MuDovcsC1hapvbgPTLjG4p90D0Lw7HNcngXZ8/o6f
	tS+tfHIjWHQtBoTPOdn8KqC2FBKhiH7v1k89tJR807w/wDuW/t1OsV3tRpzXaiyp
	hWa7nKC5Wp9z/EmyBWE+gvt1HrVrRrEqpn/6Hv1Z83Sk5Rrg+vZqPAVwaeLYFkEi
	VHpzE4WWdDmo6ck89/7+uXZ2KXkHvg4UmYyS6Jvm6b1glK6VTNFgfPYzybMqouAZ
	2MLbCJq0Zp8irK6UA9PL27jDvN5MpXHR2XrdRxkSh+NgPIq5TRwHZOdA2kdSu72p
	aYK6Ug==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxx2xc0r1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 05 May 2026 12:25:05 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8028392fa7so99210a12.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 05:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777983905; x=1778588705; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pmyq3Jn3jS95x5qGd6vMxoixGm9Dq9F0RVe09Iz/Q7E=;
        b=iV0tTTBclAELqgIkx4OmeTTTwtI6shm8Z/kvYiOkg9o+QLk1po69gtRjjYkOth31iv
         Uk7Yi9y7Lclt/Ssaf7kpIgZaFWS+/jV1RntMrhSrMLVT7Mc5xQHOGr6Bu1XIcp0QBdh8
         8sWQaAAWHdaxOUeoEcvxSp/EbfSGGvcPWiBT1oQrRGgKLyaDQbW53BF57uYI7JyiAotz
         cB+lOenVTHqMpEbWBKmSPFCdnU5yFIe+ivrvWstKnpa6E5+73lDUFZW4UT8gzKokVolO
         XxlE89okldt6eD9AhDTNSmdVAxj3O6DONsRdTg8M/pdkRmCoUHpwEq/Enqwe1a1u1B7Y
         YQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777983905; x=1778588705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pmyq3Jn3jS95x5qGd6vMxoixGm9Dq9F0RVe09Iz/Q7E=;
        b=P3mAFOnLHB8X/BRLmRyXtvD8A1DTZMVkr0kYnBrHkk+U5suSgP+41Qm3XYSqKWJNAr
         MU+TOIlAJndd/BB4TtWUk11+6AuoPtYhrSucQZs8bvgCClMSlONZfjBlu54SE8y0/reL
         tzeRENHAZXQrIGO8vKTz7lSuc6w4JS7P8aI4aag4mcRH+aeUv3qSixujyxX1cmncSKPa
         5brs28zUwDnJHYm8ral4Ct6FscTMybP07laAE8Zab6DN7D2aPNeW6S8Kr1upjmzC26dX
         Wd5N2DQxOye0LJmjHwOh1SV+P7X3Xpk8u47LU3Wc73vUeDWFEkmG0DZ+NFZU5geGSVqK
         xNcA==
X-Forwarded-Encrypted: i=1; AFNElJ/zEFCS9nRaenHrcvfm9eyQWlVWvgT+zCIFIPIk9k45dBlmRAyLrcjBDgw6YBY/NwLJsa4wbxv6FgjX@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6nRZnlE7vFUF03VCZEiTXql5xKi+m6BAue/8AbWnrxXJLtIbu
	zN8Mdh0HekpV8G8pzrHI/6ZWs1Dx76cRsb0kZYjaZaDk0VkDBxCSHv1sYpyZ6E5LKOB+p8f7fm3
	ieDW+IBMfwos9x0laQxgmmsVyEAOwWTW2YCFNR4at2Wxbccz+TarylJk8UIh/xbDL
X-Gm-Gg: AeBDieuRCd0ZpYlMweQ49+k6X82/lqmZNT5/a0g8U7NJb9nP2g8iIUF8PKqVBn6N/fk
	BpsBwpoB+Wyj4G47pY4K03VaqewCxFw/jNusEeO4dK74NADJ2X7xfmvOXEIFXdMg0+NIdL0DAI7
	UlMaaG0cB1OwVBoEUVyI93d0YsmIBnpkhRRSJ5tNcz0OC9g37+V3n+QWmg2CZfJbmWWpZwIGiGt
	TDe5bahAZ4pi8aueuy0eeWPpAPqwAtcUxBVAk6O2T/xPM+f89aKukg+AE3smo9eEabCW5sws+H4
	4M7T7tHJEJROtmgjsNx0WIzFeXttbNe3ufpcOes7bx0ZTSHGxagr2XvG0PF/XUdKz2wCpaQAMSh
	djekV/v+c0o9IvtcjvXuF7jA1XdvR0tNUBd72k+kqlaHKiXX5NjjW/Q9ZS6XAlSk=
X-Received: by 2002:a05:6a21:6906:b0:39b:91d1:6c10 with SMTP id adf61e73a8af0-3aa3e94ebb9mr1574707637.4.1777983905067;
        Tue, 05 May 2026 05:25:05 -0700 (PDT)
X-Received: by 2002:a05:6a21:6906:b0:39b:91d1:6c10 with SMTP id adf61e73a8af0-3aa3e94ebb9mr1574672637.4.1777983904596;
        Tue, 05 May 2026 05:25:04 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbbaac5bsm12597998a12.6.2026.05.05.05.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:25:04 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
Date: Tue, 05 May 2026 17:53:46 +0530
Subject: [PATCH 2/8] ras: aest: Fix CE/UE error counts not incrementing in
 debugfs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-aest-devicetree-support-v1-2-d5d6ffacf0a5@oss.qualcomm.com>
References: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
In-Reply-To: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
To: Ruidong Tian <tianruidond@linux.alibaba.com>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, catalin.marinas@arm.com,
        will@kernel.org, lpieralisi@kernel.org, rafael@kernel.org,
        mark.rutland@arm.com, Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-edac@vger.kernel.org,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777983885; l=2690;
 i=umang.chheda@oss.qualcomm.com; s=20260328; h=from:subject:message-id;
 bh=K7/WGQ524x+e2ze3I8r02DnkbU84gUgAARamEEr7Lg4=;
 b=5srgoRDiOLE+04KITceVdE78eHY9ax0xzcodvWQFYmfY3QszjcUqV1fapWymL8cEoMNtESzDE
 hlR4muq4F70BQ11YJzNFbjlpe+vvXZxKIK3RDMz5XqD1b9rqRIt0Cm1
X-Developer-Key: i=umang.chheda@oss.qualcomm.com; a=ed25519;
 pk=3+tjZ+PFFYphz0Vvu4B14pBQSzqcG0jZAQspTaDRQYA=
X-Authority-Analysis: v=2.4 cv=U9eiy+ru c=1 sm=1 tr=0 ts=69f9e1a1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=IvwcuExtd9bf9WbcJAsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: hnfGBNXDrtAXJnGgC9oFqtx-GPrq155s
X-Proofpoint-GUID: hnfGBNXDrtAXJnGgC9oFqtx-GPrq155s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDExNyBTYWx0ZWRfX8YvMocIETC4N
 fd9eWUTMIV4yb4+4T9eb3OaSoZr13zSs4YJK+JJS5nq/5ddkKry2/f7R7S2kxVnwSrOzD6YvP0n
 DzFGmD+YCnBQ2v/2tek5saxOw5UI69QfROg4YsF/C8zM6M7I9l4iSIOtCLs4KEFLAojEA46OZGI
 XSkCwEdLY+Cmo/wddrxZ2JmFgP8tq6NbbaR6BUi6i9IkKd4Id0dea+PBoacwzxyG4nXTGfs9dTA
 QR+k6jMsWz0mXlhZ5s+4Z0E8KiGrmUBazKVLnM+9h6mxOdfONPvYVPKi6IHLLk2HclacZHUPv5O
 bhJO68qrCbAR0rjEFCYPNWfFkQwwKDqJWlG2KwB+IhMfGx+Z94K4LM/uDw3CTEM9JlWEHQaF/4s
 xGi0Qf9xiHx2xzFm9L05OU0r7D/ZuO7oJ1UJxh/zFLyhTi+ff2xfRrSDE1h09Va7JjNeL8cW/tv
 ebEsVILvekc2Te8mDvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050117

The error counts visible under:
  /sys/kernel/debug/aest/<dev>/processor<cpu>/<node>/err_count

always reported zero, even though corrected errors (CEs) were being
serviced by the interrupt handler. aest_oncore_dev_init_debugfs() sets
up per CPU debugfs entries but wired them up incorrectly in two places:

- this_cpu_ptr(adev->adev_oncore) was used inside for_each_possible_cpu().
  This always selects the slot for the CPU executing the init code, so all
  debugfs files ended up referencing the same per CPU aest_device instance
  instead of the CPU indicated by the loop variable.

- The code referenced adev->nodes[i], i.e. the template nodes allocated
  before __setup_ppi, rather than the per-CPU copies at
  percpu_dev->nodes[i]. The IRQ handler updates CE counters in the per-CPU
  records created by __setup_ppi, the template records are never touched
  at runtime, so err_count always read as zero.

Fix this by:

- Using per_cpu_ptr(adev->adev_oncore, cpu) when iterating over CPUs.
  Wiring debugfs files to percpu_dev->nodes[i] so counters reflect the
  data updated by the IRQ handler.

- Using adev->nodes[i].name for debugfs directory names. The per-CPU node
  receives name via a shallow memcpy and is not the authoritative source.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 drivers/ras/aest/aest-sysfs.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/ras/aest/aest-sysfs.c b/drivers/ras/aest/aest-sysfs.c
index 66e9c1103f99..f710503e4d74 100644
--- a/drivers/ras/aest/aest-sysfs.c
+++ b/drivers/ras/aest/aest-sysfs.c
@@ -189,16 +189,23 @@ aest_oncore_dev_init_debugfs(struct aest_device *adev)
 	char name[16];
 
 	for_each_possible_cpu(cpu) {
-		percpu_dev = this_cpu_ptr(adev->adev_oncore);
+		percpu_dev = per_cpu_ptr(adev->adev_oncore, cpu);
 
-		snprintf(name, sizeof(name), "processor%u%u", cpu);
+		snprintf(name, sizeof(name), "processor%u", cpu);
 		percpu_dev->debugfs = debugfs_create_dir(name, adev->debugfs);
 
 		for (i = 0; i < adev->node_cnt; i++) {
-			node = &adev->nodes[i];
-
-			node->debugfs = debugfs_create_dir(node->name,
-							percpu_dev->debugfs);
+			node = &percpu_dev->nodes[i];
+
+			/*
+			 * Use adev->nodes[i].name (the original) rather than
+			 * node->name from the per-CPU copy. The per-CPU copy
+			 * receives node->name via shallow memcpy in __setup_ppi;
+			 * the original is the authoritative, guaranteed-valid
+			 * string.
+			 */
+			node->debugfs = debugfs_create_dir(adev->nodes[i].name,
+							   percpu_dev->debugfs);
 			aest_node_init_debugfs(node);
 		}
 	}

-- 
2.34.1

