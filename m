Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E286D42669C
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 10:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789208146; cv=none; b=HmYyoiH72Nmr+QtEoq/A6DPjDe8iFOjNo2MnAJz70//P2a4llJkNaIPfRO09XbpXHi1PpKNyc3ozY2kHfni6oHpMhdUwy45iltnid2fnvAMTOUbqHKDH9Z6KYFBFyIGEKVjUaQ02kyruf+LUmARPke/LLJP0mZK4SORjcUuQIIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789208146; c=relaxed/simple;
	bh=nbmyEVTc4+Ww2tjJ+SxB0dnh0CfPx4aQRKXHop6+iNc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PaDV25jeUuWB5Jc985FLDcTFfPcCW5SbV7vAloxUwry3AvIz6zib/sYuW338PoHH7mOhqSKmfIzXjgUYZHDfi3lJQaatKACFcL9NRo+QqLIgaeNBmKSvyx+uOiHP0x5qZ0dViDL0SZyz+lDGctKXEJuXt9oXQliZAMPyfUK3RPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IKhV9cEw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VQbagFJt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IKhV9cEw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VQbagFJt"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68C853ZK1803905
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 10:15:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zIuGB8S7sRqJtqaXIx6R8EAbbBn7m6GmghtV+o0/jPY=; b=IKhV9cEworVEOEwW
	gk6s/AjMqe1VEHdXDf6OW1iibkSxE39kSVan21oa2dvnbSCWnDHoIjrQ2diJxQmY
	YxfYT9yfzY6U1+a1grvJUlkzeWwZnosPxX0ZE3OXoZXOfNTyBrvl4ZqLW5Y3Z/h0
	ggOEKIPlLrs2YU2oGI0YSBvre/dgljMoYrgeDJ60MHeN8pun6EP8vvXA65/a6z72
	rVrsmCe963u+12MIiYuQY3RSPDsIrakxpNh6jN+rfpMynrU5paHAavftKC24lJ74
	mnlPtLyAdqvKVO6/EV0/XjcgW+F6b3rLapZ2viLj5AiLF8JJxN5sOGsGOWrVohf+
	JDl3Aw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c8p00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 10:15:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398e1f7d1a5so2126624a91.0
        for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 03:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789208132; x=1789812932; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zIuGB8S7sRqJtqaXIx6R8EAbbBn7m6GmghtV+o0/jPY=;
        b=VQbagFJtlxJhM78N7lsWS7c1lE1VcaF4UfnuJhlQHvUjbQrtS5EVCeFGCUfBI0qSqD
         biwB+0nzADkVpMhH6ccng7HZVT3mf3CC1i2LUgR0kCP/FWulqn0Z7WGN229cexfPTFLj
         m7JtGzbyVjygqOQFI48Tj4cZwUHrSKYIUQMul0SD0UzCLBxsaQyqGjoVJJ9RAexENo+s
         ko2xcfKgME3HVIynIcLtlomMR28XrtZrdb3E+Y/YWeAJ6+xCoAaMCi+V8ndoPvFF9Sgo
         b/RfHGrtNlibVLb2PlYpyCEAYDM5XrDifd4Hv0jZP6tqZHEvAmnk3how/rMA357Y5ce2
         jbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789208132; x=1789812932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zIuGB8S7sRqJtqaXIx6R8EAbbBn7m6GmghtV+o0/jPY=;
        b=IZJp7OpGHwcJpGZlvCApZCfNqFASuttCFtp8f/UwCb416tFc+HCbNTDw1LqOcQcHwp
         kN2dJqtUZs4NC59PMO6OAbShIA6qzE4rRBgFn97gQxU+3JL73Zmnd2LfkYITDTuCicWX
         X+v4vHnPe59NkbsaYVf97fndGmSkGHyx0FLBlIF1dyZU0pp4SSdgjKvdapuR+ykSR8Fo
         sZkMAjSaft9IqRSwMp0FBO4GRuYuQO6PBoSJScNMOgwXOB0tGSpbPEHyjTh3Jk+MxdQp
         UI45EIt4aal0juHZe1NYM183+et2fiUUsbmIMxxbH+Pg1IEgk3Rh7n17hcfRGHpx3I+S
         gwlg==
X-Forwarded-Encrypted: i=1; AKwUvBwGoANH4ZO6bjY/4bqOV11QIbgbYd8el4bZ5QfuuQQMa07FD2QmDPS1piqrxYDXsQNhS/8fhNypeSuT@vger.kernel.org
X-Gm-Message-State: AFuF++kLNYwXlBH5Q/03Fw57zmkb1kJhWGWL//czdW8aBVMG7A/85WdT
	KyKYjOFNZNco/98Bw/akzwVDNLsU38DkYj1XMi0ujklBMygzE8MrLKF4yp+/2FkgDTw+XHGSVWh
	h2/adJeByM49XaFGEnWenJ1JuKWmKSax9uZHTYaCwG10psGFEq7MKBEKEGRYtYWo=
X-Gm-Gg: AYBFou2eoZ9HLPoA1Y0MY6LKZnmPQl3JvWSF17mAEJQF9fEwzgpqDr9i9maOkpVAeIk
	Zh3TMhDwab+lDyA2xOWcS200wwRbP494PJvkOmj0ZPc6uQrQ6EKM+SJgyFEK//HBuw/oPEzxXy5
	O+NjOxcPDILyN5Ghp8AE46PRK3jqo8XiwDq9Khn+nlDhoW8Zz9brZ7lT/J+EBllkX/Z9k1tEjvA
	8nT/nCPAmVzdgLYufqlWvj227PI0SaghYv7BkbNs3TiNU1OovXlXS/Q8i9p2xnFuTUEsyM6Tbel
	tMQ8gJ/ZRRuUxZ96rj379cISQ6+A36aucl9JTjDxSQJNGP2hmZy3KBlHytjtAgtPJvNhlnyzpSb
	nkCbvE45ugKUBBB91TQM2wgguCedWclTqDZMFvOOOBBNR2AnKz+FjUFnfgWk=
X-Received: by 2002:a17:90b:52cd:b0:385:393e:7124 with SMTP id 98e67ed59e1d1-39dbc699006mr4249286a91.14.1789208131977;
        Sat, 12 Sep 2026 03:15:31 -0700 (PDT)
X-Received: by 2002:a17:90b:52cd:b0:385:393e:7124 with SMTP id 98e67ed59e1d1-39dbc699006mr4249221a91.14.1789208131506;
        Sat, 12 Sep 2026 03:15:31 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33baf0ea9a1sm10340085eec.8.2026.09.12.03.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 03:15:30 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Sat, 12 Sep 2026 03:15:14 -0700
Subject: [PATCH RFC 3/5] optee: riscv: enable persistent shared argument
 cache
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-rpmi-tee-service-grp-dev-v1-3-1d1d35c2a859@oss.qualcomm.com>
References: <20260912-rpmi-tee-service-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com>
In-Reply-To: <20260912-rpmi-tee-service-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com>
To: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: 1LCH0MO7pD6ljRD5vp9TTyDjZg62I_DP
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa5264d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=hYfsqUzT0y0sb8bvQO0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDE0NiBTYWx0ZWRfXzPIFEmyCU8dL
 P3VNFGG3qk8gLGceeMgCC4l9FTlZcFuD20qr6s6KMdolH0S3gbZTLmhzIbk82iNIaQkbsHH5Y3y
 S7pYrrzelUmEri0jwMRAlREAU9t4F3U=
X-Proofpoint-ORIG-GUID: 1LCH0MO7pD6ljRD5vp9TTyDjZg62I_DP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDE0NiBTYWx0ZWRfX8NBmjK49eS9H
 FiugKllzEsH0It8TwaKvMlOO6aInsWx0wH22rdz302kjPCX0PvrRTfmHvIUhQIRryIQGY1SuCoh
 TsAJxcs9SMtE667OBQK5O7TAkUR2tTIX8+RnRYfntmkvf9Q0go27DrVRdYvUof/sOecgwzoj7Yh
 WvzjZafmivKS0PA6YOZVPH6lDCutdn2ch/4DTFHs8B/VpjFsZf90SkNYgrWwi95frYv5Q79xhAJ
 NBt8UdkoUQ4nXAP8reogufRA3rDVQ5gI/MP6a7yPFtpYm4y3FEzi46L6h0alD6te+17X0G6dM8d
 My9hJ7iPYsHg5p4RZF26L5Pv7iGV4rXY1JLDyArX6UqF1I1gqKR7T5Dnc0tc2/Tze+Dhg+hW49q
 iRnYtteHJN1jfwBZMuB1Z95pJjqFTauQsqlUc00szbLkapRoCUGUSxFBqI7XncBxsbIZO2GBwVQ
 yA3p3SaXHygmmZa3ShQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_03,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120146

Use the OP-TEE shared argument cache when secure world advertises
OPTEE_ABI_SEC_CAP_ARG_OFFSET.

In this mode the argument structure can reside at an offset within an
already registered parcel-backed shared-memory buffer, allowing the same
buffer to be reused across calls instead of creating and reclaiming a
parcel for each call.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/optee/optee_riscv.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/tee/optee/optee_riscv.c b/drivers/tee/optee/optee_riscv.c
index 36115326486d..72c9eb85f4fe 100644
--- a/drivers/tee/optee/optee_riscv.c
+++ b/drivers/tee/optee/optee_riscv.c
@@ -1149,6 +1149,7 @@ static int optee_riscv_probe(struct platform_device *pdev)
 	struct tee_device *teedev;
 	struct tee_context *ctx;
 	struct mbox_client *client;
+	u32 arg_cache_flags = 0;
 	struct optee *optee;
 	u32 sec_caps;
 	unsigned int nr_cpus;
@@ -1219,6 +1220,15 @@ static int optee_riscv_probe(struct platform_device *pdev)
 		goto err_free_channels;
 	}
 
+	/*
+	 * If OP-TEE can read the argument struct from an offset into a shared
+	 * memory buffer, cache and reuse one buffer across calls instead of
+	 * creating a fresh parcel per call. This is the persistent pool that
+	 * matches the FF-A OPTEE_FFA_SEC_CAP_ARG_OFFSET path.
+	 */
+	if (sec_caps & OPTEE_ABI_SEC_CAP_ARG_OFFSET)
+		arg_cache_flags |= OPTEE_SHM_ARG_SHARED;
+
 	pool = optee_riscv_shm_pool_alloc_pages();
 	if (IS_ERR(pool)) {
 		rc = PTR_ERR(pool);
@@ -1266,7 +1276,7 @@ static int optee_riscv_probe(struct platform_device *pdev)
 	atomic_set(&optee->riscv.next_nonce, 0);
 	optee_cq_init(&optee->call_queue, 0);
 	optee_supp_init(&optee->supp);
-	optee_shm_arg_cache_init(optee, 0);
+	optee_shm_arg_cache_init(optee, arg_cache_flags);
 	mutex_init(&optee->rpmb_dev_mutex);
 	platform_set_drvdata(pdev, optee);
 

-- 
2.34.1

