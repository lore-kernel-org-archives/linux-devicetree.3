Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794538323;
	b=FZsOaPOFXMd7J3GvfadTPMXcPy7G9pcI5QlHDbz70aQcXVGtv8BleeviOa6lgkwn1rPt
	 UcQm/FWdWdTKPwb4aWss47gXrk3DlMvhmCyJ5o4qg/dUXUZogA9tO179NYD8OVYKNKnn3
	 cm/W5qzgaBjmRX0mTzoO5Jz9iQRHRaMhJaW5brZC5fgO7g8eqzdjfb3AusseoAFIXHniB
	 i2IaM8WbIEAenWUZgDfS9gMchuJy0szfZF5pDp4+cw8MdBeyX0MorzXzjd2TSL6iA2TKw
	 Sdy32fjVePdo0c1xGRKlMYHZxelU5QNvbKhgN0PKcuAABoH7pWgCMwxfHXyS6pwQ7Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538323;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=x5yFA/n9nxvGq4ratTpKdOBKG2qkQ4F41mr8UZUAiJ8=;
	b=ilF30dCFKMWbDne6JxKExw2HyIwUe5s3IVxlOLuIn3dg2gLDHcKYysGqedLnZGk5r94J
	 YbUxzNsMeFUKNrqBHOAe38hHqXDqsaZQx/deulzg3gTA4n0DnwT9zxvdw2UaXzS4UDsWt
	 fA1bNc/RMHmMboEMR2AbP/4QaVEn8eMcChQqY17PeBe0hMWqXiAEDKTbCg3y50dxym4VG
	 biYoHOhzHDSlrKc6nmojOiuSiaO004ULSrekahsYXiFHJV2SPT/AksLGgNCdmBgcXjMaj
	 UFVYikbYNTof7gIVCCkNtpwGAgKnxe0TN2AkykQ4R6wfror+NrSN1/6v/L3+/KbRnVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vpp+Hz02;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HEYT+nQD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D816606A8AE
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 02:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D816606A8AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vpp+Hz02;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HEYT+nQD
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2KCjk4120462
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 02:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=x5yFA/n9nxv
	Gq4ratTpKdOBKG2qkQ4F41mr8UZUAiJ8=; b=Vpp+Hz02BVWXrRiiEbQnuboyziD
	ZbkneievJBqeDJgMqu5EI4OFJ4zP14AMNOP5wxl6qW2GmCNbEuav8Q76TywHunH5
	D+latF0oPT5M+S89PNtLQlPgDSAI5U6Kiz453JIVCSaHc/RQrVY9pFQfxW3Zhv+3
	5DhiOquiTN0HU6Y6JMksegrh+LnKtpXL0+b1Vci8AJZaSWdUsXDM4Z1UMhnerl4a
	6rJRLevnZrSg9UhOTzzCk+jBamvb/7EdsSVTVO2fQ0me4hFqIeJtBLd6htksPNGj
	+7QQ7yakt4mt5wEjCE2myu4DWlAxtA6spbOnnG/UPEyEto9PJy3LLGGHcug==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx334n4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 02:52:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2edd25534afso4130055ad.2
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 18:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794538322; x=1795143122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x5yFA/n9nxvGq4ratTpKdOBKG2qkQ4F41mr8UZUAiJ8=;
        b=HEYT+nQD2EzC86Pa5pVS9iFRD6YAOv4oTrM4o9Q0TS4munC4UlRwl12HWNto4SR4oV
         mFWNt6uvIQOeV/R9conTnpU7LIPRHufQ+gykzi3pKzXcjKJ5dPx7HReHUDLyhg3x4Ycd
         hL5S0ON+VLlS7aYXao+JX15CCpBcwyzaMnieC+iXSOxY8GJhM3mP45SDQbf2cQNQ2zrE
         cHxh/aRoToQckgF469V1BmIag9xkxiZGJamHiXTXsX1SD7uWOJvRmbr+xUCWiIjApXUh
         tAkpjcDlQdY/FWvmNALCIjwOkeLJez8gbANcky73i6CweiFE1l4Ix5tXv/As54+hJKok
         dILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794538322; x=1795143122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x5yFA/n9nxvGq4ratTpKdOBKG2qkQ4F41mr8UZUAiJ8=;
        b=BrLCzyO/jy/vmuhr6bEBporcD49oh5CJ2nX4i9+AoAXMRQFhyBrxl/bInvPiuo3cBq
         6rj/aPvoTkWmJ5g14XZbIRCBmlJOTKxnqFYWPrSMMiqL06pxLMpBTFdGMkbFVyYa9l3b
         qzGXfdiDKXrPGBJOvClX9Sq+CXESjIQclI88DUgJI2OCRUt9tRHF1lzdp2GTRH0R87ET
         MDd9PlUkLv730AGHZz1PTryJJCozw0BmEAg0qKmAdMG1QH6/HofBFHALMf3V1tuvfkoa
         zZDgDY6DChLaQH0p4ROtdg/5AG2oTBGSj8wNn0OGMDxqFvksVO0V8p52Ju7K/ySu6WSK
         rm7Q==
X-Forwarded-Encrypted: i=1; AL+hErEFCex+CiH0L9uycETJJo3LmccQ7n5hxbChnUZAgLoYF1v7+y8/dqDYH7ZX061XlgM8gDzjgq/v1dNW@vger.kernel.org
X-Gm-Message-State: APuU4Z+e7rz/QGawY0oAYG9Oq2JK70gwKb+U31XtpNCnJ3DsjHkk3Pjn
	8F4Emz378a8Owto7vgs3bxpD5h+OQOzSAoYoBkUnYUea/4KUnHvnc3U8OwwJABFwqjsPpCu81wp
	J3rXyHfFeCo6UpZe9eLJr7N64lpJIeRb13wBlYvsdfiixBFqCU2xv3poKzmPvf/fs
X-Gm-Gg: AYBFou2Byt/X/DLMpLrorkjTW9/fVGdVdGTisqKl4PxhjyQq1dSc2zJ4zZ7oIgEMrLH
	FVMtJnoTCbKPFadWRnV08VVebdCGD7NvS9WRO1j02pF0bNHXESeLxLpUqLDpKWhD1B9whKbesn4
	VEt0IMlnucXd39Dvg9o6HZr1qAMhhA4kXBlEod3eUl6bzlnFPJzwTtNMvqmmuP6Y3UteO+WvosD
	8LHPL6IQBhCnQXcB98Zs60BTufOvMqyCoASE5Ecy3zbdxptjLQpg3TB9Zd/ftypkTsO0lJ+40GG
	w4Txv/AvrRQqXKzRcHH5qqz5g6sbS/lddJFPEbXa38fr8AjjyNO5brodgLwT8uXZsqvlvrh5ALc
	KB9icxWApO+CM0loQfpMRTntBC1Oi76jdxwuxpHldEnzYexguUE2ibhz4eTqXYxgbHLOskyfpMi
	7xn/vJfaA=
X-Received: by 2002:a17:902:fc47:b0:2ed:3eeb:b0db with SMTP id d9443c01a7336-2ee0de10ab1mr11325695ad.17.1794538321710;
        Thu, 12 Nov 2026 18:52:01 -0800 (PST)
X-Received: by 2002:a17:902:fc47:b0:2ed:3eeb:b0db with SMTP id d9443c01a7336-2ee0de10ab1mr11325425ad.17.1794538321253;
        Thu, 12 Nov 2026 18:52:01 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0fa0b3c6sm3044435ad.68.2026.11.12.18.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:52:00 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, songchai@qti.qualcomm.com
Subject: [PATCH v17 08/10] coresight: Add CORESIGHT_DEVID2 to linux/coresight.h
Date: Fri, 13 Nov 2026 10:49:33 +0800
Message-Id: <20261113024935.3173715-9-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af67b52 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=wQ8sKV_PtrUBvD2kYdcA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX1HVFvDEJQna+
 +yeIjnY08TmoCoDIvZcYQRqouONjRUwIsnf9Mdsdq0PI+jeVAS7NihYz4pu692Bt5GAIJZjflEk
 XpuppEXs4lWkFTvKQKyqYzIr0VYtt5jjVpJ0d9FyF4CXyMqLxou0gWmGLfkTdJSCig3htTOskjg
 KxyV9b3hGc97bEAnKP0bxExcvhRWDNSZYZCNbyzF9MyW3o2nfyITB95p/82PntJZtjSUnblnGpS
 Pbp91stMnoUslNuTHaVlmhZTwa2VMrXJoqiQg8p8XAVOsWUPdk2j0H3A7UaK2ygIVHoY+B0zayz
 dxaxJRDyJFXSAtdUy7V4cGWDiQCWadpOLKBQ5twq6WhfxydqqFcdzDaAnZvCpjhvJ+wLdckSgfJ
 omZAprPo7pFXf1S7pElqf3+KfKNNmr3B2+7nW7NnSnnb0brhybmsqtuwzb7pYqnHFI9IBGL9Osh
 3F4/tKjO3L1tBX9xbkQ==
X-Proofpoint-ORIG-GUID: mNwQkz4c6u50hpKQDOu4iI_-XzjaD2B1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX9f0AFCqqkpAL
 eHo2quWv3LK1IZqAjtn4Asqrhik42+1z0LF4oF/k74VRuGpKLndrsvXPf6EYdLu5f6jpDiY4uPA
 gZ5L0IvyFqBFqQ+LuP1YVOHyE7OVH5s=
X-Proofpoint-GUID: mNwQkz4c6u50hpKQDOu4iI_-XzjaD2B1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130010

CORESIGHT_DEVID2 lives at a fixed, architecturally-defined offset
(0xfc0) within the generic CoreSight management register block,
immediately preceding CORESIGHT_DEVID (0xfc8). Components outside
drivers/hwtracing/coresight/ that follow the same register convention
(e.g. the Qualcomm TGU, which uses it to detect its timer/counter
capabilities) need to read it too.

Add it to the public include/linux/coresight.h so it can be shared
outside of drivers/hwtracing/coresight/, matching CORESIGHT_LAR and
CORESIGHT_DEVID already moved there.

Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 include/linux/coresight.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 5286b3606581..7ce0366c7c70 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -37,6 +37,7 @@
 #define CORESIGHT_UNLOCK	0xc5acce55
 #define CORESIGHT_LAR		0xfb0
 #define CORESIGHT_DEVID		0xfc8
+#define CORESIGHT_DEVID2	0xfc0
 
 static inline void CS_LOCK(void __iomem *addr)
 {
-- 
2.34.1

