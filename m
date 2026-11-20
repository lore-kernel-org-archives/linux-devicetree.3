Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182159;
	b=UK3Vji2Yt+xtm7XR0JGhtFLdd4kyoRWCI9NzDt23/gq/nXabz2l8V0+HOmf8g7WhL7D7
	 5xOXKQy6TZVRdzSZgu0SBwt8gQhGFERq76s6t4sPV3R2yIy1rUjXVwB35adGmwEbwXQju
	 AzddrBv8fvndJEYp72Apej2MxH6z9hYkyQt6VEEXaEr+5bZjGzyPZJ0xKJT+zgtGc19ep
	 jGBRQ8zE64Y19I4IQrx+LE5sEqVWr5Jp2//Cg/ZtluN5vGo+nGUFsoc5TQNJpCw9bUHqW
	 5YS41i1+7QLTc1Q2MqFnWJxvIGA2gVmoXBbABOkQH3/MNgQviK2Cz+Y6rHT0WFl28GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182159;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9wp0Zy1+0zpa3C+2W/5fX2hdJ67qF+07MlJVkRCmQuQ=;
	b=gqaTALRJLnqgnzzeEZ8R7GWZSSdZPbD9itVNBNFj62KrrouSv3hKerfxr97dghc45e6N
	 r7EOdvdZzxQK0YzPcgytu0fViwzxmlttkq8Z0sGrRjVHngFjDa9bKD+MKTf3qe1FYerO1
	 emHduE58GCHGZos+HSw5V9WqiHTXDFR94Gi4+YlE/hw3dbPZwb60LTaZEZBKu8NVN5JU1
	 A824EPmBuicql37ZhPX4pxEHebkTllSavkEG6bmLwDzqxkGLs1ZpVIz3hX0Mqu5gLW90R
	 Iv7aVJX4TqjVK8u1WWkAplfY3VjnccB1U+lnlNdYx1NYqbexTCBRyiDKXvzvo9PkkWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VpX+WrNS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gRTlIBMi;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835E7606A320
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 835E7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VpX+WrNS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gRTlIBMi
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkJ9r1017203
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9wp0Zy1+0zpa3C+2W/5fX2hdJ67qF+07MlJVkRCmQuQ=; b=VpX+WrNSheRNdsIh
	jnlawjXhDk5SdKChzYJiF11MgSmP1K4jnwe6FiTQcJwVBHIPDFkQ2+2XCCUFojMf
	+dAs1msm8lS0YD9C5vuHYzz2fW0cZPCr2sw8m4xE8XMJwvNfgMXP1EOoEu9rVsLH
	07UqGPHZBnOpBMMys9hOJVq9XuG4gai6Smx2WxCMSWbmrBrCpjGiSAOqAKTJGbal
	l6hpPCcqjD3SzmJKrS3GvpwvzN+eBU9F7IqjNCPezxd71tlUGEYtnRdG1KIvecPp
	qqLdhEHctnkoPTKWY32AUaH//K+IgbyrniLLOkJDKmKPfKsKXxsIHT+waQl14caf
	/6v+Gw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqst17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:42:37 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-382af5cfc58so2555483eec.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 05:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182157; x=1795786957; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9wp0Zy1+0zpa3C+2W/5fX2hdJ67qF+07MlJVkRCmQuQ=;
        b=gRTlIBMi5k9eFDNbCUFBPmJuveMJxWNnBcRT4qw7BWxynsyJOIvusLdnTPxkUiWjk7
         cITgqAY45gDm1VPzF/KE+PY/fSOXIGc0PmMyf2XnUwQaklq0BmQuxL8lfZMu2kwMQQ+T
         8PkRDmmgScmwZ2LitLqqKl/qiTwf+swLH6Y0uBCYPxbbMqi3wZTYJk6V+Ova+pX1U4oZ
         PM2BuVcIQLj/aySgm1JBwKVLq/7vSfY6ILGILYDC/ZLCsHPrAwLmEMLBQmzBvZJ2ue/u
         d3hVhdcJTu9vEQu0K0cg5XKPRtTiHnSov6gxQXFccUkAizDKqAmijLCsqGrRMxybbBYt
         b/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182157; x=1795786957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9wp0Zy1+0zpa3C+2W/5fX2hdJ67qF+07MlJVkRCmQuQ=;
        b=2mXQGk9kSIZjj83VBmTwTmtHOTubS5Tzb3dAHikwnTIvh2n51li03HiJq/xJIf2q/3
         oKIyI+t/rdcfIrU3ceL25u+FqaSGweVi7N96CWjWoYO0Vt7RANAkG7bXvuvT3PzQzb8Q
         Ayu040n9FmEd8sIoKG9ty2mdrtC/VGDYRO/4ZMmPIIK5INFfeMbcClXZK1sQ7XxuYnTB
         ARnaFk0+CdjAMEFBLhRAnZhudunXNuW9zDOqvyyHlD/VzP8rXLf2XNqpjm7bUlfty7QZ
         ePINgUir9LBQ3xZBPtXkNo7RffBe2/dxBkv6/5Mjs/fT0BADyNGbWnv2aUso25uGZQNA
         Xkyg==
X-Forwarded-Encrypted: i=1; AL+hErECegdhDaiOR1hdJD4t5x7X5BwTlegoYg1n+5mtN1lr2irgjOOm11HC9i6xihUBXfP0y7rBFVifhdjw@vger.kernel.org
X-Gm-Message-State: APuU4Z935jiG6HiKzCR68crXIw3Ed+iSR5AnTrcenx3jqIArcj3nrsLR
	Euph/WfzGG1hvIXLPOJhUlCasUZu7OHo0rAbPshUz92U1h8wS/Z8sbY1ERTQQ+opjK7B+M9Nq5e
	95CzoaCSXmsF6Rc+N+uVZFtqOvciX7eMuElOyr4qC4Pxc4Y37Rn57QrVZ10yTdJOh
X-Gm-Gg: AZFdTZdv2YsYxYXvV14HdOQRpGEhz9/EkBH/X0oRD/4wo8cKhJer2bzI2FN+pFh4ytn
	03Ens/xdM7dtThOBMmn+i0xaAHGy4bJ1NPFXxJTBTnIAjijNzRV/poA4x2pswXQiYzEG1g5lK7L
	MVFQA7mRCIMtDl09nPyWjcZq7vF2Tu+m5ECMv7gFo68hHKQOBNunqd5SuVbFrqmXKm4O4CPC5Xw
	L464x66hl0uobodpPRrKVe3tKrDP2Kzum1fo2bL9Gijc8x9GgISY+uz2HNKMVFRlCQNQmEvJEWw
	8Go5+BSKHCI8BPZ1abE3ZmnnXQZ2cdlXnfRghVR8VsQCPu616lDFAD5Pwf2y/vWecxheOY8Tw8M
	bTtV2Jlb2CNUBMnL2cFGuBvtHunWB3LMGXZVTiK9Z7j78lgzzBfiiysmUxizDTcot3BsJIk3vfw
	6wSLE=
X-Received: by 2002:a05:693c:805a:b0:376:a6d7:8f51 with SMTP id 5a478bee46e88-3856e63bbe9mr3490812eec.12.1795182156531;
        Fri, 20 Nov 2026 05:42:36 -0800 (PST)
X-Received: by 2002:a05:693c:805a:b0:376:a6d7:8f51 with SMTP id 5a478bee46e88-3856e63bbe9mr3490762eec.12.1795182155811;
        Fri, 20 Nov 2026 05:42:35 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:42:35 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:33 +0530
Subject: [PATCH RESEND v4 02/20] iommu/arm-smmu: Add interconnect bandwidth
 voting support
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261120-smmu_interconnect_addition-v4-2-be30526391d9@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Val Packett <val@packett.cool>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=10382;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=2Tn1fmNrImTIJuMoWPhujoBy9ypAmrcFqaUEL7ITQm0=;
 b=v+DWxwu5/WMk87TrV37pjjikV8G/qbn9c9CWLUPNf9rAyFFEt1qI50VI2GqHh1iK9PqlVIY9x
 /TC6dlmkXGnBU1otRLEEcXU7EQAO5Mcd9Bdv64Sq+QTg3oAWTYT/bem
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX0eFX16F/+9ps
 ikK58ilhgunNrl/Z8fwZldoaxywhsjF+Jq0Py28BVVU4is61Jt1oGW5AB3bvqfM32agGeuprTE7
 wvCUZ35/23hFrEvXEcbP2op/O2doyZW6B+bm5pK8ch2p+06e+krNd6vR/i+eZsAvrOT3UvgH/3G
 QZl6+fV/DyfkXWLDLzevWw9XOSm8p6C0kyahSdXLmVfygSUGFcHGeQ/05sZjYu4aMOW65ul6xYe
 lmKlO6oT1QIYAxfJLycAbOjmZaavOr9F2MUINEMUsdIJ3UbNqp/WAJsiI+dPIOA7m0/1KOdqkql
 pvpV1MSSSSd7Ni6QRW4GjXQS8wIiuPTJ6Wmo+TggkmsHcFLpeOc6cAwVGqs/yFEHWSWQ232Ieq/
 3JCp9rFCkbqVZo+sBq0naHqL7VuVGIwZj/uhkpKRn/N9iKgKVdFcrLFmnYj2EQs+yF+OyKmb03h
 HbjzC17kalUkD44q9Zw==
X-Proofpoint-GUID: yLp6Mw4izvtv1AxBSEHcFwFpCtH3XJ_t
X-Proofpoint-ORIG-GUID: yLp6Mw4izvtv1AxBSEHcFwFpCtH3XJ_t
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX0skz2ktHxzH7
 XVDNBzkBndshya2E1fa+KyUXHHdpapa5ArFxAyPTw7fwslbgHeWSeYa41DastC6gGP/foRkIVs3
 ZIOuUo2Tghm/kSrhfKz1832zWLoh9lQ=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b004e4d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=m-PSj7kzn0EKmAiG594A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200054

On Qualcomm SoCs using the ARM MMU-500 as the adreno SMMU, the GPU TCU
sits on GEM_NOC as an independent AXI master and requires an active
interconnect bandwidth vote for its registers to be accessible. While
other clients typically satisfy this requirement implicitly, certain
corner cases (e.g. during sleep/wakeup transitions) can leave the SMMU
without a vote, causing intermittent register access failures.

Add support for an optional interconnect path to the arm-smmu
driver and vote for bandwidth while the SMMU is active. The path
is acquired from DT if present and ignored otherwise.

The bandwidth vote is enabled before accessing SMMU registers
during probe and runtime resume, and released during runtime
suspend and on error paths.

Generally, from an architectural perspective, GEM_NOC and DDR are
expected to have an active vote whenever the adreno_smmu block is
powered on. In most common use cases, this requirement is implicitly
satisfied because other GPU-related clients (for example, the GMU
device) already hold a GEM_NOC vote when adreno_smmu is enabled.

However, there are certain corner cases, such as during sleep/wakeup
transitions, where the GEM_NOC vote can be removed before adreno_smmu
is powered down. If adreno_smmu is then accessed while the interconnect
vote is missing, it can lead to the observed failures. Because of the
precise ordering involved, this scenario is difficult to reproduce
consistently. Additionally, GDSC power state transitions in adreno use
cases can independently drop the interconnect vote, further contributing
to this race.

The design difference between QSMMU (SMMU-v2) and SMMU-500 explains
why an explicit ICC vote is needed only for the latter:

QSMMU (SMMU-v2) — SM6250 / SDM845 era: The TCU is NOT a separate
hardware master. It is integrated INSIDE the SMMU-v2 block itself.

  GPU SS
  +----------------------------------+
  |  QSMMU (SMMU-v2 @ 0x5040000)     |
  |  +----------------------------+  |
  |  |  TCU (integrated, no       |  |
  |  |  separate AXI master port) |  |
  |  +------------+---------------+  |
  |               | page table walk  |
  |               | issued on same   |
  |               | AXI port as GPU  |
  +---------------+------------------+
                  |
                  |  qxm_gpu0 / qxm_gpu1
                  |  (GPU data + TCU walks share same NOC master)
                  v
             GEM_NOC -> LLCC -> MC -> DDR

On SMMU-v2 platforms the TCU never needs an independent vote because
it physically cannot be active without the GPU data path also being
active.

SMMU-500 — SM8150+ / SA8775P / SC7280 etc.: The TCU is a SEPARATE
hardware block with its OWN AXI master.

  GPU SS
  +----------------------------------+
  |  +-------------+  +-----------+  |
  |  |  GPU Core   |  | GPU TCU   |  |  <- distinct HW block
  |  |  (rendering)|  |  + DVM    |  |
  |  +------+------+  +-----+-----+  |
  +---------+---------------+--------+
            |               |
     qnm_gpu0/1        alm_gpu_tcu    <- separate NOC master port
            |               |
            +-------+-------+
                    v
               GEM_NOC -> LLCC -> MC -> DDR

On SMMU-500 the TCU has its own master port — it can be active (e.g.
page table walks during wakeup) while the GPU data path is idle,
leaving GEM_NOC without any other voter. Hence the explicit
MASTER_GPU_TCU -> SLAVE_EBI1 vote is required.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Tested-by: Val Packett <val@packett.cool> # sm7325-motorola-dubai
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 50 ++++++++++++++++++++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h |  4 +++
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 29 +++++++++++++++--
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
 4 files changed, 82 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 795e8ec7e8fa..eee20811eede 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -6,6 +6,7 @@
 #include <linux/acpi.h>
 #include <linux/adreno-smmu-priv.h>
 #include <linux/delay.h>
+#include <linux/interconnect.h>
 #include <linux/of_device.h>
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/platform_device.h>
@@ -608,6 +609,45 @@ static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
 	return ret;
 }
 
+static int qcom_adreno_smmu_icc_init(struct arm_smmu_device *smmu)
+{
+	struct qcom_smmu *qsmmu = container_of(smmu, struct qcom_smmu, smmu);
+	int err;
+
+	qsmmu->icc_path = devm_of_icc_get(smmu->dev, NULL);
+	if (!IS_ERR(qsmmu->icc_path))
+		return 0;
+
+	err = PTR_ERR(qsmmu->icc_path);
+
+	if (err == -ENODEV) {
+		qsmmu->icc_path = NULL;
+		return 0;
+	}
+	return dev_err_probe(smmu->dev, err,
+			     "failed to get interconnect path\n");
+}
+
+static int qcom_adreno_smmu_runtime_resume(struct arm_smmu_device *smmu)
+{
+	struct qcom_smmu *qsmmu = container_of(smmu, struct qcom_smmu, smmu);
+	int ret;
+
+	ret = icc_set_bw(qsmmu->icc_path, 0, 1);
+	WARN_ON_ONCE(ret);
+	return ret;
+}
+
+static int qcom_adreno_smmu_runtime_suspend(struct arm_smmu_device *smmu)
+{
+	struct qcom_smmu *qsmmu = container_of(smmu, struct qcom_smmu, smmu);
+	int ret;
+
+	ret = icc_set_bw(qsmmu->icc_path, 0, 0);
+	WARN_ON_ONCE(ret);
+	return ret;
+}
+
 static const struct arm_smmu_impl qcom_smmu_v2_impl = {
 	.init_context = qcom_smmu_init_context,
 	.cfg_probe = qcom_smmu_cfg_probe,
@@ -659,6 +699,8 @@ static const struct arm_smmu_impl qcom_adreno_smmu_500_impl = {
 	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
 	.write_sctlr = qcom_adreno_smmu_write_sctlr,
 	.tlb_sync = qcom_smmu_tlb_sync,
+	.runtime_resume = qcom_adreno_smmu_runtime_resume,
+	.runtime_suspend = qcom_adreno_smmu_runtime_suspend,
 	.context_fault_needs_threaded_irq = true,
 };
 
@@ -668,6 +710,7 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
 	const struct device_node *np = smmu->dev->of_node;
 	const struct arm_smmu_impl *impl;
 	struct qcom_smmu *qsmmu;
+	int ret;
 
 	if (!data)
 		return ERR_PTR(-EINVAL);
@@ -692,6 +735,12 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
 	qsmmu->smmu.impl = impl;
 	qsmmu->data = data;
 
+	if (data->icc_init) {
+		ret = data->icc_init(&qsmmu->smmu);
+		if (ret)
+			return ERR_PTR(ret);
+	}
+
 	return &qsmmu->smmu;
 }
 
@@ -734,6 +783,7 @@ static const struct qcom_smmu_match_data qcom_smmu_500_impl0_data = {
 	.adreno_impl = &qcom_adreno_smmu_500_impl,
 	.cfg = &qcom_smmu_impl0_cfg,
 	.client_match = qcom_smmu_actlr_client_of_match,
+	.icc_init = qcom_adreno_smmu_icc_init,
 };
 
 /*
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
index 8addd453f5f1..12c3eda780dc 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
@@ -6,12 +6,15 @@
 #ifndef _ARM_SMMU_QCOM_H
 #define _ARM_SMMU_QCOM_H
 
+struct icc_path;
+
 struct qcom_smmu {
 	struct arm_smmu_device smmu;
 	const struct qcom_smmu_match_data *data;
 	bool bypass_quirk;
 	u8 bypass_cbndx;
 	u32 stall_enabled;
+	struct icc_path *icc_path;
 };
 
 enum qcom_smmu_impl_reg_offset {
@@ -29,6 +32,7 @@ struct qcom_smmu_match_data {
 	const struct arm_smmu_impl *impl;
 	const struct arm_smmu_impl *adreno_impl;
 	const struct of_device_id * const client_match;
+	int (*icc_init)(struct arm_smmu_device *smmu);
 };
 
 irqreturn_t qcom_smmu_context_fault(int irq, void *dev);
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 8d50a4ad221d..f015985cbb8e 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -2183,6 +2183,14 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	if (smmu->impl && smmu->impl->runtime_resume) {
+		err = smmu->impl->runtime_resume(smmu);
+		if (err) {
+			clk_bulk_disable_unprepare(smmu->num_clks, smmu->clks);
+			return err;
+		}
+	}
+
 	err = arm_smmu_device_cfg_probe(smmu);
 	if (err)
 		return err;
@@ -2263,10 +2271,13 @@ static void arm_smmu_device_shutdown(struct platform_device *pdev)
 	arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_sCR0, ARM_SMMU_sCR0_CLIENTPD);
 	arm_smmu_rpm_put(smmu);
 
-	if (pm_runtime_enabled(smmu->dev))
+	if (pm_runtime_enabled(smmu->dev)) {
 		pm_runtime_force_suspend(smmu->dev);
-	else
+	} else {
 		clk_bulk_disable(smmu->num_clks, smmu->clks);
+		if (smmu->impl && smmu->impl->runtime_suspend)
+			smmu->impl->runtime_suspend(smmu);
+	}
 
 	clk_bulk_unprepare(smmu->num_clks, smmu->clks);
 }
@@ -2286,9 +2297,18 @@ static int __maybe_unused arm_smmu_runtime_resume(struct device *dev)
 	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
 	int ret;
 
+	if (smmu->impl && smmu->impl->runtime_resume) {
+		ret = smmu->impl->runtime_resume(smmu);
+		if (ret)
+			return ret;
+	}
+
 	ret = clk_bulk_enable(smmu->num_clks, smmu->clks);
-	if (ret)
+	if (ret) {
+		if (smmu->impl && smmu->impl->runtime_suspend)
+			smmu->impl->runtime_suspend(smmu);
 		return ret;
+	}
 
 	arm_smmu_device_reset(smmu);
 
@@ -2301,6 +2321,9 @@ static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
 
 	clk_bulk_disable(smmu->num_clks, smmu->clks);
 
+	if (smmu->impl && smmu->impl->runtime_suspend)
+		return smmu->impl->runtime_suspend(smmu);
+
 	return 0;
 }
 
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index 26d2e33cd328..ed08f86cf99d 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -455,6 +455,8 @@ struct arm_smmu_impl {
 	void (*write_s2cr)(struct arm_smmu_device *smmu, int idx);
 	void (*write_sctlr)(struct arm_smmu_device *smmu, int idx, u32 reg);
 	void (*probe_finalize)(struct arm_smmu_device *smmu, struct device *dev);
+	int (*runtime_resume)(struct arm_smmu_device *smmu);
+	int (*runtime_suspend)(struct arm_smmu_device *smmu);
 };
 
 #define INVALID_SMENDX			-1

-- 
2.34.1

