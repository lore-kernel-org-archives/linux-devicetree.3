Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65168494822
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 16:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787846928; cv=none; b=m9Gzz0QYgWl817YF5FOgz9rW0IM9MmNDPvxfwEG+WnyEC3cL6TFQ5iHIYhUJzHdttOMEFpQU2pgFgmBQZS/j+rRWPrvthwyBoOlDRjw09E34iWAnQ3YmDhpTLIUovyETPSxHY8R2n1tI6FIw0+wir1NUuCfQU6DH2Yan3NrSyGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787846928; c=relaxed/simple;
	bh=oEtNN5KbRNMq2h6V0CnWjra0k2iO7Ns7CsfkpVo5D98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ckdxp00UI9APXsxmZTQUS9MfSfAHmlWJdNXn09hqZ2b1GlS17whcwvsUHP316yAvH3PF/wGLSbPc7rVIbBvVSEKmKfIlMm1jJHOo9oK5gkBgT+6pkHqenzP5guILjGQ5wVk5zXke8XhBmXRoUH9/RpMJ95vwBe+lLcQlyebjfKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IfYIo5+k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AykN1gel; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IfYIo5+k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AykN1gel"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFcA4F3941872
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 16:08:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HqmAgGVZ9+r6xr3Nv5npOlTiLJ6Hzk9Y3TXQVd3sS28=; b=IfYIo5+kqfBeFtH0
	9uxPPIAJR780978nDcAC6P/1YM8DV6C5OpsrJZjy5TSFsc2PiuTSLr0Ir5FncXMt
	9mo+/bkHeLBlgNUxW8gfskKFe1R153+UvqnVyl8WcE49lOz86p0I3d8iZWJ4DfRu
	36SFyc0GUxgPnzrCU5BSFyOfeJOVMTd/zLo3nqOIHRVlLBffFhJDWyUtRjDB3dDY
	fYWwZkudddJhWwLehMItDyJoCcZX2WQpXz2oQsqyzaHAODMcdU3Jp+6vNIkE+Xmj
	KOFlbY1fPe/4lbXKjdsV0lMWD4URv8h0QuoCHVANrTtFGxp0BBUsSYSMLEBZfwEu
	GFFIMw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga6etv4fy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 16:08:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-388cfc4848dso107074a91.3
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 09:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787846925; x=1788451725; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HqmAgGVZ9+r6xr3Nv5npOlTiLJ6Hzk9Y3TXQVd3sS28=;
        b=AykN1gelGBfBRZb2WKIs1o069CiCOjXNYERGWXir1RobUL/0W67+b+1bXqvHKT0l7X
         AbEAhjOnpHB2aDgvAbmLuFQbvSBq0lIXt5Siizjuzg8dUZwk7+Qt3Cjj6+IBDeADvXIl
         zNIqyUhthbQIRJRXvhQLBTGVmADIL9JRqTb/ORTxyOnElLDOMhvJSpbpf4J3kuKiJPlv
         QCUjS+jlGKDVi8q0h0PqhlktKvO+dWjIUOgyaK6lXfZhsRqBAulEbViFS2+bq1UHGocL
         zKbFYAhIg7l2ri7qyxmP1MEOzbnROz9MMAUxsQsVB3LBjg5UTE+dWFUPlZA20PoY+q0H
         oVww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787846925; x=1788451725;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqmAgGVZ9+r6xr3Nv5npOlTiLJ6Hzk9Y3TXQVd3sS28=;
        b=GDv9FL7e7uBjcwqDQOlyn34sJqR7BJ0yLVpQXCNM5Eu2j6f0WX4DeHWe+UaaCF/qzc
         I4WEgq8KaxZw0Jp6wba+kQwjxpLFJXyaPyYO0aMhsSqwc1LlrA0jaoNIeC2ieZFG/peX
         hoXcIKD7itexb/2OBCnexyhoe3vGMOrYXZkFLogbca9ge6XrvY3KvZeraZkCEDRJEcJ2
         kJ1amcLacp+AAnMQQNkSi0sk34hp2uKvz5qv4dVdECQ0dR5yt7dtUcU+U8inSH0Z2h8P
         0XO4miqx0mwNAhCE6EiTHKl5h+14WyYwCvpx7vTTsws3ZSgFqXvikelXH8gQxnEl9XWL
         0OnQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqqcg7j11IzIDNRWpd7BGL+Ny8Kq0BoRUIWory0CwotvXFmoMlDO9sZ8CBEqm+YhEP8MYcbD/zKjB9F@vger.kernel.org
X-Gm-Message-State: AFuF++k3vAv8RsGAMxZl7fvxz+0UOyI/HFzIQ2+g9A+AxRGVl1fvxB2q
	tnWiGxbQ12Lb57hA6CKglGOcU9wtq4pBtxgRDsVM0kfeQ8bbu44CnoAE/Nv3lIAAJUHLQkaOqGj
	EOxNZ5iQR4s6z0l0gZ56AepTEna4wBsUBWHjI7sIqmK0a0Fpo3r0+f8BhkT1rmfkx
X-Gm-Gg: AR+sD11ZRTikFtKkZbj8Dk14fXSDCTpcPa1srhY+jfOrCCKSlndgtzU2I4Uxx9Nst6g
	eciateifmaiSPU74KGy0L1xwo+jPv/F7d/+kgHQwmFuZka8j1mBKqeDmMJYtB/OCTEzmCXIg9fq
	vfdLJ6mR/Y250zdSFdPxWMwAOvtmFNfLi7ivenffF2zRZh7yAf2zDTXTed4CMEr7z704PjVLH9n
	iAzEs94+W4QDmgGb59JRZcRri36KMfxy1c2jKgIx2MvEOKxkcfTaCZ5GKR4aK+ViUq9pN+SHHmi
	7dspaqTNfEyqYwLfP6uhMQpsyx6cNfJd80Esaq0Ll33wP9gG1OBh4TnJePs1kMJVqqTptxJzViZ
	JAZDkOP8b4BvTwe4lGMsv+q2Z0ZqByZz8v1hnm7xOnMmog9gDBR876D7Qdug=
X-Received: by 2002:a17:90b:2d82:b0:393:194d:5366 with SMTP id 98e67ed59e1d1-396d0f6f8bfmr551941a91.10.1787846924584;
        Thu, 27 Aug 2026 09:08:44 -0700 (PDT)
X-Received: by 2002:a17:90b:2d82:b0:393:194d:5366 with SMTP id 98e67ed59e1d1-396d0f6f8bfmr551806a91.10.1787846924033;
        Thu, 27 Aug 2026 09:08:44 -0700 (PDT)
Received: from u24-san1p10108.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fd9085sm3245892a91.12.2026.08.27.09.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:08:43 -0700 (PDT)
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
To: ebiggers@kernel.org, axboe@kernel.dk, mst@redhat.com, jasowangio@gmail.com,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-block@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-scsi@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: neeraj.soni@oss.qualcomm.com, gaurav.kashyap@oss.qualcomm.com,
        mani@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        bvanassche@acm.org, alim.akhtar@samsung.com, avri.altman@sandisk.com,
        stefanha@redhat.com, pbonzini@redhat.com, eperezma@redhat.com,
        xuanzhuo@linux.alibaba.com, linux-kernel@vger.kernel.org
Subject: [PATCH v1 10/11] blk-crypto: add slot_offset to blk_crypto_profile
Date: Thu, 27 Aug 2026 09:07:19 -0700
Message-ID: <20260827160806.1295313-11-linlin.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827160806.1295313-1-linlin.zhang@oss.qualcomm.com>
References: <20260827160806.1295313-1-linlin.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NrThtcdJ c=1 sm=1 tr=0 ts=6a90610d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=cA43FAKIMfXQIL9lPwMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: zXeIE0NDbluL0Sk36EGrt-TriaOyqeRU
X-Proofpoint-GUID: zXeIE0NDbluL0Sk36EGrt-TriaOyqeRU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDEzNiBTYWx0ZWRfXx8nKlqdJRCRA
 45UXxnXdry4y2MqSZg8lsA7WIsFxYsQmaj2Gy+mYU79JWUgDODZVHsE//t321Q1tFD9fVmvV4HM
 p6eQCSNVmKs2cTF1HcnokqR9AgtUV4i9Fi1dQ6lscdaMc2u0f5nKzK1z6vdoMBUmkGbKt2ool0o
 2YlieHVQYeM9uq//239fcJkI45edVEJT01vrdmc2qt9PdDRrk+YelGMrJ8INS/AYMETAxAaY1up
 HiilKjSAH0TEcvqhjTOXY9cxKl5a+jbp5FIyq4dzbpbV+Fwgov0NYLDjC3MdrEktRJkg2KqbASN
 YVE520yC38+U7ITL+UFF+OBfAzV1TlXGz4KkIv4wzqJjPBqlFQuYpuZun3dBILu+ItqL72E26t3
 qpICxvTjXush3jVrBVnGvEFTPlp1Jv+tKOf9tH2ynuaW9GKYd5Lis+jSsKFrso/Pc+/zsQsGbKD
 JdmalAuqKHNfNTqLwhw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDEzNiBTYWx0ZWRfXzg5YEU/37/uU
 7ABMkum6Gx31YEnkWrbhzHOwqL12ryI/dEoRxMlmznrEQQU/O8g99RWYodVWtXOi6fNe75PSS+y
 OAB8TzQb0wSCO/qTGmu8deQsxyMKzWs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608270136

From: linlzhan <linlin.zhang@oss.qualcomm.com>

On platforms where ICE keyslots are partitioned across the host and
guest VMs, the host's physical keyslot range does not necessarily start
at slot 0.  blk_crypto_keyslot_index() currently returns a 0-based
array index, which is wrong for such configurations — hardware
programming requires the physical slot number, not the array position.

Add an unsigned int slot_offset field to struct blk_crypto_profile.
It defaults to zero (no change for existing drivers) and is set by
storage drivers that share ICE hardware across guests.

Update blk_crypto_keyslot_index() to add slot_offset to the array
index so that callers always receive the correct physical ICE keyslot
number to program into hardware.

Signed-off-by: linlzhan <linlin.zhang@oss.qualcomm.com>
---
 block/blk-crypto-profile.c         | 7 ++++---
 include/linux/blk-crypto-profile.h | 9 +++++++++
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/block/blk-crypto-profile.c b/block/blk-crypto-profile.c
index 53126c091b0b..64202d64a018 100644
--- a/block/blk-crypto-profile.c
+++ b/block/blk-crypto-profile.c
@@ -218,14 +218,15 @@ blk_crypto_find_and_grab_keyslot(struct blk_crypto_profile *profile,
 }
 
 /**
- * blk_crypto_keyslot_index() - Get the index of a keyslot
+ * blk_crypto_keyslot_index() - Get the physical index of a keyslot
  * @slot: a keyslot that blk_crypto_get_keyslot() returned
  *
- * Return: the 0-based index of the keyslot within the device's keyslots.
+ * Return: the physical ICE keyslot index, i.e. the 0-based position of @slot
+ * within the profile's keyslot array plus @slot->profile->slot_offset.
  */
 unsigned int blk_crypto_keyslot_index(struct blk_crypto_keyslot *slot)
 {
-	return slot - slot->profile->slots;
+	return (slot - slot->profile->slots) + slot->profile->slot_offset;
 }
 EXPORT_SYMBOL_GPL(blk_crypto_keyslot_index);
 
diff --git a/include/linux/blk-crypto-profile.h b/include/linux/blk-crypto-profile.h
index 4f39e9cd7576..a9bdc05abfa3 100644
--- a/include/linux/blk-crypto-profile.h
+++ b/include/linux/blk-crypto-profile.h
@@ -162,6 +162,15 @@ struct blk_crypto_profile {
 	 */
 	struct device *dev;
 
+	/**
+	 * @slot_offset: offset added to the slot array index to obtain the
+	 * physical ICE keyslot number.  Zero in the common case.  Set to a
+	 * non-zero value by storage drivers that share ICE hardware across
+	 * multiple guests, where the host's keyslots do not start at physical
+	 * slot 0.
+	 */
+	unsigned int slot_offset;
+
 	/* private: The following fields shouldn't be accessed by drivers. */
 
 	/* Number of keyslots, or 0 if not applicable */
-- 
2.34.1

