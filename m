Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D46377AB3
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 03:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791430127; cv=none; b=fpQg40jXt0ep2hsl5LT2AL5dZX3Qee20rLKp6+Rr7M6Mpp237mgYrgZamhfLd/5sQWCHlKbRDrOC2mi6ECtBQajWQWpwnohqovKcDqLfs8L2yZoTonwZhdA5M3ZKjdc/s6IL0VdgcJwCqO0Fz60729PH459jAKG1t+ukHQgyOjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791430127; c=relaxed/simple;
	bh=N/GoXXPvoD19zUb9BSvoUOZ49eNN/9Uv+mNF62wn3GA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SWa0ad83gYsjXfvVYWEjtEmIan+9x7I1rmGuQh68ihtdpWv129fLqsDpaX31at+a3WS7UKM5iYTCWV8Tha8XaJuBuG+I2BgLuUnn9dRWaqWPhu/AYZ/mLUb5IzPE9XIfdUENPtAXaXvJnKz+VZRdskYrhVkFwoV+DjC4wsX9ptY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LmBibQsm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KHIPtJad; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LmBibQsm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KHIPtJad"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6981heEO4186787
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 03:28:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4WXFbSFSr1/RQ2vXdoBOENE9gIt1QGKOfRFfzDrKe+A=; b=LmBibQsmJgrWvl9H
	EAX7LSU6LzffQW5TbuTzVl6YhecF6VnzDqivCZnOdzvSdd8nxdFV70PJ7evULILu
	DH1a17ViZaW+VDl4NmO26j3aWRMiDq1xD8HDEwnrWjz20wfY02fVv7nHhh4pNipH
	fSMtE912PlknDJrTwNreZpkQl7byBxuGBDiyaQrxZFmv3R8Qi6JpKP+toJTTrhNF
	+PiylbhDH6+CuDtfbEYkLMAw6CiuAUVks9vSkY4+S9Zq1X/KKZ3Nl4nOINcUgmfW
	9M+TVk4vA3rJpg7HrUUF3Qu8wQeWom5OhIilw4rei9PYUMxhxJ7Tian9DS8OqbQO
	c7oyIQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe30un8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 03:28:44 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35156644c96so1993271eec.1
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 20:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791430124; x=1792034924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4WXFbSFSr1/RQ2vXdoBOENE9gIt1QGKOfRFfzDrKe+A=;
        b=KHIPtJadkf3DqXa4u/VJym4/+59Wagp0ULLk8JuTxPIZIklYuL/dec41V8p2Z83IQn
         eGKDGyM0xe/GWeDXVnPIQW+bBuO0WE+KyNehsuz8GInQa+Gv0YBXzDWwvgsqPeQpB8fL
         OYKNZKUlVd/0tf9kLBSLJKMau4QGOc72xB2hOdl6/QX0Y1LWakaDZdRjcNC7g3CoSs7P
         26hp/QScF1XdqBj3YtcuzJ47xdTPaQHrPSBwd+uHbzaVp9qVIUf70OKlfZ9fN+lALefC
         t5BoXTzP6EiRdPfZtrsaTuP+vSU7rTt6jqujalbyK3Z7pt2/ujarm4LuIeJJ0uJQvGVy
         qQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791430124; x=1792034924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4WXFbSFSr1/RQ2vXdoBOENE9gIt1QGKOfRFfzDrKe+A=;
        b=jZJdtlZh74iqrBvCqemKZkzdz7t4MeoXO0IoqkXCnMk2YVfEOLVg1aKwkso2ITQv9b
         7tBtZn6OAsP+h+1ixhys4huRizWNFGREAKj76b/675hYPBvOjkmB0LJt06C/qkbxGMvy
         /StS2L6F6oEeE5i3jeAI8oiVK4SA1mLPda/lcL8VjeEQY0m9YP4OayfpgzugqajF4+vW
         8bFhAQrg+9ADDDHvFVtggG5PQUbD/6ABJsz5FrScZiHv/PkFWAtHAuV3hK8S3a2cGbjo
         1zlNa50gZtx1n0lGe5Z2MTNZrkrflAk0gxeC7b6sGXGTh4dkbGQojxUaS7Vq8MeuhgHD
         yR4A==
X-Forwarded-Encrypted: i=1; AKwUvBy2xZczWz5jRxfapsB2uiXAcbPU2hdTjmLGzsqO7gPKrUFKz80R+w8GT6bnsaTUex3KpoO2sy1aJ6d/@vger.kernel.org
X-Gm-Message-State: AFuF++mvC7oF9vOI52N39prKFQLp9by+8qkE7Ts/1335DsuFmWUbE7Tg
	wNFtdQssTybyGirlfgHIIyyBpN812FucIpwkK7uQFsTBzbMCnx0qz9jZb/Aj+at27WaKPMU97A7
	FbM6C0IlMreTiv4oxHkMWVrQPkFPgQ4rdLKMsVLMPm63Bvy8ci6wdBDe99BL68Do=
X-Gm-Gg: AYBFou3RDUzRJdVkQcP9JeT6zw9Lj80ocaRYGiFo7w5Mrp++GORKYIjpekIXil2C24E
	avBbFM7BtZMb3lOKim70lGAHTCoU1tqE0o3wVPElSz9W1slJ7XbfEFqsgN+34IuGOfIlXu4aT/y
	zdh6o8E8QCyTUVfT5bVeeus55pajRUNxDC/JePCTNa38LwRlpiZb22BxTgk0WzV0lgtm4jy0Qei
	pgjnjVzb6JT8Njp8R5Pdf5J1YVzoXGnD/spl10pGfaNjVVklLRQknEtPuX5copdFqOIkOfQNRvE
	jWDPXz+SYacYHjKFiBtl37d83ZW+ABNC2HOxdQeysCXDONB+O04yCKKn4mzaxl7JYqSxd1qYKRu
	FTqX+lfSMwcj+R97ZmKnxO+iw8ojCsleciQ0/4rr2eBUErzxxQ2iN9sFsZA==
X-Received: by 2002:a05:7300:ff4c:b0:348:201a:6c88 with SMTP id 5a478bee46e88-351777524c7mr1305563eec.13.1791430123813;
        Wed, 07 Oct 2026 20:28:43 -0700 (PDT)
X-Received: by 2002:a05:7300:ff4c:b0:348:201a:6c88 with SMTP id 5a478bee46e88-351777524c7mr1305518eec.13.1791430123105;
        Wed, 07 Oct 2026 20:28:43 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35179d07566sm2168349eec.30.2026.10.07.20.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 20:28:42 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 20:27:08 -0700
Subject: [PATCH RFC v2 02/10] mailbox: mpxy: add direct synchronous send
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-riscv-rpmi-tee-abi-v2-2-45939a13d223@oss.qualcomm.com>
References: <20261007-riscv-rpmi-tee-abi-v2-0-45939a13d223@oss.qualcomm.com>
In-Reply-To: <20261007-riscv-rpmi-tee-abi-v2-0-45939a13d223@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Rahul Pathak <rahul@summations.net>,
        Anup Patel <anup@brainfault.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amirreza Zarrabi <amrzar@gmail.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, op-tee@lists.trustedfirmware.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAxMyBTYWx0ZWRfX0yilJHmhG/k0
 wKw0T9mtox25XL+WHXZFUCl4K8Hzfk0WQ0ztyDaZHQY/Eq8+BzKVrM62K8dhq/gM0l0ax7uLAGF
 kbWkaKNyWW7WOuKNnfJA4xRPPL5hPH+SLu2NKrn5EDS9PHeYuxuUljVmnfzZ0pD2+M04f8BEHyX
 M5rfgGip8zvCVgudwn7Yu0vkT6GlOgfPGzbeYzwNG7m+0jn9lWT1xOUlY8VsUcsofnFwG7U0FKL
 +O74igu1NDsikjiWbHmmO8orndJ8J1kefq9VcD5Sc3xb8cmPe2mgcxF4ejVbSJ1VY05rHN2mz1g
 BW/Vy2LjzwHVNi1WnP4hvjdegWmksC/jpWabk6HON+Af0r6zjO+pjPBiNmen5T/23zkdfmR9Da0
 d3COBtaXv4xpVkerpYZkVsgmqABOLlu9ulZXJc3nmBYoU6kAc93fZ+ZM103FJTdmOIpd4HZIDKC
 JDb3/kYx+sm79GhZ7PQ==
X-Proofpoint-ORIG-GUID: drYQFgB3eWpqTZVSf1eTyfICEHR0Lety
X-Proofpoint-GUID: drYQFgB3eWpqTZVSf1eTyfICEHR0Lety
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAxMyBTYWx0ZWRfXxUYCesJ0qOhA
 IpUEdFxhNbFvtTcpHmHSeftAG5+QFb/3RBXJKiWIu694yXX0vZt0wrQMnx99qSGR2/yrQdiOera
 mxuQPn+D52VyvKDX6cc/kShP1F8dav8=
X-Authority-Analysis: v=2.4 cv=KcdHIgYD c=1 sm=1 tr=0 ts=6ac70dec cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Tu2Rjsi-ZZ_FYV3k_IYA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_01,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080013

Implement send_data_sync() for RPMI MPXY channels, reusing the
existing RPMI message dispatch and returning its status directly
instead of going through mbox_chan_txdone().

Factor per-hart shared-memory acquisition into mpxy_shmem_get()/
mpxy_shmem_put() so both the queued and the new synchronous path pin
the CPU around the same per-hart buffer, keeping a request and its
response on one hart. Calls on separate harts remain independent,
subject to firmware support.

Add rpmi_mbox_send_message_sync() as the RPMI counterpart to
rpmi_mbox_send_message(), for use by the upcoming TEE transport.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/mailbox/riscv-sbi-mpxy-mbox.c      | 196 ++++++++++++++++++-----------
 include/linux/mailbox/riscv-rpmi-message.h |  13 ++
 2 files changed, 139 insertions(+), 70 deletions(-)

diff --git a/drivers/mailbox/riscv-sbi-mpxy-mbox.c b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
index ea69c6b6b4f9..5ca1b6d87f5c 100644
--- a/drivers/mailbox/riscv-sbi-mpxy-mbox.c
+++ b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
@@ -125,54 +125,83 @@ static DEFINE_PER_CPU(struct mpxy_local, mpxy_local);
 static unsigned long mpxy_shmem_size;
 static bool mpxy_shmem_init_done;
 
+static int mpxy_shmem_get(struct mpxy_local **out)
+{
+	struct mpxy_local *mpxy;
+
+	get_cpu();
+	mpxy = this_cpu_ptr(&mpxy_local);
+	if (!mpxy->shmem_active) {
+		put_cpu();
+		return -ENODEV;
+	}
+
+	*out = mpxy;
+	return 0;
+}
+
+static void mpxy_shmem_put(void)
+{
+	put_cpu();
+}
+
 static int mpxy_get_channel_count(u32 *channel_count)
 {
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
-	struct sbi_mpxy_channel_ids_data *sdata = mpxy->shmem;
+	struct mpxy_local *mpxy;
+	struct sbi_mpxy_channel_ids_data *sdata;
 	u32 remaining, returned;
 	struct sbiret sret;
+	int rc;
 
-	if (!mpxy->shmem_active)
-		return -ENODEV;
 	if (!channel_count)
 		return -EINVAL;
 
-	get_cpu();
+	rc = mpxy_shmem_get(&mpxy);
+	if (rc)
+		return rc;
+	sdata = mpxy->shmem;
 
 	/* Get the remaining and returned fields to calculate total */
 	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_GET_CHANNEL_IDS,
 			 0, 0, 0, 0, 0, 0);
-	if (sret.error)
-		goto err_put_cpu;
+	if (sret.error) {
+		rc = sbi_err_map_linux_errno(sret.error);
+		goto out;
+	}
 
 	remaining = le32_to_cpu(sdata->remaining);
 	returned = le32_to_cpu(sdata->returned);
 	*channel_count = remaining + returned;
+	rc = 0;
 
-err_put_cpu:
-	put_cpu();
-	return sbi_err_map_linux_errno(sret.error);
+out:
+	mpxy_shmem_put();
+	return rc;
 }
 
 static int mpxy_get_channel_ids(u32 channel_count, u32 *channel_ids)
 {
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
-	struct sbi_mpxy_channel_ids_data *sdata = mpxy->shmem;
+	struct mpxy_local *mpxy;
+	struct sbi_mpxy_channel_ids_data *sdata;
 	u32 remaining, returned, count, start_index = 0;
 	struct sbiret sret;
+	int rc;
 
-	if (!mpxy->shmem_active)
-		return -ENODEV;
 	if (!channel_count || !channel_ids)
 		return -EINVAL;
 
-	get_cpu();
+	rc = mpxy_shmem_get(&mpxy);
+	if (rc)
+		return rc;
+	sdata = mpxy->shmem;
 
 	do {
 		sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_GET_CHANNEL_IDS,
 				 start_index, 0, 0, 0, 0, 0);
-		if (sret.error)
-			goto err_put_cpu;
+		if (sret.error) {
+			rc = sbi_err_map_linux_errno(sret.error);
+			goto out;
+		}
 
 		remaining = le32_to_cpu(sdata->remaining);
 		returned = le32_to_cpu(sdata->returned);
@@ -182,55 +211,61 @@ static int mpxy_get_channel_ids(u32 channel_count, u32 *channel_ids)
 		memcpy_from_le32(&channel_ids[start_index], sdata->channel_array, count);
 		start_index += count;
 	} while (remaining && start_index < channel_count);
+	rc = 0;
 
-err_put_cpu:
-	put_cpu();
-	return sbi_err_map_linux_errno(sret.error);
+out:
+	mpxy_shmem_put();
+	return rc;
 }
 
 static int mpxy_read_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
 			   u32 *attrs_buf)
 {
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
+	struct mpxy_local *mpxy;
 	struct sbiret sret;
+	int rc;
 
-	if (!mpxy->shmem_active)
-		return -ENODEV;
 	if (!attr_count || !attrs_buf)
 		return -EINVAL;
 
-	get_cpu();
+	rc = mpxy_shmem_get(&mpxy);
+	if (rc)
+		return rc;
 
 	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_READ_ATTRS,
 			 channel_id, base_attrid, attr_count, 0, 0, 0);
-	if (sret.error)
-		goto err_put_cpu;
+	if (sret.error) {
+		rc = sbi_err_map_linux_errno(sret.error);
+		goto out;
+	}
 
 	memcpy_from_le32(attrs_buf, (__le32 *)mpxy->shmem, attr_count);
+	rc = 0;
 
-err_put_cpu:
-	put_cpu();
-	return sbi_err_map_linux_errno(sret.error);
+out:
+	mpxy_shmem_put();
+	return rc;
 }
 
 static int mpxy_write_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
 			    u32 *attrs_buf)
 {
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
+	struct mpxy_local *mpxy;
 	struct sbiret sret;
+	int rc;
 
-	if (!mpxy->shmem_active)
-		return -ENODEV;
 	if (!attr_count || !attrs_buf)
 		return -EINVAL;
 
-	get_cpu();
+	rc = mpxy_shmem_get(&mpxy);
+	if (rc)
+		return rc;
 
 	memcpy_to_le32((__le32 *)mpxy->shmem, attrs_buf, attr_count);
 	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_WRITE_ATTRS,
 			 channel_id, base_attrid, attr_count, 0, 0, 0);
 
-	put_cpu();
+	mpxy_shmem_put();
 	return sbi_err_map_linux_errno(sret.error);
 }
 
@@ -239,16 +274,17 @@ static int mpxy_send_message_with_resp(u32 channel_id, u32 msg_id,
 				       void *rx, unsigned long max_rx_len,
 				       unsigned long *rx_len)
 {
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
+	struct mpxy_local *mpxy;
 	unsigned long rx_bytes;
 	struct sbiret sret;
+	int rc;
 
-	if (!mpxy->shmem_active)
-		return -ENODEV;
 	if (!tx && tx_len)
 		return -EINVAL;
 
-	get_cpu();
+	rc = mpxy_shmem_get(&mpxy);
+	if (rc)
+		return rc;
 
 	/* Message protocols allowed to have no data in messages */
 	if (tx_len)
@@ -259,8 +295,8 @@ static int mpxy_send_message_with_resp(u32 channel_id, u32 msg_id,
 	if (rx && !sret.error) {
 		rx_bytes = sret.value;
 		if (rx_bytes > max_rx_len) {
-			put_cpu();
-			return -ENOSPC;
+			rc = -ENOSPC;
+			goto out;
 		}
 
 		memcpy(rx, mpxy->shmem, rx_bytes);
@@ -268,22 +304,25 @@ static int mpxy_send_message_with_resp(u32 channel_id, u32 msg_id,
 			*rx_len = rx_bytes;
 	}
 
-	put_cpu();
-	return sbi_err_map_linux_errno(sret.error);
+	rc = sbi_err_map_linux_errno(sret.error);
+out:
+	mpxy_shmem_put();
+	return rc;
 }
 
 static int mpxy_send_message_without_resp(u32 channel_id, u32 msg_id,
 					  void *tx, unsigned long tx_len)
 {
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
+	struct mpxy_local *mpxy;
 	struct sbiret sret;
+	int rc;
 
-	if (!mpxy->shmem_active)
-		return -ENODEV;
 	if (!tx && tx_len)
 		return -EINVAL;
 
-	get_cpu();
+	rc = mpxy_shmem_get(&mpxy);
+	if (rc)
+		return rc;
 
 	/* Message protocols allowed to have no data in messages */
 	if (tx_len)
@@ -292,40 +331,45 @@ static int mpxy_send_message_without_resp(u32 channel_id, u32 msg_id,
 	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_SEND_MSG_WITHOUT_RESP,
 			 channel_id, msg_id, tx_len, 0, 0, 0);
 
-	put_cpu();
-	return sbi_err_map_linux_errno(sret.error);
+	rc = sbi_err_map_linux_errno(sret.error);
+	mpxy_shmem_put();
+	return rc;
 }
 
 static int mpxy_get_notifications(u32 channel_id,
 				  struct sbi_mpxy_notification_data *notif_data,
 				  unsigned long *events_data_len)
 {
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
+	struct mpxy_local *mpxy;
 	struct sbiret sret;
+	int rc;
 
-	if (!mpxy->shmem_active)
-		return -ENODEV;
 	if (!notif_data || !events_data_len)
 		return -EINVAL;
 
-	get_cpu();
+	rc = mpxy_shmem_get(&mpxy);
+	if (rc)
+		return rc;
 
 	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_GET_NOTIFICATION_EVENTS,
 			 channel_id, 0, 0, 0, 0, 0);
-	if (sret.error)
-		goto err_put_cpu;
+	if (sret.error) {
+		rc = sbi_err_map_linux_errno(sret.error);
+		goto out;
+	}
 	if (sret.value < 0 || mpxy_shmem_size < sizeof(*notif_data) ||
 	    sret.value > mpxy_shmem_size - sizeof(*notif_data)) {
-		put_cpu();
-		return -EOVERFLOW;
+		rc = -EOVERFLOW;
+		goto out;
 	}
 
 	memcpy(notif_data, mpxy->shmem, sret.value + sizeof(*notif_data));
 	*events_data_len = sret.value;
 
-err_put_cpu:
-	put_cpu();
-	return sbi_err_map_linux_errno(sret.error);
+	rc = sbi_err_map_linux_errno(sret.error);
+out:
+	mpxy_shmem_put();
+	return rc;
 }
 
 static int mpxy_get_shmem_size(unsigned long *shmem_size)
@@ -402,8 +446,8 @@ struct mpxy_mbox {
 
 /* ====== MPXY RPMI processing ====== */
 
-static void mpxy_mbox_send_rpmi_data(struct mpxy_mbox_channel *mchan,
-				     struct rpmi_mbox_message *msg)
+static int mpxy_mbox_send_rpmi_data(struct mpxy_mbox_channel *mchan,
+				    struct rpmi_mbox_message *msg)
 {
 	msg->error = 0;
 	switch (msg->type) {
@@ -474,6 +518,8 @@ static void mpxy_mbox_send_rpmi_data(struct mpxy_mbox_channel *mchan,
 		msg->error = -EOPNOTSUPP;
 		break;
 	}
+
+	return msg->error;
 }
 
 static void mpxy_mbox_peek_rpmi_data(struct mbox_chan *chan,
@@ -516,12 +562,21 @@ static int mpxy_mbox_send_data(struct mbox_chan *chan, void *data)
 {
 	struct mpxy_mbox_channel *mchan = chan->con_priv;
 
-	if (mchan->attrs.msg_proto_id == SBI_MPXY_MSGPROTO_RPMI_ID) {
-		mpxy_mbox_send_rpmi_data(mchan, data);
-		return 0;
-	}
+	if (mchan->attrs.msg_proto_id != SBI_MPXY_MSGPROTO_RPMI_ID)
+		return -EOPNOTSUPP;
+
+	mpxy_mbox_send_rpmi_data(mchan, data);
+	return 0;
+}
+
+static int mpxy_mbox_send_data_sync(struct mbox_chan *chan, void *data)
+{
+	struct mpxy_mbox_channel *mchan = chan->con_priv;
+
+	if (mchan->attrs.msg_proto_id != SBI_MPXY_MSGPROTO_RPMI_ID)
+		return -EOPNOTSUPP;
 
-	return -EOPNOTSUPP;
+	return mpxy_mbox_send_rpmi_data(mchan, data);
 }
 
 static bool mpxy_mbox_peek_data(struct mbox_chan *chan)
@@ -713,10 +768,11 @@ static void mpxy_mbox_shutdown(struct mbox_chan *chan)
 }
 
 static const struct mbox_chan_ops mpxy_mbox_ops = {
-	.send_data = mpxy_mbox_send_data,
-	.peek_data = mpxy_mbox_peek_data,
-	.startup = mpxy_mbox_startup,
-	.shutdown = mpxy_mbox_shutdown,
+	.send_data	= mpxy_mbox_send_data,
+	.send_data_sync	= mpxy_mbox_send_data_sync,
+	.peek_data	= mpxy_mbox_peek_data,
+	.startup	= mpxy_mbox_startup,
+	.shutdown	= mpxy_mbox_shutdown,
 };
 
 /* ====== MPXY platform driver ===== */
diff --git a/include/linux/mailbox/riscv-rpmi-message.h b/include/linux/mailbox/riscv-rpmi-message.h
index d5362b5821f9..16fa85f65d80 100644
--- a/include/linux/mailbox/riscv-rpmi-message.h
+++ b/include/linux/mailbox/riscv-rpmi-message.h
@@ -251,4 +251,17 @@ static inline int rpmi_mbox_send_message(struct mbox_chan *chan,
 	return ret;
 }
 
+static inline int rpmi_mbox_send_message_sync(struct mbox_chan *chan,
+					      struct rpmi_mbox_message *msg)
+{
+	int ret;
+
+	/* Send message for the underlying mailbox channel synchronously */
+	ret = mbox_send_message_sync(chan, msg);
+	if (ret)
+		return ret;
+
+	return msg->error;
+}
+
 #endif /* _LINUX_RISCV_RPMI_MESSAGE_H_ */

-- 
2.34.1

