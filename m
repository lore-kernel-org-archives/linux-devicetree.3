Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916B22BEC45
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 00:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791247202; cv=none; b=AZeIC+PEOui1JQocoJlEjC5MFhkIS50p9mystNcT3hozeQ6cyPY6aHw+bygRIZ+zd3t8Ed87fLjBojvY6IChaW8bY5Cq8VeUW8nSOSyqPanfsMktJIM6pcG6JmKfQescQDCtLS+Jeu7fKWwb9CUBXutVeq/Yqjzp8dnsidx35IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791247202; c=relaxed/simple;
	bh=m/Jg1IBzk1GaLMkEQ8ygyVkVct/4HGDOSskLv6CeLfk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IiGIXrqJKNc4DqyrrlrJWUckShht5sy+q9+Cn1x5CjxHFIfyPLdI9xNt5DWfywvD0Eftw8Y0s+jvvbJ15c3yWT11pj0SZ0TxLywvgaZXVY7KLh1SPJ/h9U5Ql41Myr/NM9K94lRB9bUBvD4fYfi9pZFTx3m73m5YLh9iiR+8Zik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M9Dd5gz/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FeE9tsjX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M9Dd5gz/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FeE9tsjX"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695KN29G2596562
	for <devicetree@vger.kernel.org>; Tue, 6 Oct 2026 00:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dovwb3uTuq5K59dqdz0kPhDC1qlUCkJ6dzdznEz/4J4=; b=M9Dd5gz/Nnd/BJS8
	eGnnCEQo5vqfju8HJkoU1j2kCVHwJc39UFE0Q861MvD6H/2OFRKVnDv827tH/5xh
	0bDA2y6zGz9ra0EyfcEuHc9RD492AUh5ENZ2rklBjBsIE3Zlbs+dZ2JJlBRV8b+n
	DtQgcMvBUZPwu8JBIBaD4BDddBzeK9Q107tIkZEkrhYHWZttbcuw2NSkZTltfV1+
	Y9NqoTQR6IfzZV4syo5ZIx91NhhN83n97FP7lvT0iHANX0oEIMS5o15yFkDrrD4r
	W46aznv//895zEe/3Q1bJPof8e+nvtMeinXAQhmYY/p6pkaEHclyVlOlyzXCq232
	SYGWJQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4a7dtxwy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 00:39:59 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34d49d8dee1so4158093eec.0
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 17:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791247198; x=1791851998; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dovwb3uTuq5K59dqdz0kPhDC1qlUCkJ6dzdznEz/4J4=;
        b=FeE9tsjXo6oFWQupD1ESJ4WPpux+PH8yjs6LqD6C0HdqCUoyE5xnajUSEfzCY3Rodd
         xkTUEwAjqB7bcCiTGmn6paDBuF+GFgofc1crlO7+STT2iKy6lyAmxPeH4ugHRAayPc19
         FGJ7Z+qXdTVrOEmVrOsBRQsdvpBUkdPF4It7qL9FagSJrUoHUgrYK3VlRYmroXgSevUs
         kYAb6lY6pUYAEfXwtWKH40Hzur8lquNoDTpX6box/IV5Om/BGs46a/vvMLgRawpznBMb
         t7rrP4E6gFzyyw/y6zCvdRBc/7TxxUjKTIc/yRrKY03YWa9APYosHPy2rS7gzJ0ar/kj
         k2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791247198; x=1791851998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dovwb3uTuq5K59dqdz0kPhDC1qlUCkJ6dzdznEz/4J4=;
        b=RZVsJ+SXKboVbKwgV9zqm30X5x+J/+4lwiv2DRyffrt0EbHnp5wC87IL6Hut5AjrPy
         d0NfAg6biRqJSSLvJdehFzMp+d1Tus97d4iKYOF8PqPbaOmLnQu2tc8cCTZOI5pLspIo
         eR3fZtAzfR2RUcbK5giICspDHdaLrRYwR3eHKmPjT2HaGjSUx2NUV6UTP7kK4nR8p73M
         ebEOO0OUv+btTWcjXz/n3VL5QSBVbY8MubSFNmCeti3NXrAedkPdYC8WT9bHazfsRk8O
         BTQ8PvIXfJDeK3e2JX65BLjT9Nl9RDvZUN1/fZ9nxbCnk43TojRRL3NP2/r2/fGjdlQg
         w9bQ==
X-Forwarded-Encrypted: i=1; AKwUvBykESkn1vlszVo/Y9AyyavNjiWmv/5j9BTqNL2BQ/9TiNi5fPw+Ldgo8WpnBHeyAVULglRu5xwSY7Np@vger.kernel.org
X-Gm-Message-State: AFq9FYLXXAjGzY2/L2Ydxgwc4YZxfYJleZks4p0DSVkv8bEigPiaAFVj
	Evpjk7HTIDqodDIkKh1otznuGtJ2/SnUiId45w3JcdxCV1Bm4//wSBH6aqRyNbb6tm+QvTkcw5B
	3hFiSGLLfntOR+6ea3hfG2daNeAZqw9rUVDIbufg0o9eW4Y80tI3j7bKlswtt0Yo=
X-Gm-Gg: AYBFou3Sfa4p7uAVjSy/ICF+HytwfMV9mI80BxiuE1yMg0UdzGL3WxUpAKXz4uEURl/
	o8u0Cj5+VIhm1qePnM6E0KsQ28Ygxu/aAXHkZYJRKaIUIu726KWXItn/QLtU/n1DgFFVZ8bF2+Q
	2dROsh78KcGZElz6LFIg1ijuYVVASXzxEXfaicsXhmpPoVdBWvUjSLqkKhCPeHzQBkwzBhr9I29
	jN4/AkSEMzF7TqhrHofcNqo0ADVNstbPurNJG0AwgETiLqNa6vimOTwRkv5PM4fb0SRbu31JI71
	er7TT/vH1v804RUFpqZFonidMhKCMr2SugY2ruqMFs/twDFj05Wni4KOBy62r4buGEqLjBrjhnk
	GZQQIbO74qtOL2m52RiogYPecsYk3DAg9AWpjz79bxi/gi4NG+T1pAbFYfA==
X-Received: by 2002:a05:693c:8810:20b0:351:27f0:e411 with SMTP id 5a478bee46e88-35127f0e81emr6947150eec.20.1791247198230;
        Mon, 05 Oct 2026 17:39:58 -0700 (PDT)
X-Received: by 2002:a05:693c:8810:20b0:351:27f0:e411 with SMTP id 5a478bee46e88-35127f0e81emr6947118eec.20.1791247197525;
        Mon, 05 Oct 2026 17:39:57 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146ac078fsm2108874eec.22.2026.10.05.17.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 17:39:57 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:39:48 -0700
Subject: [PATCH RFC v2 4/8] tee: optee: add RPMI dynamic shared-memory pool
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-rpmi-tee-service-grp-dev-v2-4-72f222e23ec1@oss.qualcomm.com>
References: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
In-Reply-To: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
To: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAwMSBTYWx0ZWRfX1ecqcxziUGYB
 0VgUx1HbpkcyAUx7MaiZwVsbWBqpBZcvj+sSAc0KxetYwMZQahgrtk3/mAr5xkQQxUelFHR9AEI
 M+p4sW8L7PpYNiSiTLgCKTIt5Yaxcd8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAwMSBTYWx0ZWRfXyih2K64fQvjz
 9nbgYONUAJB2COMM9h9/fOJk1HR23tsg8/6OjabrRqpatxd3FSqzLcfYi7fMCQeCHkDDl4GNCU3
 Dd4PDy9XDo2hL/lc7yQ4wuGyv4pVWOMlzh88dc1xY3yMX7XIz8zT82JKdUC6ftSjNDDu9EnU+sW
 DFGIQGEiZE1HT+NSKE3VFOUgRcFpf5zABoSfEjUIrZNsn7L36r7dutUeBHPkzXcf2F3ACOqTF5M
 Vq7SojP41w4tG5chtaVpCg2wlHv+RmGyL/YzWcD0rZJTBeYlSly6weQKry3PwyiXp4sM2eMuQae
 E2YJPNq51txGgeHgUJR80m6JLOaODHALraHRyfR3WmFkWwpKPvqqmJBadsttg0+xfLgMFn+BCZY
 x+QgRtVyJ4ers7k8I6lXbVDkLM4LGOyma4Y4G2yjFCUNyJ6Nt3H9RlLsa015qgO2COENL0fVWcC
 1FHaTqSJJ5Eo50ZB8cw==
X-Proofpoint-GUID: MSbnWjWASOCJdU32orKfqAeVOPEj2S8Q
X-Authority-Analysis: v=2.4 cv=SvwFe/O0 c=1 sm=1 tr=0 ts=6ac4435f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=hYfsqUzT0y0sb8bvQO0A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: MSbnWjWASOCJdU32orKfqAeVOPEj2S8Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_05,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060001

Add a page-based dynamic shared-memory pool for the RPMI backend using
the common TEE allocation and free helpers.

Register allocated pages as RPMI parcels so OP-TEE can access them.
Unregister the parcels before freeing their backing pages.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/optee/rpmi_abi.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/tee/optee/rpmi_abi.c b/drivers/tee/optee/rpmi_abi.c
index e7fc853cfb15..c29b7ac4552a 100644
--- a/drivers/tee/optee/rpmi_abi.c
+++ b/drivers/tee/optee/rpmi_abi.c
@@ -282,6 +282,42 @@ static int optee_rpmi_shm_unregister_supp(struct tee_context *ctx,
 	return ret;
 }
 
+static int optee_rpmi_pool_alloc(struct tee_shm_pool *pool, struct tee_shm *shm,
+				 size_t size, size_t align)
+{
+	return tee_dyn_shm_alloc_helper(shm, size, align,
+					optee_rpmi_shm_register);
+}
+
+static void optee_rpmi_pool_free(struct tee_shm_pool *pool, struct tee_shm *shm)
+{
+	tee_dyn_shm_free_helper(shm, optee_rpmi_shm_unregister);
+}
+
+static void optee_rpmi_pool_destroy(struct tee_shm_pool *pool)
+{
+	kfree(pool);
+}
+
+static const struct tee_shm_pool_ops optee_rpmi_pool_ops = {
+	.alloc = optee_rpmi_pool_alloc,
+	.free = optee_rpmi_pool_free,
+	.destroy_pool = optee_rpmi_pool_destroy,
+};
+
+static struct tee_shm_pool *optee_rpmi_shm_pool_alloc(void)
+{
+	struct tee_shm_pool *pool;
+
+	pool = kzalloc_obj(*pool);
+	if (!pool)
+		return ERR_PTR(-ENOMEM);
+
+	pool->ops = &optee_rpmi_pool_ops;
+
+	return pool;
+}
+
 /* Convert a memory reference to an OP-TEE RPMI parcel reference. */
 static int to_msg_param_rpmi_mem(struct optee_msg_param *mp,
 				 const struct tee_param *p)

-- 
2.34.1

